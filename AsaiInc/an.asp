<%
'-----------------------------------
'g_apx,g_apdr,g_aps,g_char,g_apt
'-----------------------------------
'PS:application/file
'=ankop(anty,ange,anfstr,anko)
'-----------------------------------
Function ankop(anty,ange,anfstr,anko)
if anko<>"" then
dim ankopls
ankopls=anko
if g_apx=1 then'app
ankop=anapp(anty,ange,anfstr,ankopls)
elseif g_apx=2 then'file
ankop=anfile(anty,g_char,ange,anfstr,ankopls)
end if
end if
End Function
'-----------------------------------
'PS:application/file auto read/writer time
'=ankar(anko,anfty,anfstr)
'-----------------------------------
Function ankar(anko,anfty,anfstr)
if instr(anko,g_atxx)>0 then
if anfty=0 then'read
g_appaj=""
dim ankdrr,ankdss
ankdrr=split(anfstr,g_gz)
if ubound(ankdrr)>0 then
	if Isdate(ankdrr(0)) then
	ankar=ankdrr(1)
	g_appaj=aicd(ankdrr(0))
		if g_apptm=1 then
			if datediff("s",g_appaj,now())>g_atxm then
				if g_appam<g_atxn then
				ankar=""
				g_appam=g_appam+1
				end if
			end if
		end if
	end if
end if
if g_appaj="" then ankar=anfstr

elseif anfty=1 then'writer
if instr(anfstr,g_gz)>0 then
ankar=anfstr
else
ankar=now()&g_gz&anfstr
end if
else
ankar=anfstr
end if
else
ankar=anfstr
end if
End Function
'-----------------------------------
'PS:check APP
'=ankck("anko")
'-----------------------------------
Function ankck(anko)
ankck=true
dim ankols
ankols=anko
if ankols<>"" then
if ankop(1,0,0,ankols)<>"" then ankck=false
end if
End Function
'-----------------------------------
'PS:application
'=anapp(anty,ange,anfstr,anko)
'-----------------------------------
Function anapp(anty,ange,anfstr,anko)
if anko<>"" then
dim ankoals
ankoals=anko
if anty=0 then'del
anapp=anappdel(ange,ankoals)
elseif anty=1 then'read
anapp=anappread(ankoals)
elseif anty=2 then'write
anapp=anappwrite(ange,anfstr,ankoals)
elseif anty=3 then'add
anapp=anappadd(ange,anfstr,ankoals)
end if
end if
End Function
'-----------------------------------
'PS:file
'=anfile(anty,anfchar,ange,anfstr,anko)
'-----------------------------------
Function anfile(anty,anfchar,ange,anfstr,anko)
if anko<>"" then
dim ankofls
ankofls=anko
if anty=0 then'del
anfile=anfiledel(ange,ankofls)
elseif anty=1 then'read
anfile=anfileread(anfchar,ankofls)
elseif anty=2 then'write
anfile=anfilewrite(anfchar,ange,anfstr,ankofls)
elseif anty=3 then'add
anfile=anfileadd(anfchar,ange,anfstr,ankofls)
elseif anty=4 then'check
anfile=anfilecheck(ankofls)
end if
end if
End Function
'-----------------------------------
'PS:application dir
'=anappdir("anko") dir
'-----------------------------------
Function anappdir(anko)
if anko<>"" then
anappdir=anko
if lcase(left(anappdir,len(g_apq)))<>lcase(g_apq) then
anappdir=g_apq&anappdir
end if
else
anappdir=""
end if
End Function
'-----------------------------------
'PS:Cookies del
'=anckdel("ange"0=one|1=same|split,"anko") del
'-----------------------------------
Function anckdel(ange,anko)
if anko<>"" then
dim ankols
if ange="0" then
ankols=anappdir(anko)
response.Cookies(ankols)=""
response.cookies(ankols).expires=now-1
andelckp=andelckp&"OK=[Cookies]"&ankols&" delete at "&now()&"!<br>"
elseif ange="1" then
ankols=anappdir(anko)
dim anckdelti,anckdeltii
For anckdeltii=0 to g_aps
For Each anckdelti in Request.Cookies
If CStr(Left(anckdelti,Len(ankols)))=CStr(ankols) Then
response.Cookies(anckdelti)=""
response.cookies(anckdelti).expires=now-1
andelckp=andelckp&"OK=[Cookies]"&anckdelti&" delete at "&now()&"!<br>"
else
if g_aps>1 then andelckp=andelckp&"NO=[Cookies]"&anckdelti&" is float!<br>"
end if
Next
Next
elseif ange<>"" then
dim anckdelrr,anckdeli
anckdelrr=split(anko,ange)
for anckdeli=0 to ubound(anckdelrr)
ankols=anappdir(anckdelrr(anckdeli))
if ankols<>"" then
response.Cookies(ankols)=""
response.cookies(ankols).expires=now-1
anckdel=anckdel&"OK=[Application]"&ankols&" delete at "&now()&"!<br>"
end if
next
end if
end if
End Function
'-----------------------------------
'PS:application del
'=anappdel("ange"0=one|1=same|split,"anko") del
'-----------------------------------
Function anappdel(ange,anko)
if anko<>"" then
dim ankols
if ange="0" then
ankols=anappdir(anko)
application.lock
application.Contents.Remove(ankols)
anappdel=anappdel&"OK=[Application]"&ankols&" delete at "&now()&"!<br>"
application.unlock
elseif ange="1" then
ankols=anappdir(anko)
dim anappdelli,anappdellii
application.lock
For anappdellii=0 to g_aps
For Each anappdelli in Application.Contents
If CStr(Left(anappdelli,Len(ankols)))=CStr(ankols) Then
application.Contents.Remove(anappdelli)
anappdel=anappdel&"OK=[Application]"&anappdelli&" delete at "&now()&"!<br>"
else
if g_aps>1 then anappdel=anappdel&"NO=[Application]"&anappdelli&" is float!<br>"
end if
Next
Next
application.unlock
elseif ange<>"" then
dim anappdelrr,anappdeli
application.lock
anappdelrr=split(anko,ange)
for anappdeli=0 to ubound(anappdelrr)
ankols=anappdir(anappdelrr(anappdeli))
if ankols<>"" then
application.Contents.Remove(ankols)
anappdel=anappdel&"OK=[Application]"&ankols&" delete at "&now()&"!<br>"
end if
next
application.unlock
end if
end if
End Function
'-----------------------------------
'PS:application read
'=anappread("anko") read
'-----------------------------------
Function anappread(anko)
if anko<>"" then
anappread=ankar(anko,0,application(anappdir(anko)))
else
anappread=""
end if
End Function
'-----------------------------------
'PS:application write
'=anappwrite("ange"0=one|split,"anfstr","anko") write
'-----------------------------------
Function anappwrite(ange,anfstr,anko)
if anko<>"" and anfstr<>"" then
dim ankols
if ange="0" then
ankols=anappdir(anko)
application.lock
application(ankols)=ankar(ankols,1,anfstr)
application.unlock
elseif ange<>"" then
dim anappwriterr,anappwriterr1,anappwritei
application.lock
anappwriterr=split(anko,ange)
anappwriterr1=split(anfstr,ange)
for anappwritei=0 to ubound(anappwriterr)
ankols=anappdir(anappwriterr(anappwritei))
if ankols<>"" then application(ankols)=ankar(ankols,1,anappwriterr1(anappwritei))
next
application.unlock
end if
end if
End Function
'-----------------------------------
'PS:application add
'=anappadd("ange"0=one|split,"anfstr","anko") add
'-----------------------------------
Function anappadd(ange,anfstr,anko)
if anko<>"" and anfstr<>"" then
dim ankols
if ange="0" then
ankols=anappdir(anko)
anfstr=ankar(ankols,0,application(ankols))&anfstr
application.lock
application(ankols)=ankar(ankols,1,anfstr)
application.unlock
elseif ange<>"" then
dim anappaddrr,anappaddrr1,anappaddi,anappadds
application.lock
anappaddrr=split(anko,ange)
anappaddrr1=split(anfstr,ange)
for anappaddi=0 to ubound(anappaddrr)
ankols=anappdir(anappaddrr(anappaddi))
if ankols<>"" then
anappadds=ankar(ankols,0,application(ankols))&anappaddrr1(anappaddi)
application(ankols)=ankar(ankols,1,anappadds)
end if
next
application.unlock
end if
end if
End Function
'-----------------------------------
'PS:file dir
'=anfiledir("anko") dir
'-----------------------------------
Function anfiledir(anty,anko)
dim anfdlin
anfdlin=anko
If InStr(anfdlin,":")>0 Then
anfiledir=anfdlin
elseif left(anfdlin,1)="/" then
anfiledir=Server.MapPath(anfdlin)
elseif InStr(anfdlin,"Skin")>0 or InStr(anfdlin,"skin")>0 then
anfiledir=Server.MapPath(anfdlin)
elseif anfdlin<>"" then
if lcase(left(anfdlin,len(g_apq)))<>lcase(g_apq) then anfdlin=g_apq&anfdlin
anfdlin=replace(anfdlin,g_apj,"/")
anfdlin=replace(anfdlin,"//","/")
anfiledir=Server.MapPath(g_apdr&anfdlin)
end if
'response.Write anfiledir&"<br>"
if right(anfdlin,1)="/" and right(anfiledir,1)<>"\" then anfiledir=anfiledir&"\"
if right(anfiledir,1)<>"\" and InStr(anfdlin,".")=0 then anfiledir=anfiledir&g_apz
'if right(anfiledir,1)<>"\" and InStr(anfdlin,".")=0 and right(anfiledir,len(g_apz))<>g_apz then anfiledir=anfiledir&g_apz
'if right(anfiledir,1)<>"\" and InStr(anfdlin,".")=0 and lcase(right(anfiledir,len(g_apz)))<>lcase(g_apz) then anfiledir=anfiledir&g_apz
if anty=1 then anfiledir=replace(anfiledir,g_apz,"")
End Function
'-----------------------------------
'PS:file del
'=anfiledel("ange"0=one|1=same|split,"anko") del
'-----------------------------------
Function anfiledel(ange,anko)
On Error Resume Next'display err
if anko<>"" then
dim ankols
if ange="0" then
ankols=anfiledir(0,anko)
dim anfilefso
Set anfilefso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
if anfilefso.FileExists(ankols) then
anfilefso.DeleteFile(ankols)
anfiledel=anfiledel&"OK=[File]"&ankols&" delete at "&now()&"!<br>"
elseif anfilefso.folderexists(ankols) then
anfilefso.getfolder(ankols).delete
anfiledel=anfiledel&"OK=[Folder]"&ankols&" delete at "&now()&"!<br>"
end if
elseif ange="1" then
dim anfiledeldr,anfiledeld,anfiledelfso,anfiledelfsotemp,anfiledelti
set anfiledelfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
ankols=anfiledir(1,anko)
if right(ankols,1)="\" then
If anfiledelfso.folderexists(ankols) then
anfiledelfso.getfolder(ankols).delete
anfiledel=anfiledel&"OK=[Folder]"&ankols&" delete at "&now()&"!<br>"
Else
anfiledel=anfiledel&"OK=[Folder]"&ankols&" is null at "&now()&"!<br>"
End If
set anfiledelfso=nothing
exit function
end if
anfiledeldr=split(ankols,"\")
anfiledeld=replace(ankols,"\"&anfiledeldr(ubound(anfiledeldr)),"\")
If anfiledelfso.folderexists(anfiledeld) then
set anfiledelfsotemp=anfiledelfso.GetFolder(anfiledeld)
For Each anfiledelti in anfiledelfsotemp.files
'If lcase(Left(anfiledelti,Len(ankols)))=lcase(ankols) Then
If InStr(lcase(anfiledelti),lcase(anfiledeldr(ubound(anfiledeldr))))>0 Then
anfiledel=anfiledel&"OK=[File]"&anfiledelti&" delete at "&now()&"!<br>"
anfiledelfso.DeleteFile(anfiledelti)
else
if g_aps>2 then anfiledel=anfiledel&"NO=[File]"&anfiledelti&" is float!<br>"
end if
Next
Set anfiledelfsotemp=Nothing
else
anfiledel=anfiledel&"OK=[Folder]"&anfiledeld&" is null at "&now()&"!<br>"
end if
Set anfiledelfso=Nothing
elseif ange<>"" then
dim anfiledelfsoo,anfiledelrr,anfiledeli
set anfiledelfsoo=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
anfiledelrr=split(anko,ange)
for anfiledeli=0 to ubound(anfiledelrr)
ankols=anfiledir(0,anfiledelrr(anfiledeli))
'response.Write ankols
if anfiledelfsoo.FileExists(ankols) or anfiledelfsoo.FolderExists(ankols) then
anfiledelfsoo.DeleteFile(ankols)
anfiledel=anfiledel&"OK=[File]"&ankols&" delete at "&now()&"!<br>"
else
anfiledel=anfiledel&"OK=[File]"&ankols&" is null at "&now()&"!<br>"
end if
next
Set anfiledelfsoo=Nothing
end if
end if
End Function
'-----------------------------------
'PS:file auto del
'=anfileautodel("anko")
'-----------------------------------
Function anfileautodel(anko)
dim ankols
ankols=anfiledir(0,anko)
if anfilecheck(ankols) then
if g_apts<100 then
dim anfileafso,anfileftfso,anfileftdate
Set anfileafso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set anfileftfso=anfileafso.GetFile(ankols)
'anfileftfso.type
'anfileftfso.size
anfileftdate=anfileftfso.DateCreated
if anfileftdate<date()-g_apts then
anfileafso.DeleteFile(ankols)
Set anfileafso=Nothing
Set anfileftfso=Nothing
anfileautodel="file created at "&anfileftdate&"("&g_apts&"),delete!"
end if
end if
else
anfileautodel=""
end if
End Function
'-----------------------------------
'PS:file read
'=anfileread("anfchar"utf-8|gb2312,"anko") read
'-----------------------------------
Function anfileread(anfchar,anko)
if anko<>"" then
anfileread=""
dim ankols
ankols=anfiledir(0,anko)
if anfilecheck(ankols) then
if lcase(anfchar)="utf-8" then'utf-8
dim anfilereadfsou
Set anfilereadfsou=CreateObject("A"&"dod"&"b.St"&"r"&"eam")
anfilereadfsou.Open
anfilereadfsou.Type=2
anfilereadfsou.Charset="utf-8"
anfilereadfsou.LoadFromFile(ankols)
anfileread=anfilereadfsou.ReadText
anfilereadfsou.Close
Set anfilereadfsou=Nothing
else'gb2312
dim anfilereadfso,anfilereadfsop
Set anfilereadfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set anfilereadfsop=anfilereadfso.OpenTextFile(ankols,1,True)
anfileread=anfilereadfsop.ReadAll
Set anfilereadfsop=Nothing
Set anfilereadfso=Nothing
end if
if anfileread="" then
anfileread=g_apt
else
anfileread=ankar(anko,0,anfileread)
end if
end if
else
anfileread=""
end if
End Function
'-----------------------------------
'PS:file write
'=anfilewrite("anfchar"utf-8|gb2312,"ange"0=one|split,"anfstr","anko") write
'-----------------------------------
Function anfilewrite(anfchar,ange,anfstr,anko)
'response.Write anfchar&ange&anfstr&anko
if ange="0" and anfstr<>"" and anko<>"" then
dim ankols
ankols=anfiledir(0,anko)
anfilewrite=anfilewritet(anfchar,anfstr,ankols)
elseif ange<>"" and anfstr<>"" then
dim anfilewriterr,anfilewriterr1,anfilewritei,anfilewrites
anfilewriterr=split(anko,ange)
anfilewriterr1=split(anfstr,ange)
for anfilewritei=0 to ubound(anfilewriterr)
anfilewrites=anfiledir(0,anfilewriterr(anfilewritei))
if anfilewrites<>"" then
anfilewrite=anfilewrite&anfilewritet(anfchar,anfilewriterr1(anfilewritei),anfilewrites)
end if
next
end if
End Function
Function anfilewritet(anfchar,anfstr,anko)
if andircheck(anko) then
if lcase(anfchar)="utf-8" then'utf-8
dim anfilewritetado
set anfilewritetado=Server.CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With anfilewritetado
.type=2
.mode=3
.charset="utf-8"
.open
.WriteText=ankar(anko,1,anfstr)
.SaveToFile anko,2
.flush
.Close
End With
set anfilewritetado=nothing
else'gb2312
dim anfilewritetfso,anfilewritetfsop
Set anfilewritetfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set anfilewritetfsop=anfilewritetfso.OpenTextFile(anko,2,True)
anfilewritetfsop.Write(ankar(anko,1,anfstr))
Set anfilewritetfsop=Nothing
Set anfilewritetfso=Nothing
end if
end if
End Function
'-----------------------------------
'PS:file add
'=anfileadd("anfchar"utf-8|gb2312,"ange"0=one|split,"anfstr","anko") add
'-----------------------------------
Function anfileadd(anfchar,ange,anfstr,anko)
if ange="0" and anfstr<>"" then
if ange="0" then
anfileadd=anfilewrite(anfchar,ange,anfileread(anfchar,anko)&anfstr,anko)
elseif ange<>"" then
dim anfileaddrr,anfileaddrr1,anfileaddi,anfileadds
anfileaddrr=split(anko,ange)
anfileaddrr1=split(anfstr,ange)
for anfileaddi=0 to ubound(anfileaddrr)
anfileadds=anfiledir(0,anfileaddrr(anfileaddi))
if anfileadds<>"" then
anfileadd=anfileadd&anfilewrite(anfchar,ange,anfileread(anfchar,anfileadds)&anfileaddrr1(anfileaddi),anfileadds)
end if
next
end if
end if
End Function
'-----------------------------------
'PS:file check
'anfilecheck("anko") check
'-----------------------------------
Function anfilecheck(anko)
anfilecheck=False
if anko<>"" then
dim anfilecheckfso,ankols
ankols=anfiledir(0,anko)
'response.Write ankols&"<br>"
On Error Resume Next'display err
Set anfilecheckfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
if anfilecheckfso.FileExists(ankols) then anfilecheck=True
Set anfilecheckfso=nothing
end if
End Function
'-----------------------------------
'PS:Folder check
'andircheck("anko") check and make
'-----------------------------------
Function andircheck(anko)
andircheck=False
if anko<>"" then
dim ankols
ankols=anfiledir(0,anko)
dim andircheckfso,anfkos,anfdrr,anfdii,anfdud,anfdir
anfdir=""
On Error Resume Next'display err
if right(ankols,1)="\" then
anfkos=ankols
elseif InStr(ankols,".")>0 then
anfdrr=split(ankols,"\")
anfdud=ubound(anfdrr)
anfkos=left(ankols,len(ankols)-len(anfdrr(anfdud))-1)
else
anfkos=ankols&"\"
end if
anfdrr=split(anfkos,"\")
anfdud=ubound(anfdrr)
Set andircheckfso=Server.CreateObject("Scr" & "ipt" & "ing.Fil" & "eSy" & "ste" & "mOb" & "j" & "ect")
If andircheckfso.FolderExists(anfkos) Then
andircheck=True
Exit Function
End If
For anfdii=0 To anfdud
anfdir=anfdir&anfdrr(anfdii)&"\"
If Not andircheckfso.FolderExists(anfdir) Then
andircheckfso.CreateFolder(anfdir)
End If
Next
Set andircheckfso=Nothing
If Err=0 Then andircheck=True
end if
End Function
'-----------------------------------
'PS:save same place file
'=anfilesave(anfsy,file,anffy)
'-----------------------------------
Function anfilesave(anfsy,anffile,anffy)
if andircheck(anffile) and anffy<>"" then
dim anffso
Set anffso=Server.CreateObject("Scr" & "ipt" & "ing.Fil" & "eSy" & "ste" & "mOb" & "j" & "ect")'需要文件夹权限支持
'anffso.MoveFile anffy,anffile
anffso.CopyFile anffy,anffile
'anffso.DeleteFile anffy'删除原来文件
Set anffso=Nothing
end if
End Function
'-----------------------------------
'PS:save url file
'=anurlsave(anfsy,file,url)
'-----------------------------------
Function anurlsave(anfsy,anffile,anfurl)
anurlsave=False
if instr(anffile,":")=0 then anffile=Server.MapPath(anffile)
On Error Resume Next'display err
if andircheck(anffile) and not anfilecheck(anffile) and anfurl<>"" then
dim andabs,andxml
Set andxml=Server.CreateObject("Microsoft.XMLHTTP")
   andxml.Open "Get", anfurl, False, "", ""
   andxml.Send
        If andxml.Readystate<>4 or andxml.status<>200 then
            Exit Function
        End If
Set andabs=Server.CreateObject("Adodb.Stream")
   andabs.Type=1
   andabs.Open
   andabs.Write andxml.ResponseBody
   andabs.SaveToFile anffile,2
   andabs.Cancel()
   andabs.Close()
Set andxml=Nothing
Set andabs=nothing
anurlsave=True
if anfsy<>"" and anfsy<>"0" then Call anshui(anffile,anfsy)
end if
End Function
'★使用ASPjepg组件给图片加水印
Function anshui(anfimg,anfstr)
if anfstr<>"" and anfstr<>"0" then'加水印
dim Fpicsy,epsscolor
epsscolor=1'水印的颜色123
Set Fpicsy=Server.CreateObject("Persits.Jpeg")
Fpicsy.Open anfimg
if epsscolor=3 then'如果规定了颜色
Fpicsy.Canvas.Font.Color=&HFF0000
elseif epsscolor=2 then
Fpicsy.Canvas.Font.Color=&H003399
elseif epsscolor=1 then
Fpicsy.Canvas.Font.Color=&H006600
else
Fpicsy.Canvas.Font.Color=&H000000'水印文字的颜色，&H后面输入色彩值。
end if
Fpicsy.Canvas.Font.Size=12'水印文字的大小。
Fpicsy.Canvas.Font.Family="宋体"'水印文字的字体名称。
Fpicsy.Canvas.Font.ShadowColor=&HFFFFFF'水印文字的阴影色彩。
Fpicsy.Canvas.Font.ShadowXoffset=1'水印文字阴影向右偏移的像素值，输入负值则向左偏移。
Fpicsy.Canvas.Font.ShadowYoffset=1'水印文字阴影向下偏移的像素值，输入负值则向右偏移。
Fpicsy.Canvas.Font.Quality=3'水印文字的清晰度，从0～4，变换不是很大，建议用2或3。
Fpicsy.Canvas.Font.Bold=False'水印文字是否为粗体，True=粗体 False=正常。
Fpicsy.Canvas.Print 10,Fpicsy.Height-28,anfstr '开始加水印
Fpicsy.Save anfimg'保存
Fpicsy.Close:Set Fpicsy=Nothing
end if
End Function
'--------------------------------------------------------------------------HTML READ MAKER---------------------------
'-----------------------------------
'PS:HTML Maker
'=anhtml("anfchar"utf-8|gb2312,"index.html","http://www.eesai.com/")
'call anhtml("gb2312","123.html","http://localhost/2.asp")
'-----------------------------------
Function anhtml(anfchar,anffile,anfstr)
anhtml=false
anffile=anfiledir(0,anffile)
'response.Write anffile
if andircheck(anffile) then
if lcase(anfchar)="utf-8" then'utf-8
dim anhtmlado
set anhtmlado=Server.CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With anhtmlado
.type=2
.mode=3
.charset="utf-8"
.open
'response.Write anurl(anfchar,anfstr)
.writetext anurl(anfchar,anfstr)
.SaveToFile anffile,2
.flush
.Close
End With
set anhtmlado=nothing
else'gb2312
dim anhtmlfso,anhtmlfsop
Set anhtmlfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set anhtmlfsop=anhtmlfso.OpenTextFile(anffile,2,True)
anhtmlfsop.Write(anurl(anfchar,anfstr))
Set anhtmlfsop=Nothing
Set anhtmlfso=Nothing
end if
anhtml=true
end if
End Function
'-----------------------------------
'PS:read url content
'=anurl("anfchar"utf-8|gb2312,"http://www.eesai.com/")
'-----------------------------------
Function anurl(anfchar,anfstr)
If anfstr="" Then
anurl=""
else
On Error Resume Next'display err
Dim anmsxml,anbodys
Set anmsxml=Server.CreateObject("MSXML2.SERVERXMLHTTP.3.0")
anmsxml.Open "Get",anfstr,False,"",""
anmsxml.Send()
anbodys=anmsxml.ResponseBody
Set anmsxml=Nothing
anurl=anfcharb2b(anfchar,anbodys)
End If
End Function
Function anfcharb2b(anfchar,anbody)
Dim anadostm
Set anadostm=Server.CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With anadostm
.Type=1
.Mode=3
.Open
.Write anbody
.Position=0
.Type=2
.Charset=anfchar
anfcharb2b=.ReadText
.Close
End With
set anadostm=nothing
End Function
'-----------------------------------
'PS:read app value for top
'=anreq("anfstr")
'-----------------------------------
Function anreq(anfstr)
if anfstr=g_apt or trim(anfstr)="" then
anreq=""
else
anreq=trim(anfstr)
anreq=Replace(anreq,"&lt;","<")
anreq=Replace(anreq,"&gt;","＞")
end if
End Function
'-----------------------------------
'PS:save app value for top
'=ansav("anfstr")
'-----------------------------------
Function ansav(anfstr)
ansav=trim(anfstr)
if ainull(ansav) then
ansav=g_apt
else
ansav=Replace(ansav,"＜","&lt;")
ansav=Replace(ansav,"＞","&gt;")
end if
End Function
'-----------------------------------
'PS:include file
'=aninc(0file|1code,anfstr)
'-----------------------------------
Function aninc(anfty,anfstr)
Dim ancdre,ancdstr,ancdstart,ancdend
if anfty=1 then
ancdstr=anfstr
else
ancdstr=anfileread(g_char,Server.MapPath(anfstr))
end if
set ancdre=new RegExp
ancdre.pattern="^\s*="
ancdend=1
ancdstart=inStr(ancdend,ancdstr,"<"&"%")+2
do while ancdstart>ancdend+1
aninc=aninc&Mid(ancdstr,ancdend,ancdstart-ancdend-2)
ancdend=inStr(ancdstart,ancdstr,"%"&">")+2
Execute(ancdre.replace(Mid(ancdstr,ancdstart,ancdend-ancdstart-2),"aninc=aninc&"))
ancdstart=inStr(ancdend,ancdstr,"<"&"%")+2
loop
aninc=aninc&Mid(ancdstr,ancdend)
set ancdre=nothing
End Function
%>