<%
const g_err=0'调试开关-0关闭调试|1开启调试|2高级调试*是否开启调试功能.
const g_sn="asai"'特殊标识:系统特殊标示.
const g_mtm=3'跳转等待时间，单位秒S
const g_gmm="Gys.Z1nHdFYefo@Q2pqrxUAjBI~WzCwEaRtSc9Kh=TkP6XiJNuOMv5_0D3Vg4b7mL8l-"'密钥字串:系统密钥字符设置一经启用谨慎修改.
dim u_ur,u_qx,g_qx,g_sqln,adostr,conn,sql,rs,aiTF,airr,aii,aiu,ailin,saiarr,saii,saij,saikt,saikp,saipr,saipg,saips,saipz
dim g_mx,g_mz,g_mt,g_mk,g_mc,g_mp,g_ma,g_ml
g_mx=false
g_sqln=0
g_qx=false
'-----------------------------------
'read url
'-----------------------------------
dim g_ur,g_urs,g_urr,g_url,g_u0,g_u1,g_u2,g_u3,g_u4,g_u5,g_u6,g_uwww,g_uww,g_uid,g_ukrr,g_uk0,g_uk1,g_uk2,g_uk3
'g_uwww=Request.ServerVariables("SERVER_NAME")'不带端口号
g_uwww=Request.ServerVariables("HTTP_HOST")
g_ur="http://"&g_uwww&replace(replace(Request.ServerVariables("URL"),"default.asp",""),"Default.asp","")
if right(g_ur,1)<>"/" then  g_ur=g_ur&"/"
g_url=g_ur
g_urs=Request.ServerVariables("QUERY_STRING")
if g_urs<>"" then
g_url=g_url&"?"&g_urs
g_urr=split(aijie(replace(g_urs,".html",""))&"////////","/")
g_u0=g_urr(0)
g_u1=g_urr(1)
g_u2=g_urr(2)
g_u3=g_urr(3)
g_u4=g_urr(4)
g_u5=g_urr(5)
g_u6=g_urr(6)
end if

'-----------------------------------
'JS go
'-----------------------------------
Function aimeta(aifstr,aifurl)
aimeta="<script>function asaigobgt(){location.replace("""&aifurl&""");}setTimeout('asaigobgt()',"&g_mtm*1000&");</script>"
aimeta=aimeta&"<p align=center>"&aifstr&"<br><a href="&aifurl&">请等待 "&g_mtm&" 秒后自动跳转,或点击这里即时跳转!</a></p>"
End Function
'-----------------------------------
'ainullx()
'-----------------------------------
Function ainullx(aifstr,aifsmx)
if ainull(aifstr) or aibj(aifstr,aifsmx) then
ainullx=true
else
ainullx=False
end if
End Function
'-----------------------------------
'ainull()
'-----------------------------------
Function ainull(aifstr)
if trim(aifstr)="" or lcase(aifstr)="null" then
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
'---------------------------
'err write
'---------------------------
Sub aierr(aifty,aifstr)
if g_err>0 then
if aifty=1 then
Response.Write "<b>"&timer&"</b>：<br><u>"&aifstr&"</u><br>"
elseif aifty=2 then
if g_qx or g_err>1 then Response.Write "<b>"&timer&"</b>：<br><u>"&aifstr&"</u><br>"
else
g_sqln=g_sqln+1
Response.Write "<b>"&g_sqln&"</b>、<i>"&timer&"</i>：<u>"&aifstr&"</u><br>"
end if
end if
End Sub
'---------------------------
'aiint(122)&aiint(s22|0)
'---------------------------
Function aiint(aifstr)
dim aiintdrr,aiintdstr,aiintdmo
aiintdrr=split(trim(aifstr)&"|","|")
aiintdstr=trim(aiintdrr(0))
aiintdmo=aiintdrr(1)
if not isNumeric(aiintdmo) then
aiintdmo=0
else
aiint=int(aiintdmo)
end if
if isNumeric(aiintdstr) then
aiint=int(aiintdstr)
else
aiint=aiintdmo
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
aitm=aiint(aitm)
end if
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
'PS:read db data
'=airso("aifstr")
'-----------------------------------
Function airso(aifstr)
if aifstr="0" then
airso=""
else
airso=aifstr
end if
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
dim aiarrdlrr,aiarrdlrrr,aiarrdlmd
aiarrdlmd=instr(aifstr,"="&aifty)
if aiarrdlmd>1 then
aiarrdlrr=split(aifstr,"="&aifty)
aiarrdlrrr=split(aiarrdlrr(0),"|")
aiarr=aiarrdlrrr(ubound(aiarrdlrrr))
else
aiarrdlrr=split(aifstr,aifge)
if ubound(aiarrdlrr)>=aiint(aifty) then
aiarr=aiarrdlrr(aiint(aifty))
else
aiarr=aiarrdlrr(ubound(aiarrdlrr))
end if
end if
end if
End Function
'-----------------------------------
'PS:Judge the same
'=aibj("aifstr","aifstr")
'-----------------------------------
Function aibj(aifstr,aifstrs)
aibj=false
if lcase(trim(aifstr))=lcase(trim(aifstrs)) then aibj=true
End Function
'-----------------------------------
'PS:make option
'=aisel(aifqx,aifstr,aifge,aifty)
'-----------------------------------
Function aisel(aifqx,aifstr,aifge,aifcs)
aisel=""
if aifstr<>"" then
dim aisdrr,aisdru,aisdri,aisdrl,aisdrlr,aisdrlz
aisdrr=split(aifstr,aifge)
aisdru=ubound(aisdrr)
for aisdri=0 to aisdru
aisdrl=aisdrr(aisdri)
if not aibj(left(aisdrl,1),"*") or aifqx then
if instr(aisdrl,"=")>0 then
aisdrlr=split(aisdrl,"=")
aisdrl=aisdrlr(0)
aisdrlz=aisdrlr(1)
else
aisdrlz=aisdri
end if
aisel=aisel&"<option value="""&aisdrlz&""""
if aibj(aifcs,aisdrlz) then aisel=aisel&" selected"
aisel=aisel&">"&aisdrl&"</option>"
end if
next
end if
End Function

'---------------------------
'request check
'---------------------------
Function aick(aifty)
dim aiclin
if aifty=0 then
Randomize
aiclin=aiint(Session("aick"))
if aiclin=0 then
aiclin=int(100*Rnd)+int(second(now()))+1
Session("aick")=aiclin
end if
aick="<input type=hidden name="&g_sn&" value="&aiclin&">"
else
aiclin=aiint(aireq(g_sn))
if aiclin>0 and g_qx then
aick=true
else
if aiclin>0 and aiclin=aiint(Session("aick")) then
Session("aick")=""
aick=true
else
aick=false
end if
end if
end if
End Function
'---------------------------
'request
'---------------------------
Function aireq(aifnm)
if aifnm<>"" then
aireq=request(aifnm)
if trim(aireq)="" or replace(aireq,", ","")="" then aireq=0
else
aireq=0
end if
End Function
'---------------------------
'request to value
'---------------------------
Function aireqr(aiflie,aiflq)
dim ardrr,ardii,ardlin
ardrr=split(aiflie,",")
for ardii=0 to ubound(ardrr)
ardlin=aireq(replace(ardrr(ardii),aiflq,""))
Execute(ardrr(ardii)&"=ardlin")
next
End Function
'---------------------------
'no-html
'---------------------------
Function aistr(aifstr)
if trim(aifstr)="" or aifstr="0" or replace(aifstr,", ","")="" then
aistr=0
elseif aifstr<>"" then
dim airex
Set airex=new RegExp
airex.IgnoreCase=true
airex.Global=True
airex.Pattern="(\<.[^\<]*\>)"
aifstr=airex.replace(aifstr,"")
airex.Pattern="(\<\/[^\<]*\>)"
aifstr=airex.replace(aifstr,"")
set airex=nothing
if aifstr="" then aifstr=0
aistr=aifstr
else
aistr=0
end if
End Function
'-----------------------------------
'conn
'-----------------------------------
Sub aiconn(aikty)
if aikty="0" then
conn.Close
Set conn=Nothing
else
if aikty="1" then
adostr=Application("gconn")
else
adostr=aikty
end if
Set conn=Server.CreateObject("ADODB.CONNECTION")
if g_err>0 then Call aierr(0,adostr)
conn.open adostr
end if
End Sub
'-----------------------------------
'PS:make arr str
'=saixrr(0clear vbcrlf|1replace vbcrlf|2+replace|>9get top font","gyskstr")
'-----------------------------------
Function saixrr(gyskty,gyskstr)
if gyskstr="" then
saixrr=""
else
saixrr=gyskstr
dim saixdl
saixdl=""
if gyskty=0 or gyskty>9 then
if saixrr<>"" then saixrr=Replace(saixrr,VbCrlf,"")
if saixrr<>"" then saixrr=Replace(saixrr,CHR(10),"")
if saixrr<>"" then saixrr=Replace(saixrr,CHR(13),"")
if gyskty>9 then
if saixrr<>"" then saixrr=Replace(aistr(saixrr)," ","")
if saixrr<>"" then saixrr=left(saixrr,gyskty)
end if
else
saixdl="<bR />"
if gyskty=1 or gyskty=3 then
if saixrr<>"" then saixrr=Replace(saixrr,VbCrlf,saixdl)
if saixrr<>"" then saixrr=Replace(saixrr,CHR(10),saixdl)
if saixrr<>"" then saixrr=Replace(saixrr,CHR(13),saixdl)
if gyskty=3 and saixrr<>"" then saixrr=Replace(saixrr,"""","""""")
else
if saixrr<>"" then saixrr=Replace(saixrr,saixdl,VbCrlf)
end if
end if
end if
end Function
'-----------------------------------
'PS:make arr str ""-"
'=saixrrr(0,"gyskstr")
'-----------------------------------
Function saixrrr(gyskty,gyskstr)
if ainull(gyskstr) and gyskty=0 then
saixrrr=""
else
saixrrr=gyskstr
saixrrr=saixrr(gyskty,gyskstr)
if saixrrr<>"" then saixrrr=Replace(saixrrr,"""","""""")
saixrrr=trim(saixrrr)
end if
end Function
'---------------------------
'列表
'saiarr=sailist("ai_id","ai_id,ai_bt,ai_nr,ai_ur,ai_ep,ai_ef,ai_cs,ai_us,ai_hi,ai_xi,ai_yi,ai_kg,ai_tm,ai_xy","zhi_ai","ai_xy>0","ai_id desc",1,20)
'IF IsArray(saiarr) THEN
'For saii=0 To UBound(saiarr,2)
'For saij=0 To UBound(saiarr,1)
'Response.Write saiarr(saij,saii)&"　，　"
'Next
'Next
'Response.Write "record="&saipr&"|page="&saipg&"|pagesize="&saips&"|pagecount="&saipz
'Response.Write saipage("","",saipr,saipg,saips,saipz)
'ELSE
'Response.Write "null"
'END IF
'---------------------------
Function sailist(gyskid,gyskl,gyskb,gyskt,gyskp,gyskpg,gyskps)
sailist=""
if gyskt<>"" then gyskt=" where "&gyskt
if gyskp<>"" then gyskp=" order by "&gyskp
if instr(gyskp,gyskid)=0 then gyskp=gyskp&","&gyskid&" desc"
if gyskps="" or not isnumeric(gyskps) or gyskps="0" then:saips=20:else:saips=aiint(gyskps):end if'get pagesize
sql="SELECT COUNT("&gyskid&") FROM "&gyskb&gyskt
if g_err>0 then Call aierr(0,sql)
saipr=aiint(conn.Execute(sql).getstring)'get record
if saipr>saips then
saipz=saipr mod saips
if saipz>0 then
saipz=int(saipr/saips)+1
else
saipz=int(saipr/saips)
end if
else
saipz=1
end if'get pagecount
if gyskpg="" or not isnumeric(gyskpg) or gyskpg="0" then:saipg=1:else:saipg=aiint(gyskpg):end if
if saipg>saipz then saipg=saipz'get page
if saipg=1 then
sql="select top "&saips&" "&gyskl&" from "&gyskb&gyskt&gyskp
else
if 1=1 then
'方法一
dim sql1,rs1,saidlrr,saidlru,saidlid
sql1="select top "&int(saipg*saips)&" "&gyskid&" from "&gyskb&gyskt&gyskp
if g_err>0 then Call aierr(0,sql1)
set rs1=server.CreateObject("adodb.recordset")
rs1.open sql1,conn,1,1
if rs1.eof and rs1.bof then
saidlrr=""
else
saidlrr=rs1.GetRows
end if
rs1.close
set rs1=nothing
IF IsArray(saidlrr) THEN
saidlru=UBound(saidlrr,2)
saidlid=saidlrr(0,saidlru)
For saii=saidlru-saips+1 To saidlru-1
saidlid=saidlrr(0,saii)&","&saidlid
Next
END IF
if g_err>0 then Call aierr(2,saidlid)
sql="select top "&saips&" "&gyskl&" from "&gyskb&" where "&gyskid&" in ("&saidlid&")"&gyskp
ELSE
'方法二
sql="select top "&saips&" "&gyskl&" from "&gyskb&" where "&gyskid&" not in (select top "&int((saipg-1)*saips)&" "&gyskid&" from "&gyskb&gyskt&gyskp&") and "&gyskid&" in (select top "&int(saipg*saips)&" "&gyskid&" from "&gyskb&gyskt&gyskp&")"&gyskp
END IF
end if
if g_err>0 then Call aierr(0,sql)
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
sailist=""
else
sailist=rs.GetRows
end if
rs.close
set rs=nothing
End Function
'---------------------------
'pageshow make#=page+ps|*show page
'---------------------------
Function saipage(icfur,icfurx,icfpr,icfpg,icfps,icfpz)
saipage=""
icfpz=aiint(icfpz)
if icfpz>1 then
dim icpda,icpdb,icpdi
icfpr=aiint(icfpr)
icfpg=aiint(icfpg)
icfps=aiint(icfps)
if icfpg<5 then
icpda=2
icpdb=8
else
icpda=icfpg-3
icpdb=icfpg+3
if icpda<2 then icpda=2
end if
if icpdb>icfpz-1 then icpdb=icfpz-1
if icfpg=1 then
saipage=saipage&replace(replace(icfurx,"#","1/"&icfps),"*","首页")
else
saipage=saipage&replace(replace(icfur,"#","1/"&icfps),"*","首页")
end if
if icpdb>=icpda then
for icpdi=icpda to icpdb
if icfpg=icpdi then
saipage=saipage&replace(replace(icfurx,"#",icpdi&"/"&icfps),"*",icpdi)
else
saipage=saipage&replace(replace(icfur,"#",icpdi&"/"&icfps),"*",icpdi)
end if
next
end if
if icfpg=icfpz then
saipage=saipage&replace(replace(icfurx,"#",icfpz&"/"&icfps),"*","第 "&icfpz&" 页")
else
saipage=saipage&replace(replace(icfur,"#",icfpz&"/"&icfps),"*","第 "&icfpz&" 页")
end if
end if
End Function
'---------------------------
'调用
'saiarr=saitop(10,"ai_id","ai_id,ai_bt,ai_nr,ai_ur,ai_ep,ai_ef,ai_cs,ai_us,ai_hi,ai_xi,ai_yi,ai_kg,ai_tm,ai_xy","zhi_ai","ai_xy>0","ai_id desc")
'IF IsArray(saiarr) THEN
'For saii=0 To UBound(saiarr,2)
'For saij=0 To UBound(saiarr,1)
'Response.Write saiarr(saij,saii)&"<br>"
'Next
'Next
'ELSE
'Response.Write "null"
'END IF
'---------------------------
Function saitop(gyskn,gyskid,gyskl,gyskb,gyskt,gyskp)
saitop=""
if gyskt<>"" then gyskt=" where "&gyskt
if gyskp<>"" then gyskp=" order by "&gyskp
if instr(gyskp,gyskid)=0 then gyskp=gyskp&","&gyskid&" desc"
if gyskn="" then
gyskn=""
else
gyskn=" top "&gyskn&""
end if
if 1=1 then
sql="select"&gyskn&" "&gyskl&" from "&gyskb&gyskt&gyskp
else
sql="select "&gyskl&" from "&gyskb&" where "&gyskid&" in (select"&gyskn&" "&gyskid&" from "&gyskb&gyskt&gyskp&")"&gyskp
end if
if g_err>0 then Call aierr(0,sql)
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
saitop=""
else
saitop=rs.GetRows
end if
rs.close
set rs=nothing
End Function
'---------------------------
'浏览
'**_hi-自动更新浏览次数
'if saiview("ai_id,ai_bt,ai_nr,ai_ur,ai_ep,ai_ef,ai_cs,ai_us,ai_hi,ai_xi,ai_yi,ai_kg,ai_tm,ai_xy","zhi_ai","ai_id=2","ai_hi") then
'Response.Write "ok"
'else
'Response.Write "err"
'end if
'---------------------------
Function saiview(gyskl,gyskb,gyskt,gyskg)
dim saivlx
saiview=FALSE
if gyskt<>"" then gyskt=" where "&gyskt
sql="select "&gyskl&" from "&gyskb&gyskt
if g_err>0 then Call aierr(0,sql)
if gyskg<>"" then'view add hi
saivlx=3
else
saivlx=1
end if
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,saivlx
if rs.eof and rs.bof then
'no
else
if saivlx=3 then'view add hi
rs(gyskg)=aiint(rs(gyskg))+1
rs.update
end if
dim saivdrr
saivdrr=split(gyskl,",")
For saij=0 To UBound(saivdrr)
ailin=saivdrr(saij)
if g_err>0 then Call aierr(2,ailin&"="&rs(saij)&"")
if instr(ailin,"mm")>0 and g_gmm<>"" then'针对加密字段处理
Execute(ailin&"=cstr("""&aimm(g_gmm,saixrr(3,rs(saij)),1)&""")")
else
Execute(ailin&"=cstr("""&saixrr(3,rs(saij))&""")")
end if
next
saiview=TRUE
end if
rs.close
set rs=nothing
End Function
'-----------------------------------
'PS:read one
'=sairo("ss_mc","ees_ss","ss_id=1","ai_id desc")
'-----------------------------------
Function sairo(gyskl,gyskb,gyskt,gyskp)
sairo=""
dim sqlo,rso
if gyskt<>"" then gyskt=" where "&gyskt
if gyskp<>"" then gyskp=" order by "&gyskp
sqlo="select top 1 "&gyskl&" from "&gyskb&gyskt&gyskp
if g_err>0 then Call aierr(0,sqlo)
set rso=server.CreateObject("adodb.recordset")
rso.open sqlo,conn,1,1
if rso.eof and rso.bof then
'no
else
sairo=rso(0)
end if
rso.close
set rso=nothing
End Function
'---------------------------
'发布gysky=0&编辑gysky=1&编辑gysky=9存在更新+不存在添加
'if saido("ai_id,ai_bt,ai_nr,ai_ur,ai_ep,ai_ef,ai_cs,ai_us,ai_hi,ai_xi,ai_yi,ai_kg,ai_tm,ai_xy","zhi_ai","ai_id=2",1) then
'Response.Write "ok"
'else
'Response.Write "err"
'end if
'---------------------------
Function saido(gyskl,gyskb,gyskt,gysky)
saido=FALSE
if gyskt<>"" then gyskt=" where "&gyskt
sql="select "&gyskl&" from "&gyskb&gyskt
if g_err>0 then Call aierr(0,sql)
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
if rs.eof and rs.bof then
if gysky=0 or gysky=9 then
rs.addnew
saido=TRUE
end if
else
if gysky=1 or gysky=9 then saido=TRUE
end if
if saido then
dim aidlz
airr=split(gyskl,",")
for aii=0 to ubound(airr)
ailin=airr(aii)
Execute("aidlz="&ailin&"")
if g_err>0 then Call aierr(2,ailin&"="&aidlz&"")
if instr(ailin,"mm")>0 and g_gmm<>"" then'针对加密字段处理
rs(aii)=aimm(g_gmm,aidlz,0)
else
rs(aii)=aidlz'处理输入保存数据
end if
next
rs.update
end if
rs.close
set rs=nothing
End Function
'---------------------------
'插入
'saiin("zhi_ai","ai_hi,ai_bt","2,'title'")
'---------------------------
Function saiin(gyskb,gyskl,gyskz)
saiin=FALSE
if gyskb<>"" and gyskl<>"" and gyskz<>"" then
sql="insert into "&gyskb&" ("&gyskl&") values ("&gyskz&")"
if g_err>0 then Call aierr(0,sql)
conn.execute(sql)
saiin=TRUE
end if
End Function
'---------------------------
'更新
'sairs("zhi_ai","ai_hi=ai_hi+1","ai_id=2")
'---------------------------
Function sairs(gyskb,gysks,gyskt)
sairs=FALSE
if gyskt<>"" then gyskt=" where "&gyskt
sql="update "&gyskb&" set "&gysks&gyskt
if g_err>0 then Call aierr(0,sql)
conn.execute(sql)
sairs=TRUE
End Function
'---------------------------
'删除
'saidel("zhi_ai","ai_id=12")
'---------------------------
Function saidel(gyskb,gyskt)
saidel=FALSE
if gyskt<>"" then gyskt=" where "&gyskt
sql="delete from "&gyskb&gyskt&""
if g_err>0 then Call aierr(0,sql)
conn.execute(sql)
saidel=TRUE
End Function


'PR-ai----------1
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
'PR-ai----------2

'EMail----------1
'{网站发信邮箱与服务器设置}
Const g_emkg=1'发信开关-不发邮件|发送邮件*需要Jmail组件支持,可到官方eesai.com下载.
Const g_emci=100'发信次数-可以发信的次数1000次以上为不限制.
Const g_emfw="smtp.126.com"'Smtp服务:发送邮件所使用的SMTP服务器,建议大家使用126等专业邮箱.
Const g_emzh="EESaicom@126.com"'邮箱用户:与SMTP服务器对应的邮箱用户名,126等大多邮箱即邮箱地址.
Const g_emmm="Guoyansai2017"'邮箱密码:与SMTP服务器对应的邮箱密码.
Const g_emfr="EESaicom@126.com"'发信邮箱:SMTP服务器发信邮箱.
Const g_emrp="guoyansai@qq.com"'回信邮箱:回信默认发往的邮箱.
Const g_emck="emx"'限制缓存:发送邮件限制发送次数的缓存名.
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
if emdci<emfxci then emfxss=emfxss&"<p>特别提示：已发送<b>"&emfxci-emdci&"</b>次，还能发送<b>"&emdci&"</b>次。</p><p>特别注意：请将邮箱["&g_emfr&"]加入您的邮箱白名单。</p>"
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
'EMail----------2
%>