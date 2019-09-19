var $E = function(opts){ 
function _(objId){return (typeof objId === "string")?document.getElementById(objId):objId;} 
var beImg,expand,clip,cover,warp,expImg; 
var clipWidth,clipHeight; 
var closeTimeId = null; 
var mult = 1; //图片放大倍数,根据裁剪框和放大后图片容器的大小自动调整 
(function(){ 
beImg =document.getElementById("p-sfimg"); 
warp = beImg.parentNode; //p-sf
cover = document.getElementById("p-sfshow"); //创建遮盖原图div
warp.appendChild(cover); 
cover.style.zIndex = 2; 
cover.style.visibility = "hidden"; 
clip = document.getElementById("p-sfimga"); //创建遮盖层的img
warp.appendChild(clip); 
clipWidth ="60px"; 
clipHeight ="60px"; 
clip.style.visibility = "visible"; 
clip.style.clip = "rect(0px," + clipWidth + "," + clipHeight + ",0px)"; 
clip.style.zIndex = 3; 
})(); 

function layerPos(e){ 
if(e.layerX && e.layerY){ 
return {x:e.layerX,y:e.layerY}; 
} else { 
return {x:e.x,y:e.y}; 
} 
} 

function absolutePos(e){ 
if(e.pageX && e.pageY){ 
return {x:e.pageX,y:e.pageY}; 
} else { 
var x = e.clientX + (document.documentElement.scrollLeft?document.documentElement.scrollLeft : document.body.scrollLeft); 
var y = e.clientY + (document.documentElement.scrollTop?document.documentElement.scrollTop : document.body.scrollTop); 
return {x:x,y:y}; 
} 
} 

var showExpand = function(x,y,e){ 
if(!expand){ 
initExpand(); 
} 
expImg.style.left = (-1 * x) * mult + "px"; 
expImg.style.top = (-1 * y ) * mult + "px"; 
if((!opts.expand) || (!opts.expand.id)){ 
var aPos = absolutePos(e); 
expand.style.left = aPos.x + parseFloat(clipWidth) / 2 + 20 + "px"; 
expand.style.top = aPos.y + "px"; 
} 

//初始化放大的div 
function initExpand(){ 
expand = _(opts.expand.id); 
if((expand.style.position != "relative") && (expand.style.position != "absolute")){ 
//变态的ie6和ie7的img如果为relative,需要设置其父节点也为relative,否则overflow:hidden无效 
expand.style.visibility = "hidden"; 
expand.style.zIndex = 998; 
expand.style.position = "relative"; 
expand.style.left = "0"; 
expand.style.top = "0"; 
} 
expImg = document.getElementById("p-sfimgb"); 
expImg.style.visibility = "visible"; 
expImg.style.zIndex = 999; 
expImg.style.position = "relative"; 
expImg.style.left = "0px"; 
expImg.style.top = "0px"; 
expand.appendChild(expImg); 
expImg.removeAttribute("width"); 
expImg.removeAttribute("height"); 
//计算图片放大的倍数 
var ew = expand.clientWidth; 
var eh = expand.clientHeight; 
var cw = parseFloat(clipWidth); 
var ch = parseFloat(clipHeight); 
mult = (ew/cw < eh/ch) ? ew/cw : eh/ch; 
//调整放大图片的大小 
expImg.style.width = beImg.clientWidth * mult + "px"; 
expImg.style.height = beImg.clientHeight * mult + "px"; 
} 
} 

cover.onmousemove = clip.onmousemove = function(e){ 
var e = e || event; 
var pos = layerPos(e); 
var x = pos.x; 
var y = pos.y; 
//判断x和y坐标有没有超出范围 
var w = parseFloat(clipWidth) / 2,h = parseFloat(clipHeight) / 2; 
x = (x < w)?w:x; 
y = (y < h)?h:y; 
x = (x > warp.clientWidth - w) ? (warp.clientWidth - w) : x; 
y = (y > warp.clientHeight - h) ? (warp.clientHeight - h) : y; 
clip.style.clip = "rect(" + (y - h) + "px," + (x + w) + "px," + (y + h) + "px," + (x - w) + "px)"; 
showExpand(x - w,y - h,e); 
} 

warp.onmouseover = cover.onmouseover = clip.onmouseover = function(){ 
//如果清除的定时器存在,则删除. 
if(closeTimeId){ 
clearTimeout(closeTimeId); 
closeTimeId = null; 
} 
if(cover.style.visibility === "hidden"){ cover.style.visibility = "visible"; } 
if(expand.style.visibility === "hidden"){ expand.style.visibility = "visible"; } 
if(expImg.style.visibility === "hidden"){ expImg.style.visibility = "visible"; } 
} 

warp.onmouseout = function(){ 
//延迟一定时间后清除 
closeTimeId = setTimeout(function(){ 
cover.style.visibility = "hidden"; 
expand.style.visibility = "hidden"; 
expImg.style.visibility = "hidden"; 
},10); 
} 

return { 
clear:function(){ 
//在这里清除放大镜效果 
warp.removeChild(clip); 
warp.removeChild(cover); 
warp.onmouseout = null; 
if((!opts.expand) || (!opts.expand.id)){ 
expand.style.visibility = "hidden"; 
} 
} 
} 

} 

function sfshow(pfstr,pftit){
//document.getElementById("p-sfimga").src=pfstr.replace("原", "替换");
document.getElementById("p-sfimg").src=pfstr;
document.getElementById("p-sfimga").src=pfstr;
document.getElementById("p-sfimgb").src=pfstr;
document.getElementById("p-sflink").title=pftit;
document.getElementById("p-sflink").href=pfstr;
};
