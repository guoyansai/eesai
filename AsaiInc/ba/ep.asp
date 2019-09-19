<%
'@@0manage/1s_udep/2list.HTML
'@@0manage/1s_udep/2edit|add|del/3*id.HTML

if e_xa<1 and (aibj(g_u0,s_udep) or aibj(g_u1,s_udep)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_udep,s_udeps&s_umlbs)

if e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udep) and aibj(g_u2,s_umtj) then
Call epadd()
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udep) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call epedit()
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udep) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call epdel()
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udep) and dkdir(2,g_u2) then
Call eplist()
end if
'------get skin 0
if ainull(e_skc) then
e_skc=dosk("a","admin","")
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=eplie()
'-----------------------------------
Function eplie(epfty)
if epfty="form" then
eplie="ew,el,sn,mc,dm,sk,sx,bs,ls,xy,px,qw,qx,lm,sp,pl,pj,zs,nr,ef,cs,ot,fl,xt"
elseif epfty=s_umlb then
REM ep_id,1ep_sn,2ep_mc,3ep_dm,4ep_sk,5ep_sx,6ep_bs,7ep_xy,8ep_px,9ep_el,10ep_qx,11ep_ls,12ep_ef,13ep_qw
eplie="ep_id,ep_sn,ep_mc,ep_dm,ep_sk,ep_sx,ep_bs,ep_xy,ep_px,ep_el,ep_qx,ep_ls,ep_ef,ep_qw"
elseif epfty=s_umlb&"s" then
eplie="id,sn,mc,dm,sk,sx,bs,xy,px"
elseif epfty="all" then
eplie="ep_id,ep_ew,ep_el,ep_sn,ep_mc,ep_dm,ep_sk,ep_sx,ep_bs,ep_ls,ep_xy,ep_px,ep_qw,ep_qx,ep_lm,ep_sp,ep_pl,ep_zs,ep_pj,ep_nr,ep_ef,ep_cs,ep_ot,ep_fl,ep_xt"
end if
End Function
'-----------------------------------
'ep read
'=epread(sn)
'-----------------------------------
Function epread(epfsn)
dim epdsn:epdsn=epfsn
epread=""
if not aibj(epdsn,"0") and not ainull(epdsn) and not aibj(epdsn,s_umqb) then
g_app=esapm(0,s_udep&g_apj&"F_"&epdsn)
if gysread(eplie("all"),epbiao,"ep_sn='"&aistr(lcase(epdsn))&"'",g_app) then
epread=ep_mc
end if
end if
if ainull(epread) then
if aibj(s_udbb,epdsn) then
ep_id=0:ep_sk="":ep_ls=0:ep_xy=1:ep_px=0:ep_qx=0:ep_zs="":ep_cs="":ep_fl="":ep_xt="":ep_ew=ew_sn:ep_sn=s_udbb:ep_el=ew_ll:ep_sx=s_udxbb:ep_ef=i_xkfl:ep_mc=s_udbbs&"频道":ep_dm=s_udbbs
elseif aibj(s_udus,epdsn) then
ep_id=0:ep_sk="":ep_ls=0:ep_xy=1:ep_px=0:ep_qx=0:ep_zs="":ep_cs="":ep_fl="":ep_xt="":ep_ew=0:ep_sn=s_udus:ep_el=s_udlus:ep_sx=s_udxus:ep_ef=i_xkfl:ep_mc=s_uduss&"频道":ep_dm=s_uduss
elseif aibj(s_uduk,epdsn) then
ep_id=0:ep_sk="":ep_ls=0:ep_xy=1:ep_px=0:ep_qx=0:ep_zs="":ep_cs="":ep_fl="":ep_xt="":ep_ew=ew_sn:ep_sn=s_uduk:ep_el=s_udluk:ep_sx=s_udxuk:ep_ef=i_xkfl:ep_mc=s_uduks&"频道":ep_dm=s_uduks
elseif aibj(s_udun,epdsn) then
ep_id=0:ep_sk="":ep_ls=0:ep_xy=1:ep_px=0:ep_qx=0:ep_zs="":ep_cs="":ep_fl="":ep_xt="":ep_ew=0:ep_sn=s_udun:ep_el=s_udlun:ep_sx=s_udxun:ep_ef=i_xkfl:ep_mc=s_uduns&"频道":ep_dm=s_uduns
elseif aibj(s_uded,epdsn) then
ep_id=0:ep_sk="":ep_ls=0:ep_xy=1:ep_px=0:ep_qx=0:ep_zs="":ep_cs="":ep_fl="":ep_xt="":ep_ew=ew_sn:ep_sn=s_uded:ep_el=s_udled:ep_sx=s_udxed:ep_ef=i_xkfl:ep_mc=s_udeds&"频道":ep_dm=s_udeds
elseif aibj(ew_kj,epdsn) then
ep_id=0:ep_sk="":ep_ls=0:ep_xy=1:ep_px=0:ep_qx=0:ep_zs="":ep_cs="":ep_fl="":ep_xt="":ep_ew=ew_sn:ep_sn=ew_kj:ep_el="100"&ew_sn:ep_sx=0:ep_ef=i_xkfl:ep_mc="公共频道":ep_dm="公共"
end if
end if
if ep_mc="" then
ep_id=0:ep_sk="":ep_ls=0:ep_xy=1:ep_px=0:ep_qx=0:ep_zs="":ep_cs="":ep_fl="":ep_xt="":ep_ew=ew_sn:ep_sn=s_umqb:ep_el=0:ep_sx=0:ep_ef=i_xkfl:ep_mc=s_umqbs:ep_dm=s_umqbs
else
epread=ep_mc
end if
'response.Write "666666666="&ainull(epread)&"=88888888"&now()&epdsn&"<br />"
End Function
'-----------------------------------
'ep class
'=epfl()
'-----------------------------------
Function epfl(epfty,epfnm,epffl,epfva,epfur)
if epfty>0 then
'-tj=体积~1=10M以上|2=5-9MB|3=1-4MB|4=小于1MB#ty=类型~1=ASP+ACCESS|2=ASP+MSSQL|3=PHP+MYSQL#yc=原创~1=原创作品|2=修改作品|3=破解版作品
if len(epffl&"0")>4 then
if epfnm<>"" then
'epfl=epfl&"<div class=""l-rt""><script>function efcsf(effid,effva){document.getElementById(effid+""s"").value=effva;}</scri"&"pt>请认真填写以下参数　<input type=""button""  onclick=""document.getElementById('l-ruepef').style.height=window.document.getElementById('l-ruepef').offsetHeight+100 + 'px';"" class=""f-sb"" value=""扩大""><input type=""button""  onclick=""document.getElementById('l-ruepef').style.height='auto';"" class=""f-sb"" value=""自适应""><input type=""button""  onclick=""document.getElementById('l-ruepef').style.height=window.document.getElementById('l-ruepef').offsetHeight-100 + 'px';"" class=""f-sb"" value=""缩小""></div><div id=""l-ruepef"" class=""l-ru l-cs"">"
epfl=epfl&"<div class=""l-rt""><script>function efcsf(effid,effva){document.getElementById(effid+""s"").value=effva;}</script>请认真填写以下参数</div><div class=""l-ru l-cs"">"
else
epfl=epfl&"<div class=""l-rv l-cs"">"
end if
dim epflrra,epflrrb,epflccc,epflrrc,epflri,epflzz,epflzj,epflzjj,epfval,epflrz
gysax=split(epffl,"#")
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi)&"~","~")
if not ainull(gysay(0)) and not ainull(gysay(1)) then
if epfnm="" or left(gysay(0),1)<>"0" then
epflrra=split(gysay(0)&"=","=")
epflrrb=split(gysay(1),"|")
epfl=epfl&"<p><b>"&epflrra(1)&"：</b>"
for epflri=0 to ubound(epflrrb)
epflccc=epflrrb(epflri)
if len(epflccc&"0")>3 then
epflrrc=split(epflccc&"=","=")
epflrz=epflrrc(1)
epflzz=epflrra(0)&epflrrc(0)
if epfnm<>"" then
if left(gysay(0),1)="1" then
if epflri=0 then epfl=epfl&"<input type=""hidden"" name=""ef"" id="""&epfnm&epflrra(0)&"s"" value=""0"">"
epfl=epfl&"<input onClick=""efcsf(this.id,this.value)"" type=""radio"" name="""&epfnm&epflrra(0)&""" id="""&epfnm&epflrra(0)&""""
else
epfl=epfl&"<input type=""checkbox"" name="""&epfnm&""" id="""&epfnm&""""
end if
if instr(epfva&",",epflzz&",")>0 then
epfl=epfl&"  checked=""checked"""
if left(gysay(0),1)="1" then epfl=replace(epfl,"id="""&epfnm&epflrra(0)&"s"" value=""0"">","id="""&epfnm&epflrra(0)&"s"" value="""&epflzz&""">")
end if
epfl=epfl&" value="""&epflzz&""">"
if aibj(g_u0,s_umgl) then
epfl=epfl&"<span title="""&epflzz&""">"&epflrz&"</span> "
else
epfl=epfl&epflrz
end if
else

'epfva="ty2;th1;ty4;yy7;-tj7-8;"
if right(epfva,len(g_ura))<>g_ura then epfva=epfva&g_ura
if instr(epfva,g_ura&epflzz&g_ura)>0 then
ew_bt=epflrz&","&ew_bt
epfl=epfl&"<a class=""l-ry"" href="""&replace(epfur,g_gx,replace(epfva,g_ura&epflzz&g_ura,g_ura))&""">×"&epflrz&"</a>"
elseif instr(epfva,g_ura&epflzz&g_urb&g_ura)>0 then
ew_bt=epflrz&","&ew_bt
epfl=epfl&"<a class=""l-ry"" href="""&replace(epfur,g_gx,replace(epfva,g_ura&epflzz&g_urb&g_ura,g_ura))&""">×"&epflrz&"</a>"
elseif instr(epfva,g_urb&epflzz&g_ura)>0 then
ew_bt=epflrz&","&ew_bt
epfl=epfl&"<a class=""l-ry"" href="""&replace(epfur,g_gx,replace(epfva,g_urb&epflzz&g_ura,g_ura))&""">×"&epflrz&"</a>"
elseif instr(epfva,epflzz&g_urb)>0 then
ew_bt=epflrz&","&ew_bt
epfl=epfl&"<a class=""l-ry"" href="""&replace(epfur,g_gx,replace(epfva,epflzz&g_urb,""))&""">×"&epflrz&"</a>"
elseif instr(epfva&g_urb,epflzz&g_urb)>0 then
ew_bt=epflrz&","&ew_bt
epfl=epfl&"<a class=""l-ry"" href="""&replace(epfur,g_gx,replace(epfva&g_urb,epflzz&g_urb,""))&""">×"&epflrz&"</a>"
elseif instr(epfva,epflzz&g_ura)>0 then
ew_bt=epflrz&","&ew_bt
epfl=epfl&"<a class=""l-ry"" href="""&replace(epfur,g_gx,replace(epfva,epflzz&g_ura,""))&""">×"&epflrz&"</a>"
elseif instr(epfva&g_ura,epflzz&g_ura)>0 then
ew_bt=epflrz&","&ew_bt
epfl=epfl&"<a class=""l-ry"" href="""&replace(epfur,g_gx,replace(epfva&g_ura,epflzz&g_ura,""))&""">×"&epflrz&"</a>"

else
'0
epfval=""
if left(epflzz,1)="0" or left(epflzz,1)="1" then'单选

if instr(epfva,left(epflzz,3))>0 then
epflzj=split(epfva,left(epflzz,3))
epflzjj=split(epflzj(1),g_ura)(0)
epfval=replace(epfva,left(epflzz,3)&epflzjj,epflzz)
else
epfval=epfva&epflzz&g_ura
end if

else'多选

if left(epflzz,1)="2" and instr(epfva,left(epflzz,3))>0 then
epfval=replace(epfva,g_ura&left(epflzz,3),g_ura&epflzz&g_urb&left(epflzz,3))
if left(epfval,len(g_ura))=g_ura then epfval=epfval=right(epfval,len(epfval)-len(g_ura))
elseif left(epflzz,1)<>"2" and instr(epfva,left(epflzz,2))>0 then
epfval=replace(epfva,g_ura&left(epflzz,2),g_ura&epflzz&g_urb&left(epflzz,2))
else
epfval=epfva&epflzz&g_ura
end if

end if

epfl=epfl&"<a class=""l-rx"" href="""&replace(epfur,g_gx,epfval)&""">"&epflrz&"</a>"
'1
end if

end if
end if
next
epfl=epfl&"</p>"
end if
end if
next
epfl=epfl&"</div>"
end if
end if
End Function
'-----------------------------------
'ep allx show
'=epallx()
'-----------------------------------
Function epallx()
if gystop(0,epbid,eplie(s_umlb),epbiao,"","","") then
epallx=gysar
end if
End Function
'-----------------------------------
'ep all show
'=epall()
'-----------------------------------
Function epall()
if e_gdj>1 then
epwhere=replace(epwheremo,"ep_xy>0","ep_xy<9999")
g_app="_"&s_umgl
else
g_app=""
epwhere=epwheremo
end if
g_app=esapm(0,s_udep&g_apj&aiint(ew_sn)&g_app)
if aiint(ew_sn)>0 then
if not ainull(epwhere) then epwhere=epwhere&" and "
epwhere=epwhere&" "&esrew("ep",ew_sn)
end if
if ankck(g_app) then
REM ep_id,1ep_sn,2ep_mc,3ep_dm,4ep_sk,5ep_sx,6ep_bs,7ep_xy,8ep_px,9ep_el,10ep_qx,11ep_ls,12ep_ef
if gystop(i_nmtp,epbid,eplie(s_umlb),epbiao,epwhere,epordermo,"") then
epall=gysar
end if
Call ankop(2,0,ansav(epall),g_app)
else
epall=anreq(ankop(1,0,0,g_app))
end if
End Function
'-----------------------------------
'ep select
'=epselect(0=id/1=mc)
'-----------------------------------
Function epselect(epfid)
dim epselectid,epselectmc
if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi=0 then
epselectid=gysay(1)
epselectmc=gysay(2)
else
epselectid=epselectid&"|"&gysay(1)
epselectmc=epselectmc&"|"&gysay(2)
end if
next
end if
if ew_kj<>"" then
if len(ew_kj)=2 and aibj(left(ep_sn,2),ew_kj) then ew_kj=left(ep_sn,3)
epselectid=ew_kj&"|"&epselectid
epselectmc="公共频道|"&epselectmc
end if
epselectid=epselectid&"|"&s_udbb&"|"&s_udus&"|"&s_uduk&"|"&s_udun&"|"&s_uded
epselectmc=epselectmc&"|"&s_udbbs&"系统"&"|"&s_uduss&"系统"&"|"&s_uduks&"系统"&"|"&s_uduns&"系统|"&s_udeds&"系统"
epselect=aiselect("ep","","","f-s",epfid,epselectid,epselectmc)
End Function
'-----------------------------------
'read zs
'0默认
'1隐藏
'2普通
'3必填
'=epzsd()
'-----------------------------------
Function epzsd(epfstr,epfzs)
epzsd=False
epzsdb=0
epzsda=""
dim zsdlin,zsdli
if epfstr="0" then
zsdlin=split(epfzs,"3=")
if ubound(zsdlin)>0 then
for zsdli=0 to ubound(zsdlin)-1
if zsdli>0 then epzsda=epzsda&","
epzsda=epzsda&right(zsdlin(zsdli),2)
next
if aireqx(epzsda) then epzsd=True
else
if aireqx("bt,sn,xy,tm,nr") then epzsd=True
'response.Write epzsd&now()&aireq("bt")&"----"&aireq("sn")&"----"&aireq("xy")&"----"&aireq("nr")&"----"&aireq("bt")&"----"&aireqx("bt,sn,xy,tm,nr")
end if
else
if not ainull(epfzs) then
zsdlin=instr(epfzs,"#"&epfstr)
if zsdlin>0 then
epzsd=true
epzsda=mid(epfzs,zsdlin+len("#"&epfstr)+2,2)
if left(epzsda,1)="#" then epzsda=""
epzsdb=aiint(mid(epfzs,zsdlin+len("#"&epfstr),1))
end if
end if
end if
End Function
'-----------------------------------
'add/edit form
'=epform()
'-----------------------------------
Function epform(epfty)
if epfty=0 then
ep_ew=ew_sn
ep_el=10
ep_sx=0
ep_bs=1
ep_ef=i_xkfl
ep_ls=2
ep_xy=1
ep_px=0
ep_qw=5
ep_qx=0
else
if ep_xt<>"" then
ep_xt=ep_xt&espxx("修改"&i_gg&e_gmc)
else
ep_xt=espxx("修改"&i_gg&e_gmc)
end if
end if
epform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
epform=epform&icflsr(25,"名称","","mc","",0,50,"*","",ep_mc)&icflsr(25,"短名","","dm","",0,50,"*","",ep_dm)&icflsr(25,"编码","","sn","",3,50,"*请使用小写字母","",ep_sn)&aiinput("hidden","y_sn","",0,0,"","",ep_sn)&icflsr(25,"模版","","sk","",0,50,"如果使用无类板式（没有分类的固定内容频道）建议选用8/ab模板","",ep_sk)
epform=epform&icflxz(25,"状态","xy","","*","f-s",ep_xy,0,i_bxy)&icflxz(25,"色系","sx","","*","f-s",ep_sx,0,i_bsx)&icflxz(25,"板式","bs","","*","f-s",ep_bs,0,i_bepbs)&icflxz(25,"列样","ls","","*请选择列表页面样式","f-s",ep_ls,0,i_bls)
epform=epform&icflxz(25,"投稿","qw","","*","f-s",ep_qw,0,i_bepqw)&icflxz(25,"浏览","qx","","*","f-s",ep_qx,0,i_bepqx)&icflxz(25,"评论","pl","","*是否启用网站评论模块的功能.","f-s",ep_pl,0,i_bpl)&icflxz(25,"评价","pj","","*是否启用网站评价功能.","f-s",ep_pj,0,i_bpj)
epform=epform&icflxz(25,"频搜","sp","","*是否启用频道搜索.","f-s",ep_sp,0,i_bsp)&icflxz(25,"列表","lm","","*网站内容列表是否可以切换不同显示模式.","f-s",ep_lm,0,i_blm)&icflot(25,"网站",ewselect(0,ep_ew))&aiinput("hidden","y_ew","",0,0,"","",ep_ew)&icflot(25,"类型",elselect(ep_el))&aiinput("hidden","y_el","",0,0,"","",ep_el)
epform=epform&icflsr(25,"排序","","px","",6,50,"*","",ep_px)&icflxz(25,"分类","ef","","*","f-s",ep_ef,0,i_bepef)&icflsr(5,"填控","","zs","",0,200,"添加频道内容的表单控制，如：#bt3=必填#pt2=普通#yc1=隐藏#mr0=默认","",ep_zs)
epform=epform&icflsr(10,"参数","","cs","",0,200,"频道内特殊定义的其他参数，特别注意设定后不可修改，可以在后面添加其他参数，否则参数对应容易出错。每个参数使用|隔开，如：品牌|型号|规格|联系方式","",ep_cs)
epform=epform&icflwb(10,"筛选","fl","","",0,2000,"部分频道可自定义分类标签，注释：0(0内容表中的int参数比对)ai=参数~1-10=10以内|11-20=11-20|20-(没有上限可以为空)=20以上#(#表示隔断)1(1单选参数)dx=单选~1=好评|2=差评#2(2或者空:多选)dx=多选~1=好显示器|2=好内存|3=好价格","",ep_fl)
epform=epform&icflwb(10,"其他","ot","","",0,2000,"","",ep_ot)
epform=epform&icflot(10,"规则","特殊参数规则：<br>(#表示一级隔断；~表示二级隔断；=表示三级隔断)（#数字+英文字母=中文标题~参数value1=参数名称1|参数value2=参数名称2......~数字1-10占位比例10份切割）<br>实例：<br>#1cs=参数~1=选项一|2=选项2<br>详细注释：<br>#0(0内容表中的int参数比对 for list search)jg=参数~1-10=10以内|11-20=11-20|20-(没有上限可以为空)=20以上<br>#1(1单选参数)dx=单选~1=好评|2=差评<br>#2(2多选)dx=多选~1=好显示器|2=好内存|3=好价格<br>#3(3填空)tx(字母可为空)=填空项目名~默认值<br>#4(4数字填空)tx(字母可为空)=填空项目名~默认值<br>#9(9隔断标题)=标题名称~其他参数")
epform=epform&icflot(10,"内容",esedit(ep_nr,"nr",2))
epform=epform&"</ul><ul>"&icflot(10,"点评",eseditxt(ep_xt,"xt",1))
epform=epform&icflot(10,"验证",eskyx(1,2,2))
if epfty=1 then
epform=epform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",ep_id)&aibutton(1,"","","f-sb f-skx",s_ztcz)&"<input type=""checkbox"" name=""lian"" value=""1""> 联动处理(修改编码的时候建议启用)")
elseif epfty=0 then
epform=epform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
epform=epform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=epadd()
'-----------------------------------
Function epadd()
ew_bt=s_umtjs&s_udeps&","&ew_bt:ew_zt=s_umtjs&s_udeps&","&ew_zt:ew_nr=s_umtjs&s_udeps&","&ew_nr
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_udeps&"</a></li>"
e_mt=esbts(s_udxep,s_udlep,s_umtjs&s_udeps&g_gy&e_lj1,s_udeps&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("ew,mc,sn,dm,xy") then
if gysfm(eplie("form"),epbiao,"ep_sn='"&aistr(aireq("sn"))&"' and ep_ew="&aiint(aireq("ew"))&"","ep_",1) then
e_ma=e_ma&aitiao(s_umtjs&s_udeps&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udep&g_apj))
else
e_ma=e_ma&aigo(s_umtjs&s_udeps&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_udeps&s_ztsb,1)
end if
else
e_ma=epform(0)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=epedit()
'-----------------------------------
Function epedit()
ew_bt=s_umxgs&s_udeps&","&ew_bt:ew_zt=s_umxgs&s_udeps&","&ew_zt:ew_nr=s_umxgs&s_udeps&","&ew_nr
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udep&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_udeps&"</a></li>"
e_mt=esbts(s_udxep,s_udlep,s_umxgs&s_udeps&g_gy&eshref(s_umgl&g_urg&s_udep&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_udeps&g_gy&e_lj1&g_gx&s_udeps&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("ew,mc,sn,dm,xy") then
if gysfm(eplie("form"),epbiao,"ep_id="&aiint(aireq("id"))&" or (ep_id<>"&aiint(aireq("id"))&" and ep_sn='"&aistr(aireq("sn"))&"'  and ep_ew="&aiint(aireq("ew"))&")","ep_",2) then
dim epdsai,epdsef
if aireq("ew")<>aireq("y_ew") and aireq("lian")="1" then'处理内容分类网站id更换,内容太多速度会比较慢。
epdsai="ai_ew="&aireq("ew")&""
epdsef="ef_ew="&aireq("ew")&""
end if
if aireq("el")<>aireq("y_el") and aireq("lian")="1" then
if epdsai<>"" then epdsai=epdsai&","
epdsai=epdsai&"ai_el="&aireq("el")&""
if epdsef<>"" then epdsef=epdsef&","
epdsef=epdsef&"ef_el="&aireq("el")&""
end if
if aireq("sn")<>aireq("y_sn") and aireq("lian")="1" and esrfd(0,ep_sn,ew_kj)<>"1" then
if epdsai<>"" then epdsai=epdsai&","
epdsai=epdsai&"ai_ep='"&aireq("sn")&"'"
if epdsef<>"" then epdsef=epdsef&","
epdsef=epdsef&"ef_ep='"&aireq("sn")&"'"
end if
if epdsai<>"" then
if gysgx(w_dbqz&"ai",epdsai,"ai_ep='"&aireq("y_sn")&"'") then e_ma=e_ma&"内容已更新<br>"
end if
if epdsef<>"" then
if gysgx(w_dbqz&"ef",epdsef,"ef_ep='"&aireq("y_sn")&"'") then e_ma=e_ma&"分类已更新<br>"
end if
e_ma=e_ma&aitiao(s_umxgs&s_udeps&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udep&g_apj))
else
e_ma=e_ma&aigo(s_umxgs&s_udeps&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_udeps&s_ztsb,1)
end if
else
if gysread(eplie("all"),epbiao,"ep_id="&aiint(g_u3)&"","") then
ew_bt=ep_mc&","&ew_bt:ew_zt=ep_mc&","&ew_zt:ew_nr=ep_mc&","&ew_nr
e_ma=epform(1)&e_ma
else
e_ma=e_ma&aigo(s_udeps&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=epdel()
'-----------------------------------
Function epdel()
ew_bt=s_udeps&s_umscs&","&ew_bt:ew_zt=s_udeps&s_umscs&","&ew_zt:ew_nr=s_udeps&s_umscs&","&ew_nr
e_wl=e_wl&"<li>"&s_udeps&s_umscs&"</li>"
e_mt=esbts(s_udxep,s_udlep,s_umscs&s_udeps,s_umtjs&s_udeps&g_gy&e_lj1&g_gx&s_udeps&s_umlbs&g_gy&e_lj0)
if e_gdj>2 then
if aiint(g_u3)>0 then
if gysdel(epbid,epbiao,"ep_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_udeps&s_umscs&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udep&g_apj))
else
e_ma=e_ma&aigo(s_udeps&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(epbid,epbiao,esrew("ep",ew_sn)) then
e_ma=e_ma&aitiao(s_udeps&s_umscs&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udep&g_apj))
else
e_ma=e_ma&aigo(s_udeps&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'list
'=eplist()
'-----------------------------------
Function eplist()
e_mt=esbts(s_udxep,s_udlep,s_udeps&s_umlbs&g_gy&e_lj0,"<i>"&s_umtjs&s_udeps&"</i>"&g_gy&e_lj1)
if esky(1,e_gdj) then
if gysfm(eplie(s_umlb&"s"),epbiao,1,"ep_",22) then
e_ma=e_ma&aitiao(s_umxgs&s_udeps&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udep&g_apj))
else
e_ma=e_ma&aigo(s_umxgs&s_udeps&s_ztsb,1)
end if
else
if aiint(ew_sn)>0 then
epwhere=epwhere&esrew("ep",ew_sn)
end if
'@@ep_id,1ep_sn,2ep_mc,3ep_dm,4ep_sk,5ep_sx,6ep_bs,7ep_xy,8ep_px,9ep_el,10ep_qx,11ep_ls,12ep_ef
if gystop(i_nmtp,epbid,eplie(s_umlb),epbiao,epwhere,epordermo,"") then
e_ma=e_ma&"<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi mod 2=0 then
e_lcss="l-1"
else
e_lcss="l-2"
end if
if aiint(gysay(7))>1 then
e_lcss=e_lcss&" ft"
elseif aiint(gysay(7))<1 then
e_lcss=e_lcss&" ftq"
end if
e_ma=e_ma&icflsr("25 "&e_lcss,"名称","","mc","",0,50,"*","",gysay(2))&icflsr("25 "&e_lcss,"短名","","dm","",0,50,"*","",gysay(3))&icflxz("25 "&e_lcss,"状态","xy","","*","f-s",gysay(7),0,i_bxy)&icflxz("25 "&e_lcss,"色系","sx","","*","f-s",gysay(5),0,i_bsx)
e_ma=e_ma&icflsr("25 "&e_lcss,"编码","","sn","",0,50,"*","",gysay(1))&icflsr("25 "&e_lcss,"风格","","sk","",0,50,"*","",gysay(4))&icflsr("25 "&e_lcss,"排序","","px","",6,50,"*","",gysay(8))&icflot("25 "&e_lcss,"",aiinput("hidden","id","",0,0,"","",gysay(0))&aibutton(2,"","","f-sb","快速"&s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udep&g_urg&s_umxg&g_urg&gysay(0)&g_urz,77),"","","","f-sb","详细"&s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udep&g_urg&s_umsc&g_urg&gysay(0)&g_urg&gysay(1)&g_urz,77),s_umscs&s_udeps&s_ztqr,"","","f-sb",s_umscs))&"<div class=cr></div>"
next
e_ma=e_ma&icflot(10,"验证",eskyx(1,2,2))
e_ma=e_ma&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aibutton(1,"","","f-sb f-skx",s_ztcz)&aibuttonk(eshref(s_umgl&g_urg&s_udep&g_urg&s_umsc&"-x"&g_urz,77),s_umscs&s_udeps&s_ztqr,"","","f-sb f-skx","清空"))
e_ma=e_ma&"<div class=cr></div></ul></form></div>"
else
'e_ma=e_ma&aigo(s_udeps&s_ztno,e_lj1)
end if
end if
End Function
%>