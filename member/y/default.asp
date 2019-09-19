<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="../../AsaiData/config_sai.asp"--><!--#include file="../../AsaiData/config.asp"--><!--#include file="../../AsaiInc/bu/dd.asp"--><!doctype html>
<%'response.Write request.Cookies(x_ddck)
'response.Cookies(x_ddck)=""
dim ddsus,ddsurr,ddsu0,ddsu1,ddsu2,ddsu3,ddsu4,ddsu5,ddskrr
ddsus=Request.ServerVariables("QUERY_STRING")
ddsurr=split(ddsus&"////////","/")
ddskrr=split(Request.Cookies(x_ddck&"sk")&"|","|")
'0ty/1sn/2er/3sl/4jg
ddsu0=ddsurr(0)
ddsu1=ddsurr(1)
ddsu2=ddsurr(2)
ddsu3=ddsurr(3)
ddsu4=ddsurr(4)
ddsu5=ddsurr(5)
%><html>
<head>
<meta charset="utf-8">
<title>我的购物车</title>
<link rel="stylesheet" type="text/css" rev="stylesheet" href="../../<%=i_msk%>asai.css">
<link rel="stylesheet" type="text/css" rev="stylesheet" ID="AsaiSkin" href="../../<%=ddskrr(0)%>asaisyscss<%if i_msk<>ddskrr(0) then%>_<%end if%>.css">
</head>
<body bgcolor="#FFFFFF" class="gys<%=ddskrr(1)%>">
<%
response.Write "<div class=d-vk>"
if ddsu0="jia" then
response.Write ddsai(5,request.Cookies(x_ddck),ddsu1,ddsu4,ddsu3,"",ddsu5,ddsu2)
elseif ddsu0="jian" then
response.Write ddsai(2,request.Cookies(x_ddck),ddsu1,ddsu4,ddsu3,"",ddsu5,ddsu2)
elseif ddsu0="del" then
response.Write ddsai(1,request.Cookies(x_ddck),ddsu1,ddsu4,ddsu3,"",ddsu5,ddsu2)
elseif ddsu0="edit" then
response.Write ddsai(3,request.Cookies(x_ddck),ddsu1,ddsu4,ddsu3,"",ddsu5,ddsu2)
elseif ddsu0="act" and request.Form("sl")<>"" and request.Form("cs")<>"" then
dim ddwrr
ddwrr=split(request.Form("cs")&x_ddgb&x_ddgb&x_ddgb&x_ddgb&x_ddgb,x_ddgb)
'0sn/1jg/2bt/3us
'ddsai(ddstr,ddfty,0ddfsn,1ddfdj,ddfsl,2ddfbt,4ddfbt,3ddfus)
if request.Form("buy")="2" then'goto cart
Response.Cookies(x_ddck&"ls")="1"
Response.Cookies(x_ddck&"lss")=request.Cookies(x_ddck)
response.Write ddsai(8,"",ddwrr(0),ddwrr(1),request.Form("sl"),ddwrr(2),ddwrr(4),ddwrr(3))
response.Write "<script>top.location='"&x_ddtj&"';</script>"
response.end()
else
response.Write ddsai(9,request.Cookies(x_ddck),ddwrr(0),ddwrr(1),request.Form("sl"),ddwrr(2),ddwrr(4),ddwrr(3))
end if
else
if request.Cookies(x_ddck&"ls")="1" then
Response.Cookies(x_ddck&"ls")="0"
Response.Cookies(x_ddck)=request.Cookies(x_ddck&"lss")
Response.Cookies(x_ddck&"lss")=""
end if
response.Write ddsai(0,request.Cookies(x_ddck),0,0,0,0,0,0)
end if
response.Write ddcar(request.Cookies(x_ddck))
response.Write "<a class=""d-vas"" target=""_blank"" href="&x_ddtj&">提交订单</a>"
response.Write "</div>"
%>
</body>
</html>
