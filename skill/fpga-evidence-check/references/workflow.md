# Scope, origin and verification

适用：Vivado 英文文本资源表与时序摘要、RTL/HLS 工程交付检查。用户可换板卡、算法和报告路径；当前解析器支持包含 Slice LUTs / Slice Registers / Block RAM Tile / DSPs 的报告。其他器件报告标签变化时会明确失败，需要适配字段。

来源观察：本项目发现说明中的搜索域与 ROM 不一致，严格 Y=0 切片漏画负 X，Vivado GUI 与详细报告的可用资源分母不同，音频累积时长容易被当成整机响应。这些问题分别通过读取 ROM、双侧投影、按报告可用量计算、拆分时间阶段解决。上述为项目既有经验；`report/llm_collaboration.md`现按另一组本会话内容整理，说明报告核查和失败修正方法，不逐条复现上述事项的原始对话。

使用：在提交包根目录运行：

```powershell
python skill/fpga-evidence-check/scripts/check_reports.py build/reference_build/board_routed_utilization.rpt build/reference_build/board_routed_timing.rpt
```

复用提示词：

> 读取本工程的配置、顶层、约束与已布线报告。先列出数据来源和统计口径，再检查资源、时序和接口假设。逐项指出跨版本或跨工况比较；每项结论附原始文件与可执行复核命令。对未覆盖的物理条件明确适用范围。按确认的修改重新仿真与实现，保留失败和修正记录。

验证：`sim/test_skills.py` 在真实报告上核对资源，并注入负时序裕量、删除资源行，确认失败被检测；结果见 `sim/skill_validation.json`。实际独立目录重建见 `build/reproduction_record.json`。

边界：文本脚本检查报告数值及格式，CDC 电路拓扑、板上电平与 ADC 建立保持条件需要结合 RTL、XDC 和板级记录审查。统计工具不会推断现场角度误差。工具版本固定为 Vivado 2024.2，其他版本先运行格式测试。

## 从项目记忆补充的工程判断

历史记忆中，两项并行构建可能同时输出到 delivery；另一次 LCD 流水修复只增加延迟而保持像素内容，因此需要把数值/像素回归、源文件摘要、布局布线和板级观察分别归档。相关原始摘录见 `../../fpga-stream-debug/references/memory_cases.json`。

复现时为每次构建建立独立工作目录，冻结 RTL、ROM、XDC、Tcl 和 HLS 导出核摘要。构建开始及结束都核对输入，候选输出通过检查后再更新交付。仿真使用另一工作目录，以免工具清理中间文件时影响并行任务。

DRC 逐类记录规则号、原始警告、相关 RTL/XDC、处理或保留理由及验证结果。仅有 WNS/WHS 为正不能代表外部采集接口已完成建立保持验证，也不能自动关闭配置电压、BRAM 控制或 CDC 警告。针对器件参数核对真实板卡资料，不用猜测值消除告警。

优化对照固定输入、搜索范围、精度约束和计时边界。若功能或范围同时改变，将资源变化解释为配置取舍；对某项优化的收益另做同条件实验。保留采样窗口、纯计算周期、首次有效结果延迟和稳态更新间隔四种量。
