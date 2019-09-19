<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Option Explicit%><%
On Error Resume Next'display err
session.abandon
Server.ScriptTimeOut=180
'-----------------------------------
'open db
'=opendb(dbfdr)
'-----------------------------------
function opendb(dbfdr)
if w_dbty=1 then
w_dbss=w_dbsf&","&w_dbsn&","&w_dbsu&","&w_dbsm
else
if left(w_dbdn,1)<>"/" then w_dbdn=dbfdr&w_dbdn
if w_dbdm<>"" then
w_dbss=w_dbdn&","&w_dbdm
else
w_dbss=w_dbdn
end if
end if
if g_errx then Call saierr(1,"正在连接数据库["&w_dbss&"]...")
Call saic(w_dbty,w_dbss)
if g_errx then Call saierr(1,"成功连接数据库！")
end function
%><!--#include file="config_sai.asp"--><!--#include file="config_sys.asp"--><!--#include file="config_chs.asp"--><!--#include file="../AsaiUpLoad/config.asp"--><!--#include file="config.asp"--><!--#include file="../AsaiInc/g.asp"-->