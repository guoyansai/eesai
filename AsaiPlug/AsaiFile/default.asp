<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../inc.asp"--><%=pdt("网站文件在线管理系统")%>
<body>
<%
dim fe_dir:fe_dir=i_dir
const fe_char="utf-8"
const fe_tys="jepg,png,gif,jpg,bmp,"
const fe_tes="rar,zip,mdb,dll,exe,7z,"

if not pqx(5) then
response.Write "对不起，您无权使用本功能！"
else
dim amfdir,amfg,amfbao,amfdirr,amfdiri,amfdirl,amfnmx,amfnms
amfdir=astr(aireq("dir"))
amfg=aint(aireq("g"))

'-----------------------------------
'PS:get the request value
'=aireq("aifstr")
'-----------------------------------
Function aireq(aifstr)
if aifstr<>"" then
aireq=request(aifstr)
else
aireq=""
end if
End Function
'-----------------------------------
'PS:number format
'-----------------------------------
Function aint(aifstr)
if isnumeric(aifstr) then
aint=int(aifstr)
else
aint=0
end if
End Function
'-----------------------------------
'PS:string format
'-----------------------------------
Function astr(aifstr)
astr=trim(aifstr)
'if len(astr)>100 then astr=""
End Function
'-----------------------------------
'PS:isnull
'-----------------------------------
Function anull(aifstr)
aifstr=trim(aifstr)
if aifstr<>"" then
anull=false
else
anull=true
end if
End Function
'-----------------------------------
'PS:file read
'=anfileread("anfchar"utf-8|gb2312,"anko") read
'-----------------------------------
Function anfileread(anfchar,anko)
if lcase(anfchar)="utf-8" then'utf-8
dim anfilereadfsou
Set anfilereadfsou=CreateObject("A"&"dod"&"b.St"&"r"&"eam")
anfilereadfsou.Open
anfilereadfsou.Type=2
anfilereadfsou.Charset="utf-8"
anfilereadfsou.LoadFromFile(anko)
anfileread=anfilereadfsou.ReadText
anfilereadfsou.Close
Set anfilereadfsou=Nothing
else'gb2312
dim anfilereadfso,anfilereadfsop
Set anfilereadfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set anfilereadfsop=anfilereadfso.OpenTextFile(anko,1,True)
anfileread=anfilereadfsop.ReadAll
Set anfilereadfsop=Nothing
Set anfilereadfso=Nothing
end if
End Function
'-----------------------------------
'PS:file write
'=anfilewrite("anfchar"utf-8|gb2312,"ange"0=one|split,"anfstr","anko") write
'-----------------------------------
Function anfilewrite(anfchar,anfstr,anko)
if lcase(anfchar)="utf-8" then'utf-8
dim anfilewriteado
set anfilewriteado=server.CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With anfilewriteado
.type=2
.mode=3
.charset="utf-8"
.open
.WriteText=anfstr
.SaveToFile anko,2
.flush
.Close
End With
set anfilewriteado=nothing
else'gb2312
dim anfilewritefso,anfilewritefsop
Set anfilewritefso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set anfilewritefsop=anfilewritefso.OpenTextFile(anko,2,True)
anfilewritefsop.Write(anfstr)
Set anfilewritefsop=Nothing
Set anfilewritefso=Nothing
end if
End Function
'-----------------------------------
'PS:file read
'-----------------------------------
Function anfr(anrko)
anfr=anfileread(fe_char,Server.MapPath(anrko))
anfr=server.HTMLEncode(anfr)
End Function
'-----------------------------------
'PS:file write
'-----------------------------------
Function anfw(anfstr,anwko)
if anfstr<>"" then
anfw=anfilewrite(fe_char,anfstr,Server.MapPath(anwko))
end if
End Function
'-----------------------------------
'PS:file read name arr
'-----------------------------------
Function anfrnm(anrko,anfty)
dim anfndstr,anfndrr
anfndstr=anfr(anrko)
anfndrr=split(anfndstr,"==")
End Function
'-----------------------------------
'PS:file del
'-----------------------------------
Function amfdl(anfstr)
dim anfilefso
Set anfilefso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
if anfilefso.FileExists(Server.MapPath(anfstr)) then
anfilefso.DeleteFile(Server.MapPath(anfstr))
elseif anfilefso.folderexists(Server.MapPath(anfstr)) then
anfilefso.getfolder(Server.MapPath(anfstr)).delete
end if
set anfilefso=Nothing
amfdl=anfstr&"[已经成功删除]"
End Function

'读取目录文件大小
Function ShowSpaceInfo(drvpath)
dim fso,fisod,sizess,showsize
set fso=server.CreateObject("scripting.filesystemobject")
drvpath=server.mappath(drvpath)
if fso.folderexists(drvpath) then 
set fisod=fso.getfolder(drvpath)
sizess=fisod.size
showsize=sizess&" Byte"
if sizess>1024 Then
sizess=(sizess/1024)
showsize=sizess&" KB"
end If
if sizess>1024 Then
sizess=(sizess/1024)
showsize="<font color=red>"&formatnumber(sizess,2)&" MB</font>"
end If
if sizess>1024 Then
sizess=(sizess/1024)
showsize="<font color=red>"&formatnumber(sizess,2)&" GB</font>"
end If
ShowSpaceInfo="<font face=verdana>"&showsize&"</font>"
else 
ShowSpaceInfo="<font face=verdana>不存在！</font>"
end if
End Function

'读取网站文件及文件夹占用情况
Function Asai_DirStr(ambdir,ambty)
Asai_DirStr=Asai_DirStr&"<table width=100% border=0 cellspacing=5 cellpadding=0>"
Asai_DirStr=Asai_DirStr&"<tr><td>名称</td><td>大小</td><td>类型</td><td>创建时间</td><td>访问时间</td><td>修改时间</td><td>属性</td></tr>"
dim ambfso,ambx,ambf,ambi,ambz,ambnml,ambfil,ambfstr,ambfrr,ambfud
ambdir=replace(ambdir,"//","/")
ambi=0
if ambty=0 then
SET ambfso=CreateObject("Scripting.FileSystemObject")
Set ambx=ambfso.GetFolder(Server.MapPath(ambdir))
For Each ambf in ambx.Subfolders'遍历目录
ambi=ambi+1
ambnml=ambdir&ambf.Name
if ambi mod 2=0 then
Asai_DirStr=Asai_DirStr&"<tr class=g-ll1>"
else
Asai_DirStr=Asai_DirStr&"<tr class=g-ll0>"
end if
Asai_DirStr=Asai_DirStr&"<td><b><a href=?dir="&ambnml&"/>"&ambnml&"/</a></b>　"'文件名
Asai_DirStr=Asai_DirStr&"<a href=?dir="&ambnml&"/&g=1&gg=1>[重命名]</a><a href=?dir="&ambnml&"/&g=3&gg=1 onClick=""if(confirm('真的删除么？')){return true;}else{return false;}"">[删除]</a></td>"
Asai_DirStr=Asai_DirStr&"<td>"&ShowSpaceInfo(ambnml&"/")&"</td>"'文件大小
Asai_DirStr=Asai_DirStr&"<td>"&ambf.Type&"</td>"'文件类型
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateCreated&"</td>"'创建时间
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateLastAccessed&"</td>"'访问时间
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateLastModified&"</td>"'修改时间
Asai_DirStr=Asai_DirStr&"<td>"&ambf.Attributes&"</td>"&vbcrlf'文件属性
Asai_DirStr=Asai_DirStr&"</tr>"&vbcrlf
Next
end if
if ambty=2 then
dim anfilereadfsoulr
Set anfilereadfsoulr=CreateObject("A"&"dod"&"b.St"&"r"&"eam")
anfilereadfsoulr.Open
anfilereadfsoulr.Type=2
anfilereadfsoulr.Charset="utf-8"
anfilereadfsoulr.LoadFromFile(Server.MapPath(ambdir&"_e.txt"))
ambfstr=anfilereadfsoulr.ReadText
anfilereadfsoulr.Close
Set anfilereadfsoulr=Nothing

ambfrr=split(ambfstr,"==")
ambfud=ubound(ambfrr)

end if
For Each ambf in ambx.Files'遍历文件
ambi=ambi+1
ambfil=ambf.Name
ambnml=ambdir&ambfil
ambz=lcase(right(ambfil,len(ambfil)-inStrRev(ambfil,".")))

if ambty=1 then
if ambfil="_e.txt" then
amfnmx=1
amfnms=ambnml
end if
elseif ambty=2 then
if ambfil<>"_e.txt" and ambfud>ambi then
if ambfrr(ambi)<>"" then Asai_DirStr=Asai_DirStr&ambfrr(ambi-1)
end if
end if

if ambi mod 2=0 then
Asai_DirStr=Asai_DirStr&"<tr class=g-ll1>"
else
Asai_DirStr=Asai_DirStr&"<tr class=g-ll0>"
end if
Asai_DirStr=Asai_DirStr&"<td><b><a href="&ambnml&">"&ambnml&"</a></b>　"'文件名
Asai_DirStr=Asai_DirStr&"<a href=?dir="&ambnml&"&g=1>[重命名]</a><a href=?dir="&ambnml&"&g=3 onClick=""if(confirm('真的删除么？')){return true;}else{return false;}"">[删除]</a>"
if instr(fe_tys,ambz&",")>0 then
Asai_DirStr=Asai_DirStr&"<a href="&ambnml&"><img style=""max-width:10%"" src="&ambnml&"></a>"'预览
elseif instr(fe_tes,ambz&",")>0 then
Asai_DirStr=Asai_DirStr&"[<b>"&ambz&"</b>]"
else
Asai_DirStr=Asai_DirStr&"<a href=?dir="&ambnml&"&g=2>[编辑]</a>"'预览
end if
Asai_DirStr=Asai_DirStr&"</td>"
Asai_DirStr=Asai_DirStr&"<td><font face=verdana>"&ambf.Size&"</font></td>"'文件大小
Asai_DirStr=Asai_DirStr&"<td>"&ambf.Type&"</td>"'文件类型
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateCreated&"</td>"'创建时间
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateLastAccessed&"</td>"'访问时间
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateLastModified&"</td>"'修改时间
Asai_DirStr=Asai_DirStr&"<td>"&ambf.Attributes&"</td>"'文件属性
Asai_DirStr=Asai_DirStr&"</tr>"&vbcrlf
Next
Asai_DirStr=Asai_DirStr&"</table>"
End Function


'amfrf("/asai/","/AsaiInc/")|amfrf("/asai/","/AsaiInc/asai/")|amfrf("/asai.html","EESai")|
Function amfrf(amfold,amfnew)
if right(amfold,1)="/" then
dim amfffso
set amfffso=server.CreateObject("Scripting.FileSystemObject")
amfffso.MoveFolder Server.MapPath(amfold),Server.MapPath(amfnew)
Set amfffso=Nothing
else
'read+write
Call anfw(anfileread(fe_char,Server.MapPath(amfold)),amfnew)
'del old
Call amfdl(amfold)
end if
End Function


'过程执行中
if amfg>0 then
if amfg=1 then
dim arnmo
response.Write("<div class=g-lt>重命名(文件夹移动)操作</div><div class=g-ll><ul>")
if not anull(aireq("new")) then
Call amfrf(aireq("old"),aireq("new"))
amfbao=amfbao&"<li class=g-ll0>重命名(文件夹移动)操作：【"&aireq("old")&"】 To 【"&aireq("new")&"】。</li>"
arnmo=aireq("new")
else
arnmo=amfdir
end if
amfbao=amfbao&"<form action="""" method=""post"">"
amfbao=amfbao&"<li class=g-ll0>旧文件名：<input type=""text"" size=""58"" name=""old"" value="""&amfdir&""" /></li>"
amfbao=amfbao&"<li class=g-ll1>新文件名：<input type=""text"" size=""58"" name=""new"" value="""&arnmo&""" /></li>"
amfbao=amfbao&"<li class=g-ll0><input type=""submit"" value=""提交""></li></form>"
amfbao=amfbao&"<li class=g-ll1>注意：重命名文件时，需要输入完整绝对地址，如:"&arnmo&"；文件夹重命名或移动时需要书写正确的文件绝对地址，并以/符号结尾，如:/AsaiInc/。</li></ul></div>"
elseif amfg=2 then
response.Write("<div class=g-lt>文件编辑操作</div><div class=g-ll><ul>")
if not anull(aireq("con")) then
Call anfw(request("con"),amfdir)
amfbao=amfbao&"<li class=g-ll0>文件编辑操作：【"&amfdir&"】修改成功。</li>"
end if
amfbao=amfbao&"<form action="""" method=""post"">"
amfbao=amfbao&"<li class=g-ll0>修改文件："&amfdir&"</li>"
amfbao=amfbao&"<li class=g-ll1><textarea name=""con"" id=""con"" style=""width:80%;height:288px;"">"&anfr(amfdir)&"</textarea></li>"
amfbao=amfbao&"<li class=g-ll0><input type=""submit"" value=""提交""></li></form>"
amfbao=amfbao&"<li class=g-ll1>注意：支持修改所有写字板可以打开的文件，如:html,asp,txt,php等。</li></ul></div>"
elseif amfg=3 then
response.Write("<div class=g-lt>文件删除操作</div><div class=g-ll><ul>")
amfbao=amfbao&"<li class=g-ll0>"&amfdl(amfdir)&"</li></ul></div>"
end if
response.Write("<li class=g-ll1><a href=?dir="&fe_dir&">网站根目录 "&fe_dir&"</a>")
amfdirl=fe_dir
amfdirr=split(right(amfdir,len(amfdir)-len(fe_dir)),"/")
for amfdiri=0 to ubound(amfdirr)-1
amfdirl=amfdirl&amfdirr(amfdiri)&"/"
response.Write (" &gt;&gt; <a href=?dir="&amfdirl&">"&amfdirr(amfdiri)&"/</a>")
next
response.Write ("</li>")
if anull(amfbao) then
response.Write("<li class=g-ll0><font color=red>× 无效或失败的操作！</font>——<i>"&now()&"</i></li>")
else
response.Write(amfbao)
end if
else
if anull(amfdir) then
amfbao=amfbao&Asai_DirStr(fe_dir,0)
else
amfbao=amfbao&"<li class=g-ll1><a href=?dir="&fe_dir&">网站根目录 "&fe_dir&"</a>"
amfdirl=fe_dir
if len(amfdir)-len(fe_dir)>0 then
amfdirr=split(right(amfdir,len(amfdir)-len(fe_dir)),"/")
for amfdiri=0 to ubound(amfdirr)-1
amfdirl=amfdirl&amfdirr(amfdiri)&"/"
amfbao=amfbao&" &gt;&gt; <a href=?dir="&amfdirl&">"&amfdirr(amfdiri)&"/</a>"
next
end if
amfbao=amfbao&"</li>"
amfbao=amfbao&Asai_DirStr(amfdir,aireq("nm"))
end if
%>
<div class=g-lt>网站文件在线管理</div>
<div class=g-ll><ul>
<%if anull(amfbao) then
response.Write("<li class=g-ll0><font color=red>× 11无效或失败的操作！</font>——<i>"&now()&"</i></li>")
else
response.Write(amfbao)
end if%>
</ul></div>
<%
if request("nm")="1" or request("nm")="2" then
response.Write("<a href=?dir="&amfdirl&"&nm=2&fr="&amfnms&">点此批量重命名"&amfdirr(amfdiri)&"/中的文件名</a>")
end if
end if
end if%>
<div class=g-lt>使用须知（请在使用前阅读）：</div>
<div class=g-ll><ul>
<li class=g-ll0>1、网站所在空间必须开启FSO；</li>
<li class=g-ll1>2、删除文件无法恢复，请提前做好备份；</li>
<li class=g-ll0>3、编辑功能仅支持可用记事本打开的文件，不支持图片、媒体等文件；</li>
<li class=g-ll1>4、功能使用需要设置好文件夹、文件的可读写属性；</li>
<li class=g-ll0>5、点击文件、或文件夹链接可以打开新的窗口看到更详细的内容；</li>
<li class=g-ll1>6、删除文件夹时，会连带文件夹内的所有文件和子文件夹都删除；</li>
<li class=g-ll1>7、当文件夹内有_e.txt文件的时候，可以按照文件顺序依据_e.txt文件内的内容规则执行自动重命名（范例：文件名1==文件名2==文件名3）,使用方法：在地址栏后增加&amp;nm=1，即可开启此功能。</li>
</ul></div>
<%=pde("")%></body>
</html>