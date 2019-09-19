<%
'-----------------------------------
'form list
'=icfl()
'aiinput(aiftype,aifname,aifwid,aifgu,aiflen,aiftit,aifcss,aifstr)
'aiselect(aifname,aifwid,aiftit,aifcss,aifstr,aivalues,aioptions)
'aitext(aifname,aifwid,aifhei,aifgu,aiflen,aiftit,aifcss,aifstr)
'-----------------------------------
Function icflsr(icfmd,icfmc,aiftype,aifname,aifwid,aifgu,aiflen,aiftit,aifcss,aifstr)
'------do ep_zs 0
dim icdyc
if epzsd(aifname,ep_zs) then
if epzsdb=3 then
aifcss="f-a|f-b|f-c"
aiftit=replace("*"&aiftit,"**","*")
icdyc=""
elseif epzsdb=1 then
icdyc=" style=""display:none;"""
else
aiftit=replace(aiftit,"*","")
aifcss="f-c|f-b|f-c"
icdyc=""
end if
if epzsda<>"" then icfmc=epzsda
end if
'------do ep_zs 1
if icfmc<>"" then icfmc="<b>"&icfmc&"：</b>"
if aifcss="" then
if left(aiftit&"1",1)="*" then
aifcss="f-a|f-b|f-c"
else
aifcss="f-c|f-b|f-c"
end if
end if
icflsr="<li class=""sy-c"&icfmd&""""&icdyc&">"&icfmc&"<i>"&aiinput(aiftype,aifname,aifwid,aifgu,aiflen,aiftit,aifcss,aifstr)&"</i></li>"
End Function
Function icflxz(icfmd,icfmc,aifname,aifwid,aiftit,aifcss,aifstr,aivalues,aioptions)
'------do ep_zs 0
dim icdyc
if epzsd(aifname,ep_zs) then
if epzsdb=3 then
aifcss="f-sa"
aiftit=replace("*"&aiftit,"**","*")
icdyc=""
elseif epzsdb=1 then
icdyc=" style=""display:none;"""
else
aiftit=replace(aiftit,"*","")
aifcss="f-s"
icdyc=""
end if
if epzsda<>"" then icfmc=epzsda
end if
'------do ep_zs 1
if icfmc<>"" then icfmc="<b>"&icfmc&"：</b>"
if aifcss="" then
if left(aiftit&"1",1)="*" then
aifcss="f-sa"
else
aifcss="f-s"
end if
end if
icflxz="<li class=""sy-c"&icfmd&""""&icdyc&">"&icfmc&"<i>"&aiselect(aifname,aifwid,aiftit,aifcss,aifstr,aivalues,aioptions)&"</i></li>"
End Function
Function icflwb(icfmd,icfmc,aifname,aifwid,aifhei,aifgu,aiflen,aiftit,aifcss,aifstr)
'------do ep_zs 0
dim icdyc
if epzsd(aifname,ep_zs) then
if epzsdb=3 then
aifcss="f-ax|f-bx|f-cx"
aiftit=replace("*"&aiftit,"**","*")
icdyc=""
elseif epzsdb=1 then
icdyc=" style=""display:none;"""
else
aiftit=replace(aiftit,"*","")
aifcss="f-cx|f-bx|f-cx"
icdyc=""
end if
if epzsda<>"" then icfmc=epzsda
end if
'------do ep_zs 1
if icfmc<>"" then icfmc="<b>"&icfmc&"：</b>"
if aifcss="" then
if left(aiftit&"1",1)="*" then
aifcss="f-ax|f-bx|f-cx"
else
aifcss="f-cx|f-bx|f-cx"
end if
end if
icflwb="<li class=""sy-c"&icfmd&""""&icdyc&">"&icfmc&"<i>"&aitext(aifname,aifwid,aifhei,aifgu,aiflen,aiftit,aifcss,aifstr)&"</i></li>"
End Function
Function icflot(icfmd,icfmc,aifstr)
if not ainull(aifstr) then
dim icdyc
icdyc=""
if icfmc="验证" then
if instr(aifstr,"*")>0 then
if instr(aifstr,g_ckks&"kz")=0 then
icdyc=" style=""display:none;"""
else
icdyc=""
icfmc="空值选项"
end if
else
icdyc=" style=""clear:both;"""
end if
end if
if icfmc<>"" then icfmc="<b>"&icfmc&"：</b>"
icflot="<li class=""sy-c"&icfmd&""""&icdyc&">"&icfmc&"<i>"&aifstr&"</i></li>"
end if
End Function
'-----------------------------------
'list list&pic show
'=icliqls()
'-----------------------------------
Function icliqls(icfty,icfms,icflj)
if icskg(ew_lm,ep_lm,0) then
if icfty=5 then
icliqls=""&replace(aiselect("liststyle","","","f-cy b-cq",icfms,s_umlb&"|"&s_umlbw&"|"&s_umlp&"|"&s_umlpy&"|"&s_umlpw&"|"&s_umlpc,s_umlbs&"|"&s_umlbws&"|"&s_umlps&"|"&s_umlpys&"|"&s_umlpws&"|"&s_umlpcs),"<select","<select onchange=""window.location='"&split(icflj,g_gg)(0)&"'+this.value+'"&split(icflj&g_gg,g_gg)(1)&"';""")
elseif icfty=1 or icfty=2 then
dim icldsn,icldmc
icldsn=icldsn&""&s_umlb&"-s|"&s_umlb&"|"&s_umds&"|"&s_umds&"-k"&"|"&s_umds&"-g"&"|"&s_umds&"-m1"
if e_gdj>2 and icfty=2 then icldsn=icldsn&"|"&s_umds&"-xa|"&s_umds&"-xb"
icldsn=icldsn&"|"&s_umxs&"|"&s_umxs&"-k"&"|"&s_umxs&"-g|"&s_umlpy
icldmc=icldmc&"主题列表|　全部展示|树形展示|　展开树形|　闭合树形|　梯田展示"
if e_gdj>2 and icfty=2 then icldmc=icldmc&"|　重排树枝|　树枝重置"
icldmc=icldmc&"|"&s_umxss&"展示|　展开小树|　闭合小树|"&s_umlpys&"展示"
'response.Write icldsn&"<br />"&icldmc&"<br />"
icliqls=""&replace(aiselect("liststyle","","","f-cy b-cq",icfms,icldsn,icldmc),"<select","<select onchange=""window.location='"&split(icflj,g_gg)(0)&"'+this.value+'"&split(icflj&g_gg,g_gg)(1)&"';""")
else
icliqls=""&replace(aiselect("liststyle","","","f-cy b-cq",icfms,s_umlb&"|"&s_umlbw&"|"&s_umlp&"|"&s_umlpy&"|"&s_umlpw&"|"&s_umlpc,s_umlbs&"|"&s_umlbws&"|"&s_umlps&"|"&s_umlpys&"|"&s_umlpws&"|"&s_umlpcs),"<select","<select onchange=""window.location='"&split(icflj,g_gg)(0)&"'+this.value+'"&split(icflj&g_gg,g_gg)(1)&"';""")
end if
end if
End Function
'-----------------------------------
'=icserr(icfrs)
'-----------------------------------
Function icserr(icfrs)
'0ssp/1ssf/2ssx/3ssm/4sss
icvrr=split(icfrs&g_urg&g_urg&g_urg&g_urg,g_urg)
icvsp=aiint(icvrr(0))
icvsf=aiint(icvrr(1))
icvsx=aiint(icvrr(2))
icvsm=aiint(icvrr(3))
icvss=airet(aijie(aistr(icvrr(4))))
End Function
'-----------------------------------
'=icser(icfstr,icfrs)
'-----------------------------------
Function icser(icfstr,icfrs)
Call icserr(icfrs)
if aibj(g_u0,s_umgl) or icskg(ew_sp,ep_sp,0) then
if aibj(aireq(s_fmyms),s_fmyz) then
'0ssp/1ssf/2ssx/3ssm/4sss
if aibj(aireq("sss"),icvss) and aibj(aireq("ssx"),icvsx) and aibj(aireq("ssm"),icvsm) and aibj(aireq("ssf"),icvsf) and aibj(aireq("ssp"),icvsp) then
else
dim sssx
if aibj(aireq("sss"),s_ztks) then
sssx=""
else
sssx=aijia(aireq("sss"))
end if
response.Redirect(eshref(icfstr&g_urg&"0"&g_urg&"0"&g_urg&aireq("ssp")&g_urg&aireq("ssf")&g_urg&aireq("ssx")&g_urg&aireq("ssm")&g_urg&sssx&g_urz,11))
end if
'this is search form
else
icser=icser&"<form role=""form"" id=""AsaiFormSearch"" name=""AsaiFormSearch"" action="""" method=""post"" class=""tr"">"
if aibj(g_u0,s_umgl) or ep_sp>3 then icser=icser&""&aiselect("ssp","","","f-cy",icvsp,"0",icdssp)&""
if aibj(g_u0,s_umgl) or ep_sp>4 then icser=icser&""&aiselect("ssf","","","f-cy",icvsf,"0",icdssf)&""
if aibj(g_u0,s_umgl) or ep_sp>3 then icser=icser&""&aiselect("ssx","","","f-cy",icvsx,"0",icdssx)&""
if aibj(g_u0,s_umgl) or ep_sp>4 then icser=icser&""&aiselect("ssm","","","f-cy",icvsm,"0",icdssm)&""
icser=icser&"<input class=""f-ch"" type=""text"" name=""sss"" size=""12"""
if ainull(icvss) then
icser=icser&" value="""&s_ztks&""""
else
icser=icser&" value="""&icvss&""""
end if
icser=icser&" onBlur=""if(this.value==''){this.value='"&s_ztks&"';}"" onFocus=""if(this.value=='"&s_ztks&"'){this.value='';}"" />"&""
icser=icser&""&aibutton(2,"","","f-sb",s_ztss)&""&aiinput("hidden",s_fmyms,"",0,0,"","",s_fmyz)&"</form>"
end if
end if
End Function
'-----------------------------------
'=icserq()
'-----------------------------------
Function icserq()
g_app=""
iclwhere=""
iclorder=""
if icvsf>0 then
iclwhere=iclwhere&icdrrf(icvsf)
g_app=g_app&"_f"&icvsf
else
g_app=g_app&"_f0"
end if
if not ainull(icvss) then
iclapp=1
if not ainull(iclwhere) then iclwhere=iclwhere&" and "
if aibj(icvsx,"99") then
iclwhere=iclwhere&left(icdrrx(0),3)&"xt like '%!"&icvss&"!%'"
else
Call ekin(icvss)
iclwhere=iclwhere&icdrrx(icvsx)
if icvsm>1 then
iclwhere=iclwhere&"='"&icvss&"'"
else
iclwhere=iclwhere&" like '%"&icvss&"%'"
end if
end if
end if
if icvsp>0 then
iclorder=icdrrp(icvsp)
g_app=g_app&"_p"&icvsp
else
g_app=g_app&"_p0"
end if
End Function
'-----------------------------------
'list do top
'=icliq()
'-----------------------------------
Function icliq(icfls,icfsfq,icfsfh,icfdj,icfty,icfba)
icliq=""
if icfdj>2 and icfty=1 then icliq=icliq&"<script language=""JavaScript"">function eeselectall(action){var eeselectform=document.getElementById(""esindexForm"");for(var eeselecti=0;eeselecti<eeselectform.elements.length;eeselecti++){if(eeselectform.elements[eeselecti].type==""checkbox""){eeselectid=eeselectform.elements[eeselecti];eeselectid.checked=(action==""EESai"")?1:(!eeselectid.checked);}}}</script>"

e_lss=icser(icfsfq,icfsfh)
if icskg(ew_sp,ep_sp,0) or icfty=1 then e_mzs=e_mzs&"<div class=""sy-c2"">"&icfls&"</div>"
if not ainull(e_lss) then e_mzs=e_mzs&"<div class=""sy-c8 tr"">"&e_lss&"</div>"
if not ainull(e_mzs) then e_mzs="<li class=""l-ta"">"&e_mzs&"<div class=""cr""></div></li>"

if icfdj>2 and icfty=1 then
'do list
if esky(1,i_xkyz) and request(s_fmsb)<>"" then
'del
if request(s_fmsb)="删除" and request("sid")<>"" then
if gysdel(icfba&"_id",w_dbqz&icfba,""&icfba&"_id in ("&request("sid")&")") then
icliq=icliq&"<div class=""l-tc"">ID=["&request("sid")&"]已经成功删除！</div>"
end if
'xy
elseif request(s_fmsb)="0" and request("sid")<>"" then
if gysgx(w_dbqz&icfba,""&icfba&"_xy=0",""&icfba&"_id in ("&request("sid")&")") then
icliq=icliq&"<div class=""l-tc"">ID=["&request("sid")&"]的状态已经成功设为[0]！</div>"
end if
elseif request(s_fmsb)="1" and request("sid")<>"" then
if gysgx(w_dbqz&icfba,""&icfba&"_xy=1",""&icfba&"_id in ("&request("sid")&")") then
icliq=icliq&"<div class=""l-tc"">ID=["&request("sid")&"]的状态已经成功设为[1]！</div>"
end if
elseif request(s_fmsb)="2" and request("sid")<>"" then
if gysgx(w_dbqz&icfba,""&icfba&"_xy=2",""&icfba&"_id in ("&request("sid")&")") then
icliq=icliq&"<div class=""l-tc"">ID=["&request("sid")&"]的状态已经成功设为[2]！</div>"
end if
elseif request(s_fmsb)="3" and request("sid")<>"" then
if gysgx(w_dbqz&icfba,""&icfba&"_xy=3",""&icfba&"_id in ("&request("sid")&")") then
icliq=icliq&"<div class=""l-tc"">ID=["&request("sid")&"]的状态已经成功设为[3]！</div>"
end if
elseif request(s_fmsb)="4" and request("sid")<>"" then
if gysgx(w_dbqz&icfba,""&icfba&"_xy=4",""&icfba&"_id in ("&request("sid")&")") then
icliq=icliq&"<div class=""l-tc"">ID=["&request("sid")&"]的状态已经成功设为[4]！</div>"
end if
elseif request(s_fmsb)="5" and request("sid")<>"" then
if gysgx(w_dbqz&icfba,""&icfba&"_xy=5",""&icfba&"_id in ("&request("sid")&")") then
icliq=icliq&"<div class=""l-tc"">ID=["&request("sid")&"]的状态已经成功设为[5]！</div>"
end if
elseif aibj(icfba,"us")  and aireq(s_fmsb)="认证" and aireq("sid")<>"" and trim(aireq("zy"))<>"" then
if gysgx(w_dbqz&icfba,"us_zy="&aiint(aireq("zy"))&"",""&icfba&"_id in ("&aireq("sid")&")") then
icliq=icliq&"<div class=""l-tc"">ID=["&aireq("sid")&"]已经成功认证为["&aiarr(i_buszy,"|",aiint(aireq("zy")))&"]！</div>"
else
icliq=icliq&"<div class=""l-tc"">ID=["&aireq("sid")&"]认证失败！</div>"
end if

elseif aireq(s_fmsb)="批量操作" and request("sid")<>"" and trim(aireq("sbl"))<>"" and aireq("sbz")<>"" then
dim repll,replz,repls,replrr,replrrz,replud,replii
if trim(aireq("pai"))="1" then
repls=trim(aireq("sbl"))&"='"&trim(aireq("sbz"))&"'"
else
replrr=split(trim(aireq("sbl")),"|")
replud=ubound(replrr)
replrrz=split(aireq("sbz"),"|")
repls=""
for replii=0 to replud
repll=replrr(replii)
replz=replrrz(replii)
if left(replz,2)="==" then'字符列
replz=right(replz,len(replz)-2)
repls=repls&repll&"='"&replz&"'"
else
replz=aiint(replz)
repls=repls&repll&"="&replz
end if
if replud>replii then repls=repls&","
next
end if
if gysgx(w_dbqz&icfba,repls,""&icfba&"_id in ("&request("sid")&")") then
icliq=icliq&"<div class=""l-tc"">ID=["&request("sid")&"]批量操作【"&repls&"】已经完成！</div>"
end if
elseif (aibj(icfba,"ef") or aibj(icfba,"bb")) and aireq(s_fmsb)="移动" and trim(aireq("sn"))<>"" and aireq("sid")<>"" then
dim rspl,rmdxx,rmdsn,rmddx,rmdxh,icxpi
Call saik(rspl,"select "&icfba&"_xx,"&icfba&"_sn,"&icfba&"_dx,"&icfba&"_jx,"&icfba&"_sx from "&w_dbqz&icfba&" where "&icfba&"_sn='"&trim(aireq("sn"))&"'",1,1)
rmdxx=rspl(""&icfba&"_xx")
rmdsn=rspl(""&icfba&"_sn")
rmddx=rspl(""&icfba&"_dx")
rmdxh=rspl(""&icfba&"_jx")
Call saig(rspl)
Call saik(rs,"select "&icfba&"_xx,"&icfba&"_sn,"&icfba&"_dx,"&icfba&"_jx,"&icfba&"_sx from "&w_dbqz&icfba&" where "&icfba&"_id in ("&aireq("sid")&")",1,3)
If rs.BOF And rs.EOF Then
else
icxpi=0
Do While Not rs.EOF
icxpi=icxpi+1
rs(""&icfba&"_sx")=rmdsn
rs(""&icfba&"_xx")=rmdxx&right("000"&aixn(icxpi,0),3)
if rmddx="0" then
rs(""&icfba&"_dx")=rmdsn
else
rs(""&icfba&"_dx")=rmddx
end if
if aireq("jx")="1" then
rs(""&icfba&"_jx")=aiint(rmdxh)+1
end if
rs.update
rs.movenext
Loop
End If
Call saig(rs)
icliq=icliq&"<div class=""l-tc"">ID=["&aireq("sid")&"]已经成功移至SN=["&trim(aireq("sn"))&"]下！</div>"
end if
end if
end if
if i_xksc=1 then icliq=icliq&"<div id="""&i_liys&""">"
if icfdj>2 and icfty=1 then icliq=icliq&"<div style=""display:none""><form action="""" id=""esindexForm"" name=""esindexForm"" method=""post""></div>"
End Function
'-----------------------------------
'list canshu
'=iclcs(0|1=no sm,icfel,icfjg,icfjy,icfstr)
'-----------------------------------
Function iclcs(icfty,icfel,icfjg,icfjy,icfstr)
dim icdty
icdty=0
icfel=aiint(icfel)
icfjg=aiint(icfjg)
icfjy=aiint(icfjy)
iclcs=""
if icfel=62 then'人才
if icfty=1 then iclcs=iclcs&"<i>月薪</i>"
icdty=1
if icfjg>0 then iclcs=iclcs&icfjg&"<i>元/月</i>"
if icfjy>0 then iclcs=iclcs&icfjy&"<i>人</i>"
elseif icfel=80 or icfel=82 or icfel=60 then'商品/产品
icdty=1
if icfjy>=icfjg and icfjg>0 then
iclcs=iclcs&icfjg&"<i>元</i>"
if icfjy>0 then iclcs=iclcs&"<i>原价"&icfjy&"元</i>"
elseif icfjy>0 then
iclcs=iclcs&icfjy&"<i>元</i>"
end if
elseif icfel=83 or icfel=65 then'求购
icdty=1
if icfjg>0 and icfjy>icfjg then
iclcs=iclcs&icfjg&"-"&icfjy&"元"
elseif icfjg>0 then
iclcs=iclcs&icfjg&"元<i>起</i>"
elseif icfjy>0 then
iclcs=iclcs&icfjy&"元<i>以内</i>"
end if
elseif icfel=84 or icfel=88 then'订金
if icfty=1 then iclcs=iclcs&"<i>订金</i>"
icdty=1
if icfjg>0 then
iclcs=iclcs&icfjg&"元"
if icfjy>0 then
iclcs=iclcs&"<i>尾款"&icfjy&"元</i>"
else
iclcs=iclcs&"<i>不满意随时可退</i>"
end if
elseif icfjy>0 then
iclcs=iclcs&"<i>订金面议　尾款</i>"&icfjy&"<i>元</i>"
end if
elseif icfel=85 then'定金
if icfty=1 then iclcs=iclcs&"<i>定金</i>"
icdty=1
if icfjg>0 then
iclcs=iclcs&icfjg&"元"
if icfjy>0 then iclcs=iclcs&"<i>尾款"&icfjy&"元</i>"
elseif icfjy>0 then
iclcs=iclcs&"<i>定金面议　尾款</i>"&icfjy&"<i>元</i>"
end if
elseif icfel=86 then'招标
if icfty=1 then iclcs=iclcs&"<i>订金</i>"
icdty=1
if icfjg>0 then
iclcs=iclcs&icfjg&"元"
if icfjy>0 then iclcs=iclcs&"<i>标额"&icfjy&"元</i>"
elseif icfjy>0 then
iclcs=iclcs&"<i>订金面议　标额</i>"&icfjy&"<i>元</i>"
end if
elseif icfel=87 then'悬赏
if icfty=1 then iclcs=iclcs&"<i>赏金</i>"
icdty=1
if icfjg>0 then
iclcs=iclcs&icfjg
if icfjy=0 then
iclcs=iclcs&"<i>枚金币</i>"
elseif icfjy=1 then
iclcs=iclcs&"<i>点经验</i>"
elseif icfjy=2 then
iclcs=iclcs&"<i>元</i>"
end if
end if
else
if not ainull(icfstr) then iclcs=icfstr
end if
if icdty=1 and iclcs="" then iclcs="面议"
End Function
'-----------------------------------
'list page
'=iclisttop()
'-----------------------------------
Function iclisttop(icfms,icfti)
'top------0
if aibj(icfms,s_umlb) then
iclisttop="<div class=""l-sa"">"
if not ainull(icfti) then iclisttop=iclisttop&"<li class=""l-2"">"&icfti&"</li>"
elseif aibj(icfms,s_umlpy) then
iclisttop="<div class=""l-qa"">"
elseif aibj(icfms,s_umlp) then
iclisttop="<div class=""l-pa"">"
else
iclisttop="<div class=""l-ca"">"
end if
'top------1
End Function
Function iclist(icfms,icfti,icfii,icfbt,icftt,icflj,icfgl,icfs1,icfs2,icfs3,icfs4)
iclist=""
'top loop------0
'list
if aibj(icfms,s_umlb) then
if icfii mod 2=0 then
iclist=iclist&"<li class=""l-1"">"
else
iclist=iclist&"<li>"
end if
iclist=iclist&icfgl
iclist=iclist&icfs1
iclist=iclist&"<a href="""&icflj&""" title="""&icftt&""">"&icfbt&"</a>"
iclist=iclist&"</li>"
'yunqian list
elseif aibj(icfms,s_umlpy) then
iclist=iclist&"<li class=""sy-c25"
if icfii mod 2=0 then iclist=iclist&" l-1"
iclist=iclist&""">"
iclist=iclist&icfgl
iclist=iclist&"<a href="""&icflj&""" title="""&icftt&""">"
if not ainull(icfs1) then iclist=iclist&"<div class=""l-qat"">"&icfs1&"</div>"
if icfs2<>"" and icfs2<>g_gg and icfs2<>"　"&g_gg then
if instr(icfs2,g_gg)>0 then
eeslin=split(icfs2,g_gg)
if not ainull(eeslin(1)) then iclist=iclist&"<div class=""l-pbt"">"&eeslin(1)&"</div>"
if not ainull(eeslin(0)) then iclist=iclist&"<div class=""l-pbu"">"&eeslin(0)&"</div>"
else
iclist=iclist&"<div class=""l-pbu"">"&icfs2&"</div>"
end if
end if
iclist=iclist&"<span style="""&esyqs(icfs4)&""">"&icfbt&"</span>"
if not ainull(icfs3) then iclist=iclist&icfs3
iclist=iclist&"</a></li>"
'pic
elseif aibj(icfms,s_umlp) then
iclist=iclist&"<li class=""sy-c25"
if icfii mod 2=0 then iclist=iclist&" l-1"
iclist=iclist&"""><div class=""l-pb"">"
iclist=iclist&icfgl
iclist=iclist&"<a href="""&icflj&""" title="""&icftt&""">"
iclist=iclist&"<div class=""l-pba"">"
if ainull(icfs1) then
iclist=iclist&""
else
iclist=iclist&icfs1
end if
iclist=iclist&"</div>"
iclist=iclist&"<div class=""l-pbi"">"&icfbt&"</div>"
if icfs2<>"" and icfs2<>g_gg and icfs2<>"　"&g_gg then
if instr(icfs2,g_gg)>0 then
eeslin=split(icfs2,g_gg)
if not ainull(eeslin(1)) then iclist=iclist&"<div class=""l-pbt"">"&eeslin(1)&"</div>"
if not ainull(eeslin(0)) then iclist=iclist&"<div class=""l-pbu"">"&eeslin(0)&"</div>"
else
iclist=iclist&"<div class=""l-pbu"">"&icfs2&"</div>"
end if
end if
iclist=iclist&"</a></div></li>"
'other
else
if icfii mod 2=0 then
iclist=iclist&"<li class=""l-1"">"
else
iclist=iclist&"<li>"
end if
'response.Write trim(aitit(icfbt))&"<br>"&icfs1&"<br><br><br><br><br>"
if not ainull(icfs4) and not aibj(icfms,s_umlpc) then iclist=iclist&"<div class=""l-ce"">"&icfs4&"</div>"
if not ainull(trim(aitit(icfbt))) then
iclist=iclist&"<div class=""l-cb lh"">"&icfgl&"<a href="""&icflj&""" title="""&icftt&""">"&icfbt
if not ainull(icfs1) then iclist=iclist&" <i>"&icfs1&"</i>"
iclist=iclist&"</a></div>"
elseif not ainull(icfgl) then
iclist=iclist&"<div class=""l-cb lh"">"&icfgl&"</div>"
end if
if not ainull(icfs3) then iclist=iclist&"<div class=""l-cc lh"">"&icfs3&"</div>"
if not ainull(icfs2) then
iclist=iclist&"<div class=""l-cd lh"""
if aibj(icfms,s_umlpc) and ailen(icfs2)>i_nmzs then iclist=iclist&" style=""max-height:"&i_nmlg&"px;overflow:auto;""  onclick=""this.style.maxHeight='"&i_nmlg*5&"px';"""
iclist=iclist&">"
if not ainull(icfs4) and aibj(icfms,s_umlpc) then iclist=iclist&icfs4
iclist=iclist&replace(icfs2,"[page]","")
iclist=iclist&"</div>"
end if
iclist=iclist&"<div class=cr></div></li>"
end if
'top loop------1
End Function
Function iclistend(icfms,icfti)
'end------0
if aibj(icfms,s_umlpy) then
iclistend="</div>"
elseif aibj(icfms,s_umlp) then
iclistend="<div class=""cr""></div></div>"
elseif aibj(icfms,s_umlb) then
iclistend="</div>"
else
iclistend="</div>"
end if
'end------1
End Function
'-----------------------------------
'list do bottom
'=iclih()
'-----------------------------------
Function iclih(icfpg,icfdj,icfty,icfsc,icfba)
iclih=""
if i_xksc=1 then iclih=iclih&"</div>"&esscor(i_liys,icvss)
if not ainull(icfpg) then iclih=iclih&"<div class=""cr""></div><div class=""y-a"">"&icfpg&"</div>"
if icfdj>2 and icfty=1 then
iclih=iclih&"<div class=""l-h""><input class=""f-sb f-skx"" type=""button"" value=""全选"" onclick=""eeselectall('EESai')""><input class=""f-sb f-skx"" type=""button"" value=""取消"" onclick=""eeselectall()"">"
if not ainull(icfsc) and e_gdj>5 then iclih=iclih&"<input class=""f-sb f-skx"" type=""button"" onclick=""{if(confirm('请确认此操作！')){javascript:window.location.href='"&icfsc&"';return true;}return false;}"" value=""清空"">"
if not ainull(icfsc) and e_gdj>3 then iclih=iclih&"<input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('确定删除选定项吗？')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""删除"">"
if not ainull(icfsc) then iclih=iclih&"<input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('确定操作选定项状态吗？')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""0""><input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('确定操作选定项状态吗？')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""1""><input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('确定操作选定项状态吗？')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""2""><input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('确定操作选定项状态吗？')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""3""><input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('确定操作选定项状态吗？')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""4""><input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('确定操作选定项状态吗？')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""5"">"
if aibj(icfba,"us") and e_gdj>2 then iclih=iclih&aiselect("zy","","","","请选择认证级别",0,i_buszy)&"<input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('确定要执行认证操作吗？')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""认证"">"
if (aibj(icfba,"ef") or aibj(icfba,"bb")) and e_gdj>2 then iclih=iclih&"<input type=""text"" class=""f-d"" name=""sn"" id=""sn"" value="""">"&aiselect("jx","","","","请选择级深调整","1|0","调深度|不调深度")&"<input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('确定要移动吗？')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""移动"">"
if e_gdj>4 then
iclih=iclih&"列名：<input type=""text"" class=""f-d"" name=""sbl"" id=""sbl"" title=""输入当前数据库列的名称，如：ai_px(多个值采用|隔开，开头和结尾不带|)"" value="""">值：<input type=""text"" class=""f-d"" name=""sbz"" id=""sbz"" title=""输入赋值，数字型列直接输入数字，字符列请在赋值前加两个等号==，如：数字型直接输入100，字符型输入==eesai(多个值采用|隔开，开头和结尾不带|)"" value=""""><input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('请再次确定此批量操作')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""批量操作"">"
elseif aibj(icfba,"ai") and e_gdj>2 then
iclih=iclih&"列名：<select name=sbl class=f-s><option value=ai_ef>分类</option><option value=ai_us>会员</option><option value=ai_ep>频道</option></select>值："&aiinput("hidden","pai","",0,0,"","","1")&"<input type=""text"" class=""f-d"" name=""sbz"" id=""sbz"" value=""""><input class=""f-sb f-skx"" type=""submit"" onclick=""{if(confirm('请再次确定此批量操作')){this.document.esindexForm.submit();return true;}return false;}"" name="""&s_fmsb&""" id="""&s_fmsb&""" value=""批量操作"">"
end if
iclih=iclih&eskyx(0,2,2)&"</div></form>"
end if
End Function
'-----------------------------------
'=icggx(esfstr)
'-----------------------------------
Function icggx(esfstr)
dim icggxxp
Set icggxxp=new RegExp'regular expression
icggxxp.IgnoreCase=true'Ignore case
icggxxp.Global=true'Search string matching for all text
icggxxp.Pattern="\##([0-9A-Za-z-]{1,88})\##"'Find gg
icggx=icggxxp.replace(esfstr,"<script language=JavaScript charset=utf-8 src="&i_dir&s_drplug&"AsaiGG/?$1.js></script>")
Set icggxxp=nothing
End Function
'-----------------------------------
'=icgg()read gg
'-----------------------------------
Function icgg(ggfsn,ggfxy,ggfjk,ggfck,ggfcg,ggfbt,ggflj,ggfjg,ggftm,ggft1,ggfty,ggfxx,ggfnr)
icgg=""
ggfxy=aiint(ggfxy)
ggfjk=aiint(ggfjk)
ggfsn=trim(ggfsn)
if ggfxy>0 then
dim ggdvg,ggda1,ggda2
ggfck=aiint(ggfck)
ggfcg=aiint(ggfcg)
ggfjg=aiint(ggfjg)
ggfty=aiint(ggfty)
if ggfck<1 then ggfck="100%"
if ggfcg<1 then ggfcg="auto"
ggdvg=ggfcg
if not isdate(ggftm) then ggftm=now()
if not isdate(ggft1) then ggft1=date()+30
'文字|图片|图文|动画|动文|视频|视文|代码|代文
if ggft1>now() or ggfxy>3 then
if ainull(ggflj) then
ggda1=""
ggda2=""
else
if ggfjk>1 then ggflj=i_dir&s_drplug&"AsaiGG/?"&ggfsn&"-88.html"
ggda1="<a title="&ggfbt&" target=_blank href="&ggflj&">"
ggda2="</a>"
end if
if ggfty=0 then
icgg=icgg&ggda1&ggfbt&ggda2
if not ainull(ggfxx) then icgg=icgg&"<br>"&ggfxx
elseif ggfty=1 or ggfty=2 then
icgg=icgg&ggda1&"<img width="&ggfck&" height="&ggfcg&" src="&ggfxx&">"&ggda2
elseif ggfty=3 or ggfty=4 then
icgg=icgg&"<embed src="&ggfxx&" allowFullScreen=true quality=high width="&ggfck&" height="&ggfcg&" align=middle allowScriptAccess=always type=""application/x-shockwave-flash""></embed>"
elseif ggfty=5 or ggfty=6 then
icgg=icgg&"<object width="&ggfck&" height="&ggfcg&" classid=""CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"">"&_
VbCrlf&"<param name=url value="&ggfxx&" />"&_
VbCrlf&"</object>"
elseif ggfty=7 or ggfty=8 then
icgg=icgg&ggfnr
end if
if ggfty=2 or ggfty=4 or ggfty=6 or ggfty=8 or ggfty=10 then
if ggdvg<>"auto" then ggdvg=ggdvg+20
icgg=icgg&"<br>"&ggda1&ggfbt&ggda2
end if
else
icgg=icgg&"提示：广告于"&ggft1&"到期"
end if
if ggfck<>"100%" then ggfck=ggfck&"px"
if ggdvg<>"auto" then ggdvg=ggdvg&"px"
icgg="<div style=width:"&ggfck&";height:"&ggdvg&";overflow:hidden;clear:both;font-size:12px;text-align:center;>"&icgg&"</div>"
end if
End Function
'-----------------------------------
'=icnr()
'icnr(icdty=0标题|1,icddm=短名,icdcb=标题,icdcc=摘要,icdcd=横条备注,icdcf=左侧封面图,icdcg=右侧备注,icdci=内容,icdcj=媒体展示,icdcm=点评分享区)
'icdty=9
'e_ma=e_ma&icnr(icdty,icddm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
'-----------------------------------
Function icnr(icfty,icfdm,icfcb,icfcc,icfcd,icfcf,icfcg,icfci,icfcj,icfcm)
dim icndlin
icfty=aiint(icfty)
icndlin=""
if not(ainull(icfcb) or icfty=0) then e_mx=e_mx&"<h1 class=""c-b l-0"">"&icfcb&"</h1>"
if not(ainull(icfcd) or icfty<3) then e_mx=e_mx&"<li class=""c-d"">"&icfcd&"</li>"
if not(ainull(icfcc) or icfty<2) then e_mx=e_mx&"<li class=""c-c l-1"">"&icfcc&"</li>"

if not(ainull(icfcf) or icfty<4) and not(ainull(icfcg) or icfty<5) then
icndlin="<div id=""p-sfw"">"&icfcf&"<div id=""p-sfc"">"&icfcg&"</div></div><div class=""crg""></div>"
elseif not(ainull(icfcf) or icfty<4) then
icndlin="<div class=""c-e"">"&icfcf&"</div>"
elseif not(ainull(icfcg) or icfty<5) then
icndlin=icfcg
else
icndlin=""
end if
if not ainull(icndlin) then
e_mx=e_mx&""&icndlin&""
end if

if not(ainull(icfcj) or icfty<7) then
e_mx=e_mx&"<div class=""c-j"">"&icfcj&"</div>"
end if

if not(ainull(icfci) or icfty<8) then e_mz=e_mz&"<div class=""c-i"" id=""AsaiNR"">"&icfci&"</div>"

icnr=icnr&"<div class=""c-a"">"
icnr=icnr&e_mx
if not ainull(e_mzs) then icnr=icnr&"<li class=""c-h"">"&ep_dm&"参数表</li>"&e_mzs&"<div class=crg></div>"

if not ainull(e_mz) then
if not(ainull(icfdm) or icfty<6) and not ainull(icndlin) then
icnr=icnr&"<li class=""c-h"">"
if len(icfdm)>3 then
icnr=icnr&icfdm
else
icnr=icnr&icfdm&"详情"
end if
icnr=icnr&"</li>"
end if
icnr=icnr&e_mz
end if

if not(ainull(icfcm) or icfty<9) then
icnr=icnr&"<div class=""c-i"">"&icfcm&"</div>"
e_mz=e_mz&"<div class=""c-i"">"&icfcm&"</div>"
end if
icnr=icnr&"</div>"
End Function
'-----------------------------------
'=icico(1,"")
'-----------------------------------
Function iccg(icfzs,icfmo)
if right(icfzs,1)="%" or aibj(right(icfzs,2),"px") then
iccg=icfzs
elseif aiint(icfzs)>0 then
iccg=icfzs&"px"
else
iccg=icfmo
end if
End Function
'-----------------------------------
'=iccgx(1,10,12)
'-----------------------------------
Function iccgx(icfty,icfz1,icfz2)
if icfty=1 then
if right(icfz1,1)="%" and right(icfz2,1)="%" then
iccgx=aiint(replace(icfz1,"%",""))+aiint(replace(icfz2,"%",""))
iccgx=iccgx&"%"
else
iccgx=aiint(replace(icfz1,"px",""))+aiint(replace(icfz2,"px",""))
iccgx=iccgx&"px"
end if
elseif icfty=0 then
if icfz1="100%" or icfz2="100%" then
iccgx="0px"
elseif right(icfz1,1)="%" and right(icfz2,1)="%" then
iccgx=aiint(replace(icfz1,"%",""))-aiint(replace(icfz2,"%",""))
iccgx=iccgx&"%"
elseif right(icfz1,1)="%" or right(icfz2,1)="%" then
iccgx="0px"
else
iccgx=aiint(replace(icfz1,"px",""))-aiint(replace(icfz2,"px",""))
iccgx=iccgx&"px"
end if
end if
End Function
'-----------------------------------
'=icmnk(icfid,icfurl,icfcss)
'-----------------------------------
Function icmnk(icfid,icfbt,icfurl,icfcss)
'icmnk="<a class="""&icfcss&""" data-toggle=""modal"" href="""&icfurl&""" data-target=""#"&icfid&""">"&icfbt&"</a><div class=""modal"" id="""&icfid&"""><div class=""modal-dialog""><div class=""modal-content""></div></div></div>"
icmnk="<a class="""&icfcss&""" target=""_blank"" href="""&icfurl&""" id="""&icfid&""">"&icfbt&"</a>"
End Function
'-----------------------------------
'=ictc(icfty=1ppt|2FTC)
'-----------------------------------
Function ictc(icfty)
if icfty=2 then
cstc=aiint(cstc)+1
if cstc=1 then
ictc="<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(w_asai&i_msk&"js/FTC.js",3)&"""></script>"
else
ictc=""
end if
else
csppt=aiint(csppt)+1
if csppt=1 then
ictc="<script language=""JavaScript"" charset=""utf-8"" src="""&w_asai&i_msk&"js/ppt.js""></script>"
else
ictc=""
end if
end if
End Function
'-----------------------------------
'=ictc(icfty=1ppt)
'-----------------------------------
Function icgd(icfty,icfwd,icfht,icfstr)
dim icdgcss
if icfty>2 then icdgcss="a"
e_ii=aiint(e_ii)+1
icgd=""
icgd=icgd&"<div id=""eesai"&e_ii&"gd"" class=""p-gd"&icdgcss&""" style=""width:"&iccg(icfwd,"auto")&";height:"&iccg(icfht,"100%")&""">"
if icdgcss="a" then icgd=icgd&"<div id=""eesai"&e_ii&"gda"" class=""p-gda"">"
icgd=icgd&"<div id=""eesai"&e_ii&"gd1"" class=""p-gd2"&icdgcss&""">"
icgd=icgd&icfstr
icgd=icgd&"</div><div id=""eesai"&e_ii&"gd2"" class=""p-gd2"&icdgcss&"""></div><div id=""eesai"&e_ii&"gd3"" class=""p-gd2"&icdgcss&"""></div><div class=cr></div></div>"
if icdgcss="a" then icgd=icgd&"</div>"
icgd=icgd&"<script>var eesai"&e_ii&"sd=40;var eesai"&e_ii&"gd3=document.getElementById(""eesai"&e_ii&"gd3"");var eesai"&e_ii&"gd2=document.getElementById(""eesai"&e_ii&"gd2"");var eesai"&e_ii&"gd1=document.getElementById(""eesai"&e_ii&"gd1"");var eesai"&e_ii&"gd=document.getElementById(""eesai"&e_ii&"gd"");eesai"&e_ii&"gd2.innerHTML=eesai"&e_ii&"gd1.innerHTML;eesai"&e_ii&"gd3.innerHTML=eesai"&e_ii&"gd1.innerHTML;"
if icfty=1 then
icgd=icgd&"function eesai"&e_ii&"gg(){if(eesai"&e_ii&"gd2.offsetTop-eesai"&e_ii&"gd.scrollTop<=0){eesai"&e_ii&"gd.scrollTop-=eesai"&e_ii&"gd1.offsetHeight;}else{eesai"&e_ii&"gd.scrollTop++;}"
elseif icfty=2 then
icgd=icgd&"function eesai"&e_ii&"gg(){if(eesai"&e_ii&"gd2.offsetTop-eesai"&e_ii&"gd.scrollTop>=0){eesai"&e_ii&"gd.scrollTop+=eesai"&e_ii&"gd1.offsetHeight;}else{eesai"&e_ii&"gd.scrollTop--;}"
elseif icfty=3 then
icgd=icgd&"function eesai"&e_ii&"gg(){if(eesai"&e_ii&"gd2.offsetWidth-eesai"&e_ii&"gd.scrollLeft<=0){eesai"&e_ii&"gd.scrollLeft-=eesai"&e_ii&"gd1.offsetWidth;}else{eesai"&e_ii&"gd.scrollLeft++;}"
elseif icfty=4 then
icgd=icgd&"function eesai"&e_ii&"gg(){if(eesai"&e_ii&"gd.scrollLeft<=0){eesai"&e_ii&"gd.scrollLeft+=eesai"&e_ii&"gd2.offsetWidth;}else{eesai"&e_ii&"gd.scrollLeft--;}"
end if
icgd=icgd&"}var eesai"&e_ii&"mm=setInterval(eesai"&e_ii&"gg,eesai"&e_ii&"sd);eesai"&e_ii&"gd.onmouseover=function() {clearInterval(eesai"&e_ii&"mm)};eesai"&e_ii&"gd.onmouseout=function() {eesai"&e_ii&"mm=setInterval(eesai"&e_ii&"gg,eesai"&e_ii&"sd)}</script>"
End Function
'-----------------------------------
'PS:HD Show
'=icppt(eafimg/"2.gif"&g_gx&"3.gif",eafurl/"http://easai.com"&g_gx&"http://77ya.com",eaftxt/"Asai Studio"&g_gx&"eatai.Com",eafwid=320,eafhei=240,eafsty/0no/1num/2num+tit,eaftm/time to go=3,color,eafid/"AsaiHD")
'-----------------------------------
Function icppt(eafimg,eafurl,eaftxt,eafwid,eafhei,eafsty,eaftm,eafbg,eafid)
dim eatharri,eatharru,eatharrt,eatharrb,eathnum,eathii,eathiii,icdqt,icdpt,icdpn,icdlj,icdbt,icdbg
eatharri=split(eafimg,g_gx)
eatharru=split(eafurl&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx,g_gx)
eatharrt=split(eaftxt&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx,g_gx)
eatharrb=split(eafbg&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx,g_gx)
eathnum=ubound(eatharri)
eathiii=0
eafid=replace(eafid,"-","")
eaftm=aiint(eaftm)
if eaftm=0 then eaftm=3
if eathnum>0 then
icppt="<script type=""text/javascript"">"
icppt=icppt&"var I"&eafid&"o=0;"
icppt=icppt&"function F"&eafid&"_ppt(){var I"&eafid&"_ppt=document.getElementById('D"&eafid&"_ppt'),I"&eafid&"_img=document.getElementById('M"&eafid&"_img').getElementsByTagName(""li""),I"&eafid&"_num=document.getElementById('N"&eafid&"_num').getElementsByTagName('i'),"&eafid&"_now=0,"&eafid&"_play=null;S"&eafid&"_pptx(0);"&eafid&"_play=setInterval("&eafid&"_playf,"&eaftm&"000);I"&eafid&"_ppt.onmouseover=function(){clearInterval("&eafid&"_play);};I"&eafid&"_ppt.onmouseout=function(){"&eafid&"_play=setInterval("&eafid&"_playf,"&eaftm&"000);};for(var "&eafid&"_ni=0;"&eafid&"_ni<I"&eafid&"_num.length;"&eafid&"_ni++){I"&eafid&"_num["&eafid&"_ni].onmouseover=function(){clearInterval("&eafid&"_play);"&eafid&"_now=this.innerText-1;S"&eafid&"_pptx("&eafid&"_now);};};function "&eafid&"_playf(){if(++"&eafid&"_now>=I"&eafid&"_img.length){"&eafid&"_now=0;}S"&eafid&"_pptx("&eafid&"_now);}function S"&eafid&"_pptx("&eafid&"_Vnowin){for(var "&eafid&"_xi=0;"&eafid&"_xi<I"&eafid&"_img.length;++"&eafid&"_xi){I"&eafid&"_img["&eafid&"_xi].style.display=""none"";I"&eafid&"_num["&eafid&"_xi].className="""";}"
icppt=icppt&"I"&eafid&"o="&eafid&"_Vnowin;"
icppt=icppt&"I"&eafid&"_img["&eafid&"_Vnowin].style.display=""block"";I"&eafid&"_num["&eafid&"_Vnowin].className=""p-ptnx"";}};"

icppt=icppt&"function S"&eafid&"_pptgo(c"&eafid&"s){I"&eafid&"_imgx=document.getElementById('M"&eafid&"_img').getElementsByTagName(""li""),I"&eafid&"_numx=document.getElementById('N"&eafid&"_num').getElementsByTagName('i');for(var "&eafid&"_xi=0;"&eafid&"_xi<I"&eafid&"_imgx.length;++"&eafid&"_xi){I"&eafid&"_imgx["&eafid&"_xi].style.display=""none"";I"&eafid&"_numx["&eafid&"_xi].className="""";}"
icppt=icppt&"if(c"&eafid&"s==2){I"&eafid&"o=I"&eafid&"o+1}else{I"&eafid&"o=I"&eafid&"o-1};if(I"&eafid&"o>=I"&eafid&"_imgx.length){I"&eafid&"o=0};if(I"&eafid&"o<0){I"&eafid&"o=I"&eafid&"_imgx.length-1};"
icppt=icppt&"I"&eafid&"_imgx[I"&eafid&"o].style.display=""block"";I"&eafid&"_numx[I"&eafid&"o].className=""p-ptnx"";}"

icppt=icppt&"</script>"  
'0拉伸显示|1居中等比|2定宽平铺|3定高平铺
eafwid=iccg(eafwid,"100%")
if eafwid="100%" then
eafhei=iccg(eafhei,"auto")
else
eafhei=iccg(eafhei,"100%")
end if
if i_xkhd=1 then
icppt=icppt&"<style>#D"&eafid&"_ppt,#D"&eafid&"_ppt ul li{height:"&eafhei&"; width:"&eafwid&";}#D"&eafid&"_ppt img{max-width:100%;max-height:100%;}"
elseif i_xkhd=2 then
icppt=icppt&"<style>#D"&eafid&"_ppt,#D"&eafid&"_ppt ul li{height:"&eafhei&"; width:"&eafwid&";}#D"&eafid&"_ppt img{width:"&eafwid&";}"
elseif i_xkhd=3 then
icppt=icppt&"<style>#D"&eafid&"_ppt,#D"&eafid&"_ppt ul li{height:"&eafhei&"; width:"&eafwid&";}#D"&eafid&"_ppt img{height:"&eafhei&";}"
else
icppt=icppt&"<style>#D"&eafid&"_ppt,#D"&eafid&"_ppt ul li,#D"&eafid&"_ppt img{height:"&eafhei&"; width:"&eafwid&";}"
end if
if eafsty<2 then
icppt=icppt&"#D"&eafid&"_ppt ul li div{display:none;}"
if eafsty=0 then icppt=icppt&"#N"&eafid&"_num{display:none;}"
end if
icppt=icppt&"</style>"
for eathii=0 to eathnum
icdqt=eatharri(eathii)
icdlj=eatharru(eathii)
icdbt=eatharrt(eathii)
icdbg=eatharrb(eathii)
if not ainull(icdqt) then
eathiii=eathiii+1
if ainull(icdlj) then icdlj="#"
if not ainull(icdbg) then icdbg=" style=""background-color:"&icdbg&";"""
icdpt=icdpt&"<li"&icdbg&"><a href="""&icdlj&""" title="""&icdbt&"""><img alt="""&icdbt&""" src="""&icdqt&"""></a><a href="""&icdlj&""" title="""&icdbt&"""><div>"&icdbt&"</div></a></li>"
icdpn=icdpn&"<i"
if eathii=1 then icdpn=icdpn&" class=""on"""
icdpn=icdpn&">"&eathiii&"</i>"
end if
next
icppt=icppt&"<div class=""p-pt"" id='D"&eafid&"_ppt'><ul id=""M"&eafid&"_img"">"
icppt=icppt&icdpt
icppt=icppt&"</ul><div class=""p-ptn"" id=""N"&eafid&"_num"">"
icppt=icppt&icdpn
icppt=icppt&"</div>"
icppt=icppt&"<div class=""p-ptgl"" onclick=""S"&eafid&"_pptgo(1);""><b>&lt;</b></div><div class=""p-ptgr"" onclick=""S"&eafid&"_pptgo(2);""><b>&gt;</b></div>"
icppt=icppt&"</div><script>F"&eafid&"_ppt();</script>"
end if
End Function
'-----------------------------------
'PS:she qian
'=icsq(big title,eatfbt/<a href></a>"&g_gx&"<a href></a>,nr"&g_gx&"nr,"")
'-----------------------------------
Function icsq(eatqbtd,eatfbt,eatfnr,eatfcs)
e_ii=e_ii+1
dim eatqfcarrb,eatqfcarrn,eatqfcub,eatqfcii,eatqfcjj,eatqfcon
eatqfcarrb=split(eatfbt,g_gx)
eatqfcarrn=split(eatfnr,g_gx)
eatqfcon=""
if ubound(eatqfcarrb)>ubound(eatqfcarrn) then
eatqfcub=ubound(eatqfcarrn)
else
eatqfcub=ubound(eatqfcarrb)
end if
if eatqfcub>0 then
if eatqfcub>20 then eatqfcub=20
icsq=icsq&"<script type=""text/javascript"" language=""javascript"">function llsq"&e_ii&"go(asoid){return document.getElementById(asoid);} function llsq"&e_ii&"move(ason){for(var llsq"&e_ii&"i=1;llsq"&e_ii&"i<="&eatqfcub+1&";llsq"&e_ii&"i++){llsq"&e_ii&"go('llsq"&e_ii&"'+llsq"&e_ii&"i).className='l-x"&eatfcs&"ta';llsq"&e_ii&"go('llsq"&e_ii&"c'+llsq"&e_ii&"i).className='l-x"&eatfcs&"ca';}llsq"&e_ii&"go('llsq"&e_ii&"'+ason).className='l-x"&eatfcs&"tan';llsq"&e_ii&"go('llsq"&e_ii&"c'+ason).className='l-x"&eatfcs&"can';}</script>"
icsq=icsq&"<div class=""l-x"&eatfcs&""
icsq=icsq&"""><div class=""l-x"&eatfcs&"t"">"

eatqfcjj=0
for eatqfcii=0 to eatqfcub
if eatqfcarrb(eatqfcii)<>"" then
eatqfcjj=eatqfcjj+1
if eatqfcjj=1 then
icsq=icsq&"<span class=""l-x"&eatfcs&"tan"" id=""llsq"&e_ii&eatqfcjj&""" onmouseover=""llsq"&e_ii&"move("&eatqfcjj&");"">"&eatqfcarrb(eatqfcii)&"</span>"
eatqfcon=eatqfcon&"<div class=""l-x"&eatfcs&"can"" id=""llsq"&e_ii&"c"&eatqfcjj&""">"&eatqfcarrn(eatqfcii)&"</div>"
else
icsq=icsq&"<span class=""l-x"&eatfcs&"ta"" id=""llsq"&e_ii&eatqfcjj&""" onmouseover=""llsq"&e_ii&"move("&eatqfcjj&");"">"&eatqfcarrb(eatqfcii)&"</span>"
eatqfcon=eatqfcon&"<div class=""l-x"&eatfcs&"ca"" id=""llsq"&e_ii&"c"&eatqfcjj&""">"&eatqfcarrn(eatqfcii)&"</div>"
end if
end if
next

if eatqbtd<>"" then icsq=icsq&"<span class=""l-x"&eatfcs&"tt"">"&eatqbtd&"</span>"
icsq=icsq&"</div><div class=""l-x"&eatfcs&"g""></div><div class=""l-x"&eatfcs&"c"">"
icsq=icsq&eatqfcon
icsq=icsq&"</div></div>"
else
icsq=icsq&"null..."
end if
End Function
'-----------------------------------
'PS:no class channel menu
'-----------------------------------
Function ictb(eafsx,eafps,eafsn)
dim ictblin,ictblis,ictblir,ictblitr
dim eadlinrr:eadlinrr=earr(0,eafps)
ictblir=""
ictblis=0
ictblin="<div class=""l-ra""><ul>"
gysax=split(eadlinrr,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if ubound(gysay)>10 then
if ictblir="" then ictblir=eaurl(esnk(gysay(11))&g_urg&esnf(gysay(10))&g_urg&s_umxx&g_urg&gysay(1)&g_urz,1,esnk(gysay(11)),"")
if gysi mod 2=0 then
ictblin=ictblin&"<li class=""l-1 pt"">"
else
ictblin=ictblin&"<li class=""pt"">"
end if
ictblitr="<a"
if aibj(gysay(1),eafsn) then
ictblitr=ictblitr&" class=""l-va"""
ictblis=1
end if
ictblitr=ictblitr&" href="""&eaurl(esnk(gysay(11))&g_urg&esnf(gysay(10))&g_urg&s_umxx&g_urg&gysay(1)&g_urz,1,esnk(gysay(11)),"")&""">"&iclbico(0,"tag",aiint(gysay(9)))&""&esto(gysay(12),gysay(2),esnr(gysay(8)))&"</a>"
ictblin=ictblin&ictblitr
ictblin=ictblin&"</li>"
end if
next
ictblin=ictblin&"</ul></div>"
if ictblis=0 then response.Redirect(ictblir)
if not ainull(ictblin) then
if aiint(eafsx)>0 then ictb="<div class=""gys"&eafsx&""">"
ictb=ictb&ictblin
if aiint(eafsx)>0 then ictb=ictb&"<div class=""cr""></div></div>"
end if
End Function
'-----------------------------------
'PS:PD sn read
'-----------------------------------
Function icxq(eafep,eafef,eafsn,eafty,eaflen)
if not ainull(eafep) and not ainull(eafef) and not ainull(eafsn) then
g_app=esapm(1,eafsn)
if gysread(ealie("all"),eabiao,"ai_sn='"&eafsn&"'",g_app) then
ai_sb=aiint(ai_sb)
if ai_sb>0 then
if g_app<>"" then g_app=g_app&"_"&ai_sb
Call gysread(ealie("allx"),eabiao&"_"&ai_sb,"ai_sn='"&ai_sn&"'",g_app)
end if
if eafty=1 or eafty=8 then
icxq=icxq&ai_bt
end if
if eafty=0 or eafty=1 then
icxq=icxq&left(aititlen(esnr(ai_nr),eaflen),eaflen)&"...<a href="""&eshref(eafep&g_urg&eafef&g_urg&s_umxx&g_urg&eafsn&g_urz,1)&""" title=""点击查看全部""><u class=""ftt"">[详情]</u></a>"
elseif eafty=8 or eafty=9 then
icxq=icxq&esnr(ai_nr)
end if
end if
end if
End Function
'-----------------------------------
'PS:ico
'-----------------------------------
Function iclbico(icffl,icfic,icfty)
icfty=right(icfty,1)
if icffl=1 then
icffl="p-om "
elseif icffl=2 then
icffl="p-ol "
else
icffl=""
end if
if icfic="0" then
if icfty="0" then
iclbico="<span class="""&icffl&"p-o0 glyphicon glyphicon-arrow-down""></span>"
elseif icfty="5" then
iclbico="<span class="""&icffl&"p-o5 glyphicon glyphicon-arrow-up""></span>"
else
iclbico="<span class="""&icffl&"p-o"&icfty&" glyphicon glyphicon-play""></span>"
end if
else
iclbico="<span class="""&icffl&"p-o"&icfty&" glyphicon glyphicon-"&icfic&"""></span>"
end if
End Function
'-----------------------------------
'PS:ico qianzhui
'-----------------------------------
Function icqz(icfel,icfty,icfxy,icfpx)
icqz=""
if icfty>0 and ew_qz>0 then
if ew_qz=2 then
icqz=esicoh(1,icfel)
else
if aiint(icfpx)>0 then
icqz=icqz&iclbico(2,"chevron-up",left(icfpx,1))
elseif aiint(icfxy)=0 then
icqz=icqz&iclbico(2,"chevron-down",0)
elseif aiint(icfxy)=5 then
icqz=icqz&iclbico(2,"chevron-right",5)
else
icqz=icqz&iclbico(2,"play",aiint(icfxy))
end if
end if
end if
End Function
'-----------------------------------
'PS:ico houzhuo
'-----------------------------------
Function ichz(icfty,icftm,icfhi,icfup)
ichz=""
if icfty>0 and ew_hz=1 then
if isdate(icftm) then
if DateDiff("d",icftm,now())<i_nmxtm then ichz=ichz&iclbico(2,"flag",2)
end if
if not ainull(icfup) then ichz=ichz&iclbico(2,"picture",3)
if aiint(icfhi)>i_nmxhi then ichz=ichz&iclbico(2,"fire",4)
end if
End Function
'-----------------------------------
'for cs
'=iccs(icfty=2填参数表单|3显示参数|4列出文本参数|5列出列表LI,icfnm=默认表单名,icfcs=参数规则,icfzz=参数值)
'dim canshuzhi
'canshuzhi="1dx=单选~1=好评|2=差评#2dx=多选~1=好服务|2=好内存|3=好价格#3tx=填空~默认值#4ts=填数~10#1=单单~1=好评|2=差评#2=多多~1=好服务|2=好内存|3=好价格#3=空空~默认值#4=数数~10#3=空空~默认值~12#4=数的数~10~12#3=空空~默认值~6#4=数数多字数~10~6"
'e_ma=e_ma&"------------------------------------<br />"
'e_ma=e_ma&iccs(2,"cs",canshuzhi,"")
'e_ma=e_ma&"<br />------------------------------------"
'e_ma=e_ma&"------------------------------------<br />"
'e_ma=e_ma&iccs(3,"cs",canshuzhi,"")
'e_ma=e_ma&"<br />------------------------------------"
'-----------------------------------
Function iccs(icfty,icfnm,icfcs,icfzz)
'iccs=icfzz
if icfcs<>"" then
dim icsdr,icsdrx,icsdi,icsdrz,icsdzz,icsdzzc,icsdzt,icsdzi,icsdzm,icsdzb,icfzzrr,icfzzrrll,icfzzii,icfzzjj,icfzzud,icfzzll,icfslrr,icfsli,icfslz,icfzii,icflin,icflibt
icsdr=split(icfcs,"#")
if icfzz<>"" then
if icfnm="fl" then
icfzzrr=split(icfzz,", ")
icfzzud=ubound(icfzzrr)
else
for icfzii=0 to 100
icfzz=icfzz&", |,"
next
icfzzrr=split(icfzz,", |,")
icfzzii=0
end if
end if
for icsdi=0 to ubound(icsdr)
if icsdr(icsdi)<>"" then
icsdrx=split(icsdr(icsdi)&"~~","~")
icsdrz=icsdrx(0)
icsdzb=icsdrx(2)
if icsdzb="" then icsdzb=25
if icsdrz<>"" then
icsdrz=split(icsdrz&"=","=")
icsdzz=icsdrz(0)
icsdzzc=len(icsdzz)
icsdzt=int(left(icsdzz,1))'ty
if icsdzzc=1 then
icsdzi=icfnm
else
icsdzi=right(icsdzz,icsdzzc-1)'id/name
end if
icsdzm=icsdrz(1)'ming zi
'response.Write icsdzz&"<br>"
'response.Write icsdzm&"<br>"
'------loop 0
if icsdzt>0 then
'response.Write "ddddd"&icfzzii&"ddddd"&ubound(icfzzrr)
if icfnm="fl" then
for icfzzjj=0 to icfzzud
icfzzrrll=icfzzrr(icfzzjj)
if left(icfzzrrll,icsdzzc)=icsdzz then
if icsdzt=1 then
icfzzll=right(icfzzrrll,len(icfzzrrll)-icsdzzc)
else
icfzzll=icfzzll&", "&right(icfzzrrll,len(icfzzrrll)-icsdzzc)&""
end if
end if
next
else
if icfzz<>"" then icfzzll=trim(icfzzrr(icfzzii))
end if
if icfty=2 then'填写
if icsdzt=9 then
iccs=iccs&"<li class=""sy-c10""><h6>"&icsdzm&"</h6></li><input type=""hidden"" name="""&icsdzi&""" value=""""><input type=""hidden"" name="""&icsdzi&""" value=""|"">"
else
iccs=iccs&"<li class=""sy-c"&icsdzb&"""><b>"&icsdzm&"：</b><i>"
if icsdzt=1 then
icfslrr=split(icsdrx(1),"|")
iccs=iccs&"<select id="""&icsdzi&""" name="""&icsdzi&""" class=""f-s"">"
for icfsli=0 to ubound(icfslrr)
icfslz=icfslrr(icfsli)
if icfslz<>"" then
icfslz=split(icfslz&"=","=")
iccs=iccs&"<option value="&icfslz(0)&""
if icfzzll=icfslz(0) then iccs=iccs&" selected"
iccs=iccs&">"&icfslz(1)&"</option>"
end if
next
iccs=iccs&"</select>"
elseif icsdzt=2 then
icfslrr=split(icsdrx(1),"|")
for icfsli=0 to ubound(icfslrr)
icfslz=icfslrr(icfsli)
if icfslz<>"" then
icfslz=split(icfslz&"=","=")
iccs=iccs&"<input id="""&icsdzi&""" name="""&icsdzi&""" type=""checkbox"" value="&icfslz(0)&""
if instr(icfzzll,icfslz(0)&",")>0 then iccs=iccs&" checked"
iccs=iccs&">"&icfslz(1)&" "
end if
next
else
iccs=iccs&"<input type=""text"" class=""f-c"" id="""&icsdzi&""" name="""&icsdzi&""""
if icfty=4 then iccs=iccs&" onkeyup=""value=value.replace(/\D/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))"""
if not ainull(icfzzll) then iccs=iccs&" value="""&icfzzll&""""
iccs=iccs&">"
end if
iccs=iccs&"</i></li><input type=""hidden"" name="""&icsdzi&""" value=""|"">"
end if
else'展示
icflin=""
if icsdzt=9 then
if not ainull(icflibt) then
if right(iccs,len(icflibt))=icflibt then
iccs=left(iccs,len(iccs)-len(icflibt))
end if
end if
icflibt="<li class=""sy-c10""><h6>"&icsdzm&"</h6></li>"
iccs=iccs&icflibt
else
if icsdzt=1 then
icfslrr=split(icsdrx(1),"|")
for icfsli=0 to ubound(icfslrr)
icfslz=icfslrr(icfsli)
if icfslz<>"" then
icfslz=split(icfslz&"=","=")
if icfzzll=icfslz(0) then icflin=icflin&""&icfslz(1)&""
end if
next
elseif icsdzt=2 then
icfslrr=split(icsdrx(1),"|")
for icfsli=0 to ubound(icfslrr)
icfslz=icfslrr(icfsli)
if icfslz<>"" then
icfslz=split(icfslz&"=","=")
if instr(", "&icfzzll&",",", "&icfslz(0)&",")>0 then icflin=icflin&""&icfslz(1)&" "
end if
next
else
if not ainull(icfzzll) then icflin=icfzzll
end if
'-----------made show 0
if not ainull(icflin) then
if icfty=6 or icfty=7 then
if icsdzb=25 then
icsdzb=5
elseif icsdzb=33 then
icsdzb=10
elseif icsdzb<5 then
icsdzb=icsdzb*2
end if
end if

if icfty=3 or icfty=6 then
iccs=iccs&"<li class=""sy-c"&icsdzb&"""><b title="""&icsdzm&""">"&icsdzm&"：</b><i title="""&icflin&""">"
elseif icfty=7 then
iccs=iccs&"<li class=""sy-c"&icsdzb&" b-b""><span class=b-cfq>"&icsdzm&"：</span>"
elseif icfty=4 then
iccs=iccs&""&icsdzm&"："
elseif icfty=5 then
iccs=iccs&"<li>"&icsdzm&"："
end if
iccs=iccs&icflin
if icfty=3 or icfty=6 then
iccs=iccs&"</i></li>"
elseif icfty=7 then
iccs=iccs&"</li>"
elseif icfty=4 then
iccs=iccs&" "
elseif icfty=5 then
iccs=iccs&"</li>"
end if
end if
'-----------made show 1
end if
end if
icfzzii=icfzzii+1
end if
'------loop 1
end if
end if
next
if not ainull(icflibt) then
if right(iccs,len(icflibt))=icflibt then
iccs=left(iccs,len(iccs)-len(icflibt))
end if
end if
end if
End Function
'-----------------------------------
'icskg
'-----------------------------------
Function icskg(icfew,icfep,icfai)
icskg=false
if e_gdj>2 then
icskg=true
ew_sp=5
else
icskg=aiint(icfai)
if icskg=0 then icskg=aiint(icfep)
if icskg=0 then icskg=aiint(icfew)
if icskg>2 then
icskg=true
elseif icskg=2 and userx>0 then
icskg=true
end if
end if
End Function

'---------------------------------------------------------下面是会员相关过程啦

dim u_exit,u_login,u_reg,u_user
u_exit=i_dir&s_druser&"?exit.html"
u_login=i_dir&s_druser&"?login.html"
u_reg=i_dir&s_druser&"?reg.html"
u_user=i_dir&s_druser
'-----------------------------------
'usergx
'-----------------------------------
Function usergx(usflx,usfty,usfva)
if userx>0 then
dim usdurr,usduii,usduts
	if aibj(usfty,"jy") or aibj(usfty,"jb") or aibj(usfty,"jq") then
	usergx="<script language=""javascript"">function boxts(){var boxtsdiv=document.getElementById(""bbtsbox"");boxtsdiv.style.display=""none"";}setTimeout(""boxts()"",3000);</script><div id=""bbtsbox"" class=""boxts"">提示：感谢您的支持 "
	if aibj(usfty,"jy") then
	if usflx=1 then
	usfva=aiint(e_ujy)-aiint(usfva)
	elseif usflx=2 then
	usfva=aiint(e_ujy)+aiint(usfva)
	end if
	usergx=usergx&"经验 "&aiint(usfva)-aiint(e_ujy)&"(您还有 "&usfva&" 经验)"
	elseif aibj(usfty,"jb") then
	if usflx=1 then
	usfva=aiint(e_ujb)-aiint(usfva)
	elseif usflx=2 then
	usfva=aiint(e_ujb)+aiint(usfva)
	end if
	usergx=usergx&"金币 "&aiint(usfva)-aiint(e_ujb)&"(您还有 "&usfva&" 金币)"
	elseif aibj(usfty,"jq") then
	if usflx=1 then
	usfva=aiint(e_ujq)-aiint(usfva)
	elseif usflx=2 then
	usfva=aiint(e_ujq)+aiint(usfva)
	end if
	usergx=usergx&"金钱 "&aiint(usfva)-aiint(e_ujq)&"(您还有 "&usfva&" 金钱)"
	end if
	usergx=usergx&"</div>"
	else
		if usflx=1 then
		usfva=aiint(usfva)
		Execute("usfva=int(e_u"&usfty&"-usfva)")
		elseif usflx=2 then
		usfva=aiint(usfva)
		Execute("usfva=int(e_u"&usfty&"+usfva)")
		end if
		Execute("e_u"&usfty&"=usfva")
	end if
Call icuser(5)
end if
End Function
'-----------------------------------
'=usrqm(usfty=len(<2no|3no-read)+left(1no-dt|2dt|3fl|4fr)+right(0user|1up|2us-up|3qm|4us-qm|5us-up-qm|6us-up-qm-sx),usfus,usfstr)
'-----------------------------------
Function usrqm(usfty,usfer,usfstr)
dim usdwc,usdwl,usdwr
dim usdl0,usdl1,usdl2,usdlin
dim usdarr,usdxy,usdqm,usdup,usdsn,usdbt,usdzj,usdjb,usdjy

usdwc=len(usfty)
if usdwc=1 then
usdwl=aiint(usfty)
usdwr=0
else
usdwl=aiint(left(usfty,1))
usdwr=aiint(right(usfty,1))
end if

usdl0=0
usdl1=""
usdl2=""
usdlin=""

if usdwr=0 then
usdl1=usfer
usdl0=1
else
if usdwc=3 then
usdarr=split(usfstr&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg,g_gg)
usdxy=aiint(usdarr(0))
usdqm=usdarr(1):usdup=usdarr(2):usdsn=usdarr(3):usdbt=usdarr(4)
elseif ainull(usfer) then
usdarr=split(usfstr&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg,g_gg)
usdxy=1
usdqm=usdarr(1):usdup=usdarr(2):usdsn=usdarr(3):usdbt=usdarr(4)&"<br>["&ew_mc&"网友]"
else
dim usdqsql,usdqrs
usdqsql="select us_xy,us_qm,us_up,us_er,us_bt,us_zy,us_jb,us_jy from "&usbiao&" where us_er='"&usfer&"'"
Call saik(usdqrs,usdqsql,1,1)
if usdqrs.eof and usdqrs.bof then
if usdwl=2 then
usdl0=1
usdxy=1
usdqm="":usdup="":usdsn="":usdbt=usfer&"<br>("&ew_mc&"网友)"
end if
else
usdxy=aiint(usdqrs(0))
usdqm=usdqrs(1):usdup=usdqrs(2):usdsn=usdqrs(3):usdbt=usdqrs(4):usdzj=aiint(usdqrs(5)):usdjb=aiint(usdqrs(6)):usdjy=aiint(usdqrs(7))
end if
Call saig(usdqrs)
end if

if usdxy>0 then
usdl0=1
if ainull(usdbt) then usdbt=usren(usfer)
if not ainull(usdup) then usdl1=usdl1&"<img src="""&eshref(usdup,3)&"""><br>"
if not ainull(usdbt) then
usdl1=usdl1&usdbt
if not ainull(usdsn) then usdl1="<a target=""_blank"" href="&eshref(s_udus&g_urg&s_umxx&g_urg&usdsn&g_urz,66)&">"&usdl1&"</a>"
end if
usdl1=usdl1&"<p>"
if aiint(usdzj)>0 then usdl1=usdl1&aisrd(usdzj,i_buszy)&"<br>"
if aiint(usdjb)>0 then usdl1=usdl1&usdjb&" 金币<br>"
if aiint(usdjb)>0 then usdl1=usdl1&usdjy&" 经验</p>"
usdl1=usdl1&"</p>"
if usdwr>2 then usdl2=usdqm
end if
end if

if usdl0=1 and (usdl1<>"" or usdl2<>"") then

if usdwl=5 then
usdlin="<DL class=""u-a"" style=""margin:0px 0px 8px 8px;float:right;width:180px;"">"
elseif usdwl=4 then
usdlin="<DL class=""u-a"" style=""margin:0px 8px 8px 0px;float:left;width:180px;"">"
elseif usdwl=3 then
usdlin="<DL class=""u-a"">"
elseif usdwl=2 then
usdlin="<DL>"
end if
if usdl1<>"" then
if usdwl<3 then
usdlin=usdlin&""&usdl1
else
usdlin=usdlin&"<DT class=""u-b"">"&usdl1&"</DT>"
end if
end if
if usdl2<>"" then
if usdwl=2 then
usdlin=usdlin&"<DD class=""u-d"">"&usdl2&"</DD>"
elseif usdwl=1 then
usdlin=usdlin&""&usdl2&""
else
usdlin=usdlin&"<DD class=""u-c"">"&usdl2&"</DD>"
end if
end if
if usdwl>1 then usdlin=usdlin&"</DL>"
end if
usrqm=usdlin

End Function
'-----------------------------------
'=usrzj("ren")
'-----------------------------------
Function usrzj(usfer)
usrzj=gysro("us_zy",usbiao,"us_er='"&usfer&"'","")
End Function
'-----------------------------------
'=usrts("ren|ren2")
'-----------------------------------
Function usrts(usfty,usfer)
if left(usfty,1)=1 then
if right(usfty,1)=2 then
usrts=gysat("us_uy",usbiao,"us_er in ('"&replace(usfer,"|","','")&"')","+1")
else
usrts=gysat("us_uy",usbiao,"us_er in ('"&replace(usfer,"|","','")&"')","-1")
end if
else

end if
End Function
'-----------------------------------
'=usren("ren")
'-----------------------------------
Function usren(usfer)
dim usdrr,usder,usdbt
usdrr=split(usfer&g_gg,g_gg)
usder=usdrr(0)
usdbt=usdrr(1)
if aibj(usder,ew_kx) then
usren="管理员"
elseif aibj(usder,ew_kz) then
usren="站长"
elseif aibj(usder,ew_kf) then
usren="客服"
elseif aibj(usder,ew_kg) then
usren="公共"
elseif aibj(usder,ew_kt) then
usren="系统"
elseif not ainull(usdbt) then
if aibj(left(usdbt,len(s_udusxt)),s_udusxt) then
usren=ew_mc&"网友"
else
usren=usdbt
end if
else
if aibj(left(usder,len(s_udusxt)),s_udusxt) then
usren=ew_mc&"网友"
else
usren=usder
end if
end if
if ainull(usren) then usren="　"
End Function
'-----------------------------------
'=usxqw("ren")
'-----------------------------------
Function usxqw(epfqw,usfer,usfxy,usfzj)
'开放投稿|注册投稿|审核投稿|认证投稿|高级投稿|禁止投稿
usxqw=false
epfqw=aiint(epfqw)
usfxy=aiint(usfxy)
usfzj=aiint(usfzj)
if epfqw=0 or (epfqw=1 and usfer<>"") or (epfqw=2 and usfxy>aiint(ew_sh)) or (epfqw=3 and usfzj>1) or (epfqw=4 and usfzj>2) then
usxqw=true
end if
End Function
'-----------------------------------
'=user email
'-----------------------------------
Function usemail()
usemail="<table class=""table-hover"">"
dim emsmtp,emdenglu,emmima,emfajian,emhuijian
if Request.Form("emhuijian")<>"" then
emhuijian=Request.Form("emhuijian")
elseif aiemck(e_uem)<>"" then
emhuijian=aiemck(e_uem)
else
emhuijian=g_emrp
end if
if Request.Form("emshoujian")<>"" and Request.Form("embiaoti")<>"" and Request.Form("emneirong")<>"" then
if Request.Form("emsmtp")<>"" then
emsmtp=Request.Form("emsmtp")
else
emsmtp=g_emfw
end if
if Request.Form("emdenglu")<>"" then
emdenglu=Request.Form("emdenglu")
else
emdenglu=g_emzh
end if
if Request.Form("emmima")<>"" then
emmima=Request.Form("emmima")
else
emmima=g_emmm
end if
if Request.Form("emfajian")<>"" then
emfajian=Request.Form("emfajian")
else
emfajian=g_emfr
end if
if aibj(g_u2,s_umfb) then
usemail=usemail&aigo("发送邮件"&s_ztcg,1)
else
usemail=usemail&"<tr><td>　</td><td>"&aiem(emsmtp,emdenglu,emmima,emfajian,emhuijian,Request.Form("emshoujian"),g_emrp,"","",Request.Form("embiaoti"),0,Request.Form("emneirong")&"","",Request.Form("emfanhui"))&"</td></tr>"
end if
end if
usemail=usemail&"<form name=""AsaiEmail"" action="""" method=""post"">"&_
"<tr><td class=""m-lrl"">收件邮箱：</td><td>"&aiinput("","emshoujian","",0,200,"*请输入收件人的电子邮箱","f-ua",g_u1)&" *</td></tr>"&_
"<tr><td class=""m-lrl"">标题：</td><td>"&aiinput("","embiaoti","",0,200,"*请输入邮件的标题","f-ua",Request.Form("embiaoti"))&" *</td></tr>"&_
"<tr><td class=""m-lrl"">内容：</td><td>"&aitext("emneirong","","",0,8000,"*请输入邮件的内容","f-ax|f-bx|f-ax",Request.Form("emneirong"))&"</td></tr>"&_
"<tr><td class=""m-lrl"">回件邮箱：</td><td>"&aiinput("","emhuijian","",0,200,"*请输入接收回信的电子邮箱","f-ua",emhuijian)&" *</td></tr>"&_
"<tr><td class=""m-lrl""></td><td><input type=""checkbox"" id=""more"" name=""more"" value=""1"" onClick=""if (this.checked){document.getElementById('easemid').style.display='';}else{document.getElementById('easemid').style.display='none';}""><label for=""more"">自定义邮件服务器</label></td></tr>"&_
"<tbody id=""easemid"" style=""display:none;"">"&_
"<tr><td class=""m-lrl"">发件邮箱：</td><td>"&aiinput("","emfajian","",0,200,"发送邮件的电子邮箱","f-u",Request.Form("emfajian"))&"</td></tr>"&_
"<tr><td class=""m-lrl"">邮箱账户：</td><td>"&aiinput("","emdenglu","",0,200,"发送邮件的电子邮箱账户","f-u",Request.Form("emdenglu"))&"</td></tr>"&_
"<tr><td class=""m-lrl"">邮箱密码：</td><td>"&aiinput("","emmima","",0,200,"发送邮件的电子邮箱密码","f-u",Request.Form("emmima"))&"</td></tr>"&_
"<tr><td class=""m-lrl"">发件SMTP：</td><td>"&aiinput("","emsmtp","",0,200,"发送邮件的服务器SMTP地址","f-u",Request.Form("emsmtp"))&"</td></tr>"&_
"<tr><td class=""m-lrl"">返回信息：</td><td>"&aiinput("","emfanhui","",0,200,"发送成功后，返回的提示信息","f-u",Request.Form("emfanhui"))&"</td></tr>"&_
"</tbody>"&_
"<tr><td></td><td><input type=""submit"" class=""f-sb f-skx"" value=""发送邮件""></td></tr>"&_
"<tr><td>　</td><td></td></tr>"&_
"</form>"&_
"</table>"
End Function
%>