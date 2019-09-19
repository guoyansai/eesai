<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"--><%
Call esq()
%><urlset>
<url>
<loc><%=e_tur%></loc>
<lastmod><%=year(now())%>-<%=right("0"&month(now()),2)%>-<%=right("0"&day(now()),2)%>T<%=right("0"&hour(now()),2)%>:<%=right("0"&minute(now()),2)%>:<%=right("0"&second(now()),2)%>+08:00</lastmod>
<changefreq>always</changefreq>
<priority><%=year(now())%><%=right("0"&month(now()),2)%><%=right("0"&day(now()),2)%><%=right("0"&hour(now()),2)%>.0</priority>
</url><%
gysax=split(earr(0,s_umqb),g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)%><url><loc><%=left(e_tur,(len(e_tur)-1))&eshref(esnk(gysay(11))&g_urg&esnf(gysay(10))&g_urg&s_umxx&g_urg&gysay(1)&g_urz,1)%></loc><lastmod><%=year(gysay(3))%>-<%=right("0"&month(gysay(3)),2)%>-<%=right("0"&day(gysay(3)),2)%>T<%=right("0"&hour(gysay(3)),2)%>:<%=right("0"&minute(gysay(3)),2)%>:<%=right("0"&second(gysay(3)),2)%>+08:00</lastmod><changefreq>always</changefreq><priority>1.0</priority></url>
<%next%>
</urlset><!--#include file="../../AsaiInc/incma.asp"-->
