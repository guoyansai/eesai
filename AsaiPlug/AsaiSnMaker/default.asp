<!--#include file="../../AsaiInc/g.asp"--><!--#include file="../inc.asp"--><%=pdt("Asai系统SN随机生成")%>
<body>
<%
if not pqx(0) then
response.Write "对不起，您无权使用本功能！"
else

dim rfty,rfsl,rfsq,rfii
rfty=aiint(request("fty"))
rfsq=request("fsq")
rfsl=aiint(request("fsl"))
if rfsq="" then rfsq="AI"
if rfsl=0 then rfsl=1
if rfty=0 then
rfty=11
elseif rfty=1 then
rfty=7
end if
%>
<div class=g-lt>使用须知（请在使用前阅读）：</div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll0>生成类型：<%=aiselect("fty","","","",aiint(request("fty")),0,"0随机生成SN(11位)|1随机生成辨识符(7位)")%> 前缀字符：<%=aiinput("","fsq","100px",0,88,"","",rfsq)%> 生成数量：<%=aiinput("","fsl","66px",6,8,"","",rfsl)%></li>
<li class=g-ll1><%=aiinput("hidden","ty","",0,0,"","","act")%><input type="submit" name="act" value="点击生成" /></li>
</form>
</ul></div>
<%if aibj(request("ty"),"act") then%>
<div class=g-lt>生成结果如下：</div>
<div class=g-ll><ul>
<li class=g-ll0><textarea style="width:80%;height:280px;">
<%
for rfii=1 to rfsl
if rfii=1 then
response.Cookies("asaisnsuiji")=right(aisn(1),rfty)&","
response.Write rfsq&right(aisn(1),rfty)
call aisn(0)
elseif rfty=1 then
'拓展功能保留
if InStr(request.Cookies("asaisnsuiji"),right(aisn(1),rfty)&",")>0 then
call aisn(0)
rfii=rfii-1
else
response.Cookies("asaisnsuiji")=request.Cookies("asaisnsuiji")&right(aisn(1),rfty)&","
response.Write vbNewLine&rfsq&right(aisn(1),rfty)
call aisn(0)
end if

else
if InStr(request.Cookies("asaisnsuiji"),right(aisn(1),rfty)&",")>0 then
call aisn(0)
rfii=rfii-1
else
response.Cookies("asaisnsuiji")=request.Cookies("asaisnsuiji")&right(aisn(1),rfty)&","
response.Write vbNewLine&rfsq&right(aisn(1),rfty)
call aisn(0)
end if
end if
next
response.Cookies("asaisnsuiji")=""
%></textarea>
</li>
</ul></div>
<%end if
end if%>
<%=pde("")%></body>
</html>