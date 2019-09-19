<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"--><%call esq()%><!--#include file="../inc.asp"--><%=pdt("Asai系统内容自动填充器")%>
<body>
<%
if not pqx(3) then
response.Write "对不起，您无权使用本功能！"
else
const finmstr="自动填充Auto的内容Content用来生成不同长度标题查看显示效果"
dim finty,finsl,finsq,finjici,finbt,finsnl
finsnl=0
finty=request("fty")
finsq=request("fsq")
finsl=aiint(request("fsl"))
if finsq="" then finsq="测试内容"
if finsl=0 then finsl=10
if finty="" then finty="0"
finjici=0
%>
<div class=g-lt>Asai系统内容自动填充器：</div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll0>填充频道：<select name="fty" id="fty">
<option value="0">填充全部</option>
<option value="1">填充分类</option>
<%if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysaybb=split(gysax(gysi),g_gy)
response.Write "<option value="""&gysaybb(1)&""">"&gysaybb(2)&"</option>"
next
end if%></select>
前缀字符：<%=aiinput("","fsq","100px",0,88,"","",finsq)%> 填充数量(注意:是每个栏目填充的数量)：<%=aiinput("","fsl","66px",6,8,"","",finsl)%>
</li>
<li class=g-ll1><%=aiinput("hidden","ty","",0,0,"","","act")%><input type="submit" name="act" value="点击填充" /></li>
</form>
</ul></div>

<%if aibj(request("ty"),"act") then
'class in
function finfin(fifnm)
dim fidj,fidjj,fidk,fidki,fidkk,fidkki
dim fidlsx,fidldx,fidljx,fidlxx
fidj=0
fidjj=0
'@@ep_id,1ep_sn,2ep_mc,3ep_dm,4ep_sk,5ep_sx,6ep_bs,7ep_xy,8ep_px,9ep_el,10ep_qx,11ep_ls,12ep_ef
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if aibj(gysay(12),"5") then'0-b
response.Write(vbNewLine&vbNewLine&"无类频道：【"&gysay(2)&"】"&vbNewLine)
else'0-b-1
response.Write(vbNewLine&vbNewLine&"频道：【"&gysay(2)&"】"&vbNewLine)
Randomize
fidk=int(fifnm*Rnd)+2
for fidki=1 to fidk
fidj=fidj+1
fidlsx="0"
fidldx="0"
fidljx=1
fidlxx=right("000000"&fidj,6)
if gysin(efbiao,"ef_ew,ef_el,ef_ep,ef_sx,ef_dx,ef_jx,ef_xx,ef_sn,ef_bt,ef_xy",""&ew_sn&","&gysay(9)&",'"&gysay(1)&"','"&fidlsx&"','"&fidldx&"',"&fidljx&",'"&fidlxx&"','"&gysay(1)&"efcs"&fidj&"','"&gysay(3)&"分类"&fidj&"',2","")  then
response.Write("[成功"&fidj&"] ")
else
response.Write("[失败"&fidj&"] ")
end if

Randomize
fidkk=int(fifnm*Rnd)+1
Randomize
fidkk=int(fidkk*Rnd)+1
if fidkk mod 2=0 then
Randomize
fidkk=int(fifnm*Rnd)+4
for fidkki=1 to fidkk
fidjj=fidjj+1
fidlsx=gysay(1)&"efcs"&fidj
fidldx=gysay(1)&"efcs"&fidj
fidljx=2
fidlxx=right("000000"&fidj,6)&right("000"&fidjj,3)
if gysin(efbiao,"ef_ew,ef_el,ef_ep,ef_sx,ef_dx,ef_jx,ef_xx,ef_sn,ef_bt,ef_xy",""&ew_sn&","&gysay(9)&",'"&gysay(1)&"','"&fidlsx&"','"&fidldx&"',"&fidljx&",'"&fidlxx&"','"&gysay(1)&"efcs"&fidj&"-"&fidjj&"','"&gysay(3)&"分类"&fidj&"-"&fidjj&"',1","")  then
response.Write("[成功"&fidj&"-"&fidjj&"] ")
else
response.Write("[失败"&fidj&"-"&fidjj&"] ")
end if
next
end if

next

end if'0-b-2
next
end function
'content in
function fins(fifnm,fifep,fifel,fifef,fifbt)
dim ffdii
for ffdii=1 to aiint(fifnm)
if fifef="" and ffdii>6 then exit for
Randomize
ai_xy=int(4*Rnd)+1
finsnl=finsnl+1
ai_sn="CE"&right(aisn(2),4)&finsnl
response.Cookies(g_cksn)=""
Randomize
ai_tm=date()+(int(finjici*Rnd)-7)
Randomize
ai_up=int(9*Rnd)
if ai_up>0 and ai_up<7 then
ai_up="n"&ai_up&".jpg"
else
ai_up=""
end if

'EESAI------0

if left(fifel,1)=8 then
'交易类8
'10	商品系统80
'11	竞拍系统81
'12	供应系统82
'13	求购系统83
'+订金系统84
'+定金系统85
'+招标系统86
'+悬赏系统87
'+服务系统88
'81竞拍系统
ai_jg=9
ai_jy=1000
ai_oy=188
ai_oz=88
'___________________________________________________________________________________89
'___________________________________________________________________________________60
elseif left(fifel,1)=6 then
'介绍类6
'2	产品系统60
'8	下载系统61
'5	人才招聘62
'6	友情链接63
'招标展示64
'需求发布65
ai_uf=ew_bt
ai_jg=9000
ai_jy=20000
ai_oy=188
ai_oz=88
'___________________________________________________________________________________69
'___________________________________________________________________________________20
elseif left(fifel,1)=2 then
'媒体类2
'7	图片系统20
'4	资质证书21
'9	媒体系统22
'22媒体系统
Randomize
ai_uf="n"&int(6*Rnd)+1&".jpg"
'___________________________________________________________________________________29
'___________________________________________________________________________________10
else
'文章类1
'1	文章系统10
'3	关于我们11
'14	短文系统12
'15	单页系统13
'___________________________________________________________________________________19
end if
'EESAI------1
ai_bt=fifbt&finjici
ai_ss=ai_bt
Randomize
ai_bt=ai_bt&left(finmstr,int(len(finmstr)*Rnd))
ai_bt=right(ai_bt,int(len(ai_bt)*Rnd+1))
if gysin(eabiao,"ai_ew,ai_ep,ai_el,ai_ef,ai_xy,ai_sn,ai_bt,ai_ss,ai_tm,ai_up,ai_uf,ai_cs,ai_jg,ai_jy,ai_oy,ai_oz,ai_us",""&ew_sn&",'"&fifep&"',"&fifel&",'"&fifef&"',"&aiint(ai_xy)&",'"&ai_sn&"','"&ai_bt&"','"&ai_ss&"','"&ai_tm&"','"&ai_up&"','"&ai_uf&"','"&ai_cs&"',"&aiint(ai_jg)&","&aiint(ai_jy)&","&aiint(ai_oy)&","&aiint(ai_oz)&",'"&e_uer&"'","")  then
response.Write("[成功"&finjici&"] ")
finjici=finjici+1
else
response.Write("[失败"&finjici&"] ")
end if
next
end function
%>
<div class=g-lt>填充结果报告如下：</div>
<div class=g-ll><ul>
<li class=g-ll0><textarea style="width:80%;height:280px;">
<%
if epall<>"" then'0-a-2
if finty="1" then
Call finfin(finsl)
elseif finty<>"" and finty<>"0" then
Call epread(finty)
if aiint(ep_id)>0 then
if aibj(ep_ef,"5") then
response.Write(vbNewLine&vbNewLine&"无类频道：【"&ep_mc&"】"&vbNewLine)
finbt=finsq&ep_mc&ep_sn
Call fins(finsl,ep_sn,ep_el,"",finbt)
else
response.Write(vbNewLine&vbNewLine&"频道：【"&ep_mc&"】"&vbNewLine)
gysaxbb=split(efall(ep_sn),g_gx)
for gysibb=0 to ubound(gysaxbb)
gysaybb=split(gysaxbb(gysibb),g_gy)
if ubound(gysaybb)>0 then
response.Write(vbNewLine&ep_mc&"：("&gysaybb(7)&")"&vbNewLine)
finbt=finsq&gysaybb(7)&gysaybb(6)&ep_mc&ep_sn
Call fins(finsl,ep_sn,ep_el,gysaybb(6),finbt)
end if
next
end if
else
response.Write("不存在：【"&finty&"】")
end if
else
'@@ep_id,1ep_sn,2ep_mc,3ep_dm,4ep_sk,5ep_sx,6ep_bs,7ep_xy,8ep_px,9ep_el,10ep_qx,11ep_ls,12ep_ef
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if aibj(gysay(12),"5") then'0-b
response.Write(vbNewLine&vbNewLine&"无类频道：【"&gysay(2)&"】"&vbNewLine)
finbt=finsq&gysay(2)&gysay(1)
Call fins(finsl,gysay(1),gysay(9),"",finbt)
else'0-b-1
response.Write(vbNewLine&vbNewLine&"频道：【"&gysay(2)&"】"&vbNewLine)
'@@ef_id,1ef_ew,2ef_sx,3ef_dx,4ef_jx,5ef_xx,6ef_sn,7ef_bt,8ef_ot,9ef_up,10ef_tm,11ef_xi,12ef_xy,13ef_ep,14ef_nr
gysaxbb=split(efall(gysay(1)),g_gx)
for gysibb=0 to ubound(gysaxbb)
'response.Write gysaxbb(gysibb)&"|<br>"&vbNewLine
gysaybb=split(gysaxbb(gysibb),g_gy)
if ubound(gysaybb)>0 then
response.Write(vbNewLine&gysay(2)&"：("&gysaybb(7)&")"&vbNewLine)
finbt=finsq&gysaybb(7)&gysaybb(6)&gysay(2)&gysay(1)
Call fins(finsl,gysay(1),gysay(9),gysaybb(6),finbt)
end if
next
end if'0-b-2
next
end if
end if'0-a-2
%></textarea>
</li>
</ul></div>
<%end if
end if%>
<%=pde("")%></body>
</html><!--#include file="../../AsaiInc/incma.asp"-->