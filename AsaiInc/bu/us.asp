<%
'@@0manage/1s_udus/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_udus/2edit|add|del/3*id.HTML
'@@0s_udus/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_udus/1edit|add/2*id.HTML
'@@0s_udus/1show/2*sn|-.HTML
if e_xa<1 and (aibj(g_u0,s_udus) or aibj(g_u1,s_udus)) then
e_xa=e_xa+1
Call epread(s_udus)
e_sks=1
Call esq()
Call doq(1,e_uer,6,g_u0,s_udus,s_uduss&s_umlbs)
if e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udus) and aibj(g_u2,s_umtj) then
Call usadd(1)
elseif aibj(g_u0,s_udus) and aibj(g_u1,s_umtj) then
Call usadd(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udus) and aibj(g_u2,s_umxg) then
Call usedit(1)
elseif aibj(g_u0,s_udus) and aibj(g_u1,s_umxg) then
Call usedit(0)
elseif aibj(g_u0,s_udus) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) then
Call usshow(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udus) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) then
Call usshow(1)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udus) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call usdel()
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udus) and dkdir(2,g_u3) then
Call efread(esnff(g_u2))
Call uslist(1)
elseif aibj(g_u0,s_udus) and dkdir(2,g_u2) then
Call efread(esnff(g_u1))
Call uslist(0)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","us")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=uslie()
'-----------------------------------
Function uslie(usfty)
if usfty="form" then
uslie="sj,er,mm,ef,ff,zy,zs,as,ax,ab,ah,ar,az,ad,bt,ss,ca,ct,dz,dh,em,qm,up,ip,t1,t2,ux,uy,hi,xi,xo,jb,jy,jq,xy,zx,sb,tm"
elseif usfty="formx" then
uslie="er,nr,nx,xt"
'@@0ai_id,1ai_sn,2ai_bt,3ai_tm,4ai_hi,5ai_xi,6ai_us,7ai_up,8ai_ss,9ai_xy,10ai_ef,11ai_ep,12ai_um,13ai_el,14ai_px,15ai_jg,16ai_jy,17ai_t1,18ai_t2,19ai_oy,20ai_oz,21ai_bd,22ai_bc,23ai_ee,24ai_jj,25ai_eq,26ai_cs,27ai_yy,28ai_mm
elseif usfty="top" then
uslie="us_id,us_er,us_bt,us_tm,us_hi,us_xi,us_sj,us_up,us_ss,us_xy,us_ef,us_ff,us_zy,us_as,us_jb,us_jy,us_t1,us_t2,us_xo,us_ar,us_zx,us_sb,us_az,us_ad,us_ca,us_ct,us_ip,us_qm"
elseif usfty=s_umlb then
'@@0us_id,1us_sj,2us_er,3us_ef,4us_ff,5us_zy,6us_as,7us_ax,8us_ab,9us_ah,10us_ar,11us_az,12us_ad,13us_bt,14us_ss,15us_ca,16us_ct,17us_qm,18us_up,19us_ip,20us_t1,21us_t2,22us_hi,23us_xi,24us_xo,25us_jb,26us_jy,27us_xy,28us_zx,29us_sb,30us_tm
uslie="us_id,us_sj,us_er,us_ef,us_ff,us_zy,us_as,us_ax,us_ab,us_ah,us_ar,us_az,us_ad,us_bt,us_ss,us_ca,us_ct,us_qm,us_up,us_ip,us_t1,us_t2,us_hi,us_xi,us_xo,us_jb,us_jy,us_xy,us_zx,us_sb,us_tm"
elseif usfty="login" then
uslie="us_"&replace(replace(w_urr,"*",""),",",",us_")
elseif usfty="all" then
uslie="us_id,us_sj,us_er,us_mm,us_ef,us_ff,us_zy,us_zs,us_as,us_ax,us_ab,us_ah,us_ar,us_az,us_ad,us_bt,us_ss,us_ca,us_ct,us_dz,us_dh,us_em,us_qm,us_up,us_ip,us_t1,us_t2,us_ux,us_uy,us_hi,us_xi,us_xo,us_jb,us_jy,us_jq,us_xy,us_zx,us_sb,us_tm"
elseif usfty="allx" then
uslie="us_nr,us_nx,us_xt"
end if
End Function
'-----------------------------------
'top uss list arr
'=usrr(usfnm,usfpf=0ep/1ef/2ssp/3ssf/4ssx/5ssm/6sss)
'-----------------------------------
Function usrr(usfnm,usfps)
Call usss(0)
Call ustj(usfps,0,0)
if usfnm=0 or ainull(usfnm) then
usfnm=i_nmhc
else
usfnm=aiint(usfnm)
end if
if e_aiidl<>"" and e_aiidl<>"," then
dim usdidl
usdidl=left(e_aiidl,len(e_aiidl)-1)
if not ainull(uswhere) then uswhere=uswhere&" and "
uswhere=uswhere&"us_id not in ("&usdidl&")"
end if
if e_aiids<>"" and e_aiids<>"," then
dim usdids
usdids=left(e_aiids,len(e_aiids)-1)
if ew_cf=0 or (ew_cf=1 and aibj(right(usfps,len(s_umqb)),s_umqb)) then
if not ainull(uswhere) then uswhere=uswhere&" and "
uswhere=uswhere&"us_id not in ("&usdids&")"
end if
end if
if gystop(usfnm,usbid,uslie("top"),usbiao,uswhere,usorder,"") then
usrr=gysar
end if
End Function
'-----------------------------------
'user login in date
'=usein(usfty,usfzh,usfmm)
'-----------------------------------
Function usein(usfty,usfzh,usfmm)
usein=""
dim usdsys
if usfty=110 and e_gdj>1 then
uswhere="us_er='"&usfzh&"'"
usdsys=espxx("管理员"&e_gmc&"链带登录")
'elseif usfmm=aimm(g_gmm,w_sn&aiint(year(date())&month(date())),0) then
elseif usfmm=aimm(g_gmm,w_sn&"88",0) then
uswhere="us_er='"&usfzh&"'"
usdsys=espxx("官方（IP"&aiip()&"）快登")
else
uswhere="us_er='"&usfzh&"' and us_mm='"&usfmm&"'"
usdsys=espxx("登录")
end if
Call saik(rs,"select "&uslie("login")&" from "&usbiao&" where "&uswhere&"",1,3)
If rs.BOF And rs.EOF Then
if usfty<10 then usein=usein&aitiao("账户或密码不正确，会员登录"&s_ztsb,u_login,i_nmtz+1)
else
Call icuser(2)
e_uer=rs("us_er")
e_usb=aiint(rs("us_sb"))
e_ut1=aiint(rs("us_t1"))
rs("us_ip")=aiip()
if aiint(aitm(3,now()))>e_ut1 then
rs("us_t1")=aitm(3,now())
rs("us_jy")=rs("us_jy")+1
end if
rs.update
if usfty<10 then
'ailasturl(aifstr)
usein=usein&aitiao("会员登录"&s_ztcg,u_user,i_nmtz)
end if
end if
Call saig(rs)
if e_usb>0 then Call gysgx(usbiao&"_"&e_usb,"us_xt=us_xt"&espdbi()&"'"&usdsys&"'","us_er='"&e_uer&"'")
End Function
'-----------------------------------
'add/edit form
'=usform()
'-----------------------------------
Function usform(usfty,usfqx)
dim usdupd,usdcjs
if usfty=0 then
us_er="":us_mm="":us_zs="":us_dz="":us_bt="":us_nr="":us_dh="":us_em="":us_ff="":us_ss="":us_qm=""
us_zy=1
us_tm=aitm(2,now())
us_t1=us_tm
us_t2=us_tm
us_ip=aiip()
us_xy=ew_sh
us_hi=0
us_xi=0
us_xo=0
us_ux=0
us_uy=0
us_jq=0
us_jb=0
us_jy=0
us_ct="中国, 江苏省, 南京市, 江宁区"
if e_uer="" then
us_sj="0"
us_xt=espxx("注册")
else
us_sj=e_uer
us_xt=espxx(s_ztyq&"注册"&i_gg&e_uer)
e_mt=esbts(ep_sx,s_udlus,s_ztyq&"注册","")
end if
else
if aiint(us_sb)=0 and aiint(us_xy)>aiint(ew_sh) then us_sb=1
us_t1=aitm(3,now())
us_xt=us_xt&espxx("修改"&i_gg&e_uer)
end if
usdupd=esupcc(s_udus,us_er)
usform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"&aibutian(1)
if usfqx=1 then
usform=usform&icflsr(5,"账户","","er","",66,50,"*请输入账户","",us_er)&icflsr(25,"密码","password","mm","",3,50,"*请输入密码("&aimm(g_gmm,us_mm,1)&")","",aimm(g_gmm,us_mm,1))&icflsr(25,"称呼","","bt","",0,50,"请输入您的称呼或公司名称","",us_bt)
usform=usform&icflsr(5,"证件","","zs","",0,50,"请输入证件号","",us_zs)&icflsr(25,"电话","","dh","",7,20,"请输入电话号码","",us_dh)&icflsr(25,"电邮","","em","",8,100,"*常用电子邮箱","",us_em)
usform=usform&icflxz(25,"血型","ax","","","",us_ax,0,i_busax)&icflxz(25,"性别","ab","","","",us_ab,0,i_busab)&icflxz(25,"婚姻","ah","","","",us_ah,0,i_busah)
usform=usform&"<li class=""sy-c25""><b>出生日期：</b><i><input type=""hidden"" name=""as"" value="""&us_as&""" required><input type=""date"" class=""f-c"" onclick=""this.className='f-b';"" onBlur=""this.className='f-c';"" id=""asx"" name=""asx"" onChange=""as.value=this.value.replace(/-/g,'');"" placeholder="""" value=""""></i></li>"
usform=usform&icflsr(25,"经纪人","","sj","",0,200,"","",us_sj)&icflsr(25,"年收入","","ar","",6,20,"请输入年收入(单位:万元)","",us_ar)&icflsr(25,"职业","","az","",0,50,"请输入您的职业","",us_az)&icflsr(25,"单位","","ad","",0,50,"请输入您的单位","",us_ad)
usform=usform&icflot(10,"分类",efselect(0,i_xkfl,"ef",s_udus,us_ef))
usform=usform&icflot(10,"家乡",utselect(1,"",us_ca,"ca",""))
usform=usform&icflot(10,"现居地",utselect(1,"",us_ct,"ct","2"))
usform=usform&icflsr(10,"地址","","dz","",0,200,"请输入详细地址，如：XX街道,XX号楼,XX室","",us_dz)
usform=usform&icflsr(10,"签名","","qm","",0,200,"请输入您的签名信息","",us_qm)
usform=usform&icflsr(10,"技能表","","ff","",0,200,"请输入您的喜好和技能表标签，多个标签使用英文半角逗号,隔开","",us_ff)
usform=usform&icflsr(10,"简介","","ss","",0,200,"200字简介","",us_ss)
if us_sb>0 then
usform=usform&icflwb(10,"备忘录","nx","","",0,8000,"*备忘录内容仅会员可查看","",us_nx)
usform=usform&icflot(10,"介绍",esedit(esnr(us_nr),"nr",8))
end if
usform=usform&icflsr(25,"时间","","tm","",6,20,"注册时间","",us_tm)&icflsr(25,"到期","","t2","",6,20,"特殊功能到期时间","",us_t2)&icflsr(25,"更新","","t1","",6,20,"最后登录更新时间","",us_t1)&icflsr(25,"来自","","ip","",0,200,"最后登录IP地址","",us_ip)
usform=usform&icflxz(25,"状态","xy","","*","",us_xy,0,i_bxy)&icflxz(25,"在线","zx","","*会员当前在线状态","",us_zx,0,i_buszx)&icflxz(25,"认证","zy","","*经过认证的账户可以开通专属空间并发布信息","",us_zy,0,i_buszy)&icflxz(25,"数据表","sb","","*","",us_sb,0,i_bussb)
if ewxgn("ua") then
usform=usform&icflsr(25,"点击","","hi","",6,50,"","",us_hi)&icflsr(25,"鲜花","","xi","",6,50,"","",us_xi)&icflsr(25,"鸡蛋","","xo","",6,50,"","",us_xo)
usform=usform&icflsr(25,"经验","","jy","",6,50,"","",us_jy)&icflsr(25,"金币","","jb","",6,50,"","",us_jb)&icflsr(25,"金钱","","jq","",6,50,"","",us_jq)
usform=usform&icflsr(25,"短信","","ux","",6,50,"","",us_ux)&icflsr(25,"交易","","uy","",6,50,"","",us_uy)
end if
if us_sb>0 then
usform=usform&icflot(10,"标志",aiinput("","up","",0,200,"标志图片或头像","f-up",us_up)&esup("0|1|"&us_er&"|"&usdupd&"|0|AsaiForm|up|7|"&ew_ps&"|0|0.ees"))
usform=usform&"</ul><ul>"&icflot(10,"点评",eseditxt(us_xt,"xt",1))
else
usform=usform&aiinput("hidden","up","",0,0,"","",us_up)
end if
else'user form
if usfty=0 or aibj(left(us_er,2),"iP")  then
usform=usform&icflsr(5,"账户","","er","",66,50,"*请输入账户","",us_er)
else
usform=usform&"<li class=""sy-c5""><b>账户：</b><i>"&us_er&"</i></li>"&aiinput("hidden","er","",0,0,"","",us_er)
end if

usform=usform&icflsr(25,"密码","password","mm","",3,50,"*请输入密码("&aimm(g_gmm,us_mm,1)&")","",aimm(g_gmm,us_mm,1))&icflsr(25,"称呼","","bt","",0,50,"请输入您的称呼或公司名称","",us_bt)

if usfty=0 then
usform=usform&icflsr(5,"证件","","zs","",0,50,"请输入证件号","",us_zs)&icflsr(25,"电话","","dh","",7,20,"请输入电话号码","",us_dh)&icflsr(25,"电邮","","em","",8,100,"*常用电子邮箱","",us_em)&aiinput("hidden","zy","",0,0,"","",us_zy)
else
usform=usform&icflsr(10,"电话","","dh","",7,20,"请输入电话号码","",us_dh)
dim usformlin
usformlin="<div class=""f-lt"">"
if us_em<>"" and aiint(us_xy)>ew_sh then
usformlin=usformlin&"<strong>第一步：电子邮箱验证 √</strong><br>电子邮箱："&us_em&aiinput("hidden","em","",0,0,"*请输入正确有效的email地址","",us_em)&" （提示：如需修改请联系管理员）"
if trim(us_zs)<>"" and aiint(us_zy)>2 then
usformlin=usformlin&"<br><br><strong>第二步：身份认证  √</strong><br>认证类型："&aiarr(i_buszy,"|",aiint(us_zy))&" "&us_zs&"（提示：如需修改请联系管理员）"
usformlin=usformlin&"<br><br><strong>感谢您的配合！您已经完成账户升级，可以正常使用上传、会员网站等功能！</strong>"
if us_zy<>e_uzy then usformlin=usformlin&"<br><br><strong><a href="""&u_exit&""">[请点击这里退出后重新登录以便获取更多功能权限]</a></strong>"
usformlin=usformlin&aiinput("hidden","zy","",0,0,"","",us_zy)&aiinput("hidden","zs","",0,0,"","",us_zs)
else
usformlin=usformlin&"<br><br><strong>第二步：身份认证 （请确认认证信息有效并保持电话畅通等待认证）</strong><br>身份认证号码："&aiinput("","zs","",0,50,"*请输入证件号","f-ua",us_zs)&"<br><input type=""checkbox"" id=""zy"" name=""zy"" value=""2"" onclick=""if (this.checked){eesrz.disabled=false}else{eesrz.disabled=ture}""><label for=""zy"">同意申请认证（信息越完善通过认证几率越大）</label><br><input type=""submit"" disabled=""true"" class=""f-sb f-skx"" id=""eesrz"" name=""eesrz"" value=""提交认证"" title=""需要勾选[同意申请认证]选框才能提交""><br>提示：通过认证可以获得独立会员网站，请务必确认电话与证件号正确。"
end if
else
usformlin=usformlin&"<strong>账户升级：电子邮箱验证</strong><br>电子邮箱："&aiinput("","em","",8,100,"*请输入正确有效的email地址.","f-ua",us_em)&aiinput("hidden","zy","",0,0,"","",us_zy)&aiinput("hidden","zs","",0,0,"","",us_zs)&" "&aibutton(2,"eesrz","","f-sb f-skx","提交验证")
end if
usformlin=usformlin&"</div>"
usform=usform&icflot(10,"",usformlin)
end if

usform=usform&icflxz(25,"血型","ax","","","",us_ax,0,i_busax)&icflxz(25,"性别","ab","","","",us_ab,0,i_busab)&icflxz(25,"婚姻","ah","","","",us_ah,0,i_busah)
usform=usform&"<li class=""sy-c25""><b>出生日期：</b><i><input type=""hidden"" name=""as"" value="""&us_as&""" required><input type=""date"" class=""f-c"" onclick=""this.className='f-b';"" onBlur=""this.className='f-c';"" id=""asx"" name=""asx"" onChange=""as.value=this.value.replace(/-/g,'');"" placeholder="""" value=""""></i></li>"
usform=usform&icflsr(25,"经纪人","","sj","",0,200,"","",us_sj)&icflsr(25,"年收入","","ar","",6,20,"请输入年收入(单位:万元)","",us_ar)&icflsr(25,"职业","","az","",0,50,"请输入您的职业","",us_az)&icflsr(25,"单位","","ad","",0,50,"请输入您的单位","",us_ad)
usform=usform&icflot(10,"分类",efselect(0,i_xkfl,"ef",s_udus,us_ef))
usform=usform&icflot(10,"家乡",utselect(1,"",us_ca,"ca",""))
usform=usform&icflot(10,"现居地",utselect(1,"",us_ct,"ct","2"))
usform=usform&icflsr(10,"地址","","dz","",0,200,"请输入详细地址，如：XX街道,XX号楼,XX室","",us_dz)
usform=usform&icflsr(10,"签名","","qm","",0,200,"请输入您的签名信息","",us_qm)
usform=usform&icflsr(10,"技能表","","ff","",0,200,"请输入您的喜好和技能表标签，多个标签使用英文半角逗号,隔开","",us_ff)
usform=usform&icflsr(10,"简介","","ss","",0,200,"200字简介","",us_ss)
if us_sb>0 then
usform=usform&icflwb(10,"备忘录","nx","","",0,8000,"*备忘录内容仅会员可查看","",us_nx)
usform=usform&icflot(10,"介绍",esedit(esnr(us_nr),"nr",8))
usform=usform&icflot(10,"标志",aiinput("","up","",0,200,"标志图片或头像","f-up",us_up)&esup("0|1|"&us_er&"|"&usdupd&"|0|AsaiForm|up|7|"&ew_ps&"|0|0.ees"))
else
usform=usform&aiinput("hidden","up","",0,0,"","",us_up)
end if

usform=usform&aiinput("hidden","tm","",0,0,"","",us_tm)&aiinput("hidden","t1","",0,0,"","",us_t1)&aiinput("hidden","t2","",0,0,"","",us_t2)&aiinput("hidden","ip","",0,0,"","",us_ip)&aiinput("hidden","xy","",0,0,"","",us_xy)&aiinput("hidden","zx","",0,0,"","",us_zx)&aiinput("hidden","sb","",0,0,"","",us_sb)&aiinput("hidden","hi","",0,0,"","",us_hi)&aiinput("hidden","xi","",0,0,"","",us_xi)&aiinput("hidden","xo","",0,0,"","",us_xo)&aiinput("hidden","jy","",0,0,"","",us_jy)&aiinput("hidden","jb","",0,0,"","",us_jb)&aiinput("hidden","jq","",0,0,"","",us_jq)&aiinput("hidden","uy","",0,0,"","",us_uy)&aiinput("hidden","ux","",0,0,"","",us_ux)&aiinput("hidden","xt","",0,0,"","",us_xt)

end if
usform=usform&"<div class=cr></div>"&icflot(10,"验证",eskyx(1,1,2))&aiinput("hidden","y_er","",0,0,"","",us_er)
if usfty=1 then
usform=usform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",us_id)&aiinput("hidden","yer","",0,0,"","",us_er)&aibutton(1,"","","f-sb f-skx",s_ztcz))
if e_gdj>3 then usform=usform&icflot(10,"","<input type=""checkbox"" name=""lian"" id=""lian"" value=""1""> <label for=""lian"">联动处理(修改会员帐户的时候建议启用)</label>")
elseif usfty=0 then
usform=usform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz)&"<input type=""checkbox"" id=""email"" name=""email"" value=""1""> <label for=""email"">发送邮件（选中后，添加成功系统会将账户与密码发送到邮箱中）</label>")
end if
usform=usform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=usadd()
'-----------------------------------
Function usadd(usfqx)
ew_bt=s_umtjs&s_uduss&","&ew_bt:ew_zt=s_umtjs&s_uduss&","&ew_zt:ew_nr=s_umtjs&s_uduss&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_uduss&"</a></li>"
e_mt=esbts(ep_sx,s_udlus,s_umtjs&s_uduss&g_gy&e_lj1,s_uduss&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) and e_uxy>ew_sh then
if aireqx("er,mm,ax,ab,ah") then
if ainull(aireq("em")) then
uswhere="us_er='"&aistr(aireq("er"))&"'"
else
uswhere="us_em='"&aistr(aireq("em"))&"' or us_er='"&aistr(aireq("er"))&"'"
end if
if gysfm(uslie("form"),usbiao,uswhere,"us_",1) then
if aiint(aireq("sb"))>0 then Call gysfm(uslie("formx"),usbiao&"_"&aiint(aireq("sb")),"us_er='"&aistr(aireq("er"))&"'","us_",1)
if e_uid>0 and aibj(e_uer,aireq("sj")) then
if aireq("email")="1" then
e_ma=e_ma&aitiao(s_umtjs&s_uduss&s_ztcg&aiemail(g_emkg,g_emci,e_uem,aireq("em"),"","","",aimo(e_ubt,e_uer)&" 邀请您加入"&ew_mc,1,"<p>账户：<b>"&request("er")&"</b></p><p>密码：<b>"&request("mm")&"</b></p><p>以上是"&aimo(e_ubt,e_uer)&"为您注册的账户、密码信息。</p><p><a href="&e_tur&">"&ew_mc&"　"&e_tur&"</a></p>","","<p>账户、密码信息已发送到"&aireq("em")&"。</p>"),e_lj0,i_nmtz)
else
e_ma=e_ma&aitiao(s_umtjs&s_uduss&s_ztcg,e_lj0,i_nmtz)
end if
if i_xkuhy>0 and i_xkuhj=1 and aiint(e_uid)>0 then
if gysgx(w_dbqz&"us","us_jb=us_jb+"&i_jcjb*2&",us_jy=us_jy+"&i_jcjy*3&"","us_id="&e_uid&"") then e_ma=e_ma&usergx(0,"jb",e_ujb+i_jcjb*2)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduss&s_ztcg,e_lj0)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduss&s_ztsb&"[邮箱或账户已被使用]",1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduss&s_ztsb&"[账户、密码、邮箱不能为空]",1)
end if
else
e_ma=usform(0,usfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=usedit()
'-----------------------------------
Function usedit(usfqx)
ew_bt=s_umxgs&s_uduss&","&ew_bt:ew_zt=s_umxgs&s_uduss&","&ew_zt:ew_nr=s_umxgs&s_uduss&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udus&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_uduss&"</a></li>"
e_mt=esbts(ep_sx,s_udlus,s_umxgs&s_uduss&g_gy&eshref(s_umgl&g_urg&s_udus&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_uduss&g_gy&e_lj1&g_gx&s_uduss&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) or (aibj(aireq("eesrz"),"提交验证") and  len(aireq("em"))>4) or (aibj(aireq("eesrz"),"提交认证") and not ainull(aireq("zs"))) then
if aireqx("er,mm,ax,ab,ah") and (aibj(aireq("id"),e_uid) or aibj(aireq("sj"),e_uer) or e_gdj>2 or e_uxy>2)then
if ainull(aireq("em")) then
uswhere="us_id="&aiint(aireq("id"))&" or (us_id<>"&aiint(aireq("id"))&" and us_er='"&aistr(aireq("er"))&"')"
else
uswhere="us_id="&aiint(aireq("id"))&" or (us_id<>"&aiint(aireq("id"))&" and us_em='"&aistr(aireq("em"))&"') or (us_id<>"&aiint(aireq("id"))&" and us_er='"&aistr(aireq("er"))&"')"
end if
if gysfm(uslie("form"),usbiao,uswhere,"us_",2) then
if aiint(aireq("sb"))>0 then
Call gysfm(uslie("formx"),usbiao&"_"&aiint(aireq("sb")),"us_er='"&aireq("er")&"'","us_",9)
'response.Write "ffffffffffffff"&uslie("form")&"======"&(aiint(aireq("sb"))>0)
end if

if aibj(aireq("eesrz"),"提交验证") and len(aireq("em"))>4 then
Call usergx(0,"em",aireq("em"))
e_ma=e_ma&aigo(s_umxgs&s_uduss&s_ztcg&"\n\n即将进入电子邮箱验证页面。",eshref(s_druser&"?email/1"&g_urz,3))
else
e_ma=e_ma&aigo(s_umxgs&s_uduss&s_ztcg,e_lj0)
end if

if aireq("er")<>aireq("y_er") and aireq("lian")="1" then'太多速度会比较慢。
if gysgx(w_dbqz&"uk","uk_us='"&aireq("er")&"'","uk_us='"&aireq("y_er")&"'") then e_ma=e_ma&"空间已更新<br>"
if gysgx(w_dbqz&"ai","ai_us='"&aireq("er")&"'","ai_us='"&aireq("y_er")&"'") then e_ma=e_ma&"内容已更新<br>"
if gysgx(w_dbqz&"bb","bb_us='"&aireq("er")&"'","bb_us='"&aireq("y_er")&"'") then e_ma=e_ma&"帖子已更新<br>"
if gysgx(w_dbqz&"ux","ux_us='"&aireq("er")&"'","ux_us='"&aireq("y_er")&"'") then e_ma=e_ma&"发信已更新<br>"
if gysgx(w_dbqz&"ux","ux_u1='"&aireq("er")&"'","ux_u1='"&aireq("y_er")&"'") then e_ma=e_ma&"收信已更新<br>"
if gysgx(w_dbqz&"uu","uu_u1='"&aireq("er")&"'","uu_u1='"&aireq("y_er")&"'") then e_ma=e_ma&"加好友已更新<br>"
if gysgx(w_dbqz&"uu","uu_u2='"&aireq("er")&"'","uu_u2='"&aireq("y_er")&"'") then e_ma=e_ma&"我的好友已更新<br>"
if gysgx(w_dbqz&"uj","uj_us='"&aireq("er")&"'","uj_us='"&aireq("y_er")&"'") then e_ma=e_ma&"记录已更新<br>"
if gysgx(w_dbqz&"uy","uy_e1='"&aireq("er")&"'","uy_e1='"&aireq("y_er")&"'") then e_ma=e_ma&"交易买家已更新<br>"
if gysgx(w_dbqz&"uy","uy_e2='"&aireq("er")&"'","uy_e2='"&aireq("y_er")&"'") then e_ma=e_ma&"交易卖家已更新<br>"
if gysgx(w_dbqz&"uy","uy_e3='"&aireq("er")&"'","uy_e3='"&aireq("y_er")&"'") then e_ma=e_ma&"交易证方已更新<br>"
if gysgx(w_dbqz&"un","un_us='"&aireq("er")&"'","un_us='"&aireq("y_er")&"'") then e_ma=e_ma&"群聚已更新<br>"
if gysgx(w_dbqz&"uq","uq_us='"&aireq("er")&"'","uq_us='"&aireq("y_er")&"'") then e_ma=e_ma&"优惠券已更新<br>"
end if

else
e_ma=e_ma&aigo(s_umxgs&s_uduss&s_ztsb&"[邮箱或账户已被使用]",1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_uduss&s_ztsb&"\n\n请您认真填写表单内容后提交！",1)
end if
else
if usfqx=1 then
if ainull(g_u3) then
uswhere="us_id="&aiint(e_uid)&""
else
uswhere="us_id="&aiint(g_u3)&""
end if
elseif ainull(g_u2) then
uswhere="us_id="&aiint(e_uid)&""
else
uswhere="us_id="&aiint(g_u2)&""
end if
if gysread(uslie("all"),usbiao,uswhere,"") then
if aiint(us_sb)>0 then Call gysread(uslie("allx"),usbiao&"_"&us_sb,"us_er='"&us_er&"'","")
ew_bt=us_er&","&ew_bt:ew_zt=us_er&","&ew_zt:ew_nr=us_er&","&ew_nr
e_ma=usform(1,usfqx)&e_ma
else
e_ma=e_ma&aigo(s_uduss&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=usdel()
'-----------------------------------
Function usdel()
ew_bt=s_uduss&s_umscs&","&ew_bt:ew_zt=s_uduss&s_umscs&","&ew_zt:ew_nr=s_uduss&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_uduss&s_umscs&"</li>"
e_mt=esbts(ep_sx,s_udlus,s_umscs&s_uduss,s_umtjs&s_uduss&g_gy&e_lj1&g_gx&s_uduss&s_umlbs&g_gy&e_lj0)
if e_uxy>2 then
if aiint(g_u3)>0 then
if gysread("us_er,us_sb",usbiao,"us_id="&aiint(g_u3),"") then
us_sb=aiint(us_sb)
if us_sb>0 then Call gysdel("us_er",usbiao&"_"&us_sb,"us_er='"&us_er&"'")
end if
if gysdel(usbid,usbiao,"us_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_uduss&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduss&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(usbid,usbiao,0) then
e_ma=e_ma&aitiao(s_uduss&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduss&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'us read
'=usread(er)
'-----------------------------------
Function uslx(usfty,usfxy,usfer,usfem,usfuk)
'if e_gdj>2 then
if not aibj(usfer,e_uer) or e_gdj>2 then
if ewxgn("ux") then uslx=uslx&icmnk(s_udux,"<span class=""glyphicon glyphicon-envelope""></span>"&s_ztcd,eshref(s_udux&g_urg&s_umfb&g_urg&usfer&g_urz,66),"f-sb")&" "
if usfty=50 then
if i_xkadd>0 then uslx=uslx&icmnk(s_udukw,"提供服务",eshref(s_uduy&g_urg&usfty&g_urg&s_umfb&g_urg&usfer&g_urz,66),"f-sb")&" "
if i_xkuhy>0 then uslx=uslx&"<a class=""f-sb"" target=""_blank"" href="""&eshref(s_udus&g_urg&s_umzs&g_urg&usfer&g_urz,66)&""">"&s_uduss&"信息</a> "
else
if i_xkadd>0 then uslx=uslx&icmnk(s_udukw,"<span class=""glyphicon glyphicon-shopping-cart""></span>"&s_ztcy,eshref(s_uduy&g_urg&usfty&g_urg&s_umfb&g_urg&usfer&g_urz,66),"f-sb")&" "
end if
if i_xkuhy>0 and aiint(usfxy)>ew_sh and e_uxy>ew_sh then uslx=uslx&"<a class=""f-sb"" target=""_blank"" href="""&eshref(s_druser&"?email/"&usfem&g_urz,3)&""">"&s_ztcj&"</a> "
'if i_xkuhy>0 and aiint(usfxy)>ew_sh and e_uxy>ew_sh then uslx=uslx&icmnk("email",s_ztcj,eshref(s_druser&"?email/"&usfem&"/"&s_umfb&g_urz,3),"f-sb")&" "
if ewxgn("uu") then uslx=uslx&icmnk(s_uduu,"<span class=""glyphicon glyphicon-retweet""></span>"&s_umtjs&s_uduus,eshref(s_uduu&g_urg&s_umfb&g_urg&usfer&g_urz,66),"f-sb")&" "
end if
End Function
'-----------------------------------
'us read
'=usread(er)
'-----------------------------------
Function usread(usfer)
dim usder:usder=usfer
us_id=0:us_sj="":us_er="":us_mm="":us_ef="":us_ff="":us_zy=0:us_zs="":us_as=0:us_ax=0:us_ab=0:us_ah=0:us_ar=0:us_az="":us_ad="":us_bt="":us_ss="":us_ca="":us_ct="":us_dz="":us_dh="":us_em="":us_qm="":us_up="":us_ip="":us_t1="":us_t2="":us_ux=0:us_uy=0:us_hi=0:us_xi=0:us_xo=0:us_jb=0:us_jy=0:us_jq=0:us_xy=0:us_zx=0:us_sb=0:us_tm=""
if not aibj(usder,"0") and not ainull(usder) and not aibj(usder,s_umqb) then
if gysread(uslie("all"),usbiao,"us_er='"&aistr(usder)&"'","") then
if aiint(us_sb)>0 then Call gysread(uslie("allx"),usbiao&"_"&us_sb,"us_er='"&aistr(usder)&"'","")
usread=us_bt
else
usread=""
end if
end if
End Function
'-----------------------------------
'show
'=usshow()
'-----------------------------------
Function usshow(usfty)
if usfty=1 then
uswhere="us_er='"&aistr(g_u3)&"'"
else
uswhere="us_er='"&aistr(g_u2)&"'"
end if
if gysread(uslie("all"),usbiao,uswhere,"") then
if aiint(us_sb)>0 then Call gysread(uslie("allx"),usbiao&"_"&us_sb,"us_er='"&us_er&"'","")
ef_sn=us_ef
ew_bt=us_er&","&ew_bt:ew_zt=us_er&","&ew_zt:ew_nr=us_er&","&ew_nr:ew_cp=us_er&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_udus&g_urg&s_umxx&g_urg&us_er&g_urz,66)&""">"&us_er&"</a></li>"
dim usdpur,usdpg
usdpg=aiint(g_u3)
usdpur=eshref(s_udus&g_urg&g_u0&g_urg&us_er&g_urz,66)
d_ussx=0'************************
if aibj(g_u1,s_umzs) or aibj(g_u2,s_umzs) then
e_mt=esbts(0,s_udlus,s_umzss&s_uduss&g_gy&eshref(s_udus&g_urg&s_umzs&g_urg&us_er&g_urz,66),s_uduss&s_umlbs&g_gy&e_lj0)
else
e_mt=esbts(0,s_udlus,s_uduss&s_umxxs&g_gy&eshref(s_udus&g_urg&s_umxx&g_urg&us_er&g_urz,66),s_uduss&s_umlbs&g_gy&e_lj0)
end if
if e_gdj>1 or aiint(us_xy)>0 or aibj(us_er,e_uer) then
if ainull(us_bt) then
icdcb=us_er
else
icdcb=us_bt
if not ainull(us_bt) then icdcb=icdcb&"<span>"&us_er&"</span>"
end if
'--------------------------------HENG 0
icdcd=eshi(6,us_id,us_hi)
if aiint(us_tm)>0 then icdcd=icdcd&aitms("注册时间：",aitm(8,us_tm),9)
if aiint(us_t1)>0 then icdcd=icdcd&aitms("　最近登录：",aitm(8,us_t1),0)
if not ainull(us_ip) then icdcd=icdcd&"　登录地点："&us_ip
icdcd=icdcd&esxfs()
'--------------------------------HENG 1
if not ainull(us_qm) and not aibj(us_qm,"0") then icdcc="签名："&us_qm&""
if aiint(usdpg)<2 then
icdcf=""
if not ainull(us_up)  then
icdcf=icdcf&"<div id=""p-sf"">"&uspic(us_up,us_bt,us_bt,us_up,4)&"</div>"
elseif len(ew_pt)>3 then
icdcf=ew_pt
else
icdcf=""
end if
icdcg=""
icdcg=icdcg&"<li>性别：<b>"&aiarr(i_busab,"|",aiint(us_ab))&"</b></li>"
icdcg=icdcg&"<li>婚姻：<b>"&aiarr(i_busah,"|",aiint(us_ah))&"</b></li>"
icdcg=icdcg&"<li>血型：<b>"&aiarr(i_busax,"|",aiint(us_ax))&"</b></li>"
if aiint(us_as)>0 then icdcg=icdcg&"<li>生日：<b>"&aitm(8,us_as)&"</b></li>"
if aiint(us_zy)>2 then icdcg=icdcg&"<li>认证：<b>"&aiarr(i_buszy,"|",aiint(us_zy))&"</b></li>"
if aiint(us_jb)>0 then icdcg=icdcg&"<li>金币：<b>"&ainum(us_jb,1)&"</b> 枚</li>"
if aiint(us_jy)>0 then icdcg=icdcg&"<li>经验：<b>"&ainum(us_jy,1)&"</b> 点</li>"
if not ainull(us_dh) and not aibj(us_dh,"0") and e_uxy>2 then icdcg=icdcg&"<li>电话："&us_dh&"</li>"
if not ainull(us_ct) and not aibj(us_ct,"0") and e_uxy>2 then icdcg=icdcg&"<li>地址："&us_ct&"　"&us_dz&"</li>"
if not ainull(us_em) and not aibj(us_em,"0") and e_uxy>ew_sh then icdcg=icdcg&"<li>邮箱："&us_em&"</li>"
if not ainull(us_sj) and not aibj(us_sj,"0") then icdcg=icdcg&"<li>邀请人：<a href="&eshref(s_udus&g_urg&s_umzs&g_urg&us_sj&g_urz,66)&" target=_blank>"&us_sj&"</a></li>"
if e_uxy>0 then icdcg=icdcg&"<div class=""c-k"">"&uslx(10,us_xy,us_er,us_em,uk_ur)&"</div>"
end if
'--------------------------------CONTENT 0
if not ainull(us_nr) then icdci=esnrgys(us_nr,usdpur,usdpg)
'--------------------------------CONTENT 1
if icskg(ew_pj,ep_pj,0) then icdcm=icdcm&"<div class=""c-l"">"&eshi(2,us_id,us_xi)&"</div>"
icdci=icdci&esfx()
icdty=9
e_ma=e_ma&icnr(icdty,s_uduss,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
us_sb=aiint(us_sb)
if us_sb>0 then e_ma=e_ma&espl(80235,s_uduss,eshref(s_udus&g_urg&s_umxx&g_urg&us_er&g_urz,66),us_er,us_xt,usbiao&"_"&us_sb,"us_xt","us_er","")
else
e_ma=e_ma&aigo(s_uduss&s_ztno&"(或未认证,暂不公开).",1)
end if
else
e_ma=e_ma&aigo(s_uduss&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=uslist()
'-----------------------------------
Function uslist(usfqx)
if ef_id>0 then e_wl=e_wl&"<li><a href="""&eshref(s_udus&g_urg&ef_sn&g_urz,66)&""">"&ef_bt&"</a></li>"
if (e_gdj>3 or e_uxy>2) and usfqx=1 then
e_mt=esbts(ep_sx,s_udlus,s_uduss&s_umlbs&g_gy&e_lj0,s_umtjs&s_uduss&g_gy&e_lj1&g_gx&aiarr(i_buszy,"|",1)&s_uduss&g_gy&eshref(s_umgl&g_urg&s_udus&g_urg&""&g_urg&""&g_urg&""&g_urg&""&g_urg&""&g_urg&"11"&g_urz,66))
elseif e_uxy>ew_sh then
e_mt=esbts(ep_sx,s_udlus,s_uduss&s_umlbs&g_gy&e_lj0,"<i>"&s_ztyq&s_uduss&"</i>"&g_gy&e_lj1)
else
e_mt=esbts(ep_sx,s_udlus,s_uduss&s_umlbs&g_gy&e_lj0,"")
end if
dim uslpg,uslps,uslpuq,uslpuh,uslpur,uslgrr
if usfqx=1 then
uslpuq=eshref(s_umgl&g_urg&s_udus,66)
uslef=g_u2
lidms=g_u3
uslpuh=g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10
uslpur=uslpuq&g_urg&uslef&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uslpuh&g_urz
uslpg=aiint(g_u4)
uslps=aiint(g_u5)
else
uslpuq=eshref(s_udus,66)
uslef=g_u1
lidms=g_u2
uslpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
uslpur=uslpuq&g_urg&uslef&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&uslpuh&g_urz
uslpg=aiint(g_u3)
uslps=aiint(g_u4)
end if
if usfqx=1 then e_mz=e_mz&icmenu("","","1|"&s_udus,ef_sn,"9000","14","14px","45px","88|88|880|100%|")
iclls=icliqls(0,lidms,eshref(uslpuq&g_urg&uslef&g_urg&g_gg&g_urg&g_urg&g_urg&uslpuh&g_urz,66))

Call usss(0)
e_mz=e_mz&icliq(iclls,uslpuq&g_urg&uslef&g_urg&lidms,uslpuh,e_gdj,usfqx,"us")
Call ustj(s_udus&g_urg&uslef&g_urg&uslpuh,0,0)
if uslps=0 then
if aibj(lidms,s_umlpy) then
uslps=i_nmhc
else
uslps=i_nmlb
end if
end if
if gyslist(usbid,uslie(s_umlb),usbiao,uswhere,usorder,uslpur,uslpg,uslps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
 if usfqx=1 then lidti=lidti&"<b>管理</b>"
lidti=lidti&"<u>状态</u>"
lidti=lidti&"<u>最后登录</u>"
lidti=lidti&"<u>注册时间</u>"
lidti=lidti&"<i>性别</i>"
lidti=lidti&"<i>婚姻</i>"
lidti=lidti&"<i>经验</i>"
lidti=lidti&"<i>金币</i>"
if icskg(ew_pj,ep_pj,0) then
lidti=lidti&"<i>差评</i>"
lidti=lidti&"<i>我顶</i>"
end if
lidti=lidti&"<i>浏览</i>"
lidti=lidti&"<u>认证</u>"
lidti=lidti&"账户"
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
lidbt=uslic(1,0,0,gysay(27),gysay(22),gysay(30),gysay(18))&gysay(2)&uslic(1,1,0,gysay(27),gysay(22),gysay(30),gysay(18))
lidtt="账户："&gysay(2)&vbNewLine
if ew_dj>2 and ewxgn("dj") then lidtt=lidtt&"浏览："&aiint(gysay(22)&g_gg&"0")&"次"&vbNewLine
if icskg(ew_pj,ep_pj,0) then lidtt=lidtt&"我顶："&aiint(gysay(23)&g_gg&"0")&"次"&vbNewLine
if icskg(ew_pj,ep_pj,0) then lidtt=lidtt&"差评："&aiint(gysay(24)&g_gg&"0")&"次"&vbNewLine
lidtt=lidtt&"登录时间："&aitm(8,gysay(20))&vbNewLine
lidtt=lidtt&"注册时间："&aitm(8,gysay(30))
if usfqx=1 then
lidlj=eshref(s_umgl&g_urg&s_udus&g_urg&s_umxx&g_urg&gysay(2)&g_urz,66)
lidgl="<b><input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_udus&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udus&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_uduss&s_ztqr,"","","f-sb",s_umscs)&"</b>"
else
lidlj=eshref(s_udus&g_urg&s_umxx&g_urg&gysay(2)&g_urz,66)
end if
'list
if aibj(lidms,s_umlb) then
if usfqx=0 and aiint(e_uxy)>=aiint(gysay(27)) and (aibj(e_uer,gysay(1)) or aibj(e_uer,gysay(2))) then lids1=lids1&"<a href="""&eshref(s_udus&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66)&""">编辑</a>"
lids1=lids1&"<u>"&aiarr(i_bxy,"|",aiint(gysay(27)))&"</u>"
lids1=lids1&"<u>"&aitm(8,gysay(20))&"</u>"
lids1=lids1&"<u>"&aitm(8,gysay(30))&"</u>"
lids1=lids1&"<i>"&aiarr(i_busab,"|",aiint(gysay(8)))&"</i>"
lids1=lids1&"<i>"&aiarr(i_busah,"|",aiint(gysay(9)))&"</i>"
lids1=lids1&"<i>"&gysay(26)&"</i>"
lids1=lids1&"<i>"&gysay(25)&"</i>"
if icskg(ew_pj,ep_pj,0) then
lids1=lids1&"<i>"&gysay(24)&"</i>"
lids1=lids1&"<i>"&gysay(23)&"</i>"
end if
lids1=lids1&"<i>"&gysay(22)&"</i>"
lids1=lids1&"<u>"&aiarr(i_buszy,"|",aiint(gysay(5)))&"</u>"
'yunqian pic
elseif aibj(lidms,s_umlpy) or aibj(lidms,s_umlp) then
lids1=uspic(gysay(19),gysay(3),lidtt,lidlj,0)
lids2=gysay(2)&"<s>"&aiarr(i_buszy,"|",aiint(gysay(5)))&"</s>"
if aibj(lidms,s_umlpy) then
lids3=left(gysay(13),500)
lids4=int(gysay(22)+1)*int(gysay(23))
end if
else
lids1=gysay(13)
lids2=lids2&left(gysay(14),500)
if ew_dj>2 and ewxgn("dj") then lids3=lids3&"浏览："&aiint(gysay(22)&g_gg&"0")&"次 "
lids3=lids3&aitms("注册时间：",aitm(8,gysay(30)),2)&aitms(" 登录时间：",aitm(8,gysay(20)),2)

if not aibj(lidms,s_umlbw) then
if not ainull(gysay(18)) then'img
if aibj(lidms,s_umlpc) then
lids4=uspic(gysay(18),gysay(2),lidtt,lidlj,1)
else
lids4=uspic(gysay(18),gysay(2),lidtt,lidlj,2)
end if
end if
end if

end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
'end

e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if
e_mz=e_mz&iclih(gyspage,e_gdj,usfqx,eshref(s_umgl&g_urg&s_udus&g_urg&s_umsc&"-x"&g_urz,77),"us")
e_ma=e_ma&e_mx&e_mzs&e_mz
'response.Write e_ma
End Function
'-----------------------------------
'=uspic("")
'-----------------------------------
Function uspic(usfstr,usfbt,usfbx,usflj,usfty)
if usfty=0 then
usfstr=esups(usfstr,11)
else
usfstr=esups(usfstr,1)
end if
if not ainull(usfstr) then
dim eslbta,eslbts,eslbtx
if not ainull(usfbt) then
eslbta=" alt="""&usfbt&""""
eslbtx=" title="""&usfbt&""""
if usfty=2 then
eslbts="<span>"&usfbt&"</span>"
else
eslbts="<font>"&usfbt&"</font>"
end if
end if
if not ainull(usfbx) then eslbtx=" title="""&usfbx&""""
if usfty=0 then
uspic=uspic&"<img src="""&usfstr&""""&eslbta&">"
elseif usfty<3 then
uspic=uspic&"<a href="""&usflj&""""&eslbtx&"><img src="""&usfstr&""""&eslbta&"></a>"
elseif usfty=3 or usfty=4 then'show
if left(usflj,1)<>"/" and not aibj(left(usflj,7),"http://") then
if not ainull(usflj) then usflj=esups(usflj,1)
end if
if usfty=3 then uspic="<div class=""c-u"">"
if not ainull(usflj) then
uspic=uspic&"<a"
if usfty=4 then uspic=uspic&" class=""p-sfa"""
uspic=uspic&" href="""&usflj&""""&eslbtx&">"
end if
uspic=uspic&"<img class=""o-imm"" src="""&usfstr&""""&eslbta&">"
if usfty=3 then uspic=uspic&"<br>"&eslbts
if not ainull(usflj) then uspic=uspic&"</a>"
if usfty=3 then uspic=uspic&"</div>"
end if
end if
End Function
'-----------------------------------
'=uslic(1,"")
'-----------------------------------
Function uslic(usfkg,usfty,usfsx,usfxy,usfhi,usftm,usfup)
uslic=""
usfsx=aiint(usfsx)
if usfkg=1 and usfty=0 then
uslic=uslic&icqz(s_udlus,1,usfxy,usfhi)
elseif usfkg=1 and usfty=1 then
uslic=uslic&ichz(1,usftm,usfhi,usfup)
end if
End Function
'-----------------------------------
'=ussersql(usfef)
'-----------------------------------
Function ussersql(usfef)
Call icserq()
if not ainull(uswhere) then
if not ainull(iclwhere) then uswhere=iclwhere&" and "&uswhere
else
uswhere=iclwhere
end if
if not ainull(iclorder) then usorder=iclorder
'order
if ainull(usorder) then usorder=usordermo
'admin
if not aibj(g_u0,s_umgl) and instr(uswhere,"us_xy>0")=0 then
if not ainull(uswhere) then uswhere=" and "&uswhere
uswhere="us_xy>0"&uswhere
end if
if not aibj(usfef,s_umqb) and not ainull(usfef) and not aibj(usfef,"0") then
if not ainull(uswhere) then uswhere=uswhere&" and "
uswhere=uswhere&"us_ef like '"&esnf(usfef)&"%'"
end if
End Function

'-----------------------------------
'=usss()
'Call usss()
'-----------------------------------
Function usss(usfty)
dim icdspx,icdsfx,icdsxx
icdssp="排序|浏览|我顶|差评|金币|经验|登录|注册|过期|推荐|认证|"
icdspx="us_id desc|us_hi desc|us_xi desc|us_xo desc|us_jb desc|us_jy desc|us_t1 desc|us_tm desc|us_t2 desc|us_xy desc|us_zy desc|us_ux desc|us_uy desc|us_jq desc|"
if e_gdj>2 then icdssp=icdssp&"短信|交易|金钱|"

icdssf="范围|正式|三星|四星|五星|图片|认证|"
icdsfx="|us_xy>"&ew_sh+1&"|us_xy>2|us_xy>3|us_xy>4|(us_up<>'' and us_up<>'0' and us_up<>'null')|(us_zj>2 and us_zs<>'' and us_xy>"&ew_sh&")|"
icdssf=icdssf&"T100|T600|"
icdsfx=icdsfx&"100|600|"
icdssf=icdssf&esqday(0)&"|"
icdsfx=icdsfx&esqday("us_tm")&"|us_xy="&ew_sh&"|us_xy=0|(us_zy=2 and us_zs<>'' and us_xy>"&ew_sh&")|"
if e_gdj>2 then icdssf=icdssf&"普通|禁用|申证|"

icdssx="项目|账户|名字|介绍|签名|电邮|电话|地区|地址|其他|上级|分类|时间|更新|"
icdsxx="us_er|us_er|us_bt|us_nr|us_qm|us_em|us_dh|us_ct|us_dz|us_ss|us_sj|us_ef|us_tm|us_t1|us_xt|"
if e_gdj>2 then icdssx=icdssx&"系统|"

if right(icdssp,1)="|" then icdssp=left(icdssp,len(icdssp)-1)
if right(icdssf,1)="|" then icdssf=left(icdssf,len(icdssf)-1)
if right(icdssx,1)="|" then icdssx=left(icdssx,len(icdssx)-1)
icdssm=i_bsm
icdrrp=split(icdspx,"|")
icdrrf=split(icdsfx,"|")
icdrrx=split(icdsxx,"|")
End Function
'-----------------------------------
'=ustj(usfstr=频道ep/1分类ef/2排序ssp/3范围ssf/4项目ssx/5模式ssm/6关键词sss,usffl=分类样式-多选分类|单选分类,usfty)
'-----------------------------------
Function ustj(usfstr,usffl,usfty)
dim icdarr,icdsep,icdsef,icdbx
'response.Write usfstr
icdarr=split(usfstr&"//////","/")
uswhere="6=6"
usorder=""
icdbx=0

icdsep=trim(icdarr(0))
if aibj(icdsep,s_umqb) or aibj(icdsep,"0") or dkdir(0,icdsep) then icdsep=""
icdsef=trim(icdarr(1))
if aibj(icdsef,s_umqb) or aibj(icdsef,"0") or dkdir(0,icdsef) then icdsef=""
icvsp=aiint(icdarr(2))
icvsf=aiint(icdarr(3))
icvsx=aiint(icdarr(4))
icvsm=aiint(icdarr(5))
icvss=aijie(trim(icdarr(6)))
'response.Write dkdir(0,icvss)
if aibj(icvss,s_umqb) or aibj(icvss,"0") or dkdir(0,icvss) then icvss=""

'ef
if icdsef<>"" then
icdbx=1
dim icdfvi,icdfvrr,icdfvrrx,icdfvrrxu,icdfvrrxi,icdfvrrxw
'----------------------------------ef0
if aiint(usffl)>0 then
icdsef=icdsef
if len(icdsef&"0")>3 then
icdfvrr=split(icdsef,g_ura)
for icdfvi=0 to ubound(icdfvrr)
if not aibj(icdsef,s_umqb) and icdfvrr(icdfvi)<>"" then
if not ainull(uswhere) then uswhere=uswhere&" and "
if left(icdfvrr(icdfvi),1)="0" then
'★★★★★this do for tags 0
dim usltlie,usltliez,usltliezrr
usltlie=right(left(icdfvrr(icdfvi),3),2)
if instr("xy,zy,hi,xi",usltlie)>0 then
usltliez=right(icdfvrr(icdfvi),len(icdfvrr(icdfvi))-3)
usltliezrr=split(usltliez&"-","-")
if usltliezrr(0)=usltliezrr(1) then
uswhere=uswhere&"us_"&usltlie&"="&aiint(usltliezrr(0))&""
elseif usltliezrr(0)<>"" and usltliezrr(1)<>"" then
uswhere=uswhere&"us_"&usltlie&">="&aiint(usltliezrr(0))&" and us_"&usltlie&"<="&aiint(usltliezrr(1))&""
elseif usltliezrr(0)<>"" then
uswhere=uswhere&"us_"&usltlie&">="&aiint(usltliezrr(0))&""
elseif usltliezrr(1)<>"" then
uswhere=uswhere&"us_"&usltlie&"<="&aiint(usltliezrr(1))&""
else
uswhere=uswhere&icdfvi&"="&icdfvi
end if
else
if not aibj(icdfvrr(icdfvi),s_umqb) then
icdbx=1
uswhere=uswhere&"us_ef like '"&icdfvrr(icdfvi)&"%'"
else
uswhere=uswhere&"6=6"
end if
end if
'★★★★★this do for tags 1
else
if instr(icdfvrr(icdfvi),g_urb)>1 or (instr(icdfvrr(icdfvi),g_urb)>0 and right(icdfvrr(icdfvi),len(g_urb))<>g_urb) then
icdfvrrx=split(icdfvrr(icdfvi),g_urb)
icdfvrrxu=ubound(icdfvrrx)
icdfvrrxw=""
for icdfvrrxi=0 to icdfvrrxu
if not ainull(icdfvrrxw) and icdfvrrx(icdfvrrxi)<>"" and not aibj(icdfvrrx(icdfvrrxi),s_umqb) then icdfvrrxw=icdfvrrxw&" or "
if icdfvrrx(icdfvrrxi)<>"" and not aibj(icdfvrrx(icdfvrrxi),s_umqb) then icdfvrrxw=icdfvrrxw&"us_ef like '"&icdfvrrx(icdfvrrxi)&"%'"
next
if icdfvrrxw<>"" then
uswhere=uswhere&"("&icdfvrrxw&")"
else
uswhere=uswhere&icdfvi&"="&icdfvi
end if
else
if not aibj(icdfvrr(icdfvi),s_umqb) then
icdbx=1
uswhere=uswhere&"us_ef like '"&icdfvrr(icdfvi)&"%'"
else
uswhere=uswhere&"6=6"
end if
end if
end if
end if
next
end if
'cdv 1
else
'ef
icdbx=1
if not ainull(uswhere) then uswhere=" and "&uswhere
'uswhere="us_ef='"&icdsef&"'"&uswhere
uswhere="us_ef like '"&icdsef&"%'"&uswhere
end if
'----------------------------------ef1
end if

'sp
if icvsp>0 then
usorder=icdrrp(icvsp)
else
usorder=usordermo
end if

'ss
if icvss<>"" then
dim icvssrr,icvssi,icvssud,icvsslin
icvssrr=split(icvss," ")
icvssud=ubound(icvssrr)
icvsslin=""
for icvssi=0 to icvssud
if icvsslin<>"" then icvsslin=icvsslin&" or "
if icvssrr(icvssi)<>"" then
if icvsm=2 then
icvsslin=icvsslin&icdrrx(icvsx)&"='"&icvssrr(icvssi)&"'"
else
icvsslin=icvsslin&icdrrx(icvsx)&" like '%"&icvssrr(icvssi)&"%'"
end if
end if
next
if icvsslin<>"" then
uswhere=uswhere&" and ("&icvsslin&")"
iclapp=1
icdbx=1
end if
end if

'sf
if icvsf>0 then
dim icvsflin
icvsflin=icdrrf(icvsf)
if aibj(right(icvsflin,2),"00") then
uswhere="us_id in (select top "&aiint(icvsflin)&" us_id from "&susdbqz&"us where "&uswhere&" order by us_id desc)"
else
if not ainull(trim(uswhere)) and not ainull(icvsflin) then uswhere=uswhere&" and "
uswhere=uswhere&icvsflin
end if
end if

'admin
if not aibj(g_u0,s_umgl) or e_gdj<3 then
if instr(uswhere,"us_xy>0")=0 then
if not ainull(trim(uswhere)) then uswhere=uswhere&" and "
uswhere=uswhere&"(us_xy>0 or us_er='"&e_uer&"')"
end if
elseif e_gdj>2 then
iclapp=1
end if
uswhere=replace(replace(uswhere,"6=6 and ","")," and 6=6","")
End Function
%>