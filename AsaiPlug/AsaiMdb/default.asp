<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../inc.asp"--><%=pdt("ACCESS数据库在线管理插件")%>
<body>
<%
if not pqx(3) then
response.Write "对不起，您无权使用本功能！"
else
dim ambmdb,ambmdbbak,ambmdbpass,ambbao
ambmdb=i_dir&w_dbdn
ambmdbbak=Left(ambmdb,InStrRev(ambmdb,"/"))&"Bak"
ambmdbpass=w_dbdm

'数据库压缩
Function ambys()
dim dbpath,cdpath,fso,Engine
    On Error Resume Next'display err
    dbpath=Server.MapPath(ambmdb)
    cdpath=server.MapPath(ambmdbbak)&"AsaiTemp.mdb"
    Set fso=Server.CreateObject("Scripting.FileSystemObject")
    if Err<>0 Then
        ambys="<li class=g-ll1>该空间不支持FSO组件，操作失败</li>"
    else
        If fso.FileExists(dbpath) Then
            Set Engine=CreateObject("JRO.JetEngine")
            set conn=nothing
            Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&dbpath&";Jet oledb:Database password="&ambmdbpass&""," Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&cdpath&";Jet oledb:Database password="&ambmdbpass&""
            fso.CopyFile cdpath,dbpath
            fso.DeleteFile(cdpath)
            Set fso=nothing
            Set Engine=nothing
            ambys="<li class=g-ll1>网站数据库[<a href="&w_mour&ambmdb&" target=_blank>"&dbpath&"</a>]数据库压缩成功</li>"
        Else
            ambys="<li class=g-ll1>"&dbpath&"找不到数据库文件</li>"
        End If
    end if
end Function

'备份数据库
Function ambbf()
dim bkfolder,bkfilename,bkpath,dbpath,Fso
    On Error Resume Next'display err
    bkfolder=server.MapPath(ambmdbbak)&"\"
	bkfilename="Bak"&Year(now)&right("0"&Month(now),2)&right("0"&Day(now),2)&right("0"&Hour(now),2)&right("0"&Minute(now),2)&right("0"&Second(now),2)&right(replace(aiip(),".",""),4)&".MDB"
    bkpath=bkfolder&bkfilename
    dbpath=Server.MapPath(ambmdb)
    Set Fso=server.CreateObject("scripting.filesystemobject")
    if Err<>0 Then
        ambbf="<li class=g-ll1>该空间不支持FSO组件，操作失败！</li>"
    else
        if fso.FileExists(dbpath) then
            If fso.FolderExists(bkfolder)=false Then fso.CreateFolder(bkfolder)
            fso.copyfile dbpath,bkpath
            ambbf="<li class=g-ll1>成功备份数据库到[<a href="&e_tur&s_drsys&"Bak/"&bkfilename&" target=_blank>"&bkpath&"</a>]</li>"
        Else
            ambbf="<li class=g-ll1>找不到数据库文件"&dbpath&"</li>"
        End if
    end if
end Function

'恢复数据库
Function ambhf()
dim backname,Fso,backpath
    On Error Resume Next'display err
    backname=request.form("filename")
    if backname="" then
        ambhf="<li class=g-ll1>请指定的备份文件名</li>"
    else
        backpath=server.MapPath(ambmdbbak)&"\"&backname
        Set Fso=server.CreateObject("scripting.filesystemobject")
        if Err<>0 Then
            ambhf="<li class=g-ll1>该空间不支持FSO组件，操作失败！</li>"
        else
            if fso.fileexists(backpath) then
                fso.copyfile backpath,Server.MapPath(ambmdb)
                ambhf="<li class=g-ll1>成功将备份数据库["&backpath&"]恢复到网站数据库</li>"
            else
                ambhf="<li class=g-ll1>找不到指定的备份文件"&backpath&"</li>"
            end if
        end if
    end if
end Function

'清理备份数据库
Function ambsc(FolderPath)
dim FolderPaths,AsaiFso,AsaiFsoS
On Error Resume Next'display err
    FolderPaths =Server.MapPath(Cstr(FolderPath))
    If right(FolderPaths,1) ="\" Then FolderPaths =Left(FolderPaths, Len(FolderPaths)-1)
    Set AsaiFso =CreateObject("Scripting.FileSystemObject")
  if AsaiFso.FolderExists(FolderPaths) then
    Set AsaiFsoS =AsaiFso.GetFolder(FolderPaths)
    AsaiFsoS.delete true '-----------可选参数是否强制删除 true
    if AsaiFso.FolderExists(FolderPaths)=false then
 ambsc=("<li class=g-ll1>√ 目录<font color=red>"&FolderPaths&"</font>删除成功!</li>")
    else
 ambsc=("<li class=g-ll1>× <font color=red>出现错误！操作未完成！</font></li>")
 Err.Clear
    end if
  else
    ambsc=("<li class=g-ll1>× 目录<font color=red>"&FolderPaths&"</font>不存在！</li>")
  end if
    Set AsaiFsoS =nothing
    Set AsaiFso =nothing
end Function

'下拉列表出已经备份的数据库
Function ambselect()
Call andircheck(ambmdbbak)
dim fso,dbpath,f,fc,f1,temp,fileext
Set fso=CreateObject("Scripting.FileSystemObject")
dbpath=server.MapPath(ambmdbbak)
Set f=fso.GetFolder(dbpath)
Set fc=f.Files
For Each f1 in fc
temp=split(f1.name,".")
fileext=temp(ubound(temp))
ambselect=ambselect&"<option value='"&f1.name&"'>"&f1.name&"</option>"
next
set fso=nothing
end Function

if not ainull(aireq("Asai")) then
dim amhrg,amhrdir
amhrg=aiint(aireq("Asai"))
amhrdir=aistr(aireq("dir"))
if amhrg=1 then
ambbao=ambbao&"<li class=g-ll0>成功压缩当前网站数据库！</li>"&ambys()
elseif amhrg=2 then
ambbao=ambbao&"<li class=g-ll0>成功备份当前网站数据库！</li>"&ambbf()
elseif amhrg=3 then
ambbao=ambbao&"<li class=g-ll0>请从下列下拉菜单中选择备份的数据库进行还原！</li><li class=g-ll1><form method=post action=?Asai=6>请选择要还原的数据库：</li><li class=g-ll0><select name=filename id=filename>"&ambselect()&"</select></li><li class=g-ll1><input type=submit value=开始恢复 onClick=""if(confirm('真的还原么？')){return true;}else{return false;}""></form></li>"
elseif amhrg=6 then
ambbao=ambbao&"<li class=g-ll0>成功还原指定的备份数据库！</li>"&ambhf()
elseif amhrg=4 then
ambbao=ambbao&"<li class=g-ll0 onClick=""if(confirm('真的删除么？')){return true;}else{return false;}"">删除所有备份数据库！</li>"&ambsc(ambmdbbak)
end if

response.Write("<div class=g-lt>功能"&amhrg&"键操作报告</div><div class=g-ll><ul>")
if ainull(ambbao) then
response.Write("<li class=g-ll0><font color=red>× 无效或失败的操作！</font>——<i>"&now()&"</i><br /></li>")
else
response.Write(ambbao)
end if
response.Write("</ul></div>")
end if
end if
%>
<div class=g-lt>网站ACCESS数据库在线管理</div>
<div class=g-ll><ul>
<li class=g-ll0><a href=./?Asai=1>功能1键：压缩数据库；</a></li>
<li class=g-ll1><a href=./?Asai=2>功能2键：备份数据库；</a></li>
<li class=g-ll0><a href=./?Asai=3>功能3键：还原数据库；</a></li>
<li class=g-ll1><a href=./?Asai=4 onClick=if(confirm('真的删除么？')){return true;}else{return false;}>功能4键：删除备份库。</a></li>
</ul></div>
<div class=g-lt>使用须知（请在使用前阅读）：</div>
<div class=g-ll><ul>
<li class=g-ll0>1、此功能仅对ACCESS数据库有效；</li>
<li class=g-ll1>2、网站数据库所在文件夹必须设置属性为可读写；</li>
<li class=g-ll0>3、必须正确设置网站的网站所在的文件夹(网站根目录)；</li>
<li class=g-ll1>4、请不要在网站访问高峰期使用该功能；</li>
<li class=g-ll0>5、请注意操作前一定要备份，以防发生未知错误。</li>
</ul></div>
<%=pde("")%></body>
</html>