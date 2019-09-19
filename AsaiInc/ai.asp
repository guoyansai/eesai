<%
'-----------------------------------
'PS:get url string
'=aiurl(aifty/1 add ge-)
'-----------------------------------
Function aiurl(aifty)
dim g_udrr,g_udk,g_udmi
aiurl=false
g_uhost=Request.ServerVariables("HTTP_HOST")'get www
g_umr=split(g_uhost,".")
g_udmi=ubound(g_umr)
g_um=""
g_umi=""
if g_udmi>0 then
g_umi=lcase(g_umr(g_udmi-1)&"."&g_umr(g_udmi))
if g_udmi=2 and not aibj(g_umr(0),"www") then
g_um=g_umr(0)
elseif g_udmi=3 and aibj(g_umr(0),"www") then
g_um=g_umr(1)
end if
end if
g_uurl=Request.ServerVariables("URL")'get dir+file
g_uurl=replace(g_uurl,"Default.asp","")
g_ustring=Server.HTMLEncode(Request.ServerVariables("QUERY_STRING"))'get request
g_u="http://"&g_uhost&g_uurl
if g_ustring<>"" then g_u=g_u&"?"&g_ustring'get url
'-----------for sure wap or pc 0
if g_wapk>0 and not aickin(g_uurl,g_wapc) then
g_udk=aipcwp()
if g_udk and instr(g_uurl,"wap/")=0 then
if g_wapk=1 and ainull(Request.ServerVariables("QUERY_STRING")) then
else
Response.Redirect("http://"&g_uhost&g_uurl&"wap/"&"?"&g_ustring)
Response.End()
end if
elseif not g_udk  and instr(g_uurl,"wap/")>0 then
Response.Redirect(replace(g_u,"wap/",""))
Response.End()
end if
end if
'-----------for sure wap or pc 1
g_udrr=split(g_uurl,g_urg)
if ubound(g_udrr)>0 then
g_ud=g_udrr(0)
if g_ud="" then g_ud=g_udrr(1)'get dir or file
end if
dim g_ustr,g_usrr
g_ustr=""
if instr(g_ustring,g_urz)>0 then
g_ustr=replace(g_ustring,g_urz,"")
else
g_ustr=g_ustring
end if
g_ustr=g_ustr&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg
g_usrr=split(g_ustr,g_urg)
g_u0=aiurlr(g_usrr(0),aifty)'get url split...
g_u1=aiurlr(g_usrr(1),aifty)
g_u2=aiurlr(g_usrr(2),aifty)
g_u3=aiurlr(g_usrr(3),aifty)
g_u4=aiurlr(g_usrr(4),aifty)
g_u5=aiurlr(g_usrr(5),aifty)
g_u6=aiurlr(g_usrr(6),aifty)
g_u7=aiurlr(g_usrr(7),aifty)
g_u8=aiurlr(g_usrr(8),aifty)
g_u9=aiurlr(g_usrr(9),aifty)
g_u10=aiurlr(g_usrr(10),aifty)
g_u11=aiurlr(g_usrr(11),aifty)
g_u12=aiurlr(g_usrr(12),aifty)
g_u13=aiurlr(g_usrr(13),aifty)
g_u14=aiurlr(g_usrr(14),aifty)
g_u15=aiurlr(g_usrr(15),aifty)
g_u16=aiurlr(g_usrr(16),aifty)
g_u17=aiurlr(g_usrr(17),aifty)
g_u18=aiurlr(g_usrr(18),aifty)
aiurl=true
End Function
Function aiurlr(aifstr,aifty)
aiurlr=aifstr
if aifty=1 then
if ainull(aiurlr) then aiurlr=g_urk
elseif aifty=3 then
if aibj(g_u0,"index") then
aiurlr="?"&replace(aifstr,"?","")
elseif ainull(g_u1) and ainull(g_u2) then
aiurlr=replace(aifstr,"?","")
end if
end if
End Function
'-----------------------------------
'PS:WAP OR PC
'=aipcwp()
'-----------------------------------
Function aipcwp()
dim anpdexp
Set anpdexp=New RegExp
anpdexp.pattern=".*("&"Android|iPhone|UC|Windows Phone|webOS|BlackBerry|iPod"&").*"
anpdexp.IgnoreCase=True
anpdexp.Global=True
aipcwp=anpdexp.test(Request.ServerVariables("HTTP_USER_AGENT"))
End Function
'-----------------------------------
'PS:have same word
'=aickin(aifcs,aifgz)
'-----------------------------------
Function aickin(aifcs,aifgz)
if ainull(aifgz) or ainull(aifcs) then
aickin=True
else
dim aickdrex
Set aickdrex=New RegExp
aickdrex.pattern=".*("&aifgz&").*"
aickdrex.IgnoreCase=True
aickdrex.Global=True
aickin=aickdrex.test(aifcs)
end if
End Function
'-----------------------------------
'PS:last view page url
'=ailasturl(aifstr)
'-----------------------------------
Function ailasturl(aifstr)
if Request.ServerVariables("Http_Referer")<>"" then
ailasturl=Request.ServerVariables("Http_Referer")
else
ailasturl=aifstr
end if
End Function
'-----------------------------------
'PS:huan cun
'=aihc(aifty,aiftm)
'-----------------------------------
Function aihc(aifty,aiftm)
if aiftm="0" then
aihc=""
else
if aifty="1" then
Response.Buffer=True'all
else
Response.Buffer=False'one by one
end if
Response.ExpiresAbsolute=DateAdd("n",aiftm,Now())
Response.Expires=aiftm 
Response.CacheControl="no-cache" 
Response.AddHeader "Pragma", "No-Cache"
aihc="<meta http-equiv=""pragma"" content=""no-cache""><meta http-equiv=""cache-control"" content=""no-cache""><meta http-equiv=""expires"" content="""&aiftm&""">"
end if
End Function
'-----------------------------------
'PS:get imgs from content
'=aiimgs(aifty,aifgg,aifstr)
'-----------------------------------
Function aiimgs(aifty,aifgg,aifstr)
aiimgs=""
if not ainull(aifstr) then
Dim aidrex,aidmat,aidmach
Set aidrex=New RegExp'建立正则表达对象。
aidrex.IgnoreCase =True' 是否区分大小写，True为不区分且默认
aidrex.Global=True'全部匹配还是只匹配第一个 
aidrex.Pattern="<img[^>]*src\s*=\s*['"&CHR(34)&"]?([\w/\-\:.]*)['"&CHR(34)&"]?[^>]*>"' 搜索所使用的正则表达式
If aidrex.test(aifstr) Then'判断是否有匹配值，返回True或者False。不受Global属性影响。
	Set aidmat=aidrex.Execute(aifstr)' 执行搜索。Execute 方法返回一个Matches 集合，其中包含了在 aifstr 中找到的每一个匹配的 Match 对象。如果未找到匹配，Execute 将返回空的 Matches 集合。
	For Each aidmach in aidmat' 遍历匹配集合。
	if aifty=1 then
	aiimgs=aiimgs&aifgg&aidmach.Value'获取整个img
	else
	aiimgs=aiimgs&aifgg&aidmach.SubMatches(0)'只取src
	end if
	Next
End If           
End If           
End Function
'-----------------------------------
'PS:caiji sha si
'=aicjsi(aifty,aifstr)
'-----------------------------------
Function aicjsi(aifty,aifstr)
aicjsi=aifstr
if aifstr<>"" and aifty>0 then
dim aicdlen,aicdlc
aicdlen=len(aifstr)
if aicdlen>2 then
Randomize
aicdlc=int(aicdlen*Rnd)
if aicdlc=0 then aicdlc=1
aicjsi=UCase(left(aifstr,aicdlc))&right(aifstr,aicdlen-aicdlc)
if aifty>1 then
if right(aicjsi,1)=" " then
aicjsi=aicjsi&left("          ",aicdlc)
elseif left(aicjsi,1)=" " then
aicjsi=left("          ",aicdlc)&aicjsi
end if
end if
end if
end if
End Function
'-----------------------------------
'PS:caiji sha
'=aicjsha(aifty,aifti,aifstr)
'-----------------------------------
Function aicjsha(aifty,aifti,aifstr)
aicjsha=aifstr
if aifstr<>"" and aifti<>"" and aifty>0 then
dim aictrr,aictii,aictlz
aictrr=split(aifti,"|")
for aictii=0 to ubound(aictrr)
aictlz=aictrr(aictii)
aifstr=replace(aifstr,aictlz,aicjsi(aifty,aictlz))
next
aicjsha=aifstr
end if
End Function
'-----------------------------------
'PS:Clean/Make/Read cookies
'=aiks(0cookies|1session|2cookies+session,"aifname","aifstr",0clean/1make/2read)
'-----------------------------------
Function aiks(aiflx,aifname,aifstr,aifty)
if aiflx=0 or aiflx=2 then
if aifty=0 then
Response.Cookies(aifname)=""
elseif aifty=1 then
Response.Cookies(aifname)=aifstr
Response.Cookies(aifname).Expires=g_cktm
elseif aifty=2 and aiflx=0 then
aiks=Request.Cookies(aifname)
end if
end if
if aiflx=1 or aiflx=2 then
if aifty=0 then
Session(aifname)=""
elseif aifty=1 and len(aifstr)<g_lcsn then
Session(aifname)=aifstr
elseif aifty=2 and aiflx=1 then
aiks=Session(aifname)
end if
end if
if aiflx=2 and aifty=2 then
if ainull(Session(aifname)) and ainull(Request.Cookies(aifname)) then
aiks=""
elseif ainull(Session(aifname)) and not ainull(Request.Cookies(aifname)) then
aiks=Request.Cookies(aifname)
if len(aiks)<g_lcsn then Session(aifname)=aiks
elseif not ainull(Session(aifname)) and ainull(Request.Cookies(aifname)) then
aiks=Session(aifname)
Response.Cookies(aifname)=aiks
elseif aibj(Session(aifname),Request.Cookies(aifname)) then
aiks=Request.Cookies(aifname)
else
aiks=Session(aifname)
Response.Cookies(aifname)=aiks
end if
end if
End Function
'-----------------------------------
'PS:For form request check
'=aifk(0cookies|1session|2cookies+session,0clean/1make/2check)
'-----------------------------------
Function aifk(aiflx,aifty)
if aifty=2 then
if request.form(g_ckks)<>"" and aiks(aiflx,g_ckks,"",2)<>"" and aibj(request.form(g_ckks),aiks(aiflx,g_ckks,"",2)) then
aifk=true
else
aifk=false
end if
elseif aifty=1 then
if aiks(aiflx,g_ckks,"",2)<>"" then
aifkzs=aiks(aiflx,g_ckks,"",2)
else
dim aifkzs
Randomize
aifkzs=g_ckks&int(98*Rnd)+1
Call aiks(aiflx,g_ckks,aifkzs,1)
end if
aifk=aiinput("hidden",g_ckks,"",0,0,"","",aifkzs)
elseif aifty=0 then
Call aiks(aiflx,g_ckks,"",0)
end if
'response.Write aifk
End Function
'---------------------------
'aixn15to10,10to8
'---------------------------
Function aixn(aifstr,aifty)
dim aidnrr,aidnl,aidnlz,aidnx,aidni
aidnrr=split("0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z","|")
if aifty=0 then
aidnl=int(aifstr)
aidnlz=int(aidnl/36)
aixn=aidnrr(aidnl-aidnlz*36)
do while aidnlz>0
aidnl=aidnlz
aidnlz=int(aidnl/36)
aixn=aidnrr(aidnl-aidnlz*36)&aixn
loop
else
aixn=0
aidnx="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
for aidni=1 to len(aifstr)
aixn=aixn+(instr(aidnx,left(mid(aifstr,aidni),1))-1)*int(36^(len(aifstr)-aidni))
next
end if
End Function
'---------------------------
'=aisn(0clean/1make/2no stone)
'---------------------------
Function aisn(aifty)
if aifty=0 then
Session("aisn")=""
elseif Session("aisn")<>"" and aifty=1 then
aisn=Session("aisn")
else
dim aidnm,aidtm
aidnm=aiint(Application("aisn"))
Application.Lock
if aidnm>1 then
Application("aisn")=aidnm-1
else
Application("aisn")=999
end if
Application.UnLock
aidtm=now()
aisn=right("000000"&aixn(right(99-int(right(year(aidtm),2)),2)&right("0"&(13-int(month(aidtm))),2)&right("0"&(32-int(day(aidtm))),2)&right("0"&(25-int(hour(aidtm))),2)&right("0"&(61-int(minute(aidtm))),2)&right("0"&(61-int(second(aidtm))),2)&right("000"&aidnm,3),0),10)
if aifty=1 then Session("aisn")=aisn
end if
End Function
'-----------------------------------
'PS:get num
'=ainum("aifstr",0=/1mini/2zh)
'-----------------------------------
Function ainum(aifstr,aifty)
aifstr=aiint(aifstr)
if right(aifstr,6)="000000" then
ainum=left(aifstr,len(aifstr)-6)&"百万"
elseif right(aifstr,4)="0000" and len(aifstr)<7 then
ainum=left(aifstr,len(aifstr)-4)&"万"
elseif right(aifstr,3)="000" and len(aifstr)<5 then
ainum=left(aifstr,len(aifstr)-3)&"千"
'elseif right(aifstr,2)="00" and len(aifstr)<4 then
'ainum=left(aifstr,len(aifstr)-2)&"百"
else
ainum=aifstr
end if
End Function
'-----------------------------------
'PS:format time
'=aicd("aifstr")
'-----------------------------------
Function aicd(aifstr)
if isdate(aifstr) then
aicd=cdate(aifstr)
else
aicd=now()
end if
End Function
'-----------------------------------
'PS:get time show
'=aitms("aifstr",0=m-d/1=h(m-d)/2=y-m-d/3=y-m-d)
'-----------------------------------
Function aitms(aifmz,aifstr,aifty)
if aifstr<>"" then
aitms=aifmz&aitmx(aifstr,aifty)
'if aiint(year(cdate(aifstr)))>1999 then aitms=aifmz&aitmx(aifstr,aifty)
end if
End Function
'-----------------------------------
'PS:get time
'=aitmx("aifstr",0=m-d/1=h(m-d)/2=y-m-d/3=y-m-d)
'-----------------------------------
Function aitmx(aifstr,aifty)
if aistr(aifstr)<>"" then
if aifty=23 then
aitmx=aicd(replace(replace(aifstr,"__"," "),"_",":"))
else
if isdate(aifstr) then
aitmx=cdate(aifstr)
else
aitmx=now()
end if
if aifty=22 then'url format2011-05-19 16:56:13 to 
aitmx=year(aitmx)&"-"&month(aitmx)&"-"&day(aitmx)&"__"&hour(aitmx)&"_"&minute(aitmx)&"_"&second(aitmx)
elseif aifty=0 then
aitmx=month(aitmx)&"-"&day(aitmx)&""
elseif aifty=1 then
aitmx=month(aitmx)&"-"&day(aitmx)&" "&hour(aitmx)&"."
elseif aifty=2 then
aitmx=year(aitmx)&"-"&month(aitmx)&"-"&day(aitmx)&""
elseif aifty=3 then
aitmx=right(year(aitmx),2)&" "&month(aitmx)&"-"&day(aitmx)
elseif aifty=5 then
aitmx=hour(aitmx)&":"&minute(aitmx)&":"&second(aitmx)
elseif aifty=6 then
aitmx=year(aitmx)&"/"&month(aitmx)&"/"&day(aitmx)&" "&hour(aitmx)&":"&minute(aitmx)&":"&second(aitmx)
elseif aifty=7 then
aitmx=month(aitmx)&"-"&day(aitmx)&" "&hour(aitmx)&":"&minute(aitmx)&":"&second(aitmx)
elseif aifty=8 then
aitmx=year(aitmx)&"年"&month(aitmx)&"月"&day(aitmx)&"日"
if hour(aitmx)>0 or minute(aitmx)>0 then
aitmx=year(aitmx)&"年"&month(aitmx)&"月"&day(aitmx)&"日"&hour(aitmx)&"时"&minute(aitmx)&"分"
else
aitmx=year(aitmx)&"年"&month(aitmx)&"月"&day(aitmx)&"日"
end if
elseif aifty=9 then
if aiint(hour(aitmx))>0 or aiint(minute(aitmx))>0 or aiint(second(aitmx))>0 then
aitmx=year(aitmx)&"年"&month(aitmx)&"月"&day(aitmx)&"日"&hour(aitmx)&"时"&minute(aitmx)&"分"&second(aitmx)&"秒"
else
aitmx=year(aitmx)&"年"&month(aitmx)&"月"&day(aitmx)&"日"
end if
elseif aifty=99 then
aitmx=year(aitmx)&"-"&right("00"&month(aitmx),2)&"-"&right("00"&day(aitmx),2)&" "&right("00"&hour(aitmx),2)&":"&right("00"&minute(aitmx),2)&":"&right("00"&second(aitmx),2)
elseif aifty=10 then'pass time
dim aidint,aidtd,aidth,aidtm,aidts
aidint=DateDiff("s",aitmx,now())
if aidint<1 then
aitmx="刚才"
else
aidtd=int(aidint/60/60/24)
aidth=int(aidint/60/60)
aidtm=int(aidint/60)
aidts=aidint
If aidtd>200 Then
aitmx="很久以前"
elseIf aidtd>180 Then
aitmx=year(aitmx)&"-"&month(aitmx)
elseIf aidtd>60 Then
aitmx=month(aitmx)&"-"&day(aitmx)&""
ElseIf aidtd>30 Then
aitmx="1个月前"
ElseIf aidtd>14 Then
aitmx="2周前"
ElseIf aidtd>7 Then
aitmx="1周前"
ElseIf aidtd>1 Then
aitmx=aidtd&"天前"
ElseIf aidth>1 Then
aitmx=aidth&"小时前"
ElseIf aidtm>1 Then
aitmx=aidtm&"分钟前"
ElseIf aidts>=1 Then
aitmx=aidts&"秒前"
Else
aitmx="刚刚"
End If
end if
end if
end if
else
aitmx="-"
end if
End Function
'---------------------------
'aitm(012345,now())
'---------------------------
Function aitm(aifty,aifstr)
if aifty=8 then
dim aitlin
aitlin=len(aifstr)
if aitlin>3 then aitm=left(aifstr,4)&"年"
if aitlin>5 then aitm=aitm&Mid(aifstr,5,2)&"月"
if aitlin>7 then aitm=aitm&Mid(aifstr,7,2)&"日"
if aitlin>9 then aitm=aitm&Mid(aifstr,9,2)&"时"
if aitlin>11 then aitm=aitm&Mid(aifstr,11,2)&"分"
if aitlin>13 then aitm=aitm&Mid(aifstr,13,2)&"秒"
else
if not isdate(aifstr) then aifstr=now()
aitm=right("20"&year(aifstr),4)
if aifty>0 then aitm=aitm&right("0"&month(aifstr),2)
if aifty>1 then aitm=aitm&right("0"&day(aifstr),2)
if aifty>2 then aitm=aitm&right("0"&hour(aifstr),2)
if aifty>3 then aitm=aitm&right("0"&minute(aifstr),2)
if aifty>4 then aitm=aitm&right("0"&second(aifstr),2)
end if
End Function
'-----------------------------------
'PS:time end asp
'=aidjtm(aifty,aiftm,aifhm)
'-----------------------------------
Function aidjtm(aifty,aiftm,aifhm)
if isdate(aiftm) then
dim aidint,aidtd,aidth,aidtm,aidts
aidint=DateDiff("s",now(),aiftm)
if aidint>0 then
aidtd=int(aidint/60/60/24)
aidth=int((aidint-aidtd*60*60*24)/60/60)
aidtm=int((aidint-aidtd*60*60*24-aidth*60*60)/60)
aidts=int(aidint-aidtd*60*60*24-aidth*60*60-aidtm*60)
if aifty=0 then
if aifhm<>"" then aidjtm="<"&aifhm&">"
if aidtd>0 then aidjtm=aidjtm&aidtd&"天"
if aidtd>0 or aidth>0 then aidjtm=aidjtm&aidth&"时"
if aidtd>0 or aidth>0 or aidtm>0 then aidjtm=aidjtm&aidtm&"分"
if aidtd>0 or aidth>0 or aidtm>0 or aidts>0 then aidjtm=aidjtm&aidts&"秒"
if aifhm<>"" then aidjtm="</"&aifhm&">"
end if
else
aidjtm="<script>location.reload();</script>"
end if
end if
End Function
'-----------------------------------
'PS:time out print
'=aidjs(1reload|0no,aiftm=2015/05/1 10:00:00,aifnm)
'-----------------------------------
Function aidjs(aifty,aiftm,aifnm,aifhm)
aidjs="<script runat=""server"" language=""javascript"">"
aidjs=aidjs&"function AsaiTm"&aifnm&"Djs(){"&vbcrlf&""_
&"var AsaiTm"&aifnm&"TC=new Date('"&aiftm&"').getTime()-new Date().getTime();"&vbcrlf&""_
&"var AsaiTm"&aifnm&"DJd=0;"&vbcrlf&""_
&"var AsaiTm"&aifnm&"DJh=0;"&vbcrlf&""_
&"var AsaiTm"&aifnm&"DJm=0;"&vbcrlf&""_
&"var AsaiTm"&aifnm&"DJs=0;"&vbcrlf&""_
&"if (AsaiTm"&aifnm&"TC>0){;"&vbcrlf&""_
&"AsaiTm"&aifnm&"DJd=Math.floor(AsaiTm"&aifnm&"TC/1000/60/60/24);"&vbcrlf&""_
&"AsaiTm"&aifnm&"DJh=Math.floor(AsaiTm"&aifnm&"TC/1000/60/60%24);"&vbcrlf&""_
&"AsaiTm"&aifnm&"DJm=Math.floor(AsaiTm"&aifnm&"TC/1000/60%60);"&vbcrlf&""_
&"AsaiTm"&aifnm&"DJs=Math.floor(AsaiTm"&aifnm&"TC/1000%60);"&vbcrlf&""_
&"};"
if aiint(aifty)>0 then aidjs=aidjs&"if(AsaiTm"&aifnm&"DJd<=0&&AsaiTm"&aifnm&"DJh<=0&&AsaiTm"&aifnm&"DJm<=0&&AsaiTm"&aifnm&"DJs<=0){location.reload();}"
aidjs=aidjs&"if(AsaiTm"&aifnm&"DJd>0 || AsaiTm"&aifnm&"DJh>0 || AsaiTm"&aifnm&"DJm>0 || AsaiTm"&aifnm&"DJs>0){document.getElementById(""AsaiTm"&aifnm&"JSs"").innerHTML=AsaiTm"&aifnm&"DJs+""秒"";}"&vbcrlf&""_
&"if(AsaiTm"&aifnm&"DJd>0 || AsaiTm"&aifnm&"DJh>0 || AsaiTm"&aifnm&"DJm>0){document.getElementById(""AsaiTm"&aifnm&"JSm"").innerHTML=AsaiTm"&aifnm&"DJm+""分"";}"&vbcrlf&""_
&"if(AsaiTm"&aifnm&"DJd>0 || AsaiTm"&aifnm&"DJh>0){document.getElementById(""AsaiTm"&aifnm&"JSh"").innerHTML=AsaiTm"&aifnm&"DJh+""时"";}"&vbcrlf&""_
&"if(AsaiTm"&aifnm&"DJd>0){document.getElementById(""AsaiTm"&aifnm&"JSd"").innerHTML=AsaiTm"&aifnm&"DJd+""天"";}}"&vbcrlf&""_
&"window.setInterval(""AsaiTm"&aifnm&"Djs()"",1000);"&vbcrlf&""_
&"document.write('<"&aifhm&" id=AsaiTm"&aifnm&"JSd></"&aifhm&"><"&aifhm&" id=AsaiTm"&aifnm&"JSh></"&aifhm&"><"&aifhm&" id=AsaiTm"&aifnm&"JSm></"&aifhm&"><"&aifhm&" id=AsaiTm"&aifnm&"JSs></"&aifhm&">');"&vbcrlf&""_
&"</script>"
End Function
'-----------------------------------
'PS:replace the words
'=aith("aifstr","aifst0"/"s1,s2,s3","s7,s8,s9")
'-----------------------------------
Function aith(aifstr,aifst0,aifst1)
dim ais0rr,ais1rr,ais0j,ais1j,aithj,aithi,aithlz
ais0rr=split(aifst0,g_gg)
ais0j=ubound(ais0rr)
ais1rr=split(aifst1,g_gg)
ais1j=ubound(ais1rr)
aith=aifstr
if ais1j=0 then
aithj=ais0j
elseif ais0j>ais1j then
aithj=ais1j
else
aithj=ais0j
end if
for aithi=0 to aithj
if ais1j=0 then
aithlz=aifst1
else
aithlz=ais1rr(aithi)
end if
if aistr(ais0rr(aithi))<>"" then aith=replace(aith,ais0rr(aithi),aithlz)
next
End Function
'-----------------------------------
'PS:check have the words
'=aickw(aifty0false1true,"aifstr","aifstr")
'-----------------------------------
Function aickw(aifty,aifstr,aifstrs)
if aifty=1 then
aickw=true
else
aickw=false
end if
if aifstrs<>"" and aifstr<>"" then
Dim aidcrex
Set aidcrex=New RegExp
aidcrex.IgnoreCase=False
aidcrex.Pattern="("&aifstrs&")"
aickw=aidcrex.Test(aifstr)
Set aidcrex=Nothing
end if
End Function
'-----------------------------------
'PS:replace the code for caiji
'=ailcu("aifstr","aifst0|s1,s2,s3|s7,s8,s9")
'-----------------------------------
function ailcu(aifstr,aifus)
ailcu=aifstr
dim ailcrr,ailcii,ailczz,ailclen,ailcnn,ailcti
ailcrr=split(aifus,"|")
for ailcii=0 to ubound(ailcrr)
ailczz=ailcrr(ailcii)
if ailczz<>"" then
if int(timer) mod 2=0 then
ailclen=len(ailczz)
Randomize
ailcnn=int(ailclen*Rnd)+1
if ailcnn>ailclen then ailcnn=ailclen
ailcti=ucase(left(ailczz,ailcnn))&right(ailczz,ailclen-ailcnn)
ailcu=replace(ailcu,ailczz,ailcti)
end if
end if
next
end function
'-----------------------------------
'PS:del html
'=ainohtml("aifstr")
'-----------------------------------
Function ainohtml(aifstr)
On Error Resume Next'display err
dim ainhrex
if ainull(aifstr) then
ainohtml=""
else
ainohtml=aifstr
Set ainhrex=new RegExp
ainhrex.IgnoreCase=true
ainhrex.Global=True
ainhrex.Pattern="(\<.[^\<]*\>)"
ainohtml=ainhrex.replace(ainohtml,"")
ainhrex.Pattern="(\<\/[^\<]*\>)"
ainohtml=ainhrex.replace(ainohtml,"")
set ainhrex=nothing
end if
end function
'-----------------------------------
'PS:replace lot space to one
'=aids("aifstr")
'-----------------------------------
Function aids(aifstr)
if ainull(aifstr) then
aids=""
else
dim aidsrex
aids=Replace(aifstr,"&nbsp;"," ")
Set aidsrex=New RegExp
aidsrex.IgnoreCase=True
aidsrex.Global=True
aidsrex.Pattern=" +"
aids=aidsrex.Replace(aids," ")
end if
End Function
'-----------------------------------
'PS:make a line of text
'=aitit("aifstr")
'-----------------------------------
Function aitit(aifstr)
aitit=ainohtml(aifstr)
if not isnull(aitit) then
Dim aitrex
Set aitrex=New RegExp
aitrex.IgnoreCase=True
aitrex.Global=True
aitrex.Pattern="("&vbtab&"|"&VbCrlf&"|"&Chr(0)&"|"&Chr(8)&"|"&Chr(9)&"|"&Chr(10)&"|"&Chr(13)&"|&nbsp;)"
aitit=aitrex.Replace(aitit,vbNullString)
Set aitrex=Nothing
else
aitit=""
end if
end Function
'-----------------------------------
'PS:make a line of text len
'=aititlen("aifstr",200)
'-----------------------------------
Function aititlen(aifstr,aiflen)
aititlen=aitit(aifstr)
if len(aititlen)>aiflen then aititlen=aileft(aititlen,aiflen)&".."
end Function
'-----------------------------------
'PS:make a title from content
'=aitz("aifstr")
'-----------------------------------
Function aitz(aifty,aifstr)
dim aitzdgz,aitzdrex
if aifty=6 then
aitzdgz="[^\a-\z\A-\Z0-9\u4E00-\u9FA5]"
elseif aifty=5 then
aitzdgz="[^\a-\z\A-\Z0-9]"
elseif aifty=4 then
aitzdgz="[^\u4E00-\u9FA5]"
elseif aifty=3 then
aitzdgz="[^\a-\z\A-\Z]"
elseif aifty=2 then
aitzdgz="[^\A-\Z]"
elseif aifty=1 then
aitzdgz="[^\a-\z]"
else
aitzdgz="[^0-9]"
end if
Set aitzdrex=New RegExp
aitzdrex.Pattern=aitzdgz
aitzdrex.IgnoreCase=True 
aitzdrex.Global=True 
aitz=aitzdrex.Replace(aifstr,"")
Set aitzdrex=Nothing
End Function
'-----------------------------------
'PS:REX replace
'=airepx(aifstr,aifrex,aifths)
'-----------------------------------
Function airepx(aifstr,aifrex,aifths)
Dim aidstrl,aidrex
aidstrl=Cstr(aifstr)
Set aidrex=New RegExp
aidrex.Pattern=aifrex
aidrex.IgnoreCase=True
aidrex.Global=True
aidstrl=aidrex.Replace(aidstrl,aifths)
airepx=aidstrl
Set aidrex=Nothing
End Function
'-----------------------------------
'PS:make a line of text(no Spaces <>)
'=aititp("aifstr")
'-----------------------------------
Function aititp(aifstr)
aititp=aitit(aifstr)
aititp=Replace(aititp,"<","&lt;")
aititp=Replace(aititp,">","&gt;")
aititp=Replace(aititp,"""","")
aititp=Replace(aititp,"'","")
aititp=Replace(aititp,CHR(32),"")
aititp=Replace(aititp,CHR(9),"")
aititp=Replace(aititp,"　　"," ")
aititp=Replace(aititp,"  "," ")
aititp=aids(aititp)
aititp=Replace(aititp,g_pgcg,"")
aititp=Replace(aititp,"[eeSai]","")
aititp=aititp
end Function
'-----------------------------------
'PS:make html&asp to text
'=aip2t("aifstr")
'-----------------------------------
Function aip2t(aifstr)
aip2t=aifstr
aip2t=Replace(aip2t,"<","&lt;")
aip2t=Replace(aip2t,">","&gt;")
'aip2t=Replace(aip2t,"""","""""")
'aip2t=Replace(aip2t,VbCrlf,CHR(32))
end Function
'-----------------------------------
'PS:make text to html&asp
'=ait2p("aifstr")
'-----------------------------------
Function ait2p(aifstr)
ait2p=aifstr
ait2p=Replace(ait2p,"&lt;","<")
ait2p=Replace(ait2p,"&gt;",">")
ait2p=Replace(ait2p,"""""","""")
end Function
'-----------------------------------
'PS:get simple content
'=aititplen("aifstr",200)
'-----------------------------------
Function aititplen(aifstr,aiflen)
aititplen=aititp(aifstr)
if len(aititplen)>aiflen then aititplen=left(aititplen,aiflen)&".."
End Function
'-----------------------------------
'PS:get content length
'=aiflen("aifstr")
'-----------------------------------
Function ailen(aifstr)
if not ainull(aifstr) then
ailen=len(aifstr)
else
ailen=0
end if
End Function
'-----------------------------------
'PS:make char to html for form
'=aihtml("aifstr")
'-----------------------------------
Function aihtml(aifstr)
if not isnull(aifstr) then
aihtml=aifstr
aihtml=Replace(aihtml,"＜","&lt;")
aihtml=Replace(aihtml,"＞","&gt;")
aihtml=aihtml
else
aihtml=""
end if
end Function
'-----------------------------------
'PS:make char to text for in db
'=aitexttin("aistr")
'-----------------------------------
Function aitexttin(aistr)
if not isnull(aistr) then
aitexttin=aistr
aitexttin=Replace(aitexttin,VbCrlf,CHR(10))
aitexttin=Replace(aitexttin,CHR(13),CHR(10))
aitexttin=Replace(aitexttin,CHR(10)&CHR(10),CHR(10))
else
aitexttin=""
end if
end Function
'-----------------------------------
'PS:make char to input for in db
'=aiinputin("aifstr")
'-----------------------------------
Function aiinputin(aifstr)
if not isnull(aifstr) then
aiinputin=aifstr
dim aiinputinexp
set aiinputinexp=new RegExp
aiinputinexp.Pattern="<[^>]*>"
aiinputinexp.Global=true
aiinputin=aiinputinexp.Replace(aiinputin,"")
aiinputin=Replace(aiinputin,CHR(10),"")
aiinputin=Replace(aiinputin,CHR(13),"")
aiinputin=Replace(aiinputin,"<","&lt;")
aiinputin=Replace(aiinputin,">","&gt;")
aiinputin=Replace(aiinputin,"""","&quot;")
aiinputin=aids(aiinputin)
else
aiinputin=""
end if
end Function
'-----------------------------------
'PS:get the request value
'=airet("aifstr")
'-----------------------------------
Function airet(aifstr)
if aifstr<>"" then
airet=replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(aifstr,"<",""),">",""),"""",""),"%",""),";",""),"(",""),")",""),"&",""),"+",""),"delete",""),"update",""),"insert",""),"exec","")
end if
end Function
'-----------------------------------
'PS:get the request value
'=aireq("aifstr")
'-----------------------------------
Function aireq(aifstr)
if aifstr<>"" then
aireq=request(aifstr)
'FOR special
if aibj(right(aifstr,2),"tj") then'count
'aireq=aireq
elseif instr(aifstr,"mm")>0 then'password
aireq=aimm(g_gmm,aireq,0)
elseif aibj(right(aifstr,2),"nr") then'htmledit content
'aireq=aireq
elseif right(aifstr,2)="pl" or right(aifstr,2)="jl" or right(aifstr,2)="xt" then'text content
aireq=aitexttin(aireq)
elseif aibj(left(aireq,2),"##") then'lot inputs replace, 
aireq=replace(aireq,", ","")
else
aireq=aiinputin(aireq)
end if
'FOR special
else
aireq=""
end if
End Function
'-----------------------------------
'PS:Submitted value judgment for form check
'=aireqx("aifstr")
'-----------------------------------
Function aireqx(aifstr)
dim aireqxrr,aireqxi
aireqxrr=split(aifstr,",")
aireqx=True
for aireqxi=0 to ubound(aireqxrr)
if aireq(aireqxrr(aireqxi))="" then
aireqx=False
exit for
exit Function
end if
next
End Function
'-----------------------------------
'PS:get arr
'=aiarr("aifstr","|","x2"/2)
'-----------------------------------
Function aiarr(aifstr,aifge,aifty)
if left(aifty,1)="x" then
dim aiarrii
for aiarrii=0 to int(replace(aifty,"x",""))
if aiarrii=0 then
aiarr=aiarr&split(aifstr,aifge)(0)
else
aiarr=aiarr&aifge&split(aifstr,aifge)(int(aiarrii))
end if
next
else
dim aiarrdlrr
aiarrdlrr=split(aifstr,aifge)
if ubound(aiarrdlrr)>=aiint(aifty) then
aiarr=aiarrdlrr(aiint(aifty))
else
aiarr=aiarrdlrr(ubound(aiarrdlrr))
end if
end if
End Function
'-----------------------------------
'PS:Judge the same
'=aibj("aifstr","aifstr")
'-----------------------------------
Function aibj(aifstr,aifstrs)
aibj=false
if lcase(trim(aifstr))=lcase(trim(aifstrs)) then
aibj=true
end if
End Function
'-----------------------------------
'PS:response.Write("")
'=aird("aifstr")
'-----------------------------------
dim airdi
airdi=0
Function aird(aifstr)
airdi=airdi+1
response.Write "["&airdi&"] "&aifstr
End Function
'-----------------------------------
'PS:same as left("aifstr",6) Matching in both Chinese and English
'=aileft("aifstr",6)
'-----------------------------------
Function aileft(aifstr,aiflen)
On Error Resume Next'display err         
if not ainull(aifstr) then
dim aildl,aildc,aildi,aildzh,ailden
aildl=len(aifstr)  
if aildl<aiflen then  
aileft=aifstr  
else  
aildzh=0  
ailden=0  
for aildi=1 to aildl  
aildc=asc(mid(aifstr,aildi,1))  
if aildc>=128 or c<0 then   
aildzh=aildzh+1  
else  
ailden=ailden+1  
end if  
if ailden/2+aildzh>=aiflen then  
exit for  
end if  
next          
aileft=left(aifstr,aildi)
end if  
end if
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
'-----------------------------------
'PS:make char to show
'=aishow("aifstr")
'-----------------------------------
Function aishow(aifstr)
dim aisexp,aisexpt,aisfiles,aisfilesrr,aisii
if not isnull(aifstr) then
aishow=Replace(aifstr,"<br>",CHR(10))
set aisexpt=new RegExp
aisexpt.Pattern="<[^>]*>"
aisexpt.Global=true
aishow=aisexpt.Replace(aishow,"")
aishow=replace(aishow,"<","&lt;")
aishow=replace(aishow,">","&gt;")
aishow=Replace(aishow,CHR(32),"&nbsp;")
aishow=Replace(aishow,CHR(9),"&nbsp;")
aishow=Replace(aishow,CHR(10),"<br>")
aishow=Replace(aishow,CHR(13),"<br>")
aishow=Replace(aishow,VbCrlf,"<br>")
aishow=Replace(aishow,"<br><br>","<br>")
if instr(aishow,"http://")>0 then'link open
Set aisexp=new RegExp'regular expression
aisexp.IgnoreCase=true'Ignore case
aisexp.Global=true'Search string matching for all text
aisfiles="jpg,jepg,gif,png,bmp,avi,wmv,mp3,wma,mpeg,mp4,3gp,rmvb,swf,flv"
aisfilesrr=split(aisfiles,",")
for aisii=0 to ubound(aisfilesrr)
aisexp.Pattern="(http://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)."&aisfilesrr(aisii)&")"
aishow=aisexp.replace(aishow,aiplay(0,"$1."&aisfilesrr(aisii)&"",540,450))
aishow=Replace(aishow,"."&aisfilesrr(aisii)&"."&aisfilesrr(aisii)&"","."&aisfilesrr(aisii)&"")
next
aisexp.Pattern="(mailto:)?([\w]+@([\w-]+\.)+[\w]+)"'Find E-mail link
aishow=aisexp.replace(aishow,"<a href='mailto:$2' title='mailto:$2'>$1$2</a>")
Set aisexp=nothing
end if
aishow=trim(aishow)
else
aishow=""
end if
end Function
'-----------------------------------
'PS:Judgment character is empty
'=ainull("aifstr")
'-----------------------------------
Function aimo(aifstr,aifmz)
if ainull(aifstr) then
aimo=aifmz
else
aimo=aifstr
end if
End Function
Function ainull(aifstr)
if trim(aifstr)="" or trim(aifstr)=g_urk or trim(aifstr)=g_apt or lcase(aifstr)="null" then
ainull=true
else
ainull=False
Select Case VarType(aifstr)
Case vbEmpty,vbNull
ainull=True : Exit Function
Case vbString
If aifstr="" Then ainull=True : Exit Function
Case vbObject
If TypeName(aifstr)="Nothing" Or TypeName(aifstr)="Empty" or lcase(aifstr)="null" Then ainull=True : Exit Function
Case vbArray,8194,8204,8209
If Ubound(aifstr)=-1 Then ainull=True : Exit Function
End Select
end if
End Function
Function aiint(aifstr)
aiint=0
aifstr=trim(aifstr)
if InStr(aifstr,g_gg)=0 then
if isNumeric(aifstr) then aiint=int(aifstr)
else
dim aiintdrr
if not ainull(aifstr) then
aiintdrr=split(aifstr,g_gg)
if isNumeric(trim(aiintdrr(0))) then
aiint=int(trim(aiintdrr(0)))
elseif isNumeric(trim(aiintdrr(1))) then
aiint=int(trim(aiintdrr(1)))
end if
end if
end if
End Function
Function aistr(aifstr)
aistr=""
aifstr=trim(aifstr)
if InStr(aifstr,g_gg)=0 then
if not ainull(aitit(aifstr)) then aistr=cstr(aifstr)
else
dim aistrdrr
aistrdrr=split(aifstr,g_gg)
if not ainull(trim(aistrdrr(0))) then
aistr=cstr(trim(aistrdrr(0)))
elseif not ainull(trim(aistrdrr(1))) then
aistr=cstr(trim(aistrdrr(1)))
end if
end if
End Function
'-----------------------------------
'PS:regular
'=aifgui("aifty")
'-----------------------------------
Function aifgui(aifty)
if aifty=9 or aifty=99 then
g_str="仅限输入：时间"
aifgui=" onkeyup=""value=value.replace(/[^\0-9\:\ \-\/]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\0-9\:\ \-\/]/g,''))"""
elseif aifty=66 then
g_str="仅限输入(账户)：英文,数字"
aifgui=" onkeyup=""value=value.replace(/[^\a-\z\A-\Z0-9\-]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\a-\z\A-\Z0-9\-]/g,''))"""
elseif aifty=77 then
g_str="仅限输入：中文,英文,数字,字符"
aifgui=" onkeyup=""value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\@\_\-\.]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\@\_\.]/g,''))"""
elseif aifty=8 then
g_str="仅限输入：电子邮箱"
aifgui=" onkeyup=""value=value.replace(/[^\a-\z\A-\Z0-9\@\_\.]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\a-\z\A-\Z0-9\@\_\.]/g,''))"""
elseif aifty=7 then
g_str="仅限输入：电话号码"
aifgui=" onkeyup=""value=value.replace(/[^\0-9\_\+\|]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\0-9\_\+\|]/g,''))"""
elseif aifty=6 then
g_str="仅限输入：数字"
aifgui=" onkeyup=""value=value.replace(/\D/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))"""
elseif aifty=5 then
g_str="仅限输入：英文"
aifgui=" onkeyup=""value=value.replace(/[^\a-\z\A-\Z]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\a-\z\A-\Z]/g,''))"""
elseif aifty=4 then
g_str="仅限输入：中文"
aifgui=" onkeyup=""value=value.replace(/[^\u4E00-\u9FA5]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))"""
elseif aifty=3 then
g_str="仅限输入：英文,数字"
aifgui=" onkeyup=""value=value.replace(/[^a-zA-Z0-9]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z0-9]/g,''))"""
elseif aifty=2 then
g_str="仅限输入：中文,英文,数字"
aifgui=" onkeyup=""value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,''))"""
elseif aifty=1 then
g_str="仅限输入：中文,英文,数字,字符"
aifgui=" onkeyup=""value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\@\_\.\,]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\@\_\.\,]/g,''))"""
end if
End Function
'-----------------------------------
'PS:textarea
'=aitext("aifname","100%/220px","20%/80px",2,100,"aiftit",""/"fc0|fc1|fc2","aifstr")
'-----------------------------------
Function aitext(aifname,aifwid,aifhei,aifgu,aiflen,aiftit,aifcss,aifstr)
if aifstr="" and aireq(aifname)<>"" then aifstr=aireq(aifname)
aitext="<textarea name="""&aifname&""" id="""&aifname&""""
if aistr(aifwid)="0" and aistr(aifhei)="0" then
aitext=aitext&" style=""display:none;"""
elseif aistr(aifwid)<>"" and aistr(aifhei)<>"" then
aitext=aitext&" style=""width:"&aifwid&";height:"&aifhei&";"""
end if
if aiint(aifgu)>0 then aitext=aitext&aifgui(aiint(aifgu))
if aiint(aiflen)>0 then aitext=aitext&" onpropertychange=""if(this.value.length>"&aiint(aiflen)&")this.value=this.value.substring(0,"&aiint(aiflen)&")"""
if aiftit<>"" then
aitext=aitext&" placeholder="""&aiftit&""""
if g_str<>"" then
aitext=aitext&" title="""&aiftit&vbCrLf&g_str&""""
else
aitext=aitext&" title="""&aiftit&""""
end if
else
if g_str<>"" then
aitext=aitext&" title="""&g_str&""""
end if
end if
if aistr(aifcss)<>"" then
dim aifcssrr,aifcssii
aifcssrr=split(aifcss,"|")
if ubound(aifcssrr)=2 then
aitext=aitext&" class="""&aifcssrr(0)&""" onclick=""this.className='"&aifcssrr(1)&"';"
if aifgu=99 then aitext=aitext&"FTM("&aifname&");"
aitext=aitext&""" onBlur=""this.className='"&aifcssrr(2)&"';"""
else
if aifgu=99 then aitext=aitext&" onclick=""FTM("&aifname&");"""
end if
end if
aitext=aitext&">"&aifstr&"</textarea>"
End Function
'-----------------------------------
'PS:DLL test
'=aizj("")
'-----------------------------------
Function aizj(aifstr)
On Error Resume Next'display err
Dim aidobj
Set aidobj=Server.CreateObject(aifstr)
If Err.Number<>0 Then
Err.Clear
aizj=False
Else
aizj=True
end if
End Function
'-----------------------------------
'PS:kill auto input
'=aibutian(0=no|1=li|2=div)
'-----------------------------------
Function aibutian(aifty)
if aifty=2 then
aibutian="<div style=""position:absolute;top:-100px;visibility:hidden;""><input name=""user"" type=""text""><input name=""password"" type=""password""></div>"
elseif aifty=1 then
aibutian="<li style=""position:absolute;top:-100px;visibility:hidden;""><input name=""user"" type=""text""><input name=""password"" type=""password""></li>"
else
aibutian="<input name=""user"" type=""text"" style=""position:absolute;top:-100px;visibility:hidden;""><input name=""password"" type=""password"" style=""position:absolute;top:-100px;"">"
end if
End Function
'-----------------------------------
'PS:input
'=aiinput("aiftype","aifname"/"MA1|MA","100%/220px",2,100,"aiftit",""/"fc0|fc1|fc2","aifstr")
'-----------------------------------
Function aiinput(aiftype,aifname,aifwid,aifgu,aiflen,aiftit,aifcss,aifstr)
g_str=""
if aiftype="read" then
aiinput="<input type=""text"" readonly=""readonly"" onclick=""alert('Only Read!')"""
elseif aiftype<>"" then
if aifstr="" and aireq(aifname)<>"" then aifstr=aireq(aifname)
aiinput="<input type="""&aiftype&""""
else
if aifstr="" and aireq(aifname)<>"" then aifstr=aireq(aifname)
aiinput="<input type=""text"""
end if
dim aiinputnmarr
aiinputnmarr=split(aifname,"|")
if ubound(aiinputnmarr)>0 then
aiinput=aiinput&" name="""&aiinputnmarr(0)&""" id="""&aiinputnmarr(1)&""""
else
aiinput=aiinput&" name="""&aifname&""" id="""&aifname&""""
end if
if aistr(aifwid)<>"" then aiinput=aiinput&" style=""width:"&aifwid&";"""
if aiint(aifgu)>0 then aiinput=aiinput&aifgui(aiint(aifgu))
if aiint(aiflen)>0 then
aiinput=aiinput&" maxlength="""&aiflen&""""
g_str=g_str&"(长度<"&aiflen&")"
end if
if aiftit<>"" then
if g_str<>"" then
aiinput=aiinput&" title="""&aiftit&vbCrLf&g_str&""""
else
aiinput=aiinput&" title="""&aiftit&""""
end if
aiinput=aiinput&" placeholder="""&aiftit&""""
else
if g_str<>"" then
aiinput=aiinput&" title="""&g_str&""""
end if
end if
if aistr(aifcss)<>"" then
dim aifcssrr,aifcssii
aifcssrr=split(aifcss,"|")
if ubound(aifcssrr)=0 then
aiinput=aiinput&" class="""&aifcssrr(0)&""""
elseif ubound(aifcssrr)=2 then
aiinput=aiinput&" class="""&aifcssrr(0)&""" onclick=""this.className='"&aifcssrr(1)&"';"
if aifgu=99 then aiinput=aiinput&"FTM("&aifname&");"
aiinput=aiinput&""" onBlur=""this.className='"&aifcssrr(2)&"';"""
else
if aifgu=99 then aiinput=aiinput&" onclick=""FTM("&aifname&");"""
end if
end if
if aifgu=99 and not ainull(aifstr) then
aifstr=aitmx(aifstr,99)
end if
aiinput=aiinput&" value="""&aifstr&""" />"
End Function
'-----------------------------------
'select sn read ~
'=aisro(aifty,aifstr)
'-----------------------------------
Function aisro(aifty,aifstr)
if aifty=1 then
aisro=split(aifstr&"~","~")(1)
else
aisro=split(aifstr&"~","~")(0)
end if
End Function
'-----------------------------------
'select sn read
'=aisrd(aifsn,aifstr)
'-----------------------------------
Function aisrd(aifsn,aifstr)
if instr(aifstr,"~")>0 then
dim aisdll,aisdub
aisdll=split(split(aifstr,"~"&aifsn)(0),"|")
aisdub=ubound(aisdll)
aisrd=aisdll(aisdub)
else
aisrd=split(aifstr,"|")(aiint(aifsn))
end if
End Function
'-----------------------------------
'PS:select
'=aiselect("aifname","100%/220px","aiftit","aifcss","aifstr","fc0|fc1|fc2","option0|option1|option2")
'-----------------------------------
Function aiselect(aifname,aifwid,aiftit,aifcss,aifstr,aivalues,aioptions)
if aifstr="" and aireq(aifname)<>"" then aifstr=aireq(aifname)
aiselect="<select id="""&aifname&""" name="""&aifname&""""
if aistr(aifwid)<>"" then aiselect=aiselect&" style=""width:"&aifwid&";"""
if aiftit<>"" then aiselect=aiselect&" title="""&aiftit&""""
if aistr(aifcss)<>"" then aiselect=aiselect&" class="""&aifcss&""""
aiselect=aiselect&">"
dim aisii,aislrr,aisorr,aisorru
aisorr=split(aioptions,"|")
aisorru=ubound(aisorr)
if aibj(aivalues,"0") or ainull(aivalues) then'0 auto number=0 to i
'----------sys select 0
for aisii=0 to aisorru
aislrr=split(aisorr(aisii)&"~"&aisii,"~")
aiselect=aiselect&"<option value="""&aislrr(1)&""""
if aibj(aislrr(1),aifstr) then
aiselect=aiselect&" selected=""selected"""
end if
aiselect=aiselect&">"&aislrr(0)&"</option>"
next
'----------sys select 1
else
dim aisjj,aisll,aisvrr,aisvrru
aisvrr=split(aivalues,"|")
aisvrru=ubound(aisvrr)
if aisvrru>=aisorru and instr(aisorru,"~")=0 then
'----------sys select 0
for aisii=0 to aisorru
aiselect=aiselect&"<option value="""&aisvrr(aisii)&""""
if aibj(aisvrr(aisii),aifstr) then
aiselect=aiselect&" selected=""selected"""
end if
aiselect=aiselect&">"&aisorr(aisii)&"</option>"
next
'----------sys select 1
else
for aisjj=0 to aisvrru
aisll=aisvrr(aisjj)
if not ainull(aisll) then
'----------sys select 0
for aisii=0 to aisorru
aislrr=split(aisorr(aisii)&"~"&aisii,"~")
if aibj(aisll,aislrr(1)) then
aiselect=aiselect&"<option value="""&aisll&""""
if aibj(aisll,aifstr) then
aiselect=aiselect&" selected=""selected"""
end if
aiselect=aiselect&">"&aislrr(0)&"</option>"
end if
next
'----------sys select 1
end if
next
end if
end if
aiselect=aiselect&"</select>"
End Function
'-----------------------------------
'PS:button
'=aibuttonk(aifurl,aibts,aifname,aifwid,aifcss,aifstr)
'-----------------------------------
Function aibuttonk(aifurl,aibts,aifname,aifwid,aifcss,aifstr)
if left(aifurl,1)="+" then
aibuttonk="<input type=""submit"" onclick=""{if(confirm('"&aibts&"\nYes,Go; No,Back.')){this.document."&replace(aifurl,"+","")&".submit();return true;}return false;}"""
elseif aistr(aibts)="" and aistr(aifurl)<>"" then
aibuttonk="<input type=""button"" onclick=""javascript:window.location.href='"&aifurl&"';"""
elseif aistr(aibts)<>"" and aistr(aifurl)<>"" then
aibuttonk="<input type=""button"" onclick=""{if(confirm('"&aibts&"\nYes,Go; No,Back.')){javascript:window.location.href='"&aifurl&"';return true;}return false;}"""
elseif aistr(aibts)<>"" then
aibuttonk="<input type=""button"" onclick=""{if(confirm('"&aibts&"\nThis just explain.')){return true;}return false;}"""
end if
if aistr(aifname)<>"" then aibuttonk=aibuttonk&" name="""&aifname&""" id="""&aifname&""""
if aistr(aifwid)<>"" then aibuttonk=aibuttonk&" style=""width:"&aifwid&";"""
if aistr(aifcss)<>"" then aibuttonk=aibuttonk&" class="""&aifcss&""""
aibuttonk=aibuttonk&" value="""&aifstr&""">"
End Function
'-----------------------------------
'PS:button
'=aibutton(0=button/1=reset/2=submit,"aifname","100%/220px","aifcss","aifstr")
'-----------------------------------
Function aibutton(aifty,aifname,aifwid,aifcss,aifstr)
if aiint(aifty)=0 then
aibutton="<button"
elseif aiint(aifty)=1 then
aibutton="<input type=""reset"""
elseif aiint(aifty)=2 then
aibutton="<input type=""submit"""
end if
if aistr(aifname)<>"" then aibutton=aibutton&" name="""&aifname&""" id="""&aifname&""""
if aistr(aifwid)<>"" then aibutton=aibutton&" style=""width:"&aifwid&";"""
if aistr(aifcss)<>"" then aibutton=aibutton&" class="""&aifcss&""""
if aiint(aifty)=0 then
aibutton=aibutton&">"&aifstr&"</button>"
else
aibutton=aibutton&" value="""&aifstr&""">"
end if
End Function
'-----------------------------------
'PS:iframe
'=aiiframe("aifstr","aifname","100%/220px","100%/220px")
'-----------------------------------
Function aiiframe(aifstr,aifname,aifwid,aifhei)
aiiframe="<iframe border=""0"" name="""&aifname&""" src="""&aifstr&""" allowtransparency=""true"" style=""background-color:transparent"" frameborder=""0"" width="""&aifwid&""" height="""&aifhei&""" scrolling=""auto""></iframe>"
End Function
'-----------------------------------
'PS:alert
'=aigo("aifstr","aifurl")
'-----------------------------------
Function aigo(aifstr,aifurl)
aigo="<script language=javascript>"
if aifurl="0" then
aigo=aigo&"alert('"&aifstr&"');"
elseif aifurl="1" then
aigo=aigo&"alert('"&aifstr&"');history.go(-1);"
elseif aifstr="0" or aifstr="" then
aigo=aigo&"top.location='"&aifurl&"';"
else
aigo=aigo&"if(confirm("""&aifstr&""")){window.location.href="""&aifurl&"""}else{window.history.back(-1);}"
end if
aigo=aigo&"</script>"
End Function
'-----------------------------------
'PS:div refresh
'=aitiao("aifstr","aifurl",10)
'-----------------------------------
Function aitiao(aifstr,aifurl,aitime)
aitiao="<meta http-equiv=""page-Exit"" content=""revealTrans(Duration=1,Transition=23)""><meta http-equiv=""refresh"" content="""&aitime&";url="&aifurl&""">"
if aitime mod 2=0 then
aitiao=aitiao&"<div class=""aitiao"">"
else
aitiao=aitiao&"<div class=""aitiaox"">"
end if
aitiao=aitiao&""&aifstr&"<br><a href="&aifurl&">自动跳转需等待 "&aitime&" 秒或点击这里现在就跳！</a></div>"
End Function
'-----------------------------------
'PS:div refresh
'=aitbox("aifstr","aifurl",10)
'-----------------------------------
Function aitbox(aifstr,aifurl,aitime)
aitbox="<meta http-equiv=""page-Exit"" content=""revealTrans(Duration=1,Transition=23)""><meta http-equiv=""refresh"" content="""&aitime&";url="&aifurl&""">"
aitbox=aitbox&"<script language=""javascript"">function aibox(){var aiboxdiv=document.getElementById(""aitbox"");aiboxdiv.style.display=""none"";}setTimeout(""aibox()"",3000);</script><div id=""aitbox"" class=""aitbox"">"&aifstr&"</div>"
End Function
'-----------------------------------
'PS:ajax show
'=aiajax(aifty=0/start|1~,aiftm/2s,aifurl/ajax-url,aifid/div id,aifcss/css,aifhtm/html~)
'-----------------------------------
function aiajax(aifty,aiftm,aifurl,aifid,aifcss,aifhtm)
aiajax=""
if aifty=0 then
aiajax=aiajax&"<script language=""JavaScript"">"
aiajax=aiajax&"function AiXhp(AXDurl){var AsaiXml;if(window.ActiveXObject){AsaiXml=new ActiveXObject(""Microsoft.XMLHTTP"");}else if(window.XMLHttpRequest){AsaiXml=new window.XMLHttpRequest();}AsaiXml.open(""POST"",AXDurl,false);AsaiXml.send(null);return unescape(AsaiXml.responseText);}"
aiajax=aiajax&"</script>"
end if
aiajax=aiajax&"<script language=""JavaScript"">"
aiajax=aiajax&"var AsaiX"&aifid&"X;window.setInterval(""AsaiA"&aifid&"A('"&aifid&"','"&aifurl&"');"","&int(aiftm*1000)&");function AsaiA"&aifid&"A(AXDid,AXDurl){var AsaiY"&aifid&"Y=AiXhp(AXDurl);"
if aifcss<>"" then
aiajax=aiajax&"if(AsaiX"&aifid&"X==AsaiY"&aifid&"Y){document.getElementById(AXDid).innerHTML=AsaiX"&aifid&"X;}else{AsaiX"&aifid&"X=AsaiY"&aifid&"Y;document.getElementById(AXDid).innerHTML=""<font class="&aifcss&">""+AsaiX"&aifid&"X+""</font>"";}"
else
aiajax=aiajax&"document.getElementById(AXDid).innerHTML=AsaiY"&aifid&"Y;"
end if
aiajax=aiajax&"}"
aiajax=aiajax&"</script>"
aiajax=aiajax&aifhtm
end function
'-----------------------------------
'PS:media play
'=aiplay("aifstr","100%/220","220")
'-----------------------------------
Function aiplay(aifstr,aifwid,aifhei)
Dim aizhui,aizhuis,aifwidd
If aifstr<>"" Then
aizhui=LCase(Mid(aifstr,InStrRev(aifstr,".")+1))
Else
aizhui=""
End If
if aifwid<>"" and aifwid<>"0" then
if right(aifwid,1)="%" then
aifwidd=" width="""&aifwid&""""
aifwid=" width="""&aifwid&""""
else
aifwidd=" onload='javascript:if(this.width>"&aifwid&"){this.width="&aifwid&"}'"
aifwid=" width="""&aifwid&""""
end if
else
aifwidd=""
aifwid=" width="""&g_vdw&""""
end if
if aifhei<>"" and aifhei<>"0" then
aifhei=" height="""&aifhei&""""
else
aifhei=" height="""&g_vdh&""""
end if
aizhuis="jpg,jepg,gif,png,bmp,avi,wmv,asf,mp3,wma,mpg,mpeg,mp4,3gp,ram,ra,rmvb,rm,swf,flv"
If Instr(aizhuis,aizhui)=0 Then
aiplay="<a href="""&aifstr&""" target=""_blank"">"&aifstr&"</a>"
Else
Select Case aizhui
Case "jpg","jepg","gif","png","bmp"
aiplay="<img"&aifwidd&" src="""&aifstr&""">"
Case "mp3"
aiplay="<audio autoplay=""autoplay"" src="""&aifstr&""" id=""audio"" controls><a href="""&aifstr&""" target=""_blank"">出现兼容问题，请切换其他浏览器重试，或点此下载到本地浏览。</a></audio>"
Case "avi","mpg","mpeg","mp4","3gp","wmv","asf","wma"
aiplay="<object"&aifwid&aifhei&" classid=""CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"">"&_
VbCrlf&"<param name=""url"" value="""&aifstr&""" />"&_
VbCrlf&"<a href="""&aifstr&""" target=""_blank"">提示：出现兼容问题，请切换其他浏览器（如IE）重试，或点此下载到本地浏览。</a></object>"
Case "rm","ra","ram","rmvb"
aiplay="<OBJECT"&aifwid&aifhei&" classid=clsid:CFCDAA03-8BE4-11cf-se84B-0020AFBBCCFA>"&_
VbCrlf&"<PARAM NAME=""_ExtentX"" VALUE=""12700"">"&_
VbCrlf&"<PARAM NAME=""_ExtentY"" VALUE=""9525"">"&_
VbCrlf&"<PARAM NAME=""AUTOSTART"" VALUE=""-1"">"&_
VbCrlf&"<PARAM NAME=""SHUFFLE"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""PREFETCH"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""NOLABELS"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""SRC"" VALUE="""&aifstr&""">"&_
VbCrlf&"<PARAM NAME=""CONTROLS"" VALUE=""ImageWindow"">"&_
VbCrlf&"<PARAM NAME=""CONSOLE"" VALUE=""Clip"">"&_
VbCrlf&"<PARAM NAME=""LOOP"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""NUMLOOP"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""CENTER"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""MAINTAINASPECT"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""BACKGROUNDCOLOR"" VALUE=""#000000"">"&_
VbCrlf&"</OBJECT>"&_
VbCrlf&"<BR>"&_
VbCrlf&"<OBJECT"&aifwid&" height=66 classid=clsid:CFCDAA03-8BE4-11cf-se84B-0020AFBBCCFA>"&_
VbCrlf&"<PARAM NAME=""_ExtentX"" VALUE=""12700"">"&_
VbCrlf&"<PARAM NAME=""_ExtentY"" VALUE=""847"">"&_
VbCrlf&"<PARAM NAME=""AUTOSTART"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""SHUFFLE"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""PREFETCH"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""NOLABELS"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""CONTROLS"" VALUE=""ControlPanel,StatusBar"">"&_
VbCrlf&"<PARAM NAME=""CONSOLE"" VALUE=""Clip"">"&_
VbCrlf&"<PARAM NAME=""LOOP"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""NUMLOOP"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""CENTER"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""MAINTAINASPECT"" VALUE=""0"">"&_
VbCrlf&"<PARAM NAME=""BACKGROUNDCOLOR"" VALUE=""#000000"">"&_
VbCrlf&"</OBJECT>"
Case "swf","flv"
aiplay="<embed src="""&aifstr&""" allowFullScreen=""true"" quality=""high"""&aifwid&aifhei&" align=""middle"" allowScriptAccess=""always"" type=""application/x-shockwave-flash""></embed>"
End Select
End If
End Function
'---------------------
'asai email
'=aiemail()
'-----------------------------------
'Response.Write aiemail(g_emkg,g_emci,g_emrp,"asait@qq.com","","","","标题1",0,"内容","","返回信息")
'aiemail(发邮件开关,可发送次数,回复邮箱,收件人邮箱,暗抄送邮箱,抄送邮箱,邮件编码,发件标题,发件类型,发件内容,附件信息,发件返回的信息)
Function aiemail(emfxkg,emfxci,emfxrp,emfxto,emfxbc,emfxcc,emfxch,emfxbt,emfxty,emfxnr,emfxup,emfxss)
if emfxkg=1 then
dim emdci
emfxci=int(emfxci)
if emfxci<1000 then
if request.Cookies(g_emck)<>"" then
emdci=int(request.Cookies(g_emck))
else
emdci=emfxci
end if
if emdci>0 then response.Cookies(g_emck)=emdci-1
else
emdci=emfxci
end if
if emdci>0 then
if emdci<emfxci then emfxss=emfxss&"<p>特别提示：已发送<b>"&emfxci-emdci&"</b>次，还能发送<b>"&emdci&"</b>次。</p>"
aiemail=aiem(g_emfw,g_emzh,g_emmm,g_emfr,emfxrp,emfxto,emfxbc,emfxcc,emfxch,emfxbt,emfxty,emfxnr,emfxup,emfxss)
else
aiemail="<p>使用邮件系统发送邮件次数已超限制(最多发送<b>"&emfxci&"</b>次)！</p>"
end if
else
aiemail="<p>邮件发送系统已经关闭！</p>"
end if
End Function
'Response.Write aiem(g_emfw,g_emzh,g_emmm,g_emfr,g_emrp,"asait@qq.com","","","","标题1",0,"内容","","返回信息")
'aiem(发送邮件的SMTP,发送邮件邮箱登录名,发送邮件登录密码,发送邮件邮箱,回复邮箱,收件人邮箱,暗抄送邮箱,抄送邮箱,邮件编码,发件标题,发件类型,发件内容,附件信息,发件返回的信息)
Function aiem(emfxfw,emfxzh,emfxmm,emfxfr,emfxrp,emfxto,emfxbc,emfxcc,emfxch,emfxbt,emfxty,emfxnr,emfxup,emfxss)
aiem=""
Dim AM_sch,AM_cdocf,AM_cdoms,AM_fds,AM_srr,AM_sii
AM_sch="http://schemas.microsoft.com/cdo/configuration/"
Set AM_cdocf=Server.CreateObject("CDO.Configuration")
Set AM_fds=AM_cdocf.Fields
If Err.Number=0 Then
  '本地服务器发送示例
  'With AM_fds
  '.Item(AM_sch&"sendusing")=2 
  '.Item(AM_sch&"smtpserver")="127.0.0.1"'本地服务器地址
  '.Item(AM_sch&"smtpserverport")=25'SMTP服务器端口
  '.Item(AM_sch&"smtpconnectiontimeout")=10'连接超时S秒
  '.Item(AM_sch&"smtpauthenticate")=1
  '.Update 
  'End With
  '其他邮件服务器发送示例
  With AM_fds
  .Item(AM_sch&"smtpserver")=emfxfw'改成可用的外部邮件服务器域名
  .Item(AM_sch&"sendusername")=emfxzh'以上服务器的用户名
  .Item(AM_sch&"sendpassword")=emfxmm'密码
  .Item(AM_sch&"sendusing")=2'使用网络上的SMTP服务器而不是本地的SMTP服务器 
  .Item(AM_sch&"smtpserverport")=465'SMTP服务器端口，默认是25，阿里云为465
  .Item(AM_sch&"smtpconnectiontimeout")=10'连接超时S秒
  .Item(AM_sch&"smtpauthenticate")=1'服务器认证方式 
  .Item(AM_sch&"smtpusessl")=True'是否使用SSL 
  .Update
  End With
Set AM_cdoms=Server.CreateObject("CDO.Message")
Set AM_cdoms.Configuration=AM_cdocf
If Err.Number=0 Then
emfxfr=aiemck(emfxfr)
emfxrp=aiemck(emfxrp)
emfxto=aiemck(emfxto)
emfxbc=aiemck(emfxbc)
emfxcc=aiemck(emfxcc)
if emfxty<>"" then
emfxty=int(emfxty)
else
emfxty=0
end if
if emfxup<>"" then emfxup=replace(replace(emfxup,"，",","),"|",",")
  With AM_cdoms
  if emfxch<>"" then .BodyPart.Charset=emfxch'邮件编码如：utf-8,GB2312
  .From=emfxfr'发件人的地址（要和上面的邮件系统相同）
  .To=emfxto'改成接收者的邮件地址
  aiem=aiem&"<p>收件邮箱：<b>"&replace(emfxto,",","<br>")&"</b></p>"
  if emfxbc<>"" then .Bcc=emfxbc'BCC英文全称是 Blind Carbon Copy(暗抄送)BCC栏中的收件人可以看到所有的收件人名(TO,CC,BCC)，TO和CC栏中的收件人看不到BBC的收件人名
  if emfxcc<>"" then'CC 英文全称是 Carbon Copy(抄送)
  .CC=emfxcc
  aiem=aiem&"<p>抄送邮箱：<b>"&replace(emfxcc,",","<br>")&"</b></p>"
  end if
  if emfxrp<>"" then'回复人邮件地址
  .ReplyTo=emfxrp
  aiem=aiem&"<p>回件邮箱：<b>"&replace(emfxrp,",","<br>")&"</b></p>"
  end if
  .Subject=emfxbt'标题
  if emfxty=2 then
  .CreateMHTMLBody emfxnr'发送网页
  elseif emfxty=1 then
  .HtmlBody=emfxnr'html正文
  else
  .TextBody=emfxnr'文本正文
  end if
  if emfxup<>"" then'邮件附件，重复多次即可添加多个文件。
  AM_srr=split(emfxup,",")
  for AM_ii=0 to ubound(AM_srr)
  if AM_srr(AM_ii)<>"" then .AddAttachment AM_srr(AM_ii)
  next
  end if
  .Send
  End With
if emfxss<>"" then aiem=emfxss&aiem
If Err.Number=0 Then
aiem="<h3>邮件发送成功</h3>"&aiem
Else
Err.Clear
aiem="<h3>邮件发送失败</h3><p>可能原因：<br>请将以下官方邮箱加入您的邮箱白名单<br><b>"&emfxfr&"</b><br>收件邮箱地址有错误；<br>空间不支持CDO邮件组件；<br>SMTP配置有误；<br>当前时段发送邮件超出限额，SMTP临时关闭。</p>"&aiem
end if
Else
Err.Clear
aiem=aiem&"<p>对不起，邮件发送失败！<br>CDO.Message组件加载失败，请联系管理员处理。</p>"
end if
Set AM_cdoms=Nothing
Else
Err.Clear
aiem=aiem&"<p>对不起，邮件发送失败！<br>CDO.Configuration组件加载失败，请联系管理员处理。</p>"
end if
Set AM_fds=Nothing
Set AM_cdocf=Nothing
End Function
'aiemck(emfstr)判断邮箱地址是否正确
Function aiemck(emfstr)
aiemck=""
emfstr=replace(replace(replace(emfstr,"，",","),"|",",")," ","")'替换，|并清除空格
dim aidemrr,aidemrr1
aidemrr=Split(emfstr,"@")
if ubound(aidemrr)>0 then
aidemrr1=split(aidemrr(1),".")
if ubound(aidemrr1)>0 then
if len(aidemrr1(0))>0 and len(aidemrr1(1))>1 then
aiemck=emfstr
end if
end if
end if
End Function



'PR-ai----------0
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
'PS:same as md5
'=aimm(g_gmm,"aifstr",0=add/1=open)
'-----------------------------------
Function aimm(aifkey,aifstr,aifty)
aimm=""
If aifstr="" or IsNull(aifstr) Then
Exit Function
else
dim aimdss,aimdnz,aimdni,amdnlen,aimdnlenx,aimdna,aimdnb,aimdn0,aimdn1
aimdnlenx=len(aifkey)
aimdnz=aimdnlenx*100
amdnlen=len(aifstr)
aimdna=amdnlen+7
for aimdni=1 to amdnlen
aimdss=mid(aifstr,aimdni,1)
aimdnb=instr(aifkey,aimdss)
if aimdnb=0 then
aimm=aimm&aimdss
elseif aifty=0 then'add
aimdn0=aimdna+aimdnb+aimdni
aimdn0=aimdn0 mod aimdnlenx
if aimdn0=0 then aimdn0=aimdnlenx
aimm=aimm&mid(aifkey,aimdn0,1)
elseif aifty=1 then'open
aimdn1=aimdnz+aimdnb-aimdni-aimdna
aimdn1=aimdn1 mod aimdnlenx
if aimdn1=0 then aimdn1=aimdnlenx
aimm=aimm&mid(aifkey,aimdn1,1)
end if
next
end if
End Function
'-----------------------------------
'PS:only font
'=aizi(aifstr)
'-----------------------------------
function aizi(aifstr)
aizi=trim(aifstr)
dim ainrex
Set ainrex=New RegExp 
ainrex.Pattern="[^\a-\z\A-\Z0-9\u4E00-\u9FA5]"
ainrex.IgnoreCase=True 
ainrex.Global=True 
aizi=ainrex.Replace(aizi,"")
end function
'-----------------------------------
'PS:get user ip
'=aiip()
'PS:read ip Address
'=aiipm()
'PS:read ip Address(have link on)
'=aiipr("aifstr","aifcss",0=all/1=all+link/>1=chr num)
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
Function aiipm(aifstr)
if aifstr<>"" and aifstr<>"::1" and aifstr<>"127.0.0.1" then
aiipm=split(aihttp("http://www.baidu.com/s?tn=guoyansai_pg&wd="&aifstr,"utf-8"),"来&nbsp;&nbsp;&nbsp;自:&nbsp;<strong>")(1)
aiipm=split(aiipm,"</strong>")(0)
aiipm=trim(replace(aiipm,"电信",""))
aiipm=trim(replace(aiipm,"联通",""))
aiipm=trim(replace(aiipm,"移动",""))
else
aiipm=""
end if
End Function
'-----------------------------------
Function aiipr(aifstr,aifcss,aifty)
if aifstr="" or aifstr="::1" or aifstr="127.0.0.1" then
aiipr=""
else
dim aiips
aiips=aiipm(aifstr)
if aifty>0 then
aiipr="<a href=""http://www.baidu.com/s?tn=guoyansai_pg&wd="&aifstr&""" target=""_blank"""
if aifcss<>"0" and aifcss<>"" then aiipr=aiipr&" class='"&aifcss&"'"
aiipr=aiipr&" title="""&aiips&""">"
if aifty=1 then
aiipr=aiipr&aiips
else
aiipr=aiipr&left(aiips,aifty)
if len(aiips)>aifty then aiipr=aiipr&".."
end if
aiipr=aiipr&"</a>"
else
aiipr=aiips
end if
end if
End Function
'PR-ai----------1
%>