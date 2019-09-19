var EM_ESlen,EM_ESpop,EM_ESid,EM_ESan,EM_ESsm,EM_ESse,EM_ESsy,EM_ESqy,EM_ESby,EM_ESfs;
var EM_Vrwid,EM_Vrhei,EM_Vrheit,EM_Vrheic,EM_Kiframe,EM_Ktextarea,EM_ESys,EM_EScss,EM_ESbar;
var EM_Edialog,EM_EDWindow,EM_EDDiv,EM_EDValue,EM_EDMode=1;
var EM_EDCurGEditor,EM_EDCurRange,EM_SfullscreenMode=0;
/* ---------------------------- 编辑器区域生成和取值信息（如果一个页面需要调用多个编辑器，可以拷贝该文件，替换EM_为其他X_，并更改下面的AsaiEdit过程名即可同规则调用，如：AsaiEditMini） ---------------------------- */
//定义并生成编辑器区域
function AsaiEditMini(InitValue){
EM_Vrwid="666px";
EM_Vrhei=280;
if(arguments[3]){EM_Vrwid=arguments[3];EM_Vrwid=(EM_Vrwid.toString().indexOf("%")==-1? parseInt(EM_Vrwid)+"px":EM_Vrwid);}
if(arguments[4]){EM_Vrhei=parseInt(arguments[4]);EM_Vrheit=28;EM_Vrheic=(EM_Vrhei-EM_Vrheit-1)+"px";EM_Vrhei+="px";EM_Vrheit+="px";}
EM_ESan=arguments[1];
EM_ESlen=arguments[2];
EM_ESpop=arguments[5];
EM_ESid=arguments[6];
EM_ESsm=arguments[7];
EM_ESse=arguments[8];
EM_ESsy=arguments[9];
EM_ESqy=arguments[10];
EM_ESby=arguments[11];
EM_ESfs=arguments[12];
EM_ESys="#000000,#330000,#660000,#990000,#CC0000,#FF0000,#000033,#330033,#660033,#990033,#CC0033,#FF0033,#000066,#330066,#660066,#990066,#CC0066,#FF0066,|,#003300,#333300,#663300,#993300,#CC3300,#FF3300,#003333,#333333,#663333,#993333,#CC3333,#FF3333,#003366,#333366,#663366,#993366,#CC3366,#FF3366,|,#006600,#336600,#666600,#996600,#CC6600,#FF6600,#006633,#336633,#666633,#996633,#CC6633,#FF6633,#006666,#336666,#666666,#996666,#CC6666,#FF6666,|,#009900,#339900,#669900,#999900,#CC9900,#FF9900,#009933,#339933,#669933,#999933,#CC9933,#FF9933,#009966,#339966,#669966,#999966,#CC9966,#FF9966,|,#00CC00,#33CC00,#66CC00,#99CC00,#CCCC00,#FFCC00,#00CC33,#33CC33,#66CC33,#99CC33,#CCCC33,#FFCC33,#00CC66,#33CC66,#66CC66,#99CC66,#CCCC66,#FFCC66,|,#00FF00,#33FF00,#66FF00,#99FF00,#CCFF00,#FFFF00,#00FF33,#33FF33,#66FF33,#99FF33,#CCFF33,#FFFF33,#00FF66,#33FF66,#66FF66,#99FF66,#CCFF66,#FFFF66,|,#000099,#330099,#660099,#990099,#CC0099,#FF0099,#0000CC,#3300CC,#6600CC,#9900CC,#CC00CC,#FF00CC,#0000FF,#3300FF,#6600FF,#9900FF,#CC00FF,#FF00FF,|,#003399,#333399,#663399,#993399,#CC3399,#FF3399,#0033CC,#3333CC,#6633CC,#9933CC,#CC33CC,#FF33CC,#0033FF,#3333FF,#6633FF,#9933FF,#CC33FF,#FF33FF,|,#006699,#336699,#666699,#996699,#CC6699,#FF6699,#0066CC,#3366CC,#6666CC,#9966CC,#CC66CC,#FF66CC,#0066FF,#3366FF,#6666FF,#9966FF,#CC66FF,#FF66FF,|,#009999,#339999,#669999,#999999,#CC9999,#FF9999,#0099CC,#3399CC,#6699CC,#9999CC,#CC99CC,#FF99CC,#0099FF,#3399FF,#6699FF,#9999FF,#CC99FF,#FF99FF,|,#00CC99,#33CC99,#66CC99,#99CC99,#CCCC99,#FFCC99,#00CCCC,#33CCCC,#66CCCC,#99CCCC,#CCCCCC,#FFCCCC,#00CCFF,#33CCFF,#66CCFF,#99CCFF,#CCCCFF,#FFCCFF,|,#00FF99,#33FF99,#66FF99,#99FF99,#CCFF99,#FFFF99,#00FFCC,#33FFCC,#66FFCC,#99FFCC,#CCFFCC,#FFFFCC,#00FFFF,#33FFFF,#66FFFF,#99FFFF,#CCFFFF,#FFFFFF";
var EM_ESysarr=EM_ESys.split(",");
var EM_ESysarrlen=EM_ESysarr.length;
var EM_ESysx="<div class=EM_CSSay>";
var EM_ESysxb="<div class=EM_CSSay>";
for(var i=0;i<EM_ESysarrlen;i++){
if (EM_ESysarr[i]=="|")
{EM_ESysx=EM_ESysx+"<br>";EM_ESysxb=EM_ESysxb+"<br>";
}else{
EM_ESysx=EM_ESysx+"<a class=EM_CSSays style=background-color:"+EM_ESysarr[i]+" onclick=\"EM_Sstyle('<span StylE=color:"+EM_ESysarr[i]+">','</span>')\" TItle="+EM_ESysarr[i]+">　</a>";
EM_ESysxb=EM_ESysxb+"<a class=EM_CSSays style=background-color:"+EM_ESysarr[i]+" onclick=\"EM_Sstyle('<span StylE=background-color:"+EM_ESysarr[i]+">','</span>')\" TItle="+EM_ESysarr[i]+">　</a>";
}}
EM_ESysx=EM_ESysx+"</div>";
EM_ESysxb=EM_ESysxb+"</div>";
var EM_Ischar;
EM_Ischar="<style>#"+EM_ESid+"EM_Isdiv{width:120px;height:120px;overflow:auto;}#"+EM_ESid+"EM_Isdiv li{padding:0px;margin:0px;list-style:none;width:12px;line-height:14px;font-size:12px;float:left;text-align:center;cursor:pointer;}#"+EM_ESid+"EM_Isdvw{font-size:52px;text-align:center;width:120px;height:68px;line-height:68px;text-align:center;border-bottom:"+EM_ESsy+" 2px solid;background-color:"+EM_ESby+";}.EM_Iscdn{text-align:center;}.EM_Iscds{background-color:"+EM_ESby+";color:"+EM_ESsy+";text-align:center;}</style>"
EM_Ischar=EM_Ischar+"<div id="+EM_ESid+"EM_Isdvw>演示</div><div id="+EM_ESid+"EM_Isdiv>";
var aChars=["＃","＠","＆","＊","※","§","〃","№","〓","○","●","△","▲","◎","☆","★","◇","◆","▽","▼","□","■","▁","▂","▃","▄","▅","▆","▇","█","▉","▊","▋","▌","▍","▎","▏","▓","㊣","℅","ˉ","￣","＿","﹉","﹊","﹍","﹎","﹋","﹌","﹟","﹠","﹡","♀","♂","⊕","⊙","↑","↓","←","→","↖","↗","↙","↘","∥","∣","／","＼","∕","﹨","&#65533;","&yen;","&pound;","&#8482;","&reg;","&copy;","、","。","．","；","：","？","！","︰","…","‥","′","‵","々","～","‖","ˇ","ˉ","﹐","﹑","﹒","·","﹔","﹕","﹖","﹗","｜","-","︱","-","︳","︴","﹏","（","）","︵","︶","｛","｝","︷","︸","〔","〕","︹","︺","【","】","︻","︼","《","》","︽","︾","〈","〉","︿","﹀","「","」","﹁","﹂","『","』","﹃","﹄","﹙","﹚","﹛","﹜","﹝","﹞","≈","≡","≠","＝","≤","≥","＜","＞","≮","≯","∷","±","＋","－","×","÷","／","∫","∮","∝","∞","∧","∨","∑","∏","∪","∩","∈","∵","∴","⊥","∥","∠","⌒","⊙","≌","∽","√","≦","≧","≒","≡","﹢","﹣","﹤","﹥","﹦","～","∟","⊿","㏒","㏑","°","′","″","＄","￥","〒","￠","￡","％","＠","℃","℉","﹩","﹪","‰","﹫","㏕","㎜","㎝","㎞","㏎","㎡","㎎","㎏","㏄","°","○","¤","ⅰ","ⅱ","ⅲ","ⅳ","ⅴ","ⅵ","ⅶ","ⅷ","ⅸ","ⅹ","Ⅰ","Ⅱ","Ⅲ","Ⅳ","Ⅴ","Ⅵ","Ⅶ","Ⅷ","Ⅸ","Ⅹ","Ⅺ","Ⅻ","⒈","⒉","⒊","⒋","⒌","⒍","⒎","⒏","⒐","⒑","⒒","⒓","⒔","⒕","⒖","⒗","⒘","⒙","⒚","⒛","⑴","⑵","⑶","⑷","⑸","⑹","⑺","⑻","⑼","⑽","⑾","⑿","⒀","⒁","⒂","⒃","⒄","⒅","⒆","⒇","①","②","③","④","⑤","⑥","⑦","⑧","⑨","⑩","㈠","㈡","㈢","㈣","㈤","㈥","㈦","㈧","㈨","㈩","&euro;","&lsquo;","&rsquo;","&ldquo;","&rdquo;","&ndash;","&mdash;","&iexcl;","&cent;","&pound;","&curren;","&yen;","&brvbar;","&sect;","&uml;","&copy;","&ordf;","&laquo;","&not;","&reg;","&macr;","&deg;","&plusmn;","&sup2;","&sup3;","&acute;","&micro;","&para;","&middot;","&cedil;","&sup1;","&ordm;","&raquo;","&frac14;","&frac12;","&frac34;","&iquest;","&Agrave;","&Aacute;","&Acirc;","&Atilde;","&Auml;","&Aring;","&AElig;","&Ccedil;","&Egrave;","&Eacute;","&Ecirc;","&Euml;","&Igrave;","&Iacute;","&Icirc;","&Iuml;","&ETH;","&Ntilde;","&Ograve;","&Oacute;","&Ocirc;","&Otilde;","&Ouml;","&times;","&Oslash;","&Ugrave;","&Uacute;","&Ucirc;","&Uuml;","&Yacute;","&THORN;","&szlig;","&agrave;","&aacute;","&acirc;","&atilde;","&auml;","&aring;","&aelig;","&ccedil;","&egrave;","&eacute;","&ecirc;","&euml;","&igrave;","&iacute;","&icirc;","&iuml;","&eth;","&ntilde;","&ograve;","&oacute;","&ocirc;","&otilde;","&ouml;","&divide;","&oslash;","&ugrave;","&uacute;","&ucirc;","&uuml;","&uuml;","&yacute;","&thorn;","&yuml;","０","１","２","３","４","５","６","７","８","９","：","；","＜","＝","＞","？","＠","Ａ","Ｂ","Ｃ","Ｄ","Ｅ","Ｆ","Ｇ","Ｈ","Ｉ","Ｊ","Ｋ","Ｌ","Ｍ","Ｎ","Ｏ","Ｐ","Ｑ","Ｒ","Ｓ","Ｔ","Ｕ","Ｖ","Ｗ","Ｘ","Ｙ","Ｚ","Б","Г","Д","Ж","З","И","Й","Σ","Υ","Φ","Ψ","Ω","＾","＿","｀","ā","á","ǎ","à","ō","ó","ǒ","ò","ē","é","ě","è","ê","ū","ú","ǔ","ù","ü","ǖ","ǘ","ǚ","ǜ","ī","í","ǐ","ì","零","壹","贰","叁","肆","伍","陆","柒","捌","玖","拾"];
for(i=0;i<aChars.length;i++){
EM_Ischar=EM_Ischar+'<li class="EM_Iscdn" onclick="EM_Sinto(\'' + aChars[i].replace(/&/g, "&amp;") + '\')" onmouseover="'+EM_ESid+'EM_Isdvw.innerHTML=this.innerHTML;this.className=\'EM_Iscds\';" onmouseout="this.className=\'EM_Iscdn\';">';
EM_Ischar=EM_Ischar+aChars[i];
EM_Ischar=EM_Ischar+'</li>';
}
EM_Ischar=EM_Ischar+'<div class=EM_CSScr></div></div>';
var EM_ESabout="架构与设计制作：阿赛\
<br>◇ 常用快捷键：Ctrl+C(拷贝)，Ctrl+X(剪切)，Ctrl+V(粘贴)；\
<br>◇ 快捷键：Ctrl+A(全选)，Ctrl+Z(撤销)，Ctrl+Y(重做)；\
<br>◇ 上传或插入文件自动识别任何格式；\
<br>◇ 右下角含向下三角形的图标是可以打开右弹下拉菜单的；\
<br>◇ 左下角含向下三角形的图标可以左弹下拉菜单；\
<br>◇ 编辑器内容预读需过滤，如ASP[html=server.HTMLEncode(html)]；\
<br>◇ 整套编辑器系统为原创JS架构，有问题找阿赛。";
EM_EScss="<style>\
#"+EM_ESid+"{background-color:transparent;position:relative;}#"+EM_ESid+" ul,#"+EM_ESid+" li,#"+EM_ESid+" div{float;none;margin:0;}\
.EM_CSSk{width:"+EM_Vrwid+";height="+EM_Vrhei+"px;margin:0px;padding:0px;}\
.EM_CSSbar{background-color:transparent;}\
.EM_CSSbar ul,.EM_CSSbar li{margin:0px;padding:0px;}\
.EM_CSSstr{background-color:transparent;float:left;position:relative;cursor:pointer;font-size:12px;color:"+EM_ESsy+";}\
.EM_CSSstr span{-moz-border-radius:8px;-webkit-border-radius:8px;border-radius:8px;display:block;margin-top:2px;padding:0px 3px;border:1px solid "+EM_ESsy+";height:14px;line-height:14px;overflow:hidden;}\
.EM_CSSicok{background-color:transparent;width:20px;height:20px;float:left;position:relative;background-image:url("+EM_ESsm+EM_ESse+"AsaiEdit_Tool.png);cursor:pointer;text-align:center;line-height:20px;background-position:-760px;font-size:12px;color:"+EM_ESsy+";}\
.EM_CSSico{background-color:transparent;width:20px;height:20px;float:left;position:relative;background-image:url("+EM_ESsm+EM_ESse+"AsaiEdit_Tool.png);cursor:pointer;}\
.EM_CSSicox{background-color:transparent;width:20px;height:20px;float:left;position:relative;background-image:url("+EM_ESsm+EM_ESse+"AsaiEdit_Tool.png);cursor:pointer;}\
.EM_CSSconx{position:absolute;z-index:200;word-wrap:break-word;padding:10px;top:20px;right:0px;font-size:12px;border-top:1px solid "+EM_ESsy+";border-right:3px solid "+EM_ESsy+";border-bottom:1px solid "+EM_ESsy+";border-left:1px solid "+EM_ESsy+";background:"+EM_ESqy+";text-align:left;}.EM_CSSconx label{display:inline;position:static;}\
.EM_CSScon{position:absolute;z-index:200;word-wrap:break-word;padding:10px;top:20px;font-size:12px;border-top:1px solid "+EM_ESsy+";border-right:1px solid "+EM_ESsy+";border-bottom:1px solid "+EM_ESsy+";border-left:3px solid "+EM_ESsy+";background:"+EM_ESqy+";display:none;text-align:left;}\
.EM_CSSa,a.EM_CSSa,a.EM_CSSa:link,a.EM_CSSa:active,a.EM_CSSa:visited{cursor:pointer;text-decoration:none;word-wrap:break-word;margin-right:3px;color:"+EM_ESsy+";}\
a.EM_CSSa:hover{background:"+EM_ESby+";}\
.EM_CSSay{width:218px;}.EM_CSSays,a.EM_CSSays,a.EM_CSSays:link,a.EM_CSSays:active,a.EM_CSSays:visited{font-size:12px;cursor:pointer;text-decoration:none;}\
a.EM_CSSays:hover{}\
.EM_CSSico:hover,.EM_CSSicok:hover,.EM_CSSicox:hover{background-color:"+EM_ESqy+";}\
.EM_CSSico:hover .EM_CSScon,.EM_CSSicok:hover .EM_CSScon{display:block;}\
.EM_CSScr{clear:both;}\
</style>"
EM_ESbar="<div class=\"EM_CSSbar\"><ul>\
<div class=\"EM_CSSico\" title=\"样式\"><div class=\"EM_CSScon\" style=\"width:188px;\">\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<h1>','</h1>')\" title=\"标题一\">标题一</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<h2>','</h2>')\" title=\"标题二\">标题二</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<h3>','</h3>')\" title=\"标题三\">标题三</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<h4>','</h4>')\" title=\"标题四\">标题四</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<h5>','</h5>')\" title=\"标题五\">标题五</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<h6>','</h6>')\" title=\"标题六\">标题六</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<h7>','</h7>')\" title=\"标题七\">标题七</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=display:block;margin:10px;border-color:#DDDD88;border-width:1px;border-style:solid;padding:5px;background:#FFFFDD;color:#666600;font-size:12px;><b>代码：</b><br><br>','</span>')\" title=\"代码\"><span StylE=border-color:#DDDD88;border-width:1px;border-style:solid;background:#FFFFDD;color:#666600;>代码</span></a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=display:block;margin:10px;border-color:#D8D8D8;border-width:1px;border-style:solid;padding:5px;background-color:#F5F5F5;color:#666666;font-size:12px;><b>引用：</b><br><br>','</span>')\" title=\"引用\"><span StylE=border-color:#D8D8D8;border-width:1px;border-style:solid;background-color:#F5F5F5;color:#666666;>引用</span></a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=background-color:#EEE;color:#DDD;>','</span>')\" title=\"淡化\"><span StylE=background-color:#EEE;color:#DDD;>淡化</span></a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=background-color:#DDD;color:#DDD;>','</span>')\" title=\"隐藏\"><span StylE=background-color:#DDD;color:#DDD;>隐藏</span></a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=background-color:#FFFF00;color:#FF0000;>','</span>')\" title=\"标记\"><span StylE=background-color:#FFFF00;color:#FF0000;>标记</span></a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=background-color:#FF0000;color:#FFFF00;>','</span>')\" title=\"突出\"><span StylE=background-color:#FF0000;color:#FFFF00;>突出</span></a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<strike>','</strike>')\" title=\"删线\"><strike>删线</strike></a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<sup>','</sup>')\" title=\"上标\">上标</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<sub>','</sub>')\" title=\"下标\">下标</a>\
</div></div>\
<div class=\"EM_CSSico\" style=\"background-position:-20px\" title=\"字体\"><div class=\"EM_CSScon\" style=\"width:288px;\">\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'仿宋')\" title=\"仿宋\" style=\"font-family:仿宋\">仿宋</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'黑体')\" title=\"黑体\" style=\"font-family:黑体\">黑体</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'楷体')\" title=\"楷体\" style=\"font-family:楷体\">楷体</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'宋体')\" title=\"宋体\" style=\"font-family:宋体\">宋体</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'微软雅黑')\" title=\"微软雅黑\" style=\"font-family:微软雅黑\">微软雅黑</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'新宋体')\" title=\"新宋体\" style=\"font-family:新宋体\">新宋体</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Times New Roman')\" title=\"Times New Roman\" style=\"font-family:Times New Roman\">Times New Roman</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Courier New')\" title=\"Courier New\" style=\"font-family:Courier New\">Courier New</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Trebuchet MS')\" title=\"Trebuchet MS\" style=\"font-family:Trebuchet MS\">Trebuchet MS</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Arial Black')\" title=\"Arial Black\" style=\"font-family:Arial Black\">Arial Black</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Times New Roman')\" title=\"Times New Roman\" style=\"font-family:Times New Roman\">Times New Roman</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Palatino Linotype')\" title=\"Palatino Linotype\" style=\"font-family:Palatino Linotype\">Palatino Linotype</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Book Antiqua')\" title=\"Book Antiqua\" style=\"font-family:Book Antiqua\">Book Antiqua</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Lucida Sans Unicode')\" title=\"Lucida Sans Unicode\" style=\"font-family:Lucida Sans Unicode\">Lucida Sans Unicode</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Lucida Grande')\" title=\"Lucida Grande\" style=\"font-family:Lucida Grande\">Lucida Grande</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'MS Serif')\" title=\"MS Serif\" style=\"font-family:MS Serif\">MS Serif</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'New York')\" title=\"New York\" style=\"font-family:New York\">New York</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Lucida Console')\" title=\"Lucida Console\" style=\"font-family:Lucida Console\">Lucida Console</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(1,'Comic Sans MS')\" title=\"Comic Sans MS\" style=\"font-family:Comic Sans MS\">Comic Sans MS</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Verdana')\" title=\"Verdana\" style=\"font-family:Verdana\">Verdana</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Geneva')\" title=\"Geneva\" style=\"font-family:Geneva\">Geneva</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'sans-serif')\" title=\"sans-serif\" style=\"font-family:sans-serif\">sans-serif</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Georgia')\" title=\"Georgia\" style=\"font-family:Georgia\">Georgia</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Times')\" title=\"Times\" style=\"font-family:Times\">Times</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'serif')\" title=\"serif\" style=\"font-family:serif\">serif</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Courier')\" title=\"Courier\" style=\"font-family:Courier\">Courier</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'monospace')\" title=\"monospace\" style=\"font-family:monospace\">monospace</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Arial')\" title=\"Arial\" style=\"font-family:Arial\">Arial</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Helvetica')\" title=\"Helvetica\" style=\"font-family:Helvetica\">Helvetica</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Tahoma')\" title=\"Tahoma\" style=\"font-family:Tahoma\">Tahoma</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Helvetica')\" title=\"Helvetica\" style=\"font-family:Helvetica\">Helvetica</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Gadget')\" title=\"Gadget\" style=\"font-family:Gadget\">Gadget</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Palatino')\" title=\"Palatino\" style=\"font-family:Palatino\">Palatino</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'Monaco')\" title=\"Monaco\" style=\"font-family:Monaco\">Monaco</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sziti(0,'cursive')\" title=\"cursive\" style=\"font-family:cursive\">cursive</a>\
</div></div>\
<div class=\"EM_CSSico\" style=\"background-position:-40px\" title=\"字号\"><div class=\"EM_CSScon\" style=\"width:288px;\">\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:5px>','</span>')\" title=\"[微号]\" style=\"font-size:12px\">[微号]</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:3px>','</span>')\" title=\"[小微]\" style=\"font-size:12px\">[小微]</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:1px>','</span>')\" title=\"[超微]\" style=\"font-size:12px\">[超微]</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:6.7px>','</span>')\" title=\"八号\" style=\"font-size:6.7px\">八号</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:7.3px>','</span>')\" title=\"七号\" style=\"font-size:7.3px\">七号</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:10px>','</span>')\" title=\"六号\" style=\"font-size:10px\">六号</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:8.7px>','</span>')\" title=\"小六\" style=\"font-size:8.7px\">小六</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:12px>','</span>')\" title=\"小五\" style=\"font-size:12px\">小五</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:14px>','</span>')\" title=\"五号\" style=\"font-size:14px\">五号</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:16px>','</span>')\" title=\"小四\" style=\"font-size:16px\">小四</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:18.7px>','</span>')\" title=\"四号\" style=\"font-size:18.7px\">四号</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:20px>','</span>')\" title=\"小三\" style=\"font-size:20px\">小三</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:21.3px>','</span>')\" title=\"三号\" style=\"font-size:21.3px\">三号</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:24px>','</span>')\" title=\"小二\" style=\"font-size:24px\">小二</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:29.3px>','</span>')\" title=\"二号\" style=\"font-size:29.3px\">二号</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:32px>','</span>')\" title=\"小一\" style=\"font-size:32px\">小一</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:34.7px>','</span>')\" title=\"一号\" style=\"font-size:34.7px\">一号</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:48px>','</span>')\" title=\"小初\" style=\"font-size:48px\">小初</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:56px>','</span>')\" title=\"初号\" style=\"font-size:56px\">初号</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:71.7px>','</span>')\" title=\"[特号]\" style=\"font-size:12px\">[特号]</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:83.7px>','</span>')\" title=\"[大特]\" style=\"font-size:12px\">[大特]</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sstyle('<span StylE=font-size:95.6px>','</span>')\" title=\"[超大]\" style=\"font-size:12px\">[超大]</a>\
</div></div>\
<div class=\"EM_CSSico\" style=\"background-position:-60px\" title=\"字体颜色\"><div class=\"EM_CSScon\">"+EM_ESysx+"</div></div>\
<div class=\"EM_CSSico\" style=\"background-position:-80px\" title=\"背景颜色\"><div class=\"EM_CSScon\">"+EM_ESysxb+"</div></div>\
<div class=\"EM_CSSico\" style=\"background-position:-380px\" title=\"插入自定义\"><div class=\"EM_CSScon\" style=\"width:108px;\">\
<a class=\"EM_CSSa\" onClick=\"EM_Sinto('0')\" title=\"分页标志\">分页标志</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sinto('[eeSai]')\" title=\"秘密标志\">秘密标志</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sinto('1')\" title=\"版权文字\">版权文字</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sinto('2')\" title=\"当前时间\">当前时间</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sinto('<span style=font-weight:bold;font-size:58px;line-height:200%;color:#FF0000;>红头文件标题</span>')\" title=\"红头标题\">红头标题</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sinto('<span style=display:block;background-color:#F00;height:5px;></span>')\" title=\"红头线条\">红头线条</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sinto('<hr>')\" title=\"一条横线\">一条横线</a>\
<a class=\"EM_CSSa\" onClick=\"EM_Sinto(document.URL)\" title=\"插入当前链接\">当前链接</a>\
</div></div>\
<div class=\"EM_CSSico\" style=\"background-position:-400px\" title=\"插入特殊字符\"><div class=\"EM_CSScon\">"+EM_Ischar+"</div></div>\
<div class=\"EM_CSSico\" style=\"background-position:-100px\" title=\"加粗\" onClick=\"EM_Sformat('Bold')\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-120px\" title=\"斜体\" onClick=\"EM_Sformat('Italic')\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-140px\" title=\"下划线\" onClick=\"EM_Sformat('Underline')\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-160px\" title=\"将选中的对象左对齐\" onClick=\"EM_Sstyle('<p style=text-align:left;display:block;>','</p>')\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-180px\" title=\"将选中的对象居中对齐\" onClick=\"EM_Sstyle('<p style=text-align:center;display:block;>','</p>')\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-200px\" title=\"将选中的对象右对齐\" onClick=\"EM_Sstyle('<p style=text-align:right;display:block;>','</p>')\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-220px\" title=\"编号列表\" onClick=\"EM_Sformat('insertorderedlist')\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-240px\" title=\"项目列表\" onClick=\"EM_Sformat('insertunorderedlist')\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-300px\" title=\"清除HTML格式(纯文本)\" onClick=\"EM_Shtml()\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-320px\" title=\"清除Word格式\" onClick=\"EM_Sword()\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-340px\" title=\"自动排版(保留表格、图片、链接、换行，压缩空行，段首加空格。)\" onClick=\"EM_Sauto()\"></div>";
EM_ESbar=EM_ESbar+"<div class=\"EM_CSSico\" style=\"background-position:-360px\" title=\"参考线\" onClick=\"EM_Seborder()\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-480px\" title=\"关于编辑器\"><div class=\"EM_CSScon\" style=\"right:0px;width:388px;\">"+EM_ESabout+"</div></div>\
<div class=\"EM_CSSico\" style=\"background-position:-500px\" title=\"HTML代码\" onClick=\"EM_Scodearea()\"></div>\
<div class=\"EM_CSSico\" style=\"background-position:-540px\" title=\"全屏编辑\" onClick=\"EM_Sfullscreen()\"></div>\
<div class=\"EM_CSSicok\" title=\"恢复操作选择\" onClick=\"EM_ESave()\">⊙<div class=\"EM_CSScon\" style=\"right:0px;width:188px;\">\
<a class=\"EM_CSSa\" onClick=\"EM_ERec('0')\">恢复定时缓存<span id=\"EM_Ezsv0\"></span></a>\
<a class=\"EM_CSSa\" onClick=\"EM_ERec('1')\">恢复手动缓存<span id=\"EM_Ezsv1\"></span></a>\
<a class=\"EM_CSSa\" onClick=\"EM_ERec('2')\">恢复上次缓存<span id=\"EM_Ezsv2\"></span></a>\
</div></div>\
<div class=\"EM_CSSicok\" title=\"定时保存：单击立即保存。\" id=\"EM_Ezsv\" onClick=\"EM_ESave()\"></div>\
<div class=\"EM_CSSstr\" title=\"编辑器内容字数统计\" id=\"EM_Eztj\"></div>\
<div class=\"EM_CSScr\"></div>\
</div>";
if(document.getElementById(EM_ESan)){
InitValue=document.getElementById(EM_ESan).value;InitValue=EM_Ehtmsi(InitValue)
}
document.write(EM_EScss+"<div id='"+EM_ESid+"' class='EM_CSSk'>阿赛HTML在线编辑器[AsaiEdit]</div>");
EM_EDDiv=document.getElementById(EM_ESid);
EM_EDDiv.innerHTML=EM_ESbar;
EM_Ktextarea=document.createElement("textarea");
EM_Ktextarea.style.display="none";
EM_Ktextarea.style.width=EM_Vrwid;
EM_Ktextarea.style.height=EM_Vrheic;
EM_Ktextarea.style.fontSize="12px";
EM_Ktextarea.style.color=""+EM_ESsy+"";
EM_Ktextarea.style.background=""+EM_ESqy+"";
EM_Ktextarea.style.border="0px";
EM_EDDiv.appendChild(EM_Ktextarea);
EM_Kiframe=document.createElement("iframe");
EM_Kiframe.name=EM_Kiframe.id="EM_Efrm";
EM_Kiframe.style.width=EM_Vrwid;
EM_Kiframe.style.height=EM_Vrheic;
EM_Kiframe.style.background="transparent";
EM_Kiframe.frameBorder=0;
EM_Kiframe.marginHeight=0;
EM_Kiframe.marginWidth=0;
EM_Kiframe.src="about:blank";
EM_EDDiv.appendChild(EM_Kiframe);
EM_EDWindow=EM_Kiframe.contentWindow;
with(EM_EDWindow.document){
designMode="On";
contentEditable=true;
open();
writeln('<html><head><title>阿赛HTML在线编辑器[AsaiEdit]</title><style>::-webkit-scrollbar{width:10px;height:10px;}::-webkit-scrollbar-track{background-color:'+EM_ESqy+';}::-webkit-scrollbar-thumb{background-color:'+EM_ESsy+';}::-webkit-scrollbar-button{background-color:'+EM_ESsy+';}::-webkit-scrollbar-corner{background-color:'+EM_ESqy+';}body{scrollbar-face-color:'+EM_ESsy+';scrollbar-shadow-color:'+EM_ESqy+';scrollbar-highlight-color:'+EM_ESqy+';scrollbar-3dlight-color:'+EM_ESsy+';scrollbar-darkshadow-color:'+EM_ESsy+';scrollbar-track-color:'+EM_ESqy+';scrollbar-arrow-color:'+EM_ESsy+';}</style>'+EM_ESfs+'</head><body></body></html>');
close();
//body.style.width=(EM_Vrwid.toString().indexOf("%")==-1? parseInt(EM_Vrwid)-30-10+"px":EM_Vrwid);
//body.style.padding=(EM_Vrwid.toString().indexOf("%")==-1? "10px":"0px");
body.style.width="100%";
//body.style.fontSize="14px";
body.innerHTML=InitValue;
}
EM_EAddEventHandler(EM_EDWindow.document,"contextmenu",EM_Smon);
EM_EAddEventHandler(EM_EDWindow.document,"mouseup",EM_Smup);
EM_EAddEventHandler(EM_EDWindow.document,"click",EM_Smgo);
EM_EAddEventHandler(EM_EDWindow.document,"keydown",EM_Skon);
EM_EAddEventHandler(EM_EDWindow.document,"keyup",EM_Skup);
}
var EM_Mtishi={'modcode':"当前代码模式，请返回编辑模式！"};
/* ---------------------------- 编辑器FUN ---------------------------- */
//定义编辑器区域鼠标与键盘动作
function EM_EAddEventHandler(Target,EventType,Handler){if(Target.attachEvent){Target.attachEvent("on"+EventType,Handler);}else if(Target.addEventListener){Target.addEventListener(EventType,Handler,false);}else{Target["on"+EventType]=Handler;}}
//当鼠标离开编辑器按钮时候触发的动作
function EM_Smgo(e){EM_EGetContent();}
//当鼠标抵达编辑器按钮时候触发的动作
function EM_Smon(e){EM_EGetContent();EM_Emenuk(e);if(document.all){return false;}else{e.preventDefault();}}
//当鼠标离开按钮或弹起时的动作
function EM_Smup(e){if(document.all){EM_EDCurGEditor=e.srcElement.document.parentWindow;}else{EM_EDCurGEditor=e.target.ownerDocument.defaultView;}}
//当键盘按键抬起时候的动作
function EM_Skup(e){EM_EGetContent();}
//当键盘按键按下时候的动作
function EM_Skon(e){EM_Ekyinput(e);EM_EGetContent();}
//获取时间
function EM_ETime(){
var date = new Date();  
var month = date.getMonth()+1;  
var day = date.getDate();  
var house = date.getHours();  
var minutes = date.getMinutes();  
var second = date.getSeconds();  
return month + "-" + day + " " + house + ":" + minutes + ":" + second
}
//自动保存功能模块
EM_ESaveat();
function EM_ESaveat(){
var s=0;
setInterval(function(){
s++;
if(s===30){
var EM_Enrs=EM_EGetContent();
if(EM_Enrs)localStorage.setItem("EM_Enrsv0",EM_Enrs);
s=0;
document.getElementById('EM_Ezsv0').innerHTML="["+EM_ETime()+"] ("+EM_Enrs.replace(/<\/?[^>]*>|[\r\n]/gi,"").length+")";
}else{
document.getElementById('EM_Ezsv').innerHTML=30-s;
};
},1000);
};
function EM_ESave(){
var EM_Enrs=EM_EGetContent();
if(EM_Enrs){
var EM_Enrsbc=localStorage.getItem("EM_Enrsv1");
localStorage.setItem("EM_Enrsv2",EM_Enrsbc);
document.getElementById('EM_Ezsv2').innerHTML=document.getElementById('EM_Ezsv1').innerHTML;
localStorage.setItem("EM_Enrsv1",EM_Enrs);
document.getElementById('EM_Ezsv1').innerHTML="["+EM_ETime()+"] ("+EM_Enrs.replace(/<\/?[^>]*>|[\r\n]/gi,"").length+")";
}
document.getElementById('EM_Ezsv').innerHTML="OK";
};
function EM_ERec(ty){
var EM_Enrs=localStorage.getItem("EM_Enrsv"+ty);
if(EM_Enrs){
EM_EDWindow.document.body.innerHTML=EM_Enrs;
document.getElementById(EM_ESan).value=EM_Enrs;
};
};
//获取编辑器内容（全部）
function EM_EGetContent(){
EM_EDValue=EM_Ktextarea.value=EM_Ehtmsi(EM_EDWindow.document.body.innerHTML);
if(document.getElementById(EM_ESid)){
if(isNaN(EM_ESlen)){EM_ESlen=1000;}
var obj=document.getElementById(EM_ESid);
var conlen=EM_EDValue.length;
if(conlen>EM_ESlen){alert("注意:文档大小"+conlen+">"+EM_ESlen+"(限长).")}
obj.value=EM_EDValue.substr(0,EM_ESlen);}
document.getElementById('EM_Eztj').innerHTML="<span title=文档大小"+conlen+"/限长"+EM_ESlen+">"+EM_EDValue.replace(/<\/?[^>]*>|[\r\n]/gi,"").length+"字符</span>";//获取当前文档代码字数；
if(document.getElementById(EM_ESan)){document.getElementById(EM_ESan).value=EM_EDValue;}
return EM_EDValue;
}
//检测按键执行动作
function EM_Ekyinput(e){if(e.keyCode==13){if(document.all){EM_Sincode("<br />");e.returnValue=false;}else{/*e.preventDefault();*/}}}
//获取编辑器中"&EM_tcxz&"内容（动作）
function EM_EGetRange(){
with(EM_EDWindow){focus();
if(document.all){return document.selection.createRange();}else{var selection=getSelection();
return selection.getRangeAt(selection.rangeCount-1).cloneRange();}}}
//获取编辑器内容（"&EM_tcxz&"部分）
function EM_EGetContentPart(){
var oRange=EM_EGetRange();
if(document.all){return oRange.htmlText;}
else{var contents=oRange.cloneContents();
var cnt=document.createElement("div");
cnt.appendChild(contents);
return cnt.innerHTML;}
}
//向编辑器中插入代码
function EM_Sincode(sHTML){
if(!EM_EDMode){alert(EM_Mtishi['modcode']);return;}
var oRange=EM_EGetRange();
if(document.all){oRange.pasteHTML(sHTML);}else{var oFrag=oRange.createContextualFragment(sHTML);
oRange.deleteContents();
oRange.insertNode(oFrag);}
EM_EGetContent();}
//向编辑器中插入图片
function EM_imgin(sSTR){
EM_Sincode("<img src="+sSTR+">");
}
//给内容加样式
function EM_Sstyle(Mark1,Mark2){
if(!EM_EDMode){alert(EM_Mtishi['modcode']);return;}
var oRange=EM_EGetRange();
with(EM_EDWindow){focus();
var html=EM_EGetContentPart();
if(html!=""){
html=Mark1+html+Mark2
if(document.all){oRange.pasteHTML(html);}else{var oFrag=oRange.createContextualFragment(html);
oRange.deleteContents();
oRange.insertNode(oFrag);}}
EM_EGetContent();}
}
//字体
function EM_Sziti(Scty,Scstr){
if(!EM_EDMode){alert(EM_Mtishi['modcode']);return;}
var oRange=EM_EGetRange();
with(EM_EDWindow){focus();
var html=EM_EGetContentPart();
if(html!=""){
if(Scty=="0"){
html="<span StylE=\"font-family:"+Scstr+"\">"+html+"</span>"
}else{
html="<span StylE=\"font-family:'"+Scstr+"'\">"+html+"</span>"
}
if(document.all){oRange.pasteHTML(html);}else{var oFrag=oRange.createContextualFragment(html);
oRange.deleteContents();
oRange.insertNode(oFrag);}}
EM_EGetContent();}
}
//文字背景与文字颜色
function EM_Scolor(Scty,Scstr){
if(!EM_EDMode){alert(EM_Mtishi['modcode']);return;}
var oRange=EM_EGetRange();
with(EM_EDWindow){focus();
var html=EM_EGetContentPart();
if(html!=""){
if(Scty=="0"){
html="<span StylE=\"Color:"+Scstr+"\">"+html+"</span>"
}else{
html="<span StylE=\"background-color:"+Scstr+"\">"+html+"</span>"
}
if(document.all){oRange.pasteHTML(html);}else{var oFrag=oRange.createContextualFragment(html);
oRange.deleteContents();
oRange.insertNode(oFrag);}}
EM_EGetContent();}
}
//JS编辑器常规命令
function EM_Sformat(what,opt){
if(!EM_EDMode){alert(EM_Mtishi['modcode']);return;}
with(EM_EDWindow){focus();
if(!opt){document.execCommand(what,false,null);}else{if(document.all){document.execCommand(what,"",opt);
}else{document.execCommand(what,false,opt);}}}
EM_EGetContent();
}
//全屏编辑器的命令
function EM_Sfullscreen(){
var oHtml=document.getElementsByTagName("html");
var sl=parseInt(document.body.scrollLeft);
var st=parseInt(document.body.scrollTop);
if(EM_SfullscreenMode==1){document.body.style.width=document.body.style.height="";
document.body.style.overflow="";
oHtml[0].style.overflow="";
EM_EDDiv.style.position="";
EM_EDDiv.style.background="transparent";
EM_EDDiv.style.zIndex="";
EM_Kiframe.style.width=EM_Ktextarea.style.width=EM_EDDiv.style.width=EM_Vrwid;
EM_Kiframe.style.height=EM_Ktextarea.style.height=EM_Vrheic;
EM_EDDiv.style.height=EM_Vrhei;
EM_SfullscreenMode=0;}else{oHtml[0].style.overflow="hidden";
document.body.style.overflow=document.all? "hidden":"visible";
document.body.style.width=document.body.style.height=0;
var page=EM_Esizegt();
EM_EDDiv.style.position="fixed";
EM_EDDiv.style.zIndex=1000;
EM_EDDiv.style.background=""+EM_ESqy+"";
EM_EDDiv.style.left=sl+"px";
EM_EDDiv.style.top=st+"px";
EM_Kiframe.style.width=EM_Ktextarea.style.width=EM_EDDiv.style.width=page[2]+"px";
EM_Kiframe.style.height=EM_Ktextarea.style.height=EM_EDDiv.style.height=(page[3]-parseInt(EM_Vrheit))+"px";
EM_SfullscreenMode=1;}
document.body.scrollLeft=sl;
document.body.scrollTop=st;
}
//全屏时候获取浏览器长宽
function EM_Esizegt(){
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
function EM_Ehtmsi(html){
html=html.replace(/<(BR [^>]+)>/gi,'<br>');
//if(EM_Vrhei.substring(2,3)=="8"){
//html=html.replace(/<div/gi,'<p');
//html=html.replace(/<\/div>/gi,'</p>');
//}
return html;
}
//清理html标签
function EM_Shtml(){
var html=EM_EGetContent();
html=html.replace(/\<br[^>]*>/gi,"[$br]");
html=html.replace(/<\/div>/gi,'[$br]');
html=html.replace(/<\/p>/gi,'[$br]');
html=html.replace(/<[^>]+>/g,"");
html=html.replace(/(^\s+)|(\s+$)/g,"");
html=html.replace(/\[\$br\]/gi,"<br>");
html=html.replace(/　　/ig,'');
EM_EDWindow.document.body.innerHTML=html;
document.getElementById(EM_ESan).value=html;
}
//处理编辑器多余的word格式
function EM_Sword(){
var html=EM_EGetContent();
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
EM_EDWindow.document.body.innerHTML=html;
document.getElementById(EM_ESan).value=html;
}
//全自动纯文本+图片+表格排版
function EM_Sauto(){
var html=EM_EGetContent();
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
EM_EDWindow.document.body.innerHTML=html;
document.getElementById(EM_ESan).value=html;
//Only for eesai用来自动得到摘要内容
document.getElementById("ss").value=html.replace(/<[^>]+>/g,"").substring(0,180).replace(/　/ig,'');
}
//向内容中插入
function EM_Sinto(Mark1){
if(!EM_EDMode){alert(EM_Mtishi['modcode']);return;}
var oRange=EM_EGetRange();
with(EM_EDWindow){focus();
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
EM_EGetContent();}
}
//插入弹窗返回的代码
function EM_Opcode(value){if(value){EM_Sincode(""+value+"");}}
//使用第三方编辑器编辑内容
function EM_Opue(){if(EM_ESpop!=""){EM_Opcode(window.prompt("第三方编辑器：","阿赛HTML在线编辑器[AsaiEdit]"));}else{EM_Opcode(showModalDialog(""+EM_ESpop+"",window,"dialogWidth:520px;dialogHeight:320px;status:0;help:0;scroll:no;"));}}
//显示隐藏HTML编码区域Show And Hidden Code Area
function EM_Scodearea(){
var selects=document.getElementsByTagName("select");
if(EM_Ktextarea.style.display=="none"){EM_Ktextarea.style.display="";
EM_Kiframe.style.display="none";
EM_EDMode=0;}else{EM_EDWindow.document.body.innerHTML=EM_Ktextarea.value;
EM_Ktextarea.style.display="none";
EM_Kiframe.style.display="";
EM_EDMode=1;}
EM_EGetContent();
}
//显示参考线Show And Hidden Edit->document.body Elements Borders
function EM_Seborder(){
var oCssRules;
var cssTxt="strong,b,i,em,u,li{border:"+EM_ESsy+" 1px dotted;padding:0px 2px;}a{border-bottom:"+EM_ESsy+" 2px dotted;margin:0px 3px;}font{border:"+EM_ESsy+" 1px dashed;margin:0px 3px;}span{border:"+EM_ESsy+" 1px dotted;margin:0px 5px;}p{border:"+EM_ESsy+" 1px dashed;padding:3px;}img{border:"+EM_ESsy+" 2px dotted;padding:5px;margin:5px;}div{border:"+EM_ESsy+" 3px dashed;margin:5px;}table{border:"+EM_ESsy+" 2px dotted;margin:3px;}td{border-left:"+EM_ESsy+" 1px dashed;border-right:"+EM_ESsy+" 1px dashed;border-top:"+EM_ESsy+" 1px dotted;border-bottom:"+EM_ESsy+" 1px dashed;padding:8px;}";
with(EM_EDWindow){oCssRules=document.styleSheets[0].ownerNode || document.styleSheets[0];}
if(document.all){if(oCssRules.cssText==""){oCssRules.cssText=cssTxt;}else{oCssRules.cssText="";}}else{if(oCssRules.innerHTML==""){oCssRules.innerHTML=cssTxt;}else{oCssRules.innerHTML="";}}}