<%
'@@0manage/1s_udef/2*pd|all/3list|list-s|zhi|zhi-g|zhi-k|tree|tree-g|tree-k|yun|zhi-m|zhi-xa|zhi-xb/4page/5psize/6ssx/7ssm/8ssf/9ssp/10sss.HTML
'@@0manage/1s_udef/2*pd|all/3edit|add|del|del-x/4*id|*sn.HTML

'@@0s_udef/1*pd|all/2list|list-s|zhi|zhi-g|zhi-k|tree|tree-g|tree-k|yun|zhi-m/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0s_udef/1*pd|all/2edit|add|del/3*id|*sn.HTML
'@@0s_udef/1*pd|all/2show|info/3*sn.HTML

if e_xa<1 and (aibj(g_u0,s_udef) or aibj(g_u1,s_udef)) then
e_xa=e_xa+1
Call esq()
if aibj(g_u0,s_umgl) then
Call doq(1,e_uer,9,g_u0,g_u2,s_udef)
else
Call doq(1,e_uer,9,g_u0,g_u1,s_udef)
end if

if not ainull(ep_sx) then
d_sefsx=ep_sx
else
d_sefsx=s_udxef
end if

if e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udef) and aibj(g_u3,s_umtj) then
Call efadd(1,g_u2,g_u4)
elseif e_gdj>2 and aibj(g_u0,s_udef) and aibj(g_u2,s_umtj) then
Call efadd(0,g_u1,g_u3)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udef) and aibj(g_u3,s_umxg) and aiint(g_u4)>0 then
Call efedit(1)
elseif e_gdj>2 and aibj(g_u0,s_udef) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call efedit(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udef) and ((aibj(g_u3,s_umsc) and g_u4<>"") or aibj(g_u3,s_umsc&"-x"))then
Call efdel(1)
elseif e_gdj>2 and aibj(g_u0,s_udef) and aibj(g_u2,s_umsc) and aiint(g_u3)>0 then
Call efdel(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udef) and dkdir(3,g_u3) then
Call eflist(1,g_u2)
elseif aibj(g_u0,s_udef) and dkdir(3,g_u2) then
Call eflist(0,g_u1)
elseif aibj(g_u0,s_udef) and aibj(g_u1,s_umxx) and g_u2<>"" then
Call efshow(1)
elseif aibj(g_u0,s_udef) and aibj(g_u1,s_umzs) and g_u2<>"" then
Call efshow(0)
end if
if aibj(g_u0,s_umgl) then e_ma=e_ma&efhelp()
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","ef")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'USER HELP
'=efhelp()
'-----------------------------------
Function efhelp()
efhelp="<div class=crg></div><div class=g-lt>使用说明与帮助：</div><div class=g-ll><ul>"
efhelp=efhelp&"<li class=g-ll0>特别注意：如果添加的分类在上级或选择分类的时候看不见，需要清理一下网站缓存；</li>"
efhelp=efhelp&"<li class=g-ll1>在简介中直接输入网址可以在操作点击分类名称的时候直接跳转到这个网址上面；</li>"
efhelp=efhelp&"<li class=g-ll0>添加分类的时候需要注意编码规则，下一级菜单需要以上一级菜单编码为模板，后面添加其他字符；</li>"
efhelp=efhelp&"<li class=g-ll1>分类编码避免特殊字符和那些与网站频道栏目相同的编码、文件夹名；</li>"
efhelp=efhelp&"<li class=g-ll0>分类联动处理需要在网站信息少的时候处理，庞大信息量处理会影响网站访问，慎用；</li>"
efhelp=efhelp&"<li class=g-ll1>当使用论坛分类的时候，若将分类状态改为2颗星以上，则这个分类会显示在论坛导航上面；</li>"
efhelp=efhelp&"</ul></div>"
End Function
'-----------------------------------
'Data Table
'=eflie()
'-----------------------------------
Function eflie(effty)
if effty="form" then
eflie="ew,el,ep,sx,dx,jx,xx,sn,bt,ot,nr,up,tm,xi,xy,xt,us"
elseif effty=s_umlb then
'@@ef_id,1ef_ew,2ef_sx,3ef_dx,4ef_jx,5ef_xx,6ef_sn,7ef_bt,8ef_ot,9ef_up,10ef_tm,11ef_xi,12ef_xy,13ef_ep,14ef_nr
eflie="ef_id,ef_ew,ef_sx,ef_dx,ef_jx,ef_xx,ef_sn,ef_bt,ef_ot,ef_up,ef_tm,ef_xi,ef_xy,ef_ep"
elseif effty="all" then
eflie="ef_id,ef_ew,ef_el,ef_ep,ef_sx,ef_dx,ef_jx,ef_xx,ef_sn,ef_bt,ef_ot,ef_nr,ef_up,ef_tm,ef_xi,ef_xy,ef_xt,ef_us"
end if
End Function
'-----------------------------------
'class all in a channel/ef
'=efmrr(effty=0all ep|1ep|2efsn,efffp)
'-----------------------------------
Function efmrr(effty,efffp)
dim efdfp
if e_gdj>1 then
efwhere=replace(efwheremo,"ef_xy>0","1=1")
g_app="_"&s_umgl
else
efwhere=efwheremo
g_app=""
end if
eforder=efordermo
'ALL EP
if effty=0 then
dim efmapp
efmapp=esapm(0,s_udef&g_apj&aiint(ew_sn)&"_"&s_umqb&g_app)
'if ankck(efmapp) then
if 1=1 then
dim efeplin,efmrrlin,efepall,efmsx,efmdx,efmjx,efmsxt
efmrr=efmrr&"0"&g_gy&ew_sn&g_gy&"0"&g_gy&"0"&g_gy&"1"&g_gy&"00"&g_gy&"index"&g_gy&"网站主页"&g_gy&g_gy&g_gy&g_gy&"0"&g_gy&"2"&g_gy&""
'response.Write epall&"<br><br>"
efepall=epall
if ewxlt() then efepall=efepall&g_gx&"0"&g_gy&s_udbb&g_gy&"网站论坛"&g_gy&"论坛"&g_gy&""&g_gy&"0"&g_gy&"1"&g_gy&"1"&g_gy&"0"&g_gy&"1"&g_gy&"2"&g_gy&"2"&g_gy&"1"
if efepall<>"" then
gysaxbb=split(efepall,g_gx)
for gysibb=0 to ubound(gysaxbb)
gysaybb=split(gysaxbb(gysibb),g_gy)
efeplin=gysaybb(1)
efmrrlin=""
gysar=""
g_app=""
efwhere=efwheremo
efmrr=efmrr&g_gx&gysaybb(0)&g_gy&ew_sn&g_gy&"0"&g_gy&"0"&g_gy&"1"&g_gy&"00"&g_gy&efeplin&g_gy&gysaybb(2)&g_gy&g_gy&g_gy&g_gy&"0"&g_gy&"2"&g_gy&""
efdfp=esrfd(0,efeplin,ew_kj)
  if not aibj(efeplin,"0") and not ainull(efeplin) and not aibj(efeplin,s_umqb) then
  if not ainull(efwhere) then efwhere=efwhere&" and "
  efwhere=efwhere&"ef_ep='"&efdfp&"'"
  g_app=efeplin&g_app
  end if
if aiint(ew_sn)>0 and not (aibj(s_udun,efeplin) or aibj(s_udus,efeplin)) then
if not ainull(efwhere) then efwhere=efwhere&" and "
efwhere=efwhere&" "&esrew("ef",ew_sn)&""
g_app=aiint(ew_sn)&"_"&g_app
end if
  if not ainull(g_app) then g_app=esapm(0,s_udef&g_apj&g_app)
  if gystop(i_nmtp,efbid,eflie(s_umlb),efbiao,efwhere,eforder,g_app) then
  if not aibj(efdfp,efeplin) then gysar=replace(gysar,g_gy&efdfp,g_gy&efeplin)
	gysax=split(gysar,g_gx)
	for gysi=0 to ubound(gysax)
	gysay=split(gysax(gysi),g_gy)
	efmrrlin=efmrrlin&g_gx
	efmsx=gysay(2)
	if efmsx="0" then efmsx=efeplin
	efmdx=efeplin
	efmjx=gysay(4)
	efmjx=aiint(efmjx)+1
	efmrrlin=efmrrlin&gysay(0)&g_gy&gysay(1)&g_gy&efmsx&g_gy&efmdx&g_gy&efmjx&g_gy&gysay(5)&g_gy&gysay(6)&g_gy&gysay(7)&g_gy&gysay(8)&g_gy&g_gy&g_gy&gysay(11)&g_gy&gysay(12)&g_gy&gysay(13)
	next
  end if
efmrr=efmrr&efmrrlin
next
end if
Call ankop(2,0,ansav(efmrr),efmapp)
else
efmrr=anreq(ankop(1,0,0,efmapp))
end if
'response.Write efmrr
'EP
elseif effty=1 or effty=5 then
efdfp=esrfd(0,efffp,ew_kj)
  if not aibj(efffp,"0") and not ainull(efffp) and not aibj(efffp,s_umqb) then
  if not ainull(efwhere) then efwhere=efwhere&" and "
  efwhere=efwhere&"ef_ep='"&efdfp&"'"
  g_app=efffp&g_app
if aibj(s_udun,efeplin) or aibj(s_udus,efeplin) or aiint(ew_sn)=0 then
else
if not ainull(efwhere) then efwhere=efwhere&" and "
efwhere=efwhere&" "&esrew("ef",ew_sn)&""
g_app=aiint(ew_sn)&"_"&g_app
end if
  else
if not ainull(efwhere) then efwhere=efwhere&" and "
efwhere=efwhere&" "&esrew("ef",ew_sn)&""
g_app=aiint(ew_sn)&"_"&g_app
  end if
  if not ainull(g_app) then g_app=esapm(0,s_udef&g_apj&g_app)
  if gystop(i_nmtp,efbid,eflie(s_umlb),efbiao,efwhere,eforder,g_app) then
  efmrr=gysar
  if not aibj(efdfp,efffp) then efmrr=replace(efmrr,g_gy&efdfp,g_gy&efffp)
  end if
'EF
elseif effty=2 then
dim efdfp0,efdfp1,efdfpy
g_app=""
efdfp=split(efffp&g_urg,g_urg)
efdfp0=efdfp(0)
efdfpy=efdfp(1)
efdfp1=esrfd(0,efdfpy,ew_kj)
if not aibj(efdfp1,"0") and not ainull(efdfp1) and not aibj(efdfp1,s_umqb) then
if not ainull(efwhere) then efwhere=efwhere&" and "
efwhere=efwhere&"ef_ep='"&efdfp1&"'"
end if
  if not aibj(efdfp0,"0") and not ainull(efdfp0) and not aibj(efdfp0,s_umqb) then
  if not ainull(efwhere) then efwhere=efwhere&" and "
  efwhere=efwhere&"(ef_sx='"&efdfp0&"' or ef_dx='"&efdfp0&"' or ef_sn='"&efdfp0&"')"
  end if
'if aiint(ew_sn)>0 then
'if not ainull(efwhere) then efwhere=efwhere&" and "
'efwhere=efwhere&" "&esrew("ef",ew_sn)&""
'end if
  if gystop(i_nmtp,efbid,eflie(s_umlb),efbiao,efwhere,eforder,g_app) then
  efmrr=gysar
  if not aibj(efdfp1,efdfpy) then efmrr=replace(efmrr,g_gy&efdfp1,g_gy&efdfpy)
  end if
end if
'response.Write efmrr
End Function
'-----------------------------------
'ef read
'=efread(sn)
'-----------------------------------
Function efread(effsn)
dim efdsn
efdsn=effsn
ef_id=0:ef_ew=0:ef_el=0:ef_ep="":ef_sx=0:ef_dx=0:ef_jx=0:ef_xx=0:ef_sn=s_umqb:ef_bt=s_umqbs:ef_ot="":ef_nr="":ef_up="":ef_tm="":ef_xi=0:ef_xy=0:ef_xt="":ef_us=""
if not aibj(efdsn,"0") and not aibj(efdsn,s_umqb) and not ainull(efdsn) then
g_app=esapm(0,s_udef&g_apj&"F_"&efdsn)
if gysread(eflie("all"),efbiao,"ef_sn='"&aistr(efdsn)&"'",g_app) then
efread=ef_bt
else
efread=""
end if
end if
End Function
'-----------------------------------
'ef read nr
'=efnr(0,effstr)
'-----------------------------------
Function efnr(effty,effstr)
if len(effstr&"0")>6 then
efnr="<li class=""l-tf"">"&effstr&"</li>"
elseif effty=1 and len(ep_nr&"0")>6 then
efnr="<li class=""l-tf"">"&ep_nr&"</li>"
else
efnr=""
end if
End Function
'-----------------------------------
'ef wl
'=efwl(efflj,effsn,effbt)
'-----------------------------------
Function efwl(efflj,effsn,effbt)
efwl=""
if not ainull(efflj) and not ainull(effsn) and not ainull(effbt) then
dim efdss,efdrr,efdii,efdjj,efdmo
efdmo="<li><a href="""&replace(efflj,g_urg&g_gg&g_urz,g_urg&effsn&g_urz)&""">"&effbt&"</a></li>"
efdjj=0
efdss=split(effsn&g_ura,g_ura)(0)
if len(efdss)>3 then
for efdii=3 to len(efdss)-2 step 2
Call efread(left(efdss,efdii))
if ef_bt<>"" and ef_sn<>"" and not aibj(ef_sn,s_umqb) then
efwl=efwl&"<li><a href="""&replace(efflj,g_urg&g_gg&g_urz,g_urg&ef_sn&g_urz)&""">"&ef_bt&"</a></li>"
ew_bt=ef_bt&","&ew_bt:ew_zt=ef_bt&","&ew_zt:ew_nr=ef_bt&","&ew_nr:ew_cp=ef_bt&","&ew_cp
else
efdjj=efdjj+1
end if
if efdjj>1 then exit for
next
end if
Call efread(efdss)
efwl=efwl&"<li><a href="""&replace(efflj,g_urg&g_gg&g_urz,g_urg&ef_sn&g_urz)&""">"&ef_bt&"</a></li>"
end if
End Function
'-----------------------------------
'select form
'=efselect(effty,effjh,effnm,effep,effva)
'-----------------------------------
Function efselect(effty,effjh,effnm,effep,effva)
dim efljx,efleps,eflii,efdlin,efallin
efselect=""
effjh=aiint(effjh)
if effjh=11 then'bak for class
efallin=efall(effep)
if efallin<>"" then
efselect=efselect&"<div class=""l-rt"">"
efselect=efselect&"请认真勾选所属分类　<input type=""button""  onclick=""document.getElementById('l-ruef').style.height=window.document.getElementById('l-ruef').offsetHeight+100 + 'px';"" class=""f-sb"" value=""扩大""><input type=""button""  onclick=""document.getElementById('l-ruef').style.height='auto';"" class=""f-sb"" value=""自适应""><input type=""button""  onclick=""document.getElementById('l-ruef').style.height=window.document.getElementById('l-ruef').offsetHeight-100 + 'px';"" class=""f-sb"" value=""缩小""></div><div id=""l-ruef"" class=""l-ru"">"
if efallin<>"" then
gysax=split(efallin,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
efljx=aiint(gysay(4))-1
if efljx>0 then
For eflii=1 To efljx
efselect=efselect&"——"
Next
end if
efselect=efselect&"<input type=""checkbox"" name="""&effnm&""" id="""&effnm&""""
if instr(effva&",",gysay(6)&",")>0 then efselect=efselect&"  checked=""checked"""
efselect=efselect&" value="""&gysay(6)&""">"
if efljx=0 then efselect=efselect&"<span style=""color:#FF0000;"">"
efselect=efselect&gysay(7)
if aibj(g_u0,s_umgl) then efselect=efselect&"("&gysay(6)&")"
if efljx=0 then efselect=efselect&"</span>"
efselect=efselect&"<br>"
next
else
efselect=efselect&""
end if
efselect=efselect&"</div>"
else
efselect=efselect&""&efallin'no ef
end if
elseif effjh>1 then
efdlin=icmenu("","","1|"&effep,effva,400,0,14,16,160)
if efdlin<>"" then
efselect=efselect&"<div class=""l-rt"">勾选分类　"
'当使用树形菜单的时候，请启用这段代码
'efselect=efselect&"<input type=""button""  onclick="""&treejsl&""" class=""f-sb"" value=""全部展开/关闭"">"
efselect=efselect&"<input type=""button""  onclick=""document.getElementById('l-ruef').style.height=window.document.getElementById('l-ruef').offsetHeight+100 + 'px';"" class=""f-sb"" value=""扩大""><input type=""button""  onclick=""document.getElementById('l-ruef').style.height='auto';"" class=""f-sb"" value=""自适应""><input type=""button""  onclick=""document.getElementById('l-ruef').style.height=window.document.getElementById('l-ruef').offsetHeight-100 + 'px';"" class=""f-sb"" value=""缩小""></div><div id=""l-ruef"" class=""l-ru"">"&replace(efdlin,g_gg,effnm)&"</div>"
else
efselect=efselect&""'no ef
end if
else
efallin=efall(effep)
if effty=1 then
efselect=efselect&"<select class=""f-sa"" name="""&effnm&""" id="""&effnm&""">"
efselect=efselect&"<option value=""0"">作为顶级"&s_udefs&"</option>"
elseif effty=2 then
efselect=efselect&"<select class=""f-sa"" name="""&effnm&""" id="""&effnm&""">"
efselect=efselect&"<option value=""0"">请选择上级"&s_udefs&"</option>"
elseif effty=3 then
efselect=efselect&"<select class=""f-sa"" name="""&effnm&""" id="""&effnm&""">"
efselect=efselect&"<option value=""0"">请选择帖子发布的"&s_udefs&"</option>"
elseif effty=5 then
efselect=efselect&"<select class=""f-sa"" name="""&effnm&""" id="""&effnm&""">"
else
efselect=efselect&"<select class=""f-sa"" name="""&effnm&""" id="""&effnm&""">"
efselect=efselect&"<option value=""0"">请选择"&s_udefs&"</option>"
end if
if efallin<>"" then
gysax=split(efallin,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
efselect=efselect&"<option"
if instr(effva&",",gysay(6)&",")>0 then efselect=efselect&" selected"
efselect=efselect&" value="""&gysay(6)&""""
efljx=aiint(gysay(4))-1
if efljx=0 then efselect=efselect&" style=""color:#FF0000;"""
efselect=efselect&">"
if efljx>0 then
For eflii=1 To efljx
efselect=efselect&"——"
Next
end if
efselect=efselect&gysay(7)
if aibj(g_u0,s_umgl) then efselect=efselect&"("&gysay(6)&")"
efselect=efselect&"</option>"
next
else
efselect=efselect&""
end if
efselect=efselect&"</select>"
if effty=1 then efselect=efselect&" <input type=""checkbox"" name=""tx"" id=""tx"" value=""1"">位列其下."
end if
if effjh>0 then
Call epread(effep)
efselect=efselect&epfl(effjh,effnm,ep_fl,effva,"")
end if
End Function
'-----------------------------------
'class all in a channel
'=efall(effep)
'-----------------------------------
Function efall(effep)
dim efdep
efdep=esrfd(0,effep,ew_kj)
if e_gdj>1 then
efwhere=replace(efwheremo,"ef_xy>0","ef_xy<9999")
g_app="_"&s_umgl
else
efwhere=efwheremo
g_app=""
end if
if not aibj(effep,"0") and not ainull(effep) and not aibj(effep,s_umqb) then
if not ainull(efwhere) then efwhere=efwhere&" and "
efwhere=efwhere&"ef_ep='"&efdep&"'"
g_app=esapm(0,s_udef&g_apj&effep&g_app)
if aiint(ew_sn)>0 and not (aibj(s_udun,effep) or aibj(s_udus,effep)) then
if not ainull(efwhere) then efwhere=efwhere&" and "
efwhere=efwhere&" "&esrew("ef",ew_sn)&""
g_app=esapm(0,s_udef&g_apj&aiint(ew_sn)&g_app)
end if
else
if aiint(ew_sn)>0 then
if not ainull(efwhere) then efwhere=efwhere&" and "
efwhere=efwhere&" "&esrew("ef",ew_sn)&""
end if
g_app=esapm(0,s_udef&g_apj&aiint(ew_sn)&g_app)
end if
eforder=efordermo
if gystop(i_nmtp,efbid,eflie(s_umlb),efbiao,efwhere,eforder,g_app) then
efall=gysar
if not aibj(efdep,effep) then efall=replace(efall,g_gy&efdep,g_gy&effep)
end if
End Function
'-----------------------------------
'add/edit form
'=efform()
'-----------------------------------
Function efform(effty,effqx,effep,effsn)
dim efdupd
if effty=0 then
ef_ew=ew_sn
ef_el=ep_el
ef_ep=esrfd(0,effep,ew_kj)
ef_sx=effsn
ef_us=e_uer
ef_sn="EF"&aisn(1)
ef_jx=1
ef_xi=0
ef_xy=1
ef_tm=now()
if effqx=1 then
if not ainull(g_u5) then
ef_dx=g_u5
else
ef_dx=0
end if
if not ainull(g_u4) then
ef_sx=g_u4:ef_sn=ef_sx
else
ef_sx=0
end if
else
if not ainull(g_u4) then
ef_dx=g_u4
else
ef_dx=0
end if
if not ainull(g_u3) then
ef_sx=g_u3:ef_sn=ef_sx
else
ef_sx=0
end if
end if
ef_xt=ef_xt&espxx("添加"&i_gg&e_gmc)
else
ef_xt=ef_xt&espxx("修改"&i_gg&e_gmc)
end if
if aibj(s_udus,g_u2) then
ef_ew=0
ef_el=0
ef_ep=esrfd(0,s_udus,ew_kj)
elseif aibj(s_uduk,g_u2) then
ef_ew=ew_sn
ef_el=0
ef_ep=esrfd(0,s_uduk,ew_kj)
end if

efdupd=esupcc(esrfd(0,ef_ep,ew_kj),ef_sn)
efform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
if effqx=1 then
efform=efform&icflsr(5,"标题","","bt","",0,200,"*请输入"&s_udefs&"标题","f-a|f-b|f-c",ef_bt)&icflsr(25,"编码","","sn","",3,50,"*仅限英文(小写)和数字用","f-a|f-b|f-c",ef_sn)&icflxz(25,"状态","xy","","","f-s",ef_xy,0,i_bxy)
else
efform=efform&icflsr(10,"标题","","bt","",0,200,"*请输入"&s_udefs&"标题","f-a|f-b|f-c",ef_bt)&aiinput("hidden","sn","",0,0,"","",ef_sn)&aiinput("hidden","xy","",0,0,"","",ef_xy)
end if
efform=efform&icflsr(5,"简介","","ot","",0,200,"请简单介绍一下"&s_udefs&"的主要内容或亮点，也可以直接输入网址，如["&w_mour&"]或["&i_dir&"index.html]","f-a|f-b|f-c",ef_ot)&icflsr(25,"我顶","","xi","",6,50,""&s_udefs&"我顶次数","f-a|f-b|f-c",ef_xi)&icflsr(25,"用户","","us","",66,50,"*","f-a|f-b|f-c",ef_us)
if effqx=1 then
if effty=1 then
efform=efform&icflot(10,"上级",efselect(1,0,"sx",esrfd(0,ef_ep,ew_kj),ef_sx))
else
efform=efform&icflot(10,"上级",efselect(2,0,"sx",esrfd(0,ef_ep,ew_kj),ef_sx))
end if
else
efform=efform&aiinput("hidden","sx","",0,0,"","",ef_sx)
end if
if effqx=1 then efform=efform&icflot(10,"图标",aiinput("","up","",0,200,"显示在列表页面"&s_udefs&"说明处的图片","f-up",ef_up)&esup("0|0|"&ef_sn&"|"&efdupd&"|0|AsaiForm|up|7|"&ew_ps&"|0|0.ees"))
efform=efform&icflot(10,"内容",esedit(esnr(ef_nr),"nr",2))
if effqx=1 then
efform=efform&icflsr(25,"时间","","tm","",99,200,"添加时间","f-a|f-b|f-c",ef_tm)
if aibj(s_udbb,g_u2) then
efform=efform&icflot(25,"网站",ewselect(0,ef_ew))&icflot(25,"频道",epselect(esrfd(0,ef_ep,ew_kj)))&icflot(25,"类型",aiselect("el","","","",ef_el,"",i_bbbel))
elseif aibj(s_udus,g_u2) then
efform=efform&icflot(25,"网站",replace(ewselect(0,ef_ew),"</select>","<option selected=""selected"" value=""0"">"&s_uduss&"中心</option></select>"))&icflot(25,"频道",replace(epselect(esrfd(0,ef_ep,ew_kj)),"</select>","<option selected=""selected"" value="""&esrfd(0,ef_ep,ew_kj)&""">"&s_uduss&"频道</option></select>"))&icflot(25,"类型",replace(elselect(ef_el),"</select>","<option selected=""selected"" value=""0"">"&s_uduss&"系统</option></select>"))
elseif aibj(s_uduk,g_u2) then
efform=efform&icflot(25,"网站",ewselect(0,ef_ew))&icflot(25,"频道",replace(epselect(esrfd(0,ef_ep,ew_kj)),"</select>","<option selected=""selected"" value="""&esrfd(0,ef_ep,ew_kj)&""">"&s_uduks&"频道</option></select>"))&icflot(25,"类型",replace(elselect(ef_el),"</select>","<option selected=""selected"" value=""0"">"&s_uduks&"系统</option></select>"))
else
efform=efform&icflot(25,"网站",ewselect(0,ef_ew))&icflot(25,"频道",epselect(esrfd(0,ef_ep,ew_kj)))&icflot(25,"类型",elselect(ef_el))
end if
efform=efform&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script>"
if effty=1 then efform=efform&icflsr(25,"顶级","","dx","",0,200,"*","f-a|f-b|f-c",ef_dx)&icflsr(25,"级深","","jx","",6,50,"分类级深","f-a|f-b|f-c",ef_jx)&icflsr(5,"内序","","xx","",0,200,"*","f-a|f-b|f-c",ef_xx)&"</li>"
efform=efform&"</ul><ul>"&icflot(10,"点评",eseditxt(ef_xt,"xt",1))
else
efform=efform&aiinput("hidden","xi","",0,0,"","",ef_xi)&aiinput("hidden","ew","",0,0,"","",ef_ew)&aiinput("hidden","tm","",0,0,"","",ef_tm)&aiinput("hidden","us","",0,0,"","",ef_us)&aiinput("hidden","dx","",0,0,"","",ef_dx)&aiinput("hidden","jx","",0,0,"","",ef_jx)&aiinput("hidden","xx","",0,0,"","",ef_xx)&aiinput("hidden","xt","",0,0,"","",ef_xt)
end if
efform=efform&icflot(10,"验证",eskyx(1,2,2))
if effty=1 then
efform=efform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",ef_id)&aiinput("hidden","y_ep","",0,0,"","",ef_ep)&aiinput("hidden","y_sn","",0,0,"","",ef_sn)&aiinput("hidden","y_jx","",0,0,"","",ef_jx)&aiinput("hidden","y_dx","",0,0,"","",ef_dx)&aiinput("hidden","y_sx","",0,0,"","",ef_sx)&aiinput("hidden","y_xx","",0,0,"","",ef_xx)&aibutton(1,"","","f-sb f-skx",s_ztcz)&"<input type=""checkbox"" name=""lian"" value=""1""> 联动处理(修改编码的时候建议启用)")
elseif effty=0 then
efform=efform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
efform=efform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=efadd()
'-----------------------------------
Function efadd(effqx,effep,effsn)
ew_bt=s_umtjs&s_udefs&","&ew_bt:ew_zt=s_umtjs&s_udefs&","&ew_zt:ew_nr=s_umtjs&s_udefs&","&ew_nr:ew_cp=e_uer&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_udefs&"</a></li>"
e_mt=esbts(d_sefsx,s_udlef,s_umtjs&s_udefs&g_gy&e_lj1,s_udefs&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("bt,sn,sx") then
if gyscc(efbid,efbiao,"ef_sn='"&aireq("sn")&"' and ef_ew="&aireq("ew")&"") then
e_ma=e_ma&aigo(s_umtjs&s_udefs&s_ztsb,1)
else
dim rqsn,rqsx
dim rddx,rdjx,rdxx
rqsn=aireq("sn")
rqsx=aireq("sx")
'more tree
if rqsx<>"" and rqsx<>"0" then
Call saik(rs,"select top 1 ef_bt,ef_dx,ef_sx,ef_sn,ef_jx,ef_xx from "&efbiao&" where ef_sx='"&rqsx&"' or ef_sn='"&rqsx&"' order by ef_xx desc",1,1)
If rs.BOF And rs.EOF Then
else
Do While Not rs.EOF
rddx=rs("ef_dx")
rdjx=aiint(rs("ef_jx"))
rdxx=rs("ef_xx")
if rddx="0" or rdjx=1 then
rdjx=2
rdxx=rdxx&"001"
rddx=rs("ef_sn")
if rqsn="" then rqsn=rddx&"001"
elseif rqsx=rs("ef_sn") then
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
Call saik(rs,"select top 1 ef_xx from "&efbiao&" where ef_dx='0' order by ef_xx desc",1,1)
If rs.BOF And rs.EOF Then
else
Do While Not rs.EOF
rdxx=rs("ef_xx")
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
Call saik(rs,"select "&eflie("all")&" from "&efbiao&" where (ef_sn='"&rqsn&"' and ef_ep='"&esrfd(0,aireq("ep"),ew_kj)&"') or (ef_us='"&e_uer&"' and ef_bt='"&aireq("bt")&"' and ef_ep='"&esrfd(0,aireq("ep"),ew_kj)&"')",1,3)
If rs.BOF And rs.EOF Then
rs.addnew
rs("ef_ew")=aiint(aireq("ew"))
rs("ef_el")=aiint(aireq("el"))
rs("ef_ep")=esrfd(0,aireq("ep"),ew_kj)
rs("ef_us")=aireq("us")
rs("ef_up")=aireq("up")
rs("ef_sx")=rqsx
rs("ef_dx")=rddx
rs("ef_jx")=rdjx
rs("ef_xx")=rdxx
rs("ef_sn")=rqsn
rs("ef_bt")=aireq("bt")
rs("ef_ot")=aireq("ot")
rs("ef_nr")=aireq("nr")
rs("ef_xt")=aireq("xt")
rs("ef_xy")=aiint(aireq("xy"))
rs("ef_xi")=aiint(aireq("xi"))
rs("ef_tm")=aireq("tm")
rs.update
else
e_ma=e_ma&aigo(s_umtjs&s_udefs&s_ztsb,1)
Exit Function
end if
Call saig(rs)
'do app
e_ma=e_ma&aitiao(s_umtjs&s_udefs&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udef&g_apj))
end if
else
e_ma=e_ma&aigo(s_umtjs&s_udefs&s_ztsb,1)
end if
else
e_ma=efform(0,effqx,effep,effsn)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=efedit()
'-----------------------------------
Function efedit(effqx)
ew_bt=s_umxgs&s_udefs&","&ew_bt:ew_zt=s_umxgs&s_udefs&","&ew_zt:ew_nr=s_umxgs&s_udefs&","&ew_nr:ew_cp=e_uer&","&ew_cp
dim rqsn,rqsx,rdjxl
dim rddx,rdjx,rdxx
dim rqtx
dim efscid,eflwhere,ailwhere,efscep,efscsn,efscjx,efscdx,efscsx,efscxx
Dim rsnum,sqlef
if aibj(g_u0,s_umgl) then
efscid=aiint(g_u4)
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udef&g_urg&ep_sn&g_urg&s_umxg&g_urg&efscid&g_urz,77)&""">"&s_umxgs&s_udefs&"</a></li>"
else
efscid=aiint(g_u3)
e_wl=e_wl&"<li><a href="""&eshref(s_udef&g_urg&ep_sn&g_urg&s_umxg&g_urg&efscid&g_urz,77)&""">"&s_umxgs&s_udefs&"</a></li>"
end if

if esky(1,e_gdj) then
if aireqx("bt,sn,sx") then
efscid=aiint(aireq("id"))
efscep=aireq("y_ep")
efscsn=aireq("y_sn")
efscjx=aiint(aireq("y_jx"))
efscdx=aireq("y_dx")
efscsx=aireq("y_sx")
efscxx=aireq("y_xx")
rqsx=aireq("sx")
rqsn=aireq("sn")
rqtx=aireq("tx")
'if efscsn=rqsx or efscsx=rqsn or left(rqsx,len(efscsx))=efscsx or left(efscsx,len(rqsx))=rqsx or left(efscsx,len(rqsn))=rqsn or left(efscsn,len(rqsx))=rqsx then
if efscsn=rqsx or efscsx=rqsn then
e_ma=e_ma&aigo(s_umxgs&s_udefs&s_ztsb,1)
Exit Function
elseif rqsx=efscsx then
rdxx=efscxx
rddx=efscdx
rdjx=efscjx
elseif rqsx="" or rqsx="0" then
rddx="0"
rdjx="1"
Call saik(rs,"select top 1 ef_xx from "&efbiao&" where ef_dx='0' order by ef_xx desc",1,1)
If rs.BOF And rs.EOF Then
rdxx="000001-"
else
Do While Not rs.EOF
rdxx=rs("ef_xx")
rdxx=right("000000"&aixn(aixn(left(rdxx,6),1)+1,0),6)&"-"
exit do
rs.movenext
Loop
end if
Call saig(rs)
else
if aibj(rqtx,"1") then
sqlef="select top 1 ef_bt,ef_dx,ef_sx,ef_sn,ef_jx,ef_xx from "&efbiao&" where ef_sn='"&rqsx&"' and ef_ep='"&esrfd(0,aireq("ep"),ew_kj)&"' order by ef_xx desc"
else
sqlef="select top 1 ef_bt,ef_dx,ef_sx,ef_sn,ef_jx,ef_xx from "&efbiao&" where (ef_sx='"&rqsx&"' or ef_sn='"&rqsx&"') and ef_ep='"&esrfd(0,aireq("ep"),ew_kj)&"' order by ef_xx desc"
end if
Call saik(rs,sqlef,1,1)
If rs.BOF And rs.EOF Then
else
Do While Not rs.EOF
rddx=rs("ef_dx")
rdjx=aiint(rs("ef_jx"))
rdxx=rs("ef_xx")
if rqtx="1" then
rdxx=rdxx&"SAI"
rqsx=rs("ef_sx")
else
if rddx="0" or rdjx="1" then
rdjx=2
rdxx=rdxx&"001"
rddx=rs("ef_sn")
elseif rqsx=rs("ef_sn") then
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
sqlef="select "&eflie("all")&" from "&efbiao&" where ef_id="&aiint(aireq("id"))&" or (ef_id<>"&aiint(aireq("id"))&" and ef_sn='"&rqsn&"')"
Call saik(rs,sqlef,1,3)
rsnum=rs.recordcount
if rsnum=1 then
rs("ef_ew")=aiint(aireq("ew"))
rs("ef_el")=aiint(aireq("el"))
rs("ef_ep")=esrfd(0,aireq("ep"),ew_kj)
rs("ef_us")=aireq("us")
rs("ef_up")=aireq("up")
rs("ef_sx")=rqsx
rs("ef_dx")=rddx
rs("ef_jx")=rdjx
rs("ef_xx")=rdxx
rs("ef_sn")=rqsn
rs("ef_bt")=aireq("bt")
rs("ef_ot")=aireq("ot")
rs("ef_nr")=aireq("nr")
rs("ef_xt")=aireq("xt")
rs("ef_xy")=aiint(aireq("xy"))
rs("ef_xi")=aiint(aireq("xi"))
rs("ef_tm")=aireq("tm")
rs.update
else
e_ma=e_ma&aigo(s_umxgs&s_udefs&s_ztsb,1)
Exit Function
end if
Call saig(rs)

'编辑保存
if rqsn<>efscsn or rqsx<>efscsx or not aibj(efscep,aireq("ep")) then
sqlef="select ef_sx,ef_dx,ef_jx,ef_xx from "&efbiao&" where ef_xx like '"&efscxx&"%' and ef_sn<>'"&rqsn&"' and ef_ep='"&esrfd(0,aireq("ep"),ew_kj)&"' order by ef_xx desc"
Call saik(rs,sqlef,1,3)
while not rs.eof 
if rqsn<>efscsn then'edit sn
if rs("ef_sx")=efscsn then rs("ef_sx")=rqsn
end if
rs("ef_xx")=rdxx&right(rs("ef_xx"),len(rs("ef_xx"))-len(efscxx))
rdjxl=aiint(rs("ef_jx"))+rdjx-efscjx
rs("ef_jx")=rdjxl
if (rddx="0" or rdjx="1") and rdjxl=2 then
rs("ef_dx")=rqsn
else
rs("ef_dx")=rddx
end if
rs.update
rs.movenext 
wend 
Call saig(rs)
'lian-----------0
if aireq("lian")="1" then
if not aibj(efscep,aireq("ep")) then
eflwhere=",ef_ep='"&aireq("ep")&"'"
ailwhere=",ai_ep='"&aireq("ep")&"'"
else
eflwhere=""
ailwhere=""
end if
if rqsn<>efscsn and ep_ef<2 then
if aibj(rddx,"0") then
Call gysgx(w_dbqz&"ef","ef_dx='"&rqsn&"'"&eflwhere,"ef_dx='"&efscsn&"'")
Call gysgx(w_dbqz&"ef","ef_sx='"&rqsn&"'"&eflwhere,"ef_sx='"&efscsn&"'")
end if
if gysgx(w_dbqz&"ai","ai_ef='"&rqsn&"'"&ailwhere,"ai_ef='"&efscsn&"'") then e_ma=e_ma&"内容已更新"'处理内容分类编码更换,内容太多速度会比较慢。
elseif eflwhere<>"" then
if aibj(rddx,"0") then
Call gysgx(w_dbqz&"ef",replace(eflwhere,",",""),"ef_dx='"&efscsn&"' or ef_sx='"&efscsn&"'")
end if
if gysgx(w_dbqz&"ai",replace(ailwhere,",",""),"ai_ef='"&efscsn&"'") then e_ma=e_ma&"内容已更新"'处理内容分类编码更换,内容太多速度会比较慢。
end if
end if
'lian-----------1
'ok
end if

'完成
e_ma=e_ma&aitiao(s_umxgs&s_udefs&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udef&g_apj))
else
e_ma=e_ma&aigo(s_umxgs&s_udefs&s_ztsb,1)
end if
'edit form
else
if effqx=1 then
efwhere="ef_id="&aiint(g_u4)&""
else
efwhere="ef_id="&aiint(g_u3)&" and ef_us='"&e_uer&"'"
end if
if gysread(eflie("all"),efbiao,efwhere,"") then
if effqx=1 then
e_mt=esbts(d_sefsx,s_udlef,s_umxgs&s_udefs&g_gy&eshref(s_umgl&g_urg&s_udef&g_urg&ep_sn&g_urg&s_umxg&g_urg&g_u4&g_urz,77),s_umtjs&s_udefs&g_gy&e_lj1&g_gx&s_udefs&s_umlbs&g_gy&e_lj0)
else
e_mt=esbts(d_sefsx,s_udlef,s_umxgs&s_udefs&g_gy&eshref(s_udef&g_urg&ep_sn&g_urg&s_umxg&g_urg&g_u4&g_urz,77),s_umtjs&s_udefs&g_gy&e_lj1&g_gx&s_udefs&s_umlbs&g_gy&e_lj0)
end if
ew_bt=ef_bt&","&ew_bt:ew_zt=ef_bt&","&ew_zt:ew_nr=ef_bt&","&ew_nr
e_ma=efform(1,effqx,ef_ep,ef_sx)&e_ma
else
e_ma=e_ma&aigo(s_udefs&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=efdel()
'-----------------------------------
Function efdel(effqx)
ew_bt=s_udefs&s_umscs&","&ew_bt:ew_zt=s_udefs&s_umscs&","&ew_zt:ew_nr=s_udefs&s_umscs&","&ew_nr:ew_cp=e_uer&","&ew_cp
if effqx=1 then
efwhere="ef_id="&aiint(g_u4)
e_wl=e_wl&"<li class=""active"">"&s_udefs&s_umscs&"</li>"
else
efwhere="ef_us='"&e_uer&"' and ef_xy<2 and ef_id="&aiint(g_u3)
e_wl=e_wl&"<li><a href="""&eshref(s_udef&g_urg&ep_sn&g_urg&d_sefls&g_urz,77)&""">"&ef_bt&"</a></li><li class=""active"">"&s_udefs&s_umscs&"</li>"
end if
e_mt=esbts(d_sefsx,s_udlef,s_umscs&s_udefs,s_umtjs&s_udefs&g_gy&e_lj1&g_gx&s_udefs&s_umlbs&g_gy&e_lj0)
if aibj(g_u3,s_umsc&"-x") then
if aibj(s_umqb,g_u2) then
eawhere=""&esrew("ef",ew_sn)
else
eawhere="ef_ep='"&esrfd(0,g_u2,ew_kj)&"' and "&esrew("ef",ew_sn)
end if
if gysdel(efbid,efbiao,eawhere) then e_ma=e_ma&aitiao(s_udefs&s_umscs&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udef&g_apj))
else
if gysdel(efbid,efbiao,efwhere) then
e_ma=e_ma&aitiao(s_udefs&s_umscs&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udef&g_apj))
else
e_ma=e_ma&aigo(s_udefs&s_umscs&s_ztsb,1)
end if
end if
End Function
'-----------------------------------
'show
'=efshow()
'-----------------------------------
Function efshow(effty)
g_app=esapm(0,s_udef&g_apj&"F_"&g_u2)
if gysread(eflie("all"),efbiao,"ef_sn='"&aistr(g_u2)&"' and ef_xy>0",g_app) then
ew_bt=ef_bt&","&ew_bt:ew_zt=ef_bt&","&ew_zt:ew_nr=ef_bt&","&ew_nr:ew_cp=ef_bt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_udef&g_urg&ep_sn&g_urg&s_umxx&g_urg&ef_sn&g_urz,1)&""">"&s_udefs&s_umxxs&"</a></li>"
dim efdsx,efdpur,efdpg,efdmm,efdxg
if ainull(g_u3) then
efdpg=1
else
efdpg=aiint(g_u3)
end if
efdmm=g_u4
if aibj(e_uer,ef_us) and aiint(ef_xy)<2 then efdxg=g_gx&"[编辑]"&g_gy&eshref(s_udef&g_urg&ep_sn&g_urg&s_umxg&g_urg&ef_id&g_urz,77)
if effty=1 then
e_mt=esbts(efdsx,s_udlef,s_udefs&s_umxxs&g_gy&eshref(s_udef&g_urg&ep_sn&g_urg&s_umxx&g_urg&ef_sn&g_urz,77),"添加子"&s_udefs&g_gy&eshref(s_udef&g_urg&ep_sn&g_urg&s_umtj&g_urg&ef_sn&g_urz,77)&g_gx&s_umtjs&s_udefs&g_gy&e_lj1&g_gx&s_udefs&s_umlbs&g_gy&e_lj0&g_gx&s_umzss&s_udefs&g_gy&eshref(s_udef&g_urg&ep_sn&g_urg&s_umzs&g_urg&ef_sn&g_urz,77)&efdxg)
efdpur=eshref(s_udef&g_urg&ep_sn&g_urg&s_umxx&g_urg&g_gp&g_urg&efdmm&g_urz,77)
else
e_mt=esbts(efdsx,s_udlef,s_umzss&s_udefs&g_gy&eshref(s_udef&g_urg&ep_sn&g_urg&s_umzs&g_urg&ef_sn&g_urz,77),"添加子"&s_udefs&g_gy&eshref(s_udef&g_urg&ep_sn&g_urg&s_umtj&g_urg&ef_sn&g_urz,77)&g_gx&s_umtjs&s_udefs&g_gy&e_lj1&g_gx&s_udefs&s_umlbs&g_gy&e_lj0&g_gx&s_udefs&s_umxxs&g_gy&eshref(s_udef&g_urg&ep_sn&g_urg&s_umxx&g_urg&ef_sn&g_urz,77)&efdxg)
efdpur=eshref(s_udef&g_urg&ep_sn&g_urg&s_umzs&g_urg&g_gp&g_urg&efdmm&g_urz,77)
end if
icdcb=ef_bt
if not ainull(ef_ot) and not aibj(ef_ot,"0") then icdcb=icdcb&"<small>"&ef_ot&"</small>"
'--------------------------------HENG 0
icdcd=s_udefs&"状态："&aiarr(i_bxy,"|",aiint(ef_xy))
icdcd=icdcd&estms(1,ef_tm)
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdci=esnrgys(esnr(ef_nr),efdpur,efdpg)
'--------------------------------CONTENT 1
if icskg(ew_pj,ep_pj,0) then icdcm="<div class=""c-l"">"&eshi(3,ef_id,ef_xi)&"</div>"
'icnr(icdty=0标题|1,icddm=短名,icdcb=标题,icdcc=摘要,icdcd=横条备注,icdcf=左侧封面图,icdcg=右侧备注,icdci=内容,icdcj=媒体展示,icdcm=点评分享区)
icdty=9
e_ma=e_ma&icnr(icdty,icddm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
e_ma=e_ma&espl(902345,s_udefs,eshref(s_udef&g_urg&ep_sn&g_urg&s_umxx&g_urg&ef_sn&g_urz,77),ef_id,ef_xt,efbiao,"ef_xt","ef_id","")
'--------------------------------LIST 0
if (ef_dx="0" or ainull(ef_dx)) and effty=1 then
if gystop(i_nmtp,efbid,eflie(s_umlb),efbiao,"(ef_dx='"&ef_sn&"' or ef_sn='"&ef_sn&"') and ef_xy>0 and ef_ep='"&esrfd(0,ep_sn,ew_kj)&"'",efordermo,"") then
e_ma=e_ma&"<div class=""c-h"">分类</div><div class=""c-i"">"
e_ma=e_ma&icmenushow(ep_sx,"",gysar,ef_sn,21,0,14,28,"1|0")
e_ma=e_ma&"</div>"
end if
end if
'--------------------------------LIST 1
else
e_ma=e_ma&aigo(s_udefs&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=eflist()
'-----------------------------------
Function eflist(effqx,effep)
dim efllists,efdep,efdmore
efdep=esrfd(0,effep,ew_kj)
ew_bt=s_udefs&s_umlbs&","&ew_bt:ew_zt=s_udefs&s_umlbs&","&ew_zt:ew_nr=s_udefs&s_umlbs&","&ew_nr:ew_cp=e_uer&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_udef&g_urg&effep&g_urg&d_sefls&g_urz,66)&""">"&s_udefs&s_umlbs&"</a></li>"
'do link
dim eflpg,eflps,eflpuq,eflpuh,eflpur,eflgrr,eflms,eflpum,efdotl
if effqx=1 then
eflpum=77
eflpuq=s_umgl&g_urg&s_udef&g_urg&effep
eflms=g_u3
eflpuh=g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10
eflpur=eshref(eflpuq&g_urg&eflms&g_urg&g_gp&g_urg&g_gp&g_urg&eflpuh&g_urz,eflpum)
eflpg=aiint(g_u4)
eflps=aiint(g_u5)
else
eflpum=66
eflpuq=s_udef&g_urg&effep
eflms=g_u2
eflpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
eflpur=eshref(eflpuq&g_urg&eflms&g_urg&g_gp&g_urg&g_gp&g_urg&eflpuh&g_urz,eflpum)
eflpg=aiint(g_u3)
eflps=aiint(g_u4)
end if
if effqx=1 and e_gdj>2 then
efdmore="<i>"&s_umtjs&s_udefs&"</i>"&g_gy&eshref(eflpuq&g_urg&s_umtj&g_urz,eflpum)
else
efdmore=""
end if
e_mt=esbts(d_sefsx,s_udlef,s_udefs&s_umlbs&g_gy&e_lj0,efdmore)
if aibj(left(eflms,len(s_umds&"-m")),s_umds&"-m") then
efdotl="1|0||1"
'efdotl="3|0||1"
else
efdotl="1|0||1"
end if
if ainull(eflms) then eflms=d_sefls
'list top
if effqx=1 then
iclls=icliqls(2,eflms,eshref(eflpuq&g_urg&g_gg&g_urg&g_urg&g_urg&eflpuh&g_urz,eflpum))
else
iclls=icliqls(1,eflms,eshref(eflpuq&g_urg&g_gg&g_urg&g_urg&g_urg&eflpuh&g_urz,eflpum))
end if
Call efsers()
e_mz=e_mz&icliq(iclls,eflpuq&g_urg&eflms,eflpuh,e_gdj,effqx,"ef")
Call efsersql(effep)

if aibj(eflms,s_umds&"-xa") or aibj(eflms,s_umds&"-xb") then
if ainull(effep) or aibj(effep,s_umqb) then
e_mz=e_mz&ictreexx(eflms,g_u11,"ef","")
else
e_mz=e_mz&ictreexx(eflms,g_u11,"ef","ef_ep='"&efdep&"'")
end if
else
if aibj(left(eflms,len(s_umds)),s_umds) or aibj(left(eflms,len(s_umxs)),s_umxs) or aibj(eflms,s_umlb&"-s") then
if eflps<1 then eflps=i_nmlb
if not ainull(efwhere) then efwhere=efwhere&" and "
efwhere=efwhere&"ef_dx='0'"
elseif aibj(eflms,s_umlpy) then
if eflps<1 then eflps=i_nmhc
else'aibj(eflms,s_umlb)
if eflps<1 then eflps=i_nmlb
end if

'@@ef_id,1ef_ew,2ef_sx,3ef_dx,4ef_jx,5ef_xx,6ef_sn,7ef_bt,8ef_ot,9ef_up,10ef_tm,11ef_xi,12ef_xy,13ef_ep,14ef_nr
if gyslist(efbid,eflie(s_umlb),efbiao,efwhere,eforder,eflpur,eflpg,eflps,200,"") then
if aibj(left(eflms,len(s_umds)),s_umds) or aibj(left(eflms,len(s_umxs)),s_umxs) then
gysaxbb=split(gysar,g_gx)
efllists=""
for gysibb=0 to ubound(gysaxbb)
if gysibb>0 then efllists=efllists&g_gx
gysaybb=split(gysaxbb(gysibb),g_gy)
if aibj(effep,s_umqb) or ainull(effep) then
if effqx=1 then
efwhere="ef_dx='"&gysaybb(6)&"' or ef_sn='"&gysaybb(6)&"'"
else
efwhere="(ef_dx='"&gysaybb(6)&"' or ef_sn='"&gysaybb(6)&"') and ef_xy>0"
end if
else
if effqx=1 then
efwhere="(ef_dx='"&gysaybb(6)&"' or ef_sn='"&gysaybb(6)&"') and ef_ep='"&efdep&"'"
else
efwhere="(ef_dx='"&gysaybb(6)&"' or ef_sn='"&gysaybb(6)&"') and ef_xy>0 and ef_ep='"&efdep&"'"
end if
end if
if gystop(i_nmtp,efbid,eflie(s_umlb),efbiao,efwhere,efordermo,"") then
if esrfd(1,effep,ew_kj)="1" then gysar=replace(gysar,g_gy&efdep,g_gy&effep)
efllists=efllists&gysar
end if
next
e_mz=e_mz&icmenushow("","",efllists,"",icmenutype(eflms),0,14,28,efdotl)
else
if esrfd(1,effep,ew_kj)="1" then gysar=replace(gysar,g_gy&efdep,g_gy&effep)
e_mz=e_mz&icmenushow("","",gysar,"",icmenutype(eflms),0,14,28,efdotl)
end if
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if
e_mz=e_mz&iclih(gyspage,e_gdj,effqx,eshref(s_umgl&g_urg&s_udef&g_urg&effep&g_urg&s_umsc&"-x"&g_urz,77),"ef")
end if
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=efhrl()
'-----------------------------------
Function efhrl(effty)
effty=aiint(effty)
if effty=1 then
efhrl=s_umlbw
elseif effty=2 then
efhrl=s_umlpw
elseif effty=3 then
efhrl=s_umlpc
elseif effty=4 then
efhrl=s_umlp
elseif effty=5 then
efhrl=s_umlpy
else
efhrl=s_umlb
end if
End Function
'-----------------------------------
'=efsers()
'Call efsers()
'-----------------------------------
Function efsers()
icdssp="排序|浏览|我顶|推荐|时间|内序"
icdrrp=split("ef_xx asc|ef_hi desc|ef_xi desc|ef_xy desc||ef_tm desc|ef_xx asc","|")
icdssf="范围|推荐|"&esqday(0)&"|普通|图片"
if e_gdj>2 then icdssf=icdssf&"|禁用"
icdrrf=split("|ef_xy>1|"&esqday("ef_tm")&"|ef_xy=1|(ef_up<>'' and ef_up<>'0' and ef_up<>'null')|ef_xy=0","|")
icdssx="项目|标题|简介|内容|来自|编码|顶级|时间"
icdrrx=split("ef_bt|ef_bt|ef_ot|ef_nr|ef_us|ef_sn|ef_dx|ef_tm","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=efsersql(effstr)
'-----------------------------------
Function efsersql(effep)
Call icserq()
efwhere=iclwhere
eforder=iclorder
'ep
if not aibj(effep,s_umqb) and not ainull(effep) and not aibj(effep,"0") then
if not ainull(efwhere) then efwhere=" and "&efwhere
efwhere="ef_ep='"&esrfd(0,effep,ew_kj)&"'"&efwhere
end if
'ew
if aiint(ew_sn)>0 and not (aibj(s_udun,effep) or aibj(s_udus,effep)) then
if not ainull(efwhere) then efwhere=" and "&efwhere
efwhere=""&esrew("ef",ew_sn)&efwhere
end if
'order
if ainull(eforder) then eforder=efordermo
'admin
if not aibj(g_u0,s_umgl) then
if not ainull(efwhere) then efwhere=" and "&efwhere
efwhere="ef_xy>0"&efwhere
else
iclapp=1
end if
End Function
%>