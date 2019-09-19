<%
'@@0manage/1s_uduu/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_uduu/2edit|add|del/3*id.HTML

'@@0s_uduu/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_uduu/1edit|add/2*id.HTML
'@@0s_uduu/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_uduu) or aibj(g_u1,s_uduu)) then
e_xa=e_xa+1
Call esq()
if aibj(g_u0,s_umgl) then
Call doq(1,e_uer,62,g_u1,s_uduu,s_uduus&s_umlbs)
else
Call doq(1,e_uer,62,g_u0,s_uduu,s_uduus&s_umlbs)
end if

if e_gdj>2  and aibj(g_u0,s_umgl) then
if aibj(g_u1,s_uduu) and aibj(g_u2,s_umtj) then
Call uuadd(1,g_u3,g_u4)
elseif aibj(g_u1,s_uduu) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call uuedit(1,aiint(g_u3),"")
elseif aibj(g_u1,s_uduu) and aibj(g_u2,s_umsc) and aiint(g_u3)>0 then
Call uudel(1,aiint(g_u3),"")
elseif aibj(g_u1,s_uduu) and (aibj(g_u2,s_umxx) or aibj(g_u3,s_umzs)) then
Call uushow(1,aiint(g_u3),"")
elseif aibj(g_u1,s_uduu) and dkdir(2,g_u3) then
Call uulist(1)
end if
else
if aibj(g_u0,s_uduu) and aibj(g_u1,s_umfb) then
e_skc=dosk("a","mnk",""):Call uuadd(0,g_u2,g_u3)
elseif aibj(g_u0,s_uduu) and aibj(g_u1,s_umtj) then
Call uuadd(0,g_u2,g_u3)
elseif aibj(g_u0,s_uduu) and aibj(g_u1,s_umxg) then
Call uuedit(0,g_u2,g_u3)
elseif aibj(g_u0,s_uduu) and aibj(g_u1,s_umsc) then
Call uudel(0,g_u2,g_u3)
elseif aibj(g_u0,s_uduu) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) then
Call uushow(0,g_u2,g_u3)
elseif aibj(g_u0,s_uduu) and dkdir(2,g_u2) then
Call uulist(0)
end if
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","uu")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=uulie()
'-----------------------------------
Function uulie(uufty)
if uufty="form" then
uulie="u1,b1,z1,x1,u2,b2,z2,x2,tm,t1"
elseif uufty=s_umlb then
uulie="uu_id,uu_u1,uu_b1,uu_z1,uu_x1,uu_u2,uu_b2,uu_z2,uu_x2,uu_tm,uu_t1"
elseif uufty="all" then
uulie="uu_id,uu_u1,uu_b1,uu_z1,uu_x1,uu_u2,uu_b2,uu_z2,uu_x2,uu_tm,uu_t1"
end if
End Function
'-----------------------------------
'uu menu
'=uume()
'-----------------------------------
Function uume()
uume="<div class=""l-ra""><ul>"
dim uumrr,uumi
uumrr=split(i_buux,"|")
uume=uume&"<li class=""pt"">"
uume=uume&""&iclbico(0,"tag",1)&"<a"
if ainull(g_u1) or (aibj(s_umgl,g_u0) and ainull(g_u2)) then uume=uume&" class=""l-va"""
uume=uume&" href="""&eshref(s_uduu&g_urz,1)&""">"&s_umqbs&s_uduus&"</a></li>"
uume=uume&"<li class=""l-1 pt"">"&iclbico(0,"tag",1)&"<a"
if aibj("1",g_u10) then uume=uume&" class=""l-va"""
uume=uume&" href="""&eshref(s_uduu&g_urg&g_u1&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"1"&g_urz,1)&""">互为"&s_uduus&"</a></li>"
uume=uume&"<li class=""pt"">"&iclbico(0,"tag",1)&"<a"
if aibj("2",g_u10) then uume=uume&" class=""l-va"""
uume=uume&" href="""&eshref(s_uduu&g_urg&g_u1&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"2"&g_urz,1)&""">我加"&s_uduus&"</a></li>"
uume=uume&"<li class=""l-1 pt"">"&iclbico(0,"tag",1)&"<a"
if aibj("3",g_u10) then uume=uume&" class=""l-va"""
uume=uume&" href="""&eshref(s_uduu&g_urg&g_u1&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"3"&g_urz,1)&""">加我"&s_uduus&"</a></li>"
for uumi=ubound(uumrr) to 0 step -1
if uumi mod 2=0 then
uume=uume&"<li class=""l-1 pt"">"
else
uume=uume&"<li class=""pt"">"
end if
uume=uume&""&iclbico(0,"tag",1)&"<a"
if aibj(g_u1,uumi) or (aibj(s_umgl,g_u0) and aibj(g_u2,uumi)) or aibj(uulty,uumi) then uume=uume&" class=""l-va"""
uume=uume&" href="""&eshref(s_uduu&g_urg&uumi&g_urg&d_suuls&g_urz,1)&""">"&uumrr(uumi)&"</a></li>"
next
uume=uume&"</ul></div>"
End Function
'-----------------------------------
'add/edit form
'=uuform()
'-----------------------------------
Function uuform(uufty,uufqx,uufu2,uufu1)
if uufty=0 then
if ainull(uufu1) then
uu_u1=e_uer
else
uu_u1=aistr(uufu1)
end if
uu_tm=aitm(3,now())
if not ainull(uufu2) then uu_u2=aistr(uufu2)
uu_x1=0
uu_x2=0
end if
uuform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
if uufqx=1 then
uuform=uuform&icflsr(25,"发起","","u1","",66,50,"*发起人","",uu_u1)&icflsr(25,"好友","","u2","",66,50,"*好友","",uu_u2)&icflsr(25,"时间","","tm","",6,200,"*","",uu_tm)&icflsr(25,"时一","","t1","",6,200,"","",uu_t1)
uuform=uuform&icflsr(5,"备一","","b1","",0,200,"备注名称","",uu_b1)&icflsr(25,"新一","","z1","",6,20,"新收未读消息","",uu_z1)&icflxz(25,"状一","x1","","好友状态","f-s",uu_x1,0,i_buux)
uuform=uuform&icflsr(5,"备二","","b2","",0,200,"备注名称","",uu_b2)&icflsr(25,"新二","","z2","",6,20,"新收未读消息","",uu_z2)&icflxz(25,"状二","x2","","好友状态","f-s",uu_x2,0,i_buux)
uuform=uuform&"</ul></div><div class=f-l><ul>"
else

if uufty=1 and aibj(uu_u1,e_uer) then
if aiint(uu_t1)=0 then
uuform=uuform&icflsr(25,"好友","","u2","",66,50,"*好友","",uu_u2)
else
uuform=uuform&icflsr(25,"好友","read","u2","",66,50,"*好友","",uu_u2)
end if
uuform=uuform&icflxz(25,"好友关系","x1","","好友关系","f-s",uu_x1,0,i_buux)&icflsr(5,"备注名","","b2","",0,200,"备注名称","",uu_b2)
uuform=uuform&aiinput("hidden","u1","",0,0,"","",uu_u1)&aiinput("hidden","b1","",0,0,"","",uu_b1)&aiinput("hidden","x2","",0,0,"","",uu_x2)&aiinput("hidden","z1","",0,0,"","",uu_z1)&aiinput("hidden","z2","",0,0,"","",uu_z2)&aiinput("hidden","tm","",0,0,"","",uu_tm)&aiinput("hidden","t1","",0,0,"","",uu_t1)

elseif uufty=1 and aibj(uu_u2,e_uer) then
uuform=uuform&icflsr(25,"好友","read","u1","",66,50,"*好友","",uu_u1)
uuform=uuform&icflxz(25,"状态","x2","","好友状态","f-s",uu_x2,0,i_buux)&icflsr(5,"备注名","","b1","",0,200,"备注名称","",uu_b1)
uuform=uuform&aiinput("hidden","u2","",0,0,"","",uu_u2)&aiinput("hidden","b2","",0,0,"","",uu_b2)&aiinput("hidden","x1","",0,0,"","",uu_x1)&aiinput("hidden","z1","",0,0,"","",uu_z1)&aiinput("hidden","z2","",0,0,"","",uu_z2)&aiinput("hidden","tm","",0,0,"","",uu_tm)&aiinput("hidden","t1","",0,0,"","",uu_t1)

else
uu_x1=2
if aibj(g_u1,s_umfb) then uuform="<div class=""f-l b-cb""><form id=""AsaiForm"" name=""AsaiForm"" action="""&g_u&""" method=""post"" AUTOCOMPLETE=""off"" target=""mnkfrm""><ul>"
uuform=uuform&icflsr(25,"好友","read","u2","",66,50,"*好友","",uu_u2)&icflxz(25,"好友关系","x1","","好友关系","f-s",uu_x1,0,i_buux)&icflsr(5,"备注名","","b2","",0,200,"备注名称","",uu_b2)
uuform=uuform&aiinput("hidden","u1","",0,0,"","",uu_u1)&aiinput("hidden","b1","",0,0,"","",uu_b1)&aiinput("hidden","x2","",0,0,"","",uu_x2)&aiinput("hidden","z1","",0,0,"","",uu_z1)&aiinput("hidden","z2","",0,0,"","",uu_z2)&aiinput("hidden","tm","",0,0,"","",uu_tm)&aiinput("hidden","t1","",0,0,"","",uu_t1)
end if

end if
uuform=uuform&icflot(10,"验证",eskyx(0,1,2))
if uufty=1 then
uuform=uuform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",uu_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif uufty=0 then
uuform=uuform&icflot(10,"",aibutton(2,"","","f-sb f-skx","添加")&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
uuform=uuform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=uuadd()
'-----------------------------------
Function uuadd(uufqx,uufu2,uufu1)
ew_bt=s_umtjs&s_uduus&","&ew_bt:ew_zt=s_umtjs&s_uduus&","&ew_zt:ew_nr=s_umtjs&s_uduus&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_umtjs&s_uduus&"</li>"
e_mt=esbts(s_udxuu,s_udluu,s_umtjs&s_uduus,"")
if esky(1,e_uzy) then
if aireqx("u1,u2,x1,x2") then
if gysfm(uulie("form"),uubiao,"(uu_u1='"&aistr(aireq("u1"))&"' and uu_u2='"&aistr(aireq("u2"))&"') or (uu_u1='"&aistr(aireq("u2"))&"' and uu_u2='"&aistr(aireq("u1"))&"')","uu_",1) then
if uufqx=0 then
e_ma=e_ma&aigo(s_umtjs&s_uduus&s_ztcg,1)
else
e_ma=e_ma&aigo(s_umtjs&s_uduus&s_ztcg,e_lj0)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduus&s_ztsb&"[已建立关系]",1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduus&s_ztsb&"[请填写完整表单]",1)
end if
else
e_ma=uuform(0,uufqx,uufu2,uufu1)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=uuedit()
'-----------------------------------
Function uuedit(uufqx,uufu2,uufu1)
ew_bt=s_umxgs&s_uduus&","&ew_bt:ew_zt=s_umxgs&s_uduus&","&ew_zt:ew_nr=s_umxgs&s_uduus&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_umxgs&s_uduus&"</li>"
e_mt=esbts(s_udxuu,s_udluu,s_umxgs&s_uduus,"")
if esky(1,e_uzy) then
if aireqx("u1,u2,x1,x2") then
if uufqx=1 then
uuwhere="uu_id="&aiint(aireq("id"))&""
else
uuwhere="(uu_u1='"&aistr(aireq("u1"))&"' and uu_u2='"&aistr(aireq("u2"))&"') or (uu_u1='"&aistr(aireq("u2"))&"' and uu_u2='"&aistr(aireq("u1"))&"')"
end if
if gysfm(uulie("form"),uubiao,uuwhere,"uu_",2) then
e_ma=e_ma&aigo(s_umxgs&s_uduus&s_ztcg,1)
else
e_ma=e_ma&aigo(s_umxgs&s_uduus&s_ztsb&"[不存在或无权修改]",1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_uduus&s_ztsb&"[请填写完整表单]",1)
end if
else
if uufqx=1 then
uuwhere="uu_id="&aiint(uufu2)&""
else
uuwhere="(uu_u1='"&aistr(uufu2)&"' and uu_u2='"&aistr(uufu1)&"') or (uu_u1='"&aistr(uufu1)&"' and uu_u2='"&aistr(uufu2)&"')"
end if
if gysread(uulie("all"),uubiao,uuwhere,"") then
if aiint(uu_t1)=0 then uu_t1=aitm(3,now())
ew_bt=uu_u1&","&ew_bt:ew_zt=uu_u1&","&ew_zt:ew_nr=uu_u1&","&ew_nr
e_ma=uuform(1,uufqx,uufu2,uufu1)&e_ma
else
e_ma=e_ma&aigo(s_uduus&s_ztno&"[不存在或无权修改]",1)
end if
end if
End Function
'-----------------------------------
'del
'=uudel(uufqx)
'-----------------------------------
Function uudel(uufqx,uufu2,uufu1)
ew_bt=s_uduus&s_umscs&","&ew_bt:ew_zt=s_uduus&s_umscs&","&ew_zt:ew_nr=s_uduus&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_uduus&s_umscs&"</li>"
e_mt=esbts(s_udxuu,s_udluu,s_umscs&s_uduus,"")
if uufqx=1 then
if e_uuy>2 then
if aiint(uufu2)>0 then
if gysdel(uubid,uubiao,"uu_id="&aiint(uufu2)) then
e_ma=e_ma&aitiao(s_uduus&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduus&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(uubid,uubiao,0) then
e_ma=e_ma&aitiao(s_uduus&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduus&s_umscs&s_ztsb,1)
end if
end if
end if
else
if uufu2<>"" then
if gysdel(uubid,uubiao,"uu_u1='"&e_uer&"' and uu_x2<2 and uu_u2='"&uufu2&"'") then
e_ma=e_ma&aitiao(s_uduus&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduus&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u1,s_umsc&"-x") then
if gysdel(uubid,uubiao,"uu_u1='"&e_uer&"' and uu_x2<2") then
e_ma=e_ma&aitiao(s_uduus&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduus&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'show
'=uushow()
'-----------------------------------
Function uushow(uufqx,uufu2,uufu1)
if uufqx=1 then
uuwhere="uu_id="&aiint(uufu2)&""
else
uuwhere="(uu_u1='"&uufu2&"' and uu_u2='"&uufu1&"') or (uu_u1='"&uufu1&"' and uu_u2='"&uufu2&"')"
end if
if gysread(uulie("all"),uubiao,uuwhere,"") then
ew_bt=usren(uu_u1)&","&usren(uu_u2)&","&ew_bt:ew_zt=usren(uu_u1)&","&usren(uu_u2)&","&ew_zt:ew_nr=usren(uu_u1)&","&usren(uu_u2)&","&ew_nr:ew_cp=usren(uu_u1)&","&usren(uu_u2)&","&ew_cp
dim uudsx,uudpur,uudpg,lidgl
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_uduu&g_urg&s_umxx&g_urg&uu_id&g_urz,77)&""">"&usren(uu_u1)&s_uduus&"</a></li>"
uudpg=aiint(g_u4)
uudpur=eshref(s_umgl&g_urg&s_uduu&g_urg&g_u2&g_urg&uu_id&g_urz,77)
'admin 0
lidgl=g_gx&"编辑"&s_uduus&g_gy&eshref(s_umgl&g_urg&s_uduu&g_urg&s_umxg&g_urg&uu_id&g_urz,77)&g_gx&"删除"&s_uduus&g_gy&eshref(s_umgl&g_urg&s_uduu&g_urg&s_umsc&g_urg&uu_id&g_urz,77)
'admin 1
e_mt=esbts(uudsx,s_udluu,s_uduus&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_uduu&g_urg&s_umxx&g_urg&uu_u1&g_urg&uu_u2&g_urz,77),s_uduus&s_umlbs&g_gy&eshref(s_umgl&g_urg&s_uduu&g_urg&d_suuls&g_urz,77)&lidgl)
else
uudpg=aiint(g_u4)
uudpur=eshref(s_uduu&g_urg&g_u1&g_urg&uu_u1&g_urg&uu_u2&g_urz,66)
'admin 0
lidgl=""
if aibj(uu_u2,e_uer) then
lidgl=lidgl&g_gx&"编辑"&s_uduus&g_gy&eshref(s_uduu&g_urg&s_umxg&g_urg&uu_u1&g_urg&uu_u2&g_urz,66)
uulty=uu_x1
elseif aibj(uu_u1,e_uer)  then
lidgl=lidgl&g_gx&"编辑"&s_uduus&g_gy&eshref(s_uduu&g_urg&s_umxg&g_urg&uu_u1&g_urg&uu_u2&g_urz,66)
if aiint(uu_u2)<1 then lidgl=lidgl&g_gx&"删除"&s_uduus&g_gy&eshref(s_uduu&g_urg&s_umsc&g_urg&uu_u1&g_urg&uu_u2&g_urz,66)
uulty=uu_x2
end if
e_wl=e_wl&"<li><a href="""&eshref(s_uduu&g_urg&uulty&g_urg&d_suuls&g_urz,66)&""">"&aiarr(i_buux,"|",uulty)&"</a></li>"
e_wl=e_wl&"<li>"&usren(uu_u1)&s_uduus&"</li>"
'admin 1
e_mt=esbts(uudsx,s_udluu,s_uduus&s_umxxs,s_uduus&s_umlbs&g_gy&eshref(s_uduu&g_urg&uulty&g_urg&d_suuls&g_urz,66)&lidgl)
end if
if ainull(uu_b1) then
icdcb=usren(uu_u1)&""
else
icdcb=uu_b1&"("&usren(uu_u1)&")"
end if
if aiint(uu_z2)>0 then icdcb=icdcb&"<sup class=""ts"">未读"&uu_z2&"条</sup>"
icdcb=icdcb&" &amp; "
if ainull(uu_b2) then
icdcb=icdcb&""&usren(uu_u2)&""
else
icdcb=icdcb&uu_b2&"("&usren(uu_u2)&")"
end if
if aiint(uu_z1)>0 then icdcb=icdcb&"<sup class=""ts"">未读"&uu_z1&"条</sup>"
'--------------------------------HENG 0
if not ainull(uu_tm) then icdcd=aitms("发起时间：",uu_tm,9)
if not ainull(uu_t1) then icdcd=icdcd&aitms(" 建交时间：",uu_t1,9)
'--------------------------------HENG 1
if aibj(uu_u2,e_uer) and aiint(uu_z1)>0 then
Call gysgx(uubiao,"uu_z1=0",uuwhere)
elseif aibj(uu_u1,e_uer) and aiint(uu_z2)>0 then
Call gysgx(uubiao,"uu_z2=0",uuwhere)
end if
ew_sc=0
icdty=9
e_ma=e_ma&icnr(icdty,s_uduus,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
e_ma=e_ma&"<div class=""cr""></div></div>"
else
e_ma=e_ma&aigo(s_uduus&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=uulist()
'-----------------------------------
Function uulist(uufqx)
dim uulpg,uulps,uulpuq,uulpuh,uulpur,uulgrr,uulty,uultyd
if uufqx=1 then
uulpuq=eshref(s_umgl&g_urg&s_uduu,66)
uulty=g_u2
lidms=g_u3
if ainull(lidms) then lidms=d_susls
uulpuh=g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10
uulpur=uulpuq&g_urg&uulty&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uulpuh&g_urz
uulpg=aiint(g_u4)
uulps=aiint(g_u5)
else
uulpuq=eshref(s_uduu,66)
uulty=g_u1
lidms=g_u2
if ainull(lidms) then lidms=d_susls
uulpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
uulpur=uulpuq&g_urg&uulty&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uulpuh&g_urz
uulpg=aiint(g_u3)
uulps=aiint(g_u4)
end if
if not ainull(uulty) then
e_mt=esbts(s_udxuu,s_udluu,aiarr(i_buux,"|",aiint(uulty)),"")
e_wl=e_wl&"<li>"&aiarr(i_buux,"|",aiint(uulty))&"</li>"
elseif not ainull(g_u10) then
if g_u10="1" then
e_mt=esbts(s_udxuu,s_udluu,"已经互相加为好友","")
e_wl=e_wl&"<li>已经互相加为好友</li>"
elseif g_u10="2" then
e_mt=esbts(s_udxuu,s_udluu,"我主动加的好友","")
e_wl=e_wl&"<li>我主动加的好友</li>"
elseif g_u10="3" then
e_mt=esbts(s_udxuu,s_udluu,"主动加我的好友","")
e_wl=e_wl&"<li>主动加我的好友</li>"
else
e_mt=esbts(s_udxuu,s_udluu,s_uduus&s_umlbs,"")
end if
else
e_mt=esbts(s_udxuu,s_udluu,s_uduus&s_umlbs,"")
end if
iclls=icliqls(5,lidms,eshref(uulpuq&g_urg&uulty&g_urg&g_gg&g_urg&g_urg&g_urg&uulpuh&g_urz,66))

Call uusers()
e_mz=e_mz&icliq(iclls,uulpuq&g_urg&lidms,uulpuh,e_gdj,uufqx,"uu")
Call uusersql(uulty)

if uulps=0 then
if aibj(lidms,s_umlpy) then
uulps=i_nmhc
else
uulps=i_nmlb
end if
end if

if gyslist(uubid,uulie(s_umlb),uubiao,uuwhere,uuorder,uulpur,uulpg,uulps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if uufqx=1 then lidti=lidti&"<b>操作</b>"
lidti=lidti&"<i>次数</i>"
lidti=lidti&"<u>创建时间</u>"
lidti=lidti&"<u>对方关系</u>"
lidti=lidti&"好友"
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
'@@uu_id,1uu_u1,2uu_b1,3uu_z1,4uu_x1,5uu_u2,6uu_b2,7uu_z2,8uu_x2,9uu_tm,10uu_t1
lidbt=uulic(1,0,gysay(4),gysay(8),gysay(9))
if aibj(gysay(1),e_uer) then
if not ainull(gysay(6)) then
lidbt=lidbt&gysay(6)&"("&usren(gysay(5))&")"
else
lidbt=lidbt&usren(gysay(5))
end if
uultyd=gysay(8)
if aiint(gysay(7))>0 then lidbt=lidbt&"<sup class=""ts"">未读"&gysay(7)&"条</sup>"
else
if not ainull(gysay(2)) then
lidbt=lidbt&gysay(2)&"("&usren(gysay(1))&")"
else
lidbt=lidbt&usren(gysay(1))
end if
uultyd=gysay(4)
if aiint(gysay(3))>0 then lidbt=lidbt&"<sup class=""ts"">未读"&gysay(3)&"条</sup>"
end if
lidbt=lidbt&uulic(1,1,gysay(4),gysay(8),gysay(9))

lidtt="发起："&usren(gysay(1))&vbNewLine
lidtt=lidtt&"好友："&usren(gysay(5))&vbNewLine
lidtt=lidtt&"时间："&gysay(9)
lidtt=lidtt&"会面："&gysay(10)
if uufqx=1 then
lidlj=eshref(s_umgl&g_urg&s_uduu&g_urg&s_umxx&g_urg&gysay(0)&g_urz,66)
else
lidlj=eshref(s_uduu&g_urg&s_umxx&g_urg&gysay(1)&g_urg&gysay(5)&g_urz,66)
end if
if uufqx=1 then
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_uduu&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_uduu&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_uduus&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if
'list
if aibj(lidms,s_umlb) then
lids1=lids1&"<i>"&gysay(9)&"</i>"
lids1=lids1&"<u>"&gysay(10)&"</u>"
lids1=lids1&"<u"
if aiint(uultyd)>2 then lids1=lids1&" class=""ftt"""
lids1=lids1&">"&aiarr(i_buux,"|",uultyd)&"</u>"
else
lidms=s_umlpc
lids2=usren(gysay(1))&" 邀请 "&usren(gysay(5))&" 成为好友。"&"<br>"
lids3="发起时间："&gysay(9)&aitms("　建交时间：",gysay(10),2)&"　对方关系："&aiarr(i_buux,"|",uultyd)
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,uufqx,eshref(s_umgl&g_urg&s_uduu&g_urg&s_umsc&"-x"&g_urz,77),"uu")
e_ma=e_ma&e_mx&e_mzs&e_mz

End Function
'-----------------------------------
'=uulic(1,"")
'-----------------------------------
Function uulic(uufkg,uufty,uufx1,uufx2,uuftm)
uulic=""
if uufkg=1 and uufty=0 then
uulic=uulic&icqz(s_udluu,uufty,uufx1,0)
elseif uufkg=1 and uufty=1 then
uulic=uulic&ichz(1,uuftm,0,"")
end if
End Function
'-----------------------------------
'=uusers()
'Call uusers()
'-----------------------------------
Function uusers()
icdssp="排序|最新|时间"
icdrrp=split("uu_id desc|uu_id desc|uu_tm desc","|")
icdssf="范围|"&usren(ew_kt)&"|"&usren(ew_kg)&"|发起|接受"
icdrrf=split("|uu_u1='"&ew_kt&"'|uu_u1='"&ew_kg&"'|uu_u1='"&e_uer&"'|uu_u2='"&e_uer&"'","|")
icdssx="项目|发送|接收"
icdrrx=split("uu_u1|uu_u1|uu_u2","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=uusersql(uufty)
'-----------------------------------
Function uusersql(uufty)
dim uudtyw
uudtyw=""
Call icserq()
uuwhere=""
uuorder=iclorder
iclapp=1
'order
if ainull(uuorder) then uuorder=uuordermo
if not ainull(uufty) then uudtyw=" (uu_u1='"&e_uer&"' and uu_x2="&aiint(uufty)&") or (uu_u2='"&e_uer&"' and uu_x1="&aiint(uufty)&")"
'admin
if not aibj(g_u0,s_umgl) then
if not ainull(g_u10) then
if g_u10="1" then
if not ainull(uufty) then
uuwhere="("&uudtyw&") and uu_x1>0 and uu_x2>0"
else
uuwhere="(uu_u1='"&e_uer&"' or uu_u2='"&e_uer&"') and uu_x1>0 and uu_x2>0"
end if
elseif g_u10="2" then
if not ainull(uufty) then
uuwhere=" uu_u1='"&e_uer&"' and uu_x2="&aiint(uufty)&""
else
uuwhere=" uu_u1='"&e_uer&"'"
end if
elseif g_u10="3" then
if not ainull(uufty) then
uuwhere=" uu_u2='"&e_uer&"' and uu_x1="&aiint(uufty)&""
else
uuwhere=" uu_u2='"&e_uer&"'"
end if
else
if not ainull(uufty) then
uuwhere=uudtyw
else
uuwhere=" uu_u1='"&e_uer&"' or uu_u2='"&e_uer&"'"
end if
end if
else
if not ainull(uufty) then
uuwhere=uudtyw
else
uuwhere=" uu_u1='"&e_uer&"' or uu_u2='"&e_uer&"'"
end if
end if
end if
End Function
%>