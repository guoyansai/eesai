<%
'-----------------------------------
'Data Table
'=ealie()
'-----------------------------------
Function ealie(eafty)
if eafty="form" then
ealie="ew,el,ep,ef,us,um,ee,eq,sn,bt,jj,ss,tm,xy,px,hi,xi,bd,bc,jg,jy,oz,oy,t1,t2,mm,up,uf,cs,pl,yy,sb"
elseif eafty="formx" then
ealie="sn,nr,ot,xt"
'@@0ai_id,1ai_sn,2ai_bt,3ai_tm,4ai_hi,5ai_xi,6ai_us,7ai_up,8ai_ss,9ai_xy,10ai_ef,11ai_ep,12ai_um,13ai_el,14ai_px,15ai_jg,16ai_jy,17ai_t1,18ai_t2,19ai_oy,20ai_oz,21ai_bd,22ai_bc,23ai_ee,24ai_jj,25ai_eq,26ai_cs,27ai_yy,28ai_mm
elseif eafty=s_umlb then
'@@0ai_id,1ai_sn,2ai_bt,3ai_tm,4ai_hi,5ai_xi,6ai_us,7ai_up,8ai_ss,9ai_xy,10ai_ef,11ai_ep,12ai_um,13ai_el,14ai_px,15ai_jg,16ai_jy,17ai_t1,18ai_t2,19ai_oy,20ai_oz,21ai_bd,22ai_bc,23ai_ee,24ai_jj,25ai_eq,26ai_cs,27ai_yy,28ai_mm,29ai_sb"
ealie="ai_id,ai_sn,ai_bt,ai_tm,ai_hi,ai_xi,ai_us,ai_up,ai_ss,ai_xy,ai_ef,ai_ep,ai_um,ai_el,ai_px,ai_jg,ai_jy,ai_t1,ai_t2,ai_oy,ai_oz,ai_bd,ai_bc,ai_ee,ai_jj,ai_eq,ai_cs,ai_yy,ai_mm,ai_sb"
elseif eafty="pp" then
'@@ai_id,1ai_ep,2ai_ef,3ai_us,4ai_sn,5ai_bt,6ai_tm,7ai_xy,8ai_px,9ai_jg,10ai_jy,11ai_oz,12ai_oy,13ai_t2,14ai_uf
ealie="ai_id,ai_ep,ai_ef,ai_us,ai_sn,ai_bt,ai_tm,ai_xy,ai_px,ai_jg,ai_jy,ai_oz,ai_oy,ai_t2,ai_uf"
elseif eafty="all" then
ealie="ai_id,ai_ew,ai_el,ai_ep,ai_ef,ai_us,ai_um,ai_ee,ai_eq,ai_sn,ai_bt,ai_jj,ai_ss,ai_tm,ai_xy,ai_px,ai_hi,ai_xi,ai_bd,ai_bc,ai_jg,ai_jy,ai_oz,ai_oy,ai_t1,ai_t2,ai_mm,ai_up,ai_uf,ai_cs,ai_pl,ai_yy,ai_sb"
elseif eafty="allx" then
ealie="ai_nr,ai_ot,ai_xt"
end if
End Function
'-----------------------------------
'top list arr
'=earr(eafnm,eafpf=0ep/1ef/1ssp/2ssf/3ssx/4ssm/5sss,)
'-----------------------------------
Function earr(eafnm,eafps)
Call aiss(0,0)
Call aitj(eafps,ep_ef,0)
if aiint(iclapp)>0 or ew_ap<1 then
g_app=""
else
if not ainull(g_app) then g_app=esapm(3,g_app)
end if
if eafnm=0 or ainull(eafnm) then
eafnm=i_nmhc
else
eafnm=aiint(eafnm)
if not ainull(g_app) then g_app=g_app&"-"&eafnm
end if
if e_aiidl<>"" and e_aiidl<>"," then
if not ainull(g_app) then g_app=g_app&"-1"
dim eadidl
eadidl=left(e_aiidl,len(e_aiidl)-1)
if not ainull(eawhere) then eawhere=eawhere&" and "
eawhere=eawhere&"ai_id not in ("&eadidl&")"
end if
if e_aiids<>"" and e_aiids<>"," then
dim eadids
eadids=left(e_aiids,len(e_aiids)-1)
if ew_cf=0 or (ew_cf=1 and aibj(right(eafps,len(s_umqb)),s_umqb)) then
if not ainull(eawhere) then eawhere=eawhere&" and "
eawhere=eawhere&"ai_id not in ("&eadids&")"
end if
end if
if aibj(g_u0,s_udukw) and not ainull(uk_us) then
g_app=""
if not ainull(eawhere) then eawhere=eawhere&" and "
eawhere=eawhere&"ai_us='"&uk_us&"'"
end if

if gystop(eafnm,eabid,ealie(s_umlb),eabiao,eawhere,eaorder,g_app) then
earr=gysar
end if
End Function
'-----------------------------------
'Title link
'=eaurl()
'-----------------------------------
Function eaurl(eafstr,eafum,eafep,eafot)
if i_xklj=2 and len(eafot&"0")>10 and aibj(left(eafot&"0",7),"http://") then
'if aibj(eafep,"link") and i_xklj=2 and aibj(left(eafot&"0",7),"http://") then
eaurl=eafot
elseif not ainull(g_u1) and aibj(g_u0,s_udukw) then
eaurl=eshref(g_u0&g_urg&g_u1&g_urg&eafstr,66)
else
eaurl=eshref(eafstr,eafum)
end if
End Function
'-----------------------------------
'Title alt
'=eaalt()
'-----------------------------------
Function eaalt(eafbt,eaftm,eafhi,eafxi,eafus,eafee)
eaalt=""&eafbt&""&vbNewLine
if ewxgn("dj") then
if icskg(ew_pj,ep_pj,0) and aiint(eafxi)>0 then eaalt=eaalt&"支持"&eafxi&"次 "
if (ew_dj>2 or (e_gdj>1 and ew_dj>0)) and aiint(eafhi)>0 then eaalt=eaalt&"浏览"&eafhi&"次 "
if i_xkuhy>1 then
if not ainull(eafus) then eaalt=eaalt&"来自:"&aistr(usren(eafus)&g_gg&w_motm)&" "
if not ainull(eafee) then eaalt=eaalt&"编辑:"&aistr(eafee&g_gg&w_motm)&" "
end if
if i_xkatm>1 then eaalt=eaalt&estms(6,eaftm)
end if
End Function
'-----------------------------------
'add action
'=eaadd()
'-----------------------------------
Function eaadd(eafqh,eafty,eafsn)
dim easduq,easdul,easdqx
if left(eafqh,1)="3" or (left(eafqh,1)="7" and len(eafqh)=2) then
easdqx=e_uzy
else
easdqx=e_gdj
end if
if eaxqw(ep_sn,ep_qw)then
easdul=replace(replace(g_u,g_urg&s_umfb&g_urz,g_urz),g_urg&s_umtj&g_urz,g_urz)
if left(eafqh,1)="3" and len(eafqh)=3 then
Call ukread(g_u2)
ew_bt=uk_bt&","&ew_bt:ew_zt=uk_zt&","&ew_zt:ew_nr=uk_co&","&ew_nr
e_wl="<li><a href="""&eshrej("",uk_ur,"",1)&""">"&uk_mc&"</a></li>"
e_mt=esbts(s_udxuk,s_udluk,uk_mc&g_gy&eshrej("",uk_ur,"",1),uk_mc&s_umlbs&g_gy&easdul)
easduq=s_umgl&g_urg&s_udukw&g_urg&uk_ur&g_urg
elseif left(eafqh,1)="3" and len(eafqh)=2 then
Call ukread(g_u1)
ew_bt=uk_bt&","&ew_bt:ew_zt=uk_zt&","&ew_zt:ew_nr=uk_co&","&ew_nr
e_wl="<li><a href="""&eshrej("",uk_ur,"",1)&""">"&uk_mc&"</a></li>"
e_mt=esbts(s_udxuk,s_udluk,uk_mc&g_gy&eshrej("",uk_ur,"",1),uk_mc&s_umlbs&g_gy&easdul)
easduq=s_udukw&g_urg&uk_ur&g_urg
elseif left(eafqh,1)="7" and len(eafqh)=3 then
easduq=s_umgl&g_urg
end if

if right(eafqh,1)<>"2" or aibj(aireq("tg"),"0") then
if not aibj(ep_sn,s_umqb) and ep_sn<>"" then
easdul=replace(replace(g_u,g_urg&s_umfb&g_urz,g_urz),g_urg&s_umtj&g_urz,g_urz)
ew_bt=ep_mc&","&ew_bt:ew_zt=ep_mc&","&ew_zt:ew_nr=ep_mc&","&ew_nr
e_mt=esbts(ep_sx,ep_el,ep_mc&g_gy&eshref(easduq&ep_sn&g_urz,1),ep_dm&s_umlbs&g_gy&easdul)
if not aibj(ef_sn,s_umqb) and ef_sn<>"" then
ew_bt=ef_bt&","&ew_bt:ew_zt=ef_bt&","&ew_zt:ew_nr=ef_bt&","&ew_nr
e_mt=esbts(ep_sx,ep_el,ef_bt&g_gy&eshref(easduq&ep_sn&g_urg&ef_sn&g_urz,1),ep_dm&s_umlbs&g_gy&easdul)
end if
ew_bt=s_umfbs&ep_dm&","&ew_bt:ew_zt=s_umfbs&ep_dm&","&ew_zt:ew_nr=s_umfbs&ep_dm&","&ew_nr
e_wl=e_wl&"<li>"&s_umtjs&ep_dm&"</li>"
else
if left(eafqh,1)="7" then
'uk_mc=s_udeas
e_mt=esbts(s_udxea,s_udlea,s_udeas,"")
end if
e_wl=e_wl&"<li>"&uk_mc&" "&s_umtjs&"</li>"
end if


if esky(1,aiint(easdqx)) or aireq("usx")="1" then'aireq("usx")="1"用来规避验证
if epzsd(0,ep_zs) or e_gdj>3 then
if aireq("usx")="1" and e_uid=0 then
e_ma=e_ma&aitiao("您的"&ep_dm&"提交失败！原因：您暂时无权此操作，请注册会员帐户后操作。",u_user,5)
exit Function
end if
'response.Write eabiao&"_"&aireq("sb")&ealie("formx")&"ai_sn='"&aistr(aireq("sn"))&"'"
if gysfm(ealie("form"),eabiao,"ai_sn='"&aistr(aireq("sn"))&"'","ai_",1) and gysfm(ealie("formx"),eabiao&"_"&aireq("sb"),"ai_sn='"&aistr(aireq("sn"))&"'","ai_",1) then
Call eqin(aireq("eq"))
Call aisn(0)
if i_xkuhy>0 and i_xkuhj=1 and aiint(e_uid)>0 then
if gysgx(w_dbqz&"us","us_jb=us_jb+"&i_jcjb&",us_jy=us_jy+"&i_jcjy*2&"","us_id="&e_uid&"") then
e_ma=e_ma&usergx(0,"jb",e_ujb+i_jcjb)
end if
end if
if aibj(aireq("tg"),"0") then
e_ma=e_ma&aitiao("恭喜您，您的投稿已经成功提交，请等待管理员审核，谢谢配合！",easdul,i_nmtz)
else
if aibj(g_u1,s_umtj) then easdul="/?"&ep_sn&"/"&s_umqb&"//0///19"&g_urz
if i_xkuhj=1 and e_gxy>0 and e_gmc<>"" and aiint(e_gdj)>0 then
Call gysgx(w_dbqz&"ee","ee_jb=ee_jb+"&i_jcee&"","ee_mc='"&e_gmc&"'")
e_ma=e_ma&aitiao(s_umtjs&ep_dm&s_ztcg&"<br>(奖励"&e_gmc&"金币<b>"&i_jcee&"</b>枚)",easdul,i_nmtz)
else
e_ma=e_ma&aitiao(s_umtjs&ep_dm&s_ztcg,easdul,i_nmtz)
end if
end if
if aireq("email")="1" then e_ma=e_ma&aiemail(g_emkg,g_emci,e_uem,ew_le,"","","",ew_mc&"："&aimo(e_ubt,e_uer)&"新发布"&ep_dm,1,"<p>标题：<b>"&aireq("bt")&"</b></p><p><a href=http://"&g_uhost&g_uurl&"?"&ep_sn&"/"&s_umqb&"/"&s_umzs&"/"&aireq("sn")&g_urz&">http://"&g_uhost&g_uurl&"?"&ep_sn&"/"&s_umqb&"/"&s_umzs&"/"&aireq("sn")&g_urz&"</a></p>","","<p>已通知管理员"&ew_le&"。</p>")
if left(eafqh,1)="7" and len(eafqh)=3 then e_ma=e_ma&eskod(11,11,aireq("ep")&g_apj&esnf(aireq("ef"))&g_apj&aireq("sn"))
else
e_ma=e_ma&aigo("很抱歉！已存在的信息，"&s_umtjs&ep_dm&s_ztsb,1)
end if
else
e_ma=e_ma&aigo("请填写完整各带*号的文本框，"&s_umtjs&ep_dm&s_ztsb,1)
end if
else
'=================================================ADD
e_ma=eaform(eafqh,eafty,eafsn)&e_ma
end if

else
Response.Redirect(e_lj0)
end if
else
e_ma=e_ma&aitiao(s_umtjs&ep_dm&s_ztsb&"您暂时无权此操作["&aisrd(aiint(ep_qw),i_bepqw)&"]。",u_user,5)
end if
End Function
'-----------------------------------
'edit action
'=eaedit()
'-----------------------------------
Function eaedit(eafqh,eafty,eafsn)
'response.Write "9999999999999999999999"&request("nr")
dim easdur,easduq,easdul,easdqx
if ew_sh=1 then
easdqx=1
else
if left(eafqh,1)="3" then
easdqx=e_uzy
else
easdqx=e_gdj
end if
end if
if aiint(easdqx)>0 then
easdur=replace(g_u,g_urg&s_umxg&g_urg&eafsn&g_urz,g_urg&s_umtj&g_urz)
easdul=replace(g_u,g_urg&s_umxg&g_urg&eafsn&g_urz,g_urz)
if left(eafqh,1)="3" and len(eafqh)=3 then
Call ukread(g_u2)
ew_bt=uk_bt&","&ew_bt:ew_zt=uk_zt&","&ew_zt:ew_nr=uk_co&","&ew_nr
e_wl="<li><a href="""&eshrej("",uk_ur,"",1)&""">"&uk_mc&"</a></li>"
e_mt=esbts(s_udxuk,s_udluk,uk_mc&g_gy&eshrej("",uk_ur,"",1),"<i>"&uk_mc&s_umtjs&"</i>"&g_gy&easdur&g_gx&uk_mc&s_umlbs&g_gy&easdul)
easduq=s_umgl&g_urg&s_udukw&g_urg&uk_ur&g_urg
elseif left(eafqh,1)="3" and len(eafqh)=2 then
Call ukread(g_u1)
ew_bt=uk_bt&","&ew_bt:ew_zt=uk_zt&","&ew_zt:ew_nr=uk_co&","&ew_nr
e_wl="<li><a href="""&eshrej("",uk_ur,"",1)&""">"&uk_mc&"</a></li>"
e_mt=esbts(s_udxuk,s_udluk,uk_mc&g_gy&eshrej("",uk_ur,"",1),"<i>"&uk_mc&s_umtjs&"</i>"&g_gy&easdur&g_gx&uk_mc&s_umlbs&g_gy&easdul)
easduq=s_udukw&g_urg&uk_ur&g_urg
elseif left(eafqh,1)="7" and len(eafqh)=3 then
easduq=s_umgl&g_urg
end if

if right(eafqh,1)<>"2" then
if not aibj(ep_sn,s_umqb) and ep_sn<>"" then
easdur=replace(g_u,g_urg&s_umxg&g_urg&eafsn&g_urz,g_urg&s_umtj&g_urz)
easdul=replace(g_u,g_urg&s_umxg&g_urg&eafsn&g_urz,g_urz)
ew_bt=ep_mc&","&ew_bt:ew_zt=ep_mc&","&ew_zt:ew_nr=ep_mc&","&ew_nr
e_mt=esbts(ep_sx,ep_el,ep_mc&g_gy&eshref(easduq&ep_sn&g_urz,1),"<i>"&s_umtjs&ep_dm&"</i>"&g_gy&easdur&g_gx&ep_dm&s_umlbs&g_gy&easdul)
if not aibj(ef_sn,s_umqb) and ef_sn<>"" then
ew_bt=ef_bt&","&ew_bt:ew_zt=ef_bt&","&ew_zt:ew_nr=ef_bt&","&ew_nr
e_mt=esbts(ep_sx,ep_el,ef_bt&g_gy&eshref(easduq&ep_sn&g_urg&ef_sn&g_urz,1),"<i>"&s_umtjs&ep_dm&"</i>"&g_gy&easdur&g_gx&ep_dm&s_umlbs&g_gy&easdul)
end if
end if
e_wl=e_wl&"<li>"&s_umxgs&ep_dm&"</li>"
else
if left(eafqh,1)="7" then
'uk_mc=s_udeas
e_mt=esbts(s_udxea,s_udlea,s_udeas,"")
end if
e_wl=e_wl&"<li>"&uk_mc&" "&s_umxgs&"</li>"
end if

if not ainull(eafsn) and len(eafsn)<50 then

if esky(1,aiint(easdqx)) then
if epzsd(0,ep_zs) or e_gdj>3 then
if gysfm(ealie("form"),eabiao,"ai_id="&aiint(aireq("id"))&" or (ai_id<>"&aiint(aireq("id"))&" and ai_sn='"&aistr(aireq("sn"))&"')","ai_",2) then
Call gysfm(ealie("formx"),eabiao&"_"&aireq("sb"),"ai_sn='"&aistr(aireq("sny"))&"'","ai_",2)
e_ma=e_ma&aitiao(s_umxgs&ep_dm&s_ztcg,easdul,i_nmtz)
if left(eafqh,1)="7" and e_gdj>2 then e_ma=e_ma&eskod(11,11,aireq("ep")&g_apj&esnf(aireq("ef"))&g_apj&aireq("sn"))
else
e_ma=e_ma&aigo(s_umxgs&ep_dm&s_ztsb&"(不存在或重复的"&ep_dm&"SN编码"&aistr(aireq("sn"))&")",1)
end if
else
e_ma=e_ma&aigo(s_umxgs&ep_dm&s_ztsb,1)
end if
else

'if aibj(eafty,s_umxg) then
if IsNumeric(eafsn) then
eawhere="ai_id="&aiint(eafsn)&""
else
eawhere="ai_sn='"&aitit(eafsn)&"'"
end if
if (left(eafqh,1)="7" and e_gdj<1 and ew_sh=0) or e_gdj>1 then

elseif e_uer<>"" then
eawhere=eawhere&" and ai_xy<2 and ai_us='"&e_uer&"'"
elseif aiip()<>"" then
eawhere=eawhere&" and ai_xy<2 and ai_us IS NULL and ai_um='"&aiip()&"'"
end if
'response.Write eawhere
if gysread(ealie("all"),eabiao,eawhere,"") then
ew_bt=ai_bt&","&ew_bt:ew_zt=ai_bt&","&ai_eq&","&ew_zt:ew_nr=ai_bt&","&ew_nr:ew_cp=ai_us&","&ai_ee&","&ew_cp
if aiint(ai_sb)>0 then Call gysread(ealie("allx"),eabiao&"_"&ai_sb,"ai_sn='"&ai_sn&"'","")
'=================================================EDIT
e_ma=eaform(eafqh,eafty,eafsn)&e_ma
else
e_ma=e_ma&aigo("无权操作或"&ep_dm&s_ztno,1)
end if

end if

else
Response.Redirect(e_lj0)
end if
else
e_ma=e_ma&aigo(s_umxgs&ep_dm&s_ztsb,1)
end if
End Function
'-----------------------------------
'del
'=eadel()
'-----------------------------------
Function eadel(eafqh,eafty,eafid,eafsn)
dim easdur,easduq,easdul,easdqx,easdwhex
if ew_sh=1 then
easdqx=1
else
if left(eafqh,1)="3" then
easdqx=e_uzy
else
easdqx=e_gdj
end if
end if
if aiint(easdqx)>0 then
easdur=replace(g_u,s_umsc&g_urg&eafid&g_urg&eafsn&g_urz,s_umtj&g_urz)
easdul=replace(g_u,g_urg&s_umsc&g_urg&eafid&g_urg&eafsn&g_urz,""&g_urz)

if left(eafqh,1)="3" and len(eafqh)=3 then
Call ukread(g_u2)
ew_bt=uk_bt&","&ew_bt:ew_zt=uk_zt&","&ew_zt:ew_nr=uk_co&","&ew_nr
e_wl="<li><a href="""&eshrej("",uk_ur,"",1)&""">"&uk_mc&"</a></li>"
e_mt=esbts(s_udxuk,s_udluk,uk_mc&g_gy&eshrej("",uk_ur,"",1),uk_mc&s_umtjs&g_gy&easdur&g_gx&uk_mc&s_umlbs&g_gy&easdul)
easduq=s_umgl&g_urg&s_udukw&g_urg&uk_ur&g_urg
elseif left(eafqh,1)="3" and len(eafqh)=2 then
Call ukread(g_u1)
ew_bt=uk_bt&","&ew_bt:ew_zt=uk_zt&","&ew_zt:ew_nr=uk_co&","&ew_nr
e_wl="<li><a href="""&eshrej("",uk_ur,"",1)&""">"&uk_mc&"</a></li>"
e_mt=esbts(s_udxuk,s_udluk,uk_mc&g_gy&eshrej("",uk_ur,"",1),uk_mc&s_umtjs&g_gy&easdur&g_gx&uk_mc&s_umlbs&g_gy&easdul)
easduq=s_udukw&g_urg&uk_ur&g_urg
elseif left(eafqh,1)="7" and len(eafqh)=3 then
easduq=s_umgl&g_urg
end if

easdwhex=esrew("ai",ew_sn)

if right(eafqh,1)<>"2" then
if not aibj(ep_sn,s_umqb) and ep_sn<>"" then
easdul=replace(g_u,s_umsc&g_urg&eafid&g_urg&eafsn&g_urz,efhrl(ep_ls)&g_urz)
ew_bt=ep_mc&","&ew_bt:ew_zt=ep_mc&","&ew_zt:ew_nr=ep_mc&","&ew_nr
e_wl=e_wl&"<li><a href="""&eshref(easduq&ep_sn&g_urz,1)&""">"&ep_mc&"</a></li>"
e_mt=esbts(ep_sx,ep_el,ep_mc&g_gy&eshref(easduq&ep_sn&g_urz,1),s_umtjs&ep_dm&g_gy&easdur&g_gx&ep_dm&s_umlbs&g_gy&easdul)
easdwhex=easdwhex&" and ai_ep='"&ep_sn&"'"
if not aibj(ef_sn,s_umqb) and ef_sn<>"" then
ew_bt=ef_bt&","&ew_bt:ew_zt=ef_bt&","&ew_zt:ew_nr=ef_bt&","&ew_nr
e_wl=e_wl&efwl(eshref(easduq&ep_sn&g_urg&g_gg&g_urz,1),ef_sn,ef_bt)
e_mt=esbts(ep_sx,ep_el,ef_bt&g_gy&eshref(easduq&ep_sn&g_urg&ef_sn&g_urz,1),s_umtjs&ep_dm&g_gy&easdur&g_gx&ep_dm&s_umlbs&g_gy&easdul)
easdwhex=easdwhex&" and ai_ef='"&ef_sn&"'"
end if
end if
e_wl=e_wl&"<li>"&s_umscs&ep_dm&"</li>"
else
if left(eafqh,1)="7" then
'uk_mc=s_udeas
e_mt=esbts(s_udxea,s_udlea,s_udeas,"")
end if
e_wl=e_wl&"<li>"&uk_mc&" "&s_umscs&"</li>"
end if

if aibj(eafty,s_umsc&"-x") then
if left(eafqh,1)="3" then easdwhex=easdwhex&" and ai_us='"&e_uer&"' and ai_xy<2"
if gysdel(eabid,eabiao,easdwhex) then
e_ma=e_ma&aitiao(s_umqbs&easdwhex&s_umscs&s_ztcg,replace(g_u,g_urg&s_umsc&"-x",g_urg&d_seals),i_nmtz)
if left(eafqh,1)="7" then e_ma=e_ma&eskod(11,0,ep_sn&g_apj&ef_sn)
else
e_ma=e_ma&aigo(s_umqbs&s_umscs&s_ztsb,1)
end if

elseif not ainull(eafsn) and len(eafsn)<50 then
'if aibj(eafty,s_umsc) then
if IsNumeric(eafid) then
eawhere="ai_id="&aiint(eafid)&""
else
eawhere="ai_sn='"&aitit(eafsn)&"'"
end if
if left(eafqh,1)="3" or (e_gdj<2 and e_uer<>"") then eawhere=eawhere&" and ai_us='"&e_uer&"' and ai_xy<2"
if (left(eafqh,1)="7" and e_gdj>1) or left(eafqh,1)="3" or (e_gdj<2 and e_uer<>"") then
Call gysread("ai_sb,ai_sn",eabiao,eawhere,"")
Call gysdel("ai_sn",eabiao&"_"&aiint(ai_sb),"ai_sn='"&ai_sn&"'")
if gysdel(eabid,eabiao,eawhere) then
if p_upwdr<>"" then
Call ankop(0,1,0,p_upwdr&replace(replace(esupcc(ep_sn,eafsn),p_upifh,p_upijj)&eafsn,"/","\"))
else
Call ankop(0,1,0,i_dir&replace(esupcc(ep_sn,eafsn),p_upifh,p_upijj)&eafsn)
end if
if aibj(g_u0,s_umgl) and aibj(left(g_u1,len(s_umsc)),s_umsc) then easdul=replace(g_u,g_urg&s_umsc&g_urg&eafid&g_urg&eafsn,g_urg&d_seals)
e_ma=e_ma&aitiao(s_umxgs&ep_dm&s_ztcg,easdul,i_nmtz)
'if left(eafqh,1)="7" then e_ma=e_ma&eskod(11,0,ep_sn&g_apj&esnf(esqef)&g_apj&eafsn)
else
e_ma=e_ma&aigo(ep_dm&s_umscs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo("无权删除或"&ep_dm&s_umscs&s_ztsb,1)
end if
end if

else
e_ma=e_ma&aigo(ep_dm&s_ztno,1)
end if
End Function
'-----------------------------------
'es post
'=eaxqw()
'-----------------------------------
Function eaxqw(eafep,eafqw)
eaxqw=false
if not ainull(eafep) then
'开放投稿|1注册投稿|2审核投稿|3认证投稿|4高级投稿|5禁止投稿
if eafqw=0 or e_gdj>0 then
eaxqw=true
elseif eafqw=1 and e_uer<>"" then
eaxqw=true
elseif eafqw=2 and e_uxy>ew_sh then
eaxqw=true
elseif eafqw=3 and e_uzy>1 then
eaxqw=true
elseif eafqw=4 and e_uzy>2 then
eaxqw=true
end if
end if
End Function
'-----------------------------------
'show
'=eashow()
'-----------------------------------
Function eashow(eafqh,eafty,eafsn)
if not ainull(eafsn) and len(eafsn)<50 then
eafsn=aitit(eafsn)
if aibj(eafty,"11") then
e_ma=xppifr(eafsn)
else
'where
if left(eafqh,1)="3" then
if ainull(uk_us) then
if aibj(g_u0,s_umgl) then
Call doq(4,g_u2,2,g_u0,g_u3,g_u4)
else
Call doq(4,g_u1,2,g_u0,g_u2,g_u3)
end if
end if
eawhere="ai_sn='"&eafsn&"' and ai_us='"&uk_us&"'"
elseif ((left(eafqh,1)="7" or left(eafqh,1)="3") and len(eafqh)=3 and e_gdj>0) or aibj(eafty,"11") or e_gdj>2 or e_uxy>2 then
eawhere="ai_sn='"&eafsn&"'"
elseif not ainull(e_uer) then
eawhere="ai_sn='"&eafsn&"' and (ai_us='"&e_uer&"' or ai_xy>0)"
else
eawhere="ai_sn='"&eafsn&"' and ai_xy>0"
end if

g_app=esapm(1,eafsn)
if len(eafqh)=3 then g_app=""
if gysread(ealie("all"),eabiao,eawhere,g_app) then

ai_sb=aiint(ai_sb)
if ai_sb>0 then
if g_app<>"" then g_app=g_app&"_"&ai_sb
Call gysread(ealie("allx"),eabiao&"_"&ai_sb,"ai_sn='"&ai_sn&"'",g_app)
end if

if left(eafqh,1)<>"3" or ainull(ep_sn) then Call doq(1,ai_us,0,g_u0,ai_ep,ai_ef)
dim easduq,easdur
if aibj(eafty,"0") then
easdur=ep_dm&s_umxxs&g_gy&replace(g_u,s_umzs&g_urg,s_umxx&g_urg)
if eaxqw(ep_sn,ep_qw) then easdur="<i>"&s_umfbs&ep_dm&"</i>"&g_gy&replace(g_u,s_umzs&g_urg,s_umfb&g_urg)&g_gx&easdur
if esxbj(ep_sn,ai_xy,ai_us,ai_um) then easdur="<u>"&s_umxgs&"</u>"&g_gy&replace(g_u,s_umzs&g_urg,s_umxg&g_urg)&g_gx&easdur
else
easdur=ep_dm&s_umzss&g_gy&replace(g_u,s_umxx&g_urg,s_umzs&g_urg)
if eaxqw(ep_sn,ep_qw) then easdur="<i>"&s_umfbs&ep_dm&"</i>"&g_gy&replace(g_u,s_umxx&g_urg,s_umfb&g_urg)&g_gx&easdur
if esxbj(ep_sn,ai_xy,ai_us,ai_um) then easdur="<u>"&s_umxgs&"</u>"&g_gy&replace(g_u,s_umxx&g_urg,s_umxg&g_urg)&g_gx&easdur
end if

if left(eafqh,1)="3" and len(eafqh)=3 then
e_mt=esbts(ep_sx,ep_el,uk_mc&g_gy&eshrej("",uk_ur,"",1),"")
easduq=s_umgl&g_urg&s_udukw&g_urg&uk_ur&g_urg
elseif left(eafqh,1)="3" and len(eafqh)=2 then
e_mt=esbts(s_udxuk,s_udluk,uk_mc&g_gy&eshrej("",uk_ur,"",1),"")
easduq=s_udukw&g_urg&uk_ur&g_urg
elseif left(eafqh,1)="7" and len(eafqh)=3 then
easduq=s_umgl&g_urg
end if
if right(eafqh,1)<>"2" then
if not aibj(ep_sn,s_umqb) and ep_sn<>"" then
e_mt=esbts(ep_sx,ep_el,ep_mc&g_gy&eshref(easduq&ep_sn&g_urz,1),easdur)
if not aibj(ef_sn,s_umqb) and ef_sn<>"" then
e_mt=esbts(ep_sx,ep_el,ef_bt&g_gy&eshref(easduq&ep_sn&g_urg&ef_sn&g_urz,1),easdur)
end if
end if
if aibj(eafty,"0") then
e_wl=e_wl&"<li>"&ep_dm&s_umxxs&"</li>"
else
e_wl=e_wl&"<li>"&s_umzss&ep_dm&"</li>"
end if
else
if left(eafqh,1)="7" or left(eafqh,1)="3" then
'uk_mc=s_udeas
e_mt=esbts(s_udxea,s_udlea,s_udeas,"")
end if
if aibj(eafty,"0") then
e_wl=e_wl&"<li>"&uk_mc&" "&s_umxxs&"</li>"
else
e_wl=e_wl&"<li>"&s_umzss&" "&uk_mc&"</li>"
end if
end if
e_ma=e_ma&easshow(eafqh,eafty,eafsn)
else
e_ma=e_ma&aitiao("抱歉，不存在的编码！",e_lj0,i_nmtz)
end if
end if
else
e_ma=e_ma&aitiao("抱歉，不符合要求的编码请求！",e_lj0,i_nmtz)
end if
End Function
'-----------------------------------
'list
'=ealist()
'-----------------------------------
Function ealist(eafqh,eafuq,eafef,eafls,eafpg,eafps,eafph)
dim eadqx,eadqxyz,eadity,eaduqs,eadtj,eadljs,eadxpur,eadxpms,eadxpum,easdur
if len(eafqh)=3 then
eadxpum=77
elseif left(eafqh,1)="5" then
eadxpum=55
elseif left(eafqh,1)="3" then
eadxpum=66
elseif left(eafqh,1)="7" then
eadxpum=1
end if

if not ainull(eafef) and not aibj(eafef,s_umqb) and not aibj(eafef,"0") then
eaduqs=eafuq&g_urg&eafef
eadljs=eshref(eafuq&g_urg&eafef&g_urz,eadxpum)
elseif ainull(eafuq) then
eaduqs=""
eadljs=eshref("",eadxpum)
else
eaduqs=eafuq
eadljs=eshref(eafuq&g_urz,eadxpum)
end if

if ainull(eafls) then
if right(eafqh,1)<>"2" then
eadxpms=efhrl(ep_ls)
else
eadxpms=d_seals
end if
else
eadxpms=eafls
end if

if aibj(g_u0,s_udukw) and (ainull(g_u2) or aibj(g_u2,s_umqb)) then eaduqs=eaduqs&s_umqb

if eaduqs<>"" then
eadtj=eshref(eaduqs&g_urg&s_umtj&g_urz,eadxpum)
eadxpur=eshref(eaduqs&g_urg&eadxpms&g_urg&g_gp&g_urg&g_gp&g_urg&eafph&g_urz,eadxpum)
else
eadtj=eshref(s_umtj&g_urz,eadxpum)
eadxpur=eshref(eadxpms&g_urg&g_gp&g_urg&g_gp&g_urg&eafph&g_urz,eadxpum)
end if

if left(eafqh,1)="5" then eadtj=replace(eadtj,s_umso&g_urg,"")

eadqx=0
if len(eafqh)=3 then
eadity=1
else
eadity=0
end if
if left(eafqh,1)="3" then
eadqxyz=aiint(e_uxy)
if eadqxyz>4 then
eadqx=2
elseif eadqxyz>2 then
eadqx=1
end if
eadqxyz=0
else
eadqxyz=aiint(e_gdj)
if eadqxyz>2 then
eadqx=2
elseif eadqxyz>1 then
eadqx=1
end if
end if

if right(eafqh,1)<>"2" then

if eaxqw(ep_sn,ep_qw) then easdur="<i>"&s_umfbs&ep_dm&"</i>"&g_gy&eshref(ep_sn&g_urg&eafef&g_urg&s_umfb&g_urz,1)
if not aibj(ep_sn,s_umqb) and ep_sn<>"" then
e_mt=esbts(ep_sx,ep_el,ep_mc&g_gy&eshref(eafuq&g_urz,1),easdur)
if not aibj(ef_sn,s_umqb) and ef_sn<>"" then
e_mt=esbts(ep_sx,ep_el,ef_bt&g_gy&eadljs,easdur)
end if
end if
end if
if ainull(e_mt) then
if aibj(left(eafqh,1),"5") then
e_mt=esbts(s_udxea,s_udlea,ew_mc&" 整站内容列表","")
elseif left(eafqh,1)="3" then
e_mt=esbts(s_udxuk,s_udluk,uk_mc&g_gy&eadljs,"")
else
e_mt=esbts(s_udxea,s_udlea,s_udeas&" 列表","")
end if
end if

if instr(lcase(g_ud)&"/",s_drwap)>0 then eadxpum=1
e_mz=e_mz&easlist(eafqh,eafuq,eafef,eafpg,eafps,eafph,eadqx,eadqxyz,eadity,eaduqs,eadxpur,eadxpms,eadxpum)
e_ma=e_ma&e_mx&e_mzs&e_mz
if not ainull(icvss) then
ew_bt=icvss&","&ew_bt:ew_zt=icvss&","&ew_zt:ew_nr=icvss&","&ew_nr
e_wl=e_wl&"<li>含关键词["&icvss&"]的"&ep_dm&s_umlbs&"</li>"
if aibj(left(eafqh,1),"5") then e_mt=esbts(s_udxea,s_udlea,"含关键词["&icvss&"]的"&s_udeas&s_umlbs&"","")
else
if aibj(left(eafqh,1),"5") then
e_wl=e_wl&"<li>整站内容"&s_umlbs&"</li>"
elseif left(eafqh,1)="3" then
if ainull(ep_dm) then ep_dm="公开"
e_wl=e_wl&"<li>"&ep_dm&s_umlbs&"</li>"
else
e_wl=e_wl&"<li>"&ep_dm&s_umlbs&"</li>"
end if
end if

End Function


'-----------------------------------
'=aiss()
'Call aiss()
'-----------------------------------
Function aiss(eafel,eafty)
dim icdspx,icdsfx,icdsxx
icdssp="排序|浏览|我顶|排序|推荐|时间|更新|榜单|榜次|正序|"
icdspx="ai_id desc|ai_hi desc|ai_xi desc|ai_px desc|ai_xy desc|ai_tm desc|ai_t1 desc|ai_bd desc|ai_bc desc|ai_id asc|"
if aibj(eafel,"2") or aibj(eafel,"10") or aibj(eafel,"12") then
icdssp=icdssp&"售价|原价|"
icdspx=icdspx&"ai_jg desc|ai_jy desc|"
end if
if aibj(eafel,"10") or aibj(eafel,"12") then
icdssp=icdssp&"已售|库存|"
icdspx=icdspx&"ai_oy desc|ai_oz desc|"
end if
if aibj(eafel,"13") then
icdssp=icdssp&"底价|高价|已收|需量|"
icdspx=icdspx&"ai_jg desc|ai_jy desc|ai_oy desc|ai_oz desc|"
end if
icdssf="范围|图片|推荐|三星|四星|五星|"
icdsfx="|ai_up<>''|ai_xy>1|ai_xy>2|ai_xy>3|ai_xy>4|"
icdssf=icdssf&"图荐|新百|"
icdsfx=icdsfx&"T102|T100|"
icdssf=icdssf&"新图|随机|"
Randomize
icdsfx=icdsfx&"T101|T"&left(int(day(date())*888888*Rnd)&"000",2)&"1|"
icdssf=icdssf&esqday(0)&"|"
icdsfx=icdsfx&esqday("ai_tm")&"|ai_xy=1|ai_xy=0|(ai_us<>'' and ai_us='"&e_uer&"')|"
if e_gdj>2 then icdssf=icdssf&"普通|禁用|"

icdssx="项目|标题|简介|摘要|标签|会员|发布|小编|编码|"
icdsxx="ai_bt|ai_bt|ai_jj|ai_ss|ai_eq|ai_us|ai_um|ai_ee|ai_tm|ai_t1|ai_sn|"
if e_gdj>2 then icdssx=icdssx&"时间|更新|"

if right(icdssp,1)="|" then icdssp=left(icdssp,len(icdssp)-1)
if right(icdssf,1)="|" then icdssf=left(icdssf,len(icdssf)-1)
if right(icdssx,1)="|" then icdssx=left(icdssx,len(icdssx)-1)
icdssm=i_bsm
icdrrp=split(icdspx,"|")
icdrrf=split(icdsfx,"|")
icdrrx=split(icdsxx,"|")
End Function
'-----------------------------------
'=aitj(eafstr=频道ep/1分类ef/2排序ssp/3范围ssf/4项目ssx/5模式ssm/6关键词sss,eaffl=分类样式-多选分类|单选分类,eafty)
'-----------------------------------
Function aitj(eafstr,eaffl,eafty)
dim icdarr,icdsep,icdsef
icdarr=split(eafstr&"//////","/")
eawhere="6=6"
eaorder=eaordermo
'RESPONSE.Write eafstr
'do str
icdsep=trim(icdarr(0))
if aibj(icdsep,s_umqb) or aibj(icdsep,"0") or dkdir(0,icdsep) then icdsep=""
icdsef=trim(icdarr(1))
if aibj(icdsef,s_umqb) or aibj(icdsef,"0") or dkdir(0,icdsef) then icdsef=""
icvsp=aiint(icdarr(2))
icvsf=aiint(icdarr(3))
icvsx=aiint(icdarr(4))
icvsm=aiint(icdarr(5))
icvss=aijie(trim(icdarr(6)))
if aibj(icvss,s_umqb) or aibj(icvss,"0") or dkdir(0,icvss) or aibj(s_ztks,icvss) then icvss=""

'ep
if icdsep<>"" then eawhere=eawhere&" and ai_ep='"&icdsep&"'"

'ef
if icdsef<>"" then
dim icdfvi,icdfvrr,icdfvrrx,icdfvrrxu,icdfvrrxi,icdfvrrxw
'----------------------------------ef0
if aiint(eaffl)>0 then
if len(icdsef&"0")>3 then
icdfvrr=split(icdsef,g_ura)
for icdfvi=0 to ubound(icdfvrr)
if not aibj(icdsef,s_umqb) and icdfvrr(icdfvi)<>"" then
eawhere=eawhere&" and "
if left(icdfvrr(icdfvi),1)="0" then
'★★★★★this do for tags 0
dim ealtlie,ealtliez,ealtliezrr
ealtlie=right(left(icdfvrr(icdfvi),3),2)
if instr("xy,px,hi,xi,bd,bc,jg,jy,oz,oy",ealtlie)>0 then
ealtliez=right(icdfvrr(icdfvi),len(icdfvrr(icdfvi))-3)
ealtliezrr=split(ealtliez&"-","-")
if ealtliezrr(0)=ealtliezrr(1) then
eawhere=eawhere&"ai_"&ealtlie&"="&aiint(ealtliezrr(0))&""
elseif ealtliezrr(0)<>"" and ealtliezrr(1)<>"" then
eawhere=eawhere&"ai_"&ealtlie&">="&aiint(ealtliezrr(0))&" and ai_"&ealtlie&"<="&aiint(ealtliezrr(1))&""
elseif ealtliezrr(0)<>"" then
eawhere=eawhere&"ai_"&ealtlie&">="&aiint(ealtliezrr(0))&""
elseif ealtliezrr(1)<>"" then
eawhere=eawhere&"ai_"&ealtlie&"<="&aiint(ealtliezrr(1))&""
else
eawhere=eawhere&icdfvi&"="&icdfvi
end if
else
if not aibj(icdfvrr(icdfvi),s_umqb) then
eawhere=eawhere&"ai_ef like '"&icdfvrr(icdfvi)&"%'"
else
eawhere=eawhere&"6=6"
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
if icdfvrrx(icdfvrrxi)<>"" and not aibj(icdfvrrx(icdfvrrxi),s_umqb) then icdfvrrxw=icdfvrrxw&"ai_ef like '%"&icdfvrrx(icdfvrrxi)&"%'"
next
if icdfvrrxw<>"" then
eawhere=eawhere&"("&icdfvrrxw&")"
else
eawhere=eawhere&icdfvi&"="&icdfvi
end if
else
if not aibj(icdfvrr(icdfvi),s_umqb) then
eawhere=eawhere&"ai_ef like '%"&icdfvrr(icdfvi)&"%'"
else
eawhere=eawhere&"6=6"
end if
end if
end if
end if
next
end if
'cdv 1
else
'ef
'eawhere="ai_ef='"&icdsef&"'"&eawhere
eawhere=eawhere&" and ai_ef like '"&icdsef&"%'"
end if
'----------------------------------ef1
end if

'sp
if icvsp>0 then eaorder=icdrrp(icvsp)

'ss
if icvss<>"" then
dim icvssrr,icvssi,icvssud,icvsslin
icvssrr=split(icvss,",")
icvssud=ubound(icvssrr)
icvsslin=""
for icvssi=0 to icvssud
if icvsslin<>"" then
if icvsm=0 then
icvsslin=icvsslin&" and "
else
icvsslin=icvsslin&" or "
end if
end if
if icvssrr(icvssi)<>"" then
if icvsm=2 then
icvsslin=icvsslin&icdrrx(icvsx)&"='"&icvssrr(icvssi)&"'"
else
icvsslin=icvsslin&icdrrx(icvsx)&" like '%"&icvssrr(icvssi)&"%'"
end if
end if
next
if icvsslin<>"" then
eawhere=eawhere&" and ("&icvsslin&")"
end if
g_app=""
iclapp=1
else
g_app="P_"&icdsep&g_apj&"F_"&icdsef&"_"&eaffl&"X_"&icvsp&"W_"&icvsf
iclapp=0
end if

'admin
if (aibj(g_u0,s_umgl) and e_gdj>2) or icvsf=19 then
if instr(eawhere,"ai_xy>0")>0 then eawhere=replace(eawhere," and ai_xy>0","")
else
if instr(eawhere,"ai_xy>0")=0 then eawhere=eawhere&" and ai_xy>0"
end if

'ew
if aiint(ew_sn)>0 then eawhere=eawhere&" and "&esrew("ai",ew_sn)

eawhere=replace(replace(eawhere,"6=6 and ","")," and 6=6","")

'sf
if icvsf>0 then
if icvsf=99 then'最新推荐调用
if eawhere<>"" then eawhere=eawhere&" and "
	eawhere=eawhere&"ai_id in (select top 100 ai_id from "&w_dbqz&"ai where ai_xy>1 order by ai_id desc)"
	if eaorder<>"" then
	if instr(eaorder,"_id")=0 then eaorder=eaorder&",ai_id desc"
	else
	eaorder="ai_id desc"
	end if
	if ep_dm="" then ep_dm="内容"
elseif icvsf=98 then'特殊调用
if eawhere<>"" then eawhere=eawhere&" and "
eawhere=eawhere&"ai_id in (select top 58 ai_id from "&w_dbqz&"ai where ai_xy>1 order by ai_id desc)"
else
dim icvsflin
icvsflin=icdrrf(icvsf)
if left(icvsflin,1)="T" then
	if right(icvsflin,1)="2" then
	eawhere=replace(replace(eawhere," and ai_xy>1","")," and ai_up<>''","")
	if eawhere<>"" then eawhere=eawhere&" and "
	eawhere=eawhere&"ai_xy>1 and ai_up<>''"
	elseif right(icvsflin,1)="1" then
	eawhere=replace(eawhere," and ai_up<>''","")
	if eawhere<>"" then eawhere=eawhere&" and "
	eawhere=eawhere&"ai_up<>''"
	end if
	icvsflin=right(icvsflin,len(icvsflin)-1)
	eawhere="ai_id in (select top "&aiint(icvsflin)&" ai_id from "&w_dbqz&"ai where "&eawhere&" order by ai_id desc)"
	'if icvsp>0 then eawhere="ai_id in (select top 100 percent ai_id,"&split(icdrrp(icvsp)," ")(0)&" from "&w_dbqz&"ai where "&eawhere&" order by "&icdrrp(icvsp)&")"
else
	if eawhere<>"" then eawhere=eawhere&" and "
	eawhere=eawhere&icvsflin
end if
end if
end if
'response.Write eawhere&"<br><br>"
'eawhere=""
End Function
%>