# 数据与参考结果

`measured_localization/localization_360_points.pdf`（12 页、360 条），对应设计报告第 3.3.4 节的实验。配套 JSON 和主 README 统计已按更正文件重新生成。`localization_360_points.json` 按原表顺序保存全部记录与来源页码；`reference_*` 表示参考值、`array_*` 表示阵列输出、`reported_*` 表示原表误差列，距离单位为米、角度单位为度。方位角误差以字符串保留 `<0.01` 等原始表示。

在仓库根目录运行 `python sim/analysis/check_measured_localization.py`，检查行号、分组与坐标重算误差，并输出全样本统计。汇总及测量方法见[主 README](../README.md#360-点双阵列三维定位实测)。全部点保留，不做异常点剔除；本数据为现场位置对照，独立于下述录音包和离线冻结结果。PDF 未列出采集时间及位流摘要。

`recordings.zip` 保存原始采集文件；`recording_index.json` 提供交付英文名、原始名称、文件长度与 SHA-256。解压后保持音频字节不变，SMQ 和同名 SMQINF 使用同一英文文件干名。读取 SMQ 前确认通道数与实际采样率。

`paper_evidence/` 保存冻结评估结果、得分序列、历史录音清单和模型文件。快速一致性检查使用 `python sim/analysis/check_frozen_evidence.py`，读取 JSON/NPZ 并核对已有统计，不加载 joblib。该检查不重新执行音频推断或板端定位。历史清单正文保留原始采集名称，与录音索引对应。

夜间 120 m 结果使用对应冻结模型和 19 次因果累积；在线模型使用三次得分平均。各条件在设计报告中分别表述。原始背景计数的用途、校准与独立样本属性保留在原始评估协议中。
