<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"--><%call esq()%><!--#include file="../inc.asp"--><%=pdt("Asai系统图片转移工具")%>
<body>
<%
if not pqx(3) then
response.Write "对不起，您无权使用本功能！"
else
%>
<div class=g-lt>Asai系统图片转移工具：</div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll0>
原图链接前缀：<%=aiinput("","tury","",0,200,"","f-u",p_upwur)%>
原图文件夹前缀：<%=aiinput("","tdry","",0,200,"","f-u",p_upwdr)%>
</li>
<li class=g-ll1>
现图链接前缀：<%=aiinput("","tur","",0,200,"","f-u","")%>
现图文件夹前缀：<%=aiinput("","tdr","",0,200,"","f-u","")%>
</li>
<li class=g-ll0>
转移操作类型：<select name="tty" id="tty">
<option value="0">将有效图片转移到新位置</option>
<option value="1">将有效图片转移到新位置+标准化系统图片链接地址</option>
<option value="2">将所有图片保存到新位置+标准化系统图片链接地址</option>
</select>
</li>
<li class=g-ll1><%=aiinput("hidden","ty","",0,0,"","","act")%><input type="submit" name="act" value="确认开始图片转移" /></li>
</form>
</ul></div>
<%end if%>
<%=pde("")%></body>
</html><!--#include file="../../AsaiInc/incma.asp"-->