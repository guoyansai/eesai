<%
'@@0manage/1s_uduh/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_uduh/2edit|add|del/3*id.HTML

'@@0s_uduh/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_uduh/1edit|add/2*id.HTML
'@@0s_uduh/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_uduh) or aibj(g_u1,s_uduh)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_uduh,s_uduhs&s_umlbs)

if (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduh) and aibj(g_u2,s_umtj) then
Call uhadd(1)
elseif aibj(g_u0,s_uduh) and aibj(g_u1,s_umtj) then
Call uhadd(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduh) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call uhedit(1)
elseif aibj(g_u0,s_uduh) and aibj(g_u1,s_umxg) then
Call uhedit(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduh) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and not ainull(g_u3) then
Call uhshow(g_u3)
elseif aibj(g_u0,s_uduh) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) and not ainull(g_u2) then
Call uhshow(g_u2)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduh) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call uhdel(1)
elseif aibj(g_u0,s_uduh) and ((aibj(g_u1,s_umsc) and aiint(g_u2)>0) or aibj(g_u1,s_umsc&"-x")) then
Call uhdel(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduh) and dkdir(2,g_u2) then
Call uhlist(1)
elseif aibj(g_u0,s_uduh) and dkdir(2,g_u1) then
Call uhlist(0)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","uh")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=uhlie()
'-----------------------------------
Function uhlie(uhfty)
if uhfty="form" then
uhlie="bt,sn,us,nl,ns,ty,jq,je,xy,tm,t1,t2,xt"
elseif uhfty=s_umlb then
'@@uh_id,1uh_bt,2uh_sn,3uh_nl,4uh_ns,5uh_ty,6uh_jq,7uh_je,8uh_xy,9uh_tm,10uh_t1,11uh_t2,12uh_us
uhlie="uh_id,uh_bt,uh_sn,uh_nl,uh_ns,uh_ty,uh_jq,uh_je,uh_xy,uh_tm,uh_t1,uh_t2,uh_us"
elseif uhfty="all" then
uhlie="uh_id,uh_bt,uh_sn,uh_us,uh_nl,uh_ns,uh_ty,uh_jq,uh_je,uh_xy,uh_tm,uh_t1,uh_t2,uh_xt"
end if
End Function
'-----------------------------------
'add/edit form
'=uhform()
'-----------------------------------
Function uhform(uhfty,uhfqx)
dim mouhdft
if uhfty=0 then
uh_sn="UH"&aisn(1)
uh_ty=0
uh_jq=0
uh_je=0
uh_xy=1
uh_tm=now()
uh_t1=date()
uh_t2=date()+30
uh_nl=0
uh_ns=100
uh_us=e_uer
uh_xt=espxx("发布"&s_uduhs&i_gg&e_uer)
else
uh_xt=uh_xt&espxx("操作{"&aiarr(i_buhxy,"|",aiint(uh_xy))&"}"&i_gg&e_uer)
end if
uhform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
if uhfqx=1 then
uhform=uhform&icflsr(25,"标题","","bt","",0,50,"*"&s_uduhs&"的标题","",uh_bt)&icflsr(25,"编码","","sn","",3,50,"*"&s_uduhs&"的编码","",uh_sn)&icflxz(25,"状态","xy","","*"&s_uduhs&"的状态","f-s",uh_xy,0,i_buhxy)&icflsr(25,"已发","","nl","",6,50,"*"&s_uduhs&"的已发数量","",uh_nl)
uhform=uhform&icflsr(25,"金额","","jq","",6,50,"*"&s_uduhs&"的金额","",uh_jq)&icflsr(25,"限额","","je","",6,50,"*"&s_uduhs&"的使用限额","",uh_je)&icflxz(25,"类型","ty","","*"&s_uduhs&"的类型","f-s",uh_ty,0,i_buhty)&icflsr(25,"总量","","ns","",6,50,"*"&s_uduhs&"的总数量","",uh_ns)
uhform=uhform&icflsr(25,"商人","","us","",66,50,"*"&s_uduhs&"的发放人","",uh_us)&icflsr(25,"时间","","tm","",99,50,"*"&s_uduhs&"的发放时间","",uh_tm)&icflsr(25,"开始","","t1","",99,50,"*"&s_uduhs&"的有效使用开始日期","",uh_t1)&icflsr(25,"结束","","t2","",99,50,"*"&s_uduhs&"的有效使用结束日期","",uh_t2)&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script>"
uhform=uhform&"</ul><ul>"&icflot(10,"点评",eseditxt(uh_xt,"xt",1))
else
uhform=uhform&icflot(10,"","您不能这么操作！")
end if
uhform=uhform&icflot(10,"验证",eskyx(1,1,2))
if uhfty=1 then
uhform=uhform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",uh_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif uhfty=0 then
uhform=uhform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
uhform=uhform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=uhadd()
'-----------------------------------
Function uhadd(uhfqx)
ew_bt=s_umtjs&s_uduhs&","&ew_bt:ew_zt=s_umtjs&s_uduhs&","&ew_zt:ew_nr=s_umtjs&s_uduhs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_uduhs&"</a></li>"
e_mt=esbts(s_udxuh,s_udluh,s_umtjs&s_uduhs&g_gy&e_lj1,s_uduhs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("bt,sn,nl,ns,ty,jq,je,xy,tm,t1,t2") then
if gysfm(uhlie("form"),uhbiao,"uh_sn='"&aistr(aireq("sn"))&"'","uh_",1) then
Call aisn(0)
e_ma=e_ma&aigo(s_umtjs&s_uduhs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umtjs&s_uduhs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduhs&s_ztsb,1)
end if
else
e_ma=uhform(0,uhfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=uhedit()
'-----------------------------------
Function uhedit(uhfqx)
ew_bt=s_umxgs&s_uduhs&","&ew_bt:ew_zt=s_umxgs&s_uduhs&","&ew_zt:ew_nr=s_umxgs&s_uduhs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_uduh&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_uduhs&"</a></li>"
e_mt=esbts(s_udxuh,s_udluh,s_umxgs&s_uduhs&g_gy&eshref(s_umgl&g_urg&s_uduh&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_uduhs&g_gy&e_lj1&g_gx&s_uduhs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("bt,sn,nl,ns,ty,jq,je,xy,tm,t1,t2") then
if gysfm(uhlie("form"),uhbiao,"uh_id="&aiint(aireq("id"))&" or (uh_id<>"&aiint(aireq("id"))&" and uh_sn='"&aistr(aireq("sn"))&"')","uh_",2) then
e_ma=e_ma&aigo(s_umxgs&s_uduhs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_uduhs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_uduhs&s_ztsb,1)
end if
else
if uhfqx=1 then
uhwhere="uh_id="&aiint(g_u3)&""
else
uhwhere="uh_id="&aiint(g_u2)&" and uh_nl='"&e_uer&"'"
end if
if gysread(uhlie("all"),uhbiao,uhwhere,"") then
ew_bt=uh_bt&","&ew_bt:ew_zt=uh_bt&","&ew_zt:ew_nr=uh_bt&","&ew_nr
e_ma=uhform(1,uhfqx)&e_ma
else
e_ma=e_ma&aigo(s_uduhs&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=uhdel(uhfqx)
'-----------------------------------
Function uhdel(uhfqx)
ew_bt=s_uduhs&s_umscs&","&ew_bt:ew_zt=s_uduhs&s_umscs&","&ew_zt:ew_nr=s_uduhs&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_uduhs&s_umscs&"</li>"
e_mt=esbts(s_udxuh,s_udluh,s_umscs&s_uduhs,s_umtjs&s_uduhs&g_gy&e_lj1&g_gx&s_uduhs&s_umlbs&g_gy&e_lj0)
if uhfqx=1 then
if e_uxy>2 then
if aiint(g_u3)>0 then
if gysdel(uhbid,uhbiao,"uh_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_uduhs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduhs&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(uhbid,uhbiao,0) then
e_ma=e_ma&aitiao(s_uduhs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduhs&s_umscs&s_ztsb,1)
end if
end if
end if
end if
End Function
'-----------------------------------
'show
'=uhshow()
'-----------------------------------
Function uhshow(uhfid)
if aibj(g_u0,s_umgl) then
uhwhere="uh_id="&aiint(uhfid)&""
else
uhwhere="uh_id="&aiint(uhfid)&" and uh_xy>0"
end if
if gysread(uhlie("all"),uhbiao,uhwhere,"") then
ew_bt=uh_bt&","&ew_bt:ew_zt=uh_bt&","&ew_zt:ew_nr=uh_bt&","&ew_nr:ew_cp=uh_sn&","&ew_cp
dim uhdsx,uhdpur,uhdpg
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_uduh&g_urg&s_umxx&g_urg&uh_id&g_urz,77)&""">"&uh_bt&"</a></li>"
uhdpg=aiint(g_u4)
uhdpur=eshref(s_umgl&g_urg&s_uduh&g_urg&g_u1&g_urg&uh_id&g_urz,77)
e_mt=esbts(uhdsx,s_udluh,s_uduhs&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_uduh&g_urg&s_umxx&g_urg&uh_id&g_urz,77),s_umtjs&s_uduhs&g_gy&e_lj1&g_gx&s_uduhs&s_umlbs&g_gy&e_lj0)
else
e_wl=e_wl&"<li><a href="""&eshref(s_uduh&g_urg&s_umxx&g_urg&uh_id&g_urz,66)&""">"&uh_bt&"</a></li>"
uhdpg=aiint(g_u3)
uhdpur=eshref(s_uduh&g_urg&g_u0&g_urg&uh_id&g_urz,66)
e_mt=esbts(uhdsx,s_udluh,s_uduhs&s_umxxs&g_gy&eshref(s_uduh&g_urg&s_umxx&g_urg&uh_id&g_urz,66),s_uduhs&s_umlbs&g_gy&e_lj0)
end if

icdcb=uh_bt&" (满 "&uh_je&" 减<span>"&uh_jq&"</span> 的"&s_uduhs&")"
'--------------------------------HENG 0
if date()>aicd(uh_t2) then
Call gysgx(uhbiao,"uh_xy=2","uh_id="&uh_id&"")
elseif aiint(uh_xy)=0 and now()>=aicd(uh_tm) then
Call gysgx(uhbiao,"uh_xy=1","uh_id="&uh_id&"")
end if
icdcd=s_uduhs&"状态："&aiarr(i_buhxy,"|",aiint(uh_xy))
icdcd=icdcd&estms(2,uh_tm)
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdcg=""
icdcg=icdcg&"<li>优惠类型："&aiarr(i_buhty,"|",aiint(uh_ty))&"</li>"
icdcg=icdcg&"<li>领取状态：已发 <b>"&aiint(uh_nl)&"</b> (总额 "&uh_ns&")</li>"
icdcg=icdcg&"<li>有效日期："&aitmx(uh_t1,2)&" 到 "&aitmx(uh_t2,2)&"</li>"
if aiint(e_uid)>0 then
if aiint(uh_xy)=0 then
icdcg=icdcg&"<div class=""c-k tc""><a href="""&eshref(s_uduh&g_urg&g_u1&g_urg&uh_id&g_urz,66)&""" class=""y-n0"">"&aiarr(i_buhxy,"|",aiint(uh_xy))&"</a></div>"
elseif aiint(uh_xy)=2 then
icdcg=icdcg&"<div class=""c-k tc""><a href="""&eshref(s_uduh&g_urg&g_u1&g_urg&uh_id&g_urz,66)&""" class=""y-n2"">"&aiarr(i_buhxy,"|",aiint(uh_xy))&"</a></div>"
elseif aiint(uh_xy)=1 and now()>=aicd(uh_tm) and aicd(uh_t2)>=date() and aiint(uh_nl)<aiint(uh_ns) then
if aiint(Request.Cookies(w_sn&uh_id&s_uduh))=1 then
icdcg=icdcg&"<div class=""c-k tc""><a class=""y-n1"">对不起，您已经领取过了。</a><a href="""&eshref(s_uduq&g_urg&s_umlb&g_urz,66)&""" class=""y-n2"">我的优惠券</a></div>"
else
if aibj(g_u3,e_uer) then
if gysin(uqbiao,"uq_uh,uq_sn,uq_us,uq_xy,uq_tm","'"&uh_sn&"','"&"UQ"&aisn(1)&"','"&e_uer&"',0,'"&now()&"'","uq_uh='"&uh_sn&"' and (uq_us='"&e_uer&"' or uq_u1='"&e_uer&"')") then
Call aisn(0)
Call gysgx(uhbiao,"uh_nl=uh_nl+1","uh_id="&uh_id&"")
response.Cookies(w_sn&uh_id&s_uduh)="1"
icdcg=icdcg&"<div class=""c-k tc""><a href="""&eshref(s_uduq&g_urg&s_umlb&g_urz,66)&""" class=""y-n"">恭喜您领取成功，点击查看！</a></div>"
else
response.Cookies(w_sn&uh_id&s_uduh)="1"
icdcg=icdcg&"<div class=""c-k tc""><a href="""&eshref(s_uduh&g_urg&g_u1&g_urg&uh_id&g_urz,66)&""" class=""y-n1"">系统繁忙，请稍后再试，谢谢！(如果您领取过了，请勿重复领取。)</a><a href="""&eshref(s_uduq&g_urg&s_umlb&g_urz,66)&""" class=""y-n2"">我的优惠券</a></div>"
end if
else
icdcg=icdcg&"<div class=""c-k tc""><a href="""&eshref(s_uduh&g_urg&g_u1&g_urg&uh_id&g_urg&e_uer&g_urz,66)&""" class=""y-n"">点击这里，领取优惠券！</a></div>"
end if
end if
else
icdcg=icdcg&"<div class=""c-k tc""><a class=""y-n1"">系统繁忙，请稍后再试，谢谢！(如果您领取过了，请勿重复领取。)</a><a href="""&eshref(s_uduq&g_urg&s_umlb&g_urz,66)&""" class=""y-n2"">我的优惠券</a></div>"
end if
else
icdcg=icdcg&"<div class=""c-k tc""><a target=""_blank"" href="""&u_login&""" class=""y-n3"">请您先登录</a></div>"
end if
icdty=9
e_ma=e_ma&icnr(icdty,icddm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
'--------------------------------CONTENT 1
'e_ma=e_ma&"<li class=""c-h"">"&s_uduhs&s_ztpt&"</li>"'tit
e_ma=e_ma&espl(90234,ep_dm,eshref(s_uduh&g_urg&g_u1&g_urg&uh_id&g_urz,66),uh_id,uh_xt,uhbiao,"uh_xt","uh_id","")
else
e_ma=e_ma&aigo(s_uduhs&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=uhlist()
'-----------------------------------
Function uhlist(uhfqx)
if uhfqx=1 then
e_mt=esbts(s_udxuh,s_udluh,s_uduhs&s_umlbs&g_gy&e_lj0,"<i>"&s_umtjs&s_uduhs&"</i>"&g_gy&e_lj1)
else
e_mt=esbts(s_udxuh,s_udluh,s_uduhs&s_umlbs&g_gy&e_lj0,"")
end if
dim uhlpg,uhlps,uhlpuq,uhlpuh,uhlpur,uhlgrr
if uhfqx=1 then
uhlpuq=eshref(s_umgl&g_urg&s_uduh,66)
lidms=g_u2
uhlpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
uhlpur=uhlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uhlpuh&g_urz
uhlpg=aiint(g_u3)
uhlps=aiint(g_u4)
else
uhlpuq=eshref(s_uduh,66)
lidms=g_u1
uhlpuh=g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8
uhlpur=uhlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uhlpuh&g_urz
uhlpg=aiint(g_u2)
uhlps=aiint(g_u3)
end if

iclls=icliqls(5,lidms,eshref(uhlpuq&g_urg&g_gg&g_urg&g_urg&g_urg&uhlpuh&g_urz,66))

Call uhsers()
e_mz=e_mz&icliq(iclls,uhlpuq&g_urg&lidms,uhlpuh,e_gdj,uhfqx,"uh")
Call uhsersql()

if uhlps=0 then
if aibj(lidms,s_umlpy) then
uhlps=i_nmhc
else
uhlps=i_nmlb
end if
end if

'@@uh_id,1uh_bt,2uh_sn,3uh_nl,4uh_ns,5uh_ty,6uh_jq,7uh_je,8uh_xy,9uh_tm,10uh_t1,11uh_t2
if gyslist(uhbid,uhlie(s_umlb),uhbiao,uhwhere,uhorder,uhlpur,uhlpg,uhlps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if uhfqx=1 then lidti=lidti&"<b>操作</b>"
lidti=lidti&"<u>优惠状态</u>"
lidti=lidti&"<u>优惠类型</u>"
lidti=lidti&"<i>总量</i>"
lidti=lidti&"<i>已发</i>"
lidti=lidti&"<i>限额</i>"
lidti=lidti&"<i>金额</i>"
lidti=lidti&"<u>过期日期</u>"
lidti=lidti&"<u>开始日期</u>"
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
lidbt=uhlic(1,0,gysay(8),gysay(9))&gysay(1)&uhlic(1,1,gysay(8),gysay(9))
lidtt="标题："&gysay(1)&vbNewLine
lidtt=lidtt&"已发："&aiint(gysay(3))&vbNewLine
lidtt=lidtt&"总量："&aiint(gysay(4))&vbNewLine
lidtt=lidtt&"类型："&aiarr(i_buhty,"|",aiint(gysay(5)))&vbNewLine
lidtt=lidtt&"状态："&aiarr(i_buhxy,"|",aiint(gysay(8)))&vbNewLine
lidtt=lidtt&"时间："&gysay(9)
if uhfqx=1 then
lidlj=eshref(s_umgl&g_urg&s_uduh&g_urg&s_umxx&g_urg&gysay(0)&g_urz,77)
else
lidlj=eshref(s_uduh&g_urg&s_umxx&g_urg&gysay(0)&g_urz,66)
end if
if uhfqx=1 then
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_uduh&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_uduh&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_uduhs&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if
'list
if aibj(lidms,s_umlb) then
lids1=lids1&"<u"
if aiint(gysay(8))=1 then lids1=lids1&" class=""ftt"""
lids1=lids1&">"&aiarr(i_buhxy,"|",aiint(gysay(8)))&"</u>"
lids1=lids1&"<u>"&aiarr(i_buhty,"|",aiint(gysay(5)))&"</u>"
lids1=lids1&"<i>"&aiint(gysay(4))&"</i>"
lids1=lids1&"<i>"&aiint(gysay(3))&"</i>"
lids1=lids1&"<i>"&aiint(gysay(7))&"</i>"
lids1=lids1&"<i>"&aiint(gysay(6))&"</i>"
lids1=lids1&"<u>"&aitmx(gysay(11),2)&"</u>"
lids1=lids1&"<u>"&aitmx(gysay(10),2)&"</u>"
else
lidms=s_umlpc
lids1=aiarr(i_buhxy,"|",aiint(gysay(8)))
lids2=lids2&"有效期："&gysay(10)&" 到 "&gysay(11)&" 金额："&gysay(6)&"(限额"&gysay(7)&")"
lids2=lids2&aitms("发起时间：",gysay(9),2)
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,uhfqx,eshref(s_umgl&g_urg&s_uduh&g_urg&s_umsc&"-x"&g_urz,77),"uh")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=uhlic(1,"")
'-----------------------------------
Function uhlic(uhfkg,uhfty,uhfxy,uhftm)
uhlic=""
if uhfkg=1 and uhfty=0 then
uhlic=uhlic&icqz(s_udluh,1,uhfxy,0)
elseif uhfkg=1 and uhfty=1 then
uhlic=uhlic&ichz(1,uhftm,0,"")
end if
End Function
'-----------------------------------
'=uhsers()
'Call uhsers()
'-----------------------------------
Function uhsers()
icdssp="排序|金额|限额|数量|已发|发放|起效|过期"
icdrrp=split("uh_id desc|uh_jq desc|uh_je desc|uh_ns desc|uh_nl desc|uh_tm desc|uh_t1 desc|uh_t2 desc","|")
icdssf="范围|即将|正在|过期|金币|经验|金钱|"&esqday(0)&""
icdrrf=split("|uh_xy=0|uh_xy=1|uh_xy=2|uh_ty=0|uh_ty=1|uh_ty=2|"&esqday("uh_tm")&"","|")
icdssx="项目|标题|编码|系统|时间"
icdrrx=split("uh_bt|uh_bt|uh_sn|uh_xt|uh_tm","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=uhsersql()
'-----------------------------------
Function uhsersql()
Call icserq()
uhwhere=iclwhere
uhorder=iclorder
'order
if ainull(uhorder) then uhorder=uhordermo
'admin
if aibj(g_u0,s_umgl) then
iclapp=1
end if
End Function
%>