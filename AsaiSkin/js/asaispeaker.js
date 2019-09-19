function asaispeak(eesfstr){
eesfstr=eesfstr.replace(/<\/?[^>]*>/g,'');
eesfstr=eesfstr.replace(/[ | ]*\n/g,'\n');
eesfstr=eesfstr.replace(/\n[\s| | ]*\r/g,'\n');
var EESspeechSU=new window.SpeechSynthesisUtterance();
if(eesfstr!=""){EESspeechSU.text=eesfstr;}else{EESspeechSU.text="没有可读内容！";}
window.speechSynthesis.speak(EESspeechSU);
}
function asaispeakcancel(){window.speechSynthesis.cancel();}
//调用按钮专用
function asaispeakbt(eesfid){
asaispeak(document.getElementById(eesfid).innerHTML);
document.getElementById("stop"+eesfid).style.display="";document.getElementById("read"+eesfid).style.display="none";
}
function asaispeakbtcancel(eesfid){asaispeakcancel();document.getElementById("stop"+eesfid).style.display="none";document.getElementById("read"+eesfid).style.display="";}
function asaispeaker(eesfid,eesfht){
var eesplayic0="http://www.asai.com/AsaiSkin/js/sound/0.png";
var eesplayic1="http://www.asai.com/AsaiSkin/js/sound/1.png";
var eesdcss="";
if(eesfht!=""){eesdcss=' height="'+eesfht+'" style="vertical-align:middle;"'}

if (!window.SpeechSynthesisUtterance || !window.speechSynthesis) {
//console.error('您的浏览器不支持，请使用 \r\n Chrome 33+ \r\n FireFox 49+ \r\n IE-Edge \r\n 等浏览器');
//alert('您的浏览器不支持，请使用 \r\n Chrome 33+ \r\n FireFox 49+ \r\n IE-Edge \r\n 等浏览器');
}else{
document.writeln('<img src="../../asai_skin/js/'+eesplayic1+'"'+eesdcss+' onClick="asaispeakbtcancel(\''+eesfid+'\');" id="stop'+eesfid+'" title="点击停止朗读"><img src="../../asai_skin/js/'+eesplayic0+'"'+eesdcss+' onClick="asaispeakbt(\''+eesfid+'\');" id="read'+eesfid+'" title="点击开始朗读">');
}
if(document.getElementById("stop"+eesfid).style.display="none"){document.getElementById("stop"+eesfid).style.display="none";document.getElementById("read"+eesfid).style.display="";}else{document.getElementById("stop"+eesfid).style.display="";document.getElementById("read"+eesfid).style.display="none";}
}
//<script src="http://www.asai.com/AsaiSkin/js/asaispeaker.js"></ script>
//方法一：<script>asaispeaker("speak",20,"朗读");</ script>
//方法二：<div onMouseOver="asaispeak(this.innerHTML);" onMouseOut="asaispeakcancel();">这里是要阅读的内容</div>