<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%
Option Explicit
Const SaiLX_dir="/AsaiPlug/AsaiOnline/"'系统位置-阿赛在线人数统计系统所处位置.
Const SaiLX_ipcha=0'IP查询-IP查询模式0查询阿赛网站的IP数据库1查询百度的IP数据库.
Const SaiLX_mod=1'运行模式-统计运行模式.
Const SaiLX_tmjg=1200'更新间隔:设置网页自动更新时间为**秒.
Const SaiLX_tmjgs="十分钟"'时间显示:更新时间显示名称.
Const SaiLX_clen=660000'保留长度:用户信息缓存长度.
Const SaiLX_cosn="GYS"'特殊标示:数据储存开头标示.
Const SaiLX_cotm="cotm"'更新时间:最后更新时间记录缓存或文件名.
Const SaiLX_cotj="cotj"'在线人数:在线人数.储存名
Const SaiLX_colb="colb"'在线用户:在线用户储存名.
const g_apx=1'数据缓存-关闭缓存|Application|生成文件缓存*数据缓存方式,当你选择文件缓存时需要在目录中建立特殊标示文件夹并在其内建立co三个文件名的TXT文件
const g_gg="-_-"'普通间隔:普通间隔特殊符号.
const g_gx="-x-"'特殊符一:间隔特殊符号1.
const g_gy="_y_"'特殊符二:间隔特殊符号2.
const g_gz="_z-"'特殊符三:标签间隔及某些特别字符替换的特殊符号3.

Dim SaiLXXutm,SaiLXXutj,SaiLXXulb,SaiLXXty,SaiLXXsn
'give value from js ?0ty=1"&g_gz&"1uid"&g_gz&"2username"&g_gz&"3team"&g_gz&"4uxy"&g_gz&"5url
'ps：<script language="JavaScript" charset="utf-8" src=""&SaiLX_dir&"?1"&g_gz&"USOP37722BV"&g_gz&"eesai"&g_gz&"team"&g_gz&"0"&g_gz&"http://localhost/?media/info/CEOP2X4884.html"></scri pt>
Call SaiLXDoing(Request.ServerVariables("QUERY_STRING"))
'-----------------------------------
'get ip
'-----------------------------------
Function aiip()
Dim aiiaddr,aiihttp
aiihttp=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
If aiihttp="" Or InStr(aiihttp,"unknown")>0 Then
aiiaddr=Request.ServerVariables("REMOTE_ADDR")
ElseIf InStr(aiihttp,",")>0 Then
aiiaddr=Mid(aiihttp,1,InStr(aiihttp,",") -1)
ElseIf InStr(aiihttp,";")>0 Then
aiiaddr=Mid(aiihttp,1,InStr(aiihttp,";") -1)
Else
aiiaddr=aiihttp
End if
aiip=Trim(Mid(aiiaddr,1,15))
if aiip="::1" then:aiip="127.0.0.1"
End Function
'-----------------------------------
'user doing
'-----------------------------------
Sub SaiLXDoing(SaiLXDFstr)
Dim SaiLXDDsrr,SaiLXDDtrr,SaiLXDDts,SaiLXDDuid,SaiLXDDunm,SaiLXDDufl,SaiLXDDuxy,SaiLXDDuur,SaiLXDDutm,SaiLXDDurex
'---get user info
SaiLXDDsrr=split(SaiLXDFstr&""&g_gz&""&g_gz&""&g_gz&""&g_gz&""&g_gz&""&g_gz&"",""&g_gz&"")
SaiLXXty=trim(SaiLXDDsrr(0))
SaiLXXsn=trim(SaiLXDDsrr(6))
if SaiLXXsn="" then SaiLXXsn=SaiLX_cosn
if len(SaiLXXty&"1")<2 then:SaiLXXty=0:else:SaiLXXty=int(SaiLXXty):end if
if SaiLXXty<10 then
if trim(SaiLXDDsrr(1))<>"" and trim(SaiLXDDsrr(1))<>"EESai" then
SaiLXDDuid=SaiLXDDsrr(1)
SaiLXDDunm=SaiLXDDsrr(2)
SaiLXDDufl=SaiLXDDsrr(3)
SaiLXDDuxy=SaiLXDDsrr(4)
else
SaiLXDDuid=Session.SessionID
SaiLXDDunm=aiip()
SaiLXDDufl=""
SaiLXDDuxy=1
end if
SaiLXDDuur=SaiLXDDsrr(5)
SaiLXDDutm=hour(now())&":"&minute(now())&":"&second(now())
end if

if g_apx=2 then
'---File doing
if SaiLXXty>10 then
SaiLXXutm=int(timer):Call anfw(SaiLXXutm,SaiLXXsn&"/"&SaiLX_cotm&".txt")
SaiLXXulb=g_gx:Call anfw(SaiLXXulb,SaiLXXsn&"/"&SaiLX_colb&".txt")
SaiLXXutj=0:Call anfw("1",SaiLXXsn&"/"&SaiLX_cotj&".txt")
else
SaiLXXutm=trim(anfr(SaiLXXsn&"/"&SaiLX_cotm&".txt"))
SaiLXXulb=trim(anfr(SaiLXXsn&"/"&SaiLX_colb&".txt"))
SaiLXXutj=trim(anfr(SaiLXXsn&"/"&SaiLX_cotj&".txt"))
if len(SaiLXXulb&"1")<2 then
SaiLXXulb=g_gx:Call anfw(SaiLXXulb,SaiLXXsn&"/"&SaiLX_colb&".txt")
elseif len(SaiLXXulb&"1")>SaiLX_clen then
Call anfw(right(SaiLXXulb,SaiLX_clen),SaiLXXsn&"/"&SaiLX_colb&".txt")
end if
if len(SaiLXXutj&"1")<2 then:SaiLXXutj=0:Call anfw("1",SaiLXXsn&"/"&SaiLX_cotj&".txt"):else:SaiLXXutj=int(SaiLXXutj):end if
if len(SaiLXXutm&"1")<2 then:SaiLXXutm=int(timer):Call anfw(SaiLXXutm,SaiLXXsn&"/"&SaiLX_cotm&".txt"):else:SaiLXXutm=int(SaiLXXutm):end if
end if

'---user info save
if SaiLXXty<10 then
if instr(SaiLXXulb,SaiLXDDuid&g_gy)>0 then
Set SaiLXDDurex=New RegExp
SaiLXDDurex.IgnoreCase=True
SaiLXDDurex.Global=True
SaiLXDDurex.Pattern="("&g_gx&SaiLXDDuid&g_gy&"){1}(.*?)("&g_gx&"){1}"
SaiLXXulb=SaiLXDDurex.replace(SaiLXXulb,g_gx)
Set SaiLXDDurex=Nothing
else
SaiLXXutj=SaiLXXutj+1:Call anfw(SaiLXXutj,SaiLXXsn&"/"&SaiLX_cotj&".txt")
end if
SaiLXXulb=SaiLXXulb&SaiLXDDuid&g_gy&SaiLXDDunm&g_gy&SaiLXDDufl&g_gy&SaiLXDDuxy&g_gy&SaiLXDDuur&g_gy&SaiLXDDutm&g_gx

'---del old user
if (int(timer)-SaiLXXutm)>SaiLX_tmjg then
SaiLXDDtrr=split(g_gg&SaiLXXulb,g_gg)
SaiLXDDts=SaiLXDDtrr(ubound(SaiLXDDtrr))
SaiLXXulb=SaiLXDDts&g_gg&g_gx
SaiLXXutm=int(timer)
SaiLXXutj=ubound(split(SaiLXDDts,g_gx))-1
Call anfw(SaiLXXutm,SaiLXXsn&"/"&SaiLX_cotm&".txt")
Call anfw(SaiLXXutj,SaiLXXsn&"/"&SaiLX_cotj&".txt")
end if

Call anfw(SaiLXXulb,SaiLXXsn&"/"&SaiLX_colb&".txt")
end if
else
'---Application doing
Application.Lock
if SaiLXXty>10 then
SaiLXXutm=int(timer):Application(SaiLXXsn&SaiLX_cotm)=SaiLXXutm
SaiLXXulb=g_gx:Application(SaiLXXsn&SaiLX_colb)=SaiLXXulb
SaiLXXutj=0:Application(SaiLXXsn&SaiLX_cotj)=0
else
SaiLXXutm=trim(Application(SaiLXXsn&SaiLX_cotm))
SaiLXXulb=trim(Application(SaiLXXsn&SaiLX_colb))
SaiLXXutj=trim(Application(SaiLXXsn&SaiLX_cotj))
if len(SaiLXXulb&"1")<2 then SaiLXXulb=g_gx:Application(SaiLXXsn&SaiLX_colb)=SaiLXXulb
if len(SaiLXXutj&"1")<2 then:SaiLXXutj=0:Application(SaiLXXsn&SaiLX_cotj)=0:else:SaiLXXutj=int(SaiLXXutj):end if
if len(SaiLXXutm&"1")<2 then:SaiLXXutm=int(timer):Application(SaiLXXsn&SaiLX_cotm)=SaiLXXutm:else:SaiLXXutm=int(SaiLXXutm):end if
end if

'---user info save
if SaiLXXty<10 then
if instr(SaiLXXulb,SaiLXDDuid&g_gy)>0 then
Set SaiLXDDurex=New RegExp
SaiLXDDurex.IgnoreCase=True
SaiLXDDurex.Global=True
SaiLXDDurex.Pattern="("&g_gx&SaiLXDDuid&g_gy&"){1}(.*?)("&g_gx&"){1}"
SaiLXXulb=SaiLXDDurex.replace(SaiLXXulb,g_gx)
Set SaiLXDDurex=Nothing
else
SaiLXXutj=SaiLXXutj+1:Application(SaiLXXsn&SaiLX_cotj)=SaiLXXutj
end if
SaiLXXulb=SaiLXXulb&SaiLXDDuid&g_gy&SaiLXDDunm&g_gy&SaiLXDDufl&g_gy&SaiLXDDuxy&g_gy&SaiLXDDuur&g_gy&SaiLXDDutm&g_gx

'---del old user
if (int(timer)-SaiLXXutm)>SaiLX_tmjg then
SaiLXDDtrr=split(g_gg&SaiLXXulb,g_gg)
SaiLXDDts=SaiLXDDtrr(ubound(SaiLXDDtrr))
SaiLXXulb=SaiLXDDts&g_gg&g_gx
SaiLXXutm=int(timer)
SaiLXXutj=ubound(split(SaiLXDDts,g_gx))-1
Application(SaiLXXsn&SaiLX_cotm)=SaiLXXutm
Application(SaiLXXsn&SaiLX_cotj)=SaiLXXutj
end if

Application(SaiLXXsn&SaiLX_colb)=SaiLXXulb
end if
Application.UnLock
end if
End Sub
'-----------------------------------
'list user
'-----------------------------------
Function SaiLXList(SaiLXLFstr)
dim SaiLXLDrr,SaiLXLDrrx,SaiLXLDud,SaiLXLDudx,SaiLXLDi
SaiLXLDrr=Split(replace(SaiLXLFstr,g_gg&g_gx,""),g_gx)
SaiLXLDud=ubound(SaiLXLDrr)
if SaiLXLDud>1 then
SaiLXList="<table width=100% border=1 cellspacing=0 cellpadding=5 style=border-collapse:collapse;>"
SaiLXList=SaiLXList&"<tr><td><b>序号</b></td><td><b>编码</b></td><td><b>用户名</b></td><td><b>团队</b></td><td><b>状态</b></td><td><b>访问网址</b></td><td><b>访问时间</b></td></tr>"
if SaiLXLDud>820 then
SaiLXLDudx=SaiLXLDud-800
else
SaiLXLDudx=1
end if
For SaiLXLDi=SaiLXLDud-1 to SaiLXLDudx step -1
SaiLXLDrrx=split(SaiLXLDrr(SaiLXLDi),g_gy)
SaiLXList=SaiLXList&"<tr><td>"&SaiLXLDi&"</td><td>"&SaiLXLDrrx(0)&"</td><td>"
if instr(SaiLXLDrrx(1),".")>2 then
if SaiLX_ipcha=1 then
SaiLXList=SaiLXList&"<a target=_blank href=http://www.baidu.com/s?wd="&SaiLXLDrrx(1)&"&tn=guoyansai_pg&bar=>"&SaiLXLDrrx(1)&"</a>"
else
SaiLXList=SaiLXList&"<a target=_blank href=http://ip.780.pub/?"&SaiLXLDrrx(1)&">"&SaiLXLDrrx(1)&"</a>"
end if
else
SaiLXList=SaiLXList&"<a target=_blank href=../../../?user/show/"&SaiLXLDrrx(1)&".html>"&SaiLXLDrrx(1)&"</a>"
end if
SaiLXList=SaiLXList&"</td><td>"&SaiLXLDrrx(2)&"</td><td>"&SaiLXLDrrx(3)&"</td><td><a target=_blank href="&SaiLXLDrrx(4)&">"&SaiLXLDrrx(4)&"</a></td><td>"&SaiLXLDrrx(5)&"</td></tr>"
next
SaiLXList=SaiLXList&"</table>"
end if
End Function
'-----------------------------------
'PS:file read
'-----------------------------------
Function anfr(anko)
dim ankols
ankols=Server.MapPath(anko)
dim anfrfsou
Set anfrfsou=CreateObject("A"&"dod"&"b.St"&"r"&"eam")
anfrfsou.Open
anfrfsou.Type=2
anfrfsou.Charset="utf-8"
anfrfsou.LoadFromFile(ankols)
anfr=anfrfsou.ReadText
anfrfsou.Close
Set anfrfsou=Nothing
End Function
'-----------------------------------
'PS:file write
'-----------------------------------
Function anfw(anfstr,anko)
dim ankols
ankols=Server.MapPath(anko)
dim anfwtado
set anfwtado=server.CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With anfwtado
.type=2
.mode=3
.charset="utf-8"
.open
.WriteText=anfstr
.SaveToFile ankols,2
.flush
.Close
End With
set anfwtado=nothing
End Function

'response.Write SaiLXXutj&"人在线"&int(timer)
'response.Write "<br>------------------<br>"&Request.ServerVariables("HTTP_HOST")&Request.ServerVariables("URL")&"?"&Request.ServerVariables("QUERY_STRING")&SaiLXXutj&"<br>------------------<br>"&SaiLXXutm&"<br>------------------<br>"&SaiLXXulb&"<br>------------------<br>"&SaiLXList(SaiLXXulb)
'response.Write("document.write(""<meta http-equiv=refresh content='"&SaiLX_tmjg&",url="&Request.ServerVariables("PATH_INFO")&"'>当前在线 <b>"&Application(SaiLXXsn&SaiLX_cotj)&"</b> 人"");")

if SaiLXXty>9 then
response.Write "<html><head><meta charset=utf-8><title>在线人员列表信息</title></head><body>"
response.Write SaiLXList(SaiLXXulb)
response.Write"</body></html>"
elseif SaiLXXty=1 then
response.Write("function FTC(tcfurl,tcfname,tcfwid,tcfhei){var tcfurl;var tcfname;var tcfwid;var tcfhei;var tcdwid=(window.screen.availHeight-30-tcfhei)/2;var tcdhei=(window.screen.availWidth-10-tcfwid)/2;window.open(tcfurl,tcfname,'height='+tcfhei+',,innerHeight='+tcfhei+',width='+tcfwid+',innerWidth='+tcfwid+',top='+tcdwid+',left='+tcdhei+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');}function asaiopenwino(){FTC('"&SaiLX_dir&"?10','asaitongji','800','480')}")
response.Write("document.write(""<a HREF=# class=y-n4 onclick=asaiopenwino() title=单击查看前"&SaiLX_tmjgs&"在线人员列表>在线"&SaiLXXutj&"人</a>"");")
end if
%>
