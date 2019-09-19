<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>阿赛幻彩字母验证码-测试页面</title>
</head>

<body>
<h1>阿赛幻彩字母验证码-测试页面</h1>
支持三种cookies|session|cookies+session模式验证<br>
支持数字和字母，可以自定义验证模式<br>
支持指定验证字符位数<br>
可以进行随机字符位数，全智能显示<br>
支持幻彩显示，同时支持背景幻彩显示<br>
支持自定义背景颜色，自定义验证文字的颜色<br>
支持噪点<br>
默认支持大小写区分验证<br>
按照演示设定即可正常使用<br>

<h1><%
if request("code")<>"" then
if request("code")=request.Cookies("AsaiCode") then
response.Write("恭喜您！验证成功！")
else
response.Write("对不起，验证失败。（正确验证码为："&request.Cookies("AsaiCode")&"，您输入的是："&request("code")&"）")
end if
end if
%></h1>
<form action="" method="post">
<input type="text" name="code" value="">
<img id="checkcode" src="./?code.jpg" alt="看不清楚？请点击刷新！" onClick="this.src=this.src+'?'+Math.random();"><br>
<a href="#" onClick="checkcode.src=checkcode.src+'?'+Math.random();" title="看不清楚，请点击验证图片换个！">看不清楚，请点击验证图片换个！</a><br>
<input type="submit" value="提交测试验证码">
</form>

</body>
</html>
