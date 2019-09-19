/*功能：保存cookies函数 参数：name，cookie名字；value，值*/
function GYShcW(name,value){
var Days=1; //cookie 一天 将被保存一年30*12
var exp=new Date();//获得当前时间
exp.setTime(exp.getTime()+Days*24*60*60*1000);//换成毫秒
document.cookie=name+"="+escape (value)+";expires="+exp.toGMTString();
} 
/*功能：获取cookies函数 参数：name，cookie名字*/
function GYShcR(name){
var arr=document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
if(arr!=null){
return unescape(arr[2]); 
}else{
return null;
}
} 

function dddcang(){
parent.EESaidd.location.href=ddr; 
var ddfr=document.getElementById("d-vr");
var ddan=document.getElementById("d-vl");
if(ddfr.className=="d-vr"){
ddfr.className="d-vr1";
ddan.className="d-vl1";   
ddan.innerHTML="<span class='glyphicon glyphicon-dashboard'></span><br>"+ddm+"";   
GYShcW("jingpaiche","1");
}else{
ddfr.className="d-vr";
ddan.className="d-vl";
ddan.innerHTML="X<br>"+ddm+"";
GYShcW("jingpaiche","2");
}}
if(ddx>0){
if(GYShcR("jingpaiche")==""){GYShcW("jingpaiche",ddx)}
if(GYShcR("jingpaiche")=="2"){
document.writeln("<div id=d-v><div id=d-vr class=d-vr><iframe id=EESaidd name=EESaidd src="+ddr+" width=100% height=280 frameborder=0></iframe></div><div id=d-vl class=d-vl onclick=javascript:dddcang()>X<br>"+ddm+"</div></div>");
}else{
document.writeln("<div id=d-v><div id=d-vr class=d-vr1><iframe id=EESaidd name=EESaidd src="+ddr+" width=100% height=280 frameborder=0></iframe></div><div id=d-vl class=d-vl1 onclick=javascript:dddcang()><span class='glyphicon glyphicon-shopping-cart'></span><br>"+ddm+"</div></div>");
}
}