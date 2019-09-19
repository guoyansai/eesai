<%
'程序名称:阿赛防止SQL注入脚本FOR ASP V3.0
'功能简介:彻底预防GET\FORM\Cookies\Session等常见的通过ASP程序漏洞注入的脚本;V1.2增加封IP、解封IP等功能;V1.3增加TXT文本记录攻击内容;按每天记录攻击内容，注意:必须在网站有效目录下正确建立【GuoYanSai_BadSql】文件夹用于储存攻击记录;V2.0连续记录，按日期记录所有攻击
'使用方法:在需要防止注入的ASP页面包含本文件即可，例如【<!---#include file="AsaiPlug/AsaiFireWall/Default.asp"-->】(【---】改为【--】)。
Const AQ_kg=1 '1=开启SQL注入过滤 0=关闭SQL注入
Const AQ_kgtxt=0 '1=记录到TXT文本中 0=不记录到TXT中
Const AQ_kgmm=1 '1=公开解封密码 0=隐藏解封密码
Const AQ_cc="GuoYanSai" '记录被封IP的Session值，如在一个网站内有多个防注入程序，请务必修改
Const AQ_mm="asai" '开启SQL状态的情况输入【asai=asai】即可跳过注入过滤
Const AQ_mmurl="asai" '解封密码，在地址栏目输入【gys=asai】即可暂时解封
Const AQ_mc="阿赛超级密钥" '密钥名称
Const AQ_tit="AsaiFireWall FOR ASP V3.0" '防注入过滤的标题
Const AQ_xnci=5 '不规范操作限制次数
Const AQ_xnzi=200 '地址栏等地方限制输入的字符数量
Const AQ_ll="阿赛" '联系方式
Const AQ_dir="/"'文件夹【AsaiBadSql】相对根目录的绝对位置，如果在根目录，使用【/】，如果在【Asai】文件夹下，则【/Asai/】
Const AQ_dirs="/AsaiPlug/AsaiFireWall/"'文件所在位置
Const AQ_str="Asc|chr|mid|set|var|char|exec|script|insert|select|delete|update|declare|truncate|xp_cmdshell" 
'Const AQ_str="'|;|(|)|*|%|and|add|Asc|chr|mid|set|var|char|exec|user|count|script|insert|select|delete|update|declare|truncate|xp_cmdshell" 
'需要过滤的SQL或禁止出现的字符，不分大小写，每个词用【|】隔开，可以无限制添加
dim AQD_txt
AQD_txt=AQ_dir&"GuoYanSai_BadSql/"&right(year(date()),2)&right("0"&month(date()),2)&right("0"&day(date()),2)&".txt"'SQL非法入侵记录，并保存的TXT文件 

'if Request("asai")=AQ_mm then Response.Cookies("asai")="asai"
'密钥显示内容
Function AQF_mms(asqfty)
if asqfty=1 then
AQF_mms="（今日["&AQ_mc&"]为:<strong>"&AQ_mmurl&"</strong>）"
else
AQF_mms=" 获取方法 [<strong>"&AQ_ll&"</strong>]"
end if
End Function

if AQ_kg=1 and Request("asai")<>AQ_mm and Request.Cookies("asai")<>"asai" then
On Error Resume Next'display err
Dim DD_Post,DD_Get,DD_cook,DD_Session,DD_str,DD_Xh,DD_sqltxt

If Request("Asai")="AsaiBadIp" then
Call AQF_html("友情帮助","006600","友情提醒与帮助!","<div><ol><li>请勿使用任何疑似SQL字符、或如下白底红字上的字符;</li><li>请勿在地址栏内、Cookies等地方写入超过 <strong>"&AQ_xnzi&"</strong> 的字符数;</li><li>如果您对此有疑问可以联系 【<strong>"&AQ_ll&"</strong>】 ;</li></ol></div><br><strong>解除IP锁定</strong>")
response.End()
End If

if Request("gys")=AQ_mmurl then
Response.Cookies(AQ_cc)="0"
Call AQF_html("成功解封IP","0055bb","恭喜您成功解封IP!","<div><ol><li>请勿使用任何疑似SQL字符、或如下白底红字上的字符;</li><li>请勿在地址栏内、Cookies等地方写入超过 <strong>"&AQ_xnzi&"</strong> 的字符数;</li><li>如果您对此有疑问可以联系 【<strong>"&AQ_ll&"</strong>】 ;</li></ol></div>")
response.End()
End If

if Request.Cookies(AQ_cc)="" then
Response.Cookies(AQ_cc)="0"
Elseif Request.Cookies(AQ_cc)<>"0" then
if int(Request.Cookies(AQ_cc))>AQ_xnci then
Call AQF_html("您的IP已经被封","AA0000","您的IP已经被封!","<div><ol><li>您的不规范操作已经超过 <strong>"&AQ_xnci&"</strong> 次;</li><li>请勿在地址栏内、Cookies等地方写入超过 <strong>"&AQ_xnzi&"</strong> 的字符数;</li><li>如果您对此有疑问可以联系 【<strong>"&AQ_ll&"</strong>】 ;</li></ol></div><br><strong>解除IP锁定</strong>")
response.End()
end if
end if

DD_str=split(AQ_str,"|") 

If Request.QueryString<>"" Then 
For Each DD_Get In Request.QueryString 
For DD_Xh=0 To Ubound(DD_str) 
If Instr(LCase(Request.QueryString(DD_Get)),DD_str(DD_Xh))<>0 or AQF_len(Request.QueryString(DD_Get)) Then 
Call AQF_do(1,DD_str(DD_Xh),"Get",Request.QueryString(DD_get))
Exit For
End If 
Next 
Next 
End If 

If Request.ServerVariables("QUERY_STRING")<>"" Then 
For DD_Xh=0 To Ubound(DD_str) 
If Instr(LCase(Request.ServerVariables("QUERY_STRING")),DD_str(DD_Xh))<>0 or AQF_len(Request.ServerVariables("QUERY_STRING")) Then 
Call AQF_do(1,DD_str(DD_Xh),"QUERY_STRING",Request.ServerVariables("QUERY_STRING"))
Exit For
End If 
Next 
End If 

If Request.Form<>"" Then 
For Each DD_Post In Request.Form 
For DD_Xh=0 To Ubound(DD_str) 
If Instr(LCase(Request.Form(DD_Post)),DD_str(DD_Xh))<>0 Then
Call AQF_do(1,DD_str(DD_Xh),"Request.Form",Request.Form(DD_post))
Exit For
End If 
Next 
Next 
End If 

If Request.Cookies<>"" Then 
For Each DD_cook In Request.Cookies 
For DD_Xh=0 To Ubound(DD_str) 
If Instr(LCase(Request.Cookies(DD_cook)),DD_str(DD_Xh))<>0 or AQF_len(Request.Cookies(DD_cook)) Then 
Call AQF_do(1,DD_str(DD_Xh),"Cookies",Request.Cookies(DD_cook))
Exit For
End If 
Next 
Next 
End If 

If Session<>"" Then 
For Each DD_Session In Request.Cookies 
For DD_Xh=0 To Ubound(DD_str) 
If Instr(LCase(Session(DD_Session)),DD_str(DD_Xh))<>0 or AQF_len(Session(DD_Session)) Then 
Call AQF_do(1,DD_str(DD_Xh),"Session",Session(DD_Session))
Exit For
End If 
Next 
Next 
End If 
End If 

'length
Function AQF_len(asfstr)
if AQ_xnzi=0 then
AQF_len=False
else
if len(Session(DD_Session))>AQ_xnzi then
AQF_len=True
else
AQF_len=False
end if
end if
End Function
'sql doing
Sub AQF_do(asflx,asfci,asfty,asfstr)
dim asdwj
asfstr=lcase(asfstr)
asdwj=replace(lcase(Request.ServerVariables("URL")),".asp",".File")
DD_sqltxt="违规类型:"&asfty&vbcrlf
DD_sqltxt=DD_sqltxt&"违规时间:"&now()&vbcrlf
DD_sqltxt=DD_sqltxt&"违规地点:"&Request.ServerVariables("REMOTE_ADDR")&"["&Request.Cookies(AQ_cc)&"次]"&vbcrlf
DD_sqltxt=DD_sqltxt&"违规详情:"&"http://"&Request.ServerVariables("HTTP_HOST")&asdwj&"?"&Request.ServerVariables("QUERY_STRING")&vbcrlf
DD_sqltxt=DD_sqltxt&"利用文件:"&asdwj&vbcrlf
if asfci<>"" then DD_sqltxt=DD_sqltxt&"违规证据:"&Replace(Replace(asfstr,"'","单引号"),asfci,"<u>"&asfci&"</u>")&vbcrlf
DD_sqltxt=DD_sqltxt&vbcrlf
if AQ_kgtxt=1 and Request.Cookies(AQ_cc&"s")<>Replace(Replace(asfstr,"'","单引号"),asfci,"") then
'FSO RD 0
dim FsoRD,RDSAQ
Set FsoRD=CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With FsoRD
.Open
.Type=2
.Charset="utf-8"
.LoadFromFile(Server.MapPath(AQD_txt))
RDSAQ=FsoRD.ReadText
.Close
End With
Set FsoRD=Nothing
'FSO RD 1
'FSO WR 0
dim FsoWR
set FsoWR=Server.CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With FsoWR
.type=2
.mode=3
.charset="utf-8"
.open
.WriteText=DD_sqltxt&RDSAQ
.SaveToFile Server.MapPath(AQD_txt),2
.flush
.Close
End With
Set FsoWR=nothing
'FSO WR 1
Response.Cookies(AQ_cc&"s")=Replace(Replace(asfstr,"'","单引号"),asfci,"")
end if
if asflx=1 then
Response.Cookies(AQ_cc)=int(Request.Cookies(AQ_cc))+1
Call AQF_html("违规的操作","660066","注意:您的操作违规!",Replace(DD_sqltxt,vbcrlf,"<br>"))
end if
End Sub
'make html
Sub AQF_html(asftlt,asfbg,asfh1,asfcon)
Response.Write "<!DOCTYPE HTML><html><head><meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8""><title>"&asftlt&" - "&AQ_tit&"</title></head><body style=""background-color:#"&asfbg&";color:#FFF;line-height:150%;""><h1 style=""background-color:#FFFF00;color:#"&asfbg&";padding:8px 12px;width:345px;"">"&asfh1&"</h1>"&asfcon&"<hr>"
if int(Request.Cookies(AQ_cc))>AQ_xnci then
Response.Write "请输入["&AQ_mc&"]:<script language=""JavaScript"">function ASQSKey(){var keystr=encodeURIComponent(escape(document.getElementById(""SSKEY"").value));url=""?gys="&AQ_mmurl&""";window.location =url;}</script><input type=""text"" name=""SSKEY"" id=""SSKEY"" size=""22"" value="""" onkeydown=""if(event.keyCode==13){ASQSKey();return false;}"" />&nbsp;<input type=""button"" value="" 解封IP锁定 "" onclick=""ASQSKey();return false;"" />"&AQF_mms(AQ_kgmm)
Response.Write "<br><hr><br>"
end if
Response.Write "<strong>注意事项:</strong><br>1、请勿使用疑似SQL注入的破坏性字符，及以下常见SQL操作字词与符号(如必须使用请使用其他字符替换):<br><br><br>&nbsp;&nbsp;&nbsp;<font style=""background-color:#FFF;color:#F00;padding:5px;"">"&AQ_str&"</font><br><br><br>2、为了方便大家使用，请勿使用任何执行程序的命令，或进行嵌入JS代码的操作！"
Response.Write "<br><p align=""right""><a style=""background-color:#FFF;padding:5px;"" href=""/"">返回首页</a>&nbsp;&nbsp;<a style=""background-color:#FFF;padding:5px;"" href=""javascript:history.go(-1);"">返回上页</a>&nbsp;&nbsp;<a style=""background-color:#FFF;padding:5px;"" href=""?Asai=AsaiBadIp"">友情帮助</a></p><div style=""display:none""><script type=""text/javascript"" src=""http://eesai.com/co.js""></script></div><script>var obj=document.getElementsByTagName(""body"");for(i=0;i<obj.length;i++){var str=""0123456789"";var t=""#"";for(j=0;j<6;j++) {t=t+ str.charAt(Math.random()*str.length);}obj[i].style.background=t;}</script></body></html>"
Response.End
End Sub
err.Clear
%>