<%
'@@0manage/1s_udut/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_udut/2edit|add|del/3*id.HTML

'@@0s_udut/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_udut/1edit|add/2*id.HTML
'@@0s_udut/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_udut) or aibj(g_u1,s_udut)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_udut,s_uduts&s_umlbs)

if (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udut) and aibj(g_u2,"js") then
Call utjs()
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udut) and aibj(g_u2,s_umtj) then
Call utadd(1)
elseif aibj(g_u0,s_udut) and aibj(g_u1,s_umtj) then
Call utadd(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udut) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call utedit(1)
elseif aibj(g_u0,s_udut) and aibj(g_u1,s_umxg) then
Call utedit(0)
elseif aibj(g_u0,s_udut) and aibj(g_u1,s_umxx) and not ainull(g_u2) then
Call utshow(1)
elseif aibj(g_u0,s_udut) and aibj(g_u1,s_umzs) and not ainull(g_u2) then
Call utshow(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udut) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call utdel(1)
elseif aibj(g_u0,s_udut) and ((aibj(g_u1,s_umsc) and aiint(g_u2)>0) or aibj(g_u1,s_umsc&"-x")) then
Call utdel(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_udut) and dkdir(2,g_u2) then
Call utlist(1)
elseif aibj(g_u0,s_udut) and dkdir(2,g_u1) then
Call utlist(0)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","ut")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=utlie()
'-----------------------------------
Function utlie(utfty)
if utfty="form" then
utlie="sj,sn,mc,xi,px,xy,ot"
elseif utfty=s_umlb then
utlie="ut_id,ut_sj,ut_sn,ut_mc,ut_xi,ut_px,ut_xy,ut_ot"
elseif utfty="all" then
utlie="ut_id,ut_sj,ut_sn,ut_mc,ut_xi,ut_px,ut_xy,ut_ot"
end if
End Function
'-----------------------------------
'add/edit form
'=utform()
'-----------------------------------
Function utform(utfty,utfqx)
if utfty=0 then
ut_sj=0
ut_xi=0
ut_px=0
ut_xy=1
if utfqx=1 then
if not ainull(g_u3) then ut_sj=aistr(g_u3):ut_sn=ut_sj
if not ainull(g_u4) then ut_sn=aistr(g_u4)
else
if not ainull(g_u2) then ut_sj=aistr(g_u2):ut_sn=ut_sj
if not ainull(g_u3) then ut_sn=aistr(g_u3)
end if
end if
utform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
if utfqx=1 then
utform=utform&icflsr(5,"名称","","mc","",0,50,"*请输入"&s_uduts&"名称","",ut_mc)&icflsr(5,"编码","","sn","",3,50,"*请输入"&s_uduts&"编码","",ut_sn)
utform=utform&icflsr(25,"排序","","px","",6,20,"","",ut_px)&icflsr(25,"喜欢","","xi","",6,20,"","",ut_xi)&icflsr(25,"上级","","sj","",3,50,"*请输入"&s_uduts&"上级编码","",ut_sj)&icflxz(25,"状态","xy","","*","f-s",ut_xy,0,i_bxy)
utform=utform&icflsr(10,"信息","","ot","",0,200,"","",ut_ot)
else
utform=utform&icflsr(10,"补充","","ot","",0,200,"欢迎您补充当地的邮编、区号、名胜等信息","",ut_ot)&aiinput("hidden","mc","",0,0,"","",ut_mc)&aiinput("hidden","sn","",0,0,"","",ut_sn)&aiinput("hidden","px","",0,0,"","",ut_px)&aiinput("hidden","xi","",0,0,"","",ut_xi)&aiinput("hidden","sj","",0,0,"","",ut_sj)&aiinput("hidden","xy","",0,0,"","",ut_xy)
end if
utform=utform&icflot(10,"验证",eskyx(1,1,2))
if utfty=1 then
utform=utform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",ut_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif utfty=0 then
utform=utform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
utform=utform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=utadd()
'-----------------------------------
Function utadd(utfqx)
ew_bt=s_umtjs&s_uduts&","&ew_bt:ew_zt=s_umtjs&s_uduts&","&ew_zt:ew_nr=s_umtjs&s_uduts&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_uduts&"</a></li>"
e_mt=esbts(s_udxut,s_udlut,s_umtjs&s_uduts&g_gy&e_lj1,s_uduts&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("sj,sn,mc,px,xy") then
if gysfm(utlie("form"),utbiao,"ut_sn='"&aistr(aireq("sn"))&"'","ut_",1) then
Call aisn(0)
e_ma=e_ma&aigo(s_umtjs&s_uduts&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umtjs&s_uduts&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduts&s_ztsb,1)
end if
else
e_ma=utform(0,utfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=utedit()
'-----------------------------------
Function utedit(utfqx)
ew_bt=s_umxgs&s_uduts&","&ew_bt:ew_zt=s_umxgs&s_uduts&","&ew_zt:ew_nr=s_umxgs&s_uduts&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udut&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_uduts&"</a></li>"
e_mt=esbts(s_udxut,s_udlut,s_umxgs&s_uduts&g_gy&eshref(s_umgl&g_urg&s_udut&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_uduts&g_gy&e_lj1&g_gx&s_uduts&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("sj,sn,mc,px,xy") then
if gysfm(utlie("form"),utbiao,"ut_id="&aiint(aireq("id"))&" or (ut_id<>"&aiint(aireq("id"))&" and ut_sn='"&aistr(aireq("sn"))&"')","ut_",2) then
e_ma=e_ma&aigo(s_umxgs&s_uduts&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_uduts&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_uduts&s_ztsb,1)
end if
else
if utfqx=1 then
utwhere="ut_id="&aiint(g_u3)&""
else
utwhere="ut_id="&aiint(g_u2)&""
end if
if gysread(utlie("all"),utbiao,utwhere,"") then
ew_bt=ut_mc&","&ew_bt:ew_zt=ut_mc&","&ew_zt:ew_nr=ut_mc&","&ew_nr
e_ma=utform(1,utfqx)&e_ma
else
e_ma=e_ma&aigo(s_uduts&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=utdel(utfqx)
'-----------------------------------
Function utdel(utfqx)
ew_bt=s_uduts&s_umscs&","&ew_bt:ew_zt=s_uduts&s_umscs&","&ew_zt:ew_nr=s_uduts&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_uduts&s_umscs&"</li>"
e_mt=esbts(s_udxut,s_udlut,s_umscs&s_uduts,s_umtjs&s_uduts&g_gy&e_lj1&g_gx&s_uduts&s_umlbs&g_gy&e_lj0)
if utfqx=1 then
if e_uxy>2 then
if aiint(g_u3)>0 then
if gysdel(utbid,utbiao,"ut_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_uduts&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduts&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(utbid,utbiao,0) then
e_ma=e_ma&aitiao(s_uduts&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduts&s_umscs&s_ztsb,1)
end if
end if
end if
end if
End Function
'-----------------------------------
'show
'=utshow()
'-----------------------------------
Function utshow(utfty)
if gysread(utlie("all"),utbiao,"ut_sn='"&aistr(g_u2)&"' and ut_xy>0","") then
ew_bt=ut_mc&","&ut_sn&","&ew_bt:ew_zt=ut_mc&","&ut_sn&","&ew_zt:ew_nr=ut_mc&","&ut_sn&","&ew_nr:ew_cp=ut_mc&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_udut&g_urg&s_umxx&g_urg&ut_sn&g_urz,66)&""">"&ut_mc&"</a></li>"
dim utdsx,utdpur,utdpg,lidgl
utdpg=aiint(g_u3)
utdpur=eshref(s_udut&g_urg&g_u0&g_urg&ut_sn&g_urz,66)
'admin 0
lidgl=""
if aiint(e_uxy)>0 and aiint(ut_xy)<2 then lidgl=lidgl&g_gx&"补充说明"&g_gy&eshref(s_udut&g_urg&s_umxg&g_urg&ut_id&g_urz,66)
'admin 1
if utfty=1 then
e_mt=esbts(utdsx,s_udlut,s_uduts&s_umxxs&g_gy&eshref(s_udut&g_urg&s_umxx&g_urg&ut_sn&g_urz,66),s_uduts&s_umlbs&g_gy&eshref(s_udut&g_urg&s_umlb&g_urz,66)&g_gx&s_umzss&s_uduts&g_gy&eshref(s_udut&g_urg&s_umzs&g_urg&ut_sn&g_urz,66)&lidgl)
else
e_mt=esbts(utdsx,s_udlut,s_umzss&s_uduts&g_gy&eshref(s_udut&g_urg&s_umzs&g_urg&ut_sn&g_urz,66),s_uduts&s_umlbs&g_gy&eshref(s_udut&g_urg&s_umlb&g_urz,66)&g_gx&s_uduts&s_umxxs&g_gy&eshref(s_udut&g_urg&s_umxx&g_urg&ut_sn&g_urz,66)&lidgl)
end if


icdcb=ut_mc&"<span>"&ut_sn&"</span>"
'--------------------------------HENG 0
icdcd=s_uduts&"状态："&aiarr(i_bxy,"|",aiint(ut_xy))
icdcd=icdcd&" 排序："&aiint(ut_px)
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdci=ut_ot
'--------------------------------CONTENT 1
if icskg(ew_pj,ep_pj,0) then icdcm="<div class=""c-l"">"&eshi(9,ut_id,ut_xi)&"</div>"
if not ainull(ut_sj) and not aibj(ut_sj,"0") then icdcm=icdcm&"<a href="""&eshref(s_udut&g_urg&s_umxx&g_urg&ut_sj&g_urz,66)&""">上级地区</a>"
icdty=9
e_ma=e_ma&icnr(icdty,s_uduts,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
else
e_ma=e_ma&aigo(s_uduts&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=utlist()
'-----------------------------------
Function utlist(utfqx)
if utfqx=1 then
e_mt=esbts(s_udxut,s_udlut,s_uduts&s_umlbs&g_gy&e_lj0,s_umtjs&s_uduts&g_gy&e_lj1&g_gx&s_uduts&"JS生成更新"&g_gy&eshref(s_umgl&g_urg&s_udut&g_urg&"js"&g_urz,66))
else
e_mt=esbts(s_udxut,s_udlut,s_uduts&s_umlbs&g_gy&e_lj0,"")
end if
dim utlpg,utlps,utlpuq,utlpuh,utlpur,utlgrr
if utfqx=1 then
utlpuq=eshref(s_umgl&g_urg&s_udut,66)
lidms=g_u2
utlpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
utlpur=utlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&utlpuh&g_urz
utlpg=aiint(g_u3)
utlps=aiint(g_u4)
else
utlpuq=eshref(s_udut,66)
lidms=g_u1
utlpuh=g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8
utlpur=utlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&utlpuh&g_urz
utlpg=aiint(g_u2)
utlps=aiint(g_u3)
end if

iclls=icliqls(5,lidms,eshref(utlpuq&g_urg&g_gg&g_urg&g_urg&g_urg&utlpuh&g_urz,66))

Call utsers()
e_mz=e_mz&icliq(iclls,utlpuq&g_urg&lidms,utlpuh,e_gdj,utfqx,"ut")
Call utsersql()

if utlps=0 then
if aibj(lidms,s_umlpy) then
utlps=i_nmhc
else
utlps=i_nmlb
end if
end if

if gyslist(utbid,utlie(s_umlb),utbiao,utwhere,utorder,utlpur,utlpg,utlps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if utfqx=1 then lidti=lidti&"<b>操作</b>"
lidti=lidti&"<u>状态</u>"
lidti=lidti&"<i>排序</i>"
lidti=lidti&"<i>喜欢</i>"
lidti=lidti&"<u>编码</u>"
lidti=lidti&"地区名称"
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
lidbt=utlic(1,0,gysay(6),gysay(4))&gysay(3)&utlic(1,1,gysay(6),gysay(4))
lidtt="名称："&gysay(3)&vbNewLine
lidtt=lidtt&"编码："&gysay(2)&vbNewLine
lidtt=lidtt&s_uduts&"状态："&aiarr(i_bxy,"|",aiint(gysay(6)))&vbNewLine
lidlj=eshref(s_udut&g_urg&s_umxx&g_urg&gysay(2)&g_urz,66)
if utfqx=1 then
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_udut&g_urg&s_umtj&g_urg&gysay(2)&g_urz,66),"","","","f-sb",s_umtjs)&aibuttonk(eshref(s_umgl&g_urg&s_udut&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udut&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_uduts&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if
'list
if aibj(lidms,s_umlb) then
lids1=lids1&"<u"
if aiint(gysay(6))=0 then lids1=lids1&" class=""ftt"""
lids1=lids1&">"&aiarr(i_bxy,"|",aiint(gysay(6)))&"</u>"
lids1=lids1&"<i>"&gysay(5)&"</i>"
lids1=lids1&"<i>"&gysay(4)&"</i>"
lids1=lids1&"<u>"&gysay(2)&"</u>"
else
lidms=s_umlpc
lids1=gysay(2)
lids2=gysay(7)
lids3=s_uduts&"状态："&aiarr(i_bxy,"|",aiint(gysay(6)))
lids3=lids3&" 排序："&aiint(gysay(5))
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,utfqx,eshref(s_umgl&g_urg&s_udut&g_urg&s_umsc&"-x"&g_urz,77),"ut")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=utlic(1,"")
'-----------------------------------
Function utlic(utfkg,utfty,utfxy,utfxi)
utlic=""
if ew_qz>0 and utfkg=1 and utfty=0 then
if ew_qz=2 then
utlic=esicoh(1,s_udlut)
else
if aiint(utfxy)=0 then
utlic=utlic&iclbico(2,"chevron-down",0)&" "
elseif aiint(utfxy)=5 then
utlic=utlic&iclbico(2,"chevron-up",5)&" "
else
utlic=utlic&iclbico(2,"chevron-right",aiint(utfxy))&" "
end if
end if
elseif ew_hz=1 and utfkg=1 and utfty=1 then
if aiint(utfxi)>i_nmxhi then utlic=utlic&iclbico(2,"fire",0)
end if
End Function
'-----------------------------------
'=utsers()
'Call utsers()
'-----------------------------------
Function utsers()
icdssp="排序|喜欢|推荐|排序|名称"
icdrrp=split("ut_id desc|ut_xi desc|ut_xy desc|ut_px desc|ut_mc desc","|")
icdssf="范围|推荐|喜欢|一级"
icdrrf=split("|ut_xy>0|ut_xi>0|ut_sj='0'","|")
icdssx="项目|名称|编码|上级|其他"
icdrrx=split("ut_mc|ut_mc|ut_sn|ut_sj|ut_ot","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=utsersql()
'-----------------------------------
Function utsersql()
Call icserq()
utwhere=iclwhere
utorder=iclorder
'order
if ainull(utorder) then utorder=utordermo
'admin
if aibj(g_u0,s_umgl) then
iclapp=1
end if
End Function
'-----------------------------------
'make js
'=utjs()
'-----------------------------------
Function utjs()
Server.ScriptTimeOut="999999"
ew_bt=s_uduts&"JS生成与预览"&","&ew_bt:ew_zt=s_uduts&"JS生成与预览"&","&ew_zt:ew_nr=s_uduts&"JS生成与预览"&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl
e_mt=esbts(s_udxut,s_udlut,s_uduts&"JS生成与预览",s_uduts&s_umlbs&g_gy&e_lj0)
utorder="ut_px desc,ut_mc asc"
dim utdirs,utjstr,utsarra,utsarrb,utsarrc,utsarrd,utsarre,utsarrf,utsarraa,utsarrbb,utsarrcc,utsarrdd,utsarree,utsarrff,utsarrai,utsarrbi,utsarrci,utsarrdi,utsarrei,utsarrfi
utjstr="var asaiselectcity=["&vbcrlf
'{'val':'1','txt':'中国大陆'}
'{'val':'北京市','menu':[
'{'val':'朝阳区'},
'{'val':'玄武区'}
']},
'{'val':'湖南省','menu':[
'{'val':'邵东市','menu':[
'{'val':'安阳县'},
'{'val':'刘阳区'}
']},
'{'val':'邵阳市'}
']},
'0ut_id,1ut_sj,2ut_sn,3ut_mc,4ut_px,5ut_xy
if gystop(0,utbid,"ut_id,ut_sj,ut_sn,ut_mc,ut_px,ut_xy",utbiao,"ut_sj='0'",utorder,"") then
utsarra=split(gysar,g_gx)
for utsarrai=0 to ubound(utsarra)
utsarraa=split(utsarra(utsarrai),g_gy)
utjstr=utjstr&"{'val':'"&utsarraa(3)&"'"
'------b0
if i_xkuct>1 then
if gystop(0,utbid,"ut_id,ut_sj,ut_sn,ut_mc,ut_px,ut_xy",utbiao,"ut_sj='"&utsarraa(2)&"'",utorder,"") then
utsarrb=split(gysar,g_gx)
for utsarrbi=0 to ubound(utsarrb)
if utsarrbi=0 then utjstr=utjstr&",'menu':["&vbcrlf
utsarrbb=split(utsarrb(utsarrbi),g_gy)
utjstr=utjstr&"{'val':'"&utsarrbb(3)&"'"
'------c0
if i_xkuct>2 then
if gystop(0,utbid,"ut_id,ut_sj,ut_sn,ut_mc,ut_px,ut_xy",utbiao,"ut_sj='"&utsarrbb(2)&"'",utorder,"") then
utsarrc=split(gysar,g_gx)
for utsarrci=0 to ubound(utsarrc)
if utsarrci=0 then utjstr=utjstr&",'menu':["&vbcrlf
utsarrcc=split(utsarrc(utsarrci),g_gy)
utjstr=utjstr&"{'val':'"&utsarrcc(3)&"'"
'------d0
if i_xkuct>3 then
if gystop(0,utbid,"ut_id,ut_sj,ut_sn,ut_mc,ut_px,ut_xy",utbiao,"ut_sj='"&utsarrcc(2)&"'",utorder,"") then
utsarrd=split(gysar,g_gx)
for utsarrdi=0 to ubound(utsarrd)
if utsarrdi=0 then utjstr=utjstr&",'menu':["&vbcrlf
utsarrdd=split(utsarrd(utsarrdi),g_gy)
utjstr=utjstr&"{'val':'"&utsarrdd(3)&"'"
'------e0
if i_xkuct>4 then
if gystop(0,utbid,"ut_id,ut_sj,ut_sn,ut_mc,ut_px,ut_xy",utbiao,"ut_sj='"&utsarrdd(2)&"'",utorder,"") then
utsarre=split(gysar,g_gx)
for utsarrei=0 to ubound(utsarre)
if utsarrei=0 then utjstr=utjstr&",'menu':["&vbcrlf
utsarree=split(utsarre(utsarrei),g_gy)
utjstr=utjstr&"{'val':'"&utsarree(3)&"'"
'------f0
if i_xkuct>5 then
if gystop(0,utbid,"ut_id,ut_sj,ut_sn,ut_mc,ut_px,ut_xy",utbiao,"ut_sj='"&utsarree(2)&"'",utorder,"") then
utsarrf=split(gysar,g_gx)
for utsarrfi=0 to ubound(utsarrf)
if utsarrfi=0 then utjstr=utjstr&",'menu':["&vbcrlf
utsarrff=split(utsarrf(utsarrfi),g_gy)
utjstr=utjstr&"{'val':'"&utsarrff(3)&"'"

if utsarrfi=ubound(utsarrf) then
utjstr=utjstr&"}]"&vbcrlf
else
utjstr=utjstr&"},"&vbcrlf
end if
next
end if
end if
'------f1
if utsarrei=ubound(utsarre) then
utjstr=utjstr&"}]"&vbcrlf
else
utjstr=utjstr&"},"&vbcrlf
end if
next
end if
end if
'------e1
if utsarrdi=ubound(utsarrd) then
utjstr=utjstr&"}]"&vbcrlf
else
utjstr=utjstr&"},"&vbcrlf
end if
next
end if
end if
'------d1
if utsarrci=ubound(utsarrc) then
utjstr=utjstr&"}]"&vbcrlf
else
utjstr=utjstr&"},"&vbcrlf
end if
next
end if
end if
'------c1
if utsarrbi=ubound(utsarrb) then
utjstr=utjstr&"}]"&vbcrlf
else
utjstr=utjstr&"},"&vbcrlf
end if
next
else
utjstr=utjstr&"},"&vbcrlf
end if
end if
'------b1
if utsarrai=ubound(utsarra) then
utjstr=utjstr&"}"&vbcrlf
else
utjstr=utjstr&"},"&vbcrlf
end if
next
end if
utjstr=utjstr&"]"
utdirs=server.mappath(eshref("AsaiSkin/js/ut.js",3))
Call anfile(2,i_char,0,utjstr,utdirs)
e_ma=e_ma&"<div style=padding:10px;color:blue;font-size:12px;><div class=""ftt""><b>如遇更新无效，请手动复制以下代码至"&utdirs&"文件中保存:</b></div><br><br>"&replace(utjstr,vbcrlf,"<br>")&"</div>"
End Function
'-----------------------------------
'city select
'=utselect(utfty/0false/1true,"",utfmstr,utfzhi,utfname)
'=utselect(1,"默认空值的替换字符","江苏省, 南京市, 鼓楼区, 宁海路街道","ut")
'-----------------------------------
Function utselect(utfty,utfmstr,utfzhi,utfname,utfid)
utselect="<script type=""text/javascript"">"
if utfty=1 then
utselect=utselect&"var asaiselectempty"&utfid&"=true;"'请选择（空值）
else
utselect=utselect&"var asaiselectempty"&utfid&"=false;"'默认值
end if
if ainull(utfmstr) then
utselect=utselect&"var asaiselectmostr"&utfid&"=""请选择"";"
else
utselect=utselect&"var asaiselectmostr"&utfid&"="""&utfmstr&""";"
end if
utfzhi=REPLACE(utfzhi,", ",",")
utfzhi=REPLACE(utfzhi,",",""",""")
utfzhi=""""&utfzhi&""""
utselect=utselect&"var asaiselectvalue"&utfid&"=["&utfzhi&"];"
utselect=utselect&"</script>"
if aibj(utfid,"0") or ainull(utfid) then utselect=utselect&"<script type=""text/javascript"" src="""&eshref("AsaiSkin/js/ut.js",3)&"""></script><script type=""text/javascript"" src="""&eshref("AsaiSkin/js/utselect.js",3)&"""></script>"
utselect=utselect&"<script type=""text/javascript"">"
utselect=utselect&"function asaiselectctjs"&utfid&"(){var menu"&utfid&" = asaiselectcity;"
utselect=utselect&"var sel"&utfid&"=[""CTA"&utfid&""""
if i_xkuct>1 then utselect=utselect&", ""CTB"&utfid&""""
if i_xkuct>2 then utselect=utselect&", ""CTC"&utfid&""""
if i_xkuct>3 then utselect=utselect&", ""CTD"&utfid&""""
if i_xkuct>4 then utselect=utselect&", ""CTE"&utfid&""""
if i_xkuct>5 then utselect=utselect&", ""CTF"&utfid&""""
utselect=utselect&"];"
utselect=utselect&"var val"&utfid&"=asaiselectvalue"&utfid&";var cs"&utfid&"= new CascadeSelect(sel"&utfid&", menu"&utfid&", { Default: val"&utfid&" });}"
utselect=utselect&"</script>"
utselect=utselect&"<select class=""f-sa"" id=""CTA"&utfid&""" name="""&utfname&""" title=""省份、直辖市""></select>"
if i_xkuct>1 then utselect=utselect&"<select class=""f-sa"" id=""CTB"&utfid&""" name="""&utfname&""" title=""市、辖区""></select>"
if i_xkuct>2 then utselect=utselect&"<select class=""f-sa"" id=""CTC"&utfid&""" name="""&utfname&""" title=""县、区""></select>"
if i_xkuct>3 then utselect=utselect&"<select class=""f-sa"" id=""CTD"&utfid&""" name="""&utfname&""" title=""乡镇、街道""></select>"
if i_xkuct>4 then utselect=utselect&"<select class=""f-sa"" id=""CTE"&utfid&""" name="""&utfname&""" title=""村、社区""></select>"
if i_xkuct>5 then utselect=utselect&"<select class=""f-sa"" id=""CTF"&utfid&""" name="""&utfname&""" title=""地标、小区""></select>"
utselect=utselect&"<script type=""text/javascript"">asaiselectctjs"&utfid&"();</script>"
End Function
%>