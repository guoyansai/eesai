<!--#include file="../AsaiData/config_gys.asp"--><%
dim g_u,g_umr,g_um,g_umi,g_umx,g_ud,g_u0,g_u1,g_u2,g_u3,g_u4,g_u5,g_u6,g_u7,g_u8,g_u9,g_u10,g_u11,g_u12,g_u13,g_u14,g_u15,g_u16,g_u17,g_u18,g_uhost,g_uurl,g_ustring
dim aii,aij,anii
dim adoconn,conn,rs,sql,gysrs,gyssql
dim gysal,gysar,gysax,gysay,gysalinx,gysaliny,gysii,gysjj,gysi,gysj,gysaxbb,gysaybb,gysibb,gysaxcc,gysaycc,gysicc,gyspage

'{其他变量设置}
dim g_sqln,g_str,g_cktm,g_sstm,g_apq,g_html,g_app,g_apptm,g_appam,g_appan,g_appaj,g_apdr,g_errx,g_errs
g_apq="EESai"'缓存前缀:缓存前缀词,多个网站切勿使用相同缓存名.
g_errs=""
g_errx=false
if g_err>2 then
g_errx=true
ELSEif g_err>0 then
if Request.Cookies("gl")<>"" then
if int(Request.Cookies("gl"))>3 and g_err>0 then g_errx=true
end if
end if
'g_apdr=g_apd
g_apdr=i_dir&g_apd
g_html=0'网站模式-ASP动态|HTML伪静态|首页HTML|首+频道HTML|首+频+列表HTML|全部静态HTML*网站的运行模式选择
g_sqln=0'
g_cktm=date()+7'失效时间:DateAdd("h",1,Now())/second()+7/DateAdd("m",60,now())=month.
g_sstm=20'有效时间-session有效时间[0表示不限制],单位是分钟,需要服务器支持[默认服务器设置为20分钟].
'___________________________auto doing app
g_apptm=0
g_appam=0
if g_atxg<>"" and g_atxm<100000 then
if instr(g_atxg&",",int(hour(now()))&",")>0 then
g_apptm=1
elseif instr(g_atxg&",",(int(hour(now()))-1)&",")>0 then
g_apptm=2
end if
end if
'___________________________auto doing app
'Call aisn(0)'此行的作用是时刻提供新鲜的SN编码
%><!--#include file="ai.asp"--><!--#include file="an.asp"--><!--#include file="gys.asp"-->