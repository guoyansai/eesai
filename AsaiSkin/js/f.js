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
/*功能：删除cookies函数 参数：name，cookie名字*/
function GYShcD(name){
var exp=new Date();//当前时间
exp.setTime(exp.getTime()-1);
var cval=GYShcR(name);
if(cval!=null) document.cookie=name+"="+cval+";expires="+exp.toGMTString();
}
