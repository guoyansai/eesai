<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%><%
'-----------------------------------
'PS:manage quanxian
'=pqx(0)
'-----------------------------------
Function pqx(pqfty)
dim fsqxfso
Set fsqxfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
If fsqxfso.FileExists(server.MapPath("www.eesai.com.txt")) Then
'�ڸ�Ŀ¼����һ���ļ���Ϊwww.eesai.com.txt���ļ������Խ�ֹʹ�õ��Թ��ߵ��ļ������ܡ�
pqx=false
else
pqx=true
end if
Set fsqxfso=Nothing
End Function
'-----------------------------------
'PS:plug top
'=pdt()
'-----------------------------------
Function pdt(pfbt)
pdt="<!DOCTYPE HTML>"
pdt=pdt&"<html><head><meta charset=""GB2312"">"
pdt=pdt&"<title>"&pfbt&"�����������Ҳ��</title>"
pdt=pdt&"<meta name=""keywords"" content=""����,����������,EESai,Asai,GuoYanSai."">"
pdt=pdt&"<meta name=""description"" content=""רҵ��רע��ASP�����о���"">"
pdt=pdt&"<meta name=""copyright"" content=""����������[EESai.Com]"">"
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
<%=pdt("��վ�ļ����߹���ϵͳ")%>
<style>
*{font-family:"΢���ź�";}
body,ul,li,img{padding:0px;margin:0px;border:0px;list-style:none;}
.g-lt{padding:5px 12px;font-weight:bold;border-left:#ECF6FE 1px solid;border-right:#ECF6FE 1px solid;border-top:#ECF6FE 1px solid;border-bottom:#0099FF 2px solid;background-color:#F4FBFF;}
.g-ll{height:auto;margin-bottom:5px;border-left:#ECF6FE 1px solid;border-right:#ECF6FE 1px solid;background-color:#F4FBFF;}
.g-ll ul{border:0px;padding:0px;margin:0px;}
.g-ll0,.g-ll1{margin:0px;padding:5px 12px;list-style:none;border-bottom:#ECF6FE 1px solid;}
.g-ll0{background-color:#FFFFFE;}
.g-ll1{background-color:#F4FBFF;}
</style>
<body>
<%
dim fe_dir:fe_dir="/"
const fe_char="GB2312"
const fe_tys="jepg,png,gif,jpg,bmp,"
const fe_tes="rar,zip,mdb,dll,exe,7z,"

if not pqx(5) then
response.Write "<font color=""#ff0000"">��ʾ���߼�����������ʱ�رգ��������ֶ�ɾ����Ŀ¼��www.eesai.com.txt�ļ������¿�����</font>"
else
if request.querystring="sysinfo" then
Function eesai_Info(obj,ver)
On Error Resume Next
Dim objTest,sTemp
Set objTest=Server.CreateObject(obj)
If Err.Number<>0 Then
Err.Clear
eesai_Info="<font color=""#ff0000"">����֧��</font>"
Else
sTemp=""
If ver=1 Then
sTemp=objTest.version
If IsNull(sTemp) Then sTemp=objTest.about
sTemp=Replace(sTemp,"Version","")
sTemp="&nbsp;<font color=""#006600"">"&sTemp&"</font>"
End If
eesai_Info="<font color=""#006600"">��֧��</font>"&sTemp
End If
Set objTest=Nothing
If Err.Number<>0 Then Err.Clear
End Function
%>
<div class=g-lt><b>��վ�ռ���Ϣ</b></div>
<div class="gal"><ul>
<li class=g-ll0>��ǰ·����<%="http://"&request.servervariables("server_name")&request.servervariables("script_name") %></li>
<li class=g-ll1>����������<%=Request.ServerVariables("SERVER_NAME")%></li>
<li class=g-ll0>�������˿ڣ�<%=Request.ServerVariables("SERVER_PORT")%></li>
<li class=g-ll1>������ʱ�䣺<%=now%></li>
<li class=g-ll0>IIS�汾��<%=Request.ServerVariables("SERVER_SOFTWARE")%></li>
<li class=g-ll1>�ű���ʱʱ�䣺<%=Server.ScriptTimeout%></li>
<li class=g-ll0>���ļ�·����<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></li>
<li class=g-ll1>�������������棺<%=ScriptEngine&"/"& ScriptEngineMajorVersion&"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></li>
<li class=g-ll0>֧�ֵ��ļ����ͣ�<%=Request.ServerVariables("HTTP_Accept")%></li>
<li class=g-ll1>���ʵ��ļ�·����<%=Request.ServerVariables("HTTP_url")%></li>
<li class=g-ll0>վ������·����<%=request.ServerVariables("APPL_PHYSICAL_PATH")%></li>
<li class=g-ll1>�û��������Ϣ��<%=Request.ServerVariables("HTTP_USER_AGENT")%></li>
<li class=g-ll0>ADODB.Connection(ADO ���ݶ���)��<%=eesai_Info("adodb.connection",1)%></li>
<li class=g-ll1>Scripting.FileSystemObject (FSO �ı��ļ���д)��<%=eesai_Info("scripting.filesystemobject",0)%></li>
<li class=g-ll0>Stream �ļ�����<%=eesai_Info("A"&"dod"&"b.St"&"r"&"eam",0)%></li>
<li class=g-ll1>Microsoft.XMLHTTP��<%=eesai_Info("Microsoft.XMLHTTP",0)%></li>
<li class=g-ll0>Microsoft.XMLDOM��<%=eesai_Info("Microsoft.XMLDOM",0)%></li>
<li class=g-ll1>jmail.message��<%=eesai_Info("jmail.message",0)%>&nbsp;&nbsp;<a href="http://www.eesai.com/">[�ٷ�����]</a></li>
<li class=g-ll0>JMail.SmtpMail (Dimac JMail �ʼ��շ�)��<%=eesai_Info("JMail.SmtpMail",1)%>&nbsp;&nbsp;<a href="http://www.eesai.com/">[�ٷ�����]</a></li>
<li class=g-ll1>Persits.Upload.1 (ASPUpload �ļ��ϴ�)��<%=eesai_Info("Persits.Upload.1",1)%>&nbsp;&nbsp;<a href="http://www.eesai.com/">[�ٷ�����]</a></li>
<li class=g-ll0>AspJpeg ͼ���������<%=eesai_Info("Persits.Jpeg",1)%>&nbsp;&nbsp;<a href="http://www.eesai.com/">[�ٷ�����]</a></li>
<%Response.Cookies("UserName") = ""
Set bc = Request.Browser%>
<li class=g-ll0>Agent Name��<%=bc.UserAgent%></li>
<li class=g-ll0>Type��<%=bc.Type%></li>
<li class=g-ll0>Name��<%=bc.Name%></li>
<li class=g-ll0>Version��<%=bc.Version%></li>
<li class=g-ll0>Major Version��<%=bc.MajorVersion%></li>
<li class=g-ll0>Minor Version��<%=bc.MinorVersion%></li>
<li class=g-ll0>Beta Version��<%=bc.Beta%></li>
<li class=g-ll0>Platform��<%=bc.Platform%></li>
<li class=g-ll0>AOL��<%=bc.AOL%></li>
<li class=g-ll0>Frames��<%=bc.Frames%></li>
<li class=g-ll0>IFrames��<%=bc.IFrames%></li>
<li class=g-ll0>Tables��<%=bc.Tables%></li>
<li class=g-ll0>Cookies��<%=bc.Cookies%></li>
<li class=g-ll0>VBScript��<%=bc.VBScript%></li>
<li class=g-ll0>JavaScript��<%=bc.Javascript%></li>
<li class=g-ll0>ActiveX Controls��<%=bc.ActiveXControls%></li>
<li class=g-ll0>Java Applets��<%=bc.JavaApplets%></li>
<li class=g-ll0>Background Sounds��<%=bc.BackgroundSounds%></li>
<li class=g-ll0>CDF��<%=bc.CDF%></li>
<li class=g-ll0>Crawler��<%=bc.Crawler%></li>
<li class=g-ll0>WAP��<%=bc.WAP%></li>
<li class=g-ll0>.NET CLR��<%=bc.NetClr%></li>
<li class=g-ll0>CSS��<%=bc.CSSVersion%></li>
<li class=g-ll0>Win16��<%=bc.Win16%></li>
</ul></div>
<%
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
amfdl=anfstr&"[�Ѿ��ɹ�ɾ��]"
End Function

'��ȡĿ¼�ļ���С
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
ShowSpaceInfo="<font face=verdana>�����ڣ�</font>"
end if
End Function

'��ȡ��վ�ļ����ļ���ռ�����
Function Asai_DirStr(ambdir,ambty)
Asai_DirStr=Asai_DirStr&"<table width=100% border=0 cellspacing=5 cellpadding=0>"
Asai_DirStr=Asai_DirStr&"<tr><td>����</td><td>��С</td><td>����</td><td>����ʱ��</td><td>����ʱ��</td><td>�޸�ʱ��</td><td>����</td></tr>"
dim ambfso,ambx,ambf,ambi,ambz,ambnml,ambfil,ambfstr,ambfrr,ambfud
ambdir=replace(ambdir,"//","/")
ambi=0
if ambty=0 then
SET ambfso=CreateObject("Scripting.FileSystemObject")
Set ambx=ambfso.GetFolder(Server.MapPath(ambdir))
For Each ambf in ambx.Subfolders'����Ŀ¼
ambi=ambi+1
ambnml=ambdir&ambf.Name
if ambi mod 2=0 then
Asai_DirStr=Asai_DirStr&"<tr class=g-ll1>"
else
Asai_DirStr=Asai_DirStr&"<tr class=g-ll0>"
end if
Asai_DirStr=Asai_DirStr&"<td><b><a href=?dir="&ambnml&"/>"&ambnml&"/</a></b>��"'�ļ���
Asai_DirStr=Asai_DirStr&"<a href=?dir="&ambnml&"/&g=1&gg=1>[������]</a><a href=?dir="&ambnml&"/&g=3&gg=1 onClick=""if(confirm('���ɾ��ô��')){return true;}else{return false;}"">[ɾ��]</a></td>"
Asai_DirStr=Asai_DirStr&"<td>"&ShowSpaceInfo(ambnml&"/")&"</td>"'�ļ���С
Asai_DirStr=Asai_DirStr&"<td>"&ambf.Type&"</td>"'�ļ�����
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateCreated&"</td>"'����ʱ��
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateLastAccessed&"</td>"'����ʱ��
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateLastModified&"</td>"'�޸�ʱ��
Asai_DirStr=Asai_DirStr&"<td>"&ambf.Attributes&"</td>"&vbcrlf'�ļ�����
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
For Each ambf in ambx.Files'�����ļ�
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
Asai_DirStr=Asai_DirStr&"<td><b><a href="&ambnml&">"&ambnml&"</a></b>��"'�ļ���
Asai_DirStr=Asai_DirStr&"<a href=?dir="&ambnml&"&g=1>[������]</a><a href=?dir="&ambnml&"&g=3 onClick=""if(confirm('���ɾ��ô��')){return true;}else{return false;}"">[ɾ��]</a>"
if instr(fe_tys,ambz&",")>0 then
Asai_DirStr=Asai_DirStr&"<a href="&ambnml&"><img style=""max-width:10%"" src="&ambnml&"></a>"'Ԥ��
elseif instr(fe_tes,ambz&",")>0 then
Asai_DirStr=Asai_DirStr&"[<b>"&ambz&"</b>]"
else
Asai_DirStr=Asai_DirStr&"<a href=?dir="&ambnml&"&g=2>[�༭]</a>"'Ԥ��
end if
Asai_DirStr=Asai_DirStr&"</td>"
Asai_DirStr=Asai_DirStr&"<td><font face=verdana>"&ambf.Size&"</font></td>"'�ļ���С
Asai_DirStr=Asai_DirStr&"<td>"&ambf.Type&"</td>"'�ļ�����
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateCreated&"</td>"'����ʱ��
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateLastAccessed&"</td>"'����ʱ��
Asai_DirStr=Asai_DirStr&"<td>"&ambf.DateLastModified&"</td>"'�޸�ʱ��
Asai_DirStr=Asai_DirStr&"<td>"&ambf.Attributes&"</td>"'�ļ�����
Asai_DirStr=Asai_DirStr&"</tr>"&vbcrlf
Next
Asai_DirStr=Asai_DirStr&"</table>"
End Function

'amfrf("/asai/","/eesai_inc/")|amfrf("/asai/","/eesai_inc/asai/")|amfrf("/asai.html","EESai")|
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


'����ִ����
if amfg>0 then
if amfg=1 then
dim arnmo
response.Write("<div class=g-lt>������(�ļ����ƶ�)����</div><div class=g-ll><ul>")
if not anull(aireq("new")) then
Call amfrf(aireq("old"),aireq("new"))
amfbao=amfbao&"<li class=g-ll0>������(�ļ����ƶ�)��������"&aireq("old")&"�� To ��"&aireq("new")&"����</li>"
arnmo=aireq("new")
else
arnmo=amfdir
end if
amfbao=amfbao&"<form action="""" method=""post"">"
amfbao=amfbao&"<li class=g-ll0>���ļ�����<input type=""text"" size=""58"" name=""old"" value="""&amfdir&""" /></li>"
amfbao=amfbao&"<li class=g-ll1>���ļ�����<input type=""text"" size=""58"" name=""new"" value="""&arnmo&""" /></li>"
amfbao=amfbao&"<li class=g-ll0><input type=""submit"" value=""�ύ""></li></form>"
amfbao=amfbao&"<li class=g-ll1>ע�⣺�������ļ�ʱ����Ҫ�����������Ե�ַ����:"&arnmo&"���ļ������������ƶ�ʱ��Ҫ��д��ȷ���ļ����Ե�ַ������/���Ž�β����:/eesai_inc/��</li></ul></div>"
elseif amfg=2 then
response.Write("<div class=g-lt>�ļ��༭����</div><div class=g-ll><ul>")
if not anull(aireq("con")) then
Call anfw(request("con"),amfdir)
amfbao=amfbao&"<li class=g-ll0>�ļ��༭��������"&amfdir&"���޸ĳɹ���</li>"
end if
amfbao=amfbao&"<form action="""" method=""post"">"
amfbao=amfbao&"<li class=g-ll0>�޸��ļ���"&amfdir&"</li>"
amfbao=amfbao&"<li class=g-ll1><textarea name=""con"" id=""con"" style=""width:80%;height:288px;"">"&anfr(amfdir)&"</textarea></li>"
amfbao=amfbao&"<li class=g-ll0><input type=""submit"" value=""�ύ""></li></form>"
amfbao=amfbao&"<li class=g-ll1>ע�⣺֧���޸�����д�ְ���Դ򿪵��ļ�����:html,asp,txt,php�ȡ�</li></ul></div>"
elseif amfg=3 then
response.Write("<div class=g-lt>�ļ�ɾ������</div><div class=g-ll><ul>")
amfbao=amfbao&"<li class=g-ll0>"&amfdl(amfdir)&"</li></ul></div>"
end if
response.Write("<li class=g-ll1><a href=?dir="&fe_dir&">��վ��Ŀ¼ "&fe_dir&"</a>")
amfdirl=fe_dir
amfdirr=split(right(amfdir,len(amfdir)-len(fe_dir)),"/")
for amfdiri=0 to ubound(amfdirr)-1
amfdirl=amfdirl&amfdirr(amfdiri)&"/"
response.Write (" &gt;&gt; <a href=?dir="&amfdirl&">"&amfdirr(amfdiri)&"/</a>")
next
response.Write ("</li>")
if anull(amfbao) then
response.Write("<li class=g-ll0><font color=red>�� ��Ч��ʧ�ܵĲ�����</font>����<i>"&now()&"</i></li>")
else
response.Write(amfbao)
end if
else
if anull(amfdir) then
amfbao=amfbao&Asai_DirStr(fe_dir,0)
else
amfbao=amfbao&"<li class=g-ll1><a href=?dir="&fe_dir&">��վ��Ŀ¼ "&fe_dir&"</a>"
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
<div class=g-lt>AsaiIISʹ��˵����</div>
<div class=g-ll><ul>
<li class=g-ll0>�ٽ���վ�������ļ��С�<%=replace(server.mappath(Request.ServerVariables("SCRIPT_NAME")),"www.eesai.com_gb.asp","")%>�����棬<a href="http://<%=Request.ServerVariables("HTTP_HOST")%>">����������վ</a></li>
<li class=g-ll1>��Ĭ����ҳ�ĵ�����index.html,index.htm,default.html,index.asp,default.asp,default.htm,admin.asp,login.asp,eesai.asp,www.eesai.com.asp</li>
<li class=g-ll0>�۵��Կ��ö˿ڣ�<a href="http://127.0.0.1:7777">7777</a>,<a href="http://127.0.0.1:777">777</a>,<a href="http://127.0.0.1:77">77</a>,<a href="http://127.0.0.1:7">7</a>������ر�֤���϶˿�δ��ռ�ã������磺<a href="http://<%=Request.ServerVariables("HTTP_HOST")%>">http://<%=Request.ServerVariables("HTTP_HOST")%></a></li>
<li class=g-ll1>����վ�ļ����߹������ͨ����ַ<a href="http://<%=Request.ServerVariables("HTTP_HOST")%>/www.eesai.com.asp">http://<%=Request.ServerVariables("HTTP_HOST")%>/www.eesai.com.asp</a>����</li>
<li class=g-ll0>����վ����Ϊutf-8������<a href="http://<%=Request.ServerVariables("HTTP_HOST")%>/www.eesai.com.asp">http://<%=Request.ServerVariables("HTTP_HOST")%>/www.eesai.com.asp</a>��ת��utf-8������ļ�����ϵͳ</li>
</ul></div>
<div class=g-lt>��վ�ļ����߹���</div>
<div class=g-ll><ul>
<%if anull(amfbao) then
response.Write("<li class=g-ll0><font color=red>�� 11��Ч��ʧ�ܵĲ�����</font>����<i>"&now()&"</i></li>")
else
response.Write(amfbao)
end if%>
</ul></div>
<%
if request("nm")="1" or request("nm")="2" then
response.Write("<a href=?dir="&amfdirl&"&nm=2&fr="&amfnms&">�������������"&amfdirr(amfdiri)&"/�е��ļ���</a>")
end if
end if
end if

end if%>
<%=pde("")%></body>
</html>