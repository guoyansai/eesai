function AsaiJsAlt(){
var asaitags="input,a,select,img"//TagNameUse[,]separate{www.eesai.com}
var timeclose=10;//Close prompt time[unit:seconds]
var offsetX=8;//Deviate from the mouse x axis
var offsetY=8;//Deviate from the mouse y axis
var asaitagarr=asaitags.split(",");
for(var ati=0;ati<asaitagarr.length;ati++){
var tagms=document.getElementsByTagName(asaitagarr[ati]);
for(var i=0;i<tagms.length;i++){
(function(){var AsaiAltTipLayer;var timeout;
tagms[i].onmouseover=function(e){
var AsaiTitle=this.title
var AsaiMsg=AsaiTitle.replace(/\n/g,"<br>");
AsaiMsg=AsaiMsg.replace(/\0x13/g,"<br>");
AsaiMsg=AsaiMsg.replace("<br><br>","<br>");
AsaiAltTipLayer=document.createElement("div");
AsaiAltTipLayer.className="eesaialtcss"+eesaialtsx;
AsaiAltTipLayer.style.position="absolute";
AsaiAltTipLayer.innerHTML=AsaiMsg;
this.title='';
if(AsaiTitle.length>3){document.body.appendChild(AsaiAltTipLayer);}
var tdwidth=AsaiAltTipLayer.clientWidth;
var tdheight=AsaiAltTipLayer.clientHeight;
var p=AsaiGetMouse(e);
var x=p.x+offsetX;
var y=p.y+offsetY;
if(p.z==1){
if(tdwidth+x<p.w){AsaiAltTipLayer.style.left=x+document.documentElement.scrollLeft+"px";}else{AsaiAltTipLayer.style.left=(p.w-tdwidth)+"px";}
if(tdheight+y<p.h){AsaiAltTipLayer.style.top=y+document.documentElement.scrollTop+"px";}else{AsaiAltTipLayer.style.top=(p.h-tdheight)+"px";}
}else{
if(tdwidth+x<p.w){AsaiAltTipLayer.style.left=x+"px";}else{AsaiAltTipLayer.style.left=(p.w-tdwidth)+"px";}
if(tdheight+y<p.h){AsaiAltTipLayer.style.top=y+"px";}else{AsaiAltTipLayer.style.top=(p.h-tdheight)+"px";}
}
(function(tagm){timeout=setTimeout(function(){if(AsaiAltTipLayer){tagm.title=AsaiAltTipLayer.innerHTML;AsaiAltTipLayer.parentNode.removeChild(AsaiAltTipLayer);document.onmousemove=null;}},timeclose*1000)})(this);
document.onmousemove=function(e){
var p=AsaiGetMouse(e);
var x=p.x+offsetX;
var y=p.y+offsetY;
if(p.z==1){
if(tdwidth+x<p.w){AsaiAltTipLayer.style.left=x+document.documentElement.scrollLeft+"px";}else{AsaiAltTipLayer.style.left=(p.w-tdwidth)+"px";}
if(tdheight+y<p.h){AsaiAltTipLayer.style.top=y+document.documentElement.scrollTop+"px";}else{AsaiAltTipLayer.style.top=(p.h-tdheight)+"px";}
}else{
if(tdwidth+x<p.w){AsaiAltTipLayer.style.left=x+"px";}else{AsaiAltTipLayer.style.left=(p.w-tdwidth)+"px";}
if(tdheight+y<p.h){AsaiAltTipLayer.style.top=y+"px";}else{AsaiAltTipLayer.style.top=(p.h-tdheight)+"px";}
}
}}
tagms[i].onmouseout=function(e){if(AsaiAltTipLayer.parentNode){this.title=AsaiAltTipLayer.innerHTML;AsaiAltTipLayer.parentNode.removeChild(AsaiAltTipLayer);document.onmousemove=null;clearTimeout(timeout);}}
})();}
}
}

function AsaiGetMouse(ev)
{var ev=ev||window.event;
//alert(ev.y+'-----'+ev.pageY);
if(ev.pageX&&ev.pageY){
nz=0;
nx=ev.pageX;
ny=ev.pageY;
nw=document.body.scrollWidth;
nh=document.body.scrollHeight;
}
else if(ev.x&&ev.y){
nz=1;
nx=ev.x;
ny=ev.y;
nw=document.documentElement.scrollWidth;
nh=document.documentElement.scrollHeight;
}
else{nz=0;nx=ev.clientX;ny=ev.clientY;nw=document.documentElement.scrollWidth;nh=document.documentElement.scrollHeight;}
return{x:nx,y:ny,w:nw,h:nh,z:nz};}

//if(navigator.userAgent.indexOf("MSIE")<1){AsaiJsAlt();} 
AsaiJsAlt();