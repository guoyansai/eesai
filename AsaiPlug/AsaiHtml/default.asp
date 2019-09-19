<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"--><%Call esq()%><!--#include file="../inc.asp"--><%=pdt("Asai系统静态化HTML插件")%>
<body>
<%
if not pqx(0) then
response.Write "对不起，您无权使用本功能！"
else
dim amhtmlgx,amhtmltm,amhtmlnm,amhrstop,amhrg,amhrgg,amhrd,amhrdall,amhrdik,amhrdiz,amhtmlbao
amhtmlgx=7'7天内内容
amhtmltm=8'8秒每次更新
amhtmlnm=20'每次默认更新20条（超过20*2条则分次更新）

if aireq("g")<>"" then
amhrg=aiint(aireq("g"))
amhrgg=aiint(aireq("gg"))
amhrd=aiint(aireq("d"))
amhrstop=aiint(aireq("stop"))
amhtmlbao=""
'---------------------------
'生成首页
'---------------------------
Sub amhdefault()
'response.Write w_sn&"-"&lcase(g_uhost)&".html"&e_tur&"Default.asp?index"&g_urz
'response.Write anurl(i_char,"http://localhost/Default.asp?news.html")
'cALL anhtml(i_char,e_tug&w_sn&".html","http://www.eesai.com/?index.html")
if anhtml(i_char,eshref(w_sn&"-"&lcase(replace(g_uhost,":",""))&".html",3),e_tur&"Default.asp?default-"&g_urz) then
amhtmlbao=amhtmlbao&"<li class=g-ll0>√ <a href="&eshref(w_sn&"-"&lcase(replace(g_uhost,":",""))&".html",3)&" target=_blank>【网站首页】生成HTML 成功!</a>——<i>"&now()&"</i><br /></li>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0><font color=red>× 【网站首页】生成HTML 失败！</font>——<i>"&now()&"</i><br /></li>"
end if
End Sub
'---------------------------
'伪静态操作教程
'---------------------------
Sub amhwjt()
dim amhdhs
amhdhs=s_uded&","&s_udee&","&s_udus&","&s_udux&","&s_uduh&","&s_uduq&","&s_uduy&","&s_udut&","&s_udeq&","&s_udek&","&s_udey&","&s_udel&","&s_udew&","&s_uduk&","&s_udukw&","&s_udus&","&s_udbb&","&s_udgg&","&s_umso&","&s_udbb&","&s_udep&","&s_udef&","&s_udea&","&s_umtj&","&s_umxg&","&s_umsc&","&s_umlpy&","&s_umlb&","&s_umlp&","&s_umlbw&","&s_umlpw&","&s_umlpc&","&s_umzs&","&s_umxx&","&s_umxs&","&s_umds&","&s_umgl&","&s_umqb&",index,map,login,exit"
amhtmlbao=amhtmlbao&"<li class=g-ll0>第一步：打开IIS7+-选择网站-URL 重写-添加规则-入站规则-空白规则-名称（EESai）/模式文本框填如下代码：</li>"
amhtmlbao=amhtmlbao&"<li class=g-ll1><input type=""text"" style=""width:88%;"" name=""old"" value=""^("&replace(amhdhs,",",".+|")&".+|"
if epallx<>"" then
gysax=split(epallx,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
amhtmlbao=amhtmlbao&gysay(1)&".+|"
amhdhs=amhdhs&","&gysay(1)
next
end if
amhtmlbao=amhtmlbao&s_umlb&".+)"" /></li>"
amhtmlbao=amhtmlbao&"<li class=g-ll0>第二步：接第一步-操作属性-重写URL文本框填写如下代码：</li>"
amhtmlbao=amhtmlbao&"<li class=g-ll1>?{R:0}</li>"
amhtmlbao=amhtmlbao&"<li class=g-ll0>第三步：登录后台-高级管理-系统设置-静态文件设置-网站模式（选HTML伪静态）/伪静态链文本框填写如下代码：</li>"
amhtmlbao=amhtmlbao&"<li class=g-ll1><input type=""text"" style=""width:88%;"" value="""&amhdhs&""" /></li>"
amhtmlbao=amhtmlbao&"<li class=g-ll0>另外：如果您开启了WAP网站，还需要多添加一个规则：</li>"
amhtmlbao=amhtmlbao&"<li class=g-ll1>重新添加一个规则，模式文本框输入<input type=""text"" style=""width:100px;"" value=""wap/(.+)"" />，重写URL文本框输入<input type=""text"" style=""width:100px;"" value=""wap/?{R:1}"" />。</li>"
amhtmlbao=amhtmlbao&"<li class=g-ll0>注意：如果出现404.11错误，打开%windir%\system32\inetsrv\config\applicationhost.config将&lt;requestFiltering&gt;改为&lt;requestFiltering allowDoubleEscaping=&quot;true&quot;&gt;</li>"
End Sub
'---------------------------
'生成频道首页
'---------------------------
Sub amhindex()
if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi mod 2=0 then
amhtmlbao=amhtmlbao&"<li class=g-ll1>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0>"
end if
if anhtml(i_char,eshref(gysay(1)&".html",3),e_tur&"default.asp?"&gysay(1)&""&g_urz) then
amhtmlbao=amhtmlbao&"√ <a href="&eshref(gysay(1)&".html",3)&" target=_blank>【"&gysay(2)&"】频道首页生成HTML 成功!</a>——<i>"&now()&"</i><br /></li>"
else
amhtmlbao=amhtmlbao&"<font color=red>× 【"&gysay(2)&"】频道首页生成HTML 失败！</font>——<i>"&now()&"</i><br /></li>"
end if
next
else
amhtmlbao=amhtmlbao&"<li class=g-ll0><font color=red>× 暂时没有供生成HTML的频道！</font>——<i>"&now()&"</i><br /></li>"
end if
End Sub
'---------------------------
'生成分类第一页
'---------------------------
Sub amhclass()
if gystop(i_nmtp,efbid,"ef_sn,ef_ep,ef_bt",efbiao,"ef_xy>0 and "&esrew("ef",ew_sn),"ef_id asc",i_hc0&g_apj&s_udew&aiint(ew_sn)&g_apj&s_udef&g_apj&s_umqb&g_apj&"SiteMap") then
gysax=split(gysar,g_gx)
end if
amhrdall=ubound(gysax)
amhrdik=amhrd
'response.Write amhrdall&"==="&amhrd+amhtmlnm
if amhrdall>amhrd+amhtmlnm then
amhrdiz=amhrd+amhtmlnm
amhrstop=0
else
amhrdiz=amhrdall
amhrstop=1
end if
if amhrdiz>amhrdik then
for gysi=amhrdik to amhrdiz
if not ainull(gysax(gysi)) then
gysay=split(gysax(gysi),g_gy)
if gysi mod 2=0 then
amhtmlbao=amhtmlbao&"<li class=g-ll1>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0>"
end if
if anhtml(i_char,eshref(gysay(1)&"/"&gysay(0)&".html",3),e_tur&"default.asp?"&gysay(1)&g_urg&gysay(0)&g_urz) then
amhtmlbao=amhtmlbao&"√ <a href="&eshref(gysay(1)&"/"&gysay(0)&".html",3)&" target=_blank>【"&gysay(2)&"】分类内容列表的第一页生成HTML 成功!</a>——<i>"&now()&"</i><br /></li>"
else
amhtmlbao=amhtmlbao&"<font color=red>× 【"&gysay(2)&"】分类内容列表的第一页生成HTML 失败！</font>——<i>"&now()&"</i><br /></li>"
end if
end if
next
end if
if aireq("stop")="1" then amhrstop=1
if amhrstop=0 then
amhtmlbao=amhtmlbao&"<meta http-equiv='refresh' content='"&amhtmltm&";url=?g="&amhrg&"&gg="&amhrgg&"&d="&amhrd+20&"&stop="&amhrstop&"'>"
amhtmlbao=amhtmlbao&"<li class=g-ll0><b><a href=?g="&amhrg&"&gg="&amhrgg&"&d="&amhrd+20&"&stop=1>【停止循环生成】</a> <a href=?g="&amhrg&"&gg="&amhrgg&"&d="&amhrd+20&"&stop=0>【继续循环生成】</a></b></li>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0><b>√ 【操作过程结束】已有"&amhrdiz&"个分类[共计"&amhrdall&"个分类]内容列表的第一页生成HTML 成功!"
if amhrdall>amhrdiz then amhtmlbao=amhtmlbao&"<a href=?g="&amhrg&"&gg="&amhrgg&"&d="&amhrd+20&"&stop=0>【继续循环生成】</a>"
amhtmlbao=amhtmlbao&"——<i>"&now()&"</i></b><br /></li>"
if amhrgg=1 then
amhtmlbao=amhtmlbao&"<meta http-equiv='refresh' content='"&amhtmltm&";url=?g=4&gg="&amhrgg&"&stop=0'>"
elseif amhrgg=2 then
amhtmlbao=amhtmlbao&"<meta http-equiv='refresh' content='"&amhtmltm&";url=?g=4&gg="&amhrgg&"&stop=0'>"
end if
end if
End Sub
'---------------------------
'生成所有内容页面
'---------------------------
Sub amhinfoall()
dim amhggwhere,amhlinf,amhlinp
if amhrgg=2 then amhggwhere=" and ai_tm>"&date()-amhtmlgx&""
if gystop(amhtmlnm,eabid,"ai_sn,ai_ef,ai_ep",eabiao,"ai_id>"&amhrd&" and ai_xy>0 and ai_ew="&ew_sn&""&amhggwhere,"ai_id asc","") then
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi mod 2=0 then
amhtmlbao=amhtmlbao&"<li class=g-ll1>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0>"
end if
amhlinf=eshref(gysay(2)&"/"&gysay(1)&"/"&s_umxx&"/"&gysay(0)&".html",3)
amhlinp=e_tur&"default.asp?"&gysay(2)&g_urg&gysay(1)&g_urg&s_umxx&g_urg&gysay(0)&g_urz

if anhtml(i_char,amhlinf,amhlinp) then
amhtmlbao=amhtmlbao&"√ <a href="&eshref(gysay(2)&"/"&gysay(1)&"/"&s_umxx&"/"&gysay(0)&".html",3)&" target=_blank>["&gysay(0)&"]生成HTML 成功!</a>——<i>"&now()&"</i><br /></li>"
else
amhtmlbao=amhtmlbao&"<font color=red>× ["&gysay(0)&"]生成HTML 失败！</font>——<i>"&now()&"</i><br /></li>"
end if
amhrd=gysay(0)
next
if gysi+1<amhtmlnm then amhrstop=1
else
amhrstop=1
amhrdiz="1"
end if
if aireq("stop")="1" then amhrstop=1
if amhrstop=0 then
amhtmlbao=amhtmlbao&"<meta http-equiv='refresh' content='"&amhtmltm&";url=?g="&amhrg&"&gg="&amhrgg&"&d="&amhrd&"&stop="&amhrstop&"'>"
amhtmlbao=amhtmlbao&"<li class=g-ll0><b><a href=?g="&amhrg&"&gg="&amhrgg&"&d="&amhrd&"&stop=1>【停止循环生成】</a> <a href=?g="&amhrg&"&gg="&amhrgg&"&d="&amhrd&"&stop=0>【继续循环生成】</a></b></li>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0><b>√ 【操作过程结束】已生成HTML页面至ID="&amhrd&"!"
if amhrdiz<>"1" and aireq("stop")="1" then amhtmlbao=amhtmlbao&"<a href=?g="&amhrg&"&gg="&amhrgg&"&d="&amhrd&"&stop=0>【继续循环生成】</a>"
amhtmlbao=amhtmlbao&"——<i>"&now()&"</i></b><br /></li>"
if amhrgg=1 then
amhtmlbao=amhtmlbao&"<meta http-equiv='refresh' content='"&amhtmltm&";url=?g=5&gg="&amhrgg&"&stop=1'>"
elseif amhrgg=2 then
amhtmlbao=amhtmlbao&"<meta http-equiv='refresh' content='"&amhtmltm&";url=?g=6&gg="&amhrgg&"&stop=1'>"
end if
end if
End Sub
'---------------------------
'清除所有生成的页面
'---------------------------
Sub amhclear()
if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi mod 2=0 then
amhtmlbao=amhtmlbao&"<li class=g-ll1>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0>"
end if
amhtmlbao=amhtmlbao&"【"&gysay(2)&"】"
if anfiledel(0,eshref(gysay(1)&".html",3))<>"" then
amhtmlbao=amhtmlbao&"<br>√ 频道HTML静态文件及文件夹["&eshref(gysay(1)&".html",3)&"]删除 成功!——<i>"&now()&"</i>"
else
amhtmlbao=amhtmlbao&"<br><font color=red>× 频道HTML静态文件及文件夹["&eshref(gysay(1)&".html",3)&"]删除 失败或不存在！</font>——<i>"&now()&"</i>"
end if
if anfiledel(0,eshref(gysay(1)&"/",3))<>"" then
amhtmlbao=amhtmlbao&"<br>√ 频道HTML静态文件及文件夹["&eshref(gysay(1)&"/",3)&"]删除 成功!——<i>"&now()&"</i></li>"
else
amhtmlbao=amhtmlbao&"<br><font color=red>× 频道HTML静态文件及文件夹["&eshref(gysay(1)&"/",3)&"]删除 失败或不存在！</font>——<i>"&now()&"</i></li>"
end if
next
else
amhtmlbao=amhtmlbao&"<li class=g-ll0><font color=red>× 暂时没有供清除的网站频道！</font>——<i>"&now()&"</i><br /></li>"
end if
amhtmlbao=amhtmlbao&"<li class=g-ll1>其他页面"
if anfiledel(0,eshref(w_sn&"-"&lcase(replace(g_uhost,":",""))&".html",3))<>"" then
amhtmlbao=amhtmlbao&"<br>√ 网站首页["&eshref(w_sn&"-"&lcase(replace(g_uhost,":",""))&".html",3)&"]删除 成功!——<i>"&now()&"</i>"
else
amhtmlbao=amhtmlbao&"<br><font color=red>× 网站首页["&eshref(w_sn&"-"&lcase(replace(g_uhost,":",""))&".html",3)&"]删除 失败或不存在！</font>——<i>"&now()&"</i>"
end if
if anfiledel(0,eshref("bbs/",3))<>"" then
amhtmlbao=amhtmlbao&"<br>√ 网站论坛["&eshref("bbs/",3)&"]删除 成功!——<i>"&now()&"</i>"
else
amhtmlbao=amhtmlbao&"<br><font color=red>× 网站论坛["&eshref("bbs/",3)&"]删除 失败或不存在！</font>——<i>"&now()&"</i>"
end if
if anfiledel(0,eshref("SiteMap.Xml",3))<>"" then
amhtmlbao=amhtmlbao&"<br>√ 导航文件["&eshref("SiteMap.Xml",3)&"]删除 成功!——<i>"&now()&"</i>"
else
amhtmlbao=amhtmlbao&"<br><font color=red>× 导航文件["&eshref("SiteMap.Xml",3)&"]删除 失败或不存在！</font>——<i>"&now()&"</i>"
end if
if anfiledel(0,eshref("Rss.Xml",3))<>"" then
amhtmlbao=amhtmlbao&"<br>√ 订阅文件["&eshref("Rss.Xml",3)&"]删除 成功!——<i>"&now()&"</i>"
else
amhtmlbao=amhtmlbao&"<br><font color=red>× 订阅文件["&eshref("Rss.Xml",3)&"]删除 失败或不存在！</font>——<i>"&now()&"</i>"
end if
if anfiledel(0,eshref("Xml.Xml",3))<>"" then
amhtmlbao=amhtmlbao&"<br>√ 更新文件["&eshref("Xml.Xml",3)&"]删除 成功!——<i>"&now()&"</i>"
else
amhtmlbao=amhtmlbao&"<br><font color=red>× 更新文件["&eshref("Xml.Xml",3)&"]删除 失败或不存在！</font>——<i>"&now()&"</i>"
end if
amhtmlbao=amhtmlbao&"</li>"
End Sub
'---------------------------
'生成SiteMap网站文件地图
'---------------------------
Sub amhsitemap()
if anhtml(i_char,eshref("SiteMap.Xml",3),e_tur&s_drplug&"AsaiSiteMap") then
amhtmlbao=amhtmlbao&"<li class=g-ll0>√ <a href="&eshref("SiteMap.Xml",3)&" target=_blank>SiteMap网站文件地图生成 成功!</a>——<i>"&now()&"</i><br /></li>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0><font color=red>× SiteMap网站文件地图生成 失败！</font>——<i>"&now()&"</i><br /></li>"
end if
End Sub
'---------------------------
'生成RSS订阅文件
'---------------------------
Sub amhrss()
if anhtml(i_char,eshref("Rss.Xml",3),e_tur&s_drplug&"AsaiRss") then
amhtmlbao=amhtmlbao&"<li class=g-ll0>√ <a href="&eshref("Rss.Xml",3)&" target=_blank>RSS订阅文件生成 成功!</a>——<i>"&now()&"</i><br /></li>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0><font color=red>× RSS订阅文件生成 失败！["&e_tur&s_drplug&"AsaiRss"&"]</font>——<i>"&now()&"</i><br /></li>"
end if
if anhtml(i_char,eshref("Xml.Xml",3),e_tur&s_drplug&"AsaiXml") then
amhtmlbao=amhtmlbao&"<li class=g-ll0>√ <a href="&eshref("Xml.Xml",3)&" target=_blank>Xml最新链接文件生成 成功!</a>——<i>"&now()&"</i><br /></li>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0><font color=red>× Xml最新链接文件生成 失败！["&e_tur&s_drplug&"AsaiRss"&"]</font>——<i>"&now()&"</i><br /></li>"
end if
End Sub
if amhrg=1 then
Call amhdefault()
elseif amhrg=2 then
Call amhindex()
elseif amhrg=3 then
Call amhclass()
elseif amhrg=4 then
Call amhinfoall()
elseif amhrg=5 or amhrg=6 then
if amhrgg=0 then
Call amhdefault()
Call amhindex()
Call amhsitemap()
Call amhrss()
if amhrg=6 then
amhrgg=2
else
amhrgg=1
end if
amhtmlbao=amhtmlbao&"<meta http-equiv='refresh' content='"&amhtmltm&";url=?g=3&gg="&amhrgg&"&stop="&amhrstop&"'>"
else
amhtmlbao=amhtmlbao&"<li class=g-ll0><B>√ 恭喜您，已经完成所有操作！——<i>"&now()&"</i></B><br /></li>"
end if
elseif amhrg=7 then
Call amhsitemap()
elseif amhrg=8 then
Call amhrss()
elseif amhrg=9 then
Call amhclear()
elseif amhrg=10 then
Call amhwjt()
elseif amhrg=0 then

end if
response.Write("<div class=g-lt>功能"&amhrg&"键操作报告</div><div class=g-ll><ul>")
if ainull(amhtmlbao) then
response.Write("<li class=g-ll0><font color=red>× 无效或失败的操作！</font>——<i>"&now()&"</i><br /></li>")
else
response.Write(amhtmlbao)
end if
response.Write("</ul></div>")
end if
end if%>
<div class=g-lt>网站静态化HTML插件</div>
<div class=g-ll><ul>
<li class=g-ll0><a href=./?g=1>功能1键：将首页生成HTML静态页面（更新首页）；</a></li>
<li class=g-ll1><a href=./?g=2>功能2键：将网站各个频道首页生成HTML静态页面（更新各个频道首页内容）；</a></li>
<li class=g-ll0><a href=./?g=3>功能3键：将网站各频道的每个分类第一页生成HTML静态页面（更新各个分类内容列表第一页的内容）；</a></li>
<li class=g-ll1><a href=./?g=4>功能4键：一键将全站内容页面生成HTML静态页面（如内容较多，需耐心等待，请勿关闭本页），当前速度<%=amhtmlnm%>条/<%=amhtmltm%>秒；</a></li>
<li class=g-ll0><a href=./?g=5>功能5键：全自动执行全站HTML静态化页面，更新需要10分钟以上（依据网站内容多少），请勿关闭本页；</a></li>
<li class=g-ll1><a href=./?g=6>功能6键：更新网站首页及各频道、分类首页等近期需更新的，同时更新最近<%=amhtmlgx%>天添加的内容；</a></li>
<li class=g-ll0><a href=./?g=7>功能7键：生成网站SiteMap文件地图，优化搜索引擎对网站页面的抓取；</a></li>
<li class=g-ll1><a href=./?g=8>功能8键：更新网站的RSS订阅文件、最新链接文件；</a></li>
<li class=g-ll0><a href=./?g=9>功能9键：将所有生成的HTML静态页面全部删除（当您不使用静态模式转动态模式时使用）；</a></li>
<li class=g-ll1><a href=./?g=10>功能10键：点此链接生成设置网站伪静态教程（仅IIS7及以上带“URL 重写”功能可用）。</a></li>
</ul></div>
<div class=g-lt>使用须知（请在使用前阅读）：</div>
<div class=g-ll><ul>
<li class=g-ll0>1、网站所在空间必须开启FSO；</li>
<li class=g-ll1>2、网站根目录及生成静态页面所在文件夹必须设置属性为可读写；</li>
<li class=g-ll0>3、必须正确设置网站的网址、网站所在的文件夹(如在网站根目录，则文件夹填[/])；</li>
<li class=g-ll1>4、必须设置网站为静态模式，同时确保已经至少执行过一次功能5键；</li>
<li class=g-ll0>5、如果您不使用静态模式，改为动态模式时，请务必执行功能9键清空所有已生成HTML页面；</li>
<li class=g-ll1>6、网站静态生成以后，需要手动修改部分自定义网站菜单的链接；</li>
<li class=g-ll0>7、网站在静态生成过程中，切勿关闭此页面；</li>
<li class=g-ll1>8、网站生成过程与服务器性能有很大关系，大操作等1小时以上属正常，请勿着急；</li>
<li class=g-ll0>9、网站静态生成过程出现死机、页面无法打开，请立即停止，重启IIS检查网站设置是否正确，再重试；</li>
<li class=g-ll0>10、以上所有操作必须在网站系统处于外网访问的情况下方可正常使用。</li>
</ul></div>
<%=pde("")%></body>
</html><!--#include file="../../AsaiInc/incma.asp"-->
