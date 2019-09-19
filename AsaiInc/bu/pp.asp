<%
const x_ppy=8
const x_ppm=1000
const x_ppck="eespp"
const x_ppgx="@@"
const x_ppga="##"
const x_ppgb="||"
const x_ppzf=100
dim ppaus,ppajg,ppatm,ppaxy,ppakk
ppakk=0
ppajg=0
'-----------------------------------
'order main sub (start)
'ppsai(ppfty=1del|9do ppapp+cook|11del all|10write str,ppfstr,ppfsn,ppfoy,ppfjg,ppfbt,ppfel,ppfus,ppfoz,ppfjs)
'-----------------------------------
function ppsai(ppfty,ppfstr,ppfsn,ppfoy,ppfjg,ppfbt,ppfel,ppfus,ppfoz,ppfjs)
if ppfty=11 then
response.Cookies(x_ppck)=""
ppsai="<script language=javascript>alert('提示：清空完成。');</script>"
elseif ppfty=10 or ppfty=0 then
response.Cookies(x_ppck)=ppfstr
elseif ppfty=9 or ppfty=1 then
ppfstr=Request.Cookies(x_ppck)
Call ppapp(1,ppfsn,"")
if ppakk="0" then
ppsai="<script language=javascript>alert('提示："&ppfsn&"["&ppfbt&"]此次竞拍操作无效，请刷新重试。');window.parent['EESaidd'].location.reload();</script>"
else
if not isNumeric(ppfoy) then ppfoy=0
if not isNumeric(ppfjg) then ppfjg=0
if ppfbt="" then ppfbt=ppfsn
if ppfus="" then ppfus=ew_kz
dim ppxdrr,ppxdi,ppxdls,ppxdud,ppadrr,ppadi,ppadls,ppadud,ppbdrr,ppbdsn,ppbdoy,ppbdjg,ppbdbt,ppbdel,ppadus,ppzdcl,ppzdck,ppzdckl,ppzdty
ppzdty=0
ppzdck=""
ppzdckl=""
ppzdcl=x_ppgx&ppfus&x_ppga&ppfsn&x_ppgb&ppfoy&x_ppgb&ppfjg&x_ppgb&ppfbt&x_ppgb&ppfel
if ppfstr="" then'001
response.Cookies(x_ppck)=ppzdcl
if ppfty=1 then'xxxDEL
ppsai="<script language=javascript>alert('注意：已经删除了！。');window.parent['EESaidd'].location.reload();</script>"
elseif ppfty=9 then'xxxDO
if aiint(ppfjg)>=int(aiint(ppajg)+x_ppzf) then
Call ppapp(2,ppfsn,e_uer&x_ppgx&ppfjg&x_ppgx&now()&x_ppgx&"2")
ppsai="<script language=javascript>alert('提示：成功参加竞拍["&ppfbt&"]出价"&ppfjg&"元。');window.parent['EESaidd'].location.reload();</script>"
else
ppsai="<script language=javascript>alert('注意：出价已被淘汰，请返回刷新后重新出价(您最近出价"&ppfjg&"元，最新出价"&ppajg&"元，您至少需要出价"&int(aiint(ppajg)+x_ppzf)&"元)。');window.parent['EESaidd'].location.reload();</script>"
end if
end if'xxx
else'001
if instr(ppfstr,x_ppgx&ppfus)=0 then'0011
if ppfty=1 then'DEL
ppsai="<script language=javascript>alert('提示："&ppfsn&"["&ppfbt&"]已经删除，请刷新。');</script>"
elseif ppfty=9 then'DO
response.Cookies(x_ppck)=ppzdcl&ppfstr
Call ppapp(2,ppfsn,e_uer&x_ppgx&ppfjg&x_ppgx&now()&x_ppgx&"2")
end if
else'0011
ppxdrr=split(ppfstr,x_ppgx)
ppxdud=ubound(ppxdrr)
if ppxdud>0 then'002
for ppxdi=1 to ppxdud'@@-@@-@@
ppxdls=ppxdrr(ppxdi)
if ppxdls<>"" then'0021
ppadrr=split(ppxdls,x_ppga)
ppadud=ubound(ppadrr)
ppadus=ppadrr(0)
if ppadud>0 then'003
if lcase(ppadus)<>lcase(ppfus) then'0031
ppzdck=ppzdck&ppxdls
else'0031
ppzdck=ppzdck&x_ppgx&ppadus
for ppadi=1 to ppadud'##-##-##
ppadls=ppadrr(ppadi)
ppbdrr=split(ppadls,x_ppgb)'||
if ubound(ppbdrr)=4 then'004|_z-_z-|
ppbdsn=ppbdrr(0)
ppbdoy=ppbdrr(1)
ppbdjg=ppbdrr(2)
ppbdbt=ppbdrr(3)
ppbdel=ppbdrr(4)
if not isNumeric(ppbdoy) then ppbdoy=0
if not isNumeric(ppbdjg) then ppbdjg=0
if lcase(ppbdsn)<>lcase(ppfsn) then'0041
ppzdckl=ppzdckl&x_ppga&ppadls
elseif ppzdty=0 then'0041
ppzdty=ppzdty+1
if ppfty=1 then'xxxDEL
if lcase(ppaus)=lcase(e_uer) then
ppzdckl=ppzdckl&x_ppga&ppadls
ppsai="<script language=javascript>alert('注意：当前竞拍，您正领先，无法删除！。');window.parent['EESaidd'].location.reload();</script>"
else
Call usergx(0,"jq",aiint(aiint(e_ujq)+aiint(ppbdoy)))
ppsai="<script language=javascript>alert('提示：您已经成功删除"&ppfsn&"["&ppfbt&"]的竞拍信息！。');window.parent['EESaidd'].location.reload();</script>"
end if
elseif ppfty=9 then'xxxDO
if aiint(ppfjg)>=int(aiint(ppajg)+x_ppzf) then
Call ppapp(2,ppfsn,e_uer&x_ppgx&ppfjg&x_ppgx&now()&x_ppgx&"2")
ppzdckl=ppzdckl&x_ppga&ppbdsn&x_ppgb&ppbdoy&x_ppgb&ppfjg&x_ppgb&ppbdbt&x_ppgb&ppbdel
ppsai="<script language=javascript>alert('提示：再次参加竞拍["&ppbdbt&"]，原出价"&ppbdjg&"元，当前出价"&ppfjg&"元。');window.parent['EESaidd'].location.reload();</script>"
else
ppzdckl=ppzdckl&x_ppga&ppfsn&x_ppgb&ppfoy&x_ppgb&ppfjg&x_ppgb&ppfbt&x_ppgb&ppbdel
ppsai="<script language=javascript>alert('注意：出价已被淘汰，请返回刷新后重新出价(您最近出价"&ppfjg&"元，最新出价"&ppajg&"元，您至少需要出价"&int(aiint(ppajg)+x_ppzf)&"元)。');window.parent['EESaidd'].location.reload();</script>"
end if
end if'xxx
end if'0041
end if'004|_z-_z-|
next'##-##-##
if ppzdty=0 then'00000
ppzdty=1
if ppfty=1 then'xxxDEL
ppsai="<script language=javascript>alert('注意：已经删除了！。');window.parent['EESaidd'].location.reload();</script>"
elseif ppfty=9 then'xxxDO
if aiint(ppfjg)>=int(aiint(ppajg)+x_ppzf) then
Call ppapp(2,ppfsn,e_uer&x_ppgx&ppfjg&x_ppgx&now()&x_ppgx&"2")
ppzdck=ppzdck&x_ppga&ppfsn&x_ppgb&ppfoy&x_ppgb&ppfjg&x_ppgb&ppfbt&x_ppgb&ppfel
ppsai="<script language=javascript>alert('提示：成功参加竞拍["&ppfbt&"]出价"&ppfjg&"元。');window.parent['EESaidd'].location.reload();</script>"
else
ppzdck=ppzdck&x_ppga&ppfsn&x_ppgb&ppfoy&x_ppgb&ppfjg&x_ppgb&ppfbt&x_ppgb&ppfel
ppsai="<script language=javascript>alert('注意：出价已被淘汰，请返回刷新后重新出价(您最近出价"&ppfjg&"元，最新出价"&ppajg&"元，您至少需要出价"&int(aiint(ppajg)+x_ppzf)&"元)。');window.parent['EESaidd'].location.reload();</script>"
end if
end if'xxx
end if'00000
ppzdck=ppzdck&ppzdckl
end if'0031
end if'003
end if'0021
next'@@-@@-@@
end if'002
response.Cookies(x_ppck)=ppzdck
end if'0011
end if'001

end if
else
ppsai="<script language=javascript>alert('注意：无效操作。');window.parent['EESaidd'].location.reload();</script>"
end if
end function
'-----------------------------------
'pp jingpai show
'-----------------------------------
'ppapp(ppfty=1read/0del/2write,ppfsn,ppfstr)
function ppapp(ppfty,ppfsn,ppfstr)
if ppfsn<>"" then
if ppfty="1" then'read
dim ppadrr
ppapp=application(x_ppck&ppfsn)
ppadrr=split(ppapp,x_ppgx)
if ubound(ppadrr)=4 then
ppaus=ppadrr(1)
ppajg=aiint(ppadrr(2))
ppatm=ppadrr(3)
ppaxy=aiint(ppadrr(4))
ppakk=1
end if
elseif ppfty="0" and application(x_ppck&ppfsn)<>"" then'del
application.lock
if ppfstr="0" and ppfstr="" then
application.Contents.Remove(x_ppck&ppfsn)
else
dim ppallz
ppallz=application(x_ppck&ppfsn)
application(x_ppck&ppfsn)=ppfsn&x_ppgx&left(ppallz,len(ppallz)-1)&ppfstr
end if
application.unlock
elseif ppfty="2" and instr(ppfstr,x_ppgx)>0 then'write
application.lock
application(x_ppck&ppfsn)=ppfsn&x_ppgx&ppfstr
application.unlock
end if
end if
end function
'-----------------------------------
'pp jingpai show
'-----------------------------------
dim ppshid,ppshyh,ppshhj,ppshsf,ppshzl,ppshsl,ppshyhx,ppshhjx,ppshsfx,ppshzlx,ppshslx,ppshxxx,ppshusx,ppdts,ppduhty,ppduhjq,ppduhje,ppduhus
function ppshow(ppfstr,ppfty)
'response.Write ppfstr
dim ppxdrr,ppxdi,ppxdls,ppxdud,ppadrr,ppadi,ppadls,ppadud,ppbdrr,ppbdsn,ppbdoy,ppbdjg,ppbdbt,ppbdel,ppadus
ppshyhx=0
ppshzlx=0
ppshslx=0
ppshhjx=0
ppshid=0
ppshxxx=""
if not isNumeric(ppfty) then ppfty=4
ppshow="<table border=0 cellspacing=0 cellpapping=0 class=d-vt>"
if ppfstr<>"" then'0-1-A
ppxdrr=split(ppfstr,x_ppgx)
ppxdud=ubound(ppxdrr)
if ppxdud>0 then
for ppxdi=1 to ppxdud'@@
ppxdls=ppxdrr(ppxdi)
if ppxdls<>"" then
ppadrr=split(ppxdls,x_ppga)
ppadud=ubound(ppadrr)
ppadus=ppadrr(0)
if ppadud>0 then
ppshzl=0
ppshsl=0
ppshhj=0
ppshid=ppshid+1
ppshow=ppshow&"<tr class=d-vta><td colspan="&ppfty&">"&ppadus&" 竞拍"&ppxdi&"</td></tr>"
if ppfty="7" then
ppshow=ppshow&"<tr class=d-vtt><td>名称</td><td width=32>定金</td><td width=32 align=center>出价</td><td width=32 align=center>状态</td></tr>"
else
ppshow=ppshow&"<tr class=d-vtt><td>名称</td><td width=32>定金</td><td width=32 align=center>出价</td></tr>"
end if
for ppadi=1 to ppadud'##-##-##
ppadls=ppadrr(ppadi)
ppbdrr=split(ppadls,x_ppgb)'||
if ubound(ppbdrr)=4 then
ppbdsn=ppbdrr(0)
ppbdoy=ppbdrr(1)
ppbdjg=ppbdrr(2)
ppbdbt=ppbdrr(3)
ppbdel=ppbdrr(4)
if not isNumeric(ppbdoy) then ppbdoy=0
if not isNumeric(ppbdjg) then ppbdjg=0
if ppadi mod 2=0 then
ppshow=ppshow&"<tr class=d-vt1>"
else
ppshow=ppshow&"<tr class=d-vt0>"
end if
ppshow=ppshow&"<td><a class=d-vbt target=""_blank"" href=""/?info/"&ppbdsn&".html"">"&ppbdbt&"</a></td><td>"&ppbdoy&"</td>"
if ppfty="7" then
ppshow=ppshow&"<td align=center>"&ppbdjg&"</td><td align=center>"
Call ppapp(1,ppbdsn,"")
if ppaus="" then
ppshow=ppshow&"<span class=d-vfs title=竞拍结束或已失效>-</span>"
elseif lcase(ppaus)=lcase(e_uer) then
if ppaxy=3 then
ppshow=ppshow&"<span class=d-vajx title=您已成功竞拍>☆</span>"
else
ppshow=ppshow&"<span class=d-vaj title=正在领先>√</span>"
end if
else
if ppaxy=3 then
ppshow=ppshow&"<a class=d-vajx title=竞拍结束（点击取回定金） href=?del/"&ppbdsn&"/"&ppadus&">○</a>"
else
ppshow=ppshow&"<a class=d-vajx title=已被淘汰（删除后取回定金） href=?del/"&ppbdsn&"/"&ppadus&">×</a>"
end if
end if
ppshow=ppshow&"</td>"
else
ppshow=ppshow&"<td align=center>"&ppbdjg&"</td>"
end if
ppshow=ppshow&"</tr>"
ppshzl=ppshzl+1
ppshsl=ppshsl+ppbdjg
ppshhj=ppshhj+ppbdoy
end if
next
ppshsf=ppshhj
ppshow=ppshow&"<tr class=d-vtd><td colspan="&ppfty&" align=left>竞拍小计："&ppshzl&" 件<br>出价小计："&ppshsl&" 元<br>定金小计："&ppshhj&" 元</td></tr>"
ppshzlx=ppshzlx+ppshzl
ppshslx=ppshslx+ppshsl
ppshhjx=ppshhjx+ppshhj
ppshyhx=ppshyhx+ppshyh
ppshsfx=ppshsfx+ppshsf
end if
end if
next
ppshow=ppshow&"<tr class=d-vtd><td colspan="&ppfty&" align=left>竞拍总数："&ppshzlx&" 件<br>出价合计："&ppshslx&" 元<br>定金合计："&ppshhjx&" 元</td></tr>"
end if
end if'0-1-C
if ppshslx=0 then ppshow=ppshow&"<tr class=d-vtd><td colspan="&ppfty&" align=center>暂无商品</td></tr>"
ppshow=ppshow&"</table>"
End function
'-----------------------------------
'car show
'-----------------------------------
function ppcar(ppfstr)
ppcar=ppshow(ppfstr,7)
'ppcar=ppshow(ppfstr,7,0)
End function
'-----------------------------------
'order read
'-----------------------------------
function ppread(ppfstr)
ppread=ppshow(ppfstr,4)
end function
'-----------------------------------
'PS:jingpai car
'=ppcar(ppfkg/i_xkadd)
'-----------------------------------
Function ppcartc(ppfkg)
ppcartc=""
if ppfkg>0 then
Response.Cookies(x_ppck&"sk")=ew_sk&"|"&ep_sx
ppcartc=ppcartc&"<script type=""text/javascript"">var ddx="&ppfkg&";var ddm=""竞拍场"";var ddr="""&eshref(s_druser&"p/",3)&""";</script><script language=""JavaScript"" src="""&eshref(s_druser&"p/pp.js",3)&"""></script>"
end if
End Function
'-----------------------------------PP-----------------------------------
'-----------------------------------
'PS:jingpai car
'=ppcar(ppfkg/i_xkadd)
'-----------------------------------
Function pplist(eafel,eafqh,eafuq,eafef,eafpg,eafps,eafph,eafqx,eafqxyz,eafity,eafuqs,eafxpur,eafxpms,eafxpum)
if not ainull(eafuqs) and not aibj(right(eafuqs,len(g_urg)),g_urg) then eafuqs=eafuqs&g_urg
if len(eafqh)=3 and right(eafqh,1)<>"2" then pplist=pplist&icmenu("","k-3","1|"&ep_sn,ef_sn,4004,0,14,28,0)&"<div class=cr></div>"
'cdv 0
e_mx=e_mx&epfl(ep_ef,"",ep_fl,eafef,eshref(eafuq&g_urg&g_gx&g_urg&eafxpms&g_urg&g_urg&g_urg&eafph&g_urz,eafxpum))
'cdv 1

iclls=icliqls(0,eafxpms,eshref(eafuqs&g_gg&g_urg&g_urg&g_urg&eafph&g_urz,eafxpum))

Call aiss(ep_el,0)
pplist=pplist&icliq(iclls,eafuqs&eafxpms,eafph,eafqxyz,eafity,"ai")
Call aitj(ep_sn&g_urg&eafef&g_urg&eafph,ep_ef,0)

if aiint(iclapp)>0 or ew_ap<2 or (aiint(eafpg)>1 and ew_ap<4) or aiint(eafps)>0 or len(eafqh)=3 then
g_app=""
else
if aibj(eafxpms,s_umlpy) then
eafps=i_nmhc
if not ainull(g_app) then g_app=g_app&"_"&s_umlpy
else
eafps=i_nmlb
if not ainull(g_app) then g_app=g_app&"_"&s_umlb
end if
end if
if not ainull(g_app) then g_app=esapm(2,g_app)

if left(eafqh,1)="3" then
g_app=""
eawhere=replace(eawhere,"ai_xy>0 and","")
eawhere=replace(eawhere," and ai_xy>0","")
eawhere=replace(eawhere,"ai_xy>0","")
if not ainull(eawhere) then eawhere=eawhere&" and "
eawhere=eawhere&"ai_us='"&uk_us&"'"
end if

d_alie=ealie(s_umlb)
if len(eafqh)=3 then g_app=""
'_______________________________________________
if gyslist(eabid,d_alie,eabiao,eawhere,eaorder,eafxpur,eafpg,eafps,2000,g_app) then
lidti=""
'top------0
if aibj(eafxpms,s_umlb) then
if len(eafqh)=3 then lidti=lidti&"<b>管理</b>"
if (i_xkuhy>1 and instr(lcase(g_ud)&"/",s_drwap)=0) or (i_xkuhy>0 and aibj(g_u0,s_umgl)) then lidti=lidti&"<u>来自</u><u>编辑</u>"
lidti=lidti&"<b>当前状态</b>"
lidti=lidti&"<u>当前价格</u>"
if (icskg(ew_pj,ep_pj,0) and instr(lcase(g_ud)&"/",s_drwap)=0) or (icskg(ew_pj,ep_pj,0) and aibj(g_u0,s_umgl)) then lidti=lidti&"<i>我顶</i>"
if (ew_dj>2 and instr(lcase(g_ud)&"/",s_drwap)=0) or (ew_dj>0 and aibj(g_u0,s_umgl)) then lidti=lidti&"<i>浏览</i>"
lidti=lidti&"名称"
end if
'top------1
pplist=pplist&iclisttop(eafxpms,lidti)
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
lids1=""
lids2=""
lids3=""
lids4=""
gysay=split(gysax(gysi),g_gy)
if aibj(eafxpms,s_umlpc) then
ai_ss=gysro("ai_nr",eabiao&"_"&gysay(29),"ai_sn='"&gysay(1)&"'","")
else
ai_ss=gysay(8)
end if
if aibj(eafxpms,s_umlpc) then
d_alzy=esnr(ai_ss)
Call easzy(3,gysay(0),gysay(1),"0",gysay(2),d_alzy,gysay(28),"")
else
d_alzy=easzy(4,gysay(0),gysay(1),ai_ss,gysay(2),"",gysay(28),"")
end if
if ainull(gysay(9)) then
lidbt=""
else
lidbt=easlic(1,0,ep_sx,gysay(13),gysay(9),gysay(4),gysay(14),gysay(3),gysay(7))&esto(gysay(13),gysay(2),d_alzy)&easlic(1,1,ep_sx,gysay(13),gysay(9),gysay(4),gysay(14),gysay(3),gysay(7))
end if
lidtt=eaalt(esto(gysay(13),gysay(2),d_alzy),gysay(3),gysay(4),gysay(5),usren(gysay(6)&g_gg&gysay(12)),gysay(23))
if ainull(eafuqs) or left(eafqh,1)="5" then
lidlj=eaurl(gysay(11)&g_urg&esnf(gysay(10))&g_urg&s_umxx&g_urg&gysay(1)&g_urz,eafxpum,esnk(gysay(11)),gysay(26))
else
lidlj=eshref(eafuqs&s_umxx&g_urg&gysay(1)&g_urz,eafxpum)
end if
if len(eafqh)=3 then
lidgl=""
if  eafqx>0 then
lidgl=lidgl&"<b>"
if  eafqx>1 and left(eafqh,1)<>"3" then lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"
lidgl=lidgl&aibuttonk(eshref(eafuqs&s_umxg&g_urg&gysay(0)&g_urz,eafxpum),"","","","f-sb",s_umxgs)&aibuttonk(eshref(eafuqs&s_umsc&g_urg&gysay(0)&g_urg&gysay(1)&g_urz,eafxpum),s_umscs&s_udeas&s_ztqr,"","","f-sb",s_umscs)&"</b>"
end if
end if

'top loop------0
if aibj(eafxpms,s_umlpy) then
lids1=gysay(4)
'list
elseif aibj(eafxpms,s_umlb) then
if (i_xkuhy>1 and instr(lcase(g_ud)&"/",s_drwap)=0) or (i_xkuhy>0 and aibj(g_u0,s_umgl)) then lids1=lids1&"<u>"&usren(gysay(6)&g_gg&gysay(12))&"</u><u>"&aistr(gysay(23)&g_gg&ew_lr)&"</u>"

if isdate(gysay(18)) then
if datediff("s",aitmx(gysay(18),6),now())>0 then
lids1=lids1&"<b>等待拍卖开始</b>"
lids1=lids1&"<u>"&gysay(27)&"</u>"
end if
elseif not isdate(gysay(18)) then
lids1=lids1&"<b>拍卖时间未知</b>"
lids1=lids1&"<u>"&gysay(15)&"</u>"
elseif aibj(gysay(14),"0") then
lids1=lids1&"<b>拍卖已经结束</b>"
lids1=lids1&"<u>"&gysay(15)&"</u>"
else
lids1=lids1&"<b class=ft>已到拍卖时间</b>"
lids1=lids1&"<u>"&aiajax(gysi,2,eshref(s_druser&"p/?ajax/"&gysay(1)&"/2/"&gysay(27)&"",3),"jg"&gysay(1)&"","ftj","<span id=jg"&gysay(1)&">"&gysay(15)&"</span>")&"</u>"
end if
if (icskg(ew_pj,ep_pj,0) and instr(lcase(g_ud)&"/",s_drwap)=0) or (icskg(ew_pj,ep_pj,0) and aibj(g_u0,s_umgl)) then lids1=lids1&"<i>"&aiint(gysay(5)&g_gg&"0")&"</i>"
if (ew_dj>2 and instr(lcase(g_ud)&"/",s_drwap)=0) or (ew_dj>0 and aibj(g_u0,s_umgl)) then lids1=lids1&"<i>"&aiint(gysay(4)&g_gg&"0")&"</i>"
'pic
elseif aibj(eafxpms,s_umlp) then
lids1=easpic(gysay(7),esto(gysay(13),gysay(2),d_alzy),lidtt,lidlj,0)
lids2=usren(gysay(6)&g_gg&gysay(12))
if aiint(gysay(13))=2 or aiint(gysay(13))=10 or aiint(gysay(13))=12 then
if aiint(gysay(15))>0 then
lids2=lids2&"<s>"&gysay(15)&" 元</s>"
else
lids2=lids2&"<s>面议</s>"
end if
elseif aiint(gysay(13))=13 then
if aiint(gysay(15))>0 or aiint(gysay(16))>0 then
lids2=lids2&"<s>"&aiint(gysay(15))&"-"&aiint(gysay(16))&" 元</s>"
else
lids2=lids2&"<s>面议</s>"
end if
end if
'other
else
lids1=gysay(24)
if i_xkuhy>1 then lids2=lids2&"来自："&usren(gysay(6)&g_gg&gysay(12))&" "
if ew_dj>2 and ewxgn("dj") then lids2=lids2&"浏览："&aiint(gysay(4)&g_gg&"0")&"次 "
lids2=lids2&aitms("时间：",gysay(3),2)
if not ainull(d_alzy) or aibj(eafxpms,s_umlpw) then
lids3=lids3&"<div class=""l-cd lh"""
if aibj(eafxpms,s_umlpc) and ailen(d_alzy)>i_nmzs then lids3=lids3&" style=""height:"&i_nmlg&"px;overflow:auto;""  onclick=""this.style.height='auto';"""
lids3=lids3&">"
if aibj(eafxpms,s_umlpw) then lids3=lids3&easpic(gysay(7),esto(gysay(13),gysay(2),d_alzy),esto(gysay(13),gysay(2),d_alzy),lidlj,1)
lids3=lids3&"<div class=""fl"" style=""width:auto;height:auto;"">"
lids3=lids3&xppbox(gysay(11),gysay(10),gysay(29),gysay(1),gysay(9),gysay(14),gysay(26),gysay(27),gysay(15),gysay(16),gysay(18),gysay(6),gysay(2),gysay(13),gysay(26),x_ppck&gysay(1),"320px","180px")
lids3=lids3&"</div>"
if aibj(eafxpms,s_umlpc) then
lids3=lids3&easpic(gysay(7),esto(gysay(13),gysay(2),d_alzy),esto(gysay(13),gysay(2),d_alzy),lidlj,2)&d_alzy
else
if ainull(gysay(28)) then
lids3=lids3&d_alzy
else
lids3=lids3&s_ztmm
end if
end if
lids3=lids3&"</div>"
end if
end if
'top loop------1
pplist=pplist&iclist(eafxpms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next

pplist=pplist&iclistend(eafxpms,"")
else
pplist=pplist&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if
'_______________________________________________
if ainull(eafuqs) then
pplist=pplist&iclih(gyspage,eafqxyz,eafity,eshref(s_umsc&"-x"&g_urz,eafxpum),"ai")
else
pplist=pplist&iclih(gyspage,eafqxyz,eafity,eshref(eafuqs&s_umsc&"-x"&g_urz,eafxpum),"ai")
end if
End Function
'-----------------------------------
'jingpai for che show
'=)
'-----------------------------------
Function xppche(easfep,easfef,easfsb,easfsn,easfxy,easfpx,easfoy,easfoz,easfjg,easfjy,easft2,easfus,easfbt,easfel,easfot,eafnm,eafwd,eafht,easfup,easfpf)
xppche="<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""5"" class=""c-x""><tr>"
if ainull(easfup) then
xppche=xppche&"<td width=""60%"">"
else
xppche=xppche&"<td width=""30%"">"&easpic(easfup,easfbt,easfbt,easfup,4)&"</td>"
xppche=xppche&"<td width=""30%"">"
end if
'xppche=xppche&"<p class=""ftt"">车辆星级："&aiarr(i_bxy,"|",aiint(easfxy))&"</p>"
if ainull(easfpf) or ainull(easfef) then
xppche=xppche&""
else
xppche=xppche&eascs(easfpf,easfef,0)
end if
xppche=xppche&"</td>"
xppche=xppche&"<td width=""40%"">"&xppbox(easfep,easfef,easfsb,easfsn,easfxy,easfpx,easfoy,easfoz,easfjg,easfjy,easft2,easfus,easfbt,easfel,easfot,eafnm,eafwd,eafht)&"</td>"
xppche=xppche&"</tr></table>"
End Function
'-----------------------------------
'jingpai mdb
'=xppdb(eafty)
'-----------------------------------
Function xppdb(eafty,eafsb,eafsn,eafyr,eafoy,eafjy,eafus,eafer,eafjg)
dim xppdguo,xppdjg,xppdgai,xppdgus,xppdger
xppdguo=0
xppdb=""
eafoy=aiint(eafoy)
eafjg=aiint(eafjg)
xppdjg=aiint(gysro("ai_jg",eabiao,"ai_sn='"&eafsn&"'",""))
if eafjg>0 then
if eafjg>xppdjg then
xppdgai=",ai_jg="&eafjg&",ai_uf='"&e_uer&x_ppgx&now()&"'"
else
xppdgai=""
end if

if aibj(eafty,"0") or aibj(eafty,"1") then'预约出价处理or出价处理

if xppdjg=0 then'竞拍启动

if eafoy=0 then
Call uykpp(0,eafsn,eafyr,eafus,eafoy)
Call gysgx("ees_ai_"&eafsb,"ai_xt=ai_xt"&espdbi()&"'"&espxx("记录：出价"&eafjg&i_gg&e_uer&i_gg&e_uxy)&"',ai_jg="&eafjg&",ai_uf='"&e_uer&x_ppgx&now()&"'","ai_sn='"&eafsn&"'")
Exit Function
else
if not gysgx("ees_us","us_jq=us_jq-"&eafoy&",us_xt=us_xt"&espdbi()&"'"&espxx("拍卖"&eafsn&"启动，缴纳竞拍定金"&eafoy&i_gg&eafus)&"'","us_er='"&eafus&"' and us_jq>="&eafoy&"") then
Call gysgx("ees_ai_"&eafsb,"ai_oy=0,ai_xt=ai_xt"&espdbi()&"'"&espxx("操作：卖家竞拍定金不足，取消定金服务"&eafoy&"。"&i_gg&eafus)&"'","ai_sn='"&eafsn&"'")
xppdb="卖家竞拍定金不足，取消定金服务"&eafoy&"。"
Exit Function
end if
end if

if gysgx("ees_us","us_jq=us_jq-"&eafoy&",us_xt=us_xt"&espdbi()&"'"&espxx("启动拍卖"&eafsn&"，缴纳竞拍定金"&eafoy&i_gg&e_uer)&"'","us_er='"&e_uer&"' and us_jq>="&eafoy&"") then
Call gysgx("ees_ai_"&eafsb,"ai_xt=ai_xt"&espdbi()&"'"&espxx("拍卖"&eafsn&"启动，缴纳竞拍定金"&eafoy&i_gg&eafus)&espxx("记录：出价"&eafjg&i_gg&e_uer&i_gg&e_uxy)&"',ai_jg="&eafjg&",ai_uf='"&e_uer&x_ppgx&now()&"'","ai_sn='"&eafsn&"'")
Call uykpp(0,eafsn,eafyr,eafus,eafoy)
Exit Function
else
Call gysgx("ees_us","us_jq=us_jq+"&eafoy&",us_xt=us_xt"&espdbi()&"'"&espxx("拍卖"&eafsn&"启动失败，退回竞拍定金"&eafoy&i_gg&e_uer)&"'","us_er='"&eafus&"'")
xppdb="暂时无法支付竞拍定金"&eafoy&"。"
Exit Function
end if

else'竞拍进行中
if eafoy=0 or (aibj(eafer,e_uer) and not ainull(eafer)) or (eafjg<xppdjg and aibj(eafty,"1")) then'无需扣除定金
Call gysgx("ees_ai_"&eafsb,"ai_xt=ai_xt"&espdbi()&"'"&espxx("记录：出价"&eafjg&i_gg&e_uer&i_gg&e_uxy)&"'"&xppdgai&"","ai_sn='"&eafsn&"'")
Exit Function
else'需要处理定金
if eafjg>xppdjg then
if gysgx("ees_us","us_jq=us_jq-"&eafoy&",us_xt=us_xt"&espdbi()&"'"&espxx("参与拍卖"&eafsn&"，缴纳竞拍定金"&eafoy&i_gg&e_uer)&"'","us_er='"&e_uer&"' and us_jq>="&eafoy&"") then
if not ainull(eafer) and not aibj(eafer,e_uer) then Call gysgx("ees_us","us_jq=us_jq+"&eafoy&",us_xt=us_xt"&espdbi()&"'"&espxx("拍卖"&eafsn&"出价被超过，退回竞拍定金"&eafoy&i_gg&eafer)&"'","us_er='"&eafer&"'")
Call gysgx("ees_ai_"&eafsb,"ai_xt=ai_xt"&espdbi()&"'"&espxx("记录：出价"&eafjg&i_gg&e_uer&i_gg&e_uxy)&"'"&xppdgai&"","ai_sn='"&eafsn&"'")
Exit Function
else
xppdb="无法支付竞拍定金"&eafoy&"。"
Exit Function
end if
else
xppdb="出价过低"&eafjg&"<"&xppdjg&"。"
Exit Function
end if
end if
end if

if instr(request.Cookies(x_ppck),eafsn)=0 and xppdgai<>"" then Call usergx(0,"jq",int(int(e_ujq)-eafoy))


elseif aibj(eafty,"2") then'买家定金
if aiint(eafjg)>aiint(eafjy) then
uy_xy=2
else
uy_xy=1
end if
if uykpp(uy_xy,eafsn,eafyr,eafer,eafjg) then
xppdb=""
end if

end if'out
end if
End Function
'-----------------------------------
'jingpai huancun
'=xpphc(eafty)
'-----------------------------------
Function xpphc(eafty,eafsb,eafsn,eafoz,eafoy,eafjy,eafus,eafbt,eafel,eafer,eafjg,eafzf)
if aibj(eafus,e_uer) then'rz
xpphc=xpphc&"<b>这是您发起的竞拍，自己不能出价！</b><br>"
elseif e_uzy<1 then'rz
xpphc=xpphc&"<b>仅限通过认证的注册会可员参与出价！</b><br>"
elseif i_xkapp<1 then'rz
xpphc=xpphc&"<b>竞拍系统暂停服务！</b><br>"
else'rz
dim easdtcj,easdts,easdcl
if aibj(aireq("jgi"),"1") and aiint(request.Form("jg"))>=aiint(eafjg) and request.Form("cs")<>"" then
easdtcj=int(aireq("jg"))
easdcl=aireq("jga")
if aibj(easdcl,"1") then
easdcl=1
else
easdcl=0
end if
if easdtcj<int(eafjg)+int(eafzf) and easdcl=0 then
xpphc=xpphc&aigo("提示：您的出价不能低于"&int(eafjg)+int(eafzf)&"。",0)
else
easdts=xppdb(easdcl,eafsb,eafsn,eafbt,eafoy,eafjy,eafus,eafer,easdtcj)
if easdts="" then
dim ppwrr
ppwrr=split(request.Form("cs")&x_ppgb&x_ppgb&x_ppgb&x_ppgb&x_ppgb&x_ppgb,x_ppgb)
'0sn/1oy/2bt/3us/4oz/5jg
if eafty=1 then
xpphc=xpphc&ppsai(9,"",ppwrr(0),aiint(ppwrr(1)),easdtcj,ppwrr(2),aiint(ppwrr(6)),ppwrr(3),aiint(ppwrr(4)),aiint(ppwrr(5)))
else
Call ppapp(2,ai_sn,e_uer&x_ppgx&easdtcj&x_ppgx&now()&x_ppgx&"0")
if easdcl=1 then
xpphc=xpphc&aigo("提示：预约出价"&easdtcj&"成功！",0)
else
xpphc=xpphc&aigo("提示：出价"&easdtcj&"成功！",0)
end if
end if
else
xpphc=xpphc&aigo("提示："&easdts,0)
end if
end if
end if

xpphc=xpphc&"<form action="""" method=""post"" class=tc>"
if eafty=1 then
xpphc=xpphc&"您的出价须大于"&int(eafjg+eafzf)&"元<br><div class=""d-vfsl""><input type=""number"" name=""jg"" id=""jg"" class=""d-vfin"" min=""1"" value="""&int(eafjg+eafzf)&""" onkeyup=""value=value.replace(/\D/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))""> <span class=""d-vfis f-sc"" onClick=""document.getElementById('jg').value=parseInt(parseInt(document.getElementById('jg').value)+"&int(eafzf)&");"">+"&int(eafzf)&"</span></div>"
else
xpphc=xpphc&"请输入您的预约价格<br><div class=""d-vfsl""><input type=""hidden"" name=""jga"" id=""jga"" value=""1""><input type=""number"" name=""jg"" id=""jg"" class=""d-vfin"" min=""1"" value=""0"" onkeyup=""value=value.replace(/\D/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))""> <span class=""d-vfis f-sc"" onClick=""document.getElementById('jg').value=parseInt(parseInt(document.getElementById('jg').value)+"&int(eafzf)&");"">+"&int(eafzf)&"</span></div>"
end if
xpphc=xpphc&"<input type=""hidden"" name=""cs"" id=""cs"" value="""&eafsn&x_ddgb&eafoy&x_ddgb&eafbt&x_ddgb&eafus&x_ddgb&eafoz&x_ddgb&eafjg&x_ddgb&eafel&"""><input type=""hidden"" name=""jgi"" id=""jgi"" value=""1"">"
xpphc=xpphc&"<div class=""crg""></div><button type=""submit"" class=""f-sb f-skx""><span class=""glyphicon glyphicon-glass""></span> 出价</button>"
if eafty=1 then xpphc=xpphc&"　<button type=""button"" class=""f-sc f-skx"" onclick=""parent.location.reload();""><span class=""glyphicon glyphicon-retweet""></span> 刷新</button>"
xpphc=xpphc&"</form>"

end if'rz
End Function
'-----------------------------------
'ai show box for jingpai
'=xppbox()
'-----------------------------------
Function xppbox(easfep,easfef,easfsb,easfsn,easfxy,easfpx,easfoy,easfoz,easfjg,easfjy,easft2,easfus,easfbt,easfel,easfot,eafnm,eafwd,eafht)
if isdate(easft2) and i_xkapp>0 then
if instr(easfot,x_ppgx)>0 then
dim easodrr,easoduu,easodtx
easodrr=split(easfot,x_ppgx)
easoduu=easodrr(0)
easodtx=aitmx(easodrr(1),22)
else
easoduu=""
easodtx=""
end if
xppbox=aiiframe(eshref(esnk(easfep)&g_urg&esnf(easfef)&g_urg&"pp"&g_urg&easfsn&g_urg&easfxy&g_urg&easfpx&g_urg&easfoy&g_urg&easfoz&g_urg&easfjg&g_urg&easfjy&g_urg&aitmx(easft2,22)&g_urg&aijia(easfus)&g_urg&easodtx&g_urg&aijia(easoduu)&g_urg&aijia(easfbt)&g_urg&easfel&g_urg&easfsb,1),eafnm,eafwd,eafht)
else
if i_xkapp>0 then
xppbox="不符合竞拍要求！"
else
xppbox="竞拍系统暂时关闭！"
end if
end if
End Function
'-----------------------------------
'jingpai show
'=xppifr(xppisn)
'-----------------------------------
Function xppifr(eafsn)
dim xppiep,xppief,xppisb,xppisn,xppixy,xppipx,xppioy,xppioz,xppijg,xppijy,xppit2,xppitx,xppius,xppiuu,xppibt,xppiel
xppiep=g_u0
xppief=g_u1
xppisn=g_u3
xppisb=aiint(g_u16)
xppixy=aiint(g_u4)
xppipx=aiint(g_u5)
xppioy=aiint(g_u6)
xppioz=aiint(g_u7)
xppijg=aiint(g_u8)
xppijy=aiint(g_u9)
if not ainull(g_u10) then xppit2=aitmx(g_u10,23)
if not ainull(g_u11) then xppius=aijie(g_u11)
if not ainull(g_u12) then xppitx=aitmx(g_u12,23)
if not ainull(g_u13) then xppiuu=aijie(g_u13)
if not ainull(g_u14) then xppibt=aijie(g_u14)
xppiel=aiint(g_u15)
xppifr=""
if isdate(xppit2) and i_xkapp>0 then'竞拍开关
dim easdtma,easdtmb
g_app=esapm(1,xppisn)
if xppixy>0 then
xppifr=xppifr&"<div class=""c-x""><ul><li>"
else
xppifr=xppifr&"<div class=""c-x""><ul><li>提示：该信息未审核或已修改！<br>"
end if
'xppit2时间：竞拍开始
easdtma=DateAdd("n",30,xppit2)'时间：30分钟时限
easdtmb=DateAdd("n",60,xppit2)'时间：60分钟时限
'response.Write easdtma&now()&datediff("s",easdtma,now())&"A"&datediff("s",easdtma,now())&"B"&datediff("s",xppit2,now())

if datediff("s",xppit2,now())<0 then'0-0-PD拍卖等待期(欲出价，隐藏起拍价)ai_px=10
if xppipx<10 or xppipx>99 then
Call gysgx("ees_ai","ai_px=10","ai_sn='"&xppisn&"'")
Call eskod(0,0,g_app)
xppifr=xppifr&"<a target=""_blank"" href="""&eshref(xppiep&g_urg&xppief&g_urg&s_umxx&g_urg&xppisn&g_urz,1)&""">提示：本场拍卖重新计时，请耐心等待，点击进入！</a><br>"
else
if xppioz>0 then xppifr=xppifr&"起拍价：<b>"&xppioz&"</b> 元<br>"
xppifr=xppifr&"倒计时："&aiajax(0,1,eshref(s_druser&"p/?time/"&xppisn&"/"&aitmx(xppit2,22)&"",3),"tm","","<b id=tm>"&aidjtm(0,xppit2,"")&"</b>")&"<br>"
if xppijy>0 then
if aiint(xppijg)>aiint(xppijy) then
xppifr=xppifr&"心理价：<b>"&xppijy&"</b> 元<br>"
elseif len(xppijg)=len(xppijy)-1 and len(xppijy)>2 then
xppifr=xppifr&"心理价：<b>"
xppifr=xppifr&left("**********",2)&right(xppijy,len(xppijg)-1)
xppifr=xppifr&"</b> 元<br>"
else
xppifr=xppifr&"心理价：<b> * </b> 元<br>"
end if
end if
if xppioy>0 then
xppifr=xppifr&"保证金：<b>"&xppioy&"</b> 元<br>"
else
xppifr=xppifr&"保证金：<b>免费</b><br>"
end if
if xppixy=0 then
xppifr=xppifr&"请注意：此商品暂未审核无法参与竞拍！<br>"
elseif xppioz>0 then
xppifr=xppifr&"请注意：请耐心等待拍卖开始！<br>"
else
xppifr=xppifr&xpphc(0,xppisb,xppisn,xppioz,xppioy,xppijy,xppius,xppibt,xppiel,ppaus,ppajg,x_ppzf)
end if
end if

elseif (datediff("s",easdtmb,now())>0 and xppipx<10) or xppipx=1 then'0-0-PZ拍卖最终时限
if xppijg>0 then
xppifr=xppifr&"本场最高价：<b>"&xppijg&"</b> 元"
else
xppifr=xppifr&"<b>本场拍卖暂无出价</b>"
end if
if xppioz>0 then xppifr=xppifr&" <s>起拍价 "&xppioz&" 元</s>"
xppifr=xppifr&"<br>"
if xppijy>0 then
if aiint(xppijg)>aiint(xppijy) then
xppifr=xppifr&"卖家心理价：<b>"&xppijy&"</b> 元<br>"
elseif len(xppijg)=len(xppijy)-1 and len(xppijy)>2 then
xppifr=xppifr&"卖家心理价：<b>"
xppifr=xppifr&left("**********",2)&right(xppijy,len(xppijg)-1)
xppifr=xppifr&"</b> 元<br>"
else
xppifr=xppifr&"卖家心理价：<b> * </b> 元<br>"
end if
end if
xppifr=xppifr&"竞拍开始时："&aitmx(xppit2,7)&"<br>"
if not ainull(xppitx) then
xppifr=xppifr&"竞拍结束时："&aitmx(xppitx,7)&"<br>"
else
xppifr=xppifr&"竞拍结束时："&aitmx(easdtmb,7)&"<br>"
end if
if xppioy>0 then
xppifr=xppifr&"竞拍保证金：<b>"&xppioy&"</b> 元<br>"
else
xppifr=xppifr&"竞拍保证金：<b>免费</b><br>"
end if

else
'PUT IN APP 0
Call ppapp(1,xppisn,"")
if ppakk="0" then
Call gysread("ai_jg,ai_uf",eabiao,"ai_sn='"&xppisn&"'","")
ppaus=split(ai_uf&x_ppgx,x_ppgx)(0)
ppajg=ai_jg
ppatm=split(ai_uf&x_ppgx,x_ppgx)(1)
Call ppapp(2,xppisn,ppaus&x_ppgx&ppajg&x_ppgx&ppatm&x_ppgx&"1")
Call ppapp(1,xppisn,"")
end if
'PUT IN APP 1
if isdate(ppatm) then
if datediff("s",easdtma,DateAdd("n",1,ppatm))>0 then easdtma=DateAdd("n",1,ppatm)
end if
if datediff("s",easdtma,easdtmb)<0 then easdtma=easdtmb
if datediff("s",easdtma,now())>0 then'0-0-PZ拍卖结束ai_px=0**
if xppipx>9 and not aibj(ppaxy,"3") then
Call gysgx("ees_ai","ai_px=1","ai_sn='"&xppisn&"'")
Call eskod(0,0,g_app)
Call ppapp(0,xppisn,"3")
'Call ppapp(2,xppisn,ppaus&x_ppgx&ppajg&x_ppgx&ppatm&x_ppgx&"3")
if not ainull(ppaus) and aiint(ppajg)>0 then
xppifr=xppifr&xppdb(2,xppisb,xppisn,"["&ppaus&"于"&ppatm&"竞拍成功]",xppioy,xppijy,xppius,ppaus,ppajg)
end if
end if
if aibj(ppaus,e_uer) and e_uxy>0 then
xppifr=xppifr&"<a target=""_blank"" href="""&eshref(s_uduy&g_urg&s_umlb&g_urg&"5"&g_urz,1)&""" class=""f-sb f-sbxx""><span class=""glyphicon glyphicon-retweet""></span> 恭喜您成为最后的赢家！</a><br>"
else
xppipx=1
Response.Redirect eshref(esnk(xppiep)&g_urg&esnf(xppief)&g_urg&"pp"&g_urg&xppisn&g_urg&xppixy&g_urg&xppipx&g_urg&xppioy&g_urg&xppioz&g_urg&xppijg&g_urg&xppijy&g_urg&aitmx(xppit2,22)&g_urg&aijia(xppius)&g_urg&xppitx&g_urg&aijia(xppiuu)&g_urg&aijia(xppibt)&g_urg&xppiel&g_urg&xppisb,1)
'xppifr=xppifr&"<a target=""_blank"" href="""&eshref(xppiep&g_urg&xppief&g_urg&s_umxx&g_urg&xppisn&g_urz,1)&""">对不起，本场拍卖已经在"&easdtmb&"结束！</a><br>"
end if

elseif datediff("s",easdtma,now())<0 then'0-0-B拍卖进行中ai_px=100
if xppipx<100 and not aibj(ppaxy,"2") then
Call gysgx("ees_ai","ai_px=100","ai_sn='"&xppisn&"'")
Call eskod(0,0,g_app)
Call ppapp(0,xppisn,"2")
xppipx=100
Response.Redirect eshref(esnk(xppiep)&g_urg&esnf(xppief)&g_urg&"pp"&g_urg&xppisn&g_urg&xppixy&g_urg&xppipx&g_urg&xppioy&g_urg&xppioz&g_urg&xppijg&g_urg&xppijy&g_urg&aitmx(xppit2,22)&g_urg&aijia(xppius)&g_urg&xppitx&g_urg&aijia(xppiuu)&g_urg&aijia(xppibt)&g_urg&xppiel&g_urg&xppisb,1)
'xppifr=xppifr&"<a target=""_blank"" href="""&eshref(xppiep&g_urg&xppief&g_urg&s_umxx&g_urg&xppisn&g_urz,1)&""">提示：本场拍卖已经开始，点击进入！</a><br>"
else
if aiint(xppioz)>aiint(ppajg) then ppajg=aiint(xppioz)
xppifr=xppifr&"当前价格："&aiajax(0,2,eshref(s_druser&"p/?ajax/"&xppisn&"/2/"&xppioz&"",3),"jgshow","ftj","<b id=jgshow>"&ppajg&"</b>")&" 元"
if xppioz>0 then xppifr=xppifr&"  <span class=""glyphicon glyphicon-warning-sign b-cfq fsm"" title=""起拍价："&xppioz&" 元""></span>"

if xppijy>0 then
xppifr=xppifr&"　"
if aiint(ppajg)>aiint(xppijy) then
xppifr=xppifr&"心理底价：<b>"&xppijy&"</b> 元"
elseif len(ppajg)=len(xppijy)-1 and len(xppijy)>2 then
xppifr=xppifr&"心理底价：<b>"
xppifr=xppifr&left("**********",2)&right(xppijy,len(ppajg)-1)
xppifr=xppifr&"</b> 元"
else
xppifr=xppifr&"心理底价：<b> * </b> 元"
end if
end if
xppifr=xppifr&"<br>"

xppifr=xppifr&"剩余时间："&aiajax(1,1,eshref(s_druser&"p/?time/"&xppisn&"/"&aitmx(easdtma,22)&"",3),"tm","","<b id=tm>"&aidjtm(0,easdtma,"")&"</b>")
xppifr=xppifr&"  <span class=""glyphicon glyphicon-warning-sign b-cfq fsm"" title=""竞拍时限："&aitmx(easdtmb,5)&"""></span>"
xppifr=xppifr&"<br>"
if xppioy>0 then
xppifr=xppifr&"缴纳定金：<b>"&xppioy&"</b> 元<br>"
else
xppifr=xppifr&"缴纳定金：<b>免费</b><br>"
end if
xppifr=xppifr&xpphc(1,xppisb,xppisn,xppioz,xppioy,xppijy,xppius,xppibt,xppiel,ppaus,ppajg,x_ppzf)
end if




end if''0-0-E拍卖off



end if
xppifr=xppifr&"</li></ul></div>"
else
xppifr=xppifr&"<a target=""_blank"" href="""&eshref(xppiep&g_urg&xppief&g_urg&s_umxx&g_urg&xppisn&g_urz,1)&""">提示：本场拍卖暂停！</a>"
end if
End Function
%>