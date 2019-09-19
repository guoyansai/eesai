<%
'@@0manage/1s_uduy/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_uduy/2edit|add|del/3*id.HTML

'@@0s_uduy/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_uduy/1edit|add/2*id.HTML
'@@0s_uduy/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_uduy) or aibj(g_u1,s_uduy)) then
ep_sx=s_udxuy
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,7,g_u0,s_uduy,s_uduys&s_umlbs)
d_uytyrr=split(i_buyty,"|")
if (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduy) and aibj(g_u3,s_umtj) then
Call uyadd(1,g_u2)
elseif aibj(g_u0,s_uduy) and aibj(g_u2,s_umfb) then
e_skc=dosk("a","mnk",""):Call uyadd(0,g_u1)
elseif aibj(g_u0,s_uduy) and aibj(g_u2,s_umtj) then
Call uyadd(0,g_u1)
elseif aibj(g_u0,s_uduy) and aibj(g_u2,"asai") then
Call uyadd(0,g_u1)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduy) and (aibj(g_u3,s_umxx) or aibj(g_u3,s_umzs) or aibj(g_u3,s_umxg)) and not ainull(g_u4) then
Call uyedit(1,g_u4)
elseif aibj(g_u0,s_uduy) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs) or aibj(g_u2,s_umxg)) and not ainull(g_u3) then
Call uyedit(0,g_u3)
elseif aibj(g_u0,s_umgl) and aibj(g_u1,s_uduy) and ((aibj(g_u3,s_umsc) and aiint(g_u4)>0) or aibj(g_u3,s_umsc&"-x")) then
Call uydel(1)
elseif aibj(g_u0,s_uduy) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call uydel(0)
elseif (e_gdj>2 or e_uxy>1) and aibj(g_u0,s_umgl) and aibj(g_u1,s_uduy) and dkdir(2,g_u3) then
Call uylist(1)
elseif aibj(g_u0,s_uduy) and dkdir(2,g_u2) then
Call uylist(0)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","uy")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=uylie()
'-----------------------------------
Function uylie(uyfty)
if uyfty="form" then
uylie="sn,ty,yr,uh,tm,t1,j1,e1,s1,j2,e2,s2,j3,e3,s3,m1,h1,c1,d1,m2,h2,c2,d2,xy,fk,ft,zt,pf,ot,xt"
elseif uyfty=s_umlb then
'@@uy_id,1uy_sn,2uy_ty,3uy_yr,4uy_uh,5uy_tm,6uy_t1,7uy_j1,8uy_e1,9uy_s1,10uy_j2,11uy_e2,12uy_s2,13uy_j3,14uy_e3,15uy_s3,16uy_fk,17uy_ft,18uy_zt,19uy_pf
uylie="uy_id,uy_sn,uy_ty,uy_yr,uy_uh,uy_tm,uy_t1,uy_j1,uy_e1,uy_s1,uy_j2,uy_e2,uy_s2,uy_j3,uy_e3,uy_s3,uy_fk,uy_ft,uy_zt,uy_pf"
elseif uyfty="all" then
uylie="uy_id,uy_sn,uy_ty,uy_yr,uy_uh,uy_tm,uy_t1,uy_j1,uy_e1,uy_s1,uy_j2,uy_e2,uy_s2,uy_j3,uy_e3,uy_s3,uy_m1,uy_h1,uy_c1,uy_d1,uy_m2,uy_h2,uy_c2,uy_d2,uy_xy,uy_fk,uy_ft,uy_zt,uy_pf,uy_ot,uy_xt"
end if
End Function
'-----------------------------------
'uy menu
'=uyme()
'-----------------------------------
Function uyme()
uyme="<div class=""l-ra""><ul>"
dim uymi,uymlz,uymlen
uyme=uyme&"<li class=""pt"">"
uyme=uyme&""&iclbico(0,"chevron-right","01")&"<a"
if ainull(g_u1) or (aibj(s_umgl,g_u0) and ainull(g_u2)) then uyme=uyme&" class=""l-va"""
uyme=uyme&" href="""&eshref(s_uduy&g_urz,1)&""">"&s_umqbs&s_uduys&"</a></li>"
for uymi=0 to ubound(d_uytyrr)
uymlz=d_uytyrr(uymi)
uymlen=len(uymlz)
if uymlen>3 then
if uymi mod 2=0 then
uyme=uyme&"<li class=""l-1 pt"">　"
else
uyme=uyme&"<li class=""pt"">　"
end if
uyme=uyme&iclbico(0,"tag",1)&"<a"
if aibj(g_u1,aisro(1,uymlz)) or (aibj(s_umgl,g_u0) and aibj(g_u2,aisro(1,uymlz))) then uyme=uyme&" class=""l-va"""
uyme=uyme&" href="""&eshref(s_uduy&g_urg&aisro(1,uymlz)&g_urg&d_suyls&g_urz,1)&""">"&aisro(0,uymlz)&"</a></li>"
end if
next
uyme=uyme&"</ul></div>"
End Function
'-----------------------------------
'uy doing
'=uydoing(uyfty=0/edit|>0uy_ty,uyfqx)
'-----------------------------------
Function uydoing(uyfty,uyfqx)
dim uydty,uydtit,uydzty,uydlx
uyfty=aiint(uyfty)
uyfqx=aiint(uyfqx)
if e_uid=0 then
uydoing=aitiao("您还没有登录，无法查看和操作"&s_uduys&"！",u_login,i_nmtz)
else
'预处理
if uyfty=1 then
uydty=aiint(uy_ty)
uy_j1=aiint(uy_j1)
uy_j2=aiint(uy_j2)
uy_j3=aiint(uy_j3)
uy_fk=aiint(uy_fk)
'---------edit 0
uy_t1=now()
'uylie="uy_id,uy_sn,uy_ty,uy_yr,uy_uh,uy_tm,uy_t1,uy_j1,uy_e1,uy_s1,uy_j2,uy_e2,uy_s2,uy_j3,uy_e3,uy_s3,uy_m1,uy_h1,uy_c1,uy_d1,uy_m2,uy_h2,uy_c2,uy_d2,uy_xy,uy_fk,uy_ft,uy_zt,uy_pf,uy_ot,uy_xt"
e_mx=e_mx&"<h1 class=""c-b l-0"">"&right(aisrd(uy_ty,i_buyty),2)&"编码："&uy_sn&"</h1>"
e_mx=e_mx&"<li class=""c-d"">"&aitms("生成时间：",uy_tm,9)&aitms("　最后更新：",uy_t1,9)&"　订单状态："&aiarr(i_bxy,"|",aiint(uy_xy))&"</li>"
if not ainull(uy_ot) then e_mx=e_mx&"<li class=""c-c l-1"">"&uy_ot&"</li>"
e_mx=e_mx&"<div class=""crg""></div>"

'公证方
if not ainull(uy_e3) then
if uydty=26 then'服务订单
e_mx=e_mx&"<div class=""sy-c10 gys0""><div class=""c-ct"">本订单由 <a href="&eshref(s_udus&g_urg&s_umzs&g_urg&uy_e3&g_urz,66)&" target=_blank>"&usren(uy_e3)&"</a> 为您竭诚服务</div>"
e_mx=e_mx&"<div class=""c-cc"">订金：<b>"&uy_j1&"</b> "&uyxfks(uy_fk)&"　（①官方暂时保存 ②不满意随时可退 ③直接冲抵货款）"
if not ainull(uy_s3) then e_mx=e_mx&"<br>备注："&uy_s3&""
e_mx=e_mx&"</div></div>"
else
e_mx=e_mx&"<div class=""sy-c10 gys0""><div class=""c-ct"">公证方："&uy_e3&"</div>"
e_mx=e_mx&"<div class=""c-cc"">"
if uyxty(uydty,2)=2 then'定金
e_mx=e_mx&"奖励：<b>"&uy_j1&"</b> "&uyxfks(uy_fk)&"<br>"
else
if uy_j3>=uy_j1 then uy_j3=uy_j1
if uy_j3>0 then e_mx=e_mx&"奖励：<b>"&uy_j3&"</b> "&uyxfks(uy_fk)&"<br>"
end if
if not ainull(uy_s3) then e_mx=e_mx&"喊话："&uy_s3&""
e_mx=e_mx&"</div></div>"
end if
e_mx=e_mx&"<div class=""crg""></div>"
end if

'买方
e_mx=e_mx&"<div class=""sy-c4""><div class=""sy-cr gys1"">"
e_mx=e_mx&"<div class=""c-ct"">买方："&aimo(uy_e1,"-")&"</div><div class=""c-cl"">"
e_mx=e_mx&"<li>"
if uyxty(uydty,2)=2 then
e_mx=e_mx&"定金："
if uy_j1>0 then
e_mx=e_mx&"<b>"&uy_j1&"</b> "&uyxfks(uy_fk)&""
else
e_mx=e_mx&"等待协商"
end if
if uy_j2>0 then e_mx=e_mx&"　尾款：<b>"&uy_j2&"</b> "&uyxfks(uy_fk)&""
elseif uyxty(uydty,2)=1 then
e_mx=e_mx&"订金："
if uy_j1>0 then
e_mx=e_mx&"<b>"&uy_j1&"</b> "&uyxfks(uy_fk)&""
else
e_mx=e_mx&"等待协商"
end if
if aiint(uy_j2)>0 then e_mx=e_mx&"　尾款：<b>"&uy_j2&"</b> "&uyxfks(uy_fk)&""
else
e_mx=e_mx&"花费："
if uy_j1>0 then
e_mx=e_mx&"<b>"&uy_j1&"</b> "&uyxfks(uy_fk)&""
else
e_mx=e_mx&"等待协商"
end if
end if
e_mx=e_mx&"</li>"
e_mx=e_mx&"<li class=""l-1"">姓名："&aimo(uy_m1,"-")&"</li>"
e_mx=e_mx&"<li>电话："&aimo(uy_h1,"-")&"</li>"
e_mx=e_mx&"<li class=""l-1"">地址："&aimo(uy_c1,"-")&"　"&uy_d1&"</li>"
e_mx=e_mx&"<li>备注："&aimo(uy_s1,"-")&"</li>"
e_mx=e_mx&"</div></div></div>"

'状态栏
e_mx=e_mx&"<div class=""sy-c2 tc"">"
e_mx=e_mx&"<div class=""f-skx f-sd f-sk"">"&aisrd(uy_ty,i_buyty)&"</div>"
e_mx=e_mx&"<div class=""f-skx f-sd f-sk"">"&aiarr(i_buyfk,"|",uy_fk)&"</div>"
if aiint(right(uy_ft,1))<3 then
e_mx=e_mx&"<div class=""gys1""><div class=""f-skx f-sb f-sk"">"&aisrd(uy_ft,i_buyft)&"</div></div>"
elseif aiint(right(uy_ft,1))=3 then
e_mx=e_mx&"<div class=""gys2""><div class=""f-skx f-sb f-sk"">"&aisrd(uy_ft,i_buyft)&"</div></div>"
else
e_mx=e_mx&"<div class=""f-skx f-sd f-sk"">"&aisrd(uy_ft,i_buyft)&"</div>"
end if

if aiint(right(uy_zt,1))>4 then
e_mx=e_mx&"<div class=""gys0""><div class=""f-skx f-sb f-sk"">"&aisrd(uy_zt,i_buyzt)&"</div></div>"
elseif aiint(left(uy_zt,1))=1 then
e_mx=e_mx&"<div class=""gys1""><div class=""f-skx f-sb f-sk"">"&aisrd(uy_zt,i_buyzt)&"</div></div>"
elseif aiint(left(uy_zt,1))=2 then
e_mx=e_mx&"<div class=""gys2""><div class=""f-skx f-sb f-sk"">"&aisrd(uy_zt,i_buyzt)&"</div></div>"
else
e_mx=e_mx&"<a class=""f-skx f-sk f-sd"">"&aisrd(uy_zt,i_buyzt)&"</a>"
end if

e_mx=e_mx&"<div class=""f-skx"
if aiint(uy_pf)<1 then
e_mx=e_mx&" f-sb"
else
e_mx=e_mx&" f-sd"
end if
e_mx=e_mx&" f-sk"">"&aiarr(i_buypf,"|",uy_pf)&"</div>"
e_mx=e_mx&"<div class=""crg""></div>"
e_mx=e_mx&"</div>"

'卖方
e_mx=e_mx&"<div class=""sy-c4""><div class=""sy-cl gys2"">"
e_mx=e_mx&"<div class=""c-ct"">卖方："&aimo(uy_e2,"-")&"</div><div class=""c-cl"">"
e_mx=e_mx&"<li>"
if uyxty(uydty,2)=2 then
e_mx=e_mx&"保金："
if uy_j3>0 then
e_mx=e_mx&"<b>"&uy_j3&"</b> "&uyxfks(uy_fk)&""
else
e_mx=e_mx&"等待协商"
end if
if ainull(uy_e3) then
e_mx=e_mx&"　实获：<b title=""交易成功后获得："&uy_j1&"(定金)+"&uy_j2&"(尾款)="&aiint(uy_j1+uy_j2)&" "&uyxfks(uy_fk)&""">"&aiint(uy_j1+uy_j2)&"</b> "&uyxfks(uy_fk)&""
else
if uy_j2>0 then
e_mx=e_mx&"　实获：<b>"&uy_j2&"</b> "&uyxfks(uy_fk)&""
else
e_mx=e_mx&"　实获：线下协商"
end if
end if
elseif uyxty(uydty,2)=1 then
if uy_j3>0 then
  if uy_j3>=uy_j1 then
  if uy_j2>0 then
  e_mx=e_mx&"报价：<b>"&uy_j2&"</b> "&uyxfks(uy_fk)&"(尾款)+<b>"&uy_j1&"</b> "&uyxfks(uy_fk)&"(订金)"
  else
  e_mx=e_mx&"报价：线下协商(尾款)+<b>"&uy_j1&"</b> "&uyxfks(uy_fk)&"(订金)"
  end if
  else
  e_mx=e_mx&"实获：<b title="""&aiint(uy_j1-uy_j3)&"(订金)+"&uy_j2&"(尾款)="&aiint(uy_j1+uy_j2-uy_j3)&" "&uyxfks(uy_fk)&""">"&aiint(uy_j1+uy_j2-uy_j3)&"</b> "&uyxfks(uy_fk)&""
  end if
else
e_mx=e_mx&"实获：<b title="""&uy_j1&"(订金)+"&uy_j2&"(尾款)="&aiint(uy_j1+uy_j2)&" "&uyxfks(uy_fk)&""">"&aiint(uy_j1+uy_j2)&"</b> "&uyxfks(uy_fk)&""
end if
else
if uy_j3>0 then
  if uy_j3>=uy_j1 then
  e_mx=e_mx&"实获：<b>0</b> "&uyxfks(uy_fk)&""
  else
  e_mx=e_mx&"实获：<b>"&aiint(uy_j1-uy_j3)&"</b> "&uyxfks(uy_fk)&""
  end if
else
e_mx=e_mx&"获得：<b>"&uy_j2&"</b> "&uyxfks(uy_fk)&""
end if
end if
e_mx=e_mx&"</li>"
e_mx=e_mx&"<li class=""l-1"">姓名："&aimo(uy_m2,"-")&"</li>"
e_mx=e_mx&"<li>电话："&aimo(uy_h2,"-")&"</li>"
e_mx=e_mx&"<li class=""l-1"">地址："&aimo(uy_c2,"-")&"　"&uy_d2&"</li>"
e_mx=e_mx&"<li>备注："&aimo(uy_s2,"-")&"</li>"
e_mx=e_mx&"</div></div></div>"

if not ainull(uy_uh) then e_mx=e_mx&"<div class=""sy-c10""><div class=""alert alert-danger"">优惠信息："&uy_uh&"</div></div>"

if not ainull(uy_yr) then
e_mx=e_mx&"<li class=""c-h"">服务内容</li><div class=""cr""></div>"'tit
if left(uy_yr,2)="@@" then
e_mx=e_mx&"<div>"&ddread(uy_yr,uy_uh)
else
e_mx=e_mx&"<div class=""c-i"">"&uy_yr
end if
e_mx=e_mx&"</div><div class=""crg""></div>"
end if

'---------edit 1
else
uydty=uyfty
'---------add 0
uy_sn="UY"&aisn(1)
uy_tm=now()
uy_t1=uy_tm
uy_pf=0
uy_xy=i_xkshuy
uy_ty=uydty
if uydty="81" then
uy_xt=espxx("上缴"&s_uduys&"保证金"&i_gg&e_uer)
else
uy_xt=espxx("发起"&s_uduys&i_gg&e_uer)
end if
if ainull(us_ct) then Call gysread("us_er,us_ct,us_dz,us_bt,us_dh",usbiao,"us_id="&e_uid&"","")
'---------add 1
end if
if (aiint(uy_pf)=0 and aiint(right(uy_zt,1))=8) or (aiint(uy_pf)=0 and aiint(right(uy_zt,1))<5) or e_gdj>2 then'pf=0 ---0
'if (aiint(uy_pf)=0 and aiint(right(uy_zt,1))<5) or e_gdj>2 then'pf=0 ---0
'交易表单
if aibj(g_u2,s_umfb) then
e_mz="<div class=""f-l""><form id=""EESaiFDD"" name=""EESaiFDD"" action="""&g_u&""" method=""post"" AUTOCOMPLETE=""off"" target=""mnkfrm""><ul>"
else
e_mz="<div class=""f-l""><form id=""EESaiFDD"" name=""EESaiFDD"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
end if
'------------------------------------------------------------------------------------dong 0
if uyfty=1 then
'edit 0
uy_xt=uy_xt&espxx("操作，原记录{"&aisrd(uy_zt,i_buyzt)&"-"&aiarr(i_buyfk,"|",aiint(uy_fk))&"-"&aisrd(uy_ft,i_buyft)&"-"&uy_s1&"-"&uy_s2&"}"&i_gg&e_uer)
if aibj(e_uer,uy_e1) then
'买家信息
if ainull(us_ct) and ainull(uy_c1) then
Call gysread("us_er,us_ct,us_dz,us_bt,us_dh",usbiao,"us_id="&e_uid&"","")
uy_e1=us_er
uy_c1=us_ct
uy_d1=us_dz
uy_m1=us_bt
uy_h1=us_dh
uydlx="1"
end if
elseif aibj(e_uer,uy_e2) then
'卖家信息
if ainull(us_ct) and ainull(uy_c2) then
Call gysread("us_er,us_ct,us_dz,us_bt,us_dh",usbiao,"us_id="&e_uid&"","")
uy_e2=us_er
uy_c2=us_ct
uy_d2=us_dz
uy_m2=us_bt
uy_h2=us_dh
uydlx="1"
end if
end if
'if e_uxy>2 then
if e_uxy>2 and uyfqx>0 then
e_mz=e_mz&uyfmgm()
elseif uydty=26 then
'------------------------------------------------------------------------------------------edit服务订单（特殊订单处理部分）0
if aibj(e_uer,uy_e1) then
'---------------------------edit订金买家 0
uydtit="买家处理"&aisrd(uy_ty,i_buyty)
'卖家发起交易=20|
if uy_zt=20 then
if uy_ft=21 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|11|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
'买家发起交易=10|
elseif uy_zt=10 then
if right(uy_ft,1)="1" and uy_fk>1 then
e_mz=e_mz&icflxz(25,"操作","zt","","","",uy_zt,uy_zt&"|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
'卖家同意服务=21|
'证方同意服务=31|
elseif uy_zt=21 or uy_zt=31 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|11|13",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家同意服务=11|
elseif uy_zt=11 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'官方同意服务=61|
'系统同意服务=91|
elseif right(uy_zt,1)="1" then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家取消服务=13|
'卖家取消服务=23|
'证方取消服务=33|
'官方取消服务=63|
'系统取消服务=93|
elseif right(uy_zt,1)="3" then
if uy_zt=13 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|17",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
else
if aiint(uy_pf)=0 then
e_mz=e_mz&icflxz(25,"评分","pf","","*交易评分","",uy_pf,0,i_buypf)&aiinput("hidden","zt","",0,0,"","",uy_zt)
else
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
end if
if right(uy_ft,1)="1" and uy_fk>1 then
e_mz=e_mz&icflsr(25,"买注","","s1","",0,200,"买家备注信息","",uy_s1)
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,"2|3|4",right(i_buyfk,14))&aiinput("hidden","ft","",0,0,"","",uy_ft)
else
e_mz=e_mz&icflsr(5,"买注","","s1","",0,200,"买家备注信息","",uy_s1)
if uy_zt=21 and uy_ft=28 then
e_mz=e_mz&icflot(10,"提示","卖家["&uy_e2&"]回应["&aisrd(uy_zt,i_buyzt)&"]，若您选择["&aisrd(11,i_buyzt)&"]，服务进入线下服务阶段，请保持电话畅通！")
elseif  uy_zt=31 and uy_ft=28 then
e_mz=e_mz&icflot(75,"提示","["&uy_e3&"]回应["&aisrd(uy_zt,i_buyzt)&"]，若您选择["&aisrd(11,i_buyzt)&"]，服务进入线下服务阶段，请保持电话畅通！")
elseif  uy_zt=41 and uy_ft=28 then
e_mz=e_mz&icflot(75,"提示","官方回应["&aisrd(uy_zt,i_buyzt)&"]，若您选择["&aisrd(11,i_buyzt)&"]，服务进入线下服务阶段，请保持电话畅通！")
end if
e_mz=e_mz&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)
end if
if right(uydty,1)<5 then
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
else
e_mz=e_mz&aiinput("hidden","yr","",0,0,"","",uy_yr)
end if
if aiint(right(uy_zt,1))>0 and uydlx<>"1" and uy_j2>0 then
e_mz=e_mz&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)
else
e_mz=e_mz&icflot(10,"买家",utselect(1,"",uy_c1,"c1",""))
e_mz=e_mz&icflsr(5,"地址","","d1","",0,50,"*买家人的详细地址","",uy_d1)&icflsr(25,"名称","","m1","",0,50,"*买家人尊称","",uy_m1)&icflsr(25,"电话","","h1","",0,50,"*买家人联系电话","",uy_h1)
end if
e_mz=e_mz&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","j2","",0,0,"","",uy_j2)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit订金买家 1
elseif aibj(e_uer,uy_e2) then
'---------------------------edit订金卖家 0
uydtit="卖家处理"&aisrd(uy_ty,i_buyty)
'买家发起交易=10|
if uy_zt=10 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|21|26",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'卖家发起交易=20|
'卖家同意服务=21|
'证方同意服务=31|
elseif uy_zt=20 or uy_zt=21 or uy_zt=31 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家同意服务=11|
elseif uy_zt=11 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'官方同意服务=61|
'系统同意服务=91|
elseif right(uy_zt,1)="1" then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23|28",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家取消服务=13|
'卖家取消服务=23|
'证方取消服务=33|
'官方取消服务=63|
'系统取消服务=93|
elseif right(uy_zt,1)="3" then
if uy_zt=23 then
e_mz=e_mz&icflot(5,"提示","当前状态["&aisrd(23,i_buyzt)&"]，等待买家["&uy_e1&"]处理！")&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|27",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
else
e_mz=e_mz&icflxz(25,"评分","pf","","*交易评分","",uy_pf,0,i_buypf)&aiinput("hidden","zt","",0,0,"","",uy_zt)
end if
if aiint(uy_j2)=0 or uy_zt=21 then
e_mz=e_mz&icflsr(25,"卖注","","s2","",0,200,"买家备注信息","",uy_s2)
e_mz=e_mz&icflsr(25,"尾款","","j2","",6,50,"预计尾款额，直接填写数字","",uy_j2)
else
e_mz=e_mz&icflsr(5,"卖注","","s2","",0,200,"买家备注信息","",uy_s2)
e_mz=e_mz&aiinput("hidden","j2","",0,0,"","",uy_j2)
end if
if ainull(uy_e3) and uy_ft<50 then
e_mz=e_mz&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)&icflxz(25,"奖励","","j3","",6,50,"直接填写数字","",uy_j3)
else
e_mz=e_mz&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)
end if
if aiint(uy_fk)=4 and aiint(right(uy_ft,1))<5 then
e_mz=e_mz&icflxz(25,"付态","ft","","","",uy_ft,uy_ft&"|"&left(uy_ft,1)&"8",i_buyft)&aiinput("hidden","fk","",0,0,"","",uy_fk)
else
e_mz=e_mz&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)
end if

if right(uydty,1)<5 then
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
else
e_mz=e_mz&aiinput("hidden","yr","",0,0,"","",uy_yr)
end if
if aiint(right(uy_zt,1))>0 and uydlx<>"1" and uy_zt<>"31" then
e_mz=e_mz&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)
else
e_mz=e_mz&icflot(10,"卖家",utselect(1,"",uy_c2,"c2",""))
e_mz=e_mz&icflsr(5,"地址","","d2","",0,50,"*卖家的详细地址","",uy_d2)&icflsr(25,"名称","","m2","",0,50,"*卖家尊称","",uy_m2)&icflsr(25,"电话","","h2","",0,50,"*卖家联系电话","",uy_h2)
end if

e_mz=e_mz&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","s1","",0,0,"","",uy_s1)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit订金卖家 1
elseif aibj(e_uer,uy_e3) or e_gdj>2 then
'---------------------------edit订金证方、官方 0
if aibj(e_uer,uy_e3) then
uydtit="第三方处理"&aisrd(uy_ty,i_buyty)
uydzty=3
else
uydtit="官方处理"&aisrd(uy_ty,i_buyty)
uydzty=6
end if
if right(uy_zt,1)="0" and aiint(left(uy_zt,1))<>uydzty then'发起交易
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"1|"&uydzty&"6",i_buyzt)
elseif right(uy_zt,1)="1" and aiint(left(uy_zt,1))<>uydzty then'同意服务
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"3|"&uydzty&"8",i_buyzt)
elseif right(uy_zt,1)="3" and aiint(left(uy_zt,1))<>uydzty then'取消服务
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"7|"&uydzty&"8",i_buyzt)
else
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)
end if
if aiint(right(uy_zt,1))<3 and uy_zt<>"11" then
e_mz=e_mzicflsr(5,"卖家","","e2","",0,200,"*卖家账户","",uy_e2)
e_mz=e_mz&icflsr(10,"备注","","s3","",0,200,"第三方备注信息","",uy_s3)
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)&icflwb(10,"说明","可以直接输入交易内容，或使用代码调用前台商品<br>例如：@@eesai(卖家账户)##EESAI2017(商品编码)||9(商品订金)||1(数量)||最好的商品(标题)||88(频道类型)<br>注意：买家同意服务后，卖家与交易内容不可修改")
else
e_mz=e_mz&icflsr(5,"备注","","s3","",0,200,"第三方备注信息","",uy_s3)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","yr","",0,0,"","",uy_yr)
end if

e_mz=e_mz&aiinput("hidden","pf","",0,0,"","",uy_pf)&aiinput("hidden","j2","",0,0,"","",uy_j2)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","s1","",0,0,"","",uy_s1)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit订金证方、官方 1
end if
'------------------------------------------------------------------------------------------edit服务订单（特殊订单处理部分）1
elseif uyxty(uydty,2)=1 then
'------------------------------------------------------------------------------------------edit订金 0
if aibj(e_uer,uy_e1) then
'---------------------------edit订金买家 0
uydtit="买家处理"&aisrd(uy_ty,i_buyty)
'卖家发起交易=20|
if uy_zt=20 then
if uy_ft=21 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|11|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
'买家发起交易=10|
elseif uy_zt=10 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'卖家同意服务=21|
'证方同意服务=31|
elseif uy_zt=21 or uy_zt=31 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,"11|13",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家同意服务=11|
elseif uy_zt=11 then
if uy_ft=58 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
'官方同意服务=61|
'系统同意服务=91|
elseif right(uy_zt,1)="1" then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家取消服务=13|
'卖家取消服务=23|
'证方取消服务=33|
'官方取消服务=63|
'系统取消服务=93|
elseif right(uy_zt,1)="3" then
if uy_zt=13 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|17",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
else
if aiint(uy_pf)=0 then
e_mz=e_mz&icflxz(25,"评分","pf","","*交易评分","",uy_pf,0,i_buypf)&aiinput("hidden","zt","",0,0,"","",uy_zt)
else
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
end if
e_mz=e_mz&icflsr(5,"买注","","s1","",0,200,"买家备注信息","",uy_s1)
e_mz=e_mz&"<li>"
if right(uy_ft,1)="1" and uy_fk>1 then
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,"2|3|4",right(i_buyfk,14))&aiinput("hidden","ft","",0,0,"","",uy_ft)
else
if uy_zt=21 and uy_ft=28 then
e_mz=e_mz&icflot(75,"提示","卖家["&uy_e2&"]回应["&aisrd(21,i_buyzt)&"]，若您选择["&aisrd(11,i_buyzt)&"]，则交易成功，订金扣除(不返还)，进入尾款支付流程！")
end if
e_mz=e_mz&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)
end if
if right(uydty,1)<5 then
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
else
e_mz=e_mz&aiinput("hidden","yr","",0,0,"","",uy_yr)
end if
if aiint(right(uy_zt,1))>0 and uydlx<>"1" and uy_j2>0 then
e_mz=e_mz&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)
else
e_mz=e_mz&icflot(10,"买家",utselect(1,"",uy_c1,"c1",""))
e_mz=e_mz&icflsr(5,"地址","","d1","",0,50,"*买家人的详细地址","",uy_d1)&icflsr(25,"名称","","m1","",0,50,"*买家人尊称","",uy_m1)&icflsr(25,"电话","","h1","",0,50,"*买家人联系电话","",uy_h1)
end if
e_mz=e_mz&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","j2","",0,0,"","",uy_j2)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit订金买家 1
elseif aibj(e_uer,uy_e2) then
'---------------------------edit订金卖家 0
uydtit="卖家处理"&aisrd(uy_ty,i_buyty)
'买家发起交易=10|
if uy_zt=10 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|21|26",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'卖家发起交易=20|
'卖家同意服务=21|
'证方同意服务=31|
elseif uy_zt=20 or uy_zt=21 or uy_zt=31 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家同意服务=11|
elseif uy_zt=11 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'官方同意服务=61|
'系统同意服务=91|
elseif right(uy_zt,1)="1" then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23|28",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家取消服务=13|
'卖家取消服务=23|
'证方取消服务=33|
'官方取消服务=63|
'系统取消服务=93|
elseif right(uy_zt,1)="3" then
if uy_zt=23 then
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|27",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
else
e_mz=e_mz&icflxz(25,"评分","pf","","*交易评分","",uy_pf,0,i_buypf)&aiinput("hidden","zt","",0,0,"","",uy_zt)
end if
e_mz=e_mz&icflsr(5,"卖注","","s2","",0,200,"买家备注信息","",uy_s2)
e_mz=e_mz&"<li>"
if aiint(uy_j2)=0 or uy_zt=21 then
e_mz=e_mz&icflsr(5,"尾款","","j2","",6,50,"*直接填写数字","",uy_j2)&""
else
e_mz=e_mz&aiinput("hidden","j2","",0,0,"","",uy_j2)
end if
if ainull(uy_e3) and uy_ft<50 then
e_mz=e_mz&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)&icflxz(25,"奖励","","j3","",6,50,"直接填写数字","",uy_j3)
else
e_mz=e_mz&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)
end if
if aiint(uy_fk)=4 and aiint(right(uy_ft,1))<5 then
e_mz=e_mz&icflxz(25,"付态","ft","","","",uy_ft,uy_ft&"|"&left(uy_ft,1)&"8",i_buyft)&aiinput("hidden","fk","",0,0,"","",uy_fk)
else
e_mz=e_mz&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)
end if

if right(uydty,1)<5 then
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
else
e_mz=e_mz&aiinput("hidden","yr","",0,0,"","",uy_yr)
end if

if aiint(right(uy_zt,1))>0 and uydlx<>"1" then
e_mz=e_mz&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)
else
e_mz=e_mz&icflot(10,"卖家",utselect(1,"",uy_c2,"c2",""))
e_mz=e_mz&icflsr(5,"地址","","d2","",0,50,"*卖家的详细地址","",uy_d2)&icflsr(25,"名称","","m2","",0,50,"*卖家尊称","",uy_m2)&icflsr(25,"电话","","h2","",0,50,"*卖家联系电话","",uy_h2)
end if

e_mz=e_mz&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","s1","",0,0,"","",uy_s1)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit订金卖家 1
elseif aibj(e_uer,uy_e3) or e_gdj>2 then
'---------------------------edit订金证方、官方 0
if aibj(e_uer,uy_e3) then
uydtit="第三方处理"&aisrd(uy_ty,i_buyty)
uydzty=3
else
uydtit="官方处理"&aisrd(uy_ty,i_buyty)
uydzty=6
end if
if right(uy_zt,1)="0" and aiint(left(uy_zt,1))<>uydzty then'发起交易
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"1|"&uydzty&"6",i_buyzt)
elseif right(uy_zt,1)="1" and aiint(left(uy_zt,1))<>uydzty then'同意服务
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"3|"&uydzty&"8",i_buyzt)
elseif right(uy_zt,1)="3" and aiint(left(uy_zt,1))<>uydzty then'取消服务
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"7|"&uydzty&"8",i_buyzt)
else
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)
end if
e_mz=e_mz&icflsr(5,"备注","","s3","",0,200,"第三方备注信息","",uy_s3)

e_mz=e_mz&aiinput("hidden","pf","",0,0,"","",uy_pf)&aiinput("hidden","j2","",0,0,"","",uy_j2)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)&aiinput("hidden","yr","",0,0,"","",uy_yr)&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","s1","",0,0,"","",uy_s1)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit订金证方、官方 1
end if
'------------------------------------------------------------------------------------------edit订金 1
elseif uyxty(uydty,2)=2 then'edit定金
'------------------------------------------------------------------------------------------edit定金 0
if aibj(e_uer,uy_e1) then
'---------------------------edit定金买家 0
uydtit="买家处理"&aisrd(uy_ty,i_buyty)
'卖家发起交易=20|
if uy_zt=20 then
if uy_ft=31 or uy_ft=33 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|11|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
'买家发起交易=10|
elseif uy_zt=10 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'卖家同意服务=21|
'证方同意服务=31|
elseif uy_zt=21 or uy_zt=31 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,"11|13",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家同意服务=11|
elseif uy_zt=11 then
if uy_ft=58 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
'官方同意服务=61|
'系统同意服务=91|
elseif right(uy_zt,1)="1" then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家取消服务=13|
'卖家取消服务=23|
'证方取消服务=33|
'官方取消服务=63|
'系统取消服务=93|
elseif right(uy_zt,1)="3" then
if uy_zt=13 then
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|17",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
else
if aiint(uy_pf)=0 then
e_mz=e_mz&icflxz(25,"评分","pf","","*交易评分","",uy_pf,0,i_buypf)&aiinput("hidden","zt","",0,0,"","",uy_zt)
else
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
end if
e_mz=e_mz&icflsr(5,"买注","","s1","",0,200,"买家备注信息","",uy_s1)
if right(uy_ft,1)="1" and uy_fk>1 then
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,"2|3|4",right(i_buyfk,14))&aiinput("hidden","ft","",0,0,"","",uy_ft)
else
if uy_zt=21 and uy_ft=38 then
e_mz=e_mz&icflot(75,"提示","卖家["&uy_e2&"]回应["&aisrd(21,i_buyzt)&"]，若您选择["&aisrd(11,i_buyzt)&"]，则交易成功，定金扣除(不返还)，进入尾款支付流程！")
end if
e_mz=e_mz&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)
end if
if right(uydty,1)<5 then
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
else
e_mz=e_mz&aiinput("hidden","yr","",0,0,"","",uy_yr)
end if
if aiint(right(uy_zt,1))>0 and uydlx<>"1" and uy_j2>0 then
e_mz=e_mz&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)
else
e_mz=e_mz&icflot(10,"买家",utselect(1,"",uy_c1,"c1",""))
e_mz=e_mz&icflsr(5,"地址","","d1","",0,50,"*买家人的详细地址","",uy_d1)&icflsr(25,"名称","","m1","",0,50,"*买家人尊称","",uy_m1)&icflsr(25,"电话","","h1","",0,50,"*买家人联系电话","",uy_h1)
end if
e_mz=e_mz&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","j2","",0,0,"","",uy_j2)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit定金买家 1
elseif aibj(e_uer,uy_e2) then
'---------------------------edit定金卖家 0
uydtit="卖家处理"&aisrd(uy_ty,i_buyty)
'买家发起交易=10|
if uy_zt=10 then
if uy_ft=38 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|21|26",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|26",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
'卖家发起交易=20|
'卖家同意服务=21|
'证方同意服务=31|
elseif uy_zt=20 or uy_zt=21 or uy_zt=31 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家同意服务=11|
elseif uy_zt=11 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'官方同意服务=61|
'系统同意服务=91|
elseif right(uy_zt,1)="1" then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23|28",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家取消服务=13|
'卖家取消服务=23|
'证方取消服务=33|
'官方取消服务=63|
'系统取消服务=93|
elseif right(uy_zt,1)="3" then
if uy_zt=23 then
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|27",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
else
e_mz=e_mz&icflxz(25,"评分","pf","","*交易评分","",uy_pf,0,i_buypf)&aiinput("hidden","zt","",0,0,"","",uy_zt)
end if
e_mz=e_mz&icflsr(5,"卖注","","s2","",0,200,"买家备注信息","",uy_s2)
e_mz=e_mz&"<li>"
if aiint(uy_j2)=0 or uy_zt=21 then
e_mz=e_mz&icflsr(5,"尾款","","j2","",6,50,"*直接填写数字","",uy_j2)&""
else
e_mz=e_mz&aiinput("hidden","j2","",0,0,"","",uy_j2)
end if
if ainull(uy_e3) then
e_mz=e_mz&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)
else
e_mz=e_mz&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)
end if
if aiint(uy_fk)=4 and aiint(right(uy_ft,1))<5 then
e_mz=e_mz&icflxz(25,"付态","ft","","","",uy_ft,uy_ft&"|"&left(uy_ft,1)&"8",i_buyft)&aiinput("hidden","fk","",0,0,"","",uy_fk)
else
e_mz=e_mz&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)
end if

if right(uydty,1)<5 then
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
else
e_mz=e_mz&aiinput("hidden","yr","",0,0,"","",uy_yr)
end if
if aiint(right(uy_zt,1))>0 and uydlx<>"1" then
e_mz=e_mz&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)
else
e_mz=e_mz&icflot(10,"卖家",utselect(1,"",uy_c2,"c2",""))
e_mz=e_mz&icflsr(5,"地址","","d2","",0,50,"*卖家的详细地址","",uy_d2)&icflsr(25,"名称","","m2","",0,50,"*卖家尊称","",uy_m2)&icflsr(25,"电话","","h2","",0,50,"*卖家联系电话","",uy_h2)
end if

e_mz=e_mz&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","s1","",0,0,"","",uy_s1)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit定金卖家 1
elseif aibj(e_uer,uy_e3) or e_gdj>2 then
'---------------------------edit定金证方、官方 0
if aibj(e_uer,uy_e3) then
uydtit="第三方处理"&aisrd(uy_ty,i_buyty)
uydzty=3
else
uydtit="官方处理"&aisrd(uy_ty,i_buyty)
uydzty=6
end if
if right(uy_zt,1)="0" and aiint(left(uy_zt,1))<>uydzty then'发起交易
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"1|"&uydzty&"6",i_buyzt)
elseif right(uy_zt,1)="1" and aiint(left(uy_zt,1))<>uydzty then'同意服务
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"3|"&uydzty&"8",i_buyzt)
elseif right(uy_zt,1)="3" and aiint(left(uy_zt,1))<>uydzty then'取消服务
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"7|"&uydzty&"8",i_buyzt)
else
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)
end if
e_mz=e_mz&icflsr(5,"备注","","s3","",0,200,"第三方备注信息","",uy_s3)

e_mz=e_mz&aiinput("hidden","pf","",0,0,"","",uy_pf)&aiinput("hidden","j2","",0,0,"","",uy_j2)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)&aiinput("hidden","yr","",0,0,"","",uy_yr)&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","s1","",0,0,"","",uy_s1)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit定金证方、官方 1
end if
'------------------------------------------------------------------------------------------edit定金 1
else
'------------------------------------------------------------------------------------------edit普通 0
if aibj(e_uer,uy_e1) then
'---------------------------edit普通买家 0
uydtit="买家处理"&aisrd(uy_ty,i_buyty)
'卖家发起交易=20|
if uy_zt=20 then
if uy_ft=18 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|11|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
'买家发起交易=10|
elseif uy_zt=10 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|16",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'卖家同意服务=21|
elseif uy_zt=21 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家同意服务=11|
elseif uy_zt=11 then
if uy_ft=18 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
'证方同意服务=31|
'官方同意服务=61|
'系统同意服务=91|
elseif right(uy_zt,1)="1" then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|13|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家取消服务=13|
'卖家取消服务=23|
'证方取消服务=33|
'官方取消服务=63|
'系统取消服务=93|
elseif right(uy_zt,1)="3" then
if uy_zt=13 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|18",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|17",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
else
if aiint(uy_pf)=0 then
e_mz=e_mz&icflxz(25,"评分","pf","","*交易评分","",uy_pf,0,i_buypf)&aiinput("hidden","zt","",0,0,"","",uy_zt)
else
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
end if
e_mz=e_mz&icflsr(5,"买注","","s1","",0,200,"买家备注信息","",uy_s1)
e_mz=e_mz&"<li>"
if right(uy_ft,1)="1" and uy_fk>1 then
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,"2|3|4",right(i_buyfk,14))&aiinput("hidden","ft","",0,0,"","",uy_ft)
else
if uy_zt=21 and uy_ft=28 then
e_mz=e_mz&icflot(75,"提示","卖家["&uy_e2&"]回应["&aisrd(21,i_buyzt)&"]，若您选择["&aisrd(11,i_buyzt)&"]，则交易成功，订金扣除(不返还)，进入尾款支付流程！")
end if
e_mz=e_mz&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)
end if
if right(uydty,1)<5 then
e_mz=e_mz&icflwb(10,"内容"&uydty,"yr","","",0,8000,"*交易内容","",uy_yr)
else
e_mz=e_mz&aiinput("hidden","yr","",0,0,"","",uy_yr)
end if
if aiint(right(uy_zt,1))>0 and uydlx<>"1" and uy_j2>0 then
e_mz=e_mz&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)
else
e_mz=e_mz&icflot(10,"买家",utselect(1,"",uy_c1,"c1",""))
e_mz=e_mz&icflsr(5,"地址","","d1","",0,50,"*买家人的详细地址","",uy_d1)&icflsr(25,"名称","","m1","",0,50,"*买家人尊称","",uy_m1)&icflsr(25,"电话","","h1","",0,50,"*买家人联系电话","",uy_h1)
end if
e_mz=e_mz&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","j2","",0,0,"","",uy_j2)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit普通买家 1
elseif aibj(e_uer,uy_e2) then
'---------------------------edit普通卖家 0
uydtit="卖家处理"&aisrd(uy_ty,i_buyty)
'买家发起交易=10|
if uy_zt=10 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|21|26",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'卖家发起交易=20|
'卖家同意服务=21|
elseif uy_zt=20 or uy_zt=21 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家同意服务=11|
elseif uy_zt=11 then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'证方同意服务=31|
'官方同意服务=61|
'系统同意服务=91|
elseif right(uy_zt,1)="1" then
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|23|28",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
'买家取消服务=13|
'卖家取消服务=23|
'证方取消服务=33|
'官方取消服务=63|
'系统取消服务=93|
elseif right(uy_zt,1)="3" then
if uy_zt=23 then
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
else
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|27",i_buyzt)&aiinput("hidden","pf","",0,0,"","",uy_pf)
end if
else
e_mz=e_mz&icflxz(25,"评分","pf","","*交易评分","",uy_pf,0,i_buypf)&aiinput("hidden","zt","",0,0,"","",uy_zt)
end if
e_mz=e_mz&icflsr(5,"卖注","","s2","",0,200,"买家备注信息","",uy_s2)
e_mz=e_mz&aiinput("hidden","j2","",0,0,"","",uy_j2)
if ainull(uy_e3) and aiint(right(uy_zt,1))<5 then
e_mz=e_mz&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)&icflxz(25,"奖励","","j3","",6,50,"直接填写数字，奖金从买方支付中获得","",uy_j3)
else
e_mz=e_mz&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)
end if
if aiint(uy_fk)=4 and aiint(right(uy_ft,1))<5 then
e_mz=e_mz&icflxz(25,"付态","ft","","","",uy_ft,uy_ft&"|"&left(uy_ft,1)&"8",i_buyft)&aiinput("hidden","fk","",0,0,"","",uy_fk)
else
e_mz=e_mz&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)
end if

if right(uydty,1)<5 then
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
else
e_mz=e_mz&aiinput("hidden","yr","",0,0,"","",uy_yr)
end if

if aiint(right(uy_zt,1))>0 and uydlx<>"1" then
e_mz=e_mz&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)
else
e_mz=e_mz&icflot(10,"卖家",utselect(1,"",uy_c2,"c2",""))
e_mz=e_mz&icflsr(5,"地址","","d2","",0,50,"*卖家的详细地址","",uy_d2)&icflsr(25,"名称","","m2","",0,50,"*卖家尊称","",uy_m2)&icflsr(25,"电话","","h2","",0,50,"*卖家联系电话","",uy_h2)
end if

e_mz=e_mz&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","s1","",0,0,"","",uy_s1)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit普通卖家 1
elseif aibj(e_uer,uy_e3) or e_gdj>2 then
'---------------------------edit普通证方、官方 0
if aibj(e_uer,uy_e3) then
uydtit="第三方处理"&aisrd(uy_ty,i_buyty)
uydzty=3
else
uydtit="官方处理"&aisrd(uy_ty,i_buyty)
uydzty=6
end if
if right(uy_zt,1)="0" and aiint(left(uy_zt,1))<>uydzty then'发起交易
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"1|"&uydzty&"6",i_buyzt)
elseif right(uy_zt,1)="1" and aiint(left(uy_zt,1))<>uydzty then'同意服务
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"3|"&uydzty&"8",i_buyzt)
elseif right(uy_zt,1)="3" and aiint(left(uy_zt,1))<>uydzty then'取消服务
e_mz=e_mz&icflxz(5,"操作","zt","","","",uy_zt,uy_zt&"|"&uydzty&"7|"&uydzty&"8",i_buyzt)
else
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)
end if
e_mz=e_mz&icflsr(5,"备注","","s3","",0,200,"第三方备注信息","",uy_s3)

e_mz=e_mz&aiinput("hidden","pf","",0,0,"","",uy_pf)&aiinput("hidden","j2","",0,0,"","",uy_j2)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","fk","",0,0,"","",uy_fk)&aiinput("hidden","ft","",0,0,"","",uy_ft)&aiinput("hidden","yr","",0,0,"","",uy_yr)&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","j1","",0,0,"","",uy_j1)&aiinput("hidden","s1","",0,0,"","",uy_s1)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'---------------------------edit普通证方、官方 1
end if
'------------------------------------------------------------------------------------------edit普通 1
end if
'edit 1
else
'add 0
if uydty=0 then'add系统订单
uy_e1=us_er
uy_c1=us_ct
uy_d1=us_dz
uy_m1=us_bt
uy_h1=us_dh
dim uyddcook
uyddcook=request.Cookies(x_ddck)
if not ainull(uyddcook) then
e_mx=e_mx&"<div class=""sy-c10"">"
e_mx=e_mx&""&ddread(uyddcook,0)&""
e_mx=e_mx&"</div>"
end if
e_mz=e_mz&icflxz(25,"付款方式","fk","","*付款方式","",uy_fk,"2|3|4",i_buyfk)&icflsr(75,"留言","","s1","",0,200,"买家备注留言信息","",uy_s1)
e_mz=e_mz&icflot(10,"所在城市",utselect(1,"",uy_c1,"c1",""))
e_mz=e_mz&icflsr(10,"详细地址","","d1","",0,50,"*买家人的详细地址","",uy_d1)
if ewxgn("uh") then
e_mz=e_mz&icflsr(25,"买家姓名","","m1","",0,50,"*买家姓名","",uy_m1)&icflsr(25,"电话","","h1","",0,50,"*买家联系电话","",uy_h1)&""
if aiint(x_dddcs)>1 then
e_mz=e_mz&icflot(75,"提示","本订单由 <b>"&aiint(x_dddcs)&"</b> 个卖家提供服务，不支持使用优惠券！")&aiinput("hidden","uh","",0,0,"","",uy_uh)&""
elseif aiint(x_dddzl)>1 then
e_mz=e_mz&icflot(75,"提示","本订单由 <b>"&aiint(x_dddzl)&"</b> 个订单组成，不支持使用优惠券！")&aiinput("hidden","uh","",0,0,"","",uy_uh)&""
else
e_mz=e_mz&icflsr(5,"提示","","uh","",0,200,"请直接添加可用优惠券号码（么有可不填）","",uy_uh)
end if
else
e_mz=e_mz&icflsr(5,"买家姓名","","m1","",0,50,"*买家姓名","",uy_m1)&icflsr(5,"电话","","h1","",0,50,"*买家联系电话","",uy_h1)&""
e_mz=e_mz&aiinput("hidden","uh","",0,0,"","",uy_uh)
end if
e_mz=e_mz&aiinput("hidden","dxx","",0,0,"","",1)&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","j1","",0,0,"","",ddshsfx)&aiinput("hidden","yr","",0,0,"","",uyddcook)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","ft","",0,0,"","",uy_ft)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","e2","",0,0,"","",ddshusx)&aiinput("hidden","j2","",0,0,"","",ddshsfx)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","pf","",0,0,"","",uy_pf)
e_mz=e_mz&aiinput("hidden","dzl","",0,0,"","",x_dddzl)&aiinput("hidden","dcs","",0,0,"","",x_dddcs)&aiinput("hidden","dus","",0,0,"","",x_dddus)&aiinput("hidden","djj","",0,0,"","",x_dddjj)&aiinput("hidden","dsn","",0,0,"","",x_dddsn)&aiinput("hidden","dsl","",0,0,"","",x_dddsl)
e_mz=e_mz&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","xt","",0,0,"","",uy_xt)
elseif left(uydty,1)<5 then
if aibj(g_u2,s_umfb) then uy_e2=g_u3
'------------------------------------------购买服务 add 10
uy_j2=0
uy_j3=0
uy_zt=10
uy_fk=0
uy_j1=0
uy_e1=us_er
uy_c1=us_ct
uy_d1=us_dz
uy_m1=us_bt
uy_h1=us_dh
if uydty=22 then'add购买定金=22
uydtit="支付定金购买服务"
uy_ft=31
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&icflsr(25,"定金","","j1","",6,50,"*直接填写数字","",uy_j1)&icflsr(5,"买注","","s1","",0,200,"买家备注信息","",uy_s1)
e_mz=e_mz&icflsr(25,"卖家","","e2","",0,50,"*","",uy_e2)&icflsr(5,"尾款","","j2","",6,50,"*直接填写数字","",uy_j2)&icflsr(25,"保金","","j3","",6,50,"*卖家保证金","",uy_j3)&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)
elseif uydty=21 then'购买订金=21
uydtit="支付订金购买服务"
uy_ft=21
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&icflsr(25,"订金","","j1","",6,50,"*直接填写数字","",uy_j1)&icflsr(5,"买注","","s1","",0,200,"买家备注信息","",uy_s1)
e_mz=e_mz&icflsr(25,"卖家","","e2","",0,50,"*","",uy_e2)&icflsr(5,"尾款","","j2","",6,50,"*直接填写数字","",uy_j2)&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)&icflxz(25,"奖励","","j3","",6,50,"直接填写数字","",uy_j3)
elseif uydty=12 then'红包服务=12
uydtit="发送红包服务"
uy_ft=11
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&icflsr(25,"金额","","j1","",6,50,"*红包金额","",uy_j1)&icflsr(25,"确认","","j2","",6,50,"*再次确认红包金额","",uy_j2)&icflsr(25,"接收","","e2","",0,50,"*红包接收人账号","",uy_e2)
e_mz=e_mz&icflsr(10,"备注","","s1","",0,200,"发红包的备注信息","",uy_s1)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","e3","",0,0,"","",uy_e3)
elseif e_uxy>3 and uydty=11 then'充值服务=11
if e_uxy>3 then
uydtit="发起充值服务"
uy_e1=ew_kt'系统账号
uy_ft=11
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&"金额："&aiinput("","j1","",6,50,"*充值金额","",uy_j1)&icflsr(5,"确认","","j2","",6,50,"*再次确认充值金额","",uy_j2)
e_mz=e_mz&icflsr(25,"接收","","e2","",0,50,"*","",uy_e2)&icflsr(75,"备注","","s1","",0,200,"如是线下充值，请填写充值银行、账号等信息","",uy_s1)&aiinput("hidden","j3","",0,0,"","",uy_j3)&aiinput("hidden","e3","",0,0,"","",uy_e3)
else
e_mz=e_mz&icflot(10,"注意","你没有这个权限！")
end if
else
uy_ft=10
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&icflsr(25,"买出","","j1","",6,50,"*直接填写数字","",uy_j1)&icflsr(5,"买注","","s1","",0,200,"买家备注信息","",uy_s1)
e_mz=e_mz&icflsr(25,"卖家","","e2","",0,50,"*","",uy_e2)&icflsr(25,"卖得","","j2","",6,50,"*直接填写数字","",uy_j2)&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)&icflsr(25,"证获","","j3","",6,50,"直接填写数字","",uy_j3)
end if
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
e_mz=e_mz&icflot(10,"买家",utselect(1,"",uy_c1,"c1",""))
e_mz=e_mz&icflsr(5,"地址","","d1","",0,50,"*买家人的详细地址","",uy_d1)&icflsr(25,"名称","","m1","",0,50,"*买家人尊称","",uy_m1)&icflsr(25,"电话","","h1","",0,50,"*买家人联系电话","",uy_h1)
e_mz=e_mz&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","ft","",0,0,"","",uy_ft)&aiinput("hidden","s2","",0,0,"","",uy_s2)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","c2","",0,0,"","",uy_c2)&aiinput("hidden","d2","",0,0,"","",uy_d2)&aiinput("hidden","m2","",0,0,"","",uy_m2)&aiinput("hidden","h2","",0,0,"","",uy_h2)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","pf","",0,0,"","",uy_pf)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'------------------------------------------购买服务 add 49
else
'------------------------------------------出售服务 add 50
if aibj(g_u2,s_umfb) then uy_e1=g_u3
uy_j1=0
uy_j3=0
uy_zt=20
uy_fk=0
uy_j2=0
uy_e2=us_er
uy_c2=us_ct
uy_d2=us_dz
uy_m2=us_bt
uy_h2=us_dh
if uydty=71 then'出售定金=71
uydtit="支付保证金出售服务"
uy_ft=31
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&icflsr(25,"保金","","j3","",6,50,"*卖家保证金","",uy_j3)&icflsr(5,"卖注","","s2","",0,200,"买家备注信息","",uy_s2)
e_mz=e_mz&icflsr(25,"买家","","e1","",0,50,"*","",uy_e1)&icflsr(25,"定金","","j1","",6,50,"*直接填写数字","",uy_j1)&icflsr(5,"尾款","","j2","",6,50,"*直接填写数字","",uy_j2)&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)
elseif uydty=61 then'出售订金=61
uydtit="支付订金出售服务"
uy_ft=21
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&icflsr(25,"订金","","j1","",6,50,"*直接填写数字","",uy_j1)&icflsr(5,"卖注","","s2","",0,200,"买家备注信息","",uy_s2)
e_mz=e_mz&icflsr(25,"买家","","e1","",0,50,"*","",uy_e1)&icflsr(5,"尾款","","j2","",6,50,"*直接填写数字","",uy_j2)&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)&icflxz(25,"奖励","","j3","",6,50,"直接填写数字","",uy_j3)
elseif uydty=51 then'提现服务=51
if e_uxy>3 then
uydtit="申请提现服务"
uy_e1=ew_kt'系统账号
uy_ft=11
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&icflsr(25,"提现","","j1","",6,50,"*直接填写数字","",uy_j1)&icflsr(5,"确认","","j2","",6,50,"*直接填写数字","",uy_j2)
e_mz=e_mz&icflsr(10,"备注","","s2","",0,200,"填写提现方式，如银行、网银、支付宝等账户","",uy_s2)&""&aiinput("hidden","e1","",0,0,"","",uy_e1)&aiinput("hidden","e3","",0,0,"","",uy_e3)&aiinput("hidden","j3","",0,0,"","",uy_j3)
else
e_mz=e_mz&icflot(10,"注意","你没有这个权限！")
end if
else
uy_ft=11
e_mz=e_mz&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&icflsr(25,"卖得","","j2","",6,50,"*直接填写数字","",uy_j2)&icflsr(5,"卖注","","s2","",0,200,"买家备注信息","",uy_s2)
e_mz=e_mz&icflsr(25,"买家","","e1","",0,50,"*","",uy_e1)&icflsr(25,"买出","","j1","",6,50,"*直接填写数字","",uy_j1)&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)&icflsr(25,"证获","","j3","",6,50,"直接填写数字","",uy_j3)
end if
e_mz=e_mz&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
e_mz=e_mz&icflot(10,"卖家",utselect(1,"",uy_c2,"c2",""))
e_mz=e_mz&icflsr(5,"地址","","d2","",0,50,"*卖家的详细地址","",uy_d2)&icflsr(25,"名称","","m2","",0,50,"*卖家尊称","",uy_m2)&icflsr(25,"电话","","h2","",0,50,"*卖家联系电话","",uy_h2)
e_mz=e_mz&aiinput("hidden","zt","",0,0,"","",uy_zt)&aiinput("hidden","ft","",0,0,"","",uy_ft)&aiinput("hidden","s1","",0,0,"","",uy_s1)&aiinput("hidden","s3","",0,0,"","",uy_s3)&aiinput("hidden","e2","",0,0,"","",uy_e2)&aiinput("hidden","c1","",0,0,"","",uy_c1)&aiinput("hidden","d1","",0,0,"","",uy_d1)&aiinput("hidden","m1","",0,0,"","",uy_m1)&aiinput("hidden","h1","",0,0,"","",uy_h1)&aiinput("hidden","xy","",0,0,"","",uy_xy)&aiinput("hidden","pf","",0,0,"","",uy_pf)&aiinput("hidden","ot","",0,0,"","",uy_ot)&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
'------------------------------------------出售服务 add 99
end if
'add 1
end if
'------------------------------------------------------------------------------------dong 1
e_mz=e_mz&icflot(10,"验证",eskyx(0,1,2))
if uyfty=1 then
if ainull(uydtit) then uydtit="处理"&s_uduys

if aibj(e_uer,uy_e1) and uy_fk<3 and aiint(right(uy_ft,1))<3 then
e_mz=e_mz&icflot(10,"",aibutton(2,"","","f-sb f-skx",uydtit)&aibutton(2,"qzf","","f-sb f-skx","确认支付"))
elseif aibj(e_uer,uy_e2) and uy_fk<3 and (uy_ft=31 or uy_ft=33) and aiint(uy_j3)>0 then
e_mz=e_mz&icflot(10,"",aibutton(2,"","","f-sb f-skx",uydtit)&aibutton(2,"qzf","","f-sb f-skx","确认支付"))
else
e_mz=e_mz&icflot(10,"",aibutton(2,"","","f-sb f-skx",uydtit))
end if

e_mz=e_mz&aiinput("hidden","id","",0,0,"","",uy_id)&aiinput("hidden","y_zt","",0,0,"","",uy_zt)&aiinput("hidden","y_ft","",0,0,"","",uy_ft)&aiinput("hidden","y_j3","",0,0,"","",uy_j3)
else
if ainull(uydtit) then uydtit="发起"&s_uduys
e_mz=e_mz&icflot(10,"",aibutton(2,"","","f-sb f-skx",uydtit)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
e_mz=e_mz&"</ul></form></div>"
if aibj(e_uer,uy_e1) and uy_fk=3 and aiint(right(uy_ft,1))<5 then
e_mz=e_mz&"<li>"&aiiframe(eshref(s_drplug&"AsaiPay/?fk="&uy_j1&"&mj="&i_mzf&"&bh="&uy_sn&"&mc="&uy_e1&"-"&uy_e2&"&ms="&uy_t1&"&wz="&g_uhost&"",3),"zhifu","100%","600px")&"</li>"'tit
'e_mz=e_mz&aibutton(2,"qzf","","f-sb f-skx","在线支付")
end if
end if'pf=0 ---1
if uyfty=1 then
e_mzs=e_mzs&espl(80234,s_uduys,eshref(s_uduy&g_urg&uy_ty&g_urg&s_umxx&g_urg&uy_sn&g_urz,66),uy_id,uy_xt,uybiao,"uy_xt","uy_id","")
end if
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&uydtit&"</a></li>"
e_mt=esbts(s_udxuy,s_udluy,uydtit&g_gy&e_lj1,s_uduys&s_umlbs&g_gy&e_lj0)
if not aibj(uydtit,s_umtjs&s_uduys) then ew_bt=uydtit&","&ew_bt

uydoing=e_mx
if not ainull(e_mz) then
if aibj(g_u2,s_umfb) then
uydoing=uydoing&e_mz
else
uydoing=uydoing&"<div class=""sy-c10""><div class=crg></div><li class=""c-h"">"&uydtit&"</li>"&e_mz&"</div>"
end if
end if
uydoing=uydoing&e_mzs
end if
End Function
'-----------------------------------
'gm form
Function uyfmgm()
uyfmgm=""
uyfmgm=uyfmgm&icflxz(25,"状态","zt","","","",uy_zt,0,i_buyzt)&icflxz(25,"付方","fk","","*付款方式","",uy_fk,0,i_buyfk)&icflxz(5,"付态","ft","","","",uy_ft,0,i_buyft)
uyfmgm=uyfmgm&icflsr(25,"买家","","e1","",0,50,"*","",uy_e1)&icflsr(25,"买出","","j1","",6,50,"*直接填写数字","",uy_j1)&icflsr(5,"买注","","s1","",0,200,"买家备注信息","",uy_s1)
uyfmgm=uyfmgm&icflsr(25,"卖家","","e2","",0,50,"*","",uy_e2)&icflsr(25,"卖得","","j2","",6,50,"*直接填写数字","",uy_j2)&icflsr(5,"卖注","","s2","",0,200,"卖家备注信息","",uy_s2)
uyfmgm=uyfmgm&icflsr(25,"证方","","e3","",0,50,"","",uy_e3)&icflsr(25,"证获","","j3","",6,50,"直接填写数字","",uy_j3)&icflsr(5,"证注","","s3","",0,200,"证方备注信息","",uy_s3)
uyfmgm=uyfmgm&icflwb(10,"内容","yr","","",0,8000,"*交易内容","",uy_yr)
uyfmgm=uyfmgm&icflot(10,"买家",utselect(1,"",uy_c1,"c1",""))
uyfmgm=uyfmgm&icflsr(5,"地址","","d1","",0,50,"*买家人的详细地址","",uy_d1)&icflsr(25,"名称","","m1","",0,50,"*买家人尊称","",uy_m1)&icflsr(25,"电话","","h1","",0,50,"*买家人联系电话","",uy_h1)
uyfmgm=uyfmgm&icflot(10,"卖家",utselect(1,"",uy_c2,"c2","2"))
uyfmgm=uyfmgm&icflsr(5,"地址","","d2","",0,50,"*卖家人的详细地址","",uy_d2)&icflsr(25,"名称","","m2","",0,50,"*卖家人尊称","",uy_m2)&icflsr(25,"电话","","h2","",0,50,"*卖家人联系电话","",uy_h2)
uyfmgm=uyfmgm&icflxz(25,"审核","xy","","*是否审核订单。","",uy_xy,0,i_bxy)&icflxz(25,"评分","pf","","*交易评分","",uy_pf,0,i_buypf)&icflsr(5,"其他","","ot","",0,50,"*订单其他相关","",uy_ot)
if e_uxy>2 then
uyfmgm=uyfmgm&icflxz(25,"类型","ty","","","",uy_ty,0,i_buyty)&icflsr(25,"编码","","sn","",0,50,"*订单编码","",uy_sn)&icflsr(5,"提示","","uh","",0,50,"请直接添加可用优惠券号码及优惠规则（样本：优惠券减免额度|优惠券使用限额|优惠券号码|发券人","",uy_uh)
uyfmgm=uyfmgm&icflsr(5,"时间","","tm","",99,100,"订单创建时间","",uy_tm)&icflsr(5,"更新","","t1","",99,100,"最后更新时间","",uy_t1)
uyfmgm=uyfmgm&"</ul><ul>"&icflot(10,"点评",eseditxt(uy_xt,"xt",1))
else
uyfmgm=uyfmgm&aiinput("hidden","ty","",0,0,"","",uy_ty)&aiinput("hidden","uh","",0,0,"","",uy_uh)&aiinput("hidden","sn","",0,0,"","",uy_sn)&aiinput("hidden","tm","",0,0,"","",uy_tm)&aiinput("hidden","t1","",0,0,"","",uy_t1)&aiinput("hidden","xt","",0,0,"","",uy_xt)
end if
End Function
'-----------------------------------
'add action
'=uyadd()
'-----------------------------------
Function uyadd(uyfqx,uyftyy)
dim uyadty,uyadjj,uyaddok,uyaduh
uyaduh=""
uyadty=aiint(aireq("ty"))
ew_bt=s_umtjs&s_uduys&","&ew_bt:ew_zt=s_umtjs&s_uduys&","&ew_zt:ew_nr=s_umtjs&s_uduys&","&ew_nr:ew_cp=e_ubt&","&ew_cp
if e_uid>0 then'登录
if esky(1,e_uzy) then'验证
if aireqx("j1,j2,fk") then'必填项
if uyck(uyadty,aireq("yr"),aireq("j1"),aireq("j2"),aireq("j3"),aireq("uh"),aireq("fk"),aireq("e1"),aireq("e2")) then'验证订单可行性
'--------------sys uy 0
''优惠信息处理（暂时未开放）
if ddduhjq>0 then
Call gysgx(uqbiao,"uq_xy=1,uq_us='"&e_uer&"',uq_u1='"&aireq("e2")&"'","uq_sn='"&aireq("uh")&"'")
uyadjj=aiint(aiint(aireq("j1"))-ddduhjq)
'uyaduh="uy_yh='"&ddduhjq&"|"&ddduhje&"|"&aireq("uh")&"|"&ddduhus&"',uy_j1="&uyadjj&",uy_j2="&uyadjj&",uy_j3="&ddduhjq&",uy_e3='"&ew_ky&"'"&","
uyaduh=ddduhjq&"|"&ddduhje&"|"&aireq("uh")&"|"&ddduhus
else
uyadjj=aiint(aireq("j1"))
end if
uyaddok=false
if aiint(aireq("dcs"))>0 then
dim uyadyrr,uyadurr,uyadjrr,uyadyud,uyadyii,uyadujj,uyaduus,uyaduser,uyaduzj,uyadusn,uyaduyr,uyadusjj,uyaddds
uyadyrr=split(aireq("yr"),x_ddgx)
uyadyud=ubound(uyadyrr)
uyadurr=split(aireq("dus"),x_ddgx)
uyaduser=trim(replace(aireq("dus"),x_ddgx," "))
uyadjrr=split(aireq("djj"),x_ddgx)
for uyadyii=1 to uyadyud
uyaduus=uyadurr(uyadyii)
uyaduzj=aiint(usrzj(uyaduus))
uyadusjj=aiint(uyadjrr(uyadyii))
if ew_dd=0 then'拆分
dim uyadcfrr,uyadcfi,uyadcfrx
uyadcfrr=split(uyadyrr(uyadyii),x_ddga)
'@@test##ESQM7TAISJF||100||1||车新参数规则||84##ESQM8L08USI||2||2||悬赏的测试内容||87##ESQM7FNTQ6X||588||1||独家特供测试页面||84
for uyadcfi=1 to ubound(uyadcfrr)
uyaduyr=uyadcfrr(uyadcfi)
'response.Write "dddddddd"&uyaduyr&"<br />"
uyadcfrx=split(uyaduyr,x_ddgb)
uyaduyr=x_ddgx&uyaduser&x_ddga&uyaduyr
uyadujj=aiint(aiint(uyadcfrx(1))*aiint(uyadcfrx(2)))
if uyadujj<x_ddm and uyadusjj<x_ddm+x_ddy-1 then uyadujj=uyadujj+x_ddy
if uyadyud>1 then
uyadusn=aireq("sn")&"-"&uyadyii&"_"&uyadcfrx(0)
else
uyadusn=aireq("sn")&"_"&uyadcfrx(0)
end if
uyaddok=uymna(uyadcfrx(4),uyadusn,uyaduyr,uyadujj,uyaduus,uyaduh)
next
else'用户订单
uyadujj=uyadusjj
if uyadyud>1 then
uyadusn=aireq("sn")&"-"&uyadyii
else
uyadusn=aireq("sn")
end if
uyaduyr=x_ddgx&uyadyrr(uyadyii)
uyaddok=uymna(ew_dd,uyadusn,uyaduyr,uyadujj,uyaduus,uyaduh)
end if
next
else'普通服务
uyaddok=uymna(0,aireq("sn"),aireq("yr"),aiint(aireq("j1")),aireq("us"),uyaduh)
end if
'response.Write uyaddok&"<br />"
'--------------sys uy 1
if uyaddok then
Call aisn(0)
if aiint(right(uyadty,1))>4 or uyadty=0 then Response.Cookies(x_ddck)=""
'完成后跳转link
dim dddur
if aibj(aireq("dxx"),"1") then
dddur=eshref(s_uduy&g_urz,66)
elseif aibj(g_u2,s_umfb) then
dddur=1
else
dddur=eshref(s_uduy&g_urg&uyadty&g_urg&s_umxx&g_urg&aireq("sn")&g_urz,66)
end if
e_ma=e_ma&aitiao(s_uduys&"发起"&s_ztcg&"<BR><BR>买家："&aireq("e1")&"  付："&uyadjj&"　卖家："&uyaduser&"　付款方式："&aiarr(i_buyfk,"|",aiint(aireq("fk"))),dddur,i_nmtz)
'e_ma=e_ma&aigo(s_umtjs&s_uduys&s_ztcg&"\n\n订单详情：\n\n买家："&aireq("e1")&"  付："&uyadjj&"\n卖家："&uyaduser&"\n付款方式："&aiarr(i_buyfk,"|",aiint(aireq("fk")))&"",dddur)
else
e_ma=e_ma&aigo(s_umtjs&s_uduys&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduys&s_ztsb&"\n\n失败订单\n"&d_uyddts&"\n请核实后重新提交！",1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduys&s_ztsb&"\n\n未按要求将表单填写完整",1)
end if
else
'e_ma=uyform(0,uyfqx,uyftyy)&e_ma
e_ma=uydoing(uyftyy,uyfqx)&e_ma
end if
else
e_ma=e_ma&aigo("请登录",u_login)
end if
End Function
'-----------------------------------
'edit action
'=uyedit()
'-----------------------------------
Function uyedit(uyfqx,uyfsn)
ew_bt=s_umxgs&s_uduys&","&ew_bt:ew_zt=s_umxgs&s_uduys&","&ew_zt:ew_nr=s_umxgs&s_uduys&","&ew_nr:ew_cp=e_ubt&","&ew_cp
if e_uid>0 then'登录
if esky(1,e_uzy) and aireq("sn")<>"" then'验证
if aireqx("j1,ty,zt,fk,ft") then'必填项
'---------------------------------
if aiint(right(aireq("ft"),1))<8 and aiint(right(aireq("zt"),1))=8 then
e_ma=e_ma&aigo(s_umxgs&s_uduys&s_ztsb&"("&s_uduys&"支出未完成，请返回核实完成支付后重试。)",1)
else
if gysfm(uylie("form"),uybiao,"(uy_id="&aiint(aireq("id"))&" and uy_zt="&aiint(aireq("y_zt"))&" and uy_ft="&aiint(aireq("y_ft"))&" and uy_j3="&aiint(aireq("y_j3"))&") or (uy_id<>"&aiint(aireq("id"))&" and uy_sn='"&aistr(aireq("sn"))&"' and uy_zt="&aiint(aireq("y_zt"))&" and uy_ft="&aiint(aireq("y_ft"))&" and uy_j3="&aiint(aireq("y_j3"))&")","uy_",2) then
if uymnb(aiint(aireq("ty")),aiint(aireq("zt")),aiint(aireq("fk")),aiint(aireq("ft")),aiint(aireq("pf")),aireq("e1"),aiint(aireq("j1")),aireq("e2"),aiint(aireq("j2")),aireq("e3"),aiint(aireq("j3")),aiint(aireq("id"))) then'验证订单可行性并处理最终支付
dim dddur
if uyfqx=1 then
dddur=eshref(s_umgl&g_urg&s_uduy&g_urg&aireq("ty")&g_urg&s_umxg&g_urg&aireq("id")&g_urz,77)
else
dddur=eshref(s_uduy&g_urg&aireq("ty")&g_urg&s_umxg&g_urg&aireq("sn")&g_urz,66)
end if
e_ma=e_ma&aitiao(s_uduys&"处理操作完成 "&d_uyddts&"",dddur,i_nmtz)
else
e_ma=e_ma&aigo(s_umxgs&s_uduys&s_ztsb&"("&s_uduys&"支出出现问题\n"&d_uyddts&"\n请返回核实并重试)",1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_uduys&s_ztsb&" 订单已更改或不存在。",1)
end if
end if
'else
'e_ma=e_ma&aigo(s_umxgs&s_uduys&s_ztsb&"(请完成"&s_uduys&"支出，或联系卖家处理！)",1)
'end if
'---------------------------------
else
e_ma=e_ma&aigo(s_umxgs&s_uduys&s_ztsb,1)
end if
else
if uyfqx=1 then
uywhere="uy_id="&aiint(g_u4)&""
elseif IsNumeric(g_u3) then
uywhere="uy_id="&aiint(g_u3)&" and (uy_e1='"&e_uer&"' or uy_e2='"&e_uer&"' or uy_e3='"&e_uer&"')"
else
uywhere="uy_sn='"&g_u3&"' and (uy_e1='"&e_uer&"' or uy_e2='"&e_uer&"' or uy_e3='"&e_uer&"')"
end if
if gysread(uylie("all"),uybiao,uywhere,"") then
ew_bt=uy_e1&","&ew_bt:ew_zt=uy_e1&","&ew_zt:ew_nr=uy_e1&","&ew_nr
e_ma=uydoing(1,uyfqx)&e_ma
e_mt=esbts(s_udxuy,s_udluy,s_umxgs&s_uduys&g_gy&eshref(s_umgl&g_urg&s_uduy&g_urg&uy_ty&g_urg&s_umxg&g_urg&g_u4&g_urz,77),s_uduys&s_umlbs&g_gy&e_lj0)
else
e_ma=e_ma&aigo(s_uduys&s_ztno,1)
end if
end if
else
e_ma=e_ma&aigo(s_ztsb&" 请先登录！",1)
end if
End Function
'-----------------------------------
'check shop product
'=uycksl(uyfty,uyfstr,uyfdb)
'-----------------------------------
Function uycksl(uyfty,uyfstr,uyfdb)
'response.Write uyfty&uyfstr&"<br />"
if aiint(right(uyfty,1))>4 or aiint(uyfty)=0 then
uycksl=false
dim ddxdrr,ddxdi,ddxdls,ddxdud,ddadrr,ddadi,ddadls,ddadud,ddbdrr,ddbdsn,ddbdjg,ddbdsl,ddbdbt,ddbdel,ddadus,ddbdlin,ddbdsql,ddbdtt
d_uyddts=""
ddbdlin=""
ddbdsql=""
ddbdtt=""
if uyfstr<>"" then'0-1-A
ddxdrr=split(uyfstr,x_ddgx)
ddxdud=ubound(ddxdrr)
if ddxdud>0 then
for ddxdi=1 to ddxdud'@@
ddxdls=ddxdrr(ddxdi)
if ddxdls<>"" then
ddadrr=split(ddxdls,x_ddga)
ddadud=ubound(ddadrr)
ddadus=ddadrr(0)
if aibj(ddadus,e_uer) then
d_uyddts=d_uyddts&"\n您不能购买["&ddadus&"]的商品！\n"
else
if ddadud>0 then
'----------------------------------------------
ddbdlin=ddbdlin&x_ddgx&ddadus
for ddadi=1 to ddadud'##
ddadls=ddadrr(ddadi)
ddbdrr=split(ddadls,x_ddgb)'||
if ubound(ddbdrr)=4 then
ddbdsn=ddbdrr(0)
ddbdjg=aiint(ddbdrr(1))
ddbdsl=aiint(ddbdrr(2))
ddbdel=aiint(ddbdrr(4))
if not isNumeric(ddbdjg) then ddbdjg=0
if not isNumeric(ddbdsl) then ddbdsl=0
if uyfdb=1 then
if gysread("ai_jg,ai_oz,ai_oy,ai_bt,ai_el,ai_ep,ai_ef,ai_sn","ees_ai","ai_sn='"&ddbdsn&"'","") then
ddbdbt=ai_bt
ddbdel=ai_el
ai_jg=aiint(ai_jg)
ai_oz=aiint(ai_oz)
ai_oy=aiint(ai_oy)
if ai_oz=0 and ai_oy>0 then
ddbdsql="1"
ddbdtt="2"
d_uyddts=d_uyddts&"\n"&ddbdbt&"("&ddbdsn&")已售完\n"
elseif ddbdsl>ai_oz and ai_oz>0 then
ddbdsql="1"
d_uyddts=d_uyddts&"\n"&ddbdbt&"("&ddbdsn&")库存数量不足最多可购买"&ai_oz&"件，小于您购买"&ddbdsl&"件）\n"
ddbdsl=ai_oz
elseif ai_oz=0 and ai_oy=0 then
ai_oz=9999-ddbdsl
ai_oy=ddbdsl
else
ai_oz=ai_oz-ddbdsl
ai_oy=ai_oy+ddbdsl
end if
if ai_jg>ddbdjg then
ddbdsql="1"
ddbdjg=ai_jg
d_uyddts=d_uyddts&"\n["&ddbdbt&"("&ddbdsn&")价格"&ddbdjg&"变动为"&ai_jg&"]\n"
end if
if ddbdsql<>"1" then
if ddbdsql<>"" then ddbdsql=ddbdsql&g_gg
ddbdsql=ddbdsql&"update ees_ai set ai_oz="&ai_oz&",ai_oy="&ai_oy&" where ai_sn='"&ddbdsn&"'"
ddbdsql=ddbdsql&g_gg&ai_ep&g_apj&ai_ef&g_apj&ai_sn
end if
else
ddbdsql="1"
ddbdtt="2"
d_uyddts=d_uyddts&"\n\n["&ddbdbt&"("&ddbdsn&")已经下架或不存在]"
end if
end if
if ddbdtt<>"2" then ddbdlin=ddbdlin&x_ddga&ddbdsn&x_ddgb&ddbdjg&x_ddgb&ddbdsl&x_ddgb&ddbdbt&x_ddgb&ddbdel
end if
next
'----------------------------------------------
end if
end if
end if
next
end if
end if'0-1-C
if ddbdsql="1" then
Response.Cookies(x_ddck)=ddbdlin
else
if ddbdsql<>"" then
dim ddbdqrr,ddbdqi,ddbdqud
ddbdqrr=split(ddbdsql,g_gg)
ddbdqud=ubound(ddbdqrr)
for ddbdqi=0 to ddbdqud step 2
conn.execute(ddbdqrr(ddbdqi))
Call eskod(11,11,ddbdqrr(ddbdqi+1))
next
end if
uycksl=true
end if
else
uycksl=true
end if
End Function
'-----------------------------------
'check deal
'=uyck(aireq("ty"),aireq("yr"),aireq("j1"),aireq("j2"),aireq("j3"),aireq("uh"),aireq("fk"),aireq("e1"),aireq("e2"))
'-----------------------------------
Function uyck(uyfty,uyfyr,uyfj1,uyfj2,uyfj3,uyfyh,uyffk,uyfe1,uyfe2)
uyck=false
if e_uxy>0 then'需审核
if aibj(uyfe1,uyfe2) and e_gdj<4 then'禁止同账号订单
e_ma=e_ma&aigo(s_ztsb&"不能同一账号交易.",1)
Exit Function
else
if not uycksl(uyfty,uyfyr,1) then
e_ma=e_ma&aigo(s_ztsb&"订单无法接受,请返回核实{"&d_uyddts&"}.",1)
Exit Function
else
if (aibj(e_uer,uyfe1) and aiint(left(uyfty,1))<5) or (aibj(e_uer,uyfe2)  and aiint(left(uyfty,1))>4) or e_uxy>3  then'验证交易用户
uyfty=aiint(uyfty)
uyffk=aiint(uyffk)
uyfj1=aiint(uyfj1)
uyfj2=aiint(uyfj2)
uyfj3=aiint(uyfj3)
'----------you hui 0
if not ainull(uyfyh) and uyfyh<>"0" then
if gysread("uh_jq,uh_je,uh_t1,uh_t2,uh_ty",uqbiao&","&uhbiao,"uh_sn=uq_uh and uq_sn='"&UCase(uyfyh)&"' and (uq_us='"&e_uer&"' or uq_u1='"&e_uer&"') and uq_xy=0 and datediff('d',uh_t1,Now())>=0 and datediff('d',uh_t2,Now())=<0","") then
if uyfj1>=aiint(uh_je) then
if aibj(uyfe2,uh_us) then
'金币|经验|金钱
ddduhus=uh_us
ddduhty=aiint(uh_ty)
ddduhjq=aiint(uh_jq)
ddduhje=aiint(uh_je)
else
e_ma=e_ma&aigo(s_ztsb&s_uduqs&"不可用[仅限与"&uh_us&"交易],请更换或删除.",1)
Exit Function
end if
else
e_ma=e_ma&aigo(s_ztsb&s_uduqs&"不可用[交易额"&uyfj1&"小于使用限额"&uh_je&"],请更换或删除.",1)
Exit Function
end if
else
e_ma=e_ma&aigo(s_ztsb&s_uduqs&"不可用[已使用或不在使用期内"&UCase(uyfyh)&"],请更换或删除.",1)
Exit Function
end if
end if
'----------you hui 1
'----------pan duan 0
if aiint(left(uyfty,1))>4 then'出售
uyck=true
elseif aiint(left(uyfty,1))<5 then'购买
if uyffk>2 then'稍后付款
if uyfty=11 and uyfj1=uyfj2 and uyfj3=0 and e_uxy>3 then'充值
uyck=true
elseif aiint(left(uyfty,1))=1 and uyfty<>"11" and uyfj2>0 and uyfj1>0 and int(uyfj2+uyfj3)=uyfj1 then
uyck=true
elseif (aiint(left(uyfty,1))=2 or uyfty=0) and uyfj1>0 then'定金
uyck=true
else
e_ma=e_ma&aigo(s_ztsb&"金额填写有误，请返回核实！",1)
Exit Function
end if
else'即时付款
	if uyfty=11 and uyfj1=uyfj2 and uyfj3=0 and e_uxy>3 then'充值
	uyck=true
	elseif (aiint(left(uyfty,1))=1 and uyfty<>"11" and uyfj2>0 and uyfj1>0 and int(uyfj2+uyfj3)=uyfj1) or (aiint(left(uyfty,1))>1 and uyfj1>0) or (aiint(uyfty)=0 and uyfj1>0) then
	if (uyffk=0 and e_ujb>=uyfj1) or (uyffk=1 and e_ujy>=uyfj1) or (uyffk=2 and e_ujq>=uyfj1) then
	uyck=true
	else
	e_ma=e_ma&aigo(s_ztsb&aiarr(i_buyfk,"|",uyffk)&"不足，请返回核实！",1)
	Exit Function
	end if
	else
	e_ma=e_ma&aigo(s_ztsb&"金额填写有误，请返回核实！",1)
	Exit Function
	end if
end if
else'其他情况
e_ma=e_ma&aigo(s_ztsb&"信息填写有误或账户余额不足，请返回核实！",1)
Exit Function
end if
'----------pan duan 1
else
e_ma=e_ma&aigo(s_ztsb&"交易帐户不符合规定.",1)
Exit Function
end if
end if
end if
else
e_ma=e_ma&aigo(s_ztsb&"请先登录并认证您的账户！",1)
end if
End Function
'-----------------------------------
'=uymna(uyfel,uyfsn,uyfyr,uyfjj,uyfus,uyfuh)
'-----------------------------------
Function uymna(uyfel,uyfsn,uyfyr,uyfjj,uyfus,uyfuh)
uy_fk=aiint(aireq("fk"))
uy_xt=aiint(aireq("xt"))
'------------------处理类型与状态
if uyfel=0 then
uy_ty=aiint(aireq("ty"))
uy_zt=aiint(aireq("zt"))
uy_ft=aiint(aireq("ft"))
elseif uyfel=88 then'服务系统88=26
uy_ty=26
uy_zt=10
uy_ft=21
elseif uyfel=87 then'悬赏系统87=49
uy_ty=49
uy_zt=20
uy_ft=10
elseif uyfel=86 then'招标系统86=48
uy_ty=48
uy_zt=10
uy_ft=21
elseif uyfel=85 then'定金系统85=28
uy_ty=28
uy_zt=10
uy_ft=31
elseif uyfel=84 then'订金系统84=27
uy_ty=27
uy_zt=10
uy_ft=21
elseif uyfel=83 then'求购系统83=59
uy_ty=59
uy_zt=20
uy_ft=10
elseif uyfel=81 then'竞拍系统81=29
uy_ty=29
uy_zt=10
uy_ft=30
else'商品系统80|供应系统82
dim uyadtzj
uyadtzj=aiint(usrzj(uyfus))
if uyadtzj=4 then
uy_ty=17
elseif uyadtzj=3 then
uy_ty=18
else
uy_ty=19
end if
uy_zt=10
uy_ft=10
end if
'------------------处理买卖与钱财
if uyxty(uy_ty,1)=1 then'系统
if uyxty(uy_ty,2)=2 then'定金
if uyxty(uy_ty,0)=1 then'购买
uy_e1=e_uer
uy_j1=uyfjj
uy_e2=uyfus
uy_j2=0
uy_e3=""'不为空，则买家定金转到该账户名下
uy_j3=uyfjj*2
else'出售
uy_e1=uyfus
uy_j1=int(uyfjj/2)
uy_e2=e_uer
uy_j2=0
uy_e3=""'不为空，则买家定金转到该账户名下
uy_j3=uyfjj
end if
elseif uyxty(uy_ty,2)=1 then'订金
if uyxty(uy_ty,0)=1 then'购买
uy_e1=e_uer
uy_j1=uyfjj
uy_e2=uyfus
uy_j2=0
if uy_ty=26 then
uy_e3=ew_kt
uy_j3=uy_j1
else
uy_e3=""
uy_j3=0
end if
else'出售
uy_e1=uyfus
uy_j1=uyfjj
uy_e2=e_uer
uy_j2=0
uy_e3=""
uy_j3=0
end if
else'普通
if uyxty(uy_ty,0)=1 then'购买
uy_e1=e_uer
uy_j1=uyfjj
uy_e2=uyfus
uy_j2=uyfjj
uy_e3=""
uy_j3=0
else'出售
uy_e1=uyfus
uy_j1=uyfjj
uy_e2=e_uer
uy_j2=uyfjj
uy_e3=""
uy_j3=0
end if
end if
else'自拟订单
if uy_ty=11 and e_uxy>3 then
uy_e1=aireq("e1")
uy_e2=ew_kt
elseif uy_ty=51 and e_uxy>3 then
uy_e1=ew_kt
uy_e2=aireq("e2")
else
uy_e1=aireq("e1")
uy_e2=aireq("e2")
end if
uy_j1=aiint(aireq("j1"))
uy_j2=aiint(aireq("j2"))
uy_e3=aireq("e3")
uy_j3=aiint(aireq("j3"))
end if
'------------------储存订单
dim uyadlrr,uyadlie,uyadldo
uyadlrr=split(uylie("form"),",")
'response.Write "select "&uylie("all")&" from "&uybiao&" where uy_sn like '%"&uyfsn&"%'"
Call saik(gysrs,"select "&uylie("all")&" from "&uybiao&" where uy_sn like '%"&uyfsn&"%'",1,3)
if gysrs.eof and gysrs.bof then
gysrs.addnew
for gysjj=0 to ubound(uyadlrr)
uyadlie=uyadlrr(gysjj)
'response.Write uyadlie&"<br />"
if aibj(uyadlie,"ty") then
gysrs("uy_"&uyadlie)=uy_ty
elseif aibj(uyadlie,"zt") then
gysrs("uy_"&uyadlie)=uy_zt
elseif aibj(uyadlie,"ft") then
if uyxty(uy_ty,0)=1 and uy_fk<3 then'购买
uyadldo="1"
gysrs("uy_"&uyadlie)=uyxft(uy_ty,0)
else
gysrs("uy_"&uyadlie)=uy_ft
end if
elseif aibj(uyadlie,"sn") then
gysrs("uy_"&uyadlie)=uyfsn
elseif aibj(uyadlie,"yr") then
gysrs("uy_"&uyadlie)=uyfyr
elseif aibj(uyadlie,"e1") then
gysrs("uy_"&uyadlie)=uy_e1
elseif aibj(uyadlie,"j1") then
gysrs("uy_"&uyadlie)=uy_j1
elseif aibj(uyadlie,"e2") then
gysrs("uy_"&uyadlie)=uy_e2
elseif aibj(uyadlie,"j2") then
gysrs("uy_"&uyadlie)=uy_j2
elseif aibj(uyadlie,"e3") then
gysrs("uy_"&uyadlie)=uy_e3
elseif aibj(uyadlie,"j3") then
gysrs("uy_"&uyadlie)=uy_j3
elseif aibj(uyadlie,"uh") then
gysrs("uy_"&uyadlie)=uyfuh
elseif aibj(uyadlie,"xt") then
if uyadldo="1" then
gysrs("uy_"&uyadlie)=uy_xt&espxx("订单资金进入 "&uyfjj&""&i_gg&e_uer)
else
gysrs("uy_"&uyadlie)=uy_xt
end if
else
if not ainull(aireq(uyadlie)) then gysrs("uy_"&uyadlie)=aireq(uyadlie)
end if
'response.Write "uy_"&uyadlie&"="&aireq(uyadlie)&"<br />"
next
gysrs.update
uymna=True
else
uymna=False
end if
Call saig(gysrs)
'扣户账户支付
if uyadldo="1" then
if uyxty(uy_ty,2)=2 and uyxty(uy_ty,1)=0 then
Call uyxfk(1,uy_fk,uy_j3,uy_e2,0)
else
Call uyxfk(1,uy_fk,uy_j1,uy_e1,0)
end if
end if
'通知会员订单数
Call usrts(12,uy_e1&"|"&uy_e2&"|"&uy_e3)
'response.Write uymna
End Function
'-----------------------------------
'=uymnb()
'-----------------------------------
Function uymnb(uyfty,uyfzt,uyffk,uyfft,uyfpf,uyfe1,uyfj1,uyfe2,uyfj2,uyfe3,uyfj3,uyfid)
uymnb=false
'支付处理
if aireq("qzf")="确认支付" then
if uyffk<3 and aiint(right(uyfft,1))<5 and uyfpf=0 then
if uyfft=51 and uyfj2>0 and not ainull(uyfe1) and uyxjj(uyffk,uyfj2) then
if gysgx(uybiao,"uy_ft=58,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"支付尾款 "&uyfj2&""&i_gg&e_uer)&"'","uy_id="&uyfid&" and uy_ft=51") then
uymnb=uyxfk(1,uyffk,uyfj2,uyfe1,0)
end if
elseif uyfft=31 and uyfj1>0 and not ainull(uyfe1) and uyxjj(uyffk,uyfj1) then
if gysgx(uybiao,"uy_ft=33,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"支付定金 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&" and uy_ft=31") then
uymnb=uyxfk(1,uyffk,uyfj1,uyfe1,0)
end if
elseif uyfft=32 and uyfj1>0 and not ainull(uyfe1) and uyxjj(uyffk,uyfj1) then
if gysgx(uybiao,"uy_ft=38,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"支付定金 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&" and uy_ft=32") then
uymnb=uyxfk(1,uyffk,uyfj1,uyfe1,0)
end if
elseif uyfft=33 and uyfj3>0 and not ainull(uyfe2) and uyxjj(uyffk,uyfj3) then
if gysgx(uybiao,"uy_ft=38,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"支付保证金 "&uyfj3&""&i_gg&e_uer)&"'","uy_id="&uyfid&" and uy_ft=33") then
uymnb=uyxfk(1,uyffk,uyfj3,uyfe2,0)
end if
elseif uyfft=21 and uyfj1>0 and not ainull(uyfe1) and uyxjj(uyffk,uyfj1) then
if gysgx(uybiao,"uy_ft=28,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"支付订金 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&" and uy_ft=21") then
uymnb=uyxfk(1,uyffk,uyfj1,uyfe1,0)
end if
elseif uyfft<15 and uyfj1>0 and not ainull(uyfe1) and uyxjj(uyffk,uyfj1) then
if gysgx(uybiao,"uy_ft=18,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"支付 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&" and uy_ft="&uyfft&"") then
uymnb=uyxfk(1,uyffk,uyfj1,uyfe1,0)
end if
end if
end if
if uymnb then
d_uyddts="支付完成！"
else
d_uyddts="支付出现未知问题！请返回订单详情页面页面重试！"
end if
elseif aiint(right(uyfft,1))<2 and aiint(right(uyfzt,1))>4 and aiint(right(uyfzt,1))<8 then
uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
elseif aiint(right(uyfft,1))<8 and aiint(right(uyfzt,1))=8 then
d_uyddts="请完成支付！"
elseif uyffk>3 and ((aiint(right(uyfzt,1))>4 and aiint(right(uyfzt,1))<8) or (uyfpf>0 and right(uyfzt,1)="8")) then'线下交易成功的评分完成后消除提示
uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
elseif uyffk>3 or (aiint(right(uyfzt,1))<5 and uyfzt<>11) or (aiint(right(uyfft,1))<5 and uyfft<>33 and uyfft<>32) or right(uyfft,1)=9 or uyfpf>0 or aireq("asaiok")="1" then'线下交易、交易进行时、未支付、已评分完成交易、标记交易已完成的不用验证
'd_uyddts="线下交易、交易进行时、未支付、已评分完成交易、标记交易已完成"
uymnb=true
else
if uyxty(uyfty,0)=0 and uyfzt=11 and uyffk<3 and uyfj1>0 and uyfj1>=aiint(uyfj2+uyfj3) and not ainull(uyfe1) then'买家确认服务 并付款
Call gysgx(uybiao,"uy_ft="&uyxft(uyfty,uyfft)&",uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"支付 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
uymnb=uyxfk(1,uyffk,uyfj1,uyfe1,0)
else
'------交易处理   0
if uyfty=26 then'服务订单，特殊订单
if aiint(right(uyfzt,1))=8 then
  if ainull(uyfe3) or uyfj3<1 then
  Call gysgx(uybiao,"uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"获得订金 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1,uyfe2,0)
  elseif uyfj3>=uyfj1 then
  Call gysgx(uybiao,"uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe3&"获得订金奖励 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1,uyfe3,0)
  else
  Call gysgx(uybiao,"uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"获得订金分成 "&uyfj1-uyfj3&""&i_gg&e_uer)&espxx("订单资金变动，"&uyfe3&"获得订金奖励 "&uyfj3&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj3,uyfe3,0)
  uymnb=uyxfk(2,uyffk,aiint(uyfj1-uyfj3),uyfe2,0)
  end if
  uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
elseif aiint(right(uyfzt,1))=6 or aiint(right(uyfzt,1))=7 then
  Call gysgx(uybiao,"uy_ft=29,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"订金退回 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1,uyfe1,0)
  uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
else
uymnb=true
end if
elseif uyxty(uyfty,2)=0 and uyfzt<>11 and left(uyfft,1)<>3 then'普通交易
if uyfj1>0 and uyfj1>=uyfj3 and uyfft=18 and not ainull(uyfe1) and not ainull(uyfe2) then
  if aiint(right(uyfzt,1))=8 then
  if uyfj3>0 and not ainull(uyfe3) then
  uyfj2=uyfj1-uyfj3
  Call gysgx(uybiao,"uy_j2="&uyfj2&",uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe3&"奖励 "&uyfj3&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj3,uyfe3,0)
  end if
  Call gysgx(uybiao,"uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"获得 "&uyfj2&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj2,uyfe2,0)
  else
  Call gysgx(uybiao,"uy_ft=19,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"退回 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1,uyfe1,0)
  end if
if uymnb then uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
else
uymnb=true
end if
else
if uyxty(uyfty,2)=2 then'定金
if uyfj1>0 and uyfj3>0 and not ainull(uyfe1) and not ainull(uyfe2) then'定金部分交易
if uyfft=32 and (right(uyfzt,1)=6 or right(uyfzt,1)=7) then
  Call gysgx(uybiao,"uy_ft=39,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"保证金退回 "&uyfj3&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj3,uyfe2,0)
  if uymnb then uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
elseif uyfft=33 and (right(uyfzt,1)=6 or right(uyfzt,1)=7) then
  Call gysgx(uybiao,"uy_ft=39,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"定金退回 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1,uyfe1,0)
  if uymnb then uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
elseif uyfft=38 then
  if uyfzt=27 then
  Call gysgx(uybiao,"uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"获得保证金赔偿 "&uyfj1&"+"&uyfj3&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1&"+"&uyfj3,uyfe2,0)
  if uymnb then uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
  elseif uyfzt=17 or aiint(right(uyfzt,1))=8 then
  Call gysgx(uybiao,"uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"获得定金赔偿 "&uyfj1&"+"&uyfj3&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1&"+"&uyfj3,uyfe1,0)
  if uymnb then uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
  elseif uyfzt=11 then
  if ainull(uyfe3) then
  Call gysgx(uybiao,"uy_ft=51,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"获得定金和保证金 "&uyfj1+uyfj3&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,aiint(uyfj1+uyfj3),uyfe2,0)
  else
  Call gysgx(uybiao,"uy_ft=51,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"获得保证金返回 "&uyfj3&""&i_gg&e_uer)&espxx("订单资金变动，"&uyfe3&"获得奖励 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  if uyxfk(2,uyffk,uyfj1,uyfe3,0) and uyxfk(2,uyffk,uyfj3,uyfe2,0) then uymnb=true
  end if
  else
  Call gysgx(uybiao,"uy_ft=39,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"定金退回 "&uyfj1&""&i_gg&e_uer)&espxx("订单资金变动，"&uyfe2&"定金退回 "&uyfj3&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  if uyxfk(2,uyffk,uyfj1,uyfe1,0) and uyxfk(2,uyffk,uyfj3,uyfe2,0) then uymnb=true
  if uymnb then uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
  end if
end if
end if
elseif uyxty(uyfty,2)=1 and left(uyfft,1)<>3 then'订金
if uyfj1>0 and uyfft=28 and not ainull(uyfe1) and not ainull(uyfe2) then'订金部分交易
  if aiint(right(uyfzt,1))=8 or uyfzt=11 then
  if ainull(uyfe3) or uyfj3<1 then
  Call gysgx(uybiao,"uy_ft=51,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"获得订金 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1,uyfe2,0)
  elseif uyfj3>=uyfj1 then
  Call gysgx(uybiao,"uy_ft=51,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe3&"获得订金奖励 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1,uyfe3,0)
  else
  Call gysgx(uybiao,"uy_ft=51,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"获得订金分成 "&uyfj1-uyfj3&""&i_gg&e_uer)&espxx("订单资金变动，"&uyfe3&"获得订金奖励 "&uyfj3&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj3,uyfe3,0)
  uymnb=uyxfk(2,uyffk,aiint(uyfj1-uyfj3),uyfe2,0)
  end if
  else
  Call gysgx(uybiao,"uy_ft=29,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"订金退回 "&uyfj1&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj1,uyfe1,0)
  if uymnb then uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
  end if
end if
end if
if uyfj2>0 and uyfft=58 and left(uyfft,1)<>3 and not ainull(uyfe1) and not ainull(uyfe2) then'尾款部分交易
if uyfzt=11 then
  uymnb=true
else
  if aiint(right(uyfzt,1))=8 then
  Call gysgx(uybiao,"uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe2&"获得尾款 "&uyfj2&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj2,uyfe2,0)
  else
  Call gysgx(uybiao,"uy_ft=59,uy_xt=uy_xt"&espdbi()&"'"&espxx("订单资金变动，"&uyfe1&"尾款退回 "&uyfj2&""&i_gg&e_uer)&"'","uy_id="&uyfid&"")
  uymnb=uyxfk(2,uyffk,uyfj2,uyfe1,0)
  end if
if uymnb then uymnb=usrts(11,uyfe1&"|"&uyfe2&"|"&uyfe3)
end if
end if
end if
'------交易处理   1
end if
end if
'd_uyddts=d_uyddts&uyfzt&uymnb
End Function
'-----------------------------------
'=uyxjj(uyffk,uyfjj)
'-----------------------------------
Function uyxjj(uyffk,uyfjj)
uyxjj=false
if uyffk=0 then
if e_ujb>=uyfjj then uyxjj=true
elseif uyffk=1 then
if e_ujy>=uyfjj then uyxjj=true
elseif uyffk=2 then
if e_ujq>=uyfjj then uyxjj=true
end if
End Function
'-----------------------------------
'=uyxfks(uyfty)
'-----------------------------------
Function uyxfks(uyfty)
if uyfty=0 then
uyxfks="个金币"
elseif uyfty=1 then
uyxfks="点经验"
else
uyxfks="元"
end if
End Function
'-----------------------------------
'=uyxfk(2,uyffk,uyfty)
'-----------------------------------
Function uyxfk(uyflx,uyffk,uyfjj,uyfus,uyfty)
uyxfk=false
dim uydsf
if uyflx=2 then
uydsf="+"
else
uydsf="-"
end if
uyfjj=aiint(uyfjj)
if aibj(uyffk,"0") then
uyxfk=gysgx(usbiao,"us_jb=us_jb"&uydsf&uyfjj&"","us_er='"&uyfus&"'")

e_usb=aiint(e_usb)
if e_usb>0 then Call gysgx(usbiao&"_"&e_usb,"us_xt=us_xt"&espdbi()&"'"&espxx("jb"&uydsf&uyfjj&""&i_gg&e_uer)&"'","us_er='"&e_uer&"'")

if aibj(uyfus,e_uer) then e_ma=e_ma&usergx(uyflx,"jb",uyfjj)
elseif aibj(uyffk,"1") then
uyxfk=gysgx(usbiao,"us_jy=us_jy"&uydsf&uyfjj&"","us_er='"&uyfus&"'")

e_usb=aiint(e_usb)
if e_usb>0 then Call gysgx(usbiao&"_"&e_usb,"us_xt=us_xt"&espdbi()&"'"&espxx("jy"&uydsf&uyfjj&""&i_gg&e_uer)&"'","us_er='"&e_uer&"'")

if aibj(uyfus,e_uer) then e_ma=e_ma&usergx(uyflx,"jy",uyfjj)
elseif aibj(uyffk,"2") or aibj(uyffk,"3") then
uyxfk=gysgx(usbiao,"us_jq=us_jq"&uydsf&uyfjj&"","us_er='"&uyfus&"'")

e_usb=aiint(e_usb)
if e_usb>0 then Call gysgx(usbiao&"_"&e_usb,"us_xt=us_xt"&espdbi()&"'"&espxx("jq"&uydsf&uyfjj&""&i_gg&e_uer)&"'","us_er='"&e_uer&"'")

if aibj(uyfus,e_uer) then e_ma=e_ma&usergx(uyflx,"jq",uyfjj)
end if
End Function
'-----------------------------------
'=uyxty(uyfty,uyflx)
'-----------------------------------
Function uyxty(uyfty,uyflx)
if uyflx=2 then'uyxty(uyfty,2)=1
if uyfty=71 or uyfty=29 or uyfty=28 or uyfty=22 then'定金
uyxty=2
elseif uyfty=61 or uyfty=48 or uyfty=27 or uyfty=26 or uyfty=21 then'订金
uyxty=1
else'普通
uyxty=0
end if

elseif uyflx=1 then'uyxty(uyfty,1)=1
if aiint(right(uyfty,1))>4 then'系统订单
uyxty=1
else
uyxty=0
end if

else'uyxty(uyfty,0)=1
if aiint(left(uyfty,1))<5 then'购买
uyxty=1
else'出售
uyxty=0
end if
end if
End Function
'-----------------------------------
'=uyxft(uyfty,uyfft)+1
'-----------------------------------
Function uyxft(uyfty,uyfft)
'初始状态=10|
'等待支付=11|
'支付完成=18|
'等待支付订金=21|
'订金支付完成=28|
'等待支付定金=31|
'买方定金未付=32|
'卖方定金未付=33|
'定金支付完成=38|
'等待支付尾款=51|
'尾款支付完成=58
'response.Write "ddddddddd<br />"
if uyfft=51 then
uyxft=58
elseif uyfft=31 then
if uyxty(uyfty,0)=1 then
uyxft=33
else
uyxft=32
end if
elseif uyfft=32 or uyfft=33 then
uyxft=38
elseif uyfft=21 then
uyxft=28
elseif uyfft=10 or uyfft=11 then
uyxft=18
else
if uyxty(uyfty,2)=2 then
if uyxty(uyfty,0)=1 then
uyxft=33
else
uyxft=32
end if
elseif uyxty(uyfty,2)=1 then
uyxft=28
else
uyxft=18
end if
end if
'response.Write uyxft&"<br />"
End Function
'-----------------------------------
'list
'=uylist()
'-----------------------------------
Function uylist(uyfqx)
dim uylpg,uylps,uylpuq,uylpuh,uylpur,uylgrr,uylty
if uyfqx=1 then
uylpuq=eshref(s_umgl&g_urg&s_uduy,66)
uylty=aiint(g_u2)
lidms=g_u3
uylpuh=g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10
uylpur=uylpuq&g_urg&uylty&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uylpuh&g_urz
uylpg=aiint(g_u4)
uylps=aiint(g_u5)
else
uylpuq=eshref(s_uduy,66)
uylty=aiint(g_u1)
lidms=g_u2
uylpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
uylpur=uylpuq&g_urg&uylty&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uylpuh&g_urz
uylpg=aiint(g_u3)
uylps=aiint(g_u4)
end if

if ainull(lidms) or lidms="0" then lidms=d_suyls
if right(aisrd(uylty,i_buyty),2)="订单" or uylty=0 or (right(aisrd(uylty,i_buyty),2)="服务" and e_uxy<4)  then
e_mt=esbts(s_udxuy,s_udluy,s_uduys&s_umlbs&g_gy&e_lj0,"")
else
e_mt=esbts(s_udxuy,s_udluy,s_uduys&s_umlbs&g_gy&e_lj0,"<i>发起"&s_uduys&"</i>"&g_gy&e_lj1)
end if

if uyfqx=1 then
e_mx=e_mx&"<div class=""l-ma lh""><div class=""l-1"">"
e_mx=e_mx&uyfl(1,uylpuq,lidms,uylty)
e_mx=e_mx&"<div class=""cr""></div></div></div>"
end if
iclls=icliqls(5,lidms,eshref(uylpuq&g_urg&uylty&g_urg&g_gg&g_urg&g_urg&g_urg&uylpuh&g_urz,66))

Call uysers()
e_mz=e_mz&icliq(iclls,uylpuq&g_urg&uylty&g_urg&lidms,uylpuh,e_gdj,uyfqx,"uy")
Call uysersql()

if uylty>0 then
if not ainull(uywhere) then uywhere=uywhere&" and "
uywhere=uywhere&"uy_ty="&uylty&""
end if
if uylps=0 then
if aibj(lidms,s_umlpy) then
uylps=i_nmhc
else
uylps=i_nmlb
end if
end if
'@@uy_id,1uy_sn,2uy_ty,3uy_yr,4uy_uh,5uy_tm,6uy_t1,7uy_j1,8uy_e1,9uy_s1,10uy_j2,11uy_e2,12uy_s2,13uy_j3,14uy_e3,15uy_s3,16uy_fk,17uy_ft,18uy_zt,19uy_pf
if gyslist(uybid,uylie(s_umlb),uybiao,uywhere,uyorder,uylpur,uylpg,uylps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if uyfqx=1 then lidti=lidti&"<b>操作</b>"
lidti=lidti&"<b>"&s_uduys&"状态</b>"
lidti=lidti&"<u>发起时间</u>"
lidti=lidti&"<u>卖家</u>"
lidti=lidti&"<u>买家</u>"
lidti=lidti&"<i>额度</i>"
lidti=lidti&"订单编码"
end if
'top------1
e_mz=e_mz&iclisttop(lidms,lidti)
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
lids1=""
lids2=""
lids3=""
lids4=""
gysay=split(gysax(gysi),g_gy)
lidbt=uylbt(1,gysay(1),aiint(gysay(2)),gysay(5),aiint(gysay(7)),gysay(8),aiint(gysay(16)),aiint(gysay(18)),aiint(gysay(19)))
lidtt="买家："&aiint(gysay(8))&vbNewLine
lidtt=lidtt&"卖家："&usren(gysay(11))&vbNewLine
lidtt=lidtt&"证方："&usren(gysay(14))&vbNewLine
lidtt=lidtt&s_uduys&"状态："&aisrd(aiint(gysay(18)),i_buyzt)&vbNewLine
lidtt=lidtt&"时间："&gysay(5)&"("&gysay(6)&")"
lidlj=eshref(s_uduy&g_urg&gysay(2)&g_urg&s_umxx&g_urg&gysay(1)&g_urz,66)
if uyfqx=1 then
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_uduy&g_urg&gysay(2)&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_uduy&g_urg&gysay(2)&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_uduys&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if
'list
if aibj(lidms,s_umlb) then
lids1=lids1&"<b"
if aiint(right(gysay(18),1))<5 then lids1=lids1&" class=""ftt"""
lids1=lids1&">"&aisrd(aiint(gysay(18)),i_buyzt)&"</b>"
lids1=lids1&"<u>"&aitmx(gysay(5),2)&"</u>"
lids1=lids1&"<u>"&usren(gysay(11))&"</u>"
lids1=lids1&"<u>"&usren(gysay(8))&"</u>"
lids1=lids1&"<i>"&aiint(gysay(7))&"</i>"
else
lidms=s_umlpc
'@@uy_id,1uy_sn,2uy_ty,3uy_yr,4uy_uh,5uy_tm,6uy_t1,7uy_j1,8uy_e1,9uy_s1,10uy_j2,11uy_e2,12uy_s2,13uy_j3,14uy_e3,15uy_s3,16uy_fk,17uy_ft,18uy_zt,19uy_pf
lids1=aisrd(aiint(gysay(18)),i_buyzt)
if not ainull(gysay(3)) then
if left(gysay(3),2)="@@" then
lids2="<div class=""pdto"">"&ddread(gysay(3),gysay(4))&"</div>"
else
lids2=gysay(3)
end if
end if
if not ainull(gysay(9))  then lids4=lids4&"买家留言：“"&aistr(gysay(9))&"”<br>"
if not ainull(gysay(12))  then lids4=lids4&"卖家留言：“"&aistr(gysay(12))&"”<br>"
if not ainull(gysay(15))  then lids4=lids4&"证方留言：“"&aistr(gysay(15))&"”<br>"
lids3="买家："&usren(gysay(8))&" 付出："&aiint(gysay(7))&" 卖家："&usren(gysay(11))&" 证方："&usren(gysay(14))&aitms(" 发起时间：",gysay(5),2)&aitms(" 更新时间：",gysay(6),2)
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if
e_mz=e_mz&iclih(gyspage,e_gdj,uyfqx,eshref(s_umgl&g_urg&s_uduy&g_urg&uylty&g_urg&s_umsc&"-x"&g_urz,77),"uy")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'del
'=uydel(uyfqx)
'-----------------------------------
Function uydel(uyfqx)
ew_bt=s_uduys&s_umscs&","&ew_bt:ew_zt=s_uduys&s_umscs&","&ew_zt:ew_nr=s_uduys&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_uduys&s_umscs&"</li>"
e_mt=esbts(s_udxuy,s_udluy,s_umscs&s_uduys,s_uduys&s_umlbs&g_gy&e_lj0)
if uyfqx=1 then
if e_uxy>2 then
if aiint(g_u4)>0 then
if gysdel(uybid,uybiao,"uy_id="&aiint(g_u4)) then
e_ma=e_ma&aitiao(s_uduys&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduys&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u3,s_umsc&"-x") then
'if gysdel(uybid,uybiao,0) then'清除所有
if gysdel(uybid,uybiao,"(uy_ft=11 or uy_ft=21 or uy_ft=31) and (uy_zt=16 or uy_zt=26 or uy_zt=36 or uy_zt=66 or uy_zt=96) and uy_xy<3") then
e_ma=e_ma&aitiao(s_uduys&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduys&s_umscs&s_ztsb,1)
end if
end if
end if
else
if aiint(g_u3)>0 then
if gysdel(uybid,uybiao,"uy_e1='"&e_uer&"' and uy_id="&aiint(g_u3)&" and (uy_ft=11 or uy_ft=21 or uy_ft=31) and (uy_zt=16 or uy_zt=26 or uy_zt=36 or uy_zt=66 or uy_zt=96) and uy_xy<3") then
e_ma=e_ma&aitiao(s_uduys&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduys&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(uybid,uybiao,"uy_e1='"&e_uer&"' and (uy_ft=11 or uy_ft=21 or uy_ft=31) and (uy_zt=16 or uy_zt=26 or uy_zt=36 or uy_zt=66 or uy_zt=96) and uy_xy<3") then
e_ma=e_ma&aitiao(s_uduys&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduys&s_umscs&s_ztsb,1)
end if
end if
end if
End Function

'-----------------------------------
'do ep/bb read
'=uykrd()
'-----------------------------------
Function uykrd(uyfty,uyfsn,uyfyr,uyfus,uyfjq)
uykrd=false
if not ainull(e_uer) then
dim uydxt
if uyfty=1 then
uydxt=espxx("操作：支付钱"&uyfjq&"元"&i_gg&e_uer)
else
uydxt=espxx("操作：支付金币"&uyfjq&"个"&i_gg&e_uer)
end if
if ainull(uyfus) then
uyfus=ew_kt
else
if uyfty=1 then
uydxt=uydxt&espxx("操作："&uyfus&"获得钱"&uyfjq&"元"&i_gg&e_uer)
else
uydxt=uydxt&espxx("操作："&uyfus&"获得金币"&uyfjq&"个"&i_gg&e_uer)
end if
end if
uyfjq=aiint(uyfjq)
if not ainull(uyfsn) and not ainull(uyfus) and uyfjq>0 then
uy_sn="PP"&aisn(1)&"_"&uyfsn
if uyfty=1 then'金钱订单
if e_ujq>uyfjq then
if gysin(w_dbqz&"uy","uy_sn,uy_ty,uy_uh,uy_yr,uy_tm,uy_t1,uy_j1,uy_e1,uy_j2,uy_e2,uy_xy,uy_fk,uy_ft,uy_zt,uy_xt","'"&uy_sn&"',47,'"&uyfsn&"','"&uyfyr&"','"&now()&"','"&now()&"',"&uyfjq&",'"&e_uer&"',"&uyfjq&",'"&uyfus&"',1,2,18,28,'"&uydxt&"'","uy_sn like '%_"&uyfsn&"%' and uy_fk=2 and uy_ft=18 and uy_e1='"&e_uer&"'") and uyxfk(1,2,uyfjq,e_uer,0) and uyxfk(2,2,uyfjq,uyfus,0) then uykrd=true
end if
else'金币订单
if e_ujb>uyfjq then
if gysin(w_dbqz&"uy","uy_sn,uy_ty,uy_uh,uy_yr,uy_tm,uy_t1,uy_j1,uy_e1,uy_j2,uy_e2,uy_xy,uy_fk,uy_ft,uy_zt,uy_xt","'"&uy_sn&"',46,'"&uyfsn&"','"&uyfyr&"','"&now()&"','"&now()&"',"&uyfjq&",'"&e_uer&"',"&uyfjq&",'"&uyfus&"',1,0,18,28,'"&uydxt&"'","uy_sn like '%_"&uyfsn&"%' and uy_fk=2 and uy_ft=18 and uy_e1='"&e_uer&"'") and uyxfk(1,0,uyfjq,e_uer,0) and uyxfk(2,0,uyfjq,uyfus,0) then uykrd=true
end if
end if
Call aisn(0)
end if
end if
End Function
'-----------------------------------
'do jingpai for 5
'=uykpp()
'-----------------------------------
Function uykpp(uyfty,uyfsn,uyfyr,uyfus,uyfjq)
uykpp=false
if not ainull(uyfsn) and not ainull(uyfus) and not ainull(uyfjq) then
if uyfty=0 then'启动竞拍
uy_sn="PP"&aisn(1)&"_"&uyfsn
if gysin(w_dbqz&"uy","uy_sn,uy_ty,uy_uh,uy_yr,uy_tm,uy_t1,uy_j1,uy_e1,uy_s1,uy_j2,uy_e2,uy_s2,uy_j3,uy_e3,uy_s3,uy_xy,uy_fk,uy_ft,uy_zt,uy_xt","'"&uy_sn&"',29,'"&uyfsn&"','"&uyfyr&"','"&now()&"','"&now()&"',"&uyfjq&",'','',"&uyfjq&",'"&uyfus&"','',0,'"&ew_kf&"','',1,2,2,32,'"&espxx("操作：扣除卖家竞拍保证金"&i_gg&uyfus)&"'","uy_sn like '%_"&uyfsn&"%' and uy_zt=32") then
uykpp=true
end if
Call aisn(0)
else'买家定金
if gysgx("ees_uy","uy_e1='"&uyfus&"',uy_j3="&uyfjq&",uy_t1='"&now()&"',uy_zt=38,uy_yr=uy_yr"&espdbi()&"'"&uyfyr&"',uy_xt=uy_xt"&espdbi()&"'"&espxx("操作：扣除买家竞拍定金"&i_gg&uyfus)&"'","uy_sn like '%_"&uyfsn&"%' and uy_zt=32") then
uykpp=true
end if
end if
end if
End Function
'-----------------------------------
'class
'=uyfl()
'-----------------------------------
Function uyfl(uyfty,uyfuq,uyfms,uyfva)
dim uyfldii,uyfldlz,uyfldlen
uyfl=""
uyfl=uyfl&"<a"
if ainull(g_u1) or (aibj(s_umgl,g_u0) and ainull(g_u2)) then uyfl=uyfl&" class=""l-va"""
uyfl=uyfl&" href="""&eshref(uyfuq&g_urz,1)&""">"&s_umqbs&s_uduys&"</a>"
for uyfldii=0 to ubound(d_uytyrr)
uyfldlz=d_uytyrr(uyfldii)
uyfldlen=len(uyfldlz)
if uyfty=3 then
uyfl=uyfl&"<a  class=""m-ma"" target="""&uyfva&""" href="""&eshref(uyfuq&g_urg&right(uyfldlz,2)&g_urg&uyfms&g_urz,66)&""">"&left(uyfldlz,uyfldlen-3)&"</a>"
uyfldii=uyfldii+1
uyfl=uyfl&"<A  class=""m-ma"" target="""&uyfva&""" href="""&eshref(uyfuq&g_urg&right(uyfldlz,2)&g_urg&uyfms&g_urz,66)&""">"&left(uyfldlz,uyfldlen-3)&"</A>"
else
uyfl=uyfl&"<a"
if uyfty=0 then uyfl=uyfl&"  class=""m-ma"" target="""&uyfva&""""
uyfl=uyfl&" href="""&eshref(uyfuq&g_urg&right(uyfldlz,2)&g_urg&uyfms&g_urz,66)&""">"
if aibj(right(uyfldlz,2),uyfva) then
uyfl=uyfl&"<span class=""ft"">["&left(uyfldlz,uyfldlen-3)&"]</span>"
if aiint(right(uyfldlz,1))<5 then e_wr=e_wr&"<a href="""&eshref(uyfuq&g_urg&right(uyfldlz,2)&g_urg&s_umtj&g_urz,66)&""">"&s_umtjs&"</a>"
else
uyfl=uyfl&""&left(uyfldlz,uyfldlen-3)&""
end if
uyfl=uyfl&"</a>"
if uyfty=0 then
uyfl=uyfl&" <A  class=""m-ma"" target="""&uyfva&""" href="""&eshref(uyfuq&g_urg&right(uyfldlz,2)&g_urg&s_umtj&g_urz,66)&""">"
uyfl=uyfl&s_umtjs
uyfl=uyfl&"</A>"
end if
end if
next
End Function
'-----------------------------------
'uylbt(1,gysay(1),aiint(gysay(2)),gysay(5),aiint(gysay(7)),gysay(8),aiint(gysay(16)),aiint(gysay(18)),aiint(gysay(19)))
'-----------------------------------
Function uylbt(uyfkg,uyfsn,uyfty,uyftm,uyfj1,uyfe1,uyffk,uyfxy,uyfpf)
uylbt=""
uylbt=uylbt&icqz(s_udluy,uyfkg,uyfxy,0)
uylbt=uylbt&"["&aisrd(uyfty,i_buyty)&"|"&aiarr(i_buyfk,"|",uyffk)&"]"
if uyfpf>0 then uylbt=uylbt&aiarr(i_buypf,"|",uyfpf)
uylbt=uylbt&" "&uyfsn&""
uylbt=uylbt&ichz(uyfkg,uyftm,0,"")
End Function
'-----------------------------------
'=uysers()
'Call uysers()
'-----------------------------------
Function uysers()
icdssp="排序|最新|时间|买耗|卖得|证获|付方|付态|状态|评分"
icdrrp=split("uy_id desc|uy_id desc|uy_tm desc|uy_j1 desc|uy_j2 desc|uy_j3 desc|uy_fk desc|uy_ft desc|uy_xy desc|uy_pf desc","|")
icdssf="范围|"&usren(ew_kt)&"|"&usren(ew_kg)&"|"&esqday(0)&"|买家|卖家|证方|用券|付款|已评"
icdrrf=split("|uy_us='"&ew_kt&"'|uy_u1='"&ew_kg&"'|"&esqday("uy_tm")&"|uy_e1='"&e_uer&"'|uy_e2='"&e_uer&"'|uy_e3='"&e_uer&"'|(uy_uh<>'' and uy_uh<>'0' and uy_uh<>'null')|uy_ft=2|uy_pf>0","|")
icdssx="项目|内容|编码|买家|卖家|证方|电话1|名称1|地区1|电话2|名称2|地区2|备注|其他|系统"
icdrrx=split("uy_yr|uy_yr|uy_sn|uy_e1|uy_e2|uy_e3|uy_h1|uy_m1|uy_c1|uy_h2|uy_m2|uy_c2|uy_us|uy_u1|uy_ty|uy_ot|uy_xt","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=uysersql()
'-----------------------------------
Function uysersql()
Call icserq()
uywhere=iclwhere
uyorder=iclorder
iclapp=1
'order
if ainull(uyorder) then uyorder=uyordermo
'admin
if not aibj(g_u0,s_umgl) then
if not ainull(uywhere) then uywhere=uywhere&" and "
uywhere=uywhere&"(uy_e1='"&e_uer&"' or uy_e2='"&e_uer&"' or uy_e3='"&e_uer&"')"
end if
End Function
'-----------------------------------
'PS:buy car
'=uycartj(uyfkg/i_xkadd,uyfstr,uyfel,uyfsn,uyfdj,uyfoz,uyfoy,uyfbt,uyfus)
'-----------------------------------
Function uycartj(uyfkg,uyfstr,uyfel,uyfsn,uyfdj,uyfoz,uyfoy,uyfbt,uyfus)
uycartj=""
if uyfkg>0 then
uyfoz=aiint(uyfoz)
uyfoy=aiint(uyfoy)
if uyfoz=0 and uyfoy=0 then uyfoz=99999
uycartj=uycartj&"<div class=""d-vf"">"
if uyfoz=0 then
uycartj=uycartj&uyfstr&"已售馨"
else
if aibj(e_uer,uyfus) then uycartj=uycartj&"*提示：这是您自己发布的产品。"
uycartj=uycartj&"<form action="""&eshref(s_druser&"y/?act",3)&""" method=""post"" target=""EESaidd"">"
uycartj=uycartj&uyfstr&"<div class=""crg""></div><div class=""d-vfsl""><span class=""d-vfis f-sc"" onClick=""if(parseInt(document.getElementById('sl').value)<2){document.getElementById('sl').value=1}else{document.getElementById('sl').value=parseInt(parseInt(document.getElementById('sl').value)-1)};"">-</span> <input type=""number"" name=""sl"" id=""sl"" class=""d-vfin"" min=""1"" value=""1"" onkeyup=""value=value.replace(/\D/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))""><input type=""hidden"" name=""cs"" id=""cs"" value="""&uyfsn&x_ddgb&uyfdj&x_ddgb&uyfbt&x_ddgb&uyfus&x_ddgb&uyfel&"""> <span class=""d-vfis f-sc"" onClick=""if(parseInt(document.getElementById('sl').value)>"&uyfoz-1&"){document.getElementById('sl').value="&uyfoz&"}else{document.getElementById('sl').value=parseInt(parseInt(document.getElementById('sl').value)+1)};"">+</span></div>"
uycartj=uycartj&"<div class=""crg""></div><button id=""buy"" name=""buy"" value=""2"" type=""submit"" class=""f-sb f-skxx""><span class=""glyphicon glyphicon-shopping-cart""></span> 立即下单</button><button id=""buy"" name=""buy"" value=""1"" type=""submit"" class=""f-sb f-skxx""><span class=""glyphicon glyphicon-star""></span> 加入购物车</button></form>"
end if
uycartj=uycartj&"</div>"
end if
End Function
'-----------------------------------
'PS:buy car
'=uycar(uyfkg/i_xkadd)
'-----------------------------------
Function uycar(uyfkg)
uycar=""
if uyfkg>0 then
Response.Cookies(x_ddck&"sk")=ew_sk&"|"&ep_sx
uycar=uycar&"<script type=""text/javascript"">var ddx="&uyfkg&";var ddm=""购物车"";var ddr="""&eshref(s_druser&"y/",3)&""";</script><script language=""JavaScript"" src="""&eshref(s_druser&"y/dd.js",3)&"""></script>"
end if
End Function
'-----------------------------------
'=uyxep(uyfty0jb1jq,uyfsn)
'-----------------------------------
Function uyxep(uyfty,uyfsn)
uyxep=false
if not ainull(uyfsn) and not ainull(e_uer) then
if uyfty=1 then
if gysro("uy_zt",uybiao,"uy_sn like '%_"&uyfsn&"%' and uy_e1='"&e_uer&"' and uy_fk=2","")="28" then uyxep=true
else
if gysro("uy_zt",uybiao,"uy_sn like '%_"&uyfsn&"%' and uy_e1='"&e_uer&"' and uy_fk=0","")="28" then uyxep=true
end if
end if
End Function
%>