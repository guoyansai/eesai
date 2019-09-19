<%
'@@0manage/1s_uduq/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_uduq/2edit|add|del/3*id.HTML

'@@0s_uduq/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_uduq/1edit|add/2*id.HTML
'@@0s_uduq/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_uduq) or aibj(g_u1,s_uduq)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_uduq,s_uduqs&s_umlbs)

if (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduq) and aibj(g_u2,s_umtj) then
Call uqadd(1)
elseif aibj(g_u0,s_uduq) and aibj(g_u1,s_umtj) then
Call uqadd(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduq) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call uqedit(1)
elseif aibj(g_u0,s_uduq) and aibj(g_u1,s_umxg) then
Call uqedit(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduq) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and not ainull(g_u3) then
Call uqshow(g_u3)
elseif aibj(g_u0,s_uduq) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) and not ainull(g_u2) then
Call uqshow(g_u2)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduq) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call uqdel(1)
elseif aibj(g_u0,s_uduq) and ((aibj(g_u1,s_umsc) and aiint(g_u2)>0) or aibj(g_u1,s_umsc&"-x")) then
Call uqdel(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduq) and dkdir(2,g_u2) then
Call uqlist(1)
elseif aibj(g_u0,s_uduq) and dkdir(2,g_u1) then
Call uqlist(0)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","uq")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=uqlie()
'-----------------------------------
Function uqlie(uqfty)
if uqfty="form" then
uqlie="uh,sn,us,u1,xy,tm"
elseif uqfty=s_umlb then
'@@uq_id,1uh_bt,2uq_sn,3uq_us,4uq_u1,5uh_ty,6uh_jq,7uh_je,8uq_xy,9uq_tm,10uh_t1,11uh_t2,12uh_id
uqlie="uq_id,uh_bt,uq_sn,uq_us,uq_u1,uh_ty,uh_jq,uh_je,uq_xy,uq_tm,uh_t1,uh_t2,uh_id"
elseif uqfty="all" then
uqlie="uq_id,uq_uh,uq_sn,uq_us,uq_u1,uq_xy,uq_tm"
end if
End Function
'-----------------------------------
'add/edit form
'=uqform()
'-----------------------------------
Function uqform(uqfty,uqfqx)
dim mouqdft
if uqfty=0 then
uq_sn="UQ"&aisn(1)
uq_xy=0
uq_tm=now()
if uqfqx=1 then
if not ainull(g_u3) then uq_us=aistr(g_u3)
else
if not ainull(g_u2) then uq_us=aistr(g_u2)
end if
end if
uqform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
if uqfqx=1 then
uqform=uqform&icflsr(5,"编码","","sn","",3,50,"*"&s_uduqs&"的编码","",uq_sn)&icflsr(25,"优惠","","uh","",0,50,"*"&s_uduqs&"的优惠编码","",uq_uh)&icflxz(25,"状态","xy","","*"&s_uduqs&"的状态","f-s",uq_xy,0,i_buqxy)
uqform=uqform&icflsr(5,"时间","","tm","",99,50,"*"&s_uduqs&"的发放时间","",uq_tm)&icflsr(25,"会员","","us","",66,50,"*"&s_uduqs&"的使用者","",uq_us)&icflsr(25,"共享","","u1","",66,50,"*"&s_uduqs&"的共享使用者","",uq_u1)&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script>"
else
if uqfty=1 and aibj(uq_us,e_uer) and ainull(uq_u1) then
uqform=uqform&icflsr(25,"共享","","u1","",66,50,"*"&s_uduqs&"的共享使用者","",uq_u1)
uqform=uqform&aiinput("hidden","uh","",0,0,"","",uq_uh)&aiinput("hidden","sn","",0,0,"","",uq_sn)&aiinput("hidden","xy","",0,0,"","",uq_xy)&aiinput("hidden","us","",0,0,"","",uq_us)&aiinput("hidden","tm","",0,0,"","",uq_tm)
else
uqform=uqform&icflsr(10,"","您不能这么操作！")
end if
end if
uqform=uqform&icflot(10,"验证",eskyx(0,1,2))
if uqfty=1 then
uqform=uqform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",uq_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif uqfty=0 then
uqform=uqform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
uqform=uqform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=uqadd()
'-----------------------------------
Function uqadd(uqfqx)
ew_bt=s_umtjs&s_uduqs&","&ew_bt:ew_zt=s_umtjs&s_uduqs&","&ew_zt:ew_nr=s_umtjs&s_uduqs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_uduqs&"</a></li>"
e_mt=esbts(s_udxuq,s_udluq,s_umtjs&s_uduqs&g_gy&e_lj1,s_uduqs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("uh,sn,us,xy,tm") then
if gysfm(uqlie("form"),uqbiao,"uq_sn='"&aistr(aireq("sn"))&"' or (uq_uh='"&aistr(aireq("uh"))&"' and (uq_us='"&e_uer&"' or uq_u1='"&e_uer&"'))","uq_",1) then
Call aisn(0)
e_ma=e_ma&aigo(s_umtjs&s_uduqs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umtjs&s_uduqs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduqs&s_ztsb,1)
end if
else
e_ma=uqform(0,uqfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=uqedit()
'-----------------------------------
Function uqedit(uqfqx)
ew_bt=s_umxgs&s_uduqs&","&ew_bt:ew_zt=s_umxgs&s_uduqs&","&ew_zt:ew_nr=s_umxgs&s_uduqs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_uduq&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_uduqs&"</a></li>"
e_mt=esbts(s_udxuq,s_udluq,s_umxgs&s_uduqs&g_gy&eshref(s_umgl&g_urg&s_uduq&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_uduqs&g_gy&e_lj1&g_gx&s_uduqs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("uh,sn,us,u1,xy,tm") then
if gysfm(uqlie("form"),uqbiao,"uq_id="&aiint(aireq("id"))&" or (uq_id<>"&aiint(aireq("id"))&" and uq_sn='"&aistr(aireq("sn"))&"')","uq_",2) then
e_ma=e_ma&aigo(s_umxgs&s_uduqs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_uduqs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_uduqs&s_ztsb,1)
end if
else
if uqfqx=1 then
uqwhere="uq_id="&aiint(g_u3)&""
else
uqwhere="uq_id="&aiint(g_u2)&" and uq_us='"&e_uer&"'"
end if
if gysread(uqlie("all"),uqbiao,uqwhere,"") then
ew_bt=uq_sn&","&ew_bt:ew_zt=uq_sn&","&ew_zt:ew_nr=uq_sn&","&ew_nr
e_ma=uqform(1,uqfqx)&e_ma
else
e_ma=e_ma&aigo(s_uduqs&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=uqdel(uqfqx)
'-----------------------------------
Function uqdel(uqfqx)
ew_bt=s_uduqs&s_umscs&","&ew_bt:ew_zt=s_uduqs&s_umscs&","&ew_zt:ew_nr=s_uduqs&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_uduqs&s_umscs&"</li>"
e_mt=esbts(s_udxuq,s_udluq,s_umscs&s_uduqs,s_umtjs&s_uduqs&g_gy&e_lj1&g_gx&s_uduqs&s_umlbs&g_gy&e_lj0)
if uqfqx=1 then
if e_uxy>2 then
if aiint(g_u3)>0 then
if gysdel(uqbid,uqbiao,"uq_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_uduqs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduqs&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(uqbid,uqbiao,0) then
e_ma=e_ma&aitiao(s_uduqs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduqs&s_umscs&s_ztsb,1)
end if
end if
end if
else
if aiint(g_u2)>0 then
if gysdel(uqbid,uqbiao,"uq_us='"&e_uer&"' and uq_xy=2 and uq_id="&aiint(g_u2)) then
e_ma=e_ma&aitiao(s_uduqs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduqs&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u1,s_umsc&"-x") then
if gysdel(uqbid,uqbiao,"uq_us='"&e_uer&"' and uq_xy=2") then
e_ma=e_ma&aitiao(s_uduqs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduqs&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'show
'=uqshow()
'-----------------------------------
Function uqshow(uqfid)
if aibj(g_u0,s_umgl) then
if isnumeric(uqfid) then
uqwhere="uh_sn=uq_uh and uq_id="&aiint(uqfid)&""
else
uqwhere="uh_sn=uq_uh and uq_sn='"&aistr(uqfid)&"'"
end if
else
if isnumeric(uqfid) then
uqwhere="uh_sn=uq_uh and uq_id="&aiint(uqfid)&" and (uq_us='"&e_uer&"' or uq_u1='"&e_uer&"')"
else
uqwhere="uh_sn=uq_uh and uq_sn='"&aistr(uqfid)&"' and (uq_us='"&e_uer&"' or uq_u1='"&e_uer&"')"
end if
end if
if gysread("uq_id,uh_bt,uq_sn,uq_us,uq_u1,uh_ty,uh_jq,uh_je,uq_xy,uq_tm,uh_t1,uh_t2,uh_id",uqbiao&","&uhbiao,uqwhere,"") then
ew_bt=uh_bt&","&usren(uq_us)&","&ew_bt:ew_zt=uh_bt&","&usren(uq_us)&","&ew_zt:ew_nr=uh_bt&","&usren(uq_us)&","&ew_nr:ew_cp=usren(uq_us)&","&ew_cp
dim uqdsx,uqdpur,uqdpg,lidgl
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_uduq&g_urg&s_umxx&g_urg&uq_id&g_urz,77)&""">"&uh_bt&"</a></li>"
uqdpg=aiint(g_u4)
uqdpur=eshref(s_umgl&g_urg&s_uduq&g_urg&g_u1&g_urg&uq_id&g_urz,77)
'admin 0
lidgl=""
if aibj(uq_us,e_uer) then
if aibj(uq_xy,"0") and ainull(uq_u1) then lidgl=lidgl&g_gx&"修改"&s_uduqs&g_gy&eshref(s_umgl&g_urg&s_uduq&g_urg&s_umxg&g_urg&uq_id&g_urz,77)
if aibj(uq_xy,"2") then lidgl=lidgl&g_gx&"删除"&s_uduqs&g_gy&eshref(s_umgl&g_urg&s_uduq&g_urg&s_umsc&g_urg&uq_id&g_urz,77)
end if
'admin 1
e_mt=esbts(uqdsx,s_udluq,s_uduqs&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_uduq&g_urg&s_umxx&g_urg&uq_id&g_urz,77),s_umtjs&s_uduqs&g_gy&e_lj1&g_gx&s_uduqs&s_umlbs&g_gy&e_lj0&lidgl)
else
e_wl=e_wl&"<li><a href="""&eshref(s_uduq&g_urg&s_umxx&g_urg&uq_id&g_urz,66)&""">"&uh_bt&"</a></li>"
uqdpg=aiint(g_u3)
uqdpur=eshref(s_uduq&g_urg&g_u0&g_urg&uq_id&g_urz,66)
'admin 0
lidgl=""
if aibj(uq_us,e_uer) then
if aibj(uq_xy,"0") and ainull(uq_u1) then lidgl=lidgl&g_gx&"修改"&s_uduqs&g_gy&eshref(s_uduq&g_urg&s_umxg&g_urg&uq_id&g_urz,66)
if aibj(uq_xy,"2") then lidgl=lidgl&g_gx&"删除"&s_uduqs&g_gy&eshref(s_uduq&g_urg&s_umsc&g_urg&uq_id&g_urz,66)
end if
'admin 1
e_mt=esbts(uqdsx,s_udluq,s_uduqs&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_uduq&g_urg&s_umxx&g_urg&uq_id&g_urz,66),s_uduqs&s_umlbs&g_gy&e_lj0&lidgl)
end if

icdcb=uh_bt&" ("&usren(uq_us)
if not ainull(uq_u1) then icdcb=icdcb&" 与<span>"&usren(uq_u1)&"</span> 共享的"&s_uduqs&""
'--------------------------------HENG 0
if aiint(uq_xy)=0 and date()>aicd(uh_t2) then Call gysgx(uqbiao,"uq_xy=2","uq_id="&uq_id&"")
icdcd=s_uduqs&"状态："&aiarr(i_buqxy,"|",aiint(uq_xy))
if not ainull(uq_tm) then icdcd=icdcd&aitms(" 生成时间：",uq_tm,9)
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdcg=""
icdcg=icdcg&"<li>优惠类型："&aiarr(i_buhty,"|",aiint(uh_ty))&"</li>"
icdcg=icdcg&"<li>优惠金额：<b>"&aiint(uh_jq)&"</b>(限额"&uh_je&")</li>"
icdcg=icdcg&"<li>有效日期："&aitmx(uh_t1,2)&" 到 "&aitmx(uh_t2,2)&"</li>"
icdcg=icdcg&"<li>优惠出自：<a href="""&eshref(s_uduh&g_urg&s_umxx&g_urg&uh_id&g_urz,66)&""" title=""编号："&uh_id&""">点击查看"&s_uduqs&"来源</a></li>"
icdcg=icdcg&"<div Class=""c-k tc""><br>双击选中下面优惠码，复制到交易订单中使用。<br><a class=""y-n"">"&uq_sn&"</a></div>"
'--------------------------------CONTENT 1
icdty=9
e_ma=e_ma&icnr(icdty,s_uduqs,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
else
e_ma=e_ma&aigo(s_uduqs&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=uqlist()
'-----------------------------------
Function uqlist(uqfqx)
if uqfqx=1 then
e_mt=esbts(s_udxuq,s_udluq,s_uduqs&s_umlbs&g_gy&e_lj0,"<i>"&s_umtjs&s_uduqs&"</i>"&g_gy&e_lj1&g_gx&"<i>领取"&s_uduqs&"</i>"&g_gy&eshref(s_uduh&g_urg&s_umlb&g_urz,66))
else
e_mt=esbts(s_udxuq,s_udluq,s_uduqs&s_umlbs&g_gy&e_lj0,"<i>领取"&s_uduqs&"</i>"&g_gy&eshref(s_uduh&g_urg&s_umlb&g_urz,66))
end if
dim uqlpg,uqlps,uqlpuq,uqlpuh,uqlpur,uqlgrr
if uqfqx=1 then
uqlpuq=eshref(s_umgl&g_urg&s_uduq,66)
lidms=g_u2
uqlpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
uqlpur=uqlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uqlpuh&g_urz
uqlpg=aiint(g_u3)
uqlps=aiint(g_u4)
else
uqlpuq=eshref(s_uduq,66)
lidms=g_u1
uqlpuh=g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8
uqlpur=uqlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uqlpuh&g_urz
uqlpg=aiint(g_u2)
uqlps=aiint(g_u3)
end if
if uqfqx=1 then e_mz=e_mz&replace(icmenu("","","1|"&s_uduq,ef_sn,4004,0,14,28,0),s_uduq&g_urg,s_umgl&g_urg&s_uduq&g_urg)
iclls=icliqls(5,lidms,eshref(uqlpuq&g_urg&g_gg&g_urg&g_urg&g_urg&uqlpuh&g_urz,66))

Call uqsers()
e_mz=e_mz&icliq(iclls,uqlpuq&g_urg&lidms,uqlpuq,e_gdj,uqfqx,"uq")
Call uqsersql()
if uqlps=0 then
if aibj(lidms,s_umlpy) then
uqlps=i_nmhc
else
uqlps=i_nmlb
end if
end if

'@@uq_id,1uh_bt,2uq_sn,3uq_us,4uq_u1,5uh_ty,6uh_jq,7uh_je,8uq_xy,9uq_tm,10uh_t1,11uh_t2,12uh_id
if gyslist(uqbid,uqlie(s_umlb),uqbiao&","&uhbiao,uqwhere,uqorder,uqlpur,uqlpg,uqlps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if uqfqx=1 then lidti=lidti&"<b>操作</b>"
'lidti=lidti&"<b>"&s_uduqs&"来源</b>"
lidti=lidti&"<u>使用状态</u>"
lidti=lidti&"<u>优惠类型</u>"
lidti=lidti&"<i>金额</i>"
lidti=lidti&"<i>限额</i>"
lidti=lidti&"<u>开始日期</u>"
lidti=lidti&"<u>过期日期</u>"
lidti=lidti&"标题"
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

lidbt=uqlic(1,0,gysay(8),gysay(9))&gysay(1)&" "&usren(gysay(3))
if not ainull(gysay(4)) then lidbt=lidbt&" 与 <span>"&usren(gysay(4))&"</span> 共享的"&s_uduqs&""
lidbt=lidbt&uqlic(1,1,gysay(8),gysay(9))

lidbt=uqlic(1,0,gysay(8),gysay(9))&gysay(1)&uqlic(1,1,gysay(8),gysay(9))
lidtt="标题："&gysay(1)&vbNewLine
lidtt=lidtt&"用户："&usren(gysay(3))&vbNewLine
if not ainull(gysay(4)) then lidtt=lidtt&"共享："&usren(gysay(4))&vbNewLine
lidtt=lidtt&"类型："&aiarr(i_buhty,"|",aiint(gysay(5)))&vbNewLine
lidtt=lidtt&"状态："&aiarr(i_buqxy,"|",aiint(gysay(8)))&vbNewLine
lidtt=lidtt&"时间："&gysay(9)
if uqfqx=1 then
lidlj=eshref(s_umgl&g_urg&s_uduq&g_urg&s_umxx&g_urg&gysay(0)&g_urz,77)
else
lidlj=eshref(s_uduq&g_urg&s_umxx&g_urg&gysay(0)&g_urz,66)
end if
if uqfqx=1 then
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_uduq&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_uduq&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_uduqs&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if
'list
if aibj(lidms,s_umlb) then
'lids1=lids1&"<b><a href="""&eshref(s_uduh&g_urg&s_umxx&g_urg&gysay(12)&g_urz,66)&""" title=""编号："&gysay(12)&""">查看来源</a></b>"
lids1=lids1&"<u"
if aiint(gysay(8))=0 then lids1=lids1&" class=""ftt"""
lids1=lids1&">"&aiarr(i_buqxy,"|",aiint(gysay(8)))&"</u>"
lids1=lids1&"<u>"&aiarr(i_buhty,"|",aiint(gysay(5)))&"</u>"
lids1=lids1&"<i>"&aiint(gysay(6))&"</i>"
lids1=lids1&"<i>"&aiint(gysay(7))&"</i>"
lids1=lids1&"<u>"&aitmx(gysay(10),2)&"</u>"
lids1=lids1&"<u>"&aitmx(gysay(11),2)&"</u>"
else
lidms=s_umlpc
lids1=aiarr(i_buqxy,"|",aiint(gysay(8)))
lids2=lids2&"有效期："&gysay(10)&" 到 "&gysay(11)&" 金额："&gysay(6)&"(限额"&gysay(7)&")"
lids3=lids3&aitms("发起时间：",gysay(9),2)
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,uqfqx,eshref(s_umgl&g_urg&s_uduq&g_urg&s_umsc&"-x"&g_urz,77),"uq")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=uqlic(1,"")
'-----------------------------------
Function uqlic(uqfkg,uqfty,uqfxy,uqftm)
uqlic=""
if uqfkg=1 and uqfty=0 then
uqlic=uqlic&icqz(s_udluq,1,uqfxy,0)
elseif uqfkg=1 and uqfty=1 then
uqlic=uqlic&ichz(1,uqftm,0,"")
end if
End Function
'-----------------------------------
'=uqsers()
'Call uqsers()
'-----------------------------------
Function uqsers()
icdssp="排序|金额|限额|数量|已发|发放|起效|过期"
icdrrp=split("uq_id desc|uq_jq desc|uq_je desc|uq_ns desc|uq_nl desc|uq_tm desc|uq_t1 desc|uq_t2 desc","|")
icdssf="范围|即将|正在|过期|金币|经验|金钱|"&esqday(0)&""
icdrrf=split("|uq_xy=0|uq_xy=1|uq_xy=2|uq_ty=0|uq_ty=1|uq_ty=2|"&esqday("uq_tm")&"","|")
icdssx="项目|标题|编码|系统|时间"
icdrrx=split("uq_bt|uq_bt|uq_sn|uq_xt|uq_tm","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=uqsersql()
'-----------------------------------
Function uqsersql()
Call icserq()
uqwhere=iclwhere
uqorder=iclorder
iclapp=1
if not ainull(uqwhere) then uqwhere=uqwhere&" and "
uqwhere=uqwhere&"uh_sn=uq_uh and (uq_us='"&e_uer&"' or uq_u1='"&e_uer&"')"
'order
if ainull(uqorder) then uqorder=uqordermo
'admin
if aibj(g_u0,s_umgl) then
iclapp=1
end if
End Function
%>