<%
const qx_mm="Q2rX8-WK="
'-----------------------------------
'PS:manage quanxian
'=pqx(0)
'-----------------------------------
'======插件权限0
if Request.ServerVariables("QUERY_STRING")=aimm(g_gmm,qx_mm,1) then
Response.Cookies("gl")="6"
end if
'======插件权限1
Function pqx(pqfty)
pqx=false
if Request.Cookies("gl")<>"" then
if int(Request.Cookies("gl"))>pqfty then
pqx=true
end if
end if
End Function
'-----------------------------------
'PS:plug top
'=pdt()
'-----------------------------------
Function pdt(pfbt)
pdt="<!DOCTYPE HTML>"
pdt=pdt&"<html><head><meta charset=""utf-8"">"
pdt=pdt&"<title>"&pfbt&"—阿赛工作室插件</title>"
pdt=pdt&"<meta name=""keywords"" content=""阿赛,阿赛工作室,EESai,Asai,GuoYanSai."">"
pdt=pdt&"<meta name=""description"" content=""专业因专注于ASP程序研究。"">"
pdt=pdt&"<meta name=""copyright"" content=""阿赛工作室[EESai.Com]"">"
pdt=pdt&"<link type=""text/css"" rel=""stylesheet"" rev=""stylesheet"" href=""../../AsaiSkin/asaisyscss.css""><style>*{font-family:""微软雅黑"";}body,ul,li,img{padding:0px;margin:0px;border:0px;list-style:none;}</style>"
pdt=pdt&"</head>"
End Function
'-----------------------------------
'PS:plug end
'=pde()
'-----------------------------------
Function pde(pfstr)
pde=""&pfstr
pde=pde&""
End Function
%>