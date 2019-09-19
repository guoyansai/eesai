if(esdll1!==""||esdll2!==""||esdlr1!==""||esdlr2!==""){
//阿赛对联JS系统。
AsaiLSY=0;//控制对联与顶部的距离
function AsaiADhead(){
var AsaiFY;
if (document.documentElement && document.documentElement.scrollTop)
AsaiFY = document.documentElement.scrollTop;
else if (document.body)
AsaiFY = document.body.scrollTop
else
{/*Netscape stuff*/}
//alert(AsaiFY);
percent=.1*(AsaiFY-AsaiLSY);
if(percent>0)percent=Math.ceil(percent);
else percent=Math.floor(percent);
document.getElementById("AsaiDLDivL").style.top = parseInt(document.getElementById("AsaiDLDivL").style.top)+percent+"px";
document.getElementById("AsaiDLDivR").style.top = parseInt(document.getElementById("AsaiDLDivR").style.top)+percent+"px";
AsaiLSY=AsaiLSY+percent;
//alert(AsaiLSY);
}
//-->
//关闭按钮
function AsaiDLCloseLeft1(){AsaiDLLeft1.style.visibility='hidden';}
function AsaiDLCloseLeft2(){AsaiDLLeft2.style.visibility='hidden';}
function AsaiDLCloseRight1(){AsaiDLRight1.style.visibility='hidden';}
function AsaiDLCloseRight2(){AsaiDLRight2.style.visibility='hidden';}
//显示样式

document.writeln("<style>#AsaiDLDivL,#AsaiDLDivR{height:auto;position:absolute;text-align:center;}.AsaiDLFl{margin:0px 0px 3px 0px;height:auto;}.AsaiDLFr{margin:0px 0px 3px 0px;height:auto;}a.AsaiDLan,a.AsaiDLan:link,a.AsaiDLan:active,a.AsaiDLan:visited{font-size:12px;text-decoration:none;border:#D8D8D8 1px solid;color:#D8D8D8;display:block;}a.AsaiDLan:hover{text-decoration:none;background-color:#D8D8D8;color:#FF0000;}</style>");

//下面这段删除后，对联将不跟随屏幕而移动。
window.setInterval("AsaiADhead()",1);
//以下为主要内容
if(esdlkt!==""){esdlkt="5px"}
if(esdlkb!==""){esdlkb="5px"}
//------左侧各块开始
if(esdll1!==""||esdll2!==""){document.writeln("<div id=\"AsaiDLDivL\" style=\"top:"+esdlkt+";left:"+esdlkb+"\">");
//---L1
if(esdll1!==""){document.writeln("<div id=\"AsaiDLLeft1\" class=\"AsaiDLFl\"><a class=\"AsaiDLan\" href=\"javascript:AsaiDLCloseLeft1();\" title=\"关闭下面的广告AsaiDLLeft1\">×<\/a>"+esdll1+"<\/div>");}
//---L2
if(esdll2!==""){document.writeln("<div id=\"AsaiDLLeft2\" class=\"AsaiDLFl\"><a class=\"AsaiDLan\" href=\"javascript:AsaiDLCloseLeft2();\" title=\"关闭下面的广告AsaiDLLeft2\">×<\/a>"+esdll2+"<\/div>");}
document.writeln("<\/div>");}
//------左侧各块结束

//------右侧各块开始
if(esdlr1!==""||esdlr2!==""){document.writeln("<div id=\"AsaiDLDivR\" style=\"top:"+esdlkt+";right:"+esdlkb+"\">");
//---R1
if(esdlr1!==""){document.writeln("<div id=\"AsaiDLRight1\" class=\"AsaiDLFr\"><a class=\"AsaiDLan\" href=\"javascript:AsaiDLCloseRight1();\" title=\"关闭下面的广告AsaiDLRight1\">×<\/a>"+esdlr1+"<\/div>");}
//---R2
if(esdlr2!==""){document.writeln("<div id=\"AsaiDLRight2\" class=\"AsaiDLFr\"><a class=\"AsaiDLan\" href=\"javascript:AsaiDLCloseRight2();\" title=\"关闭下面的广告AsaiDLRight2\">×<\/a>"+esdlr2+"<\/div>");}
document.writeln("<\/div>");}
//------右侧各块结束
}