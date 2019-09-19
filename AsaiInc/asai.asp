<%
'-----------------------------------
'stop cj
'=esfcj()
'-----------------------------------
Function esfcj(esfci,esftm,esfur)
if i_xkcj>2 then
Dim AppealTime,AppealTimeN,AppealTimeX
AppealTimeN=0
AppealTime=Request.Cookies(w_sn&"rdtm")
If not isdate(AppealTime) Then
AppealTime=now()
Response.Cookies(w_sn&"rdtm")=AppealTime
AppealTimeX=false
else
AppealTimeN=datediff("s",AppealTime,now())
if AppealTimeN>esftm then
AppealTimeX=false
Response.Cookies(w_sn&"rdtm")=now()
else
AppealTimeX=true
end if
End If
if AppealTimeX then
Response.Write "<!doctype html><html><head><meta charset=""utf-8""><title>"&w_motm&",请您驻足看一下您打开的页面，不要那么早就跳转到其他页面</title><meta http-equiv=""page-Exit"" content=""revealTrans(Duration=1,Transition=23)""><meta http-equiv=""refresh"" content="""&esftm&";url="&esfur&"""></head><body style=""background-color:#000000;color:#FFF;font-size:12px;line-height:150%;""><h1 style=""background-color:#FFF;color:#FF0000;padding:5px 12px;font-size:12px;width:228px;"">请您驻足看一下您打开的页面，不要那么早就跳转到其他页面</h1>操作记录档案：#"&int(100-int(second(now())))&"(#IP"&aiip()&")<br>记录备注提示："&AppealTimeN&"秒就离开了，什么页面让您这么难以入目。<hr>请您等待 "&esftm&" 秒钟，自动跳转至目标页面："&esfur&"<br><hr><br>感谢您的支持，"&w_motm&" 于 "&now()&"<br><p align=""right""><a style=""background-color:#FFF;padding:5px;"" href=""/"">返回首页</a>&nbsp;&nbsp;<a style=""background-color:#FFF;padding:5px;"" href=""javascript:history.go(-1);"">返回上页</a></p><script>var obj=document.getElementsByTagName(""body"");for(i=0;i<obj.length;i++){var str=""0123456789"";var t=""#"";for(j=0;j<6;j++) {t=t+ str.charAt(Math.random()*str.length);}obj[i].style.background=t;}</script></body></html>"
Response.end
end if
elseif i_xkcj>1 then
Dim AppealCount
AppealCount=Request.Cookies(w_sn&"rdci")
If AppealCount="" Then
Response.Cookies(w_sn&"rdci")=1
AppealCount=1
Response.Cookies(w_sn&"rdci").Expires=DateAdd("s",60,Now())
Else
Response.Cookies(w_sn&"rdci")=AppealCount+1
Response.Cookies(w_sn&"rdci").Expires=DateAdd("s",60,Now())
End If
If Int(AppealCount)>esfci Then
Response.Cookies(w_sn&"rdci")=1
AppealCount=1
Response.Write "<!doctype html><html><head><meta charset=""utf-8""><title>"&w_motm&",请您注意适当休息，不要在短时间过于频繁地在本站跳转页面</title><meta http-equiv=""page-Exit"" content=""revealTrans(Duration=1,Transition=23)""><meta http-equiv=""refresh"" content="""&esftm&";url="&esfur&"""></head><body style=""background-color:#000000;color:#FFF;font-size:12px;line-height:150%;""><h1 style=""background-color:#FFF;color:#FF0000;padding:5px 12px;font-size:12px;width:228px;"">请您注意适当休息，不要在短时间过于频繁地在本站跳转页面</h1>操作记录档案：#"&int(100-int(second(now())))&"(#IP"&aiip()&")<br>记录备注提示：一分钟竟然热情地浏览了 "&esfci&" 页面，太感谢了，还请您且行且休息、休息一下。<hr>请您等待 "&esftm&" 秒钟，自动跳转至目标页面："&esfur&"<br><hr><br>感谢您的支持，"&w_motm&" 于 "&now()&"<br><p align=""right""><a style=""background-color:#FFF;padding:5px;"" href=""/"">返回首页</a>&nbsp;&nbsp;<a style=""background-color:#FFF;padding:5px;"" href=""javascript:history.go(-1);"">返回上页</a></p><script>var obj=document.getElementsByTagName(""body"");for(i=0;i<obj.length;i++){var str=""0123456789"";var t=""#"";for(j=0;j<6;j++) {t=t+ str.charAt(Math.random()*str.length);}obj[i].style.background=t;}</script></body></html>"
Response.end
End If
end if
End Function
'-----------------------------------
'edit xt
'=eseditxt("esfstr","100%/220px","100%/220px")
'-----------------------------------
Function eseditxt(esfstr,esfid,esfty)
eseditxt=""
eseditxt=eseditxt&"<input type=""checkbox"" id=""dianpings"" name=""dianpings"" value=""1"" onClick=""if (this.checked){document.getElementById('easdps').style.display='';}else{document.getElementById('easdps').style.display='none';}""> <label for=""dianpings"">查看点评</label> <input type=""checkbox"" id=""dianping"" name=""dianping"" value=""1"" onClick=""if (this.checked){document.getElementById('easdp').style.display='';}else{document.getElementById('easdp').style.display='none';}""> <label for=""dianping"">编辑点评</label>"
eseditxt=eseditxt&"<div class=cr></div><div id=""easdps"" class=""h-a"" style=""display:none;"">"&esplshow(esfstr)&"</div>"
eseditxt=eseditxt&"<div class=cr></div><div id=""easdp"" style=""display:none;"">"&esedit(esfstr,esfid,esfty)&"</div>"
End Function
'-----------------------------------
'edit
'=esedit("esfstr","100%/220px","100%/220px")
'-----------------------------------
Function esedit(esfstr,esfid,esfty)
esfstr=server.HTMLEncode(esfstr)'
esedit="<div class=""AsaiEdit b-cb"">"
if esfty=1 then
esedit=esedit&"<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(i_dir&"AsaiEdit/AsaiEditMini.js",3)&"""></script><textarea id="""&esfid&""" name="""&esfid&""" style=""display:none;"">"&esfstr&"</textarea><script>AsaiEditMini('EESai.Com','"&esfid&"',8888,'100%',200,'','AsaiEditorMini','"&i_dir&"',""AsaiEdit/"",'#6a8ccb','#F6F6F6','#FFFFFF','"&escss()&"');</script>"
elseif esfty=2 then
esedit=esedit&"<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(i_dir&"AsaiEdit/AsaiEdit.js",3)&"""></script><textarea id="""&esfid&""" name="""&esfid&""" style=""display:none;"">"&esfstr&"</textarea><script>AsaiEdit('EESai.Com','"&esfid&"',88888888,'100%',282,'','AsaiEditor','"&i_dir&"',""AsaiEdit/"",'#6a8ccb','#F6F6F6','#FFFFFF','"&escss()&"');</script>"
elseif esfty=8 then'del div
esedit=esedit&"<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(i_dir&"AsaiEdit/AsaiEdit.js",3)&"""></script><textarea id="""&esfid&""" name="""&esfid&""" style=""display:none;"">"&esfstr&"</textarea><script>AsaiEdit('EESai.Com','"&esfid&"',88888888,'100%',288,'','AsaiEditor','"&i_dir&"',""AsaiEdit/"",'#6a8ccb','#F6F6F6','#FFFFFF','"&escss()&"');</script>"
else
esedit=esedit&"<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(i_dir&"AsaiEdit/AsaiEdit.js",3)&"""></script><textarea id="""&esfid&""" name="""&esfid&""" style=""display:none;"">"&esfstr&"</textarea><script>AsaiEdit('EESai.Com','"&esfid&"',88888888,'100%',288,'','AsaiEditor','"&i_dir&"',""AsaiEdit/"",'#6a8ccb','#F6F6F6','#FFFFFF','"&escss()&"');</script>"
end if
esedit=esedit&"</div>"
End Function
'-----------------------------------
'search color
'=esscor(divid,key)
'-----------------------------------
Function esscor(esfid,esfss)
if i_xksc=1 and not ainull(esfss) then esscor="<script>onload=function(){AsaiSearchShow(document.getElementById('"&esfid&"'),'"&esfss&"',true,'');} </script><script type=""text/javascript"" src="""&w_asai&i_msk&"js/searchcolor.js""></script>":e_lonload=1
End Function
'-----------------------------------
'time show
'=estms(esfty,esfstr)
'----------------------------------
Function estms(esfty,esfstr)
if isdate(esfstr) then
if esfty=6 then
estms=aitms("时间:",esfstr,9)
else
if year(esfstr)=year(date()) then
estms=aitms("发布时间： ",esfstr,9)
elseif datediff("d",esfstr,Now())<366 then
estms=aitms("发布时间： ",esfstr,9)
else
estms="一年前"
end if
if estms<>"" then
if esfty=1 then
estms="　"&estms
elseif esfty=2 then
estms=estms&"　"
elseif esfty=3 then
estms="　"&estms&"　"
end if
end if
end if
end if
End Function
'-----------------------------------
'search date
'=esqday(esfty)
'-----------------------------------
Function esqday(esfty)
if aibj(esfty,"0") then
esqday="今日|近日|一周|一月|百日|今年|近年"
elseif not ainull(esfty) then
if w_dbty=0 then
esqday="datediff('d',"&esfty&",Now())=0|datediff('d',"&esfty&",Now())<4|datediff('d',"&esfty&",Now())<8|datediff('d',"&esfty&",Now())<31|datediff('d',"&esfty&",Now())<101|year("&esfty&")=year(date())|datediff('d',"&esfty&",Now())<366"
elseif w_dbty=1 then
esqday="datediff(d,"&esfty&",'"&Now()&"')=0|datediff(d,"&esfty&",'"&Now()&"')<4|datediff(d,"&esfty&",'"&Now()&"')<8|datediff(d,"&esfty&",'"&Now()&"')<31|datediff(d,"&esfty&",'"&Now()&"')<101|year("&esfty&")=year(date())|datediff(d,"&esfty&",'"&Now()&"')<366"
end if
end if
End Function
'-----------------------------------
'Check Code
'=eskyx(esfkz=0noKZ/1KZ/2KZ,esfqx=0,1user,2admin,esfty=0noyz,1mz,2lilc)
'-----------------------------------
Function eskyx(esfkz,esfqx,esfty)
dim esfqxl
eskyx=""
if esfkz>0 and ewxgn("ua") then
if g_svkx=2 then
eskyx="<input type=""checkbox"" checked=""checked"" name="""&g_ckks&"kz"" id="""&g_ckks&"kz"" value=""1""> <label for="""&g_ckks&"kz"">储存空值（选中表示储存）</label>"
elseif g_svkx=1 or esfkz=2 then
eskyx="<input type=""checkbox"" name="""&g_ckks&"kz"" id="""&g_ckks&"kz"" value=""1""> <label for="""&g_ckks&"kz"">储存空值（选中表示储存）</label>"
end if
end if

if esfqx=1 then
esfqxl=aiint(e_uzy)
elseif esfqx=2 then
esfqxl=aiint(e_gdj)
else
esfqxl=0
end if

if eskyx="" then
if esfqxl>=i_xkyz then
eskyx="<span style=""display:none;"">"&esky(0,esfqxl)&"</span>"
else
if esfty=2 then
eskyx=""&esky(0,esfqxl)&""&eskyx&""
elseif esfty=1 then
eskyx=""&esky(0,esfqxl)&""&eskyx&""
else
eskyx=esky(0,esfqxl)&" "&eskyx
end if
end if
else
if esfqxl>=i_xkyz then
if esfty=2 then
eskyx="<span style=""display:none;"">"&esky(0,esfqxl)&"</span> "&eskyx&""
elseif esfty=1 then
eskyx="<span style=""display:none;"">"&esky(0,esfqxl)&"</span> "&eskyx&""
else
eskyx=esky(0,esfqxl)&" "&eskyx
end if
else
if esfty=2 then
eskyx=""&esky(0,esfqxl)&" "&eskyx&""
elseif esfty=1 then
eskyx=""&esky(0,esfqxl)&" "&eskyx&""
else
eskyx=esky(0,esfqxl)&" "&eskyx
end if
end if
end if
End Function
'-----------------------------------
'Check Code+Form/Made Code
'=esky(0=check/1=get comments,qx)
'-----------------------------------
Function esky(esfty,esfqx)
'自动验证|1加法验证|2数字验证|3图片数字|4图片混合
if ew_yz=0 or aiint(esfqx)>=i_xkyz or aiint(e_uzy)>=i_xkyz or aiint(e_gdj)>=i_xkyz then'no yz
  if esfty=1 then
  esky=false
  if aibj(request.form(s_fmym),s_fmyz) then esky=true
  else
  esky="*"&s_ztyz&aiinput("hidden",s_fmym,"",0,0,"","",s_fmyz)
  end if
else
if esfty=1 then'yz
esky=false
  if ew_yz=1 then
  'response.Write request.form(s_fmyy)&"="&aiint(aiks(0,"Asaicode1","",2))&"+"&aiint(aiks(0,"Asaicode2","",2))
  if aibj(request.form(s_fmyy),aiint(aiks(0,"Asaicode1","",2))+aiint(aiks(0,"Asaicode2","",2))) and aibj(request.form(s_fmym),s_fmyz) then esky=true
  else
  'response.Write "ssssssss"&aiks(0,"Asaicode","",2)&"="&aireq(s_fmyy)
  if aibj(request.form(s_fmyy),aiks(0,"Asaicode","",2)) and aibj(request.form(s_fmym),s_fmyz) then esky=true
  end if
else'yz form
csyz=aiint(csyz)+1
esky=aiinput("hidden",s_fmym,"",0,0,"","",s_fmyz)
esky=esky&aiinput("",s_fmyy,"",3,50,"","f-da","")
if ew_yz=1 then
dim AsaicodeNum1,AsaicodeNum2,AsaicodeNum3
if csyz>1 then
AsaicodeNum1=aiks(0,"Asaicode1","",2)
AsaicodeNum2=aiks(0,"Asaicode2","",2)
else
Randomize
AsaicodeNum1=int(9*Rnd)+1
Randomize
AsaicodeNum2=int(89*Rnd)+1
Randomize
AsaicodeNum3=int(999*Rnd)+1
Call aiks(i_xkhc,"Asaicode1",AsaicodeNum1,1)
Call aiks(i_xkhc,"Asaicode2",AsaicodeNum2,1)
end if
esky=esky&"<strong title=""请计算出算式结果填入验证文本框"" class=""f-yz"" style=""border:#0"&left(AsaicodeNum3&"F"&AsaicodeNum1&"7"&AsaicodeNum2&"F7F",5)&" 1px solid;background-color:#F"&left(AsaicodeNum1&"7"&AsaicodeNum2&"F"&AsaicodeNum3&"F7F",5)&";color:#0"&left(AsaicodeNum3&"7"&AsaicodeNum1&"F"&AsaicodeNum2&"F7F",5)&""">= "&AsaicodeNum1&"+"&AsaicodeNum2&"</strong>"
elseif ew_yz=2 then
if csyz>1 then
AsaicodeNum1=aiks(0,"Asaicode","",2)
else
Randomize
AsaicodeNum1=int(10000*Rnd)+1000
Call aiks(i_xkhc,"Asaicode",AsaicodeNum1,1)
end if
esky=esky&AsaicodeNum1
elseif ew_yz=3 then
esky=esky&"<img id=""checkcode"" style=""cursor:pointer;"" title=""看不清楚?请点击刷新!"" src="""&eshref(s_drplug&"AsaiCodeImgS/?code.jpg",3)&""" onClick=""this.src=this.src+'?'+Math.random();"">"
elseif ew_yz=4 then
esky=esky&"<img id=""checkcode"" style=""cursor:pointer;"" title=""看不清楚?请点击刷新!"" src="""&eshref(s_drplug&"AsaiCodeImgZ/?code.jpg",3)&""" onClick=""this.src=this.src+'?'+Math.random();"">"
end if
end if
end if
End Function
'-----------------------------------
'nr font size big&small
'=esxfs()
'-----------------------------------
Function esxfs()
esxfs="　字体：<input type=""hidden"" id=""c-ifs"" name=""c-ifs"" value=""10""><a href=""javascript:;"" onClick=""document.getElementById('c-ifs').value=parseInt(parseInt(document.getElementById('c-ifs').value)+1);document.getElementById('AsaiNR').style.fontSize=parseInt(parseInt(document.getElementById('c-ifs').value)+1)+'0%';""><span class=""glyphicon glyphicon-zoom-in""></span>大</a> <a href=""javascript:;"" onClick=""document.getElementById('c-ifs').value=parseInt(parseInt(document.getElementById('c-ifs').value)-1);document.getElementById('AsaiNR').style.fontSize=parseInt(parseInt(document.getElementById('c-ifs').value)-1)+'0%';""><span class=""glyphicon glyphicon-zoom-out""></span>小</a>"
esxfs=esxfs&" <script language=""JavaScript"" charset=""utf-8"" src=""http://x.780.pub/js/_asaispeaker.js""></script><script>asaispeaker(""AsaiNR"",18);</script>"
End Function
'-----------------------------------
'ico h1
'=eesicoh(esfty,esfel)
'-----------------------------------
Function esicoh(esfty,esfel)
if instr(s_udlbs,"|"&esfel&"|")>0 then
esicoh="<span class="""
if esfty=1 then esicoh=esicoh&"p-ol "
esicoh=esicoh&"glyphicon glyphicon-"&split(split(s_udlbs,"|"&esfel&"|")(1),"|")(0)&"""></span> "
end if
End Function
'-----------------------------------
'skin title
'=esbts(mc&g_gy&lj&g_gx&mc2&g_gy&lj2,mc&g_gy&lj&g_gx&mc2&g_gy&lj2)
'-----------------------------------
Function esbts(esfsx,esfel,esfstr,esfmor)
dim esdqr,esdhr,esdqrr,esdhrr,esdeii
if ainull(esfstr) and ainull(esfmor) then
esbts=""
else
if aiint(esfsx)>0 then esbts="<div class=""gys"&aiint(esfsx)&""">"
esbts=esbts&"<div class=""a-gh""><div class=""a-g"">"
esbts=esbts&"<div class=""a-ga"">"
if not ainull(esfel) then
if ew_vb=1 then
esbts=esbts&esicoh(0,esfel)
elseif ew_vb=2 then
esbts=esbts&"<img class=""a-gg"" src="""&eshref(ew_sk&"img/asai.png",3)&""">"
end if
end if
if not ainull(esfstr) then
esdqr=split(esfstr,g_gx)
for esdeii=0 to ubound(esdqr)
esdqrr=split(esdqr(esdeii)&g_gy,g_gy)
if not ainull(esdqrr(1)) then esbts=esbts&"<a href="""&esdqrr(1)&""">"
if not ainull(esdqrr(0)) then esbts=esbts&esdqrr(0)
if not ainull(esdqrr(1)) then esbts=esbts&"</a>"
next
end if
esbts=esbts&"</div>"
if not ainull(esfmor) then
esbts=esbts&"<div class=""a-gb"">"
esdhr=split(esfmor,g_gx)
for esdeii=0 to ubound(esdhr)
esdhrr=split(esdhr(esdeii)&g_gy,g_gy)
if not ainull(esdhrr(1)) then esbts=esbts&"<a href="""&esdhrr(1)&""">"
if not ainull(esdhrr(0)) then esbts=esbts&esdhrr(0)
if not ainull(esdhrr(1)) then esbts=esbts&"</a>"
next
esbts=esbts&"</div>"
end if
if aiint(esfsx)>0 then esbts=esbts&"</div>"
esbts=esbts&"</div></div>"
end if
End Function
'-----------------------------------
'two in one
'=esto(esfoa,esfob)
'-----------------------------------
Function esto(esfol,esfoa,esfob)
if esfol="77" then
if ainull(esfoa) then
esto=aitit(split(left(esfob,28)&"，","，")(0))
else
esto=esfoa
end if
else
esto=esfoa
end if
End Function
'-----------------------------------
'ms bijiao
'=estt(eqfza,eqfzb)
'-----------------------------------
Function estt(esfza,esfzb)
if aibj(esfza,esfzb) then
estt=" class=""active"""
end if
End Function
'-----------------------------------
'make app name
'=esapm(esfty,pd&g_gy&sn)
'0系统常规缓存|1+top调用缓存|2+list列表第一页缓存|3+show内容缓存|4+list分页全缓存
'const i_hc0="ees_0"'系统缓存:极少更新的网站信息、频道、分类、菜单等.
'const i_hc1="ees_1"'内容缓存:内容页面缓存的完整信息.
'const i_hc2="ees_2"'翻页列表:内容列表页面翻页缓存信息.
'const i_hc3="ees_3"'调用缓存:网站调用内容top循环列表的缓存.
'const i_hc4="ees_4"'主页缓存:网站首页、频道主页及常规页面的缓存.
'-----------------------------------
Function esapm(esfty,esfstr)
if esfty="0" then'(2,sn/list)
esapm=i_hc0&g_apj&s_udew&aiint(ew_sn)&g_apj&esfstr
elseif esfty="1" then'(1,ai_sn)
if ew_ap>2 then
if ainull(esfstr) or len(esfstr)<9 then
esapm=i_hc1&g_apj&s_udew&aiint(ew_sn)&g_apj&esfstr'非正常信息编码储存
else
esapm=i_hc1&g_apj&s_udew&aiint(ew_sn)&g_apj&left(esfstr,4)&g_apj&right(esfstr,len(esfstr)-4)
end if
end if
elseif esfty="2" then
if ew_ap>1 then esapm=i_hc2&g_apj&s_udew&aiint(ew_sn)&g_apj&esfstr
elseif esfty="3" then
if ew_ap>0 then esapm=i_hc3&g_apj&s_udew&aiint(ew_sn)&g_apj&esfstr
elseif esfty="4" then
if ew_ap>0 then esapm=i_hc4&g_apj&s_udew&aiint(ew_sn)&g_apj&esfstr
else
esapm=i_hc0&g_apj&s_udew&aiint(ew_sn)&g_apj&esfstr
end if
End Function
'-----------------------------------
'del app
'=eskod(esfty,pd&g_gy&sn)
'-----------------------------------
Function eskod(esfgg,esfty,esfstr)
if ainull(esfstr) then
eskod=""
elseif esfgg=8 and esfty=8 then
if esfstr<>"00" then Call ankop(0,1,0,i_hc0&g_apj&s_udgg&g_apj&esfstr)
Call ankop(0,1,0,i_hc0&g_apj&s_udgg&g_apj&"top10"&g_apj)
elseif esfgg=0 and esfty=0 then
Call ankop(0,1,0,esfstr)
else
eskod="<p align=center><iframe src="""&eshref(s_drplug&"AsaiCache/?gg="&esfgg&"&ty="&esfty&"&str="&esfstr,3)&""" style=""background-color:transparent;"" frameborder=0 scrolling=auto width=""100%"" height=""280""></iframe></p>"
end if
End Function
'-----------------------------------
'=esurl("esfstr")'wei html
'-----------------------------------
Function esurl(esfstr)
esurl=esfstr
if i_html=1 then
dim esdlr,esdlri,esdlrs
esdlr=split(i_htmlw&","&w_htmls,",")
esdlrs=replace(replace(split(esfstr&g_urg,g_urg)(0),"?",""),g_urz,"")
for esdlri=0 to ubound(esdlr)
if aibj(esdlr(esdlri),esdlrs) then esurl=replace(esurl,"?","")
next
end if
End Function
'-----------------------------------
'=esnk("esfstr")
'-----------------------------------
Function esnk(esfstr)
if ainull(esfstr) then
esnk=s_umqb
else
esnk=esfstr
end if
End Function
'-----------------------------------
'read nr to arr
'=esupr(esfstr)
'-----------------------------------
function esupr(esfty,esfstr)
esupr=""
if instr(esfstr,"@@,")>0 then
  if esfty=0 or eupdmlin="" then eupdmxr=split(esfstr,"@@,")
  if esfty=2 then
  eupdmnr=eupdmxr(0)
  if right(eupdmnr,2)=", " then eupdmnr=left(eupdmnr,len(eupdmnr)-2)
  esupr=eupdmnr
  else
  if esfty=0 or eupdmxx="" then eupdmxx=ubound(eupdmxr)
  if esfty=0 or eupdmlin="" then eupdmlin=replace(eupdmxr(1),", ",",")
  if eupdmlin<>"" then
  eupdmrr=split(eupdmlin,",")
  eupdmud=ubound(eupdmrr)
  end if
  end if
elseif esfty=2 then
  eupdmnr=esfstr
  if right(eupdmnr,4)=", @@" then eupdmnr=left(eupdmnr,len(eupdmnr)-4)
  esupr=eupdmnr
end if
end function
'-----------------------------------
'nr read
'=esnr(esfnr)
'-----------------------------------
Function esnr(esfnr)
esfnr=replace(esfnr,g_gr,VbCrlf)
esnr=esupr(2,esfnr)
dim icggxxp
Set icggxxp=new RegExp'regular expression
icggxxp.IgnoreCase=true'Ignore case
icggxxp.Global=true'Search string matching for all text
'guolv img-height
icggxxp.Pattern="\<img(.+?)\height=(.+?)\ (.+?)\>"
esnr=icggxxp.replace(esnr,"<img$1 $3>")
Set icggxxp=nothing
End Function
'-----------------------------------
'nr read xx
'=esnr(esfnr)
'-----------------------------------
Function esnrgys(esfnr,esfur,esfpg)
esnrgys=gysnr(esfnr,esfur,esfpg)
'esnrgys=aiufile(0,gysnr(esfnr,esfur,esfpg),p_upijj,p_upwdu)
End Function
'-----------------------------------
'=esnf("esfstr")
'-----------------------------------
Function esnf(esfstr)
if ainull(esfstr) then
esnf=s_umqb
else
esnf=split(split(esfstr&"@","@")(0)&",",",")(0)
end if
End Function
'-----------------------------------
'=esnff("esfstr")
'-----------------------------------
Function esnff(esfstr)
if ainull(esfstr) then
esnff=s_umqb
else
esnff=trim(split(esfstr&",",",")(0))
esnff=split(split(esnff&g_ura,g_ura)(0)&g_urb,g_urb)(0)
end if
End Function
'-----------------------------------
'=esups("esfstr",1|moren,2|http://)
'-----------------------------------
Function esups(esfstr,esfty)
esups=""
if aibj(left(esfstr,7),"http://") or aibj(left(esfstr,6),"ftp://") then
esups=esfstr
else
if ainull(esfstr) then
if len(esfty)=2 then
Randomize
esups=eshref(p_upijj&"n"&int(6*Rnd)+1&".jpg",3)
end if
elseif not aibj(left(esfstr&"0",1),"/") then
if instr(esfstr,p_upijj)>0 then esfstr=split(esfstr,p_upijj)(1)
esups=eshref(p_upijj&esfstr,3)
else
esups=esfstr
end if
if left(esfty,1)="2" then
esups="http://"&g_uhost&esups
end if
end if
End Function
'-----------------------------------
'=eshref("esfstr",1=auto/2=auto all/11=asp auto/22=asp auto all/3=file dir)
'-----------------------------------
Function eshref(esfstr,esfty)
'0ASP动态|1HTML伪静态|2首页HTML|3首+频道HTML|4首+频+列表HTML|5全部静态HTML
if aibj(left(esfstr,1),"/") or aibj(left(esfstr,7),"http://") or aibj(left(esfstr,6),"ftp://") then
eshref=""&esfstr&""
else
dim esdharr,esdhlr
'--------------后台管理专用链接（纯动态处理）
if esfty=77 then
eshref=i_dir&"?"&esfstr
'--------------会员社区链接处理（须含会员系统）
elseif esfty=66 then
if instr(lcase(g_ud)&"/",s_drwap)>0 then
eshref=e_tug&"?"&esfstr
else
eshref=i_dir&s_drsns&"?"&esfstr
end if
'--------------一直根目录处理
elseif esfty=55 then
eshref=i_dir&"?"&esfstr
'--------------调用固定文件的绝对地址
elseif esfty=3 then
eshref=i_dir&esfstr
'--------------当前位置的动态链接处理
elseif esfty=2 then
eshref="?"&esfstr
'--------------根目录自动处理
elseif esfty=1 then
eshref=e_tug&"?"&esfstr
esdharr=split(esfstr&g_urg&g_urg&g_urg,g_urg)
if i_html=5 then
eshref=e_tug&esfstr
elseif i_html=4 then
if ainull(esdharr(2)) then eshref=e_tug&esfstr
elseif i_html=3 then
if ainull(esdharr(1)) and instr(esfstr,"index")=0 then eshref=e_tug&esfstr
elseif i_html=2 then
if ainull(esdharr(0)) or aibj(esdharr(0),"index") then eshref=e_tug&esfstr
elseif i_html=1 then
esdhlr=replace(replace(replace(split(esfstr&g_urg,g_urg)(0),"?",""),g_urz,""),"?","")
if instr(","&i_htmlw&","&w_htmls&",",esdhlr&",") >0 then
eshref=e_tug&esfstr
if not aibj(right(eshref,len(g_urg)),g_urg) and not aibj(right(eshref,len(g_urz)),g_urz) then eshref=eshref&g_urz
else
eshref=e_tug&esurl("?"&esfstr)
end if
end if
'--------------根目录一直动态链接处理'=11
elseif esfty=11 then
eshref=e_tug&"?"&esfstr
end if
eshref=replace(eshref,"??","?")
eshref=replace(eshref,g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urz,g_urz)
eshref=replace(eshref,g_urg&g_urg&g_urg&g_urg&g_urg&g_urz,g_urz)
eshref=replace(eshref,g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&g_urz,g_urz)
eshref=replace(eshref,g_urg&g_urz,g_urz)
end if
End Function
'------------------------------------------------------
'eshrej(esfqz,esfstr,esfur,esfty)
'------------------------------------------------------
Function eshrej(esfqz,esfur,esfstr,esfty)
if ainull(esfur) then
if ainull(esfqz) then
eshrej=eshref(esfstr,esfty)
else
eshrej=eshref(esfqz&g_urg&esfstr,esfty)
end if

elseif w_wwkg>1 and g_umi<>"" then
if ainull(esfqz) then
eshrej=eshref(esfstr,esfty)
else
eshrej=eshref(esfqz&g_urg&esfstr,esfty)
end if
if g_umx<>"1" then eshrej="http://www."&esfur&"."&g_umi&eshrej

else
if ainull(esfqz) then
eshrej=eshref(s_udukw&g_urg&esfur&g_urg&esfstr,esfty)
else
eshrej=eshref(esfqz&g_urg&s_udukw&g_urg&esfur&g_urg&esfstr,esfty)
end if
end if
End Function
'------------------------------------------------------
'esyqs(50)
'------------------------------------------------------
Function esyqs(esfstr)
if not ainull(esfstr) then
dim esdlens,esdqz1,esdqz2
esyqs=""
esdlens=len(esfstr)
if esdlens>1 then
esdqz1=12*esdlens
esyqs="font-size:"&esdqz1+aiint(mid(esfstr,1,1))*2&"px;"
esdqz2=aiint(mid(esfstr,2,1))
if esdqz2>7 and esdqz2<10 then
esyqs="color:#DD0000;"&esyqs
elseif esdqz2>7 and esdqz2<10 then
esyqs="color:#EE0088;"&esyqs
elseif esdqz2>5 and esdqz2<8 then
esyqs="color:#FF9900;"&esyqs
elseif esdqz2>3 and esdqz2<6 then
esyqs="color:#88BB00;"&esyqs
else
esyqs="color:#0055BB;"&esyqs
end if
else
esyqs="font-size:12px;"
end if
end if
end Function
'-----------------------------------
'=esupcc(esfep,esfsn)
'保存到同频道|保存到同时间|保存到同频道同时间|上传到根目录
'-----------------------------------
Function esupcc(esfep,esfsn)
if aibj(esfep,s_udgg) then
esupcc=p_upifh&ew_sn&"/"&s_udgg&"/"&left(esfsn,4)&"/"
elseif p_upixy=0 then
esupcc=p_upifh&ew_sn&"/"&esfep&"/"
elseif p_upixy=1 then
esupcc=p_upifh&ew_sn&"/"&left(esfsn,4)&"/"
elseif p_upixy=2 then
esupcc=p_upifh&ew_sn&"/"&esfep&"/"&left(esfsn,4)&"/"
else
esupcc=p_upifh&ew_sn&"/"
end if
Response.Cookies(p_qs&"qz")=esupcc&esfsn&"_"'if no_ else into us_er dir
Response.Cookies(p_qs&"py")=ew_py
end Function
'-----------------------------------
'=esup("0|0|0|0|0|formsai|up|0|0|0|0.ees")
'-----------------------------------
Function esup(esfstr)
esup="<iframe class=""f-upfr"" src="""&eshref(i_dir&"AsaiUpLoad/?"&esfstr,3)&""" frameborder=0 scrolling=no></iframe>"
'esup=esup&"<a href=""javascript:;"" onclick='EES_Sincode(""<img scr=""+up.value+"">"")'>[插入编辑器]</a>"
End Function
'-----------------------------------
'=eshi("")
'-----------------------------------
Function eshi(esfty,esfid,esfhi)
eshi=eshi&"<script language=javascript src="&eshref(s_drplug&"AsaiHi/?"&esfty&"-"&esfid&"-"&ew_dj&".js",3)&"></script>"
if esfty=1 or esfty=2 or esfty=3 or esfty=5 or esfty=7 or esfty=8 or esfty=9 then eshi=eshi&"<script language=javascript src="&eshref(s_drplug&"AsaiHi/?111-"&esfid&"-"&ew_dj&".js",3)&"></script>"
End Function
'-----------------------------------
'Read str qq
'=esqq(esfstr/,=)
'-----------------------------------
Function esqq(esfstr)
esqq=""
if len(esfstr)>3 then
dim esqrr,esqi,esqud
esfstr=replace(esfstr,"|",",")
esqrr=split(esfstr,",")
esqud=ubound(esqrr)
if esqud>0 then
for esqi=0 to esqud
'if not ainull(esqrr(esqi)) then esqq=esqq&"<a target=""_blank"" href=""http://wpa.qq.com/msgrd?v=3&uin="&esqrr(esqi)&"&site="&e_tur&"&menu=yes"" title=""点击这里给1"&esqi&"号客服ＱＱ["&esqrr(esqi)&"]发送消息""><img border=""0"" src=""http://wpa.qq.com/pa?p=2:"&esqrr(esqi)&":46""></a>"
if not ainull(esqrr(esqi)) then esqq=esqq&"<a target=""_blank"" href=""http://wpa.qq.com/msgrd?v=3&uin="&esqrr(esqi)&"&site="&e_tur&"&menu=yes"" title=""点击这里给1"&esqi&"号客服ＱＱ["&esqrr(esqi)&"]发送消息""><img border=""0"" src="""&eshref(i_msk&"sys/qqonline.gif",3)&"""></a>"
next
else
esqq="<a href=""tencent://message/?uin="&esfstr&"&site="&w_mour&i_dir&"&menu=yes"" target=""_blank"" title=""点击这里给站长ＱＱ["&esfstr&"]发送消息""><img border=""0"" src="""&eshref(i_msk&"sys/qqonline.gif",3)&"""></a>"
end if
end if
End Function
'-----------------------------------
'Read str
'=esread(esfstr/,= /|=<br>)
'-----------------------------------
Function esread(esfstr)
esread=replace(replace(esfstr,","," "),"|","<br>　　　")
End Function
'-----------------------------------
'Read db ew
'=esrew(esftb,esfew)
'-----------------------------------
Function esrew(esftb,esfew)
esfew=aiint(esfew)
if esfew=0 then
esrew="6=6"
elseif esfew>10 then
if aibj(left(esfew,1),w_mosn) then
esrew="("&esftb&"_ew="&esfew&" or "&esftb&"_ew="&w_mosn&")"
else
esrew=""&esftb&"_ew="&esfew&""
end if
else
esrew=""&esftb&"_ew like '"&esfew&"%'"
end if
End Function
'-----------------------------------
'Read ef ep
'=esrfd(esfty,esfep,esfkj)
'-----------------------------------
Function esrfd(esfty,esfep,esfkj)
if aibj(left(esfep,len(esfkj)),esfkj) then
if esfty=1 then
esrfd="1"
else
esrfd=left(esfep,3)
end if
else
esrfd=esfep
end if
End Function
'-----------------------------------
'ming pian
'=esmp()
'-----------------------------------
Function esmp()
esmp="<div class=""l-sa""><ul>"
esmp=esmp&"<li class=""l-1""><strong>"&ew_mc&"</strong></li>"
if not ainull(ew_lq) then esmp=esmp&"<li class=""l-1"">"&esqq(ew_lq)&esqq(ew_ls)&"</li>"
if not ainull(ew_lr) then esmp=esmp&"<li>称呼："&ew_lr&"</li>"
if not ainull(ew_le) then esmp=esmp&"<li>邮箱："&esread(ew_le)&"</li>"
if not ainull(ew_lh) then esmp=esmp&"<li>电话："&esread(ew_lh)&"</li>"
if not ainull(ew_lc) then esmp=esmp&"<li class=""l-1"">传真："&esread(ew_lc)&"</li>"
if not ainull(ew_lj) then esmp=esmp&"<li class=""l-1"">手机："&esread(ew_lj)&"</li>"
if not ainull(ew_lz) then esmp=esmp&"<li class=""l-1"">地址："&esread(ew_lz)&"</li>"
if not ainull(ew_lb) then esmp=esmp&"<li class=""l-1"">邮编："&esread(ew_lb)&"</li>"
if not ainull(ew_lo) then esmp=esmp&"<li class=""l-1"">"&esread(ew_lo)&"</li>"
esmp=esmp&"</ul></div>"
End Function
'-----------------------------------
'=esfx("")
'-----------------------------------
Function esfx()
if i_xkafx=1 then
esfx="<div class=""bdsharebuttonbox""><a href=""#"" class=""bds_more"" data-cmd=""more""></a><a href=""#"" class=""bds_weixin"" data-cmd=""weixin"" title=""分享到微信""></a><a href=""#"" class=""bds_qzone"" data-cmd=""qzone"" title=""分享到QQ空间""></a><a href=""#"" class=""bds_tsina"" data-cmd=""tsina"" title=""分享到新浪微博""></a><a href=""#"" class=""bds_sqq"" data-cmd=""sqq"" title=""分享到QQ好友""></a><a href=""#"" class=""bds_tieba"" data-cmd=""tieba"" title=""分享到百度贴吧""></a><a href=""#"" class=""bds_tqq"" data-cmd=""tqq"" title=""分享到腾讯微博""></a><a href=""#"" class=""bds_youdao"" data-cmd=""youdao"" title=""分享到有道云笔记""></a><a href=""#"" class=""bds_mshare"" data-cmd=""mshare"" title=""分享到一键分享""></a><a href=""#"" class=""bds_mail"" data-cmd=""mail"" title=""分享到邮件分享""></a><a href=""#"" class=""bds_print"" data-cmd=""print"" title=""分享到打印""></a><a href=""#"" class=""bds_copy"" data-cmd=""copy"" title=""分享到复制网址""></a></div>"
e_js=e_js&"<script>window._bd_share_config={""common"":{""bdSnsKey"":{},""bdText"":"""",""bdMini"":""2"",""bdMiniList"":false,""bdPic"":"""",""bdStyle"":""1"",""bdSize"":""16""},""share"":{},""image"":{""viewList"":[""weixin"",""qzone"",""tsina"",""sqq"",""tieba"",""tqq"",""youdao"",""mshare"",""mail"",""print"",""copy""],""viewText"":""分享到："",""viewSize"":""16""},""selectShare"":{""bdContainerClass"":null,""bdSelectMiniList"":[""weixin"",""qzone"",""tsina"",""sqq"",""tieba"",""tqq"",""youdao"",""mshare"",""mail"",""print"",""copy""]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>"
end if
End Function
'-----------------------------------
'=esbq("")
'-----------------------------------
Function esbq(esqep,esqef,esqsn,esqus)
if ew_bq>0 then
if aireq("bqty")="1"  then
if e_gdj>2 and aibj("ok",aireq("bqyy")) then
eawhere="ai_sn='"&esqsn&"'"
Call gysdel(eabid,eabiao,eawhere)
Call eskod(11,0,esqep&g_apj&esnf(esqef)&g_apj&esqsn)
esbq=aigo("您已经成功删除本条信息。",eshref(esqep&g_urg&esnf(esqef)&g_urz,1))
elseif aireq("bqyy")<>"请输入您的删除理由" and aireq("bqyy")<>"" then
'into book 0
dim aneditwritetfso,aneditwritetfsop
Set aneditwritetfso=Server.CreateObject("Scr"&"ipt"&"ing.Fil"&"eSy"&"ste"&"mOb"&"j"&"ect")
Set aneditwritetfsop=aneditwritetfso.OpenTextFile(Server.MapPath(i_dir&s_drsys&"AsaiBook.txt"),8,True)
aneditwritetfsop.Write(""&esqsn&"("&e_uer&")["&now()&"]"&aireq("bqyy")&vbCrLf)
Set aneditwritetfsop=Nothing
Set aneditwritetfso=Nothing
'into book 1
Call aiks(0,"bq"&esqsn,"1",1)
esbq=aigo("请您等待编辑部处理。",eshref(esqep&g_urg&esnf(esqef)&g_urz,1))
else
esbq=aigo("对不起，请输入您的删除理由。",1)
end if
elseif aiks(0,"bq"&esqsn,"",2)="1" then
esbq="<div id=""esbq"" class=""pft b-b b-cq"" style=""height:1000px;""><p style=""font-size:12px;text-align:center;"">该条信息暂不公开，请等待编辑部处理。<br><a href="""&eshref(esqep&g_urz,1)&""">返回频道首页</a></p></div>"
else
esbq="<button class=""f-sb"" onclick=""esbq.style.display='block';"" title=""侵权？损坏您名誉了？没用的信息？不喜欢这条信息？......您可以选择删除！"">删除</button>"
esbq=esbq&"<div id=""esbq"" class=""pft b-b b-cq"" style=""display:none;""><div class=sy-k>"
esbq=esbq&"<p class=""tc b-cf"">申请删除ID："&esqsn&"</p>"
esbq=esbq&"<form method=post action="&eshref(esqep&g_urg&esnf(esqef)&g_urg&s_umxx&g_urg&esqsn&g_urz,1)&">"&aiinput("hidden","bqty","",0,0,"","","1")&aiinput("hidden","bqus","",0,0,"","",e_uer)&""
if aiint(e_uxy)=<aiint(ew_sh) then
esbq=esbq&""&aibuttonk(u_reg,"","","","f-sb f-skx","注册")&aibuttonk(u_login,"","","","f-sb f-skx","登录")&aibuttonk(u_user,"","","","f-sb f-skx","升级")&""
else
esbq=esbq&"<div class=""f-l""><li class=""sy-c10""><b>您的理由：</b><i><input class=""f-c"" type=text name=bqyy id=bqyy maxlength=50 value=""请输入您的删除理由"" onBlur=""this. type='text';if(this.value==''){this.value='请输入您的删除理由';}"" onFocus=""if(this.value=='请输入您的删除理由'){this.value='';}""></i></li><li class=""sy-c10""><b> </b><i><input type=submit value=确认删除 class=""f-sb f-skx""></i></li></div>"
end if
esbq=esbq&"</form>"
if e_gdj>2 then
esbq=esbq&"<p>须知：您拥有本信息管理权限，可以通过输入[ok]直接删除本条信息！</p>"
else
esbq=esbq&"<p>须知：为了保护发布者的权益，请您在注册后，登录会员中心，进行邮箱验证，完成自助升级操作后再来进行删除操作。<br>删除信息需要说明删除理由，信息删除操作在1-2个工作日内完成。<br>[￥紧急删除￥请联系在线客服："&esqq(ew_lq)&"]</p>"
end if
esbq=esbq&"<p class=tc><button class=""f-sb"" onclick=""esbq.style.display='none';"">关闭</button></p>"
esbq=esbq&"</div></div>"
end if
end if
End Function
'-----------------------------------
'=eskds()
'-----------------------------------
Function eskds()
eskds=""
if i_xkutj>0 then eskds=eskds&"<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(s_drplug&"AsaiCount/?counter"&i_xkutj&".js",3)&"""></script>"
if (i_xkutj>0 and i_xkutj<9) then eskds=eskds&"<br>"
if i_xkuzx>0 then eskds=eskds&"<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(s_drplug&"AsaiOnline/?1"&g_gz&""&e_uid&""&g_gz&""&e_uer&""&g_gz&""&g_gz&""&e_uxy&""&g_gz&""&replace(g_u,"Default.asp","")&"",3)&"""></script>"
eskds=eskds&"<a target=""_blank"" class=""y-n4"" href="""&eshref("map.html",1)&""">网站地图</a><a target=""_blank"" class=""y-n4"" href="""&eshref("ly/3/add.html",1)&""">建议反馈</a>"
if instr(lcase(g_ud)&"/",s_drwap)=0 then
eskds=eskds&"<a target=""_blank"" class=""y-n4"" href="""&eshref(s_drplug&"AsaiSiteMap/?SiteMap.xml",3)&""">Map</a><a target=""_blank"" class=""y-n4"" href="""&eshref(s_drplug&"AsaiRss/?rss.xml",3)&""">Rss</a><a target=""_blank"" class=""y-n4"" href="""&eshref(s_drplug&"AsaiXml/?Xml.xml",3)&""">Xml</a>"
end if
eskds=eskds&"<a class=""y-n4"" href=""javascript:scroll(0,0);"">回到顶部</a><p align=center><script src=http://x.780.pub/js/_link.js></script></p>"
End Function
'-----------------------------------
'=eskjs()
'-----------------------------------
Function eskjs()
eskjs=""
if i_xkalt=1 then eskjs=eskjs&"<script language=""JavaScript"">var eesaialtsx="&aiint(ep_sx)&";</script><script language=""JavaScript"" charset=""utf-8"" src="""&w_asai&i_msk&"js/alt.js""></script>"
if aiint(ew_vg)>0 and instr(lcase(g_ud)&"/",s_drwap)=0 then eskjs=eskjs&"<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(ew_sk&"js/bg.js",3)&"""></script>"
if p_upixn=2 then
eskjs=eskjs&"<script language=""JavaScript"" charset=""utf-8"" src="""&w_asai&i_msk&"js/nopic/nopic.js""></script>"
elseif p_upixn=1 and p_upijj<>"" and p_upwdu<>"" then
eskjs=eskjs&"<script language=""JavaScript"">var AsaiUImgs = document.getElementsByTagName(""img"");for(var AsaiUImgsi = 0;AsaiUImgsi<AsaiUImgs.length;AsaiUImgsi++){AsaiUImgs[AsaiUImgsi].src=AsaiUImgs[AsaiUImgsi].src.replace(/.*?"&replace(p_upijj,"/","\/")&".*?/gi,"""&p_upwdu&""");}</script>"
end if
eskjs=eskjs&eskch(0)&e_js
if ew_tj<>"" and ew_tj<>"0" then eskjs=eskjs&ew_tj
End Function
'-----------------------------------
'=escgn("")
'-----------------------------------
Function eskkf(esfstr)
if ew_tc>0 and instr(lcase(g_ud)&"/",s_drwap)=0 then
eskkf="<div id=""y-tp""><div class=""y-tp"">"
if ew_tc>1 then eskkf=eskkf&"<a class=""y-tpa"" target=""y-tpifr"" href="""&eshref(s_drplug&"AsaiQQ/?"&ew_lq&"|"&ew_ls&"|"&ew_lh&"",3)&""" onClick=""document.getElementById('y-tpc').style.display='block';document.getElementById('y-tpcx').style.display='block';document.getElementById('y-tpcx').innerHTML='X在线客服';""><b><span class=""glyphicon glyphicon-user""></span></b>客　服</a>"
if ew_tc>2 then eskkf=eskkf&"<a class=""y-tpa"" target=""y-tpifr"" href="""&eshref(s_drplug&"AsaiBook/",3)&""" onClick=""document.getElementById('y-tpc').style.display='block';document.getElementById('y-tpcx').style.display='block';document.getElementById('y-tpcx').innerHTML='X留言本';""><b><span class=""glyphicon glyphicon-send""></span></b>留言本</a>"
if ew_tc>3 then eskkf=eskkf&"<a class=""y-tpa"" target=""y-tpifr"" href="""&w_chat&"?"&w_sn&""" onClick=""document.getElementById('y-tpc').style.display='block';document.getElementById('y-tpcx').style.display='block';document.getElementById('y-tpcx').innerHTML='X聊天室';""><b><span class=""glyphicon glyphicon-comment""></span></b>聊天室</a>"
eskkf=eskkf&"<a class=""y-tpa"" href=""javascript:scroll(0,0);""><b><span class=""glyphicon glyphicon-plane""></span></b>TOP</a>"
if ew_tc>1 then eskkf=eskkf&"<span id=""y-tpcx"" onClick=""document.getElementById('y-tpc').style.display='none';document.getElementById('y-tpcx').style.display='none';"">X</span><div id=""y-tpc""><iframe id=""y-tpifr"" name=""y-tpifr"" frameborder=0 scrolling=auto></iframe></div>"
eskkf=eskkf&"</div></div>"
end if
End Function
'-----------------------------------
'=eskhf(1,"")
'-----------------------------------
Function eskhf(esfty,esfwid,esfhei)
if len(ew_p1)>3 and len(ew_p2)>3 then
if left(ew_p1,1)<>"/" and left(ew_p1,7)<>"http://" then ew_p1=eshref(ew_sk&"img/"&ew_p1,3)
if left(ew_p2,1)<>"/" and left(ew_p2,7)<>"http://" then ew_p2=eshref(ew_sk&"img/"&ew_p2,3)
if left(ew_p3,1)<>"/" and left(ew_p3,7)<>"http://" then ew_p3=eshref(ew_sk&"img/"&ew_p3,3)
if left(ew_p4,1)<>"/" and left(ew_p4,7)<>"http://" then ew_p4=eshref(ew_sk&"img/"&ew_p4,3)
if left(ew_p5,1)<>"/" and left(ew_p5,7)<>"http://" then ew_p5=eshref(ew_sk&"img/"&ew_p5,3)
if left(ew_p6,1)<>"/" and left(ew_p6,7)<>"http://" then ew_p6=eshref(ew_sk&"img/"&ew_p6,3)
eskhf="<div id=""banner""><div class=""banner"">"&icppt(ew_p1&g_gx&ew_p2&g_gx&ew_p3&g_gx&ew_p4&g_gx&ew_p5&g_gx&ew_p6,ew_u1&g_gx&ew_u2&g_gx&ew_u3&g_gx&ew_u4&g_gx&ew_u5&g_gx&ew_u6,ew_s1&g_gx&ew_s2&g_gx&ew_s3&g_gx&ew_s4&g_gx&ew_s5&g_gx&ew_s6,esfwid,esfhei,1,5,replace(ew_pg,"|",g_gx),"banner")&"</div></div>"
end if
End Function
'-----------------------------------
'=eskch(type)
'-----------------------------------
Function eskch(esfty)
if i_xkch=1 then
eskch=""
if esfty=0 then
if aiint(e_lonload)=0 then eskch="<script language=""JavaScript"" charset=""utf-8"" src="""&w_asai&i_msk&"js/chinese.js""></script>"
elseif esfty=1 then
eskch=eskch&"<a id=""AsaiGB"" href=""javascript:AsaiGB();void 0;"">繁體中文</a>"
end if
end if
End Function
'-----------------------------------
'=espr(0)
'-----------------------------------
Function espr(esfty)
espr=""
if i_xkuhy>1 and esfty=1 then espr=espr&"&nbsp;&nbsp;<a href="""&u_user&""" target=""_blank"">会员中心</a>"
End Function
'-----------------------------------
'escss
'=escss()
'-----------------------------------
Function escss()
'escss="<link rel=""stylesheet"" href=""/AsaiSkin/bootstrap/css/bootstrap.min.css""><link rel=""stylesheet"" href=""/AsaiSkin/bootstrap/css/bootstrap-theme.min.css""><script src=""/AsaiSkin/bootstrap/js/jquery-3.1.1.min.js""></scr"&"ipt>"
escss=""
escss=escss&"<link rel=""icon"" href="""&eshref(ew_sk&"img/favicon.ico",3)&""" mce_href="""&eshref(ew_sk&"img/favicon.ico",3)&""" type=""image/x-icon""><link rel=""shortcut icon"" href="""&eshref(ew_sk&"img/favicon.ico",3)&""" mce_href="""&eshref(ew_sk&"img/favicon.ico",3)&""" type=""image/x-icon""><link rel=""stylesheet"" type=""text/css"" rev=""stylesheet"" href="""&eshref(i_msk&"asai.css",3)&""">"
if len(request.Cookies(w_sn&ew_sn&"skin")&"1")=112 and i_xksk>1 then
escss=escss&"<link rel=""stylesheet"" type=""text/css"" rev=""stylesheet"" href="""&eshref(ew_sk&"sys.css",3)&""">"
escss=escss&"<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(s_drplug&"AsaiSkinColor/?cssees",3)&"""></script>"
else
if aibj(ew_sk,i_msk) then
escss=escss&"<link rel=""stylesheet"" type=""text/css"" rev=""stylesheet"" href="""&eshref(ew_sk&"asaisyscss.css",3)&""">"
elseif i_xksk=1 or i_xksk=3 then
escss=escss&"<link rel=""stylesheet"" type=""text/css"" rev=""stylesheet"" href="""&eshref(ew_sk&"asaisyscss_.css",3)&""">"
elseif anfilecheck(eshref(ew_sk&"asaisyscss_.css",3)) then
escss=escss&"<link rel=""stylesheet"" type=""text/css"" rev=""stylesheet"" href="""&eshref(ew_sk&"asaisyscss_.css",3)&""">"
else
'更新系统css
escss=escss&"<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(s_drplug&"AsaiSkinColor/?css-ees",3)&"""></script>"
end if
escss=escss&"<link rel=""stylesheet"" type=""text/css"" rev=""stylesheet"" href="""&eshref(ew_sk&"sys.css",3)&""">"
end if
End Function
'-----------------------------------
'top login user
'=esuser()
'-----------------------------------
Function esuser()
if i_xkuhy>1 then esuser="<script language=""JavaScript"" charset=""utf-8"" src="""&eshref(s_drplug&"AsaiLogin/",3)&"""></sc"&"ript>"
End Function
'-----------------------------------
'top user left link
'=eskul()
'-----------------------------------
Function eskul()
eskul=""
eskul=eskul&"<li><a title=""返回主页"" href="""&eshref("index",1)&"""><span class=""glyphicon glyphicon-home""></span> 主页</a></li>"&esuser()
End Function
'-----------------------------------
'top kj link
'=eskjl()
'-----------------------------------
Function eskjl()
eskjl=""
if instr(lcase(g_ud)&"/",s_drwap)>0 then
if ewxlt() then eskjl="<li><a href="""&eshref(s_drwap&"?bbs.html",3)&"""><span class=""glyphicon glyphicon-comment""></span> 进入论坛</a></li>"
else
eskjl=eskjl&"<li class=""y-ta""><a href=""""><span class=""glyphicon glyphicon-briefcase""></span> 工具箱 <span class=""caret""></span></a><div class=""y-tac"">"
eskjl=eskjl&""&eskch(1)
if ew_sz>0 then eskjl=eskjl&"<br><a href="""&eshref("so.html",1)&""">高级搜索</a>"
if i_xksk>1 then eskjl=eskjl&"<br><a href="""&eshref(s_drplug&"AsaiSkinColor/?csseesai",3)&""">自拟色彩</a>"
if w_chat<>"" then eskjl=eskjl&"<br><a target=_blank href="""&eshref(w_chat&"?"&w_sn&"",3)&""">在线聊天</a>"
eskjl=eskjl&"</div></li>"
eskjl=eskjl&"<li><a href=""http://"&g_uhost&g_uurl&"wap/"&"?"&g_ustring&"""><span class=""glyphicon glyphicon-phone""></span> 手机版</a></li>"
eskjl=eskjl&"<li><a href="""&eshref("map.html",1)&"""><span class=""glyphicon glyphicon-map-marker""></span> 导航</a></li>"
if ewxlt() then eskjl=eskjl&"<li><a href="""&eshref("bbs.html",1)&"""><span class=""glyphicon glyphicon-comment""></span> 论坛</a></li>"
end if
End Function
'-----------------------------------
'top logo
'=eslogo()
'-----------------------------------
Function eslogo()
if len(ew_ig)>3 then
eslogo=eslogo&"<a href="""&ew_il&""" target=""_blank"" title="""&ew_is&"""><img src="""&eshref(ew_sk&"img/"&ew_ig&"",3)&""" alt="""&ew_is&"""></a>"
else
eslogo=eslogo&"<a href="""&ew_il&""" target=""_blank"" title="""&ew_is&"""><b>"&ew_mc&"</b></a>"
end if
End Function
'-----------------------------------
'top logo menu
'=eslogomenu(link|标题1|link2|标题2)
'-----------------------------------
Function eslogomenu(esfstr)
eslogomenu="<span class=""y-im"">"
if esfstr<>"" then
dim esdlgmurr,esdlgmud,esdlgmui,esdlgmum
esdlgmurr=split(esfstr,"|")
esdlgmud=ubound(esdlgmurr)
if esdlgmud>0 then
for esdlgmui=0 to esdlgmud
esdlgmum=esdlgmurr(esdlgmui)
eslogomenu=eslogomenu&""
if aibj(left(esdlgmum,len(g_u0)),g_u0) and aibj(right(esdlgmum,12),right(g_ustring,12)) then
eslogomenu=replace(eslogomenu,"y-ian","y-ia")
if esdlgmum<>"" then eslogomenu=eslogomenu&"<a class=""y-ian"" href="""&eshref(esdlgmum,1)&""" target=""_blank"">"
eslogomenu=eslogomenu&esdlgmurr(esdlgmui+1)
if esdlgmum<>"" then eslogomenu=eslogomenu&"</a>"
elseif aibj(esdlgmum,g_u0) then
if esdlgmum<>"" then eslogomenu=eslogomenu&"<a class=""y-ian"" href="""&eshref(esdlgmum,1)&""" target=""_blank"">"
eslogomenu=eslogomenu&esdlgmurr(esdlgmui+1)
if esdlgmum<>"" then eslogomenu=eslogomenu&"</a>"
else
if esdlgmum<>"" then eslogomenu=eslogomenu&"<a class=""y-ia"" href="""&eshref(esdlgmum,1)&""" target=""_blank"">"
eslogomenu=eslogomenu&esdlgmurr(esdlgmui+1)
if esdlgmum<>"" then eslogomenu=eslogomenu&"</a>"
end if
esdlgmui=esdlgmui+1
next
end if
end if
eslogomenu=eslogomenu&"</span>"
End Function
'-----------------------------------
'top logo ad
'=eslogoad()
'-----------------------------------
Function eslogoad(esfstr)
eslogoad="<a href="""&ew_tl&""" target=""_blank"" title="""&ew_ts&"""><img src="""&eshref(ew_sk&"img/"&ew_tg&"",3)&""" alt="""&ew_ts&"""></a>"
End Function
'-----------------------------------
'Search
'=esso(esfstr0=sn1|标题1|sn2|标题2,关键词)
'-----------------------------------
Function esso(esfstr,esfek)
'+++++++++++++++++++++++++++teshu!
if ew_sz=1 and not aibj(esfstr,"0") then
esso=esso&"<div class=""y-st"">"
if not aibj(s_ztkm,aireq("s")) and not ainull(aireq("s")) then
'response.Redirect(eshref(s_umxx&g_urg&aijia(aireq("s"))&g_urz&"",1))
dim esodur
if aibj(s_umso,aireq("t"))  then
esodur=eshref(s_umso&g_urg&s_umlpw&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&aijia(aireq("s"))&g_urz&"",55)
else
esodur=eshref(aireq("t")&g_urg&s_umqb&g_urg&""&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&"0"&g_urg&aijia(aireq("s"))&g_urz&"",55)
end if
if instr(lcase(g_ud)&"/",s_drwap)>0 then
if left(esodur,1)="/" then esodur=right(esodur,len(esodur)-1)
esodur=i_dir&s_drwap&esodur
end if
response.Redirect(esodur)
end if
dim esoodarr,esoodi,esoodcs,esoodud
esoodcs=""
if ainull(esfstr) then
esso=esso&"<span class=""y-san"" id=""t"&s_umso&""" onMouseOver=""esobt('"&s_umso&"')"">全站搜索</span>"
else
esoodarr=split(esfstr,"|")
esoodud=ubound(esoodarr)
if esoodud>0 then
esso=esso&"<span class=""y-san"" id=""t"&s_umso&""" onMouseOver=""esobt('"&s_umso&"')""><a href="""&e_tur&""">全站</a></span>"
esoodcs="document.getElementById('t"&s_umso&"').className='y-sa';"
for esoodi=0 to esoodud
esso=esso&"<span class=""y-sa"" id=""t"&esoodarr(esoodi)&""" onMouseOver=""esobt('"&esoodarr(esoodi)&"')""><a href="""&eshref(esoodarr(esoodi),1)&""">"&esoodarr(esoodi+1)&"</a></span>"
esoodcs=esoodcs&"document.getElementById('t"&esoodarr(esoodi)&"').className='y-sa';"
esoodi=esoodi+1
next
end if
end if
if esfstr="7" then
esso="<div class=""y-s"">"
else
esso="<div class=""y-s"">"&esso
end if
esso=esso&"<div class=""y-sf""><form name=""y-sf"" action="""
if instr(lcase(g_ud)&"/",s_drwap)>0 then
esso=esso&i_dir&s_drwap
else
esso=esso&i_dir
end if
esso=esso&"?index.html"" method=""post"">"
esso=esso&"<input class=""y-sfs"" type=""submit"" value=""搜索""><input type=""hidden"" name=""t"" id=""t"" value="""&s_umso&"""><input class=""y-sfi"" title="""&s_ztkm&",点击查询按钮进行快速查询."" onclick=""this.className='y-sfi1';"" type=""text"" id=""s"" name=""s"" value="""&s_ztkm&""" onBlur=""this.className='y-sfi';if(this.value==''){this.value='"&s_ztkm&"';}"" onFocus=""if(this.value=='"&s_ztkm&"'){this.value='';}"">"
esso=esso&"</form></div>"
if not ainull(esfek) then esso=esso&"<div class=""y-sfk"">"&esfek&"</div>"
esso=esso&"</div>"
if not ainull(esoodcs) then
esso=esso&"<script>function esobt(esofid){"
esso=esso&esoodcs
esso=esso&"document.getElementById('t'+esofid+'').className='y-san';"
esso=esso&"document.getElementById('t').value=esofid;"
esso=esso&"}"
if not ainull(g_u0) and not aibj("index",g_u0) then
if instr(esfstr,g_u0&"|")>0 then
esso=esso&"esobt('"&g_u0&"');"
end if
end if
if not ainull(icvss) then esso=esso&"document.getElementById('s').value='"&icvss&"';"
esso=esso&"</script>"
end if
esso=esso&"</div>"
end if
End Function
'-----------------------------------
'essame
'=essame()
'-----------------------------------
Function essame(esfzc,esfurs,esfmoz)
if aiint(esfzc)<1 then
dim esdurs
esdurs=replace(replace(replace(replace(esfurs,i_dir,""),g_urz,""),g_urg,""),"?","")
esfmoz=replace(replace(replace(replace(esfmoz,i_dir,""),g_urz,""),g_urg,""),"?","")
if ainull(esdurs) or aibj(esdurs,"index") or aibj(esdurs,"default") then
if ainull(esfmoz) or aibj(esfmoz,"index") or aibj(esfmoz,"default") then
essame=true
else
essame=false
end if
else
if len(esdurs)>len(esfmoz) then
if aibj(esfmoz,left(esdurs,len(esfmoz))) then
essame=true
else
essame=false
end if
else
if aibj(esdurs,left(esfmoz,len(esdurs))) then
essame=true
else
essame=false
end if
end if
end if
end if
End Function
'-----------------------------------
'=esxpl(esfty,esfsn)
'-----------------------------------
Function esxpl(esfty,esfsn)
dim esdxt
if esfty=1 then
esdxt=bb_xt
'esdxt=gysro("bb_xt","ees_bb","bb_sn='"&esfsn&"'","")
else
esdxt=ai_xt
'esdxt=gysro("ai_xt","ees_ai","ai_sn='"&esfsn&"'","")
end if
if (instr(esdxt,e_uer)>0 and not ainull(e_uer)) or instr(esdxt,aiip())>0 then
esxpl=true
else
esxpl=false
end if
End Function
'-----------------------------------
'es edit
'=esxbj()
'-----------------------------------
Function esxbj(eafep,eafxy,eafus,eafum)
esxbj=false
if e_gdj>2 then
esxbj=true
elseif (not ainull(e_uer) and aibj(e_uer,ai_us) or (not ainull(ai_um) and aibj(aiip(),ai_um))) then
if not ainull(eafep) and eafxy<2 then esxbj=true
end if
End Function
'-----------------------------------
'=esxup(esfty,esfup,esfnr)
'-----------------------------------
Function esxup(esfty,esfup,esfnr)
if not ainull(esfup) then
if esfty=0 or left(esfty,1)=1 then
'response.Write esfnr&"============="&esfup
if p_upixf=2 or (p_upixf=1 and instr(esfnr,esfup)=0) then
esxup="<div class=tc><img class=""o-im"" src="""&esups(esfup,1)&"""></div>"
end if
end if
end if
End Function
'-----------------------------------
'esmm
'=esmm(esfty)
'-----------------------------------
Function esmm(esfqx,esfty,esfjj,esfsn,esfbt,esfus,esfstr,esfurl,esfm0,esfm1)
'------------越权用户
if e_gdj>1 or (aibj(e_uer,esfus) and not ainull(e_uer)) or esfqx=0 then
esmm=replace(esfstr,"[eeSai]","")
else
esmm=""
'------------处理密钥
if esfm0<>"" and esfm0<>"0" and esfm0<>aimm(g_gmm,"0",0) then
if aibj(esfm1,esfm0) or (aibj(esfm1,ew_mma) and ew_mma<>"") or (aibj(esfm1,ew_mmb) and len(esfm0)<8 and ew_mmb<>"") or (aibj(esfm1,ew_mmc) and len(esfm0)<6 and ew_mmc<>"") or (aibj(esfm1,ew_mmd) and len(esfm0)<4 and ew_mmd<>"") then
esmm=""
elseif not ainull(esfurl) then
  if ainull(request.Form("mm")) then
  esmm="<table border=0 cellspacing=0 cellpadding=0 align=center width='66%'><form method=post action="&replace(esfurl,g_urg&g_gg&g_urz,g_urz)&"><tr><td align=center><input type=text name=mm id=mm maxlength=50 value="""&s_ztms&""" onBlur=""if(this.value==''){this.value='"&s_ztms&"';}"" onFocus=""if(this.value=='"&s_ztms&"'){this.value='';}"" class=f-a style='width:100%'></td><td align=left width=60><input type=submit value=解锁 class=f-sb style='width:100%'></td></tr></form></table>"
  else
  response.Redirect(replace(esfurl,g_urg&g_gg&g_urz,g_urg&request.Form("mm")&g_urz))
  response.End()
  end if
end if
end if
'------------密钥重复提示过滤
if esfty>4 then
e_lni=1
else
e_lni=e_lni+1
end if
'------------默认比对数量
if esfjj<1 then
if esfqx=5 then
esfjj=i_shjy
elseif esfqx=6 then
esfjj=i_shjd
elseif esfqx=7 then
esfjj=i_shjb
elseif esfqx=8 then
esfjj=i_shjq
end if
end if
'------------esfqx0开放浏览|1注册浏览|2审核浏览|3认证浏览|4高级浏览|5经验浏览|6等级浏览|7金币浏览|8金钱浏览
if esfqx=1 and e_uid=0 then
esmm=esmm&"<p class=""tc b-cq"">提示：限["&aiarr(i_bepqx,"|",esfqx)&"]，请 <a href="&u_login&">[登录]</a> 后访问。</p>"
elseif esfqx=2 and e_uxy=0 then
esmm=esmm&"<p class=""tc b-cq"">提示：限["&aiarr(i_bepqx,"|",esfqx)&"]，暂未审核状态，请重新<a href="&u_login&">[登录]</a>并<a href="&u_user&">[完善资料]</a> 可以提高审核几率。</p>"
elseif esfqx=3 and e_uzy<2 then
esmm=esmm&"<p class=""tc b-cq"">提示：限["&aiarr(i_bepqx,"|",esfqx)&"]，未通过网站认证，请重新<a href="&u_login&">[登录]</a>并<a href="&u_user&">[完善资料]</a> 可以提高认证几率。</p>"
elseif esfqx=4 and e_uzy<3 then
esmm=esmm&"<p class=""tc b-cq"">提示：限["&aiarr(i_bepqx,"|",esfqx)&"]，需要进行高级(商家)认证，请重新<a href="&u_login&">[登录]</a>并<a href="&u_user&">[完善资料]</a> 可以提高认证几率。</p>"
elseif esfqx=5 and e_ujy<esfjj then
esmm=esmm&"<p class=""tc b-cq"">提示：["&aiarr(i_bepqx,"|",esfqx)&"]，经验达"&esfjj&"才能浏览，您的经验为"&e_ujy&"，请重新<a href="&u_login&">[登录]</a>并通过参与点评、互动等活动可以获得经验。</p>"
elseif esfqx=6 and e_ujd<esfjj then
esmm=esmm&"<p class=""tc b-cq"">提示：["&aiarr(i_bepqx,"|",esfqx)&"]，等级达"&esfjj&"才能浏览，您的等级为"&esfjj&"，请重新<a href="&u_login&">[登录]</a>并通过经验、金币的兑换可以提升账户等级。</p>"
elseif esfqx=7 then
if not uyxep(0,esfsn) then
esmm=esmm&"<p class=""tc b-cq"">提示：["&aiarr(i_bepqx,"|",esfqx)&"]，本次浏览需要您支付"&esfjj&"个金币，您的金币为"&e_ujb&"个，<a href="&u_user&">[会员]</a>通过发帖、回帖、投稿等活动可以获得金币奖励。"
if aibj(aimm(g_gmm,esfm1,1),w_sn) then
esfbt=x_ddgx&esfus&x_ddga&esfsn&x_ddgb&esfjj&x_ddgb&"1"&x_ddgb&esfbt&x_ddgb&"47"
  if uykrd(0,esfsn,esfbt,esfus,esfjj) then
  Response.Redirect(replace(esfurl,g_urg&g_gg&g_urz,g_urz))
  else
  esmm=esmm&"<br>支付出现未知问题，请返回重试！"
  end if
else
if e_ujb>=esfjj and not ainull(esfurl)  then esmm=esmm&"<br ><button type=""button"" class=""f-sb f-sbxx"" onclick=""{if(confirm('支付"&esfjj&"个金币浏览，请确认此操作！')){javascript:window.location.href='"&replace(esfurl,g_urg&g_gg&g_urz,g_urg&w_sn&g_urz)&"';return true;}return false;}""><span class=""glyphicon glyphicon-shopping-cart""></span> 支付"&esfjj&"个金币浏览</button>"
end if
esmm=esmm&"</p>"
end if
elseif esfqx=8 then
if not uyxep(1,esfsn) then
esmm=esmm&"<p class=""tc b-cq"">提示：["&aiarr(i_bepqx,"|",esfqx)&"]，本次浏览需要您支付"&esfjj&"元钱，您的金钱为"&e_ujq&"元，<a href="&u_user&">[会员]</a>通过充值、交易可以获得金钱。"
if aibj(aimm(g_gmm,esfm1,1),w_sn) then
esfbt=x_ddgx&esfus&x_ddga&esfsn&x_ddgb&esfjj&x_ddgb&"1"&x_ddgb&esfbt&x_ddgb&"48"
  if uykrd(1,esfsn,esfbt,esfus,esfjj) then
  Response.Redirect(replace(esfurl,g_urg&g_gg&g_urz,g_urz))
  else
  esmm=esmm&"<br>支付出现未知问题，请返回重试！"
  end if
else
if aiint(e_ujq)>=esfjj and not ainull(esfurl) then esmm=esmm&"<br ><button type=""button"" class=""f-sb f-sbxx"" onclick=""{if(confirm('支付"&esfjj&"元钱浏览，请确认此操作！')){javascript:window.location.href='"&replace(esfurl,g_urg&g_gg&g_urz,g_urg&w_sn&g_urz)&"';return true;}return false;}""><span class=""glyphicon glyphicon-shopping-cart""></span> 支付"&esfjj&"元钱浏览</button>"
end if
esmm=esmm&"</p>"
end if
elseif esfqx=9 and esfty<5 then'内容点评验证
if not esxpl(0,esfsn) then
esmm=esmm&"<p class=""tc b-cq"">提示：需要在<a target=""_blank"" href="""&eshref(ai_ep&g_urg&ai_ef&g_urg&s_umzs&g_urg&esfsn&g_urz,66)&""">[展示]</a>页，参与点评才能浏览。</p>"
end if
elseif esfqx=9 and esfty>4 then'论坛点评验证
if not esxpl(1,esfsn) then
esmm=esmm&"<p class=""tc b-cq"">提示：需要在<a target=""_blank"" href="""&eshref(s_udbb&g_urg&bb_ef&g_urg&s_umzs&"2"&g_urg&esfsn&g_urz,66)&""">[展示]</a>页，参与点评才能浏览。</p>"
end if
elseif esfqx=10 then'参贴浏览
if not bbxre(0,esfsn) then
esmm=esmm&"<p class=""tc b-cq"">提示：需要在展示页，参与本帖回复才能浏览。</p>"
end if
elseif esfqx=11 then'回复浏览
if not bbxre(1,esfsn) then
esmm=esmm&"<p class=""tc b-cq"">提示：需要在<a target=""_blank"" href="""&eshref(s_udbb&g_urg&bb_ef&g_urg&s_umzs&"2"&g_urg&esfsn&g_urz,66)&""">[展示]</a>页，回复当前贴才能浏览。</p>"
end if
end if
'------------处理内容
if esmm="" then
esmm=replace(esfstr,"[eeSai]","")
'已经读出|esfty0=ai显内+显提|1=ai不显内+显提|2=ai显内+不显提|3=ai不显内+不显提|5=bb显内+显提|6=bb不显内+显提|7=bb显内+不显提|8=bb不显内+不显提
else
dim esfstrlen
  if esfty=3 or esfty=8 then
  esmm=""
  elseif esfty=1 or esfty=6 then
  if e_lni>1 then esmm=""
  else
	if instr(esfstr,"[eeSai]")>0 then
	  if e_lni=1 and (esfty=0 or esfty=5) then
	  esmm=split(esfstr,"[eeSai]")(0)&"..."&esmm
	  else
	  esmm=split(esfstr,"[eeSai]")(0)&"..."
	  end if
	else
	esfstr=trim(aitit(esfstr))
	esfstrlen=len(esfstr)
	  if esfstrlen>0 then
		if e_lni=1 and (esfty=0 or esfty=5) then
		if aiint(ep_qx)>0 then
		esmm=ep_mc&" 的内容需要一定的权限，您暂时无权浏览..."&esmm
		else
		esmm=left(esfstr,int(esfstrlen/3))&"..."&esmm
		end if
		else
		esmm=left(esfstr,int(esfstrlen/3))&"..."
		end if
	  end if
	end if
  end if
end if
'response.Write esmm&"|"&esfty
end if
End Function
'-----------------------------------
'pinglun show
'=esplshow(esfstr)
'-----------------------------------
dim essl
Function esplshow(esfstr)
dim fdclo,fdhei
dim esplar,esplrr,espli,esplsm,esplsl,esplsll,esplsy,esplsp,esplsg
if esfstr<>"" then
esplar=split(esfstr,i_gx)
for espli=1 to ubound(esplar)
'------------------------------------0CHAT & PL
esplsm=""
esplsll=""
e_psl=""
esplrr=split(esplar(espli)&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg&i_gg,i_gg)
if esplrr(0)="" then'普通聊天
if not ainull(esplrr(4)) then
if esplrr(2)=aiip() or (esplrr(8)=e_uer and e_uer<>"") or (esplrr(8)=e_ubt and e_ubt<>"") or (esplrr(7)=e_uer and e_uer<>"") then
'if  (esplrr(8)=e_uer and e_uer<>"") or (esplrr(6)=e_uer and e_uer<>"")  or (esplrr(8)=e_ubt and e_ubt<>"") or (esplrr(7)=e_uer and e_uer<>"") or (esplrr(6)=e_uer and e_uer<>"") then
esplsy=" m"
esplsp="r"
else
esplsy=" n"
esplsp="l"
end if
esplsl="<p class="&esplsp&">"
esplsl=esplsl&"<b title='"&esplrr(7)&"("&esplrr(2)&")'>"
if esplrr(8)<>"" then
esplsm=esplrr(8)
elseif esplrr(7)<>"" then
esplsm=esplrr(7)
elseif esplrr(2)<>"" then
esplsm=esplrr(2)
else
esplsm=""
end if
esplsg=esplshowbtn(esplrr(1),esplrr(7),esplsm,esplrr(9))
esplsl=esplsl&esplsm
if esplrr(6)<>"" then esplsl=esplsl&" @"&esplrr(6)
esplsl=esplsl&"</b>"
if esplrr(3)<>"" then esplsl=esplsl&"<i>"&trim(replace(esplrr(3),date(),""))&"</i>"
if esplsg<>"" then esplsl=esplsl&"<span id=""g"&espli&""" class=g>"&esplsg&"</span>"
esplsl=esplsl&"</p>"
'盖楼处理00
if i_xkugl=2 then
esplsl=esplsl&esplshows(esplrr(8),esplrr(6),esplrr(7),esplrr(4))
if esplrr(5)<>"" then
Execute("esplsll=S_"&esplrr(5)&"")
esplsl=esplsl&esplsll
end if
Execute("dim S_"&esplrr(1)&":S_"&esplrr(1)&"=""<div class='f-"&aiint(esplrr(9))&esplsy&"'>""&esplsl&""</div>""")
elseif i_xkugl=1 then
if esplrr(5)<>"" then
Execute("esplsll=S_"&esplrr(5)&"")
end if
Execute("dim S_"&esplrr(1)&":S_"&esplrr(1)&"=""<div class='f-"&aiint(esplrr(9))&esplsy&"'>""&esplsl&esplshows(esplrr(8),esplrr(6),esplrr(7),esplrr(4))&""</div>""")
esplsl=esplsl&esplshows(esplrr(8),esplrr(6),esplrr(7),esplrr(4))&esplsll
elseif i_xkugl=0  then
'if esplrr(5)<>"" then
'esplsll="<i># "&esplrr(5)&" </i>"
'else
'esplsll=""
'end if
esplsl=esplsl&esplsll&esplshows(esplrr(8),esplrr(6),esplrr(7),esplrr(4))
end if
'盖楼处理01
if essl="" or  (essl="1" and (esplrr(6)=e_uer or esplrr(7)=e_uer)) then e_psl=e_psl&"<li class='f-"&aiint(esplrr(9))&esplsy&"'>"&esplsl&"</li>"
end if
e_pss=e_pss&e_psl
e_psa=e_psa&e_psl
elseif left(esplrr(0),1)="!" then'收藏
e_psci=e_psci+1
e_psc=e_psc&"<a target=_ablank href="""&eshref(s_udus&g_urg&s_umzs&g_urg&replace(esplrr(0),"!","")&g_urz,66)&""">"&replace(esplrr(0),"!","")&"</a>"
else'系统消息
esplsl=""
if esplrr(2)<>"" then esplsl=esplsl&"<b>"&esplrr(2)&"</b>"
if esplrr(3)<>"" then esplsl=esplsl&"<i>"&trim(replace(esplrr(3),date(),""))&"</i>"
if esplrr(4)<>"" then esplsl=esplsl&" "&esplrr(4)&""
if esplsl<>"" then
if esplrr(0)="g" then
e_psl=e_psl&"<li class='f-5 n'>"
elseif esplrr(0)="u" then
e_psl=e_psl&"<li class='f-2 n'>"
else
e_psl=e_psl&"<li class='f-0 n'>"
end if
e_psl=e_psl&"<p>"&esplsl&"</p></li>"
end if
e_psx=e_psx&e_psl
e_psa=e_psa&e_psl
end if
'------------------------------------1CHAT & PL
next
e_pss=esplshowbq(e_pss)
esplshow=""
if aiint(ew_sc)>0 and i_xkuhy>0 and e_psci>0 then e_pscs="<li id=""p-d"" class=""f-0 n"">共有 <b>"&e_psci&"</b> 人收藏："&e_psc&"</li>"
if e_psa<>"" then esplshow=esplshow&"<div class=""h-b""><ul>"&e_pscs&esplshowbq(e_psa)&"</ul></div>"
end if
End Function
'-----------------------------------
'content doing
'-----------------------------------
Function esplshows(esfmbt,esfybt,esfysn,esfstr)
if left(esfstr,1)="~" then
if esfmbt=e_ubt or esfmbt=e_uer or esfybt=e_ubt or esfybt=e_uer or esfysn=e_uer then
'if esfmbt=ch_qnc or esfybt=ch_qnc or esfysn=e_uer then
esplshows="<i class=s>[私聊]</i> "&right(esfstr,len(esfstr)-1)
else
esplshows="<i class=s>[私聊]</i>***"
end if
essl="1"
else
essl=""
esplshows=esfstr
end if
End Function
'-----------------------------------
'=esplshowbq(esfstr)
'-----------------------------------
Function esplshowbq(esfstr)
dim esplshowbqxp
Set esplshowbqxp=new RegExp'regular expression
esplshowbqxp.IgnoreCase=true'Ignore case
esplshowbqxp.Global=true'Search string matching for all text
esplshowbqxp.Pattern="\[(\d{1,10})\]"'Find E-mail link
if i_plqr<>"" then
esplshowbq=esplshowbqxp.replace(esfstr,"<img src='"&i_plqr&"$1.gif'>")
else
esplshowbq=esplshowbqxp.replace(esfstr,"")
end if
Set esplshowbqxp=nothing
End Function
'-----------------------------------
'esplshowbtn(esfbm,esfsn,esfmz,esfty)
'-----------------------------------
Function esplshowbtn(esfbm,esfsn,esfmz,esfty)
esplshowbtn=""
if aiint(e_uxy)>3 and aiint(esfty)<4 then
if esfbm<>"" then esplshowbtn=esplshowbtn&"<a href=""#x"" onclick=""document.getElementById('pl').value='##"&esfbm&"'"" title=删除>删</a>"
end if
if esfmz<>"" and esfmz<>e_uer and aiint(esfty)<5 then 
esplshowbtn=esplshowbtn&"<a href=""#x"" onclick=""document.getElementById('pl').value='@"&esfmz&" ~'"" title=私聊>私聊</a>"
if esfbm<>"" then esplshowbtn=esplshowbtn&"<a href=""#x"" onclick=""document.getElementById('pl').value='@"&esfmz&" #"&esfbm&" '"" title=回复>回复</a>"
esplshowbtn=esplshowbtn&"<a href=""#x"" onclick=""document.getElementById('pl').value='@"&esfmz&" '"" title=@Ta>@</a>"
end if
End Function
'-----------------------------------
'=espdbi()
'-----------------------------------
Function espdbi()
if w_dbty=0 then
espdbi="&"
else
espdbi="+"
end if
End Function
'-----------------------------------
'=espxx(esfstr)
'-----------------------------------
Function espxx(esfstr)
'i_gx&""&i_gg&1内容编码&i_gg&2发布IP&i_gg&3发表时间&i_gg&4发言内容&i_gg&5回复内容#编码&i_gg&6@某人&i_gg&7聊友编码sn&i_gg&8用户昵称bt&i_gg&9用户等级ty
dim esplip
esplip=usren(e_uer)
if ainull(esplip) then
esplip=aiip()
else
esplip=esplip&"("&aiip()&")"
end if
if aiint(e_gxy)>1 then
espxx=i_gx&"g"&i_gg&right(aisn(2),6)&i_gg&e_gmc&i_gg&now()&i_gg&esfstr
elseif aiint(e_uxy)>0 then
espxx=i_gx&"u"&i_gg&right(aisn(2),6)&i_gg&esplip&i_gg&now()&i_gg&esfstr
else
espxx=i_gx&"p"&i_gg&right(aisn(2),6)&i_gg&esplip&i_gg&now()&i_gg&esfstr
end if
End Function
'-----------------------------------
'=esplin()
'-----------------------------------
Function esplin(esfbiao,esfbxt,esfbid,esfid,esfhc,esfstr,esfty)
esplin=false
if not ainull(esfstr) then
if instr(esfbid,"id")>0 then
eawhere=""&esfbid&"="&aiint(esfid)&""
else
eawhere=""&esfbid&"='"&esfid&"'"
end if
Call saik(rs,"select "&esfbxt&" from "&esfbiao&" where "&eawhere&"",1,3)
if rs.eof and rs.bof then
else
dim esdrs,esdprr,esdprry,esdpi,esdpis,esdpslin
esdpslin=""
esdrs=rs(esfbxt)
if s_ztpx>0 then esdrs=right(esdrs,s_ztpx)
if esfty="1" and not ainull(esdrs) and (aiint(e_uxy)>1 or aiint(e_gdj)>0) then
esdprr=split(esdrs,i_gx)
for esdpi=1 to ubound(esdprr)
esdpis=esdprr(esdpi)
if esdpis<>"" then
esdprry=split(esdpis&i_gg,i_gg)
if not aibj(esdprry(1),esfstr) then esdpslin=esdpslin&i_gx&esdpis
end if
next
rs(esfbxt)=esdpslin
rs.update
esplin=true
e_ma=e_ma&eskod(0,0,esfhc)
elseif esfty="2" and not ainull(esdrs) then
if instr(esdrs,esfstr)>0 then
rs(esfbxt)=replace(esdrs,esfstr,"")
rs.update
esplin=true
e_ma=e_ma&eskod(0,0,esfhc)
end if
elseif esfty="0" then
rs(esfbxt)=esdrs&esfstr
rs.update
esplin=true
e_ma=e_ma&eskod(0,0,esfhc)
end if
end if
Call saig(rs)
end if
End Function
'-----------------------------------
'=espl()
'-----------------------------------
Function espl(esfxs,esfdm,esfur,esfid,esfpls,esfbiao,esfbxt,esfbid,esfhc)
'esfxs=0备忘录|1其他信息|2点评内容|3发布点评|4系统记录|5收藏夹\9一列样式
dim espdht,espdln,espdkg
espdht=28'form height
espdln=200'pl len
espdkg=icskg(ew_pl,ep_pl,ai_pl)
if i_xkuhy>0 and (espdkg or ew_sc>0 or aibj(esfbiao,"uu") or aibj(esfbiao,"un")) then
if ew_sc>0 and instr(esfxs,"5")>0 then
'sc 0
if e_uid>0 then
e_pscb=e_pscb&"<div class=""p-d""><form action="""&esfur&""" method=""post"">"
if ainull(esfpls) or instr(esfpls,i_gx&"!"&e_uer&"!")=0  then
e_pscb=e_pscb&"<button id=""actsc"" name=""actsc"" value=""1"" type=""submit"" class=""p-e""><span class=""glyphicon glyphicon-star""></span> 加入收藏</button>"
else
e_pscb=e_pscb&"<button id=""actsc"" name=""actsc"" value=""2"" type=""submit"" class=""p-e""><span class=""glyphicon glyphicon-star-empty""></span> 取消收藏</button>"
end if
e_pscb=e_pscb&"</form></div>"
if aireq("actsc")="1" then
if instr(esfpls,i_gx&"!"&e_uer&"!")=0 then
if esplin(esfbiao,esfbxt,esfbid,esfid,esfhc,i_gx&"!"&e_uer&"!",0) then
if i_xkuhy>0 and g_u<>"" and e_uer<>"" then Call gysin("ees_uj","uj_us,uj_ty,uj_co,uj_tm","'"&e_uer&"',0,'"&g_u&"','"&now()&"'","uj_co='"&g_u&"'")
e_pscb=e_pscb&aigo(s_ztcg&"已加入收藏！",esfur)
end if
end if
elseif aireq("actsc")="2" then
if instr(esfpls,i_gx&"!"&e_uer&"!")>0 then
if esplin(esfbiao,esfbxt,esfbid,esfid,esfhc,"!"&e_uer&"!",2) then
if i_xkuhy>0 and ewxgn("uj") and g_u<>"" and e_uer<>"" then Call gysdel("uj_id","ees_uj","uj_co='"&g_u&"'")
e_pscb=e_pscb&aigo(s_ztcg&"已取消收藏！",esfur)
end if
end if
end if
end if
'sc 1
end if

if espdkg and instr(esfxs,"3")>0 then
if aireqx("pl") and not aibj(aireq("pl"),s_ztps) and len(aireq("pl"))<i_nmpl then
if esky(1,e_uzy) then
if left(aireq("pl"),2)="##" then
if not ainull(esfhc) and esplin(esfbiao,esfbxt,esfbid,esfid,esfhc,replace(aireq("pl"),"##",""),1) then e_psb=e_psb&aigo("删除评论#"&replace(aireq("pl"),"##","")&s_ztcg,esfur)
else
if aiint(aiks(i_xkhc,cstr(i_hccpl&esfid),"",2))>i_nmpc and e_uzy<i_xkyz then
e_psb=e_psb&aigo(s_ztpl&s_ztsb,esfur)
else
if not aibj(aiks(i_xkhc,i_hccpl,"",2),aireq("pl")) then
Call aiks(i_xkhc,cstr(i_hccpl&esfid),cstr(aiint(aiks(i_xkhc,cstr(i_hccpl&esfid),"",2))+1),1)
dim eslpls,eslplshr,eslplshw
eslpls=replace(replace(replace(aireq("pl"),i_gg,""),i_gx,""),"!","！")'format
if left(eslpls,1)="@" then
eslplshr=replace(split(eslpls," ")(0),"@","")
eslpls=replace(eslpls,"@"&eslplshr&" ","")
end if
if left(eslpls,1)="#" then
eslplshw=replace(split(eslpls," ")(0),"#","")
eslpls=replace(eslpls,"#"&eslplshw&" ","")
end if
eslpls=i_gx&""&i_gg&right(aisn(2),6)&i_gg&aiip()&i_gg&now()&i_gg&eslpls&i_gg&eslplshw&i_gg&eslplshr
if aiint(e_uid)>0 then eslpls=eslpls&i_gg&e_uer&i_gg&e_uer&i_gg&e_uxy
esfpls=esfpls&eslpls
if not ainull(esfhc) and esplin(esfbiao,esfbxt,esfbid,esfid,esfhc,eslpls,0) then
if i_xkuhy>0 and i_xkuhj=1 and aiint(e_uid)>0 then
if gysgx(w_dbqz&"us","us_jy=us_jy+"&i_jcjy&"","us_id="&e_uid&"") then e_ma=e_ma&usergx(0,"jy",e_ujy+i_jcjy)
end if
e_psb=e_psb&aigo(s_ztpl&s_ztcg,esfur)
end if
end if
end if
end if
end if
end if
end if

if espdkg and instr(esfxs,"3")>0 then
e_psb=e_psb&"<div id=""h-i""><table class=""h-c"" align=""center"" border=""0"" cellspacing=""0"" cellpadding=""0"">"
e_psb=e_psb&"<tr class=""h-c1""><td onClick=""document.getElementById('h-f').style.display='block'"" onDblClick=""document.getElementById('h-f').style.display='none'"" width="""&int(espdht+2)&""" class=""h-f"" title=""单击打开表情 双击关闭表情""><img class=""h-h"" src="""&i_plqr&"1.gif""></td>"
e_psb=e_psb&"<form id=""AsaiForm"" name=""AsaiForm"" action="""&esfur&"#pl"" method=""post"">"
e_psb=e_psb&"<td colspan=""2""><input class=""h-d"" style=""height:"&espdht+2&"px;line-height:"&espdht+2&"px;"" title="""&s_ztps&"(1-"&espdln&"个字符)"" onClick=""this.className='h-d1';document.getElementById('h-f').style.display='none';"" type=""text"" id=""pl"" name=""pl"" value="""&s_ztps&""" onBlur=""this.className='h-d';if(this.value==''){this.value='"&s_ztps&"';}"" onFocus=""if(this.value=='"&s_ztps&"'){this.value='';}"" maxlength="""&espdln&"""></td>"
e_psb=e_psb&"<td width=""88""><input class=""h-e"" style=""height:"&espdht&"px;line-height:"&espdht&"px;"" type=""submit"" value="""&s_ztpl&"""></td>"
e_psb=e_psb&"</tr>"
e_psb=e_psb&"<tr"
if aiint(e_uxy)>aiint(i_xkyz) then e_psb=e_psb&" style=""display:none;"""
e_psb=e_psb&"><td colspan=""4"" class=""h-c2"">"&eskyx(0,1,0)&"</td></tr>"
e_psb=e_psb&"</form></table>"
e_psb=e_psb&"<div id=""h-f""><div id=""h-g""><script language=""JavaScript"">function Asaibqin(Asaibqva){if(document.getElementById('pl').value=="""&s_ztps&"""){document.getElementById('pl').value=Asaibqva;}else{document.getElementById('pl').value=document.getElementById('pl').value+Asaibqva;}}for(Asaibqi=1;Asaibqi<97;Asaibqi++){document.write(""<img class=h-h onMouseOut=\""this.className='h-h'\"" onMouseOver=\""this.className='h-h1'\"" src="&i_plqr&"""+Asaibqi+"".gif onclick=\""Asaibqin('[""+Asaibqi+""]')\"">"");}</script></div></div>"
e_psb=e_psb&"</div>"
end if

if instr(esfxs,"8")>0 then
Call esplshow(esfpls)
dim esplss
esplss=esplss&"<script type=""text/javascript"" language=""javascript"">function plsqgo(asoid){return document.getElementById(asoid);}function plsqmove(ason){if(ason==0){for(var plsqi=1;plsqi<=5;plsqi++){plsqgo('plsq'+plsqi).className='l-xta';plsqgo('plsqc'+plsqi).className='l-xcan';}plsqgo('plsq0').className='l-xtan';}else{for(var plsqi=1;plsqi<=5;plsqi++){plsqgo('plsq'+plsqi).className='l-xta';plsqgo('plsqc'+plsqi).className='l-xca';}plsqgo('plsq0').className='l-xta';plsqgo('plsq'+ason).className='l-xtan';plsqgo('plsqc'+ason).className='l-xcan';}}</script><div class=""l-x"">"
esplss=esplss&"<div class=""l-xt"">"
esplss=esplss&"<span class=""l-xtan"" id=""plsq0"" onmouseover=""plsqmove(0);""><a class=""l-xa"">"&esfdm&s_ztpt&"</a></span>"
esplss=esplss&"<span"
if instr(esfxs,"1")=0 then esplss=esplss&" style=""display:none;"""
esplss=esplss&" class=""l-xta"" id=""plsq1"" onmouseover=""plsqmove(1);""><a class=""l-xa"">其他信息</a></span>"
esplss=esplss&"<span"
if not espdkg or instr(esfxs,"2")=0 then esplss=esplss&" style=""display:none;"""
esplss=esplss&" class=""l-xta"" id=""plsq2"" onmouseover=""plsqmove(2);""><a class=""l-xa"">点评内容</a></span>"
esplss=esplss&"<span"
if not espdkg or instr(esfxs,"3")=0 then esplss=esplss&" style=""display:none;"""
esplss=esplss&" class=""l-xta"" id=""plsq3"" onmouseover=""plsqmove(3);""><a class=""l-xa"">发布点评</a></span>"
esplss=esplss&"<span"
if instr(esfxs,"4")=0 then esplss=esplss&" style=""display:none;"""
esplss=esplss&" class=""l-xta"" id=""plsq4"" onmouseover=""plsqmove(4);""><a class=""l-xa"">系统记录</a></span>"
esplss=esplss&"<span"
if not espdkg or  instr(esfxs,"5")=0 or ainull(e_pscb) then esplss=esplss&" style=""display:none;"""
esplss=esplss&" class=""l-xta"" id=""plsq5"" onmouseover=""plsqmove(5);""><a class=""l-xa"">收藏夹</a></span>"
esplss=esplss&"</div><div class=""l-xg""></div>"

esplss=esplss&"<div class=""l-xc"">"
esplss=esplss&"<div"
if instr(esfxs,"1")=0 then esplss=esplss&" style=""display:none;"""
esplss=esplss&" class=""l-xcan"" id=""plsqc1"">"
esplss=esplss&""
esplss=esplss&"</div>"
esplss=esplss&"<div"
if not espdkg or instr(esfxs,"2")=0 then esplss=esplss&" style=""display:none;"""
esplss=esplss&" class=""l-xcan"" id=""plsqc2"">"
if e_pss<>"" then esplss=esplss&"<div class=""h-a h-b"">"&e_pss&"</div>"
esplss=esplss&"</div>"
esplss=esplss&"<div"
if not espdkg or instr(esfxs,"3")=0 then esplss=esplss&" style=""display:none;"""
esplss=esplss&" class=""l-xcan"" id=""plsqc3"">"
esplss=esplss&""&e_psb&""
esplss=esplss&"</div>"
esplss=esplss&"<div "
if instr(esfxs,"4")=0 then esplss=esplss&" style=""display:none;"""
esplss=esplss&"class=""l-xcan"" id=""plsqc4"">"
if e_psx<>"" then esplss=esplss&"<div class=""h-a h-b"">"&e_psx&"</div>"
esplss=esplss&"</div>"
esplss=esplss&"<div"
if instr(esfxs,"5")=0 or ainull(e_pscb) then esplss=esplss&" style=""display:none;"""
esplss=esplss&" class=""l-xcan"" id=""plsqc5"">"
esplss=esplss&e_pscb&"<div id=""p-d"" class=""p-d h-b""><ul>"&e_pscs&"</ul></div>"
esplss=esplss&"</div>"
esplss=esplss&"</div></div>"
espl=esplss
else
if not ainull(esfpls) then
espl=espl&esplshow(esfpls)
else
  if aiint(ew_pz)>0 then
  espl=espl&"<div class=""h-b"">"'ping
  dim esdpzrr,esdpzk,esdpzj,esdpzi
  esdpzrr=split(s_ztpr,"||")
  Randomize
  esdpzj=int(ubound(esdpzrr)*Rnd)
  esdpzk=esdpzj-6
  if esdpzk<0 then esdpzk=0
  for esdpzi=esdpzk to esdpzj
  espl=espl&"<li class='f-0 n'><p class=l><b>匿名</b><i>"&now()-esdpzj-(esdpzi*2)&"</i></p>"&esdpzrr(esdpzi)&"</li>"
  next
  espl=espl&"</div>"
  else
  if espdkg then espl=espl&"<div class=""p-d"">"&s_ztpk&"</div>"
  end if
end if
espl=e_pscb&"<div class=""h-a""><li class=""c-h"">"&esfdm&s_ztpt&"</li>"&espl&e_psb&"</div>"
end if
end if
if not ainull(espl) and ubound(split(espl,"display:none;"))<8 then
espl="<a name=pl></a>"&espl
else
espl=""
end if
End Function
%>