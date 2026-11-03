from pathlib import Path
import sys

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle,FancyArrowPatch
W=Path(__file__).resolve().parent; W.mkdir(exist_ok=True)
plt.rcParams.update({'font.family':['Microsoft YaHei','DejaVu Sans'],'font.size':10,'svg.fonttype':'none'})
f,a=plt.subplots(figsize=(7.2,8.0));f.subplots_adjust(0,0,1,1);a.set(xlim=(0,10),ylim=(0,11));a.axis('off')
ink='#26343D';blue='#216B92';red='#AC3E32';purple='#70528B';gray='#68757C'
def txt(x,y,s,fs=10,c=ink,ha='center',weight='normal'):
 a.text(x,y,s,ha=ha,va='center',fontsize=fs,color=c,linespacing=1.45,weight=weight)
def box(x,y,w,h,title,sub='',c=ink):
 a.add_patch(Rectangle((x,y),w,h,ec=c,fc='white',lw=1.1))
 txt(x+w/2,y+h*.64 if sub else y+h/2,title,11,c,weight='bold')
 if sub:txt(x+w/2,y+h*.25,sub,9.5,c)
def line(points,c=blue,arrow=False,dash=False):
 xs,ys=zip(*points);a.plot(xs,ys,c=c,lw=1.25,ls='--' if dash else '-')
 if arrow:a.add_patch(FancyArrowPatch(points[-2],points[-1],arrowstyle='-|>',mutation_scale=9,color=c,lw=1.25))
def dot(x,y,c=ink):a.plot(x,y,'o',ms=3,c=c)
txt(.25,10.75,'a  电源分配',12,ha='left',weight='bold')
box(.25,9.1,2.5,1.15,'电池组','24 V 规格 / 2200 mAh',red)
box(3.3,9.1,2.4,1.15,'稳压模块','三路输出 / 公共 GND',red)
line([(2.75,9.68),(3.3,9.68)],red,True)
for y,lab in [(10.1,'+12 V → FPGA DC 输入'),(9.67,'+5 V → 两块 ADC P3-11'),(9.24,'+3.3 V → 两块阵列 VDD')]:
 line([(5.7,y),(6.2,y)],red,True);txt(6.35,y,lab,10,red,'left')
txt(.25,8.65,'电池铭牌标称 22.2 V，充电限制 25.2 V；下方同名电源网相连。',9.5,gray,'left')
a.plot([.25,9.75],[8.35,8.35],c='#D8DEE2',lw=.7)
txt(.25,8.04,'b  信号与接口连接',12,ha='left',weight='bold')
for k,y in [(1,6.35),(2,4.15)]:
 box(.25,y,2.1,1.1,f'八阵元阵列 {k}','VM1000 × 8')
 txt(1.3,y+1.31,'+3.3 V / GND',9.5,red)
 box(3.65,y,2.2,1.1,f'ADC {k}','AD7606 / A1～A8')
 txt(4.75,y+1.31,'P3-11：+5 V',9.5,red)
 line([(2.35,y+.55),(3.65,y+.55)],blue,True)
 txt(3,y+.83,'8 路模拟',9.5,blue);txt(3,y+.26,'同轴线',9,blue)
 line([(5.85,y+.72),(7.6,y+.72)],blue,True)
 txt(6.72,y+1.0,'DB[15:0]',9.5,blue)
 txt(6.72,y+.46,'BUSY / FIRST',9,blue)
 line([(7.6,y+.12),(5.85,y+.12)],purple,True)
 txt(6.72,y-.14,f'独立 CS{k}',9.5,purple)
box(7.6,3.95,2.15,3.5,'','',ink)
txt(8.675,7.17,'FPGA',11,weight='bold')
txt(8.675,6.8,'野火升腾',10);txt(8.675,6.5,'XC7A200T',10)
txt(8.675,6.05,'CN3 ↔ ADC1',9.5,blue);txt(8.675,5.7,'CN4 ↔ ADC2',9.5,blue)
txt(8.675,4.3,'听空系统',10)
txt(8.675,7.76,'DC：+12 V',9.5,red)
# Shared control is a grouped harness, with explicitly named destination pins.
line([(8.2,3.95),(8.2,3.35),(4.75,3.35)],purple,True)
txt(4.25,2.95,'共用控制线束：CONVST / RESET / RD',10,purple)
line([(4.75,3.35),(4.75,4.15)],purple,True)
line([(4.75,3.35),(3.52,3.35),(3.52,5.85),(4.75,5.85),(4.75,6.35)],purple,True)
dot(4.75,3.35,purple)
txt(.25,2.50,'CN3-5/6/7 → 两块 ADC 的 P3-9/6/5；H5 短接 CON-A/B。',9.5,purple,'left')
txt(.25,2.10,'OS[2:0] 接地；ADC 数字接口 VDRIVE 为 3.3 V。',9.5,ink,'left')
box(7.35,.7,2.4,1.1,'5 寸 LCD','800 × 480')
line([(9.3,3.95),(9.3,3.25),(9.95,3.25),(9.95,1.25),(9.75,1.25)],blue,True)
txt(8.6,2.82,'板载 LCD 排线',9.5,blue)
txt(8.6,2.46,'RGB565 + 时序',9.5,blue)
txt(.25,1.46,'公共地 G0',10,gray,'left',weight='bold')
txt(.25,.97,'电池负极 / 稳压 GND / 两阵列 GND\n两 ADC P3-12 / FPGA CN3-3、CN4-3',9.5,gray,'left')
txt(.25,.28,'模拟信号地随同轴线接 ADC；外部 +5 V 与开发板 +5 V 不并联。',9.5,gray,'left')
f.savefig(W/'system_wiring.png',dpi=350,facecolor='white')
f.savefig(W/'system_wiring.svg',facecolor='white')
print(W/'system_wiring.png')
