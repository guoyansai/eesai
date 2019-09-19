<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"--><%
Call esq()
%><urlset>
<url>
<loc><%=e_tur%></loc>
<lastmod><%=year(now())%>-<%=right("0"&month(now()),2)%>-<%=right("0"&day(now()),2)%>T<%=right("0"&hour(now()),2)%>:<%=right("0"&minute(now()),2)%>:<%=right("0"&second(now()),2)%>+08:00</lastmod>
<changefreq>always</changefreq>
<priority><%=year(now())%><%=right("0"&month(now()),2)%><%=right("0"&day(now()),2)%><%=right("0"&hour(now()),2)%>.0</priority>
</url><%if epall<>"" then
gysax=split(epall,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)%>
<url><loc><%=left(e_tur,(len(e_tur)-1))%><%=eshref(gysay(1)&g_urz,1)%></loc><lastmod><%=year(now())%>-<%=right("0"&month(now()),2)%>-<%=right("0"&day(now()),2)%>T<%=right("0"&hour(now()),2)%>:<%=right("0"&minute(now()),2)%>:<%=right("0"&second(now()),2)%>+08:00</lastmod><changefreq>always</changefreq><priority>1.0</priority></url><%
next
end if
if gystop(i_nmtp,efbid,"ef_sn,ef_ep,ef_bt",efbiao,"ef_xy>0 and "&esrew("ef",ew_sn),"ef_id asc",i_hc0&g_apj&s_udew&aiint(ew_sn)&g_apj&s_udef&g_apj&s_umqb&g_apj&"SiteMap") then
gysax=split(gysar,g_gx)
end if
for gysi=0 to ubound(gysax)
if not ainull(gysax(gysi)) then
gysay=split(gysax(gysi),g_gy)%>
<url><loc><%=left(e_tur,(len(e_tur)-1))%><%=eshref(gysay(1)&g_urg&gysay(0)&g_urz,1)%></loc><lastmod><%=year(now())%>-<%=right("0"&month(now()),2)%>-<%=right("0"&day(now()),2)%>T<%=right("0"&hour(now()),2)%>:<%=right("0"&minute(now()),2)%>:<%=right("0"&second(now()),2)%>+08:00</lastmod><changefreq>daily</changefreq><priority>0.8</priority></url><%
end if
next
'@@0ai_id,1ai_sn,2ai_bt,3ai_tm,4ai_hi,5ai_xi,6ai_us,7ai_up,8ai_ss,9ai_xy,10ai_ef,11ai_ep,12ai_um,13ai_el,14ai_px,15ai_jg,16ai_jy,17ai_t1,18ai_t2,19ai_oy,20ai_oz,21ai_bd,22ai_bc,23ai_ee,24ai_jj,25ai_eq,26ai_cs,27ai_yy,28ai_mm
gysax=split(earr(0,s_umqb),g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)%>
<url><loc><%=left(e_tur,(len(e_tur)-1))%><%=eaurl(esnk(gysay(11))&g_urg&esnf(gysay(10))&g_urg&s_umxx&g_urg&gysay(1)&g_urz,1,esnk(gysay(11)),"")%></loc><lastmod><%=year(now())%>-<%=right("0"&month(now()),2)%>-<%=right("0"&day(now()),2)%>T<%=right("0"&hour(now()),2)%>:<%=right("0"&minute(now()),2)%>:<%=right("0"&second(now()),2)%>+08:00</lastmod><changefreq>always</changefreq><priority>1.0</priority></url><%
next
%>
</urlset><!--#include file="../../AsaiInc/incma.asp"-->
