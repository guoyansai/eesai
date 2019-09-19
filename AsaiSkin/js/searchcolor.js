//调用方法
//onload=function(){ 
//AsaiSearchShow(document.body,'关键词1|关键词2'); 
//AsaiSearchShow(document.body,'关键词1|关键词2',false,'/'); 
//AsaiSearchShow(document.getElementById('AsaiSearchId'),'关键词1|关键词2|关键词3|关键词4',true,'search.asp?keyword='); }

//onload=function(){AsaiSearchShow(document.getElementById('变色区域ID'),'关键词',true,'');} 
//放在搜索区域ID下方
function AsaiSearchShow(AoID,AoKey,AoRndCor,AoUrl){
	var aobgcor=aoftcor=''; 
	if(AoRndCor){ 
		aobgcor=AoMakeRndCor(10,20); 
		aoftcor=AoMakeRndCor(230,255); 
	} else { 
		aobgcor='yellow'; 
		aoftcor='black'; 
	} 
	var aorekey=new RegExp(AoKey,'i'); 
	for(var i=0; i<AoID.childNodes.length; i++){     
		var AoIDs=AoID.childNodes[i]; 
		var AoIDsp=AoIDs.parentNode; 
		if(AoIDs.nodeType==1) { 
			AsaiSearchShow(AoIDs,AoKey,AoRndCor,AoUrl);                 
		 } else if (AoIDs.nodeType==3) { 
//			if(!(AoIDsp.nodeName=='A')){ //这里是排除某些标签内不替换的
				if(AoIDs.data.search(aorekey)==-1)continue; 
				var aotemp=AoTextCor(AoIDs.data,AoKey); 
				AoIDsp.replaceChild(aotemp,AoIDs); 
//			} 
		} 
	} 
	//------------------------------------------------ 
	function AoTextCor(AoText,AoKey){ 
		var Aostyle=' style="background-color:'+aobgcor+';color:'+aoftcor+';" ' 
		var aokeyspan=document.createElement('EES'); 
		var Aostr=''; 
		var aorekey=new RegExp('('+AoKey+')','gi'); 
		if(AoUrl){ 
			Aostr=AoText.replace(aorekey,'<a href="../../AsaiSkin/js/'+AoUrl+'$1"'+Aostyle+'>$1</a>'); //这里是给关键字加链接，$1是指上面链接地址后的具体参数。
		} else { 
			Aostr=AoText.replace(aorekey,'<EES'+Aostyle+'>$1</EES>'); //不加链接时显示
		} 
		aokeyspan.innerHTML=Aostr; 
		return aokeyspan; 
	}    
	//------------------------------------------------ 
	function AoMakeRndCor(AoStart,AoEnd){ 
		if(arguments.length==1){ 
			var AoEnd=AoStart; 
				AoStart=0; 
		}else if(arguments.length==0){ 
			var AoStart=0; 
			var AoEnd=255; 
		} 
		var r=AoRfCor(AoStart,AoEnd).toString(16); 
			r=AoRfNum(r,r,2); 
		var g=AoRfCor(AoStart,AoEnd).toString(16); 
			g=AoRfNum(g,g,2); 
		var b=AoRfCor(AoStart,AoEnd).toString(16); 
			b=AoRfNum(b,b,2); 
		return '#'+r+g+b; 
		function AoRfCor(AoStart,AoEnd){ 
			switch(arguments.length){ 
				case 1: return parseInt(Math.random()*AoStart+1); 
				case 2: return parseInt(Math.random()*(AoEnd-AoStart+1) + AoStart); 
				default: return 0; 
			} 
		}
		function AoRfNum(AoStr,AoNum,AoLen){ 
			var aotemp='' 
			for(var i=0; i<AoLen;aotemp+=AoNum,i++); 
			return aotemp=(aotemp+=AoStr).substr(aotemp.length-AoLen); 
		}
	} 
}