var AsaiErrImg=document.getElementsByTagName("img");
for(aei=0;aei<AsaiErrImg.length;aei++){
//AsaiErrImg[aei].onerror=function(){this.src="/AsaiSkin/js/nopic/n"+Math.round(Math.random()*6+1)+".jpg";}
AsaiErrImg[aei].onerror=function(){this.src="/AsaiSkin/js/nopic/tk.gif";}
}