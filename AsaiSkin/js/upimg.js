var AsaiUImgs = document.getElementsByTagName("img");
for(var AsaiUImgsi = 0;AsaiUImgsi<AsaiUImgs.length;AsaiUImgsi++){
AsaiUImgs[AsaiUImgsi].src=AsaiUImgs[AsaiUImgsi].src.replace(/.*?AsaiUpFile\/.*?/gi,"http://www.02590.com/AsaiUpFile/");
}