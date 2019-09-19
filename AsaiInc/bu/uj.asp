<%
'@@0manage/1s_uduj/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_uduj/2edit|add|del/3*id.HTML

'@@0s_uduj/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_uduj/1edit|add/2*id.HTML
'@@0s_uduj/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_uduj) or aibj(g_u1,s_uduj)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_uduj,s_udujs&s_umlbs)

if (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduj) and aibj(g_u2,s_umtj) then
Call ujadd(1)
elseif aibj(g_u0,s_uduj) and aibj(g_u1,s_umfb) then
e_skc=dosk("a","frm",""):Call ujadd(0)
elseif aibj(g_u0,s_uduj) and aibj(g_u1,s_umtj) then
Call ujadd(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduj) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call ujedit(1)
elseif aibj(g_u0,s_uduj) and aibj(g_u1,s_umxg) then
Call ujedit(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduj) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and not ainull(g_u3) then
Call ujshow(g_u3)
elseif aibj(g_u0,s_uduj) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) and not ainull(g_u2) then
Call ujshow(g_u2)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduj) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call ujdel(1)
elseif aibj(g_u0,s_uduj) and ((aibj(g_u1,s_umsc) and aiint(g_u2)>0) or aibj(g_u1,s_umsc&"-x")) then
Call ujdel(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduj) and dkdir(2,g_u2) then
Call ujlist(1)
elseif aibj(g_u0,s_uduj) and dkdir(2,g_u1) then
Call ujlist(0)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","uj")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=ujlie()
'-----------------------------------
Function ujlie(ujfty)
if ujfty="form" then
ujlie="ty,us,co,tm"
elseif ujfty=s_umlb then
ujlie="uj_id,uj_ty,uj_us,uj_co,uj_tm"
elseif ujfty="all" then
ujlie="uj_id,uj_ty,uj_us,uj_co,uj_tm"
end if
End Function
'-----------------------------------
'add/edit form
'=ujform()
'-----------------------------------
Function ujform(ujfty,ujfqx)
if ujfty=0 then
uj_us=e_uer
end if
uj_tm=now()
ujform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
if ujfqx=1 then
ujform=ujform&icflsr(25,"账号","","us","",66,50,"*记录账号","",uj_us)&icflxz(25,"类型","ty","","*","f-s",uj_ty,0,i_bujty)&icflsr(5,"时间","","tm","",99,200,"*","",uj_tm)&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script>"
ujform=ujform&icflsr(10,"内容","","co","",0,200,"*内容","",uj_co)
else
if ujfty=1 and aibj(uj_us,e_uer) and aiint(uj_ty)>0 then
ujform=ujform&icflsr(10,"内容","","co","",0,200,"*内容","",uj_co)
ujform=ujform&aiinput("hidden","us","",0,0,"","",uj_us)&aiinput("hidden","ty","",0,0,"","",uj_ty)&aiinput("hidden","tm","",0,0,"","",uj_tm)
elseif ujfty=0 then
ujform=ujform&icflxz(25,"类型","ty","","*","f-s",uj_ty,"1|2|3",i_bujty)&icflsr(75,"内容","","co","",0,200,"*内容","",uj_co)
ujform=ujform&aiinput("hidden","us","",0,0,"","",uj_us)&aiinput("hidden","tm","",0,0,"","",uj_tm)
else
ujform=ujform&icflsr(10,"","不支持修改，可以返回列表页删除！")
ujform=ujform&aiinput("hidden","us","",0,0,"","",uj_us)&aiinput("hidden","ty","",0,0,"","",uj_ty)&aiinput("hidden","tm","",0,0,"","",uj_tm)&aiinput("hidden","co","",0,0,"","",uj_co)
end if
end if
ujform=ujform&icflot(10,"验证",eskyx(0,1,2))
if ujfty=1 then
ujform=ujform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",uj_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif ujfty=0 then
ujform=ujform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
ujform=ujform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=ujadd()
'-----------------------------------
Function ujadd(ujfqx)
ew_bt=s_umtjs&s_udujs&","&ew_bt:ew_zt=s_umtjs&s_udujs&","&ew_zt:ew_nr=s_umtjs&s_udujs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_udujs&"</a></li>"
e_mt=esbts(s_udxuj,s_udluj,s_umtjs&s_udujs&g_gy&e_lj1,s_udujs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("us,ty,co") then
if gysfm(ujlie("form"),ujbiao,"uj_co='"&aistr(aireq("co"))&"'","uj_",1) then
e_ma=e_ma&aigo(s_umtjs&s_udujs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umtjs&s_udujs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_udujs&s_ztsb&"[填写完整表单]",1)
end if
else
e_ma=ujform(0,ujfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=ujedit()
'-----------------------------------
Function ujedit(ujfqx)
ew_bt=s_umxgs&s_udujs&","&ew_bt:ew_zt=s_umxgs&s_udujs&","&ew_zt:ew_nr=s_umxgs&s_udujs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_uduj&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_udujs&"</a></li>"
e_mt=esbts(s_udxuj,s_udluj,s_umxgs&s_udujs&g_gy&eshref(s_umgl&g_urg&s_uduj&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_udujs&g_gy&e_lj1&g_gx&s_udujs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("us,ty,co") then
if gysfm(ujlie("form"),ujbiao,"uj_id="&aiint(aireq("id"))&" or (uj_id<>"&aiint(aireq("id"))&" and uj_co='"&aistr(aireq("co"))&"')","uj_",2) then
e_ma=e_ma&aigo(s_umxgs&s_udujs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_udujs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_udujs&s_ztsb,1)
end if
else
if ujfqx=1 then
ujwhere="uj_id="&aiint(g_u3)&""
else
ujwhere="uj_id="&aiint(g_u2)&""
end if
if gysread(ujlie("all"),ujbiao,ujwhere,"") then
ew_bt=uj_us&","&ew_bt:ew_zt=uj_us&","&ew_zt:ew_nr=uj_us&","&ew_nr
e_ma=ujform(1,ujfqx)&e_ma
else
e_ma=e_ma&aigo(s_udujs&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=ujdel(ujfqx)
'-----------------------------------
Function ujdel(ujfqx)
ew_bt=s_udujs&s_umscs&","&ew_bt:ew_zt=s_udujs&s_umscs&","&ew_zt:ew_nr=s_udujs&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_udujs&s_umscs&"</li>"
e_mt=esbts(s_udxuj,s_udluj,s_umscs&s_udujs,s_umtjs&s_udujs&g_gy&e_lj1&g_gx&s_udujs&s_umlbs&g_gy&e_lj0)
if ujfqx=1 then
if e_uxy>2 then
if aiint(g_u3)>0 then
if gysdel(ujbid,ujbiao,"uj_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_udujs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udujs&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(ujbid,ujbiao,0) then
e_ma=e_ma&aitiao(s_udujs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udujs&s_umscs&s_ztsb,1)
end if
end if
end if
else
if aiint(g_u2)>0 then
if gysdel(ujbid,ujbiao,"uj_us='"&e_uer&"' and uj_id="&aiint(g_u2)) then
e_ma=e_ma&aitiao(s_udujs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udujs&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u1,s_umsc&"-x") then
if gysdel(ujbid,ujbiao,"uj_us='"&e_uer&"'") then
e_ma=e_ma&aitiao(s_udujs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udujs&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'show
'=ujshow()
'-----------------------------------
Function ujshow(ujfid)
ujwhere="uj_id="&aistr(ujfid)&" and (uj_ty<>2 or uj_us='"&e_uer&"')"
if gysread(ujlie("all"),ujbiao,ujwhere,"") then
ew_bt=usren(uj_us)&","&ew_bt:ew_zt=usren(uj_us)&","&ew_zt:ew_nr=usren(uj_us)&","&ew_nr:ew_cp=usren(uj_us)&","&ew_cp
dim ujdsx,ujdpur,ujdpg,lidgl
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_uduj&g_urg&s_umxx&g_urg&uj_id&g_urz,77)&""">"&usren(uj_us)&s_udujs&"</a></li>"
ujdpg=aiint(g_u4)
ujdpur=eshref(s_umgl&g_urg&s_uduj&g_urg&g_u1&g_urg&uj_id&g_urz,77)
'admin 0
lidgl=""
lidgl=lidgl&g_gx&"编辑"&s_udujs&g_gy&eshref(s_umgl&g_urg&s_uduj&g_urg&s_umxg&g_urg&uj_id&g_urz,77)&g_gx&"删除"&s_udujs&g_gy&eshref(s_umgl&g_urg&s_uduj&g_urg&s_umsc&g_urg&uj_id&g_urz,77)
'admin 1
e_mt=esbts(ujdsx,s_udluj,s_udujs&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_uduj&g_urg&s_umxx&g_urg&uj_id&g_urz,77),s_udujs&s_umlbs&g_gy&eshref(s_umgl&g_urg&s_uduj&g_urg&s_umlb&g_urz,77)&lidgl)
else
e_wl=e_wl&"<li><a href="""&eshref(s_uduj&g_urg&s_umxx&g_urg&uj_id&g_urz,66)&""">"&usren(uj_us)&s_udujs&"</a></li>"
ujdpg=aiint(g_u3)
ujdpur=eshref(s_uduj&g_urg&g_u0&g_urg&uj_id&g_urz,66)
'admin 0
lidgl=""
if aibj(uj_us,e_uer) then lidgl=lidgl&g_gx&"编辑"&s_udujs&g_gy&eshref(s_uduj&g_urg&s_umxg&g_urg&uj_id&g_urz,66)
if aibj(uj_us,e_uer) then lidgl=lidgl&g_gx&"删除"&s_udujs&g_gy&eshref(s_uduj&g_urg&s_umsc&g_urg&uj_id&g_urz,66)
'admin 1
e_mt=esbts(ujdsx,s_udluj,s_umzss&s_udujs&g_gy&eshref(s_uduj&g_urg&s_umzs&g_urg&uj_id&g_urz,66),s_udujs&s_umlbs&g_gy&eshref(s_uduj&g_urg&s_umlb&g_urz,66)&lidgl)
end if
icdcb=aiarr(i_bujty,"|",aiint(uj_ty))
'--------------------------------HENG 0
if not ainull(uj_tm) then icdcd=icdcd&aitms(" 发送时间：",uj_tm,9)
'--------------------------------HENG 1
'--------------------------------CONTENT 0
if left(uj_co,7)="http://" then
icdci="<a href="""&uj_co&""" class=""y-n"" target=_ablank>点击打开连接</a>"
else
icdci=uj_co
end if
icdty=9
e_ma=e_ma&icnr(icdty,s_udujs,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
'--------------------------------CONTENT 1
e_ma=e_ma&"<div class=""cr""></div></div>"
else
e_ma=e_ma&aigo(s_udujs&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=ujlist()
'-----------------------------------
Function ujlist(ujfqx)
e_mt=esbts(s_udxuj,s_udluj,s_udujs&s_umlbs&g_gy&e_lj0,"<i>"&s_umtjs&s_udujs&"</i>"&g_gy&e_lj1)
dim ujlpg,ujlps,ujlpuq,ujlpuh,ujlpur,ujlgrr
if ujfqx=1 then
ujlpuq=eshref(s_umgl&g_urg&s_uduj,66)
lidms=g_u2
ujlpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
ujlpur=ujlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&ujlpuh&g_urz
ujlpg=aiint(g_u3)
ujlps=aiint(g_u4)
else
ujlpuq=eshref(s_uduj,66)
lidms=g_u1
ujlpuh=g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8
ujlpur=ujlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&ujlpuh&g_urz
ujlpg=aiint(g_u2)
ujlps=aiint(g_u3)
end if

iclls=icliqls(5,lidms,eshref(ujlpuq&g_urg&g_gg&g_urg&g_urg&g_urg&ujlpuh&g_urz,66))

Call ujsers()
e_mz=e_mz&icliq(iclls,ujlpuq&g_urg&lidms,ujlpuh,e_gdj,ujfqx,"uj")
Call ujsersql()

if ujlps=0 then
if aibj(lidms,s_umlpy) then
ujlps=i_nmhc
else
ujlps=i_nmlb
end if
end if

'@@uj_id,1uj_id,2uj_co,3uj_tm,4uj_us,5uj_u1,6uj_px,7uj_xy
'@@uj_id,1uj_ty,2uj_us,3uj_co,4uj_tm
if gyslist(ujbid,ujlie(s_umlb)&",uj_co",ujbiao,ujwhere,ujorder,ujlpur,ujlpg,ujlps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if ujfqx=1 then lidti=lidti&"<b>操作</b>"
lidti=lidti&"<u>类型</u>"
lidti=lidti&"<u>记录时间</u>"
lidti=lidti&"<u>记录人</u>"
lidti=lidti&"内容"
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
lidbt=ujlic(1,0,gysay(4))&left(gysay(3),200)&ujlic(1,1,gysay(4))
lidtt="记录人："&usren(gysay(2))&vbNewLine
lidtt=lidtt&s_udujs&"类型："&aiarr(i_bujty,"|",aiint(gysay(1)))&vbNewLine
lidtt=lidtt&"记录时间："&gysay(4)
if ujfqx=1 then
lidlj=eshref(s_umgl&g_urg&s_uduj&g_urg&s_umxx&g_urg&gysay(0)&g_urz,66)
else
lidlj=eshref(s_uduj&g_urg&s_umxx&g_urg&gysay(0)&g_urz,66)
end if
if ujfqx=1 then
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_uduj&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_uduj&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_udujs&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if
'list
if aibj(lidms,s_umlb) then
lids1=lids1&"<u>"&aiarr(i_bujty,"|",aiint(gysay(1)))&"</u>"
lids1=lids1&"<u>"&gysay(4)&"</u>"
lids1=lids1&"<u>"&usren(gysay(2))&"</u>"
else
lids3=lids3&aitms("发送时间：",gysay(4),9)&"　"&s_udujs&"状态："&aiarr(i_bujty,"|",aiint(gysay(1)))&"　会员："&usren(gysay(2))
lids2=""
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,ujfqx,eshref(s_umgl&g_urg&s_uduj&g_urg&s_umsc&"-x"&g_urz,77),"uj")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=ujlic(1,"")
'-----------------------------------
Function ujlic(ujfkg,ujfty,ujftm)
ujlic=""
if ujfkg=1 and ujfty=0 then
ujlic=ujlic&icqz(s_udluj,1,ujfty,0)
elseif ujfkg=1 and ujfty=1 then
ujlic=ujlic&ichz(1,ujftm,0,"")
end if
End Function
'-----------------------------------
'=ujsers()
'Call ujsers()
'-----------------------------------
Function ujsers()
icdssp="排序|最新|时间"
icdrrp=split("uj_id desc|uj_id desc|uj_tm desc","|")
icdssf="范围|"&esqday(0)&"|记录"
icdrrf=split("|"&esqday("uj_tm")&"|uj_us='"&e_uer&"'","|")
icdssx="项目|内容|账户"
icdrrx=split("uj_co|uj_id|uj_us","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=ujsersql()
'-----------------------------------
Function ujsersql()
Call icserq()
ujwhere=iclwhere
ujorder=iclorder
iclapp=1
'order
if ainull(ujorder) then ujorder=ujordermo
'admin
if not aibj(g_u0,s_umgl) then
if not ainull(ujwhere) then ujwhere=ujwhere&" and "
ujwhere=ujwhere&"uj_us='"&e_uer&"'"
end if
End Function
%>