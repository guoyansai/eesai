//时间
function EEStmSJ(name,fName){
this.name=name;
this.fName=fName || "tmc_inr";
this.timer=null;
this.fObj=null;
this.toString=function(){
  var objDate=new Date();
  var sMinute_Common="class=\"tmc_inr\" maxlength=\"2\" name=\""+this.fName+"\" onfocus=\""+this.name+".setFocusObj(this)\" onblur=\""+this.name+".setTime(this)\" onkeypress=\"if(!/[0-9]/.test(String.fromCharCode(event.keyCode)))event.keyCode=0\" onpaste=\"return false\" ondragenter=\"return false\"";
  var sButton_Common="class=\"tmc_spy\" onfocus=\"this.blur()\" onmouseup=\""+this.name+".controlTime()\" disabled"
  var str="";
  str+="<table class=\"tmc_tabc\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>";
  str+="<td rowspan=\"2\">"
  str+="时间：<input radix=\"24\" onkeyup=\""+this.name+".prevent(this,24)\" value=\""+this.formatTime(objDate.getHours())+"\" "+sMinute_Common+">"
  str+="时"
  str+="<input radix=\"60\" onkeyup=\""+this.name+".prevent(this,60)\" value=\""+this.formatTime(objDate.getMinutes())+"\" "+sMinute_Common+">"
  str+="分"
  str+="<input radix=\"60\" onkeyup=\""+this.name+".prevent(this,60)\" value=\""+this.formatTime(objDate.getSeconds())+"\" "+sMinute_Common+">"
  str+="秒"
  str+="</td><td><span id=\""+this.fName+"_up\" "+sButton_Common+">▲</span></td></tr>"
  str+="<tr><td><span id=\""+this.fName+"_down\" "+sButton_Common+">▼</span></td></tr>"
  str+="</table>"
  return str;
}
this.play=function(){this.timer=setInterval(this.name+".playback()",1000);}
this.formatTime=function(sTime){sTime=("0"+sTime);return sTime.substr(sTime.length-2);}
this.playback=function(){
  var objDate=new Date();
  var arrDate=[objDate.getHours(),objDate.getMinutes(),objDate.getSeconds()];
  var objMinute=document.getElementsByName(this.fName);
  for(var i=0;i<objMinute.length;i++){objMinute[i].value=this.formatTime(arrDate[i])}
}
this.prevent=function(obj,rax){
  clearInterval(this.timer);
  this.setFocusObj(obj);
  var value=parseInt(obj.value,10);
  var radix=parseInt(obj.radix,10)-1;
  if(isNaN(radix)){radix=rax;}
  if(isNaN(value)){value=0;}
  if(value>radix||value<1){obj.value=0;}
}
this.controlTime=function(cmd){
  event.cancelBubble=true;
  if(!this.fObj)return;
  clearInterval(this.timer);
  var cmd=event.srcElement.innerText=="▲"?true:false;
  var i=parseInt(this.fObj.value,10);
  var radix=parseInt(this.fObj.radix,10)-1;
  if(isNaN(radix)){radix=59;}
  if(isNaN(i)){i=0;}
  if(i==radix&&cmd){i=0;}
  else if(i==0&&!cmd){i=radix;}
  else{cmd?i++:i--;}
  this.fObj.value=this.formatTime(i);
  this.fObj.select();
  getDateTime();
}
this.setTime=function(obj){obj.value=this.formatTime(obj.value);}
this.setFocusObj=function(obj){eval(this.fName+"_up").disabled=eval(this.fName+"_down").disabled=false;this.fObj=obj;}
this.getTime=function(){
  var arrTime=new Array(2);
  for(var i=0;i<document.getElementsByName(this.fName).length;i++){arrTime[i]=document.getElementsByName(this.fName)[i].value;}
  return arrTime.join(":");
}
}
//日历
function EEStmRQ(name,fName){
this.name=name;
this.fName=fName || "calendar";
this.year=new Date().getFullYear();
this.month=new Date().getMonth();
this.date=new Date().getDate();
this.toString=function(){
  var str="";
  str+="<table class=\"tmc_tabc\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" onselectstart=\"return false\"><tr><td>";
  str+=this.drawYear();
  str+="</td><td align=\"right\">";
  str+=this.drawMonth();
  str+="</td></tr><tr><td colspan=\"2\">";
  str+="<div class=\"tmc_drl\">";
  str+="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"tmc_tabd\"><tr><td>日</td><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td></tr></table>";
  str+=this.drawDate();
  str+="</div>";
  str+="</td></tr></table>";
  return str;
}
this.drawYear=function(){
  var str="";
  str+="<select class=\"tmc_ins\" name=\""+this.fName+"\" id=\""+this.fName+"_year\" onchange=\""+this.name+".redrawDate()\">";
  for(var i=this.year-10;i<this.year+11;i++){str+="<option value=\""+(i)+"\" "+(i==this.year?"selected":"")+">"+(i)+"年</option>";}
  str+="</select>";
  str+="<input type=\"hidden\" name=\""+this.fName+"\" value=\""+this.date+"\" id=\""+this.fName+"_date\">";
  return str;
}
this.drawMonth=function(){
  var aMonthName=["一","二","三","四","五","六","七","八","九","十","十一","十二"];
  var str="";
  str+="<select class=\"tmc_ins\" name=\""+this.fName+"\" id=\""+this.fName+"_month\" onchange=\""+this.name+".redrawDate()\">";
  for(var i=0;i<aMonthName.length;i++){str+="<option value=\""+(i+1)+"\" "+(i==this.month?"selected":"")+">"+aMonthName[i]+"月</option>";}
  str+="</select>";
  return str;
}
this.drawDate=function(){
  var str="";
  var fDay=new Date(this.year,this.month,1).getDay();
  var fDate=1-fDay;
  var lDay=new Date(this.year,this.month+1,0).getDay();
  var lDate=new Date(this.year,this.month+1,0).getDate();
  str+="<table class=\"tmc_tabb\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" id=\""+this.fName+"_dateTable"+"\">";
  for(var i=1,j=fDate;i<7;i++){
  str+="<tr>";
  for(var k=0;k<7;k++){str+="<td><span"+(j==this.date?" class=\"selected\"":"")+" onclick=\""+this.name+".redrawDate(this.innerText)\">"+(isDate(j++))+"</span></td>";}
  str+="</tr>";
  }
  str+="</table>";
  return str;
  function isDate(n){return(n>=1&&n<=lDate)?n:"";}
}
this.redrawDate=function(d){
  this.year=document.getElementById(this.fName+"_year").value;
  this.month=document.getElementById(this.fName+"_month").value-1;
  this.date=d || this.date;document.getElementById(this.fName+"_year").value=this.year;
  document.getElementById(this.fName+"_month").selectedIndex=this.month;
  document.getElementById(this.fName+"_date").value=this.date;
  if(this.date>new Date(this.year,this.month+1,0).getDate())
  this.date=new Date(this.year,this.month+1,0).getDate();
  document.getElementById(this.fName+"_dateTable").outerHTML=this.drawDate();
  getDateTime();
}
this.getDate=function(delimiter){
  var s_month,s_date;s_month=this.month+1;s_date=this.date;s_month=("0"+s_month);s_month=s_month.substr(s_month.length-2);s_date=("0"+s_date);s_date=s_date.substr(s_date.length-2);
  if(!delimiter)delimiter="-";
  var aValue=[this.year,s_month,s_date];
  return aValue.join(delimiter);
}
}
//当前时间
function getDateTime(){gdCtrl.value=c.getDate()+' '+m.getTime();}

var gdCtrl=new Object();

function FTM(popCtrl){
  gdCtrl=popCtrl;
  event.cancelBubble=true;
  var point=fGetXY(popCtrl);
  if(gdCtrl.value==""){gdCtrl.value=document.getElementById("EEStmNow").innerHTML;}
  var gdValue=gdCtrl.value;
  var i_year,i_month,i_day,i_hour,i_minute,i_second;
  if(gdCtrl.value!="" && EEStmX(gdCtrl.value,'yyyy-MM-dd HH:mm:ss')){
  i_year=gdValue.substr(0,4);
  if(gdValue.substr(5,1)=="0"){i_month=parseInt(gdValue.substr(6,1));}
  else{i_month=parseInt(gdValue.substr(5,2));}
  if(gdValue.substr(8,1)=="0"){i_day=parseInt(gdValue.substr(9,1));}
  else{i_day=parseInt(gdValue.substr(8,2));}
  i_hour1=gdValue.substr(11,2);
  i_minute=gdValue.substr(14,2);
  i_second=gdValue.substr(17,2);
  document.getElementById(c.fName+"_year").value=i_year;
  document.getElementById(c.fName+"_month").value=i_month;
  c.date=i_day;
  document.getElementsByName(m.fName)[0].value=i_hour1;
  document.getElementsByName(m.fName)[1].value=i_minute;
  document.getElementsByName(m.fName)[2].value=i_second;
  c.redrawDate();
  }
  with(document.getElementById("eesaitimes").style){
  left=point.x+"px";
  top=point.y+popCtrl.offsetHeight+1+"px";
  width=document.getElementById("eesaitimes").offsetWidth;
  height=document.getElementById("eesaitimes").offsetHeight;
  visibility='visible';
  }
  document.getElementById("eesaitimes").focus();
}

function Point(iX,iY){this.x=iX;this.y=iY;}
//格式化时间
function EEStmX(date,format){
  var time=date;
  if(time=="")return;
  var reg=format;
  var reg=reg.replace(/yyyy/,"[0-9]{4}");
  var reg=reg.replace(/yy/,"[0-9]{2}");
  var reg=reg.replace(/MM/,"((0[1-9])|1[0-2])");
  var reg=reg.replace(/M/,"(([1-9])|1[0-2])");
  var reg=reg.replace(/dd/,"((0[1-9])|([1-2][0-9])|30|31)");
  var reg=reg.replace(/d/,"([1-9]|[1-2][0-9]|30|31))");
  var reg=reg.replace(/HH/,"(([0-1][0-9])|20|21|22|23)");
  var reg=reg.replace(/H/,"([0-9]|1[0-9]|20|21|22|23)");
  var reg=reg.replace(/mm/,"([0-5][0-9])");
  var reg=reg.replace(/m/,"([0-9]|([1-5][0-9]))");
  var reg=reg.replace(/ss/,"([0-5][0-9])");
  var reg=reg.replace(/s/,"([0-9]|([1-5][0-9]))");
  reg=new RegExp("^"+reg+"$");
  if(reg.test(time)==false){return false;}
  return true;
}

function fGetXY(aTag){
var isIE=!!window.ActiveXObject;
var isIE6=isIE&&!window.XMLHttpRequest;
var isIE8=isIE&&!!document.documentMode;
var isIE7=isIE&&!isIE6&&!isIE8;
var oTmp=aTag;
var pt=new Point(0,0);
do{
//if(isIE6|isIE7|isIE8)
if(isIE6|isIE7)
{pt.x+=oTmp.offsetLeft+10;pt.y+=oTmp.offsetTop+15;oTmp=oTmp.offsetParent;}
else{pt.x+=oTmp.offsetLeft;pt.y+=oTmp.offsetTop;oTmp=oTmp.offsetParent;}
}
while(oTmp.tagName!="BODY");return pt;}
function GetNow(){var objDate=new Date();gdCtrl.value=document.getElementById("EEStmNow").innerHTML;hideCalendar();}
function hideCalendar(){document.getElementById("eesaitimes").style.visibility="hidden";}

function eestmshow(){
var d=new Date();
var year=d.getFullYear();
var month=add_zero(d.getMonth()+1);
var days=add_zero(d.getDate());
var hours=add_zero(d.getHours());
var minutes=add_zero(d.getMinutes());
var seconds=add_zero(d.getSeconds());
var ndate=year+"-"+month+"-"+days+" "+hours+":"+minutes+":"+seconds;
document.getElementById("EEStmNow").innerHTML=ndate;}
function add_zero(temp){if(temp<10) return "0"+temp;else return temp;}
setInterval("eestmshow()",100);

document.write("<style>.tmc_dk{position:absolute;visibility:hidden;width:auto;height:auto;background-color:#F90;color:#000;z-index:9999}.tmc_taba{border:#F90 1px solid;background-color:#FFF;color:#000;}.tmc_taba td{font-size:12px;color:#000;}.tmc_tabb{background:#FEC;border-collapse:collapse;width:100%;color:#000;}.tmc_tabb td{font-size:12px;border:1px #FFF solid;color:#000;}.tmc_tabc{width:158px;}.tmc_tabc td{font-size:12px;color:#000;}.tmc_tabd{background-color:#F90;color:#FFF;border-collapse:collapse;}.tmc_tabd td{border:0px #FFF solid;color:#000;}.tmc_drl{border:1px #F90 solid;background-color:#FFF;color:#000;font-size:12px;}.tmc_drl td{width:23px;height:16px;font-size:12px;text-align:center;cursor:pointer;}.tmc_drl .selected{display:block;text-align:center;background-color:#F90;color:#FFF;}.tmc_drl span{display:block;text-align:center;}.tmc_spg{cursor:pointer;font-size:12px;padding:2px 8px;margin:0px;background-color:#F90;color:#FFF;}.tmc_spy{cursor:pointer;font-size:10px;padding:0px;margin:0px 0px 0px 1px;color:#F90;}.tmc_ins,.tmc_inr{text-align:center;font-size:12px;height:20px;line-height:20px;border:#F90 1px solid;adding:0px;margin:0px;}.tmc_ins{width:77px;}.tmc_inr{width:20px;}#EEStmNow{font-size:12px;}</style>");
document.write("<div id='eesaitimes' onclick='event.cancelBubble=true' class='tmc_dk'>");
document.write("<table class='tmc_taba'>");
document.write("<tr><td>");
var c=new EEStmRQ('c');document.write(c);
document.write("</td></tr><tr><td valign='top' align='center'>");
var m=new EEStmSJ('m');document.write(m);
document.write("</td></tr><tr><td align='center'><span class='tmc_spg' onclick='GetNow();'>当前时间</span> <span class='tmc_spg' onclick='hideCalendar();'>关闭</span><br><span id='EEStmNow'></span></td></tr></table></div>");