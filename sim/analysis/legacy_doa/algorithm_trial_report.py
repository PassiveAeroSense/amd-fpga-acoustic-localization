"""Transparent retrospective algorithm benchmark: all failures, coverage and baselines retained."""
from dual_improved_doa import *
import csv,html,re,shutil,zipfile
from urllib.parse import quote,unquote
sys.path.insert(0,str(Path('tmp/ppt_rework/plot_packages').resolve()))
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
FIG=TROOT/'figures';FIG.mkdir(exist_ok=True)
GATE=json.loads((SOUT/'persistent_activity_gate.json').read_text(encoding='utf-8'))
BASE=json.loads(Path('data/analysis/dual_direction_20261024/direction_results.json').read_text(encoding='utf-8'))
TEAL='#087F8C';ORANGE='#D07643';RED='#B74650';GRAY='#7C8791'
plt.rcParams.update({'font.family':['Arial','Microsoft YaHei'],'font.size':10,'axes.unicode_minus':False,
 'axes.spines.top':False,'axes.spines.right':False,'axes.titlesize':11,'axes.titleweight':'bold',
 'figure.facecolor':'white','savefig.facecolor':'white','legend.fontsize':8})
def angle(u,v):return float(np.degrees(np.arccos(np.clip(np.dot(u,v),-1,1))))
def unit(p):return np.array(p)/np.linalg.norm(p)
def med(values):return float(np.median(values)) if len(values) else None
def nf(v):return '—' if v is None else f'{v:.2f}'
def clean(ax):ax.grid(alpha=.2,lw=.6);ax.set_axisbelow(True)
def save(fig,name):fig.savefig(FIG/name,dpi=210,bbox_inches='tight',pad_inches=.18);plt.close(fig)

def evaluate():
    recordings=[];summary=[];flat=[]
    for row in ROWS:
        i=row['id'];r=json.loads((SOUT/f'record_{i:02d}.json').read_text(encoding='utf-8'))
        assert r['source_sha256']==row['sha256']
        labels=row['nominal_xyz_m'];full=labels is not None and all(x is not None for x in labels)
        target=unit(labels) if full else None;statuses=apply_persistent_gate(r['frames'],GATE)
        for f,status in zip(r['frames'],statuses):
            f.update(status)
            if full:
                f['coarse_direction_deviation_deg']=angle(f['direction'],target)
                f['baseline_coarse_direction_deviation_deg']=angle(f['baseline']['direction'],target)
                if np.linalg.norm(labels[:2])>0:
                    az=angles(target)[0];f['coarse_azimuth_deviation_deg']=abs((f['angles_deg'][0]-az+180)%360-180)
                    f['baseline_coarse_azimuth_deviation_deg']=abs((f['baseline']['azimuth_deg']-az+180)%360-180)
            flat.append(dict(record_id=i,file=row['file'],split='development' if i in DEV else 'heldout' if i in HOLD else 'background_or_unlabelled',time_s=f['time_s'],
              output_valid=f['valid_direction'],output_azimuth_deg=f['angles_deg'][0] if f['valid_direction'] else None,
              output_elevation_deg=f['angles_deg'][1] if f['valid_direction'] else None,
              raw_azimuth_deg=f['angles_deg'][0],raw_elevation_deg=f['angles_deg'][1],
              baseline_azimuth_deg=f['baseline']['azimuth_deg'],baseline_elevation_deg=f['baseline']['elevation_deg'],
              activity_score=f['harmonic_evidence'],fundamental_hz=f['fundamental_hz'],frequency_split_disagreement_deg=f['frequency_split_disagreement_deg'],
              coarse_direction_deviation_deg=f.get('coarse_direction_deviation_deg'),baseline_coarse_direction_deviation_deg=f.get('baseline_coarse_direction_deviation_deg')))
        accepted=[f for f in r['frames'] if f['valid_direction']]
        s=dict(id=i,file=row['file'],split='development' if i in DEV else 'heldout' if i in HOLD else 'background_or_unlabelled',
          windows=len(r['frames']),output_windows=len(accepted),coverage_fraction=len(accepted)/len(r['frames']),
          candidate_direction_deviation_median_deg=med([f['coarse_direction_deviation_deg'] for f in r['frames']]) if full else None,
          baseline_all_deviation_median_deg=med([f['baseline_coarse_direction_deviation_deg'] for f in r['frames']]) if full else None,
          output_direction_deviation_median_deg=med([f['coarse_direction_deviation_deg'] for f in accepted]) if full else None,
          baseline_same_windows_deviation_median_deg=med([f['baseline_coarse_direction_deviation_deg'] for f in accepted]) if full else None,
          output_azimuth_deviation_median_deg=med([f.get('coarse_azimuth_deviation_deg') for f in accepted]) if full and np.linalg.norm(labels[:2])>0 else None,
          output_elevation_median_deg=med([f['angles_deg'][1] for f in accepted]),compute_seconds=r['elapsed_compute_s'])
        recordings.append(r);summary.append(s)
    methods=[('old_srp','旧 120 对 SRP'),('raw_gevd','背景白化 MUSIC'),('cal_gevd','白化 MUSIC＋弱标注校正'),('cal_srp','谱峰 SRP＋校正'),('cal_norm','NormMUSIC＋校正'),('cal_harm','谐波 MUSIC＋校正')]
    aggregate=[]
    for key,name in methods:
        errors=[];azerrors=[]
        for i in HOLD:
            if key=='old_srp':v=BASE[i]['methods']['joint_120']['direction']
            else:
                fn=f'record_trial_{i:02d}.json' if key=='raw_gevd' else f'record_calibrated_v2_{i:02d}.json'
                method={'raw_gevd':'gevd_music','cal_gevd':'gevd_music','cal_srp':'spectral_srp','cal_norm':'normmusic','cal_harm':'harmonic_gevd'}[key]
                v=json.loads((TROOT/fn).read_text(encoding='utf-8'))['methods'][method]['joint_direction']['direction']
            p=np.array(ROWS[i]['nominal_xyz_m']);u=unit(p);errors.append(angle(v,u))
            if np.linalg.norm(p[:2])>0:azerrors.append(abs((angles(v)[0]-angles(u)[0]+180)%360-180))
        aggregate.append(dict(method=key,name=name,n=len(errors),median_coarse_direction_deviation_deg=float(np.median(errors)),mean_coarse_direction_deviation_deg=float(np.mean(errors)),
           median_coarse_azimuth_deviation_deg=float(np.median(azerrors)),within10_count=int(np.sum(np.array(errors)<=10)),errors=errors))
    bg=recordings[33]['frames'];split=GATE['background_split_time_s'];bgtest=[f for f in bg if f['time_s']-WINDOW/2>=split]
    check=dict(background_all_windows=len(bg),background_all_outputs=sum(f['valid_direction'] for f in bg),
               background_heldout_windows=len(bgtest),background_heldout_outputs=sum(f['valid_direction'] for f in bgtest),
               heldout_record_count=len(HOLD),heldout_output_records=sum(s['output_windows']>0 for s in summary if s['id'] in HOLD),
               heldout_windows=sum(s['windows'] for s in summary if s['id'] in HOLD),heldout_output_windows=sum(s['output_windows'] for s in summary if s['id'] in HOLD))
    for name,rows in [('改进算法_逐录音对照.csv',summary),('改进算法_逐时刻输出.csv',flat)]:
        with (TROOT/name).open('w',encoding='utf-8-sig',newline='') as f:
            writer=csv.DictWriter(f,fieldnames=rows[0]);writer.writeheader();writer.writerows(rows)
    result=dict(aggregate_holdout=aggregate,stream_record_summary=summary,gate_check=check,
      warning='All angular deviations use rough static file labels. They are NOT true dynamic tracking errors. Output coverage is not detection probability. Overlapping windows are not independent.')
    (TROOT/'final_benchmark.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    (TROOT/'final_stream_results.json').write_text(json.dumps(recordings,ensure_ascii=False,indent=2),encoding='utf-8')
    print('BENCHMARK',json.dumps(check,ensure_ascii=False),flush=True)
    return recordings,summary,aggregate,check

def figures(recordings,summary,aggregate):
    fig,axs=plt.subplots(1,2,figsize=(12.8,6.1));fig.subplots_adjust(left=.07,right=.98,top=.80,bottom=.29,wspace=.24)
    x=np.arange(len(aggregate));names=['Old SRP','GEVD','GEVD + cal','Spectral SRP','NormMUSIC','Harmonic GEVD']
    for ax,field,title in [(axs[0],'median_coarse_direction_deviation_deg','(a) Median nominal-direction deviation'),(axs[1],'mean_coarse_direction_deviation_deg','(b) Mean: serious failures remain')]:
        vals=[a[field] for a in aggregate];bars=ax.bar(x,vals,color=[GRAY,ORANGE,TEAL,GRAY,GRAY,GRAY],width=.65)
        ax.bar_label(bars,fmt='%.1f°',padding=4,fontsize=9);ax.set_xticks(x,names,rotation=30,ha='right');ax.set(ylabel='Angular deviation / °',title=title,ylim=(0,max(vals)*1.2));clean(ax)
    fig.suptitle('22 段留出录音：整段方向候选有改善，仍非真实轨迹精度',fontsize=17,weight='bold',y=.96)
    fig.text(.07,.875,'主候选：背景白化 GEVD-MUSIC＋通道相位/时延校正；所有失败样本参与统计。',fontsize=11)
    fig.text(.07,.08,'中位偏差 17.17° → 6.95°（约下降 59.5%）；平均偏差 37.91° → 28.84°（约下降 23.9%）。',fontsize=11)
    fig.text(.07,.03,'这是相对粗略静态标签的回顾性对照，包含弱信号方向候选；不代表这些候选均已检测到无人机。',fontsize=9,color=GRAY)
    save(fig,'01_record_heldout_comparison.png')
    ids=[9,27,23,22];fig,axs=plt.subplots(2,4,figsize=(14,7.4));fig.subplots_adjust(left=.06,right=.98,top=.80,bottom=.13,wspace=.24,hspace=.40)
    for c,i in enumerate(ids):
        r=recordings[i];s=summary[i];fs=r['frames'];t=np.array([q['time_s'] for q in fs]);valid=np.array([q['valid_direction'] for q in fs]);label=ROWS[i]['nominal_xyz_m'];truth=angles(unit(label))
        for row in [0,1]:
            ax=axs[row,c]
            if row==0 and label[:2]==[0.,0.]:
                old=[q['baseline_coarse_direction_deviation_deg'] for q in fs];new=[q['coarse_direction_deviation_deg'] for q in fs];true=0;title='Direction deviation / °'
            else:
                old=[q['baseline']['azimuth_deg'] if row==0 else q['baseline']['elevation_deg'] for q in fs];new=[q['angles_deg'][row] for q in fs];true=truth[row];title=('Azimuth / °','Elevation / °')[row]
                if row==0:
                    old=(np.array(old)-true+180)%360-180+true;new=(np.array(new)-true+180)%360-180+true
            ax.plot(t,old,color=GRAY,lw=.8,alpha=.8,label='Matched-window SRP')
            ax.plot(t,new,color=TEAL,lw=.9,alpha=.45,label='New raw candidate');ax.scatter(t[valid],np.array(new)[valid],color=TEAL,s=12,label='Output after gate')
            ax.axhline(true,color=ORANGE,ls='--',lw=.8,label='Coarse nominal reference')
            ax.set(xlabel='Time / s',ylabel=title)
            if row==1:ax.set_ylim(0,95)
            if row==0:ax.set_title(f"{ROWS[i]['file'].replace('.smq','')}\nOutput {s['output_windows']}/{s['windows']}",fontsize=10)
            clean(ax)
    axs[0,0].legend(fontsize=7,loc='upper right')
    fig.suptitle('同一时间窗对照：改善、漏输出和失败同时展示',fontsize=17,weight='bold',y=.97)
    fig.text(.06,.88,'0.75 s 分析窗，0.25 s 更新；未对角度做平滑。实心点才是通过声学活动与频段一致性检查的输出。',fontsize=10)
    fig.text(.06,.035,'正上方 10 m 为留出录音；水平 7 m 为开发录音。10 m 水平距离的两段仍无持续输出，不能声称量程已扩展。',fontsize=9,color=GRAY)
    save(fig,'02_time_resolved_comparison.png')
    fig,axs=plt.subplots(1,2,figsize=(12.8,6));fig.subplots_adjust(left=.08,right=.98,top=.81,bottom=.18,wspace=.25)
    ax=axs[0];i=np.arange(35);coverage=[s['coverage_fraction']*100 for s in summary]
    ax.bar(i,coverage,color=[TEAL if s['id'] in HOLD else ORANGE if s['id'] in DEV else GRAY for s in summary],width=.8)
    ax.set(xlabel='Recording ID (0-based, see report)',ylabel='Output coverage / %',ylim=(0,105),title='(a) Coverage over all 35 recordings');clean(ax)
    ax=axs[1];fs=recordings[33]['frames'];t=[q['time_s'] for q in fs]
    ax.plot(t,[q['harmonic_evidence'] for q in fs],color=GRAY,lw=1,label='Raw harmonic score')
    ax.axhline(GATE['threshold'],color=ORANGE,ls='--',lw=1,label='Activity floor')
    ax.axvline(GATE['background_split_time_s'],color='black',ls=':',label='Fit / held-out split')
    ax.set(xlabel='Background recording time / s',ylabel='Activity score / a.u.',title='(b) Background bursts included in fitting');ax.legend();clean(ax)
    fig.suptitle('不能只报“留下来的角度更准”：输出覆盖率必须一起报告',fontsize=17,weight='bold',y=.96)
    fig.text(.08,.88,'门控依据声学基频持续性，不要求方向保持不变；橙色为开发录音，青色为留出录音。',fontsize=10)
    fig.text(.08,.045,'本批环境音无最终输出，但只有一段背景录音，无法据此证明新场地、新日期或其他干扰下的虚警率。',fontsize=9,color=GRAY)
    save(fig,'03_coverage_and_background.png')
    for r,s in zip(recordings,summary):
        i=s['id'];fs=r['frames'];t=np.array([q['time_s'] for q in fs]);valid=np.array([q['valid_direction'] for q in fs]);nom=ROWS[i]['nominal_xyz_m'];known=nom is not None and all(x is not None for x in nom)
        azref=angles(unit(nom))[0] if known and np.linalg.norm(nom[:2])>0 else 180.
        fig,axs=plt.subplots(2,2,figsize=(12,7.8));fig.subplots_adjust(left=.075,right=.97,top=.84,bottom=.11,hspace=.38,wspace=.27)
        fig.suptitle(f"{i:02d}  {ROWS[i]['file']}  |  改进测向算法",fontsize=16,weight='bold',x=.075,ha='left',y=.97)
        fig.text(.075,.915,f"输出 {sum(valid)}/{len(valid)} 窗；相对粗略标称方向的同窗中位偏差：旧 {nf(s['baseline_same_windows_deviation_median_deg'])}° → 新 {nf(s['output_direction_deviation_median_deg'])}°。",fontsize=10)
        for j in range(2):
            ax=axs[0,j];old=np.array([q['baseline']['azimuth_deg' if j==0 else 'elevation_deg'] for q in fs]);new=np.array([q['angles_deg'][j] for q in fs])
            if j==0:old=(old-azref+180)%360-180+azref;new=(new-azref+180)%360-180+azref
            ax.plot(t,old,color=GRAY,lw=.8,label='Matched SRP baseline');ax.plot(t,new,color=TEAL,lw=.9,alpha=.45,label='New raw candidate');ax.scatter(t[valid],new[valid],s=14,color=TEAL,label='Final output')
            if known and (j==1 or np.linalg.norm(nom[:2])>0):ax.axhline(angles(unit(nom))[j],color=ORANGE,ls='--',lw=.8)
            ax.set(title=['(a) Azimuth candidates','(b) Elevation candidates'][j],xlabel='Time / s',ylabel=['Azimuth / °','Elevation / °'][j])
            if j==1:ax.set_ylim(0,95)
        axs[0,0].legend(fontsize=7,ncol=2)
        ax=axs[1,0];ax.plot(t,[q['fundamental_hz'] for q in fs],color=TEAL,lw=.9);ax.axhspan(279,323,color=ORANGE,alpha=.15);ax.set(title='(c) Audio-derived harmonic fundamental',xlabel='Time / s',ylabel='Fundamental candidate / Hz',ylim=(175,425))
        ax=axs[1,1];ax.plot(t,[q['frequency_split_disagreement_deg'] for q in fs],color=TEAL,lw=.9);ax.axhline(20,color=GRAY,ls='--');ax.set(title='(d) Independent frequency-subset agreement',xlabel='Time / s',ylabel='Direction disagreement / °',ylim=(0,180))
        for ax in axs.flat:clean(ax)
        fig.text(.075,.035,'实心点为最终输出；曲线保留未确认候选。天顶方位角无唯一真值。频段一致、通过门控均不等同于已确认无人机身份。',fontsize=9,color=GRAY)
        save(fig,f'record_{i:02d}.png')

def report(summary,aggregate,check):
    rows=[]
    for s in summary:
        vals=[str(s['id']),f'<a href="figures/record_{s["id"]:02d}.png">{html.escape(s["file"])}</a>','开发' if s['id'] in DEV else '留出' if s['id'] in HOLD else '其他',f"{s['output_windows']}/{s['windows']}",nf(s['baseline_same_windows_deviation_median_deg']),nf(s['output_direction_deviation_median_deg'])]
        rows.append('<tr>'+''.join('<td>'+v+'</td>' for v in vals)+'</tr>')
    compare=''.join(f'<tr><td>{a["name"]}</td><td>{a["median_coarse_direction_deviation_deg"]:.2f}°</td><td>{a["mean_coarse_direction_deviation_deg"]:.2f}°</td><td>{a["within10_count"]}/22</td></tr>' for a in aggregate)
    s9=summary[9];s27=summary[27]
    doc=rf'''<!doctype html><html lang="zh-CN"><meta charset="utf-8"><title>无人机测向算法改进实测</title><style>body{{font:16px/1.8 "Microsoft YaHei",Arial;color:#243746;background:#f3f5f6;max-width:1240px;margin:30px auto;padding:0 25px}}section{{background:white;padding:26px;margin:22px 0}}h1{{font-size:30px}}h2{{font-size:23px}}img{{width:100%}}a{{color:#007f8c}}table{{width:100%;border-collapse:collapse;font-size:14px}}td,th{{border-bottom:1px solid #dbe2e6;padding:9px;text-align:right}}td:nth-child(2),th:nth-child(2){{text-align:left}}th{{background:#eef2f4}}li{{margin:8px 0}}.note{{color:#657680}}pre{{white-space:pre-wrap;background:#eef2f4;padding:18px;font:14px/1.7 Consolas}}code{{font-family:Consolas}}</style>
    <h1>从普通 TDOA 到背景白化 MUSIC：实际试算与可运行原型</h1><p>2026-10-24 · 35 段录音 · 22 段回顾性留出对照 · 主输出：方位角＋俯仰角＋有效标记</p>
    <section><h2>这次实际改善了什么</h2><p><b>选择的方案是：环境噪声协方差白化 → 通道相位/时延校正 → 宽带 GEVD-MUSIC → 无人机谐波活动持续性门控。</b>没有对方向曲线做平滑来制造更稳定的视觉效果，也没有使用测试录音的标称坐标修正结果。</p><ul>
    <li>22 段留出录音，整段方向候选相对粗略标称方向的中位偏差：<b>17.17° → 6.95°</b>，下降约 59.5%；平均偏差：37.91° → 28.84°，下降约 23.9%。严重失败仍存在，不能只报中位数。</li>
    <li>逐时刻对照中，正上方 10 m（留出录音）输出 {s9['output_windows']}/{s9['windows']} 窗；在相同这些窗上，方向相对标称天顶的中位偏差 <b>{nf(s9['baseline_same_windows_deviation_median_deg'])}° → {nf(s9['output_direction_deviation_median_deg'])}°</b>，俯仰角中位数 {nf(s9['output_elevation_median_deg'])}°。</li>
    <li>水平 7 m、高度 1 m（开发录音）输出 {s27['output_windows']}/{s27['windows']} 窗；同窗方向偏差 {nf(s27['baseline_same_windows_deviation_median_deg'])}° → {nf(s27['output_direction_deviation_median_deg'])}°。此例不能作为独立留出验证。</li>
    <li>留出数据最终输出 {check['heldout_output_windows']}/{check['heldout_windows']} 个窗，覆盖 {check['heldout_output_records']}/22 段录音。弱信号和有歧义窗口会拒绝输出，不能把未输出算作正确。</li>
    <li>环境音留出的后段最终输出 {check['background_heldout_outputs']}/{check['background_heldout_windows']} 窗；整段为 {check['background_all_outputs']}/{check['background_all_windows']}。只有一段环境音，无法据此宣称普遍低虚警率。</li></ul>
    <p class="note"><b>以上不是动态真实角度误差：</b>无人机在飘动，xy 标签粗略，高度约 ±1 m。这里只能比较相同粗略参考下的偏差、同窗输出和声学一致性；严格轨迹精度仍需同步位置记录。整段候选中，弱信号时算出的角度也参与统计，但并不自动成为检测结果。</p></section>
    <section><h2>为什么采用这条算法路线</h2><p>普通 GCC-PHAT 会把多个频段的相关峰相加，容易让环境声、通道相关噪声和瞬态干扰争夺峰值。GEVD-MUSIC 先用环境音估计频率相关的 16×16 噪声协方差，再对白化后的信号协方差分解，通过阵列物理模型搜索方向。它利用了跨通道的相位结构与噪声相关性，不只是取一个最大时延峰。</p><p>另外，用 6 段开发录音的粗略坐标估计每通道一个相位项和一个时延项；这属于<b>弱标注校正</b>，不是精密仪器标定。校正参数对留出录音固定。校正本身的额外收益有限：不做该校正的白化 MUSIC 留出中位偏差为 7.25°，主要改善来自噪声处理和空间谱估计。</p><p>我同时试了谱峰加权 SRP、NormMUSIC、谐波加权 MUSIC、直接球面波 xyz 搜索，以及后续探索的三谐波声纹加权版本。没有找到能够在这批数据上普遍可靠输出 xyz 的版本，因此主程序<b>正式输出方向，不输出未经验证的距离</b>。某些球面波候选会跑到搜索范围边界，这些不能解释成测到了几百米。</p><p>没有训练 CNN 来回归 xyz：目前每段只有一个粗略位置标签，而段内在移动，把所有时间窗标为相同 xyz 会引入错误监督。已有的相位校正和声学基频范围学习使用了开发录音，但没有用测试坐标做预测。</p></section>
    <section><h2>整段算法对照</h2><table><tr><th>方法</th><th>中位方向偏差</th><th>平均方向偏差</th><th>整段偏差 ≤10°</th></tr>{compare}</table><img src="figures/01_record_heldout_comparison.png"><p>整段对照与逐窗对照用途不同：前者允许全段累计统计，不是实时结果；后者使用完全相同的 0.75 s 窗与 0.25 s 步长，并保留旧 SRP 原始候选，不按结果删除录音。</p></section>
    <section><h2>逐时刻输出和拒识</h2><img src="figures/02_time_resolved_comparison.png"><img src="figures/03_coverage_and_background.png"><p>门控从开发录音学出的基频中心为 301 Hz、半宽 22 Hz；声学活动门槛 {GATE['threshold']:.5f} 来自背景拟合段的分数中位数。最近 8 个窗口至少 6 个满足活动条件，并要求当前两个频率子集的方向相差 ≤20°，才输出角度。这是在抑制短时声学干扰，不是在要求无人机方向不变。</p><p>0.75 s 窗、0.25 s 步长。持续性检查需要 8 个窗口，启动需约 2.5 s 音频，不含读取和计算；不是无延迟的瞬时坐标。原型采用全局搜索和矩阵分解，尚未移植或验证 FPGA 实时性能。</p><p>当前仍有清楚的不足：0.5 m 极近距离不满足共同远场近似；水平 10 m 的某些录音没有持续输出；一些录音出现与标称区域相差很大的方向，无法仅靠现有标签区分真实移动与错误锁定。高处偶尔得到接近天顶的原始候选，也不等于已确认检测到无人机。<b>这次没有证据把可靠量程扩展到 120 m。</b></p></section>
    <section><h2>训练、留出和公平性</h2><p>开发录音 ID：{DEV}；留出 ID：{HOLD}。通道校正仅用 [0,4,8,24,28,29]；声纹基频范围仅用 [0,4,8,24,27,28,29]。噪声协方差与门控拟合使用环境音前 2/3，保留其中强瞬态；最后 1/3 用于背景对照。</p><p>这是<b>回顾性留出</b>：这批文件此前已经用于 TDOA 分析，不能包装成全新盲测。主方向方法选择与参数在新留出运行前记录于 frozen_selection.json；后续声纹探索单独记录，不将其结果混作预先固定的主方法。活动门控仅使用背景与开发声纹，不使用测试位置。重叠窗口不独立，未给出虚假的置信区间。</p></section>
    <section><h2>每段录音与图</h2><p>表中角度均为对粗略标称方向的偏差；新旧比较使用同一批最终输出窗。没有输出时不报告“准确率”。ID 为 0 起始编号。</p><div style="overflow:auto"><table><tr><th>ID</th><th>录音与图</th><th>划分</th><th>输出窗数</th><th>旧方案同窗偏差</th><th>新方案同窗偏差</th></tr>{''.join(rows)}</table></div></section>
    <section><h2>可运行程序与下一步</h2><p>程序在项目中：<code>tools/drone_eval/dual_improved_doa.py</code>，PowerShell 入口：<code>tools/drone_eval/运行改进测向.ps1</code>。在项目根目录运行：</p>
    <pre>.\tools\drone_eval\运行改进测向.ps1 -Smq "D:\xiaobao\2026\03-麦克风阵列\data\daq\双阵列-夜间\0，0，10.smq"</pre>
    <p>结果存于 <code>data/analysis/algorithm_trials_20261024/stream/文件名_directions.json</code>。逐窗提供 time_s、angles_deg=[方位角,俯仰角]、valid_direction、声学分数与频段一致性。<b>valid_direction=false 时不要把原始候选显示为已定位目标。</b>当前程序针对这一套 16 通道、15 kHz、原阵列坐标和本次无人机声纹；换阵列、增益或无人机型号需要重新核对模型。</p>
    <p>下一步最有效的是用同一架无人机再录一批<b>独立的新数据</b>验证此固定版本：至少包含多个方位、5/10/15 m、纯环境音和非无人机干扰；同步保存飞控/视频轨迹。这样才能验证这次的方向改善是否泛化，再决定是否值得移植 FPGA，或是否需要用真实动态标签训练 CNN。</p>
    <p><a href="改进算法_逐录音对照.csv">逐录音对照 CSV</a> · <a href="改进算法_逐时刻输出.csv">逐时刻输出 CSV</a> · <a href="final_benchmark.json">完整统计 JSON</a> · <a href="final_stream_results.json">完整逐窗结果</a></p></section>
    <section><h2>方法依据</h2><p><a href="https://doi.org/10.1109/IROS.2013.6696920">GEVD-MUSIC 与噪声相关矩阵研究</a>支持利用噪声协方差改善有色噪声中的测向；<a href="https://pyroomacoustics.readthedocs.io/en/pypi-release/pyroomacoustics.doa.normmusic.html">NormMUSIC 官方文档</a>说明宽带频率归一化方法；<a href="https://journals.sagepub.com/doi/abs/10.1177/1475472X241259082">无人机谐波 SRP 研究</a>提供谐波选择的依据。本报告实现并非逐字复现这些论文，它们的精度数字没有当作本系统结果。</p></section></html>'''
    doc=doc.replace('<h2>整段算法对照</h2>', '<h2>整段算法对照</h2><p>此处“方向偏差”是三维单位方向之间的夹角，同时包含方位与俯仰。仅看非天顶录音的水平角，中位偏差为旧方案 7.64°、新方案 8.46°，并未整体改善；不能把三维方向的改善说成所有角度指标都改善。</p>')
    doc=doc.replace('<h2>可运行程序与下一步</h2>', '<h2>可运行程序与下一步</h2><p>方向以两个阵列的中点为参考。程序按 15 kHz、16 通道处理，并沿用相邻通道约 4.167 μs 的顺序扫描补偿假设；该假设尚未通过独立电学测量证实。声速取 343 m/s。通道校正属于弱标注估计，不能替代实际采样同步、相位响应和阵列姿态标定。部署前应核实这些模型条件。</p>')
    dest=TROOT/'无人机算法改进_实测对照报告.html';dest.write_text(doc,encoding='utf-8')
    for attr in re.findall(r'(?:href|src)="([^"]+)"',doc):
        if attr.startswith('http'):continue
        assert (TROOT/unquote(attr)).exists(),attr
    code=TROOT/'code';code.mkdir(exist_ok=True)
    for name in ['algorithm_trials.py','algorithm_calibrate.py','dual_improved_doa.py','algorithm_trial_report.py','dual_localize.py','dual_night.py','dual_direction_only.py','运行改进测向.ps1']:
        shutil.copy2(Path('tools/drone_eval')/name,code/name)
    shutil.copy2(Path('tools/smq_stream.py'),code/'smq_stream.py')
    print('REPORT',dest,flush=True)

if __name__=='__main__':
    r,s,a,c=evaluate();figures(r,s,a);report(s,a,c)
