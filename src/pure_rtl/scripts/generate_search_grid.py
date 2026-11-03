from pathlib import Path
import math,json
def make_grid(c):
 H,V=c['horizontal_mm'],c['vertical_mm'];pts=set()
 radii=[300,500,750,1000,1250,1500,2000,2500,3000,4000,5000,6000,8000,10000,12000,15000,18000,20000,24000]
 if c['profile']=='hover':radii=[150,250,400,600,800,1000,1250,1500,1750,2000,2500,3000,4000,5000,6000,8000,10000,12000,15000,18000,21000]
 for el in range(0,91,c['elstep']):
  se,ce=math.sin(math.radians(el)),math.cos(math.radians(el));limit=min(H/max(ce,1e-15),V/max(se,1e-15))
  for az in range(0,360,c['azstep']):
   ca,sa=math.cos(math.radians(az)),math.sin(math.radians(az))
   for r in radii+[limit]:
    if r>limit+.01:continue
    x,y,z=round(r*ce*ca),round(r*ce*sa),min(V,round(r*se))
    # Keep rounded boundary points inside the exact cylindrical domain.
    while x*x+y*y>H*H:
     if abs(x)>=abs(y):x-=1 if x>0 else -1
     else:y-=1 if y>0 else -1
    pts.add((x,y,z))
 return sorted(pts)
if __name__=="__main__":
 root=Path(__file__).resolve().parents[2]
 cfg=json.loads((root/"variant.json").read_text("utf-8"))
 pts=make_grid(cfg)
 assert len(pts)==cfg["grid_points"]
 target=root/"pure_rtl/rom/r19_grid.mem"
 target.write_text("".join(f"{((x&65535)<<32)|((y&65535)<<16)|(z&65535):012x}\n" for x,y,z in pts),"ascii")
 print("GRID_GENERATED",len(pts),target)
