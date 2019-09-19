<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"--><%Call esq()%><!--#include file="../inc.asp"--><%=pdt("Asai系统缓存管理")%>
<body>
<%
'-----------------------------------
'重建索引
'-----------------------------------
Function amasy()
if w_dbty=1 then
Call opendb(i_dir)
'ASP调用储存过程
Dim adoComm
'创建一个对象，我们用来调用存储过程
Set adoComm = CreateObject("ADODB.Command")
With adoComm
'设置连接，设 adoConn 为已经连接的 ADODB.Connection 对象
.ActiveConnection = adoConn
'类型为存储过程，adCmdStoredProc = 4
.CommandType = 4
'存储过程名称
.CommandText = "EESAI_INDEX"
'设置用户编号
.Parameters.Item("@tbname").Value = "ees_ai"
.Parameters.Item("@CLUSTERED").Value = 0
'执行存储过程
.Execute
'取得从存储过程返回的用户名称
amasy="结果：" & .Parameters.Item("@return_value").Value
End With
'释放对象
Set adoComm = Nothing
else
amasy=""
end if
End Function
'-----------------------------------
'清理系统文件夹内容
'-----------------------------------
Function amadr(amfstr)
if ainull(amfstr) then
amadr=anappdel(1,w_sn)
amadr=amadr&anfiledel(1,g_apdr)
amadr=amadr&"全数清空完毕(复位成功)！"
elseif amfstr="1" or amfstr="0" then
amadr=ankop(0,1,0,esapm(2,""))&"清理【"&i_hc2&g_apj&s_udew&aiint(ew_sn)&g_apj&"】缓存（完成）<br>"
amadr=amadr&ankop(0,1,0,esapm(3,""))&"清理【"&i_hc3&g_apj&s_udew&aiint(ew_sn)&g_apj&"】缓存（完成）<br>"
amadr=amadr&ankop(0,1,0,esapm(4,""))&"清理【"&i_hc4&g_apj&s_udew&aiint(ew_sn)&g_apj&"】缓存（完成）<br>"
else
amadr=ankop(0,1,0,amfstr)&"清理【"&amfstr&"】缓存（完成）<br>"
end if
End Function
'-----------------------------------
'清理网站信息详细内容
'-----------------------------------
Function amanr(amfty,amfstr)
' 单个清理amfty=11,12,13
'一键快速清理相关缓存amfty=6
'一键深度清理相关缓存amfty=9
'清理整站范围的页面调用缓存cx/web1/all/
if amfty=16 or amfty=9 then amanr=amanr&ankop(0,1,0,esapm(3,"A_"&s_umqb&g_apj))&"清理整站范围的页面调用缓存（完成）<br>"
'清理整站范围的分页列表缓存cl/web1/all/
if amfty=17 or amfty=9 then amanr=amanr&ankop(0,1,0,esapm(2,"A_"&s_umqb&g_apj))&"清理整站范围的分页列表缓存（完成）<br>"
if not ainull(amfstr) then
dim amdarr
'0pd*/1fl*/2sn*
amdarr=split(amfstr&g_apj&g_apj,g_apj)
if not ainull(amdarr(2)) then
'清理编码为【XXXX】的信息as/web1/pd*/sn*
if amfty=11 or amfty=6 or amfty=9 then amanr=amanr&ankop(0,0,0,esapm(1,amdarr(2)))&"清理【"&amdarr(0)&">>"&amdarr(1)&">>"&amdarr(2)&"】缓存（完成）<br>"
end if
if not ainull(amdarr(1)) then
'清理分类为【XXXX】范围的页面调用缓存cx/web1/pd*/fl*/
if amfty=12 or amfty=6 or amfty=9 then amanr=amanr&ankop(0,1,0,esapm(3,amdarr(0)&g_apj&amdarr(1)&g_apj))&"清理【"&amdarr(0)&">>"&amdarr(1)&"】缓存（完成）<br>"
'清理分类为【XXXX】范围的分页列表缓存cl/web1/pd*/fl*/
if amfty=13 or amfty=6 or amfty=9 then amanr=amanr&ankop(0,1,0,esapm(2,amdarr(0)&g_apj&amdarr(1)&g_apj))&"清理【"&amdarr(0)&">>"&amdarr(1)&"】缓存（完成）<br>"
end if
if not ainull(amdarr(0)) then
'清理频道为【XXXX】范围的页面调用缓存cx/web1/pd*/all/
if amfty=14 or amfty=9 then amanr=amanr&ankop(0,1,0,esapm(3,amdarr(0)&g_apj&"A_"&s_umqb&g_apj))&"清理【"&amdarr(0)&"】缓存（完成）<br>"
'清理频道为【XXXX】范围的分页列表缓存cl/web1/pd*/all/
if amfty=15 or amfty=9 then amanr=amanr&ankop(0,1,0,esapm(2,amdarr(0)&g_apj&"A_"&s_umqb&g_apj))&"清理【"&amdarr(0)&"】缓存（完成）<br>"
end if
end if
End Function
'-----------------------------------
'建议清理
'-----------------------------------
Function amapp(amfgg,amfty,amfstr)
amfgg=aiint(amfgg)
amfty=aiint(amfty)
if not pqx(0) then
amapp="<div class=g-lt>您的操作权限出现问题</div><div class=g-ll0>对不起，您无权使用本功能！</div><div class=g-ll0></div>"
elseif amfgg>10 then
if amfgg=55 then
amapp="<div class=g-lt>文件夹常规清理（清理报告）</div><ul><li class=g-ll0>"
amapp=amapp&amadr(amfstr)
amapp=amapp&"</li></ul></div>"
elseif amfgg=11 and amfty>0 then
amapp="<div class=g-lt>网站内容建议清理（清理报告）</div><ul><li class=g-ll0>"
amapp=amapp&amanr(amfty,amfstr)
amapp=amapp&"</li></ul></div>"
end if
if amfty>0 then
amapp=amapp&"<div class=g-lt>建议清理</div><ul><li class=g-ll0>"
if amfty=66 then
amapp=amapp&"<a href=?gg=55&ty="&amfty&"&str="&amfstr&">清理论坛版块缓存</a>"
elseif amfty=77 then
amapp=amapp&"<a href=?gg=55&ty="&amfty&"&str="&amfstr&">清理【"&amfstr&"】缓存</a>"
elseif amfgg=11 then
amapp=amapp&"<a href=?gg=11&ty=6&str="&amfstr&">一键快速清理相关缓存</a><br><a href=?gg=11&ty=9&str="&amfstr&">一键深度清理相关缓存</a><br><a href=?gg=11&ty=11&str="&amfstr&">清理编码为【"&amfstr&"】的信息</a><br><a href=?gg=11&ty=12&str="&amfstr&">清理分类为【"&amfstr&"】范围的页面调用缓存</a><br><a href=?gg=11&ty=13&str="&amfstr&">清理分类为【"&amfstr&"】范围的分页列表缓存</a><br><a href=?gg=11&ty=14&str="&amfstr&">清理频道为【"&amfstr&"】范围的页面调用缓存</a><br><a href=?gg=11&ty=15&str="&amfstr&">清理频道为【"&amfstr&"】范围的分页列表缓存</a><br><a href=?gg=11&ty=16&str="&amfstr&">清理整站范围的页面调用缓存</a><br><a href=?gg=11&ty=17&str="&amfstr&">清理整站范围的分页列表缓存</a>"
end if
amapp=amapp&"</li></ul></div>"
end if
elseif amfgg=2 then'随性清理
amapp="<div class=g-lt>强制快速清理（清理报告）</div><ul><li class=g-ll0>"
amapp=amapp&amadr(0)
amapp=amapp&"</li></ul></div>"
end if
End Function
'=============
if aireq("gg")="1" then'reflash
response.Write "<div class=g-lt>一键快速清理（清理报告）</div><ul><li class=g-ll0>"
response.Write amadr(1)
response.Write "</li></ul></div>"
response.Write "<script>function asaigooo(){location.replace(""/"");}setTimeout('asaigooo()',10000);</script>"
else
%>
<%=amapp(aireq("gg"),aireq("ty"),aireq("str"))%>
<div class=g-lt>常规清理</div>
<div class=g-ll><ul>
<li class=g-ll0>1、自动更新开关[当前状态:<b><%if g_apptm=1 then%>开<%else%>关<%end if%></b>]<%if g_atxm<100000 then%>，更新时间：<%=replace(replace(g_atxg&",",",,",","),",","点，")%>，更新<%=g_atxm%>秒前创建的缓存<%end if%>。</li>
<li class=g-ll1><a onClick="if(confirm('Are you sure!\nYes,Go; No,Back.）')){return true;}else{return false;}" href=./?gg=2>2、一键清理网站【<%=ew_mc%>】主页、频道首页、信息列表页及页面调用等三级缓存【<%=replace(esapm(3,""),g_apj,"/")%>】</a></li>
<li class=g-ll0><a onClick="if(confirm('Are you sure!\nYes,Go; No,Back.）')){return true;}else{return false;}" href=./?gg=55&str=<%=esapm(4,"")%>>3、清理【<%=ew_mc%>】主页及频道首页等四级缓存【<%=replace(esapm(4,""),g_apj,"/")%>】</a><br>
<%
if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
%><a href=./?gg=55&str=<%=esapm(3,"P_"&gysay(1))%>>[<%=gysay(2)%>]</a> <%
next
end if
%>
<a href=./?gg=55&str=<%=esapm(4,i_htmld&g_apj)%>>[网站整页缓存]</a></li>
<li class=g-ll1><a onClick="if(confirm('Are you sure!\nYes,Go; No,Back.）')){return true;}else{return false;}" href=./?gg=55&str=<%=esapm(3,"")%>>4、清理【<%=ew_mc%>】各页面调用数据等三级缓存【<%=replace(esapm(3,""),g_apj,"/")%>】</a><br>
<%
if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
%><a href=./?gg=55&str=<%=esapm(3,"P_"&gysay(1)&g_apj)%>>[<%=gysay(2)%>]</a> <%
next
end if
%>
<a href=./?gg=55&str=<%=esapm(3,"A_"&s_umqb&g_apj)%>>[整站调用]</a></li>
<li class=g-ll0><a onClick="if(confirm('Are you sure!\nYes,Go; No,Back.）')){return true;}else{return false;}" href=./?gg=55&str=<%=esapm(2,"")%>>5、清理【<%=ew_mc%>】所有分页、翻页列表等二级缓存【<%=replace(esapm(3,""),g_apj,"/")%>】</a><br>
<%
if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
%><a href=./?gg=55&str=<%=esapm(2,"P_"&gysay(1)&g_apj)%>>[<%=gysay(2)%>]</a> <%
next
end if
%>
<a href=./?gg=55&str=<%=esapm(2,"A_"&s_umqb&g_apj)%>>[整站分页]</a></li>
<li class=g-ll1><a onClick="if(confirm('Are you sure!\nYes,Go; No,Back.）')){return true;}else{return false;}" href=./?gg=55&str=<%=esapm(1,"")%>>6、清理【<%=ew_mc%>】的内容等一级缓存【<%=replace(esapm(1,""),g_apj,"/")%>】</a></li>
<li class=g-ll0><a onClick="if(confirm('Are you sure!\nYes,Go; No,Back.）')){return true;}else{return false;}" href=./?gg=55&str=<%=esapm(0,"")%>>7、清理【<%=ew_mc%>】的网站信息、频道、分类、菜单等零级缓存【<%=replace(esapm(0,""),g_apj,"/")%>】</a><br>
<a href=./?gg=55&str=<%=esapm(0,s_udew&g_apj)%>>[站点信息]</a> <a href=./?gg=55&str=<%=esapm(0,s_udel&g_apj)%>>[频道类型]</a> <a href=./?gg=55&str=<%=esapm(0,s_udep&g_apj)%>>[网站频道]</a> <a onClick="if(confirm('Are you sure!\nYes,Go; No,Back.）')){return true;}else{return false;}" href=./?gg=55&str=<%=esapm(0,s_udef&g_apj)%>>[频道分类]</a> <a href=./?gg=55&str=<%=esapm(0,s_uded&g_apj)%>>[网站菜单]</a></li>
<li class=g-ll1><a onClick="if(confirm('Are you sure!\nYes,Go; No,Back.）')){return true;}else{return false;}"  href=./?gg=55&str=>8、清理所有网站缓存信息（复位功能）</a></li>
</ul></div>
<div class=g-lt>使用说明：</div>
<div class=g-ll><ul>
<li class=g-ll0>1、当使用切换为生成文件缓存时，网站所在空间必须开启FSO才能执行清理缓存操作；</li>
<li class=g-ll1>2、系统部分操作提示有建议清理项目，可以通过建议清理项目达到单次更新的清理效果；</li>
<li class=g-ll0>3、请在网站访问轻松的时候使用，如遇清空失败或无效，请多试几次；</li>
<li class=g-ll0>4、设置缓存功能可以最大限度提高网站二度访问的速度，某页面第一个人访问慢，因为要建立缓存，以后每个人访问速度都会有数倍提升。</li>
</ul></div>
<%end if%>
<%=pde("")%></body>
</html>