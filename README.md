# 基于 AMD FPGA 的双阵列无人机声学检测与三维定位系统

**2026 AMD 自主选题赛道 · 初级组**

自建双八通道 Vesper VM1000 阵列与双 AD7606 同步采样，使用 AMD Artix-7 XC7A200T-FBG484-2（野火升腾 Pro）实现声纹检测、三维定位与 LCD 显示。定位搜索域为水平半径 11 m、高度 10 m，两阵列中心基线 2 m，定位输入每通道 48 kHz。

## 仓库内容

```text
├── README.md
├── license.txt
├── src/       RTL、HLS 源码、XDC、ROM、HLS 导出核
├── sim/       RTL 回归、搜索域 C 仿真、冻结结果检查、Skill 测试
├── build/     构建入口、实现报告、文件清单与复现记录
├── board/     上板入口、位流、接线与实物照片
├── data/      原始录音、360 点实测定位数据与冻结离线评估结果
├── skill/     三项可复用 Skill
└── report/    设计报告、大模型协作记录及结构化记录
```

目录按指南 3.3.5.4 组织，`build/`、`sim/`、`board/` 提供统一入口。MIT 许可见 [license.txt](license.txt)，第三方说明见 [board/third_party_notices.md](board/third_party_notices.md)。

- [设计报告](report/design_report.docx)：系统原理、实现及实验讨论。
- [协作记录](report/llm_collaboration.md)：正式化需求、协作与纠错过程；可追溯条目附原始提示词和模型答复节选。
- [板级确认](board/validation_record.json)：团队对参考位流的采集、定位与显示功能确认。
- [360 点实测定位数据](data/measured_localization/localization_360_points.pdf)：12 页逐点参考坐标、阵列输出与误差，配套 [JSON 数据](data/measured_localization/localization_360_points.json) 可供复核。
- [技能包](skill/README.md)：实现报告检查、流式 FPGA 调试、PYNQ 契约与数值验证。

## 环境与配置

已验证工具环境为 Windows、Vivado 2024.2（Build 5239630）、Vitis 2024.2 的 HLS 工具，以及 Artix-7 器件库。Python 使用 3.11 或更新版本，依赖为 NumPy、SciPy、Pillow。设计报告说明了采用 2024.2 的复现方法。

建议将仓库放到短英文路径。在仓库根目录的 PowerShell 中执行下列配置，用实际安装路径替换示例：

通过 Git 克隆时需安装 Git LFS，并在仓库根目录先运行 `git lfs install`、`git lfs pull`，取得 `data/recordings.zip` 的完整内容。录音包约 167 MB，已由 `.gitattributes` 配置为 LFS 文件；本地完整文件夹直接使用即可。GitHub 的大文件规则见[官方说明](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github)。`.gitattributes` 同时保留文件原始字节，避免换行转换改变校验摘要。

```powershell
python -m pip install -r src/requirements.txt
python -m pip install -r sim/analysis/requirements.txt
$env:VIVADO_BIN='C:/Xilinx/Vivado/2024.2/bin'
$env:VITIS_BIN='C:/Xilinx/Vitis/2024.2/bin'
$env:FPGA_WORK_ROOT='C:/fpga_work'
$env:PYTHON=(Get-Command python -ErrorAction Stop).Source
```

Vivado、Vitis、器件库及 JTAG 驱动需事先安装。`FPGA_WORK_ROOT` 是独立编译工作目录；源码、ROM 与约束会由脚本复制进去。以下操作均在仓库根目录执行。

## 第一步：核对文件和桌面检查

```powershell
python build/verify_submission.py
python sim/test_skills.py
python sim/test_skill_extensions.py
python sim/analysis/reproduce_paper_checks.py
python sim/analysis/check_frozen_evidence.py
python sim/analysis/check_measured_localization.py
```

预期结果：文件清单 `PASS`；Skill 基础检查 10 项通过、扩展测试 26 项通过；冻结结果检查 `PASS`。冻结检查重算已有 JSON/NPZ 中的检出计数及离线测向统计，输出 `sim/results/frozen_evidence_check.json`。它检验已有结果的一致性，执行范围不包含原始音频重新推断或 FPGA 板端运行。

文件清单用于首次复现前核验本次发布文件。测试和重建会生成新日志、时间戳或位流，执行后的变化应与对应运行记录核对。校验脚本不自动接受变化或改写清单。

实测定位检查预期输出 `PASS`：核对 360 条连续编号、PDF 页码、72 个水平位置及每位置 5 条记录，从坐标重算三维距离、空间夹角和环绕方位角误差，并输出全样本统计。该检查仅复核归档数据，不重新执行现场测量。

设计报告附录 A、B 所列的统一数值复核入口为 `sim/analysis/reproduce_paper_checks.py`，预期输出 `PASS`。它调用现有冻结结果与实测定位检查，并交叉核对 `src/variant.json`、RTL 配置和网格 ROM 的搜索域、基线、累积帧数与网格点数，检查采样窗口配置。统一入口仅向终端输出 JSON，不修改归档结果；后两条独立检查命令可用于分项排查，已运行统一入口时无需重复执行。

## 第二步：RTL 回归与搜索域 C 仿真

原始录音测向重跑及图37—45再生成入口见 [论文数据重跑说明](sim/analysis/README.md)。测向入口自动恢复采集文件名、重算校准与门限并核对论文三组案例；绘图入口从360点PDF重算统计。统一数值检查已纳入总体高度MAE、分组MAE、末端距离分组和12个标记样本规则。

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File sim/run_tests.ps1
python src/hls/scripts/build_hls.py joint_search_hls --test test_tingkong_domain.cpp --csim-only
```

RTL 入口执行以下六项现存用例，每项通过后输出 `PASS TingKong_DualArray <名称>`，并保存日志及输入快照：

| 用例 | 检查范围 |
|---|---|
| r27_key | 按键与页面切换控制 |
| r27_pages | 两页面显示与相关连接 |
| live_detection | 有效检测状态、阴性清除、故障与超时 |
| r20_radar | 雷达显示量程与位置表达 |
| r24_control | 定位控制流程与握手 |
| r19_grid_interface | 搜索核接口与结果传递 |

结果保存至 `sim/results/`，运行概要由脚本写入 `sim/validation_record.json`。不存在的用例会在编译前报错退出。搜索域 C 仿真成功时输出 `CSIM_ONLY_PASS`，具体日志位于输出的 `HLS WORK` 目录，覆盖正负 X 边界、高度边界、近场及零输入。

上述是模块、接口和算法域检查。它们帮助定位实现错误，**不构成从麦克风输入到三维定位输出的整机声学精度验证**。板级功能确认与定量定位实验应分别核对。

## 第三步：综合、布局布线和位流生成

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File build/build_board.ps1
```

默认使用 `src/hls/ip_repo/` 中随仓库提供的 HLS 导出核。构建完成后输出 `TIMING-QUALIFIED NO-DEBUG BUILD COMPLETE`，结果复制到 `build/results/`，位流及摘要复制到 `board/bitstream/`。脚本在检查不满足要求时退出，不将失败结果作为有效交付。

若要从全部 C++ 源码重新生成十类 HLS 核，按以下顺序执行；这是完整再生成路径，耗时明显长于复用已导出核：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File build/build_hls.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File build/build_board.ps1
```

HLS 入口逐核执行 C 仿真、综合、C/RTL 协同仿真和导出，相关历史记录保留于各导出核目录。整板复现记录见 [build/reproduction_record.json](build/reproduction_record.json)；本次入口修复后的复核结果见 [build/readme_validation.json](build/readme_validation.json)。

## 第四步：上板

依据 `board/hardware/` 检查接线与供电：FPGA 板 12 V、ADC 5 V、阵列 3.3 V，并正确共地。连接唯一的 XC7A200T JTAG 目标后运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File board/program.ps1
```

脚本核对位流摘要，配置 SRAM，保留 Flash。检查 16 路声音波形、方位/俯仰与 XYZ 输出，KEY4 切换定位和检测页面。实体板卡和已连接的采集设备是这一步的前提。

`board/validation_record.json` 的人工确认对应其中列出的参考位流 SHA-256；`build/reference_build/` 保存该实现报告。重新构建产生新位流后，需按新摘要记录板端检查。JTAG 配置成功与声学性能测量分别记录。

## 数据与优化证据

- `data/measured_localization/` 保存本次补充的 360 点实测 PDF 原件副本及逐行转录 JSON，对应设计报告第 3.3.4 节的双阵列硬件定位实验；统计见下一节。
- `data/recordings.zip` 保存 74 个原始采集文件；英文名、原始采集名、长度和摘要见 `data/recording_index.json`。SMQ 读法见 `sim/analysis/smq_stream.py`。
- `data/paper_evidence/` 保存冻结检测、离线测向结果与得分序列。120 m 录音结果使用对应保守模型及 19 次因果累积；当前板端检测采用其部署模型和三次得分平均。两者的实验条件分别评价。
- `build/baseline/` 与 `build/reference_build/` 保存基线和当前参考实现报告。比较时结合搜索域、累积帧数与功能差异。
- `sim/analysis/legacy_doa/` 是前期采集卡测向代码快照。新增 `sim/analysis/reproduce_legacy_doa.py` 自动恢复旧目录与文件名，从原始录音重跑论文三组测向案例；完整步骤见 [重跑说明](sim/analysis/README.md)。FPGA构建独立于该历史算法。

## 360 点双阵列三维定位实测

本次补充的[完整实测表](data/measured_localization/localization_360_points.pdf)来源为《无人机三维定位_360点数据.pdf》（已替换此前误传的《无人机三维定位_360点.pdf》），共 12 页、360 条记录，包含参考 XYZ 与方位/俯仰角、阵列输出 XYZ 与方位/俯仰角，以及方位角误差、空间角度误差、空间距离误差。配套 JSON 和以下统计均以此次更正的 PDF 为准。表中全部测点均参与统计，未剔除异常点。

**测量方法与覆盖范围。** 按[设计报告](report/design_report.docx)第 2.3.2.2、3.3.4 节，以两阵列中点为原点，X 轴沿基线、Y 轴位于水平面、Z 轴向上；地面水平坐标由激光测距标定，高度读取无人机遥控器显示值。双八通道阵列、双 AD7606 与 FPGA 完成在线定位，板端输出与参考坐标逐点配对。六个圆环的标称半径为 1、3、5、7、9、11 m，每圈 12 个方位、每个水平位置 5 个高度，共 72 × 5 = 360 点；参考高度为 1.0～10.0 m。各圈方位间隔 30°，起始角依次为 0°、6°、12°、18°、24°、30°。坐标舍入会使按表内 XY 计算的半径略偏离标称值。

**全样本统计（N = 360）。** 下表直接汇总 PDF 已列出的误差值；P95 使用排序后 `(N−1)×0.95` 位置的线性插值。

| 指标 | 平均值 | 中位数 | 均方根 RMSE | P95 | 最大值 |
|---|---:|---:|---:|---:|---:|
| 三维位置欧氏误差 / m | 0.515 | 0.407 | 0.733 | 1.114 | 5.263 |
| 空间方向夹角误差 / ° | 2.76 | 2.19 | 3.78 | 5.79 | 27.04 |

按表内误差值，位置误差 ≤ 1 m 的测点为 **334/360（92.78%）**，空间方向夹角误差 ≤ 5° 的测点为 **332/360（92.22%）**。两项最大误差均出现在第 277 点（PDF 第 10 页）：参考坐标 `(-5.50, 9.53, 3.2) m`，阵列输出 `(-5.56, 6.11, 7.20) m`。以上是该批测点的误差分布，不代表所有位置均满足同一精度阈值。

三维位置误差定义为 `||p_array − p_ref||₂`，空间角度误差为两位置向量的夹角 `acos((p_array·p_ref)/(|p_array||p_ref|))`；方位角误差采用跨越 0°/360° 的最小角差。空间夹角同时反映方位与俯仰差异，不能用方位角误差代替。原表中的 `<0.01` 方位误差在 JSON 中原样保留。

**数据复核与适用范围。** 运行 `python sim/analysis/check_measured_localization.py` 可重算并核对上述结果，仅依赖 Python 标准库。JSON 中 `reference_*` 为参考值，`array_*` 为阵列输出，`reported_*` 为 PDF 原列值，`id` 和 `pdf_page` 用于追溯原表。距离核对容差为 0.00051 m、角度核对容差为 0.0051°，对应表格显示精度。实测结果反映本批工况下板端定位输出与参考坐标的一致程度；参考坐标受悬停漂移和遥控器高度读数影响，未提供同步高精度位置基准。PDF 未记录采集时间及位流摘要，因此不将其自动绑定到 `board/validation_record.json` 中的特定位流。120 m 录音检测、离线测向、数字仿真和本节近场三维定位分别评价。

## Skill 与协作

`skill/` 给出适用场景、输入约定、操作步骤、失败案例和验证范围。PYNQ 工具通过配置替换 Overlay、数据格式及黄金参考，供其他加速器复用；现有记录为桌面测试及 DMA 驱动替身测试，PYNQ 实体板执行状态见对应 JSON。

`report/llm_collaboration.md` 与 `report/llm_interaction_excerpt.json` 同步保存协作记录。原始对话节选保留会话文件名、行号、时间和文本摘要，正式化表述保留技术意图。项目记忆中的历史分支与当前工程分别说明。

## Git LFS download note

Large reports, photos and FPGA bitstreams also use Git LFS. After cloning, run `git lfs install` and `git lfs pull` before verification or board programming. The binary file contents are unchanged.
