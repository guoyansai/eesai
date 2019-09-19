<%
'@@0manage/1s_udbb/2*ef/3list|list-s|zhi|zhi-g|zhi-k|tree|tree-g|tree-k|yun|zhi-m|zhi-xa|zhi-xb/4page/5psize/6ssx/7ssm/8ssf/9ssp/10sss.HTML
'@@0manage/1s_udbb/2*ef/3edit|add|del|del-x/4*id|*sn/*dx.HTML

'@@0s_udbb/1*ef/2list|list-s|zhi|zhi-g|zhi-k|tree|tree-g|tree-k|yun|zhi-m/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0s_udbb/1*ef/2edit|add|del/3*id|*sn/*dx.HTML
'@@0s_udbb/1*ef/2show|info/3*sn.HTML

if e_xa<1 and (aibj(g_u0,s_udbb) or aibj(g_u1,s_udbb)) then
e_xa=e_xa+1
Call epread(s_udbb)
e_sks=1
Call esq()
if not ewxlt() then
Response.Redirect(u_login)
Response.End()
end if
if aibj(g_u0,s_umgl) then
Call doq(1,e_uer,8,g_u0,s_udbb,g_u2)
else
Call doq(1,e_uer,8,g_u0,s_udbb,g_u1)
end if
if aibj(g_u0,s_udbb) and (aibj(g_u1,"index") or ainull(g_u1)) then
'Call bbindex()
'if ainull(g_u2) then Response.Redirect(eshref(s_udef&g_urg&s_umds&"-m1"&g_urz,1))
'e_skc=dosk("c","","index"):Call eflist(0,"")
e_skc=dosk("c","","index")
Call bblist(0)
elseif aibj(g_u0,s_udbb) and aibj(g_u2,s_umfb&"rj") then
Call bbadd(4,0,aistr(g_u3),0)
elseif aibj(g_u0,s_udbb) and (aibj(g_u1,s_umtj) or aibj(g_u1,s_umfb)) then
e_skc=dosk("c","","post")
if ainull(g_u2) then
Call bbadd(0,0,aistr(g_u2),aistr(g_u3))
else
Call bbadd(6,0,aistr(g_u2),aistr(g_u3))
end if
elseif aibj(g_u0,s_udbb) and (aibj(g_u2,s_umtj) or aibj(g_u2,s_umfb)) then
e_skc=dosk("c","","post")
if ainull(g_u3) then
Call bbadd(0,0,aistr(g_u3),aistr(g_u4))
else
Call bbadd(6,0,aistr(g_u3),aistr(g_u4))
end if
elseif aibj(g_u0,s_udbb) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
e_skc=dosk("c","","edit"):Call bbedit(0)
elseif aibj(g_u0,s_udbb) and aibj(g_u2,s_umsc) and aiint(g_u3)>0 then
e_skc=dosk("c","","edit"):Call bbdel(0)
elseif aibj(g_u0,s_udbb) and dkdir(3,g_u2) then
e_skc=dosk("c","","list"):Call bblist(0)
elseif aibj(g_u0,s_udbb) and (aibj(left(g_u2,len(s_umzs)),s_umzs) or aibj(left(g_u2,len(s_umxx)),s_umxx)) and g_u3<>"" then
'SHOW----0
if aibj(left(g_u2,len(s_umzs)),s_umzs) then
e_skc=dosk("c","",s_umzs)
else
e_skc=dosk("c","",s_umxx)
end if
if aibj(right(g_u2,1),"1") then
Call bbshow(1,aistr(g_u3))
elseif aibj(right(g_u2,1),"2") then
Call bbshow(2,aistr(g_u3))
elseif aibj(right(g_u2,1),"3") then
Call bbshow(3,aistr(g_u3))
elseif aibj(right(g_u2,1),"4") then
Call bbshow(4,aistr(g_u3))
elseif aibj(right(g_u2,1),"5") then
Call bbshow(5,aistr(g_u3))
elseif aibj(right(g_u2,1),"6") then
Call bbshow(6,aistr(g_u3))
else
Call bbshow(0,aistr(g_u3))
end if
'SHOW----1
elseif (e_gdj>3 or e_uxy>2) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udbb) and (aibj(g_u3,s_umtj) or aibj(g_u3,s_umfb)) then
Call bbadd(1,1,aistr(g_u4),aistr(g_u5))
elseif (e_gdj>3 or e_uxy>2) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udbb) and aibj(g_u3,s_umxg) and aiint(g_u4)>0 then
Call bbedit(1)
elseif (e_gdj>3 or e_uxy>2) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udbb) and ((aibj(g_u3,s_umsc) and g_u4<>"") or aibj(g_u3,s_umsc&"-x"))then
Call bbdel(1)
elseif (e_gdj>3 or e_uxy>2) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udbb) and dkdir(3,g_u3) then
Call bblist(1)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("c","","sai")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=bblie()
'-----------------------------------
Function bblie(bbfty)
if bbfty="form" then
bblie="ew,sx,dx,jx,xx,sn,bt,ot,nr,up,tm,xi,xy,xt,us,t1,zi,hi,qx,jj,mm,ef"
elseif bbfty="top" then
'@@0bb_id,1bb_sn,2bb_bt,3bb_tm,4bb_hi,5bb_xi,6bb_us,7bb_up,8bb_ot,9bb_xy,10bb_ef,11bb_zi,11bb_um
bblie="bb_id,bb_sn,bb_bt,bb_tm,bb_hi,bb_xi,bb_us,bb_up,bb_ot,bb_xy,bb_ef,bb_zi,bb_um"
elseif bbfty=s_umlb then
'@@bb_id,1bb_ew,2bb_sx,3bb_dx,4bb_jx,5bb_xx,6bb_sn,7bb_bt,8bb_ot,9bb_up,10bb_tm,11bb_xi,12bb_xy,13bb_ef,14bb_zi,15bb_hi,16bb_qx,17bb_jj,18bb_mm,19bb_us,20bb_um
bblie="bb_id,bb_ew,bb_sx,bb_dx,bb_jx,bb_xx,bb_sn,bb_bt,bb_ot,bb_up,bb_tm,bb_xi,bb_xy,bb_ef,bb_zi,bb_hi,bb_qx,bb_jj,bb_mm,bb_us,bb_um"
elseif bbfty="all" then
bblie="bb_id,bb_ew,bb_sx,bb_dx,bb_jx,bb_xx,bb_sn,bb_bt,bb_ot,bb_nr,bb_up,bb_tm,bb_xi,bb_xy,bb_xt,bb_us,bb_um,bb_t1,bb_zi,bb_hi,bb_qx,bb_jj,bb_mm,bb_ef"
end if
End Function
'-----------------------------------
'bbs el
'0=read el mc
'-----------------------------------
Function bbxel(bbfty,bbfel)
bbfel=aiint(bbfel)
if bbfel<100 then bbfel=11660
if bbfty=0 then'read el mc
bbxel=replace(aisrd(bbfel,i_bbbel),"　","")
elseif bbfty=1 then'read tiezi style
bbxel=aiint(right(bbfel,1))
elseif bbfty=2 then'read list style
bbfel=aiint(left(right(bbfel,2),1))
if bbfel=1 then
bbxel=s_umlb&"-s"
elseif bbfel=2 then
bbxel=s_umxs&"-k"
elseif bbfel=6 then
bbxel=s_umds&"-k"
else
bbxel=s_umds
end if
end if
End Function
'-----------------------------------
'top bbs list arr
'=bbrr(bbfnm,bbfps=0ep/1ef/2ssp/3ssf/4ssx/5ssm/6sss)
'-----------------------------------
Function bbrr(bbfnm,bbfps)
Call bbss(0)
Call bbtj(bbfps,0,0)
g_app=""
if bbfnm=0 or ainull(bbfnm) then
bbfnm=i_nmhc
else
bbfnm=aiint(bbfnm)
end if
if e_aiidl<>"" and e_aiidl<>"," then
dim bbdidl
bbdidl=left(e_aiidl,len(e_aiidl)-1)
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
bbwhere=bbwhere&"bb_id not in ("&bbdidl&")"
end if
if e_aiids<>"" and e_aiids<>"," then
dim bbdids
bbdids=left(e_aiids,len(e_aiids)-1)
if ew_cf=0 or (ew_cf=1 and aibj(right(bbfps,len(s_umqb)),s_umqb)) then
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
bbwhere=bbwhere&"bb_id not in ("&bbdids&")"
end if
end if
if gystop(bbfnm,bbbid,bblie("top"),bbbiao,bbwhere,bborder,"") then
bbrr=gysar
end if
End Function
'-----------------------------------
'class all in a channel/ef
'=bbmrr(bbfty=3ef|4bbsn,bbffp)
'-----------------------------------
Function bbmrr(bbfty,bbffp)
dim bbdfp
if e_gdj>1 then
bbwhere=replace(bbwheremo,"bb_xy>0","1=1")
else
bbwhere=bbwheremo
end if
bborder=bbordermo
'EF
if bbfty=3 then
bbdfp=esrfd(0,bbffp,ew_kj)
  if not aibj(bbffp,"0") and not ainull(bbffp) and not aibj(bbffp,s_umqb) then
  if not ainull(bbwhere) then bbwhere=bbwhere&" and "
  bbwhere=bbwhere&"bb_ef='"&bbdfp&"'"
  end if
if aiint(ew_sn)>0 then
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
bbwhere=bbwhere&" "&esrew("bb",ew_sn)&""
end if
if gystop(i_nmtp,bbbid,bblie(s_umlb),bbbiao,bbwhere,bborder,"") then bbmrr=gysar
'BB
elseif bbfty=4 then
dim bbdfp0,bbdfp1
bbdfp=split(bbffp&g_urg,g_urg)
bbdfp0=bbdfp(0)
bbdfp1=bbdfp(1)
if not aibj(bbdfp1,"0") and not ainull(bbdfp1) and not aibj(bbdfp1,s_umqb) then
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
bbwhere=bbwhere&"bb_ef='"&bbdfp1&"'"
end if
  if not aibj(bbdfp0,"0") and not ainull(bbdfp0) and not aibj(bbdfp0,s_umqb) then
  if not ainull(bbwhere) then bbwhere=bbwhere&" and "
  bbwhere=bbwhere&"(bb_sx='"&bbdfp0&"' or bb_dx='"&bbdfp0&"' or bb_sn='"&bbdfp0&"')"
  end if
if aiint(ew_sn)>0 then
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
bbwhere=bbwhere&" "&esrew("bb",ew_sn)&""
end if
if gystop(i_nmtp,bbbid,bblie(s_umlb),bbbiao,bbwhere,bborder,"") then bbmrr=gysar
end if
End Function
'-----------------------------------
'BBS Menu
'=bbmenu(bbfty)
'-----------------------------------
Function bbmenu(bbfty,bbfnm,bbfdw,bbfwd)
bbmenu=bbmenu&"0"&g_gy&ew_sn&g_gy&"0"&g_gy&"0"&g_gy&"1"&g_gy&"00"&g_gy&"index"&g_gy&"网站主页"&g_gy&g_gy&g_gy&g_gy&"0"&g_gy&"2"&g_gy&""&g_gx&"0"&g_gy&ew_sn&g_gy&"0"&g_gy&"0"&g_gy&"1"&g_gy&"00"&g_gy&s_udbb&g_gy&"网站论坛"&g_gy&"论坛"&g_gy&g_gy&g_gy&"0"&g_gy&"2"&g_gy&""
bbmenu=bbmenu&g_gx&efmrr(1,s_udbb)
bbmenu=icmenushow(ep_sx,"",bbmenu,g_u0&g_u1,70,bbfnm,"14px","45px","1|"&bbfdw&"|100%|"&bbfwd)
End Function
'-----------------------------------
'select form
'=bbselect(bbfnm,bbfva,bbfdx)
'-----------------------------------
Function bbselect(bbfnm,bbfva,bbfdx)
dim bbljx,bbldx,bbleps,bblii
bbselect=""
bbselect=bbselect&"<select class=""f-sa"" name="""&bbfnm&""" id="""&bbfnm&""">"
bbselect=bbselect&"<option value=""0"">作为顶级"&s_udbbs&"</option>"
bbwhere=bbwheremo
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
if not ainull(bbfva) and not aibj(bbfva,"0") and aibj(bbfdx,"0") then
bbwhere=bbwhere&"(bb_dx='"&bbfva&"' or bb_sn='"&bbfva&"')"
elseif not ainull(bbfdx) and not aibj(bbfdx,"0") then
bbwhere=bbwhere&"(bb_dx='"&bbfdx&"' or bb_sn='"&bbfva&"')"
else
bbwhere=bbwhere&"bb_dx='0'"
end if
bborder=bbordermo
if gystop(i_nmtp,bbbid,bblie(s_umlb),bbbiao,bbwhere,bborder,"") then
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
bbselect=bbselect&"<option"
if lcase(bbfva)=lcase(gysay(6)) then bbselect=bbselect&" selected"
bbselect=bbselect&" value="""&gysay(6)&""""
bbljx=aiint(gysay(4))-1
if bbljx=0 then bbselect=bbselect&" style=""color:#FF0000;"""
bbselect=bbselect&">"
if bbljx>0 then
For bblii=1 To bbljx
bbselect=bbselect&"——"
Next
end if
bbselect=bbselect&gysay(7)
if aibj(g_u0,s_umgl) then bbselect=bbselect&"("&gysay(6)&")"
bbselect=bbselect&"</option>"
next
else
bbselect=bbselect&""
end if
bbselect=bbselect&"</select>"
End Function
'-----------------------------------
'class all in a channel
'=bball(bbfep)
'-----------------------------------
Function bball(bbfep)
bbwhere=bbwheremo
if bbfep<>"" and bbfep<>"0" and bbfep<>"-" then
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
bbwhere=bbwhere&"bb_ep='"&bbfep&"'"
end if
bborder=bbordermo
if gystop(i_nmtp,bbbid,bblie(s_umlb),bbbiao,bbwhere,bborder,"") then
bball=gysar
end if
End Function
'-----------------------------------
'menu show
'=bbme(bbfsx,bbfys,bbfdx,bbfva,bbfsz)
'-----------------------------------
Function bbme(bbfsx,bbfys,bbfdx,bbfva,bbfsz)
dim bbljx,bbldx,bbleps,bblii
bbme=""
bbwhere=bbwheremo
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
if not ainull(bbfva) and not aibj(bbfva,"0") and aibj(bbfdx,"0") then
bbwhere=bbwhere&"(bb_dx='"&bbfva&"' or bb_sn='"&bbfva&"')"
elseif not ainull(bbfdx) and not aibj(bbfdx,"0") then
bbwhere=bbwhere&"(bb_dx='"&bbfdx&"' or bb_sn='"&bbfdx&"')"
else
bbwhere=bbwhere&"bb_dx='0'"
end if
bborder=bbordermo
if gystop(i_nmtp,bbbid,bblie(s_umlb),bbbiao,bbwhere,bborder,"") then
bbme=bbme&"<div"
if aiint(bbfsz)>1 then
bbme=bbme&" style=""font-size:"&aiint(bbfsz)&"px;"">"
else
bbme=bbme&">"
end if
bbme=bbme&icmenushow("","",gysar,bbfva,icmenutype(bbfys),0,14,28,"4|0||0")&"</div>"
else
bbme=bbme&""
end if
End Function
'-----------------------------------
'add/edit form
'=bbform()
'-----------------------------------
Function bbform(bbfty,bbfqx,bbfsn,bbfdx)
if bbfty>5 and not bbxht(bb_us,bb_ef,bb_bt) then
bbform=bbform&"<div class=""c-i"">提示：你不能回复这个帖子。</div>"
else
dim bbdupd
if bbfty=0 or bbfty=4 or bbfty>5 then
bb_ew=ef_ew
if aibj(bb_ew,"0") then bb_ew=ep_ew
if aibj(bb_ew,"0") then bb_ew=ew_sn
bb_sx=bbfsn
bb_us=e_uer
  if uk_mc<>"" then
  bb_um=uk_mc
  elseif e_ubt<>"" then
  bb_um=e_ubt
  elseif not ainull(e_uer) then
  bb_um=e_uer
  else
  bb_um=aiip()
  end if
  if bbfty=4 and not ainull(bbfsn) then
  bb_sn=bbfsn&"-BB"&aisn(1)
  else
  bb_sn="BB"&aisn(1)
  end if
bb_jx=1
bb_xi=0
bb_hi=0
bb_zi=0
bb_qx=0
bb_jj=0
bb_bt="":bb_nr=""
  if bbfqx>0 then
  bb_xy=1
  elseif e_uxy>0 or e_gdj>0 then
  bb_xy=1
  else
  bb_xy=ew_sh
  end if
bb_tm=now()
bb_t1=date()
if bbfqx=1 then
bb_ef=g_u2
  if not ainull(g_u5) then
  bb_dx=g_u5
  else
  bb_dx=0
  end if
  if not ainull(g_u4) then
  bb_sx=g_u4
  else
  bb_sx=0
  end if
else
bb_ef=g_u1
  if not ainull(g_u4) then
  bb_dx=g_u4
  else
  bb_dx=0
  end if
  if not ainull(g_u3) then
  bb_sx=g_u3
  else
  bb_sx=0
  end if
end if
if bbfty=4 then
bb_dx=0
bb_sx=0
end if
if aibj(bb_ef,s_umqb) or ainull(bb_ef) or bb_ef="0" or g_u1="add" then bb_ef=w_bbmo
if bbfty>5 then
bb_xt=espxx("回帖"&i_gg&e_uer)
else
bb_xt=espxx("发帖"&i_gg&e_uer)
end if
bb_up=""
else
bb_t1=date()
bb_xt=bb_xt&espxx("修改"&i_gg&e_uer)
end if
bbdupd=esupcc(s_udbb,bb_sn)
if bbfty>6 then
bbform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""&eshref(replace(g_ustring,g_u2&g_urg,s_umfb&g_urg),66)&""" method=""post""><ul>"
else
bbform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
end if
if bbfqx=1 then
bbform=bbform&icflsr(5,"标题","","bt","",0,200,"*请输入帖子标题","",bb_bt)&icflsr(25,"编码","","sn","",3,50,"*仅限英文(小写)和数字用","",bb_sn)&icflxz(25,"状态","xy","","","f-s",bb_xy,0,i_bxy)
else
bbform=bbform&icflsr(10,"标题","","bt","",0,200,"*请输入帖子标题","",bb_bt)&aiinput("hidden","sn","",0,0,"","",bb_sn)&aiinput("hidden","xy","",0,0,"","",bb_xy)
end if
if bbfqx=1 then
bbform=bbform&icflot(10,"分类",efselect(3,0,"ef",s_udbb,bb_ef))
if len(bb_dx)<3 then
if bbfty=1 then
bbform=bbform&icflot(10,"上级",bbselect("sx",bb_sx,bb_dx)&" <input type=""checkbox"" name=""tx"" id=""tx"" value=""1"">位列其下.")
else
bbform=bbform&icflot(10,"上级",bbselect("sx",bb_sx,bb_dx))
end if
else
if bbfty=1 then
bbform=bbform&icflot(10,"上级",replace(bbselect("sx",bb_sx,bb_dx),"作为顶级"&s_udbbs&"","请选择您回复的帖子")&" <input type=""checkbox"" name=""tx"" id=""tx"" value=""1"">位列其下.")
else
bbform=bbform&icflot(10,"上级",replace(bbselect("sx",bb_sx,bb_dx),"作为顶级"&s_udbbs&"","请选择您回复的帖子"))
end if
end if
else
if (bbfty=0 or bbfty=4) and (aibj(g_u1,s_umtj) or aibj(g_u1,s_umfb) or aibj(g_u1,s_umqb) or ainull(g_u1)) then
bbform=bbform&icflot(10,"分类",efselect(3,0,"ef",s_udbb,bb_ef))
else
bbform=bbform&aiinput("hidden","ef","",0,0,"","",bb_ef)
end if
bbform=bbform&aiinput("hidden","sx","",0,0,"","",bb_sx)
end if
'if bbfqx=1 then 

bbform=bbform&icflot(10,"内容",esedit(esnr(bb_nr),"nr",8))
if bbfqx=0 then bbform=bbform&icflot(10,"选填","<input type=""checkbox"" id=""more"" name=""more"" value=""1"" onClick=""if (this.checked){document.getElementById('easmid').style.display='';}else{document.getElementById('easmid').style.display='none';}""> <label for=""more"">高级属性选项</label>")&"<ul id=""easmid"" style=""display:none;"">"
bbform=bbform&icflot(10,"封面",aiinput("","up","",0,200,"显示在列表页面的封面图片","f-up",bb_up)&esup("0|0|"&bb_sn&"|"&bbdupd&"|0|AsaiForm|up|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees"))
if not bbfty>6 then
bbform=bbform&icflsr(10,"简介","","ot","",0,200,"请简单介绍一下帖子的主要内容或亮点","",bb_ot)
else
bbform=bbform&aiinput("hidden","ot","",0,0,"","",bb_ot)
end if
if bbfqx=1 or aiint(e_uid)>0 then
if not bbfty>6 then
bbform=bbform&icflsr(5,"密钥","","mm","",3,50,"输入密钥，只有知道密钥的会员和自己可以打开查看","",aimm(g_gmm,bb_mm,1))&icflxz(25,"浏览","qx","","*","f-s",bb_qx,0,i_bepqx&"|参贴浏览|回复浏览")&icflsr(25,"数量","","jj","",6,50,"当你选择消耗方式浏览权限时，如金币数量、等级、经验、金钱等，在这里填入消耗的数量。为空或0的时候消耗系统默认数量。","",bb_jj)
else
bbform=bbform&aiinput("hidden","mm","",0,0,"","",bb_mm)&aiinput("hidden","qx","",0,0,"","",bb_qx)&aiinput("hidden","jj","",0,0,"","",bb_jj)
end if
if bbfqx=0 then bbform=bbform&aiinput("hidden","us","",0,0,"","",bb_us)&aiinput("hidden","um","",0,0,"","",bb_um)
else
bbform=bbform&aiinput("hidden","us","",0,0,"","",bb_us)&aiinput("hidden","um","",0,0,"","",bb_um)&aiinput("hidden","mm","",0,0,"","",bb_mm)&aiinput("hidden","jj","",0,0,"","",bb_jj)&aiinput("hidden","qx","",0,0,"","",bb_qx)
end if
if bbfqx=1 then
bbform=bbform&icflsr(25,"点击","","hi","",6,50,"","",bb_hi)&icflsr(25,"回复","","zi","",6,50,"","",bb_zi)&icflsr(25,"我顶","","xi","",6,50,"分类我顶次数","",bb_xi)&icflot(25,"网站",ewselect(1,bb_ew))
bbform=bbform&icflsr(25,"用户","","us","",66,50,"*","",bb_us)&icflsr(25,"发布","","um","",0,200,"*","",bb_um)&icflsr(25,"时间","","tm","",99,200,"添加时间","",bb_tm)&icflsr(25,"更新","","t1","",99,200,"*","",bb_t1)&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script></li>"
if bbfty=1 then bbform=bbform&icflsr(25,"顶级","","dx","",0,200,"*","",bb_dx)&icflsr(25,"级深","","jx","",6,50,"分类级深","",bb_jx)&icflsr(5,"内序","","xx","",0,200,"*","",bb_xx)
bbform=bbform&"</ul><ul>"&icflot(10,"点评",eseditxt(bb_xt,"xt",1))
else
bbform=bbform&aiinput("hidden","hi","",0,0,"","",bb_hi)&aiinput("hidden","zi","",0,0,"","",bb_zi)&aiinput("hidden","xi","",0,0,"","",bb_xi)&aiinput("hidden","ew","",0,0,"","",bb_ew)&aiinput("hidden","tm","",0,0,"","",bb_tm)&aiinput("hidden","t1","",0,0,"","",bb_t1)&aiinput("hidden","dx","",0,0,"","",bb_dx)&aiinput("hidden","jx","",0,0,"","",bb_jx)&aiinput("hidden","xx","",0,0,"","",bb_xx)&aiinput("hidden","xt","",0,0,"","",bb_xt)
end if
if bbfqx=0 then bbform=bbform&"</ul>"
bbform=bbform&icflot(10,"验证",eskyx(1,1,2))
if bbfty=1 then
bbform=bbform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",bb_id)&aiinput("hidden","y_sn","",0,0,"","",bb_sn)&aiinput("hidden","y_jx","",0,0,"","",bb_jx)&aiinput("hidden","y_dx","",0,0,"","",bb_dx)&aiinput("hidden","y_sx","",0,0,"","",bb_sx)&aiinput("hidden","y_xx","",0,0,"","",bb_xx)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif bbfty=0 then
bbform=bbform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umfbs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif bbfty=4 then
bbform=bbform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umfbs&ef_bt)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif bbfty>6 then
bbform=bbform&icflot(10,"",aibutton(2,"","","f-sb f-skx","快捷回复")&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif bbfty>5 then
bbform=bbform&icflot(10,"",aibutton(2,"","","f-sb f-skx","回复")&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
bbform=bbform&aiinput("hidden","lq","",0,0,"","",d_bblq)&"<div class=cr></div></ul></form></div>"
end if
End Function
'-----------------------------------
'=bbxlq(bbfef,bbfel,bbflq)
'-----------------------------------
Function bbxlq(bbfel,bbflq)
if ainull(bbflq) then
'response.Write bbfel&"|"&bbflq
if ainull(bbfel) then
bbxlq=bbxel(1,ew_ll)
else
bbxlq=bbxel(1,bbfel)
end if
if bbxlq=1 or bbxlq=2 or bbxlq=3 or bbxlq=5 then
bbxlq=s_umzs&bbxlq
else
bbxlq=s_umxx&bbxlq
end if
else
bbxlq=bbflq
end if
End Function
'-----------------------------------
'=bbxre(bbfty,bbfsn)
'-----------------------------------
Function bbxre(bbfty,bbfsn)
dim bbdusw
if not ainull(e_uer) then
bbdusw=" and bb_us='"&e_uer&"'"
else
bbdusw=" and bb_um='"&aiip()&"'"
end if
if bbfty=1 then
bbxre=gyscc("bb_id",bbbiao,"bb_sx='"&bbfsn&"'"&bbdusw&"")
else
bbxre=gyscc("bb_id",bbbiao,"(bb_dx='"&bbfsn&"' or bb_sx='"&bbfsn&"')"&bbdusw&"")
if not bbxre then
dim bbddx
bbddx=gysro("bb_dx",bbbiao,"bb_sn='"&bbfsn&"'","")
if bbddx<>"" and bbddx<>"0" then
bbxre=gyscc("bb_id",bbbiao,"bb_dx='"&bbddx&"'"&bbdusw&"")
else
bbxre=false
end if
end if
end if
End Function
'-----------------------------------
'add action
'=bbadd()
'-----------------------------------
Function bbadd(bbfty,bbfqx,bbfsn,bbfdx)
dim bbadts
if bbfty=6 then
if ainull(bb_bt) then call gysread("bb_bt,bb_ef,bb_us,bb_um",bbbiao,"bb_sn='"&bbfsn&"'","")
ew_bt="回复:"&bb_bt&","&ew_bt:ew_zt="回复:"&bb_bt&","&ew_zt:ew_nr="回复:"&bb_bt&","&ew_nr:ew_cp=e_uer&","&ew_cp
e_wl=e_wl&"<li>"&"回复："&bb_bt&"</li>"
e_mt=esbts(ep_sx,s_udlbb,"回复："&bb_bt&g_gy&eshref(g_ustring,66),"<i>返回上级帖子</i>"&g_gy&eshref(replace(g_ustring,s_umfb&g_urg,s_umzs&g_urg),66)&g_gx&s_udbbs&s_umlbs&g_gy&e_lj0)
else
ew_bt=ef_bt&s_umfbs&s_udbbs&","&ew_bt:ew_zt=ef_bt&s_umfbs&s_udbbs&","&ew_zt:ew_nr=ef_bt&s_umfbs&s_udbbs&","&ew_nr:ew_cp=e_uer&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&ef_bt&s_umfbs&s_udbbs&"</a></li>"
e_mt=esbts(ep_sx,s_udlbb,ef_bt&s_umfbs&s_udbbs&g_gy&e_lj1,"<i>"&s_udbbs&s_umlbs&"</i>"&g_gy&e_lj0)
end if
if esky(1,e_uzy) then
if aireqx("bt,ef,sn,sx") then
if gyscc(bbbid,bbbiao,"bb_sn='"&aireq("sn")&"'") then
e_ma=e_ma&aigo(ef_bt&s_umfbs&s_udbbs&s_ztsb&"[已存在相同的帖子]",1)
else
if aiint(e_uid)=0 then
bbadts="[您的操作需要管理员审核·您可以通过注册账号免去操作审核]"
end if
dim rqsn,rqsx
dim rddx,rdjx,rdxx
rqsn=aireq("sn")
rqsx=aireq("sx")
d_bblq=aireq("lq")
'more tree
if rqsx<>"" and rqsx<>"0" then
Call saik(rs,"select top 1 bb_bt,bb_dx,bb_sx,bb_sn,bb_jx,bb_xx,bb_t1,bb_zi from "&bbbiao&" where bb_sx='"&rqsx&"' or bb_sn='"&rqsx&"' order by bb_xx desc",1,1)
If rs.BOF And rs.EOF Then
else
Do While Not rs.EOF
rddx=rs("bb_dx")
rdjx=aiint(rs("bb_jx"))
rdxx=rs("bb_xx")
if rddx="0" or rdjx=1 then
rdjx=2
rdxx=rdxx&"001"
rddx=rs("bb_sn")
if rqsn="" then rqsn=rddx&"001"
elseif rqsx=rs("bb_sn") then
rdjx=rdjx+1
rdxx=rdxx&"001"
if rqsn="" then rqsn=rqsx&"001"
else
rdxx=left(rdxx,len(rdxx)-3)&right("000"&aixn(aixn(right(rdxx,3),1)+1,0),3)
if rqsn="" then rqsn=rqsx&right(rdxx,3)
end if
exit do
rs.movenext
Loop
end if
Call saig(rs)
'1 tree
else
rddx="0"
rdjx="1"
rdxx="000001-"
Call saik(rs,"select top 1 bb_xx from "&bbbiao&" where bb_dx='0' order by bb_xx desc",1,1)
If rs.BOF And rs.EOF Then
else
Do While Not rs.EOF
rdxx=rs("bb_xx")
rdxx=right("000000"&aixn(aixn(left(rdxx,6),1)+1,0),6)&"-"
exit do
rs.movenext
Loop
end if
Call saig(rs)
end if
'make sn
if rqsn="" then
rqsn=rdxx
else
Call aisn(0)
end if
'update
Call saik(rs,"select "&bblie("all")&" from "&bbbiao&" where bb_sn='"&rqsn&"' or (bb_us='"&e_uer&"' and bb_bt='"&aireq("bt")&"')",1,3)
If rs.BOF And rs.EOF Then
rs.addnew
rs("bb_ew")=aiint(aireq("ew"))
rs("bb_us")=aireq("us")
rs("bb_um")=aireq("um")
rs("bb_up")=aireq("up")
rs("bb_sx")=rqsx
rs("bb_dx")=rddx
rs("bb_jx")=rdjx
rs("bb_xx")=rdxx
rs("bb_sn")=rqsn
rs("bb_bt")=aireq("bt")
rs("bb_ot")=aireq("ot")
rs("bb_nr")=aireq("nr")
rs("bb_xt")=aireq("xt")
rs("bb_t1")=aireq("t1")
rs("bb_zi")=aiint(aireq("zi"))
rs("bb_hi")=aiint(aireq("hi"))
rs("bb_qx")=aiint(aireq("qx"))
rs("bb_jj")=aiint(aireq("jj"))
rs("bb_mm")=aireq("mm")
rs("bb_xy")=aiint(aireq("xy"))
rs("bb_xi")=aiint(aireq("xi"))
rs("bb_tm")=aireq("tm")
rs("bb_ef")=aireq("ef")
rs.update
else
e_ma=e_ma&aigo(ef_bt&s_umfbs&s_udbbs&s_ztsb&"[你发布过相同的帖子]",1)
'Response.End()
end if
Call saig(rs)

'do app
if (not aibj(rqsx,"0") or not ainull(rqsx)) and ((not aibj(rddx,"0") or not ainull(rddx)) and not aibj(rqsx,rddx)) then
Call gysgx(bbbiao,"bb_zi=bb_zi+1","bb_sn='"&rqsx&"' or bb_sn='"&rddx&"'")
elseif not aibj(rqsx,"0") or not ainull(rqsx) then
Call gysgx(bbbiao,"bb_zi=bb_zi+1","bb_sn='"&rqsx&"'")
elseif (not aibj(rddx,"0") or not ainull(rddx)) and not aibj(rqsx,rddx) then
Call gysgx(bbbiao,"bb_zi=bb_zi+1","bb_sn='"&rddx&"'")
end if

if i_xkuhy>0 and i_xkuhj=1 and aiint(e_uid)>0 then
if gysgx(w_dbqz&"us","us_jb=us_jb+"&i_jcjb&",us_jy=us_jy+"&i_jcjy*2&"","us_id="&e_uid&"") then e_ma=e_ma&usergx(0,"jb",e_ujb+i_jcjb)
end if
'response.Write bbfqx&"|"&bbfty&"|"&ef_el&"|"&aireq("lq")&"<br />"
'response.Write e_lj0&"<br />"
'response.Write bbxlq(ef_el,d_bblq)&"<br />"
'response.Write eshref(replace(g_ustring,s_umfb&g_urg,bbxlq(ef_el,d_bblq)&g_urg),66)&"<br />"
'response.Write eshref(s_udbb&g_urg&aireq("ef")&g_urg&bbxlq(ef_el,d_bblq)&g_urg&rqsn&g_urz,66)&"<br />"
if bbfqx=1 then
e_ma=e_ma&aigo(ef_bt&s_umfbs&s_udbbs&s_ztcg&bbadts,e_lj0)
else
if bbfty=6 then
e_ma=e_ma&aitiao(ef_bt&s_umfbs&s_udbbs&s_ztcg&bbadts,eshref(replace(g_ustring,s_umfb&g_urg,bbxlq(ef_el,d_bblq)&g_urg),66),i_nmtz)
else
e_ma=e_ma&aitiao(ef_bt&s_umfbs&s_udbbs&s_ztcg&bbadts,eshref(s_udbb&g_urg&aireq("ef")&g_urg&bbxlq(ef_el,d_bblq)&g_urg&rqsn&g_urz,66),i_nmtz)
end if
end if
end if
else
e_ma=e_ma&aigo(ef_bt&s_umfbs&s_udbbs&s_ztsb&"[请认真填写帖子标题]",1)
end if
else
e_ma=bbform(bbfty,bbfqx,bbfsn,bbfdx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=bbedit()
'-----------------------------------
Function bbedit(bbfqx)
ew_bt=s_umxgs&s_udbbs&","&ew_bt:ew_zt=s_umxgs&s_udbbs&","&ew_zt:ew_nr=s_umxgs&s_udbbs&","&ew_nr:ew_cp=e_uer&","&ew_cp
if bbfqx=1 then
e_mt=esbts(ep_sx,s_udlbb,s_umxgs&s_udbbs&g_gy&eshref(s_umgl&g_urg&s_udbb&g_urg&ef_sn&g_urg&s_umxg&g_urg&g_u4&g_urz,66),"<i>"&ef_bt&s_umfbs&s_udbbs&"</i>"&g_gy&e_lj1&g_gx&"<i>"&s_udbbs&s_umlbs&"</i>"&g_gy&e_lj0)
else
e_mt=esbts(ep_sx,s_udlbb,s_umxgs&s_udbbs&g_gy&eshref(s_udbb&g_urg&ef_sn&g_urg&s_umxg&g_urg&g_u4&g_urz,66),"<i>"&ef_bt&s_umfbs&s_udbbs&"</i>"&g_gy&e_lj1&g_gx&"<i>"&s_udbbs&s_umlbs&"</i>"&g_gy&e_lj0)
end if
dim rqsn,rqsx,rdjxl
dim rddx,rdjx,rdxx
dim rqtx
dim bbscid,bbscsn,bbscjx,bbscdx,bbscsx,bbscxx
Dim rsnum,sqlbb
if aibj(g_u0,s_umgl) then
bbscid=aiint(g_u4)
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udbb&g_urg&ef_sn&g_urg&s_umxg&g_urg&bbscid&g_urz,66)&""">"&s_umxgs&s_udbbs&"</a></li>"
else
bbscid=aiint(g_u3)
e_wl=e_wl&"<li><a href="""&eshref(s_udbb&g_urg&ef_sn&g_urg&s_umxg&g_urg&bbscid&g_urz,66)&""">"&s_umxgs&s_udbbs&"</a></li>"
end if

if esky(1,e_uzy) then
'response.Write aireqx("bt,sn,sx")
if aireqx("bt,sn,sx") and esxbj(s_udbb,aireq("xy"),aireq("us"),aireq("um")) then
bbscid=aiint(aireq("id"))
bbscsn=aireq("y_sn")
bbscjx=aiint(aireq("y_jx"))
bbscdx=aireq("y_dx")
bbscsx=aireq("y_sx")
bbscxx=aireq("y_xx")
rqsx=aireq("sx")
rqsn=aireq("sn")
rqtx=aireq("tx")
d_bblq=aireq("lq")
'if bbscsn=rqsx or bbscsx=rqsn or left(rqsx,len(bbscsx))=bbscsx or left(bbscsx,len(rqsx))=rqsx or left(bbscsx,len(rqsn))=rqsn or left(bbscsn,len(rqsx))=rqsx then
if bbscsn=rqsx or bbscsx=rqsn then
e_ma=e_ma&aigo(s_umxgs&s_udbbs&s_ztsb,1)
Response.End()
Exit Function
elseif rqsx=bbscsx then
rdxx=bbscxx
rddx=bbscdx
rdjx=bbscjx
elseif rqsx="" or rqsx="0" then
rddx="0"
rdjx="1"
Call saik(rs,"select top 1 bb_xx from "&bbbiao&" where bb_dx='0' order by bb_xx desc",1,1)
If rs.BOF And rs.EOF Then
rdxx="000001-"
else
Do While Not rs.EOF
rdxx=rs("bb_xx")
rdxx=right("000000"&aixn(aixn(left(rdxx,6),1)+1,0),6)&"-"
exit do
rs.movenext
Loop
end if
Call saig(rs)
else
if aibj(rqtx,"1") then
sqlbb="select top 1 bb_bt,bb_dx,bb_sx,bb_sn,bb_jx,bb_xx from "&bbbiao&" where bb_sn='"&rqsx&"' order by bb_xx desc"
else
sqlbb="select top 1 bb_bt,bb_dx,bb_sx,bb_sn,bb_jx,bb_xx from "&bbbiao&" where bb_sx='"&rqsx&"' or bb_sn='"&rqsx&"' order by bb_xx desc"
end if
Call saik(rs,sqlbb,1,1)
If rs.BOF And rs.EOF Then
else
Do While Not rs.EOF
rddx=rs("bb_dx")
rdjx=aiint(rs("bb_jx"))
rdxx=rs("bb_xx")
if rqtx="1" then
rdxx=rdxx&"SAI"
rqsx=rs("bb_sx")
else
if rddx="0" or rdjx="1" then
rdjx=2
rdxx=rdxx&"001"
rddx=rs("bb_sn")
elseif rqsx=rs("bb_sn") then
rdjx=rdjx+1
rdxx=rdxx&"001"
else
rdxx=left(rdxx,len(rdxx)-3)&right("000"&aixn(aixn(right(rdxx,3),1)+1,0),3)
end if
end if
exit do
rs.movenext
Loop
end if
Call saig(rs)
end if
'update
sqlbb="select "&bblie("all")&" from "&bbbiao&" where bb_id="&aiint(aireq("id"))&" or (bb_id<>"&aiint(aireq("id"))&" and bb_sn='"&rqsn&"')"
Call saik(rs,sqlbb,1,3)
rsnum=rs.recordcount
if rsnum=1 then
rs("bb_ew")=aiint(aireq("ew"))
rs("bb_us")=aireq("us")
rs("bb_um")=aireq("um")
rs("bb_up")=aireq("up")
rs("bb_sx")=rqsx
rs("bb_dx")=rddx
rs("bb_jx")=rdjx
rs("bb_xx")=rdxx
rs("bb_sn")=rqsn
rs("bb_bt")=aireq("bt")
rs("bb_ot")=aireq("ot")
rs("bb_nr")=aireq("nr")
rs("bb_xt")=aireq("xt")
rs("bb_xy")=aiint(aireq("xy"))
rs("bb_t1")=aireq("t1")
rs("bb_zi")=aiint(aireq("zi"))
rs("bb_hi")=aiint(aireq("hi"))
rs("bb_qx")=aiint(aireq("qx"))
rs("bb_jj")=aiint(aireq("jj"))
rs("bb_mm")=aireq("mm")
rs("bb_ef")=aireq("ef")
rs("bb_xi")=aiint(aireq("xi"))
rs("bb_tm")=aireq("tm")
rs.update
else
e_ma=e_ma&aigo(s_umxgs&s_udbbs&s_ztsb&"[存在相同编码SN的帖子]",1)
Response.End()
Exit Function
end if
Call saig(rs)

'编辑保存
if rqsn<>bbscsn or rqsx<>bbscsx then
sqlbb="select bb_sx,bb_dx,bb_jx,bb_xx from "&bbbiao&" where bb_xx like '"&bbscxx&"%' and bb_sn<>'"&rqsn&"' order by bb_xx desc"
Call saik(rs,sqlbb,1,3)
while not rs.eof 
if rqsn<>bbscsn then'edit sn
if rs("bb_sx")=bbscsn then rs("bb_sx")=rqsn
end if
rs("bb_xx")=rdxx&right(rs("bb_xx"),len(rs("bb_xx"))-len(bbscxx))
rdjxl=aiint(rs("bb_jx"))+rdjx-bbscjx
rs("bb_jx")=rdjxl
if (rddx="0" or rdjx="1") and rdjxl=2 then
rs("bb_dx")=rqsn
else
rs("bb_dx")=rddx
end if
rs.update
rs.movenext 
wend 
Call saig(rs)
end if
'完成

e_ma=e_ma&aitiao(s_umxgs&s_udbbs&s_ztcg,eshref(s_udbb&g_urg&ef_sn&g_urg&bbxlq(ef_el,d_bblq)&g_urg&rqsn&g_urz,66),i_nmtz)
else
e_ma=e_ma&aigo(s_umxgs&s_udbbs&s_ztsb,1)
end if
'edit form
else
if bbfqx=1 and e_gdj>2 then
bbwhere="bb_id="&aiint(g_u4)&""
elseif bbfqx=0 and e_gdj>2 then
bbwhere="bb_id="&aiint(g_u3)&""
else
bbwhere="bb_id="&aiint(g_u3)&" and bb_us='"&e_uer&"'"
end if
if gysread(bblie("all"),bbbiao,bbwhere,"") then
ew_bt=bb_bt&","&ew_bt:ew_zt=bb_bt&","&ew_zt:ew_nr=bb_bt&","&ew_nr
e_ma=bbform(1,bbfqx,bb_sx,bb_dx)&e_ma
else
e_ma=e_ma&aigo(s_udbbs&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=bbdel()
'-----------------------------------
Function bbdel(bbfqx)
ew_bt=s_udbbs&s_umscs&","&ew_bt:ew_zt=s_udbbs&s_umscs&","&ew_zt:ew_nr=s_udbbs&s_umscs&","&ew_nr:ew_cp=e_uer&","&ew_cp
if bbfqx=1 then
bbwhere="bb_id="&aiint(g_u4)
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udbb&g_urg&ef_sn&g_urg&d_sbbls&g_urz,66)&""">"&ef_bt&"</a></li><li class=""active"">"&s_udbbs&s_umscs&"</li>"
else
bbwhere="bb_us='"&e_uer&"' and bb_xy<2 and bb_zi=0 and bb_id="&aiint(g_u3)
e_wl=e_wl&"<li><a href="""&eshref(s_udbb&g_urg&ef_sn&g_urg&d_sbbls&g_urz,66)&""">"&ef_bt&"</a></li><li class=""active"">"&s_udbbs&s_umscs&"</li>"
end if
e_mt=esbts(ep_sx,s_udlbb,s_umscs&s_udbbs,"<i>"&ef_bt&s_umfbs&s_udbbs&"</i>"&g_gy&e_lj1&g_gx&"<i>"&s_udbbs&s_umlbs&"</i>"&g_gy&e_lj0)
if aibj(g_u3,s_umsc&"-x") then
if gysdel(bbbid,bbbiao,0) then e_ma=e_ma&aitiao(s_udbbs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
if gysdel(bbbid,bbbiao,bbwhere) then
e_ma=e_ma&aitiao(s_udbbs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udbbs&s_umscs&s_ztsb,1)
end if
end if
End Function
'-----------------------------------
'=bbxht(bbfus,bbfef,bbfbt)
'-----------------------------------
Function bbxht(bbfus,bbfef,bbfbt)
bbxht=false
if left(bbfbt,1)="#" or left(bbfef,2)="rx" then
elseif left(bbfbt,1)="@" or left(bbfef,2)="rj" then
if aibj(bbfus,e_uer) then bbxht=true
else
bbxht=true
end if
End Function
'-----------------------------------
'show
'=bbshow()
'-----------------------------------
Function bbshow(bbfty,bbfsn)
if e_gdj>1 then
bbwhere=""
elseif e_uid>0 then
bbwhere=" and (bb_us='"&e_uer&"' or bb_xy>0)"
else
bbwhere=" and bb_xy>0"
end if
if gysread(bblie("all"),bbbiao,"bb_sn='"&bbfsn&"'"&bbwhere&"","") then
ew_bt=bb_bt&","&ew_bt:ew_zt=bb_bt&","&ew_zt:ew_nr=bb_bt&","&ew_nr:ew_cp=bb_us&","&ew_cp
if not ainull(bb_nr) then bb_nr=bb_nr&replace(s_ztbb,"本站",ew_mc)
if aiint(bb_hi)>i_nmxhi then
bb_nr=bb_nr&"<b class=tbts><span class=""glyphicon glyphicon-fire""></span>"
if aiint(bb_xy)>1 then bb_nr=bb_nr&" <span class=""glyphicon glyphicon-thumbs-up""></span>"
bb_nr=bb_nr&"</b>"
end if
dim bbdsx,bbdpur,bbdpg,bbdxg,bbdrt,bbdrl,bbdrlrr,bbdrlii,bbdrlin,bbdrlin1,bbdrlins
if ainull(g_u4) then
bbdpg=1
else
bbdpg=aiint(g_u4)
end if
if bbfty=0 then bbfty=bbxel(1,ep_el)
bbdrl=""
if esxbj(s_udbb,bb_xy,bb_us,bb_um) then bbdrl=bbdrl&"<u>编辑</u>"&g_gy&eshref(s_udbb&g_urg&bb_ef&g_urg&s_umxg&g_urg&bb_id&g_urz,66)&g_gx
if bbxht(bb_us,bb_ef,bb_bt) then bbdrl=bbdrl&"<i>回复"&s_udbbs&"</i>"&g_gy&eshref(s_udbb&g_urg&bb_ef&g_urg&s_umfb&g_urg&bb_sn&g_urg&bb_dx&g_urz,66)&g_gx
bbdrl=bbdrl&""&s_umfbs&"新帖"&g_gy&e_lj1&g_gx&""&s_udbbs&s_umlbs&""&g_gy&e_lj0&g_gx

bbdrlrr=split("默认|普通论坛|单贴展示|小树结构|展开小树|大树结构|展开大树","|")
for bbdrlii=1 to ubound(bbdrlrr)
if bbdrlii=1 or bbdrlii=2 or bbdrlii=3 or bbdrlii=5 then
bbdrlin=s_udbb&g_urg&bb_ef&g_urg&s_umzs
bbdrlin1=s_udbb&g_urg&bb_ef&g_urg&s_umxx
else
bbdrlin=s_udbb&g_urg&bb_ef&g_urg&s_umxx
bbdrlin1=s_udbb&g_urg&bb_ef&g_urg&s_umzs
end if
if bbfty=bbdrlii then
d_bblq=right(bbdrlin,4)&bbdrlii
e_wl=e_wl&"<li><a href="""&eshref(s_udbb&g_urg&bb_ef&g_urg&d_bblq&g_urg&bb_sn&g_urz,66)&""">"&bbdrlrr(bbdrlii)&" "&s_udbbs&"</a></li>"
bbdrt=bbdrlrr(bbdrlii)&s_udbbs&g_gy&eshref(bbdrlin1&bbdrlii&g_urg&bb_sn&g_urz,66)
bbdrlins=bbdrlins&"<option selected=""selected"" value="""&eshref(bbdrlin&bbdrlii&g_urg&bb_sn&g_urz,66)&""">"&bbdrlrr(bbdrlii)&"</option>"
else
bbdrlins=bbdrlins&"<option value="""&eshref(bbdrlin&bbdrlii&g_urg&bb_sn&g_urz,66)&""">"&bbdrlrr(bbdrlii)&"</option>"
end if
next
bbdrl=bbdrl&"<select onchange=""window.location=''+this.value+'';"" id=""showstyle"" name=""showstyle"" class=""f-cy b-cq"">"&bbdrlins&"</select>"

bbdpur=eshref(s_udbb&g_urg&bb_ef&g_urg&d_bblq&g_urg&bb_sn&g_urg&g_gp&g_urg&g_u5&g_urz,66)
e_mt=esbts(bbdsx,s_udlbb,bbdrt,bbdrl)
if bbfty=4 then
if bb_dx="0" or ainull(bb_dx) then
if gystop(i_nmtp,bbbid,bblie(s_umlb)&",bb_nr",bbbiao,"(bb_dx='"&bb_sn&"' or bb_sn='"&bb_sn&"')"&bbwhere&"",bbordermo,"") then e_mzs=e_mzs&icmenushow("","k-1 d-1 d-2 d-3",gysar,bb_sn,39,0,14,28,"4|0|12|1")
else
if gystop(i_nmtp,bbbid,bblie(s_umlb)&",bb_nr",bbbiao,"bb_dx='"&bb_dx&"' and bb_xx like '"&bb_xx&"%'"&bbwhere&"",bbordermo,"") then e_mzs=e_mzs&icmenushow("","",gysar,bb_sn,39,0,14,28,"4|0|12|1")
end if
elseif bbfty=6 then
if bb_dx="0" or ainull(bb_dx) then
if gystop(i_nmtp,bbbid,bblie(s_umlb)&",bb_nr",bbbiao,"(bb_dx='"&bb_sn&"' or bb_sn='"&bb_sn&"')"&bbwhere&"",bbordermo,"") then e_mzs=e_mzs&icmenushow("","k-1 d-1 d-2 d-3",gysar,bb_sn,29,0,14,28,"4|0|12|1")
else
if gystop(i_nmtp,bbbid,bblie(s_umlb)&",bb_nr",bbbiao,"bb_dx='"&bb_dx&"' and bb_xx like '"&bb_xx&"%'"&bbwhere&"",bbordermo,"") then e_mzs=e_mzs&icmenushow("","",gysar,bb_sn,29,0,14,28,"4|0|12|1")
end if
else
'--------------------------------top tiezi 0
if bbfty=1 then'普通论坛
e_mz=e_mz&"<table border=0 cellspacing=0 cellpadding=0 class=""c-y k-5 d-2"">"
e_mz=e_mz&"<tr><td colspan=2 class=c-yg></td></tr><tr><td rowspan=3 valign=top class=c-yu>"
e_mz=e_mz&usrqm(26,bb_us,us_xy&g_gg&us_qm&g_gg&us_up&g_gg&us_er&g_gg&bb_um)
e_mz=e_mz&"</td><td class=c-yt>"
e_mz=e_mz&bb_bt
e_mz=e_mz&"</td></tr><tr><td class=c-yh>"
e_mz=e_mz&eshi(4,bb_id,bb_hi)&s_udbbs&"状态："&aisrd(aiint(bb_xy),i_bxy)
if aiint(bb_qx)>0 then e_mz=e_mz&"　浏览权限："&aisrd(aiint(bb_qx),i_bepqx)
e_mz=e_mz&estms(1,bb_tm)
e_mz=e_mz&"</td></tr><tr><td valign=top class=c-yc>"
if ainull(bb_nr) then
e_mz=e_mz&s_ztbr
else
e_mz=e_mz&esmm(aiint(bb_qx),5,aiint(bb_jj),bb_sn,bb_bt,bb_us,esnrgys(esnr(bb_nr),bbdpur,bbdpg),eshref(s_udbb&g_urg&bb_ef&g_urg&d_bblq&g_urg&bb_sn&g_urg&g_u4&g_urg&g_gg&g_urz,66),bb_mm,aimm(g_gmm,g_u5,0))
end if
e_mz=e_mz&esxup(0,bb_up,bb_nr)&"</td></tr>"
if aiint(bb_zi)=0 then e_mz=e_mz&"<tr><td colspan=2 class=c-yg></td></tr></table>"
e_ma=e_ma&e_mz
else'阿赛帖子
icdcb=bb_bt
'if not ainull(bb_ot) and not aibj(bb_ot,"0") then icdcb=icdcb&"<span>"&bb_ot&"</span>"
icdcc=easzy(10,bb_id,bb_sn,bb_ot,bb_bt,bb_nr,bb_mm,aimm(g_gmm,g_u5,0))
'--------------------------------HENG 0
icdcd=eshi(4,bb_id,bb_hi)
icdcd=icdcd&s_udbbs&"状态："&aisrd(aiint(bb_xy),i_bxy)
if aiint(bb_qx)>0 then icdcd=icdcd&"　浏览权限："&aisrd(aiint(bb_qx),i_bepqx)
icdcd=icdcd&estms(1,bb_tm)
if not ainull(bb_um) or not ainull(bb_us) then
icdcd=icdcd&" 发布："
if not ainull(bb_us) and i_xkubq=1 then
icdcd=icdcd&"<a href="&eshref(s_udus&g_urg&s_umzs&g_urg&bb_us&g_urz,66)&" target=_blank>"&usren(bb_um&g_gg&bb_us)&"</a>"
else
icdcd=icdcd&usren(bb_um&g_gg&bb_us)
end if
end if
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdci=""
if i_xkubq>1 then icdci=icdci&usrqm(46,bb_us,us_xy&g_gg&us_qm&g_gg&us_up&g_gg&us_er&g_gg&bb_um)
if ainull(bb_nr) then
icdci=icdci&s_ztbr
else
icdci=icdci&esmm(aiint(bb_qx),5,aiint(bb_jj),bb_sn,bb_bt,bb_us,esnrgys(esnr(bb_nr),bbdpur,bbdpg),eshref(s_udbb&g_urg&bb_ef&g_urg&d_bblq&g_urg&bb_sn&g_urg&g_u4&g_urg&g_gg&g_urz,66),bb_mm,aimm(g_gmm,g_u5,0))
end if
icdcj=esxup(0,bb_up,bb_nr)
icdcm=""
if icskg(ew_pj,ep_pj,0) then icdcm=icdcm&"<div class=""c-l"">"&eshi(1,bb_id,bb_xi)&"</div>"
icdcm=icdcm&esfx()
'--------------------------------CONTENT 1
icdty=9
e_my=e_my&espl(80235,s_udbbs,eshref(s_udbb&g_urg&bb_ef&g_urg&s_umzs&"2"&g_urg&bb_sn&g_urz,66),bb_id,bb_xt,bbbiao,"bb_xt","bb_id","")
e_ma=e_ma&icnr(icdty,s_udbbs,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)&e_my
end if
'--------------------------------top tiezi 1
'--------------------------------LIST 0
if aiint(bb_zi)>0 then
if bbfty=1 then'普通论坛
if gystop(i_nmtp,bbbid,bblie(s_umlb)&",bb_nr",bbbiao,"(bb_sx='"&bb_sn&"' or bb_dx='"&bb_sn&"')"&bbwhere&"",bbordermo,"") then
'if gystop(i_nmtp,bbbid,bblie(s_umlb)&",bb_nr",bbbiao,"bb_dx='"&bb_dx&"' and bb_sn<>'"&bb_sn&"' and bb_xx like '"&bb_xx&"%'"&bbwhere&"",bbordermo,"") then
'@@(ef)**_id,1**_ew,2**_sx,3**_dx,4**_jx,5**_xx,6**_sn,7**_bt,8**_ot,9**_up,10**_tm,11**_xi,12**_xy,13**_ef
'bb add+++14**_zi,15**_hi,16**_qx,17**_jj,18**_mm,19**_us,20**_um,21**_nr
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if aiint(gysay(0))>0 then
e_mzs=e_mzs&"<tr><td colspan=2 class=c-yg></td></tr><tr><td rowspan=3 valign=top class=c-yu>"
e_mzs=e_mzs&usrqm(26,gysay(19),ew_sh&g_gg&""&g_gg&""&g_gg&""&g_gg&gysay(20))
e_mzs=e_mzs&"</td><td class=c-yt>"
e_mzs=e_mzs&"<a href="""&eshref(s_udbb&g_urg&bb_ef&g_urg&d_bblq&g_urg&gysay(6)&g_urz,66)&""">"&gysay(7)&"</a>"
e_mzs=e_mzs&"</td></tr><tr><td class=c-yh>"
e_mzs=e_mzs&s_udbbs&"状态："&aiarr(i_bxy,"|",aiint(gysay(12)))
if aiint(gysay(16))>0 then e_mzs=e_mzs&"　浏览权限："&aisrd(aiint(gysay(16)),i_bepqx)
e_mzs=e_mzs&estms(1,gysay(10))
e_mzs=e_mzs&"</td></tr><tr><td valign=top class=c-yc>"
if ainull(gysay(21)) then
e_mzs=e_mzs&s_ztbr
else
e_mzs=e_mzs&esmm(aiint(gysay(16)),5,aiint(gysay(17)),gysay(6),gysay(7),gysay(19),esnrgys(esnr(gysay(21)),bbdpur,bbdpg),eshref(s_udbb&g_urg&gysay(13)&g_urg&g_u2&g_urg&gysay(6)&g_urg&g_u4&g_urg&g_gg&g_urz,66),gysay(18),aimm(g_gmm,g_u5,0))
e_mzs=e_mzs&replace(s_ztbb,"本站",ew_mc)
if aiint(gysay(15))>i_nmxhi then
e_mzs=e_mzs&"<b class=tbts><span class=""glyphicon glyphicon-fire""></span>"
if aiint(gysay(12))>1 then e_mzs=e_mzs&" <span class=""glyphicon glyphicon-thumbs-up""></span>"
e_mzs=e_mzs&"</b>"
end if
end if
e_mzs=e_mzs&esxup(0,gysay(9),gysay(21))&"</td></tr>"
end if
next
end if
e_mzs=e_mzs&"<tr><td colspan=2 class=c-yg></td></tr></table>"
elseif bbfty=2 then'单贴
else'阿赛帖子

if bb_dx="0" or ainull(bb_dx) then
if gystop(i_nmtp,bbbid,bblie(s_umlb)&",bb_nr",bbbiao,"bb_dx='"&bb_sn&"'"&bbwhere&"",bbordermo,"") then
e_mzs=e_mzs&esbts(ep_sx,s_udlbb,"主题 · 树形回帖","")
e_mzs=e_mzs&icmenushow("","k-1 d-1 d-2 d-3",gysar,bb_sn,21,0,14,28,"4|0|12|1")
end if
else
if gystop(i_nmtp,bbbid,bblie(s_umlb)&",bb_nr",bbbiao,"bb_dx='"&bb_dx&"' and bb_sn<>'"&bb_sn&"' and bb_xx like '"&bb_xx&"%'"&bbwhere&"",bbordermo,"") then
e_mzs=e_mzs&esbts(ep_sx,s_udlbb,"回帖 · 树形回帖","")
e_mzs=e_mzs&icmenushow("","",gysar,bb_sn,21,0,14,28,"4|0|12|1")
end if
end if

end if
end if
'--------------------------------LIST 1
end if
else
e_ma=e_ma&aigo(s_udbbs&s_ztno,1)
end if
e_ma=e_ma&e_mzs
End Function
'-----------------------------------
'bbjb
'=bbjb()
'-----------------------------------
Function bbjb(bbfstr,bbfurl,bbfjb,bbfid)
bbfjb=aiint(bbfjb)
bbfid=aiint(bbfid)
'response.Cookies(w_sn&bbfid&s_udbb)=""
if bbfjb=0 or aiint(Request.Cookies(w_sn&bbfid&s_udbb))>=bbfjb then
bbjb=bbfstr
else
if e_ujb>=bbfjb then
dim bbrjb
bbrjb=aiint(request.Form("jb"))
if bbrjb=0 then
bbjb="<table width=168 border=0 cellspacing=2 cellpadding=5 align=center bgcolor=red><form method=post action="&bbfurl&"><tr><td align=center><input type=hidden name=jb id=jb value="&bbfjb&"><input type=submit onClick=""if(confirm('注意！这个操作将消耗您 "&bbfjb&" 金币(您有金币"&e_ujb&")，请再次确认(您将有约20分钟的时间来查看"&s_udbbs&"，退出登录浏览权失效)。')){return true;}else{return false;}"" value=""花 "&bbfjb&" 金币购买"" style=width:460px></td></tr></form></table>"
else
if i_xkuhy>0 and i_xkuhj=1 and aiint(e_uid)>0 then
if gysgx(w_dbqz&"us","us_jb=us_jb-"&bbrjb&"","us_id="&e_uid&"") then
bbjb=usergx(0,"jb",e_ujb-bbrjb)
Response.Cookies(w_sn&bbfid&s_udbb)=bbrjb
Response.Cookies(w_sn&bbfid&s_udbb).Expires=(now()+1/72)
end if
response.Redirect(bbfurl)
response.End()
end if
end if
else
bbjb="<i>需要金币数达到 "&bbfjb&" 才能查看"&s_udbbs&"(您的金币数为 "&e_ujb&")</i>"
end if
end if
End Function
'-----------------------------------
'list
'=bblist()
'-----------------------------------
Function bblist(bbfqx)
if ainull(ep_el) then ep_el=ew_ll
d_ysl=bbxel(2,ep_el)
dim bbllists,bbllies
bbllists=""
e_mt=esbts(ep_sx,s_udlbb,s_udbbs&s_umlbs&g_gy&e_lj0,"<i>"&s_umfbs&s_udbbs&"</i>"&g_gy&e_lj1)
'do link
dim bblpg,bblps,bblpuq,bblpuh,bblpur,bblgrr,bblms,bblpum,bbdotl
if bbfqx=1 then
bblpum=77
bblpuq=s_umgl&g_urg&s_udbb&g_urg&ef_sn
bblms=g_u3
bblpuh=g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10
bblpur=eshref(bblpuq&g_urg&bblms&g_urg&g_gp&g_urg&g_gp&g_urg&bblpuh&g_urz,bblpum)
bblpg=aiint(g_u4)
bblps=aiint(g_u5)
else
bblpum=66
bblpuq=s_udbb&g_urg&ef_sn
bblms=g_u2
bblpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
bblpur=eshref(bblpuq&g_urg&bblms&g_urg&g_gp&g_urg&g_gp&g_urg&bblpuh&g_urz,bblpum)
bblpg=aiint(g_u3)
bblps=aiint(g_u4)
end if
if ainull(bblms) then bblms=d_sbbls
bbllies=bblie(s_umlb)
if aibj(bblms,s_umds&"-knr") then bbllies=bbllies&",bb_nr"
'list top
if bbfqx=1 then e_ma=e_ma&replace(icmenu("","","1|"&s_udbb,ef_sn,4004,0,14,28,0),s_udbb&g_urg,s_umgl&g_urg&s_udbb&g_urg)
if aibj(left(bblms,len(s_umds&"-m")),s_umds&"-m") then
bbdotl="3|0||1|"&i_wlen
else
bbdotl="3|0||1|"&i_wlen
end if
if bbfqx=1 then
iclls=""&icliqls(2,bblms,eshref(bblpuq&g_urg&g_gg&g_urg&g_urg&g_urg&bblpuh&g_urz,bblpum))&""
else
iclls=""&icliqls(1,bblms,eshref(bblpuq&g_urg&g_gg&g_urg&g_urg&g_urg&bblpuh&g_urz,bblpum))&""
end if
Call bbss(0)
e_mz=e_mz&icliq(iclls,bblpuq&g_urg&bblms,bblpuh,e_gdj,bbfqx,"bb")
Call bbtj(s_udbb&g_urg&ef_sn&g_urg&bblpuh,0,0)

if aibj(bblms,s_umds&"-xa") or aibj(bblms,s_umds&"-xb") then
if ainull(ef_sn) or aibj(ef_sn,s_umqb) then
e_mz=e_mz&ictreexx(bblms,g_u11,"bb",esrew("bb",ew_sn))
else
e_mz=e_mz&ictreexx(bblms,g_u11,"bb","bb_ef='"&ef_sn&"'")
end if
else

if aibj(left(bblms,len(s_umds)),s_umds) or aibj(left(bblms,len(s_umxs)),s_umxs) or aibj(bblms,s_umlb&"-s") then
if bblps<1 then bblps=i_nmlb
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
bbwhere=bbwhere&"bb_sx='0'"
'ew
if aiint(ew_sn)>0 then bbwhere=bbwhere&" and "&esrew("bb",ew_sn)
elseif aibj(bblms,s_umlpy) then
if bblps<1 then bblps=i_nmhc
else'aibj(bblms,s_umlb)
if bblps<1 then bblps=i_nmlb
end if
bborder="bb_tm desc"
'bborder="bb_id desc"
'@@bb_id,1bb_ew,2bb_sx,3bb_dx,4bb_jx,5bb_xx,6bb_sn,7bb_bt,8bb_ot,9bb_up,10bb_tm,11bb_xi,12bb_xy,13bb_ef,14bb_zi,15bb_hi,16bb_qx,17bb_jj,18bb_mm,19bb_us,20bb_um,(21bb_nr)
if gyslist(bbbid,bbllies,bbbiao,bbwhere,bborder,bblpur,bblpg,bblps,200,"") then
if aibj(left(bblms,len(s_umds)),s_umds) or aibj(left(bblms,len(s_umxs)),s_umxs) then
gysaxbb=split(gysar,g_gx)
for gysibb=0 to ubound(gysaxbb)
if gysibb>0 then bbllists=bbllists&g_gx
gysaybb=split(gysaxbb(gysibb),g_gy)
if aibj(ef_sn,s_umqb) or ainull(ef_sn) then
if bbfqx=1 then
bbwhere="bb_dx='"&gysaybb(6)&"' or bb_sn='"&gysaybb(6)&"'"
else
bbwhere="(bb_dx='"&gysaybb(6)&"' or bb_sn='"&gysaybb(6)&"') and bb_xy>0"
end if
else
if bbfqx=1 then
bbwhere="(bb_dx='"&gysaybb(6)&"' or bb_sn='"&gysaybb(6)&"') and bb_ef='"&gysaybb(13)&"'"
else
bbwhere="(bb_dx='"&gysaybb(6)&"' or bb_sn='"&gysaybb(6)&"') and bb_xy>0 and bb_ef='"&gysaybb(13)&"'"
end if
end if
if gystop(i_nmtp,bbbid,bbllies,bbbiao,bbwhere,bbordermo,"") then
bbllists=bbllists&gysar
end if
'if gysibb<ubound(gysaxbb) then bbllists=bbllists&g_gx
next
e_mz=e_mz&icmenushow("","",bbllists,ef_sn,icmenutype(bblms),0,14,28,bbdotl)
else
e_mz=e_mz&icmenushow("","",gysar,ef_sn,icmenutype(bblms),0,14,28,bbdotl)
end if
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if
e_mz=e_mz&iclih(gyspage,e_gdj,bbfqx,eshref(s_umgl&g_urg&s_udbb&g_urg&ef_sn&g_urg&s_umsc&"-x"&g_urz,77),"bb")
end if
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'zhi auto make
'=bbzhix(esfys,esfef)
'-----------------------------------
Function bbzhix(esfys,esfef)
dim bbxai,bbxzjx,bbscjx,bbllxx,bbscxx,bbllsx,bbxzxx
bbzhix=bbzhix&"<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""5"" class=""tree"">"
bbzhix=bbzhix&"<tr class=""l-2""><td>名称</td><td>顶级</td><td>上级</td><td>级深</td><td>内序</td><td>编码</td></tr>"
if aibj(esfef,s_umqb) then
bbwhere=esrew("bb",ew_sn)
else
bbwhere="bb_ef='"&esfef&"'"
end if
bborder="bb_xx asc"
if i_xktr=1 then
if gystop(1,"bb_id","bb_xx",bbbiao,"bb_dx='0'","bb_xx desc","") then
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
bbxai=aixn(left(gysay(0),6),1)
next
else
bbxai=0
end if
end if
bbwhere=" where "&bbwhere&" "
Call saik(rs,"select bb_sn,bb_sx,bb_dx,bb_jx,bb_xx,bb_xt,bb_bt from "&bbbiao&bbwhere&"order by "&bborder&"",1,3)
If rs.BOF And rs.EOF Then
bbzhix=bbzhix&"<tr><td><a href="""&e_lj1&""">请您先添加"&s_udbbs&"！</a></td><td></td><td></td><td></td><td></td><td></td></tr>"
else
Do While Not rs.eof
bbxzjx=aiint(rs("bb_jx"))
bbxzxx=rs("bb_xx")
'jx=1
if bbxzjx=1 or len(bbxzxx)<7 or rs("bb_sx")="0" or rs("bb_dx")="0" then
bbxai=bbxai+1
if i_xktr=1 then
bbllxx=right("000000"&aixn(bbxai,0),6)&"-"
else
if aibj(left(bbxzxx,6),left(bbscxx,6)) then
bbllxx=right("000000"&aixn(aiint(aiint(aixn(left(bbscxx,6),1))+1),0),6)&"-"
elseif left(bbxzxx,6)="000000" then
bbllxx=right("000000"&aixn(bbxai,0),6)&"-"
else
bbllxx=right("000000"&replace(bbxzxx,"-",""),6)&"-"
end if
if left(bbllxx,6)="000000" then bbllxx=right("000000"&aixn(aiint(aiint(aixn(left(bbscxx,6),1))+1),0),6)&"-"
end if
rs("bb_jx")="1"
rs("bb_sx")="0"
rs("bb_dx")="0"
if aibj(esfys,s_umds&"-xb") then
rs("bb_xt")=rs("bb_xt")&espxx("["&rs("bb_sn")&"]重置"&i_gg&e_gmc)
rs("bb_sn")=bbllxx'sn x
end if
'jx>1
else

'jx=2
if bbxzjx=2 then
bbllsx=left(bbscxx,7)
if len(bbscxx)>7 then
bbllxx=bbllsx&right("000"&aixn(aixn(right(left(bbscxx,10),3),1)+1,0),3)
else
bbllxx=bbllsx&"001"
end if
'xzjx>scjs
elseif bbxzjx>bbscjx then
bbllsx=bbscxx
bbllxx=bbllsx&"001"
rs("bb_jx")=bbscjx+1
'xzjx=scjs
elseif bbxzjx=bbscjx then
bbllsx=left(bbscxx,len(bbscxx)-3)
bbllxx=bbllsx&right("000"&aixn(aixn(right(bbscxx,3),1)+1,0),3)
rs("bb_jx")=bbscjx
'xzjx<scjs
elseif bbxzjx<bbscjx then
bbllsx=left(bbscxx,7+(bbxzjx-2)*3)
bbllxx=bbllsx&right("000"&aixn(aixn(right(left(bbscxx,7+(bbxzjx-1)*3),3),1)+1,0),3)
end if

if aibj(esfys,s_umds&"-xb") then'sn x
rs("bb_xt")=rs("bb_xt")&espxx("["&rs("bb_sn")&"]重置"&i_gg&e_gmc)
rs("bb_sn")=bbllxx
rs("bb_sx")=left(bbllxx,len(bbllxx)-3)
rs("bb_dx")=left(bbllxx,7)
end if

end if
rs("bb_xx")=bbllxx
bbscxx=bbllxx
bbscjx=bbxzjx
rs.Update
if bbxai mod 2=0 then
bbzhix=bbzhix&"<tr>"
else
bbzhix=bbzhix&"<tr class=""l-1"">"
end if
bbzhix=bbzhix&"<td>"
for fi=1 to aiint(rs("bb_jx"))
if fi>1 then bbzhix=bbzhix&"—"
next
bbzhix=bbzhix&rs("bb_bt")&"</td><td>"&rs("bb_dx")&"</td><td>"&rs("bb_sx")&"</td><td>"&rs("bb_jx")&"</td><td>"&rs("bb_xx")&"</td><td>"&rs("bb_sn")&"</td></tr>"
rs.movenext
loop
End If
Call saig(rs)
bbzhix=bbzhix&"</table>"
End Function

'-----------------------------------
'=bbss()
'Call bbss()
'-----------------------------------
Function bbss(bbfty)
dim icdspx,icdsfx,icdsxx
icdssp="排序|浏览|回复|内序|我顶|推荐|时间|更新|"
icdspx="bb_xx asc|bb_hi desc|bb_zi desc|bb_xx asc|bb_xi desc|bb_xy desc|bb_tm desc|bb_t1 desc|bb_qx desc|bb_jx desc|"
if e_gdj>2 then icdssp=icdssp&"权限|数量|级深|"

icdssf="范围|推荐|三星|四星|五星|图片|"
icdsfx="|bb_xy>1|bb_xy>2|bb_xy>3|bb_xy>4|(bb_up<>'' and bb_up<>'0' and bb_up<>'null')|"
icdssf=icdssf&"T100|T600|"
icdsfx=icdsfx&"100|600|"
icdssf=icdssf&esqday(0)&"|"
icdsfx=icdsfx&esqday("bb_tm")&"|bb_xy=1|bb_xy=0|"
if e_gdj>2 then icdssf=icdssf&"普通|禁用|"

icdssx="项目|标题|副题|内容|会员|发布|版块|编码|顶级|上级|时间|更新|"
icdsxx="bb_bt|bb_bt|bb_ot|bb_nr|bb_us|bb_um|bb_ef|bb_sn|bb_dx|bb_sx|bb_tm|bb_t1|bb_xt|"
if e_gdj>2 then icdssx=icdssx&"系统|"

if right(icdssp,1)="|" then icdssp=left(icdssp,len(icdssp)-1)
if right(icdssf,1)="|" then icdssf=left(icdssf,len(icdssf)-1)
if right(icdssx,1)="|" then icdssx=left(icdssx,len(icdssx)-1)
icdssm=i_bsm
icdrrp=split(icdspx,"|")
icdrrf=split(icdsfx,"|")
icdrrx=split(icdsxx,"|")
End Function
'-----------------------------------
'=bbtj(bbfstr=频道ep/1分类ef/2排序ssp/3范围ssf/4项目ssx/5模式ssm/6关键词sss,bbffl=分类样式-多选分类|单选分类,bbfty)
'-----------------------------------
Function bbtj(bbfstr,bbffl,bbfty)
dim icdarr,icdsep,icdsef,icdbx
icdarr=split(bbfstr&"//////","/")
bbwhere="6=6"
bborder=bbordermo
icdbx=0
icdsep=trim(icdarr(0))
if aibj(icdsep,s_umqb) or aibj(icdsep,"0") or dkdir(0,icdsep) then icdsep=""
icdsef=trim(icdarr(1))
if aibj(icdsef,s_umqb) or aibj(icdsef,"0") or dkdir(0,icdsef) then icdsef=""
icvsp=aiint(icdarr(2))
icvsf=aiint(icdarr(3))
icvsx=aiint(icdarr(4))
icvsm=aiint(icdarr(5))
icvss=aijie(trim(icdarr(6)))
if aibj(icvss,s_umqb) or aibj(icvss,"0") or dkdir(0,icvss) then icvss=""

'ef
if icdsef<>"" then
icdbx=1
dim icdfvi,icdfvrr,icdfvrrx,icdfvrrxu,icdfvrrxi,icdfvrrxw
'----------------------------------ef0
if aiint(bbffl)>0 then
icdsef=icdsef
if len(icdsef&"0")>3 then
icdfvrr=split(icdsef,g_ura)
for icdfvi=0 to ubound(icdfvrr)
if not aibj(icdsef,s_umqb) and icdfvrr(icdfvi)<>"" then
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
if left(icdfvrr(icdfvi),1)="0" then
'★★★★★this do for tags 0
dim bbltlie,bbltliez,bbltliezrr
bbltlie=right(left(icdfvrr(icdfvi),3),2)
if instr("xy,px,hi,xi,bd,bc,jg,jy,oz,oy",bbltlie)>0 then
bbltliez=right(icdfvrr(icdfvi),len(icdfvrr(icdfvi))-3)
bbltliezrr=split(bbltliez&"-","-")
if bbltliezrr(0)=bbltliezrr(1) then
bbwhere=bbwhere&"bb_"&bbltlie&"="&aiint(bbltliezrr(0))&""
elseif bbltliezrr(0)<>"" and bbltliezrr(1)<>"" then
bbwhere=bbwhere&"bb_"&bbltlie&">="&aiint(bbltliezrr(0))&" and bb_"&bbltlie&"<="&aiint(bbltliezrr(1))&""
elseif bbltliezrr(0)<>"" then
bbwhere=bbwhere&"bb_"&bbltlie&">="&aiint(bbltliezrr(0))&""
elseif bbltliezrr(1)<>"" then
bbwhere=bbwhere&"bb_"&bbltlie&"<="&aiint(bbltliezrr(1))&""
else
bbwhere=bbwhere&icdfvi&"="&icdfvi
end if
else
if not aibj(icdfvrr(icdfvi),s_umqb) then
icdbx=1
bbwhere=bbwhere&"bb_ef like '"&icdfvrr(icdfvi)&"%'"
else
bbwhere=bbwhere&"6=6"
end if
end if
'★★★★★this do for tags 1
else
if instr(icdfvrr(icdfvi),g_urb)>1 or (instr(icdfvrr(icdfvi),g_urb)>0 and right(icdfvrr(icdfvi),len(g_urb))<>g_urb) then
icdfvrrx=split(icdfvrr(icdfvi),g_urb)
icdfvrrxu=ubound(icdfvrrx)
icdfvrrxw=""
for icdfvrrxi=0 to icdfvrrxu
if not ainull(icdfvrrxw) and icdfvrrx(icdfvrrxi)<>"" and not aibj(icdfvrrx(icdfvrrxi),s_umqb) then icdfvrrxw=icdfvrrxw&" or "
if icdfvrrx(icdfvrrxi)<>"" and not aibj(icdfvrrx(icdfvrrxi),s_umqb) then icdfvrrxw=icdfvrrxw&"bb_ef like '"&icdfvrrx(icdfvrrxi)&"%'"
next
if icdfvrrxw<>"" then
bbwhere=bbwhere&"("&icdfvrrxw&")"
else
bbwhere=bbwhere&icdfvi&"="&icdfvi
end if
else
if not aibj(icdfvrr(icdfvi),s_umqb) then
icdbx=1
bbwhere=bbwhere&"bb_ef like '"&icdfvrr(icdfvi)&"%'"
else
bbwhere=bbwhere&"6=6"
end if
end if
end if
end if
next
end if
'cdv 1
else
'ef
icdbx=1
if not ainull(bbwhere) then bbwhere=" and "&bbwhere
'bbwhere="bb_ef='"&icdsef&"'"&bbwhere
bbwhere="bb_ef like '"&icdsef&"%'"&bbwhere
end if
'----------------------------------ef1
end if

'sp
if icvsp>0 then bborder=icdrrp(icvsp)

'ss
if icvss<>"" then
dim icvssrr,icvssi,icvssud,icvsslin
icvssrr=split(icvss," ")
icvssud=ubound(icvssrr)
icvsslin=""
for icvssi=0 to icvssud
if icvsslin<>"" then icvsslin=icvsslin&" or "
if icvssrr(icvssi)<>"" then
if icvsm=2 then
icvsslin=icvsslin&icdrrx(icvsx)&"='"&icvssrr(icvssi)&"'"
else
icvsslin=icvsslin&icdrrx(icvsx)&" like '%"&icvssrr(icvssi)&"%'"
end if
end if
next
if icvsslin<>"" then
bbwhere=bbwhere&" and ("&icvsslin&")"
iclapp=1
icdbx=1
end if
end if

'ew
if aiint(ew_sn)>0 and icdbx>0 then
bbwhere=bbwhere&" and "&esrew("bb",ew_sn)
end if

'sf
if icvsf>0 then
dim icvsflin
icvsflin=icdrrf(icvsf)
if aibj(right(icvsflin,2),"00") then
bbwhere="bb_id in (select top "&aiint(icvsflin)&" bb_id from "&sbbdbqz&"bb where "&bbwhere&" order by bb_id desc)"
else
bbwhere=bbwhere&" and "&icvsflin
end if
end if

'admin
if not aibj(g_u0,s_umgl) or e_gdj<3 then
if instr(bbwhere,"bb_xy>0")=0 then
if not ainull(bbwhere) then bbwhere=bbwhere&" and "
bbwhere=bbwhere&"(bb_xy>0 or bb_us='"&e_uer&"')"
end if
elseif e_gdj>2 then
iclapp=1
end if

bbwhere=replace(replace(bbwhere,"6=6 and ","")," and 6=6","")
End Function
%>