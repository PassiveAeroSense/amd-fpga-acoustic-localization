from pathlib import Path
import json
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from PIL import Image, ImageDraw

W=Path(OUTPUT_DIR)
D=np.load(W/'plot_data.npz'); P=D['P'];Q=D['Q'];d=D['d'];rho=D['rho'];dz=D['dz'];broad=D['broad'];radii=np.array([1,3,5,7,9,11])
angle=D['angle'];distance=D['dist'];stats=json.loads((W/'stats.json').read_text('utf-8'))
plt.rcParams.update({'font.family':['Times New Roman','SimSun'],'font.size':11,'axes.labelsize':12,'axes.titlesize':16,'axes.titleweight':'normal','axes.unicode_minus':False,'pdf.fonttype':42,'ps.fonttype':42,'axes.linewidth':.8,'xtick.direction':'out','ytick.direction':'out','savefig.facecolor':'white','text.color':'#17232d','axes.labelcolor':'#17232d','xtick.color':'#17232d','ytick.color':'#17232d'})
colors=['#355C7D','#397A94','#3C9B91','#A89B52','#CC8150','#AC4F54']
BLUE='#225F88';RED='#B34A42';TEAL='#2A8B82';INK='#17232d'
def base(title,note='',projection=None):
    fig=plt.figure(figsize=(11.69,8.27),facecolor='white')
    ax=fig.add_axes([.11,.18,.76,.64],projection=projection)
    fig.text(.07,.94,title,fontsize=20,ha='left',va='top')
    fig.text(.07,.885,note,fontsize=10.5,ha='left',va='top',color='#334550')
    return fig,ax
def clean(ax,grid=True):
    ax.spines[['top','right']].set_visible(False)
    if grid:ax.grid(axis='y',color='#D9E1E5',linewidth=.6,zorder=0)
    ax.set_axisbelow(True)
def save(fig,n,caption):
    fig.text(.07,.105,caption,fontsize=10,color=INK,ha='left',va='center')
    fig.savefig(W/f'fig{n}.png',dpi=300);plt.close(fig)
def binned(ax,values):
    xs=[];med=[];lo=[];hi=[]
    for a,b in zip(range(0,16,2),range(2,18,2)):
        m=(d>=a)&(d<b)
        xs.append(d[m].mean());med.append(np.median(values[m]));lo.append(np.quantile(values[m],.25));hi.append(np.quantile(values[m],.75))
    ax.fill_between(xs,lo,hi,color=BLUE,alpha=.15,label='各距离段四分位区间')
    ax.plot(xs,med,'o-',color=BLUE,lw=1.8,ms=5,label='各距离段中位数')

fig,ax=base('三维参考位置与实测输出','空心圆：参考位置 | 实心点：实测输出 | 连线：逐点位置偏差',projection='3d')
for p,q in zip(P,Q):ax.plot(*np.vstack([p,q]).T,color='#88949C',lw=.35,alpha=.4)
for rad,col in zip(radii,colors):
    m=rho==rad
    ax.scatter(*P[m].T,s=21,facecolors='none',edgecolors=col,lw=.65,alpha=.9,depthshade=False)
    ax.scatter(*Q[m].T,s=12,color=col,alpha=.95,depthshade=False,label=f'ρ = {rad} m')
ax.scatter([-1,1],[0,0],[0,0],marker='^',s=55,color=INK)
ax.set(xlabel='x / m',ylabel='y / m',zlabel='z / m',xlim=(-13,13),ylim=(-13,13),zlim=(0,14))
ax.set_box_aspect((26,26,14));ax.view_init(elev=25,azim=-55)
ax.legend(loc='upper left',bbox_to_anchor=(1,.95),frameon=False,fontsize=9)
ax.xaxis.pane.fill=False;ax.yaxis.pane.fill=False;ax.zaxis.pane.fill=False
for axis in [ax.xaxis,ax.yaxis,ax.zaxis]:axis._axinfo['grid'].update(color='#DCE3E7',linewidth=.55)
save(fig,37,'显示全部360组位置及其连线；颜色表示水平圆环半径。')
sites=[]
for rad in radii:
    xy=np.unique(P[rho==rad,:2],axis=0)
    xy=sorted(xy,key=lambda a:np.arctan2(a[1],a[0])%(2*np.pi))
    for x,y in xy:
        m=(P[:,0]==x)&(P[:,1]==y);assert m.sum()==5
        sites.append((x,y,rad,np.rad2deg(np.arctan2(y,x))%360,angle[m].mean(),dz[m].mean()))
S=np.array(sites);assert S.shape==(72,6)
fig,ax=base('水平布点上的空间角度误差','每个圆点汇总同一水平位置的5个高度；颜色为平均三维夹角')
for rad in radii:ax.add_patch(plt.Circle((0,0),rad,fill=False,color='#CFD9DE',lw=.7))
sc=ax.scatter(S[:,0],S[:,1],c=S[:,4],s=85,cmap='viridis',edgecolors='white',lw=.7,zorder=3)
ax.plot([-1,1],[0,0],color=INK,lw=2);ax.scatter([-1,1],[0,0],marker='^',color=INK,s=40,zorder=4)
ax.annotate('双阵列基线',(1,0),(2,1.4),arrowprops={'arrowstyle':'-','lw':.7},fontsize=10,bbox={'facecolor':'white','edgecolor':'none','pad':1.5})
ax.axhline(0,color='#CAD3D9',lw=.6);ax.axvline(0,color='#CAD3D9',lw=.6)
ax.set(xlabel='x / m',ylabel='y / m',xlim=(-12,12),ylim=(-12,12),aspect='equal');clean(ax,False)
cb=fig.colorbar(sc,ax=ax,pad=.04,shrink=.85);cb.set_label('平均空间角度误差 / °')
save(fig,38,'72个位置均纳入全部5个高度；各点显示对应位置的实测误差均值。')
for n,v,title,ylab in [(39,angle,'空间角度误差随三维距离的变化','空间角度误差 / °'),(40,distance,'空间距离误差随三维距离的变化','空间距离误差 / m')]:
    fig,ax=base(title,'淡色圆点：未标记样本 | 红色菱形：12个标记样本 | 带状区域：分段四分位区间')
    ax.scatter(d[~broad],v[~broad],s=23,color=TEAL,alpha=.48,edgecolors='none',label='348个未标记样本')
    ax.scatter(d[broad],v[broad],s=46,marker='D',color=RED,edgecolors='white',lw=.5,label='12个标记样本',zorder=5)
    binned(ax,v);ax.set(xlabel='参考位置至双阵列中点的三维距离 d / m',ylabel=ylab,xlim=(0,16),ylim=(0,v.max()*1.1));clean(ax)
    # The DOCX already contains the matching editable legend above the plot.
    save(fig,n,'分组统计包含全部360点；红色标记按全样本位置误差的Q3 + 1.5×IQR上界确定。')
jit=np.random.default_rng(131)
for n,v,title,ylab in [(41,angle,'各水平圆环的角度误差分布','空间角度误差 / °'),(42,distance,'各水平圆环的位置误差分布','空间距离误差 / m')]:
    fig,ax=base(title,'每圈60点；箱体为四分位区间，中线为中位数，须线采用1.5倍四分位距')
    groups=[v[rho==r] for r in radii]
    bp=ax.boxplot(groups,positions=np.arange(6),widths=.5,patch_artist=True,showfliers=False,medianprops={'color':INK,'lw':1.5},whiskerprops={'color':INK,'lw':.8},capprops={'color':INK,'lw':.8})
    for patch,col in zip(bp['boxes'],colors):patch.set(facecolor=col,alpha=.24,edgecolor=col)
    for i,(rad,col) in enumerate(zip(radii,colors)):
        m=rho==rad;x=i+jit.uniform(-.2,.2,m.sum());vals=v[m];wide=broad[m]
        ax.scatter(x[~wide],vals[~wide],s=13,color=col,alpha=.65,zorder=3)
        ax.scatter(x[wide],vals[wide],s=36,color=RED,marker='D',zorder=4)
    ax.set_xticks(np.arange(6),[f'{r}' for r in radii]);ax.set(xlabel='水平圆环半径 ρ / m',ylabel=ylab,ylim=(0,v.max()*1.1));clean(ax)
    # The DOCX's editable legend identifies the marked samples.
    save(fig,n,'全部样本参与箱体统计；红色标记沿用图39的全局规则，与各圈箱线须线分别定义。')
fig,ax=base('高度误差在距离与高度上的分布','色块：平均|Δz| | 格内第二行：该单元样本数n | 所有单元共计360点')
means=np.array([g['mae'] for g in stats['height_groups']]).reshape(4,6)
counts=np.array([g['n'] for g in stats['height_groups']]).reshape(4,6)
im=ax.imshow(means,origin='lower',aspect='auto',cmap='YlGnBu',extent=(-.5,5.5,-.5,3.5),vmin=0)
for i in range(4):
    for j in range(6):ax.text(j,i,f'{means[i,j]:.2f} m\nn = {counts[i,j]}',ha='center',va='center',color='white' if im.norm(means[i,j])>.58 else INK,fontsize=12,linespacing=1.6)
ax.set_xticks(range(6),radii);ax.set_yticks(range(4),['[1, 3)','[3, 5)','[5, 7)','[7, 10]'])
ax.set(xlabel='水平圆环半径 ρ / m',ylabel='参考高度区间 / m')
cb=fig.colorbar(im,ax=ax,pad=.04);cb.set_label('平均绝对高度误差 / m')
save(fig,43,'各组纳入全部样本；总体高度MAE为0.325 m，24组MAE范围为0.057～0.779 m。')
fig,ax=base('高度误差的方位分布','每点汇总5个高度；颜色表示平均|Δz|，径向坐标表示水平半径',projection='polar')
ax.set_theta_zero_location('E');ax.set_theta_direction(1)
sc=ax.scatter(np.deg2rad(S[:,3]),S[:,2],c=S[:,5],cmap='magma',s=90,edgecolor='white',lw=.7,zorder=3)
ax.set_ylim(0,12);ax.set_yticks(radii);ax.set_rlabel_position(75);ax.set_thetagrids(np.arange(0,360,30));ax.grid(color='#CAD3D9',lw=.6)
ax.plot([0,0],[0,12],color=INK,lw=1,ls='--');ax.plot([np.pi,np.pi],[0,12],color=INK,lw=1,ls='--')
cb=fig.colorbar(sc,ax=ax,pad=.12,shrink=.85);cb.set_label('平均绝对高度误差 / m')
save(fig,44,'0°与180°为基线延长方向；各水平位置的5条记录全部参与平均。')
fig,ax=base('参考高度与实测输出高度对比','灰色虚线：理想一致线z输出 = z参考 | 颜色：水平圆环半径')
for rad,col in zip(radii,colors):
    m=rho==rad;ax.scatter(P[m,2],Q[m,2],s=22,color=col,alpha=.75,label=f'{rad} m',edgecolors='none')
ax.scatter(P[broad,2],Q[broad,2],s=70,facecolors='none',edgecolors=RED,marker='D',lw=1)
lim=max(10.5,Q[:,2].max()+.4);ax.plot([0,lim],[0,lim],ls='--',color='#556773',lw=1)
ax.set(xlabel='参考高度 / m',ylabel='实测输出高度 / m',xlim=(0,lim),ylim=(0,lim),aspect='equal');clean(ax)
ax.legend(title='水平半径',frameon=False,bbox_to_anchor=(1.02,1),loc='upper left',fontsize=10)
save(fig,45,'红色空心菱形标出同一组12点；全部360点参与高度MAE及其他统计。')
montage=Image.new('RGB',(1800,1365),'white')
for k,n in enumerate(range(37,46)):
    im=Image.open(W/f'fig{n}.png');assert im.size==(3507,2481)
    im.thumbnail((600,425));tile=Image.new('RGB',(600,455),'white');tile.paste(im,((600-im.width)//2,25));ImageDraw.Draw(tile).text((5,5),f'Figure {n}',fill='black');montage.paste(tile,((k%3)*600,(k//3)*455))
montage.save(W/'new_montage.png')
print('Generated figures 37–45 from PDF coordinates; all 360 rows included.')
