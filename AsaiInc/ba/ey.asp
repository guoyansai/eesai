<%
'@@0manage/1s_udey/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_udey/2edit|add|del/3*id.HTML

'@@0s_udey/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_udey/1edit|add/2*id.HTML
'@@0s_udey/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_udey) or aibj(g_u1,s_udey)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,7,g_u0,s_udey,s_udeys&s_umlbs)

if e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udey) and aibj(g_u3,s_umtj) then
Call eyadd(1)
elseif aibj(g_u0,s_udey) and aibj(g_u2,s_umtj) then
Call eyadd(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udey) and aibj(g_u3,s_umxg) and aiint(g_u4)>0 then
Call eyedit(1)
elseif aibj(g_u0,s_udey) and aibj(g_u2,s_umxg) then
Call eyedit(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udey) and (aibj(g_u3,s_umxx) or aibj(g_u3,s_umzs)) and aiint(g_u4)>0 then
Call eyshow(g_u4)
elseif aibj(g_u0,s_udey) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and aiint(g_u3)>0 then
Call eyshow(g_u3)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udey) and ((aibj(g_u3,s_umsc) and aiint(g_u4)>0) or aibj(g_u3,s_umsc&"-x")) then
Call eydel(1)
elseif aibj(g_u0,s_udey) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call eydel(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udey) and dkdir(2,g_u3) then
Call eylist(1)
elseif aibj(g_u0,s_udey) and dkdir(2,g_u2) then
Call eylist(0)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","ey")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=eylie()
'-----------------------------------
Function eylie(eyfty)
if eyfty="form" then
eylie="ew,ty,es,em,er,mm,bt,yr,tm,yh,t1,xy,ot,ip"
elseif eyfty=s_umlb then
eylie="ey_id,ey_ew,ey_ty,ey_es,ey_em,ey_er,ey_mm,ey_bt,ey_yr,ey_tm,ey_yh,ey_t1,ey_xy,ey_ot,ey_ip"
elseif eyfty="all" then
eylie="ey_id,ey_ew,ey_ty,ey_es,ey_em,ey_er,ey_mm,ey_bt,ey_yr,ey_tm,ey_yh,ey_t1,ey_xy,ey_ot,ey_ip"
end if
End Function
'-----------------------------------
'ey menu
'=eyme()
'-----------------------------------
Function eyme()
eyme="<div class=""l-ra""><ul>"
dim eymi
for eymi=0 to 4
if eymi mod 2=0 then
eyme=eyme&"<li class=""l-1 pt"">"
else
eyme=eyme&"<li class=""pt"">"
end if
eyme=eyme&""&iclbico(0,"tag",1)&"<a"
if aibj(eylfl,eymi) then eyme=eyme&" class=""l-va"""
eyme=eyme&" href="""&eshref(s_udey&g_urg&eymi&g_urg&d_seyls&g_urz,1)&""">"&aiarr(replace(i_beyty,aiarr(i_beyty,"|",0),"全部留言"),"|",eymi)&"</a>"
if eymi>0 then eyme=eyme&"　<a href="""&eshref(s_udey&g_urg&eymi&g_urg&s_umtj&g_urz,1)&""">"&s_umtjs&"</a>"
eyme=eyme&"</li>"
next
eyme=eyme&"</ul></div>"
End Function
'-----------------------------------
'add/edit form
'=eyform(eyfty0=add|1=edit,eyfqx0=putong|1=admin,eyflx=book type,eyfbt=moren title)'支持外部调用
'-----------------------------------
Function eyform(eyfty,eyfqx,eyflx,eyfbt)
eyflx=aiint(eyflx)
if eyfty=0 then
ey_bt=eyfbt
ey_ew=ew_sn
if ainull(e_ubt) then
ey_er=e_uer
else
ey_er=e_ubt
end if
ey_es=e_udh
ey_em=e_uem
ey_ip=aiip()
if eyflx>0 then
ey_ty=eyflx
else
ey_ty=2
end if
ey_tm=now()
ey_xy=0
else
ey_t1=now()
end if
eyform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"""
if eyfqx=1 then
eyform=eyform&" action="""""
else
eyform=eyform&" action="""&eshref(s_udey&g_urg&eyflx&g_urg&s_umtj&g_urz,1)&""""
end if
eyform=eyform&" method=""post"" AUTOCOMPLETE=""off""><ul>"&aibutian(1)
eylfl=eyflx
if eyfqx=1 then
eyform=eyform&icflsr(25,"称呼","","er","",0,50,"*留言联系人称呼","",ey_er)&icflsr(75,"标题","","bt","",0,200,"*请输入留言标题","",ey_bt)
eyform=eyform&icflsr(25,"手机","","es","",6,20,"请输入常用手机号码(固话请直接输入数字)","",ey_es)&icflsr(25,"邮箱","","em","",0,100,"*请输入常用邮箱","",ey_em)&icflsr(5,"时间","","tm","",99,200,"*","",ey_tm)
eyform=eyform&icflxz(25,"类型","ty","","*请选择留言的类型","",ey_ty,0,i_beyty)&icflsr(25,"密钥","","mm","",3,50,"*请输入留言查看的密钥","",aimm(g_gmm,ey_mm,1))&icflsr(25,"地址","","ip","",0,200,"*留言者IP地址","",ey_ip)&icflsr(25,"其他","","ot","",0,200,"*其他信息","",ey_ot)
eyform=eyform&icflwb(10,"内容","yr","","",0,8000,"*留言内容","",ey_yr)
eyform=eyform&icflwb(10,"回复","yh","","",0,8000,"回复内容","",ey_yh)
eyform=eyform&icflxz(25,"状态","xy","","*","",ey_xy,0,i_bxy)&icflot(25,"网站",ewselect(0,ey_ew))&icflsr(5,"更新","","t1","",99,50,"*","",ey_t1)&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script>"
else
eyform=eyform&icflsr(25,"称呼","","er","",0,50,"*联系人称呼","",ey_er)&icflsr(75,"标题","","bt","",0,200,"*请输入标题","",ey_bt)
eyform=eyform&icflsr(25,"手机","","es","",6,20,"请输入电话号码","",ey_es)
if g_u1="0" or eyflx=0 then
eyform=eyform&icflsr(25,"邮箱","","em","",0,100,"请输入常用邮箱","",ey_em)&icflxz(25,"类型","ty","","*请选择留言的类型","f-s",ey_ty,0,replace(i_beyty,aiarr(i_beyty,"|",0),"全部留言"))
else
eyform=eyform&icflsr(5,"邮箱","","em","",0,100,"请输入常用邮箱","",ey_em)&aiinput("hidden","ty","",0,0,"","",ey_ty)
end if
eyform=eyform&icflsr(25,"密钥","password","mm","",3,50,"请输入保密密码","",aimm(g_gmm,ey_mm,1))
if eyflx>0 then
eyform=eyform&icflwb(10,"内容","yr","","",0,8000,"*请填写"&aiarr(i_beyty,"|",eyflx)&"内容","",ey_yr)
else
eyform=eyform&icflwb(10,"内容","yr","","",0,8000,"*留言内容","",ey_yr)
end if
eyform=eyform&aiinput("hidden","tm","",0,0,"","",ey_tm)&aiinput("hidden","t1","",0,0,"","",ey_t1)&aiinput("hidden","ew","",0,0,"","",ey_ew)&aiinput("hidden","xy","",0,0,"","",ey_xy)&aiinput("hidden","yh","",0,0,"","",ey_yh)&aiinput("hidden","ot","",0,0,"","",ey_ot)&aiinput("hidden","ip","",0,0,"","",ey_ip)

end if
eyform=eyform&icflot(10,"验证",eskyx(0,2,2))
if eyfty=1 then
eyform=eyform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",ey_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif eyfty=0 then
eyform=eyform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
eyform=eyform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=eyadd()
'-----------------------------------
Function eyadd(eyfqx)
dim eydmzl
if eyfqx=1 then g_u1=g_u2
if aiint(g_u1)>0 then
eydmzl=s_umtjs&aiarr(i_beyty,"|",aiint(g_u1))
else
eydmzl=s_umtjs&s_udeys
end if
ew_bt=eydmzl&","&ew_bt:ew_zt=eydmzl&","&ew_zt:ew_nr=eydmzl&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&eydmzl&"</a></li>"
e_mt=esbts(s_udxey,s_udley,eydmzl&g_gy&e_lj1,s_udeys&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("bt,yr,er") then
if gysfm(eylie("form"),eybiao,"ey_es='"&aireq("es")&"' and ey_bt='"&aireq("bt")&"'","ey_",1) then
Call aisn(0)
e_ma=e_ma&aigo(eydmzl&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(eydmzl&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(eydmzl&s_ztsb,1)
end if
else
e_ma=eyform(0,eyfqx,g_u1,"")&e_ma
end if
End Function
'-----------------------------------
'edit action
'=eyedit()
'-----------------------------------
Function eyedit(eyfqx)
ew_bt=s_umxgs&s_udeys&","&ew_bt:ew_zt=s_umxgs&s_udeys&","&ew_zt:ew_nr=s_umxgs&s_udeys&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udey&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_udeys&"</a></li>"
e_mt=esbts(s_udxey,s_udley,s_umxgs&s_udeys&g_gy&eshref(s_umgl&g_urg&s_udey&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_udeys&g_gy&e_lj1&g_gx&s_udeys&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("bt,yr,er") then
if gysfm(eylie("form"),eybiao,"ey_id="&aiint(aireq("id"))&"","ey_",2) then
e_ma=e_ma&aigo(s_umxgs&s_udeys&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_udeys&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_udeys&s_ztsb,1)
end if
else
if eyfqx=1 then
eywhere="ey_id="&aiint(g_u4)&""
else
eywhere="ey_id="&aiint(g_u3)&""
end if
if gysread(eylie("all"),eybiao,eywhere,"") then
ew_bt=ey_bt&","&ew_bt:ew_zt=ey_bt&","&ew_zt:ew_nr=ey_bt&","&ew_nr
e_ma=eyform(1,eyfqx,ey_ty,ey_bt)&e_ma
else
e_ma=e_ma&aigo(s_udeys&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=eydel(eyfqx)
'-----------------------------------
Function eydel(eyfqx)
ew_bt=s_udeys&s_umscs&","&ew_bt:ew_zt=s_udeys&s_umscs&","&ew_zt:ew_nr=s_udeys&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_udeys&s_umscs&"</li>"
e_mt=esbts(s_udxey,s_udley,s_umscs&s_udeys,s_umtjs&s_udeys&g_gy&e_lj1&g_gx&s_udeys&s_umlbs&g_gy&e_lj0)
if eyfqx=1 then
eylfl=aiint(g_u2)
if e_uxy>2 then
if aiint(g_u4)>0 then
if gysdel(eybid,eybiao,"ey_id="&aiint(g_u4)) then
e_ma=e_ma&aitiao(s_udeys&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udeys&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u3,s_umsc&"-x") then
if aiint(g_u2)=0 then
eywhere=esrew("ey",ew_sn)
else
eywhere="ey_ty="&aiint(g_u2)&" and "&esrew("ey",ew_sn)
end if
if gysdel(eybid,eybiao,eywhere) then
e_ma=e_ma&aitiao(s_udeys&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udeys&s_umscs&s_ztsb,1)
end if
end if
end if
else
if aiint(g_u3)>0 then
if gysdel(eybid,eybiao,"ey_bt='"&e_uer&"' and ey_xy<3 and ey_id="&aiint(g_u2)) then
e_ma=e_ma&aitiao(s_udeys&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udeys&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(eybid,eybiao,"ey_bt='"&e_uer&"' and ey_ty=0 and ey_xy=0") then
e_ma=e_ma&aitiao(s_udeys&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udeys&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'show
'=eyshow()
'-----------------------------------
Function eyshow(eyfid)
if aibj(g_u0,s_umgl) then
eywhere="ey_id="&aiint(eyfid)&""
else
eywhere="ey_id="&aiint(eyfid)&" and (ey_ip='"&aiip()&"' or (ey_ty>1 and ey_xy>0))"
end if
if gysread(eylie("all"),eybiao,eywhere,"") then
eylfl=aiint(ey_ty)
ew_bt=ey_bt&","&ew_bt:ew_zt=ey_bt&","&ew_zt:ew_nr=ey_bt&","&ew_nr:ew_cp=ey_bt&","&ew_cp
dim eydsx,eydpur,eydpg,eylmm,eylnr
if aibj(g_u0,s_umgl) then
eydpg=aiint(g_u5)
eylmm=aistr(g_u6)
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udey&g_urg&s_umxx&g_urg&ey_id&g_urz,77)&""">"&ey_bt&"</a></li>"
eydpur=eshref(s_umgl&g_urg&s_udey&g_urg&ey_ty&g_urg&g_u2&g_urg&ey_id&g_urg&g_gp&g_urg&eylmm&g_urz,77)
e_mt=esbts(eydsx,s_udley,s_udeys&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_udey&g_urg&ey_ty&g_urg&s_umxx&g_urg&ey_id&g_urz,1),s_udeys&s_umlbs&g_gy&eshref(s_umgl&g_urg&s_udey&g_urg&ey_ty&g_urg&d_seyls&g_urz,1)&g_gx&s_umzss&s_udeys&g_gy&eshref(s_umgl&g_urg&s_udey&g_urg&ey_ty&g_urg&s_umzs&g_urg&ey_id&g_urz,1))
else
eydpg=aiint(g_u4)
eylmm=aistr(g_u5)
e_wl=e_wl&"<li><a href="""&eshref(s_udey&g_urg&s_umxx&g_urg&ey_id&g_urz,1)&""">"&ey_bt&"</a></li>"
eydpur=eshref(s_udey&g_urg&ey_ty&g_urg&g_u2&g_urg&ey_id&g_urg&g_gp&g_urg&eylmm&g_urz,1)
e_mt=esbts(eydsx,s_udley,s_udeys&s_umxxs&g_gy&eshref(s_udey&g_urg&ey_ty&g_urg&s_umxx&g_urg&ey_id&g_urz,1),s_udeys&s_umlbs&g_gy&eshref(s_udey&g_urg&ey_ty&g_urg&d_seyls&g_urz,1))
end if
icdcb=ey_bt&" <span>"&ey_er&"</span>"
'--------------------------------HENG 0
icdcd=s_udeys&"类型："&aiarr(i_beyty,"|",aiint(ey_ty))
if not ainull(ey_tm) then icdcd=icdcd&aitms(" "&s_udeys&"时间：",ey_tm,9)
icdcd=icdcd&" "&s_udeys&"状态："&aiarr(i_bxy,"|",aiint(ey_xy))
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdcg=""
if not ainull(ey_er) then icdcg=icdcg&"<li>称呼："&ey_er&"</li>"
if aibj(aiip(),ey_ip) then
if not ainull(ey_es) then icdcg=icdcg&"<li>手机："&ey_es&"</li>"
if not ainull(ey_em) then icdcg=icdcg&"<li>邮箱："&ey_em&"</li>"
if not ainull(ey_ip) then icdcg=icdcg&"<li>主机："&ey_ip&"</li>"
if not ainull(ey_mm) then icdcg=icdcg&"<li>密钥："&aimm(g_gmm,ey_mm,1)&"</li>"
if not ainull(ey_ot) then icdcg=icdcg&"<li>其他："&ey_ot&"</li>"
icdcg=icdcg&"<li>(*提示：以上信息仅您和管理员可看，他人无法查看。)</li>"
end if
eylnr=esnrgys(ey_yr,eydpur,eydpg)
if not ainull(ey_yh) and not aibj(ey_yh,"0") then eylnr=eylnr&"<div class=""ftt""><br><br>"&aitmx(ey_t1,9)&"回复：<br><br>"&ey_yh&"</div>"
icdci=esmm(0,0,0,ey_id,ey_yr,ey_er,eylnr,eshref(s_udey&g_urg&ey_ty&g_urg&g_u2&g_urg&ey_id&g_urg&g_u4&g_urg&g_gg&g_urz,11),ey_mm,aimm(g_gmm,eylmm,0))
'icnr(icdty=0标题|1,icddm=短名,icdcb=标题,icdcc=摘要,icdcd=横条备注,icdcf=左侧封面图,icdcg=右侧备注,icdci=内容,icdcj=媒体展示,icdcm=点评分享区)
icdty=9
e_ma=e_ma&icnr(icdty,icddm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
'--------------------------------CONTENT 1
else
e_ma=e_ma&aigo(s_udeys&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=eylist()
'-----------------------------------
Function eylist(eyfqx)
e_mt=esbts(s_udxey,s_udley,s_udeys&s_umlbs&g_gy&e_lj0,s_umtjs&s_udeys&g_gy&e_lj1)
dim eylpg,eylps,eylpuq,eylpuh,eylpur,eylgrr,eylpum
if eyfqx=1 then
eylfl=aiint(g_u2)
eylpum=77
eylpuq=s_umgl&g_urg&s_udey&g_urg&g_u2
lidms=g_u3
eylpuh=g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10
eylpur=eshref(eylpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&eylpuh&g_urz,eylpum)
eylpg=aiint(g_u4)
eylps=aiint(g_u5)
else
eylfl=aiint(g_u1)
eylpum=1
eylpuq=s_udey&g_urg&g_u1
lidms=g_u2
eylpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
eylpur=eshref(eylpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&eylpuh&g_urz,eylpum)
eylpg=aiint(g_u3)
eylps=aiint(g_u4)
end if
e_lj0=e_lj0&g_urg&g_urg&eylfl
e_lj1=e_lj1&g_urg&eylfl

iclls=icliqls(5,lidms,eshref(eylpuq&g_urg&g_gg&g_urg&g_urg&g_urg&eylpuh&g_urz,eylpum))

Call eysers()
e_mz=e_mz&icliq(iclls,eylpuq&g_urg&lidms,eylpuh,e_gdj,eyfqx,"ey")
Call eysersql()

if eylps=0 then
if aibj(lidms,s_umlpy) then
eylps=i_nmhc
else
eylps=i_nmlb
end if
end if
'@@ey_id,1ey_ew,2ey_ty,3ey_es,4ey_em,5ey_er,6ey_mm,7ey_bt,8ey_yr,9ey_tm,10ey_yh,11ey_t1,12ey_xy,13ey_ot,14ey_ip
if gyslist(eybid,eylie(s_umlb),eybiao,eywhere,eyorder,eylpur,eylpg,eylps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if eyfqx=1 then lidti=lidti&"<b>操作</b>"
lidti=lidti&"<u>类型</u>"
lidti=lidti&"<u>留言时间</u>"
lidti=lidti&"<u>称呼</u>"
lidti=lidti&"标题"
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
lidbt=eylic(1,0,gysay(12),gysay(9))&"["&aiarr(i_beyty,"|",aiint(gysay(2)))&"] "&gysay(7)&eylic(1,1,gysay(12),gysay(9))
lidtt="标题："&gysay(7)&vbNewLine
lidtt=lidtt&"称呼："&gysay(5)&vbNewLine
lidtt=lidtt&s_udeys&"类型："&aiarr(i_beyty,"|",aiint(gysay(2)))&vbNewLine
lidtt=lidtt&"留言时间："&gysay(9)
if eyfqx=1 then
lidlj=eshref(s_umgl&g_urg&s_udey&g_urg&gysay(2)&g_urg&s_umxx&g_urg&gysay(0)&g_urz,77)
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_udey&g_urg&gysay(2)&g_urg&s_umxg&g_urg&gysay(0)&g_urz,1),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udey&g_urg&gysay(2)&g_urg&s_umsc&g_urg&gysay(0)&g_urz,1),s_umscs&s_udeys&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
else
lidlj=eshref(s_udey&g_urg&gysay(2)&g_urg&s_umxx&g_urg&gysay(0)&g_urz,1)
end if
'list
if aibj(lidms,s_umlb) then
lids1=lids1&"<u"
if aiint(gysay(2))>2 then lids1=lids1&" class=""ftt"""
lids1=lids1&">"&aiarr(i_beyty,"|",aiint(gysay(2)))&"</u>"
lids1=lids1&"<u>"&gysay(9)&"</u>"
lids1=lids1&"<u>"&gysay(5)&"</u>"
else
lidms=s_umlpc
lids3=lids3&"留言人："&gysay(5)&aitms(" 留言时间：",gysay(9),2)
lids2=lids2&left(gysay(8),100)
if not ainull(gysay(10)) and not aibj(gysay(10),"0") then lids2=lids2&"<br><br><font class=""ftt"">"&aitmx(gysay(11),9)&"回复：</font><br>"&left(gysay(10),100)
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,eyfqx,eshref(s_umgl&g_urg&s_udey&g_urg&g_u2&g_urg&s_umsc&"-x"&g_urz,77),"ey")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=eylic(1,"")
'-----------------------------------
Function eylic(eyfkg,eyfty,eyfxy,eyftm)
eylic=""
if eyfkg=1 and eyfty=0 then
eylic=eylic&icqz(s_udley,1,eyfxy,0)
elseif eyfkg=1 and eyfty=1 then
eylic=eylic&ichz(1,eyftm,0,"")
end if
End Function
'-----------------------------------
'=eysers()
'Call eysers()
'-----------------------------------
Function eysers()
icdssp="排序|最新|时间|类型|状态"
icdrrp=split("ey_id desc|ey_id desc|ey_tm desc|ey_ty desc|ey_xy desc","|")
icdssf="范围|推荐|"&esqday(0)&"|未回|已回|普通"
if e_gdj>2 then icdssf=icdssf&"|禁用"
icdrrf=split("|ey_xy>1|"&esqday("ey_tm")&"|(ey_yh="" or ey_yh='null' or ey_yh='0')|ey_yh<>"" and ey_yh<>'null' and ey_yh<>'0'|ey_xy=1|ey_xy=0","|")
icdssx="项目|留言|回复"
if e_gdj>2 then icdssx=icdssx&"|手机|邮箱|称呼|地址|其他"
icdrrx=split("ey_yr|ey_yr|ey_yh|ey_es|ey_em|ey_er|ey_ip|ey_ot","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=eysersql()
'-----------------------------------
Function eysersql()
Call icserq()
eywhere=iclwhere
eyorder=iclorder
iclapp=1
'order
if ainull(eyorder) then eyorder=eyordermo
'admin
if aibj(g_u0,s_umgl) then
if aiint(g_u2)>0 then
if not ainull(eywhere) then eywhere=eywhere&" and "
eywhere=eywhere&"ey_ty="&aiint(g_u2)&""
end if
else
if not ainull(eywhere) then eywhere=eywhere&" and "
eywhere=eywhere&"(ey_ip='"&aiip()&"' or (ey_ty>1 and ey_xy>0))"
if aiint(g_u1)>0 then
if not ainull(eywhere) then eywhere=eywhere&" and "
eywhere=eywhere&"ey_ty="&aiint(g_u1)&""
end if
end if
End Function
%>