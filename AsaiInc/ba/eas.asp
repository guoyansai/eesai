<%
'-----------------------------------
'eaupfm(eafty0=up/1up+m/2m,eaffm,eaffz,eafnm,eafmz,eafsn,eafstr,eafup)
'=eaupfm(8,"nr",ai_sn,ai_nr/"picname,picurl@@content",updir)
'&"eupmz.value=eafsn+""_""+eupi;"&vbcrlf&""_
'-----------------------------------
function eaupfm(eafty,eaffm,eaffz,eafnm,eafmz,eafsn,eafstr,eafup)
eaupfm="<div class=""f-upk"" id=""eupadiv"">"
if eafty<2 then
eaupfm=eaupfm&"<div>"
if len(eaffz&"0")>5 then
if len(eaffz&"0")=7 and left(eaffz,1)="n" then eaffz=i_dir&p_upijj&eaffz
eaupfm=eaupfm&"<img onClick=""EES_imgin(this.src);"" title=""单击插入编辑器"" class=""f-upsx"" id="""&eaffm&"img"" src="""&eaffz&""">"
else
eaupfm=eaupfm&"<img onClick=""EES_imgin(this.src);"" class=""f-upsx"" id="""&eaffm&"img"" src="""&i_dir&p_upijj&"no.jpg"">"
end if
eaupfm=eaupfm&"<br><input type=""text"" onKeyUp="""&eaffm&"img.src=this.value"" placeholder=""图片地址"" name="""&eaffm&""" id="""&eaffm&""" class=""f-up"" value="""&eaffz&"""><br>"&esup("0|1|"&eafsn&"|"&eafup&"|0|AsaiForm|"&eaffm&"|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees")&"</div>"
end if
if eafty>0 then
eaupfm=eaupfm&"<input type=""hidden"" name="""&eafmz&""" id="""&eafmz&"__"" value=""@@"">"
eaupfm=eaupfm&esupr(1,eafstr)
eupdmj=0
if aiint(eupdmud)>2 then
for eupdmi=0 to aiint(eupdmud)-1 step 2
eupdmj=eupdmj+1
eaupfm=eaupfm&"<div><img onClick=""EES_imgin(this.src);"" title=""单击插入编辑器"" class=""f-ups"" id="""&eafmz&eupdmj&"img"" src="""&trim(eupdmrr(eupdmi+1))&"""><br><input type=""text"" placeholder=""图片名称"" name="""&eafmz&""" id="""&eafmz&"_"&eupdmj&""" class=""f-up"" value="""&trim(eupdmrr(eupdmi))&"""><br><input onKeyUp="""&eafmz&eupdmj&"img.src=this.value"" type=""text"" placeholder=""图片地址"" name="""&eafmz&""" id="""&eafmz&eupdmj&""" class=""f-up"" value="""&trim(eupdmrr(eupdmi+1))&"""><br>"&esup("0|1|"&eafsn&"_"&eupdmj&"|"&eafup&"|0|AsaiForm|"&eafmz&eupdmj&"|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees")&"</div>"
next
end if
eaupfm=eaupfm&"</div>"&vbcrlf
if eafnm>eupdmj then eupdmj=eafnm
eaupfm=eaupfm&"<script language=""javascript"">"&vbcrlf&""_
&"var eupi="&eupdmj&";"&vbcrlf&""_
&"function eupadd(eafmz,eafsn){"&vbcrlf&""_
&"eupi=eupi+1;"&vbcrlf&""_
&"var eupv1=document.getElementById(""eupadiv"");"&vbcrlf&""_
&"var eupv=document.createElement(""div"");"&vbcrlf&""_
&"eupv1.appendChild(eupv);"&vbcrlf&""_

&"var eupimg=document.createElement(""img"");"&vbcrlf&""_
&"eupimg.src="""&i_dir&p_upijj&"no.jpg"";"&vbcrlf&""_
&"eupimg.className=""f-ups"";"&vbcrlf&""_
&"eupimg.id=eupimg.name=eafmz+eupi+""img"";"&vbcrlf&""_
&"eupimg.onClick=""EES_imgin(eupimg.src)"""&vbcrlf&""_
&"eupv.appendChild(eupimg);"&vbcrlf&""_

&"var eupbt=document.createElement(""input"");"&vbcrlf&""_
&"eupbt.type=""button"";"&vbcrlf&""_
&"eupbt.id=eupbt.name=""btn""+eupi;"&vbcrlf&""_
&"eupbt.className=""f-sb f-upb"";"&vbcrlf&""_
&"eupbt.value=""删除"";"&vbcrlf&""_
&"eupbt.onclick=function(){"&vbcrlf&""_
&"var eupbx=document.getElementById(eupbt.id);"&vbcrlf&""_
&"eupv.removeChild(eupbx.previousSibling);//删除上一个"&vbcrlf&""_
&"eupv.removeChild(eupbx.nextSibling);//删除下一个"&vbcrlf&""_
&"eupv.removeChild(eupbx.nextSibling);"&vbcrlf&""_
&"eupv.removeChild(eupbx.nextSibling);"&vbcrlf&""_
&"eupv.removeChild(eupbx.nextSibling);"&vbcrlf&""_
&"eupv.removeChild(eupbx.nextSibling);"&vbcrlf&""_
&"eupv.removeChild(eupbx.nextSibling);"&vbcrlf&""_
&"eupv.removeChild(eupbx);"&vbcrlf&""_
&"}"&vbcrlf&""_
&"eupv.appendChild(eupbt);"&vbcrlf&""_
&"eupv.appendChild(document.createElement(""BR""));"&vbcrlf&""_

&"var eupmz=document.createElement(""input"");"&vbcrlf&""_
&"eupmz.className=""f-up"";"&vbcrlf&""_
&"eupmz.type=""text"";"&vbcrlf&""_
&"eupmz.id=eafmz+""_""+eupi;"&vbcrlf&""_
&"eupmz.name=eafmz;"&vbcrlf&""_
&"eupmz.placeholder=""图片名称"";"&vbcrlf&""_
&"eupmz.title=""请输入图片名称"";"&vbcrlf&""_
&"eupv.appendChild(eupmz);"&vbcrlf&""_
&"eupv.appendChild(document.createElement(""BR""));"&vbcrlf&""_

&"var eupfi=document.createElement(""input"");"&vbcrlf&""_
&"eupfi.className=""f-up"";"&vbcrlf&""_
&"eupfi.type=""text"";"&vbcrlf&""_
&"eupfi.placeholder=""*图片地址"";"&vbcrlf&""_
&"eupfi.id=eafmz+eupi;"&vbcrlf&""_
&"eupfi.name=eafmz;"&vbcrlf&""_
&"eupfi.title=""*请选择本地图片上传，上传成功后会在此文本框中自动生成文件地址，或者您也可以直接输入图片地址"";"&vbcrlf&""_
&"eupv.appendChild(eupfi);"&vbcrlf&""_
&"eupv.appendChild(document.createElement(""BR""));"&vbcrlf&""_

&"var eupfr=document.createElement(""iframe"");"&vbcrlf&""_
&"eupfr.src="""&eshref(i_dir&"AsaiUpLoad/",3)&"?0|1|""+eafsn+""_""+eupi+""|"&eafup&"|0|AsaiForm|""+eafmz+eupi+""|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees"";"&vbcrlf&""_
&"eupfr.className=""f-upfr"";"&vbcrlf&""_
&"eupfr.frameborder=""0"";"&vbcrlf&""_
&"eupfr.border=""0"";"&vbcrlf&""_
&"eupfr.scrolling=""no"";"&vbcrlf&""_
&"eupv.appendChild(eupfr);"&vbcrlf&""_
&"}"&vbcrlf&""_
&"</script>"&vbcrlf&""_
&"<input class=""f-sb"" type=""button"" name=""Submit"" value=""添加更多图片"" onClick=""eupadd('"&eafmz&"','"&eafsn&"')"">"
else
eaupfm=eaupfm&"</div>"&vbcrlf
end if
end function
'-----------------------------------
'ai ppt picture show
'=eaupsh(eafty8=局部放大|1上2下3左4右,eafstr,eafup,eafbt,eafel)
'-----------------------------------
function eaupsh(eafty,eafstr,eafup,eafbt,eafel)
if eafup<>"" then
  eaupsh=esupr(1,eafstr)
  if aiint(eupdmud)>2 then
  dim eaudp,eaudl
  eaudp="<a title="""&eafbt&""" id=""p-sflink"" target=""_blank"" href="""&esups(eafup,1)&""">"
  if eafty=8 then
  eaudp=eaudp&"<div id=""p-sfk""><img id=""p-sfimg"" src="""&esups(eafup,1)&"""><div id=""p-sfshow""><img id=""p-sfimga"" src="""&esups(eafup,1)&"""></div></div>"
  else
  eaudp=eaudp&"<img id=""p-sfimg"" src="""&esups(eafup,1)&""">"
  end if
  eaudp=eaudp&"</a>"
  if eafty=8 then eaudp=eaudp&"<div id=""p-sfzoom""><img id=""p-sfimgb"" src="""&esups(eafup,1)&"""></div>"
  eaudl="<img onmousemove=""sfshow(this.src,this.alt);"" alt="""&eafbt&""" title="""&eafbt&""" src="""&esups(eafup,1)&""">"
  for eupdmi=0 to aiint(eupdmud)-1 step 2
  if eupdmrr(eupdmi+1)<>"" then
  eaudl=eaudl&"<img onmousemove=""sfshow(this.src,this.alt);"""
  if eupdmrr(eupdmi)<>"" then eaudl=eaudl&" alt="""&eupdmrr(eupdmi)&""" title="""&eupdmrr(eupdmi)&""""
  eaudl=eaudl&" src="""&esups(eupdmrr(eupdmi+1),1)&""">"
  end if
  next
  if eafty=8 then
  eaupsh=eaupsh&"<script language=""JavaScript"" charset=""utf-8"" src="""&w_asai&i_msk&"js/sf.js""></script>"
  else
  eaupsh=eaupsh&"<script language=""JavaScript"" charset=""utf-8"" src="""&w_asai&i_msk&"js/sfa.js""></script>"
  end if
	  if eafty=8 then
	  eaupsh=eaupsh&"<div id=""p-sf"">"&eaudp&"<div class=""p-ssdm"">"&eaudl&"</div></div>"
	  eaupsh=eaupsh&"<script type=""text/javascript"">$E({expand:{id:""p-sfzoom"",style:{}}});</script>"
	  elseif eafty=1 then
	  eaupsh=eaupsh&"<table class=""p-ssx"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td class=""p-ssxl""><div class=""p-ssdm"">"&eaudl&"</div></td></tr><tr><td class=""p-ssxs"" valign=""middle"">"&eaudp&"</td></tr></table>"
	  elseif eafty=2 then
	  eaupsh=eaupsh&"<table class=""p-ssx"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td class=""p-ssxs"" valign=""middle"">"&eaudp&"</td></tr><tr><td class=""p-ssxl""><div class=""p-ssdm"">"&eaudl&"</div></td></tr></table>"
	  elseif eafty=3 then
	  eaupsh=eaupsh&"<table class=""p-ssx"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td class=""p-ssxll""><div class=""p-ssdm"">"&replace(eaudl,"<img","<br><img")&"</div></td><td class=""p-ssxs"" valign=""middle"">"&eaudp&"</td></tr></table>"
	  elseif eafty=4 then
	  eaupsh=eaupsh&"<table class=""p-ssx"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td class=""p-ssxs"" valign=""middle"">"&eaudp&"</td><td class=""p-ssxll""><div class=""p-ssdm"">"&replace(eaudl,"<img","<br><img")&"</div></td></tr></table>"
	  else
	  eaupsh=eaupsh&"<table class=""p-ssx"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td class=""p-ssxl""><div class=""p-ssdm"">"&eaudl&"</div></td></tr><tr><td class=""p-ssxs"" valign=""middle"">"&eaudp&"</td></tr></table>"
	  end if
  elseif left(eafel,1)="2" then
  eaupsh="<a title="""&eafbt&""" target=""_blank"" href="""&esups(eafup,1)&""">"&easpic(eafup,eafbt,eafbt,eafup,10)&"</a>"
  elseif eafty=8 or eafty=2 then
  eaupsh="<div id=""p-sf""><a class=""p-sfa"" title="""&eafbt&""" target=""_blank"" href="""&esups(eafup,1)&""">"&easpic(eafup,eafbt,eafbt,eafup,10)&"</a></div>"
  elseif left(eafel,1)="2" or left(eafel,1)="6" then
  eaupsh="<a title="""&eafbt&""" target=""_blank"" href="""&esups(eafup,1)&""">"&easpic(eafup,eafbt,eafbt,eafup,10)&"</a>"
  else
  eaupsh="<div id=""p-sf""><a class=""p-sfa"" title="""&eafbt&""" target=""_blank"" href="""&esups(eafup,1)&""">"&easpic(eafup,eafbt,eafbt,eafup,10)&"</a></div>"
  end if
elseif left(eafel,1)="2" or left(eafel,1)="6" then
eaupsh="<a title="""&eafbt&""" target=""_blank"" href="""&esups(eafup,1)&""">"&easpic(eafup,eafbt,eafbt,eafup,10)&"</a>"
else
eaupsh="<div id=""p-sf""><a class=""p-sfa"" title="""&eafbt&""" target=""_blank"" href="""&esups(eafup,1)&""">"&easpic(eafup,eafbt,eafbt,eafup,10)&"</a></div>"
end if
end function
'-----------------------------------
'add/edit form
'=eaform()
'-----------------------------------
Function eaform(eafqh,eafty,eafsn)
dim eadty,eadqx,eadqxyz,eadupd,eadoks,eadxx,eadlxs
if aibj(left(eafty,len(s_umxg)),s_umxg) then
eadty=1
else
eadty=0
end if

eadqx=0
if left(eafqh,1)="3" then
eadqxyz=aiint(e_uzy)
if eadqxyz>3 then
eadqx=2
elseif eadqxyz>2 then
eadqx=1
end if
else
eadqxyz=aiint(e_gdj)
if eadqxyz>2 then
eadqx=2
elseif eadqxyz>1 then
eadqx=1
end if
end if

if eadty=0 then
ai_eq="":ai_bt="":ai_jj="":ai_ss="":ai_nr="":ai_t2="":ai_mm="":ai_up="":ai_cs="":ai_yy=""
ai_ew=ep_ew
ai_el=aiint(ep_el)
ai_ep=ep_sn
ai_ef=ef_sn
if ainull(eafsn) then
ai_sn="ES"&aisn(1)
else
ai_sn=eafsn&"_"&aisn(1)
end if
ai_us=e_uer
if uk_mc<>"" then
ai_um=uk_mc
elseif e_ubt<>"" then
ai_um=e_ubt
elseif not ainull(e_uer) then
ai_um=e_uer
elseif e_gdj>0 then
ai_um=ew_mc
else
ai_um=aiip()
end if
ai_ee=e_gmc
ai_ss=""
ai_yy=""
if e_gdj>4 then
ai_xy=1
elseif eadqx>0 then
ai_xy=1
elseif e_uxy>0 or e_gdj>0 then
ai_xy=1
else
ai_xy=ew_sh
end if
ai_sb=i_wsb
ai_px=0
ai_hi=0
ai_xi=0
ai_bd=0
ai_bc=0
ai_jg=0
ai_jy=0
ai_oz=0
ai_oy=0
ai_tm=now()
ai_t1=now()
'ai_t2=now()
ai_xt=espxx("添加"&i_gg&e_gmc)
else
ai_t1=now()
ai_xt=ai_xt&espxx("修改"&i_gg&e_gmc)
end if

eadxx=""
if ewxgn("e5") then
eadlxs=5
eadxx=eadxx&"<ul id=""easmid"">"
elseif ewxgn("e3") then
eadlxs=3
eadxx=eadxx&icflot(10,"选填","<input type=""checkbox"" id=""more"" name=""more"" value=""1"" onClick=""if (this.checked){document.getElementById('easmid').style.display='';}else{document.getElementById('easmid').style.display='none';}""> <label for=""more"">高级属性选项</label>")&"<ul id=""easmid"" style=""display:none;"">"
else
eadlxs=1
eadxx=eadxx&"<ul id=""easmid"" style=""display:none;"">"
end if

eadupd=esupcc(ai_ep,ai_sn)
ai_el=aiint(ai_el)
if eadty=1 then
eaform=eaformx(eafqh,eadty,eadqx,ai_el,eadupd)
else
if aibj(eafqh,"0") then Call epread(eafsn)
eaform=eaformx(eafqh,eadty,eadqx,ep_el,eadupd)
end if
'response.Write ai_nr
if ainull(eaform) then
eaform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
'BT------0
if eadqx>1 then
eaform=eaform&icflsr(75,"标题","","bt","",0,200,"*"&ep_dm&"标题","",ai_bt)&icflsr(25,"导言","","jj","",0,200,"对"&ep_dm&"标题加以描述的导言","",ai_jj)
if ep_ls="1" or ep_ls="2" or ep_ls="5" then eaform=eaform&icflsr(10,"摘要","","ss","",0,200,"请总结描述一下，有助于推广（为空将自动提取详细信息中的前200字文本）输入0表示为空不显示。","",ai_ss)
eaform=eaform&icflxz(25,"状态","xy","","*","f-s",ai_xy,0,i_bxy)&icflsr(25,"排序","","px","",6,50,"排序值，可供依靠排序值的调用使用","",ai_px)&icflsr(25,"点击","","hi","",6,50,"点击浏览次数，需要网站开启点击统计功能","",ai_hi)&icflsr(25,"我顶","","xi","",6,50,"被我顶推荐的次数，需要网站开启我顶统计功能","",ai_xi)
if not aibj(ep_ef,"5") then
eadoks=ukselect(ep_sn,"eq",uk_fl,ai_eq)
if left(eafqh,1)="3" and not ainull(eadoks) then
eaform=eaform&icflot(10,"目录",eadoks)
else
eaform=eaform&icflsr(10,"标签","","eq","",0,200,"又名关键词，可以优化网站搜索引擎抓取，多个标签请使用英文逗号,隔开。","",ai_eq)
end if
if ep_ef<2 then
eaform=eaform&icflot(10,"分类",efselect(5,ep_ef,"ef",ai_ep,ai_ef))
else
eaform=eaform&efselect(5,ep_ef,"ef",ai_ep,ai_ef)
end if
else
eaform=eaform&aiinput("hidden","ef","",0,0,"","",ai_ef)&aiinput("hidden","eq","",0,0,"","",ai_eq)
end if
else
if ep_ls="1" or ep_ls="2" or ep_ls="5" then
eaform=eaform&icflsr(75,"标题","","bt","",0,200,"*"&ep_dm&"标题","",ai_bt)&icflsr(25,"摘要","","ss","",0,200,"请总结描述一下，有助于推广（为空将自动提取详细信息中的前200字文本）输入0表示为空不显示。","",ai_ss)
else
eaform=eaform&icflsr(10,"标题","","bt","",0,200,"*"&ep_dm&"标题","",ai_bt)&aiinput("hidden","ss","",0,0,"","",ai_ss)
end if
eaform=eaform&aiinput("hidden","jj","",0,0,"","",ai_jj)&aiinput("hidden","xy","",0,0,"","",ai_xy)&aiinput("hidden","px","",0,0,"","",ai_px)&aiinput("hidden","hi","",0,0,"","",ai_hi)&aiinput("hidden","xi","",0,0,"","",ai_xi)
if not aibj(ep_ef,"5") then
eadoks=ukselect(ep_sn,"eq",uk_fl,ai_eq)
if left(eafqh,1)="3" and not ainull(eadoks) then
eaform=eaform&icflot(10,"目录",ukselect(ep_sn,"eq",uk_fl,ai_eq))
else
eaform=eaform&aiinput("hidden","eq","",0,0,"","",ai_eq)
end if
if ep_ef<2 then
eaform=eaform&icflot(10,"分类",efselect(5,ep_ef,"ef",ai_ep,ai_ef))
else
eaform=eaform&efselect(5,ep_ef,"ef",ai_ep,ai_ef)
end if
else
eaform=eaform&aiinput("hidden","ef","",0,0,"","",ai_ef)&aiinput("hidden","eq","",0,0,"","",ai_eq)
end if
end if
if not ainull(ep_cs) then eaform=eaform&""&iccs(2,"cs",ep_cs,ai_cs)&"<div class=cr></div>"
if not ainull(ep_ot) then
eaform=eaform&icflot(10,"","<input type=""checkbox"" id=""moreot"" name=""moreot"" value=""1"" onClick=""if (this.checked){document.getElementById('easmod').style.display='';}else{document.getElementById('easmod').style.display='none';}""> <label for=""moreot"">更多详细参数</label>")&"<ul id=""easmod"" style=""display:none;"">"
eaform=eaform&""&iccs(2,"ot",ep_ot,ai_ot)&"<div class=cr></div>"
eaform=eaform&"</ul>"
end if
eaform=eaform&"<a name=sainr></a>"&icflot(10,"内容",esedit(esnr(ai_nr),"nr",8))
'BT------1
'UP------0
if ai_el=12 then
eaform=eaform&aiinput("hidden","up","",0,0,"","",ai_up)
else
if userx>=p_upiqx then
if left(ai_el,1)=8 or ai_el=60 or ai_el=20 or ai_el=21 then
eaform=eaform&icflot(10,"图片","<div class=""l-up"">"&eaupfm(1,"up",ai_up,0,"nr",ai_sn,ai_nr,eadupd)&"</div>")
else
eaform=eaform&icflot(10,"图片","<div class=""l-up"">"&eaupfm(0,"up",ai_up,0,"nr",ai_sn,ai_nr,eadupd)&"</div>")
end if
else
'eaform=eaform&aiinput("hidden","up","",0,0,"","",ai_up)
eaform=eaform&icflsr(10,"图片","","up","",0,200,"请输入"&ep_dm&"封面图片网络地址，或先对您的账户进行认证后再直接上传图片。","",ai_up)
end if
end if
'UP------1
'CS------0
'___________________________________________________________________________________80
if left(ai_el,1)=8 then
'交易类8
'10	商品系统80
'11	竞拍系统81
'12	供应系统82
'13	求购系统83
'+订金系统84
'+定金系统85
'+招标系统86
'+悬赏系统87
'+服务系统88
'81竞拍系统
if ai_el=81 then
if not isdate(ai_t2) then ai_t2=DateAdd("n",30,ai_tm)
if eadqx>1 then
eaform=eaform&icflsr(25,"起价","","oz","",6,50,"起拍价格,设为0的时候默认支持预约暗拍","",ai_oz)&icflsr(25,"定金","","oy","",6,50,"竞拍商品的定金，竞拍开始扣除卖家定金，请保证账户有足够金钱。竞拍结束收取中拍者定金。","",ai_oy)&icflsr(25,"开始","","t2","",99,100,"竞拍开始时间，注：每场竞拍半小时后连续1分钟无人竞拍即竞拍完成，今日：（"&now()&"）","",ai_t2)&"</li>"
eaform=eaform&icflsr(25,"底价","","jy","",6,50,"心理价位，拍卖价大于这个价格的时候显示，0为不显示","",ai_jy)&icflsr(25,"价格","","jg","",6,50,"当前价格，包含预约出价，须大于起拍价方才有效。","",ai_jg)&icflsr(75,"中标","","uf","",0,50,"竞拍当前中标人","",ai_uf)
if eadlxs>0 then eaform=eaform&eadxx
eaform=eaform&icflsr(5,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)
elseif eadty=0 or (eadty=1 and aiint(ai_xy)=0) then
eaform=eaform&icflot(10,"开始",aiinput("","t2","",99,100,"竞拍开始时间，注：每场竞拍半小时后连续1分钟无人竞拍即竞拍完成，今日：（"&now()&"）","f-u",ai_t2)&"当前时间："&aitmx(now(),99))
eaform=eaform&icflsr(25,"定金","","oy","",6,50,"竞拍商品的定金，竞拍开始扣除卖家定金，请保证账户有足够金钱。竞拍结束收取中拍者定金。","",ai_oy)&icflsr(25,"起价","","oz","",6,50,"起拍价格,设为0的时候默认支持预约暗拍","",ai_oz)&icflsr(25,"底价","","jy","",6,50,"心理价位，拍卖价大于这个价格的时候显示，0为不显示","",ai_jy)&aiinput("hidden","jg","",0,0,"","",ai_jg)&aiinput("hidden","uf","",0,0,"","",ai_uf)
if eadlxs>0 then eaform=eaform&eadxx
eaform=eaform&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)&aiinput("hidden","t1","",0,0,"","",ai_t1)
else
response.Write aigo("对不起，您无权操作已审核"&ep_dm&"！请联系管理员。",1)
response.End()
end if
'83求购系统
elseif ai_el=83 then
eaform=eaform&icflsr(25,"底价","","jg","",6,50,"最低价格","",ai_jg)&icflsr(25,"高价","","jy","",6,50,"最高价格","",ai_jy)&icflsr(25,"已收","","oy","",6,50,"已经收入的数量","",ai_oy)&icflsr(25,"需量","","oz","",6,50,"需求总数量","",ai_oz)
if eadlxs>0 then eaform=eaform&eadxx
eaform=eaform&icflsr(10,"过期","","t2","",99,100,"优惠活动过期时间，今日：（"&now()&"）","",ai_t2)
if eadqx>1 then
eaform=eaform&icflsr(5,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)
else
eaform=eaform&aiinput("hidden","t1","",0,0,"","",ai_t1)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)
end if
'84订金系统85定金系统88服务系统
elseif ai_el=84 or ai_el=85 or ai_el=88 then
if ai_el=85 then
eaform=eaform&icflsr(25,"定金","","jg","",6,50,"定金","",ai_jg)&""
else
eaform=eaform&icflsr(25,"订金","","jg","",6,50,"订金","",ai_jg)&""
end if
eaform=eaform&icflsr(25,"售价","","jy","",6,50,"售价","",ai_jy)&""
if eadqx>1 then
eaform=eaform&icflsr(25,"已售","","oy","",6,50,"已预定数量","",ai_oy)&""
else
eaform=eaform&icflsr(25,"已售","read","oy","",6,50,"已预定数量*不可修改","",ai_oy)&""
end if
eaform=eaform&icflsr(25,"库存","","oz","",6,50,"可预订库存数量","",ai_oz)
if eadlxs>0 then eaform=eaform&eadxx
if eadqx>1 then
eaform=eaform&icflsr(25,"过期","","t2","",99,100,"优惠活动过期时间，今日：（"&now()&"）","",ai_t2)
eaform=eaform&icflsr(25,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)
else
eaform=eaform&icflsr(10,"过期","","t2","",99,100,"优惠活动过期时间，今日：（"&now()&"）","",ai_t2)
eaform=eaform&aiinput("hidden","t1","",0,0,"","",ai_t1)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)
end if
'86招标系统
elseif ai_el=86 then
if userx>=p_upiqx then
eaform=eaform&icflot(10,"标书",aiinput("","uf","",0,200,"可供下载的标书文件，支付订金后获得下载地址。","f-up",ai_uf)&esup("0|3|"&ai_sn&"_uf|"&eadupd&"|0|AsaiForm|uf|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees"))
else
eaform=eaform&aiinput("hidden","uf","",0,0,"","",ai_uf)
end if
eaform=eaform&icflsr(25,"订金","","jg","",6,50,"订金","",ai_jg)
eaform=eaform&icflsr(25,"标额","","jy","",6,50,"预估招标额度","",ai_jy)
if eadqx>1 then
eaform=eaform&icflsr(25,"参标","","oy","",6,50,"参与招标人数","",ai_oy)
else
eaform=eaform&icflsr(25,"参标","read","oy","",6,50,"参与招标人数*不可修改","",ai_oy)
end if
eaform=eaform&icflsr(25,"余标","","oz","",6,50,"剩余招标名额数量","",ai_oz)
eaform=eaform&icflsr(25,"过期","","t2","",99,100,"招标信息过期时间，今日：（"&now()&"）","",ai_t2)
if eadlxs>0 then eaform=eaform&eadxx
if eadqx>1 then
eaform=eaform&icflsr(25,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)
else
eaform=eaform&aiinput("hidden","t1","",0,0,"","",ai_t1)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)
end if
'87悬赏系统
elseif ai_el=87 then
eaform=eaform&icflxz(25,"类型","jy","","*","",ai_jy,0,left(i_buyfk,14))&icflsr(25,"赏金","","jg","",6,50,"悬赏金额","",ai_jg)&icflsr(25,"已接","","oy","",6,50,"已经下单的人数","",ai_oy)&icflsr(25,"名额","","oz","",6,50,"招募猎人数量上限","",ai_oz)
if eadlxs>0 then eaform=eaform&eadxx
eaform=eaform&icflsr(10,"过期","","t2","",99,100,"优惠活动过期时间，今日：（"&now()&"）","",ai_t2)
if eadqx>1 then
eaform=eaform&icflsr(5,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)
else
eaform=eaform&aiinput("hidden","t1","",0,0,"","",ai_t1)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)
end if
'80商品系统82供应系统
else
eaform=eaform&icflsr(25,"售价","","jg","",6,50,"售价","",ai_jg)&icflsr(25,"原价","","jy","",6,50,"原价","",ai_jy)
if eadqx>1 then
eaform=eaform&icflsr(25,"已售","","oy","",6,50,"已售数量","",ai_oy)
else
eaform=eaform&icflsr(25,"已售","read","oy","",6,50,"已售数量*不可修改","",ai_oy)
end if
eaform=eaform&icflsr(25,"库存","","oz","",6,50,"库存数量","",ai_oz)
if eadlxs>0 then eaform=eaform&eadxx
eaform=eaform&icflsr(10,"过期","","t2","",99,100,"优惠活动过期时间，今日：（"&now()&"）","",ai_t2)
if eadqx>1 then
eaform=eaform&icflsr(5,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)
else
eaform=eaform&aiinput("hidden","t1","",0,0,"","",ai_t1)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)
end if
end if
'___________________________________________________________________________________89
'___________________________________________________________________________________60
elseif left(ai_el,1)=6 then
'介绍类6
'2	产品系统60
'8	下载系统61
'5	人才招聘62
'6	友情链接63
'招标展示64
'需求发布65
'61	下载系统
if ai_el=61 then
if userx>=p_upiqx then
eaform=eaform&icflot(10,"文件",aiinput("","uf","",0,200,"可供下载的文件","f-up",ai_uf)&esup("0|3|"&ai_sn&"_uf|"&eadupd&"|0|AsaiForm|uf|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees"))
else
eaform=eaform&aiinput("hidden","uf","",0,0,"","",ai_uf)
end if
if eadlxs>0 then eaform=eaform&eadxx
eaform=eaform&icflsr(10,"过期","","t2","",99,100,"文件下载失效时间，今日：（"&now()&"）","",ai_t2)
if eadqx>1 then
eaform=eaform&icflsr(25,"价格","","jg","",6,50,"价格","",ai_jg)&icflsr(25,"原价","","jy","",6,50,"原价","",ai_jy)&icflsr(25,"已售","","oy","",6,50,"已售数量","",ai_oy)&icflsr(25,"库存","","oz","",6,50,"库存数量","",ai_oz)
eaform=eaform&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)&icflsr(5,"更新","","t1","",99,100,"最后更新时间","",ai_t1)
else
eaform=eaform&aiinput("hidden","jg","",0,0,"","",ai_jg)&aiinput("hidden","jy","",0,0,"","",ai_jy)&aiinput("hidden","oz","",0,0,"","",ai_oz)&aiinput("hidden","oy","",0,0,"","",ai_oy)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)&aiinput("hidden","t1","",0,0,"","",ai_t1)
end if
'62	人才招聘
elseif ai_el=62 then
eaform=eaform&icflsr(25,"月薪","","jg","",6,50,"月薪多少,直接输入数字,单位:元/月,0表示面议","",ai_jg)&icflsr(25,"人数","","jy","",6,50,"职位招聘的人数,直接输入数字,0表示不限制.","",ai_jy)
if eadqx>1 then
eaform=eaform&icflsr(5,"要求","","uf","",0,200,"请输入对应聘人员的要求.","",ai_uf)
eaform=eaform&icflsr(5,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(5,"过期","","t2","",99,100,"招聘过期时间，今日：（"&now()&"）","",ai_t2)
else
eaform=eaform&icflsr(25,"要求","","uf","",0,200,"请输入对应聘人员的要求.","",ai_uf)&icflsr(25,"过期","","t2","",99,100,"招聘过期时间，今日：（"&now()&"）","",ai_t2)&aiinput("hidden","t1","",0,0,"","",ai_t1)
end if
if eadlxs>0 then eaform=eaform&eadxx
if eadqx>1 then
eaform=eaform&icflsr(25,"已售","","oy","",6,50,"已售数量","",ai_oy)&icflsr(25,"库存","","oz","",6,50,"库存数量","",ai_oz)&icflsr(25,"榜分","","bd","",6,50,"*打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"*进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)
else
eaform=eaform&aiinput("hidden","oz","",0,0,"","",ai_oz)&aiinput("hidden","oy","",0,0,"","",ai_oy)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)
end if
'63	友情链接
elseif ai_el=63 then
eaform=eaform&icflsr(10,"链接","","uf","",0,200,"请输入友情链接的地址，如："&ew_ui&"","",ai_uf)
if eadlxs>0 then eaform=eaform&eadxx
if eadqx>1 then
eaform=eaform&icflsr(25,"价格","","jg","",6,50,"价格","",ai_jg)&icflsr(25,"原价","","jy","",6,50,"原价","",ai_jy)&icflsr(25,"已售","","oy","",6,50,"已售数量","",ai_oy)&icflsr(25,"库存","","oz","",6,50,"库存数量","",ai_oz)
eaform=eaform&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)&icflsr(25,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(25,"过期","","t2","",99,100,"媒体失效时间，今日：（"&now()&"）","",ai_t2)
else
eaform=eaform&aiinput("hidden","jg","",0,0,"","",ai_jg)&aiinput("hidden","jy","",0,0,"","",ai_jy)&aiinput("hidden","oz","",0,0,"","",ai_oz)&aiinput("hidden","oy","",0,0,"","",ai_oy)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)&aiinput("hidden","t1","",0,0,"","",ai_t1)&aiinput("hidden","t2","",0,0,"","",ai_t2)
end if
'招标展示64
elseif ai_el=64 then
if userx>=p_upiqx then
eaform=eaform&icflot(10,"标书",aiinput("","uf","",0,200,"可供下载的标书文件","f-up",ai_uf)&esup("0|3|"&ai_sn&"_uf|"&eadupd&"|0|AsaiForm|uf|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees"))
else
eaform=eaform&aiinput("hidden","uf","",0,0,"","",ai_uf)
end if
if eadlxs>0 then eaform=eaform&eadxx
eaform=eaform&icflsr(10,"过期","","t2","",99,100,"文件下载失效时间，今日：（"&now()&"）","",ai_t2)
if eadqx>1 then
eaform=eaform&icflsr(25,"价格","","jg","",6,50,"价格","",ai_jg)&icflsr(25,"原价","","jy","",6,50,"原价","",ai_jy)&icflsr(25,"已售","","oy","",6,50,"已售数量","",ai_oy)&icflsr(25,"库存","","oz","",6,50,"库存数量","",ai_oz)
eaform=eaform&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)&icflsr(25,"更新","","t1","",99,100,"最后更新时间","",ai_t1)
else
eaform=eaform&aiinput("hidden","jg","",0,0,"","",ai_jg)&aiinput("hidden","jy","",0,0,"","",ai_jy)&aiinput("hidden","oz","",0,0,"","",ai_oz)&aiinput("hidden","oy","",0,0,"","",ai_oy)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)&aiinput("hidden","t1","",0,0,"","",ai_t1)
end if
'需求发布65
elseif ai_el=65 then
eaform=eaform&icflsr(25,"底价","","jg","",6,50,"最低价格","",ai_jg)&icflsr(25,"高价","","jy","",6,50,"最高价格","",ai_jy)&icflsr(25,"已收","","oy","",6,50,"已经收入的数量","",ai_oy)&icflsr(25,"需量","","oz","",6,50,"需求总数量","",ai_oz)
if eadlxs>0 then eaform=eaform&eadxx
eaform=eaform&icflsr(10,"过期","","t2","",99,100,"优惠活动过期时间，今日：（"&now()&"）","",ai_t2)
if eadqx>1 then
eaform=eaform&icflsr(25,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)
else
eaform=eaform&aiinput("hidden","t1","",0,0,"","",ai_t1)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)
end if
'60产品系统
else
eaform=eaform&icflsr(25,"售价","","jg","",6,50,"*售价","",ai_jg)&icflsr(25,"原价","","jy","",6,50,"*原价","",ai_jy)
if eadlxs>0 then eaform=eaform&eadxx
if eadqx>1 then
eaform=eaform&icflsr(25,"更新","","t1","",99,100,"最后更新时间，今日：（"&now()&"）","",ai_t1)&icflsr(25,"过期","","t2","",99,100,"优惠活动过期时间，今日：（"&now()&"）","",ai_t2)
else
eaform=eaform&icflsr(5,"过期","","t2","",99,100,"优惠活动过期时间，今日：（"&now()&"）","",ai_t2)&aiinput("hidden","t1","",0,0,"","",ai_t1)
end if
if eadqx>1 then
eaform=eaform&icflsr(25,"已售","","oy","",6,50,"已售数量","",ai_oy)&icflsr(25,"库存","","oz","",6,50,"库存数量","",ai_oz)&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)
else
eaform=eaform&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)&aiinput("hidden","oz","",0,0,"","",ai_oz)&aiinput("hidden","oy","",0,0,"","",ai_oy)
end if
end if
'___________________________________________________________________________________69
'___________________________________________________________________________________20
elseif left(ai_el,1)=2 then
'媒体类2
'7	图片系统20
'4	资质证书21
'9	媒体系统22
'22媒体系统
if ai_el=22 then
if userx>=p_upiqx then
eaform=eaform&icflot(10,"媒体",aiinput("","uf","",0,200,"媒体文件","f-up",ai_uf)&esup("0|2|"&ai_sn&"_mt|"&eadupd&"|0|AsaiForm|uf|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees"))
else
eaform=eaform&aiinput("hidden","uf","",0,0,"","",ai_uf)
end if
if eadlxs>0 then eaform=eaform&eadxx
eaform=eaform&icflsr(10,"过期","","t2","",99,100,"媒体失效时间，今日：（"&now()&"）","",ai_t2)
if eadqx>1 then
eaform=eaform&icflsr(25,"价格","","jg","",6,50,"价格","",ai_jg)&icflsr(25,"原价","","jy","",6,50,"原价","",ai_jy)&icflsr(25,"已售","","oy","",6,50,"已售数量","",ai_oy)&icflsr(25,"库存","","oz","",6,50,"库存数量","",ai_oz)
eaform=eaform&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)&icflsr(25,"更新","","t1","",99,100,"最后更新时间","",ai_t1)
else
eaform=eaform&aiinput("hidden","jg","",0,0,"","",ai_jg)&aiinput("hidden","jy","",0,0,"","",ai_jy)&aiinput("hidden","oz","",0,0,"","",ai_oz)&aiinput("hidden","oy","",0,0,"","",ai_oy)&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)&aiinput("hidden","t1","",0,0,"","",ai_t1)
end if
'20图片系统21 资质证书
else
if eadlxs>0 then eaform=eaform&eadxx
if eadqx>1 then
eaform=eaform&icflsr(25,"价格","","jg","",6,50,"价格","",ai_jg)&icflsr(25,"原价","","jy","",6,50,"原价","",ai_jy)&icflsr(25,"已售","","oy","",6,50,"已售数量","",ai_oy)&icflsr(25,"库存","","oz","",6,50,"库存数量","",ai_oz)
eaform=eaform&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)&icflsr(5,"其他","","uf","",0,200,"其他信息","",ai_uf)
eaform=eaform&icflsr(5,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(5,"过期","","t2","",99,100,"过期时间","",ai_t2)
else
eaform=eaform&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)&aiinput("hidden","jg","",0,0,"","",ai_jg)&aiinput("hidden","jy","",0,0,"","",ai_jy)&aiinput("hidden","oz","",0,0,"","",ai_oz)&aiinput("hidden","oy","",0,0,"","",ai_oy)&aiinput("hidden","t1","",0,0,"","",ai_t1)&aiinput("hidden","t2","",0,0,"","",ai_t2)
end if
end if
'___________________________________________________________________________________29
'___________________________________________________________________________________10
else
'文章类1
'1	文章系统10
'3	关于我们11
'14	短文系统12
'15	单页系统13
if eadlxs>0 then eaform=eaform&eadxx
if eadqx>1 then
eaform=eaform&icflsr(25,"价格","","jg","",6,50,"价格","",ai_jg)&icflsr(25,"原价","","jy","",6,50,"原价","",ai_jy)&icflsr(25,"已售","","oy","",6,50,"已售数量","",ai_oy)&icflsr(25,"库存","","oz","",6,50,"库存数量","",ai_oz)
eaform=eaform&icflsr(25,"榜分","","bd","",6,50,"打榜分数（需要在网站设置中开启该功能）","",ai_bd)&icflsr(25,"榜次","","bc","",6,50,"进入榜单次数（需要在网站设置中开启该功能）","",ai_bc)&icflsr(5,"其他","","uf","",0,200,"其他信息","",ai_uf)
eaform=eaform&icflsr(5,"更新","","t1","",99,100,"最后更新时间","",ai_t1)&icflsr(5,"过期","","t2","",99,100,"过期时间","",ai_t2)
else
eaform=eaform&aiinput("hidden","bd","",0,0,"","",ai_bd)&aiinput("hidden","bc","",0,0,"","",ai_bc)&aiinput("hidden","jg","",0,0,"","",ai_jg)&aiinput("hidden","jy","",0,0,"","",ai_jy)&aiinput("hidden","oz","",0,0,"","",ai_oz)&aiinput("hidden","oy","",0,0,"","",ai_oy)&aiinput("hidden","t1","",0,0,"","",ai_t1)&aiinput("hidden","t2","",0,0,"","",ai_t2)
end if
end if
'___________________________________________________________________________________19
'CS------1
eaform=eaform&icflsr(25,"发布","","um","",0,50,"发布人或作者","",ai_um)&icflsr(25,"密钥","","mm","",3,50,"选填项，为空或0时无需密钥即可查看"&ep_dm&"，其他字符则需要输入您设定的密钥。","",aimm(g_gmm,ai_mm,1))&icflsr(5,"引用","","yy","",0,200,"引用网址(如果以#结尾表示隐藏该引用网址)","",ai_yy)
if ep_ls<>"1" and ep_ls<>"2" and ep_ls<>"5" then eaform=eaform&icflsr(10,"摘要","","ss","",0,200,"请总结描述一下，有助于推广（为空将自动提取详细信息中的前200字文本）输入0表示为空不显示。","",ai_ss)
'XT------0
if eadqx>1 then
eaform=eaform&icflsr(25,"编码","","sn","",3,50,"*编码(自动生成或手动设置，不可与已有编码重复。)","",ai_sn)
if e_gdj>3 then
eaform=eaform&icflsr(25,"会员","","us","",66,50,"会员账号","",ai_us)&icflsr(25,"编辑","","ee","",0,50,"编辑","",ai_ee)&icflsr(25,"时间","","tm","",99,100,"*创建时间","",ai_tm)
elseif e_gdj>2 then
eaform=eaform&icflsr(25,"时间","","tm","",99,100,"创建时间","",ai_tm)&icflsr(5,"会员","","us","",66,50,"会员账号","",ai_us)&aiinput("hidden","ee","",0,0,"","",ai_ee)
else
eaform=eaform&aiinput("hidden","us","",0,0,"","",ai_us)&aiinput("hidden","ee","",0,0,"","",ai_ee)&icflsr(10,"时间","","tm","",99,100,"*创建时间","",ai_tm)
end if
eaform=eaform&icflxz(25,"评论","pl","","","f-s",ai_pl,0,i_bpl)&icflot(25,"频道",epselect(ai_ep))&icflot(25,"网站",ewselect(1,ai_ew))&icflot(25,"类型",elselect(ai_el))
eaform=eaform&icflot(10,"点评",eseditxt(right(ai_xt,s_ztpx),"xt",1))
if eadlxs>0 then eaform=eaform&"</ul><ul>"
else
eaform=eaform&aiinput("hidden","tm","",0,0,"","",ai_tm)&aiinput("hidden","us","",0,0,"","",ai_us)&aiinput("hidden","ee","",0,0,"","",ai_ee)&aiinput("hidden","pl","",0,0,"","",ai_pl)&aiinput("hidden","sn","",0,0,"","",ai_sn)&aiinput("hidden","ep","",0,0,"","",ai_ep)&aiinput("hidden","ew","",0,0,"","",ai_ew)&aiinput("hidden","el","",0,0,"","",ai_el)&aiinput("hidden","xt","",0,0,"","",right(ai_xt,s_ztpx))
if eadlxs>0 then eaform=eaform&"</ul>"
end if
'XT------1

if left(eafqh,1)="3" then
eaform=eaform&icflot(10,"验证",eskyx(eadty,1,2))
else
eaform=eaform&icflot(10,"验证",eskyx(eadty,2,2))
end if
eaform=eaform&aiinput("hidden","sb","",0,0,"","",ai_sb)
if eadty=1 then
eaform=eaform&aiinput("hidden","sny","",0,0,"","",ai_sn)&aiinput("hidden","id","",0,0,"","",ai_id)&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif eadty=0 then
eaform=eaform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
eaform=eaform&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script></form></ul></div>"
end if
End Function
'-----------------------------------
'read can shu
'= eascs(easfstr,easfva,easfty)
'-----------------------------------
Function eascs(easfstr,easfva,easfty)
if len(easfstr&"0")>4 then
dim gysarx,gysary,gysri,eascsrra,eascsrrb,eascsccc,eascsrrc,eascsri,eascszz
gysarx=split(easfstr,"#")
for gysri=0 to ubound(gysarx)
gysary=split(gysarx(gysri)&"~","~")
if not isnull(gysary(0)) and not isnull(gysary(1)) then
if left(gysary(0),1)<>"0" then
eascsrra=split(gysary(0)&"=","=")
eascsrrb=split(gysary(1),"|")
eascs=eascs&""&eascsrra(1)&"："
for eascsri=0 to ubound(eascsrrb)
eascsccc=eascsrrb(eascsri)
if len(eascsccc&"0")>3 then
eascsrrc=split(eascsccc&"=","=")
eascszz=eascsrra(0)&eascsrrc(0)
if instr(easfva&",",eascszz&",")>0 then eascs=eascs&" "&eascsrrc(1)&""
end if
next
eascs=eascs&"<br>"
end if
end if
next
end if
End Function
'-----------------------------------
'ai zhaiyao
'=easzy(eafty2=show|3=list-c|4=list|5=top,eafid,eafsn,eafss,eafbt,eafnr,eafmm,eafmx)
'-----------------------------------
Function easzy(eafty,eafid,eafsn,eafss,eafbt,eafnr,eafmm,eafmx)
easzy=""
if aibj(eafss,"0") then
easzy=""
elseif not ainull(eafss) then
easzy=eafss
elseif i_xkzy=eafty then'make zy
dim ailcbt,ailcnr,ailzrs
ailcbt=len(aitit(eafbt)&"0")
eafnr=esupr(2,eafnr)
if eafty=2 or eafty=3 then
eafnr=replace(eafnr,g_pgcg,"")
ailcnr=len(aitit(eafnr)&"0")
if ailcbt<ailcnr then
easzy=left(aitit(eafnr),200)
else
easzy=left(aitit(eafbt),200)
end if
if not ainull(easzy) and not aibj(easzy,"0") and instr(easzy,"'")=0 then
Call gysgx(eabiao,"ai_ss='"&easzy&"'","ai_id="&eafid&"")
if eafty=2 then Call eskod(0,0,esapm(1,eafsn))
end if
elseif eafty=4 or eafty=5 then
Call saik(ailzrs,"select ai_ss,ai_nr from "&eabiao&" where ai_id="&eafid&"",3,3)
eafnr=aitit(esnr(ailzrs("ai_nr")))
eafnr=replace(eafnr,g_pgcg,"")
ailcnr=len(eafnr&"0")
if ailcbt<ailcnr then
easzy=left(eafnr,200)
else
easzy=left(aitit(eafbt),200)
end if
if not ainull(easzy) then
ailzrs("ai_ss")=easzy
ailzrs.update
end if
Call saig(ailzrs)
end if
end if
if len(easzy&"0")>3 then'show zy
if eafty>9 then
easzy="简介："&easzy&""
elseif eafty=2 then
if (aibj(eafmm,eafmx) or ainull(eafmm)) and len(easzy&"0")>len(eafbt) and not aibj(left(easzy,8),left(aitit(eafnr),8)) then
easzy=""&easzy&""
else
easzy=""
end if
elseif eafty>2 then
if not ainull(eafmm) then easzy=s_ztmm
else
easzy=""
end if
else
easzy=""
end if
End Function
'-----------------------------------
'ai show
'=easshow(eafty)
'-----------------------------------
Function easshow(eafqh,eafty,eafsn)
if ainull(ai_bt) then ai_bt=esto(ai_el,ai_bt,esnr(ai_nr))'no title
ew_bt=ai_bt&","&ew_bt:ew_zt=ai_bt&","&ai_eq&","&ew_zt:ew_nr=ai_bt&","&ai_ss&","&ew_nr:ew_cp=ai_um&","&ai_us&","&ai_ee&","&ew_cp
easshow=easshowx(ai_el,eafqh,eafty,eafsn)
if ainull(easshow) then
dim easdpur,easdpg,easdmm,eadupsh,eadlins
if left(eafqh,1)="7" then
easdpg=g_u4:easdmm=g_u5:easdpur=eshref(esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urg&g_gp&g_urg&easdmm&g_urz,11)
else
easdpg=g_u6:easdmm=g_u7:easdpur=eshref(s_uduk&g_urg&uk_ur&g_urg&esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urg&g_gp&g_urg&easdmm&g_urz,11)
end if

'--------------------------------BT 0
if aibj(ai_el,"15") or right(ai_bt,2)="**" then
if right(ai_bt,3)="***" then
e_mt=""
elseif right(ai_bt,2)="**" then
e_mt=esbts(ep_sx,ep_el,replace(ai_bt,"**","")&g_gy&eshref(esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urz,1),"")
end if
icdcb=""
else
if aibj(ai_el,"11") or aibj(ai_el,"21") then
if aibj(ep_ef,"5") then e_mt=esbts(ep_sx,ep_el,ai_bt&g_gy&eshref(esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urz,1),"")
if not ainull(ai_jj) then
icdcb="<span>"&ai_jj&"</span>"
else
icdcb=ai_bt
end if
else
icdcb=ai_bt
if not ainull(ai_jj) then icdcb=icdcb&"<span>"&ai_jj&"</span>"
end if
end if
'--------------------------------BT 1
'--------------------------------zhaiyao 0
if ainull(ai_nr) then
ai_nr=ai_ss
else
icdcc=easzy(2,ai_id,ai_sn,ai_ss,ai_bt,esnr(ai_nr),ai_mm,aimm(g_gmm,easdmm,0))
end if
'--------------------------------zhaiyao 1
'--------------------------------HENG 0
if (i_xkatm>0 or ew_dj>0) and ewxgn("dj") then
icdcd=eshi(0,ai_id,ai_hi)
icdcd=icdcd&estms(0,ai_tm)
if isdate(ai_t1) and isdate(ai_tm) then
if aicd(ai_t1)>aicd(ai_tm) then icdcd=icdcd&aitms("　最近更新：",ai_t1,0)
end if
if ewxgn("e2") then
if not ainull(ai_um) or not ainull(ai_us) then
icdcd=icdcd&"　发布："
if not ainull(ai_us) and i_xkubq=1 then
icdcd=icdcd&"<a href="&eshref(s_udus&g_urg&s_umzs&g_urg&ai_us&g_urz,66)&" target=_blank>"&usren(ai_um&g_gg&ai_us)&"</a>"
else
icdcd=icdcd&usren(ai_um&g_gg&ai_us)
end if
end if
if not ainull(ai_ee) then icdcd=icdcd&" 编辑：<a href="&eshref(s_udee&g_urg&s_umzs&g_urg&ai_ee&g_urz,66)&" target=_blank>"&ai_ee&"</a>"
end if
end if
if eafqh<>"73" then icdcd=icdcd&esxfs()
'--------------------------------HENG 1
if ew_ps=2 and instr(ai_up,"/"&p_upist)>0 then ai_up=replace(ai_up,"/"&p_upist,"/")
if ew_ps=3 and instr(ai_up,"/"&p_upist)>0 then ai_up=replace(ai_up,"/"&p_upist,"")

ai_el=aiint(ai_el)
if aiint(easdpg)<2 then
'CS------0
'___________________________________________________________________________________80
if left(ai_el,1)=8 then
'交易类8
'10	商品系统80
'11	竞拍系统81
'12	供应系统82
'13	求购系统83
'+订金系统84
'+定金系统85
'+招标系统86
'+悬赏系统87
'+服务系统88
icdcg=""
'81竞拍系统
if ai_el=81 then
if left(eafqh,1)="7" then
easdpg=g_u4:easdmm=g_u5:easdpur=eshref(esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urg&g_gp&g_urg&easdmm&g_urz,11)
else
easdpg=g_u6:easdmm=g_u7:easdpur=eshref(s_uduk&g_urg&uk_ur&g_urg&esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urg&g_gp&g_urg&easdmm&g_urz,11)
end if
if not ainull(ai_up) then
icdcf=eaupsh(8,ai_nr,ai_up,ai_bt,ai_el)
elseif len(ew_pt)>3 then
icdcf=ew_pt
else
icdcf=""
end if
icdcg=xppbox(ai_ep,ai_ef,ai_sb,ai_sn,ai_xy,ai_px,ai_oy,ai_oz,ai_jg,ai_jy,ai_t2,ai_us,ai_bt,ai_el,ai_uf,x_ppck&ai_sn,"100%","180px")
'83求购系统
elseif ai_el=83 then
icdcg=icdcg&"<li class=""c-ex l-1"">价格要求："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
if aiint(ai_oz)>0 or aiint(ai_oy)>0 then
if aiint(ai_oz)>0 then
icdcg=icdcg&"<li class=""l-1"">需求：<b>"&ai_oz&" 件</b>"
else
icdcg=icdcg&"<li class=""l-1"">需求：<b>已达标</b>"
end if
if aiint(ai_oy)>0 then icdcg=icdcg&" <s>已收 "&ai_oy&" 件</s>"
icdcg=icdcg&"</li>"
end if
'84订金系统85定金系统88服务系统
elseif ai_el=84 or ai_el=85 or ai_el=88 then
dim eldstr
if ai_el=85 then
eldstr="定金"
else
eldstr="订金"
end if
if isdate(ai_t2) and isdate(ai_tm) then
if aicd(aitmx(ai_t2,6))>now() then
icdcg=icdcg&"<li class=""c-ex l-1 "">活动"&eldstr&"："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li><li class=""c-ey l-1"">剩余时间："&aidjs(1,aitmx(ai_t2,6),"","b")&"</li>"
elseif aicd(aitmx(ai_t2,6))=aicd(aitmx(ai_tm,6)) then
icdcg=icdcg&"<li class=""c-ex l-1"">预付"&eldstr&"："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
else
icdcg=icdcg&"<li class=""c-ex l-1"">"&eldstr&"："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
else
icdcg=icdcg&"<li class=""c-ex l-1"">"&eldstr&"："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
if aiint(ai_oz)>0 or aiint(ai_oy)>0 then
if aiint(ai_oz)>0 then
icdcg=icdcg&"<li class=""l-1"">当前库存：<b>"&ai_oz&" 件</b>"
else
icdcg=icdcg&"<li class=""l-1"">当前库存：<b>已售完</b>"
end if
if aiint(ai_oy)>0 then icdcg=icdcg&" <s>已售 "&ai_oy&" 件</s>"
icdcg=icdcg&"</li>"
end if
'86招标系统
elseif ai_el=86 then
if aiint(ai_jy)>0 then
if aiint(ai_jg)>0 and aiint(ai_jy)>aiint(ai_jg) then
if isdate(ai_t2) and isdate(ai_tm) then
if aicd(aitmx(ai_t2,6))>now() then
icdcg=icdcg&"<li class=""c-ex l-1 "">活动订金："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li><li class=""c-ey l-1"">剩余时间："&aidjs(1,aitmx(ai_t2,6),"","b")&"</li>"
elseif aicd(aitmx(ai_t2,6))=aicd(aitmx(ai_tm,6)) then
icdcg=icdcg&"<li class=""c-ex l-1"">预付订金："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
else
icdcg=icdcg&"<li class=""c-ex l-1"">订金："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
else
icdcg=icdcg&"<li class=""c-ex l-1"">订金："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
else
icdcg=icdcg&"<li class=""c-ex l-1"">订金："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
end if
if aiint(ai_oz)>0 or aiint(ai_oy)>0 then
if aiint(ai_oz)>0 then
icdcg=icdcg&"<li class=""l-1"">当前余标：<b>"&ai_oz&" 人</b>"
else
icdcg=icdcg&"<li class=""l-1"">当前余标：<b>已满额</b>"
end if
if aiint(ai_oy)>0 then icdcg=icdcg&" <s>已参加招标 "&ai_oy&" 人</s>"
icdcg=icdcg&"</li>"
end if
'87悬赏系统
elseif ai_el=87 then
icdcg=icdcg&"<li class=""c-ex l-1"">悬赏额："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
if aicd(aitmx(ai_t2,6))>now() then icdcg=icdcg&"<li class=""c-ey l-1"">剩余时间："&aidjs(1,aitmx(ai_t2,6),"","b")&"</li>"
if aiint(ai_oz)>0 or aiint(ai_oy)>0 then
if aiint(ai_oz)>0 then
icdcg=icdcg&"<li class=""l-1"">招募猎人：<b>"&ai_oz&" 人</b>"
else
icdcg=icdcg&"<li class=""l-1"">招募猎人：<b>已满额</b>"
end if
if aiint(ai_oy)>0 then icdcg=icdcg&" <s>已招募 "&ai_oy&" 人</s>"
icdcg=icdcg&"</li>"
end if
'80商品系统82供应系统
else
if aiint(ai_jy)>0 then
if aiint(ai_jg)>0 and aiint(ai_jy)>aiint(ai_jg) then
if isdate(ai_t2) and isdate(ai_tm) then
if aicd(aitmx(ai_t2,6))>now() then
icdcg=icdcg&"<li class=""c-ex l-1 "">活动价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li><li class=""c-ey l-1"">剩余时间："&aidjs(1,aitmx(ai_t2,6),"","b")&"</li>"
elseif aicd(aitmx(ai_t2,6))=aicd(aitmx(ai_tm,6)) then
icdcg=icdcg&"<li class=""c-ex l-1"">活动价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
else
if aiint(ai_jy)>aiint(ai_jg) then
Call gysgx("ees_ai","ai_jg="&aiint(ai_jy)&"","ai_id="&ai_id&"")
Call eskod(0,0,g_app)
end if
icdcg=icdcg&"<li class=""c-ex l-1"">价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
else
icdcg=icdcg&"<li class=""c-ex l-1"">活动价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
else
icdcg=icdcg&"<li class=""c-ex l-1"">价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
end if
if aiint(ai_oz)>0 or aiint(ai_oy)>0 then
if aiint(ai_oz)>0 then
icdcg=icdcg&"<li class=""l-1"">当前库存：<b>"&ai_oz&" 件</b>"
else
icdcg=icdcg&"<li class=""l-1"">当前库存：<b>已售完</b>"
end if
if aiint(ai_oy)>0 then icdcg=icdcg&" <s>已售 "&ai_oy&" 件</s>"
icdcg=icdcg&"</li>"
end if
end if
'+++++++++OT------0
icdcg=icdcg&iccs(5,"fl",ep_fl,ai_ef)
icdcg=icdcg&iccs(5,"cs",ep_cs,ai_cs)
if ai_el<>"81" and eafqh<>"73" then
if i_xkadd>0 then
if aiint(ai_xy)=0 then
icdcg=icdcg&"<li class=""l-1"">提示：此商品暂未通过官方核实无法交易！</li>"
elseif aiint(ai_jg)=0 and aiint(ai_jy)=0 then
'icdcg=icdcg&"<li class=""l-1"">提示：此商品标注价格无法交易！</li>"
elseif not (aiint(ai_oz)=0 and aiint(ai_oy)>0) then
icdcg=icdcg&"<li class=""l-1"">"&uycartj(i_xkadd,"",ai_el,ai_sn,ai_jg,ai_oz,ai_oy,ai_bt,ai_us)&uycar(i_xkadd)&"</li>"
else
'icdcg=icdcg&"<li class=""l-1"">提示：该商品无法交易请联系商家！</li>"
end if
elseif aibj(ai_us,ew_kz) and not ainull(ew_n0) and not ainull(ew_c0) then
icdcg=icdcg&"<div class=""c-k"">"
icdcg=icdcg&"<a target=""_blank"" href="""&eshref(ew_c0,1)&""" class=""y-n0"">"&ew_n0&"</a>"
if not ainull(ew_n1) then icdcg=icdcg&"<a target=""_blank"" href="""&eshref(ew_c1,1)&""" class=""y-n1"">"&ew_n1&"</a>"
if not ainull(ew_n2) then icdcg=icdcg&"<a target=""_blank"" href="""&eshref(ew_c2,1)&""" class=""y-n2"">"&ew_n2&"</a>"
if not ainull(ew_n3) then icdcg=icdcg&"<a target=""_blank"" href="""&eshref(ew_c3,1)&""" class=""y-n3"">"&ew_n3&"</a>"
icdcg=icdcg&"</div>"
elseif not left(eafqh,1)="3" and not ainull(ai_us) then
if ai_el=83 then
icdcg=icdcg&"<div class=""c-k"">"&uslx(50,us_xy,ai_us,us_em,uk_ur)&"</div>"
else
icdcg=icdcg&"<div class=""c-k"">"&uslx(10,us_xy,ai_us,us_em,uk_ur)&"</div>"
end if
end if
end if

if ainull(icdcg) then
if not ainull(ai_up)  then icdcj=easpic(ai_up,ai_bt,ai_bt,ai_up,3)
else
icdcf=""
if not ainull(ai_up)  then
icdcf=eaupsh(8,ai_nr,ai_up,ai_bt,ai_el)
elseif len(ew_pt)>3 then
icdcf=ew_pt
else
icdcf=""
end if
end if
'+++++++++OT------1
'___________________________________________________________________________________89
'___________________________________________________________________________________60
elseif left(ai_el,1)=6 then
'介绍类6
'2	产品系统60
'8	下载系统61
'5	人才招聘62
'6	友情链接63
'招标展示64
'需求发布65
'60产品系统
if ai_el=60 then
if aiint(ai_jy)>0 then
if aiint(ai_jg)>0 and aiint(ai_jy)>aiint(ai_jg) then
if isdate(ai_t2) and isdate(ai_tm) then
if aicd(aitmx(ai_t2,6))>now() then
icdcg=icdcg&"<li class=""c-ex l-1 "">活动价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li><li class=""c-ey l-1"">剩余时间："&aidjs(1,aitmx(ai_t2,6),"","b")&"</li>"
elseif aicd(aitmx(ai_t2,6))=aicd(aitmx(ai_tm,6)) then
icdcg=icdcg&"<li class=""c-ex l-1"">活动价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
else
if aiint(ai_jy)>aiint(ai_jg) then
Call gysgx("ees_ai","ai_jg="&aiint(ai_jy)&"","ai_id="&ai_id&"")
Call eskod(0,0,g_app)
end if
icdcg=icdcg&"<li class=""c-ex l-1"">价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
else
icdcg=icdcg&"<li class=""c-ex l-1"">活动价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
else
icdcg=icdcg&"<li class=""c-ex l-1"">价格："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
end if
end if
if aiint(ai_oz)>0 or aiint(ai_oy)>0 then
if aiint(ai_oz)>0 then
icdcg=icdcg&"<li class=""l-1"">当前库存：<b>"&ai_oz&" 件</b>"
else
icdcg=icdcg&"<li class=""l-1"">当前库存：<b>已售完</b>"
end if
if aiint(ai_oy)>0 then icdcg=icdcg&" <s>已售 "&ai_oy&" 件</s>"
icdcg=icdcg&"</li>"
end if
icdcg=icdcg&iccs(5,"fl",ep_fl,ai_ef)
icdcg=icdcg&iccs(5,"cs",ep_cs,ai_cs)
if aibj(ai_us,ew_kz) and not ainull(ew_n0) and not ainull(ew_c0) then
icdcg=icdcg&"<div class=""c-k"">"
icdcg=icdcg&"<a target=""_blank"" href="""&eshref(ew_c0,1)&""" class=""y-n0"">"&ew_n0&"</a>"
if not ainull(ew_n1) then icdcg=icdcg&"<a target=""_blank"" href="""&eshref(ew_c1,1)&""" class=""y-n1"">"&ew_n1&"</a>"
if not ainull(ew_n2) then icdcg=icdcg&"<a target=""_blank"" href="""&eshref(ew_c2,1)&""" class=""y-n2"">"&ew_n2&"</a>"
if not ainull(ew_n3) then icdcg=icdcg&"<a target=""_blank"" href="""&eshref(ew_c3,1)&""" class=""y-n3"">"&ew_n3&"</a>"
icdcg=icdcg&"</div>"
elseif not left(eafqh,1)="3" and not ainull(ai_us) then
icdcg=icdcg&"<div class=""c-k"">"&uslx(10,us_xy,ai_us,us_em,uk_ur)&"</div>"
end if
'61下载系统
elseif ai_el=61 then
if not ainull(ai_up) or not ainull(ai_uf) then
icdcg=""
icdcg=icdcg&iccs(5,"fl",ep_fl,ai_ef)
icdcg=icdcg&iccs(5,"cs",ep_cs,ai_cs)
if not ainull(ai_uf) then icdcg=icdcg&"<div class=""c-k tc"">"&esmm(aiint(ep_qx),1,0,ai_sn,ai_bt,ai_us,"<a target=""_blank"" href="""&ai_uf&""" class=""y-n f-sb f-skxx""><span class=""glyphicon glyphicon-floppy-save""></span> 点击下载</a>",eshref(esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urg&g_u4&g_urg&g_gg&g_urz,11),ai_mm,aimm(g_gmm,easdmm,0))&"</div>"
end if
'62人才招聘
elseif ai_el=62 then
if not ainull(ai_up) or aiint(ai_jg)>0 or aiint(ai_jy)>0 or len(ai_uf&"0")>3 then
icdcg=""
icdcg=icdcg&"<li class=""c-ex l-1"">月薪："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
if len(ai_uf)>1 then icdcg=icdcg&"<li>要求：<b>"&ai_uf&"</b></li>"
icdcg=icdcg&iccs(5,"fl",ep_fl,ai_ef)
icdcg=icdcg&iccs(5,"cs",ep_cs,ai_cs)
end if
'63	友情链接
elseif ai_el=63 then
if i_xklj>0 and len(ai_uf&"0")>8 then response.Redirect(ai_uf)
icdcj=esxup(ai_el,ai_up,ai_nr)
icdcj=icdcj&"<div class=""c-k tc""><a target=""_blank"" href="""&trim(ai_uf)&""" class=""y-n""><font color=#FFFFFF>单击这里前往链接目标</font></a></div>"
'64招标展示
elseif ai_el=64 then
if not ainull(ai_up) or not ainull(ai_uf) then
icdcg=""
if aicd(aitmx(ai_t2,6))>now() then icdcg=icdcg&"<li class=""c-ey l-1"">剩余时间："&aidjs(1,aitmx(ai_t2,6),"","b")&"</li>"
icdcg=icdcg&iccs(5,"fl",ep_fl,ai_ef)
icdcg=icdcg&iccs(5,"cs",ep_cs,ai_cs)
if not ainull(ai_uf) then icdcg=icdcg&"<div class=""c-k tc"">"&esmm(aiint(ep_qx),1,0,ai_sn,ai_bt,ai_us,"<a target=""_blank"" href="""&ai_uf&""" class=""y-n f-sb f-skxx""><span class=""glyphicon glyphicon-floppy-save""></span>下载标书资料</a>",eshref(esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urg&g_u4&g_urg&g_gg&g_urz,11),ai_mm,aimm(g_gmm,easdmm,0))&"</div>"
end if
'65需求发布
elseif ai_el=65 then
icdcg=icdcg&"<li class=""c-ex l-1"">价格要求："&iclcs(0,ai_el,ai_jg,ai_jy,"")&"</li>"
if aiint(ai_oz)>0 or aiint(ai_oy)>0 then
if aiint(ai_oz)>0 then
icdcg=icdcg&"<li class=""l-1"">需求：<b>"&ai_oz&" 件</b>"
else
icdcg=icdcg&"<li class=""l-1"">需求：<b>已达标</b>"
end if
if aiint(ai_oy)>0 then icdcg=icdcg&" <s>已收 "&ai_oy&" 件</s>"
icdcg=icdcg&"</li>"
icdcg=icdcg&iccs(5,"fl",ep_fl,ai_ef)
icdcg=icdcg&iccs(5,"cs",ep_cs,ai_cs)
end if
end if
if ai_el=64 or ai_el=62 or ai_el=61 or ai_el=60 then
if not ainull(ai_up)  then
if ainull(icdcg) then
if ai_el=60 then
icdcj=eaupsh(2,ai_nr,ai_up,ai_bt,ai_el)
else
icdcj=easpic(ai_up,ai_bt,ai_bt,ai_up,3)
end if
else
if ai_el=60 then
icdcf=eaupsh(8,ai_nr,ai_up,ai_bt,ai_el)
'RESPONSE.Write icdcf&icdcg
else
icdcf="<div id=""p-sf"">"&easpic(ai_up,ai_bt,ai_bt,ai_up,4)&"</div>"
end if
end if
elseif len(ew_pt)>3 then
icdcf=ew_pt
else
icdcf=""
end if
end if
'___________________________________________________________________________________69
'___________________________________________________________________________________20
elseif left(ai_el,1)=2 then
'媒体类2
'7	图片系统20
'4	资质证书21
'9	媒体系统22
'22媒体系统

'20图片系统21资质证书
if ai_el=20 or ai_el=21 then
if not ainull(ai_up) and (instr(ai_nr,ai_up)=0 or instr(esnr(ai_nr),"@@,")>0) then icdcj=esmm(aiint(ep_qx),1,0,ai_sn,ai_bt,ai_us,eaupsh(2,ai_nr,ai_up,ai_bt,ai_el),eshref(esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urg&g_u4&g_urg&g_gg&g_urz,11),ai_mm,aimm(g_gmm,easdmm,0))
'22媒体系统
else
if not ainull(ai_uf) and instr(ai_nr,ai_uf)=0 then icdcj=esmm(aiint(ep_qx),1,0,ai_sn,ai_bt,ai_us,aiplay(esups(ai_uf,11),"100%","588"),eshref(esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urg&g_u4&g_urg&g_gg&g_urz,11),ai_mm,aimm(g_gmm,easdmm,0))
end if
'___________________________________________________________________________________29
'___________________________________________________________________________________10
else
'文章类1
'1	文章系统10
'3	关于我们11
'14	短文系统12
'15	单页系统13
icdcj=esxup(ai_el,ai_up,ai_nr)
end if
'___________________________________________________________________________________19
'CS------1
end if
'--------------------------------CONTENT 0
icdci=""
if ep_ef<>"5" and i_xkubq>2 and left(eafqh,1)<>"3" then icdci=icdci&usrqm(506,ai_us,us_xy&g_gg&us_qm&g_gg&us_up&g_gg&us_er&g_gg&ai_um)
icdci=icdci&esmm(aiint(ep_qx),0,0,ai_sn,ai_bt,ai_us,esnrgys(esnr(ai_nr),easdpur,easdpg),eshref(esnk(ai_ep)&g_urg&esnf(ai_ef)&g_urg&s_umxx&g_urg&ai_sn&g_urg&g_u4&g_urg&g_gg&g_urz,11),ai_mm,aimm(g_gmm,easdmm,0))


icdcm=""
if icskg(ew_pj,ep_pj,0) then icdcm=icdcm&"<div class=""c-l"">"&eshi(1,ai_id,ai_xi)&"</div>"
if not ainull(ai_eq) then
icdcm=icdcm&"<div class=""c-l"">"
if left(eafqh,1)="7" then
icdcm=icdcm&easeq(s_umso&g_urg&d_seals,ai_eq)
else
icdcm=icdcm&easeq(g_u0&g_urg&g_u1&g_urg&g_u2&g_urg,ai_eq)
end if
icdcm=icdcm&"</div>"
end if

if eafqh<>"73" then
if i_xkyy>0 then
if len(ai_yy)<3 then
if i_xkyy>1 then icdcm=icdcm&"<div class=c-n>转载请注明："&g_u&"</div>"
else
if right(ai_yy,1)="#" then
if i_xkyy>1 then icdcm=icdcm&"<div class=c-n>友情转载："&left(ai_yy,len(ai_yy)-1)&"</div>"
icdcm=icdcm&"<div class=c-n>引用网址："&g_u&"</div>"
else
if left(ai_yy,2)<>"##" then icdcm=icdcm&"<div class=c-n>转载来源："&ai_yy&"</div>"
icdcm=icdcm&"<div class=c-n>当前网址："&g_u&"</div>"
end if
end if
end if
if ep_ef<>"5" then icdcm=icdcm&"<div>"&esbq(ai_ep,ai_ef,ai_sn,ai_us)&"</div>"
icdcm=icdcm&esfx()
end if
'--------------------------------CONTENT 1
icdty=9
if not ainull(ep_ot) and not ainull(ai_ot) then e_mzs="<div class=""f-l b-a f-ls"">"&iccs(6,"ot",ep_ot,ai_ot)&"</div>"
if eafqh="73" and (aibj(left(g_u1,6),"printe") or aibj(left(g_u2,6),"printe")) then icdcf="<div id=""p-sf"">"&replace(easpic(ai_up,ai_bt,ai_bt,ai_up,4),"<img","<img width=200")&"<br></div>"
easshow=easshow&icnr(icdty,ep_dm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
if ai_el=81 then
e_mx=e_mx&ppcartc(i_xkapp)
easshow=easshow&ppcartc(i_xkapp)
end if
if aiint(ai_sb)>0 and ewxgn("pl") and eafqh<>"73" then e_my=e_my&espl(80235,ep_dm,eshref(g_ustring,11),ai_sn,ai_xt,eabiao&"_"&ai_sb,"ai_xt","ai_sn",esapm(1,ai_sn))
if not ainull(e_my) then easshow=easshow&e_my
end if
if eafqh="73" then easshow=airepx(easshow,"<a[^>]+>(.+?)<\/a>","$1")
End Function
'-----------------------------------
'=easeq()
'-----------------------------------
Function easeq(eafqz,eafstr)
dim easqrr,easqii
easeq=""
easqrr=split(replace(eafstr,"，",","),",")
for easqii=0 to ubound(easqrr)
if not ainull(easqrr(easqii)) then
easeq=easeq&" <a href="""&eshref(eafqz&"/0/0/0/0/2/0/"&aijia(easqrr(easqii))&g_urz,11)&""" class=""f-sc"">"&easqrr(easqii)&"</a> "
end if
next
if not ainull(easeq) then easeq="<p class=""tc"">"&easeq&"</p>"
End Function

'-----------------------------------
'ai list show
'=easlist(eafqh,eafuq,eafef,eafpg,eafps,eafph,eafqx,eafqxyz,eafity,eafuqs,eafxpur,eafxpms,eafxpum)
'-----------------------------------
Function easlist(eafqh,eafuq,eafef,eafpg,eafps,eafph,eafqx,eafqxyz,eafity,eafuqs,eafxpur,eafxpms,eafxpum)
if aibj(ep_el,"81") then'jingpai
easlist=pplist(ep_el,eafqh,eafuq,eafef,eafpg,eafps,eafph,eafqx,eafqxyz,eafity,eafuqs,eafxpur,eafxpms,eafxpum)
else
easlist=easlistx(ep_el,eafqh,eafuq,eafef,eafpg,eafps,eafph,eafqx,eafqxyz,eafity,eafuqs,eafxpur,eafxpms,eafxpum)
end if
if ainull(easlist) then

if len(eafqh)=3 and left(eafqh,1)="3" then
e_mx=e_mx&replace(ukme(3),s_uduk&g_urg,s_umgl&g_urg&s_uduk&g_urg)
elseif len(eafqh)=3 and right(eafqh,1)<>"2" then
e_mx=e_mx&icmenu(ep_sx,"","1|"&ep_sn,ef_sn,"9000","14","14px","45px","88|88|880|100%|")&"<div class=cr></div>"
'e_mx=e_mx&icmenu("","k-3","1|"&ep_sn,ef_sn,4009,0,14,28,0)&"<div class=cr></div>"
end if
'cdv 0
e_mx=e_mx&epfl(ep_ef,"",ep_fl,eafef,eshref(eafuq&g_urg&g_gx&g_urg&eafxpms&g_urg&g_urg&g_urg&eafph&g_urz,eafxpum))
'cdv 1
iclls=""&icliqls(0,eafxpms,eshref(eafuqs&g_gg&g_urg&g_urg&g_urg&eafph&g_urz,eafxpum))&""

Call aiss(ep_el,0)
easlist=easlist&icliq(iclls,eafuqs&eafxpms,eafph,eafqxyz,eafity,"ai")
Call aitj(ep_sn&"/"&eafef&"/"&eafph,ep_ef,0)

if aiint(iclapp)>0 or ew_ap<2 or (aiint(eafpg)>1 and ew_ap<4) or aiint(eafps)>0 or len(eafqh)=3 then
g_app=""
else
if aibj(eafxpms,s_umlpy) then
eafps=i_nmhc
if not ainull(g_app) then g_app=g_app&"_"&s_umlpy
else
eafps=i_nmlb
if not ainull(g_app) then g_app=g_app&"_"&s_umlb
end if
end if
if not ainull(g_app) then g_app=esapm(2,g_app)

if left(eafqh,1)="3" and not ainull(uk_us) then
g_app=""
eawhere=replace(eawhere,"ai_xy>0 and","")
eawhere=replace(eawhere," and ai_xy>0","")
eawhere=replace(eawhere,"ai_xy>0","")
if not ainull(eawhere) then eawhere=eawhere&" and "
eawhere=eawhere&"ai_us='"&uk_us&"'"
end if

d_alie=ealie(s_umlb)
if len(eafqh)=3 then g_app=""
'_______________________________________________
if not ainull(eafuqs) and not aibj(right(eafuqs,len(g_urg)),g_urg) then eafuqs=eafuqs&g_urg
if gyslist(eabid,d_alie,eabiao,eawhere,eaorder,eafxpur,eafpg,eafps,2000,g_app) then
lidti=""
'top------0
if aibj(eafxpms,s_umlb) then
if len(eafqh)=3 then lidti=lidti&"<b>管理</b>"
if (i_xkuhy>1 and instr(lcase(g_ud)&"/",s_drwap)=0) or (i_xkuhy>0 and aibj(g_u0,s_umgl)) then lidti=lidti&"<u>会员</u>"
lidti=lidti&"<u>时间</u>"
if (icskg(ew_pj,ep_pj,0) and instr(lcase(g_ud)&"/",s_drwap)=0) or (icskg(ew_pj,ep_pj,0) and aibj(g_u0,s_umgl)) then lidti=lidti&"<i>我顶</i>"
if (ew_dj>2 and instr(lcase(g_ud)&"/",s_drwap)=0) or (ew_dj>0 and aibj(g_u0,s_umgl)) then lidti=lidti&"<i>浏览</i>"
lidti=lidti&"名称"
end if
'top------1
easlist=easlist&iclisttop(eafxpms,lidti)
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
lids1=""
lids2=""
lids3=""
lids4=""
gysay=split(gysax(gysi),g_gy)
if aibj(eafxpms,s_umlpc) then
ai_ss=gysro("ai_nr",eabiao&"_"&gysay(29),"ai_sn='"&gysay(1)&"'","")
else
ai_ss=gysay(8)
end if
if aibj(eafxpms,s_umlpc) then
d_alzy=esmm(aiint(ep_qx),2,0,gysay(1),gysay(2),gysay(6),esnr(ai_ss),eshref(esnk(gysay(11))&g_urg&esnf(gysay(10))&g_urg&s_umxx&g_urg&gysay(1)&g_urg&g_u4&g_urg&g_gg&g_urz,11),gysay(28),"")
Call easzy(3,gysay(0),gysay(1),"0",gysay(2),d_alzy,gysay(28),"")
else
d_alzy=easzy(4,gysay(0),gysay(1),ai_ss,gysay(2),"",gysay(28),"")
end if
lidbt=easlic(1,0,ep_sx,gysay(13),gysay(9),gysay(4),gysay(14),gysay(3),gysay(7))&esto(gysay(13),gysay(2),d_alzy)&easlic(1,1,ep_sx,gysay(13),gysay(9),gysay(4),gysay(14),gysay(3),gysay(7))
lidtt=eaalt(esto(gysay(13),gysay(2),d_alzy),gysay(3),gysay(4),gysay(5),usren(gysay(6)&g_gg&gysay(12)),gysay(23))
if ainull(eafuqs) or left(eafqh,1)="5" then
lidlj=eaurl(gysay(11)&g_urg&esnf(gysay(10))&g_urg&s_umxx&g_urg&gysay(1)&g_urz,eafxpum,esnk(gysay(11)),gysay(26))
else
lidlj=eshref(eafuqs&s_umxx&g_urg&gysay(1)&g_urz,eafxpum)
end if

lidgl=""
if (eafqx>0 and len(eafqh)>2) or (aibj(gysay(6),e_uer) and e_uer<>"") then
lidgl=lidgl&"<b>"
if  eafqx>1 and left(eafqh,1)<>"3" then lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"
lidgl=lidgl&aibuttonk(eshref(eafuqs&s_umxg&g_urg&gysay(0)&g_urz,eafxpum),"","","","f-sb",s_umxgs)
if aiint(gysay(6))<2 and (aiint(e_uzy)>1 or e_gdj>1) then lidgl=lidgl&aibuttonk(eshref(eafuqs&s_umsc&g_urg&gysay(0)&g_urg&gysay(1)&g_urz,eafxpum),s_umscs&s_udeas&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if

'top loop------0
'list
if aibj(eafxpms,s_umlb) then
if (i_xkuhy>1 and instr(lcase(g_ud)&"/",s_drwap)=0) or (i_xkuhy>0 and aibj(g_u0,s_umgl)) then lids1=lids1&"<u>"&usren(gysay(6)&g_gg&gysay(12))&"</u>"
lids1=lids1&"<u>"&aitmx(gysay(3),10)&"</u>"
if (icskg(ew_pj,ep_pj,0) and instr(lcase(g_ud)&"/",s_drwap)=0) or (icskg(ew_pj,ep_pj,0) and aibj(g_u0,s_umgl)) then lids1=lids1&"<i>"&aiint(gysay(5)&g_gg&"0")&"</i>"
if (ew_dj>2 and instr(lcase(g_ud)&"/",s_drwap)=0) or (ew_dj>0 and aibj(g_u0,s_umgl)) then lids1=lids1&"<i>"&aiint(gysay(4)&g_gg&"0")&"</i>"
'yun qian&pic
elseif aibj(eafxpms,s_umlpy) or aibj(eafxpms,s_umlp) then
if aibj(eafxpms,s_umlp) then
lids1=easpic(gysay(7),esto(gysay(13),gysay(2),d_alzy),lidtt,lidlj,0)
elseif aibj(eafxpms,s_umlpy) then
if not ainull(gysay(7)) then lids1=easpic(gysay(7),esto(gysay(13),gysay(2),d_alzy),lidtt,lidlj,11)
if not ainull(gysay(24)) then lids3=gysay(24)
lids4=gysay(4)
else
if not ainull(gysay(7)) then lids1=easpic(gysay(7),esto(gysay(13),gysay(2),d_alzy),lidtt,lidlj,10)
if not ainull(gysay(24)) then lids3=gysay(24)
lids4=gysay(4)
end if
'CS--0
lids2=usren(gysay(6)&g_gg&gysay(12))
lids2=lids2&g_gg&iclcs(1,gysay(13),gysay(15),gysay(16),"")
'CS--1
'other pic pic+con con
else
if ainull(gysay(28)) or aibj(gysay(28),aimm(g_gmm,"0",0)) then
lids2=d_alzy
elseif not ainull(d_alzy) then
lids2=s_ztmm
else
lids2=""
end if
e_ler=usren(gysay(6)&g_gg&gysay(12))
if i_xkuhy>1 and not ainull(e_ler) then lids3=lids3&"发布："&e_ler&" "
if ew_dj>2 and ewxgn("dj") then lids3=lids3&"浏览："&aiint(gysay(4)&g_gg&"0")&"次 "
if isdate(gysay(3)) and ewxgn("tm") then lids3=lids3&estms(6,gysay(3))
lids3=lids3&iccs(4,"cs",ep_cs,gysay(26))
if not aibj(eafxpms,s_umlbw) then
if not ainull(gysay(7)) then'img
if aibj(eafxpms,s_umlpc) then
lids4=easpic(gysay(7),esto(gysay(13),gysay(2),d_alzy),esto(gysay(13),gysay(2),d_alzy),lidlj,1)
else
lids4=easpic(gysay(7),esto(gysay(13),gysay(2),d_alzy),esto(gysay(13),gysay(2),d_alzy),lidlj,2)
end if
end if
end if
end if
'top loop------1
easlist=easlist&iclist(eafxpms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next

easlist=easlist&iclistend(eafxpms,"")
else
easlist=easlist&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if
'_______________________________________________
if ainull(eafuqs) then
easlist=easlist&iclih(gyspage,eafqxyz,eafity,eshref(s_umsc&"-x"&g_urz,eafxpum),"ai")
else
easlist=easlist&iclih(gyspage,eafqxyz,eafity,eshref(eafuqs&s_umsc&"-x"&g_urz,eafxpum),"ai")
end if
end if
End Function
'-----------------------------------
'=easlp("")
'-----------------------------------
Function easlp(eafstr,eafty)
if not ainull(eafstr) and not aibj(eafstr,"0") then
easlp=esups(eafstr,1)
elseif not ainull(ef_up) and not aibj(ef_up,"0") then
easlp=esups(ef_up,1)
elseif len(eafty)=2 then
easlp=esups("",eafty)
end if
End Function
'-----------------------------------
'=easpic()
'-----------------------------------
Function easpic(eafstr,eafbt,eafbx,eaflj,eafty)
if eafty=0 then
eafstr=easlp(eafstr,11)
else
eafstr=easlp(eafstr,1)
end if

if eafty=10 then
  if not ainull(eafstr) then
  easpic="<img class=""o-imm"" src="""&eafstr&""">"
  else
  easpic=""
  end if
elseif eafty=11 then
  if not ainull(eafstr) then
  easpic="<img src="""&eafstr&""">"
  else
  easpic=""
  end if
else

if not ainull(eafstr) then
dim eslbta,eslbts,eslbtx
if not ainull(eafbt) then
eslbta=" alt="""&eafbt&""""
eslbtx=" title="""&eafbt&""""
if eafty=2 then
eslbts="<span>"&eafbt&"</span>"
elseif eafty>0 then
eslbts="<font>"&eafbt&"</font>"
end if
end if

if ainull(eslbtx) and not ainull(eafbx) then eslbtx=" title="""&eafbx&""""
if eafty=0 then
easpic=easpic&"<img src="""&eafstr&""""&eslbta&">"
elseif eafty<3 then
easpic=easpic&"<a href="""&eaflj&""""&eslbtx&"><img src="""&eafstr&""""&eslbta&"></a>"
elseif eafty=3 or eafty=4 then'show
if left(eaflj,1)<>"/" and not aibj(left(eaflj,7),"http://") then
if not ainull(eaflj) then eaflj=esups(eaflj,1)
end if
if eafty=3 then easpic="<div class=""c-u"">"
if not ainull(eaflj) then
easpic=easpic&"<a"
if eafty=4 then easpic=easpic&" class=""p-sfa"""
easpic=easpic&" href="""&eaflj&""""&eslbtx&">"
end if
easpic=easpic&"<img class=""o-imm"" src="""&eafstr&""""&eslbta&">"
if eafty=3 then easpic=easpic&"<br>"&eslbts
if not ainull(eaflj) then easpic=easpic&"</a>"
if eafty=3 then easpic=easpic&"</div>"
end if
end if
end if
End Function
'-----------------------------------
'=easlic(1,"")
'-----------------------------------
Function easlic(eafkg,eafty,eafsx,eafel,eafxy,eafhi,eafpx,eaftm,eafup)
easlic=""
eafsx=aiint(eafsx)
if eafkg=1 and eafty=0 then
easlic=easlic&icqz(eafel,1,eafxy,eafpx)
elseif eafkg=1 and eafty=1 then
easlic=easlic&ichz(1,eaftm,eafhi,eafup)
end if
End Function
%>