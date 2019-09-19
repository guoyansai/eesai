<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="inc.asp"-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>在线支付</title>
<style>
body{padding:0px;margin:0px;border:0px;}
.zf-a{border-top:#ff6600 8px solid;background-image: -moz-linear-gradient(top,#f3d8c5,#FFFFFA);background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0,#f3d8c5),color-stop(1,#FFFFFA));filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f3d8c5',endColorstr='#FFFFFA',GradientType='0');}
.zf-b{width:88%;margin:0px auto;border-left:#f3d8c5 8px solid;border-right:#f3d8c5 8px solid;border-bottom:#f3d8c5 8px solid;background-color:#FFFFFA;}
.zf-c1{float:left;padding-left:20px;height:66px;line-height:66px;font-size:28px;font-weight:bold;font-family:"黑体", cursive;color:#ff6600;}
.zf-c2{float:right;padding-right:20px;text-align:right;height:66px;line-height:66px;}
.zf-c2,.zf-c2 a{font-size:12px;color:#585858;}
.zf-d{clear:both;font-size:12px;padding:12px 20px;background-color:#ff6600;color:#FFFFFA;}
.zf-e,.zf-e1{font-size:16px;padding:12px 20px;font-weight:bold;color:#585858;border-bottom:#989898 1px dashed;}
.zf-e1{border-top:#989898 1px dashed;}
.zf-f{clear:both;font-size:12px;padding:12px 20px;line-height:220%;letter-spacing:2px;color:#585858;}
.zf-f b{font-size:28px;font-weight:bold;padding:0px 10px;color:#ff6600;}
.zf-g,.zf-g1{float:left;width:120px;padding:12px 20px;margin-right:20px;text-align:center;font-size:20px;font-weight:bold;}
.zf-g{border:#ff6600 2px solid;color:#ff6600;}
.zf-g1{border:#989898 2px solid;color:#989898;}
.zf-g2{clear:both;}
.zf-m{border:#FFFFFF 2px solid;padding:5px 8px;}
.zf-m:hover{border:#ff6600 2px solid;}
.zf-h{clear:both;padding:12px 20px;border-top:#ff6600 1px solid;}
.zf-i{width:120px;padding:12px 20px;text-align:center;font-size:20px;font-weight:bold;background-color:#ff6600;color:#FFFFFA;}
</style>
</head>

<body>
<div class="zf-a">
<div class="zf-b">
<div class="zf-c1">欢迎使用在线支付系统</div><div class="zf-c2"><a target="_blank" href="/">首页</a>|<a href="#hp">疑难解答</a></div>
<%
dim d_fk,d_mj,d_bh,d_mc,d_ms,d_wz,d_ip
if request("mj")="" then
d_fk=200
d_mj="guoyansai@126.com"
d_bh="EESAITEST"&year(now())&month(now())&day(now())&hour(now())&minute(now())&second(now())
d_mc="临时交易的名称"
d_ms="购买服务描述"
d_wz="http://www.eesai.com/"
d_ip=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
%>
<div class="zf-d">欢迎使用在线支付系统，支付对接的数据有问题或不存在，请重新请求支付。</div>
<div class="zf-e">支付信息表单：</div>
<form name="alipay" action="" method="post">
<div class="zf-f">付款金额：<input type="number" name="fk" value="<%=d_fk%>"> 元<br>
卖家帐户：<input type="text" name="mj" value="<%=d_mj%>">
<input type="hidden" name="bh" value="<%=d_bh%>"><br>
订单名称：<input type="text" name="mc" value="<%=d_mc%>"><br>
订单描述：<input type="text" name="ms" value="<%=d_ms%>"><br>
商品网址：<input type="text" name="wz" value="<%=d_wz%>">
<input type="hidden" name="ip" value="<%=d_ip%>"></div>
<div class="zf-h"><input type="submit" value="请求支付" class="zf-i"></div>
</form>
<%
else
d_fk=int(request("fk"))
d_mj=request("mj")
d_bh=request("bh")
d_mc=request("mc")
d_ms=request("ms")
d_wz=request("wz")
d_ip=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
%>
<div class="zf-d">欢迎使用在线支付系统，请再次确认您的订单信息，选择支付提交支付即可。</div>
<div class="zf-e">订单信息：</div>
<form name="alipayment" action="alipay/alipayapi.asp" method="post" target="_blank">
<div class="zf-f">付款金额：<b><%=d_fk%></b>元<br>
卖家帐户：<%=d_mj%><br>
订单编号：<%=d_bh%><br>
订单名称：<%=d_mc%><br>
订单描述：<%=d_ms%><br>
商品网址：<%=d_wz%><br>
客户地址：<%=d_ip%></div>
<%=zfform(d_fk,d_mj,d_bh,d_mc,d_ms,d_wz,d_ip)%>
<div class="zf-e1">在线支付方式：</div>
<!--<div class="zf-g">支付宝</div><div class="zf-g1">财付通</div><div class="zf-g2"></div>-->
<div class="zf-f"><img title="已选定使用支付宝支付，请点击[确认支付]进行支付操作。" class="zf-m" src="alipay/alipay_logo.gif" height="50"></div>
<div class="zf-h"><input type="submit" value="确认支付" class="zf-i"></div>
</form>
<%end if%>
<div class="zf-e1">银行转账：</div>
<div class="zf-f">暂时不支持银行转账！</div>
<div class="zf-e1">使用须知：</div>
<div class="zf-f">使用在线支付，可以自动完成订单付款操作。</div>
<div class="zf-e1"><a name="hp"></a>在线支付客服与疑难解答：</div>
<div class="zf-f">客服QQ：2780979297</div>
</div>
</div>
</body>
</html>
