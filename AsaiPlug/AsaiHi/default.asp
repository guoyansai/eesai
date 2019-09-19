<!--#include file="../../AsaiData/cf.asp"--><%Call opendb(i_dir)%><%
'<script language=javascript src=?ty-id.js></scr ipt>
'ty=0hi|1ds|11ds-ajax|
const cnm="asaihi"'缓存前缀:统计专用缓存前缀
const ctm=1'失效时间-cookies失效时间,单位小时
const cci=3'统计限制-点击我顶单用户最多统计次数.
dim hiarr,hishi,hisbd,hisxi
hiarr=split(replace(Request.ServerVariables("QUERY_STRING"),".js",""),"-")
if ubound(hiarr)=2 then
dim hix0,hix1,hix2,hixstr,hixlin,hixlin1
hix0=aiint(hiarr(0))
hix1=aiint(hiarr(1))
hix2=aiint(hiarr(2))
'0ai_hi
if hix0=0 then
if aiint(Request.Cookies(cnm&"0v"&hix1))>cci then
hixstr="浏览："&aiint(Request.Cookies(cnm&"0v"&hix1))&"　"
else
'Execute("update ees_ai set ai_hi=ai_hi+1,ai_bd=ai_bd+1 where ai_id="&hix1&"")
Call saik(rs,"select ai_hi,ai_bd from "&w_dbqz&"ai where ai_id="&hix1&"",1,3)
if rs.eof and rs.bof then
hixstr=""
else
hishi=aiint(rs("ai_hi"))+1
hisbd=aiint(rs("ai_bd"))+1
rs("ai_hi")=hishi
rs("ai_bd")=hisbd
rs.update
hixstr="浏览："&hishi&"　"
Response.Cookies(cnm&"0v"&hix1)=hishi
Response.Cookies(cnm&"0"&hix1)=aiint(Request.Cookies(cnm&"0"&hix1))+1
Response.Cookies(cnm&"0"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)

end if
'4bb_hi
elseif hix0=4 then
if aiint(Request.Cookies(cnm&"4"&hix1))>cci then
hixstr="浏览："&Request.Cookies(cnm&"4v"&hix1)&"　"
else
Call saik(rs,"select bb_hi from "&w_dbqz&"bb where bb_id="&hix1&"",1,3)
if rs.eof and rs.bof then
hixstr=""
else
hishi=aiint(rs("bb_hi"))+1
rs("bb_hi")=hishi
rs.update
hixstr="浏览："&hishi&"　"
Response.Cookies(cnm&"4v"&hix1)=hishi
Response.Cookies(cnm&"4"&hix1)=aiint(Request.Cookies(cnm&"4"&hix1))+1
Response.Cookies(cnm&"4"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'6us_hi
elseif hix0=6 then
if aiint(Request.Cookies(cnm&"6"&hix1))>cci then
hixstr="浏览："&Request.Cookies(cnm&"6v"&hix1)&"　"
else
Call saik(rs,"select us_hi from "&w_dbqz&"us where us_id="&hix1&"",1,3)
if rs.eof and rs.bof then
hixstr=""
else
hishi=aiint(rs("us_hi"))+1
rs("us_hi")=hishi
rs.update
hixstr="浏览："&hishi&"　"
Response.Cookies(cnm&"6v"&hix1)=hishi
Response.Cookies(cnm&"6"&hix1)=aiint(Request.Cookies(cnm&"6"&hix1))+1
Response.Cookies(cnm&"6"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'js-------------------------
elseif hix0=111 then%>
if(!!document.getBoxObjectFor||window.mozInnerScreenX!=null){
HTMLElement.prototype.__defineSetter__("innerText",function(sText){
var parsedText=document.createTextNode(sText);
this.innerHTML="";
this.appendChild(parsedText);
return parsedText;
});
HTMLElement.prototype.__defineGetter__("innerText",function(){
var crang=this.ownerDocument.createRange();
crang.selectNodeContents(this);
return crang.toString();});}

function hicc(ccid,cchr){
var Asg_url="<%=i_dir&s_drplug%>AsaiHi/?"+cchr;
var AsaiAct;
if (window.ActiveXObject){AsaiAct=new ActiveXObject("Microsoft.XMLHTTP");}
else if(window.XMLHttpRequest){AsaiAct=new XMLHttpRequest();}
AsaiAct.open("POST",Asg_url,false);
AsaiAct.send(null);

var hitd=parseInt(document.getElementById(ccid).innerText);
document.getElementById(ccid).innerText=hitd+1;
}<%
'1ai_xi-ajax
elseif hix0=11 then
if aiint(Request.Cookies(cnm&"1"&hix1))>cci then
else
Call saik(rs,"select ai_xi,ai_bd from "&w_dbqz&"ai where ai_id="&hix1&"",1,3)
if rs.eof and rs.bof then
else
hisxi=aiint(rs("ai_xi"))+1
hisbd=aiint(rs("ai_bd"))+10
rs("ai_xi")=hisxi
rs("ai_bd")=hisbd
rs.update
Response.Cookies(cnm&"1v"&hix1)=hisxi
Response.Cookies(cnm&"1"&hix1)=aiint(Request.Cookies(cnm&"1"&hix1))+1
Response.Cookies(cnm&"1"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'ai_xi
elseif hix0=1 then
hixstr=hixstr&"<span id="&cnm&"1"&hix1
if aiint(Request.Cookies(cnm&"1"&hix1))>cci then
hixstr=hixstr&" title=已顶过 class='p-c glyphicon glyphicon-thumbs-up'"
else
hixstr=hixstr&" title=我顶一下 class='p-a glyphicon glyphicon-thumbs-up' onclick=hicc('"&cnm&"1"&hix1&"','11-"&hix1&"-"&hix2&".js')"
end if
if Request.Cookies(cnm&"1v"&hix1)<>"" then
hixstr=hixstr&"><b>"&Request.Cookies(cnm&"1v"&hix1)&"</b></span>"
else
hixlin=gysro("ai_xi",w_dbqz&"ai","ai_id="&hix1&"","")
if ainull(hixlin) then hixlin=0
Response.Cookies(cnm&"1v"&hix1)=hixlin
hixstr=hixstr&">"&hixlin&"</span>"
end if
'3ef_xi-ajax
elseif hix0=33 then
if aiint(Request.Cookies(cnm&"3"&hix1))>cci then
else
Call saik(rs,"select ef_xi from "&w_dbqz&"ef where ef_id="&hix1&"",1,3)
if rs.eof and rs.bof then
else
hisxi=aiint(rs("ef_xi"))+1
rs("ef_xi")=hisxi
rs.update
Response.Cookies(cnm&"3v"&hix1)=hisxi
Response.Cookies(cnm&"3"&hix1)=aiint(Request.Cookies(cnm&"3"&hix1))+1
Response.Cookies(cnm&"3"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'ef_xi
elseif hix0=3 then
hixstr=hixstr&"<span id="&cnm&"3"&hix1
if aiint(Request.Cookies(cnm&"3"&hix1))>cci then
hixstr=hixstr&" title=已顶过 class='p-c glyphicon glyphicon-thumbs-up'"
else
hixstr=hixstr&" title=我顶一下 class='p-a glyphicon glyphicon-thumbs-up' onclick=hicc('"&cnm&"3"&hix1&"','33-"&hix1&"-"&hix2&".js')"
end if
if Request.Cookies(cnm&"3v"&hix1)<>"" then
hixstr=hixstr&"><b>"&Request.Cookies(cnm&"3v"&hix1)&"</b></span>"
else
hixlin=gysro("ef_xi",w_dbqz&"ef","ef_id="&hix1&"","")
Response.Cookies(cnm&"3v"&hix1)=hixlin
hixstr=hixstr&">"&hixlin&"</span>"
end if
'5bb_xi-ajax
elseif hix0=55 then
if aiint(Request.Cookies(cnm&"5"&hix1))>cci then
else
Call saik(rs,"select bb_xi from "&w_dbqz&"bb where bb_id="&hix1&"",1,3)
if rs.eof and rs.bof then
else
hisxi=aiint(rs("bb_xi"))+1
rs("bb_xi")=hisxi
rs.update
Response.Cookies(cnm&"5v"&hix1)=hisxi
Response.Cookies(cnm&"5"&hix1)=aiint(Request.Cookies(cnm&"5"&hix1))+1
Response.Cookies(cnm&"5"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'bb_xi
elseif hix0=5 then
hixstr=hixstr&"<span id="&cnm&"5"&hix1
if aiint(Request.Cookies(cnm&"5"&hix1))>cci then
hixstr=hixstr&" title=已顶过 class='p-c glyphicon glyphicon-thumbs-up'"
else
hixstr=hixstr&" title=我顶一下 class='p-a glyphicon glyphicon-thumbs-up' onclick=hicc('"&cnm&"5"&hix1&"','55-"&hix1&"-"&hix2&".js')"
end if
if Request.Cookies(cnm&"5v"&hix1)<>"" then
hixstr=hixstr&"><b>"&Request.Cookies(cnm&"5v"&hix1)&"</b></span>"
else
hixlin=gysro("bb_xi",w_dbqz&"bb","bb_id="&hix1&"","")
Response.Cookies(cnm&"5v"&hix1)=hixlin
hixstr=hixstr&">"&hixlin&"</span>"
end if
'9ut_xi-ajax
elseif hix0=99 then
if aiint(Request.Cookies(cnm&"9"&hix1))>cci then
else
Call saik(rs,"select ut_xi from "&w_dbqz&"ut where ut_id="&hix1&"",1,3)
if rs.eof and rs.bof then
else
hisxi=aiint(rs("ut_xi"))+1
rs("ut_xi")=hisxi
rs.update
Response.Cookies(cnm&"9v"&hix1)=hisxi
Response.Cookies(cnm&"9"&hix1)=aiint(Request.Cookies(cnm&"9"&hix1))+1
Response.Cookies(cnm&"9"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'ut_xi
elseif hix0=9 then
hixstr=hixstr&"<span id="&cnm&"9"&hix1
if aiint(Request.Cookies(cnm&"9"&hix1))>cci then
hixstr=hixstr&" title=已顶过 class='p-c glyphicon glyphicon-thumbs-up'"
else
hixstr=hixstr&" title=我顶一下 class='p-a glyphicon glyphicon-thumbs-up' onclick=hicc('"&cnm&"9"&hix1&"','99-"&hix1&"-"&hix2&".js')"
end if
if Request.Cookies(cnm&"9v"&hix1)<>"" then
hixstr=hixstr&"><b>"&Request.Cookies(cnm&"9v"&hix1)&"</b></span>"
else
hixlin=gysro("ut_xi",w_dbqz&"ut","ut_id="&hix1&"","")
Response.Cookies(cnm&"9v"&hix1)=hixlin
hixstr=hixstr&">"&hixlin&"</span>"
end if
'2us_xi+xo-ajax
elseif hix0=22 then
if aiint(Request.Cookies(cnm&"2"&hix1))>cci then
else
Call saik(rs,"select us_xi from "&w_dbqz&"us where us_id="&hix1&"",1,3)
if rs.eof and rs.bof then
else
hisxi=aiint(rs("us_xi"))+1
rs("us_xi")=hisxi
rs.update
Response.Cookies(cnm&"2v"&hix1)=hisxi
Response.Cookies(cnm&"2"&hix1)=aiint(Request.Cookies(cnm&"2"&hix1))+1
Response.Cookies(cnm&"2"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'us_xi+xo-ajax
elseif hix0=222 then
if aiint(Request.Cookies(cnm&"2"&hix1))>cci then
else
Call saik(rs,"select us_xo from "&w_dbqz&"us where us_id="&hix1&"",1,3)
if rs.eof and rs.bof then
else
hisxi=aiint(rs("us_xo"))+1
rs("us_xo")=hisxi
rs.update
Response.Cookies(cnm&"2vv"&hix1)=hisxi
Response.Cookies(cnm&"2"&hix1)=aiint(Request.Cookies(cnm&"2"&hix1))+1
Response.Cookies(cnm&"2"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'us_xi+xo
elseif hix0=2 then
hixstr=hixstr&"<span id="&cnm&"2"&hix1
if aiint(Request.Cookies(cnm&"2"&hix1))>cci then
hixstr=hixstr&" title=已顶过 class='p-c glyphicon glyphicon-thumbs-up'"
else
hixstr=hixstr&" title=我顶一下 class='p-a glyphicon glyphicon-thumbs-up' onclick=hicc('"&cnm&"2"&hix1&"','22-"&hix1&"-"&hix2&".js')"
end if
if aiint(Request.Cookies(cnm&"2"&hix1))>cci then
hixstr=hixstr&"><b>"&Request.Cookies(cnm&"2v"&hix1)&"</b></span><span title=已评价 id="&cnm&"2i"&hix1&" class='p-c glyphicon glyphicon-thumbs-down'>"&Request.Cookies(cnm&"2vv"&hix1)&"</span>"
else
Call saik(rs,"select us_xi,us_xo from "&w_dbqz&"us where us_id="&hix1&"",1,1)
if rs.eof and rs.bof then
else
hixlin=rs("us_xi")
hixlin1=rs("us_xo")
Response.Cookies(cnm&"2v"&hix1)=hixlin
Response.Cookies(cnm&"2vv"&hix1)=hixlin1
end if
Call saig(rs)
hixstr=hixstr&">"&hixlin&"</span><span title=不喜欢就点一下 id="&cnm&"2i"&hix1&" class='p-b glyphicon glyphicon-thumbs-down' onclick=hicc('"&cnm&"2i"&hix1&"','222-"&hix1&"-"&hix2&".js')>"&Request.Cookies(cnm&"2vv"&hix1)&"</span>"
end if
'8ee_xi+xo-ajax
elseif hix0=88 then
if aiint(Request.Cookies(cnm&"8"&hix1))>cci then
else
Call saik(rs,"select ee_xi from "&w_dbqz&"ee where ee_id="&hix1&"",1,3)
if rs.eof and rs.bof then
else
hisxi=aiint(rs("ee_xi"))+1
rs("ee_xi")=hisxi
rs.update
Response.Cookies(cnm&"8v"&hix1)=hisxi
Response.Cookies(cnm&"8"&hix1)=aiint(Request.Cookies(cnm&"8"&hix1))+1
Response.Cookies(cnm&"8"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'ee_xi+xo-ajax
elseif hix0=888 then
if aiint(Request.Cookies(cnm&"8"&hix1))>cci then
else
Call saik(rs,"select ee_xo from "&w_dbqz&"ee where ee_id="&hix1&"",1,3)
if rs.eof and rs.bof then
else
hisxi=aiint(rs("ee_xo"))+1
rs("ee_xo")=hisxi
rs.update
Response.Cookies(cnm&"8vv"&hix1)=hisxi
Response.Cookies(cnm&"8"&hix1)=aiint(Request.Cookies(cnm&"8"&hix1))+1
Response.Cookies(cnm&"8"&hix1).Expires=(now()+ctm/24)
end if
Call saig(rs)
end if
'ee_xi+xo
elseif hix0=8 then
hixstr=hixstr&"<span id="&cnm&"8"&hix1
if aiint(Request.Cookies(cnm&"8"&hix1))>cci then
hixstr=hixstr&" title=已顶过 class='p-c glyphicon glyphicon-thumbs-up'"
else
hixstr=hixstr&" title=我顶一下 class='p-a glyphicon glyphicon-thumbs-up' onclick=hicc('"&cnm&"8"&hix1&"','88-"&hix1&"-"&hix2&".js')"
end if
if aiint(Request.Cookies(cnm&"8"&hix1))>cci then
hixstr=hixstr&"><b>"&Request.Cookies(cnm&"8v"&hix1)&"</b></span><span title=已表态 id="&cnm&"8i"&hix1&" class='p-c glyphicon glyphicon-thumbs-up'>"&Request.Cookies(cnm&"8vv"&hix1)&"</span>"
else
Call saik(rs,"select ee_xi,ee_xo from "&w_dbqz&"ee where ee_id="&hix1&"",1,1)
if rs.eof and rs.bof then
else
hixlin=rs("ee_xi")
hixlin1=rs("ee_xo")
Response.Cookies(cnm&"8v"&hix1)=hixlin
Response.Cookies(cnm&"8vv"&hix1)=hixlin1
end if
Call saig(rs)
hixstr=hixstr&">"&hixlin&"</span><span title=我踩一下 id="&cnm&"8i"&hix1&" class='p-b glyphicon glyphicon-thumbs-down' onclick=hicc('"&cnm&"8i"&hix1&"','888-"&hix1&"-"&hix2&".js')>"&Request.Cookies(cnm&"8vv"&hix1)&"</span>"
end if

end if
if (hix0=0 or hix0=4 or hix0=6) and hix2<2 and aiint(Request.Cookies("gl"))<3 then
else
response.Write("document.write("""&hixstr&""");")
end if
end if
%><!--#include file="../../AsaiInc/incma.asp"-->