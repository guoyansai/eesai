<!--#include file="../AsaiData/cf.asp"--><!--#include file="../AsaiInc/incba.asp"--><!--#include file="../AsaiInc/incbu.asp"--><%
Call esq()
'top
Function mztop(mzfty,mzfstr)
if mzfty>0 then mztop="<!doctype html>"
mztop=mztop&"<html><head>"
mztop=mztop&"<meta charset=""utf-8"">"
mztop=mztop&"<title>"&mzfstr&",管理中心,"&ew_bt&"</title>"
mztop=mztop&"<meta name=""keywords"" content="""&mzfstr&",管理中心,"&ew_zt&""">"
mztop=mztop&"<meta name=""description"" content="""&mzfstr&",管理中心,"&ew_nr&""">"
mztop=mztop&"<meta name=""copyright"" content="""&e_ubt&"[EESai.Com],"&ew_cp&""">"
mztop=mztop&escss()
mztop=mztop&"</head>"
mztop=mztop&"<body>"
if mzfty>1 then
mztop=mztop&"<div class=""m-lr"">"
mztop=mztop&"<div class=""m-lro""><a href="""&ew_il&""" target=""_blank"" title="""&ew_is&"""><img src="""&eshref(ew_sk&"img/"&ew_ig&"",3)&""" alt="""&ew_is&"""></a></div>"

mztop=mztop&"<div class=""m-lrm"">"
mztop=mztop&"<a class=""m-lra"
if mzfty=50 then mztop=mztop&"x"
mztop=mztop&""" href="""&e_alogin&""">登录</a>"
mztop=mztop&"<a class=""m-lra"
if mzfty=80 then mztop=mztop&"x"
mztop=mztop&""" href="""&e_aexit&""">离开</a>"
mztop=mztop&"</div>"

mztop=mztop&"<div class=""m-lrc"">"
end if
End Function
'end
Function mzend(mzfty)
mzend=""
if mzfty<200 then
mzend=mzend&"</div></div>"
mzend=mzend&"<div class=""m-lre"">您当前IP："&aiip()&"&nbsp;<script language=""JavaScript"" charset=""utf-8"" src=""http://ip.780.pub/?ty=11&ip="&aiip()&"""></script>&nbsp;&nbsp;操作时间："&now()&"</div>"
end if
mzend=mzend&"</body></html>"
End Function

'======插件权限1
'Response.Cookies("gl")="4"
Function pqx(pqfty)
pqx=false
if Request.Cookies("gl")<>"" then
if int(Request.Cookies("gl"))>=pqfty then
pqx=true
end if
end if
End Function
'======插件权限1
if not pqx(0) and not aibj(g_u0,"exit") and not aibj(g_u0,"login") then
response.Write "<script language=javascript>top.location='"&e_alogin&"';</script>"
'---------------------------login
elseif aibj(g_u0,"login") then
%>
<%=mztop(50,"管理员登录入口")%>
<%
if esky(1,0) and aireqx("zhanghu,mima") then
dim rslo,rslus,rszh,rsmm,rsaqx,rsaxy,rsaok
rszh=Left(Request.Form("zhanghu"),50)
rsmm=aimm(g_gmm,Left(Request.Form("mima"),50),0)
Call saik(rslo,"select ee_mc,ee_dj,ee_xy,ee_jb,ee_xi,ee_xo,ee_us,ee_xt from "&w_dbqz&"ee where ee_mc='"&rszh&"' and ee_mm='"&rsmm&"'",1,3)
If rslo.BOF And rslo.EOF Then
Response.Write aitiao("该管理员不存在！",e_alogin,i_nmtz+1)
else
rslus=rslo("ee_us")
e_gmc=rslo("ee_mc")
e_gxy=aiint(rslo("ee_xy"))
e_gdj=aiint(rslo("ee_dj"))
Response.Cookies("gl")=e_gdj
if ainull(rslo("ee_xt")) then
rslo("ee_xt")=espxx("管理后台登录")
else
rslo("ee_xt")=rslo("ee_xt")&espxx("管理后台登录")
end if
Call aiks(i_xkhc,i_hccgl,aimm(g_gmm,rslo("ee_mc")&g_gx&rslo("ee_dj")&g_gx&rslo("ee_xy")&g_gx&rslo("ee_jb")&g_gx&rslo("ee_xi")&g_gx&rslo("ee_xo")&g_gx&rslo("ee_us"),0),1)
rsaqx=rslo("ee_dj")
rsaxy=rslo("ee_xy")
rsaok="ok"
rslo.update
end if
Call saig(rslo)
if not ainull(rslus) and i_xkuhy>0 then Call usein(110,rslus,"")
if rsaok="ok" then Response.Write aitiao("恭喜您，管理员成功登录！",e_aadmin,i_nmtz)
else
%>
<table width="100%" border="0" cellpadding="2" cellspacing="5">
<%if not ainull(e_gmc) then%>
<tr><td class="m-lrl">管理员：</td><td><%=e_gmc%></td></tr>
<tr><td class="m-lrl">状态：</td><td><%=aiarr(i_bxy,"|",e_gxy)%></td></tr>
<tr><td class="m-lrl">管理员等级：</td><td><%=aiarr(i_beedj,"|",e_gdj)%></td></tr>
<%if aiint(e_uid)>0 and i_xkuhy>0 then%><tr><td class="m-lrl">前台账户：</td><td><%=e_uer%>　<a target="_top" href="<%=u_user%>">进入会员中心&gt;&gt;</a></td></tr><%end if%>
<tr><td class="m-lrl">其他信息：</td><td>拥有金币<b><%=e_gjb%></b></td></tr>
<tr><td class="m-lrl"></td><td>被喜欢<b><%=e_gxi%></b>次(^_^) 被讨厌<b><%=e_gxo%></b>次(-_-)</td></tr>
<tr><td class="m-lrl"></td><td><%if not pqx(0) then%><%=aibuttonk(replace(e_aexit,"exit","exit/login"),"","","","f-sb","管理员账户异常 重新登录")%><%else%><%=aibuttonk(e_aadmin,"","","","f-sb","进入管理中心")%><%=aibuttonk(e_aexit,"","","","f-sb","退出登录")%><%end if%></td></tr>
<%else%>
<form id="AsaiForm" name="AsaiForm" action="" method="post">
<tr><td class="m-lrl">帐户：</td><td><%=aiinput("","zhanghu","",0,50,"*请输入管理员帐户名称","f-ua","")%></td></tr>
<tr><td class="m-lrl">密码：</td><td><%=aiinput("password","mima","",3,50,"*请输入管理员登录密码","f-ua","")%></td></tr>
<tr<%if ew_yz=0 or e_uxy>i_xkyz or aiint(e_uzy)>i_xkyz then%> style="display:none;"<%end if%>><td class="m-lrl">计算验证：</td><td><%=replace(eskyx(0,0,0),"验证：","")%></td></tr>
<tr><td class="m-lrl"></td><td><%=aibutton(2,"","","f-sb f-skx","管理员登录")%></td></tr>
</form>
<%end if%>
</table>
<%end if%>
<%=mzend(50)%>
<%
'---------------------------exit
elseif aibj(g_u0,"exit") then
%><%=mztop(80,"管理员退出")%>
<%
Response.Cookies("gl")=""
Call aiks(i_xkhc,i_hccgl,"",1)
Call icuser(0)
if aibj(g_u1,"login") then
Response.Redirect(e_alogin)
else
Response.Write aitiao("管理员退出"&s_ztcg,e_tug,i_nmtz)
end if
%><%=mzend(80)%>
<%elseif aibj(g_u0,"EESai") then%>
<%=mztop(0,"更新本地账户缓存")%><body>
<%=Replace(aiks(i_xkhc,i_hccgl,"",2),aiks(i_xkhc,i_hccgl,"",2),"")%><%=mzend(200)%>

<%elseif aibj(g_u0,s_umgl) and aibj(g_u1,"admintop") then%>
<%=mztop(1,"管理后台顶部导航")%>
<div class="gys<%if aiint(e_gdj)>5 then%>2<%elseif aiint(e_gdj)>3 then%>1<%else%>0<%end if%>">
<div class="m-tk">
<div class="m-tc">
<span><%=ew_mc%> 后台管理中心
<b title="帐户状态：<%=aiarr(i_bxy,"|",e_gxy)%>">欢迎您，<%=e_gmc%>[<%=aiarr(i_beedj,"|",e_gdj)%>]</b>
<a href="<%=e_aexit%>" target="_top">退出</a></span>
<a href="<%=i_dir%>" target="_blank">网站首页</a><a href="<%=e_aadmin%>" target="_top">管理首页</a><a href="<%=eshref(s_drplug&"AsaiCache/",3)%>" target="AMF">清空缓存</a><a href="<%=eshref(s_drplug&"AsaiRss/",3)%>" target="_blank">RSS</a><a href="<%=eshref(s_drplug&"AsaiXml/",3)%>" target="_blank">XML</a><a href="<%=eshref(s_drplug&"AsaiSiteMap",3)%>" target="_blank">MAP</a>
</div>
<div class="m-te"></div>
</div>
</div>
<script id="AsaiReload" language="javascript"></script>
<script language="javascript">
function AsaiKeepSession(){
document.all["AsaiReload"].src="<%=eshref("EESai"&g_urz,2)%>";
window.setTimeout("AsaiKeepSession()",10000);}
AsaiKeepSession();
</script>
<%=mzend(200)%>
<%

elseif aibj(g_u0,s_umgl) and aibj(g_u1,"adminmenu") then
%>
<%=mztop(1,"管理后台左侧导航")%>
<SCRIPT language=javascript1.2>
function showAsaiMenu(sid)
{if(document.getElementById("AsaiMenu"+sid).style.display=="none"){document.getElementById("AsaiMenu"+sid).style.display=""}
else{document.getElementById("AsaiMenu"+sid).style.display="none"}}
</SCRIPT>
<div class="gys1">
<div class="m-mu">
<h3 onClick="showAsaiMenu(0)"><%=ew_mc%></h3>
<ul id='AsaiMenu0'>
<li><a href="<%=e_tug%>" class="m-ma" target="_blank">网站首页</a><a href="<%=e_aadmin%>" class="m-ma" target="_top">管理后台</a></li>
<%if i_xkuhy>0 and not ainull(e_gus) then%><li><a href="<%=u_user%>" class="m-max" target="_top">进入会员管理后台</a></li><%end if%>
</ul>
</div>
</div>

<div class="gys2">
<div class="m-mu">
<h3 onClick="showAsaiMenu(888)">我的信息</h3>
<ul id='AsaiMenu888'>
<li><a href="<%=eshref(s_udee&g_urg&s_umzs&g_urg&e_gmc&g_urz,66)%>" class="m-max" target="AMF"><%=e_gmc%></a></li>
<li><a class="m-ma">等级：<%=aiarr(i_beedj,"|",e_gdj)%></a></li>
<li><a class="m-ma">状态：<%=aiarr(i_bxy,"|",e_gxy)%></a></li>
<li><a href="<%=eshref(s_umgl&g_urg&s_udee&g_urg&s_umxg&g_urz,77)%>" class="m-ma" target="AMF">[更新资料]</a><a href="<%=eshref("exit"&g_urz,2)%>" class="m-ma" target="_top">[退出]</a></li>
</ul>
</div>
</div>

<%if instr(e_gmc,"_")>0 and aiint(e_gdj)>0 then'独立频道管理员%>
<div class="m-mu">
<%Call epread(split(e_gmc,"_")(0))'获取频道信息%>
<h3 onClick="showAsaiMenu(22)"><%=ep_mc%>管理</h3>
<ul id='AsaiMenu22'>
<li><a class="m-max" target="AMF" href="<%=eshref(s_umgl&g_urg&ep_sn&g_urz,77)%>"><%=ep_mc%></a><%
if not aibj(ep_ef,"5") and aiint(e_gdj)>2 then
%><a class="m-ma" target="AMF" href="<%=eshref(s_umgl&g_urg&s_udef&g_urg&ep_sn&g_urg&s_umds&g_urz,77)%>"><%=s_udefs%></a><a class="m-ma" target="AMF" href="<%=eshref(s_umgl&g_urg&ep_sn&g_urg&s_umtj&g_urz,77)%>">添加</a></li><%
else
%><a class="m-ma" target="AMF" href="<%=eshref(s_umgl&g_urg&ep_sn&g_urg&s_umtj&g_urz,77)%>"><%=s_umfbs&ep_dm%></a></li><%
end if
if aiint(ep_ef)<5 then
dim efallin
efallin=efall(ep_sn)
if efallin<>"" then
gysax=split(efallin,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if aiint(gysay(4))<2 then
%><li><a class="m-ma" target="AMF" href="<%=eshref(s_umgl&g_urg&ep_sn&g_urg&gysay(6)&g_urz,77)%>"><%=gysay(7)%></a><a class="m-ma" target="AMF" href="<%=eshref(s_umgl&g_urg&ep_sn&g_urg&gysay(6)&g_urg&s_umtj&g_urz,77)%>">添加</a></li>
<%
end if
Next
end if
end if%>
</ul>
</div>
<%else%>
<%if aiint(e_gdj)>0 then%>
<div class="m-mu">
<h3 onClick="showAsaiMenu(1)">全局管理</h3>
<ul style="display:none" id='AsaiMenu1'>
<%if aiint(e_gdj)>4 then%><li><a href="<%=eshref(s_umgl&g_urg&s_udew&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF">站点管理</a><a href="<%=eshref(s_umgl&g_urg&s_udel&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF">网站类型</a></li><%end if%>
<%if aiint(e_gdj)>3 then%><li><a href="<%=eshref(s_umgl&g_urg&s_udep&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF">网站频道</a><a href="<%=eshref(s_umgl&g_urg&s_udee&g_urg&s_umlb&g_urz,77)%>" class="m-max" target="AMF">管理用户</a></li><%end if%>
<%if aiint(e_gdj)>2 then%>
<li><a href="<%=eshref(s_umgl&g_urg&s_udef&g_urg&s_umqb&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF">分类管理</a><a href="<%=eshref(s_umgl&g_urg&d_seals&g_urz,77)%>" class="m-ma" target="AMF">内容管理</a></li>
<%if ewxgn("eq") then%><li><a href="<%=eshref(s_umgl&g_urg&s_udeq&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF"><%=s_udeqs%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_udeq&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF"><%=s_umtjs&s_udeqs%></a></li><%end if%>
<%if ewxgn("ek") then%><li><a href="<%=eshref(s_umgl&g_urg&s_udek&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF"><%=s_udeks%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_udek&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF"><%=s_umtjs&s_udeks%></a></li><%end if%>
<li><a href="<%=eshref(s_umgl&g_urg&s_udef&g_urg&s_uded&g_urg&s_umds&g_urz,77)%>" class="m-ma" target="AMF">导航<%=s_udeds%></a><a href="<%=eshref(s_umgl&g_urg&s_udef&g_urg&s_uded&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF"><%=s_umtjs&s_udeds%></a></li>
<%if ewxgn("gg") and i_xkgg=1 then%><li><a href="<%=eshref(s_umgl&g_urg&s_udgg&g_urg&""&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF">推广管理</a><a href="<%=eshref(s_umgl&g_urg&s_udgg&g_urg&"0"&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加推广</a></li><%end if%>
<%if ewxgn("ey") then%><li><a href="<%=eshref(s_umgl&g_urg&s_udey&g_urg&"0"&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF">留言管理</a><a href="<%=eshref(s_umgl&g_urg&s_udey&g_urg&"0"&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加留言</a></li><%end if%>
<%end if%>
<%if aiint(e_gdj)<3 then%><li><a href="<%=eshref(s_umgl&g_urg&d_seals&g_urz,77)%>" class="m-max" target="AMF">全站内容列表</a></li><%end if%>
</ul>
</div>

<div class="m-mu">
<h3 onClick="showAsaiMenu(22)">网站管理</h3>
<ul id='AsaiMenu22'><%
if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
%><li><a class="m-max" target="AMF" href="<%=eshref(s_umgl&g_urg&gysay(1)&g_urz,77)%>"><%=gysay(2)%></a><%
if not aibj(gysay(12),"5") and aiint(e_gdj)>2 then
%><a class="m-ma" target="AMF" href="<%=eshref(s_umgl&g_urg&s_udef&g_urg&gysay(1)&g_urg&s_umds&g_urz,77)%>"><%=s_udefs%></a><a class="m-ma" target="AMF" href="<%=eshref(s_umgl&g_urg&gysay(1)&g_urg&s_umtj&g_urz,77)%>">添加</a></li><%
else
%><a class="m-ma" target="AMF" href="<%=eshref(s_umgl&g_urg&gysay(1)&g_urg&s_umtj&g_urz,77)%>"><%=s_umfbs&gysay(3)%></a></li><%
end if
next
else
%><li><a href="<%=eshref(s_umgl&g_urg&s_udep&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加<%=s_udeps%></a></li><%
end if
%></ul>
</div>
<%else%>
<div class="m-mu">
<h3 onClick="showAsaiMenu(1)">网站内容</h3>
<ul id='AsaiMenu1'>
<li><a href="<%=eshref(s_umgl&g_urg&d_seals&g_urz,77)%>" class="m-max" target="AMF">全站内容列表</a></li>
<%
if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
%>
<li><a class="m-ma" target="AMF" href="<%=eshref(gysay(1)&g_urg&s_umqb&g_urz,77)%>"><%=gysay(2)%></a><%
gysi=gysi+1
gysay=split(gysax(gysi),g_gy)
%><a class="m-ma" target="AMF" href="<%=eshref(gysay(1)&g_urg&s_umqb&g_urz,77)%>"><%=gysay(2)%></a></li>
<%
next
end if%>
</ul>
</div>
<%end if%>

<%if aiint(e_gdj)>4 or (aiint(e_gdj)>3 and ewxgn("e2")) then%>
<div class="m-mu">
<h3 onClick="showAsaiMenu(77)">插件服务</h3>
<ul id='AsaiMenu77'>
<li><a href="<%=eshref(s_drplug&"AsaiConfig/",3)%>?<%=eshref(s_drsys&"config_sai.asp",3)%>" class="m-max" target="AMF">网站设置</a><a href="<%=eshref(s_drplug&"AsaiConfig/",3)%>?<%=eshref(i_dir&"AsaiUpLoad/config.asp",3)%>" class="m-ma" target="AMF">上传设置</a></li>
<%if aiint(e_gdj)>5 then%>
<li><a href="<%=eshref(s_drplug&"AsaiConfig/",3)%>?<%=eshref(s_drsys&"config_sys.asp",3)%>" class="m-ma" target="AMF">系统设置</a><a href="<%=eshref(s_drplug&"AsaiConfig/",3)%>?<%=eshref(s_drsys&"config_chs.asp",3)%>" class="m-ma" target="AMF">表述设置</a></li>
<li><a href="<%=eshref(s_drplug&"AsaiConfig/",3)%>?<%=eshref(s_drsys&"config_gys.asp",3)%>" class="m-ma" target="AMF">组件设置</a><a href="<%=eshref(s_drplug&"AsaiMdb",3)%>" class="m-ma" target="AMF">数据管理</a></li>
<%end if%>
<%if ewxgn("e3") then%><li><a href="<%=eshref(s_drplug&"AsaiCall/",3)%>" class="m-max" target="AMF">调用代码</a><a href="<%=eshref(s_drplug&"AsaiSnMaker/",3)%>" class="m-ma" target="AMF">获取编码</a></li><%end if%>
<%if ewxgn("e2") then%><li><a href="<%=eshref(s_drplug&"AsaiCache/",3)%>" class="m-max" target="AMF">清空缓存</a><a href="<%=eshref(s_drplug&"AsaiHtml",3)%>" class="m-ma" target="AMF">生成静态</a></li><%end if%>
<%if ewxgn("e3") then%><li><a href="<%=eshref(s_drplug&"AsaiOnline/?10",3)%>" class="m-ma" target="AMF">在线人员</a><a href="<%=eshref(s_drplug&"AsaiCount",3)%>" class="m-ma" target="AMF">访问统计</a></li><%end if%>
<li><a href="<%=eshref(s_drplug&"AsaiInsert/",3)%>" class="m-ma" target="AMF">填充内容</a><a href="<%=eshref(s_drplug&"AsaiFrame/?asai/asaiweb/seo/",3)%>" class="m-ma" target="AMF">收录优化</a></li>
<li><a href="<%=eshref(s_drplug&"AsaiBook/?admin",3)%>" class="m-ma" target="AMF">留言管理</a><a href="<%=eshref(s_drplug&"AsaiSkinColor",3)%>" class="m-ma" target="AMF">色彩配置</a></li>
<%if aiint(e_gdj)>5 and ewxgn("e6") then%><li><a href="<%=eshref(s_drplug&"AsaiFile",3)%>" class="m-ma" target="AMF">文件管理</a><a href="<%=eshref(s_drplug&"AsaiSqlDo/",3)%>" class="m-ma" target="AMF">高级执行</a></li><%end if%>
</ul>
</div>

<%if ewxgn("e4") then%>
<div class="m-mu">
<h3 onClick="showAsaiMenu(99)">版本信息</h3>
<ul id='AsaiMenu99'>
<li>版本：<a class="m-ma" target="_blank" href="http://www.eesai.com/">EESai20</a></li>
<li>版权：<a class="m-ma" target="_blank" href="http://www.eesai.com/">阿赛工作室</a></li>
</ul>
</div>
<%end if%>
<%end if%>
<%end if%>
<%=mzend(200)%><%

elseif aibj(g_u0,s_umgl) and aibj(g_u1,"adminmain") then
%><%=mztop(1,"管理后台欢迎页")%>
<%Function eesai_Info(obj,ver)
On Error Resume Next'display err
Dim objTest,sTemp
Set objTest=Server.CreateObject(obj)
If Err.Number<>0 Then
Err.Clear
eesai_Info="<font color=""#ff0000"">×不支持</font>"
Else
sTemp=""
If ver=1 Then
sTemp=objTest.version
If IsNull(sTemp) Then sTemp=objTest.about
sTemp=Replace(sTemp,"Version","")
sTemp="&nbsp;<font color=""#006600"">"&sTemp&"</font>"
End If
eesai_Info="<font color=""#006600"">√支持</font>"&sTemp
End If
Set objTest=Nothing
If Err.Number<>0 Then Err.Clear
End Function
%>
<div class=g-lt><b>后台使用说明</b></div>
<div class="gal"><ul>
<li class=g-ll0>1、后台所有文本框，如不知道如何填写，将鼠标光标悬停其上，会出现详细的填写提示；</li>
<li class=g-ll1>2、后台常用的操作有”添加“=添加新的内容信息，”修改“=修改已经存在的内容信息，依次按要求填写或修改文本框中内容，点击表单最后的添加或修改按钮即可完成操作，另外还有”删除“=删除当前内容信息，请删除前确认您的操作，因为删除后，该内容将不复存在；</li>
<li class=g-ll0>3、如果网站启用缓存功能，后台使用说明第2点提到的添加、修改、删除操作将不会即时更新到前台，需要点击进入后台菜单”清空缓存“中（或点击后台右上角的”清空缓存“进入）清除对于内容信息的前台缓存；</li>
<li class=g-ll1>4、修改网站标题、关键词、链接等信息请到【全局管理】的【站点管理】中，选择自己的网站进行修改；</li>
<li class=g-ll0>5、友情说明：系统功能强大，可扩展性更强大，如果您想更好、更熟练使用本套系统，可以访问官网或联系技术员获取更多的使用教程、说明、帮助等信息。</li>
<%if aiint(e_gdj)>5 then%>
<li class=g-ll1>当前基带版本：EESai20&nbsp;&nbsp;发布时间：2018年01月08日，<a href="http://www.eesai.com/" target="_blank">[官方网站]</a>、<a href="http://www.eesai.com/?bbs/" target="_blank">[官方论坛]</a>。</li>
<li class=g-ll0><script>var ver=19;</script><script language="JavaScript" charset="utf-8" src="http://www.eesai.com/AsaiSkin/js/EESai-v.js"></script></li>
<%end if%>
</ul></div>
<%if pqx(3) then%>
<div class=g-lt><b>网站空间信息</b></div>
<div class="gal"><ul>
<li class=g-ll0>当前路径：<%="http://"&request.servervariables("server_name")&request.servervariables("script_name") %></li>
<li class=g-ll1>服务器名：<%=Request.ServerVariables("SERVER_NAME")%></li>
<li class=g-ll0>服务器端口：<%=Request.ServerVariables("SERVER_PORT")%></li>
<li class=g-ll1>服务器时间：<%=now%></li>
<li class=g-ll0>IIS版本：<%=Request.ServerVariables("SERVER_SOFTWARE")%></li>
<li class=g-ll1>脚本超时时间：<%=Server.ScriptTimeout%></li>
<li class=g-ll0>本文件路径：<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></li>
<li class=g-ll1>服务器解译引擎：<%=ScriptEngine&"/"& ScriptEngineMajorVersion&"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></li>
<li class=g-ll0>支持的文件类型：<%=Request.ServerVariables("HTTP_Accept")%></li>
<li class=g-ll1>访问的文件路径：<%=Request.ServerVariables("HTTP_url")%></li>
<li class=g-ll0>站点物理路径：<%=request.ServerVariables("APPL_PHYSICAL_PATH")%></li>
<li class=g-ll1>用户代理的信息：<%=Request.ServerVariables("HTTP_USER_AGENT")%></li>
<li class=g-ll0>ADODB.Connection(ADO 数据对象)：<%=eesai_Info("adodb.connection",1)%></li>
<li class=g-ll1>Scripting.FileSystemObject (FSO 文本文件读写)：<%=eesai_Info("scripting.filesystemobject",0)%></li>
<li class=g-ll0>Stream 文件流：<%=eesai_Info("A"&"dod"&"b.St"&"r"&"eam",0)%></li>
<li class=g-ll1>Microsoft.XMLHTTP：<%=eesai_Info("Microsoft.XMLHTTP",0)%></li>
<li class=g-ll0>Microsoft.XMLDOM：<%=eesai_Info("Microsoft.XMLDOM",0)%></li>
<li class=g-ll1>CDO.Message：<%=eesai_Info("CDO.Message",0)%></li>
<li class=g-ll0>CDO.Configuration：<%=eesai_Info("CDO.Configuration",0)%></li>
<li class=g-ll1>AspJpeg 图像处理组件：<%=eesai_Info("Persits.Jpeg",1)%><%if aiint(e_gdj)>4 then%>&nbsp;&nbsp;<a href="http://www.eesai.com/">[官方下载]</a><%end if%></li>
<li class=g-ll0>AspUpload 上传处理组件：<%=eesai_Info("Persits.Upload",1)%><%if aiint(e_gdj)>4 then%>&nbsp;&nbsp;<a href="http://www.eesai.com/">[官方下载]</a><%end if%></li>
</ul></div>
<%end if%>
<%=mzend(200)%><%
else
Response.write mztop(0,"管理后台服务")%>
<script type="text/javascript">if (window!=top){top.location.href=window.location.href;}</script>
<table class=FR-b width=100% height=100% border=0 cellspacing=0 cellpadding=0><tr><td rowspan=5 width=5></td><td colspan=3 height=5></td><td rowspan=5 width=5></td></tr><tr><td colspan=3 height=58 id=frt>
<iframe class=FR-m src=<%=eshref(s_umgl&g_urg&"admintop"&g_urz,2)%> frameborder=0 scrolling=no name=ATF id=ATF></iframe>
</td></tr><tr><td colspan=3 height=8 title=单击可以关闭或打开顶部页面 class=FR-z onMouseOver="this.className='FR-za';" onMouseOut="this.className='FR-z';" onClick="if(document.getElementById('frt').style.display==''){document.getElementById('frt').style.display='none';document.getElementById('frtimg').className='glyphicon glyphicon-chevron-down';}else{document.getElementById('frt').style.display='';document.getElementById('frtimg').className='glyphicon glyphicon-chevron-up';}">
<span id="frtimg" class="glyphicon glyphicon-chevron-up"></span>
</td></tr><tr><td width=158 height=100% id=frl>
<iframe class=FR-m src=<%=eshref(s_umgl&g_urg&"adminmenu"&g_urz,2)%> frameborder=0 scrolling=auto name=ALF id=ALF></iframe>
</td><td width=8 title=单击可以关闭或打开左侧页面 class=FR-z onMouseOver="this.className='FR-za';" onMouseOut="this.className='FR-z';" onClick="if(document.getElementById('frl').style.display==''){document.getElementById('frl').style.display='none';document.getElementById('frlimg').className='glyphicon glyphicon-chevron-right';}else{document.getElementById('frl').style.display='';document.getElementById('frlimg').className='glyphicon glyphicon-chevron-left';}">
<span id="frlimg" class="glyphicon glyphicon-chevron-left"></span>
</td><td height=100%>
<iframe class=FR-m src=<%=eshref(s_umgl&g_urg&"adminmain"&g_urz,2)%> frameborder=0 scrolling=auto name=AMF id=AMF></iframe>
</td></tr><tr><td colspan=3 height=5></td></tr></table>
</body></html>
<%end if%>
<!--#include file="../AsaiInc/incma.asp"-->