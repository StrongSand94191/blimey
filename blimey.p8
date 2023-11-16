pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--blimey!
--by strongsand94191
function global(str)
local k,v=unpack(split(str,"="))
k,v=split(k),split(v)
for i=1,#k do
g=v[i]
g=g=="true" or g~="false" and g
_ENV[k[i]]=g
end
end
cartdata"strongsand94191_blimey"
function center_text(text,y,col)
print(text,64-#text*2,y,col)
end
function ssprline(x1,y1,x2,y2)
sspr(x1,y1,1,y2-y1,x1,y1)
end
function startsettings()
music"-1"
global "start_game_flash,start_game=50,true"
sfx"10"
end
function inttobinary(num,bits)
local bin=""
if bits==nil then bits=16 end
for i=1,bits do
bin=num %2\1 ..bin
num>>>=1
end
return bin
end
function binarytoint(t,reverse)
global "v=0"
l=#t
for i=l,1,-1 do
var=i-1
if reverse==nil then
var=l-i
end
v+=2^(var)*t[i]
end
return v
end
function submit_run()
add(lbr[tab],{output,flr(rtamin),flr(rtasec),minutes,seconds,deaths,frames})
hasntsubmitted[tab]=false
global"sub_mode,sel=0,1"
end
function count_time()
rtamin,rtasec,alextime=rtaminadd+alextime/60,rtasecadd+alextime%60,time()-tsubtractby
for i=1,flr(rtasec/60)do
rtasec-=60
rtamin+=1
end
end
function kinput()
if input~=_ then
if _0d then input=_ _0d=_ end
end
poke(24365,1)
if _0i then repeat k=stat(31)until k==""_0i=_ _0o=""_0s=0end
k,t=stat(31),_0o
center_text(t,43,7)
if k==chr(8)and t>""then
_0o=sub(t,1,#t-1)
elseif k==chr(13)then
poke(24368,1)
output,_0d,t=_0o,true
elseif k>=" "and k<="~"and#t<14then
_0o..=k
end
poke(24365,0)
t=nil
global"sub_mode,input=2"
end
function afterdraw()
memcpy(0,32768,8192)
local py=64-tc
for px=0,127do
local cval=px-(64-tc)
cval=cval/(tc*2)*2-1
if abs(cval)>1or tc==0then
ssprline(px,0,px,128)
else
cval=1-sqrt(1-cval*cval)
local ph=cval*tc
ssprline(px,0,px,py+ph)
ssprline(px,py+tc*2-ph,px,129)
end
end
reload(0,0,8192)
pal()
end
lbr={{},{},{},{}}
function init_leaderboard()
global "state,sel,tab,sub_mode,boardmin,cansubmit=2,1,1,0,1,false"
tbl=split"any%,100%,gemskip,secret"
if#lbr>9then global"boardmax=10"
else boardmax=#lbr end
end
function draw_leaderboard()
if sub_mode~=2then
cls(3)
if sub_mode==0then
?"❎ exit",2,121,7
if sel~=1then
?"🅾️ info",38,121,7
if cansubmit then
spr(103,73,119)
?"submit run",85,121,7
end
elseif cansubmit then
spr(103,38,119)
?"submit run",50,121,7
end
elseif sub_mode==1then
?"❎ back",2,121,7
end
if sel==1then
if tab~=1then
global "othertotal=2"
for i=1,4-(4-tab)-1do
othertotal+=#tbl[i]*4+4
end
rectfill(othertotal-1,1,othertotal+#tbl[tab]*4+1,9,0)
else
rectfill(1,1,19,9,0)
end
end
global "total=2"
for i=1,#tbl do
global "col=6"
if tab==i then global"col=7" end
rectfill(total,2,total+#tbl[i]*4,8,col)
print(tbl[i],total+1,3,0)
total+=#tbl[i]*4+4
end
if sel~=1then
rectfill(1,(sel-boardmin+1)*11-2,111,(sel-boardmin+1)*11-12,0)
end
global"total=0"
for i=boardmin,boardmax do
total+=11
rectfill(2,total,110,total+8,7)
global "lcol=7"
if i==1then global"lcol=10"
elseif i==2then global"lcol=6"
elseif i==3then global"lcol=9" end
rectfill(2,total,10,total+8,lcol)
print(i,5,total+2,0)
print(lbr[tab][i][2]..":"..two_digit_str(lbr[tab][i][3]),15,total+2,0) --erroneous line
print(lbr[tab][i][1],35+flr(tonum(lbr[tab][i][2])/10)*2,total+2,0)
end
if sub_mode==1then
if sel>4then rectfill(31,32,96,97,6)end
rectfill(32,33,95,96,0)
center_text(info[1],46,7)
center_text("rta: "..info[2]..":"..two_digit_str(info[3]),53,7)
center_text("igt: "..info[4]..":"..two_digit_str(info[5]),59,7)
center_text("deaths: "..info[6],65,7)
placestr=tostr(sel-1)
if sel==2then
pal(7,10)
pal(6,9)
elseif sel==4then
pal(7,9)
pal(6,4)
end
for n=1,#placestr do
spr(tonum(placestr[n])+128,60-(#placestr-(n-1)*2)*4-n,35)
end
if sel>8and sel<21then global "sprnum=183"
else
global "sprnum=63"
if tonum(placestr[#placestr])<4then
sprnum=55+tonum(placestr[#placestr])
end
end
spr(sprnum,60+#placestr*3,35)
sprray={}
if sel==2then sprray=split"40,40,62,62"
elseif sel==3then sprray=split"41,41,81,81"
elseif sel==4then sprray=split"61,61,42,42"end
for n=1,4do
for i=1,8do
global"xflip,yflip=false,false"
xval,yval=i*8+24,(n-2)*64-35
if n<3then
xval,yval=n*64-36,i*8+25
end
if i%2~=0then
if n>2then
global"yflip=true"
else
global"xflip=true"
end
end
spr(sprray[n],xval,yval,1,1,xflip,yflip)
end
end
end
elseif sub_mode==2then
cls()
kinput()
rectfill(20,50,108,50,7)
print(tbl[tab],2,115,5)
print(#_0o.."/14",2,121,5)
?"type the name you want to",15,10,7
?"see on the leaderboard",20,16,7
if _0d then
submit_run()
end
end
end
function update_leaderboard()
info,cansubmit=lbr[tab][sel-1],false
if sub_mode==0then
if btnp(⬆️)then sel-=1end
if btnp(⬇️)then sel+=1end
if sel<1then
sel,boardmin=#lbr[tab]+1,#lbr[tab]-9
if boardmin<1then global"boardmin=1" end
elseif sel>#lbr[tab]+1then
global "sel,boardmin=1,1"
elseif sel>boardmax+1then
boardmin=sel-10
elseif sel<boardmin+1and sel~=1then
boardmin=sel-1
end
if btnp(⬅️)then tab-=1 global"sel,boardmin=1,1"end
if btnp(➡️)then tab+=1 global"sel,boardmin=1,1" end
if tab<1then tab=#tbl
elseif tab>#tbl then global"tab=1" end
if not loaded and hasntsubmitted[tab]then
if tab==1or tab==2and fruit_count==10 or tab==3and max_djump==1then global"cansubmit=true" end --max fruit
end
if btnp(❎)then global"state,menubuffer=0,5" end
if btnp(🅾️)and sel~=1then global"sub_mode=1" end
poke(24368,1)
if btnp()==64and cansubmit then
_0d,_0o=nil,""
kinput()
global "input,sub_mode=,2"
boardmax=9+boardmin
end
if boardmin<9then boardmax=count(lbr[tab])end
elseif sub_mode==1then
if btnp(❎)then global"sub_mode=0" poke(24365,1)end
end
end
function load_binary(location)
return tonum(sub(tostr(inttobinary(peek(0x5e00))),location,location))
end
function save_game(manualsave)
dset(2,binarytoint(tostr(inttobinary(fruit_count,6))..tostr(inttobinary(lvl_id,6))),1)
dset(3,binarytoint(tostr(inttobinary(flr(rtasec),6))..tostr(inttobinary(flr(seconds),6))),1)
dset(4,deaths)
dset(5,flr(rtamin))
dset(6,flr(minutes))

printstr2=""
for i=13,16 do
printstr2..=load_binary(i)
end
printstr2=printstr2..fsid..(max_djump-1)..load_binary(10)
poke(0x5e00,binarytoint(printstr2))

end
function lerp(startv,endv,per)
return startv+per*(endv-startv)
end
function update_cursor()
if btnp(2)then msel-=1cx=mx end
if btnp(3)then msel+=1cx=mx end
if btnp(4)and moptions[msel]~="default menu"then cx=mx end
if btnp()==64then cx=mx end
if msel>mamt then global"msel=1" end
if msel<=0then msel=mamt end
mshortcut=moptions[msel]
cx=lerp(cx,mx+5,.5)
end
function mo(arg1,arg2,arg3)
if arg2==nil then
global"argy=0"
elseif arg3==nil then
global"argy=3"
else
global"argy=6"
end
rectfill(21,88-argy,105,102+argy,6)
rectfill(22,89-argy,104,101+argy,5)
if arg2==nil then
center_text(arg1,93,7)
elseif arg3==nil then
center_text(arg1,90,7)
center_text(arg2,96,7)
else
center_text(arg1,87,7)
center_text(arg2,93,7)
center_text(arg3,99,7)
end
end
function draw_menu()
mshortcut=moptions[msel]
cls(3)
for i=1,mamt do
oset,selx,printcolor=i*8,mx,7
if i==msel then
global "printcolor,selcolor=3,7"
selx=cx+1
if sub_mode==1then
global"selcolor=8"
if mshortcut=="hair flash"and h_f or mshortcut=="fast dash"and f_d or mshortcut=="speedrun mode"and sp_m or mshortcut=="autosave"and autosave then global"selcolor=11" end
end
rectfill(cx,my+oset-1,cx+#mshortcut*4,my+oset+5,selcolor)
end
print(moptions[i],selx,my+oset,printcolor)
draw_time(4,4)
if sub_mode==1then
?"❎ back  🅾️ toggle",4,120,7
else
?"❎ exit",4,120,7
if mshortcut~="default menu"then
?"🅾️ select",40,120,7
end
end
if mshortcut=="default menu"then
mo("press pause to open","the built-in menu")
elseif mshortcut=="save"then
mo("copy your game file","to the clipboard")
elseif mshortcut=="resume"then
mo"resume the game"
elseif mshortcut=="options"then
mo"mod-specific options"
elseif mshortcut=="fast dash"then
mo("removes freeze","frames on dash")
elseif mshortcut=="hair flash"then
mo("if disabled, double","dash hair is pink","instead of flashy")
elseif mshortcut=="speedrun mode"then
mo"shows rta and igt"
elseif mshortcut=="autosave"then
mo("automatically","saves the game")
elseif mshortcut=="load save"then
mo("loads a file","from cart data")
end
end
end
function init_menu()
global "mx,my,mamt,msel,sub_mode,menu_timer=8,40,0,1,0,0"
m,cx,moptions={},mx,split"resume,options,load save,default menu"
if title_screen==0then
moptions[3]="save"
end
for i in all(moptions)do
mamt+=1
end
end
function update_menu()
update_cursor()
if sub_mode==0then
if mshortcut=="default menu"then poke(24368,0)end
if btnp(4)or btnp()==64and menu_timer>1then
if mshortcut=="resume"or btnp(5)then
poke(24368,1)
global "state,menubuffer=0,5"
elseif mshortcut=="options"then
poke(24368,1)
init_settings()
elseif mshortcut=="save"then
poke(24368,1)
local settings,vars={},{f_d,h_f,sp_m,autosave}
for i=1,4do
settings[i]="0"
if vars[i]then settings[i]="1"end
end
local printstr,vars="",{settings[4],max_djump-1,settings[1],settings[2],settings[3],deaths,flr(rtamin),flr(rtasec),flr(minutes),flr(seconds),lvl_id,fruit_count}
for i=1,12do
printstr..=vars[i].."."
end
printh(printstr..fsid,"@clip")
psfx"6"
elseif mshortcut=="load save"then
poke(24368,1)
global "state,menubuffer,title_screen,start_game_flash,start_game,loaded=0,5,2,50,true,true"
fsid,max_djump,level_loader,fruit_count,rtasecadd,secadd,deaths,rtaminadd,minadd=load_binary(11),load_binary(12)+1,tonum(binarytoint(sub(tostr(inttobinary(dget(2))),11,16))),tonum(binarytoint(sub(tostr(inttobinary(dget(2))),5,10))),tonum(binarytoint(sub(tostr(inttobinary(dget(3))),5,10))),tonum(binarytoint(sub(tostr(inttobinary(dget(3))),11,16))),dget(4),dget(5),dget(5)
startsettings()
end
elseif btnp(5)then
global "state,menubuffer=0,5"
end
end
if sub_mode==1then update_settings()end
menu_timer+=1
end
function init_settings()
global "settingsbuffer,msel,mamt,sub_mode,menu_timer=5,1,0,1,0"
moptions=split"fast dash,hair flash,speedrun mode,autosave"
for i in all(moptions)do
mamt+=1
end
end
function update_settings()
if settingsbuffer>0then
settingsbuffer-=1
end
if btnp(5)then init_menu()end
if btnp(4)or btnp()==64and menu_timer>1then
poke(24368,1)
if mshortcut=="hair flash"then
h_f=not h_f
elseif mshortcut=="fast dash"and settingsbuffer==0then
f_d=not f_d
elseif mshortcut=="speedrun mode"then
sp_m=not sp_m
elseif mshortcut=="autosave"then
autosave=not autosave
end
printstr2=""
local vars={f_d,h_f,sp_m,autosave}
for i=1,4do
if vars[i]then printstr2..="1"
else printstr2..="0"
end
end
poke(0x5e00,binarytoint(printstr2..load_binary(12)..load_binary(11)..1))
end
end
function vector(x,y)
return{x=x,y=y}
end
function rectangle(x,y,w,h)
return{x=x,y=y,w=w,h=h}
end
function _init()
if load_binary(10)==1 then

global "f_d,h_f,sp_m,autosave=false,false,false,false"

if load_binary(16)==1 then global "f_d=true" end
if load_binary(15)==1 then global "h_f=true" end
if load_binary(14)==1 then global "sp_m=true" end
if load_binary(13)==1 then global "autosave=true" end

end
objects,hasntsubmitted={},{true,true,true,true}
global "frames,start_game_flash,lvl_id,state,startmusic,lvl_id,alextime,freeze,delay_restart,sfx_timer,ui_timer,draw_x,draw_y,cam_x,cam_y,cam_spdx,cam_spdy,cam_gain,temp,starting,titlecircle,title_screen,sp_m,h_f,f_d,state,minutes,seconds,deaths,fruit_count,stopcounting,menubuffer,settingsbuffer,rtasecadd,rtaminadd,minadd,secadd,level_loader,fsid,loaded,errormessage,max_djump,autosave,save_file=0,0,0,0,true,0,0,0,0,0,-99,0,0,0,0,0,0,.25,26,false,0,1,false,false,true,0,0,0,0,0,false,0,0,0,0,0,0,1,0,false,0,1,true,"
music(40,0,7)
end
function begin_game()
global "frames,seconds,minutes,time_ticking,bg_col,cloud_col=0,0,0,true,0,1"
minutes+=minadd
seconds+=secadd
load_level(level_loader)
tsubtractby=time()
global"title_screen=0"
end
function is_title()
return lvl_id==0
end
clouds={}
for i=0,16do
add(clouds,{
x=rnd"128",
y=rnd"128",
spd=1+rnd"4",
w=32+rnd"32"})
end
particles={}
for i=0,24do
add(particles,{
x=rnd"128",
y=rnd"128",
s=flr(rnd"1.25"),
spd=.25+rnd"5",
off=rnd(),
c=6+rnd"2"
})
end
dead_particles={}
player={
layer=2,
init=function(this)
this.grace,this.jbuffer,this.djump,this.dash_time,this.dash_effect_time,this.dash_target_x,this.dash_target_y,this.dash_accel_x,this.dash_accel_y,this.hitbox,this.spr_off,this.collides=0,0,max_djump,0,0,0,0,0,0,rectangle(1,3,6,5),0,true
create_hair(this)
end,
update=function(this)
if pause_player then
return
end
local h_input=btn(➡️)and 1or btn(⬅️)and-1or 0
if spikes_at(this.left(),this.top(),this.right(),this.bottom(),this.spd.x,this.spd.y)or this.y>lvl_ph then
kill_player(this)
end
local on_ground=this.is_solid(0,1)
if on_ground and not this.was_on_ground then
this.init_smoke(0,4)
end
local jump,dash=btn(🅾️)and not this.p_jump,btn(❎)and not this.p_dash
this.p_jump,this.p_dash=btn(🅾️),btn(❎)
if jump and menubuffer==0then
this.jbuffer=4
elseif this.jbuffer>0then
this.jbuffer-=1
end
if on_ground then
this.grace=6
if this.djump<max_djump then
psfx"12"
this.djump=max_djump
end
elseif this.grace>0then
this.grace-=1
end
this.dash_effect_time-=1
if this.dash_time==0and hasdashed then candestroy=true end
if this.dash_time>0then
this.init_smoke()
this.dash_time-=1
this.spd=vector(appr(this.spd.x,this.dash_target_x,this.dash_accel_x),appr(this.spd.y,this.dash_target_y,this.dash_accel_y))
else
local maxrun,accel,deccel=1,this.is_ice(0,1)and.05or on_ground and.6or.4,.15
this.spd.x=abs(this.spd.x)<=1and
appr(this.spd.x,h_input*maxrun,accel)or
appr(this.spd.x,sign(this.spd.x)*maxrun,deccel)
if this.spd.x~=0then
this.flip.x=this.spd.x<0
end
local maxfall=2
if h_input~=0and this.is_solid(h_input,0)and not this.is_ice(h_input,0)then
maxfall=.4
if rnd"10"<2then
this.init_smoke(h_input*6)
end
end
if not on_ground then
this.spd.y=appr(this.spd.y,maxfall,abs(this.spd.y)>.15and.21or.105)
end
if this.jbuffer>0then
if this.grace>0then
psfx"1"
this.jbuffer,this.grace,this.spd.y=0,0,-2
this.init_smoke(0,4)
else
local wall_dir=this.is_solid(-3,0)and-1or this.is_solid(3,0)and 1or 0
if wall_dir~=0then
psfx"2"
this.spd,this.jbuffer=vector(wall_dir*(-1-maxrun),-2),0
if not this.is_ice(wall_dir*3,0)then
this.init_smoke(wall_dir*6)
end
end
end
end
global "d_full,d_half=5,3.53553"
if this.djump>0and dash and menubuffer==0then
this.init_smoke()
this.djump-=1
this.dash_time,has_dashed,this.dash_effect_time=4,true,10
local v_input=btn(⬆️)and-1or btn(⬇️)and 1or 0
this.spd=vector(h_input~=0and
h_input*(v_input~=0and d_half or d_full)or
(v_input~=0and 0or this.flip.x and-1or 1)
,v_input~=0and v_input*(h_input~=0and d_half or d_full)or 0)
psfx"3"
if not f_d then
global"freeze=1"
end
this.dash_target_x,this.dash_target_y,this.dash_accel_x,this.dash_accel_y=2*sign(this.spd.x),(this.spd.y>=0and 2or 1.5)*sign(this.spd.y),this.spd.y==0and 1.5or 1.06066,this.spd.x==0and 1.5or 1.06066
elseif this.djump<=0and dash then
psfx"9"
this.init_smoke()
end
end
this.spr_off+=.25
this.spr=not on_ground and(this.is_solid(h_input,0)and 5or 3)or
btn(⬇️)and 6or
btn(⬆️)and 7or
this.spd.x~=0and h_input~=0and 1+this.spr_off%4or 1
if this.y<-4and levels[lvl_id+1]then
next_level()
end
this.was_on_ground=on_ground
end,
draw=function(this)
local clamped=mid(this.x,-1,lvl_pw-7)
if this.x~=clamped then
this.x,this.spd.x=clamped,0
end
set_hair_color(this.djump)
draw_hair(this)
draw_obj_sprite(this)
pal()
end
}
function create_hair(obj)
obj.hair={}
for i=1,5do
add(obj.hair,vector(obj.x,obj.y))
end
end
function set_hair_color(djump)
global "flashy=14"
if h_f then
flashy=7+frames\3%2*4
end
pal(8,djump==1and 8or djump==2and flashy or 12)
end
function draw_hair(obj)
local last=vector(obj.x+(obj.flip.x and 6or 2),obj.y+(btn(⬇️)and 4or 3))
for i,h in ipairs(obj.hair)do
h.x+=(last.x-h.x)/1.5
h.y+=(last.y+.5-h.y)/1.5
circfill(h.x,h.y,mid(4-i,1,2),8)
last=h
end
end
player_spawn={
layer=2,
init=function(this)
sfx"4"
this.spr,this.target,this.y,cam_x,cam_y,this.spd.y,this.state,this.delay,this.djump=3,this.y,min(this.y+48,lvl_ph),mid(this.x+4,64,lvl_pw-64),mid(this.y,64,lvl_ph-64),-4,0,0,max_djump
create_hair(this)
end,
update=function(this)
if this.state==0and this.y<this.target+16then
this.state,this.delay=1,3
elseif this.state==1then
this.spd.y+=.5
if this.spd.y>0then
if this.delay>0then
this.spd.y=0
this.delay-=1
elseif this.y>this.target then
this.state,this.delay,this.y,this.spd=2,5,this.target,vector(0,0)
this.init_smoke(0,4)
sfx"5"
end
end
elseif this.state==2then
this.delay-=1
this.spr=6
if this.delay<0then
destroy_object(this)
init_object(player,this.x,this.y)
if startmusic then
music"0"
global"startmusic=false"
end
end
end
end,
draw=player.draw
}
spring={
init=function(this)
this.hide_in,this.hide_for=0,00
end,
update=function(this)
if this.hide_for>0then
this.hide_for-=1
if this.hide_for<=0then
this.spr,this.delay=113,0
end
elseif this.spr==113then
local hit=this.player_here()
if hit and hit.spd.y>=0then
this.spr,hit.y,hit.spd.y,hit.djump,this.delay=19,this.y-4,-3,max_djump,10
hit.spd.x*=.2
this.init_smoke()
break_fall_floor(this.check(fall_floor,0,1)or{})
psfx"8"
end
elseif this.delay>0then
this.delay-=1
if this.delay<=0then
this.spr=113
end
end
if this.hide_in>0then
this.hide_in-=1
if this.hide_in<=0then
this.hide_for,this.spr=60,0
end
end
end
}
balloon={
init=function(this)
if lvl_id==8and this.y~=16then
this.x+=4
this.y-=12
end
this.offset,this.start,this.timer,this.hitbox=0,this.y,0,rectangle(-1,-1,10,10)
end,
update=function(this)
if this.spr==22or this.spr==26then
this.y=this.start+sin(this.offset)*2
local hit=this.player_here()
if hit and hit.djump<max_djump then
psfx"6"
this.init_smoke()
hit.djump,this.timer=max_djump,60
if this.spr==22then
this.spr=21
else
global "candestroy=true"
end
end
if this.spr==22and candestroy then
this.init_smoke()
destroy_object(this)
end
elseif this.timer>0then
this.timer-=1
else
psfx"7"
this.init_smoke()
this.spr=22
end
end,
draw=function(this)
if this.spr==22or this.spr==21then
draw_obj_sprite(this)
end
end
}
fall_floor={
init=function(this)
this.solid_obj,this.state=true,0
end,
update=function(this)
if this.state==0then
for i=0,2do
if this.check(player,i-1,-(i%2))then
break_fall_floor(this)
end
end
elseif this.state==1then
this.delay-=1
if this.delay<=0then
this.state,this.delay,this.collideable=2,60,false
end
elseif this.state==2then
this.delay-=1
if this.delay<=0and not this.player_here()then
psfx"7"
this.state,this.collideable=0,true
this.init_smoke()
end
end
end,
draw=function(this)
spr(this.state==1and 26-this.delay/5or this.state==0and 23,this.x,this.y)
end
}
function break_fall_floor(obj)
if obj.state==0then
psfx"15"
obj.state,obj.delay=1,15
obj.init_smoke();
(obj.check(spring,0,-1)or{}).hide_in=15
end
end
smoke={
layer=3,
init=function(this)
this.spd,this.flip=vector(.3+rnd"0.2",-.1),vector(rnd()<.5,rnd()<.5)
this.x+=-1+rnd"2"
this.y+=-1+rnd"2"
end,
update=function(this)
this.spr+=.2
if this.spr>=32then
destroy_object(this)
end
end
}
fruit={
check_fruit=true,
init=function(this)
this.start=this.y
end,
update=function(this)
this.spr=13+flr(frames/5)
draw_obj_sprite(this)
check_fruit(this)
end
}
fly_fruit={
check_fruit=true,
init=function(this)
this.start,this.step,this.sfx_delay=this.y,.5,8
end,
update=function(this)
if has_dashed then
if this.sfx_delay>0then
this.sfx_delay-=1
if this.sfx_delay<=0then
global"sfx_timer=20"
sfx"14"
end
end
this.spd.y=appr(this.spd.y,-3.5,.25)
if this.y<-16then
destroy_object(this)
end
else
this.step+=.05
end
check_fruit(this)
end,
draw=function(this)
spr(13,this.x,this.y)
for ox=-6,6,12do
spr((has_dashed or sin(this.step)>=0)and 45or this.y>this.start and 47or 46,this.x+ox,this.y-2,1,1,ox==-6)
end
end
}
function check_fruit(this)
local hit=this.player_here()
if hit then
hit.djump=max_djump
global "sfx_timer,fsid=20,1"
sfx"13"
init_object(lifeup,this.x,this.y)
destroy_object(this)
if time_ticking then
fruit_count+=1
end
save_game()
end
end
lifeup={
init=function(this)
this.spd.y,this.duration,this.flash=-.25,30,0
end,
update=function(this)
this.duration-=1
if this.duration<=0then
destroy_object(this)
end
end,
draw=function(this)
this.flash+=.5
?"1000",this.x-4,this.y-4,7+this.flash%2
end
}
fake_wall={
check_fruit=true,
init=function(this)
this.solid_obj,this.hitbox=true,rectangle(0,0,16,16)
end,
update=function(this)
this.hitbox=rectangle(-1,-1,18,18)
local hit=this.player_here()
if hit and hit.dash_effect_time>0then
hit.spd,hit.dash_time=vector(sign(hit.spd.x)*-1.5,-1.5),-1
for ox=0,8,8do
for oy=0,8,8do
this.init_smoke(ox,oy)
end
end
if lvl_id~=15 then --summit level id
init_fruit(this,4,4)
else
destroy_object(this)
end
end
this.hitbox=rectangle(0,0,16,16)
end,
draw=function(this)
sspr(0,32,8,16,this.x,this.y)
sspr(0,32,8,16,this.x+8,this.y,8,16,true,true)
end
}
function init_fruit(this,ox,oy)
init_object(fruit,this.x+ox,this.y+oy,13).fruit_id=this.fruit_id
destroy_object(this)
end
key={
update=function(this)
if has_key then
destroy_object(this)
end
this.spr=flr(9.5+sin(frames/30))
if frames==18then
this.flip.x=not this.flip.x
end
if this.player_here()then
sfx"17"
global "sfx_timer,has_key=10,true"
destroy_object(this)
end
end
}
chest={
check_fruit=true,
init=function(this)
if lvl_id<15then
this.x-=4
end
this.start,this.timer=this.x,20
end,
update=function(this)
if has_key then
this.timer-=1
this.x=this.start-1+rnd"3"
if this.timer<=0then
init_fruit(this,0,-4)
end
end
end
}
platform={
layer=0,
init=function(this)
this.x-=4
this.hitbox.w,this.semisolid_obj,this.dir=16,true,this.spr==11and-1or 1
end,
update=function(this)
this.spd.x=this.dir*.65
if this.x<-16then
this.x=lvl_pw
elseif this.x>lvl_pw then
this.x=-16
end
end,
draw=function(this)
spr(11,this.x,this.y-1,2,1)
end
}
statue={
layer=3,
init=function(this)
this.text="⬇️ leaderboard"
this.hitbox.x+=4
end,
draw=function(this)
rectfill(this.x-1,this.y-4,this.x-1,this.y-2,9)
if this.player_here()then
for i,s in ipairs(split(this.text,"#"))do
camera()
?s,8,75,7
camera(draw_x,draw_y)
end
if btnp(⬇️)then
init_leaderboard()
end
end
end
}
message={
layer=3,
init=function(this)
this.text="-- blimey mountain --#good job getting this far,#but it gets much worse"
if lvl_id>15 then --summit level id
this.text="##all levels by @micahc"
end
this.hitbox.x+=4
end,
draw=function(this)
if this.player_here()then
for i,s in ipairs(split(this.text,"#"))do
camera()
rectfill(7,7*i,120,7*i+6,7)
center_text(s,7*i+1,0)
camera(draw_x,draw_y)
end
end
end
}
big_chest={
init=function(this)
this.state,this.hitbox.w=max_djump>1and 2or 0,16
end,
update=function(this)
if this.state==0then
local hit=this.check(player,0,8)
if hit and hit.is_solid(0,1)then
sfx"37"
this.state=2
init_object(orb,this.x+4,this.y+4,102)
end
end
end,
draw=function(this)
if this.state==0then
draw_obj_sprite(this)
spr(96,this.x+8,this.y,1,1,true)
elseif this.state==1then
foreach(this.particles,function(p)
p.y+=p.spd
line(this.x+p.x,this.y+8-p.y,this.x+p.x,min(this.y+8-p.y+p.h,this.y+8),7)
end)
end
spr(112,this.x,this.y+8)
spr(112,this.x+8,this.y+8,1,1,true)
end
}
orb={
init=function(this)
this.spd.y=-4
end,
update=function(this)
this.spd.y=appr(this.spd.y,0,.5)
local hit=this.player_here()
if this.spd.y==0and hit then
sfx"11"
destroy_object(this)
max_djump,hit.djump=2,2
end
end,
draw=function(this)
draw_obj_sprite(this)
for i=0,.875,.125do
circfill(this.x+4+cos(frames/30+i)*8,this.y+4+sin(frames/30+i)*8,1,7)
end
end
}
flag={
init=function(this)
this.x+=5
end,
update=function(this)
if not this.show and this.player_here()then
sfx"16"
this.show=true
global "sfx_timer,time_ticking=30,false"
end
end,
draw=function(this)
spr(118+frames/5%3,this.x,this.y)
if this.show then
global "stopcounting,pls=true,1"
if sp_m then
global"pls=0 "
end
camera()

global "plch,rectnum,placeholder,sprholder,place2=0,31, :,21,13"
if sp_m then
global "placeholder,rectnum,sprholder,place2=igt: ,40,11,21"
if not loaded then
global"plch=1"
end
end
rectfill(32,0,96,rectnum,5)
if loaded and sp_m then
rectfill(32,0,96,46,5)
end
rectfill(33,1,95,rectnum-1,0)
spr(13,45,2+pls+plch)
?" :"..fruit_count,48,3+pls+plch,7
if sp_m then
?"rta: "..two_digit_str(flr(rtamin))..":"..two_digit_str(flr(rtasec)),48,30+plch,7
if loaded then
rectfill(33,40,95,45,0)
?"loaded",48,39,7
end
else
spr(28,45,13)
end
spr(65,45,sprholder+pls+plch)
?placeholder..two_digit_str(minutes)..":"..two_digit_str(seconds),48,place2+pls+plch,7
?" :"..deaths,48,sprholder+1+pls+plch,7
camera(draw_x,draw_y)
end
end
}
function psfx(num)
if sfx_timer<=0then
sfx(num)
end
end
tiles={}
foreach(split([[1,player_spawn
8,key
11,platform
12,platform
113,spring
20,chest
22,balloon
23,fall_floor
26,balloon
13,fruit
45,fly_fruit
60,statue
64,fake_wall
86,message
96,big_chest
118,flag
]],"\n"),function(t)
local tile,obj=unpack(split(t))
tiles[tile]=_ENV[obj]
end)
function init_object(type,x,y,tile)
local id=x..","..y..","..lvl_id
if type.check_fruit then
if fsid==1then
return
end
end
local obj={
type=type,
collideable=true,
spr=tile,
flip=vector(),
x=x,
y=y,
hitbox=rectangle(0,0,8,8),
spd=vector(0,0),
rem=vector(0,0),
fruit_id=id
}
function obj.left()return obj.x+obj.hitbox.x end
function obj.right()return obj.left()+obj.hitbox.w-1end
function obj.top()return obj.y+obj.hitbox.y end
function obj.bottom()return obj.top()+obj.hitbox.h-1end
function obj.is_solid(ox,oy)
for o in all(objects)do
if o~=obj and(o.solid_obj or o.semisolid_obj and not obj.objcollide(o,ox,0)and oy>0)and obj.objcollide(o,ox,oy)then
return true
end
end
return obj.is_flag(ox,oy,0)
end
function obj.is_ice(ox,oy)
return obj.is_flag(ox,oy,4)
end
function obj.is_flag(ox,oy,flag)
for i=max(0,(obj.left()+ox)\8),min(lvl_w-1,(obj.right()+ox)/8)do
for j=max(0,(obj.top()+oy)\8),min(lvl_h-1,(obj.bottom()+oy)/8)do
if fget(tile_at(i,j),flag)then
return true
end
end
end
end
function obj.objcollide(other,ox,oy)
return other.collideable and
other.right()>=obj.left()+ox and
other.bottom()>=obj.top()+oy and
other.left()<=obj.right()+ox and
other.top()<=obj.bottom()+oy
end
function obj.check(type,ox,oy)
for other in all(objects)do
if other and other.type==type and other~=obj and obj.objcollide(other,ox,oy)then
return other
end
end
end
function obj.player_here()
return obj.check(player,0,0)
end
function obj.move(ox,oy,start)
for axis in all{"x","y"}do
obj.rem[axis]+=axis=="x"and ox or oy
local amt=round(obj.rem[axis])
obj.rem[axis]-=amt
local upmoving=axis=="y"and amt<0
local riding,movamt=not obj.player_here()and obj.check(player,0,upmoving and amt or-1)
if obj.collides then
local step=sign(amt)
local d,p=axis=="x"and step or 0,obj[axis]
for i=start,abs(amt)do
if not obj.is_solid(d,step-d)then
obj[axis]+=step
else
obj.spd[axis],obj.rem[axis]=0,0
break
end
end
movamt=obj[axis]-p
else
movamt=amt
if(obj.solid_obj or obj.semisolid_obj)and upmoving and riding then
movamt+=obj.top()-riding.bottom()-1
local hamt=round(riding.spd.y+riding.rem.y)
hamt+=sign(hamt)
if movamt<hamt then
riding.spd.y=max(riding.spd.y,0)
else
global"movamt=0"
end
end
obj[axis]+=amt
end
if(obj.solid_obj or obj.semisolid_obj)and obj.collideable then
obj.collideable=false
local hit=obj.player_here()
if hit and obj.solid_obj then
hit.move(axis=="x"and(amt>0and obj.right()+1-hit.left()or amt<0and obj.left()-hit.right()-1)or 0,
axis=="y"and(amt>0and obj.bottom()+1-hit.top()or amt<0and obj.top()-hit.bottom()-1)or 0,
1)
if obj.player_here()then
kill_player(hit)
end
elseif riding then
riding.move(axis=="x"and movamt or 0,axis=="y"and movamt or 0,1)
end
obj.collideable=true
end
end
end
function obj.init_smoke(ox,oy)
init_object(smoke,obj.x+(ox or 0),obj.y+(oy or 0),29)
end
add(objects,obj);
(obj.type.init or stat)(obj)
return obj
end
function destroy_object(obj)
del(objects,obj)
end
function kill_player(obj)
global"sfx_timer=12"
sfx"0"
deaths+=1
if lvl_id==1 and sp_m and fruit_count!=1 then
global"deaths,rtamin,rtasec,minutes,seconds,frames=0,0,0,0,0,0"
tsubtractby=time()
end
destroy_object(obj)
for dir=0,.875,.125do
add(dead_particles,{
x=obj.x+4,
y=obj.y+4,
t=2,
dx=sin(dir)*3,
dy=cos(dir)*3
})
end
global"delay_restart=15"
end
function move_camera(obj)
cam_spdx,cam_spdy=cam_gain*(4+obj.x-cam_x),cam_gain*(4+obj.y-cam_y)
cam_x+=cam_spdx
cam_y+=cam_spdy
local clamped=mid(cam_x,64,lvl_pw-64)
if cam_x~=clamped then
cam_spdx,cam_x=0,clamped
end
clamped=mid(cam_y,64,lvl_ph-64)
if cam_y~=clamped then
cam_spdy,cam_y=0,clamped
end
end
function next_level()
local next_lvl=lvl_id+1
global"storby_loader,fsid=next_lvl,0"
load_level(next_lvl)
save_game()
end
function load_level(id)
global "has_dashed,has_key=false"
if lvl_id==15 then global"max_djump,stopcounting,time_ticking=1,false,true" end --summit level id --possible
if fsid==1then
global"has_key=true"
end
foreach(objects,destroy_object)
global "cam_spdx,cam_spdy=0,0"
local diff_level=lvl_id~=id
lvl_id=id
local tbl=split(levels[lvl_id])
for i=1,4do
_ENV[split"lvl_x,lvl_y,lvl_w,lvl_h"[i]]=tbl[i]*16
end
lvl_pw,lvl_ph,ui_timer,lvl_title=lvl_w*8,lvl_h*8,5,tbl[5]
if diff_level then
reload()
if mapdata[lvl_id]then
replace_mapdata(lvl_x,lvl_y,lvl_w,lvl_h,mapdata[lvl_id])
end
end
for tx=0,lvl_w-1do
for ty=0,lvl_h-1do
local tile=tile_at(tx,ty)
if tiles[tile]then
init_object(tiles[tile],tx*8,ty*8,tile)
end
end
end
end
function _update()
if btnp()==64and state==0then
global"state=1"
init_menu()
poke(24368,1)
end
if state==1then
update_menu()
if title_screen==0then
if not stopcounting then
count_time()
end
end
elseif state==2then
update_leaderboard()
elseif state==0then
if menubuffer>0 then
menubuffer-=1
end
frames+=1
if freeze>0then
freeze-=1
time_ticking=false
return
end
if time_ticking then
seconds+=frames\30
minutes+=seconds\60
seconds%=60
count_time()
end
frames%=30
if sfx_timer>0then
sfx_timer-=1
end
if delay_restart>0then
global "cam_spdx,cam_spdy=0,0"
delay_restart-=1
if delay_restart==0then
storbyloader=lvl_id
load_level(lvl_id)
end
end
foreach(objects,function(obj)
obj.move(obj.spd.x,obj.spd.y,0);
(obj.type.update or stat)(obj)
end)
foreach(objects,function(obj)
if obj.type==player or obj.type==player_spawn then
move_camera(obj)
end
end)
if title_screen~=0then
poke(24365,1)
if start_game then
start_game_flash-=1
if start_game_flash<=-30then
begin_game()
end
elseif stat(31)=="コ"then
save_file=stat(4)
if save_file~=""then
save_array=split(save_file,".")
if#save_array~=13then
global "errormessage=60"
else
for i in all(save_array)do
if type(i)=="string"then global"errormessage=60" end
end
if errormessage==0then
if save_array[11]>#levels or save_array[8]>60or save_array[10]>60then global"errormessage=60" end --causes failure
vars=split("1,2,3,4,12",",",true)
for i=1,5do
local temp=save_array[vars[i]]
if temp~=0and temp~=1then
global"errormessage=60"
end
end
if errormessage==0then
fsid,max_djump,deaths,rtaminadd,rtasecadd,minadd,secadd,level_loader,fruit_count,autosave=save_array[13],save_array[2]+1,save_array[6],save_array[7],save_array[8],save_array[9],save_array[10],save_array[11],save_array[12],save_array[1]
if save_array[3]==1then global"f_d=true" end
if save_array[4]==1then global"h_f=true" end
if save_array[5]==1then global"sp_m=true" end
startsettings()
end
end
end
end
elseif btnp(🅾️)or btnp(❎)then
if title_screen==2 and menubuffer==0 then
startsettings()
end
end
end
if title_screen==1then
if starting then
titlecircle+=3
if btnp(🅾️)or btnp(❎)then
if menubuffer==0then
global "titlecircle,starting,title_screen=0,false,2"
end
end
else
if btnp(🅾️)or btnp(❎)then
if menubuffer==0then
global"starting=true"
end
end
end
end
end
end
function _draw()
pal()

if state==1then
draw_menu()
elseif state==2then
draw_leaderboard()
elseif state==0 then
if lvl_id>15 then --summit level id
pal(11,9)
end
if title_screen~=0then
if start_game then
for i=1,15do
pal(i,start_game_flash<=10and ceil(max(start_game_flash)/5)or frames%10<5and 7or i)
end
end
if title_screen==1then
tc=titlecircle-64
if tc>128then
global"title_screen=2"
end
for i=1,15do
if tc>88and tc<101then
pal(i,7)
end
end
cls()
?"c/x",58,80,5
?"matt thorson",42,96,5
?"noel berry",46,102,5
sspr(64,40,8,16,60,128-titlecircle)
rectfill(60,64,68,0,0)
palt(0,false)
sspr(unpack(split"0,99,54,32,36,32"))
memcpy(32768,24576,8192)
end
cls()
sspr(unpack(split"72,32,56,32,36,29"))
?"🅾️/❎",55,80,5
?"original game:",38,90,6
?"maddy thorson",15,96,14
?"+",69,96,7
?"noel berry",75,96,3
?"mod by",22,102,6
?"strongsand94191",50,102,12
?"music by",24,108,6
?"metahumanboi",60,108,2
if errormessage>0then
?"invalid file",40,117,7
errormessage-=1
else
?"ctrl-v to paste file",26,117,7
end
if title_screen==1then
afterdraw()
circ(64,64,tc-1,11)
end
foreach(particles,draw_particle)
return
end
cls(flash_bg and frames/5or bg_col)
foreach(clouds,function(c)
c.x+=c.spd-cam_spdx
rectfill(c.x,c.y,c.x+c.w,c.y+16-c.w*0x.3,cloud_col)
if c.x>128then
c.x,c.y=-c.w,rnd"120"
end
end)
draw_x,draw_y=round(cam_x)-64,round(cam_y)-64
if lvl_id==15 then --summit level id
if draw_y<36then global"draw_y=36" end
global"draw_x=.875"
end
camera(draw_x,draw_y)
map(lvl_x,lvl_y,0,0,lvl_w,lvl_h,4)
local layers={{},{},{}}
foreach(objects,function(o)
if o.type.layer==0then
draw_object(o)
else
add(layers[o.type.layer or 1],o)
end
end)
map(lvl_x,lvl_y,0,0,lvl_w,lvl_h,2)
foreach(layers,function(l)
foreach(l,draw_object)
end)
foreach(particles,draw_particle)
foreach(dead_particles,function(p)
p.x+=p.dx
p.y+=p.dy
p.t-=.2
if p.t<=0then
del(dead_particles,p)
end
rectfill(p.x-p.t,p.y-p.t,p.x+p.t,p.y+p.t,14+5*p.t%2)
end)
camera()
if ui_timer>=-30 and ui_timer<0 then
draw_ui()
end
ui_timer-=1
end
end
function draw_particle(p)
p.x+=p.spd-cam_spdx
p.y+=sin(p.off)-cam_spdy
p.off+=min(.05,p.spd/32)
rectfill(p.x+draw_x,p.y%128+draw_y,p.x+p.s+draw_x,p.y%128+p.s+draw_y,p.c)
if p.x>132then
p.x,p.y=-4,rnd"128"
elseif p.x<-4then
p.x,p.y=128,rnd"128"
end
end
function draw_object(obj)
(obj.type.draw or draw_obj_sprite)(obj)
end
function draw_obj_sprite(obj)
spr(obj.spr,obj.x,obj.y,1,1,obj.flip.x,obj.flip.y)
end
function draw_time(x,y)
global "yp,yt=0,0"
if sp_m then
global "yp,yt=10,9"
end
global"lvladd=0"
if lvl_id==6 or lvl_id==8 or lvl_id==12 or lvl_id==18 then
if state==0 then
global"lvladd=72"
end
end
rectfill(x+lvladd,y,x+48+lvladd,y+28+yp,5)
rectfill(x+lvladd+1,y+1,x+47+lvladd,y+27+yp,0)
?" :"..deaths,x+5+lvladd,y+12+yt,7
?" :"..fruit_count,x+5+lvladd,y+21+yt,7
spr(65,5+lvladd,14+yt)
spr(13,6+lvladd,23+yt)
if sp_m then
?"igt: "..two_digit_str(minutes)..":"..two_digit_str(seconds),x+4+lvladd,y+3,7
?"rta: "..two_digit_str(flr(rtamin))..":"..two_digit_str(flr(rtasec)),x+4+lvladd,y+12,7
else
spr(28,6+lvladd,6)
?" :"..two_digit_str(minutes)..":"..two_digit_str(seconds),x+5+lvladd,y+3,7
end
end
function draw_ui()
rectfill(60-#lvl_title*2,58,66+#lvl_title*2,70,0)
center_text(lvl_title,62,7)
draw_time(4,4)
end
function two_digit_str(x)
return x<10and"0"..x or x
end
function round(x)
return flr(x+.5)
end
function appr(val,target,amount)
return val>target and max(val-amount,target)or min(val+amount,target)
end
function sign(v)
return v~=0and sgn(v)or 0
end
function tile_at(x,y)
return mget(lvl_x+x,lvl_y+y)
end
function spikes_at(x1,y1,x2,y2,xspd,yspd)
for i=max(0,x1\8),min(lvl_w-1,x2/8)do
for j=max(0,y1\8),min(lvl_h-1,y2/8)do
if({[97]=y2%8>=6and yspd>=0,
[27]=y1%8<=2and yspd<=0,
[43]=x1%8<=2and xspd<=0,
[59]=x2%8>=6and xspd>=0})[tile_at(i,j)]then
return true
end
end
end
end
-->8
--[map metadata]

--@begin
--level table
--"x,y,w,h,title"
levels={
  "0,3,1,1,1/14: echoing emptiness",
  "0,2,1,1,2/14: icy isolation",
  "0,1,1,1,3/14: crumbling cavern",
  "0,0,1,1,4/14: crying chasm",
  "1,0,1,1,5/14: tiresome tunnels",
  "1,1,1,1,6/14: salient squeeze",
  "1,2,1,1,7/14: tight traverse",
  "1,3,1,1,8/14: desolate drop",
  "2,3,1,1,9/14: careless corridor",
  "2,2,1,1,10/14: the femur breaker",
  "2,1,1,1,11/14: winding wilderness",
  "3,0,1,1,12/14: winding web",
  "2,0,1,1,13/14: perilous power",
  "3,1,1,1,14/14: dangerous determination",
  "6.9375,0,1.0625,2.3125,you did it!",
  "7,3,1,1,secret_01 by micahc",
  "6,3,1,1,secret_02 by micahc",
  "5,3,1,1,secret_03 by micahc",
  "5,2,1,1,secret_04 by micahc",
  "6,2,1,1,secret_05 by micahc",
  "6,1,1,1,secret_06 by micahc",
  "6,0,1,1,secret_07 by micahc",
  "5,1,1,1,secret_08 by micahc",
  "5,0,1,1,secret_08 by micahc"
}

--mapdata string table
--assigned levels will load from here instead of the map
mapdata={
  "000000000000000000000000000000000000000000000000006100000000000000000000000000003b2000000061000000000000000000000000000000202b000000000000000000000000000061000000006100006100000000000000202b00003b272b3b2761000061000000000000003b300d3b24232b0020000000000000003b24353525332b0000000000000000003b371b1b371b00000000000000000000001b00001b000000000000000000000000000000000000000000000061000000000000000000000000000000202b0000000000006100000061000000000000000100003b2000003b2000000000000022222300000000000000000000000000",
  "535353644253536424253233000000005353647263636421323300000000000053540000610000371b0000000000212253540000450000452b0000000021252553546116550061552b0000000024252553637400553b72540000000021252525541b1b00550000552b0000002425322554000000550000552b0000002433273154000000556100552b0000003721252254166161527400552b00003b20242525543b7273540000552b0000003b24252554001b1b550000552b0000003b3125255400000055006155000000000061312554000000553b7264000000003b21232454010014550000080000003b2125263153434343004343434344003b24252523",
  "2526312525252525252525362b3b3435252523242525253225252600000000002525333125253300313233000008000025260000313300000021230000000000252600001b1b00000031260000000000252661166161000000003061610061612525360034360000000031222300343525261b001b27000000003b242617170032262b000037000000003b242600000023372b000027000000003b3126000000252300003b3000000000001b30001717252600003b3000000000003b3717170025262b0000300000000000001b00000025262b011437160000000000610000002525223536000000000000002017171732323300000000000000000000000000",
  "26000000312525262b3b31252533242625230000002448262b003b313321253325260000003125262b003b342232330025330800000031332b00001b370000002621230000001b00000000001b000000332425232b00610000000000610000002225252600002700000000002700000032322533212225232b003b2125232b0035363721252548262b003b2425332b0000003432252532332b003b31332b000000000000313321232b00001b1b00000000000000002125262b00006161000000001401000024252600000021237171712223200000313233160000313222222225262b0000000000000000000031322532332b00000000000000000000000031",
  "000000000024263125253324332b00000000000000312523312521262b0000000000000000002425233724332b00000000000000003b31252521331b000000000000000008003b3125331b0000000000230000000000003b371b00610000000025222300006100001b0061272b0000003225253536276100166121260000000000313300003720616121252600000000000000000000343535323226710000000000000000001b1b1b1b3b24362b1661000000000000616161003b371b00612100000000003b2123202b001b0061212500140000003b24262b0016006121252521230100713b2426000000612125252531252222232125260000002125254825",
  "25353535353627202b00612425252548260001000000302b0061212525252525253535353600372b1621253232322525330000000000272b3b31330021233125000000616161302b001b1b163125232400006121222226616161610000242631000020313232323536343600003125220000001b1b1b1b00000000000000242500000061616161000000000000002425000071212222232d0000000000002425222223242525260021230000002125252525263125252522252522222331254848252523242525252548252525232425252525262425252525252525323324252525252631252548252525332122252525252525232425252525262125252525",
  "00000000000000000000242525252533000000000000000021222525252526210000000000002122252548252525332400000000002125252525252532332125230000000031323232323233212225252600000017161b1b163b2122252525252522230017616161003b2425252525252525252222222236003b312525252525232525252525332b163b2731252525252625252525332b00616124232425252532232525332b16612122253324252525003731332b006121252526342525252500000000006121252525252324252525000100006121252525252526312548250034222222252525252525252324252500002425252525252525252526242525",
  "323232323331322525252525252600000114000000003b313225252525332b0022230000000000003b312525332b16612526616161616100006124331b006121482522222223450000453700006121253232323232336500006527006127312500000000000000160000303b2125232461616100006161616161303b2425263122234500004521222223373b313232363233650000653132323223001b1b1b1b000000160000000000003771610000006161616161610000616121223600000022222222234500004521253300000000252532323365000065313300000071002533000800000000000000000021222226212222222222222222222321252525",
  "332b00003b24252525252525263125252b0000003b32322525252525252324252b000000001b1b312525252525332425610000001600001b313232252621252523616100000000001b0000313324252525222361616161616100002122252525322525222222222223163b24252525252331322525252525262b3b24252525252522232425254825262b3b2425252548252526313232253226160024252525252532323600163716370000242525252526000000006161616100003132322525260000000021222223616117000024252523010021252525252223000d0024252525222225252525252526616161242525252525252548252525252321222525",
  "1b1b1b1b1b1b24252631252525332b0016616161003b244825232425332b00613b3435232b3b2425323324332b166121001b00302b3b24260000370000612125616116302b0024266116616161212525353608300000313236613422222525250061613016001b1b1b160024252548250021222661616161616161242525252500313232353535353535353232323232000000000000000000000000000000000c00000000000000000c00000000000061616161616161616161616161616100353535353634353536343535353536000014011b1b1b1b1b1b1b1b1b1b1b1b002122360000000b0000000000000b000031330000000000000000000000000000",
  "25262b00000000000061000000000000252661000061000000202b00000000002525232b3b20000000000000000000002525262b0000000000000000000000003225262b00000000000000000000000023313361610000000000000000000000252222232761000000000000000000002525252624360000000000000000000025254826372b0000006100000000000031252525232b000000272b0000000061003132252661000000372b000000612100000031323600003b272b00003b21250000001b1b1b000000302b0000612425000000616100000000371b1b1b2125250001002123000000003b16003b2425252222222526000000003b16003b242525",
  "32323232323232332125254825262b3b01000000000000003125323232262b3b236161610000000000302b1b0030160025222327610000003b372b0000302b3b25482624230000000000610000302b3b25253324266100001661750061300016252621252523616161201b0034262b3b25333132322522223600000000302b3b331b1b1b1b31253300000061613716001b006100003b371b00003b21232b00000061276100161b0000001624332b0061003432366100000000003b301b006121161b1b1b20616161616161372b002125616161001b34353535353600000024252222230000610000201600617161242525252600162000161b00002122222525",
  "0000000000000000000000000000000000000000000000000000000000000000610000001600000000000000000000002300000000000000000000000000000026000000000000000000000000000000262b0000000000000000000000000000262b0000000000000000000000000000262b00000000000000000000000000002661000000000000000000000000000025232b0000000000000000000000000025262b0000000000000000000000000025262b0000000000000000000000000025262b00600000000000000000012122252522230000000000000021222225252525252522222300000021252525252525252525252525222222252525252525",
  "252525253233242525262b3b24263125254825332122252525332b3b242523242525262125252525262b003b312533242525263132323232336100001b3721252525262b1b1b1b1b1b272b163b2125252525262b000000003b302b00612425252525262b006100003b302b3b342525252525262b3b2761003b3761003b3125252525262b3b24232b001b272b003b31253225262b3b242661003b376100163b241b31262b3b2425232b001b272b003b24003b372b3b24252661003b372b003b24000000003b242525232b000000006124010000003b242525262b1600616121252223617161244832336161612122252525252222222526212222222225254825",
  "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000760000000000000000000000000000002122222300000000000000000000000021252525252300000000000000000000212525323225252300000000000000000024252621233125330000000000000000212525263125233721230000000000000024252525233125222526000000000000002425252525232425252600000000000021252525252526242525252300000000002425252525253324252525260000000000312525252526342525252533000000001600242525252536242525260016000000000024252525332125252526000000000000003125323321252525253300000000000000003721222525252526000000000000160000342525252525253300001600000000000000312525252533000000000000000000000000313232330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002c000000000000000000000000000000003c0000010000000000000000000000000021222222222222230000000000000021223225253225252525222300000000212533273133273132253225253600002125332125222225222337273133212320",
  "2525323225252600000000000000000032331b1b312526173435353536000000006116001b312600611617000027000016277100001b312223611700003000003b31237100001b312523006161300000001b31237100001b31263b343526000000001b31237100001b37081b1b3000002b00001b31237100001b342317300000222361161b31237100001b371737000025252361001b31237100001b170000003232252361161b313600000000000000140024252361001b171717171717342223003132323661001b1b1b1b1b1b00242600451661002017171717171717002426005500276100001b1b1b1b1b1b012426006500242222222222222222222225",
  "542b003b5253535354242548252532325461003b626353535431252525331b0153442b00003b625353442425331b3b215354610000001b52535424261b003b245353442b00003b52535424262b003b245353542b00003b52635424332b0061245353637461003b650065301b003b212563642122232b001b001b302b003b312522222525262b0000003b302b006145242525252526610061003b372b004254242525483233453b45000000006152542425253342435343542b00003b2762642432334253535353644561003b2422222543435353535364425344006124252525535353536364425353543b212525482553535354424353535353442425252525",
  "2532323225323232323232323232260026016100300000000000006100003000253536163000206116006120006137002600616130001b206161200016271b1b26003435262b0000213600000030000026006100302b00342600006100300000263b271b2436001b30003b202b30000025352671301b17342600000016300000330030173000000030610000003000007500370024362b0024362b000030000014007500301b0000300000006130000075002000300000163000003b34260000200075003761000030006100003000007500200075202b00303b202b003000002000750020001761300000000030000075002000751617212600000016300000",
  "6363636363635353535353540052636300000000000852636363535400550000000000004273641b1b1b52540055000000000042642b0000003b526400550000000042642b000045003b55001b5500000072640000004264003b5550005500000000003b42736400003b5500165500142b00427364000000613b551b1b553b204373640000004273737354160055001b54000000427364000000652b00651600540000005500000000002136002700005400004254000001000030002b300000543b4200540000200000303b34260000543b52005400000000003000003000005400526354000000000037160037000064166516650000000000750000750000",
  "32323233313232323232261b1b212525000000000000001b1b1b302b0024482616616161616100003b2133007124253300212236213600002037000021323321003133212600002136000021260000241b1b1b24330017370000343233001624000000306100006100170000000000240034353236343535352223000000002400000000171b00002731336161616124000000343600000024361b00006121326100201b00002122331b00006134332134361b16006124331b00003b212222251b1b00006121331b0016003b313232250000616121261b00000000001b1b1b240171212225336161616100710000083122222525332122222223212222222223",
  "14000000000000000000000000000024223535353535353535353535367100242600000000000061610000171b270024260021353535353535353523003000242600300000006100171b0030163000242600300021353535352316300030002426613000300000000830003000300024261b30003000213535261b30003000242600300030003001003000300030002426003000300031351733003000300024260030003000006161007130003000242600300031353535353535330030002426613017003b2b0000003b2b00300024261b313535353535353535353533002426001b1b1b0061610000001b1b1b002426712122222222222222222222221725",
  "3232323232332426000024323232323200000000000031260000301b1b1b1b1b00000000000000370000372b00000000000000000000001b000000000000000000000000000000000000000000000000000000000000000000000000000000000800006161616161000000000000000000003b21352235362b00000000000000006161301b301b2761000000000000001734233716301631232b0000000000420100301b0037001b30000000000000521714300000450000300000000000005200173700005500004500000000000052170045000065000055000000000000520000550000270000650000000000005200006500003700002000160000000052",
  "6364312600003125252662005354525308003b302b002731322523520064525344003b302b003122233133525442006354003b302b001b24252223626452641b54003b37000000242525332742541b006400003b2700003132332125626400004400003b3000001b21222525361b00005400003b302b0000242525331b0061145400003b302b00213225331b000021225400003b370000371b371b0000003125646100003b27001b001b000000212324222300003b302b006100010000242631253300003b370071276117170024252326000000003b3435323600171724252626000000160000610061001b1b24253326616161616161212222222371243321",
  "0000000000000000160000000000006100000000000000000000710000003b08000000000000000000712122223536170000000000000000712125323327451b000000000000007134253321222655610000000000007121233721252526557100000000007121252621252548265517000000007121252526312525252665000000717134253225322331253225360000001720163716371637163716370014000000610061006100610061006100172222362761276127612761276127001632333432353235323631353235330000000000001700170017001700170000000100000000000000000000000000000023002700270027002700270027000000"
}

--@end

--replace mapdata with hex
function replace_mapdata(x,y,w,h,data)
for i=1,#data,2 do
mset(x+i\2%w,y+i\2\w,"0x"..sub(data,i,i+1))
end
end

--[[
__gfx__
000000000000000000000000088888800000000000000000000000000000000000aaaaa0000aaa000000a00000077077700777000300b0b00030bb00000b0b00
000000000888888008888880888888880888888008888800000000000888888000a000a0000a0a000000a0000777777677777770003b3300003b3000033b3000
000000008888888888888888888ffff888888888888888800888888088f1ff1800a909a0000a0a000000a0007766666667767777028888200288892002889820
00000000888ffff8888ffff888f1ff18888ffff88ffff8808888888888fffff8009aaa900009a9000000a0007677766676666677089888800988888008888890
0000000088f1ff1888f1ff1808fffff088f1ff1881ff1f80888ffff888fffff80000a0000000a0000000a0000000000000000000088889800888988008898880
0000000008fffff008fffff00033330008fffff00fffff8088fffff8083333800099a0000009a0000000a0000000000000000000088988800898888009888880
00000000003333000033330007000070073333000033337008f1ff10003333000009a0000000a0000000a0000000000000000000028888200288882002888820
000000000070070000700070000000000000070000007000077333700070070000aaa0000009a0000000a0000000000000000000002882000028820000288200
000b0b000030b0000300b00000000000000000000007700000011000566666655666666556600665000110006665666500666000000000000000000070000000
0033b300003b3000003b33000000000000000000007007000016610065d6d55665d6d55665d00556001661006765676506707600007700000770070007000007
028988200298882002888820000000000aaaaaa007000070017bb710655555566560065605000006017aa7106770677067707760007770700777000000000000
08888980088898800889888000000000a998888a7000000717bb6b61655d65566d0006560000000017aa6a610700070067700060077777700770000000000000
08988880098888800888889000000000a988888a700000071bb6733165d765d66d0000d6600000001aa679910700070067777760077777700000700000000000
08888890088889800888988000000000aaaaaaaa07000070013733106d7655666d700d6665500d06019799100000000006777600077777700000077000000000
02888820028888200288882000000000a980088a0070070000133100dd6555dddd6055dddd5005dd001991000000000000666000070777000007077007000070
00288200002882000028820004999940a988888a00077000000110000dddddd00dddddd00dd0ddd0000110000000000000000000000000007000000000000000
5777777557777777777777777777777577bbbbbbbbbbbbbbbbbbbb7757777775000ba0000000d000000000005500000000000000000000000000000000000000
77777777777777777777777777777777777bbbbbbbbbbbbbbbbbb777777777770008a0000000d000000044006670000000000000000777770000000000000000
777b77777777bbbbb777777bbbbb7777777bbbbbbbbbbbbbbbbbb77777777777000ab00000006d00004400446777700000000000007766700000000000000000
77bbbb77777bbbbbbbb77bbbbbbbb7777777bbbbbbbbbbbbbbbb7777777bb777000a9b0000006d00449999996660000099999990076777000000000000000000
77bbbb7777bbbbbbbbbbbbbbbbbbbb777777bbbbbbbbbbbbbbbb777777bbbb7700a09b00000060d0000000005500000099999999077660000777770000000000
777bb77777bb77bbbbbbbbbbbbb7bb77777bbbbbbbbbbbbbbbbbb77777bbbb7700a09800000060d00000000066700000999aaaa9077770000777767007700000
7777777777bb77bbbbbbbbbbbbbbbb77777bbbbbbbbbbbbbbbbbb77777b7bb77000a90b000006d00000000006777700099a9aa99070000000700007707777770
5777777577bbbbbbbbbbbbbbbbbbbb7777bbbbbbbbbbbbbbbbbbbb7777bbbb77000a90b000006d00000000006660000099aaaaa0000000000000000000077777
77bbbb7777bbbbbbbbbbbbbbbbbbbb77577777777777777777777775777bbb770000000000000000000000000000066609999900000040000000000000000000
777bbb7777bbbbbbbbbbbbbbbbbbbb77777777777777777777777777777bb7770000000000000000000000000007777600900900000040000000aa0b00000000
777bbb7777bb7bbbbbbbbbbbb77bbb777777bbbbbbb7777bb777bb77777bb777000000000000000700000007000007669999999900009400b0aa00aa00007000
77bbb77777bbbbbbbbbbbbbbb77bbb77777bbbbbbbbbbbbbbbbbbbb777bbb777077700707070000770777007000000550aaaaaa000009400ab99998907007000
77bbb777777bbbbbbbb77bbbbbbbb777777bb7bbbbbbbbbbbbbbbbb777bbbb77600006666606000666000006000006660a9999a00000904008b0bb0066606060
777bb7777777bbbbb777777bbbbb77777777bbbbb77bb77b777bbb7777bbbb77066600606006006660000666000777760a9999a000009040000b000006006606
777bb777777777777777777777777777777777777777777777777777777bb777000060606006060660006006000007660aaaaaa0000094000000000006006006
77bbbb77577777777777777777777775577777777777777777777775577777750666006060060066600006660000005599999999000094000000000006006006
5777755700666660077777777777777777777770077777700000000000000000bbbbbbbb00000000000000000000000000000000000000000000000000000000
7777777706006006700007770000777000007777700077770000000000000000b77bbbbb00000000000000003330000000000000000000000000000000000000
7777bb770600600670cc777cccc777ccccc7770770c777070000000000000000b77bb7bb0000000000000003bbb3000000003300000000000000300000000000
777bbbbb0666666670c777cccc777ccccc777c0770777c070000555555550000bbbbbbbb0000330000000003bbbb33000033bb30000000000003b30000000000
77bbbbbb06565656707770000777000007770007777700070005666666665000bbbbbbbb0003bb300000003bbbbbbb3003bbbbb3000000000003bb3000000000
57bb77bb05555555777700007770000077700007777000070056666666666500bb7bbbbb00003b300000003bbbbbbbb33bbbbbbb300000000003b30000000000
577b77bb006565607000000000000000000c000770000c070066666666666600bbbbb7bb0000030000000003bbbbbbbb3bbbbbbbb33000000000300000000000
777bbbbb00666660700000000000000000000007700000070065555565655600bbbbbbbb0000000000000003bbbbbbbbbbbbbbbbbbb300000000000000033000
777bbbbb0000000070000000000000000000000770000007006666666666660000bbbb0000000000000000003bbbbbbbbbbbbbbbbbbb300000000000003bb300
577bbbbb0000dd007000000c000000000000000770cc0007006556555565560000bbbb0000000000000000003bbbbbbbbbbbbbbbbbbbb30003300000003bb300
57bb7bbb00dd00dd70000000000cc0000000000770cc00070066666666666600bbbbbbbb00000000000000003bbbbbbbbbbbbbbbbbbbbb303bb3300000033000
77bbbbbbdd66666670c00000000cc00000000c0770000c070066655565566600bbbbbbbb0000000000000003bbbbbbbbbbbbbbbbbbbbbb33bbbbb30000000000
777bbbbb00000000700000000000000000000007700000070066666666666600bbbbbbbb0000000000033003bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3003300000
7777bb770000000070000000000000000000000770c000070066666666666600bbbbbbbb000007777037733bbbb777777bb777bb777b77777b7bbb7337700000
777777770000000070000000c000000000000007700000070066776667777600bbbbbbbb0000077777b77bbbbbb777777bb77777777b77777b77b77bb7700000
57777577000000007000000000000000000000077000c0070777777777777770bbbbbbbb0000077037b77bbbbbbbb77bbbb77766777b77bbbb77777bb7700000
0000000000000000700000000000000000000007700000070077770000000000bbbbbbbb000006666bb66bbbbbbbb66bbbb66b66b66b6666bbb666bbb6600000
00aaaaaa00000000700000000000000000000007700c00070700007000000000bbbbbbbb0000066036b66bbbb6bbb66bbbb66b66b66b66bbb3b666bbb3000000
0a99999900000000700000000000c00000000007700000077077000700000077bbbbbbbb00000663b6b6666666b666666bb66b66b66b66666b3666b336600000
a99aaaaa007000707000000cc0000000000000077000cc077077bb0700700077bbbbbbbb000006666bb6666666b666666bb66b66b66b66666b36663006600000
a9aaaaaa007000707000000cc0000000000c00077000cc07700bbb0707700077bbbbbbbb0000003bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3330000000000
a99999990677067770c00000000000000000000770c00007700bbb0777777777bbbbbbbb0000003bbbbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbbb300c0000000000
a99999995676567670000000000000000000000770000007070000700777777700bbbb000000003bbb33bbbbbbbbbbbbbbbbbbbbbbbbbbbbb30000c000000000
a99999995666566607777777777777777777777007777770007777000070000000bbbb000000000333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb300000c000000000
aaaaaaaa0000000007777777777777777777777007777770004bbb00004b000000400bbb00000000c33bbbbbbbbbbbbbbb33bbbbbbbbbbbb300000c000000000
a49494a10000000070007770000077700000777770007777004bbbbb004bb000004bbbbb0000000100033333bbbbbbbbb30033bbbbbbbbbb300000c00c000000
a494a4a10000000070c777ccccc777ccccc7770770c7770704200bbb042bbbbb042bbb00000000c000000003bbbbbbbb30000033bbbbbbbb3000001010c00000
a49444aa0499994070777ccccc777ccccc777c0770777c07040000000400bbb0040000000000010000000003bbbbbbbb3000000033bbbbbb30000001000c0000
a49999aa00500500777700000777000007770007777700070400000004000000040000000000010000000003bbbbbbb300000000003bbbbb3000003000010000
a49444990005500077700000777000007770000777700c0742000000420000004200000000000100000000003bbbbbb30000000000033bbb300003b300001000
a494a444005005007000000000000000000000077000000740000000400000004000000000000000000000003bbbb3300000000000000333000003b300000000
a4949999000550000777777777777777777777700777777040000000400000004000000000010000000000000333300000000000000000000000003000000010
00777700007770000777777007777700000777000777777000777770077777700077770000777700000000000000000000000000000000000000000000000000
07777770077770000777777007777770007777000770000007777700077777700770077007700770000000000000000000000000000000000000000000000000
07700770000770000000007000000770077077000770000007700000000077700770077007700770000000000000000000000000000000000000000000000000
07700770000770000777777007777770070077000777770007700000000077000077770000777770000000000000000000000000000000000000000000000000
06600660000660000666666006666660066666600666666006666600000666000066660000000660000000000000000000000000000000000000000000000000
06600660000660000600000000000660000066000000066006600660000660000660066000000660000000000000000000000000000000000000000000000000
06666660066666600666660006666660000066000000066006600660006660000660066000666660000000000000000000000000000000000000000000000000
00666600066666600666666006666600000066000666660000666600006660000066660006666600000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000060600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000d00060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000d00000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000d000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000c0000000c000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000d000000000c060d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000c00000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06666600666666006600c00066666600066666006666660066666600000000000000000000000000000000000000000000000000000000000000000000000000
6666666066666660660c000066666660666666606666666066666660000000000000000000000000000000000000000000000000000000000000000000000000
66000660660000006600000066000000660000000066000066000000000000000000000000000000000000000000000000000000000000000000000000000000
dd000000dddd0000dd000000dddd0000ddddddd000dd0000dddd0000000000000000000000000000000000000000000000000000000000000000000000000000
dd000dd0dd000000dd0000d0dd000000000000d000dd0000dd000000000000000000000000000000000000000000000000000000000000000000000000000000
ddddddd0dddddd00ddddddd0dddddd00ddddddd000dd0000dddddd00000000000000000000000000000000000000000000000000000000000000000000000000
0ddddd00ddddddd0ddddddd0ddddddd00ddddd0000dd0000ddddddd0000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000c000000000000000000000000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000c00000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000cc0000000000000000000000000000000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c000000000000000000000000000000000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000c0000000000000000000000000000000000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000100000000000000000000000000000000000000c00c000000000000000000000000000000000000000000000000000000000000000000000000000000
000000c0000000000000000000000000000000000000001010c00000000000000000000000000000000000000000000000000000000000000000000000000000
000001000000000000000000000000000000000000000001000c0000000000000000000000000000000000000000000000000000000000000000000000000000
00000100000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000
00000100000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000006000000000000070000000000000000000000000000000000000
00000000000000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000003330000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000003bbb3000000003300000000000000300000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000330000000003bbbb33000033bb30000000000003b30000000000000000000000000000000000000000000000
0000000000000000000000000000000000000003bb300000003bbbbbbb3003bbbbb3000000000003bb3000000000000000000000000000000000000000000007
00000000000000000000000000000000000000003b300000003bbbbbbbb33bbbbbbb300000000003b30000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000030000000003bbbbbbbb3bbbbbbbb33000000000300000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000003bbbbbbbbbbbbbbbbbbb300000000000000033000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000003bbbbbbbbbbbbbbbbbbb300000000000003bb300000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000003bbbbbbbbbbbbbbbbbbbb30003300000003bb300000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000003bbbbbbbbbbbbbbbbbbbbb303bb3300000033000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000003bbbbbbbbbbbbbbbbbbbbbb33bbbbb30000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000033003bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3003300000000000000000000000000000000000000000
000000000000000000000000000000000000000007777037733bbbb777777bb777bb777b77777b7bbb7337700000000000000000000000000000000000000000
0000000000000000000000000000000000000000077777b77bbbbbb777777bb77777777b77777b77b77bb7700000000000000000000000000000000000000000
0000000000000000000000000000000000000000077037b77bbbbbbbb77bbbb77766777b77bbbb77777bb7700000000000000000000000000000000000000000
000000000000000000000000000000000000000006666bb66bbbbbbbb66bbbb66b66b66b6666bbb666bbb6600000000000000000000000000000000000000000
0000000000000000000000000000000000000000066036b66bbbb6bbb66bbbb66b66b66b66bbb3b666bbb3000000000000000000000000000000000000000000
00000000000000000000000000000000000000000663b6b6666666b666666bb66b66b66b66666b3666b336600000000000000000000000000000000000000000
000000000000000000000000000000000000000006666bb6666666b666666bb66b66b66b66666b36663006600000000000000000000000000000000000000000
0000000000000000000000000000000000000000003bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3330000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000003bbbbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbbb300c0000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000003bbb33bbbbbbbbbbbbbbbbbbbbbbbbbbbbb30000c000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb300000c000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000c33bbbbbbbbbbbbbbb33bbbbbbbbbbbb300000c000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000100033333bbbbbbbbb30033bbbbbbbbbb300000c00c000000000000000000000000000000000000000000
000000000000000000000000000000000000600000c000000003bbbbbbbb30000033bbbbbbbb3000001010c00000000000000000000000000000000000000000
0000000000000000000000000000000000000000010000000003bbbbbbbb3000000033bbbbbb30000001000c0000000000000000000000000000000000000000
0000000000000000000000000000000000000000010000000003bbbbbbb300000000003bbbbb3000003000010000000000000000000000000000000000000000
00000000000000000000000000000000000000000100000000003bbbbbb30000000000033bbb300003b300001000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000003bbbb3300000000000000333000003b300000000000000000000000000000000000000000000
00000000000000000000700000000000000000010000000000000333300000000000000000000000003000000010000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000555550000500555550000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000005500055005005505055000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000005505055005005550555000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000005500055005005505055000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000555550050000555550000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000066000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000066000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000066066606660066066606600666060000000066066606660666000000000000000000000000000000000000000
00000000000000000000000000000000000000606060600600600006006060606060000000600060606660600006000000000000000000000000000000000000
00000000000000000000000000000000000000606066000600600006006060666060000000600066606060660000000000000000000000000000000000000000
00000000000000000000000000000000000000606060600600606006006060606060000000606060606060600006000000000000000000000000000000000000
00000000000000000000000000000000000000660060606660666066606060606066600000666060606060666000000000000000000000000000000000000000
00000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000
000000000000000eee0eee0ee00ee00e0e00000eee0e0e00ee0eee00ee00ee0ee000000000033000330333030000000333033303330333030300000000000000
000000000000000eee0e0e0e0e0e0e0e0e000000e00e0e0e0e0e0e0e000e0e0e0e00007000030303030300030000000303030003030303030300000000000000
000000000000000e0e0eee0e0e0e0e0eee000000e00eee0e0e0ee00eee0e0e0e0e00077700030303030330030000000360033003300330033300000000000000
000000000000000e0e0e0e060e0e0e000e000000e00e0e0e0e0e0e000e0e0e0e0e00007000030303030300030000000303030003030303000300000000000000
000000000000000e0e0e0e0eee0eee0eee000000e00e0e0ee00e0e0ee00ee00e0e00000000030303300333033300000333033303030303033300000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000066600660660000006660606000000cc0ccc0ccc00cc0cc000cc00cc0ccc0cc00cc00ccc0c0c0cc00ccc0cc00000000000000000000
00000000000000000000006660606060600000606060600000c0000c00c0c0c0c0c0c0c000c000c0c0c0c0c0c0c0c0c0c00c00c0c00c00000000000000000000
00000000000000000000006060606060600000660066600000ccc00c00cc00c0c0c0c0c000ccc0ccc0c0c0c0c0ccc0ccc00c00ccc00c00000000000000000000
0000000000000000000000606060606060000060600060000000c00c00c0c0c0c0c0c0c0c000c0c0c0c0c0c0c000c000c00c0000c00c00000000000000000000
00000000000000000000006060660066600000666066660000cc000c00c0c0cc00c0c0ccc0cc00c0c0c0c0ccc000c000c0ccc000c0ccc0000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000066606060066066600660000066606060000022202220222022202020202022202220220022200220222000000000000000000000
00000000000000000000000066606060600006006000000060606060000022202000020020202020202022202020202020202020020000000000000000000000
00000000000000000000000060606060666006006000000066006660000020202200020022202220202020202220202022002020020000000000000000000000
00000000000000000000000060606060006006006000000060600060000020202000020020202020202020202020202020202020020000000000000000000000
00000000000000000000000060600660660066600660000066606660000020202220020020202020022020202020202022202200222000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000077077707770700000007070000077700770000077707770077077707770000077707770700077700000000000000000000000
00000000000000000000000000700067007070700000007070000007007070000070707070700007007000000070000700700070000000000000000000000000
00000000000000000000000000700007007700700077707070000007007070000077707770777007007700000077000700700077000000000000000000000000
00000000000000000000000000700007707070700000007770000007007070000070007070007007007000000070000700700070000000000000000000000000
00000000600000000000000000077007007070777000000700000007007700000070007070770007007770000070007770777077700000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000200000000030303030303030300040002020000000303030303030303000000020200000000001313131302020300020202020202000013131313020200000000000000000002131313130000000000000000000000001313131300000002020202020202
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0002000036370234702f3701d4702a37017470273701347023370114701e3700e4701a3600c46016350084401233005420196001960019600196003f6003f6003f6003f6003f6003f6003f6003f6003f6003f600
0002000011070130701a0702407000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000300000d07010070160702207000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000200000642008420094200b420224402a4503c6503b6503b6503965036650326502d6502865024640216401d6401a64016630116300e6300b62007620056100361010600106000060000600006000060000600
000400000f0701e070120702207017070260701b0602c060210503105027040360402b0303a030300203e02035010000000000000000000000000000000000000000000000000000000000000000000000000000
000300000970009700097000970008700077000670005700357003470034700347003470034700347003570035700357003570035700347003470034700337003370033700337000070000700007000070000700
00030000241700e1702d1701617034170201603b160281503f1402f120281101d1101011003110001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
00020000101101211014110161101a120201202613032140321403410000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
00030000070700a0700e0701007016070220702f0702f0602c0602c0502f0502f0402c0402c0302f0202f0102c000000000000000000000000000000000000000000000000000000000000000000000000000000
0003000005110071303f6403f6403f6303f6203f6103f6153f6003f6003f600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600
000c0000242752b27530275242652b26530265242552b25530255242452b24530245242352b23530235242252b22530225242152b21530215242052b20530205242052b205302053a2052e205002050020500205
000500000373005731077410c741137511b7612437030371275702e5712437030371275702e5712436030361275602e5612435030351275502e5512434030341275402e5412433030331275202e5212431030311
000300001f3302b33022530295301f3202b32022520295201f3102b31022510295101f3002b300225002950000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400000c5501c5601057023570195702c5702157037570285703b5702c5703e560315503e540315303e530315203f520315203f520315103f510315103f510315103f510315103f50000500005000050000500
000400002f7402b760267701d7701577015770197701c750177300170015700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700
00030000096450e655066550a6550d6550565511655076550c655046550965511645086350d615006050060500605006050060500605006050060500605006050060500605006050060500605006050060500605
000b00002935500300293453037030360303551330524300243050030013305243002430500300003002430024305003000030000300003000030000300003000030000300003000030000300003000030000300
000600001877035770357703576035750357403573035720357103570000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700
28100000114551945520455114551945520455114551945511455194551e45511455194551e455114551945512455194551d45512455194551d455124551945514455194551b45514455194551b4551445519455
00100000014521940201452014520d452114020145201452114020145201452114020d45211402014520145206452194020645206452124521940206452084521940208452084521940214452004020845208452
011000002525518005240052425524005240052525524005240052425524205240052725524005292552400525255240052400524255240052400525255240052400524255242052400527255240052925524005
011000001805324605186542465524655246052465518053277042465524655180532465524605246552460518053246051865424655246552460524655180532770424655246551805324655246052465524605
2910000016355193551d35516355193551d355163551935515355193551d35515355193551d355153551935514355193551d35514355193551d355143551935513355193551b35513355193551b3551335519355
2910000012355193551b35512355193551b355123551935512355193551b35512355193551b355123551935514355193551b35514355193551b355143551935514355183551b35514355183551b3551435518355
011000000a4520a402000020a45216452000020a45200002094520000200002094521545200002094520000208452000020000208452144520000208452000020745200002000020745213452000020745200002
011000000645200002000020645212452000020645200002000020645200002124520645200002064520000208452000020000208452144520000208452000020000208452000021445208452000020845200002
011000000645200002000020645212452154020645200002000020645200002124520645200002064520000208452084020000208452144520000208452000020000208452000021445208452000020845200002
29100000194551d45520455194551d45520455194551d455184551b45520455184551b45520455184551b45516455194551d45516455194551d45516455194551145514455194551145514455194551145514455
2910000012455164551945512455164551945512455164551145514455194551145514455194551145514455124551645519455124551645519455124551645514455184551b45514455184551b4551445518455
0110000001352000000d3520000001352000000d3520000000352000000c3520000000352000000c352000000a3520000016352000000a3520000016352000000535200000113520000005352000001135200000
011000000635200000123520000006352000001235200000053520000011352000000535200000113520000006352000001235200000063520000012352000000835200000143520000008352000001435200000
0010000003625246150060503615246251b61522625036150060503615116253361522625006051d6250a61537625186152e6251d615006053761537625186152e6251d61511625036150060503615246251d615
__music__
00 52531312
00 52141312
00 14151312
00 14151312
00 14151312
00 14151a17
00 14151b1c
00 141e151c
00 141d151b
00 141e151c
00 14181516
02 141a1517
00 5c5b5a44
00 5d5b5a44
00 5f615a44
00 5f5a6144
00 5e5a6244
02 605a6444
00 41424344
00 41424344
01 6a676944
00 6a676944
00 6f6b6944
00 6f6b6c44
00 6f6b6944
00 6f6b6c44
00 6e6d7044
00 74716744
02 75726744
00 41424344
00 3d7e4344
00 3d7e4344
00 3d4a4344
02 3d3e4344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
01 383a3c44
02 393b3c44
