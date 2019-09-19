//浏览器类型判断
function EES_EESaiBrowser(){
var userAgent=navigator.userAgent; //取得浏览器的userAgent字符串
var isOpera=userAgent.indexOf("Opera") > -1;
if (isOpera){return "Opera"}; //判断是否Opera浏览器
if (userAgent.indexOf("Firefox") > -1){return "FF";} //判断是否Firefox浏览器
if (userAgent.indexOf("Safari") > -1){return "Safari";} //判断是否Safari浏览器
if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera){return "IE";};//判断是否IE浏览器
}
if(EES_EESaiBrowser()=="FF"||EES_EESaiBrowser()=="Opera"||EES_EESaiBrowser()=="Safari"){
document.getElementById("asaisound").innerHTML="<audio id='asaisoundat' name='asaisoundat' src='/AsaiSkin/js/sound/0.wav' autoplay='autoplay'>";
}
else{
document.getElementById("asaisound").innerHTML="<embed id='asaisoundat' name='asaisoundat' src='/AsaiSkin/js/sound/1.wav' autostart='true' hidden='true' loop='false'></embed>";
}
document.getElementById("asaisoundat").play();
//<div id=asaisound style=display:none></div>
//标题栏提示效果
 var newMessageRemind = function () {
  var i = 0,
   title = document.title,
   loop;
  return {
   show: function () {
    loop = setInterval(function () {
     i++;
     if ( i == 1 ) document.title = '【新消息】' + title;
     if ( i == 2 ) document.title = '【　　　】' + title;
     if ( i == 3 ) i = 0;
    }, 800);
   },
   stop: function () {
    clearInterval(loop);
    document.title = title;
   }
  };
 } ();
 newMessageRemind.show();
// document.getElementById('test').onclick = function () {
//  newMessageRemind.stop();//停止提示
// };
