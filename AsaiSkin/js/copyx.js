copyx();
function copyx()
{
var temp_href;
var isctrl=false;
function bindj(objEvent)
{
objEvent = objEvent || (event || null);
var src = objEvent.srcElement || (objEvent.target || null);
if (isctrl)
{
window.location = "/member/";
}
try
{
if(src.tagName=="A")
{
window.status="";
if(objEvent.type=="mouseover")
{
temp_href=src.href;
src.href="javascript:" + src.innerHTML;
}      
if(objEvent.type=="mouseup")
{
var reg = /.*FwP.*/;
src.href = temp_href;
if (!reg.test(temp_href))
{
window.open(temp_href,"_self");
}
else
{
window.open(temp_href,"_blank");
src.onclick=bindj;
}
return false;
}
if(objEvent.type=="mouseout")
{
src.href=temp_href;
temp_href=null;
}
}
}
catch (e)
{
}
return false;
}
function bindk(objEvent)
{
objEvent = objEvent || (event || null);
if (objEvent.keyCode == "17")
{
isctrl = true;
}
}
try
{
var objBody = document.getElementsByTagName("body")[0];
objBody.style.MozUserSelect = "none"; //FireFox下禁止选择
}
catch(exception)
{
}
document.onmouseup=bindj;
document.oncontextmenu = bindj;
document.onselectstart = bindj;
document.oncopy = bindj;
document.onmousemove = bindj;
document.oncut = bindj;
document.onpaste = bindj;
document.onmouseout = bindj;
document.onmouseover = bindj;
document.ondragstart = bindj;
document.onkeypress = bindk;
}