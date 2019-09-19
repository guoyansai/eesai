<%
'-----------------------------------
'=ictop()
'-----------------------------------
Function ictop(icfsx,icfby,icfss,icfnm,icfnl,icfty,icft1,icft2,icfip)
ictop=ictopshow(icfsx,icfby,ictrr(icfss,icfnm,icfip),icfnm,icfnl,icfty,icft1,icft2,icfip)
End Function
'-----------------------------------
'=ictrr('icfstr=频道ep/分类ef/项目ssx/模式ssm/范围ssf/排序ssp/关键词sss,icfnm,icfty=0list|1top|2admin)
'-----------------------------------
Function ictrr(icfstr,icfnm,icfip)
icvrr=split(icfstr&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg,g_urg)
icvep=aistr(icvrr(0))
icvef=aistr(icvrr(1))
icvsp=aiint(icvrr(2))
icvsf=aiint(icvrr(3))
icvsx=aiint(icvrr(4))
icvsm=aiint(icvrr(5))
icvss=aijie(aistr(icvrr(6)))
if icfip=11 then
ictrr=earr(icfnm,icvep&g_urg&icvef&g_urg&icvsp&g_urg&icvsf&g_urg&icvsx&g_urg&icvsm&g_urg&icvss)
elseif icfip=21 then
ictrr=bbrr(icfnm,icvep&g_urg&icvef&g_urg&icvsp&g_urg&icvsf&g_urg&icvsx&g_urg&icvsm&g_urg&icvss)
elseif icfip=31 then
ictrr=usrr(icfnm,icvep&g_urg&icvef&g_urg&icvsp&g_urg&icvsf&g_urg&icvsx&g_urg&icvsm&g_urg&icvss)
elseif icfip=41 then
ictrr=ukrr(icfnm,icvep&g_urg&icvef&g_urg&icvsp&g_urg&icvsf&g_urg&icvsx&g_urg&icvsm&g_urg&icvss)
end if
End Function
'-----------------------------------
'=ictopshow(
'★1icfsx,[色系0主色|1辅助色|2跳跃色|3无色]
'★2icfby=边框样式，d-1列表下划线|d-2背景颜色|d-3动态划过|d-4彩色文字|0=没有边框只有列表
'★3icfss,通过【频道ep/分类ef/排序ssp/范围ssf/项目ssx/模式ssm/关键词sss】获取gysar值
'★4icfnm,调用数量
'★5icfnl,列数
'★6icfty,调用样式：1文字(0文字|1概述|2排序)|2无样式文字(0普通|1换行|2一行)|3图片(0图片|1深色标题|2浅色标题|3白色标题|4白色标题)|4图文(0图片|1图文样式|2图文样式2)|5图片无格式(0普通|1一列多行|2一行多列)|6图片·幻灯片(0图片|1数字|2标题)|7框图显示(0标题|1用户|2价格)|8图文列表(0右侧+默认图|1左侧+都有图|2无图|3无摘要)|9云签(0默认四列|5五列模式)
'★7icft1,特殊参数：图片+（宽/高）、文字（特殊行数量）
'★8icft2,图片+'（0无标题|1有标题）、文字（附加显示项=0|1time|2click|3good|4user）
'★9icfip,left(1内容|2论坛|3会员|4空间)/right(0列表|1调用|2后台)
'38=新图片|39=新的变形图片
'@@0ai_id,1ai_sn,2ai_bt,3ai_tm,4ai_hi,5ai_xi,6ai_us,7ai_up,8ai_ss,9ai_xy,10ai_ef,11ai_ep,12ai_um,13ai_el,14ai_px,15ai_jg,16ai_jy,17ai_t1,18ai_t2,19ai_oy,20ai_oz,21ai_bd,22ai_bc,23ai_ee,24ai_jj,25ai_eq,26ai_cs,27ai_yy,28ai_mm
'-----------------------------------
Function ictopshow(icfsx,icfby,icfrr,icfnm,icfnl,icfty,icft1,icft2,icfip)
dim icdy1,icdy2:icdy1=aiint(left(icfty,1)):icdy2=aiint(right(icfty,1))
dim icdicg,icdlinrr:icdlinrr=icfrr
dim icdpel,icdcss,icdtl,icdiq,icdbt,icdss,icdih,icdlj,icdat,icdqt:icdtl=0
dim icdptp,icdpbt,icdplj
if not ainull(icdlinrr) then
if right(icfnl,1)="%" or aibj(right(icfnl,2),"px") then
icdcss="float:left;width:"&icfnl&";"
icfnl=1
elseif aiint(icfnl)>1 then
icfnl=aiint(icfnl)
icdcss="float:left;width:"&(100/icfnl)&"%;"
else
icdcss=""
icfnl=1
end if
gysax=split(icdlinrr,g_gx)
e_idi=0
e_idu=ubound(gysax)
'TOP------K
if not ainull(icfsx) then ictopshow=ictopshow&"<div class=""gys"&icfsx&""">"
if not ainull(icfby) then ictopshow=ictopshow&"<div class="""&icfby&""">"
if icdy1=1 then
ictopshow=ictopshow&"<div class=""o-a""><ul>"
if icdcss<>"" then icdcss=" style="&icdcss&""""
elseif icdy1=2 then
elseif icdy1=3 or icdy1=4 or icdy1=5 then
if icdy1=5 then
ictopshow=ictopshow&"<table class=""o-l"" border=""0"" cellspacing=""0"" cellpadding=""0"">"
else
if icdy2=8 then
if not ainull(icfsx) then ictopshow=ictopshow&"<div class=""o-ia"">"
elseif icdy2=9 then
if not ainull(icfsx) then ictopshow=ictopshow&"<div class=""o-ib"">"
else
ictopshow=ictopshow&"<div class=""o-b""><ul>"
end if
end if
icft1=iccg(icft1,"")
if icdy1=5 then
icdcss=replace(icdcss,"float:left;","")
if icdy2=2 then
if icft1<>"" then
icdcss="height:"&icft1&";"
else
icdcss="height:100%;"
end if
ictopshow=ictopshow&"<tr>"
elseif icdy2=1 then
if icdcss<>"" then icdcss="display:block;width:100%;"
end if
else
if icdcss="" then icdcss="display:block;width:100%;"
if icft1<>"" then icdcss=icdcss&"height:"&icft1&";"
end if
if icdcss<>"" then icdcss=" style="""&icdcss&""""
elseif icdy1=6 then

elseif icdy1=7 then
ictopshow=ictopshow&"<div class=""l-pa"">"
elseif icdy1=8 then
if icdy2=3 then
iclisttop="<div class=""l-sa"">"
else
ictopshow=ictopshow&"<div class=""l-ca"">"
end if
elseif icdy1=9 then
ictopshow=ictopshow&"<div class=""l-qa"">"
end if
'TOP------for
for gysi=0 to e_idu
gysay=split(gysax(gysi)&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy&g_gy,g_gy)
if e_idi>=icfnm then
exit for
else
if ew_cf=0 or (aibj(icvep,s_umqb) and ew_cf=1) or (aibj(icvep,icveps) and ew_cf=1) then e_aiids=e_aiids&""&gysay(0)&","
icveps=icvep
e_idi=e_idi+1
icdbt=gysay(2)
icdss=gysay(8)
if ainull(icdbt) then
if left(icfip,1)="3" then
icdbt=gysay(6)
else
icdbt=icdss
icdss=""
end if
end if
icdih=ichz(1,gysay(3),gysay(4),gysay(7))
if left(icfip,1)="2" then
icdpel=s_udlbb
icdlj=eshref(s_udbb&g_urg&esnf(gysay(10))&g_urg&s_umxx&g_urg&gysay(1)&g_urz,66)
elseif left(icfip,1)="3" then
icdpel=s_udlus
icdlj=eshref(s_udus&g_urg&s_umxx&g_urg&gysay(1)&g_urz,66)
elseif left(icfip,1)="4" then
icdpel=s_udluk
icdlj=eshrej("",gysay(11),"",66)
elseif left(icfip,1)="1" then
icdpel=gysay(13)
icdlj=eaurl(esnk(gysay(11))&g_urg&esnf(gysay(10))&g_urg&s_umxx&g_urg&gysay(1)&g_urz,1,esnk(gysay(11)),"")
end if
icdiq=icqz(icdpel,1,gysay(9),0)
icdat=eaalt(gysay(2),gysay(3),gysay(4),gysay(5),gysay(6),"")
'文字
if icdy1=1 or icdy1=2 then
icft1=aiint(icft1):icft2=aiint(icft2)
icdqt=""
if i_xkuhy>0 and icft2=4 then icdqt=aistr(usren(gysay(6))&g_gg&w_motm)
if icskg(ew_pj,ep_pj,0) and icft2=3 then icdqt=aiint(gysay(5)&g_gg&"0")
if ew_dj>2 and icft2=2 then icdqt=aiint(gysay(4)&g_gg&"0")
if icft2=1 then icdqt=aitmx(gysay(3),10)
'++++++++++++++++++++++++++++++++++++++++++++++++++TITLE1
if icdy1=1 then
if icdy2>0 and icdtl<icft1 then
icdtl=icdtl+1
'gaishu
if icdy2=1 then
ictopshow=ictopshow&"<li class=""l-3"""&icdcss&"><a href="""&icdlj&""" title="""&icdat&"""><s>"&icdbt&"</s>"&icdss&"</a></li>"
'paixu
elseif icdy2=2 then
ictopshow=ictopshow&"<li class=""l-4"""&icdcss&"><a href="""&icdlj&""" title="""&icdat&"""><em>"&e_idi&"</em>"&icdbt&icdih&"</a>"
if icdqt<>"" then ictopshow=ictopshow&"<i>"&icdqt&"</i>"
ictopshow=ictopshow&"</li>"
end if
'putong
else
if int((e_idi-1)/icfnl) mod 2=0 then
ictopshow=ictopshow&"<li class=""l-1"""&icdcss&">"
else
ictopshow=ictopshow&"<li"&icdcss&">"
end if
ictopshow=ictopshow&"<a href="""&icdlj&""" title="""&icdat&""">"&icdiq&icdbt&icdih&"</a>"
if icdqt<>"" then ictopshow=ictopshow&"<i>"&icdqt&"</i>"
ictopshow=ictopshow&"</li>"
end if
'++++++++++++++++++++++++++++++++++++++++++++++++++TITLE2
elseif icdy1=2 then
ictopshow=ictopshow&"<a href="""&icdlj&""" title="""&icdat&""">"&icdiq&icdbt&icdih&"</a>"
if icdqt<>"" then ictopshow=ictopshow&"["&icdqt&"]"
if icdy2=2 then
ictopshow=ictopshow&"　"
else
ictopshow=ictopshow&"<br>"
end if
end if
'图片
elseif icdy1=3 or icdy1=4 or icdy1=5 then
icdqt=gysay(7)
if icdy1=4 and ainull(icdqt) then
icdqt=""
else
icdqt=esups(icdqt,11)
end if
if icdy1=5 then
if icdy2=1 then ictopshow=ictopshow&"<tr>"
ictopshow=ictopshow&"<td class=""o-k"""&icdcss&">"
else
if icdy2=8 then
if aibj(icfnl,"4") then
ictopshow=ictopshow&"<li class=""sy-c25""><div class=""l-pb"
else
ictopshow=ictopshow&"<li class=""sy-c"&int(10/icfnl)&"""><div class=""l-pb"
end if
elseif icdy2=9 then
if aibj(icfnl,"4") then
ictopshow=ictopshow&"<li class=""sy-c25""><div style=""height:"&icft1&";"" class=""l-pb"
else
ictopshow=ictopshow&"<li class=""sy-c"&int(10/icfnl)&"""><div style=""height:"&icft1&";"" class=""l-pb"
end if
elseif icdy1=4 then
ictopshow=ictopshow&"<li class=""o-j"
else
ictopshow=ictopshow&"<li class=""o-i"
end if
	if int((e_idi-1)/icfnl) mod 2=0 then
	ictopshow=ictopshow&" l-1"""
	else
	ictopshow=ictopshow&""""
	end if
	if icdy2=8 or icdy2=9 then
	else
	ictopshow=ictopshow&icdcss
	end if
ictopshow=ictopshow&">"
end if
ictopshow=ictopshow&"<a href="""&icdlj&""" title="""&icdat&""">"
if icdy2=8 then
ictopshow=ictopshow&"<div class=""l-pba"" style=""line-height:"&icft1&";height:"&icft1&";""><img style=""max-height:"&icft1&";"" src="""&icdqt&""" alt="""&icdbt&"""></div>"
elseif icdy2=9 then
ictopshow=ictopshow&"<img class=""o-iba""  src="""&icdqt&""" alt="""&icdbt&""">"
elseif icdqt<>"" then
ictopshow=ictopshow&"<Img"
if icdy1=4 and icft2<>"" and icft2<>"0" then
if right(icft2,1)="%" or aibj(right(icft2,2),"px") then
ictopshow=ictopshow&" style=""width:"&icft2&";min-height:100%;"""
else
ictopshow=ictopshow&" style=""width:"&icft2&"px;min-height:100%;"""
end if
end if
ictopshow=ictopshow&" src="""&icdqt&""" alt="""&icdbt&""">"
end if
if icdy1=4 then'图文
if icdy2=2 then
ictopshow=ictopshow&"<font>"&icdbt&"</font>"&icdss
elseif icdy2=1 then
ictopshow=ictopshow&"<span>"&icdbt&"</span>"&icdss
end if
elseif icft2>0 then
if icdy1=3 then'图片
if icdy2=8 or icdy2=9 then'28 big pic
ictopshow=ictopshow&"<div class=""l-pbi"">"&icdbt&"</div>"
if not ainull(gysay(12)) then
ictopshow=ictopshow&"<div class=""l-pbu"">"&gysay(12)&"</div>"
else
ictopshow=ictopshow&"<div class=""l-pbu"">"&usren(gysay(6)&g_gg&gysay(12))&"</div>"
end if
ictopshow=ictopshow&"<div class=""l-pbt"">"&iclcs(1,gysay(13),gysay(15),gysay(16),"")&"</div>"
elseif icdy2=1 then'28 SHEN BG
ictopshow=ictopshow&"<span>"&icdbt&"</span>"
elseif icdy2=2 then'56 QIAN BG
ictopshow=ictopshow&"<font>"&icdbt&"</font>"
elseif icdy2=3 then'56 NO BG
ictopshow=ictopshow&"<p>"&icdbt&"</p>"
end if
elseif icdy1=5 then'无格式
ictopshow=ictopshow&"<span>"&icdbt&"</span>"
end if
end if
ictopshow=ictopshow&"</a>"
if icdy1=5 then
ictopshow=ictopshow&"</td>"
if icdy2=1 then ictopshow=ictopshow&"</tr>"
elseif icdy2=8 or icdy2=9 then
ictopshow=ictopshow&"</div></li>"
else
ictopshow=ictopshow&"</li>"
end if
'++++++++++++++++++++++++++++++++++++++++++++++++++PPT
elseif icdy1=6 then
icdqt=esups(gysay(7),11)
icdptp=icdptp&g_gx&icdqt
icdpbt=icdpbt&g_gx&icdbt
icdplj=icdplj&g_gx&icdlj
'++++++++++++++++++++++++++++++++++++++++++++++++++框图
elseif icdy1=7 then



'++++++++++++++++++++++++++++++++++++++++++++++++++图文
elseif icdy1=8 then
'++++++++++++++++++++++++++++++++++++++++++++++++++列表
if icdy2=3 then

'++++++++++++++++++++++++++++++++++++++++++++++++++图文
else

end if
'++++++++++++++++++++++++++++++++++++++++++++++++++云签
elseif icdy1=9 then

end if
if gysi=e_idu and ew_cf>2 and e_idi<icfnm then gysi=-1
end if
next
'TOP------E
if icdy1=1 then
ictopshow=ictopshow&"</ul><div class=""cr""></div></div>"
elseif icdy1=3 or icdy1=4 then
if icdy2=8 or icdy2=9 then
if not ainull(icfsx) then ictopshow=ictopshow&"<div class=""cr""></div></div>"
else
ictopshow=ictopshow&"</ul><div class=""cr""></div></div>"
end if
elseif icdy1=5 then
if icdy2=2 then ictopshow=ictopshow&"<tr>"
ictopshow=ictopshow&"</table>"
elseif icdy1=6 then
csppx=aiint(csppx)+1
ictopshow=ictopshow&icppt(icdptp,icdplj,icdpbt,icft1,icft2,2,3,"","eesai"&csppx&"top")
else
if icdy1<>2 then ictopshow=ictopshow&"<div class=""cr""></div></div>"
end if
if not ainull(icfby) then
if left(icfby,1)="k" then ictopshow=ictopshow&"<div class=""cr""></div>"
ictopshow=ictopshow&"</div>"
end if
if not ainull(icfsx) then ictopshow=ictopshow&"</div>"
end if
End Function
%>