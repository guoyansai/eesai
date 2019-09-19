<%
'@@0manage/1s_udux/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_udux/2edit|add|del/3*id.HTML

'@@0s_udux/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_udux/1edit|add/2*id.HTML
'@@0s_udux/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_udux) or aibj(g_u1,s_udux)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_udux,s_uduxs&s_umlbs)

if (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udux) and aibj(g_u2,s_umtj) then
Call uxadd(1)
elseif aibj(g_u0,s_udux) and aibj(g_u1,s_umfb) then
e_skc=dosk("a","mnk",""):Call uxadd(0)
elseif aibj(g_u0,s_udux) and aibj(g_u1,s_umtj) then
Call uxadd(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udux) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call uxedit(1)
elseif aibj(g_u0,s_udux) and aibj(g_u1,s_umxg) then
Call uxedit(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udux) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and not ainull(g_u3) then
Call uxshow(g_u3)
elseif aibj(g_u0,s_udux) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) and not ainull(g_u2) then
Call uxshow(g_u2)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udux) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call uxdel(1)
elseif aibj(g_u0,s_udux) and ((aibj(g_u1,s_umsc) and aiint(g_u2)>0) or aibj(g_u1,s_umsc&"-x")) then
Call uxdel(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udux) and dkdir(2,g_u2) then
Call uxlist(1)
elseif aibj(g_u0,s_udux) and dkdir(2,g_u1) then
Call uxlist(0)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","ux")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=uxlie()
'-----------------------------------
Function uxlie(uxfty)
if uxfty="form" then
uxlie="co,tm,us,u1,ya,y1,t1,ty"
elseif uxfty=s_umlb then
uxlie="ux_id,ux_co,ux_tm,ux_us,ux_u1,ux_ya,ux_y1,ux_t1,ux_ty"
elseif uxfty="all" then
uxlie="ux_id,ux_co,ux_tm,ux_us,ux_u1,ux_ya,ux_y1,ux_t1,ux_ty"
end if
End Function
'-----------------------------------
'add/edit form
'=uxform()
'-----------------------------------
Function uxform(uxfty,uxfqx)
if uxfty=0 then
ux_us=e_uer
ux_tm=aitm(3,now())
if uxfqx=1 then
if not ainull(g_u3) then ux_u1=aistr(g_u3)
else
if not ainull(g_u2) then ux_u1=aistr(g_u2)
end if
ux_ya=1
ux_y1=1
end if
uxform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
if uxfqx=1 then
uxform=uxform&icflsr(25,"接收","","u1","",66,50,"*接收人(公共信息请发送到"&ew_kg&")","",ux_u1)&icflsr(25,"发送","","us","",66,50,"*发送人(系统信息发送人"&ew_kt&")","",ux_us)&icflsr(25,"发送时间","","tm","",6,200,"*","",ux_tm)&icflsr(25,"接收时间","","t1","",6,200,"","",ux_t1)
uxform=uxform&icflsr(10,"内容","","co","",0,200,"*内容(请输入短信内容)","",ux_co)
uxform=uxform&icflxz(25,"短信类型","ty","","","",ux_ty,0,i_buxty)&icflxz(25,"发星标","ya","","*","",ux_ya,0,i_buxya)&icflxz(25,"收星标","y1","","*","",ux_y1,0,i_buxya)
uxform=uxform&"</ul><ul>"
else
if uxfty=1 and aibj(ux_u1,e_uer) then
uxform=uxform&icflxz(10,"收星标","y1","","*","",ux_y1,0,i_buxya)
uxform=uxform&aiinput("hidden","us","",0,0,"","",ux_us)&aiinput("hidden","u1","",0,0,"","",ux_u1)&aiinput("hidden","tm","",0,0,"","",ux_tm)&aiinput("hidden","co","",0,0,"","",ux_co)&aiinput("hidden","t1","",0,0,"","",ux_t1)&aiinput("hidden","ya","",0,0,"","",ux_ya)&aiinput("hidden","y1","",0,0,"","",ux_y1)
elseif uxfty=1 and aibj(ux_us,e_uer) then
if aiint(ux_t1)=0 then
uxform=uxform&icflsr(10,"内容","","co","",0,200,"*内容(请输入短信内容)","",ux_co)
uxform=uxform&icflsr(5,"接收","","u1","",66,50,"*接收人","",ux_u1)&icflxz(25,"短信类型","ty","","","",ux_ty,0,left(i_buxty,14))&icflxz(25,"发星标","ya","","*","",ux_ya,0,i_buxya)
else
uxform=uxform&aiinput("hidden","u1","",0,0,"","",ux_u1)&aiinput("hidden","co","",0,0,"","",ux_co)&aiinput("hidden","ty","",0,0,"","",ux_ty)&aiinput("hidden","ya","",0,0,"","",ux_ya)
end if
uxform=uxform&aiinput("hidden","us","",0,0,"","",ux_us)&aiinput("hidden","tm","",0,0,"","",ux_tm)&aiinput("hidden","y1","",0,0,"","",ux_y1)
elseif uxfty=0 then
if aibj(g_u1,s_umfb) then
uxform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""&g_u&""" method=""post"" AUTOCOMPLETE=""off"" target=""mnkfrm""><ul>"
if ainull(ux_u1) then
uxform=uxform&icflsr(10,"内容","","co","",0,200,"*内容(请输入短信内容)","",ux_co)
uxform=uxform&icflsr(5,"接收","","u1","",66,50,"*接收人","",ux_u1)&icflxz(25,"短信类型","ty","","","",ux_ty,0,left(i_buxty,14))&icflxz(25,"发星标","ya","","*","",ux_ya,0,i_buxya)
else
uxform=uxform&aiinput("hidden","u1","",0,0,"","",ux_u1)&icflsr(10,"短信内容","","co","",0,200,"*内容(请输入短信内容)","",ux_co)&aiinput("hidden","ya","",0,0,"","",ux_ya)&aiinput("hidden","ty","",0,0,"","",ux_ty)
end if
else
uxform=uxform&icflsr(10,"内容","","co","",0,200,"*内容(请输入短信内容)","",ux_co)
uxform=uxform&icflsr(5,"接收","","u1","",66,50,"*接收人","",ux_u1)&icflxz(25,"短信类型","ty","","","",ux_ty,0,left(i_buxty,14))&icflxz(25,"发星标","ya","","*","",ux_ya,0,i_buxya)
end if
uxform=uxform&aiinput("hidden","us","",0,0,"","",ux_us)&aiinput("hidden","tm","",0,0,"","",ux_tm)&aiinput("hidden","y1","",0,0,"","",ux_y1)
end if
end if
uxform=uxform&icflot(10,"验证",eskyx(0,1,2))
if uxfty=1 then
uxform=uxform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",ux_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif uxfty=0 then
uxform=uxform&icflot(10,"",aibutton(2,"","","f-sb f-skx","发送")&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
uxform=uxform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=uxadd()
'-----------------------------------
Function uxadd(uxfqx)
ew_bt="发送"&s_uduxs&","&ew_bt:ew_zt="发送"&s_uduxs&","&ew_zt:ew_nr="发送"&s_uduxs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">发送"&s_uduxs&"</a></li>"
e_mt=esbts(s_udxux,s_udlux,"发送"&s_uduxs&g_gy&e_lj1,s_uduxs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("us,u1,co") then
if gysat("us_ux",usbiao,"us_er='"&aitit(aireq("u1"))&"'","+1") then
if gysfm(uxlie("form"),uxbiao,"ux_us='"&aistr(aireq("us"))&"' and ux_u1='"&aistr(aireq("u1"))&"' and ux_co='"&aistr(aireq("co"))&"'","ux_",1) then
if aibj(g_u1,s_umfb) then
e_ma=e_ma&aigo("发送"&s_uduxs&s_ztcg,1)
else
e_ma=e_ma&aigo("发送"&s_uduxs&s_ztcg,e_lj0)
end if
else
e_ma=e_ma&aigo("发送"&s_uduxs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo("发送"&s_uduxs&s_ztsb&"[不存在的用户名]",1)
end if
else
e_ma=e_ma&aigo("发送"&s_uduxs&s_ztsb&"[填写完整表单]",1)
end if
else
e_ma=uxform(0,uxfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=uxedit()
'-----------------------------------
Function uxedit(uxfqx)
ew_bt=s_umxgs&s_uduxs&","&ew_bt:ew_zt=s_umxgs&s_uduxs&","&ew_zt:ew_nr=s_umxgs&s_uduxs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udux&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_uduxs&"</a></li>"
e_mt=esbts(s_udxux,s_udlux,s_umxgs&s_uduxs&g_gy&eshref(s_umgl&g_urg&s_udux&g_urg&s_umxg&g_urg&g_u3&g_urz,77),"发送"&s_uduxs&g_gy&e_lj1&g_gx&s_uduxs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("sn,us,u1,co") then
if gysfm(uxlie("form"),uxbiao,"ux_id="&aiint(aireq("id"))&"","ux_",2) then
e_ma=e_ma&aigo(s_umxgs&s_uduxs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_uduxs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_uduxs&s_ztsb,1)
end if
else
if uxfqx=1 then
uxwhere="ux_id="&aiint(g_u3)&""
else
uxwhere="ux_id="&aiint(g_u2)&""
end if
if gysread(uxlie("all"),uxbiao,uxwhere,"") then
ew_bt=ux_us&","&ew_bt:ew_zt=ux_us&","&ew_zt:ew_nr=ux_us&","&ew_nr
e_ma=uxform(1,uxfqx)&e_ma
else
e_ma=e_ma&aigo(s_uduxs&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=uxdel(uxfqx)
'-----------------------------------
Function uxdel(uxfqx)
ew_bt=s_uduxs&s_umscs&","&ew_bt:ew_zt=s_uduxs&s_umscs&","&ew_zt:ew_nr=s_uduxs&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_uduxs&s_umscs&"</li>"
e_mt=esbts(s_udxux,s_udlux,s_umscs&s_uduxs,"发送"&s_uduxs&g_gy&e_lj1&g_gx&s_uduxs&s_umlbs&g_gy&e_lj0)
if uxfqx=1 then
if e_uxy>2 then
if aiint(g_u3)>0 then
if gysdel(uxbid,uxbiao,"ux_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_uduxs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduxs&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(uxbid,uxbiao,0) then
e_ma=e_ma&aitiao(s_uduxs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduxs&s_umscs&s_ztsb,1)
end if
end if
end if
else
if aiint(g_u2)>0 then
if gysdel(uxbid,uxbiao,"ux_us='"&e_uer&"' and ux_y1<3 and ux_id="&aiint(g_u2)) then
e_ma=e_ma&aitiao(s_uduxs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduxs&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u1,s_umsc&"-x") then
if gysdel(uxbid,uxbiao,"ux_us='"&e_uer&"' and ux_y1<3") then
e_ma=e_ma&aitiao(s_uduxs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduxs&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'show
'=uxshow()
'-----------------------------------
Function uxshow(uxfid)
if aibj(g_u0,s_umgl) then
uxwhere="ux_id="&aistr(uxfid)&""
else
'uxwhere="ux_id="&aistr(uxfid)&" and ux_y1>0 and (ux_u1='"&ew_kg&"' or ux_u1='"&e_uer&"' or ux_us='"&ew_kt&"' or ux_us='"&e_uer&"')"
uxwhere="ux_id="&aistr(uxfid)&" and (ux_u1='"&ew_kg&"' or ux_u1='"&e_uer&"' or ux_us='"&ew_kt&"' or ux_us='"&e_uer&"')"
end if
if gysread(uxlie("all"),uxbiao,uxwhere,"") then
ew_bt=usren(ux_us)&","&ew_bt:ew_zt=usren(ux_us)&","&ew_zt:ew_nr=usren(ux_us)&","&ew_nr:ew_cp=usren(ux_us)&","&ew_cp
dim uxdsx,uxdpur,uxdpg,lidgl
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udux&g_urg&s_umxx&g_urg&ux_id&g_urz,77)&""">"&usren(ux_us)&s_uduxs&"</a></li>"
uxdpg=aiint(g_u4)
uxdpur=eshref(s_umgl&g_urg&s_udux&g_urg&g_u1&g_urg&ux_id&g_urz,77)
'admin 0
lidgl=""
lidgl=lidgl&g_gx&"编辑"&s_uduxs&g_gy&eshref(s_umgl&g_urg&s_udux&g_urg&s_umxg&g_urg&ux_id&g_urz,77)&g_gx&"再发"&s_uduxs&g_gy&eshref(s_umgl&g_urg&s_udux&g_urg&s_umtj&g_urg&ux_u1&g_urz,77)
lidgl=lidgl&g_gx&"处理"&s_uduxs&g_gy&eshref(s_umgl&g_urg&s_udux&g_urg&s_umxg&g_urg&ux_id&g_urz,77)&g_gx&"<i>回复"&s_uduxs&"</i>"&g_gy&eshref(s_umgl&g_urg&s_udux&g_urg&s_umtj&g_urg&ux_us&g_urz,77)
lidgl=lidgl&g_gx&"删除"&s_uduxs&g_gy&eshref(s_umgl&g_urg&s_udux&g_urg&s_umsc&g_urg&ux_id&g_urz,77)
'admin 1
e_mt=esbts(uxdsx,s_udlux,s_uduxs&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_udux&g_urg&s_umxx&g_urg&ux_id&g_urz,77),s_uduxs&s_umlbs&g_gy&eshref(s_umgl&g_urg&s_udux&g_urg&s_umlb&g_urz,77)&lidgl)
else
e_wl=e_wl&"<li><a href="""&eshref(s_udux&g_urg&s_umxx&g_urg&ux_id&g_urz,66)&""">"&usren(ux_us)&s_uduxs&"</a></li>"
uxdpg=aiint(g_u3)
uxdpur=eshref(s_udux&g_urg&g_u0&g_urg&ux_id&g_urz,66)
'admin 0
lidgl=""
if aibj(ux_us,e_uer) then lidgl=lidgl&g_gx&"编辑"&s_uduxs&g_gy&eshref(s_udux&g_urg&s_umxg&g_urg&ux_id&g_urz,66)&g_gx&"再发"&s_uduxs&g_gy&eshref(s_udux&g_urg&s_umtj&g_urg&ux_u1&g_urz,66)
if aibj(ux_u1,e_uer) then lidgl=lidgl&g_gx&"处理"&s_uduxs&g_gy&eshref(s_udux&g_urg&s_umxg&g_urg&ux_id&g_urz,66)&g_gx&"<i>回复"&s_uduxs&"</i>"&g_gy&eshref(s_udux&g_urg&s_umtj&g_urg&ux_us&g_urz,66)
if aibj(ux_us,e_uer) and aiint(ux_y1)<3 then lidgl=lidgl&g_gx&"删除"&s_uduxs&g_gy&eshref(s_udux&g_urg&s_umsc&g_urg&ux_id&g_urz,66)
'admin 1
e_mt=esbts(uxdsx,s_udlux,s_umzss&s_uduxs&g_gy&eshref(s_udux&g_urg&s_umzs&g_urg&ux_id&g_urz,66),s_uduxs&s_umlbs&g_gy&eshref(s_udux&g_urg&s_umlb&g_urz,66)&lidgl)
end if
icdcb=usren(ux_us)
icdcb=icdcb&" 发给<span>"&usren(ux_u1)&"</span> 的"&s_uduxs&""
'--------------------------------HENG 0
if aiint(ux_ya)>0 then icdcd=icdcd&"发起人星标："&aiarr(i_buxya,"|",aiint(ux_ya))
if aiint(ux_y1)>0 then icdcd=icdcd&" 接收人星标："&aiarr(i_buxya,"|",aiint(ux_y1))
if aiint(ux_tm)>0 then icdcd=icdcd&" 发送时间："&aitm(8,ux_tm)
if aiint(ux_t1)>0 then icdcd=icdcd&" 阅读时间："&aitm(8,ux_t1)
'--------------------------------HENG 1
if aiint(ux_t1)=0 and not aibj(ux_us,e_uer) then
if aiint(ux_ty)=1 and aibj(ux_u1,e_uer) then
Call gysdel(uxbid,uxbiao,"ux_id="&ux_id)
icdcd=icdcd&" 注意：这条消息只能显示这一次！"
else
Call gysgx(uxbiao,"ux_t1='"&aitm(3,now())&"'","ux_id="&ux_id)
end if
if aibj(ux_u1,e_uer) then
Call gysat("us_ux",usbiao,"us_er='"&e_uer&"'","-1")
e_uux=aiint(e_uux)-1
Call icuser(5)
end if
end if
'--------------------------------CONTENT 0
icdci=esnrgys(ux_co,uxdpur,uxdpg)
icdty=9
e_ma=e_ma&icnr(icdty,s_uduxs,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
'--------------------------------CONTENT 1
e_ma=e_ma&"<div class=""cr""></div></div>"
else
e_ma=e_ma&aigo(s_uduxs&s_ztno,1)
end if

End Function
'-----------------------------------
'list
'=uxlist()
'-----------------------------------
Function uxlist(uxfqx)
e_mt=esbts(s_udxux,s_udlux,s_uduxs&s_umlbs&g_gy&e_lj0,"<i>发送"&s_uduxs&"</i>"&g_gy&e_lj1)
dim uxlpg,uxlps,uxlpuq,uxlpuh,uxlpur,uxlgrr
if uxfqx=1 then
uxlpuq=eshref(s_umgl&g_urg&s_udux,66)
lidms=g_u2
uxlpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
uxlpur=uxlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uxlpuh&g_urz
uxlpg=aiint(g_u3)
uxlps=aiint(g_u4)
else
uxlpuq=eshref(s_udux,66)
lidms=g_u1
uxlpuh=g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8
uxlpur=uxlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uxlpuh&g_urz
uxlpg=aiint(g_u2)
uxlps=aiint(g_u3)
end if

iclls=icliqls(5,lidms,eshref(uxlpuq&g_urg&g_gg&g_urg&g_urg&g_urg&uxlpuh&g_urz,66))

Call uxsers()
e_mz=e_mz&icliq(iclls,uxlpuq&g_urg&lidms,uxlpuh,e_gdj,uxfqx,"ux")
Call uxsersql()

if uxlps=0 then
if aibj(lidms,s_umlpy) then
uxlps=i_nmhc
else
uxlps=i_nmlb
end if
end if

'@@ux_id,1ux_co,2ux_tm,3ux_us,4ux_u1,5ux_ya,6ux_y1,7ux_t1,8ux_ty
if gyslist(uxbid,uxlie(s_umlb)&",ux_co",uxbiao,uxwhere,uxorder,uxlpur,uxlpg,uxlps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if uxfqx=1 then lidti=lidti&"<b>操作</b>"
lidti=lidti&"<u>类型</u>"
lidti=lidti&"<u>发送时间</u>"
lidti=lidti&"<u>收件人</u>"
lidti=lidti&"发件人·内容"
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
if aibj(lidms,s_umlb) then
lidbt=uxlic(1,0,gysay(8),gysay(2))&usren(gysay(3))&"：＂"&gysay(1)&"＂"&uxlic(1,1,gysay(8),gysay(2))
else
lidbt=uxlic(1,0,gysay(8),gysay(2))&usren(gysay(3))&" 发给 <span>"&usren(gysay(4))&"</span> 的"&s_uduxs&uxlic(1,1,gysay(8),gysay(2))
end if
if aiint(gysay(7))=0 and not aibj(gysay(3),e_uer) then lidbt=lidbt&"<sup class=""ts"">未读消息</sup>"
lidtt="发件人："&usren(gysay(3))&vbNewLine
lidtt=lidtt&"收件人："&usren(gysay(4))&vbNewLine
lidtt=lidtt&s_uduxs&"类型："&aiarr(i_buxty,"|",aiint(gysay(8)))&vbNewLine
lidtt=lidtt&"发送时间："&aitm(8,gysay(2))
if uxfqx=1 then
lidlj=eshref(s_umgl&g_urg&s_udux&g_urg&s_umxx&g_urg&gysay(0)&g_urz,66)
else
lidlj=eshref(s_udux&g_urg&s_umxx&g_urg&gysay(0)&g_urz,66)
end if
if uxfqx=1 then
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_udux&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udux&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_uduxs&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if
'list
if aibj(lidms,s_umlb) then
lids1=lids1&"<u"
if aiint(gysay(6))=1 then lids1=lids1&" class=""ftt"""
lids1=lids1&">"&aiarr(i_buxty,"|",aiint(gysay(8)))&"</u>"
lids1=lids1&"<u>"&aitm(8,gysay(2))&"</u>"
lids1=lids1&"<u>"&usren(gysay(4))&"</u>"
'yunqian
elseif aibj(lidms,s_umlpy) then
lids1=int(gysay(5)+1)*(int(gysay(6))+1)
else
lidms=s_umlpc
lids1=aiarr(i_buxty,"|",aiint(gysay(8)))
lids2=left(gysay(1),100)
lids3=lids3&aitms("发送时间：",aitm(8,gysay(2)),9)&"　"&s_uduxs&"编号："&gysay(0)
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if
e_mz=e_mz&iclih(gyspage,e_gdj,uxfqx,eshref(s_umgl&g_urg&s_udux&g_urg&s_umsc&"-x"&g_urz,77),"ux")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=uxlic(1,"")
'-----------------------------------
Function uxlic(uxfkg,uxfty,uxfxy,uxftm)
uxlic=""
if uxfkg=1 and uxfty=0 then
uxlic=uxlic&icqz(s_udlux,1,uxfxy,0)
elseif uxfkg=1 and uxfty=1 then
uxlic=uxlic&ichz(1,uxftm,0,"")
end if
End Function
'-----------------------------------
'=uxsers()
'Call uxsers()
'-----------------------------------
Function uxsers()
icdssp="排序|最新|时间|发态|收态"
icdrrp=split("ux_id desc|ux_id desc|ux_tm desc|ux_ya desc|ux_y1 desc","|")
icdssf="范围|"&usren(ew_kt)&"|"&usren(ew_kg)&"|"&esqday(0)&"|发送|接收|未读|已读|加锁|公开|禁用"
icdrrf=split("|ux_us='"&ew_kt&"'|ux_u1='"&ew_kg&"'|"&esqday("ux_tm")&"|ux_us='"&e_uer&"'|ux_u1='"&e_uer&"'|ux_y1=1|ux_y1=2|ux_y1=3|ux_y1=4|ux_y1=0","|")
icdssx="项目|内容|发送|接收"
icdrrx=split("ux_co|ux_co|ux_us|ux_u1","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=uxsersql()
'-----------------------------------
Function uxsersql()
Call icserq()
uxwhere=iclwhere
uxorder=iclorder
iclapp=1
'order
if ainull(uxorder) then uxorder=uxordermo
'admin
if not aibj(g_u0,s_umgl) then
if not ainull(uxwhere) then uxwhere=uxwhere&" and "
uxwhere=uxwhere&"ux_y1>0 and (ux_u1='"&ew_kg&"' or ux_u1='"&e_uer&"' or ux_us='"&ew_kt&"' or ux_us='"&e_uer&"')"
end if
End Function
%>