var EES_ESlen,EES_ESpop,EES_ESid,EES_ESan,EES_ESsm,EES_ESse,EES_ESsy,EES_ESqy,EES_ESby,EES_ESfs;
var EES_Vrwid,EES_Vrhei,EES_Vrheit,EES_Vrheic,EES_Kiframe,EES_Ktextarea,EES_ESys,EES_EScss,EES_ESbar;
var EES_Edialog,EES_EDWindow,EES_EDDiv,EES_EDValue,EES_EDMode=1;
var EES_EDCurGEditor,EES_EDCurRange,EES_SfullscreenMode=0;
/* ---------------------------- 编辑器区域生成和取值信息（如果一个页面需要调用多个编辑器，可以拷贝该文件，替换EES_为其他X_，并更改下面的AsaiEdit过程名即可同规则调用，如：AsaiEditMini） ---------------------------- */
//定义并生成编辑器区域
function AsaiEdit(InitValue){
EES_Vrwid="666px";
EES_Vrhei=280;
if(arguments[3]){EES_Vrwid=arguments[3];EES_Vrwid=(EES_Vrwid.toString().indexOf("%")==-1? parseInt(EES_Vrwid)+"px":EES_Vrwid);}
if(arguments[4]){EES_Vrhei=parseInt(arguments[4]);EES_Vrheit=28;EES_Vrheic=(EES_Vrhei-EES_Vrheit-1)+"px";EES_Vrhei+="px";EES_Vrheit+="px";}
EES_ESan=arguments[1];
EES_ESlen=arguments[2];
EES_ESpop=arguments[5];
EES_ESid=arguments[6];
EES_ESsm=arguments[7];
EES_ESse=arguments[8];
EES_ESsy=arguments[9];if(EES_ESsy==''){EES_ESsy='#CC1121';};
EES_ESqy=arguments[10];if(EES_ESqy==''){EES_ESqy='#fef5f5';};
EES_ESby=arguments[11];if(EES_ESby==''){EES_ESby='#FFFFFE';};
EES_ESfs=arguments[12];
EES_ESys="#000000,#330000,#660000,#990000,#CC0000,#FF0000,#000033,#330033,#660033,#990033,#CC0033,#FF0033,#000066,#330066,#660066,#990066,#CC0066,#FF0066,|,#003300,#333300,#663300,#993300,#CC3300,#FF3300,#003333,#333333,#663333,#993333,#CC3333,#FF3333,#003366,#333366,#663366,#993366,#CC3366,#FF3366,|,#006600,#336600,#666600,#996600,#CC6600,#FF6600,#006633,#336633,#666633,#996633,#CC6633,#FF6633,#006666,#336666,#666666,#996666,#CC6666,#FF6666,|,#009900,#339900,#669900,#999900,#CC9900,#FF9900,#009933,#339933,#669933,#999933,#CC9933,#FF9933,#009966,#339966,#669966,#999966,#CC9966,#FF9966,|,#00CC00,#33CC00,#66CC00,#99CC00,#CCCC00,#FFCC00,#00CC33,#33CC33,#66CC33,#99CC33,#CCCC33,#FFCC33,#00CC66,#33CC66,#66CC66,#99CC66,#CCCC66,#FFCC66,|,#00FF00,#33FF00,#66FF00,#99FF00,#CCFF00,#FFFF00,#00FF33,#33FF33,#66FF33,#99FF33,#CCFF33,#FFFF33,#00FF66,#33FF66,#66FF66,#99FF66,#CCFF66,#FFFF66,|,#000099,#330099,#660099,#990099,#CC0099,#FF0099,#0000CC,#3300CC,#6600CC,#9900CC,#CC00CC,#FF00CC,#0000FF,#3300FF,#6600FF,#9900FF,#CC00FF,#FF00FF,|,#003399,#333399,#663399,#993399,#CC3399,#FF3399,#0033CC,#3333CC,#6633CC,#9933CC,#CC33CC,#FF33CC,#0033FF,#3333FF,#6633FF,#9933FF,#CC33FF,#FF33FF,|,#006699,#336699,#666699,#996699,#CC6699,#FF6699,#0066CC,#3366CC,#6666CC,#9966CC,#CC66CC,#FF66CC,#0066FF,#3366FF,#6666FF,#9966FF,#CC66FF,#FF66FF,|,#009999,#339999,#669999,#999999,#CC9999,#FF9999,#0099CC,#3399CC,#6699CC,#9999CC,#CC99CC,#FF99CC,#0099FF,#3399FF,#6699FF,#9999FF,#CC99FF,#FF99FF,|,#00CC99,#33CC99,#66CC99,#99CC99,#CCCC99,#FFCC99,#00CCCC,#33CCCC,#66CCCC,#99CCCC,#CCCCCC,#FFCCCC,#00CCFF,#33CCFF,#66CCFF,#99CCFF,#CCCCFF,#FFCCFF,|,#00FF99,#33FF99,#66FF99,#99FF99,#CCFF99,#FFFF99,#00FFCC,#33FFCC,#66FFCC,#99FFCC,#CCFFCC,#FFFFCC,#00FFFF,#33FFFF,#66FFFF,#99FFFF,#CCFFFF,#FFFFFF";
var EES_ESysarr=EES_ESys.split(",");
var EES_ESysarrlen=EES_ESysarr.length;
var EES_ESysx="<div class=EES_CSSay>";
var EES_ESysxb="<div class=EES_CSSay>";
for(var i=0;i<EES_ESysarrlen;i++){
if (EES_ESysarr[i]=="|")
{EES_ESysx=EES_ESysx+"<br>";EES_ESysxb=EES_ESysxb+"<br>";
}else{
EES_ESysx=EES_ESysx+"<a class=EES_CSSays style=background-color:"+EES_ESysarr[i]+" onclick=\"EES_Sstyle('<span StylE=color:"+EES_ESysarr[i]+">','</span>')\" TItle="+EES_ESysarr[i]+">　</a>";
EES_ESysxb=EES_ESysxb+"<a class=EES_CSSays style=background-color:"+EES_ESysarr[i]+" onclick=\"EES_Sstyle('<span StylE=background-color:"+EES_ESysarr[i]+">','</span>')\" TItle="+EES_ESysarr[i]+">　</a>";
}}
EES_ESysx=EES_ESysx+"</div>";
EES_ESysxb=EES_ESysxb+"</div>";
var EES_Ischar;
EES_Ischar="<style>#"+EES_ESid+"EES_Isdiv{width:120px;height:120px;overflow:auto;}#"+EES_ESid+"EES_Isdiv li{padding:0px;margin:0px;list-style:none;width:12px;line-height:14px;font-size:12px;float:left;text-align:center;cursor:pointer;}#"+EES_ESid+"EES_Isdvw{font-size:52px;text-align:center;width:120px;height:68px;line-height:68px;text-align:center;border-bottom:"+EES_ESsy+" 2px solid;background-color:"+EES_ESby+";color:"+EES_ESsy+";}.EES_Iscdn{text-align:center;color:"+EES_ESsy+";}.EES_Iscds{background-color:"+EES_ESby+";color:"+EES_ESsy+";text-align:center;}</style>"
EES_Ischar=EES_Ischar+"<div id="+EES_ESid+"EES_Isdvw>演示</div><div id="+EES_ESid+"EES_Isdiv>";
var aChars=["＃","＠","＆","＊","※","§","〃","№","〓","○","●","△","▲","◎","☆","★","◇","◆","▽","▼","□","■","▁","▂","▃","▄","▅","▆","▇","█","▉","▊","▋","▌","▍","▎","▏","▓","㊣","℅","ˉ","￣","＿","﹉","﹊","﹍","﹎","﹋","﹌","﹟","﹠","﹡","♀","♂","⊕","⊙","↑","↓","←","→","↖","↗","↙","↘","∥","∣","／","＼","∕","﹨","&#65533;","&yen;","&pound;","&#8482;","&reg;","&copy;","、","。","．","；","：","？","！","︰","…","‥","′","‵","々","～","‖","ˇ","ˉ","﹐","﹑","﹒","·","﹔","﹕","﹖","﹗","｜","-","︱","-","︳","︴","﹏","（","）","︵","︶","｛","｝","︷","︸","〔","〕","︹","︺","【","】","︻","︼","《","》","︽","︾","〈","〉","︿","﹀","「","」","﹁","﹂","『","』","﹃","﹄","﹙","﹚","﹛","﹜","﹝","﹞","≈","≡","≠","＝","≤","≥","＜","＞","≮","≯","∷","±","＋","－","×","÷","／","∫","∮","∝","∞","∧","∨","∑","∏","∪","∩","∈","∵","∴","⊥","∥","∠","⌒","⊙","≌","∽","√","≦","≧","≒","≡","﹢","﹣","﹤","﹥","﹦","～","∟","⊿","㏒","㏑","°","′","″","＄","￥","〒","￠","￡","％","＠","℃","℉","﹩","﹪","‰","﹫","㏕","㎜","㎝","㎞","㏎","㎡","㎎","㎏","㏄","°","○","¤","ⅰ","ⅱ","ⅲ","ⅳ","ⅴ","ⅵ","ⅶ","ⅷ","ⅸ","ⅹ","Ⅰ","Ⅱ","Ⅲ","Ⅳ","Ⅴ","Ⅵ","Ⅶ","Ⅷ","Ⅸ","Ⅹ","Ⅺ","Ⅻ","⒈","⒉","⒊","⒋","⒌","⒍","⒎","⒏","⒐","⒑","⒒","⒓","⒔","⒕","⒖","⒗","⒘","⒙","⒚","⒛","⑴","⑵","⑶","⑷","⑸","⑹","⑺","⑻","⑼","⑽","⑾","⑿","⒀","⒁","⒂","⒃","⒄","⒅","⒆","⒇","①","②","③","④","⑤","⑥","⑦","⑧","⑨","⑩","㈠","㈡","㈢","㈣","㈤","㈥","㈦","㈧","㈨","㈩","&euro;","&lsquo;","&rsquo;","&ldquo;","&rdquo;","&ndash;","&mdash;","&iexcl;","&cent;","&pound;","&curren;","&yen;","&brvbar;","&sect;","&uml;","&copy;","&ordf;","&laquo;","&not;","&reg;","&macr;","&deg;","&plusmn;","&sup2;","&sup3;","&acute;","&micro;","&para;","&middot;","&cedil;","&sup1;","&ordm;","&raquo;","&frac14;","&frac12;","&frac34;","&iquest;","&Agrave;","&Aacute;","&Acirc;","&Atilde;","&Auml;","&Aring;","&AElig;","&Ccedil;","&Egrave;","&Eacute;","&Ecirc;","&Euml;","&Igrave;","&Iacute;","&Icirc;","&Iuml;","&ETH;","&Ntilde;","&Ograve;","&Oacute;","&Ocirc;","&Otilde;","&Ouml;","&times;","&Oslash;","&Ugrave;","&Uacute;","&Ucirc;","&Uuml;","&Yacute;","&THORN;","&szlig;","&agrave;","&aacute;","&acirc;","&atilde;","&auml;","&aring;","&aelig;","&ccedil;","&egrave;","&eacute;","&ecirc;","&euml;","&igrave;","&iacute;","&icirc;","&iuml;","&eth;","&ntilde;","&ograve;","&oacute;","&ocirc;","&otilde;","&ouml;","&divide;","&oslash;","&ugrave;","&uacute;","&ucirc;","&uuml;","&uuml;","&yacute;","&thorn;","&yuml;","０","１","２","３","４","５","６","７","８","９","：","；","＜","＝","＞","？","＠","Ａ","Ｂ","Ｃ","Ｄ","Ｅ","Ｆ","Ｇ","Ｈ","Ｉ","Ｊ","Ｋ","Ｌ","Ｍ","Ｎ","Ｏ","Ｐ","Ｑ","Ｒ","Ｓ","Ｔ","Ｕ","Ｖ","Ｗ","Ｘ","Ｙ","Ｚ","Б","Г","Д","Ж","З","И","Й","Σ","Υ","Φ","Ψ","Ω","＾","＿","｀","ā","á","ǎ","à","ō","ó","ǒ","ò","ē","é","ě","è","ê","ū","ú","ǔ","ù","ü","ǖ","ǘ","ǚ","ǜ","ī","í","ǐ","ì","零","壹","贰","叁","肆","伍","陆","柒","捌","玖","拾"];
for(i=0;i<aChars.length;i++){
EES_Ischar=EES_Ischar+'<li class="EES_Iscdn" onclick="EES_Sinto(\'' + aChars[i].replace(/&/g, "&amp;") + '\')" onmouseover="'+EES_ESid+'EES_Isdvw.innerHTML=this.innerHTML;this.className=\'EES_Iscds\';" onmouseout="this.className=\'EES_Iscdn\';">';
EES_Ischar=EES_Ischar+aChars[i];
EES_Ischar=EES_Ischar+'</li>';
}
EES_Ischar=EES_Ischar+'<div class=EES_CSScr></div></div>';
var EES_ESabout="架构与设计制作：阿赛\
<br>◇ 常用快捷键：Ctrl+C(拷贝)，Ctrl+X(剪切)，Ctrl+V(粘贴)；\
<br>◇ 快捷键：Ctrl+A(全选)，Ctrl+Z(撤销)，Ctrl+Y(重做)；\
<br>◇ 上传或插入文件自动识别任何格式；\
<br>◇ 右下角含向下三角形的图标是可以打开右弹下拉菜单的；\
<br>◇ 左下角含向下三角形的图标可以左弹下拉菜单；\
<br>◇ 编辑器内容预读需过滤，如ASP[html=server.HTMLEncode(html)]；\
<br>◇ 整套编辑器系统为原创JS架构，有问题找阿赛。";
EES_EScss="<style>\
#"+EES_ESid+"{background-color:transparent;position:relative;}#"+EES_ESid+" *,#"+EES_ESid+" * *{line-height:100%;}#"+EES_ESid+" ul,#"+EES_ESid+" li,#"+EES_ESid+" div{float;none;margin:0;}\
.EES_CSSk{width:"+EES_Vrwid+";height="+EES_Vrhei+"px;margin:0px;padding:0px;}\
.EES_CSSbar,button{background-color:transparent;}\
.EES_CSSbar ul,.EES_CSSbar li{margin:0px;padding:0px;}\
.EES_CSSstr{background-color:transparent;float:left;position:relative;cursor:pointer;font-size:12px;color:"+EES_ESsy+";}\
.EES_CSSstr span{-moz-border-radius:8px;-webkit-border-radius:8px;border-radius:8px;display:block;margin-top:2px;padding:0px 3px;border:1px solid "+EES_ESsy+";height:14px;line-height:14px;overflow:hidden;}\
.EES_CSSicok{background-color:transparent;width:20px;height:20px;float:left;position:relative;background-image:url("+EES_ESsm+EES_ESse+"AsaiEdit_Tool.png);cursor:pointer;text-align:center;line-height:20px;background-position:-760px;font-size:12px;color:"+EES_ESsy+";}\
.EES_CSSico{background-color:transparent;width:20px;height:20px;float:left;position:relative;background-image:url("+EES_ESsm+EES_ESse+"AsaiEdit_Tool.png);cursor:pointer;}\
.EES_CSSicox{background-color:transparent;width:20px;height:20px;float:left;position:relative;background-image:url("+EES_ESsm+EES_ESse+"AsaiEdit_Tool.png);cursor:pointer;}\
.EES_CSSconx{position:absolute;z-index:200;word-wrap:break-word;padding:10px;top:20px;right:0px;font-size:12px;border-top:1px solid "+EES_ESsy+";border-right:3px solid "+EES_ESsy+";border-bottom:1px solid "+EES_ESsy+";border-left:1px solid "+EES_ESsy+";background:"+EES_ESqy+";color:"+EES_ESsy+";text-align:left;}.EES_CSScon *,.EES_CSSconx *{color:"+EES_ESsy+";}.EES_CSScon label,.EES_CSSconx label{display:inline;position:static;background:"+EES_ESqy+";color:"+EES_ESsy+";}\
.EES_CSScon{position:absolute;z-index:200;word-wrap:break-word;padding:10px;top:20px;font-size:12px;border-top:1px solid "+EES_ESsy+";border-right:1px solid "+EES_ESsy+";border-bottom:1px solid "+EES_ESsy+";border-left:3px solid "+EES_ESsy+";background:"+EES_ESqy+";color:"+EES_ESsy+";display:none;text-align:left;}{color:"+EES_ESsy+";}\
.EES_CSSa,a.EES_CSSa,a.EES_CSSa:link,a.EES_CSSa:active,a.EES_CSSa:visited{cursor:pointer;text-decoration:none;word-wrap:break-word;margin-right:3px;color:"+EES_ESsy+";}\
a.EES_CSSa:hover{background:"+EES_ESby+";}\
.EES_CSSay{width:218px;}.EES_CSSays,a.EES_CSSays,a.EES_CSSays:link,a.EES_CSSays:active,a.EES_CSSays:visited{font-size:12px;cursor:pointer;text-decoration:none;}\
a.EES_CSSays:hover{}\
.EES_CSSico:hover,.EES_CSSicok:hover,.EES_CSSicox:hover{background-color:"+EES_ESqy+";}\
.EES_CSSico:hover .EES_CSScon,.EES_CSSicok:hover .EES_CSScon{display:block;}\
.EES_CSScr{clear:both;}\
</style>"
EES_ESbar="<div class=\"EES_CSSbar\"><ul>\
<div class=\"EES_CSSico\" title=\"样式\"><div class=\"EES_CSScon\" style=\"width:188px;\">\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<h1>','</h1>')\" title=\"标题一\">标题一</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<h2>','</h2>')\" title=\"标题二\">标题二</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<h3>','</h3>')\" title=\"标题三\">标题三</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<h4>','</h4>')\" title=\"标题四\">标题四</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<h5>','</h5>')\" title=\"标题五\">标题五</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<h6>','</h6>')\" title=\"标题六\">标题六</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<h7>','</h7>')\" title=\"标题七\">标题七</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=display:block;margin:10px;border-color:#DDDD88;border-width:1px;border-style:solid;padding:5px;background:#FFFFDD;color:#666600;font-size:12px;><b>代码：</b><br><br>','</span>')\" title=\"代码\"><span StylE=border-color:#DDDD88;border-width:1px;border-style:solid;background:#FFFFDD;color:#666600;>代码</span></a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=display:block;margin:10px;border-color:#D8D8D8;border-width:1px;border-style:solid;padding:5px;background-color:#F5F5F5;color:#666666;font-size:12px;><b>引用：</b><br><br>','</span>')\" title=\"引用\"><span StylE=border-color:#D8D8D8;border-width:1px;border-style:solid;background-color:#F5F5F5;color:#666666;>引用</span></a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=background-color:#EEE;color:#DDD;>','</span>')\" title=\"淡化\"><span StylE=background-color:#EEE;color:#DDD;>淡化</span></a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=background-color:#DDD;color:#DDD;>','</span>')\" title=\"隐藏\"><span StylE=background-color:#DDD;color:#DDD;>隐藏</span></a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=background-color:#FFFF00;color:#FF0000;>','</span>')\" title=\"标记\"><span StylE=background-color:#FFFF00;color:#FF0000;>标记</span></a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=background-color:#FF0000;color:#FFFF00;>','</span>')\" title=\"突出\"><span StylE=background-color:#FF0000;color:#FFFF00;>突出</span></a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<strike>','</strike>')\" title=\"删线\"><strike>删线</strike></a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<sup>','</sup>')\" title=\"上标\">上标</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<sub>','</sub>')\" title=\"下标\">下标</a>\
</div></div>\
<div class=\"EES_CSSico\" style=\"background-position:-20px\" title=\"字体\"><div class=\"EES_CSScon\" style=\"width:288px;\">\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'仿宋')\" title=\"仿宋\" style=\"font-family:仿宋\">仿宋</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'黑体')\" title=\"黑体\" style=\"font-family:黑体\">黑体</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'楷体')\" title=\"楷体\" style=\"font-family:楷体\">楷体</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'宋体')\" title=\"宋体\" style=\"font-family:宋体\">宋体</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'微软雅黑')\" title=\"微软雅黑\" style=\"font-family:微软雅黑\">微软雅黑</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'新宋体')\" title=\"新宋体\" style=\"font-family:新宋体\">新宋体</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Times New Roman')\" title=\"Times New Roman\" style=\"font-family:Times New Roman\">Times New Roman</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Courier New')\" title=\"Courier New\" style=\"font-family:Courier New\">Courier New</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Trebuchet MS')\" title=\"Trebuchet MS\" style=\"font-family:Trebuchet MS\">Trebuchet MS</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Arial Black')\" title=\"Arial Black\" style=\"font-family:Arial Black\">Arial Black</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Times New Roman')\" title=\"Times New Roman\" style=\"font-family:Times New Roman\">Times New Roman</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Palatino Linotype')\" title=\"Palatino Linotype\" style=\"font-family:Palatino Linotype\">Palatino Linotype</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Book Antiqua')\" title=\"Book Antiqua\" style=\"font-family:Book Antiqua\">Book Antiqua</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Lucida Sans Unicode')\" title=\"Lucida Sans Unicode\" style=\"font-family:Lucida Sans Unicode\">Lucida Sans Unicode</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Lucida Grande')\" title=\"Lucida Grande\" style=\"font-family:Lucida Grande\">Lucida Grande</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'MS Serif')\" title=\"MS Serif\" style=\"font-family:MS Serif\">MS Serif</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'New York')\" title=\"New York\" style=\"font-family:New York\">New York</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Lucida Console')\" title=\"Lucida Console\" style=\"font-family:Lucida Console\">Lucida Console</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(1,'Comic Sans MS')\" title=\"Comic Sans MS\" style=\"font-family:Comic Sans MS\">Comic Sans MS</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Verdana')\" title=\"Verdana\" style=\"font-family:Verdana\">Verdana</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Geneva')\" title=\"Geneva\" style=\"font-family:Geneva\">Geneva</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'sans-serif')\" title=\"sans-serif\" style=\"font-family:sans-serif\">sans-serif</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Georgia')\" title=\"Georgia\" style=\"font-family:Georgia\">Georgia</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Times')\" title=\"Times\" style=\"font-family:Times\">Times</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'serif')\" title=\"serif\" style=\"font-family:serif\">serif</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Courier')\" title=\"Courier\" style=\"font-family:Courier\">Courier</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'monospace')\" title=\"monospace\" style=\"font-family:monospace\">monospace</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Arial')\" title=\"Arial\" style=\"font-family:Arial\">Arial</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Helvetica')\" title=\"Helvetica\" style=\"font-family:Helvetica\">Helvetica</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Tahoma')\" title=\"Tahoma\" style=\"font-family:Tahoma\">Tahoma</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Helvetica')\" title=\"Helvetica\" style=\"font-family:Helvetica\">Helvetica</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Gadget')\" title=\"Gadget\" style=\"font-family:Gadget\">Gadget</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Palatino')\" title=\"Palatino\" style=\"font-family:Palatino\">Palatino</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'Monaco')\" title=\"Monaco\" style=\"font-family:Monaco\">Monaco</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sziti(0,'cursive')\" title=\"cursive\" style=\"font-family:cursive\">cursive</a>\
</div></div>\
<div class=\"EES_CSSico\" style=\"background-position:-40px\" title=\"字号\"><div class=\"EES_CSScon\" style=\"width:288px;\">\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:5px>','</span>')\" title=\"[微号]\" style=\"font-size:12px\">[微号]</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:3px>','</span>')\" title=\"[小微]\" style=\"font-size:12px\">[小微]</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:1px>','</span>')\" title=\"[超微]\" style=\"font-size:12px\">[超微]</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:6.7px>','</span>')\" title=\"八号\" style=\"font-size:6.7px\">八号</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:7.3px>','</span>')\" title=\"七号\" style=\"font-size:7.3px\">七号</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:10px>','</span>')\" title=\"六号\" style=\"font-size:10px\">六号</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:8.7px>','</span>')\" title=\"小六\" style=\"font-size:8.7px\">小六</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:12px>','</span>')\" title=\"小五\" style=\"font-size:12px\">小五</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:14px>','</span>')\" title=\"五号\" style=\"font-size:14px\">五号</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:16px>','</span>')\" title=\"小四\" style=\"font-size:16px\">小四</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:18.7px>','</span>')\" title=\"四号\" style=\"font-size:18.7px\">四号</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:20px>','</span>')\" title=\"小三\" style=\"font-size:20px\">小三</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:21.3px>','</span>')\" title=\"三号\" style=\"font-size:21.3px\">三号</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:24px>','</span>')\" title=\"小二\" style=\"font-size:24px\">小二</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:29.3px>','</span>')\" title=\"二号\" style=\"font-size:29.3px\">二号</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:32px>','</span>')\" title=\"小一\" style=\"font-size:32px\">小一</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:34.7px>','</span>')\" title=\"一号\" style=\"font-size:34.7px\">一号</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:48px>','</span>')\" title=\"小初\" style=\"font-size:48px\">小初</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:56px>','</span>')\" title=\"初号\" style=\"font-size:56px\">初号</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:71.7px>','</span>')\" title=\"[特号]\" style=\"font-size:12px\">[特号]</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:83.7px>','</span>')\" title=\"[大特]\" style=\"font-size:12px\">[大特]</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sstyle('<span StylE=font-size:95.6px>','</span>')\" title=\"[超大]\" style=\"font-size:12px\">[超大]</a>\
</div></div>\
<div class=\"EES_CSSico\" style=\"background-position:-60px\" title=\"字体颜色\"><div class=\"EES_CSScon\">"+EES_ESysx+"</div></div>\
<div class=\"EES_CSSico\" style=\"background-position:-80px\" title=\"背景颜色\"><div class=\"EES_CSScon\">"+EES_ESysxb+"</div></div>\
<div class=\"EES_CSSico\" style=\"background-position:-380px\" title=\"插入自定义\"><div class=\"EES_CSScon\" style=\"width:108px;\">\
<a class=\"EES_CSSa\" onClick=\"EES_Sinto('0')\" title=\"分页标志\">分页标志</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sinto('[eeSai]')\" title=\"秘密标志\">秘密标志</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sinto('1')\" title=\"版权文字\">版权文字</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sinto('2')\" title=\"当前时间\">当前时间</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sinto('<span style=font-weight:bold;font-size:58px;line-height:200%;color:#FF0000;>红头文件标题</span>')\" title=\"红头标题\">红头标题</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sinto('<span style=display:block;background-color:#F00;height:5px;></span>')\" title=\"红头线条\">红头线条</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sinto('<hr>')\" title=\"一条横线\">一条横线</a>\
<a class=\"EES_CSSa\" onClick=\"EES_Sinto(document.URL)\" title=\"插入当前链接\">当前链接</a>\
</div></div>\
<div class=\"EES_CSSico\" style=\"background-position:-400px\" title=\"插入特殊字符\"><div class=\"EES_CSScon\">"+EES_Ischar+"</div></div>\
<div class=\"EES_CSSico\" style=\"background-position:-100px\" title=\"加粗\" onClick=\"EES_Sformat('Bold')\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-120px\" title=\"斜体\" onClick=\"EES_Sformat('Italic')\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-140px\" title=\"下划线\" onClick=\"EES_Sformat('Underline')\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-160px\" title=\"将选中的对象左对齐\" onClick=\"EES_Sstyle('<p style=text-align:left;display:block;>','</p>')\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-180px\" title=\"将选中的对象居中对齐\" onClick=\"EES_Sstyle('<p style=text-align:center;display:block;>','</p>')\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-200px\" title=\"将选中的对象右对齐\" onClick=\"EES_Sstyle('<p style=text-align:right;display:block;>','</p>')\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-220px\" title=\"编号列表\" onClick=\"EES_Sformat('insertorderedlist')\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-240px\" title=\"项目列表\" onClick=\"EES_Sformat('insertunorderedlist')\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-300px\" title=\"清除HTML格式(纯文本)\" onClick=\"EES_Shtml()\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-320px\" title=\"清除Word格式\" onClick=\"EES_Sword()\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-340px\" title=\"自动排版(保留表格、图片、链接、换行，压缩空行，段首加空格。)\" onClick=\"EES_Sauto()\"></div>";
//--------精简版可删■■■↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
EES_ESbar=EES_ESbar+"\
<div class=\"EES_CSSico\" style=\"background-position:-280px\" title=\"清除选中的连接\" onClick=\"EES_Sformat('Unlink')\"></div>\
<div id=\""+EES_ESid+"EES_Inlink\" class=\"EES_CSSicox\" onMouseOut=\"EES_Inclose();\" onMouseOver=\"EES_InlinkX();\" style=\"background-position:-260px\" title=\"对选中对象创建链接\"></div>\
<div id=\""+EES_ESid+"EES_Inemot\" class=\"EES_CSSicox\" onMouseOut=\"EES_Inclose();\" onMouseOver=\"EES_InemotX();\" style=\"background-position:-420px\" title=\"插入表情\"></div>\
<div id=\""+EES_ESid+"EES_Intable\" class=\"EES_CSSicox\" onMouseOut=\"EES_Inclose();\" onMouseOver=\"EES_IntableX()\" style=\"background-position:-440px\" title=\"插入表格\"></div>\
<div id=\""+EES_ESid+"EES_Inreplace\" class=\"EES_CSSicox\" onMouseOut=\"EES_Inclose();\" onMouseOver=\"EES_InreplaceX();\" style=\"background-position:-560px\" title=\"查找替换\"></div>\
<div id=\""+EES_ESid+"EES_Infile\" class=\"EES_CSSicox\" onMouseOut=\"EES_Inclose();\" onMouseOver=\"EES_InfileX();\" style=\"background-position:-460px\" title=\"插入媒体(图片、动画、视频等)\"></div>";
//--------精简版可删■■■↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
EES_ESbar=EES_ESbar+"<div class=\"EES_CSSico\" style=\"background-position:-360px\" title=\"参考线\" onClick=\"EES_Seborder()\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-480px\" title=\"关于编辑器\"><div class=\"EES_CSScon\" style=\"right:0px;width:388px;\">"+EES_ESabout+"</div></div>\
<div class=\"EES_CSSico\" style=\"background-position:-500px\" title=\"HTML代码\" onClick=\"EES_Scodearea()\"></div>\
<div class=\"EES_CSSico\" style=\"background-position:-540px\" title=\"全屏编辑\" onClick=\"EES_Sfullscreen()\"></div>\
<div class=\"EES_CSSicok\" title=\"恢复操作选择\" onClick=\"EES_ESave()\">⊙<div class=\"EES_CSScon\" style=\"right:0px;width:188px;\">\
<a class=\"EES_CSSa\" onClick=\"EES_ERec('0')\">恢复定时缓存<span id=\"EES_Ezsv0\"></span></a>\
<a class=\"EES_CSSa\" onClick=\"EES_ERec('1')\">恢复手动缓存<span id=\"EES_Ezsv1\"></span></a>\
<a class=\"EES_CSSa\" onClick=\"EES_ERec('2')\">恢复上次缓存<span id=\"EES_Ezsv2\"></span></a>\
</div></div>\
<div class=\"EES_CSSicok\" title=\"定时保存：单击立即保存。\" id=\"EES_Ezsv\" onClick=\"EES_ESave()\"></div>\
<div class=\"EES_CSSstr\" title=\"编辑器内容字数统计\" id=\"EES_Eztj\"></div>\
<div class=\"EM_CSScr\"></div>\
</div>";
if(document.getElementById(EES_ESan)){
InitValue=document.getElementById(EES_ESan).value;InitValue=EES_Ehtmsi(InitValue)
}
document.write(EES_EScss+"<div id='"+EES_ESid+"' class='EES_CSSk'>阿赛HTML在线编辑器[AsaiEdit]</div>");
EES_EDDiv=document.getElementById(EES_ESid);
EES_EDDiv.innerHTML=EES_ESbar;
EES_Ktextarea=document.createElement("textarea");
EES_Ktextarea.style.display="none";
EES_Ktextarea.style.width=EES_Vrwid;
EES_Ktextarea.style.height=EES_Vrheic;
EES_Ktextarea.style.fontSize="12px";
EES_Ktextarea.style.color=""+EES_ESsy+"";
EES_Ktextarea.style.background=""+EES_ESqy+"";
EES_Ktextarea.style.border="0px";
EES_EDDiv.appendChild(EES_Ktextarea);
EES_Kiframe=document.createElement("iframe");
EES_Kiframe.name=EES_Kiframe.id="EES_Efrm";
EES_Kiframe.style.width=EES_Vrwid;
EES_Kiframe.style.height=EES_Vrheic;
EES_Kiframe.style.background="transparent";
EES_Kiframe.frameBorder=0;
EES_Kiframe.marginHeight=0;
EES_Kiframe.marginWidth=0;
EES_Kiframe.src="about:blank";
EES_EDDiv.appendChild(EES_Kiframe);
EES_EDWindow=EES_Kiframe.contentWindow;
with(EES_EDWindow.document){
designMode="On";
contentEditable=true;
open();
writeln("<html><head><title>阿赛HTML在线编辑器[AsaiEdit]</title><style>::-webkit-scrollbar{width:10px;height:10px;}::-webkit-scrollbar-track{background-color:"+EES_ESqy+";}::-webkit-scrollbar-thumb{background-color:"+EES_ESsy+";}::-webkit-scrollbar-button{background-color:"+EES_ESsy+";}::-webkit-scrollbar-corner{background-color:"+EES_ESqy+";}body{scrollbar-face-color:"+EES_ESsy+";scrollbar-shadow-color:"+EES_ESqy+";scrollbar-highlight-color:"+EES_ESqy+";scrollbar-3dlight-color:"+EES_ESsy+";scrollbar-darkshadow-color:"+EES_ESsy+";scrollbar-track-color:"+EES_ESqy+";scrollbar-arrow-color:"+EES_ESsy+";}</style>"+EES_ESfs+"</head><body></body></html>");
close();
//body.style.width=(EES_Vrwid.toString().indexOf("%")==-1? parseInt(EES_Vrwid)-30-10+"px":EES_Vrwid);
//body.style.padding=(EES_Vrwid.toString().indexOf("%")==-1? "10px":"0px");
body.style.width="100%";
//body.style.fontSize="14px";
body.innerHTML=InitValue;
}
EES_EAddEventHandler(EES_EDWindow.document,"contextmenu",EES_Smon);
EES_EAddEventHandler(EES_EDWindow.document,"mouseup",EES_Smup);
EES_EAddEventHandler(EES_EDWindow.document,"click",EES_Smgo);
EES_EAddEventHandler(EES_EDWindow.document,"keydown",EES_Skon);
EES_EAddEventHandler(EES_EDWindow.document,"keyup",EES_Skup);
}
var EES_Mtishi={'modcode':"当前代码模式，请返回编辑模式！"};
/* ---------------------------- 编辑器FUN ---------------------------- */
//定义编辑器区域鼠标与键盘动作
function EES_EAddEventHandler(Target,EventType,Handler){if(Target.attachEvent){Target.attachEvent("on"+EventType,Handler);}else if(Target.addEventListener){Target.addEventListener(EventType,Handler,false);}else{Target["on"+EventType]=Handler;}}
//当鼠标离开编辑器按钮时候触发的动作
function EES_Smgo(e){EES_EGetContent();}
//当鼠标抵达编辑器按钮时候触发的动作
function EES_Smon(e){EES_EGetContent();EES_Emenuk(e);if(document.all){return false;}else{e.preventDefault();}}
//当鼠标离开按钮或弹起时的动作
function EES_Smup(e){if(document.all){EES_EDCurGEditor=e.srcElement.document.parentWindow;}else{EES_EDCurGEditor=e.target.ownerDocument.defaultView;}}
//当键盘按键抬起时候的动作
function EES_Skup(e){EES_EGetContent();}
//当键盘按键按下时候的动作
function EES_Skon(e){EES_Ekyinput(e);EES_EGetContent();}
//获取时间
function EES_ETime(){
var date = new Date();  
var month = date.getMonth()+1;  
var day = date.getDate();  
var house = date.getHours();  
var minutes = date.getMinutes();  
var second = date.getSeconds();  
return month + "-" + day + " " + house + ":" + minutes + ":" + second
}
//自动保存功能模块
EES_ESaveat();
function EES_ESaveat(){
var s=0;
setInterval(function(){
s++;
if(s===30){
var EES_Enrs=EES_EGetContent();
if(EES_Enrs)localStorage.setItem("EES_Enrsv0",EES_Enrs);
s=0;
document.getElementById('EES_Ezsv0').innerHTML="["+EES_ETime()+"] ("+EES_Enrs.replace(/<\/?[^>]*>|[\r\n]/gi,"").length+")";
}else{
document.getElementById('EES_Ezsv').innerHTML=30-s;
};
},1000);
};
function EES_ESave(){
var EES_Enrs=EES_EGetContent();
if(EES_Enrs){
var EES_Enrsbc=localStorage.getItem("EES_Enrsv1");
localStorage.setItem("EES_Enrsv2",EES_Enrsbc);
document.getElementById('EES_Ezsv2').innerHTML=document.getElementById('EES_Ezsv1').innerHTML;
localStorage.setItem("EES_Enrsv1",EES_Enrs);
document.getElementById('EES_Ezsv1').innerHTML="["+EES_ETime()+"] ("+EES_Enrs.replace(/<\/?[^>]*>|[\r\n]/gi,"").length+")";
}
document.getElementById('EES_Ezsv').innerHTML="OK";
};
function EES_ERec(ty){
var EES_Enrs=localStorage.getItem("EES_Enrsv"+ty);
if(EES_Enrs){
EES_EDWindow.document.body.innerHTML=EES_Enrs;
document.getElementById(EES_ESan).value=EES_Enrs;
};
};
//获取编辑器内容（全部）
function EES_EGetContent(){
EES_EDValue=EES_Ktextarea.value=EES_Ehtmsi(EES_EDWindow.document.body.innerHTML);
if(document.getElementById(EES_ESid)){
if(isNaN(EES_ESlen)){EES_ESlen=1000;}
var obj=document.getElementById(EES_ESid);
var conlen=EES_EDValue.length;
if(conlen>EES_ESlen){alert("注意:文档大小"+conlen+">"+EES_ESlen+"(限长).")}
obj.value=EES_EDValue.substr(0,EES_ESlen);}
document.getElementById('EES_Eztj').innerHTML="<span title=文档大小"+conlen+"/限长"+EES_ESlen+">"+EES_EDValue.replace(/<\/?[^>]*>|[\r\n]/gi,"").length+"字符</span>";//获取当前文档代码字数；
if(document.getElementById(EES_ESan)){document.getElementById(EES_ESan).value=EES_EDValue;}
return EES_EDValue;
}
//检测按键执行动作
function EES_Ekyinput(e){if(e.keyCode==13){if(document.all){EES_Sincode("<br />");e.returnValue=false;}else{/*e.preventDefault();*/}}}
//获取编辑器中"&EEs_tcxz&"内容（动作）
function EES_EGetRange(){
with(EES_EDWindow){focus();
if(document.all){return document.selection.createRange();}else{var selection=getSelection();
return selection.getRangeAt(selection.rangeCount-1).cloneRange();}}}
//获取编辑器内容（"&EEs_tcxz&"部分）
function EES_EGetContentPart(){
var oRange=EES_EGetRange();
if(document.all){return oRange.htmlText;}
else{var contents=oRange.cloneContents();
var cnt=document.createElement("div");
cnt.appendChild(contents);
return cnt.innerHTML;}
}
//向编辑器中插入代码
function EES_Sincode(sHTML){
if(!EES_EDMode){alert(EES_Mtishi['modcode']);return;}
var oRange=EES_EGetRange();
if(document.all){oRange.pasteHTML(sHTML);}else{var oFrag=oRange.createContextualFragment(sHTML);
oRange.deleteContents();
oRange.insertNode(oFrag);}
EES_EGetContent();}
//向编辑器中插入图片
function EES_imgin(sSTR){
EES_Sincode("<img src="+sSTR+">");
}
//给内容加样式
function EES_Sstyle(Mark1,Mark2){
if(!EES_EDMode){alert(EES_Mtishi['modcode']);return;}
var oRange=EES_EGetRange();
with(EES_EDWindow){focus();
var html=EES_EGetContentPart();
if(html!=""){
html=Mark1+html+Mark2
if(document.all){oRange.pasteHTML(html);}else{var oFrag=oRange.createContextualFragment(html);
oRange.deleteContents();
oRange.insertNode(oFrag);}}
EES_EGetContent();}
}
//字体
function EES_Sziti(Scty,Scstr){
if(!EES_EDMode){alert(EES_Mtishi['modcode']);return;}
var oRange=EES_EGetRange();
with(EES_EDWindow){focus();
var html=EES_EGetContentPart();
if(html!=""){
if(Scty=="0"){
html="<span StylE=\"font-family:"+Scstr+"\">"+html+"</span>"
}else{
html="<span StylE=\"font-family:'"+Scstr+"'\">"+html+"</span>"
}
if(document.all){oRange.pasteHTML(html);}else{var oFrag=oRange.createContextualFragment(html);
oRange.deleteContents();
oRange.insertNode(oFrag);}}
EES_EGetContent();}
}
//文字背景与文字颜色
function EES_Scolor(Scty,Scstr){
if(!EES_EDMode){alert(EES_Mtishi['modcode']);return;}
var oRange=EES_EGetRange();
with(EES_EDWindow){focus();
var html=EES_EGetContentPart();
if(html!=""){
if(Scty=="0"){
html="<span StylE=\"Color:"+Scstr+"\">"+html+"</span>"
}else{
html="<span StylE=\"background-color:"+Scstr+"\">"+html+"</span>"
}
if(document.all){oRange.pasteHTML(html);}else{var oFrag=oRange.createContextualFragment(html);
oRange.deleteContents();
oRange.insertNode(oFrag);}}
EES_EGetContent();}
}
//JS编辑器常规命令
function EES_Sformat(what,opt){
if(!EES_EDMode){alert(EES_Mtishi['modcode']);return;}
with(EES_EDWindow){focus();
if(!opt){document.execCommand(what,false,null);}else{if(document.all){document.execCommand(what,"",opt);
}else{document.execCommand(what,false,opt);}}}
EES_EGetContent();
}
//全屏编辑器的命令
function EES_Sfullscreen(){
var oHtml=document.getElementsByTagName("html");
var sl=parseInt(document.body.scrollLeft);
var st=parseInt(document.body.scrollTop);
if(EES_SfullscreenMode==1){document.body.style.width=document.body.style.height="";
document.body.style.overflow="";
oHtml[0].style.overflow="";
EES_EDDiv.style.position="";
EES_EDDiv.style.background="transparent";
EES_EDDiv.style.zIndex="";
EES_Kiframe.style.width=EES_Ktextarea.style.width=EES_EDDiv.style.width=EES_Vrwid;
EES_Kiframe.style.height=EES_Ktextarea.style.height=EES_Vrheic;
EES_EDDiv.style.height=EES_Vrhei;
EES_SfullscreenMode=0;}else{oHtml[0].style.overflow="hidden";
document.body.style.overflow=document.all? "hidden":"visible";
document.body.style.width=document.body.style.height=0;
var page=EES_Esizegt();
EES_EDDiv.style.position="fixed";
EES_EDDiv.style.zIndex=1000;
EES_EDDiv.style.background=""+EES_ESqy+"";
EES_EDDiv.style.left=sl+"px";
EES_EDDiv.style.top=st+"px";
EES_Kiframe.style.width=EES_Ktextarea.style.width=EES_EDDiv.style.width=page[2]+"px";
EES_Kiframe.style.height=EES_Ktextarea.style.height=EES_EDDiv.style.height=(page[3]-parseInt(EES_Vrheit))+"px";
EES_SfullscreenMode=1;}
document.body.scrollLeft=sl;
document.body.scrollTop=st;
}
//全屏时候获取浏览器长宽
function EES_Esizegt(){
var xScroll,yScroll;
if(window.innerHeight && window.scrollMaxY){xScroll=document.body.scrollWidth;
yScroll=window.innerHeight+window.scrollMaxY;}else if(document.body.scrollHeight>document.body.offsetHeight){xScroll=document.body.scrollWidth;
yScroll=document.body.scrollHeight;}else{xScroll=document.body.offsetWidth;
yScroll=document.body.offsetHeight;}
var windowWidth,windowHeight;
if(self.innerHeight){windowWidth=self.innerWidth;
windowHeight=self.innerHeight;}else if(document.documentElement && document.documentElement.clientHeight){windowWidth=document.documentElement.clientWidth;
windowHeight=document.documentElement.clientHeight;}else if(document.body){windowWidth=document.body.clientWidth;
windowHeight=document.body.clientHeight;}
if(yScroll<windowHeight){pageHeight=windowHeight;}else{pageHeight=yScroll;}
if(xScroll<windowWidth){pageWidth=windowWidth;}else{pageWidth=xScroll;}
arrayPageSize=new Array(pageWidth,pageHeight,windowWidth,windowHeight)
return arrayPageSize;
}
//即时处理编辑区代码
function EES_Ehtmsi(html){
html=html.replace(/<(BR [^>]+)>/gi,'<br>');
//if(EES_Vrhei.substring(2,3)=="8"){
//html=html.replace(/<div/gi,'<p');
//html=html.replace(/<\/div>/gi,'</p>');
//}
return html;
}
//清理html标签
function EES_Shtml(){
var html=EES_EGetContent();
html=html.replace(/\<br[^>]*>/gi,"[$br]");
html=html.replace(/<\/div>/gi,'[$br]');
html=html.replace(/<\/p>/gi,'[$br]');
html=html.replace(/<[^>]+>/g,"");
html=html.replace(/(^\s+)|(\s+$)/g,"");
html=html.replace(/\[\$br\]/gi,"<br>");
html=html.replace(/　　/ig,'');
EES_EDWindow.document.body.innerHTML=html;
document.getElementById(EES_ESan).value=html;
}
//处理编辑器多余的word格式
function EES_Sword(){
var html=EES_EGetContent();
//清理word标签
html=html.replace(/<STYLE[^>]*>[\s\S]*?<\/STYLE>/gi,'');
html=html.replace(/<SCRIPT[^>]*>[\s\S]*?<\/SCRIPT>/gi,'');
html=html.replace(/<\/?span[^>]*>/gi,"");
html=html.replace(/<(\w[^>]*) style="([^"]*)"([^>]*)/gi,"<$1$3") ;
html=html.replace(/<(\w[^>]*) class=([^ |>]*)([^>]*)/gi,"<$1$3") ;
html=html.replace(/<(\w[^>]*) lang=([^ |>]*)([^>]*)/gi,"<$1$3") ;
html=html.replace(/<\\?\?xml[^>]*>/gi,"") ;
html=html.replace(/<\/?\w+:[^>]*>/gi,"") ;
html=html.replace(/<!--.*?-->/gi,'');

//压缩代码
html=html.replace(/　　/ig,'');
html=html.replace(/[\f|\r|\n|\t|\v]/gi,'');
html=html.replace(/>\s+</gi,'><');
html=html.replace(/(^\s+)|(\s+$)/g,"");
html=html.replace(/<p><\/p>/gi,'');
html=html.replace(/<br><p/gi,'<p');
html=html.replace(/p><br>/gi,'p>');
html=html.replace(/<br><br>/gi,'<br>');
EES_EDWindow.document.body.innerHTML=html;
document.getElementById(EES_ESan).value=html;
}
//全自动纯文本+图片+表格排版
function EES_Sauto(){
var html=EES_EGetContent();
//替换需要保留的标签
html=html.replace(/\<br[^>]*>/gi,"[$br]");
html=html.replace(/<\/div>/gi,'[$br]');
html=html.replace(/<\/p>/gi,'[$br]');
html=html.replace(/\<img([^>]*)>/gim,"[img$1]");
html=html.replace(/\<table([^>]*)>/gim,"[table$1]");
html=html.replace(/<\/table>/gi,'[$xtable]');
html=html.replace(/\<tbody([^>]*)>/gim,"[tbody$1]");
html=html.replace(/<\/tbody>/gi,'[$xtbody]');
html=html.replace(/\<tr([^>]*)>/gim,"[tr$1]");
html=html.replace(/<\/tr>/gi,'[$xtr]');
html=html.replace(/\<td([^>]*)>/gim,"[td$1]");
html=html.replace(/<\/td>/gi,'[$xtd]');
html=html.replace(/\<a([^>]*)>/gim,"[a$1]");
html=html.replace(/<\/a>/gi,'[$xa]');
html=html.replace(/\<b[^>]*>/gi,"[$b]");
html=html.replace(/\<strong[^>]*>/gi,"[$b]");
html=html.replace(/<\/b>/gi,'[$xb]');
html=html.replace(/<\/strong>/gi,'[$xb]');
//清理剩余HTML标签
html=html.replace(/<[^>]+>/g,"");
html=html.replace(/(^\s+)|(\s+$)/g,"");
//替换回需要保留的标签
html=html.replace(/　　/ig,'');
html='　　'+html
html=html.replace(/\[\$br\]/gi,"<br>");
html=html.replace(/<br><br>/gi,'<br>');
html=html.replace(/<br><br>/gi,'<br>');
html=html.replace(/<br>/gi,"<br>　　");//每个换行符前加空格
html=html.replace(/　　<br>　　<br>/gi,"　　<br>");
html=html.replace(/<br>　　<br>　　/gi,"<br>　　");
html=html.replace(/\[img([^\]]*)\]/gim,"<img$1>");
html=html.replace(/\[table([^\]]*)\]/gim,"<table$1>");
html=html.replace(/\[\$xtable\]/gi,"</table>");
html=html.replace(/\[tbody([^\]]*)\]/gim,"<tbody$1>");
html=html.replace(/\[\$xtbody\]/gi,"</tbody>");
html=html.replace(/\[tr([^\]]*)\]/gim,"<tr$1>");
html=html.replace(/\[\$xtr\]/gi,"</tr>");
html=html.replace(/\[td([^\]]*)\]/gim,"<td$1>");
html=html.replace(/\[\$xtd\]/gi,"</td>");
html=html.replace(/\[a([^\]]*)\]/gim,"<a$1>");
html=html.replace(/\[\$xa\]/gi,"</a>");
html=html.replace(/\[\$b\]/gi,"<b>");
html=html.replace(/\[\$xb\]/gi,"</b>");
html=html.replace(/\<img([^>]*)>/gim,"<center><img$1></center>");
html=html+'<.>'
html=html.replace(/<br>　　<.>/gi,"");
html=html.replace(/<.>/gi,"");
EES_EDWindow.document.body.innerHTML=html;
document.getElementById(EES_ESan).value=html;
//Only for eesai用来自动得到摘要内容
document.getElementById("ss").value=html.replace(/<[^>]+>/g,"").substring(0,180).replace(/　/ig,'');
}
//向内容中插入
function EES_Sinto(Mark1){
if(!EES_EDMode){alert(EES_Mtishi['modcode']);return;}
var oRange=EES_EGetRange();
with(EES_EDWindow){focus();
var html=Mark1;
if(html!=""){
if(html=="0"){html="[page]"}
if(html=="1"){html="[EESai.Com]"}
if(html=="2"){
var itime=new Date()
html=itime.getFullYear()+"-"+(itime.getMonth()+1)+"-"+itime.getDate()+" "+itime.getHours()+":"+itime.getMinutes()+":"+itime.getSeconds();
}
if(document.all){oRange.pasteHTML(html);}else{var oFrag=oRange.createContextualFragment(html);
oRange.deleteContents();
oRange.insertNode(oFrag);}}
EES_EGetContent();}
}
//插入弹窗返回的代码
function EES_Opcode(value){if(value){EES_Sincode(""+value+"");}}
//使用第三方编辑器编辑内容
function EES_Opue(){if(EES_ESpop!=""){EES_Opcode(window.prompt("第三方编辑器：","阿赛HTML在线编辑器[AsaiEdit]"));}else{EES_Opcode(showModalDialog(""+EES_ESpop+"",window,"dialogWidth:520px;dialogHeight:320px;status:0;help:0;scroll:no;"));}}
//显示隐藏HTML编码区域Show And Hidden Code Area
function EES_Scodearea(){
var selects=document.getElementsByTagName("select");
if(EES_Ktextarea.style.display=="none"){EES_Ktextarea.style.display="";
EES_Kiframe.style.display="none";
EES_EDMode=0;}else{EES_EDWindow.document.body.innerHTML=EES_Ktextarea.value;
EES_Ktextarea.style.display="none";
EES_Kiframe.style.display="";
EES_EDMode=1;}
EES_EGetContent();
}
//显示参考线Show And Hidden Edit->document.body Elements Borders
function EES_Seborder(){
var oCssRules;
var cssTxt="strong,b,i,em,u,li{border:"+EES_ESsy+" 1px dotted;padding:0px 2px;}a{border-bottom:"+EES_ESsy+" 2px dotted;margin:0px 3px;}font{border:"+EES_ESsy+" 1px dashed;margin:0px 3px;}span{border:"+EES_ESsy+" 1px dotted;margin:0px 5px;}p{border:"+EES_ESsy+" 1px dashed;padding:3px;}img{border:"+EES_ESsy+" 2px dotted;padding:5px;margin:5px;}div{border:"+EES_ESsy+" 3px dashed;margin:5px;}table{border:"+EES_ESsy+" 2px dotted;margin:3px;}td{border-left:"+EES_ESsy+" 1px dashed;border-right:"+EES_ESsy+" 1px dashed;border-top:"+EES_ESsy+" 1px dotted;border-bottom:"+EES_ESsy+" 1px dashed;padding:8px;}";
with(EES_EDWindow){oCssRules=document.styleSheets[0].ownerNode || document.styleSheets[0];}
if(document.all){if(oCssRules.cssText==""){oCssRules.cssText=cssTxt;}else{oCssRules.cssText="";}}else{if(oCssRules.innerHTML==""){oCssRules.innerHTML=cssTxt;}else{oCssRules.innerHTML="";}}}
//--------精简版可删■■■↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//插入链接
function EES_InlinkX(){
EES_Inclose(""+EES_ESid+"EES_Inlinkcon");
if(document.getElementById(EES_ESid+'EES_Inlink').innerHTML==''){
var EES_Inlinkva='<div id="'+EES_ESid+'EES_Inlinkcon" class="EES_CSSconx" style="width:228px;">\
链接：<input id="'+EES_ESid+'EES_lkurl" style="width:168px;" value="http://">\
<p>属性：<select id="'+EES_ESid+'EES_lktarget"><option selected="selected">默认打开</option><option value="_self">当前页打开</option><option value="_blank">新页面打开</option><option value="_parent">父框架打开</option><option value="_top">最顶部打开</option></select></p>\
<p><button onClick="EES_InlinkDo();" type="button">确定插入</button>　<button onClick="EES_InlinkG();" type="button">关闭</button></p>\
</div>';
document.getElementById(''+EES_ESid+'EES_Inlink').innerHTML=EES_Inlinkva;
}else{
document.getElementById(''+EES_ESid+'EES_Inlinkcon').style.display='';
}
}
function EES_InlinkDo(){
var EES_Inlinkur=document.getElementById(''+EES_ESid+'EES_lkurl').value;
if(EES_Inlinkur!=""&&EES_Inlinkur!="http://"){
var EES_Inlinkot='';
EES_Inlinkot=EES_Inlinkot+'<a href="'+EES_Inlinkur+'"'
if(document.getElementById(''+EES_ESid+'EES_lktarget').value!=""){EES_Inlinkot=EES_Inlinkot+' target="'+document.getElementById(''+EES_ESid+'EES_lktarget').value+'"';}
EES_Inlinkot=EES_Inlinkot+'>'
EES_Sstyle(EES_Inlinkot,'</a>')
document.getElementById(''+EES_ESid+'EES_Inlink').innerHTML='';
}else{
alert('链接不能为空。');
}
}
function EES_InlinkG(){
document.getElementById(''+EES_ESid+'EES_Inlinkcon').style.display='none';
}
//查找替换
function EES_InreplaceX(){
EES_Inclose(""+EES_ESid+"EES_Inreplacecon");
if(document.getElementById(''+EES_ESid+'EES_Inreplace').innerHTML==''){
var EES_Inreplaceva='<div id="'+EES_ESid+'EES_Inreplacecon" class="EES_CSSconx" style="width:188px;">';
EES_Inreplaceva=EES_Inreplaceva+'查找字符：<input id="'+EES_ESid+'EES_rpstr" style="width:100px;" value="">\
<p>替换字符：<input id="'+EES_ESid+'EES_rpstrx" style="width:100px;" value=""><br><input type="checkbox" id="'+EES_ESid+'EES_rpstrq" value="1"> <label for='+EES_ESid+'EES_rpstrq>区分大小写</label></p>\
<p><button onClick="EES_InreplaceDo();" type="button">确定替换</button>　<button onClick="EES_InreplaceG();" type="button">关闭</button></p>\
</div>';
document.getElementById(''+EES_ESid+'EES_Inreplace').innerHTML=EES_Inreplaceva;
}else{
document.getElementById(''+EES_ESid+'EES_Inreplacecon').style.display='';
}
}
function EES_Erecode(s,a,b,i)
{a=a.replace("?","\\?");
if(i==null){
var r=new RegExp(a,"gi");
}else if(i) {
var r=new RegExp(a,"g");
}else{
var r=new RegExp(a,"gi");}
return s.replace(r,b);
}
function EES_InreplaceDo(){
var EES_Inreplaceur=document.getElementById(''+EES_ESid+'EES_rpstr').value;
if(EES_Inreplaceur!=""){
var EES_Inreplaceot=document.getElementById(''+EES_ESid+'EES_rpstrx').value;
var EES_InreplaceXstr=EES_EGetContent();
if(document.getElementById(''+EES_ESid+'EES_rpstrq').value='1'){EES_InreplaceXstr=EES_Erecode(EES_InreplaceXstr,EES_Inreplaceur,EES_Inreplaceot,true);}
else{EES_InreplaceXstr=EES_Erecode(EES_InreplaceXstr,EES_Inreplaceur,EES_Inreplaceot);};
EES_EDWindow.document.body.innerHTML=EES_InreplaceXstr;
document.getElementById(''+EES_ESid+'EES_Inreplace').innerHTML='';
}else{
alert('查找字符不能为空。');
}
}
function EES_InreplaceG(){
document.getElementById(''+EES_ESid+'EES_Inreplacecon').style.display='none';
}
//插入表情
function EES_InemotX(){
EES_Inclose(""+EES_ESid+"EES_Inemotcon");
var EESDir="http://x.780.pub/js/";
if(document.getElementById(''+EES_ESid+'EES_Inemot').innerHTML==''){
var EES_Inemotva='<div id="'+EES_ESid+'EES_Inemotcon" class="EES_CSSconx" style="width:288px;">';
for(i=1;i<97;i++){
EES_Inemotva=EES_Inemotva+'<img src='+EESDir+'qqbq/qq'+i+'.gif onclick="EES_Sinto(\'<img src='+EESDir+'qqbq/qq'+i+'.gif>\')">';
}
EES_Inemotva=EES_Inemotva+'<br><button onClick="EES_InemotG();" type="button">关闭</button>\
</div>';
document.getElementById(''+EES_ESid+'EES_Inemot').innerHTML=EES_Inemotva;
}else{
document.getElementById(''+EES_ESid+'EES_Inemotcon').style.display='';
}
}
function EES_InemotG(){
document.getElementById(''+EES_ESid+'EES_Inemotcon').style.display='none';
}
//插入表格
function EES_IntableX(){
EES_Inclose(""+EES_ESid+"EES_Intablecon");
if(document.getElementById(''+EES_ESid+'EES_Intable').innerHTML==''){
var EES_Intableva='<div id="'+EES_ESid+'EES_Intablecon" class="EES_CSSconx" style="width:288px;">\
表格行数：<input id="'+EES_ESid+'EES_tbhang" style="width:66px;" value="2">　表格列数：<input id="'+EES_ESid+'EES_tblie" style="width:66px;" value="2">\
<br>表格宽度：<input id="'+EES_ESid+'EES_tbwidth" style="width:66px;" value="100%">　表格边框：<input id="'+EES_ESid+'EES_tbborder" style="width:66px;" value="0">\
<br>单元边距：<input id="'+EES_ESid+'EES_tbcellpadding" style="width:66px;" value="5">　单元间距：<input id="'+EES_ESid+'EES_tbcellspacing" style="width:66px;" value="0">\
<br>背景颜色：<input id="'+EES_ESid+'EES_tbbgcolor" style="width:66px;" value="">　边框颜色：<input id="'+EES_ESid+'EES_tbbordercolor" style="width:66px;" value="">\
<br>表格位置：<select id="'+EES_ESid+'EES_tbalign" style="width:66px;"><option value="" selected="selected">默认</option><option value="center">居中</option><option value="left">左对齐</option><option value="right">右对齐</option></select>　表格样式：<select id="'+EES_ESid+'EES_tbstyle" style="width:66px;"><option value="" selected="selected">无样式</option><option value="border-collapse:separate;">分开边框</option><option value="border-collapse:collapse;">合并边框</option><option value="text-align:center;">文字居中</option><option value="border-style:dotted;">虚线边框</option></select>\
<br><button onClick="EES_IntableDo();" type="button">确定插入</button>　<button onClick="EES_IntableG();" type="button">关闭</button>\
</div>';
document.getElementById(''+EES_ESid+'EES_Intable').innerHTML=EES_Intableva;
}else{
document.getElementById(''+EES_ESid+'EES_Intablecon').style.display='';
}
}
function EES_IntableDo(){
var EES_Intablehang=parseInt(document.getElementById(''+EES_ESid+'EES_tbhang').value);
var EES_Intablelie=parseInt(document.getElementById(''+EES_ESid+'EES_tblie').value);
if(EES_Intablehang>0&&EES_Intablelie>0){
var EES_Intableot='<table';
if(document.getElementById(''+EES_ESid+'EES_tbwidth').value!=""){EES_Intableot=EES_Intableot+' width="'+document.getElementById(''+EES_ESid+'EES_tbwidth').value+'"';}
if(document.getElementById(''+EES_ESid+'EES_tbborder').value!=""){EES_Intableot=EES_Intableot+' border="'+document.getElementById(''+EES_ESid+'EES_tbborder').value+'"';}
if(document.getElementById(''+EES_ESid+'EES_tbcellpadding').value!=""){EES_Intableot=EES_Intableot+' cellpadding="'+document.getElementById(''+EES_ESid+'EES_tbcellpadding').value+'"';}
if(document.getElementById(''+EES_ESid+'EES_tbcellspacing').value!=""){EES_Intableot=EES_Intableot+' cellspacing="'+document.getElementById(''+EES_ESid+'EES_tbcellspacing').value+'"';}
if(document.getElementById(''+EES_ESid+'EES_tbbgcolor').value!=""){EES_Intableot=EES_Intableot+' bgcolor="'+document.getElementById(''+EES_ESid+'EES_tbbgcolor').value+'"';}
if(document.getElementById(''+EES_ESid+'EES_tbbordercolor').value!=""){EES_Intableot=EES_Intableot+' bordercolor="'+document.getElementById(''+EES_ESid+'EES_tbbordercolor').value+'"';}
if(document.getElementById(''+EES_ESid+'EES_tbalign').value!=""){EES_Intableot=EES_Intableot+' align="'+document.getElementById(''+EES_ESid+'EES_tbalign').value+'"';}
if(document.getElementById(''+EES_ESid+'EES_tbstyle').value!=""){EES_Intableot=EES_Intableot+' style="'+document.getElementById(''+EES_ESid+'EES_tbstyle').value+'"';}
EES_Intableot=EES_Intableot+'><tbody>';
for(EES_Intablei=0;EES_Intablei<EES_Intablehang;EES_Intablei++)
{EES_Intableot=EES_Intableot+'<tr>';
for(EES_Intablej=0;EES_Intablej<EES_Intablelie;EES_Intablej++){EES_Intableot=EES_Intableot+'<td></td>';}
EES_Intableot=EES_Intableot+'</tr>';}
EES_Intableot=EES_Intableot+'</tbody></table>';
EES_Sinto(EES_Intableot);
document.getElementById(''+EES_ESid+'EES_Intable').innerHTML='';
}else{
alert('行、列必须大于0。');
}
}
function EES_IntableG(){
document.getElementById(''+EES_ESid+'EES_Intablecon').style.display='none';
}
//插入媒体
function EES_InfileX(){
EES_Inclose(""+EES_ESid+"EES_Infilecon");
if(document.getElementById(''+EES_ESid+'EES_Infile').innerHTML==''){
var EES_Infileva='<div id="'+EES_ESid+'EES_Infilecon" class="EES_CSSconx">';
EES_Infileva=EES_Infileva+'媒体地址：<br><input id="'+EES_ESid+'EES_Infilefile" style="width:220px;" value="http://">\
<p>媒体尺寸：<br>宽 <input id="'+EES_ESid+'EES_Infilewidth" style="width:58px;" value=""> px　高 <input id="'+EES_ESid+'EES_Infileheight" style="width:58px;" value=""> px</p>\
<p><button onClick="EES_InfileDo();" type="button">确定插入</button> <button onClick="EES_InfileG();" type="button">关闭</button></p>\
</div>';
document.getElementById(''+EES_ESid+'EES_Infile').innerHTML=EES_Infileva;
}else{
document.getElementById(''+EES_ESid+'EES_Infilecon').style.display='';
}
}
function EES_InfileDo(){
var EES_Infileur=document.getElementById(''+EES_ESid+'EES_Infilefile').value;
if(EES_Infileur!=""&&EES_Infileur!="http://"){
var EES_Infileot='';
var EES_Infilewh='';
var EES_Infilehz='';
var EES_Infilewd=document.getElementById(''+EES_ESid+'EES_Infilewidth').value;
var EES_Infileht=document.getElementById(''+EES_ESid+'EES_Infileheight').value;
if(EES_Infilewd!=''){EES_Infilewh=EES_Infilewh+' width="'+EES_Infilewd+'"';}
if(EES_Infileht!=''){EES_Infilewh=EES_Infilewh+' height="'+EES_Infileht+'"';}
EES_Infilehz=EES_Infileur.substring(EES_Infileur.length-3).toLowerCase();
switch(EES_Infilehz){case "gif":case "jpg":case "epg":case "pic":case "png":case "bmp":
EES_Infileot='<img src="'+EES_Infileur+'"'+EES_Infilewh+'>'
break;
case "mp3":case "wma":
EES_Infileot='<audio controls="controls"'+EES_Infilewh+'>\
<source src="'+EES_Infileur+'">\
<embed src="'+EES_Infileur+'"'+EES_Infilewh+'>\
</audio>';
break;
case "avi":case "wmv":case "asf":case "mpg":case "peg":case "mp4":case "3gp":case "ogg":
EES_Infileot='<video src="'+EES_Infileur+'" controls="controls"'+EES_Infilewh+'>\
<a href="'+EES_Infileur+'">阿赛提示：您的浏览器不支持 '+EES_Infilehz+' 格式播放，点击下载到本地。</a>\
</video>';
break;
//case ".rm":case ".ra":case "ram":case "mvb":
//
//break;
case "swf":case "flv":
EES_Infileot='<embed src="'+EES_Infileur+'" allowFullScreen="true" quality="high"'+EES_Infilewh+' align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>'
break;
default:
EES_Infileot='<a target="_blank" title="点击查看" href="'+EES_Infileur+'">'+EES_Infileur+'</a>';
}
EES_Sinto(EES_Infileot);
document.getElementById(''+EES_ESid+'EES_Infile').innerHTML='';
}else{
alert('无媒体资源可插入，请确认表单填写完整。');
}
}
function EES_InfileG(){
document.getElementById(''+EES_ESid+'EES_Infilecon').style.display='none';
}
function EES_Inclose(ifty){
if(ifty!=''+EES_ESid+'EES_Inemotcon'&&document.getElementById(''+EES_ESid+'EES_Inemotcon')){document.getElementById(''+EES_ESid+'EES_Inemotcon').style.display='none';}
if(ifty!=''+EES_ESid+'EES_Intablecon'&&document.getElementById(''+EES_ESid+'EES_Intablecon')){document.getElementById(''+EES_ESid+'EES_Intablecon').style.display='none';}
if(ifty!=''+EES_ESid+'EES_Infilecon'&&document.getElementById(''+EES_ESid+'EES_Infilecon')){document.getElementById(''+EES_ESid+'EES_Infilecon').style.display='none';}
if(ifty!=''+EES_ESid+'EES_Inlinkcon'&&document.getElementById(''+EES_ESid+'EES_Inlinkcon')){document.getElementById(''+EES_ESid+'EES_Inlinkcon').style.display='none';}
if(ifty!=''+EES_ESid+'EES_Inreplacecon'&&document.getElementById(''+EES_ESid+'EES_Inreplacecon')){document.getElementById(''+EES_ESid+'EES_Inreplacecon').style.display='none';}
if(ifty!=''+EES_ESid+'EES_Inaboutcon'&&document.getElementById(''+EES_ESid+'EES_Inaboutcon')){document.getElementById(''+EES_ESid+'EES_Inaboutcon').style.display='none';}
if(ifty!=''+EES_ESid+'EES_Inreplacecon'&&document.getElementById(''+EES_ESid+'EES_Inreplacecon')){document.getElementById(''+EES_ESid+'EES_Inreplacecon').style.display='none';}
}
//--------精简版可删■■■↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑