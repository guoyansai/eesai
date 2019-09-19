<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/dim.asp"--><!--#include file="../../AsaiUser/AsaiUser.asp"--><!--#include file="../../AsaiInc/inc.asp"--><!--#include file="../../AsaiInc/asai.asp"--><%
'RESPONSE.Write Request.ServerVariables("QUERY_STRING")
if Request.ServerVariables("QUERY_STRING")="login" then
%>
document.write("<table width=100% height=180 border=0 cellpadding=2 cellspacing=5>");
<%if aiint(e_uid)>0 then
if not ainull(e_ubt) and e_ubt<>"0" then%>
document.write("<tr><td class=m-ls>名称：</td><td class=m-lim><%=e_ubt%></td></tr>");
<%else%>
document.write("<tr><td class=m-ls>帐户：</td><td class=m-lim><%=e_uer%></td></tr>");
<%end if%>
document.write("</td></tr>");
document.write("<tr><td class=m-ls>状态：</td><td class=m-lim><%=aiarr(i_bxy,"|",e_uxy)%></td></tr>");
<%if aiint(e_uzy)>0 then%>
document.write("（<%=aiarr(i_buszy,"|",e_uzy)%>）");
<%end if%>
document.write("</td></tr>");
document.write("<tr><td class=m-ls width=44>邮箱：</td><td class=m-lim><%=e_uem%>");
<%if aiint(e_uxy)=<aiint(ew_sh) then%>
document.write("&nbsp;<a href=<%=eshref(s_druser&"?email/1"&g_urz,3)%>><b>验证&gt;&gt;</b></a>");
<%end if%>
document.write("<tr><td class=m-ls></td><td class=m-lim><%=REPLACE(aibuttonk(u_user,"","","","f-sb","我的后台")&aibuttonk(u_exit,"","","","f-sb","退出"),"""","")%></td></tr>");
document.write("</table>");

<%else%>
document.write("<form id=AsaiForm name=AsaiForm action=<%=u_login%> method=post><tr><td class=m-ls width=44>帐户：</td><td class=m-lim>");
document.write("<%=REPLACE(REPLACE(aiinput("","zhanghu","",3,50,"","f-d",""),"""","")," value= /","")%>");
document.write("</td></tr><tr><td class=m-ls>密码：</td><td class=m-lim>");
document.write("<%=REPLACE(REPLACE(aiinput("password","mima","",3,50,"","f-d",""),"""","")," value= /","")%>");
document.write("</td></tr><tr><td class=m-ls>验证：</td><td class=m-lim>");
document.write("<%=REPLACE(REPLACE(REPLACE(replace(eskyx(0,0,0),"验证：",""),"""","")," value= /",""),"><strong"," style=width:22px><strong")%>");
document.write("</td></tr><tr><td class=m-ls></td><td class=m-lim>");
document.write("<%=REPLACE(aibutton(2,"","","f-sb f-skx","账户登录")&aibuttonk(u_reg,"","","","f-sb","注册"),"""","")%>");
document.write("</td></tr></form>");
<%end if%>
document.write("</table>");
<%
else
if aiint(e_uid)>0 then
if ainull(e_ubt) then
response.Write("document.write('<li><a target=""_blank"" href="""&u_user&"""><span class=""glyphicon glyphicon-user""></span> "&e_uer&"</a></li>');")
else
response.Write("document.write('<li><a target=""_blank"" href="""&u_user&""" title="""&e_uer&"""><span class=""glyphicon glyphicon-user""></span> "&e_ubt&"</a></li>');")
end if
if i_xktx=1 then
Call opendb(i_dir)
if gysread("us_ux,us_uy",usbiao,"us_id="&e_uid&"","") then
if aiint(us_ux)>0 or aiint(us_uy)>0 then response.Write("document.write('<script language=""JavaScript"" charset=""utf-8"" src=""http://x.780.pub/js/_asaitishi.js""></script><script>asaitishi(1,1);</script>');")
if aiint(us_ux)>0 then response.Write("document.write('<li><a href="&eshref(s_udux&g_urz,66)&"><B><span class=""glyphicon glyphicon-envelope""></span> "&us_ux&"</B>条新信息</a></li>');")
if aiint(us_uy)>0 then response.Write("document.write('<li><a href="&eshref(s_uduy&g_urz,66)&"><B><span class=""glyphicon glyphicon-shopping-cart""></span> "&us_uy&"</B>条新交易</a></li>');")
end if
end if
response.Write("document.write('<li><a target=""_top"" href="""&u_exit&"""><span class=""glyphicon glyphicon-log-out""></span> 退出</a>');")
else
response.Write("document.write('<li><a target=""_blank"" href="""&u_reg&""" title=""访客IP："&aiip()&"""><span class=""glyphicon glyphicon-user""></span> 新用户注册</a></li><li class=""y-ta""><a target=""_blank"" href="""&u_login&"""><span class=""glyphicon glyphicon-log-in""></span> 登录 <span class=""caret""></span></a><div class=""y-tac"">登录好处：<br>1、发布信息；<br>2、参与点评；<br>3、编辑信息；<br>4、专属后台；<br>5、站内短信；<br>6、更多功能。</div></li>')")
end if
end if
%>