<%
'@@0manage/1s_udel/2list.HTML
'@@0manage/1s_udel/2edit|add|del/3*id.HTML

if e_xa<1 and (aibj(g_u0,s_udel) or aibj(g_u1,s_udel)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_udel,s_udels&s_umlbs)

if e_gdj>3 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udel) and aibj(g_u2,s_umtj) then
Call eladd()
elseif e_gdj>3 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udel) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call eledit()
elseif e_gdj>3 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udel) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call eldel()
elseif e_gdj>3 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udel) and dkdir(2,g_u2) then
Call ellist()
end if
'------get skin 0
if ainull(e_skc) then
e_skc=dosk("a","admin","")
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Assignment
'=erq()
'-----------------------------------
Function elq()
Call esq()
ew_bt=s_udels&","&ew_bt
ew_zt=s_udels&","&ew_zt
ew_nr=s_udels&","&ew_nr
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&e_lj0&""">"&s_udels&s_umlbs&"</a></li>"
else
e_wl=e_wl&"<li><a href="""&eshref(s_udel&g_urg&s_umlb&g_urz,1)&""">"&s_udels&s_umlbs&s_umxxs&"</a></li>"
end if
e_wr="<a href="""&e_lj1&""">"&s_umtjs&s_udels&"</a>|<a href="""&e_lj0&""">"&s_udels&s_umlbs&"</a>"&e_wr
ew_cp=ew_cp
e_mt=e_mt
e_ma=e_ma
End Function
'-----------------------------------
'Data Table
'=ellie()
'-----------------------------------
Function ellie(elfty)
if elfty="form" then
ellie="sn,mc,xy,px,ot,xt"
elseif elfty="select" then
ellie="el_sn,el_mc"
elseif elfty=s_umlb then
ellie="el_id,el_sn,el_mc,el_xy,el_px,el_ot"
elseif elfty=s_umlb&"s" then
ellie="id,sn,mc,xy,px,ot"
elseif elfty="all" then
ellie="el_id,el_sn,el_mc,el_xy,el_px,el_ot,el_xt"
end if
End Function
'-----------------------------------
'el select
'=elselect(0=id/1=mc)
'-----------------------------------
Function elselect(elfid)
dim elselectid,elselectmc
g_app=esapm(0,s_udel&"_Select")
elwhere=elwheremo
elorder=elordermo
if gystop(i_nmtp,elbid,ellie("select"),elbiao,elwhere,elorder,g_app) then
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi=0 then
elselectid=gysay(0)
elselectmc=gysay(1)
else
elselectid=elselectid&"|"&gysay(0)
elselectmc=elselectmc&"|"&gysay(1)
end if
next
end if
elselectid="100"&ew_sn&"|"&elselectid
elselectmc="公共类型|"&elselectmc
elselectid=elselectid&"|"&s_udlbb&"|"&s_udlus&"|"&s_udluk&"|"&s_udlun&"|"&s_udled&""
elselectmc=elselectmc&"|"&s_udbbs&"系统"&"|"&s_uduss&"系统"&"|"&s_uduks&"系统"&"|"&s_uduns&"系统|"&s_udeds&"系统"
elselect=aiselect("el","","","f-sa",elfid,elselectid,elselectmc)
End Function
'-----------------------------------
'add/edit form
'=elform()
'-----------------------------------
Function elform(elfty)
if elfty=0 then
el_px=0
el_xy=1
else
if el_xt<>"" then
el_xt=el_xt&espxx("修改"&i_gg&e_gmc)
else
el_xt=espxx("修改"&i_gg&e_gmc)
end if
end if
elform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
elform=elform&icflsr(25,"名称","","mc","",0,50,"*","",el_mc)&icflsr(25,"编码","","sn","",6,50,"*只能填数字，且不能和其他重复","",el_sn)&aiinput("hidden","y_sn","",0,0,"","",el_sn)&icflsr(25,"排序","","px","",6,50,"排序越大越靠前","",el_px)&icflxz(25,"状态","xy","","","",el_xy,0,i_bxy)
elform=elform&icflsr(10,"其他","","ot","",0,200,"","",el_ot)
elform=elform&"</ul><ul>"&icflot(10,"点评",eseditxt(el_xt,"xt",1))
elform=elform&icflot(10,"验证",eskyx(1,2,2))
if elfty=1 then
elform=elform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",el_id)&aibutton(1,"","","f-sb f-skx",s_ztcz)&"<input type=""checkbox"" name=""lian"" value=""1""> 联动处理(修改编码的时候建议启用)")
elseif elfty=0 then
elform=elform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
elform=elform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=eladd()
'-----------------------------------
Function eladd()
ew_bt=s_umtjs&s_udels&","&ew_bt:ew_zt=s_umtjs&s_udels&","&ew_zt:ew_nr=s_umtjs&s_udels&","&ew_nr
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_udels&"</a></li>"
e_mt=esbts(s_udxel,s_udlel,s_umtjs&s_udels&g_gy&e_lj1,s_udels&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("mc,sn") then
if gysfm(ellie("form"),elbiao,"el_sn="&aiint(aireq("sn")),"el_",1) then
e_ma=e_ma&aitiao(s_umtjs&s_udels&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udel&g_apj))
else
e_ma=e_ma&aigo(s_umtjs&s_udels&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_udels&s_ztsb,1)
end if
else
e_ma=elform(0)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=eledit()
'-----------------------------------
Function eledit()
ew_bt=s_umxgs&s_udels&","&ew_bt:ew_zt=s_umxgs&s_udels&","&ew_zt:ew_nr=s_umxgs&s_udels&","&ew_nr
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udel&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_udels&"</a></li>"
e_mt=esbts(s_udxel,s_udlel,s_umxgs&s_udels&g_gy&eshref(s_umgl&g_urg&s_udel&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_udels&g_gy&e_lj1&g_gx&s_udels&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("mc,sn") then
if gysfm(ellie("form"),elbiao,"el_id="&aiint(aireq("id"))&" or (el_id<>"&aiint(aireq("id"))&" and el_sn="&aiint(aireq("sn"))&")","el_",2) then
'response.Write aireq("sn")&"<>"&aireq("y_sn")&"------"&aireq("lian")&(aireq("sn")<>aireq("y_sn") and aireq("lian")="1")
if aireq("sn")<>aireq("y_sn") and aireq("lian")="1" then'消耗资源
if gysgx(w_dbqz&"ai","ai_el="&aireq("sn")&"","ai_el="&aireq("y_sn")&"") then e_ma=e_ma&"内容已更新<br>"
if gysgx(w_dbqz&"ef","ef_el="&aireq("sn")&"","ef_el="&aireq("y_sn")&"") then e_ma=e_ma&"分类已更新<br>"
if gysgx(w_dbqz&"ep","ep_el="&aireq("sn")&"","ep_el="&aireq("y_sn")&"") then e_ma=e_ma&"频道已更新<br>"
end if
e_ma=e_ma&aitiao(s_umxgs&s_udels&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udel&g_apj))
else
e_ma=e_ma&aigo(s_umxgs&s_udels&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_udels&s_ztsb,1)
end if
else
if gysread(ellie("all"),elbiao,"el_id="&aiint(g_u3)&"","") then
ew_bt=el_mc&","&el_sn&","&ew_bt:ew_zt=el_mc&","&el_sn&","&ew_zt:ew_nr=el_mc&","&el_sn&","&ew_nr
e_ma=elform(1)&e_ma
else
e_ma=e_ma&aigo(s_udels&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=eldel()
'-----------------------------------
Function eldel()
ew_bt=s_udels&s_umscs&","&ew_bt:ew_zt=s_udels&s_umscs&","&ew_zt:ew_nr=s_udels&s_umscs&","&ew_nr
e_wl=e_wl&"<li>"&s_udels&s_umscs&"</li>"
e_mt=esbts(s_udxel,s_udlel,s_umscs&s_udels,s_umtjs&s_udels&g_gy&e_lj1&g_gx&s_udels&s_umlbs&g_gy&e_lj0)
if e_gdj>2 then
if aiint(g_u3)>0 then
if gysdel(elbid,elbiao,"el_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_udels&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udels&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(elbid,elbiao,0) then
e_ma=e_ma&aitiao(s_udels&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udels&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'list
'=ellist()
'-----------------------------------
Function ellist()
e_mt=esbts(s_udxel,s_udlel,s_udels&s_umlbs&g_gy&e_lj0,s_umtjs&s_udels&g_gy&e_lj1)
if esky(1,e_gdj) then
if gysfm(ellie(s_umlb&"s"),elbiao,1,"el_",22) then
e_ma=e_ma&aitiao(s_umxgs&s_udels&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udel&g_apj))
else
e_ma=e_ma&aigo(s_umxgs&s_udels&s_ztsb,1)
end if
else
if gystop(i_nmtp,elbid,ellie(s_umlb),elbiao,"",elordermo,"") then
e_ma=e_ma&"<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi mod 2=0 then
e_lcss="l-1"
else
e_lcss="l-2"
end if
if aiint(gysay(3))>1 then
e_lcss=e_lcss&" ft"
elseif aiint(gysay(3))<1 then
e_lcss=e_lcss&" ftq"
end if
e_ma=e_ma&icflsr("25 "&e_lcss,"名称","","mc","",0,50,"*","",gysay(2))&icflsr("25 "&e_lcss,"编码","","sn","",6,50,"*","",gysay(1))&icflsr("25 "&e_lcss,"排序","","px","",6,20,"","",gysay(4))&icflxz("25 "&e_lcss,"状态","xy","","","f-s",gysay(3),0,i_bxy)
e_ma=e_ma&icflsr("5 "&e_lcss,"其他","","ot","",0,200,"*","",gysay(5))&aiinput("hidden","id","",0,0,"","",gysay(0))&icflot("5 "&e_lcss,"",aibutton(2,"","","f-sb","快速"&s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udel&g_urg&s_umxg&g_urg&gysay(0)&g_urz,77),"","","","f-sb","详细"&s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udel&g_urg&s_umsc&g_urg&gysay(0)&g_urz,77),s_umscs&s_udels&s_ztqr,"","","f-sb",s_umscs))
next
e_ma=e_ma&icflot(10,"验证",eskyx(0,2,2))
e_ma=e_ma&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aibutton(1,"","","f-sb f-skx",s_ztcz)&aibuttonk(eshref(s_umgl&g_urg&s_udel&g_urg&s_umsc&"-x"&g_urz,77),s_umscs&s_udels&s_ztqr,"","","f-sb f-skx","清空"))
e_ma=e_ma&"<div class=cr></div></ul></form></div>"
else
e_ma=e_ma&aigo(s_udels&s_ztno,e_lj1)
end if
end if
End Function
%>