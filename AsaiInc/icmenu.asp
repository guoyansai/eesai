<%
'-----------------------------------
'little Menu
'=menub(edfnm,edfstr=tit|link|tit1|link1)
'-----------------------------------
Function menub(edfnm,edfstr)
menub=""
if ainull(edfstr) then
dim edepall
edepall=epall
menub=menub&"<a href="""&eshref(i_dir,1)&""" class=""y-vta"">网站主页</a>"
if not ainull(edepall) then
gysaxbb=split(edepall,g_gx)
for gysibb=0 to ubound(gysaxbb)
gysaybb=split(gysaxbb(gysibb),g_gy)
menub=menub&"<a href="""&eshref(gysaybb(1)&g_urz,1)&""" class=""y-vta"">"&gysaybb(2)&"</a>"
if gysibb>edfnm+2 then exit for
next
end if
if ewxlt() then menub=menub&"<a href="""&eshref(s_udbb&g_urz,1)&""" class=""y-vta"">网站论坛</a>"
else
dim eddarr,eddi
eddarr=split(edfstr,"|")
for eddi=0 to ubound(eddarr) step 2
if not ainull(eddarr(eddi)) then
menub=menub&"<a href="""&eddarr(eddi+1)&""" class=""y-vta"">"&eddarr(eddi)&"</a>"
end if
next
end if
End Function
'-----------------------------------
'menu
'=icmenu(icfsx,icfby,icftb,icfva,icfty,icfnm,icfsz,icflh,icfot)
'-----------------------------------
Function icmenu(icfsx,icfby,icftb,icfva,icfty,icfnm,icfsz,icflh,icfot)
dim icdtbrr,icdtb0,icdfrr
icdtbrr=split(icftb&"|","|")
icdtb0=aiint(icdtbrr(0))
if icdtb0=5 then'menu show
if ainull(icfva) then
if ainull(e_man) then
icfva=g_u0
else
icfva=e_man
end if
end if
icdfrr=efmrr(icdtb0,s_uded)
if ainull(icdfrr) then
icmenu=icmenushow(icfsx,icfby,efmrr(0,""),icfva,icfty,icfnm,icfsz,icflh,"1|"&icfot)
else
icmenu=icmenushow(icfsx,icfby,icdfrr,icfva,icfty,icfnm,icfsz,icflh,"1|"&icfot)
end if
elseif icdtb0>2 then
icmenu=icmenushow(icfsx,icfby,bbmrr(icdtb0,icdtbrr(1)),icfva,icfty,icfnm,icfsz,icflh,icdtb0&"|"&icfot)
else
icmenu=icmenushow(icfsx,icfby,efmrr(icdtb0,icdtbrr(1)),icfva,icfty,icfnm,icfsz,icflh,icdtb0&"|"&icfot)
end if
End Function
'-----------------------------------
'menu type
'=icmenutype(icfms)
'-----------------------------------
Function icmenutype(icfms)
if aibj(icfms,s_umlpy) then
icmenutype=51
elseif aibj(icfms,s_umlb) then
icmenutype=13
elseif aibj(icfms,s_umlb&"-s") then
icmenutype=12
elseif aibj(icfms,s_umds) then
icmenutype=20
elseif aibj(icfms,s_umds&"-k") then
icmenutype=21
elseif aibj(icfms,s_umds&"-g") then
icmenutype=22
elseif aibj(icfms,s_umds&"-knr") then
icmenutype=29
elseif aibj(left(icfms,len(s_umds&"-m")),s_umds&"-m") then
icmenutype=aiint("4"&right(icfms,1))
elseif aibj(icfms,s_umxs) then
icmenutype=30
elseif aibj(icfms,s_umxs&"-k") then
icmenutype=31
elseif aibj(icfms,s_umxs&"-g") then
icmenutype=32
end if
End Function
'-----------------------------------
'★1icfsx,[色系0主色|1辅助色|2跳跃色|3无色]<br>
'★2icfby=边框样式，d-1列表下划线|d-2背景颜色|d-3动态划过|d-4彩色文字<br>
'★3icftb,显示范围，L1+SN{1频道|2分类|3帖子}+SN值，获取gysar数组值<br>
'★4icfva,当前值<br>
'★5icfty,显示样式，L1+R1{
'1普通列表[0顶级|1所有]||
'2大型树形[0大树|1展开大树|2关闭大树|9大树枝叶]||
'3小型树形[0小树|1展开小树|2关闭小树|9小树枝叶]||
'4梯田模式[0普通梯田|2两列梯田|4四列梯田|5五列梯田]||
'5云签模式||
'6多级导航·竖向[0无边框|1有边框]||
'7多级导航·横向[0无边框|1有边框]||
'8二级导航·竖向[0无边框|1有边框]||
'9二级导航·横向[0无边框|1有边框]
'}
'★6icfnm,调用数量<br>
'★7icfsz,字号<br>
'★8icflh,行距<br>
'★9icfot,其他信息组合，使用|隔开<br>
'----1=列数|内容文本字号(>0显示文本简介)|是否显示列表表头0不带-1带|标题字数<br>
'----2/3=缩进宽度|内容文本字号(>0显示文本简介)|是否显示列表表头0不带-1带|标题字数<br>
'----4=子类宽度0表示不控制<br>
'----5=0宽度<br>
'----6=顶级宽度|子级宽度|导航高度<br>
'----7=顶级宽度|子级宽度|导航宽度<br>
'----8=顶级宽度|子级宽度|子级总宽|子级总高|导航高度<br>
'----9=顶级宽度|子级宽度|子级总宽|导航宽度<br>
'@@ef_id,1ef_ew,2ef_sx,3ef_dx,4ef_jx,5ef_xx,6ef_sn,7ef_bt,8ef_ot,9ef_up,10ef_tm,11ef_xi,12ef_xy,13ef_ep,14ef_nr
'@@bb_id,1bb_ew,2bb_sx,3bb_dx,4bb_jx,5bb_xx,6bb_sn,7bb_bt,8bb_ot,9bb_up,10bb_tm,11bb_xi,12bb_xy,13bb_ef,14bb_zi,15bb_hi,16bb_qx,17bb_jj,18bb_mm,19bb_us,20bb_um,(21bb_nr)
'-----------------------------------
Function icmenushow(icfsx,icfby,icfrr,icfva,icfty,icfnm,icfsz,icflh,icfot)
dim icdy1,icdy2:icdy1=aiint(left(icfty,1)):icdy2=aiint(right(icfty,1))
dim icdotrr,icdot0,icdot1,icdot2,icdot3,icdot4,icdot5,icdotlen
dim icdicg,icdlinrr:icdlinrr=icfrr
dim icdcss,icdtl,icdiq,icdbt,icdss,icdih,icdlj,icdat,icdqt:icdtl=0
dim icdpt,icdpn
dim esdkn,esdii
dim muxrr,muxud,muxzjx,mubjjx,muscjx,muuli,muscxx,muxzxy,muscxy,muxzsn,muscsn,muscnr,muscnrs,muscci
if not ainull(icdlinrr) then
icfnm=aiint(icfnm)
icdotrr=split(icfot&"|||||","|")
icdot0=aiint(icdotrr(0)):icdot1=icdotrr(1):icdot2=icdotrr(2):icdot3=icdotrr(3):icdot4=icdotrr(4):icdot5=icdotrr(5)
icdcss=" style="""
icdcss=icdcss&"font-size:"&iccg(icfsz,"14px")&";"
icdcss=icdcss&"line-height:"&iccg(icflh,"160%")&";"
icdcss=icdcss&""""
gysax=split(icdlinrr,g_gx)
e_idi=0
e_idu=ubound(gysax)

'TOP------K
icfsx=aiint(icfsx)
if icdy1<6 then
if aiint(icfsx)>0 then icmenushow=icmenushow&"<div class=""gys"&icfsx&""">"
if not ainull(icfby) then icmenushow=icmenushow&"<div class="""&icfby&""">"
end if
if icdy1=1 then
icdot0=aiint(icdot0)
icdot2=aiint(icdot2)
if icdot2>10 then
icdot2=" style=""font-size:"&icdot2&"px;"""
elseif icdot2>0 then
icdot2=" style=""font-size:12px;"""
else
icdot2=""
end if
icdot3=aiint(icdot3)
icmenushow=icmenushow&"<div class=""l-sa"""&icdcss&">"
if icdot3=1 and instr(lcase(g_ud)&"/",s_drwap)=0 then
if icdot0>2 then
icmenushow=icmenushow&"<li class=""l-2"">"
icmenushow=icmenushow&"<u>发布人</u>"
icmenushow=icmenushow&"<u>时间</u>"
if icskg(ew_pj,ep_pj,0) then icmenushow=icmenushow&"<i>我顶</i>"
if ew_dj>1 then
icmenushow=icmenushow&"<i>回帖</i>"
icmenushow=icmenushow&"<i>点击</i>"
end if
icmenushow=icmenushow&"标题"
icmenushow=icmenushow&"</li>"
else
icmenushow=icmenushow&"<li class=""l-2"">"
icmenushow=icmenushow&"<u>时间</u>"
if icskg(ew_pj,ep_pj,0) then icmenushow=icmenushow&"<i>我顶</i>"
icmenushow=icmenushow&"名称"
icmenushow=icmenushow&"</li>"
end if
end if

elseif icdy1=2 or icdy1=3 then
icdot0=aiint(icdot0)
icdot2=aiint(icdot2)
if icdot2>10 then
icdot2=" style=""font-size:"&icdot2&"px;"""
elseif icdot2>0 then
icdot2=" style=""font-size:12px;"""
else
icdot2=""
end if
icdot3=aiint(icdot3)
dim esxrr,esxud,esdluq,esdluqq
dim eslj,esli,trlcss,eslstt,eslstc,esxzjx,esbjjx,esscjx,esuli,esscxx,esscxy,esscsn
e_ii=aiint(e_ii)+1
esli=0
eslj=0
if icdot1>0 then icmenushow=icmenushow&"<style>#l-m"&e_ii&"r u,#l-m"&e_ii&"r i{height:"&iccg(icflh,"28px")&";}</style>"
icmenushow=icmenushow&vbNewLine&"<div id=""l-m"&e_ii&"r"" class=""l-ra"""&icdcss&"><ul>"&vbNewLine
icmenushow=icmenushow&"<script language=""javascript"" type=""text/javascript"">function eictreejs"&e_ii&"(tid) {if (document.getElementById(""EESaitreei"&e_ii&""" + tid).style.display == ""none"") {document.getElementById(""EESaitreei"&e_ii&""" + tid).style.display=""block"";document.getElementById(""EESaitreeimg"&e_ii&""" + tid).className='p-on p-o0 glyphicon glyphicon-minus-sign';} else {document.getElementById(""EESaitreei"&e_ii&""" + tid).style.display=""none"";document.getElementById(""EESaitreeimg"&e_ii&""" + tid).className='p-on p-o0 glyphicon glyphicon-plus-sign';}}</script>"&vbNewLine
if icdot3=1 and instr(lcase(g_ud)&"/",s_drwap)=0 then
if icdot0>2 then
icmenushow=icmenushow&"<li class=""l-2"">标题"
icmenushow=icmenushow&"<u>时间</u>"
if ew_dj>1 then icmenushow=icmenushow&"<i>回复</i><i>点击</i>"
icmenushow=icmenushow&"<u>发布</u></li>"
else
icmenushow=icmenushow&"<li class=""l-2"">标题"
icmenushow=icmenushow&"<u>时间</u>"
if icskg(ew_pj,ep_pj,0) then icmenushow=icmenushow&"<i>我顶</i>"
icmenushow=icmenushow&"</li>"
end if
end if

elseif icdy1=4 then
e_ii=aiint(e_ii)+1
icdot1=aiint(icdot1)
if icdot1>0 then icmenushow=icmenushow&"<style>#l-m"&e_ii&"m div.l-mc>div{float:left;width:"&iccg(icdot1,"25%")&";}</style>"
if icdy2=9 then
icmenushow=icmenushow&"<div id=""l-m"&e_ii&"m"" class=""l-qa"">"
esdkn=""
else
if icdy2<2 then
esdkn=""
else
esdkn=(100/icdy2)&"%"
end if
icmenushow=icmenushow&"<div id=""l-m"&e_ii&"m"" class=""l-ma"">"
end if
elseif icdy1=5 then
if icdy2=1 then
icmenushow=icmenushow&"<div class=""l-qa"""&icdcss&">"
icdcss=""
else
icmenushow=icmenushow&"<div class=""l-qb"""&icdcss&">"
icdcss=" style=""float:left;width:"&iccg(icdot1,"200px")&";"""
end if
elseif icdy1>5 then
e_ii=aiint(e_ii)+1
if icdy1=9 then
icmenushow=icmenushow&"<style>#l-m"&e_ii&"z a{height:"&iccg(icflh,"45px")&";}#l-m"&e_ii&"z .l-mu{height:"&iccg(icflh,"45px")&";}#l-m"&e_ii&"z .l-mu a{text-align:center;}#l-m"&e_ii&"z ul.l-mua>li{position:relative;float:left;width:"&iccg(icdot1,"120px")&";}#l-m"&e_ii&"z ul.l-mub{position:absolute;top:"&iccg(icflh,"45px")&";left:0px;width:"&iccg(icdot3,"240px")&";}#l-m"&e_ii&"z ul.l-mub li{float:left;width:"&iccg(icdot2,"50%")&";}#l-m"&e_ii&"z{margin:0px auto;max-width:"&iccg(icdot4,"auto")&";}#l-m"&e_ii&"z ul.l-mubr{margin-left:-"&iccgx(0,icdot3,icdot1)&";}"
if icdy2=1 then
icmenushow=icmenushow&"#l-m"&e_ii&"z ul.l-mub{padding:1px 0px 0px 1px;}#l-m"&e_ii&"z ul.l-mua>li{border-bottom:0px;}"
else
icmenushow=icmenushow&"#l-m"&e_ii&"z li{border:0px;}"
end if
icmenushow=icmenushow&"</style>"
elseif icdy1=8 then
icmenushow=icmenushow&"<style>#l-m"&e_ii&"z a{height:"&iccg(icflh,"45px")&";}#l-m"&e_ii&"z .l-mu{width:"&iccg(icdot1,"200px")&";}#l-m"&e_ii&"z .l-mu li{height:"&iccg(icflh,"45px")&";}#l-m"&e_ii&"z a{text-align:left;}#l-m"&e_ii&"z ul.l-mua>li>a{border-right:0px;}#l-m"&e_ii&"z ul.l-mub{position:absolute;top:0px;left:"&iccg(icdot1,"200px")&";width:"&iccg(icdot3,"200px")&";min-height:"&iccg(icdot4,"200px")&";}#l-m"&e_ii&"z ul.l-mub li{float:left;width:"&iccg(icdot2,"25%")&";}#l-m"&e_ii&"z{height:"&iccg(icdot5,"auto")&";}"
if icdy2=1 then
icmenushow=icmenushow&"#l-m"&e_ii&"z ul.l-mub{padding:1px 0px 0px 1px;}"
else
icmenushow=icmenushow&"#l-m"&e_ii&"z li{border:0px;}"
end if
icmenushow=icmenushow&"</style>"
elseif icdy1=7 then
icmenushow=icmenushow&"<style>#l-m"&e_ii&"z a{text-align:center;height:"&iccg(icflh,"45px")&";}#l-m"&e_ii&"z .l-mu li{height:"&iccg(icflh,"45px")&";width:"&iccg(icdot2,"160px")&";}#l-m"&e_ii&"z ul.l-mua>li{float:left;width:"&iccg(icdot1,"160px")&";}#l-m"&e_ii&"z ul.l-mub,#l-m"&e_ii&"z ul.l-muc{position:relative;width:"&iccg(icdot2,"160px")&";}#l-m"&e_ii&"z ul.l-mubr{margin-left:-"&iccgx(0,icdot2,icdot1)&";}#l-m"&e_ii&"z ul.l-muc{margin:-"&iccg(icflh,"45px")&" 0 0 "&iccg(icdot2,"160px")&";}#l-m"&e_ii&"z,#l-m"&e_ii&"z .l-mu{height:"&iccg(icflh,"45px")&";}#l-m"&e_ii&"z{margin:0px auto;max-width:"&iccg(icdot3,"auto")&";}"
if icdy2=1 then
icmenushow=icmenushow&"#l-m"&e_ii&"z ul.l-mub,#l-m"&e_ii&"z ul.l-muc{padding:1px 0px 0px 1px;}#l-m"&e_ii&"z ul.l-mua>li,#l-m"&e_ii&"z ul.l-mub,#l-m"&e_ii&"z ul.l-muc{border-bottom:0px;}"
else
icmenushow=icmenushow&"#l-m"&e_ii&"z li{border:0px;}"
end if
icmenushow=icmenushow&"@media (max-width:760px) {#l-m"&e_ii&"z ul.l-mua>li{width:50%;}#l-m"&e_ii&"z ul.l-muc{margin:0;}}"&vbNewLine&"</style>"
else
icmenushow=icmenushow&"<style>#l-m"&e_ii&"z a{height:"&iccg(icflh,"45px")&";}#l-m"&e_ii&"z .l-mu{width:"&iccg(icdot1,"160px")&";}#l-m"&e_ii&"z .l-mu li{height:"&iccg(icflh,"45px")&";}#l-m"&e_ii&"z .l-mu a{text-align:left;}ul.l-mua>li{width:"&iccg(icdot1,"160px")&";}#l-m"&e_ii&"z ul.l-muc{position:relative;width:"&iccg(icdot2,"160px")&";margin:-"&iccg(icflh,"45px")&" 0 0 "&iccg(icdot2,"160px")&";}#l-m"&e_ii&"z ul.l-mua>li>ul.l-muc{margin:-"&iccg(icflh,"45px")&" 0 0 "&iccg(icdot1,"160px")&";}#l-m"&e_ii&"z{height:"&iccg(icdot3,"auto")&";}"
if icdy2=1 then
icmenushow=icmenushow&"#l-m"&e_ii&"z ul.l-muc{padding:1px 0px 0px 1px;}"
else
icmenushow=icmenushow&"#l-m"&e_ii&"z li{border:0px;}"
end if
icmenushow=icmenushow&"</style>"
end if
icmenushow=icmenushow&"<div id=""l-m"&e_ii&"z"""&icdcss&">"
icmenushow=icmenushow&vbNewLine&"<div class=""l-mu""><ul class=""l-mua"">"&vbNewLine
end if

'for ur bt
dim icdtitur,icdtitgl,icdtitic
if len(icfty)=4 then
icdtitgl=0
elseif len(icfty)=3 then
icdtitgl=2
elseif aibj(g_u0,s_umgl) then
icdtitgl=1
else
icdtitgl=0
end if
'TOP------for
for gysi=0 to e_idu
gysay=split(gysax(gysi)&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy,g_gy)
'response.Write e_idi&"==="&icfnm&"<br><br>"
if e_idi>icfnm and icfnm>0 then
exit for
else
if icdy1<4 and aiint(icdot4)>0 then
icdotlen=aiint(icdot4)
else
icdotlen=0
end if
if icdot0>2 then
icdtitur=icmenuurl(icdotlen,1,icdtitgl,icdy1,icfva,icdot0,gysay(13),gysay(0),gysay(3),gysay(6),gysay(7),gysay(8),gysay(9),gysay(10),gysay(12),gysay(15),gysay(14))
icdtitic=iclbico(1,"comment",muscxy)
else
icdtitur=icmenuurl(icdotlen,1,icdtitgl,icdy1,icfva,icdot0,gysay(13),gysay(0),gysay(3),gysay(6),gysay(7),gysay(8),gysay(9),gysay(10),gysay(12),gysay(11),gysay(12))
icdtitic=iclbico(1,"tag",muscxy)
end if
'文字
if icdy1=1 then
if gysi mod 2=0 then
icmenushow=icmenushow&"<li class=""l-1"">"
else
icmenushow=icmenushow&"<li>"
end if
if icdot3=1 and instr(lcase(g_ud)&"/",s_drwap)=0 then
if icdot0>2 then
icmenushow=icmenushow&"<u title="&gysay(19)&">"&aileft(usren(gysay(19)&g_gg&gysay(20)),7)&"</u>"
icmenushow=icmenushow&"<u>"&aitmx(gysay(10),10)&"</u>"
if ew_dj>1 then
icmenushow=icmenushow&"<i>"&gysay(11)&"</i>"
icmenushow=icmenushow&"<i>"&gysay(14)&"</i>"
icmenushow=icmenushow&"<i>"&gysay(15)&"</i>"
end if
else
icmenushow=icmenushow&"<u>"&aitmx(gysay(10),10)&"</u>"
if ew_dj>1 then icmenushow=icmenushow&"<i>"&gysay(11)&"</i>"
end if
end if
icmenushow=icmenushow&icdtitur
if icdot0>2 and icdy2=9 then
muscnr=esmm(aiint(gysay(16)),5,aiint(gysay(17)),gysay(6),gysay(7),gysay(19),esnr(gysay(21)),eshref(s_udbb&g_urg&gysay(13)&g_urg&s_umxx&g_urg&gysay(6)&g_urg&g_urg&g_gg&g_urz,66),gysay(18),aimm(g_gmm,g_u5,0))&esxup(0,gysay(9),gysay(21))
else
muscnr=gysay(8)
end if
if (icdy2=9 or icdot2<>"") and not ainull(muscnr) then icmenushow=icmenushow&"<div class=""l-rd"""&icdot2&"><div class=""b-cb pdo"">"&muscnr&"</div></div>"
icmenushow=icmenushow&"</li>"

'梯田
elseif icdy1=4 then
if gysi=0 then
esdii=0
icmenushow=icmenushow&"<li class=""l-1"""
if esdkn<>"" then icmenushow=icmenushow&" style=""float:left;width:"&esdkn&";"""
icmenushow=icmenushow&">"
icmenushow=icmenushow&"<div class=""l-mb"">"
icmenushow=icmenushow&icdtitur
icmenushow=icmenushow&"</div><div class=""l-mc"">"
elseif aiint(gysay(4))=1 then
esdii=esdii+1
icmenushow=icmenushow&"</div>"
if icdot1>0 then icmenushow=icmenushow&"<div class=cr></div>"
icmenushow=icmenushow&"</li>"&vbNewLine&vbNewLine
if esdii mod 2=0 then
icmenushow=icmenushow&"<li class=""l-1"""
else
icmenushow=icmenushow&"<li"
end if
if esdkn<>"" then icmenushow=icmenushow&" style=""float:left;width:"&esdkn&";"""
icmenushow=icmenushow&"><div class=""l-mb"">"
icmenushow=icmenushow&icdtitur
icmenushow=icmenushow&"</div><div class=""l-mc"">"
else
if icdot1>0 then
icmenushow=icmenushow&"<div>"&icdtitur&"</div>"
else
icmenushow=icmenushow&icdtitur
end if
end if

'云签
elseif icdy1=5 then
if gysi mod 2=0 then
icmenushow=icmenushow&"<li"
else
icmenushow=icmenushow&"<li class=""l-1"""
end if
icmenushow=icmenushow&icdcss&">"&icdtitur&"</li>"


'树形
elseif icdy1=2 or icdy1=3 then
if gysi=0 then
eslj=eslj+1
icmenushow=icmenushow&"<li>"&icdtitur
if icdot3=1 and instr(lcase(g_ud)&"/",s_drwap)=0 then
if icdot0>2 then
icmenushow=icmenushow&"<u>"&aitmx(gysay(10),10)&"</u>"
if ew_dj>1 then
icmenushow=icmenushow&"<i>"&gysay(14)&"</i>"
icmenushow=icmenushow&"<i>"&gysay(15)&"</i>"
end if
'response.Write aileft(usren(gysay(19)&g_gg&gysay(20)),7)&now&"<br><br><br><br><br>"
icmenushow=icmenushow&"<u title="&gysay(19)&">"&aileft(usren(gysay(19)&g_gg&gysay(20)),7)&"</u>"
else
icmenushow=icmenushow&"<u>"&aitmx(gysay(10),10)&"</u>"
if ew_dj>1 then icmenushow=icmenushow&"<i>"&gysay(11)&"</i>"
end if
end if
muscjx=aiint(gysay(4))
muscxy=aiint(gysay(12))
muscsn=gysay(6)
if icdot0>2 and icdy2=9 then
muscnr=esmm(aiint(gysay(16)),5,aiint(gysay(17)),gysay(6),gysay(7),gysay(19),esnr(gysay(21)),eshref(s_udbb&g_urg&gysay(13)&g_urg&s_umxx&g_urg&gysay(6)&g_urg&g_urg&g_gg&g_urz,66),gysay(18),aimm(g_gmm,g_u5,0))&esxup(0,gysay(9),gysay(21))
else
muscnr=gysay(8)
end if
else
muxzjx=aiint(gysay(4))
muxzxy=aiint(gysay(12))
muxzsn=gysay(6)
'--------------------------------------------------------0
if icdy1=3 then
	  if muxzjx=0 or muxzjx=1 then
	  eslj=eslj+1
	  esli=0
	  icmenushow=icmenushow&icdtitic&""&muscnrs&""
	  if muscjx=0 or muscjx=1 then
	  icmenushow=icmenushow&"</li>"&vbNewLine
	  else
	  icmenushow=icmenushow&"</li></ul>"&vbNewLine
	  end if
	  if eslj mod 2=0 then:icmenushow=icmenushow&"<li class=""l-1"">":else:icmenushow=icmenushow&"<li>":end if
	  else
	  esli=esli+1
	  if muscjx=0 or muscjx=1 then
	  if (muscxy>1 and not icdy2=2) or icdy2=9 or icdy2=1 or instr(icfva,muscsn)>0 then
	  icmenushow=icmenushow&"<span class=""p-on p-o0 glyphicon glyphicon-minus-sign"" onClick=""eictreejs"&e_ii&"("&gysi&")"" id=""EESaitreeimg"&e_ii&""&gysi&"""></span>"&muscnrs&"<ul id=""EESaitreei"&e_ii&""&gysi&""" style=""padding-left:"&iccg(icdot1,"6px")&";"">"
	  else
	  icmenushow=icmenushow&"<span class=""p-on p-o0 glyphicon glyphicon-plus-sign"" onClick=""eictreejs"&e_ii&"("&gysi&")"" id=""EESaitreeimg"&e_ii&""&gysi&"""></span>"&muscnrs&"<ul id=""EESaitreei"&e_ii&""&gysi&""" style=""padding-left:"&iccg(icdot1,"6px")&";display:none;"">"
	  end if
	  treejsl=treejsl&"eictreejs"&e_ii&"("&gysi&");"
	  else
	  icmenushow=icmenushow&icdtitic&""&muscnrs&"</li>"&vbNewLine
	  end if
	  if esli mod 2=0 then:icmenushow=icmenushow&"<li class=""l-3"">":else:icmenushow=icmenushow&"<li class=""l-4"">":end if
	  end if
else
	  mubjjx=muscjx-muxzjx
	  if mubjjx=0 then
	  icmenushow=icmenushow&icdtitic&""&muscnrs&"</li>"&vbNewLine
	  elseif mubjjx<0 then
	  if muxzjx=0 or muxzjx=1 then
	  icmenushow=icmenushow&icdtitic&""&muscnrs&"</li>"&vbNewLine
	  else
	  if (muscxy>1 and not icdy2=2) or icdy2=9 or icdy2=1 or instr(icfva,muscsn)>0 then
	  icmenushow=icmenushow&"<span class=""p-on p-o0 glyphicon glyphicon-minus-sign"" onClick=""eictreejs"&e_ii&"("&gysi&")"" id=""EESaitreeimg"&e_ii&""&gysi&"""></span>"&muscnrs&"<ul id=""EESaitreei"&e_ii&""&gysi&""" style=""padding-left:"&iccg(icdot1,"6px")&";"">"
	  else
	  icmenushow=icmenushow&"<span class=""p-on p-o0 glyphicon glyphicon-plus-sign"" onClick=""eictreejs"&e_ii&"("&gysi&")"" id=""EESaitreeimg"&e_ii&""&gysi&"""></span>"&muscnrs&"<ul id=""EESaitreei"&e_ii&""&gysi&""" style=""padding-left:"&iccg(icdot1,"6px")&";display:none;"">"
	  end if
	  treejsl=treejsl&"eictreejs"&e_ii&"("&gysi&");"
	  end if
	  else
	  icmenushow=icmenushow&icdtitic&""&muscnrs&""
	  
	  For muuli=1 To mubjjx
	  if muuli=1 then
	  icmenushow=icmenushow&"</li>"&vbNewLine&"</ul></li>"&vbNewLine
	  else
	  icmenushow=icmenushow&"</ul></li>"&vbNewLine
	  end if
	  Next
	  end if
if muxzjx=0 or muxzjx=1 then
eslj=eslj+1
esli=0
if eslj mod 2=0 then:icmenushow=icmenushow&"<li class=""l-1"">":else:icmenushow=icmenushow&"<li>":end if
else
esli=esli+1
if esli mod 2=0 then:icmenushow=icmenushow&"<li class=""l-3"">":else:icmenushow=icmenushow&"<li class=""l-4"">":end if
end if
end if
  icmenushow=icmenushow&icdtitur
  if icdot3=1 and instr(lcase(g_ud)&"/",s_drwap)=0 then
  if icdot0>2 then
  icmenushow=icmenushow&"<u>"&aitmx(gysay(10),10)&"</u>"
  if ew_dj>1 then
  icmenushow=icmenushow&"<i>"&gysay(14)&"</i>"
  icmenushow=icmenushow&"<i>"&gysay(15)&"</i>"
  end if
  icmenushow=icmenushow&"<u title="&gysay(19)&">"&aileft(usren(gysay(19)&g_gg&gysay(20)),7)&"</u>"
  else
  icmenushow=icmenushow&"<u>"&aitmx(gysay(10),10)&"</u>"
  if ew_dj>1 then icmenushow=icmenushow&"<i>"&gysay(11)&"</i>"
  end if
  end if
'--------------------------------------------------------1
muscjx=muxzjx
muscxy=muxzxy
muscsn=muxzsn
if icdot0>2 and icdy2=9 then
muscnr=esmm(aiint(gysay(16)),5,aiint(gysay(17)),gysay(6),gysay(7),gysay(19),esnr(gysay(21)),eshref(s_udbb&g_urg&gysay(13)&g_urg&s_umxx&g_urg&gysay(6)&g_urg&g_urg&g_gg&g_urz,66),gysay(18),aimm(g_gmm,g_u5,0))&esxup(0,gysay(9),gysay(21))
else
muscnr=gysay(8)
end if
end if
if (icdy2=9 or icdot2<>"") and not ainull(muscnr) then
muscnrs="<div class=""l-rd"""&icdot2&"><div class=""b-cb pdo"">"&muscnr&"</div></div>"
else
muscnrs=""
end if

'菜单
elseif icdy1>5 then
if aibj(gysay(4),"1") then
e_idi=e_idi+1
if e_idi>icfnm then exit for
if e_tci>muscci and muscci>0 then icmenushow=replace(icmenushow," class=""l-vau""","")
muscci=e_tci
end if
if gysi=0 then
icmenushow=icmenushow&"<li>"&icdtitur
muscjx=aiint(gysay(4))
else
muxzjx=aiint(gysay(4))
'--------------------------------------------------------0
if icdy1=8 or icdy1=9 then
if muxzjx=0 or muxzjx=1 then
if muscjx=0 or muscjx=1 then
icmenushow=icmenushow&"</a></li>"&vbNewLine&"<li>"
else
icmenushow=icmenushow&"</a></li></ul>"&vbNewLine&"<li>"
end if
else
if muscjx=0 or muscjx=1 then
if icdy1=8 then icmenushow=icmenushow&"<i>&gt;</i>"
icmenushow=icmenushow&"</a><ul class=""l-mub"
if e_idi>int(icfnm/2) then icmenushow=icmenushow&" l-mubr"
icmenushow=icmenushow&""">"&vbNewLine&"<li>"
else
icmenushow=icmenushow&"</a></li>"&vbNewLine&"<li>"
end if
end if
else
mubjjx=muscjx-muxzjx
if mubjjx=0 then
  icmenushow=icmenushow&"</a></li>"&vbNewLine&"<li>"
elseif mubjjx<0 then
  if muxzjx=0 or muxzjx=1 then
  icmenushow=icmenushow&"</a></li>"&vbNewLine&"<li>"
  elseif muxzjx=2 and icdy1=7 then
  icmenushow=icmenushow&"</a><ul class=""l-mub"
  if e_idi>int(icfnm/2) then icmenushow=icmenushow&" l-mubr"
  icmenushow=icmenushow&""">"&vbNewLine&"<li>"
  else
  icmenushow=icmenushow&"<i>&gt;</i></a><ul class=""l-muc"">"&vbNewLine&"<li>"
  end if
else
  icmenushow=icmenushow&"</a>"
  For muuli=1 To mubjjx
  if muuli=1 then
  icmenushow=icmenushow&"</li>"&vbNewLine&"</ul></li>"&vbNewLine
  else
  icmenushow=icmenushow&"</ul></li>"&vbNewLine
  end if
  Next
if e_idi>icfnm and icfnm>0 and (muxzjx=0 or muxzjx=1) then exit for
  icmenushow=icmenushow&"<li>"
end if
end if
icmenushow=icmenushow&icdtitur
'--------------------------------------------------------1
muscjx=muxzjx
end if

end if
if gysi=e_idu and ew_cf>2 and e_idi<icfnm then gysi=-1
end if
next
'TOP------E
if icdy1=1 then
icmenushow=icmenushow&"</div>"
elseif icdy1=4 then
icmenushow=icmenushow&"</div></li></div>"
icmenushow=replace(icmenushow,"<div class=""l-mc""></div>","")
elseif icdy1=5 then
icmenushow=icmenushow&"</div>"
elseif icdy1=2 or icdy1=3 or icdy1>5 then
if (icdy1=8 or icdy1=9 or icdy1=3) and muscjx>2 then muscjx=2
if icdy1>5 then
icmenushow=icmenushow&"</a></li>"&vbNewLine
if muscjx>1 then
For muuli=2 To muscjx
icmenushow=icmenushow&"</ul></li>"&vbNewLine
Next
end if
else
icmenushow=icmenushow&icdtitic&""&muscnrs&""
icmenushow=icmenushow&"</li>"&vbNewLine
if muscjx>1 then
For muuli=2 To muscjx
icmenushow=icmenushow&"</ul></li>"&vbNewLine
Next
end if
end if
icmenushow=icmenushow&"<ul></div>"
if icdy1>5 then icmenushow=icmenushow&"</div>"
end if

if icdy1<6 then
if not ainull(icfby) then
if left(icfby,1)="k" then icmenushow=icmenushow&"<div class=""cr""></div>"
icmenushow=icmenushow&"</div>"
end if
if icfsx>0 then icmenushow=icmenushow&"</div>"
end if
end if

End Function
'-----------------------------------
'menu url
'icflk=链接0关闭|1打开
'icfgl=管理0关闭|1打开|2select
'icfty1
'icfva
'icffy=left(icftb,1)0/1ef|2bb
'icffp=icfep/'icfef
'icfid
'icfdx
'icfsn
'icfbt
'icfot简介
'icfup
'icftm
'icfxy
'icfhi浏览
'icfxi热度/喜欢/回帖
'-----------------------------------
Function icmenuurl(icfln,icflk,icfgl,icfty1,icfva,icffy,icffp,icfid,icfdx,icfsn,icfbt,icfot,icfup,icftm,icfxy,icfhi,icfxi)
icmenuurl=""
'link
if icflk=1 and icfgl<>2 then
icmenuurl=icmenuurl&"<a"
if icfgl=2  then icmenuurl=icmenuurl&" target=""_blank"""
if aibj(icfdx,"0") then
if (instr(aitz(6,icfva),aitz(6,icfsn))>0 and icfty1>5) or aibj(icfsn,left(icfva,len(icfsn))) then
e_tci=len(icfsn)+instr(icfva,icfsn)
icmenuurl=icmenuurl&" class=""l-va"
if icfty1>5 then icmenuurl=icmenuurl&"u"
icmenuurl=icmenuurl&""""
end if
elseif aibj(icfsn,icfva) or instr(", "&icfva&",",", "&icfsn&",")>0 then
e_tci=len(icfsn)+instr(icfva,icfsn)
icmenuurl=icmenuurl&" class=""l-va"
if icfty1>5 then icmenuurl=icmenuurl&"u"
icmenuurl=icmenuurl&""""
end if
if aibj(icffp,s_uded) then
icmenuurl=icmenuurl&" href="""&icfot&""""
if aibj(left(icfot,7),"http://") then icmenuurl=icmenuurl&" target=_ablank"
if len(icfbt)>5 then icmenuurl=icmenuurl&" title="""&icfbt&""""
elseif left(icfot,1)="/" or aibj(left(icfot,7),"http://") then
icmenuurl=icmenuurl&" target=_ablank title=""点击打开 "&icfbt&" 链接"" href="""&icfot&""""
else
icmenuurl=icmenuurl&" href="""
if icffy>2 then
if aibj(icfdx,"0") then
icmenuurl=icmenuurl&""&eshref(s_udbb&g_urg&icffp&g_urg&s_umxx&bbxel(1,ef_el)&g_urg&icfsn&g_urz,66)&""
else
icmenuurl=icmenuurl&""&eshref(s_udbb&g_urg&icffp&g_urg&s_umzs&bbxel(1,ef_el)&g_urg&icfsn&g_urz,66)&""
end if
elseif aibj(g_u0,s_umgl) or icfgl=1 then
icmenuurl=icmenuurl&eshref(s_umgl&g_urg&icffp&g_urg&icfsn,1)&""
else
if ainull(icffp) then
icmenuurl=icmenuurl&eshref(icfsn,1)&""
else
icmenuurl=icmenuurl&eshref(icffp&g_urg&icfsn,1)&""
end if
end if
icmenuurl=icmenuurl&""""
if not ainull(icfot) then
icmenuurl=icmenuurl&" title="""&icfot&""""
elseif len(icfbt)>5 then
icmenuurl=icmenuurl&" title="""&icfbt&""""
end if
end if
if icfty1=5 then icmenuurl=icmenuurl&" style="""&esyqs(int(aiint(icfhi)+aiint(icfxi)*10))&""""
icmenuurl=icmenuurl&">"
end if

'ico q
if icfty1<6 and icfty1<>2 and icfty1<>4 and icfty1<>3 and ew_qz=1 and icfgl<>2 then icmenuurl=icmenuurl&iclbico(0,0,aiint(icfxy))

'title
if icfln>0 then
icmenuurl=icmenuurl&aileft(icfbt,icfln)
else
icmenuurl=icmenuurl&icfbt
end if
'ico h
if icfty1<6 then icmenuurl=icmenuurl&" "&ichz(1,icftm,icfhi,"")

'link 1
if icflk=1 and  icfty1<6 and icfgl<>2 then icmenuurl=icmenuurl&"</a>"
'GL
if icfgl=2  then
if icfty1=2 or icfty1=3 then icmenuurl=icmenuurl&"　"
icmenuurl=icmenuurl&"<input"
if instr(", "&icfva&",",", "&icfsn&",")>0 then icmenuurl=icmenuurl&" checked"
icmenuurl=icmenuurl&" type=""checkbox"" id="""&g_gg&""" name="""&g_gg&""" value="""&icfsn&""">"
elseif icfgl=1 and e_gdj>2 and not aibj(g_u1,s_udukw) and not aibj(g_u1,s_uduk) then
if e_gdj>2 then icmenuurl=icmenuurl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&icfid&""">"
if e_gdj>2 then
if icffy<3 then
icmenuurl=icmenuurl&aibuttonk(eshref(s_umgl&g_urg&s_udef&g_urg&icffp&g_urg&s_umtj&g_urg&icfsn&g_urz,77),"","","","f-sb",s_umtjs)&aibuttonk(eshref(s_umgl&g_urg&s_udef&g_urg&icffp&g_urg&s_umxg&g_urg&icfid&g_urz,77),"","","","f-sb",s_umxgs)
elseif icffy>2 then
icmenuurl=icmenuurl&aibuttonk(eshref(s_umgl&g_urg&s_udbb&g_urg&icffp&g_urg&s_umfb&g_urg&icfsn&g_urg&icfdx&g_urz,66),"","","","f-sb",s_umtjs)&aibuttonk(eshref(s_umgl&g_urg&s_udbb&g_urg&icffp&g_urg&s_umxg&g_urg&icfid&g_urz,66),"","","","f-sb",s_umxgs)
end if
end if
if e_gdj>3 then
if icffy<3 then
icmenuurl=icmenuurl&aibuttonk(eshref(s_umgl&g_urg&s_udef&g_urg&icffp&g_urg&s_umsc&g_urg&icfid&g_urg&icfsn&g_urz,77),s_umscs&s_ztqr,"","","f-sb",s_umscs)
elseif icffy>2 then
icmenuurl=icmenuurl&aibuttonk(eshref(s_umgl&g_urg&s_udbb&g_urg&icffp&g_urg&s_umsc&g_urg&icfid&g_urz,66),s_umscs&s_ztqr,"","","f-sb",s_umscs)
end if
end if
end if
End Function
'-----------------------------------
'tree title
'-----------------------------------
Function ictreetit(icftb,icfimg,icfstt,icfstc)
if aibj(icftb,s_udbb) then
ictreetit="<table width=100% border=0 cellspacing=0 cellpadding=0><tr><td valign=top width=28>"&icfimg&"</td><td>"
if ainull(icfstc) then
ictreetit=ictreetit&""&icfstt&""
else
ictreetit=ictreetit&"<strong>"&icfstt&"</strong>"&icfstc
end if
ictreetit=ictreetit&"</td></tr></table>"
else
ictreetit=icfimg&icfstt&icfstc
end if
End Function
'-----------------------------------
'tree auto make 
'bb_sx,1bb_dx,2bb_jx,3bb_xx,4bb_sn,5bb_bt,6bb_xt,7bb_zi
'ictreexx(icftb,icflb,icfwh,icfsd,icf)
'-----------------------------------
Function ictreexx(icfty,icfsd,icfsb,icfsw)
'response.Write now()&"ddd"&icfty
dim icdan,icdai,icdaj,icbbjx,icyyjx,icllxx,icyyxx,icllsx,icbbxx
dim icaasn,icaasny,icaaxx,icaajx,icaalie,icaabiao,icaawhere,icaapx,rsaa
ictreexx=""
'get the big xxid
icaabiao=w_dbqz&icfsb
icaalie=""&icfsb&"_sx,"&icfsb&"_dx,"&icfsb&"_jx,"&icfsb&"_xx,"&icfsb&"_sn,"&icfsb&"_bt,"&icfsb&"_xt"
icdai=0
icdaj=0
icdan=10
if aiint(icfsd)>0 then
icdai=aiint(icfsd)
if icdan<icdai then icdan=icdai
elseif i_xktr=1 then
if gystop(1,""&icfsb&"_id",""&icfsb&"_xx",icaabiao,""&icfsb&"_dx='0'",""&icfsb&"_xx desc","") then
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
icdai=aiint(aixn(left(gysay(0),6),1))
next
end if
end if
'main show
ictreexx=ictreexx&"<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""5"" class=""l-sa"">"
ictreexx=ictreexx&"<tr class=""l-2""><td>名称</td><td>顶级</td><td>上级</td><td>级深</td><td>内序</td><td>编码</td></tr>"
if not ainull(icfsw) then
icaawhere=" where "&icfsw&" and "&esrew(icfsb,ew_sn)
else
icaawhere=" where "&esrew(icfsb,ew_sn)
end if
icaapx=" order by "&icfsb&"_xx asc"
'top tree
Call saik(rsaa,"select "&icaalie&" from "&icaabiao&icaawhere&" and ("&icfsb&"_dx='0' or "&icfsb&"_dx='NULL' or "&icfsb&"_dx='')"&icaapx&"",1,3)
If rsaa.BOF And rsaa.EOF Then
ictreexx=ictreexx&"<tr><td><a href="""&e_lj1&""">暂无供排序的树形内容！</a></td><td></td><td></td><td></td><td></td><td></td></tr>"
else
Do While Not rsaa.eof
if icdai=0 then
icdai=aiint(aixn(left(rsaa(3),6),1))
if icdan<icdai then icdan=icdai
else
icdai=icdai+1
end if
icaajx=1
icaasny=rsaa(4)
icaasn=icaasny
icaaxx=right("000000"&aixn(icdai,0),6)&"-"
if aibj(icfty,s_umds&"-xb") then
rsaa(6)=rsaa(6)&espxx("["&icaasny&"]重置为"&left(icaaxx,6)&i_gg&e_gmc)
rsaa(4)=left(icaaxx,6)
icaasn=left(icaaxx,6)
end if
rsaa(0)="0"
rsaa(1)="0"
rsaa(2)=icaajx
rsaa(3)=icaaxx
rsaa.Update

icdaj=icdaj+1
if icdaj mod 2=0 then
ictreexx=ictreexx&"<tr>"
else
ictreexx=ictreexx&"<tr class=""l-1"">"
end if
ictreexx=ictreexx&"<td>"
ictreexx=ictreexx&rsaa(5)&"</td><td>0</td><td>0</td><td>"&icaajx&"</td><td>"&icaaxx&"</td><td>"&icaasn&"</td></tr>"
icyyxx=icaaxx
icyyjx=icaajx

Call saik(rs,"select "&icaalie&" from "&icaabiao&icaawhere&" and "&icfsb&"_dx='"&icaasny&"'"&icaapx&"",1,3)
If rs.BOF And rs.EOF Then
'ictreexx=ictreexx&"<tr><td>____</td><td></td><td></td><td></td><td></td><td></td></tr>"
else
Do While Not rs.eof
icbbjx=aiint(rs(2))
icbbxx=rs(3)
'jx=2
if icbbjx<3 then
icllsx=icaasn
if len(icyyxx)>7 then
icllxx=icaaxx&right("000"&aixn(aixn(right(left(icyyxx,10),3),1)+1,0),3)
else
icllxx=icaaxx&"001"
end if
rs(2)=2
'xzjx>scjs
elseif icbbjx>icyyjx then
icllsx=icyyxx
icllxx=icllsx&"001"
rs(2)=icyyjx+1
'xzjx=scjs
elseif icbbjx=icyyjx then
icllsx=left(icyyxx,len(icyyxx)-3)
icllxx=icllsx&right("000"&aixn(aixn(right(icyyxx,3),1)+1,0),3)
rs(2)=icyyjx
'xzjx<scjs
elseif icbbjx<icyyjx then
icllsx=left(icyyxx,7+(icbbjx-2)*3)
icllxx=icllsx&right("000"&aixn(aixn(right(left(icyyxx,7+(icbbjx-1)*3),3),1)+1,0),3)
end if

if aibj(icfty,s_umds&"-xb") then'sn x
rs(6)=rs(6)&espxx("["&rs(4)&"]重置为"&icllxx&i_gg&e_gmc)
rs(4)=icllxx
rs(0)=icllsx
rs(1)=icaasn
end if
rs(3)=icllxx
rs.Update

icyyxx=icllxx
icyyjx=icbbjx
icdaj=icdaj+1
if icdaj mod 2=0 then
ictreexx=ictreexx&"<tr>"
else
ictreexx=ictreexx&"<tr class=""l-1"">"
end if
ictreexx=ictreexx&"<td>"
for fi=1 to aiint(rs(2))
if fi>1 then ictreexx=ictreexx&"—"
next
ictreexx=ictreexx&rs(5)&"</td><td>"&rs(1)&"</td><td>"&rs(0)&"</td><td>"&rs(2)&"</td><td>"&icllxx&"</td><td>"&rs(4)&"</td></tr>"
rs.movenext
loop
End If
Call saig(rs)
rsaa.movenext
loop
End If
Call saig(rsaa)
ictreexx=ictreexx&"</table>"
ictreexx=ictreexx&"<p align=center><br><a href="&eshref(g_u0&g_urg&g_u1&g_urg&g_u2&g_urg&g_u3&g_urg&g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10&g_urg&aiint(icdan-10)&g_urz,77)&"><strong>点此处减小内序</strong></a>　　　<a href="&eshref(g_u0&g_urg&g_u1&g_urg&g_u2&g_urg&g_u3&g_urg&g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10&g_urg&aiint(icdai+1)&g_urz,77)&"><strong>点此处增大内序</strong></a></p>"
End Function
%>