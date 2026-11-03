"""Bounded host-side transfer helper for already loaded, verified AXI simple DMA.

No overlay download, register-map guessing, automatic reset, or buffer freeing.
This module is desktop-tested with driver doubles, not PYNQ board-validated.
"""
import time
import numpy as np
from pynq_contract import validate

class TransferFailure(RuntimeError):
    def __init__(self,reason,status,buffers):
        super().__init__(reason)
        self.status=status
        self.buffers=buffers  # Keep allocations reachable until the caller quiesces DMA.

def snapshot(dma):
    return {'mm2s_dmasr':int(dma.mmio.read(0x04)),
            's2mm_dmasr':int(dma.mmio.read(0x34))}

def transfer_once(dma,input_buffer,output_buffer,contract,start_kernel=None,
                  clock=time.monotonic,sleep=time.sleep):
    sizes=validate(contract)['buffer_bytes'];buffers=(input_buffer,output_buffer)
    for key,b in zip(('input','output'),buffers):
        spec=contract[key]
        if tuple(b.shape)!=tuple(spec['shape']) or np.dtype(b.dtype)!=np.dtype(spec['dtype']):
            raise ValueError('Buffer shape/dtype mismatch: '+key)
        if not b.flags.c_contiguous or b.nbytes!=sizes[key]:raise ValueError('Contiguous exact-size buffers required')
        if not hasattr(b,'device_address'):raise ValueError('Use pynq.allocate buffers')
        if not hasattr(b,'sync_to_device') or not hasattr(b,'sync_from_device'):
            raise ValueError('Buffer cache synchronization methods required')
    state=snapshot(dma)
    if any(v&0x08 for v in state.values()):raise ValueError('Scatter-gather DMA unsupported')
    if any(v&0x71 for v in state.values()):raise TransferFailure('DMA halted or error before transfer',state,buffers)
    start=clock()
    try:
        input_buffer.sync_to_device()
        dma.recvchannel.transfer(output_buffer,nbytes=sizes['output'])
        if start_kernel is not None:start_kernel()
        dma.sendchannel.transfer(input_buffer,nbytes=sizes['input'])
        while True:
            state=snapshot(dma)
            if any(v&0x71 for v in state.values()):
                raise TransferFailure('DMA halted or error during transfer',state,buffers)
            if all(v&0x02 for v in state.values()):break
            if clock()-start>=contract['timeout_s']:
                raise TransferFailure('DMA timeout; inspect TLAST, lengths, reset and clocks',state,buffers)
            sleep(0.0001)
        received=int(dma.mmio.read(0x58))
        if received!=sizes['output']:
            raise TransferFailure('Received byte count mismatch',dict(state,received_bytes=received),buffers)
        output_buffer.sync_from_device()
        return {'status':'PASS','received_bytes':received,'host_transfer_compute_seconds':clock()-start,
                'scope':'Host transfer plus compute plus synchronization; not isolated kernel latency'}
    except TransferFailure:
        raise
    except Exception as error:
        raise TransferFailure(str(error),state,buffers) from error
