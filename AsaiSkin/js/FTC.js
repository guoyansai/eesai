function FTC(tcfurl,tcfname,tcfwid,tcfhei){
var tcfurl;var tcfname;var tcfwid;var tcfhei;
var tcdwid=(window.screen.availHeight-30-tcfhei)/2;
var tcdhei=(window.screen.availWidth-10-tcfwid)/2;
window.open(tcfurl,tcfname,'height='+tcfhei+',,innerHeight='+tcfhei+',width='+tcfwid+',innerWidth='+tcfwid+',top='+tcdwid+',left='+tcdhei+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}