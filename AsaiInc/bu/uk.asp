<%
'@@0manage/1s_uduk/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_uduk/2edit|add|del/3*id.HTML

'@@0s_uduk/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_uduk/1edit|add/2*id.HTML
'@@0s_uduk/1show/2*sn|-.HTML
if e_xa<1 and (aibj(g_u0,s_uduk) or aibj(g_u1,s_uduk)) then
e_xa=e_xa+1
Call epread(s_uduk)
e_sks=1
Call esq()
ep_sn=s_uduk
Call doq(1,e_uer,6,g_u0,s_uduk,s_uduks&s_umlbs)

if e_uxy>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduk) and aibj(g_u2,s_umtj) then
Call ukadd(1)
elseif aibj(g_u0,s_uduk) and aibj(g_u1,s_umtj) then
Call ukadd(0)
elseif e_uxy>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduk) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call ukedit(1)
elseif aibj(g_u0,s_uduk) and aibj(g_u1,s_umxg) then
Call ukedit(0)
elseif e_uxy>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduk) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and not ainull(g_u3) then
Call ukshow(g_u3)
elseif aibj(g_u0,s_uduk) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) and not ainull(g_u2) then
Call ukshow(g_u2)
elseif aibj(g_u0,s_uduk) and aibj(g_u1,s_udukw) and not ainull(g_u2) and ainull(g_u3) then
Call ukshowx(g_u2)
elseif e_uxy>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduk) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call ukdel(1)
elseif aibj(g_u0,s_uduk) and ((aibj(g_u1,s_umsc) and aiint(g_u2)>0) or aibj(g_u1,s_umsc&"-x")) then
Call ukdel(0)
elseif e_uxy>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduk) and dkdir(2,g_u3) then
Call efread(esnff(g_u2))
Call uklist(1)
elseif aibj(g_u0,s_uduk) and dkdir(2,g_u2) then
Call efread(esnff(g_u1))
Call uklist(0)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_uduk) and aibj(g_u4,s_udef) and aibj(g_u5,s_umtj) then
Call ukread(g_u2)
Call epread(g_u3)
e_man=s_udukw&uk_ur&ep_sn
'等待阿赛
Call ukfltj(ep_sn)
e_skc=dosk("d",uk_cy,"admin")
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","uk")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()


elseif e_xa<1 and (aibj(g_u0,s_udukw) or aibj(g_u1,s_udukw)) then
e_xa=e_xa+1
Call esq()
if aibj(g_u0,s_umgl) then
Call doq(4,g_u2,2,g_u0,g_u3,g_u4)
else
Call doq(4,g_u1,2,g_u0,g_u2,g_u3)
end if

if aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) then
e_man=s_udukw&uk_ur&ep_sn
e_skc=ukks(12,uk_cy,uk_kd)
end if

'KJ-----------------------0
if aibj(g_u0,s_umgl) and aibj(g_u3,s_udukw) and not ainull(g_u4) and (aibj(g_u5,s_umxx) or aibj(g_u5,s_umzs)) then'ABOUT MY GL
e_skc=ukks(1,uk_cy,uk_ka):Call ukshow(g_u1)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and aibj(left(g_u3,len(s_umxg)),s_umxg) and g_u4<>"" then
Call eaedit(312,g_u3,g_u4)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and aibj(left(g_u3,len(s_umsc)),s_umsc) and g_u4<>"" then
Call eadel(312,g_u3,g_u4,g_u5)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and aibj(left(g_u4,len(s_umtj)),s_umtj) then
Call eaadd(311,g_u4,g_u5)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and aibj(left(g_u4,len(s_umxg)),s_umxg) and g_u5<>"" then
Call eaedit(311,g_u4,g_u5)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and aibj(left(g_u4,len(s_umsc)),s_umsc) and g_u5<>"" then
Call eadel(311,g_u4,g_u5,g_u6)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and aibj(left(g_u5,len(s_umtj)),s_umtj) then
Call eaadd(310,g_u5,g_u6)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and aibj(left(g_u5,len(s_umxg)),s_umxg) and g_u6<>"" then
Call eaedit(310,g_u5,g_u6)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and aibj(left(g_u5,len(s_umsc)),s_umsc) and g_u6<>"" then
Call eadel(310,g_u5,g_u6,g_u7)

elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u2,len(s_umxg)),s_umxg) and g_u3<>"" then
e_skc=ukks(11,uk_cy,uk_kd):Call eaedit(32,g_u2,g_u3)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u2,len(s_umsc)),s_umsc) and g_u3<>"" then
e_skc=ukks(11,uk_cy,uk_kd):Call eadel(32,g_u2,g_u3,g_u4)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u3,len(s_umtj)),s_umtj) then
e_skc=ukks(4,uk_cy,uk_kd):Call eaadd(31,g_u3,g_u4)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u3,len(s_umxg)),s_umxg) and g_u4<>"" then
e_skc=ukks(4,uk_cy,uk_kd):Call eaedit(31,g_u3,g_u4)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u3,len(s_umsc)),s_umsc) and g_u4<>"" then
e_skc=ukks(4,uk_cy,uk_kd):Call eadel(31,g_u3,g_u4,g_u5)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u4,len(s_umtj)),s_umtj) then
e_skc=ukks(4,uk_cy,uk_kd):Call eaadd(30,g_u4,g_u5)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u4,len(s_umxg)),s_umxg) and g_u5<>"" then
e_skc=ukks(4,uk_cy,uk_kd):Call eaedit(30,g_u4,g_u5)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u4,len(s_umsc)),s_umsc) and g_u5<>"" then
e_skc=ukks(4,uk_cy,uk_kd):Call eadel(30,g_u4,g_u5)

elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and aibj(left(g_u3,len(s_umzs)),s_umzs) and g_u4<>"" then
Call eashow(312,0,g_u4):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and aibj(left(g_u3,len(s_umxx)),s_umxx) and g_u4<>"" then
Call eashow(312,1,g_u4):e_skc=ukks(4,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and aibj(left(g_u4,len(s_umzs)),s_umzs) and g_u5<>"" then
Call eashow(311,0,g_u5):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and aibj(left(g_u4,len(s_umxx)),s_umxx) and g_u5<>"" then
Call eashow(311,1,g_u5):e_skc=ukks(4,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and aibj(left(g_u5,len(s_umzs)),s_umzs) and g_u6<>"" then
Call eashow(310,0,g_u6):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and aibj(left(g_u5,len(s_umxx)),s_umxx) and g_u6<>"" then
Call eashow(310,1,g_u6):e_skc=ukks(4,uk_cy,uk_kd)

elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and ainull(g_u3) then'ABOUT MY
e_skc=ukks(1,uk_cy,uk_ka):Call ukshow(g_u1)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u2,len(s_umzs)),s_umzs) and g_u3<>"" then
Call eashow(32,0,g_u3):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u2,len(s_umxx)),s_umxx) and g_u3<>"" then
Call eashow(32,1,g_u3):e_skc=ukks(4,uk_cy,uk_kd)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u3,len(s_umzs)),s_umzs) and g_u4<>"" then
Call eashow(31,0,g_u4):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u3,len(s_umxx)),s_umxx) and g_u4<>"" then
Call eashow(31,1,g_u4):e_skc=ukks(4,uk_cy,uk_kd)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u4,len(s_umzs)),s_umzs) and g_u5<>"" then
Call eashow(30,0,g_u5):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and aibj(left(g_u4,len(s_umxx)),s_umxx) and g_u5<>"" then
Call eashow(30,1,g_u5):e_skc=ukks(4,uk_cy,uk_kd)

elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and dkdir(2,g_u3) then
Call ealist(312,eshrej(s_umgl,uk_ur,"",1),"",g_u3,g_u4,g_u5,g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and not ainull(g_u3) and dkdir(2,g_u4) then
Call ealist(311,eshrej(s_umgl,uk_ur,ep_sn,1),"",g_u4,g_u5,g_u6,g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10&g_urg&g_u11)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udukw) and not ainull(g_u2) and not ainull(g_u3) and not ainull(g_u4) and dkdir(2,g_u5) then
Call ealist(310,eshrej(s_umgl,uk_ur,ep_sn,1),g_u4,g_u5,g_u6,g_u7,g_u8&g_urg&g_u9&g_urg&g_u10&g_urg&g_u11&g_urg&g_u12)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and ainull(g_u2) and ainull(g_u3) then
e_skc=ukks(1,uk_cy,uk_ka):Call ealist(32,eshrej("",uk_ur,"",1),"",g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and not ainull(g_u2) and ainull(g_u3) and ainull(g_u4) then
e_skc=ukks(2,uk_cy,uk_kb):Call ealist(30,eshrej("",uk_ur,ep_sn,1),g_u3,g_u4,g_u5,g_u6,g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10&g_urg&g_u11)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and not ainull(g_u2) and dkdir(2,g_u3) then
e_skc=ukks(3,uk_cy,uk_kc):Call ealist(31,eshrej("",uk_ur,ep_sn,1),"",g_u3,g_u4,g_u5,g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10)
elseif aibj(g_u0,s_udukw) and not ainull(g_u1) and dkdir(2,g_u4) then
e_skc=ukks(3,uk_cy,uk_kc):Call ealist(30,eshrej("",uk_ur,ep_sn,1),g_u3,g_u4,g_u5,g_u6,g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10&g_urg&g_u11)
end if
'KJ-----------------------1
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("d",uk_cy,"admin")
else
e_skc=dosk("d",uk_cy,"sai")
end if
end if
'------get skin 1
Response.Write esr(ukskin,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=uklie()
'-----------------------------------
Function uklie(ukfty)
if ukfty="form" then
uklie="ew,us,sn,ef,cy,cs,ka,kb,kc,kd,fl,up,mc,bt,co,nr,zt,ur,xy,px,ot,tm,tn,t1,xt"
elseif ukfty="top" then
'@@0uk_id,1uk_sn,2uk_mc.3,uk_tm,4uk_tn,5uk_px,6uk_us,7uk_up,8uk_co,9uk_xy,10uk_ef,11uk_ur
uklie="uk_id,uk_sn,uk_mc,uk_tm,uk_tn,uk_px,uk_us,uk_up,uk_co,uk_xy,uk_ef,uk_ur"
elseif ukfty=s_umlb then
'@@uk_id,1uk_ew,2uk_us,3uk_sn,4uk_up,5uk_mc,6uk_bt,7uk_co,8uk_nr,9uk_zt,10uk_ur,11uk_xy,12uk_px,13uk_tm,14uk_tn
uklie="uk_id,uk_ew,uk_us,uk_sn,uk_up,uk_mc,uk_bt,uk_co,uk_nr,uk_zt,uk_ur,uk_xy,uk_px,uk_tm,uk_tn"
elseif ukfty="all" then
uklie="uk_id,uk_ew,uk_us,uk_sn,uk_ef,uk_cy,uk_cs,uk_ka,uk_kb,uk_kc,uk_kd,uk_fl,uk_up,uk_mc,uk_bt,uk_co,uk_nr,uk_zt,uk_ur,uk_xy,uk_px,uk_ot,uk_tm,uk_tn,uk_t1,uk_xt"
end if
End Function
'-----------------------------------
'top uk list arr
'=ukrr(ukfnm,ukfps=0ep/1ef/2ssp/3ssf/4ssx/5ssm/6sss,)
'-----------------------------------
Function ukrr(ukfnm,ukfps)
Call ukss(0)
Call uktj(ukfps,0,0)
if ukfnm=0 or ainull(ukfnm) then
ukfnm=i_nmhc
else
ukfnm=aiint(ukfnm)
end if
if e_aiidl<>"" and e_aiidl<>"," then
dim ukdidl
ukdidl=left(e_aiidl,len(e_aiidl)-1)
if not ainull(ukwhere) then ukwhere=ukwhere&" and "
ukwhere=ukwhere&"uk_id not in ("&ukdidl&")"
end if
if e_aiids<>"" and e_aiids<>"," then
dim ukdids
ukdids=left(e_aiids,len(e_aiids)-1)
if ew_cf=0 or (ew_cf=1 and aibj(right(ukfps,len(s_umqb)),s_umqb)) then
if not ainull(ukwhere) then ukwhere=ukwhere&" and "
ukwhere=ukwhere&"uk_id not in ("&ukdids&")"
end if
end if
if gystop(ukfnm,ukbid,uklie("top"),ukbiao,ukwhere,ukorder,"") then
ukrr=gysar
end if
End Function
'-----------------------------------
'skin read
'=ukks()
'-----------------------------------
Function ukks(ukfty,ukfcy,ukfstr)
if ukfstr<>"" and ukfstr<>"0" then ukskin=ukfstr
ukfcy=aiint(ukfcy)
if ukfty=1 then
ukks=dosk("d",ukfcy,"default")
elseif ukfty=2 then
ukks=dosk("d",ukfcy,"index")
elseif ukfty=3 then
ukks=dosk("d",ukfcy,"list")
elseif ukfty=4 then
ukks=dosk("d",ukfcy,"info")
elseif ukfty=10 then
ukks=dosk("d",ukfcy,"show")
elseif ukfty=11 then
ukks=dosk("d",ukfcy,"sai")
elseif ukfty=12 then
ukks=dosk("d",ukfcy,"admin")
end if
End Function
'-----------------------------------
'top
'=uklogo()
'-----------------------------------
Function uklogo()
if ainull(us_er) then Call usread(uk_us)
uklogo=""
if len(ew_ig)>3 then
uklogo=uklogo&"<a href="""&eshrej("",uk_ur,"",1)&""" title="""&uk_bt&""">"
if len(us_up)>2 then uklogo=uklogo&"<img class=""y-ico"" src="""&eshref(us_up,3)&""">"
uklogo=uklogo&"<b>"&uk_bt&"</b>"
if not ainull(uk_co) then uklogo=uklogo&"<br><font>"&uk_co&"</font>"
uklogo=uklogo&"</a>"
end if
End Function
'-----------------------------------
'=ukbanner()
'-----------------------------------
Function ukbanner()
ukbanner=""
if len(uk_up)>2 then
ukbanner=ukbanner&"<div class=""sy-c10""><div id=""banner""><div class=""banneruk"">"&ukpic(uk_up,uk_mc,uk_bt,uk_up,4)&"</div></div></div>"
end if
End Function
'-----------------------------------
'ukmp
'=ukmp(uklty)
'-----------------------------------
Function ukmp(uklty)
ukmp=""
if uklty=6 then
if ainull(us_er) then Call usread(uk_us)
ukmp=ukmp&"<div class=""c-i"">"&uk_nr&"</div>"
elseif uklty=1 or uklty=2 then
if ainull(us_er) then Call usread(uk_us)
if uklty=2 then ukmp=ukmp&esbts(ep_sx,s_udluk,"网站名片"&g_gy&eshref(s_udukw&g_urg&s_umxx&g_urg&uk_ur&g_urz,1),"")
ukmp=ukmp&"<div class=""c-a"">"
if not ainull(uk_up) and uklty=1 then
ukmp=ukmp&"<div class=""sy-c10 tc c-i"">"&ukpic(uk_up,uk_mc,uk_bt,e_tur&eshrej("",uk_ur,"",2),4)&"</div>"
elseif len(ew_pt)>3 and uklty=1 then
ukmp=ukmp&"<div class=""sy-c10 tc"">"&ew_pt&"</div>"
end if
ukmp=ukmp&"<div class=""sy-c10"">"
ukmp=ukmp&"<li class=""l-0 ftt"">名称："&uk_mc&"　"&aiarr(i_bxy,"|",aiint(uk_xy))&"</li>"
if not ainull(uk_ot) then ukmp=ukmp&"<li class=""l-0"">公告："&uk_ot&"</li>"
ukmp=ukmp&"<li class=""l-0"">网址：<a href="""&e_tur&eshrej("",uk_ur,"",2)&""">"&e_tur&eshrej("",uk_ur,"",2)&"</a></li>"
if aiint(uk_tn)>0 then ukmp=ukmp&"<li class=""l-0"">积分："&uk_tn&"</li>"
if not ainull(uk_tm) then
ukmp=ukmp&"<li class=""l-0"">"&aitms("开通：",uk_tm,2)&""
if not ainull(uk_t1) then 
if aicd(uk_t1)>date() then ukmp=ukmp&aitms("　到期：",uk_t1,2)&""
end if
ukmp=ukmp&"</li>"
end if
ukmp=ukmp&"<li class=""l-0"">标题："&uk_bt&"</li>"
ukmp=ukmp&"<li class=""l-0"">主题："&uk_zt&"</li>"
if not ainull(uk_co) then ukmp=ukmp&"<li class=""l-0"">简介："&uk_co&"</li>"
ukmp=ukmp&"</div><div class=""cr""></div></div><div class=""crg""></div>"

ukmp=ukmp&"<li class=""c-h"">"&usren(uk_us&g_gg&us_bt)&" 会员信息</li>"'tit
if not ainull(us_up) then
ukmp=ukmp&"<li class=""c-i l-0"">"&uspic(us_up,us_bt,us_bt,eshref(s_udus&g_urg&s_umzs&g_urg&us_er&g_urz,66),4)&"</li>"
elseif len(ew_pt)>3 then
ukmp=ukmp&"<li class=""c-i l-0"">"&ew_pt&"</li>"
end if
ukmp=ukmp&"<li class=""c-ex l-1"">财富：<b>"&ainum(us_jb,1)&"</b> 枚金币　<b>"&ainum(us_jy,1)&"</b> 点经验</li>"
if aiint(us_zy)>1 then
ukmp=ukmp&"<li class=""c-ex l-1"">认证：<b>"&aiarr(i_buszy,"|",aiint(us_zy))&"</b></li>"
else
ukmp=ukmp&"<li>认证："&aiarr(i_buszy,"|",aiint(us_zy))&"</li>"
end if
if not ainull(us_dh) and not aibj(us_dh,"0") and e_uxy>2 then ukmp=ukmp&"<li>电话："&us_dh&"</li>"
if not ainull(us_ct) and not aibj(us_ct,"0") and e_uxy>2 then ukmp=ukmp&"<li>地址："&us_ct&"　"&us_dz&"</li>"
if not ainull(us_em) and not aibj(us_em,"0") and e_uxy>ew_sh then ukmp=ukmp&"<li>邮箱："&us_em&"</li>"
if not ainull(us_sj) and not aibj(us_sj,"0") then ukmp=ukmp&"<li>邀请人：<a href="&eshref(s_udus&g_urg&s_umzs&g_urg&us_sj&g_urz,66)&" target=_blank>"&us_sj&"</a></li>"
'if aiint(us_xy)>0 and e_uxy>0 then ukmp=ukmp&"<div class=""c-k"">"&uslx(10,us_xy,us_er,us_em,uk_ur)&"</div>"

else'index show info
if ainull(us_er) then Call usread(uk_us)
if ainull(us_er) then Call usread(ai_us)
if ainull(uk_us) then Call ukread(us_er)
if not ainull(uk_us) then
ukmp=ukmp&"<div class=""k-j"&aiint(uk_xy)&"""><span class=""k-jxy"">"&aiarr(i_bxy,"|",aiint(uk_xy))&"</span><span class=""k-jjf"">"&uk_tn&"</span></div>"
ukmp=ukmp&"<div class=""k-j k-jbg"&uk_xy&"""><ul>"
if not ainull(us_up) then ukmp=ukmp&"<li class=""k-ico"">"&uspic(us_up,us_bt,us_bt,eshref(s_udus&g_urg&s_umzs&g_urg&us_er&g_urz,66),4)&"</li>"
'if not ainull(uk_up) then ukmp=ukmp&"<li class=""k-ico"">"&ukpic(uk_up,uk_mc,uk_bt,uk_up,4)&"</li>"
ukmp=ukmp&"<li class=""ftt tc"">"&uk_mc&"</li>"
dim ukdur
if i_html=1 then
ukdur=replace(e_tur&eshrej("",uk_ur,"",2),"?","")
else
ukdur=e_tur&eshrej("",uk_ur,"",2)
end if
ukmp=ukmp&"<li class=""tc""><a class=""k-jur"" href="""&ukdur&""">"&ukdur&"</a></li>"
if not ainull(uk_ot) then ukmp=ukmp&"<li class=""k-jgg""><b>公告：</b>"&uk_ot&"</li>"
ukmp=ukmp&"<li class=""k-jxx"" title=""账号："&us_er&""">负责会员："&aimo(us_bt,us_er)
if not ainull(uk_tm) then
ukmp=ukmp&aitms("<br>开通时间：",uk_tm,2)&""
if not ainull(uk_t1) then
if aicd(uk_t1)>date() then ukmp=ukmp&aitms("<br>到期时间：",uk_t1,2)&""
end if
end if
ukmp=ukmp&"</li>"
else
ukmp=ukmp&"<div class=""k-j k-5 b-cq""><ul>"
if not ainull(us_up) then ukmp=ukmp&"<li class=""k-ico"">"&uspic(us_up,us_bt,us_bt,eshref(s_udus&g_urg&s_umzs&g_urg&us_er&g_urz,66),4)&"</li>"
ukmp=ukmp&"<li class=""ftt tc""><a title=""会员帐户："&us_er&""" href="&eshref(s_udus&g_urg&s_umzs&g_urg&us_er&g_urz,66)&" target=_blank>"&aimo(us_bt,us_er)&"</a></li>"
end if
if not ainull(us_dh) or not ainull(us_em) or not ainull(us_ct) then
ukmp=ukmp&"<li class=""k-jmp""><b>联系方式：</b>"
if not ainull(us_bt) then ukmp=ukmp&"<br>称呼："&us_bt&""
if not ainull(us_em) then ukmp=ukmp&"<br>邮箱："&us_em&""
if not ainull(us_dh) then ukmp=ukmp&"<br>电话："&us_dh&""
if not ainull(us_ct) then ukmp=ukmp&"<br>地址："&us_ct&""&us_dz&""
if not aibj(uk_us,e_uer) and aiint(e_uid)>0 then ukmp=ukmp&"<div class=""crg""></div>"&uslx(10,us_xy,us_er,us_em,uk_ur)&""
ukmp=ukmp&"</li>"
if not ainull(us_qm) then ukmp=ukmp&"<li class=""k-jqm""><b>签名：</b><br>"&us_qm&"</li>"
end if
ukmp=ukmp&"</ul></div>"
end if
End Function
'-----------------------------------
'ukxfl(10read-ep|13admin-menu|22edit-fl-only23=all-edit-in-uk,频道SN||频道权限0关闭1隐藏2打开||频道名称~~目录1||目录2##频道SN1||频道权限1||频道名称1~~目录1||目录2)
'-----------------------------------
Function ukxfl(ukfty,ukfep,ukfstr,usfer,usfmo)
dim ukdls,ukdlj,ukdlxs,ukdldm,ukdlmc,ukdlsn,ukdyrr,ukdyub,ukdyi,ukdzxrr,ukdzrr,ukdzi
ukdls=epall
if ukdls<>"" then
if ainull(us_er) then Call gysread("us_er,us_xy,us_zy",usbiao,"us_er='"&usfer&"'","")
ukdlj=0
ukdyrr=split(ukfstr&"##","##")
ukdyub=ubound(ukdyrr)
gysaxbb=split(ukdls,g_gx)
ukdls=""
if ukfty=23 then
ukdls=ukdls&icflot(10,"目录","<input type=""checkbox"" id=""more"" name=""more"" value=""1"" onClick=""if (this.checked){document.getElementById('ukmfl').style.display='';}else{document.getElementById('ukmfl').style.display='none';}""> <label for=""more"">编辑"&s_uduks&"频道与目录</label>")&"<div id=""ukmfl"" class=""l-cs"" style=""display:none;"">"
elseif ukfty=22 then
if esky(1,e_uzy) then
if aireqx("fl") then
if gysgx(ukbiao,"uk_fl='"&aireq("fl")&"'","uk_id="&aiint(aireq("id"))&" and "&esrew("uk",ew_sn)&" and uk_us='"&us_er&"'") then
ukdls=ukdls&aigo(s_umxgs&s_uduks&s_ztcg,g_u)
else
ukdls=ukdls&aigo(s_umxgs&s_uduks&s_ztsb,1)
end if
end if
end if
Call gysread("uk_id,uk_fl",ukbiao,""&esrew("uk",ew_sn)&" and uk_us='"&us_er&"'","")
ukdls=ukdls&"<div class=""f-l l-cs""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
end if
for gysibb=0 to ubound(gysaxbb)
gysaybb=split(gysaxbb(gysibb),g_gy)
ukdldm=gysaybb(3)
ukdlmc=gysaybb(2)
ukdlsn=gysaybb(1)
if usxqw(gysaybb(13),us_er,us_xy,us_zy) then
'符合该用户的频道
if left(ukfty,1)=2 then'edit uk_fl
ukdlj=ukdlj+1
ukdls=ukdls&"<div"
if ukdlj mod 2=0 then ukdls=ukdls&" class=""l-0"""
if not aibj(s_uduk,ukfep) and not aibj(s_umqb,ukfep) and not aibj(ukdlsn,ukfep) then
ukdls=ukdls&" style=""display:none;"""
end if
ukdls=ukdls&">"&icflot(10,"频道",ukdlmc&aiinput("hidden","fl","",0,0,"","","##")&aiinput("hidden","fl","",0,0,"","",ukdlsn)&aiinput("hidden","fl","",0,0,"","","||"))
if instr(ukfstr,"##"&ukdlsn&"||")>0 then
ukdlxs=aiint(left(split(ukfstr,"##"&ukdlsn&"||")(1),1))
if ukdlxs>0 or e_gdj>2 then
if e_gdj>2 then
ukdls=ukdls&icflxz(10,"状态","fl","","0关闭状态须要管理员审核开启，1隐藏状态不在会员网站中显示，2打开状态可以在后台显示，3推荐状态显示在导航栏目","",ukdlxs,0,"关闭|隐藏|打开|推荐")
else
ukdls=ukdls&icflxz(10,"状态","fl","","1隐藏状态不在会员网站中显示，2打开状态可以在后台显示，3推荐状态显示在导航栏目","",ukdlxs,"1|2|3","隐藏|打开|推荐")
end if
ukdls=ukdls&aiinput("hidden","fl","",0,0,"","","||")&aiinput("hidden","fl","",0,0,"","",ukdlmc)&aiinput("hidden","fl","",0,0,"","","~~")
  for ukdyi=1 to ukdyub
  if aibj(left(ukdyrr(ukdyi),len(ukdlsn)),ukdlsn) then
  ukdzxrr=split(ukdyrr(ukdyi)&"~~","~~")
  ukdzrr=split(ukdzxrr(1),"||")
	for ukdzi=1 to ubound(ukdzrr)
	if not ainull(ukdzrr(ukdzi)) then ukdls=ukdls&aiinput("hidden","fl","",0,0,"","","||")&icflsr(10,"目录"&ukdzi,"","fl","",0,50,"","",ukdzrr(ukdzi))
	next
  end if
  next
else
ukdls=ukdls&aiinput("hidden","fl","",0,0,"","","||")&aiinput("hidden","fl","",0,0,"","","0")&aiinput("hidden","fl","",0,0,"","",ukdlmc)&aiinput("hidden","fl","",0,0,"","","~~")&icflot(10,"提示","该频道处于关闭状态。")
end if
else
ukdlxs=1
if e_gdj>2 then
ukdls=ukdls&icflxz(10,"状态","fl","","0关闭状态须要管理员审核开启，1隐藏状态不在会员网站中显示，2打开状态可以在后台显示，3推荐状态显示在导航栏目","",ukdlxs,"1|2|3","关闭|隐藏|打开|推荐")
else
ukdls=ukdls&icflxz(10,"状态","fl","","1隐藏状态不在会员网站中显示，2打开状态可以在后台显示，3推荐状态显示在导航栏目","",ukdlxs,"1|2|3","隐藏|打开|推荐")
end if
ukdls=ukdls&aiinput("hidden","fl","",0,0,"","","||")&aiinput("hidden","fl","",0,0,"","",ukdlmc)&aiinput("hidden","fl","",0,0,"","","~~")
end if
if ukdlxs>0 then ukdls=ukdls&aiinput("hidden","fl","",0,0,"","","||")&icflsr(10,"新增","","fl","",0,50,"","","")
ukdls=ukdls&"</div>"
else'read
if ukfty=16 then'user
ukdls=ukdls&"<li><a class=""m-max"" target=""AMF"" href="""&eshref(ukdlsn&g_urg&s_umqb&g_urg&""&g_urg&""&g_urg&""&g_urg&""&g_urg&"19"&g_urz,66)&""">"&ukdlmc&"</a><a class=""m-ma"" target=""AMF"" href="""&eshref(ukdlsn&g_urg&s_umtj&g_urz,66)&""">发布"&ukdldm&"</a></li>"
elseif instr(ukfstr,"##"&ukdlsn&"||")>0 then
ukdlxs=aiint(left(split(ukfstr,"##"&ukdlsn&"||")(1),1))
if ukdlxs>1 then
if ukfty=13 then
ukdlj=ukdlj+1
ukdls=ukdls&"<li"
if ukdlj mod 2=0then ukdls=ukdls&" class=""l-0"""
if not aibj(s_umqb,ukfep) and not aibj(ukdlsn,ukfep) and e_gdj<3 then
ukdls=ukdls&" style=""display:none;"""
end if
ukdls=ukdls&">"
end if
if ukfty=14 then'web menu
if ukdlxs>2 then ukdls=ukdls&g_gx&gysaybb(0)&g_gy&ew_sn&g_gy&"0"&g_gy&"0"&g_gy&"1"&g_gy&"00"&g_gy&eshrej("",uk_ur,ukdlsn,1)&g_gy&ukdlmc&g_gy&eshrej("",uk_ur,ukdlsn,1)&g_gy&g_gy&g_gy&"0"&g_gy&"2"&g_gy&""
elseif ukfty=13 then'admin menu
ukdls=ukdls&"<a class=""m-max"" target=""AMF"" href="""&eshrej(s_umgl,uk_ur,ukdlsn&g_urz,66)&""">"&ukdlmc&"</a><a class=""m-ma"" target=""AMF"" href="""&eshref(s_umgl&g_urg&s_uduk&g_urg&uk_ur&g_urg&ukdlsn&g_urg&s_udef&g_urg&s_umtj&g_urz,66)&""">目录</a><a class=""m-ma"" target=""AMF"" href="""&eshrej(s_umgl,uk_ur,ukdlsn&g_urg&s_umtj&g_urz,66)&""">发布</a>"
elseif ukfty=12 or ukfty=11 then'web ep fl
if aibj(s_umqb,ukfep) or aibj(ukdlsn,ukfep) then
  for ukdyi=1 to ukdyub
  if aibj(left(ukdyrr(ukdyi),len(ukdlsn)),ukdlsn) then
  ukdzxrr=split(ukdyrr(ukdyi)&"~~","~~")
  ukdzrr=split(ukdzxrr(1),"||")
	for ukdzi=1 to ubound(ukdzrr)
	if not ainull(ukdzrr(ukdzi)) then
	ukdlj=ukdlj+1
	  if ukfty=11 then
	  if ukdlj mod 2=0 then
	  ukdls=ukdls&"<li class=""l-1"">"
	  else
	  ukdls=ukdls&"<li>"
	  end if
	  end if
	  if ukfty=11 then ukdls=ukdls&""&iclbico(0,"tag",1)
	  ukdls=ukdls&"<a"
	  if instr(usfmo,trim(ukdzrr(ukdzi)))>1 or aibj(usfmo,trim(ukdzrr(ukdzi))) then ukdls=ukdls&" class=""l-va"""
	  if ukfty=12 then
	  Randomize
	  ukdls=ukdls&" style=""margin-right:6px;"&esyqs(int(98*Rnd)+1)&""""
	  end if
	  ukdls=ukdls&" href="""&eshrej("",uk_ur,esnk(ep_sn)&g_urg&efhrl(ep_ls)&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&g_urg&"2"&g_urg&g_urg&aijia(trim(ukdzrr(ukdzi)))&g_urz,1)&""">"&trim(ukdzrr(ukdzi))&"</a>"
	  if ukfty=11 then ukdls=ukdls&"</li>"
	end if
	next
  end if
  next
end if
end if
if ukfty=13 then ukdls=ukdls&"</li>"
end if
end if
end if
'符合该用户的频道
end if
next
if ukfty=23 then
ukdls=ukdls&"</div>"
elseif ukfty=22 then
ukdls=ukdls&eskyx(1,1,2)
ukdls=ukdls&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",uk_id)&" "&aibutton(1,"","","f-sb f-skx",s_ztcz))
ukdls=ukdls&"<div class=cr></div></ul></form></div>"
end if
end if
ukxfl=ukdls
End Function
'-----------------------------------
'uk menu
'=ukmenu(ukfty,ukfmo,ukfnm,ukfwd)
'-----------------------------------
Function ukmenu(ukfty,ukfmo,ukfnm,ukfdw,ukfwd)
dim ukepall
ukmenu=ukmenu&"0"&g_gy&ew_sn&g_gy&"0"&g_gy&"0"&g_gy&"1"&g_gy&"00"&g_gy&eshrej("",uk_ur,"",1)&g_gy&s_uduks&"主页"&g_gy&eshrej("",uk_ur,"",1)&g_gy&g_gy&g_gy&"0"&g_gy&"2"&g_gy&""

ukmenu=ukmenu&ukxfl(14,s_umqb,uk_fl,uk_us,"")

'if ewxlt() then ukmenu=ukmenu&g_gx&"0"&g_gy&ew_sn&g_gy&"0"&g_gy&"0"&g_gy&"1"&g_gy&"00"&g_gy&s_udbb&g_gy&"网站论坛"&g_gy&"论坛"&g_gy&g_gy&g_gy&"0"&g_gy&"2"&g_gy&""
if not ainull(e_man) then ukfmo=e_man
ukmenu=icmenushow(ep_sx,"",ukmenu,ukfmo,70,ukfnm,"14px","45px","1|"&ukfdw&"|100%|"&ukfwd)
End Function
'-----------------------------------
'uk menu
'=ukme(ukfty)
'-----------------------------------
Function ukme(ukfty)
dim ukdmo
ukme=""
if ukfty="0" or ukfty="3" then
ukdmo=icvss
elseif ukfty="1" then
ukdmo=ai_eq
elseif not ainull(ukfty) then
ukdmo=ukfty
end if
if ainull(ep_dm) then ep_dm="导航"
if ukfty="3" then
ukme=ukxfl(12,ep_sn,uk_fl,uk_us,ukdmo)
else
ukme=ukxfl(11,ep_sn,uk_fl,uk_us,ukdmo)
if not ainull(ukme) then ukme=esbts(ep_sx,ep_el,ep_dm&"目录"&g_gy&eshrej("",uk_ur,ep_sn&g_urz,1),"")&"<div class=""l-ra""><ul>"&ukme&"</ul></div><div class=crg></div>"
end if
End Function
'-----------------------------------
'ukmy
'=ukefall(0)
'-----------------------------------
Function ukefall(ukfty)
if not ainull(ep_sn) and not dkdir(0,ep_sn) then
if ukfty<>"3" then ukefall=esbts(ep_sx,ep_el,ep_dm&s_udefs&g_gy&eshref(ep_sn&g_urz,1),"")
ukefall=ukefall&replace(replace(replace(icmenu("","","1|"&ep_sn,ef_sn,22,0,14,28,20),ep_sn&g_urg,eshrej("",uk_ur,ep_sn&g_urg,1)),"?"&g_urg&"?","?"),g_urg&g_urg&s_udukw&g_urg,g_urg&s_udukw&g_urg)
'ukefall=ukefall&replace(replace(icmenu("","","1|"&ep_sn,ef_sn,22,0,14,28,20),ep_sn&g_urg,eshrej("",uk_ur,ep_sn&g_urg,1)),"?"&g_urg&"?","?")
else
ukefall=""
end if
End Function
'-----------------------------------
'us read
'=ukusread(sn)
'-----------------------------------
Function ukusread(ukfus)
dim ukdus:ukdus=ukfus
if not aibj(ukfus,"0") and not ainull(ukfus) and not aibj(ukfus,s_umqb) then Call usread(ukdus)
uk_id=0:uk_ew=ew_sn:uk_us="":uk_sn="":uk_ef="":uk_cy=0:uk_cs="":uk_ka="":uk_kb="":uk_kc="":uk_kd="":uk_fl="":uk_up="":uk_mc="":uk_bt="":uk_co="":uk_nr="":uk_zt="":uk_ur=0:uk_xy=0:uk_px=0:uk_ot="":uk_tm="":uk_tn=0:uk_t1="":uk_xt=""
if not aibj(us_er,"0") and not ainull(us_er) and not aibj(us_er,s_umqb) then
if gysread(uklie("all"),ukbiao,"uk_us='"&aistr(lcase(us_er))&"' and "&esrew("uk",ew_sn)&"","") then
ukusread=uk_mc
else
ukusread=""
end if
end if
End Function
'-----------------------------------
'uk read
'=ukread(sn)
'-----------------------------------
Function ukread(ukfur)
dim ukdur:ukdur=ukfur
uk_id=0:uk_ew=ew_sn:uk_us="":uk_sn="":uk_ef="":uk_cy=0:uk_cs="":uk_ka="":uk_kb="":uk_kc="":uk_kd="":uk_fl="":uk_up="":uk_mc="":uk_bt="":uk_co="":uk_nr="":uk_zt="":uk_ur=0:uk_xy=0:uk_px=0:uk_ot="":uk_tm="":uk_tn=0:uk_t1="":uk_xt=""
if not aibj(ukdur,"0") and not ainull(ukdur) and not aibj(ukdur,s_umqb) then
if gysread(uklie("all"),ukbiao,"uk_ur='"&aistr(lcase(ukdur))&"' and "&esrew("uk",ew_sn)&"","") then
ukread=uk_mc
else
ukread=""
end if
end if
if ainull(us_er) then Call usread(uk_us)
End Function
'-----------------------------------
'uk show select
'=ukselect()
'-----------------------------------
Function ukselect(ukfep,ukfnm,ukfstr,ukfval)
ukselect=""
if not ainull(ukfstr) then
dim uksdrr,uksi,uksud,ukfdrr,ukfi,ukfud,ukvdrr,ukvi,ukvud,ukvdq
uksdrr=split(ukfstr,"##")
uksud=ubound(uksdrr)
ukvdrr=split(ukfval,",")
ukvud=ubound(ukvdrr)
if uksud>1 then
for uksi=1 to uksud
ukvdq=uksdrr(uksi)
if aibj(ukfep,left(ukvdq,len(ukfep))) then
ukfdrr=split(ukvdq,"||")
ukfud=ubound(ukfdrr)
if ukfud>2 then
for ukfi=3 to ukfud
if not ainull(ukfdrr(ukfi)) then
ukselect=ukselect&"<input type=""checkbox"""
  if not ainull(ukfval) then
  for ukvi=0 to ukvud
  if aibj(trim(ukvdrr(ukvi)),ukfdrr(ukfi)) then ukselect=ukselect&" checked"
  next
  end if
ukselect=ukselect&" id="""&ukfnm&""" name="""&ukfnm&""" value="""&ukfdrr(ukfi)&""">"&ukfdrr(ukfi)&"　"
end if
next
end if
end if
next
end if
end if
End Function
'-----------------------------------
'add/edit form
'=ukform()
'-----------------------------------
Function ukform(ukfty,ukfqx)
dim ukdupd,ukdmbs
if ukfty=0 then
uk_ew=ew_sn
uk_us=e_uer
uk_ur=e_uer
uk_sn=e_uer&"-"&aisn(1)
uk_cy=0
uk_xy=1
uk_px=0
uk_tm=now()
uk_tn=0
uk_t1=date()
uk_fl=""
uk_xt=espxx("开通"&s_uduks&i_gg&e_uer)
else
uk_t1=date()
uk_xt=uk_xt&espxx("修改"&i_gg&e_uer)
end if
ukdupd=p_upifh&s_uduk&"/web"&ew_sn&"/"&left(uk_sn,4)&"/"
Response.Cookies("AsaiUpFiles")=p_upifh&s_uduk&"/web"&ew_sn&"/"&left(uk_sn,4)&"/"&uk_sn&"_"'if no_ else into uk_sn dir
'编辑风格模板
ukdmbs=icflxz(10,"选择","cy","","*","",uk_cy,0,i_bukcy)
if i_xkumb>0 or ukfqx=1 then
ukdmbs=ukdmbs&icflot(10,"提示","编辑模板高级功能开关　<input type=""button""  onclick=""document.getElementById('easmid').style.display='block';"" class=""f-sb"" value=""打开""><input type=""button""  onclick=""document.getElementById('easmid').style.display='none';"" class=""f-sb"" value=""关闭"">")
else
ukdmbs=ukdmbs&icflot(10,"","提示：选中模板提交后，即可至前台查看效果。")
end if
ukdmbs=ukdmbs&"<ul id=""easmid"" style=""display:none;"">"
ukdmbs=ukdmbs&icflwb(10,"样式","cs","","",0,8000,"直接输入样式表","",uk_cs)
ukdmbs=ukdmbs&icflwb(10,"首页","ka","","",0,8000,"直接输入首页模板","",uk_ka)&icflot(10,"","<input type=""button""  onclick=""document.getElementById('ka').value=document.getElementById('kay').value;"" class=""f-sb"" value=""还原为系统模板"">")
ukdmbs=ukdmbs&icflwb(10,"频道","kb","","",0,8000,"直接输入频道模板","",uk_kb)&icflot(10,"","<input type=""button""  onclick=""document.getElementById('kb').value=document.getElementById('kby').value;"" class=""f-sb"" value=""还原为系统模板"">")
ukdmbs=ukdmbs&icflwb(10,"列表","kc","","",0,8000,"直接输入列表模板","",uk_kc)&icflot(10,"","<input type=""button""  onclick=""document.getElementById('kc').value=document.getElementById('kcy').value;"" class=""f-sb"" value=""还原为系统模板"">")
ukdmbs=ukdmbs&icflwb(10,"展示","kd","","",0,8000,"直接输入展示模板","",uk_kd)&icflot(10,"","<input type=""button""  onclick=""document.getElementById('kd').value=document.getElementById('kdy').value;"" class=""f-sb"" value=""还原为系统模板"">")
ukdmbs=ukdmbs&icflot(10,"","<strong>常用标签：</strong><br>&lt;%=e_mt%&gt; 内容标题栏调用<br>&lt;%=e_ma%&gt; *模板中内容显示调用<br>&lt;%=ew_bt%&gt; 优化后的标题<br>&lt;%=ew_zt%&gt; 关键词，主题词<br>&lt;%=ew_nr%&gt; 简介<br>&lt;%=ew_cp%&gt; 版权<br>&lt;%=escss%&gt; *样式表<br>注意：带*号的标签为页面必须调用内容！")
ukdmbs=ukdmbs&"<div style=""display:none;"">"&aitext("kay","","",0,8000,"","f-x2|f-y2|f-z2",aip2t(anfile(1,i_char,0,0,eshref(dosk("d",uk_cy,"default"),3))))&""&aitext("kby","","",0,8000,"","f-x2|f-y2|f-z2",aip2t(anfile(1,i_char,0,0,eshref(dosk("d",uk_cy,"index"),3))))&""&aitext("kcy","","",0,8000,"","f-x2|f-y2|f-z2",aip2t(anfile(1,i_char,0,0,eshref(dosk("d",uk_cy,"list"),3))))&""&aitext("kdy","","",0,8000,"","f-x2|f-y2|f-z2",aip2t(anfile(1,i_char,0,0,eshref(dosk("d",uk_cy,"info"),3))))&"</div>"
Call dosk("","","")
ukdmbs=ukdmbs&"</ul><div class=cr></div>"
'编辑风格模板

ukform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
if ukfqx=1 then
ukform=ukform&icflsr(5,"名称","","mc","",0,50,"*空间名称，尽量简短为佳。","",uk_mc)&icflsr(25,"账号","","ur","",66,50,"*简短英文数字，便于记忆，用来作为三级域名的标示。","",uk_ur)&icflsr(25,"编码","","sn","",3,50,"*","",uk_sn)
else
if ukfty=0 then
ukform=ukform&icflsr(5,"名称","","mc","",0,50,"*空间名称，尽量简短为佳。","",uk_mc)&icflsr(5,"账号","","ur","",66,50,"*简短英文数字，便于记忆，用来作为三级域名的标示。","",uk_ur)&aiinput("hidden","sn","",0,0,"","",uk_sn)
else
ukform=ukform&icflsr(5,"名称","","mc","",0,50,"*空间名称，尽量简短为佳。","",uk_mc)&icflsr(5,"账号","read","ur","",66,50,"*简短英文数字，便于记忆，用来作为三级域名的标示。（已经生成，无法修改。）","",uk_ur)&aiinput("hidden","sn","",0,0,"","",uk_sn)
end if
end if
ukform=ukform&icflsr(5,"标题","","bt","",0,200,"*空间的标题，搜索引擎抓取到的主标题。","",uk_bt)&icflsr(5,"主题","","zt","",0,200,"*主题关键词，多个关键词使用英文半角逗号,隔开。","",uk_zt)
ukform=ukform&icflsr(10,"简介","","co","",0,200,"*对空间进行简短的介绍，搜索引擎收录后显示在标题下方区域。","",uk_co)
if ukfqx=1 then
ukform=ukform&icflot(25,"网站",ewselect(0,uk_ew))&icflsr(75,"公告","","ot","",0,200,"*显示在空间的醒目位置，可用于发布优惠促销信息等。","",uk_ot)
ukform=ukform&icflot(10,"横幅",aiinput("","up","",0,200,"网站顶部背景横幅，推荐尺寸1920*280","f-up",uk_up)&esup("0|1|"&uk_sn&"|"&ukdupd&"|0|AsaiForm|up|7|"&ew_ps&"|0|0.ees"))
ukform=ukform&icflot(10,"分类",efselect(0,i_xkfl,"ef",ew_kj,uk_ef))
'ukform=ukform&icflwb(25,"目录","fl","","",0,8000,"空间目录","",uk_fl)
if ainull(uk_us) then
ukform=ukform&ukxfl(23,s_umqb,uk_fl,e_uer,"")
else
ukform=ukform&ukxfl(23,s_umqb,uk_fl,uk_us,"")
end if
ukform=ukform&icflot(10,"介绍",esedit(esnr(uk_nr),"nr",8))
ukform=ukform&icflsr(25,"会员","","us","",66,50,"*","",uk_us)&icflsr(25,"排序","","px","",6,20,"*","",uk_px)&icflsr(25,"积分","","tn","",6,20,"*","",uk_tn)&icflxz(25,"状态","xy","","*","",uk_xy,0,i_bxy)
ukform=ukform&icflsr(5,"时间","","tm","",99,200,"*注册时间","",uk_tm)&icflsr(5,"到期","","t1","",99,200,"*特殊功能到期时间","",uk_t1)&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script>"
ukform=ukform&"</ul><ul>"&icflot(10,"点评",eseditxt(uk_xt,"xt",1))
ukform=ukform&ukdmbs
else
ukform=ukform&icflsr(10,"公告","","ot","",0,200,"*显示在空间的醒目位置，可用于发布优惠促销信息等。","",uk_ot)
ukform=ukform&icflot(10,"横幅",aiinput("","up","",0,200,"网站顶部背景横幅，推荐尺寸1920*280","f-up",uk_up)&esup("0|1|"&uk_sn&"|"&ukdupd&"|0|AsaiForm|up|7|"&ew_ps&"|0|0.ees"))
ukform=ukform&icflot(10,"分类",efselect(0,i_xkfl,"ef",ew_kj,uk_ef))
if ainull(uk_us) then
ukform=ukform&ukxfl(23,s_umqb,uk_fl,e_uer,"")
else
ukform=ukform&ukxfl(23,s_umqb,uk_fl,uk_us,"")
end if
'ukform=ukform&aiinput("hidden","fl","",0,0,"","",uk_fl)
ukform=ukform&icflot(10,"介绍",esedit(esnr(uk_nr),"nr",8))
if ukfty=1 then
ukform=ukform&ukdmbs
else
ukform=ukform&aiinput("hidden","cy","",0,0,"","",uk_cy)&aiinput("hidden","cs","",0,0,"","",uk_cs)&aiinput("hidden","ka","",0,0,"","",uk_ka)&aiinput("hidden","kb","",0,0,"","",uk_kb)&aiinput("hidden","kc","",0,0,"","",uk_kc)&aiinput("hidden","kd","",0,0,"","",uk_kd)
end if
ukform=ukform&aiinput("hidden","ew","",0,0,"","",uk_ew)&aiinput("hidden","us","",0,0,"","",uk_us)&aiinput("hidden","px","",0,0,"","",uk_px)&aiinput("hidden","tn","",0,0,"","",uk_tn)&aiinput("hidden","xy","",0,0,"","",uk_xy)&aiinput("hidden","tm","",0,0,"","",uk_tm)&aiinput("hidden","t1","",0,0,"","",uk_t1)&aiinput("hidden","xt","",0,0,"","",uk_xt)
end if
ukform=ukform&icflot(10,"验证",eskyx(1,1,2))
if ukfty=1 then
ukform=ukform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",uk_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif ukfty=0 then
ukform=ukform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
ukform=ukform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=ukadd()
'-----------------------------------
Function ukadd(ukfqx)
ew_bt=s_umtjs&s_uduks&","&ew_bt:ew_zt=s_umtjs&s_uduks&","&ew_zt:ew_nr=s_umtjs&s_uduks&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_uduks&"</a></li>"
e_mt=esbts(ep_sx,s_udluk,s_umtjs&s_uduks&g_gy&e_lj1,s_uduks&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("sn,mc,bt,us,ur") then
if gysfm(uklie("form"),ukbiao,"uk_sn='"&aistr(aireq("sn"))&"' or ("&esrew("uk",ew_sn)&" and uk_ur='"&aistr(aireq("ur"))&"') or ("&esrew("uk",ew_sn)&" and uk_us='"&e_uer&"')","uk_",1) then
Call aisn(0)
e_ma=e_ma&aigo(s_umtjs&s_uduks&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umtjs&s_uduks&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduks&s_ztsb,1)
end if
else
e_ma=ukform(0,ukfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=ukedit()
'-----------------------------------
Function ukedit(ukfqx)
ew_bt=s_umxgs&s_uduks&","&ew_bt:ew_zt=s_umxgs&s_uduks&","&ew_zt:ew_nr=s_umxgs&s_uduks&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_uduk&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_uduks&"</a></li>"
if ukfqx=1 then
e_mt=esbts(ep_sx,s_udluk,s_umxgs&s_uduks&g_gy&eshref(s_umgl&g_urg&s_uduk&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_uduks&g_gy&e_lj1&g_gx&s_uduks&s_umlbs&g_gy&e_lj0)
else
e_mt=esbts(ep_sx,s_udluk,s_umxgs&s_uduks&g_gy&eshref(s_uduk&g_urg&s_umxg&g_urg&g_u3&g_urz,77),"")
end if
if esky(1,e_uzy) then
if aireqx("sn,mc,bt,us,ur") then
if gysfm(uklie("form"),ukbiao,"uk_id="&aiint(aireq("id"))&" or (uk_id<>"&aiint(aireq("id"))&" and uk_sn='"&aistr(aireq("sn"))&"')","uk_",2) then
e_ma=e_ma&aigo(s_umxgs&s_uduks&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_uduks&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_uduks&s_ztsb,1)
end if
else
if ukfqx=1 then
ukwhere="uk_id="&aiint(g_u3)&""
else
ukwhere=""&esrew("uk",ew_sn)&" and uk_us='"&e_uer&"'"
end if
if gysread(uklie("all"),ukbiao,ukwhere,"") then
ew_bt=uk_mc&","&ew_bt:ew_zt=uk_mc&","&ew_zt:ew_nr=uk_mc&","&ew_nr
e_ma=ukform(1,ukfqx)&e_ma
else
response.Redirect(eshref(s_uduk&g_urg&s_umtj&g_urz,66))
end if
end if
End Function
'-----------------------------------
'edit fl action
'=ukfltj(ep)
'-----------------------------------
Function ukfltj(ukfep)
ew_bt=s_umxgs&s_uduks&s_udefs&","&ew_bt:ew_zt=s_umxgs&s_uduks&s_udefs&","&ew_zt:ew_nr=s_umxgs&s_uduks&s_udefs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl="<li><a href="""&eshrej("",uk_ur,"",2)&""">"&uk_mc&"</a></li><li><a href="""&eshrej(s_umgl,uk_ur,ep_sn&g_urz,2)&""">"&ep_mc&"</a></li><li class=""active"">"&s_umxgs&ep_dm&"目录</li>"
e_mt=esbts(ep_sx,ep_el,s_umxgs&ep_dm&"目录","")
e_ma=e_ma&ukxfl(22,ukfep,uk_fl,uk_us,"")
End Function
'-----------------------------------
'del
'=ukdel(ukfqx)
'-----------------------------------
Function ukdel(ukfqx)
ew_bt=s_uduks&s_umscs&","&ew_bt:ew_zt=s_uduks&s_umscs&","&ew_zt:ew_nr=s_uduks&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_uduks&s_umscs&"</li>"
e_mt=esbts(ep_sx,s_udluk,s_umscs&s_uduks,s_umtjs&s_uduks&g_gy&e_lj1&g_gx&s_uduks&s_umlbs&g_gy&e_lj0)
if ukfqx=1 then
if e_uxy>2 then
if aiint(g_u3)>0 then
if gysdel(ukbid,ukbiao,"uk_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_uduks&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduks&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(ukbid,ukbiao,""&esrew("uk",ew_sn)&" and uk_xy=0") then
e_ma=e_ma&aitiao(s_uduks&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduks&s_umscs&s_ztsb,1)
end if
end if
end if
else
if aiint(g_u2)>0 then
if gysdel(ukbid,ukbiao,"uk_us='"&e_uer&"' and uk_xy=0 and uk_id="&aiint(g_u2)) then
e_ma=e_ma&aitiao(s_uduks&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduks&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u1,s_umsc&"-x") then
if gysdel(ukbid,ukbiao,"uk_us='"&e_uer&"' and "&esrew("uk",ew_sn)&" and uk_xy=0") then
e_ma=e_ma&aitiao(s_uduks&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduks&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'go show
'=ukshowx(ukfus)
'-----------------------------------
Function ukshowx(ukfus)
Call esq()
us_er=left(g_u2,100)
ew_bt=us_er&","&ew_bt:ew_zt=us_er&","&ew_zt:ew_nr=us_er&","&ew_nr:ew_cp=us_er&","&ew_cp
uk_ur=gysro("uk_ur",ukbiao,"uk_us='"&us_er&"' and "&esrew("uk",ew_sn)&" and uk_xy>0","")
if ainull(uk_ur) then
if ainull(us_er) then
Response.Write(aigo("提示：用户信息暂未审核或不存在。",eshref(s_udus&g_urz,1)))
else
Response.Redirect(eshref(s_udus&g_urg&s_umxx&g_urg&us_er&g_urz,1))
end if
else
Response.Redirect(eshref(s_uduk&g_urg&uk_ur&g_urg&s_umxx&g_urz,1))
end if
End Function
'-----------------------------------
'show
'=ukshow(ukfty)
'-----------------------------------
Function ukshow(ukfur)
Response.Buffer=True'all
if aibj(g_u0,s_umgl) then
ukwhere="uk_ur='"&aistr(ukfur)&"' and "&esrew("uk",ew_sn)&""
else
ukwhere="uk_ur='"&aistr(ukfur)&"' and uk_xy>0 and "&esrew("uk",ew_sn)&""
end if
if gysread(uklie("all"),ukbiao,ukwhere,"") then
ew_bt=uk_mc&","&ew_bt:ew_zt=uk_mc&","&ew_zt:ew_nr=uk_mc&","&ew_nr:ew_cp=uk_us&","&ew_cp
dim ukdsx,ukdpur,ukdpg,lidgl
if aibj(g_u0,s_umgl) then
e_wl="<li><a href="""&eshrej(s_umgl,uk_ur,"",2)&""">"&uk_mc&"</a></li><li class=""active"">关于我们</li>"
ukdpg=aiint(g_u4)
ukdpur=eshref(s_umgl&g_urg&s_uduk&g_urg&g_u2&g_urg&uk_ur&g_urg&g_gp&g_urz,77)
'admin 0
lidgl=""
lidgl=lidgl&g_gx&"修改"&s_uduks&g_gy&eshref(s_umgl&g_urg&s_uduk&g_urg&s_umxg&g_urg&uk_id&g_urz,77)
lidgl=lidgl&g_gx&"删除"&s_uduks&g_gy&eshref(s_umgl&g_urg&s_uduk&g_urg&s_umsc&g_urg&uk_id&g_urz,77)
'admin 1
e_mt=esbts(ukdsx,s_udluk,uk_mc&g_gy&eshref(s_umgl&g_urg&s_uduk&g_urg&s_umxx&g_urg&uk_ur&g_urz,77),lidgl)
else
e_wl="<li><a href="""&eshrej("",uk_ur,"",2)&""">"&uk_mc&"</a></li><li class=""active"">关于我们</li>"
ukdpg=aiint(g_u3)
ukdpur=eshref(s_uduk&g_urg&g_u1&g_urg&uk_ur&g_urg&g_gp&g_urz,66)
'admin 0
lidgl=""
if aibj(uk_us,e_uer) then
lidgl=lidgl&g_gx&"修改"&s_uduks&g_gy&eshref(s_uduk&g_urg&s_umxg&g_urg&uk_id&g_urz,66)
if aibj(uk_xy,"0") then lidgl=lidgl&g_gx&"删除"&s_uduks&g_gy&eshref(s_uduk&g_urg&s_umsc&g_urg&uk_id&g_urz,66)
end if
'admin 1
e_mt=esbts(ukdsx,s_udluk,uk_mc&g_gy&eshref(s_uduk&g_urg&uk_ur&g_urg&s_umzs&g_urz,66),s_uduks&s_umlbs&g_gy&eshref(s_uduk&g_urg&s_umlb&g_urz,66)&g_gx&s_uduks&s_umxxs&g_gy&eshref(s_uduk&g_urg&s_umxx&g_urg&uk_ur&g_urz,66)&lidgl)
end if
e_ma=e_ma&"<div class=""c-a"">"
'--------------------------------CONTENT 0
e_ma=e_ma&"<div class=""c-i"" id=""AsaiNR"">"
e_ma=e_ma&esnrgys(uk_nr,ukdpur,ukdpg)
e_ma=e_ma&"</div>"
'--------------------------------CONTENT 1
if aiint(ukdpg)<2 then
'e_ma=e_ma&"<li class=""c-h"">"&uk_mc&" 名片</li>"'tit
e_ma=e_ma&ukmp(1)
end if
e_ma=e_ma&"<div class=""crg""></div>"
e_ma=e_ma&espl(80235,s_uduks,eshref(s_udukw&g_urg&uk_ur&g_urg&s_umxx&g_urz,66),uk_id,uk_xt,ukbiao,"uk_xt","uk_id","")
e_ma=e_ma&"<div class=cr></div></div>"
else
e_ma=e_ma&aigo(s_uduks&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=uktop(ukfty=0list/1list+tm/"wd-hei",ukffw=0all/1,ukfpx)
'-----------------------------------
Function uktop(ukfty,ukffw,ukfpx)
if aibj(ukfty,"0") then

elseif aibj(ukfty,"1") then

elseif not ainull(ukfty) then
dim ukdrr,ukdwd,ukdht
ukdrr=split(ukfty,"-")
if ubound(ukdrr)>0 then
ukdwd=ukdrr(0)
ukdht=ukdrr(1)


end if
end if
End Function
'-----------------------------------
'list
'=uklist()
'-----------------------------------
Function uklist(ukfqx)
e_mt=esbts(ep_sx,s_udluk,s_uduks&s_umlbs&g_gy&e_lj0,"")
dim uklpg,uklps,uklpuq,uklpuh,uklpur,uklgrr
if ukfqx=1 then
uklpuq=eshref(s_umgl&g_urg&s_uduk,66)
uklef=g_u2
lidms=g_u3
uklpuh=g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10
uklpur=uklpuq&g_urg&uklef&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uklpuh&g_urz
uklpg=aiint(g_u4)
uklps=aiint(g_u5)
else
uklpuq=eshref(s_uduk,66)
uklef=g_u1
lidms=g_u2
uklpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
uklpur=uklpuq&g_urg&uklef&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uklpuh&g_urz
uklpg=aiint(g_u3)
uklps=aiint(g_u4)
end if
if ukfqx=1 then e_mz=e_mz&replace(icmenu("","","1|"&ew_kj,ef_sn,4004,0,14,28,0),s_uduk&g_urg,s_umgl&g_urg&s_uduk&g_urg)

iclls=icliqls(0,lidms,eshref(uklpuq&g_urg&uklef&g_urg&g_gg&g_urg&g_urg&g_urg&uklpuh&g_urz,66))

Call ukss(0)
e_mz=e_mz&icliq(iclls,uklpuq&g_urg&uklef&g_urg&lidms,uklpuh,e_gdj,ukfqx,"uk")
Call uktj(s_uduk&g_urg&uklef&g_urg&uklpuh,0,0)
if uklps=0 then
if aibj(lidms,s_umlpy) then
uklps=i_nmhc
else
uklps=i_nmlb
end if
end if

'@@uk_id,1uk_ew,2uk_us,3uk_sn,4uk_up,5uk_mc,6uk_bt,7uk_co,8uk_nr,9uk_zt,10uk_ur,11uk_xy,12uk_px,13uk_tm,14uk_tn
if gyslist(ukbid,uklie(s_umlb),ukbiao,ukwhere,ukorder,uklpur,uklpg,uklps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if ukfqx=1 then lidti=lidti&"<b>管理</b>"
lidti=lidti&"<u>状态</u>"
lidti=lidti&"<u>开通时间</u>"
lidti=lidti&"<u>会员</u>"
lidti=lidti&"<u>账号</u>"
lidti=lidti&"名称"
end if
'top------1
e_mz=e_mz&iclisttop(lidms,lidti)
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
lids1=""
lids2=""
lids3=""
lids4=""
gysay=split(gysax(gysi),g_gy)
lidbt=uklic(1,0,0,gysay(11),gysay(12),gysay(13),gysay(4))&gysay(5)&uklic(1,1,0,gysay(11),gysay(12),gysay(13),gysay(4))
lidtt="名称："&gysay(5)&vbNewLine
lidtt=lidtt&"账号："&gysay(10)&""&vbNewLine
lidtt=lidtt&"会员："&gysay(2)&""&vbNewLine
lidtt=lidtt&"账号状态："&aiarr(i_bxy,"|",aiint(gysay(11)))&vbNewLine
lidtt=lidtt&"注册时间："&gysay(13)
if ukfqx=1 then
lidlj=eshref(s_umgl&g_urg&s_uduk&g_urg&s_umxx&g_urg&gysay(10)&g_urz,77)
else
lidlj=eshrej("",gysay(10),"",66)
end if
if ukfqx=1 then lidgl="<b><input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_uduk&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_uduk&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_uduks&s_ztqr,"","","f-sb",s_umscs)&"</b>"
'list
if aibj(lidms,s_umlb) then
lids1=lids1&"<u>"&aiarr(i_bxy,"|",aiint(gysay(11)))&"</u>"
lids1=lids1&"<u>"&aitmx(gysay(13),2)&"</u>"
lids1=lids1&"<u>"&gysay(2)&"</u>"
lids1=lids1&"<u>"&gysay(10)&"</u>"
elseif aibj(lidms,s_umlpy) or aibj(lidms,s_umlp) then
lids1=ukpic(gysay(4),gysay(5),lidtt,lidlj,0)
if aibj(lidms,s_umlpy) then
lids4=aiint(gysay(14))
end if
else
lids1=gysay(10)
lids3=lids3&aitms("注册时间：",gysay(13),2)
if aibj(lidms,s_umlpc) then
lids2=gysay(8)
lids4=lids4&ukpic(gysay(4),gysay(5),lidtt,lidlj,2)
else
lids2=left(gysay(8),500)
lids4=lids4&ukpic(gysay(4),gysay(5),lidtt,lidlj,1)
end if
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,ukfqx,eshref(s_umgl&g_urg&s_uduk&g_urg&s_umsc&"-x"&g_urz,77),"uk")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=ukpic("")
'-----------------------------------
Function ukpic(ukfstr,ukfbt,ukfbx,ukflj,ukfty)
if ukfty=0 then
ukfstr=esups(ukfstr,11)
else
ukfstr=esups(ukfstr,1)
end if
if not ainull(ukfstr) then
dim eslbta,eslbts,eslbtx
if not ainull(ukfbt) then
eslbta=" alt="""&ukfbt&""""
eslbtx=" title="""&ukfbt&""""
if ukfty=2 then
eslbts="<span>"&ukfbt&"</span>"
else
eslbts="<font>"&ukfbt&"</font>"
end if
end if
if not ainull(ukfbx) then eslbtx=" title="""&ukfbx&""""
if ukfty=0 then
ukpic=ukpic&"<img src="""&ukfstr&""""&eslbta&">"
elseif ukfty<3 then
ukpic=ukpic&"<a href="""&ukflj&""""&eslbtx&"><img src="""&ukfstr&""""&eslbta&"></a>"
elseif ukfty=3 or ukfty=4 then'show
if left(ukflj,1)<>"/" and not aibj(left(ukflj,7),"http://") then
if not ainull(ukflj) then ukflj=esups(ukflj,1)
end if
if ukfty=3 then ukpic="<div class=""c-u"">"
if not ainull(ukflj) then ukpic=ukpic&"<a href="""&ukflj&""""&eslbtx&">"
ukpic=ukpic&"<img src="""&ukfstr&""""&eslbta&">"
if ukfty=3 then ukpic=ukpic&"<br>"&eslbts
if not ainull(ukflj) then ukpic=ukpic&"</a>"
if ukfty=3 then ukpic=ukpic&"</div>"
end if
end if
End Function
'-----------------------------------
'=uklic(1,"")
'-----------------------------------
Function uklic(ukfkg,ukfty,ukfsx,ukfxy,ukfpx,ukftm,ukfup)
uklic=""
ukfsx=aiint(ukfsx)
if ukfkg=1 and ukfty=0 then
uklic=uklic&icqz(s_udluk,1,ukfxy,ukfpx)
elseif ukfkg=1 and ukfty=1 then
uklic=uklic&ichz(1,ukftm,0,ukfup)
end if
End Function

'-----------------------------------
'=ukss()
'Call ukss()
'-----------------------------------
Function ukss(ukfty)
dim icdspx,icdsfx,icdsxx
icdssp="排序|积分|推荐|排行|开通|到期|"
icdspx="uk_id desc|uk_tn desc|uk_xy desc|uk_px desc|uk_tm desc|uk_t1 desc|uk_us desc|uk_mc desc|uk_ur desc|"
if e_gdj>2 then icdssp=icdssp&"会员|名称|域名|"

icdssf="范围|推荐|三星|四星|五星|图片|"
icdsfx="|uk_xy>1|uk_xy>2|uk_xy>3|uk_xy>4|(uk_up<>'' and uk_up<>'0' and uk_up<>'null')|"
icdssf=icdssf&"过期|正常|"
if w_dbty=0 then
icdsfx=icdsfx&"datediff('d',uk_tm,Now())>0|datediff('d',uk_tm,Now())<0|"
elseif w_dbty=1 then
icdsfx=icdsfx&"datediff(d,uk_tm,'"&Now()&"')>0|datediff(d,uk_tm,'"&Now()&"')<0|"
end if
icdssf=icdssf&"T100|T600|"
icdsfx=icdsfx&"100|600|"
icdssf=icdssf&esqday(0)&"|"
icdsfx=icdsfx&esqday("uk_tm")&"|uk_xy=1|uk_xy=0|"
if e_gdj>2 then icdssf=icdssf&"普通|禁用|"

icdssx="项目|名称|标题|简介|主题|内容|网址|编码|分类|其他|会员|时间|"
icdsxx="uk_mc|uk_mc|uk_bt|uk_co|uk_zt|uk_nr|uk_ur|uk_sn|uk_ef|uk_ot|uk_us|uk_tm|uk_xt|"
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
'=uktj(ukfstr=频道ep/1分类ef/2排序ssp/3范围ssf/4项目ssx/5模式ssm/6关键词sss,ukffl=分类样式-多选分类|单选分类,ukfty)
'-----------------------------------
Function uktj(ukfstr,ukffl,ukfty)
dim icdarr,icdsep,icdsef,icdbx
icdarr=split(ukfstr&"//////","/")
ukwhere="6=6"
ukorder=""
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
if aiint(ukffl)>0 then
icdsef=icdsef
if len(icdsef&"0")>3 then
icdfvrr=split(icdsef,g_ura)
for icdfvi=0 to ubound(icdfvrr)
if not aibj(icdsef,s_umqb) and icdfvrr(icdfvi)<>"" then
if not ainull(ukwhere) then ukwhere=ukwhere&" and "
if left(icdfvrr(icdfvi),1)="0" then
'★★★★★this do for tags 0
dim ukltlie,ukltliez,ukltliezrr
ukltlie=right(left(icdfvrr(icdfvi),3),2)
if instr("xy,px,hi,xi,bd,bc,jg,jy,oz,oy",ukltlie)>0 then
ukltliez=right(icdfvrr(icdfvi),len(icdfvrr(icdfvi))-3)
ukltliezrr=split(ukltliez&"-","-")
if ukltliezrr(0)=ukltliezrr(1) then
ukwhere=ukwhere&"uk_"&ukltlie&"="&aiint(ukltliezrr(0))&""
elseif ukltliezrr(0)<>"" and ukltliezrr(1)<>"" then
ukwhere=ukwhere&"uk_"&ukltlie&">="&aiint(ukltliezrr(0))&" and uk_"&ukltlie&"<="&aiint(ukltliezrr(1))&""
elseif ukltliezrr(0)<>"" then
ukwhere=ukwhere&"uk_"&ukltlie&">="&aiint(ukltliezrr(0))&""
elseif ukltliezrr(1)<>"" then
ukwhere=ukwhere&"uk_"&ukltlie&"<="&aiint(ukltliezrr(1))&""
else
ukwhere=ukwhere&icdfvi&"="&icdfvi
end if
else
if not aibj(icdfvrr(icdfvi),s_umqb) then
icdbx=1
ukwhere=ukwhere&"uk_ef like '"&icdfvrr(icdfvi)&"%'"
else
ukwhere=ukwhere&"6=6"
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
if icdfvrrx(icdfvrrxi)<>"" and not aibj(icdfvrrx(icdfvrrxi),s_umqb) then icdfvrrxw=icdfvrrxw&"uk_ef like '"&icdfvrrx(icdfvrrxi)&"%'"
next
if icdfvrrxw<>"" then
ukwhere=ukwhere&"("&icdfvrrxw&")"
else
ukwhere=ukwhere&icdfvi&"="&icdfvi
end if
else
if not aibj(icdfvrr(icdfvi),s_umqb) then
icdbx=1
ukwhere=ukwhere&"uk_ef like '"&icdfvrr(icdfvi)&"%'"
else
ukwhere=ukwhere&"6=6"
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
if not ainull(ukwhere) then ukwhere=" and "&ukwhere
'ukwhere="uk_ef='"&icdsef&"'"&ukwhere
ukwhere="uk_ef like '"&icdsef&"%'"&ukwhere
end if
'----------------------------------ef1
end if

'sp
if icvsp>0 then
ukorder=icdrrp(icvsp)
else
ukorder=ukordermo
end if

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
ukwhere=ukwhere&" and ("&icvsslin&")"
iclapp=1
icdbx=1
end if
end if

'ew
if aiint(ew_sn)>0 then ukwhere=ukwhere&" and "&esrew("uk",ew_sn)

'admin
if not aibj(g_u0,s_umgl) or e_gdj<3 then
if instr(ukwhere,"uk_xy>0")=0 then
if not ainull(ukwhere) then ukwhere=ukwhere&" and "
ukwhere=ukwhere&"(uk_xy>0 or uk_us='"&e_uer&"')"
end if
elseif e_gdj>2 then
iclapp=1
end if

ukwhere=replace(replace(ukwhere,"6=6 and ","")," and 6=6","")

'sf
if icvsf>0 then
dim icvsflin
icvsflin=icdrrf(icvsf)
if aibj(right(icvsflin,2),"00") then
ukwhere="uk_id in (select top "&aiint(icvsflin)&" uk_id from "&sukdbqz&"uk where "&ukwhere&" order by uk_id desc)"
else
ukwhere=ukwhere&" and "&icvsflin
end if
end if
End Function
%>