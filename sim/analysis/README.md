# 论文数据重跑说明

在提交目录根目录运行，使用Python 3.11或更新版本：

```powershell
python -m pip install -r sim/analysis/requirements.txt
python sim/analysis/reproduce_legacy_doa.py --work-dir ../doa_reproduction
python sim/analysis/reproduce_localization_figures.py --output-dir ../localization_reproduction
```

两个输出目录必须位于提交目录之外，避免修改冻结证据。测向工作目录首次必须为空；代码或输入索引改变后须换用新目录，防止使用旧缓存。

## 原始录音到论文三组逐窗测向对照

`reproduce_legacy_doa.py`执行顺序：

1. `prepare`：按 `data/recording_index.json` 从 `data/recordings.zip` 恢复双阵列夜间采集的原名和目录，校验大小、SHA-256。恢复38个归档成员、35份SMQ录音；原文件名排序保持历史记录编号（从0开始）。冻结manifest只交叉核对编号、标签和原始摘要。
2. `features`：从16通道、15 kHz原始录音重新计算频谱协方差，以及背景训练和留出协方差。
3. `calibrate`：按原开发集重新拟合弱标注通道校准、计算旋翼门限所需基频。这里不执行无关的探索性近场搜索。
4. `gates`：从背景录音生成此前缺失入口的 `background_gate_diagnostics.json`，依次生成活动、旋翼频带、持续性门限。
5. `infer`：默认重跑记录2、26、9，生成0.75秒窗、0.25秒步长的改进测向及配对SRP基线，保留无效窗。
6. `evaluate`：在相同有效窗上计算中位数，与冻结结果比较。有效窗数须一致，中位数容差为1e-6度；失败返回非零退出码。

冻结协方差、校准、门限和推断结果均不作为推断输入。冻结推断结果只用于最后对比。预期有效窗数为53、41、47；基线/改进中位数为5.344929/3.704117、5.107963/3.223274、9.438956/2.075795度。

工作目录内输出：

- `recording_mapping.json`：英文归档名与原采集路径映射。
- `data/analysis/dual_night_20261023/manifest.json`：恢复的编号、路径、标签和摘要。
- `data/analysis/algorithm_trials_20261024/`：重算协方差、校准、门限；`stream/record_02.json`、`record_26.json`、`record_09.json`为完整逐窗输出。
- `doa_comparison.json`：重跑与冻结结果对照。
- `pipeline_inputs.json`及各阶段 `*_complete.json`：输入代码摘要、阶段完成记录。

中断后可以用 `--stage prepare|features|calibrate|gates|infer|evaluate` 依顺序继续。先完成默认流程后，可在PowerShell中重跑全部35份录音：

```powershell
python sim/analysis/reproduce_legacy_doa.py --work-dir ../doa_reproduction --stage infer --records (0..34)
python sim/analysis/reproduce_legacy_doa.py --work-dir ../doa_reproduction --stage evaluate --records (0..34)
```

没有完整参考坐标的录音仍产生逐窗输出，但不计算参考方向误差。本次实际验证范围是论文三组案例。入口不重建全部探索性算法排名、历史HTML报告或120 m分类检测，也不代表FPGA实时执行。`legacy_doa/algorithm_trial_report.py`保留为历史快照，不是当前运行入口。

## 360点PDF到图37—45及统计

`reproduce_localization_figures.py`直接读取包内 `data/measured_localization/localization_360_points.pdf`，核对逐行JSON坐标和编号，再从坐标计算误差。PDF的四舍五入误差列只作交叉校验。

输出 `fig37.png` 至 `fig45.png`、`new_montage.png`、`stats.json`、`pdf_rows.json`、`point_metrics.csv`、`plot_data.npz`。添加 `--stats-only` 可只重算统计。

- 全部360点均参与分组中位数、四分位数及MAE，标记样本不剔除。
- 参考三维距离以双阵列中点为原点，分组为 `[0,2)`、`[2,4)`……`[14,16)` m；末组9点，角度误差中位数约2.509077°。
- 水平半径归入最近的设计圆环1、3、5、7、9、11 m；参考高度分组为 `[1,3)`、`[3,5)`、`[5,7)`、`[7,10]` m，共24组。样本数和MAE写入统计JSON。
- 分位数使用NumPy默认线性插值。位置误差超过全样本 `Q3+1.5×IQR=1.2838331765 m` 的12点被标记：5、250、255、257、277、296、318、347、351、353、354、360。
- 总体高度MAE约0.324556 m，三维位置误差中位数约0.406878 m，分组高度MAE约0.056923～0.779231 m。

图像保持修改稿的配色、布局和散点随机种子。使用Windows的Times New Roman、SimSun字体；其他环境需安装同名字体才能保持外观。统计不依赖字体，不同Matplotlib版本可能影响图片字节。实测环境和图片摘要见 `build/analysis_reproduction_validation.json`（相对于提交根目录）。

统一数值检查已纳入上述最新统计：

```powershell
python sim/analysis/reproduce_paper_checks.py
```

该快速检查不自动运行原始录音推断；原始录音重跑应使用第一条独立命令。
