<%
'@@0manage/1s_udee/2list.HTML
'@@0manage/1s_udee/2edit|add|del/3*id.HTML

if e_xa<1 and (aibj(g_u0,s_udee) or aibj(g_u1,s_udee)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_udee,s_udees&s_umlbs)

if e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udee) and aibj(g_u2,s_umtj) then
Call eeadd()
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_udee) and aibj(g_u2,s_umxg) then
Call eeedit()
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udee) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call eedel()
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udee) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and not ainull(g_u3) then
Call eeshow(g_u3)
elseif aibj(g_u0,s_udee) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) and not ainull(g_u2) then
Call eeshow(g_u2)
elseif aibj(g_u0,s_udee) and dkdir(2,g_u1) then
Call eelist()
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udee) and dkdir(2,g_u2) then
Call eelist()
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","ee")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=eelie()
'-----------------------------------
Function eelie(eefty)
if eefty="form" then
eelie="ew,mc,mm,dj,xy,us,jb,xi,xo,tm,ot,xt"
elseif eefty=s_umlb then
eelie="ee_id,ee_mc,ee_dj,ee_xy,ee_jb,ee_xi,ee_xo"
elseif eefty=s_umlb&"s" then
eelie="id,mc,dj,xy,jb,xi,xo"
elseif eefty="all" then
eelie="ee_id,ee_ew,ee_mc,ee_mm,ee_dj,ee_xy,ee_us,ee_jb,ee_xi,ee_xo,ee_tm,ee_ot,ee_xt"
end if
End Function
'-----------------------------------
'add/edit form
'=eeform()
'-----------------------------------
Function eeform(eefty)
if eefty=0 then
ee_ew=ew_sn
ee_dj=2
ee_xy=1
ee_jb=0
ee_xi=0
ee_xo=0
ee_tm=now()
else
if ee_xt<>"" then
ee_xt=ee_xt&espxx("修改"&i_gg&e_gmc)
else
ee_xt=espxx("修改"&i_gg&e_gmc)
end if
end if
eeform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"&aibutian(1)
if e_gdj>2 then
eeform=eeform&icflsr(25,"名称","","mc","",0,50,"*","f-a|f-b|f-c",ee_mc)&icflsr(25,"密码","password","mm","",3,50,"*","f-a|f-b|f-c",aimm(g_gmm,ee_mm,1))
if e_gdj>5 then
eeform=eeform&icflxz(25,"等级","dj","","*","f-s",ee_dj,0,i_beedj)
else
eeform=eeform&icflxz(25,"等级","dj","","*","f-s",ee_dj,left("0|1|2|3|4|5|6",e_gdj*2+1),i_beedj)
end if
eeform=eeform&icflxz(25,"状态","xy","","*只有两星及以上管理员可以上传图片和文件","f-s",ee_xy,0,i_bxy)&"</li>"
eeform=eeform&icflsr(25,"金币","","jb","",6,50,"*","f-a|f-b|f-c",ee_jb)&icflsr(25,"鲜花","","xi","",6,50,"*","f-a|f-b|f-c",ee_xi)&icflsr(25,"鸡蛋","","xo","",6,50,"*","f-a|f-b|f-c",ee_xo)&icflsr(25,"时间","","tm","",99,50,"","f-a|f-b|f-c",ee_tm)&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script>"
eeform=eeform&icflot(25,"网站",ewselect(0,ee_ew))&icflsr(25,"前台","","us","",66,50,"若没有前台会员功能可为空","f-a|f-b|f-c",ee_us)&icflsr(5,"其他","","ot","",0,200,"","f-a|f-b|f-c",ee_ot)
eeform=eeform&"</ul><ul>"&icflot(10,"点评",eseditxt(right(ee_xt,s_ztpx),"xt",1))
else
eeform=eeform&icflsr(25,"名称","read","mc","",0,50,"*","f-a|f-b|f-c",ee_mc)&icflsr(25,"密码","password","mm","",3,50,"*","f-a|f-b|f-c",aimm(g_gmm,ee_mm,1))&icflsr(25,"前台","","us","",66,50,"若没有前台会员功能可为空","f-a|f-b|f-c",ee_us)&icflsr(25,"其他","","ot","",0,200,"","f-a|f-b|f-c",ee_ot)&aiinput("hidden","jb","",0,0,"","",ee_jb)&aiinput("hidden","xi","",0,0,"","",ee_xi)&aiinput("hidden","xo","",0,0,"","",ee_xo)&aiinput("hidden","tm","",0,0,"","",ee_tm)&aiinput("hidden","ew","",0,0,"","",ee_ew)&aiinput("hidden","xt","",0,0,"","",ee_xt)&aiinput("hidden","xy","",0,0,"","",ee_xy)&aiinput("hidden","dj","",0,0,"","",ee_dj)
end if
eeform=eeform&icflot(10,"验证",eskyx(1,2,2))
if eefty=1 then
eeform=eeform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",ee_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif eefty=0 then
eeform=eeform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
eeform=eeform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=eeadd()
'-----------------------------------
Function eeadd()
ew_bt=s_umtjs&s_udees&","&ew_bt:ew_zt=s_umtjs&s_udees&","&ew_zt:ew_nr=s_umtjs&s_udees&","&ew_nr
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_udees&"</a></li>"
e_mt=esbts(s_udxee,s_udlee,s_umtjs&s_udees&g_gy&e_lj1,s_udees&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("ew,mc,mm,dj,xy") and aiint(aireq("dj"))=<aiint(e_gdj) then
if gysfm(eelie("form"),eebiao,"ee_mc='"&aistr(aireq("mc"))&"'","ee_",1) then
e_ma=e_ma&aigo(s_umtjs&s_udees&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umtjs&s_udees&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_udees&s_ztsb,1)
end if
else
e_ma=eeform(0)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=eeedit()
'-----------------------------------
Function eeedit()
ew_bt=s_umxgs&s_udees&","&ew_bt:ew_zt=s_umxgs&s_udees&","&ew_zt:ew_nr=s_umxgs&s_udees&","&ew_nr
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udee&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_udees&"</a></li>"
if e_gdj>3 then
e_mt=esbts(s_udxee,s_udlee,s_umxgs&s_udees&g_gy&eshref(s_umgl&g_urg&s_udee&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_udees&s_umlbs&g_gy&e_lj0)
else
e_mt=esbts(s_udxee,s_udlee,s_umxgs&s_udees&g_gy&eshref(s_umgl&g_urg&s_udee&g_urg&s_umxg&g_urg&g_u3&g_urz,77),"")
end if
if esky(1,e_gdj) then
if aireqx("ew,mc,mm,dj,xy") then
if gysfm(eelie("form"),eebiao,"ee_id="&aiint(aireq("id"))&" or (ee_id<>"&aiint(aireq("id"))&" and ee_mc='"&aistr(aireq("mc"))&"')","ee_",2) then
e_ma=e_ma&aigo(s_umxgs&s_udees&s_ztcg,eshref(s_umgl&g_urg&s_udee&g_urg&s_umxg&g_urg&g_u3&g_urz,77))
else
e_ma=e_ma&aigo(s_umxgs&s_udees&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_udees&s_ztsb,1)
end if
else
if ainull(g_u3) then
eewhere="ee_mc='"&e_gmc&"' "
elseif aiint(g_u3)>0 then
eewhere="ee_id="&aiint(g_u3)&""
else
e_ma=e_ma&aigo(s_umxgs&s_udees&s_ztsb,1)
exit function
end if
if e_gdj>5 then
eewhere=eewhere
elseif e_gdj>4 then
eewhere=eewhere&" and "&esrew("ee",ew_sn)&""
else
eewhere=eewhere&" and "&esrew("ee",ew_sn)&" and (ee_dj<"&e_gdj&" or ee_mc='"&e_gmc&"')"
end if
if gysread(eelie("all"),eebiao,eewhere,"") then
ew_bt=ee_mc&","&ew_bt:ew_zt=ee_mc&","&ew_zt:ew_nr=ee_mc&","&ew_nr
e_ma=eeform(1)&e_ma
else
e_ma=e_ma&aigo(s_udees&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=eedel()
'-----------------------------------
Function eedel()
ew_bt=s_udees&s_umscs&","&ew_bt:ew_zt=s_udees&s_umscs&","&ew_zt:ew_nr=s_udees&s_umscs&","&ew_nr
e_wl=e_wl&"<li>"&s_udees&s_umscs&"</li>"
e_mt=esbts(s_udxee,s_udlee,s_umscs&s_udees,s_umtjs&s_udees&g_gy&e_lj1&g_gx&s_udees&s_umlbs&g_gy&e_lj0)
if e_gdj>5 then
eewhere=""
elseif e_gdj>4 then
eewhere=" and "&esrew("ee",ew_sn)&""
else
eewhere=" and "&esrew("ee",ew_sn)&" and (ee_dj<"&e_gdj&" or ee_mc='"&e_gmc&"')"
end if
if e_gdj>2 then
if aiint(g_u3)>0 then
if gysdel(eebid,eebiao,"ee_id="&aiint(g_u3)&eewhere) then
e_ma=e_ma&aitiao(s_udees&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udees&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(eebid,eebiao,""&esrew("ee",ew_sn)&replace(eewhere," and "&esrew("ee",ew_sn),"")) then
e_ma=e_ma&aitiao(s_udees&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udees&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'show
'=eeshow()
'-----------------------------------
Function eeshow(eefmc)
if aibj(g_u0,s_umgl) then
eewhere="ee_mc='"&eefmc&"'"
else
eewhere="ee_mc='"&eefmc&"' and ee_xy>0"
end if
if gysread(eelie("all"),eebiao,eewhere,"") then
ew_bt=ee_mc&","&ew_bt:ew_zt=ee_mc&","&ew_zt:ew_nr=ee_mc&","&ew_nr:ew_cp=ee_mc&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_udee&g_urg&s_umxx&g_urg&ee_mc&g_urz,77)&""">"&ee_mc&"</a></li>"
dim eedsx,eedpur,eedpg
eedpg=aiint(g_u3)
eedpur=eshref(s_udee&g_urg&g_u0&g_urg&ee_mc&g_urz,77)
if aibj(g_u0,s_umgl) then
e_mt=esbts(eedsx,s_udlee,s_udees&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_udee&g_urg&s_umxx&g_urg&ee_mc&g_urz,77),s_udees&s_umlbs&g_gy&eshref(s_umgl&g_urg&s_udee&g_urg&s_umlb&g_urz,77))
else
e_mt=esbts(eedsx,s_udlee,s_umxxs&s_udees&g_gy&eshref(s_udee&g_urg&s_umxx&g_urg&ee_mc&g_urz,77),"")
end if
icdcb=ee_mc&"<span>"&aiarr(i_beedj,"|",aiint(ee_dj))&"</span>"
'--------------------------------HENG 0
icdcd=s_udees&"状态："&aiarr(i_bxy,"|",aiint(ee_xy))
if not ainull(ee_tm) then icdcd=icdcd&aitms(" 登录时间：",ee_tm,9)
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdcg="<li>金币数量："&aiint(ee_jb)&"</li>"
icdcg=icdcg&"<li>会员账户："&ee_us&"</li>"
if icskg(ew_pj,ep_pj,0) then icdcm="<div class=""c-l"">"&eshi(8,ee_id,ee_xi)&"</div>"
'--------------------------------CONTENT 1
'icnr(icdty=0标题|1,icddm=短名,icdcb=标题,icdcc=摘要,icdcd=横条备注,icdcf=左侧封面图,icdcg=右侧备注,icdci=内容,icdcj=媒体展示,icdcm=点评分享区)
icdty=9
e_ma=e_ma&icnr(icdty,icddm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
e_ma=e_ma&espl(8023,s_udees,eshref(s_udee&g_urg&s_umxx&g_urg&ee_mc&g_urz,77),ee_id,ee_xt,efbiao,"ee_xt","ee_id","")
else
e_ma=e_ma&aigo(s_udees&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=eelist()
'-----------------------------------
Function eelist()
if aibj(g_u0,s_umgl) then
e_mt=esbts(s_udxee,s_udlee,s_udees&s_umlbs&g_gy&e_lj0,s_umtjs&s_udees&g_gy&e_lj1)
e_gdj=aiint(e_gdj)
if esky(1,e_gdj) and aireqx("mc,dj,xy") then
if gysfm(eelie(s_umlb&"s"),eebiao,1,"ee_",22) then
e_ma=e_ma&aigo(s_umxgs&s_udees&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_udees&s_ztsb,1)
end if
else
'@@ee_id,1ee_mc,2ee_dj,3ee_xy,4ee_jb,5ee_xi,6ee_xo
if e_gdj>5 or aibj(e_gmc,"asai") then
eewhere="1=1"
elseif e_gdj>4 then
eewhere=""&esrew("ee",ew_sn)&" and ee_dj<"&e_gdj&""
else
eewhere=""&esrew("ee",ew_sn)&" and (ee_dj<"&e_gdj&" or ee_mc='"&e_gmc&"')"
end if

if gystop(i_nmtp,eebid,eelie(s_umlb),eebiao,eewhere,eeordermo,"") then
e_ma=e_ma&"<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi mod 2=0 then
e_lcss=""
else
e_lcss="l-1"
end if
if aiint(gysay(3))>1 then
e_lcss=e_lcss&" ft"
elseif aiint(gysay(3))<1 then
e_lcss=e_lcss&" ftq"
end if
e_ma=e_ma&icflsr("25 "&e_lcss,"名称","","mc","",0,50,"*","f-a|f-b|f-c",gysay(1))&icflsr("25 "&e_lcss,"金币","","jb","",6,50,"","",gysay(4))
if e_gdj>5 or aibj(e_gmc,"asai") then
e_ma=e_ma&icflxz("25 "&e_lcss,"等级","dj","","*","f-s",gysay(2),0,i_beedj)
else
e_ma=e_ma&icflxz("25 "&e_lcss,"等级","dj","","*","f-s",gysay(2),left("0|1|2|3|4|5|6",e_gdj*2+1),i_beedj)
end if
e_ma=e_ma&icflxz("25 "&e_lcss,"状态","xy","","*","f-s",gysay(3),0,i_bxy)

e_ma=e_ma&icflsr("25 "&e_lcss,"鲜花","","xi","",6,50,"","",gysay(5))&icflsr("25 "&e_lcss,"鸡蛋","","xo","",6,50,"","",gysay(6))&aiinput("hidden","id","",0,0,"","",gysay(0))&icflot("5 "&e_lcss,"",aibutton(2,"","","f-sb","快速"&s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udee&g_urg&s_umxg&g_urg&gysay(0)&g_urz,77),"","","","f-sb","详细"&s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udee&g_urg&s_umsc&g_urg&gysay(0)&g_urz,77),s_umscs&s_udees&s_ztqr,"","","f-sb",s_umscs)&aibuttonk(eshref(s_umgl&g_urg&s_udee&g_urg&s_umxx&g_urg&gysay(1)&g_urz,77),"","","","f-sb",""&s_umzss))
next
e_ma=e_ma&icflot(10,"验证",eskyx(1,2,2))
e_ma=e_ma&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aibutton(1,"","","f-sb f-skx",s_ztcz)&aibuttonk(eshref(s_umgl&g_urg&s_udee&g_urg&s_umsc&"-x"&g_urz,77),s_umscs&s_udees&s_ztqr,"","","f-sb f-skx","清空"))
e_ma=e_ma&"<div class=cr></div></ul></form></div>"
else
e_ma=e_ma&aigo(s_udees&s_ztno,e_lj1)
end if
end if
else
e_mt=esbts(s_udxee,s_udlee,s_udees&s_umlbs&g_gy&e_lj0,"")
e_ma=e_ma&"<li class=c-i>暂时不公开！</li>"
end if
End Function
%>