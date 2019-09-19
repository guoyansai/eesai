<!--#include file="../../AsaiInc/g.asp"--><%
Const esv_char="utf-8"
dim esvfile
esvfile=Request.ServerVariables("QUERY_STRING")
%><!--#include file="../inc.asp"--><%=pdt("阿赛网站通用配置文件在线管理")%>
<body>
<%
if not pqx(3) then
response.Write "对不起，您无权使用本功能！"
else
'-----------------------------------
'PS:request
'=esvreq("esvsss")
'-----------------------------------
Function esvreq(esvsss)
if not isnull(esvsss) then
esvsss=request(esvsss)
esvsss=Replace(esvsss,"'","")
esvsss=Replace(esvsss,"""","")
esvsss=Replace(esvsss,VbCrlf,"")
esvsss=Replace(esvsss,CHR(10),"")
esvsss=Replace(esvsss,CHR(13),"")
esvsss=Replace(esvsss,"<","<")
esvsss=Replace(esvsss,">",">")
esvreq=trim(esvsss)
else
esvreq=""
end if
end Function
'-----------------------------------
'PS:read
'=esvread("esvsss")
'-----------------------------------
Function esvread(esvsss)
if not isnull(esvsss) then
esvsss=Replace(esvsss,"<","<")
esvsss=Replace(esvsss,">",">")
esvread=trim(esvsss)
else
esvread=""
end if
end Function
'-----------------------------------
'PS:make char to oneline
'=esvone("esvsss")
'-----------------------------------
Function esvone(esvsss)
if not isnull(esvsss) then
esvsss=Replace(esvsss,VbCrlf,"")
esvsss=Replace(esvsss,CHR(10),"")
esvsss=Replace(esvsss,CHR(13),"")
esvone=trim(esvsss)
else
esvone=""
end if
end Function
'-----------------------------------
'PS:get file name
'=esvnm("esvsss")
'-----------------------------------
Function esvnm(esvsss)
if not isnull(esvsss) then
dim esvnumm
esvnumm=split(esvsss,".")
esvnm=esvnumm(0)
else
esvnm=""
end if
end Function
'-----------------------------------
'PS:Save The Value
'=esvsave("/esvffile.asp",esvsss)
'-----------------------------------
Function esvsave(esvffile,esvsss)
esvsss="<"&"%"&vbcrlf&esvsss&"%"&">"
esvsave=anfile(2,esv_char,0,esvsss,esvffile)
response.write "<div class=g-ll><ul><li class=g-ll0><a href=?"&esvfile&">操作已完成！<br /><br />注意：如果没有修改成功，请确认空间支持FSO，并赋予网站所在文件夹可读写特权。<br />若多次不成功，请直接使用记事本打开"&esvffile&"文件按说明修改。</a></li></ul></div>"
end Function
'-----------------------------------
'PS:The Main
'=esvconfig("esvffile.asp")
'-----------------------------------
Sub esvconfig()
if not ainull(esvfile) then
dim esvsx,esvnum,esvstr,esvrr,esvii,esvrra,esvuda,esviib,esvbss,esvrrb,esvudb,esvrrc,esvudc,esvrrd,esvudd,esvsv,esvsvl
response.Write "<form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"">"
esvstr=anfile(1,esv_char,0,0,esvfile)
esvrr=split(esvstr,CHR(10))
if left(aireq("EESai"),4)="asai" and aireqx("esvf") then
response.Write "<div class=g-lt>阿赛网站配置文件在线管理-"&esvfile&"</div>"
for esvii=0 to ubound(esvrr)
'response.Write esvone(esvrr(esvii))&"<br />"
esvrra=split(esvone(esvrr(esvii)),"'")
esvuda=ubound(esvrra)
if esvuda=1 then

if esvrra(0)="" then
esvsv=esvsv&"'"&esvrra(1)&vbcrlf
else
esvrrb=split(esvrra(0),"=")
esvudb=ubound(esvrrb)
if esvudb>0 then
esvrrc=split(esvrra(1),":")
esvudc=ubound(esvrrc)
esvnum=0
if esvudc=0 then
esvrrc=split(esvrra(1),"-")
esvudc=ubound(esvrrc)
esvnum=1
end if
if esvnum=1 then
esvsvl=esvreq(replace(esvrrb(0),"const ",""))
else
esvsvl=chr(34)&esvreq(replace(esvrrb(0),"const ",""))&chr(34)
end if
esvsv=esvsv&esvrrb(0)&"="&esvsvl&""
esvsv=esvsv&"'"&esvrra(1)&vbcrlf
end if
end if
end if
next

if esvsv<>"" and esvreq("esvf")<>"" then Call esvsave(esvfile,esvsv)

else
for esvii=0 to ubound(esvrr)
'response.Write esvone(esvrr(esvii))&"<br />"
esvrra=split(esvone(esvrr(esvii)),"'")
esvuda=ubound(esvrra)
if esvuda=1 then
if esvrra(0)="" then
if aiint(esvsx)>0 then response.Write "</ul></div>"
esvsx=0
response.Write "<div class=g-lt>"&replace(replace(esvrra(1),"}",""),"{","")&"-"&esvfile&"</div><div class=""g-ll""><ul>"
else
esvrrb=split(esvrra(0),"=")
esvudb=ubound(esvrrb)
if esvudb>0 then
if esvudb>1 then
for esviib=0 to esvudb
if esviib=0 then
esvbss=esvrrb(0)&g_gx
elseif esviib=esvudb then
esvbss=esvbss&esvrrb(esviib)
else
esvbss=esvbss&esvrrb(esviib)&"="
end if
next
esvrrb=split(esvbss,g_gx)
esvudb=ubound(esvrrb)
end if
esvrrc=split(esvrra(1),":")
esvudc=ubound(esvrrc)
esvnum=0
if esvudc=0 then
esvrrc=split(esvrra(1),"-")
esvudc=ubound(esvrrc)
esvnum=1
end if
if esvudc=1 then
esvsx=esvsx+1
esvrrd=split(esvrrc(1),"*")
esvudd=ubound(esvrrd)
if esvsx mod 2=0 then:response.Write "<li class=""g-ll1"">":else:response.Write "<li class=""g-ll0"">":end if
if esvudd=1 then
response.Write esvrrc(0)&"："&aiselect(replace(esvrrb(0),"const ",""),"","","f-sa",replace(esvread(esvrrb(1)),"""",""),0,esvrrd(0))
response.Write esvrrd(1)
else
response.Write esvrrc(0)&"："&aiinput("",replace(esvrrb(0),"const ",""),"188px",0,2000,"","f-a|f-b|f-c",replace(esvread(esvrrb(1)),"""",""))

if esvrrc(1)="i" then
response.Write "<iframe src=""../../AsaiUpLoad/?0|1|"&esvnm(replace(esvread(esvrrb(1)),"""",""))&"|"&i_dir&i_msk&"img/|2|AsaiForm|"&replace(esvrrb(0),"const ","")&"|0|0|0|0.ees"" style=""background-color:transparent;"" frameborder=0 scrolling=no width=""258"" height=""22""></iframe>"
else
response.Write esvrrc(1)
end if

end if
response.Write "</li>"
end if

end if
end if
end if
next
response.Write "<li class=g-ll0>"&aiinput("hidden","EESai","",0,0,"","","asai")&aibutton(2,"","","f-sb f-skx","修改配置文件")&aiinput("hidden","esvf","",0,0,"","",esvfile)&aibutton(1,"","","f-sb f-skx","重置")&"</li>"
response.Write "</form></ul></div>"
end if

end if
End Sub
Call esvconfig()
end if%>
<div class=g-lt>使用须知（请在使用前阅读）：</div>
<div class=g-ll><ul>
<li class=g-ll0>1、此功能需要空间支持FSO；</li>
<li class=g-ll1>2、网站风格（CSS文件）所在文件夹必须设置属性为可读写；</li>
<li class=g-ll0>3、必须正确设置网站的网站所在的文件夹(网站根目录)；</li>
<li class=g-ll1>4、请不要在网站访问高峰期使用该功能；</li>
<li class=g-ll1>5、该功能需要服务器支持大数据写入(部分服务器默认设置为不支持大数据的FSO写入操作)；</li>
<li class=g-ll0>6、请注意操作前一定要备份，以防发生未知错误。</li>
</ul></div>
<%=pde("")%></body>
</html>