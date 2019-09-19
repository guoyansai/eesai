var obj=document.getElementsByTagName("body"); 
for(i=0;i<obj.length;i++){ 
var str="cdef"; 
var t="#"; 
for(j=0;j<6;j++) 
{t=t+ str.charAt(Math.random()*str.length);} 
obj[i].style.background=t;} 