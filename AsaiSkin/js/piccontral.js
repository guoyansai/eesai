//控制图片的大小
function AsaiImgK(Kwidth,Kheight,ImgId){
var asaiimg=new Image();
asaiimg.src=ImgId.src;
var hRatio;
var wRatio;
var Ratio=1;
var w=asaiimg.width;
var h=asaiimg.height;
wRatio=Kwidth/w;
hRatio=Kheight/h;
if (Kwidth==0 && Kheight==0){
Ratio=1;
}else if (Kwidth==0){//
if (hRatio<1) Ratio=hRatio;
}else if (Kheight==0){
if (wRatio<1) Ratio=wRatio;
}else if (wRatio<1 || hRatio<1){
Ratio=(wRatio<=hRatio?wRatio:hRatio);
}
if (Ratio<1){
w=w*Ratio;
h=h*Ratio;
}
ImgId.height=h;
ImgId.width=w;
}