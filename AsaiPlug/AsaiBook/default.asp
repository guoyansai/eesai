<!doctype html>
<html>
<head>
<meta charset="gb2312">
<title>Asai系统TXT在线安全留言本</title>
</head>
<style>
body,form{padding:0px;margin:0px;border:0px;background-color:#FFFFFE;}
*{font-size:14px;font-family:"微软雅黑";}
.lytc{width:100%;height:228px;overflow:hidden;text-align:center;}
.lynr,.lynrx{width:100%;padding:0px;margin:0px;border:0px;font-size:14px;height:186px;;line-height:22px;border-bottom:#DD0000 1px solid;color:#585858;}
.lytj{padding:5px 20px;border:0px;margin:2px 0px 0px 0px;background-color:#DD0000;color:#FFFFFE;}
</style>
<link type="text/css" rel="stylesheet" rev="stylesheet" href="../../AsaiSkin/asaisyscss.css">
<body>
<%
dim nrurl,nrstrmo,nrhci,nrhc,nrtxt
nrurl=Request.ServerVariables("QUERY_STRING")
nrhc="AsaiBook"
nrtxt="../../AsaiData/AsaiBook.txt"
nrhci=3
nrstrmo="请输入留言内容(10-100个字)。"

if nrurl="read" or nrurl="admin" then
dim tclys,tclysrr,tclysii,tclysjj
dim anfilereadfso,anfilereadfsop
'======插件权限0
'Response.Cookies("gl")="2"'通过传递过来的cookes值来判断是否拥有管理留言的权限。
Function pqx()
pqx=false
if Request.Cookies("gl")<>"" then
if int(Request.Cookies("gl"))>3 then pqx=true
end if
End Function
'======插件权限1
if not pqx() then
response.Write "对不起，您无权使用本功能！"
else
if nrurl="read" then
'FSO READ 0
Set anfilereadfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set anfilereadfsop=anfilereadfso.OpenTextFile(Server.MapPath(nrtxt),1,True)
tclys=anfilereadfsop.ReadAll
Set anfilereadfsop=Nothing
Set anfilereadfso=Nothing
'FSO READ 1
if tclys<>"" then
response.Write("<div class=g-lt>网站留言反馈</div><div class=g-ll><ul>")
response.Write("<li class=g-ll0><strong><a href=""?admin"">修改留言</a>|<a href=""?"" target=""_blank"">留言窗口</a></strong></li>")
tclysrr=split(tclys,chr(10))
tclysjj=0
for tclysii=0 to ubound(tclysrr)
if tclysrr(tclysii)<>"" then
tclysjj=tclysjj+1
if tclysjj mod 2=0 then
response.Write("<li class=g-ll0>"&tclysrr(tclysii)&"</li>")
else
response.Write("<li class=g-ll1>"&tclysrr(tclysii)&"</li>")
end if
end if
next
end if
response.Write("</ul></div>")
elseif nrurl="admin" then
response.Write("<div class=g-lt>网站留言反馈——修改</div><div class=g-ll><ul>")
response.Write("<li class=g-ll0><strong><a href=""?read"">预览留言</a>|<a href=""?"">留言窗口</a></strong></li>")
if request("nr")<>"" then
'FSO write 0
dim aneditwritetfso,aneditwritetfsop
Set aneditwritetfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set aneditwritetfsop=aneditwritetfso.OpenTextFile(Server.MapPath(nrtxt),2,True)
aneditwritetfsop.Write(request("nr"))
Set aneditwritetfsop=Nothing
Set aneditwritetfso=Nothing
'FSO write 1
response.Write("<li class=g-ll0><strong>恭喜您！已经成功修改完成！</strong></li>")
end if
'FSO READ 0
Set anfilereadfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set anfilereadfsop=anfilereadfso.OpenTextFile(Server.MapPath(nrtxt),1,True)
tclys=anfilereadfsop.ReadAll
Set anfilereadfsop=Nothing
Set anfilereadfso=Nothing
'FSO READ 1
%><li class=g-ll1>
<form id="AsaiForm" name="AsaiForm" action="" method="post">
<textarea name="nr" id="nr" class="lynrx"><%=tclys%></textarea><br />
<input type="submit" class="lytj" value="修改留言" />
<input type="reset" class="lytj" value="重置" />
</form></li>
<%
response.Write("</ul></div>")
end if
end if
else
if request("nr")<>"" then
if request("nr")<>nrstrmo then
if request("nr")<>request.Cookies(nrhc) then
if len(request("nr"))>10 and len(request("nr"))<100 then
if request.Cookies(nrhc&"i")="" then
response.Cookies(nrhc&"i")="0"
else
response.Cookies(nrhc&"i")=int(request.Cookies(nrhc&"i"))+1
end if
if int(request.Cookies(nrhc&"i"))<nrhci then
response.Cookies(nrhc)=request("nr")
dim anfilewritetfso,anfilewritetfsop
Set anfilewritetfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set anfilewritetfsop=anfilewritetfso.OpenTextFile(Server.MapPath(nrtxt),8,True)
anfilewritetfsop.Write("("&Request.ServerVariables("REMOTE_ADDR")&")"&"["&now()&"]"&request("nr")&vbCrLf)
Set anfilewritetfsop=Nothing
Set anfilewritetfso=Nothing
response.Write "<script language=javascript>alert('恭喜您，留言内容已经成功提交。');history.go(-1);</script>"
else
response.Write "<script language=javascript>alert('对不起，您的留言次数已经超过"&nrhci&"次！');history.go(-1);</script>"
end if
else
response.Write "<script language=javascript>alert('对不起，留言内容请控制在10到100个字之间！');history.go(-1);</script>"
end if
else
response.Write "<script language=javascript>alert('对不起，该留言内容已经提交，切勿重复提交！');history.go(-1);</script>"
end if
else
response.Write "<script language=javascript>alert('对不起，请输入留言内容！');history.go(-1);</script>"
end if
end if
%><div class="lytc">
<form id="AsaiForm" name="AsaiForm" action="" method="post">
<textarea name="nr" id="nr" class="lynr" onBlur="if(this.value == ''){this.value='<%=nrstrmo%>';}" onFocus="if(this.value == '<%=nrstrmo%>'){this.value='';}"><%=nrstrmo%></textarea><br />
<input type="submit" class="lytj" value="提交留言" />
</form>
</div><%end if%>
</body>
</html>