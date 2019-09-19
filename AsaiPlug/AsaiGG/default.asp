<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/inc.asp"--><%
if i_xkgg=1 then
Call opendb(i_dir)%><%
'<script language=javascript src=?sn-ty-wid-hei-ew-adscontent.js></scr ipt>
'Response.Cookies(cnm&ggfsn)=0
const cnm="asaigg"'缓存前缀:统计专用缓存前缀
const ctm=1'失效时间-cookies失效时间,单位小时
const cci=3'统计限制-点击我顶单用户最多统计次数.
dim hiarr
hiarr=split(replace(replace(Request.ServerVariables("QUERY_STRING"),".js",""),".html","")&"-----","-")
dim hix0,hix1,hix2,hix3,hix4,hix5,hixstr,hixstrl,hixdj,hixs,hixlj,hixlx,hixwhe,hixsn,hixsnjj,hixjs,hixwid,hixhei,hixty,hixfnm
hix0=hiarr(0)
hix1=aiint(hiarr(1))
hix2=aiint(hiarr(2))
hix3=aiint(hiarr(3))
hix4=aiint(hiarr(4))
hix5=hiarr(5)
hixfnm=cnm&hix0
'GET GG-id
Function ggdosn(ggfwhe)
dim hixsnrr,hixsnub
ggdosn=""
if gystop(10,"gg_id","gg_sn",w_dbqz&"gg",ggfwhe,"gg_px desc",i_hc0&g_apj&s_udgg&g_apj&"top10"&g_apj&replace(replace(replace(ggfwhe," ",""),"=",""),"gg_","")) then
hixsnrr=split(g_gx&gysar,g_gx)
hixsnub=ubound(hixsnrr)
'suiji-time----------0
'hixsnjj=aiint(right(timer,1))
'if hixsnjj>0 and hixsnjj<hixsnub then
'ggdosn=hixsnrr(hixsnjj)
'else
'ggdosn=hixsnrr(1)
'end if
'suiji-time----------1
if hixsnub>1 then
hixsnjj=aiint(request.Cookies(cnm&"jj"))
if hixsnjj>0 and hixsnjj<hixsnub then
hixsnjj=hixsnjj+1
ggdosn=hixsnrr(hixsnjj)
else
Randomize
hixsnjj=int(hixsnub*Rnd)+1
ggdosn=hixsnrr(hixsnjj)
end if
if hix5="88" then Response.Cookies(cnm&"jj")=hixsnjj
else
ggdosn=hixsnrr(1)
end if

end if
End Function
'MAKE GGty0read ck|1new start
Function ggdox(ggfty,ggfsn)
hixstr=ankop(1,0,"",i_hc0&g_apj&s_udgg&g_apj&ggfsn)
if ggfty=1 or ainull(hixstr) then
Call saik(rs,"select gg_sn,gg_xy,gg_ck,gg_cg,gg_bt,gg_lj,gg_jg,gg_tm,gg_t1,gg_ty,gg_xx,gg_jk,gg_jz,gg_jd,gg_nr from "&w_dbqz&"gg where gg_sn='"&ggfsn&"'",1,3)
if rs.eof and rs.bof then
hixstrl=""
else
hixty=aiint(rs("gg_ty"))
hixwid=rs("gg_ck")
hixhei=rs("gg_cg")
hixstrl=icgg(rs("gg_sn"),rs("gg_xy"),rs("gg_jk"),rs("gg_ck"),rs("gg_cg"),rs("gg_bt"),rs("gg_lj"),rs("gg_jg"),rs("gg_tm"),rs("gg_t1"),rs("gg_ty"),rs("gg_xx"),rs("gg_nr"))
hixlx=aiint(rs("gg_jk"))
if hixlx=1 then
rs("gg_jz")=rs("gg_jz")+1
rs.update
elseif hixlx=2 and hix1=88 then
hixlj=rs("gg_lj")
rs("gg_jd")=rs("gg_jd")+1
rs.update
elseif hixlx=3 then
if hix1=88 then
hixlj=rs("gg_lj")
rs("gg_jd")=rs("gg_jd")+1
else
rs("gg_jz")=rs("gg_jz")+1
end if
rs.update
end if
Response.Cookies(cnm&ggfsn)=hixdj+1
Response.Cookies(cnm&ggfsn).Expires=(now()+ctm/24)
Call ankop(2,0,hixstrl,i_hc0&g_apj&s_udgg&g_apj&ggfsn)
hixstr=hixstrl
end if
Call saig(rs)
end if
End Function
'IF----------------------0
hixwid=hix2
hixhei=hix3
if hix5="88" or hix1="88" or hixwid=0 or hixhei=0 then
if hix0<>"" and hix0<>"0" then'one gg
hixdj=aiint(Request.Cookies(cnm&hix0))
hixstr=ankop(1,0,"",i_hc0&g_apj&s_udgg&g_apj&hix1)
if hixdj<cci or ainull(hixstr) or hix1=88 then Call ggdox(1,hix0)
if hix1=88 then
Response.Redirect(hixlj)
else
hixjs=hixstr
end if

elseif hix1<>"" and hix1<>"0" then'ty list
hixwhe="gg_gy="&hix1&""
if hix4>0 then hixwhe=hixwhe&" and gg_ew="&hix4&""
hixsn=ggdosn(hixwhe)
if hixsn<>"" then Call ggdox(0,hixsn)
hixjs=hixstr

elseif hix2<>"" and hix2<>"0" then'wid list
hix3=aiint(hix3)
hixwhe="gg_ck="&hix2&""
if hix3>0 then hixwhe=hixwhe&" and gg_cg="&hix3&""
if hix4>0 then hixwhe=hixwhe&" and gg_ew="&hix4&""
hixsn=ggdosn(hixwhe)
if hixsn<>"" then Call ggdox(0,hixsn)
hixjs=hixstr
end if
end if

'IF----------------------1
if hixwid=0 then hixwid="100%"
if hixhei=0 then hixhei="auto"
if hix5="" or hix5="0" then
if hixhei="auto" then
Response.Write("document.write('<iframe border=""0"" name="""&hixfnm&""" onload=""Javascript:heightauto(this);"" onmouseover=""Javascript:heightauto(this);"" src="""&i_dir&s_drplug&"AsaiGG/?"&hix0&"-"&hix1&"-"&hix2&"-"&hix3&"-"&hix4&"-88"" allowtransparency=""true"" style=""background-color:transparent"" frameborder=""0"" width="""&hixwid&""" scrolling=""no""></iframe>');")
else
Response.Write("document.write('<iframe border=""0"" name="""&hixfnm&""" src="""&i_dir&s_drplug&"AsaiGG/?"&hix0&"-"&hix1&"-"&hix2&"-"&hix3&"-"&hix4&"-88"" allowtransparency=""true"" style=""background-color:transparent"" frameborder=""0"" width="""&hixwid&""" height="""&hixhei&""" scrolling=""no""></iframe>');")
end if
elseif hix5="88" then
Response.Write("<!doctype html><html><head><meta charset=""utf-8""><title>"&w_motm&"</title></head><link rel=""stylesheet"" type=""text/css"" rev=""stylesheet"" href="""&i_dir&s_drplug&"AsaiGG/css.css""><body>")
Response.Write(""&aiufile(0,replace(hixjs,"""","'"),p_upijj,p_upwdu)&"")
if aiint(hixty)<7 then Response.Write("<script src="""&i_dir&s_drplug&"AsaiGG/bgjs.js""></script>")
Response.Write("</body></html>")
elseif hix5<>"88" then'adscontent
hixjs=hix5
Response.Write("document.write("""&aiufile(0,replace(hixjs,"""","'"),p_upijj,p_upwdu)&""");")
end if

end if
%><!--#include file="../../AsaiInc/incma.asp"-->