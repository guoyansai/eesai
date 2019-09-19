<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="../../AsaiData/config.asp"--><!--#include file="../../AsaiData/config_sai.asp"--><%
dim escsn
escsn=Request.ServerVariables("QUERY_STRING")
if escsn<>"" then
else
escsn=w_sn
end if
%><html><meta charset=utf-8><title><%=w_motm%>聊天室</title><script>
//复制这段JS代码到您指定文件中，即可完成聊天室调用
document.write("<frameset><frame src=http://chat.780.pub/?<%=escsn%>></frameset>");
</script></html>