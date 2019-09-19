<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="AsaiUser.asp"--><!--#include file="AsaiUserx.asp"--><%
if asaistr="AsaiUser" then
Call icuser(5)
response.Write userlin
elseif asaistr="loginjs" then'JS自动登录
if userx=0 then response.Write asailoginx(2)
else
%><!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=asaitit%>账户中心</title>
<link rel="stylesheet" href="<%=w_usurl%>bootstrap/bootstrap.min.css">
<meta name="keywords" content="<%=asaitit%>账户中心">
<meta name="description" content="<%=asaitit%>账户中心">
<meta name="copyright" content="阿赛工作室,郭言赛,eesai.com">
</head>
<body class="bg-light">
<header>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
<h2 class="my-0 mr-md-auto font-weight-bold text-center"><%=asaitit%></h2>
<nav class="my-2 my-md-0 mr-md-3 text-center"><a class="p-2 text-dark" href="<%=asaiwww%>">网站主页</a>
<a class="p-2 text-dark" href="<%=w_usurl%>?list///<%=asaifan%>" target="_blank">会员中心</a>
<%if userx>0 then%><a class="p-2 text-dark" href="./?color">颜料板</a><%else%><a class="p-2 text-dark" href="./?loginx<%if w_usip=1 then%>x<%end if%>">快上线</a><%end if%>
<div class="btn-group">
<%if userx>0 then
if e_ubt="0" or e_ubt="" then e_ubt=e_uer%>
<a class="btn btn-primary" href="./?view"><%=e_ubt%></a> 
<a class="btn btn-outline-primary" href="./?exit">退出</a> 
<%else%>
<a class="btn btn-primary" href="./?login">登录</a>
<a class="btn btn-outline-primary" href="<%=w_usurl%>?reg///<%=asaifan%>" target="_blank">注册</a>
<%end if%>
</div>
</div>
</header>

<main role="main" class="container">
<div class="row">

<div class="col-md-12 bg-white rounded" style="margin-bottom:28px;"><br>
<%
if asaistr="login" then
response.Write asailogin()
%>
<h3>会员登录</h3>
<form class="needs-validation" name="login" method="post" novalidate>
<div class="form-group row"><label for="asaiyh" class="col-sm-2 col-form-label">会员帐户</label><div class="col-sm-6"><input type="text" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\-]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\a-\z\A-\Z0-9\-]/g,''))" class="form-control" id="asaiyh" name="asaiyh" placeholder="限英文和数字" required><div class="invalid-feedback">用户名为必填项. </div></div><small class="col-sm-4 text-muted text-left">*请输入注册使用的用户名.</small></div>
<div class="form-group row"><label for="asaimm" class="col-sm-2 col-form-label">登录密码</label><div class="col-sm-6"><input type="password" onkeyup="value=value.replace(/[^a-zA-Z0-9]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z0-9]/g,''))" class="form-control" id="asaimm" name="asaimm" placeholder="" required><div class="invalid-feedback">密码为必填项. </div></div><small class="col-sm-4 text-muted text-left">*请输入登录密码.</small></div><input type=hidden name=asaiCK value=<%=asaiwww%>><button class="btn btn-primary btn-lg btn-block" type="submit">提交登录信息</button></form><script src="<%=w_usurl%>bootstrap/js.js"></script><br>
<%
elseif asaistr="loginn" then
response.Write "<h3 align=center>请稍等，正在为您临时分配会员账号...</h3><p align=center>提示：您可以通过 <a href="&w_usurl&"?reg///"&asaifan&">注册</a>/<a href=./?login>登录</a> 使用独享的永久账号。<script>function asaigobgt(){location.replace(""./?loginxx"");}setTimeout('asaigobgt()',8000);</script><a href=./?loginxx>请等待 8 秒后自动跳转,或点击这里跳转!</a></p>"

elseif asaistr="loginx" then'自动登录
response.Write asailoginx(0)

elseif asaistr="loginxx" then'强制IP自动登录
response.Write asailoginx(1)

elseif asaistr="exit" then'退出登录
response.Write asaiexit()

elseif left(asaistr,4)="view" then'会员浏览
if asaistr="view" then asaistr=""
response.Write asaiview(replace(asaistr,"view/",""))

elseif left(asaistr,5)="color" then'颜色设定
Response.Write asaicolor(replace(asaistr,"color/",""))

else
if userx>0 then
Response.Write "<p>您已经成功登录</p>"&asaitiao(asaiwww)
else
Response.Redirect("?login")
end if
end if
%>
</div>
</main>


<footer class="container border-top alert" style="margin-top:28px;">
<p class="float-right"><a class="btn btn-outline-secondary" href="#">^</a></p>
<p>&copy; 2017-<%=year(date())%></p>
<p><script src="http://x.780.pub/js/_link.js"></script></p>
</footer>

</body>
</html><%end if%>