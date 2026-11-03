# PYNQ 验证任务入口

本技能服务于已有 PYNQ 加速器的主机端验证，也可在桌面上准备契约与数值参考。依赖 Python 3.11+、NumPy；实际 Overlay 与 DMA 操作在兼容 PYNQ 板上执行。

按当前任务选择：

- **已有 golden.npy 和 actual.npy**：调用 scripts/compare_arrays.py。保持相同 shape、dtype、单位和排列；整数精确比较，浮点容差来自量化误差预算。
- **准备新板或新 overlay**：先填写 assets/contract_example.json，再按 [执行步骤](execution_recipe.md) 检查摘要、元数据、长度、缓存与接收顺序。
- **DMA 卡住、结果重复或长度异常**：查阅 [故障矩阵](failure_matrix.md)，保存状态寄存器与缓冲区，明确硬件停止后再恢复。
- **解释技能来源与可复用性**：阅读 [项目经验映射](project_origin.md)，将历史 FPGA 经验与本轮 PYNQ 主机程序验证分开说明。

本次覆盖契约、数值及驱动替身的桌面测试。当前作品仍为独立 Artix-7 FPGA；真实 PYNQ 板端执行、AXI 时序和缓存一致性由对应硬件测试验证。换板复用时重新填写板型、PYNQ 版本、工件身份与启动函数。
