# 可复用技能包

本包将真实项目记忆、协作纠错与验证脚本提炼为三项技能。入口保持简短，操作细节、失败案例和来源放在各自 references/。历史摘录附日期及源文件 SHA-256，避免将旧工程状态移用为当前验收结果。

| 技能 | 陌生队伍可直接复用什么 | 已验证效果 | 边界 |
|---|---|---|---|
| [fpga-evidence-check](fpga-evidence-check/SKILL.md) | Vivado 资源/时序解析、来源一致性与构建归档流程 | 实际报告解析、负裕量及缺失字段拒绝 | 当前报告字段格式；CDC/DRC需结合电路与约束审查 |
| [fpga-stream-debug](fpga-stream-debug/SKILL.md) | ADC错位、CDC、旧结果保持、流水延迟的诊断提示词和故障矩阵 | 六项历史开发案例，现有状态/集成回归记录 | 新接口的具体电平与模拟根因需物理测量 |
| [pynq-golden-check](pynq-golden-check/SKILL.md) | 可编辑契约、bit/hwh身份检查、元数据核验、simple DMA有界等待、数值比较 | 10项原有检查及26项扩展桌面测试；包含超时、错误、短包和缓存调用顺序 | PYNQ硬件尚未实测；不覆盖SG/cyclic/多DMA并发 |

## 如何开始

依赖为 Python 3.11+ 和 NumPy。需要调用 PYNQ 的步骤在兼容板上安装相应 PYNQ 环境后执行；桌面验证不导入 PYNQ，不加载位流。

```powershell
python sim/test_skills.py
python sim/test_skill_extensions.py
python skill/pynq-golden-check/scripts/pynq_contract.py skill/pynq-golden-check/assets/contract_example.json
```

结果保存在 `sim/skill_validation.json`、`sim/skill_extensions_validation.json`。示例契约最后一条命令只检查格式和长度；实际板端使用前填写真实板卡、接口、bit/hwh摘要并执行 `--check-artifacts`。

已有黄金参考时直接调用 compare_arrays.py；准备DMA运行时阅读 execution_recipe.md；现场链路间歇失效时使用 fpga-stream-debug。换题目或换板时替换契约、参考数据、接口与启动函数，保留检查和诊断方法。

## 经验来源与验证范围

`fpga-stream-debug/references/memory_cases.json`保存六段历史记忆原文、日期、行号及源文件摘要。`pynq-golden-check/references/project_origin.md`说明这些经验如何映射到PYNQ：故障导致旧结果残留→有界等待与输出核验，多版本构建→工件身份检查，数值流水优化→独立参考与明确容差。

PYNQ辅助程序按官方API整理，并通过driver doubles进行桌面故障注入。该验证确认Python控制流程与失败处理；目标板上的AXI、TLAST、缓存一致性及模拟输入仍由对应板级测试确认。当前Artix-7作品保持原有独立FPGA架构。

大模型协作过程保留在 `../report/llm_collaboration.md` 独立附件。新增技能由本轮实际开发记忆整理，未将历史交接指令当作当前操作指令。
