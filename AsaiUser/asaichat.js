if(!u_ys){u_ys="AA0010|CC1121|f2e6e6|fef5f5|DD7701|FF9901|FFDDBA|FFF6E5|0055AB|1177CB|dfeaf3|f3fafE|585858|989898|DD0000|FFFFFE";}
u_ys="#"+u_ys.replace(/(\#)/gi,"").replace(/(\|)/gi,"|#")
var c_yrr=new Array();c_yrr=u_ys.split("|");
var asaichatcss='<style>'
+'/**阿赛聊天室CSS---------------0**/'
+'/**'
+'聊天模式**/'
+'.ack_k,.ack_k div{-moz-border-radius:18px;-webkit-border-radius:18px;border-radius:18px;}.ack_bt,.ack_do,.ack_us,.ack_uf,.ack_mx,.ack_tm{-moz-border-radius:18px;-webkit-border-radius:18px;border-radius:18px;}'
+'.ack_my{margin:2px 66px 1px 2px;}'
+'.ack_my1{margin:2px 2px 1px 66px;}'
+'.ack_my2{margin:2px 2px 1px 66px;}'
+'.ack_k div.ack_my,.ack_k div.ack_my1,.ack_k div.ack_my2{margin:2px 2px 1px 2px;}'
+'/**外框与类型**/'
+'.ack_k{-moz-border-radius:8px;-webkit-border-radius:8px;border-radius:8px;}.ack_k{opacity:0.9;filter:alpha(opacity=90);-moz-opacity:0.9;-khtml-opacity:0.9;padding:0px; margin:2px 2px 3px 2px; font-family:"微软雅黑";background-color:'+c_yrr[15]+';color:'+c_yrr[12]+';font-size:medium;}.u_ydj,.u_ydj0{}.u_ydj1{text-decoration:underline;}.u_ydj2{font-weight:bold;}.u_ydj3{font-style:italic;}.u_ydj4{color:#F00;}.u_ydj5{color:#00F;}.u_ydj6{color:#0F0;}.u_ydj7{background-color:#FF0;}'
+'.ack_my1>.ack_k{border-left-width:1px;border-right-width:5px;}'
+'.ack_my2>.ack_k,.ack_my>.ack_k{border-left-width:5px;border-right-width:1px;}'
+'.ack_k:hover{border-left-width:3px;border-right-width:3px;}'
+'.ack_ty,.ack_ty0{background-color:transparent;border:1px solid '+c_yrr[2]+';background-color:'+c_yrr[15]+';}'
+'.ack_ty1{border:1px solid '+c_yrr[2]+';background-color:'+c_yrr[3]+';}'
+'.ack_ty2{border:1px solid '+c_yrr[1]+';background-color:'+c_yrr[3]+';}'
+'.ack_ty3{border:1px solid '+c_yrr[5]+';background-color: '+c_yrr[7]+';}'
+'.ack_ty4{border:1px solid '+c_yrr[9]+';background-color: '+c_yrr[11]+';}'
+'.ack_ty5{border:1px solid '+c_yrr[14]+';background-color: '+c_yrr[15]+';}'
+'/**审核与状态**/'
+'.ack_xy,.ack_xy0{font-size:small;}'
+'.ack_xy1{}'
+'.ack_xy2{font-size:large;}'
+'.ack_xy3{font-size:larger;}'
+'.ack_xy4{font-size:x-large;}'
+'.ack_xy5{font-size:xx-large;}'
+'/**发布人与时间**/'
+'.ack_bt,.ack_do{background-color:transparent;margin:-1px -1px -1px -1px;padding:0px;width:auto;}'
+'.ack_bt{float:left;}'
+'.ack_do{float:right;}'
+'.ack_us,.ack_uf,.ack_mx,.ack_tm{padding:0px 8px;}'
+'.ack_us,.ack_mx{cursor:pointer;}'
+'.ack_mx{display:none;}'
+'.ack_k:hover>div>div>.ack_mx{display:inline;}'
+'.ack_bt,.ack_do{border:1px solid '+c_yrr[1]+';}.ack_us,.ack_mx{background-color:'+c_yrr[1]+';color:'+c_yrr[3]+';}.ack_uf,.ack_tm{background-color:'+c_yrr[3]+'; color:'+c_yrr[1]+';}'
+'.ack_ty>div>.ack_bt,.ack_ty0>div>.ack_bt,.ack_ty1>div>.ack_bt,.ack_ty>div>.ack_do,.ack_ty0>div>.ack_do,.ack_ty1>div>.ack_do{border:1px solid '+c_yrr[2]+';}'
+'.ack_ty>div>div>.ack_us,.ack_ty0>div>div>.ack_us,.ack_ty1>div>div>.ack_us,.ack_ty>div>div>.ack_mx,.ack_ty0>div>div>.ack_mx,.ack_ty1>div>div>.ack_mx{background-color:'+c_yrr[1]+';color:'+c_yrr[3]+';}'
+'.ack_ty>div>div>.ack_uf,.ack_ty0>div>div>.ack_uf,.ack_ty1>div>div>.ack_uf,.ack_ty>div>div>.ack_tm,.ack_ty0>div>div>.ack_tm,.ack_ty1>div>div>.ack_tm{background-color:'+c_yrr[3]+'; color:'+c_yrr[1]+';}'
+'.ack_ty2>div>.ack_bt,.ack_ty2>div>.ack_do{border:1px solid '+c_yrr[1]+';}'
+'.ack_ty2>div>div>.ack_us,.ack_ty2>div>div>.ack_mx{background-color:'+c_yrr[1]+'; color:'+c_yrr[3]+';}'
+'.ack_ty2>div>div>.ack_uf,.ack_ty2>div>div>.ack_tm{background-color:'+c_yrr[3]+'; color:'+c_yrr[1]+';}'
+'.ack_ty3>div>.ack_bt,.ack_ty3>div>.ack_do{border:1px solid '+c_yrr[5]+';}'
+'.ack_ty3>div>div>.ack_us,.ack_ty3>div>div>.ack_mx{background-color:'+c_yrr[5]+'; color:'+c_yrr[7]+';}'
+'.ack_ty3>div>div>.ack_uf,.ack_ty3>div>div>.ack_tm{background-color:'+c_yrr[7]+'; color:'+c_yrr[5]+';}'
+'.ack_ty4>div>.ack_bt,.ack_ty4>div>.ack_do{border:1px solid '+c_yrr[9]+';}'
+'.ack_ty4>div>div>.ack_us,.ack_ty4>div>div>.ack_mx{background-color:'+c_yrr[9]+'; color:'+c_yrr[11]+';}'
+'.ack_ty4>div>div>.ack_uf,.ack_ty4>div>div>.ack_tm{background-color:'+c_yrr[11]+'; color:'+c_yrr[9]+';}'
+'.ack_ty5>div>.ack_bt,.ack_ty5>div>.ack_do{border:1px solid '+c_yrr[14]+';}'
+'.ack_ty5>div>div>.ack_us,.ack_ty5>div>div>.ack_mx{background-color:'+c_yrr[14]+'; color:'+c_yrr[15]+';}'
+'.ack_ty5>div>div>.ack_uf,.ack_ty5>div>div>.ack_tm{background-color:'+c_yrr[15]+'; color:'+c_yrr[14]+';}'
+'.ack_my1>div>div>.ack_bt{float:right;}'
+'.ack_my1>div>div>.ack_do{float:left;}'
+'.ack_my>div>div>.ack_bt,.ack_my2>div>div>.ack_bt{float:left;}'
+'.ack_my>div>div>.ack_do,.ack_my2>div>div>.ack_do{float:right;}'
+'/**内容与道具**/'
+'.ack_cr{clear:both;}'
+'.ack_nr{background-color:transparent;clear:both;padding:8px 12px; text-align:left;}'
+'.ack_my1>div>div>.ack_nr{text-align:right;}'
+'.ack_my>div>div>.ack_nr,.ack_my2>div>div>.ack_nr{text-align:left;}'
+'.ack_nr span{text-align:left;}'
+'/**自适应**/'
+'@media screen and (max-width:666px) {'
+'.ack_bt,.ack_do{float:left;}'
+'.ack_my1>div>div>.ack_bt,.ack_my1>div>div>.ack_do{float:right;}'
+'.ack_my>div>div>.ack_bt,.ack_my>div>div>.ack_do,.ack_my2>div>div>.ack_bt,.ack_my2>div>div>.ack_do{float:left;}'
+'}'
+'/**阿赛聊天室CSS---------------1**/'
+'</style>'
document.write(asaichatcss);
//**阿赛聊天室JS---------------0
//dj无道具=0|下划线=1|加粗体=2|倾斜体=3|红色字=4|蓝色字=5|绿色字=6|黄背景=7
//ty普通信息=0|协管信息=1|总管信息=2|站长信息=3|公告信息=4|系统信息=5
//xy☆☆☆☆☆|★☆☆☆☆|★★☆☆☆|★★★☆☆|★★★★☆|★★★★★,数字越大推荐越靠前.
function asainull(afstr) {if (afstr=null || afstr==null || afstr==undefined || afstr=='undefined' || afstr=='' || afstr=='0' || afstr==0){return true}else{return false}}
function asaierr(afstr) {if(ub_err>9){document.write(afstr+'<br><br>');}}
function asaispeak(eesfstr){
if(window.SpeechSynthesisUtterance){
eesfstr=eesfstr.replace(/<\/?[^>]*>/g,'');
eesfstr=eesfstr.replace(/[ | ]*\n/g,'\n');
eesfstr=eesfstr.replace(/\n[\s| | ]*\r/g,'\n');
var EESspeechSU=new window.SpeechSynthesisUtterance();
if(eesfstr!=""){EESspeechSU.text=eesfstr;}else{EESspeechSU.text="没有可读内容！";}
window.speechSynthesis.speak(EESspeechSU);
}
}
function asaispeakcancel(){window.speechSynthesis.cancel();}
//var asaitime=0;
//**阿赛聊天室asaiXHP---------------0
function asaiXHP(){
//if(asaitime<1000){asaitime++}else{asaitime=0};
//alert(asaitime);
var asaichatshow=document.getElementById("asaichatshow").innerHTML;
var asaichatshowci=document.getElementById("asaichatshowci").value;
//asaiXML获取最新ci
var asaiXMLci;
if(window.ActiveXObject){asaiXMLci=new ActiveXObject("Microsoft.XMLHTTP");}
else if(window.XMLHttpRequest){asaiXMLci=new window.XMLHttpRequest();}
asaiXMLci.open("POST",ub_uri+'///'+asaichatshowci,false);
asaiXMLci.send(null);
var asaichatshowcix=unescape(asaiXMLci.responseText);

asaierr('远程计数='+asaichatshowcix+'<br>本地计数='+asaichatshowci+'<br>本地内容：<br>'+asaichatshow+'');
if(asainull(asaichatshow) || asainull(asaichatshowci) || asaichatshowcix!==asaichatshowci || ub_err>9){
	//asaiXMLnr获取最新内容
	var asaiXMLnr;
	if(window.ActiveXObject){asaiXMLnr=new ActiveXObject("Microsoft.XMLHTTP");}
	else if(window.XMLHttpRequest){asaiXMLnr=new window.XMLHttpRequest();}
	asaiXMLnr.open("POST",ub_urn+'///'+asaichatshowci,false);
	asaiXMLnr.send(null);
	var ub_str=unescape(asaiXMLnr.responseText);
	asaierr('远程内容：<br>'+ub_str);
	var ac_sn,ac_sj,ac_nr,ac_us,ac_us0,ac_us1,ac_u1,ac_u10,ac_u11,ac_ty,ac_dj,ac_tm,ac_xy,arr_us,arr_u1,als_lin,arr_x,aii_y,arr_lin,arr_str;
	ub_str=ub_mos+ub_str;
	var arr_y=ub_str.split(ub_y);
	var ann_y=arr_y.length;
	asaierr('数组长度='+ann_y);
	als_lin="";
	if(ann_y>1){
		var asaichatshowx="";
		arr_str="";
		function asais2v(afstr) {eval('var asaisjson='+afstr);return asaisjson;}
		function asaipt(afcs,afstr){afcs=eval("/"+afcs+"/");return afstr.match(afcs) ? afstr.match(afcs).length : 0;}
		for(aii_y=1; aii_y<ann_y; aii_y++)
		{
		arr_lin=arr_y[aii_y]
		arr_str=ub_y+arr_lin+arr_str
		asaierr('数组['+aii_y+']<br>'+arr_lin);
		arr_x=arr_lin.split(ub_x);
		ac_sn=arr_x[0];ac_sj=arr_x[1];ac_nr=arr_x[2];ac_us=arr_x[3];arr_us=ac_us.split(", ");ac_us0=arr_us[0];ac_us1=arr_us[1];ac_u1=arr_x[4];arr_u1=ac_u1.split(", ");ac_u10=arr_u1[0];ac_u11=arr_u1[1];ac_ty=arr_x[5];ac_dj=arr_x[6];ac_tm=arr_x[7];ac_xy=arr_x[8];
		als_lin="";
		if(!asainull(ub_user)){
		als_lin=als_lin+'<div class="ack_my'
		if(ub_user==ac_us1){als_lin=als_lin+'1'}else if(ub_user==ac_u11){als_lin=als_lin+'2'}
		als_lin=als_lin+'">'
		}
		als_lin=als_lin+'<div class="ack_k ack_ty'+ac_ty+'">'
		als_lin=als_lin+'<div class="ack_xy'+ac_xy+'">'
		if(ub_gun>9){
		if(!asainull(ac_sj)&&asaipt(ub_y+ac_sj,arr_str)>0){asaierr('数组['+aii_y+']的修饰调用变量=F'+ac_sj);als_lin=als_lin+asais2v('F'+ac_sj);};
		als_lin=als_lin+'<div class="ack_nr"'
		if(ub_yin==9){als_lin=als_lin+' onMouseOver="asaispeak(this.innerHTML);" onMouseOut="asaispeakcancel();"'}
		als_lin=als_lin+'><span class="u_ydj'+ac_dj+'">'+ac_nr+'</span></div>';
		}
		als_lin=als_lin+'<div class="ack_bt">'
		if(!asainull(ac_us0)){
		als_lin=als_lin+'<span'
		if(!asainull(ac_us1)&&ac_us1.indexOf("iP") == -1){als_lin=als_lin+' title="'+ac_us1+'" class="ack_us" onclick="document.getElementById(\'ack_formx\').style.display=\'block\';document.getElementById(\'sj\').value=\'\';document.getElementById(\'u10\').value=\''+ac_us0+'\';document.getElementById(\'u11\').value=\''+ac_us1+'\';"'}else{als_lin=als_lin+' class="ack_uf"';}
		als_lin=als_lin+'>'+ac_us0+'</span>'
		}
		if(!asainull(ac_u10)){
		als_lin=als_lin+'<span'
		if(!asainull(ac_u11)&&ac_u11.indexOf("iP") == -1){als_lin=als_lin+' class="ack_us" title="'+ac_u11+'" onclick="document.getElementById(\'ack_formx\').style.display=\'block\';document.getElementById(\'sj\').value=\'\';document.getElementById(\'u10\').value=\''+ac_u10+'\';document.getElementById(\'u11\').value=\''+ac_u11+'\';"'}else{als_lin=als_lin+' class="ack_uf""'}
		als_lin=als_lin+'>@'+ac_u10+'</span>'
		}
		als_lin=als_lin+'</div>'
		als_lin=als_lin+'<div class="ack_do">'
		if(!asainull(ac_us1)&&ac_us1.indexOf("iP") == -1){als_lin=als_lin+'<span class="ack_mx" onclick="document.getElementById(\'ack_formx\').style.display=\'block\';document.getElementById(\'sj\').value=\''+ac_sn+'\';document.getElementById(\'u10\').value=\''+ac_us0+'\';document.getElementById(\'u11\').value=\''+ac_us1+'\';">回复</span>'}
		if(!asainull(ub_urv)){als_lin=als_lin+'<span class="ack_mx" onclick="window.open(\''+ub_urv+ac_sn+'\',\'_blank\');">浏览</span>'}
		if(ac_tm.length==8){als_lin=als_lin+'<span class="ack_tm">'+ac_tm.substring(0,4)+'-'+ac_tm.substring(4,6)+'-'+ac_tm.substring(6,8)+'</span>'}
		als_lin=als_lin+'</div>'
		if(ub_gun<9){
		als_lin=als_lin+'<div class="ack_nr"'
		if(ub_yin==9){als_lin=als_lin+' onMouseOver="asaispeak(this.innerHTML);" onMouseOut="asaispeakcancel();"'}
		als_lin=als_lin+'><span class="u_ydj'+ac_dj+'">'+ac_nr+'</span></div>';
		if(!asainull(ac_sj)&&asaipt(ub_y+ac_sj,arr_str)>0){asaierr('数组['+aii_y+']的修饰调用变量=F'+ac_sj);als_lin=als_lin+asais2v('F'+ac_sj);};
		}
		als_lin=als_lin+'<div class="ack_cr"></div></div>';
		als_lin=als_lin+'</div>';
		if(!asainull(ub_user)){als_lin=als_lin+'</div>';}
		asaierr('数组['+ann_y+'-'+aii_y+']的修饰'+asaipt(ac_sn,ub_str)+'<br>'+als_lin);
		if(asaipt(ub_x+ac_sn,ub_str)>0){asaierr('数组['+aii_y+']的修饰转变量=F'+ac_sn);eval('var F'+ac_sn+'=als_lin;');}
		if(ub_gun>9){asaichatshowx=asaichatshowx+als_lin;}else{asaichatshowx=als_lin+asaichatshowx;}
		};
		if(ub_err>9){asaierr('输出的计数='+asaichatshowcix+'<br>输出的修饰：<br>'+asaichatshowx);}
		else{
		document.getElementById("asaichatshowci").value=asaichatshowcix;
		document.getElementById("asaichatshow").innerHTML=asaichatshowx;
		if(ub_yin==9){asaispeak(ac_nr);}else if(ub_yin==6){if(parseInt(sc_ty)>0){asaitishi(7,1)}else{asaitishi(8,1)};}else if(ub_yin>0){asaitishi(ub_yin,1);}
		if(ub_gun>10){window.scroll(0,999999999999);};
		}
	};
}
//window.clearInterval();
}
//**阿赛聊天室asaiXHP---------------1
//**阿赛聊天室JS---------------1
asaiXHP();document.getElementById('nr').focus();
window.setInterval("asaiXHP();",ub_err*1000);