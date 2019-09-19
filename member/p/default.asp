<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiUser/AsaiUser.asp"--><!--#include file="../../AsaiInc/inc.asp"--><!--#include file="../../AsaiInc/bu/pp.asp"--><%
'response.Write request.Cookies(x_ppck)
'response.Cookies(x_ppck)=""
dim ppsus,ppsurr,ppsu0,ppsu1,ppsu2,ppsu3,ppsu4,ppsu5,ddskrr
ppsus=Request.ServerVariables("QUERY_STRING")
ppsurr=split(ppsus&"///////////","/")
ppsu0=ppsurr(0)
ppsu1=ppsurr(1)
ppsu2=ppsurr(2)
ppsu3=ppsurr(3)
ppsu4=ppsurr(4)
ppsu5=ppsurr(5)
if ppsu0="time" then
'?0time/1sn/2tm
if datediff("s",aitmx(ppsu2,23),now())<0 then
response.Write aidjtm(0,aitmx(ppsu2,23),"")
else
response.Write "时间到！请赶紧刷新页面！"
end if
elseif ppsu0="ajax" then
'?0ajax/1sn/2ty=1us,2jg,3tm,4xy
Call ppapp(1,ppsu1,"")
if ppsu2="1" then
response.Write ppaus
elseif ppsu2="2" then
if aiint(ppajg)>aiint(ppsu3) then
response.Write ppajg
else
response.Write ppsu3
end if
elseif ppsu2="3" then
response.Write ppatm
'response.Write aidjs(1,aitmx(ppatm,6),"")
elseif ppsu2="4" then
response.Write ppaxy
end if
else
ddskrr=split(Request.Cookies(x_ppck&"sk")&"|","|")
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>我的竞拍</title>
<link rel="stylesheet" type="text/css" rev="stylesheet"  href="../../<%=i_msk%>asai.css">
<link rel="stylesheet" type="text/css" rev="stylesheet" ID="AsaiSkin" href="../../<%=ddskrr(0)%>asaisyscss<%if i_msk<>ddskrr(0) then%>_<%end if%>.css">
</head>
<body bgcolor="#FFFFFF" class="gys<%=ddskrr(1)%>">
<%
response.Write "<div class=d-vk>"
'0ty/1sn/2er/3jg/4oz
if ppsu0="delall" then
Response.Write ppsai(11,"",ppsu1,ppsu4,ppsu3,"",ppsu5,ppsu2,0,0)
elseif ppsu0="del" then
Response.Write ppsai(1,"",ppsu1,ppsu4,ppsu3,"",ppsu5,ppsu2,0,0)
else
Response.Write ppsai(0,request.Cookies(x_ppck),0,0,0,0,0,0,0,0)
end if
response.Write ppcar(request.Cookies(x_ppck))
'response.Write "<a class=""d-vas"" target=""_self"" href=""?delall/////"">清空记录</a>"
response.Write "<a class=""d-vas"" target=""_self"" href=""?"">刷新一下</a>"
response.Write "</div>"
%>
</body>
</html><%end if%>