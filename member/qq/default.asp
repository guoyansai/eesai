<!--#include file="../../AsaiData/cf.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QQ登录</title>
<style>
*{color:#585858;font-family:"微软雅黑";font-size:14px;}
</style>
</head>

<body>
<%if request("qq")="qq" then
response.Cookies("AsaiQQloginy")=""
response.Cookies("AsaiQQloginx")=""
response.Cookies("AsaiQQlogin")=""
else
if request.Cookies("AsaiQQloginy")="1" and request.Cookies("AsaiQQloginx")<>"" and request.Cookies("AsaiQQlogin")<>"" then
response.Cookies("AsaiQQloginy")="2"
'response.Write "成功登录！<br />"
'response.Write request.Cookies("AsaiQQloginx")&"<br />"
'response.Write request.Cookies("AsaiQQlogin")&"<br />"
'response.Write "这里开始处理相关信息！"
%>
<!--#include file="../../AsaiInc/incba.asp"--><%
Call opendb(i_dir)
dim qqlss,qqlrr,qqlsn
'""+openId+"|||1"+accessToken+"|||2昵称："+s.data.nickname+"<br>3性别："+s.data.gender+"<br>4省份："+s.data.province+"<br>5城市："+s.data.city+"<br>6出生："+s.data.year+"<br>7头像："+s.data.figureurl_2+"");	
qqlss=request.Cookies("AsaiQQloginx")&"|||"&request.Cookies("AsaiQQlogin")
qqlrr=split(qqlss&"||||||||||||||||||||||||||||||||||||||||||||||||","|||")
if aiint(e_uid)>0 then
Call saik(rs,"select * from "&usbiao&" where us_id="&e_uid&" or us_ld like '%"&qqlrr(0)&"%'",1,3)
'Call saik(rs,"select * from "&usbiao&" where (us_ld='' and us_id="&e_uid&") or us_ld like '%"&qqlrr(0)&"%'",1,3)
else
Call saik(rs,"select * from "&usbiao&" where us_ld like '%"&qqlrr(0)&"%'",1,3)
end if
if rs.eof and rs.bof then
rs.addnew
qqlsn="UQ"&aisn(1)
rs("us_er")=qqlsn&"_QQ"
rs("us_up")=qqlrr(7)
rs("us_mm")=""
rs("us_em")=""
rs("us_sn")=qqlsn
rs("us_bt")=qqlrr(2)
rs("us_dh")=""
rs("us_ld")=qqlrr(0)
rs("us_sj")="0"
rs("us_tm")=aitm(3,now())
rs("us_t1")=aitm(2,now())
rs("us_t2")=aitm(2,now())+7
rs("us_ip")=aiip()
rs("us_ty")=0
rs("us_xy")=ew_sh
rs("us_hi")=0
rs("us_xi")=0
rs("us_xo")=0
rs("us_px")=0
rs("us_jd")=0
rs("us_jq")=0
rs("us_jt")=0
rs("us_jb")=0
rs("us_jy")=0
rs("us_ch")=0
rs("us_xt")=espxx("QQ互联注册")
rs.update
Call aisn(0)
if gysread(uslie("login"),usbiao,"us_sn='"&qqlsn&"'","") then Call icuser(3)
Response.Write "<script>window.parent.frames.location.href="""&u_user&"""</script>"
else
if aiint(e_uid)>0 then
if ainull(rs("us_ld")) then
rs("us_ld")=qqlrr(0)
else
if instr(rs("us_ld"),qqlrr(0))=0 then rs("us_ld")=rs("us_ld")&"|"&qqlrr(0)
end if
end if
if date()>aicd(rs("us_t1")) then
rs("us_t1")=date()
if ainull(rs("us_xt")) then
rs("us_xt")=espxx("QQ登录")
else
rs("us_xt")=rs("us_xt")&espxx("QQ登录")
end if
end if
rs.update
Call icuser(2)
Response.Write "<script>window.parent.frames.location.href="""&u_user&"""</script>"
end if
Call saig(rs)
%>
<%else
response.Cookies("AsaiQQloginy")="1"
if aibj(right(Request.ServerVariables("HTTP_HOST"),6),"90.com") then
%>
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="213033" data-redirecturi="http://www.02590.com/member/qq/" charset="utf-8"></script>
<%else%>
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101345208" data-redirecturi="http://www.eesai.com/member/qq/" charset="utf-8"></script>
<%end if%>
<span id="qq_login_btn"></span>
<script type="text/javascript">QC.Login({btnId:"qq_login_btn"});</script>
<script type="text/javascript">
/*功能：保存cookies函数 参数：name，cookie名字；value，值*/
function GYShcW(name,value){
var Days=1; //cookie 一天 将被保存一年30*12
var exp=new Date();//获得当前时间
exp.setTime(exp.getTime()+Days*24*60*60*1000);//换成毫秒
document.cookie=name+"="+escape (value)+";expires="+exp.toGMTString();
} 

//http://connect.qq.com/intro/login/jssdk-demo
//上面是参考和使用说明

//从页面收集OpenAPI必要的参数。get_user_info不需要输入参数，因此paras中没有参数
var paras = {};

//用JS SDK调用OpenAPI
QC.api("get_user_info", paras)
	//指定接口访问成功的接收函数，s为成功返回Response对象
	.success(function(s){
		//成功回调，通过s.data获取OpenAPI的返回数据
		GYShcW("AsaiQQlogin",""+s.data.nickname+"|||"+s.data.gender+"|||"+s.data.province+"|||"+s.data.city+"|||"+s.data.year+"|||"+s.data.figureurl_2+"");	
		//GYShcW("AsaiQQlogin","昵称："+s.data.nickname+"<br>性别："+s.data.gender+"<br>省份："+s.data.province+"<br>城市："+s.data.city+"<br>出生："+s.data.year+"<br>头像："+s.data.figureurl_2+"");	
		//alert("获取用户信息成功！\n\n昵称："+s.data.nickname+"\n\n性别："+s.data.gender+"\n\n省份："+s.data.province+"\n\n城市："+s.data.city+"\n\n出生："+s.data.year+"\n\n头像："+s.data.figureurl_2+"");
	})
	//指定接口访问失败的接收函数，f为失败返回Response对象
	.error(function(f){
		//失败回调
		alert("获取QQ用户信息失败！");
	})
	//指定接口完成请求后的接收函数，c为完成请求返回Response对象
	.complete(function(c){
		//完成请求回调
		//alert("获取用户信息完成！");
		self.opener.location.reload(); 
window.opener=null;    
//window.opener=top;    
window.open("","_self");    
window.close();  
	});

if(QC.Login.check()){//如果已登录
	QC.Login.getMe(function(openId, accessToken){
	GYShcW("AsaiQQloginx",""+openId+"|||"+accessToken);	
});
	//这里可以调用自己的保存接口
	//...
}
else{GYShcW("AsaiQQloginx","");}
</script>
<%end if%>
<%end if%>
</body>
</html>