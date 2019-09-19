<%
'const w_usurl="http://localhost:88/"'会员接口网址http://user.780.pub/本地http://localhost:88/
const w_usurl="http://user.780.pub/"'会员接口网址http://user.780.pub/本地http://localhost:88/
const w_usip=1'0关闭IP快速登录1开启IP快速登录
dim AsaiUser,asaitit,asaiwww,asaistr,asaifan
AsaiUser=""
asaitit=Request.Cookies("asaitit")
if asaitit="" then asaitit="公共会员中心"
asaistr=Request.ServerVariables("QUERY_STRING")
asaiwww="http://"&Request.ServerVariables("HTTP_HOST")&replace(replace(replace(Request.ServerVariables("URL"),"default.asp",""),"Default.asp",""),"/AsaiUser/","/")
asaifan="Au_"&replace(replace(replace(asaiwww,"http://",""),"/","+"),"?","%")
'-----------------------------------
'获取远程页面内容
'-----------------------------------
Function asaiurl(asaifurl)
If asaifurl="" Then
asaiurl="0"'网址为空
else
Dim cudxml,cudbodys
Set cudxml=Server.CreateObject("MSXML2.SERVERXMLHTTP.3.0")
'Set cudxml=Server.CreateObject("Microsoft.XMLHTTP")
On Error Resume Next
cudxml.Open "Get",asaifurl,False,"",""
cudxml.Send()
cudbodys=cudxml.ResponseBody
Set cudxml=Nothing
	'do stream
	Dim cudstom
	Set cudstom=Server.CreateObject("adodb.stream")
	On Error Resume Next
	With cudstom
	.Type=1
	.Mode=3
	.Open
	.Write cudbodys
	.Position=0
	.Type=2
	.Charset="utf-8"
	asaiurl=.ReadText
	.Close
	End With
	set cudstom=nothing
End If
End Function
'-----------------------------------
'自动跳转
'-----------------------------------
Function asaitiao(aifurl)
asaitiao="<script>function asaigobgt(){location.replace("""&aifurl&""");}setTimeout('asaigobgt()',2000);</script>"
asaitiao=asaitiao&"<a href="&aifurl&">请等待 2 秒后自动跳转,或点击这里即时跳转!</a>"
End Function
'-------------------------------
'普通登录
'-------------------------------
Function asailogin()
dim asaiyh,asaimm
asailogin=""
if request.form("asaick")=asaiwww then
asaiyh=request.form("asaiyh")
asaimm=request.form("asaimm")
if asaiyh<>"" and asaimm<>"" then
AsaiUser=asaiurl(w_usurl&"?jslogin/"&asaiyh&"/"&asaimm&"/"&asaifan&"")
if len(AsaiUser&"0")>2 then
Response.Cookies(w_ucs)=AsaiUser
asailogin=asailogin&"<h3 align=center>登录成功</h3><p align=center>"&asaiyh&"，欢迎您！"&asaitiao(asaiwww)&"</p>"
else
asailogin=asailogin&"<h3 align=center style=color:red>提示：登录失败</h3>"
end if
else
asailogin=asailogin&"<h3 align=center style=color:red>重要提示：账户和密码均不能为空</h3>"
end if
end if
End Function
'-------------------------------
'自动登录012js
'-------------------------------
Function asailoginx(alfty)
if alfty=0 then
AsaiUser=asaiurl(w_usurl&"?jsloginx///"&asaifan&"")
else
AsaiUser=asaiurl(w_usurl&"?jsloginxx///"&asaifan&"")
end if
if instr(AsaiUser,w_ugg)>0 then
Response.Cookies(w_ucs)=AsaiUser
if alfty=2 then
asailoginx="window.location.reload();"
else
asailoginx="<h3 align=center>登录成功</h3><p align=center>欢迎您！"&asaitiao(asaiwww)&"</p>"
end if
else
if alfty=2 then
asailoginx="window.location.href="""&asaiwww&"AsaiUser/?login"";"
else
asailoginx="<h3 align=center>登录失败</h3><p align=center>必须近期在会员系统上登录过！"&asaitiao(asaiwww&"AsaiUser/?login")&"</p>"
end if
end if
End Function
'-------------------------------
'退出登录
'-------------------------------
Function asaiexit()
Response.Cookies(w_ucs)=""
asaiexit="<h3 align=center>成功退出登录</h3><p align=center>"&asaitiao("?login")&"</p>"
End Function
'-------------------------------
'会员信息浏览
'-------------------------------
Function asaiview(avfstr)
if avfstr<>"" then
asaiview=asaiurl(w_usurl&"?jsview/"&avfstr&"//"&asaifan&"")
elseif e_uer<>"" then
asaiview=asaiurl(w_usurl&"?jsview/"&e_uer&"//"&asaifan&"")
else
asaiview="<h3 align=center>对不起</h3><p align=center>用户信息不存在或不可查看。"&asaitiao("AsaiUser/?login")&"</p>"
end if
End Function
'-------------------------------
'颜色缓存传递
'-------------------------------
Function asaicolor(acfstr)
asaicolor=asaiurl(w_usurl&"?jscolor/"&acfstr&"//"&asaifan&"")
Response.Cookies(w_ucs&"color")=asaiurl(w_usurl&"?jscolorx")
End Function
%>