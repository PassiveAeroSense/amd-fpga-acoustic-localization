"""Desktop fault injection for portable contracts and the bounded DMA host helper."""
from pathlib import Path
import copy,hashlib,importlib.util,json,sys,tempfile,unittest
import numpy as np

root=Path(__file__).resolve().parents[1]
scripts=root/'skill/pynq-golden-check/scripts'
sys.path.insert(0,str(scripts))
from pynq_contract import validate,check_metadata
from dma_guard import transfer_once,TransferFailure
from compare_arrays import compare

def contract():
    c=json.loads((root/'skill/pynq-golden-check/assets/contract_example.json').read_text('utf-8'))
    c['input']['shape']=[4];c['output']['shape']=[4];c['timeout_s']=.003
    return c

class Buffer(np.ndarray):
    def __new__(cls,events,label):
        b=np.zeros(4,dtype='<i4').view(cls);b.events=events;b.label=label;b.device_address=4096;return b
    def sync_to_device(self):self.events.append(self.label+'_flush')
    def sync_from_device(self):self.events.append(self.label+'_invalidate')

class Channel:
    def __init__(self,parent,kind):self.parent=parent;self.kind=kind
    def transfer(self,b,nbytes):
        self.parent.events.append(self.kind+'_transfer')
        self.parent.started.add(self.kind)
        if self.kind=='receive':self.parent.count=nbytes

class FakeDMA:
    def __init__(self,mode='ok'):
        self.mode=mode;self.events=[];self.started=set();self.count=0
        self.mmio=self;self.sendchannel=Channel(self,'send');self.recvchannel=Channel(self,'receive')
    def read(self,offset):
        if offset==0x58:return self.count-(4 if self.mode=='short' else 0)
        if self.mode=='sg':return 0x8
        if self.mode=='pre_halt':return 0x1
        if len(self.started)<2:return 0
        if self.mode=='error':return 0x10
        if self.mode=='halt':return 1
        if self.mode=='stall' and offset==0x34:return 0
        return 2

class Clock:
    def __init__(self):self.value=0
    def __call__(self):self.value+=.001;return self.value

class Tests(unittest.TestCase):
    def test_contract_sizes(self):self.assertEqual(validate(contract())['buffer_bytes'],{'input':16,'output':16})
    def test_zero_dimension(self):
        c=contract();c['input']['shape']=[0]
        with self.assertRaises(ValueError):validate(c)
    def test_dtype_rejected(self):
        c=contract();c['input']['dtype']='O'
        with self.assertRaises(ValueError):validate(c)
    def test_big_endian_rejected(self):
        c=contract();c['input']['dtype']='>i4'
        with self.assertRaises(ValueError):validate(c)
    def test_oversize(self):
        c=contract();c['max_transfer_bytes']=15
        with self.assertRaises(ValueError):validate(c)
    def test_integer_tolerance(self):
        c=contract();c['atol']=1
        with self.assertRaises(ValueError):validate(c)
    def test_nan_timeout(self):
        c=contract();c['timeout_s']=float('nan')
        with self.assertRaises(ValueError):validate(c)
    def test_wrong_tlast_policy(self):
        c=contract();c['output_packet']='variable'
        with self.assertRaises(ValueError):validate(c)
    def test_artifacts_and_tamper(self):
        c=contract()
        with tempfile.TemporaryDirectory() as td:
            for role in ('bit','hwh'):
                b=('test '+role).encode();(Path(td)/c['artifacts'][role]['file']).write_bytes(b)
                c['artifacts'][role]['sha256']=hashlib.sha256(b).hexdigest()
            self.assertEqual(validate(c,td)['status'],'PASS')
            (Path(td)/'design.bit').write_bytes(b'changed')
            with self.assertRaises(ValueError):validate(c,td)
    def test_wrong_hwh_name(self):
        c=contract();c['artifacts']['hwh']['file']='other.hwh'
        with self.assertRaises(ValueError):validate(c)
    def test_path_escape(self):
        c=contract()
        for role in ('bit','hwh'):c['artifacts'][role]['file']='../design.'+role
        with self.assertRaises(ValueError):validate(c)
    def metadata(self):
        return {'axi_dma_0':{'type':'xilinx.com:ip:axi_dma:7.1','parameters':{'C_INCLUDE_SG':'0','C_INCLUDE_MM2S':'1','C_INCLUDE_S2MM':'1','C_SG_LENGTH_WIDTH':'14'}}}
    def test_metadata_and_limit(self):
        c=contract();m=self.metadata();self.assertTrue(check_metadata(c,m));c['max_transfer_bytes']=16384
        with self.assertRaises(ValueError):check_metadata(c,m)
    def test_metadata_missing(self):
        with self.assertRaises(ValueError):check_metadata(contract(),{})
    def test_metadata_sg(self):
        m=self.metadata();m['axi_dma_0']['parameters']['C_INCLUDE_SG']='1'
        with self.assertRaises(ValueError):check_metadata(contract(),m)
    def run_transfer(self,mode='ok',start=None):
        dma=FakeDMA(mode);ib=Buffer(dma.events,'input');ob=Buffer(dma.events,'output')
        return dma,ib,ob,lambda:transfer_once(dma,ib,ob,contract(),start,Clock(),lambda x:None)
    def test_receive_first_and_cache_order(self):
        dma,ib,ob,run=self.run_transfer();result=run()
        self.assertEqual(dma.events,['input_flush','receive_transfer','send_transfer','output_invalidate'])
        self.assertEqual(result['received_bytes'],16);self.assertGreater(result['host_transfer_compute_seconds'],0)
    def test_kernel_start_order(self):
        dma,ib,ob,_=self.run_transfer()
        transfer_once(dma,ib,ob,contract(),lambda:dma.events.append('kernel_start'),Clock(),lambda x:None)
        self.assertEqual(dma.events[1:4],['receive_transfer','kernel_start','send_transfer'])
    def test_timeout_retains_buffers(self):
        dma,ib,ob,run=self.run_transfer('stall')
        with self.assertRaises(TransferFailure) as cm:run()
        self.assertIn('timeout',str(cm.exception));self.assertIs(cm.exception.buffers[1],ob)
        self.assertNotIn('output_invalidate',dma.events)
    def test_error_state(self):
        dma,ib,ob,run=self.run_transfer('error')
        with self.assertRaises(TransferFailure) as cm:run()
        self.assertEqual(cm.exception.status['s2mm_dmasr'],16)
    def test_halted_during_transfer(self):
        dma,ib,ob,run=self.run_transfer('halt')
        with self.assertRaises(TransferFailure):run()
    def test_halted_before_transfer(self):
        dma,ib,ob,run=self.run_transfer('pre_halt')
        with self.assertRaises(TransferFailure):run()
        self.assertEqual(dma.events,[])
    def test_short_packet_rejected(self):
        dma,ib,ob,run=self.run_transfer('short')
        with self.assertRaises(TransferFailure):run()
        self.assertNotIn('output_invalidate',dma.events)
    def test_scatter_gather_rejected(self):
        dma,ib,ob,run=self.run_transfer('sg')
        with self.assertRaises(ValueError):run()
        self.assertEqual(dma.events,[])
    def test_wrong_buffer_before_arm(self):
        dma,ib,ob,_=self.run_transfer()
        with self.assertRaises(ValueError):transfer_once(dma,ib[:2],ob,contract())
        self.assertEqual(dma.events,[])
    def test_start_failure_retains_buffers(self):
        def fail():raise RuntimeError('start failed')
        dma,ib,ob,run=self.run_transfer(start=fail)
        with self.assertRaises(TransferFailure) as cm:run()
        self.assertIs(cm.exception.buffers[0],ib);self.assertNotIn('send_transfer',dma.events)
    def test_two_calls(self):
        dma,ib,ob,run=self.run_transfer();run();ib[:]=[1,2,3,4];run()
        self.assertEqual(dma.events.count('receive_transfer'),2)
        self.assertEqual(dma.events.count('output_invalidate'),2)
    def test_other_numeric_domains(self):
        fir=np.convolve(np.array([1,-2,3,4],dtype=np.int64),np.array([1,2,1],dtype=np.int64))
        changed=fir.copy();changed[2]+=1
        self.assertEqual(compare(fir,changed)['status'],'FAIL')
        fft=np.fft.fft(np.array([1.,2.,-1.,0.]));near=fft.copy();near[1]+=1e-8j
        self.assertEqual(compare(fft,near,atol=1e-7)['status'],'PASS')
        self.assertEqual(compare(fft,near,atol=1e-10)['status'],'FAIL')

if __name__=='__main__':
    suite=unittest.defaultTestLoader.loadTestsFromTestCase(Tests)
    result=unittest.TextTestRunner(verbosity=2).run(suite)
    summary={'status':'PASS' if result.wasSuccessful() else 'FAIL','tests_run':result.testsRun,
             'failures':len(result.failures),'errors':len(result.errors),'hardware_pynq_execution':False,
             'scope':'Desktop contract and numeric checks; DMA driver-double fault injection. No PYNQ board execution.'}
    (root/'sim/skill_extensions_validation.json').write_text(json.dumps(summary,indent=2)+'\n','utf-8')
    raise SystemExit(not result.wasSuccessful())
