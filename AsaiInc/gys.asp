<%
'---------------------------
'err write,0sql 1no sql
'---------------------------
Sub saierr(aifty,aifstr)
dim airds
if g_errx then
if aifty=1 then
airds="<b>"&timer&"：</b><br>"&aifstr&"<br>"
else
g_sqln=g_sqln+1
if g_sqln=1 then Response.Cookies("gyssqltm")=timer
airds="<b>"&g_sqln&"、</b><i>"&timer&"：</i><u>"&aifstr&"</u><br>"
end if
if g_err=2 or g_err=4 then
g_errs=g_errs&airds
else
Response.Write airds
end if
end if
End Sub
'-----------------------------------
'PS:show err
'=sqlerr()
'-----------------------------------
Function sqlerr()
if g_errx then
sqlerr=""
if request.Cookies("gyssqltm")<>"" then
sqlerr=sqlerr&"<h1>Conn Times:"&g_sqln&" times,Consuming "&timer-request.Cookies("gyssqltm")&" ms</h1>"
else
sqlerr=sqlerr&"<h1>NO DATE CONNECT</h1>"
end if
if g_err=2 or g_err=4 then sqlerr=sqlerr&"<div class=""sqlerr"">"&g_errs&"</div>"
end if
End Function
'-----------------------------------
'PS:open conn
'Call saic(0,"access")||Call saic(0,"access,pass")||Call saic(0,"ip,dataneme,userid,pass")||
'-----------------------------------
Sub saic(saicdbty,saicdbstr)
dim saidbarr
saidbarr=split(saicdbstr,",")
On Error Resume Next'display err
if saicdbty=1 then'MSSQL
Set conn=Server.CreateObject("ADODB.CONNECTION")
adoconn="Provider=Sqloledb;Data Source="&saidbarr(0)&";Initial Catalog="&saidbarr(1)&";User ID="&saidbarr(2)&";Password="&saidbarr(3)&";"
else'ACCESS
set conn=server.CreateObject("ADODB.CONNECTION")
if ubound(saidbarr)>0 then
adoconn="DBQ="+server.mappath(""&saidbarr(0)&"")+";PWD="+""&saidbarr(1)&""+";DefaultDir=;DRIVER={Microsoft Access Driver(*.mdb)};"
else
adoconn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath(""&saidbarr(0)&"")
'adoconn="DRIVER={Microsoft Access Driver(*.mdb)};DBQ="&Server.MapPath(""&saidbarr(0)&"")
'adoconn="Provider=Microsoft.ACE.OLEDB.12.0;Data Source="&Server.MapPath(""&saidbarr(0)&"")'for win10
end if
end if
'if g_errx then Call saierr(1,adoconn)
if err then
err.Clear
Set conn=Nothing
response.Write "Sorry!DB Err..."
Response.End
else
conn.open adoconn
end if
End Sub
'-----------------------------------
'PS:colse conn
'Call saio()
'-----------------------------------
Sub saio()
conn.Close
Set conn=Nothing
End Sub
'-----------------------------------
'PS:open rs
'Call saik(sairs,saisql,1,1)
'-----------------------------------
Sub saik(sairs,saisql,saic1,saic2)
if g_errx then Call saierr(0,saisql)
set sairs=server.CreateObject("adodb.recordset")
sairs.open saisql,conn,saic1,saic2
End Sub
'-----------------------------------
'PS:close rs
'Call saig(sairs)
'-----------------------------------
Sub saig(sairs)
'On Error Resume Next'display err
sairs.close
set sairs=nothing
End Sub
'=====================================================================conn end!
'-----------------------------------
'PS:check/LV conn str
'=gysg("gysstr")
'-----------------------------------
Function gysg(gysstr)
if ainull(gysstr) then
gysg=""
else
gysg=gysstr
gysg=Replace(gysg,g_gx,"*")
gysg=Replace(gysg,g_gy,"*")
gysg=trim(gysg)
end if
End Function
'-----------------------------------
'PS:make arr str
'=gyscarr(0,"gysstr")
'-----------------------------------
Function gyscarr(gysffty,gysstr)
if ainull(gysstr) then
gyscarr=""
else
gyscarr=gysstr
gyscarr=Replace(gyscarr,g_gx,"*")
gyscarr=Replace(gyscarr,g_gy,"*")
gyscarr=Replace(gyscarr,g_gr,"*")
if gysffty=0 then
gyscarr=Replace(gyscarr,VbCrlf,"")
gyscarr=Replace(gyscarr,CHR(10),"")
gyscarr=Replace(gyscarr,CHR(13),"")
gyscarr=trim(gyscarr)
else
gyscarr=Replace(gyscarr,VbCrlf,g_gr)
gyscarr=Replace(gyscarr,CHR(10),g_gr)
gyscarr=Replace(gyscarr,CHR(13),g_gr)
gyscarr=trim(gyscarr)
end if
end if
end Function
'-----------------------------------
'PS:make arr str ""-"
'=gyscarrr(0,"gysstr")
'-----------------------------------
Function gyscarrr(gysffty,gysstr)
if ainull(gysstr) and gysffty=0 then
gyscarrr=""
else
gyscarrr=gysstr
gyscarrr=gyscarr(gysffty,gysstr)
gyscarrr=Replace(gyscarrr,"""","""""")
gyscarrr=trim(gyscarrr)
end if
end Function
'-----------------------------------
'PS:content page
'=gysnr("gysstr","?pg=|*|&ty=1","") showmo||gysnr("gysstr","?pg=|*|&ty=1","0") showall||gysnr("gysstr","?pg=|*|&ty=1","1") showpage
'-----------------------------------
Function gysnr(gysstr,gyskpu,gyskpg)
gysnr=aihtml(gysstr)
gyspage=gyskpg
if gyskpg="0" or g_pgcx=0 or ainull(gyskpu) or ainull(gysnr) then
gysnr=replace(gysnr,g_pgcg,g_pgct)
else
Dim gysnrrr,gysnrj,gyskpurr
gyskpu=replace(gyskpu,g_urg&g_urz,g_urz)
if g_html=1 then gyskpu=replace(gyskpu,g_urg&g_urk&g_urz,g_urz)
gysnrrr=split(gysnr,g_pgcg)
gysnrj=ubound(gysnrrr)
if gysnrj=0 then
gysnr=gysnr
else
if ainull(gyskpg) then
gysnr=gysnrrr(0)
gyskpg=1
else
if int(gyskpg)>gysnrj+1 then
gysnr=gysnrrr(gysnrj)
gyskpg=gysnrj+1
else
gysnr=gysnrrr(int(gyskpg)-1)
gyskpg=int(gyskpg)
end if
end if
gyskpurr=split(gyskpu,g_gp)
gysnr=gysnr&"<div class=""y-ac"">"
gysnr=gysnr&"<a class=""y-d"" href="""&gyskpurr(0)&"0"&gyskpurr(1)&""" title=""Show all"">1-"&gysnrj+1&"</a> "
for gysii=1 to gysnrj+1
if gyskpg=gysii then
gysnr=gysnr&"<a class=""y-e"" href="""&gyskpurr(0)&gysii&gyskpurr(1)&""">"&gysii&"</a>"
else
gysnr=gysnr&"<a class=""y-d"" href="""&gyskpurr(0)&gysii&gyskpurr(1)&""">"&gysii&"</a>"
end if
next
gysnr=gysnr&"</div>"
end if
end if
End Function
'=====================================================================check str end!
'-----------------------------------
'PS:add/edit save from where(1=number/2=string/other=gyskt) form/request(1=add;2=edit;11=adds;22=edits)
'if gysfm("mc,cs,px,tm","ees_ss","ss_mc='"&request("mc")&"'","ss_",1) 1add||gysfm("mc,cs,px,tm","ees_ss","ss_id="&request("id")&"","ss_",2) 2edit||gysfm("mc,cs,px,tm","ees_ss",2,"ss_",11) 11adds||gysfm("id,cs,px,tm","ees_ss",1,"ss_",11) then
'response.Write "ok!"
'else
'response.Write "err!"
'end if
'-----------------------------------
Function gysfm(gyskl,gyskb,gyskt,gyskq,gysky)
if ainull(gyskl) or ainull(gyskb) then
gysfm=False
else
dim gysfmli
gysfmli=0
gysal=split(gyskl,",")
for gysii=0 to ubound(gysal)
if gysal(gysii)<>"" then
if gysfmli=0 then
gyskl=gysal(gysii)
else
gyskl=gyskl&","&gysal(gysii)
end if
gysfmli=gysfmli+1
end if
next
gysfmli=gysfmli-1
gysal=split(gyskl,",")
gyskl=gyskq&replace(gyskl,",",","&gyskq)
gysar=split(gyskl,",")
gysalinx=""
if gysky<10 then'one do
gyssql="select "&gyskl&" from "&gyskb&""
if gyskt<>"" then gyssql=gyssql&" where "&gyskt
'response.Write "<br /><br />"&gyssql&"<br />"&NOW()
Call saik(gysrs,gyssql,1,3)
if gysrs.eof and gysrs.bof then
if gysky=2 then'edit
gysfm=False
else'add
gysrs.addnew
for gysjj=0 to gysfmli
gysalinx=aireq(gysal(gysjj))
'response.Write gysalinx&"=["&gysjj&"]=("&gysal(gysjj)&")"&ubound(gysar)&"<br>"
'if i_xkzy=1 and aibj(right(gyskb,2),"ai") and aibj(right(gysal(gysjj),2),"ss") then'for EESai nr to ss
'if ainull(gysalinx) then
'gysrs(gysjj)=left(aitit(aireq("nr")),180)
'else
'gysrs(gysjj)=aitit(gysalinx)
'end if
'else
if aistr(gysalinx)<>"" or aibj(right(gysal(gysjj),2),"tj") then'pass manage input name
gysrs(gysjj)=gysalinx
end if
gysalinx=""
next
gysrs.update
gysfm=True
end if
else
if gysky=2 or gysky=9 then'edit
if gysrs.recordcount=1 then
for gysjj=0 to gysfmli
gysalinx=aireq(gysal(gysjj))
'response.Write gysalinx&"="&gysrs(gysjj)&"<br><br>"
'response.Write gysal(gysjj)&"="&gysalinx&"<br>"
if ainull(gysalinx) and ainull(gysrs(gysjj)) then
'
elseif gysalinx=gysrs(gysjj) then
'
elseif aibj(right(gysal(gysjj),2),"tj") then'pass manage input name
gysrs(gysjj)=gysalinx
elseif aistr(gysalinx)<>"" then'pass manage input name
'response.Write gysal(gysjj)&"="&gysalinx&"<br />"
gysrs(gysjj)=aistr(gysalinx)
elseif aibj(aireq(g_ckks&"kz"),"1")  then
gysrs(gysjj)=""
end if
gysalinx=""
next
gysrs.update
gysfm=True
else
gysfm=False
end if
else'add
gysfm=False
end if
end if
Call saig(gysrs)
else'some do
for gysjj=0 to gysfmli
if gysjj=0 then
gysalinx=aireq(gysal(gysjj))
else
gysalinx=gysalinx&g_gx&aireq(gysal(gysjj))
end if
next
gysax=split(gysalinx,g_gx)
dim gysaxx
gysaxx=split(gysax(0),", ")
for gysj=0 to ubound(gysaxx)
if ainull(gysaxx(gysj)) then
gysfm=False
else
gyssql="select "&gyskl&" from "&gyskb&""
if gyskt="1" then'number
gyssql=gyssql&" where "&gysar(0)&"="&gysaxx(gysj)&""
elseif gyskt="2" then'string
gyssql=gyssql&" where "&gysar(0)&"='"&gysaxx(gysj)&"'"
elseif gyskt<>"" and gyskt<>"0" then'where
gyssql=gyssql&" where "&gyskt
end if
Call saik(gysrs,gyssql,1,3)
if gysrs.eof and gysrs.bof then
if gysky=22 then'edit some
gysfm=False
else'add some
gysrs.addnew
for gysjj=0 to gysfmli
gysaliny=split(gysax(gysjj),", ")
if gysaliny(gysj)<>"" then gysrs(gysjj)=trim(gysaliny(gysj))
gysaliny=""
next
gysrs.update
gysfm=True
end if
else
if gysky=22 then'edit some
for gysjj=1 to gysfmli
if (gyskt<>"1" or gysjj>0) and not ainull(gysax(gysjj)) then
gysaliny=split(gysax(gysjj),", ")
'if not ainull(gysaliny(gysj)) then response.Write(gysjj&"==="&trim(gysaliny(gysj))&"<br />")
if not ainull(gysaliny(gysj)) then gysrs(gysjj)=trim(gysaliny(gysj))
gysaliny=""
end if
next
gysrs.update
gysfm=True
else'add some
gysfm=False
end if
end if
end if
next
Call saig(gysrs)
end if
end if
End Function
'-----------------------------------
'PS:insert value
'if gysin("ees_ss","ss_xy,ss_ty","1,'uu'","1=2") then
'response.Write "ok!"
'else
'response.Write "err!"
'end if
'-----------------------------------
Function gysin(gyskb,gyskl,gyskz,gyskt)
gyskb=gysg(gyskb):gyskl=gysg(gyskl):gyskz=gysg(gyskz):gyskt=gysg(gyskt)
if ainull(gyskb) or ainull(gyskl) or ainull(gyskz) then
gysin=False
else
dim gysinck
if ainull(gyskt) then
gysinck=1
else
if gyscc(gyskl,gyskb,gyskt) then
gysinck=0
else
gysinck=1
end if
end if
if gysinck=1 then
gyssql="INSERT INTO "&gyskb&" ("&gyskl&") VALUES ("&gyskz&")"
if g_errx then Call saierr(0,gyssql)
conn.execute(gyssql)
gysin=True
else
gysin=False
end if
end if
End Function
'-----------------------------------
'PS:update some value
'if gysgx("ees_ss","ss_xy=2","ss_xy=0"/"ss_id in (12,10,1,3,5)"/"ss_mc in ('as','ees','sai')") then
'response.Write "ok!"
'else
'response.Write "err!"
'end if
'-----------------------------------
Function gysgx(gyskb,gysks,gyskt)
gyskb=gysg(gyskb):gysks=gysg(gysks):gyskt=gysg(gyskt)
if ainull(gyskb) or ainull(gysks) then
gysgx=False
else
gyssql="update "&gyskb&" set "&gysks&""
'response.Write gyssql
if not ainull(gyskt) then gyssql=gyssql&" where "&gyskt&""
if g_errx then Call saierr(0,gyssql)
conn.execute(gyssql)
gysgx=True
'if gyscc("*",gyskb,gyskt) then
'else
'gysgx=false
'end if
end if
End Function
'-----------------------------------
'PS:replace some value
'=gysth("ss_mc","ees_ss","ss_xy=2","guoyansai","shipe.cn")
'-----------------------------------
Function gysth(gyskl,gyskb,gyskt,gyshx,gyshy)
gyskl=gysg(gyskl):gyskb=gysg(gyskb):gyskt=gysg(gyskt):gyshx=gysg(gyshx):gyshy=gysg(gyshy)
gysth=0
if not ainull(gyskl) and not ainull(gyskb) and not ainull(gyshx) then
gyssql="select "&gyskl&" from "&gyskb&" where "&gyskl&" like '%"&gyshx&"%'"
if not ainull(gyskt) then gyssql=gyssql&" and "&gyskt&""
Call saik(gysrs,gyssql,1,3)
Do While Not gysrs.eof
gysth=gysth+1
gysrs(gyskl)=replace(gysrs(gyskl),gyshx,gyshy)
gysrs.update
gysrs.movenext
loop
Call saig(gysrs)
end if
End Function
'-----------------------------------
'PS:auto save tag/search *1 use to add+1
'=gysat("ss_mc,ss_hi","ees_ss","ss_xy=2","guoyansai&g_gx&shipe.cn")
'=gysat("ss_hi","ees_ss","ss_id=20","0=+num|-num")1=true
'-----------------------------------
Function gysat(gyskl,gyskb,gyskt,gyshx)
gysat=False
gyskl=gysg(gyskl):gyskb=gysg(gyskb):gyskt=gysg(gyskt):gyshx=gysg(gyshx)
if not ainull(gyskl) and not ainull(gyskb) and not ainull(gyshx) then
gyssql="select "&gyskl&" from "&gyskb
if not ainull(gyskt) then gyssql=gyssql&" where "&gyskt&""
if len(gyshx)<5 and len(gyshx)>1 and (left(gyshx,1)="+" or left(gyshx,1)="-") then
Call saik(gysrs,gyssql,1,3)
if gysrs.eof and gysrs.bof then
else
dim grsdgl
Do While Not gysrs.eof
grsdgl=gysrs(gyskl)
if not IsNumeric(grsdgl) then grsdgl=0
if left(gyshx,1)="+" then
grsdgl=grsdgl+int(right(gyshx,len(gyshx)-1))
else
grsdgl=grsdgl-int(right(gyshx,len(gyshx)-1))
end if
if grsdgl<0 then grsdgl=0
gysrs(gyskl)=grsdgl
gysat=true
gysrs.update
gysrs.movenext
loop
end if
Call saig(gysrs)
else
Call saik(gysrs,gyssql,1,3)
if gysrs.eof and gysrs.bof then
gysrs.addnew
gysax=split(gyshx,g_gg)
for gysi=0 to ubound(gysax)
'response.Write "<br />"&gysi&"="&gysax(gysi)&"<br />"
gysrs(gysi)=gysax(gysi)
next
gysat=true
else
'LIE add+1
gysrs(0)=gysrs(0)+1
gysat=true
end if
gysrs.update
Call saig(gysrs)
end if
end if
End Function
'-----------------------------------
'PS:del/clear
'if gysdel("ss_id","ees_ss","ss_id in (3,12,11)"/"ss_xy=3"/0=del all) then
'response.Write "ok!"
'else
'response.Write "err!"
'end if
'-----------------------------------
Function gysdel(gyskl,gyskb,gyskt)
gyskl=gysg(gyskl):gyskb=gysg(gyskb):gyskt=gysg(gyskt)
gysdel=False
if ainull(gyskb) or ainull(gyskt) then
gysdel=False
else
if gyskt="0" then'clear
gyssql="delete from "&gyskb&""
'response.Write gyssql
if g_errx then Call saierr(0,gyssql)
conn.execute(gyssql)
'if show('80004005') err,hidden the alter line
'conn.execute("alter table "&gyskb&" alter "&gyskl&" counter(1,1)")
gysdel=True
else'del some
gyssql="delete from "&gyskb&" where "&gyskt&""
if g_errx then Call saierr(0,gyssql)
conn.execute(gyssql)
gysdel=True
end if
end if
End Function
'-----------------------------------
'PS:read
'if gysread("ss_mc,ss_ct,ss_px,ss_tm","ees_ss","ss_id=1","ss1") then
'response.Write("save in gyskl,read gyskl is ok.<br />")
'else
'response.Write "none"
'end if
'-----------------------------------
Function gysread(gyskl,gyskb,gyskt,gysko)
dim gysdml,gysdms
gyskl=gysg(gyskl):gyskb=gysg(gyskb):gyskt=gysg(gyskt)
if ainull(gyskl) or ainull(gyskb) or ainull(gyskt) then
gysread=False
else
gysal=split(gyskl,",")
if ankck(gysko) then
gysread=False
gyssql="select top 1 "&gyskl&" from "&gyskb&" where "&gyskt&""
'response.Write gyssql
Call saik(gysrs,gyssql,1,1)
if gysrs.eof and gysrs.bof then
gysread=False
else
for gysjj=0 to ubound(gysal)
gysdml=gysal(gysjj)
if instr(g_gn,","&right(gysdml,2)&",")>0 then
gysdms=gysrs(gysjj)
gysalinx=gysalinx&gysdms&g_gx
gysdms=gyscarrr(1,gysdms)
Execute(gysdml&"=cstr("""&gysdms&""")")
else
gysdms=gysrs(gysjj)
gysalinx=gysalinx&gysdms&g_gx
gysdms=gyscarrr(0,gysdms)
Execute(gysdml&"=cstr("""&gysdms&""")")
end if
next
Call ankop(2,0,ansav(gysalinx),gysko)
gysalinx=""
gysread=True
end if
Call saig(gysrs)
else
gysax=split(anreq(ankop(1,0,0,gysko)),g_gx)
dim gysaud
if ubound(gysal)>ubound(gysax) then
gysaud=ubound(gysax)
else
gysaud=ubound(gysal)
end if
for gysjj=0 to gysaud
gysdml=gysal(gysjj)
if instr(g_gn,","&right(gysdml,2)&",")>0 then
gysdms=gyscarrr(1,gysax(gysjj))
if not ainull(gysdms) then Execute(gysdml&"=cstr("""&gysdms&""")")
else
gysdms=gyscarrr(0,gysax(gysjj))
if not ainull(gysdms) then Execute(gysdml&"=cstr("""&gysdms&""")")
end if
next
gysread=True
end if
end if
End Function
'-----------------------------------
'PS:read one
'=gysro("ss_mc","ees_ss","ss_id=1","ro1")
'-----------------------------------
Function gysro(gyskl,gyskb,gyskt,gysko)
gyskl=gysg(gyskl):gyskb=gysg(gyskb):gyskt=gysg(gyskt)
if ainull(gyskl) or ainull(gyskb) or ainull(gyskt) then
gysro=""
else
if ankck(gysko) then
gyssql="select "&gyskl&" from "&gyskb&" where "&gyskt&""
Call saik(gysrs,gyssql,1,1)
if gysrs.eof and gysrs.bof then
gysro=""
else
gysro=gysrs(0)
Call ankop(2,0,ansav(gysro),gysko)
end if
Call saig(gysrs)
else
gysro=anreq(ankop(1,0,0,gysko))
end if
end if
End Function
'-----------------------------------
'PS:check value
'=gyscc("ss_mc","ees_ss","ss_id=1")
'-----------------------------------
Function gyscc(gyskl,gyskb,gyskt)
gyscc=false
gyskl=gysg(gyskl):gyskb=gysg(gyskb):gyskt=gysg(gyskt)
if ainull(gyskl) or ainull(gyskb) or ainull(gyskt) then
gyscc=false
else
gyssql="select "&gyskl&" from "&gyskb&" where "&gyskt&""
Call saik(gysrs,gyssql,1,1)
if gysrs.eof and gysrs.bof then
gyscc=false
else
gyscc=true
end if
Call saig(gysrs)
end if
End Function
'-----------------------------------
'PS:where not in ...
'=gysnot(12,10,1,3,5/'as','ees','sai')
'-----------------------------------
Function gysnot(gysty,gysstr)
if ainull(gysty) or ainull(gysstr) then
gysnot=""
else
gysstr=replace(gysstr,",,",",")
if left(gysstr,1)="," then gysstr=right(gysstr,len(gysstr)-1)
if right(gysstr,1)="," then gysstr=left(gysstr,len(gysstr)-1)
dim gysntrr,gysntii,gysntnt,gysntss,gysntsx'replace same chr 0
gysntrr=split(gysstr,",")
gysntnt=ubound(gysntrr)
gysntsx=""
for gysntii=0 to gysntnt
gysntss=replace(gysstr,gysntrr(gysntii),"")
if gysntss<>gysstr then
gysstr=replace(gysstr,gysntrr(gysntii),"")
gysntsx=gysntsx&","&gysntrr(gysntii)
end if
next
gysstr=gysntsx
if left(gysstr,1)="," then gysstr=right(gysstr,len(gysstr)-1)'replace same chr 1
gysnot=""&gysty&" not in("&gysstr&")"
end if
End Function
'-----------------------------------
'PS:select top ***
'if gystop(10,"ai_id","ss_mc,ss_ct,ss_px,ss_tm","ees_ss","ss_xy=0","ss_id desc","tp1") then
'response.Write("save in gysax,user loop read<br />")
'gysax=split(gysar,g_gx)
'for gysi=0 to ubound(gysax)
'gysay=split(gysax(gysi),g_gy)
'for gysj=0 to ubound(gysay)
'response.Write "<br />["&gysj&"]"&gysay(gysj)&"<br />"
'next
'response.Write "<br />-------------------------------------------["&gysi&"]<br />"
'next
'else
'response.Write "none"
'end if
'-----------------------------------
Function gystop(gyskn,gyskid,gyskl,gyskb,gyskt,gyskp,gysko)
gyskn=aiint(gyskn):gyskl=gysg(gyskl):gyskb=gysg(gyskb):gyskt=gysg(gyskt):gyskp=gysg(gyskp)
gysar=""
if ainull(gyskl) or ainull(gyskb) then
gystop=False
else
if ankck(gysko) then
gystop=False
if g_pgly>10000 then
dim gysqwr,gysqwi,gysqws,gysqwk,gysqwpr,gysqwipb,gysqwil,gysqwipa
gysqwr=split(gyskl,",")
if gyskid="" then
gysqwk=gysqwr(0)
else
gysqwk=gyskid
end if
for gysqwi=0 to ubound(gysqwr)
if gysqwi=0 then
gysqws="b."&gysqwr(0)
else
gysqws=gysqws&",b."&gysqwr(gysqwi)
end if
next
if not ainull(gyskp) then
if instr(gyskp,gyskid)=0 then gyskp=gyskp&","&gyskid&" desc"
gysqwpr=split(gyskp,",")
for gysqwi=0 to ubound(gysqwpr)
gysqwil=","&split(gysqwpr(gysqwi)," ")(0)
if gysqwi=0 then
gysqwipb="b."&gysqwpr(0)
else
gysqwipb=gysqwipb&",b."&gysqwpr(gysqwi)
end if
next
gysqwil=replace(gysqwil,","&gysqwk,"")
end if
if not ainull(gyskp) and instr(gyskp,",")=0 and instr(gyskp,"id desc")=0 and instr(gyskt,"in (select top")>0 then
gysqwipa=replace(gysqwipb,"b.","a.")
else
gysqwil=""
end if
gyssql="select "&gysqws&" from (select"
if gyskn>0 then gyssql=gyssql&" top "&gyskn&""
gyssql=gyssql&" a."&gysqwk&" from ("
gyssql=gyssql&"select "
'gyssql=gyssql&"top 8888 "
if gyskn>0 then gyssql=gyssql&"top "&gyskn&" "
'gyssql=gyssql&"top 100 percent "
gyssql=gyssql&gysqwk
gyssql=gyssql&gysqwil
gyssql=gyssql&" from "&gyskb&""
if not ainull(gyskt) then gyssql=gyssql&" where "&gyskt&""
if not ainull(gyskp) then gyssql=gyssql&" order by "&gyskp&""
gyssql=gyssql&") a "
if not ainull(gysqwipa) then gyssql=gyssql&" order by "&gysqwipa
gyssql=gyssql&") c inner join "&gyskb&" b on c."&gysqwk&"=b."&gysqwk&""
if not ainull(gysqwipb) then gyssql=gyssql&" order by "&gysqwipb&""
else
gyssql="select"
if gyskn>0 then gyssql=gyssql&" top "&gyskn&""
gyssql=gyssql&" "&gyskl&" from "&gyskb&""
if not ainull(gyskt) then gyssql=gyssql&" where "&gyskt&""
if not ainull(gyskp) then gyssql=gyssql&" order by "&gyskp&""
if instr(gyskp,gyskid)=0 then gyskp=gyskp&","&gyskid&" desc"
end if
'response.Write gyssql&"<br />"
Call saik(gysrs,gyssql,1,1)
if gysrs.eof and gysrs.bof then
gystop=False
else
gysii=0
Do While Not gysrs.eof
if gysii>0 then
gysar=gysar&g_gx
end if
gysii=gysii+1
gysal=split(gyskl,",")
for gysjj=0 to ubound(gysal)
if gysjj=0 then
if instr(gysal(gysjj),"_nr")>0 then'X-NoHTML
gysar=gysar&gyscarr(0,gysrs(gysjj))
else'X-NoHTML
gysar=gysar&gyscarr(0,aititlen(gysrs(gysjj),g_lcn))
end if'X-NoHTML
else
if instr(gysal(gysjj),"_nr")>0 then'X-NoHTML
gysar=gysar&g_gy&gyscarr(0,gysrs(gysjj))
else'X-NoHTML
gysar=gysar&g_gy&gyscarr(0,aititlen(gysrs(gysjj),g_lcn))
end if'X-NoHTML
end if
next
if gyskn>0 and gysii>gyskn then exit Do
gysrs.movenext
loop
gystop=True
end if
gysar=ansav(gysar)
Call saig(gysrs)
Call ankop(2,0,ansav(gysar),gysko)
else
gysar=anreq(ankop(1,0,0,gysko))
gystop=True
'news read 0
if g_atxw=1 then
if instr(gysko,"_3")>0 then
dim gysdid,gysdidx
gysdidx=anreq(ankop(1,0,0,gysko&"_id"))
gyssql="select top 1 "&gyskid&" from "&gyskb&""
if not ainull(gyskt) then gyssql=gyssql&" where "&gyskt&""
if not ainull(gyskp) then gyssql=gyssql&" order by "&gyskp&""
Call saik(gysrs,gyssql,1,1)
if gysrs.eof and gysrs.bof then
gysdid=""
else
gysdid=gysrs(0)
end if
Call saig(gysrs)
if gysdidx<>gysdid then
Call ankop(2,0,gysdid,gysko&"_id")
Call ankop(0,0,"",gysko)
end if
end if
end if
'news read 1
end if
end if
if ainull(gysar) then gystop=False
End Function
'-----------------------------------
'PS:list and page ***
'if gyslist("ss_id","ss_mc,ss_ct,ss_px,ss_tm","ees_ss","ss_xy>0","ss_id desc","?ps=|*|&pg=|*|&ty=1","","",200,"tp1") then
'response.Write("save in gysax,user loop read<br />")
'gysax=split(gysar,g_gx)
'for gysi=0 to ubound(gysax)
'gysay=split(gysax(gysi),g_gy)
'for gysj=0 to ubound(gysay)
'response.Write "<br />["&gysj&"]"&gysay(gysj)&"<br />"
'next
'response.Write "<br />-------------------------------------------["&gysi&"]<br />"
'next
'response.Write gyspage
'else
'response.Write "none"
'end if

'#CSS
'.y-a{padding:8px 12px;}
'.y-b{color:#0077DD;}
'.y-c{width:28px;text-align:center;vertical-align:middle;margin:2px;border-top:0px;border-left:0px;border-right:0px;border:#0077DD 1px solid;color:#0077DD;}
'a.y-d,a.y-d:link,a.y-d:active,a.y-d:visited{margin:2px;padding-top:1px;padding-bottom:1px;padding-left:5px;padding-right:5px;text-decoration:none;border:#0099FF 1px solid;background-color:#FFFFFE;color:#0099FF;}
'a.y-d:hover{border:#0077DD 1px solid;background-color:#0077DD;color:#FFFFFE;}
'a.y-e,a.y-e:link,a.y-e:active,a.y-e:visited{margin:2px;padding-top:1px;padding-bottom:1px;padding-left:5px;padding-right:5px;text-decoration:none;border:#0099FF 1px solid;background-color:#0099FF;color:#FFFFFE;}
'a.y-e:hover{border:#0077DD 1px solid;background-color:#0077DD;color:#FFFFFE;}
'-----------------------------------
Function gyslist(gyskid,gyskl,gyskb,gyskt,gyskp,gyskpu,gyskpg,gyskps,gyskm,gysko)
dim saipr,saipg,saips,saipz,gyskoprc,gysrscontent,gysrscontentc,gysrscontentn
gyslist=false
if gyskt<>"" then gyskt=" where "&gyskt
if gyskp<>"" then gyskp=" order by "&gyskp
if instr(gyskp,gyskid)=0 then gyskp=gyskp&","&gyskid&" desc"
if gyskps="" or not isnumeric(gyskps) or gyskps="0" then:saips=20:else:saips=aiint(gyskps):end if'get pagesize
if not ainull(gysko) then
gyskoprc=gysko&"precd"'save to record
gysko=gysko&"ps-"&gyskps&"-pg-"&gyskpg'save to gysar
else
gyskoprc=""
gysko=""
end if
if ankck(gyskoprc) then
gyssql="SELECT COUNT("&gyskid&") FROM "&gyskb&gyskt
if g_errx then Call saierr(0,gyssql)
saipr=aiint(conn.Execute(gyssql).getstring)'get record
Call ankop(2,0,saipr,gyskoprc)
else
saipr=aiint(anreq(ankop(1,0,0,gyskoprc)))
end if
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
if ankck(gysko) then
if saipg=1 then
gyssql="select top "&saips&" "&gyskl&" from "&gyskb&gyskt&gyskp
else
if g_pgly>10000 and instr(gyskb,"_ai")>0 and w_dbty=1 then'>100000
'方法一
dim sql1,rs1,saidlrr,saidlru,saidlid
sql1="select top "&int(saipg*saips)&" "&gyskid&" from "&gyskb&gyskt&gyskp
if g_errx then Call saierr(0,sql1)
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
For gysii=saidlru-saips+1 To saidlru-1
saidlid=saidlrr(0,gysii)&","&saidlid
Next
END IF
gyssql="select top "&saips&" "&gyskl&" from "&gyskb&" where "&gyskid&" in ("&saidlid&")"&gyskp
ELSE
'方法二
gyssql="select top "&saips&" "&gyskl&" from "&gyskb&" where "&gyskid&" not in (select top "&int((saipg-1)*saips)&" "&gyskid&" from "&gyskb&gyskt&gyskp&") and "&gyskid&" in (select top "&int(saipg*saips)&" "&gyskid&" from "&gyskb&gyskt&gyskp&")"&gyskp
END IF
end if
Call saik(gysrs,gyssql,1,1)
if gysrs.eof and gysrs.bof then
gysar=""
else
gysar=""
for gysii=1 to saips
if not gysrs.eof then
if gysii>1 then gysar=gysar&g_gx
gysal=split(gyskl,",")
for gysjj=0 to ubound(gysal)
	if aiint(gyskm)=0 then
	gysrscontent=gysrs(gysjj)
	gysrscontentc=gyscarr(0,gysrscontent)
	else
	gysrscontent=gyscarr(0,gysrs(gysjj))
	gysrscontentc=gysrscontent
	end if
gysrscontentc=aititp(gysrscontentc)
gysrscontentn=len(gysrscontentc)
	if aiint(gyskm)>0 and gysrscontentn>aiint(gyskm) then
	gysrscontentc=left(gysrscontentc,aiint(gyskm))&".."
	elseif gysrscontentn>200 then
	gysrscontentc=gysrscontentc
	else
	gysrscontentc=gysrscontent
	end if
if gysjj=0 then
gysar=gysar&gysrscontentc
else
gysar=gysar&g_gy&gysrscontentc
end if
next
gysrs.movenext
else
exit for
end if
next
end if
Call saig(gysrs)
Call ankop(2,0,ansav(gysar),gysko)
else
gysar=anreq(ankop(1,0,0,gysko))
end if

if saipz>1 then
dim icpda,icpdb,icpdi,gyskpurr
icpda=saipg-3
icpdb=saipg+3
gyskpurr=split(gyskpu,g_gp)

if icpda<1 then icpda=2
if icpdb>=saipz then icpdb=saipz-1
if saipg=1 then
gyspage=gyspage&"<a class=""y-e"" href="""&gyskpurr(0)&"1"&gyskpurr(1)&saips&gyskpurr(2)&""">1</a>"
else
gyspage=gyspage&"<a class=""y-d"" href="""&gyskpurr(0)&"1"&gyskpurr(1)&saips&gyskpurr(2)&""">1</a><a class=""y-d"" href="""&gyskpurr(0)&saipg-1&gyskpurr(1)&saips&gyskpurr(2)&""">&#8249;&#8249;</a>"
end if
if icpdb>=icpda then
for icpdi=icpda to icpdb
if saipg=icpdi then
gyspage=gyspage&"<a class=""y-e"" href="""&gyskpurr(0)&icpdi&gyskpurr(1)&saips&gyskpurr(2)&""">"&icpdi&"</a>"
else
gyspage=gyspage&"<a class=""y-d"" href="""&gyskpurr(0)&icpdi&gyskpurr(1)&saips&gyskpurr(2)&""">"&icpdi&"</a>"
end if
next
end if
if saipg=saipz then
gyspage=gyspage&"<a class=""y-e"" href="""&gyskpurr(0)&saipz&gyskpurr(1)&saips&gyskpurr(2)&""">"&saipz&"</a>"
else
gyspage=gyspage&"<a class=""y-d"" href="""&gyskpurr(0)&saipg+1&gyskpurr(1)&saips&gyskpurr(2)&""">&#8250;&#8250;</a><a class=""y-d"" href="""&gyskpurr(0)&saipz&gyskpurr(1)&saips&gyskpurr(2)&""">"&saipz&"</a>"
end if

if g_pglt=1 then'show fly
gyspage=gyspage&"<span class=""y-b"">Pagesize=<input class=""y-c"" name=""psi"" id=""psi"" title=""Prompt:Input number, press enter."&vbcrlf&saips&" Line/Page, total "&saipr&" Line."" value="""&saips&""" onKeyDown=""if(event.keyCode==13) {window.location='"&gyskpurr(0)&"1"&gyskpurr(1)&"'+psi.value+'"&gyskpurr(2)&"'; return false;}""> Page=<input class=""y-c"" name=""pat"" id=""pat"" title=""Prompt:Input number, press enter."&vbcrlf&"Page "&saipg&" / "&saipz&" ."" value="""&saipg&""" onKeyDown=""if(event.keyCode==13) {window.location='"&gyskpurr(0)&"'+pat.value+'"&gyskpurr(1)&saips&gyskpurr(2)&"'; return false;}""></span>"
end if
'if e_gdj>3 then response.Write gyspageshow
gyspage=replace(gyspage,g_urg&g_pgls&g_urz,g_urz)
if g_html=1 then gyspage=replace(gyspage,g_urg&g_pgls&g_urg&g_urk&g_urg&g_urk&g_urg&g_urk&g_urg&g_urk&g_urg&g_urk&g_urz,g_urz)

end if

gyslist=true

end function
%>