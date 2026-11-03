# 在一个新 PYNQ 工程中执行

## 先确定接口

适用范围为 AXI DMA simple mode、MM2S 与 S2MM 双通道、每次输出一个以 TLAST 结束的数据包。SG、cyclic、多 DMA 并发、变长输出和重叠流水调度需要专门适配。示例 JSON 用于演示结构，零摘要和 example 板名必须替换成真实值；包中不提供示例 overlay。

1. 从本次实现导出同名 `.bit`、`.hwh`，记录板卡、PYNQ 版本及两文件 SHA-256。文件摘要只能确认文件身份，不能证明板型和接口正确。
2. 写明输入输出 shape、dtype、整数符号、定点小数位、饱和/回绕规则、复数交错或分离格式、FFT 顺序与归一化、FIR 启动瞬态。`numeric_convention` 必须对应参考程序。
3. 由 HWH 的 `C_SG_LENGTH_WIDTH` 确认最大传输字节数，并核对双通道存在、`C_INCLUDE_SG=0`。按真实内存映射数据宽度与 DRE 设置确认地址对齐。

```powershell
python scripts/pynq_contract.py contract.json --check-artifacts
python scripts/compare_arrays.py golden.npy actual.npy --atol 0 --rtol 0 --output comparison.json
```

## 板端调用骨架

以下步骤在兼容的 PYNQ 板上按对应设计执行。将 scripts 目录加入 Python 导入路径。`configure_and_start` 是由该工程真实 register_map 编写的函数；自由运行的流核可以传 `None`。本 Skill 不提供通用的寄存器偏移猜测。

```python
import json
from pathlib import Path
import numpy as np
from pynq import Overlay, allocate
from pynq_contract import validate, check_metadata
from dma_guard import transfer_once, TransferFailure

contract_path = Path('contract.json')
c = json.loads(contract_path.read_text())
validate(c, contract_path.parent)
bit = contract_path.parent / c['artifacts']['bit']['file']
overlay = Overlay(str(bit), download=False)
check_metadata(c, overlay.ip_dict)
# 核对板型、接口与本次操作目标后，明确加载。
overlay.download()
dma = getattr(overlay, c['dma_instance'])
ib = allocate(tuple(c['input']['shape']), dtype=c['input']['dtype'])
ob = allocate(tuple(c['output']['shape']), dtype=c['output']['dtype'])
source = np.load('input.npy', allow_pickle=False)
if source.shape != ib.shape or source.dtype != ib.dtype:
    raise ValueError('Input file does not match contract')
ib[:] = source
ob[:] = 0
# 本例适用于自由运行的流处理核。带控制接口的核传实际启动函数。
try:
    timing = transfer_once(dma, ib, ob, c, start_kernel=None)
except TransferFailure as fault:
    retained_failure = fault  # 保留故障与 buffers 引用，先诊断并停止硬件写入。
    print(fault.status)
    raise
else:
    np.save('actual.npy', np.asarray(ob).copy(), allow_pickle=False)
    Path('timing.json').write_text(json.dumps(timing, indent=2))
    ib.freebuffer()
    ob.freebuffer()
```

超时路径不调用无界 `wait()` 或 `stop()`，不自动复位或释放可能仍被访问的缓冲区。先保留状态寄存器，再按板上设计停止/复位 DMA 与上游核，确认总线已静止后释放。设备失去响应时，Python 轮询超时不等于硬件已经停止；MMIO 总线本身挂起也超出 Python 超时保护范围。

## 数值和时延

先运行短向量、零输入、满量程正负值，再运行代表性数据。参考程序由数学定义或独立实现产生，不能直接把 actual 复制成 golden。每次同时保存输入、输出、契约与软件版本；重复运行应包含输入改变和两次连续调用，查出旧缓冲区或状态残留。

`host_transfer_compute_seconds` 从缓存同步前开始，到接收完成并同步回 CPU 后结束，包含 Python 调度、传输与计算。纯核时延需硬件周期计数器或独立事件测量。报告预热方法、次数、中位数/P95、输入长度和工作时钟。采样窗口、首次结果延迟、稳态更新间隔分别记录。

## 官方接口依据

- [Overlay 文档](https://pynq.readthedocs.io/en/v3.1/pynq_libraries/overlay.html)：元数据检查与明确下载。
- [Buffer 文档](https://pynq.readthedocs.io/en/v3.1/pynq_libraries/allocate.html)：连续分配与缓存同步。
- [PYNQ 3.0.1 DMA 驱动源码](https://github.com/Xilinx/PYNQ/blob/v3.0.1/pynq/lib/dma.py)：simple DMA 状态、长度及错误处理的核对依据。helper 为本包实现，未复制驱动源码；其他版本先验证驱动接口。
