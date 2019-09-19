//调用示例
//<script language=""JavaScript"">var wid=""调用宽度"";var hei=""调用高度"";var tit=""标题"";var frm=""框架网页地址"";var ope="""";//空为显示；none为隐藏</scr ipt>
//<script language=""JavaScript"" charset=""utf-8"" src=""调用该JS的位置tc.js""></scr ipt>
//功能：保存cookies函数 参数：name，cookie名字；value，值
function GYShcW(name,value){
var Days=1;//cookie 一天 将被保存一年30*12
var exp=new Date();//获得当前时间
exp.setTime(exp.getTime()+Days*24*60*60*1000);//换成毫秒
document.cookie=name+"="+escape (value)+";expires="+exp.toGMTString();
} 
//功能：获取cookies函数 参数：name，cookie名字
function GYShcR(name){
var arr=document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
if(arr!=null){
return unescape(arr[2]); 
}else{
//return null;
return "2";
}
} 
//功能：删除cookies函数 参数：name，cookie名字
function GYShcD(name){
var exp=new Date();//当前时间
exp.setTime(exp.getTime()-1);
var cval=GYShcR(name);
if(cval!=null) document.cookie=name+"="+cval+";expires="+exp.toGMTString();
}
var TCnm="TCnm";
function ACGJhide(){document.getElementById('ACGtcon').style.display="none";GYShcW(TCnm,"1");}
function ACGJbig(){GYShcW(TCnm,"2");location.replace(location.href);}
function ACGJclose(){document.getElementById('ACGdiv').style.display='none';GYShcW(TCnm,"0");}
var tdir="/";
var widt=parseInt(wid)+6;
document.writeln("<style>#ACGdiv,#ACGHimg{opacity:0.8;filter:alpha(opacity=80);-moz-opacity:0.8;-khtml-opacity:0.8;z-index:7001;width:auto;position:fixed;right:5px;bottom:0px;}.ACGimg{padding:0px;margin:0px;border:0px;}.ACGtab{width:"+widt+"px;padding:0px;margin:0px;border:0px;}.ACGdt{width:"+widt+"px;height:52px;overflow:hidden;}.ACGtit{text-align:left;padding-top:15px;font-weight:bold;}a.aag,a.aag:link,a.aag:active,a.aag:visited{color:#FFFFFF;text-decoration:none;}a.aag:hover{text-decoration:none;}</style>");
if(GYShcR(TCnm)=="0") {document.writeln("<img id='ACGHimg' class='ACGimg'  alt='打开《"+tit+"》' onclick=javascript:ACGJbig() src='"+tdir+"AsaiSkin/js/tc/tc_01.gif'>");}
else
{document.writeln("<div id='ACGdiv'><div class='ACGdt'><table border='0' cellspacing='0' cellpadding='0' class=ACGtab><tr><td width='62'><img class='ACGimg' src='"+tdir+"AsaiSkin/js/tc/tc_01.gif'></td><td background='"+tdir+"AsaiSkin/js/tc/tc_02.gif'><div class='ACGtit'><a class=aag href="+frm+" target=_blank title=新窗口打开《"+tit+"》>"+tit+"</a></div></td><td width='22'><img class='ACGimg' onclick=javascript:ACGJhide() src='"+tdir+"AsaiSkin/js/tc/tc_04.gif'></td><td width='21'><img class='ACGimg' onclick=javascript:ACGJbig() src='"+tdir+"AsaiSkin/js/tc/tc_05.gif'></td><td width='22'><img class='ACGimg' onclick=javascript:ACGJclose() src='"+tdir+"AsaiSkin/js/tc/tc_06.gif'></td></tr></table></div>");
if(ope=="" || ope=="block") {if(GYShcR(TCnm)=="2") {document.writeln("<table border='0' cellspacing='0' cellpadding='0' id='ACGtcon' class=ACGtab style=display:"+ope+"><tr><td width='3' bgcolor='#069dd5'></td><td><div style='width:"+wid+"px;height:"+hei+"px;overflow:hidden;'><ifr"+"ame src="+frm+" scrol"+"ling=auto width="+wid+" height="+hei+" fram"+"eborder=0></if"+"rame></div></td><td width='3' bgcolor='#069dd5'></td></tr><tr><td colspan='3' height='3' bgcolor='#069dd5'></td></tr></table>");}}
document.writeln("</div>");}
