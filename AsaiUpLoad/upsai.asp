<%
dim errs,eudjj,eudir,eudst,eudhz,euddr,eudur,euddu,eudfh
errs="<br>"
eudjj=p_upijj
if left(eudjj,1)="/" then
eudir=eudjj
else
eudir=p_dir&eudjj
end if
eudst=p_upist
eudhz=p_upihz
euddr=p_upwdr
eudur=p_upwur
if eudur="" then eudur="http://"&Request.ServerVariables("HTTP_HOST")&"/"
euddu=p_upwdu
eudfh=p_upifh
dim esuarr,esugn,esuty,esunm,esusv,esufh,esufm,esufi,esuss,esusn,esupg,esumm
esuarr=split(replace(Request.ServerVariables("QUERY_STRING"),eudhz,""),p_ujg)

'-----------------------------------
'PS:ZH for urls(for china font)
'=aijia("aifstr") add pass
'=aijie("aifstr") open pass
'-----------------------------------
Function aijia(aifstr)
aijia=aifstr
if not isnull(aijia) then
dim aijexp
set aijexp=new RegExp
aijexp.Pattern="<[^>]*>"
aijexp.Global=true
aijia=aijexp.Replace(aijia,"")
aijia=Replace(aijia,"&nbsp;","")
aijia=Replace(aijia," ","")
aijia=aijiar(aijiar(aijia))
end if
aijia=replace(aijia,"%25u","S-Ai")
end Function
Function aijie(aifstr)
aijie=replace(aifstr,"S-Ai","%25u")
if not isnull(aijie) then
dim aiiexp
set aiiexp=new RegExp
aiiexp.Pattern="<[^>]*>"
aiiexp.Global=true
aijie=aiiexp.Replace(aijie,"")
aijie=Replace(aijie,"&nbsp;","")
aijie=Replace(aijie," ","")
aijie=aijier(aijier(aijie))
end if
end Function
Function aijiar(aifstr)
dim airii,airiis,airiic,airiia
airiis=""
aijiar=aifstr
For airii=1 to Len(aijiar)
airiic=Mid(aijiar,airii,1)
airiia=ASCW(airiic)
If (airiia>=48 and airiia<=57) or (airiia>=65 and airiia<=90) or (airiia>=97 and airiia<=122) Then
airiis=airiis&airiic
ElseIf InStr("@*_+-./",airiic)>0 Then
airiis=airiis&airiic
ElseIf airiia>0 and airiia<16 Then
airiis=airiis & "%0" & Hex(airiia)
ElseIf airiia>=16 and airiia<256 Then
airiis=airiis & "%" & Hex(airiia)
Else
airiis=airiis & "%u" & Hex(airiia)
End If
Next
aijiar=airiis
End Function
Function aijier(aifstr)
aijier=aifstr
dim airjj,airjjs,airjjc
airjjs=""
For airjj=1 to Len(aijier)
airjjc=Mid(aijier,airjj,1)
If Mid(aijier,airjj,2)="%u" and airjj<=Len(aijier)-5 Then
If IsNumeric("&H"&Mid(aijier,airjj+2,4)) Then
airjjs=airjjs&CHRW(CInt("&H"&Mid(aijier,airjj+2,4)))
airjj=airjj+5
Else
airjjs=airjjs&airjjc
End If
ElseIf airjjc="%" and airjj<=Len(aijier)-2 Then
If IsNumeric("&H"&Mid(aijier,airjj+1,2)) Then
airjjs=airjjs&CHRW(CInt("&H"&Mid(aijier,airjj+1,2)))
airjj=airjj+2
Else
airjjs=airjjs&airjjc
End If
Else
airjjs=airjjs&airjjc
End If
Next
aijier=airjjs
End Function
'-----------------------------------
'PS:img AsaiUpFile rex
'=aiufile(aifty=0str;1src/href,aifstr,aifex,aifth)
'-----------------------------------
Function aiufile(aifty,aifstr,aifex,aifth)
if trim(aifstr)<>"" and trim(aifex)<>"" and trim(aifth)<>"" then
dim aiudrex
Set aiudrex=New RegExp
aiudrex.IgnoreCase=True
aiudrex.Global=True
if aifty=1 then
aiudrex.Pattern="(.*?)"&aifex&"(.*?)"
aifstr=aiudrex.replace(aifstr,""&aifth&"$2")
else
aiudrex.Pattern="(=){1}('|""){0,1}(\S){1,}"&aifex&"(.*?)('|""|\s|>){1}"
aifstr=aiudrex.replace(aifstr,"$1$2"&aifth&"$4$5")
end if
end if
aiufile=aifstr
End Function
'★获取上传绝对地址
Function eupmp(epstr)
eupmp=Server.MapPath(epstr)
if euddr<>"" then
dim eupdmrr,eupdmud
eupdmrr=split(eupmp,replace(eudjj,"/","\"))
eupdmud=ubound(eupdmrr)
if eupdmud>0 then
eupmp=replace(eupmp,eupdmrr(0),euddr)
end if
end if
End Function
'★处理地址栏返回值
Function eupre(epstr)
if epstr=p_tjg or epstr="" or len(epstr)>180 then
eupre="0"
else
eupre=epstr
end if
End Function
'★上传扩展名及大小限制
'类型：0默认1图片2影音3下载4全部5特殊
'◆在这个过程里面可以设置上传文件类型及大小
Function eupty(epty,epvl)
if epty<>"" then
if int(epty)<p_fll then
if epvl=1 then
Execute("eupty=p_fs"&epty&"")
eupty=eupty*1024
else
Execute("eupty=p_ft"&epty&"")
end if
end if
end if
End Function
'★文件保存位置
'保存位置：0上传到默认文件夹1通过读取request.Cookies(p_qs&"qz")确定上传位置#（../up/或/AsaiInc/up/指定相对或绝对地址确定上传位置）
Function eupsv(eufty)
dim esvdz
if esusv="0" then
eupsv=eudir
elseif esusv="1" then
eupsv=eudir
esvdz=Request.Cookies(p_qs&"qz")
if esvdz<>"" then
if left(esvdz,len(eudfh))=eudfh then
eupsv=replace(esvdz,eudfh,eudir)
elseif left(esvdz,1)="/" then
eupsv=esvdz
else
eupsv=eudir&esvdz
end if
end if
else
if left(esusv,len(eudfh))=eudfh then
eupsv=replace(esusv,eudfh,eudir)
else
eupsv=esusv
end if
end if
if eufty=1 and left(eupsv,1)="/" and len(eupsv)>1 then eupsv=right(eupsv,len(eupsv)-1)
if right(eupsv,1)<>"/" and right(eupsv,1)<>"_" then
dim euphrr,euphud
euphrr=split(eupsv,"/")
euphud=ubound(euphrr)
if euphud>0 then eupsv=left(eupsv,len(eupsv)-len(euphrr(euphud)))
end if
'response.Write esvdz&"=esvdz<br>"
'response.Write eudfh&"=eudfh<br>"
'response.Write eudir&"=eudir<br>"
'response.Write eupsv&"=eupsv<br>"
End Function
'★文件位置返回值
'返回值：0绝对根目录1网络http开头地址2仅返回文件名#（相对指定目录，如=/up/，储存在/up/SAC/mo.jpg位置的图片，返回值为SAC/mo.jpg）
'epfile=1值返回文件夹,列表图片插入使用
Function eupfh(epfile)
if epfile<>"" and epfile<>"0" then
eupfh=eupsv(0)
if esufh="0" then'this is err
if left(eupfh,len(eudir))<>eudir and left(eupfh,1)<>"/" then
eupfh=eudir&eupfh
end if
elseif esufh="1" then
eupfh=eudur&eupsv(1)
elseif esufh="2" then
eupfh=""
elseif esufh="3" then
eupfh=aiufile(1,eupfh,eudjj,euddu)
else
eupfh=replace(eupfh,esufh,"")
end if
'缩略图：0关闭缩图生成1缩图覆盖原图2缩图和原图同文件夹,名称加前缀3缩图存入缩图文件夹。需要AspJpeg组件支持！！
if esusn="2" then
if epfile="1" then
eupfh=eupfh&eudst
else
eupfh=eupfh&eudst&epfile
end if
elseif esusn="3" then
if epfile="1" then
eupfh=eupfh&eudst&"/"
else
eupfh=eupfh&eudst&"/"&epfile
end if
else
if epfile="1" then
eupfh=eupfh
else
eupfh=eupfh&epfile
end if
end if
end if
End Function
'★获取随机文件名9位
Function eupsn()
dim eupsnSZ,eupsnSS,eupsnRR,eupsnIP
eupsnIP=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
if len(eupsnIP)<8 then
eupsnIP="000000"
else
eupsnIP=replace(eupsnIP,".","")
end if
eupsnSZ=36
eupsnSS="0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z"'the sn character
eupsnRR=split(eupsnSS,"|")'the chr. Array
eupsn=eupsnRR(int(right(year(now()),2)))&eupsnRR(int(month(now())))&eupsnRR(int(day(now())))
if int(left(replace(eupsnIP,".",""),2))>eupsnSZ then
eupsn=eupsn&eupsnRR(int(left(replace(eupsnIP,".",""),2))-eupsnSZ)
else
eupsn=eupsn&eupsnRR(int(left(replace(eupsnIP,".",""),2)))
end if
if int(right(replace(eupsnIP,".",""),2))>eupsnSZ then
eupsn=eupsn&eupsnRR(int(right(replace(eupsnIP,".",""),2))-eupsnSZ)
else
eupsn=eupsn&eupsnRR(int(right(replace(eupsnIP,".",""),2)))
end if
eupsn=eupsn&eupsnRR(int(hour(now())))&eupsnRR(abs(int(minute(now()))-28))&eupsnRR(abs(int(second(now()))-28))
Randomize
eupsn=eupsn&eupsnRR(int(eupsnSZ*Rnd))
End Function
'★创建文件夹
Function eupmfolder(anko)
eupmfolder=False
if anko<>"" then
dim eupmfolderfso,ankofs,anfdrr,anfdii,anfdud,anfdir
anfdir=""
On Error Resume Next'display err
if left(anko,1)="/" and right(anko,1)="/" then
ankofs=anko
elseif right(anko,1)="/" and left(anko,1)<>"." then
ankofs=eudir&anko
else
ankofs=anko
end if
anfdrr=split(ankofs,"/")
anfdud=ubound(anfdrr)
If InStr(ankofs,".")>0 or right(ankofs,1)="_" then ankofs=left(ankofs,len(ankofs)-len(anfdrr(anfdud))-1)
if right(ankofs&"/",2)<>"//" then ankofs=ankofs&"/"
ankofs=eupmp(ankofs)
anfdrr=split(ankofs,"\")
anfdud=ubound(anfdrr)
Set eupmfolderfso=Server.CreateObject("Scr" & "ipt" & "ing.Fil" & "eSy" & "ste" & "mOb" & "j" & "ect")
If eupmfolderfso.FolderExists(ankofs) Then
eupmfolder=True
Exit Function
End If
For anfdii=0 To anfdud
anfdir=anfdir&anfdrr(anfdii)&"\"
If Not eupmfolderfso.FolderExists(anfdir) Then
eupmfolderfso.CreateFolder(anfdir)
End If
Next
Set eupmfolderfso=Nothing
If Err=0 Then eupmfolder=True
end if
End Function
'★获取文件扩展名
Function eupgext(epfile)
if epfile<>"" then
eupgext=lcase(Mid(epfile,InstrRev(epfile,".")))
end if
End Function
'★判断文件扩展名是否合格
Function eupgextce(epfile)
dim eupgzrr
eupgzrr=Split(eupty(esuty,0),",")
For i=0 To Ubound(eupgzrr)
If LCase(Right(epfile,len(eupgzrr(i))))=LCase(eupgzrr(i)) then
eupgextce=True
Exit Function
Else
eupgextce=False
End if
Next
End Function
'★判断是否为图片文件
Function eupgextceimg(epfile)
dim eupgzrr
eupgzrr=Split("jpg,gif,png,bmp",",")
For i=0 To Ubound(eupgzrr)
If LCase(Right(epfile,len(eupgzrr(i))))=LCase(eupgzrr(i)) then
eupgextceimg=True
Exit Function
Else
eupgextceimg=False
End if
Next
End Function
'★获取远程文件大小，单位KB
Function eupgsize(epfile)
if epfile="" then
eupgsize=0
Exit Function
end if
dim afsmsxml
set afsmsxml=Server.CreateObject("M" & "S" & "X" & "ML" & "2.X" & "ML" & "HT" & "TP")
afsmsxml.open "GET",epfile,False
afsmsxml.send
eupgsize=int(afsmsxml.GetResponseHeader("Content-Length"))
set afsmsxml=nothing
End Function
'★保存远程文件
Sub eupurlfile(epsvfile,epurlfile)
On Error Resume Next'display err
dim asuado,asuxml,asurdata
Set asuxml=Server.CreateObject("Microsoft.XMLHTTP")
With asuxml
.Open "Get",epurlfile,False,"",""
.Send
asurdata=.ResponseBody
End With
Set asuxml=Nothing
Set asuado=Server.CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With asuado
.Type=1
.Open
.Write asurdata
.SaveToFile epsvfile,2
.Cancel()
.Close()
End With
Set asuado=nothing
End Sub
'★保存本地图片
Sub eupmyfile()
dim eumyfdate,eumyfcrlf,eumyfhead,eumyfado,eumyfado1,eumyfsize,Position
'response.Write request.binaryread(request.totalbytes)
eumyfdate=request.binaryread(request.totalbytes)'获得上传数据
eumyfcrlf=chrB(13)&chrB(10)'截取分节符
eumyfhead=leftB(eumyfdate,clng(instrb(eumyfdate,eumyfcrlf))-1)
Position=instrb(eumyfdate,eumyfcrlf&eumyfcrlf)+4'上传文档数据开始字节位置
eumyfsize=instrb(Position+1,eumyfdate,eumyfhead)-Position-2'上传文档的总长度
set eumyfado=CreateObject("A"&"dod"&"b.St"&"r"&"eam")
eumyfado.Mode=3:eumyfado.Type=1:eumyfado.Open
set eumyfado1=CreateObject("A"&"dod"&"b.St"&"r"&"eam")
eumyfado1.Mode=3:eumyfado1.Type=1:eumyfado1.Open 
eumyfado.Write eumyfdate
eumyfado.Position=Position-1
eumyfado.CopyTo eumyfado1,eumyfsize
eumyfado1.SaveToFile euknmg,2  ' 文档保存
set eumyfado=nothing:set eumyfado1=nothing
End Sub
'★使用ASPjepg组件生成缩略图
Sub eupxsuo(epoldimg,epnewimg)
if epnewimg<>"" and epnewimg<>"0" then'缩图
dim Fpicsuo,epsnwid,epsnhei
epsnwid=p_psw'0表示自由宽度
epsnhei=p_psh'0表示自由高度
Set Fpicsuo=Server.CreateObject("Persits.Jpeg")'创建实例
Fpicsuo.Open epoldimg'打开图片
Fpicsuo.Quality=100'缩图质量标准，1-100
Fpicsuo.Sharpen 1,130'缩图锐化处理
if p_psk=1 then'K----=1
Fpicsuo.PreserveAspectRatio=True '等比缩放
if Fpicsuo.OriginalWidth/Fpicsuo.OriginalHeight>epsnwid/epsnhei then'太扁了，要剪掉左右部分
Fpicsuo.Height=epsnhei
Fpicsuo.crop CInt((Fpicsuo.Width-epsnwid)/2),0,CInt((Fpicsuo.Width-epsnwid)/2)+epsnwid,epsnhei
else '太高了，要剪掉上下部分
Fpicsuo.Width=epsnwid
Fpicsuo.crop 0,CInt((Fpicsuo.Height-epsnhei)/2),epsnwid,CInt((Fpicsuo.Height-epsnhei)/2)+epsnhei
end if
if p_err=1 then errs=errs&"裁剪缩略图详情：宽="&Fpicsuo.Width&"px 高="&Fpicsuo.Height&"px<br>"
else'K----=0
if (epsnwid<>0 or epsnhei<>0) and (epsnhei<Fpicsuo.OriginalHeight or epsnwid<Fpicsuo.OriginalWidth) then
if epsnwid=0 and epsnhei<>0 and epsnhei<Fpicsuo.OriginalHeight then
Fpicsuo.Width=Fpicsuo.OriginalWidth*(epsnhei/Fpicsuo.OriginalHeight)
Fpicsuo.Height=epsnhei
elseif epsnwid<>0 and epsnhei=0 and epsnwid<Fpicsuo.OriginalWidth then
Fpicsuo.Width=epsnwid
Fpicsuo.Height=Fpicsuo.OriginalHeight*(epsnwid/Fpicsuo.OriginalWidth)
elseif epsnwid<>0 and epsnhei<>0 and (epsnwid/Fpicsuo.OriginalWidth)>=(epsnhei/Fpicsuo.OriginalHeight) then
Fpicsuo.Width=Fpicsuo.OriginalWidth*(epsnhei/Fpicsuo.OriginalHeight)
Fpicsuo.Height=epsnhei
elseif epsnwid<>0 and epsnhei<>0 and (epsnwid/Fpicsuo.OriginalWidth)<(epsnhei/Fpicsuo.OriginalHeight) then
Fpicsuo.Width=epsnwid
Fpicsuo.Height=Fpicsuo.OriginalHeight*(epsnwid/Fpicsuo.OriginalWidth)
else
Fpicsuo.Width=Fpicsuo.OriginalWidth
Fpicsuo.Height=Fpicsuo.OriginalHeight
end if
if p_err=1 then errs=errs&"缩放缩略图详情：宽="&Fpicsuo.Width&"px 高="&Fpicsuo.Height&"px<br>"
end if
end if'K----end
Fpicsuo.Save epnewimg
Fpicsuo.Close:Set Fpicsuo=Nothing
if p_err=1 then errs=errs&"<h1>生成缩略图至："&epnewimg&"</h1>"
end if
End Sub
'★使用ASPjepg组件给图片加水印
Sub eupxshui(epimg,epsstr)
if epsstr<>"" and epsstr<>"0" then'加水印
dim Fpicsy,Fpicsc,Fpicsf
Set Fpicsy=Server.CreateObject("Persits.Jpeg")
'response.Write "dddddddd"&epsstr&epimg
Fpicsy.Open epimg
if left(epsstr,1)="-" then'使用图片水印-------图片水印模板：-#000000图片地址
Fpicsc=right(left(epsstr&p_pyc,7),6)
if len(epsstr)>10 then
epsstr=right(epsstr,len(epsstr)-8)
else
epsstr=p_pyt
end if
if len(epsstr)>4 then'符合加水印的图片
if right(epsstr,4)=".png" then
Fpicsy.Interpolation=1
'Fpicsy.Canvas.DrawPNG Fpicsy.OriginalWidth/2-100,Fpicsy.OriginalHeight/2-40,Server.MapPath(epsstr)'建议水印图片200*80，居中显示
Fpicsy.Canvas.DrawPNG Fpicsy.OriginalWidth-208,Fpicsy.OriginalHeight-88,Server.MapPath(epsstr)'建议水印图片200*80，居右下角显示
Fpicsy.Save epimg'保存文件 
Fpicsy.Close
Set Fpicsy=Nothing
'response.Write now()&epimg&Server.MapPath(epsstr)
if p_err=1 then errs=errs&"<h1>加透明图片水印的图片存至："&epimg&"</h1>"
else
dim Fpicsy1
Set Fpicsy1=Server.CreateObject("Persits.Jpeg")
Fpicsy1.Open Server.mappath(epsstr)'透明图片水印图
Fpicsy.Canvas.DrawImage 20,Fpicsy.OriginalHeight/2-33,Fpicsy1,0.6,"&H"&Fpicsc'合并图其中0.6是透明度，1是不透明，值越小，透明越大，0就什么也看不见了。&HFFFFFF这个参数是最关键的，这是透明图片水印图的背景色
Fpicsy.Save epimg'保存文件 
Fpicsy.Close
Fpicsy1.Close
Set Fpicsy=Nothing
Set Fpicsy1=Nothing
if p_err=1 then errs=errs&"<h1>加图片水印的图片存至："&epimg&"</h1>"
end if
else
if p_err=1 then errs=errs&"<h1>不符合的加水印图片信息："&epsstr&"</h1>"
end if
else'下面是文字水印处理方式
Fpicsf=""
if instr(epsstr,"Size")>0 then
dim Fpicsrr
Fpicsrr=split(epsstr,"Size")
Fpicsf=Fpicsrr(ubound(Fpicsrr))
epsstr=Fpicsrr(0)
end if
if Fpicsf="" then Fpicsf=p_pyf
if left(epsstr,1)="_" then'使用透明文字水印____________'透明文字模板：_#FF0000阿赛工作室
if left(epsstr,2)="_#" then
Fpicsc=left(right(epsstr,len(epsstr)-2),6)
epsstr=right(epsstr,len(epsstr)-8)
else
Fpicsc=p_pyc
epsstr=right(epsstr,len(epsstr)-1)
end if
dim Fpicta,Fpictb,FpicsyX,FpicsyY
Fpicta=Fpicsy.Binary'将原始数据赋给Fpicta 
'=========加文字水印================= 
Fpicsy.Canvas.Font.Color="&H"&Fpicsc'水印文字颜色 
Fpicsy.Canvas.Font.Family="黑体"'字体 
Fpicsy.Canvas.Font.Bold=True'是否加粗 
Fpicsy.Canvas.Font.Size=Fpicsf'字体大小 
Fpicsy.Canvas.Font.ShadowColor=&H000000'阴影色彩 
Fpicsy.Canvas.Font.ShadowYOffset=1 
Fpicsy.Canvas.Font.ShadowXOffset=1 
Fpicsy.Canvas.Brush.Solid=True 
Fpicsy.Canvas.Font.Quality=4'输出质量 
Fpicsy.Canvas.PrintText 10,Fpicsy.OriginalHeight/2-Fpicsf,epsstr'水印位置及文字 
Fpictb=Fpicsy.Binary'将文字水印处理后的值赋给Fpictb，这时，文字水印没有不透明度 
'============调整文字透明度================ 
Set FpicsyX=Server.CreateObject("Persits.Jpeg") 
FpicsyX.OpenBinary Fpicta 
Set FpicsyY=Server.CreateObject("Persits.Jpeg") 
FpicsyY.OpenBinary Fpictb 
FpicsyX.Canvas.DrawImage 0,0, FpicsyY, 0.3'0.6是透明度 
FpicsyX.Save epimg
FpicsyX.Close
FpicsyY.Close
Fpicsy.Close
Set FpicsyX=Nothing
Set FpicsyY=Nothing
Set Fpicsy=Nothing
if p_err=1 then errs=errs&"<h1>加透明文字水印的图片存至："&epimg&"</h1>"
else'普通文字模板：#FF0000阿赛工作室
if left(epsstr,1)="#" then
Fpicsc=left(right(epsstr,len(epsstr)-1),6)
epsstr=right(epsstr,len(epsstr)-7)
end if
Fpicsy.Canvas.Font.Color="&H"&Fpicsc'水印文字的颜色，&H后面输入色彩值。
Fpicsy.Canvas.Font.Family="黑体"'水印文字的字体名称。
Fpicsy.Canvas.Font.Size=Fpicsf'水印文字的大小。
Fpicsy.Canvas.Font.Bold=False'水印文字是否为粗体，True=粗体 False=正常。
Fpicsy.Canvas.Font.Quality=4'水印文字的清晰度，0-4。
Fpicsy.Canvas.Font.ShadowColor=&HFFFFFF'水印文字的阴影色彩。
Fpicsy.Canvas.Font.ShadowXoffset=1'水印文字阴影向右偏移的像素值，输入负值则向左偏移。
Fpicsy.Canvas.Font.ShadowYoffset=1'水印文字阴影向下偏移的像素值，输入负值则向右偏移。
Fpicsy.Canvas.Print 10,Fpicsy.OriginalHeight-38,epsstr '开始加水印
Fpicsy.Save epimg'保存
Fpicsy.Close
Set Fpicsy=Nothing
if p_err=1 then errs=errs&"<h1>加文字水印的图片存至："&epimg&"</h1>"
end if
end if
end if
End Sub
'★获取上传文件夹下的已传图片并列表（带翻页）
Function euplist(eppath)
Dim euplfso,euplfolder,euplfiles,euplfilename
Call eupmfolder(eppath)
Set euplfso=Server.CreateObject("Scripting.FileSystemObject")
Set euplfolder=euplfso.GetFolder(eupmp(eppath))
Set euplfiles=euplfolder.Files
dim psize,ppage,pcount,pgnum,pgii,pgstr,pgjj
psize=5'每页显示的数量
if int(esupg)<2 then
ppage=1
else
ppage=int(esupg)
end if
pcount=euplfiles.count
pgnum=int(pcount/psize)
if pcount mod psize>0 then
pgnum=pgnum+1
end if
if ppage>pgnum then
ppage=pgnum
end if
pgii=0
For each euplfilename in euplfiles
pgii=pgii+1
if pgii>(ppage-1)*psize and pgii<=ppage*psize then
If eupgextceimg(euplfilename.name) Then
euplist=euplist&"<a href=""javascript:;"" onclick=""AsaiInputS('"&euplfilename.name&"')"" title=""文件名称："&euplfilename.name&vbcrlf&"文件大小："&int(euplfilename.size/1024)&"KB"&vbcrlf&"最后修改："&euplfilename.datelastaccessed&vbcrlf&"创建时间："&euplfilename.datecreated&"""><img border=""0"" src="""&eppath&euplfilename.name&""" class=""fimg""></a> "
else
euplist=euplist&"<a href=""javascript:;"" onclick=""AsaiInputS('"&euplfilename.name&"')"" title=""文件名称："&euplfilename.name&vbcrlf&"文件大小："&int(euplfilename.size/1024)&"KB"&vbcrlf&"最后修改："&euplfilename.datelastaccessed&vbcrlf&"创建时间："&euplfilename.datecreated&""">"&left(euplfilename.name,3)&".</a> "
end if
elseif pgii>ppage*psize then
exit for
end if
Next
Set euplfolder=nothing
Set euplfso=nothing
euplist=euplist&"<select class=""fsl"" language=""javascript"" onChange=""AsaiJumpHref('self',this,0)"" title=""共有"&pcount&"个文件 "&vbcrlf&"第"&ppage&"页/共"&pgnum&"页"">"
euplist=euplist&"<option value="""&replace(eugpostpg,p_ujg&p_tjg&p_ujg,p_ujg&"1"&p_ujg)&""">首页</option>"
if ppage>1 then euplist=euplist&"<option value="""&replace(eugpostpg,p_ujg&p_tjg&p_ujg,p_ujg&ppage-1&p_ujg)&""">上页</option>"
pgjjj=0
for pgjj=ppage-10 to ppage+10
if pgnum>=pgjj and pgjj>0 then
euplist=euplist&"<option value="""&replace(eugpostpg,p_ujg&p_tjg&p_ujg,p_ujg&pgjj&p_ujg)&""""
if pgjj=ppage then euplist=euplist&" selected=""selected"""
euplist=euplist&">"&pgjj&"</option>"
end if
next
if ppage<pgnum then euplist=euplist&"<option value="""&replace(eugpostpg,p_ujg&p_tjg&p_ujg,p_ujg&ppage+1&p_ujg)&""">下页</option>"
euplist=euplist&"<option value="""&replace(eugpostpg,p_ujg&p_tjg&p_ujg,p_ujg&pgnum&p_ujg)&""">尾页</option>"
euplist=euplist&"<option value="""&replace(eugpostgn,"?"&p_tjg&p_ujg,"?2"&p_ujg)&""">——</option>"
euplist=euplist&"<option value="""&replace(eugpostgn,"?"&p_tjg&p_ujg,"?0"&p_ujg)&""">本地</option><option value="""&replace(eugpostgn,"?"&p_tjg&p_ujg,"?1"&p_ujg)&""">远程</option></select>"
End Function
%>