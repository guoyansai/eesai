<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Asai系统QQ客服在线</title>
<style>
body{background-color:#FFFFFE;}
*{padding:0px;margin:0px;border:0px;font-family:"微软雅黑";}
a,a:link,a:active,a:hover{float:left;text-decoration:none;display:block;width:25%;height:66px;padding-top:8px;text-align:center;font-size:12px;color:#585858;}
a:visited{text-decoration:underline;}
#dh{width:100%;text-align:center;font-size:16px;font-weight:bold;color:#585858;letter-spacing:2px;position:fixed;bottom:0px;padding:8px 12px;}
</style>
</head>
<body><%dim EESQQrr,EESQQFU,EESQQFUrr,EESQQFUii,EESQQFUjj
EESQQrr=split(Request.ServerVariables("QUERY_STRING")&"||","|")
if EESQQrr(0)<>"" then EESQQFU=EESQQrr(0)
if EESQQrr(1)<>"" then EESQQFU=EESQQFU&","&EESQQrr(1)
'★★★★★★★★★★★★★★★★★★★★★★★★★★★★
if EESQQFU="" then EESQQFU="4941172,870990694"
'★★★★★★★★★★★★★★★★★★★★★★★★★★★★
'按上面规格添加，每个QQ号码之间用,隔开。
EESQQFUrr=split(EESQQFU&","&EESQQFU&","&EESQQFU&","&EESQQFU&","&EESQQFU&","&EESQQFU&","&EESQQFU&","&EESQQFU,",")
EESQQFUjj=0
for EESQQFUii=0 to ubound(EESQQFUrr)
if EESQQFUrr(EESQQFUii)<>"" then
EESQQFUjj=EESQQFUjj+1
if EESQQFUjj>8 then exit for
%><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=EESQQFUrr(EESQQFUii)%>&site=EESai&menu=yes"><img border="0" src="qq.png" alt="点击这里给我客服<%=right("000"&EESQQFUii,3)%>发消息" title="点击这里给我客服<%=right("000"&EESQQFUjj,3)%>发消息"><br>客服<%=right("000"&EESQQFUjj,3)%></a><%end if
next%>
<div id="dh"><%if EESQQrr(2)<>"" then%>热线电话<br><%=EESQQrr(2)%><%else%>在线客服竭诚为您服务<%end if%></div>
<script>
var obj=document.getElementsByTagName("a"); 
for(i=0;i<obj.length;i++){ 
var str="cdef"; 
var t="#"; 
for(j=0;j<6;j++) 
{t=t+ str.charAt(Math.random()*str.length);} 
obj[i].style.background=t;
} 
document.getElementById("dh").style.background=t;
</script>
</body>
</html>