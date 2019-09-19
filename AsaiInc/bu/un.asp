<%
'@@0manage/1s_udun/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_udun/2edit|add|del/3*id.HTML

'@@0s_udun/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_udun/1edit|add/2*id.HTML
'@@0s_udun/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_udun) or aibj(g_u1,s_udun)) then
e_xa=e_xa+1
Call epread(s_udun)
e_sks=1
Call esq()
if aibj(g_u0,s_umgl) then
Call doq(1,e_uer,63,g_u0,s_udun,g_u2)
else
Call doq(1,e_uer,63,g_u0,s_udun,g_u1)
end if

if e_gdj>2  and aibj(g_u0,s_umgl) then
if aibj(g_u1,s_udun) and aibj(g_u3,s_umtj) then
Call unadd(1)
elseif aibj(g_u1,s_udun) and aibj(g_u3,s_umxg) and aiint(g_u4)>0 then
Call unedit(1)
elseif aibj(g_u1,s_udun) and aibj(g_u3,s_umsc) and aiint(g_u4)>0 then
Call undel(1)
elseif aibj(g_u1,s_udun) and dkdir(2,g_u3) then
Call efread(g_u2)
Call unlist(1)
end if
else
if aibj(g_u0,s_udun) and aibj(g_u2,s_umtj) then
Call unadd(0)
elseif aibj(g_u0,s_udun) and aibj(g_u2,s_umxg) then
Call unedit(0)
elseif aibj(g_u0,s_udun) and aibj(g_u2,s_umsc) then
Call undel(0)
elseif aibj(g_u0,s_udun) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) then
Call unshow(0)
elseif aibj(g_u0,s_udun) and dkdir(2,g_u2) then
Call efread(g_u1)
Call unlist(0)
end if
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","un")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=unlie()
'-----------------------------------
Function unlie(unfty)
if unfty="form" then
unlie="sn,bt,nr,up,us,uz,sl,tm,ef,xy,uc,xt"
elseif unfty=s_umlb then
unlie="un_id,un_sn,un_bt,un_up,un_us,un_uz,un_sl,un_tm,un_ef,un_xy"
elseif unfty="all" then
unlie="un_id,un_sn,un_bt,un_nr,un_up,un_us,un_uz,un_sl,un_tm,un_ef,un_xy,un_uc,un_xt"
end if
End Function
'-----------------------------------
'un menu
'=unme()
'-----------------------------------
Function unme()
unme="<div class=""l-ra""><ul>"
dim unmrr,unmi
unmrr=split(i_bunxy,"|")
unme=unme&"<li class=""pt"">"
unme=unme&""&iclbico(0,"tag",1)&"<a"
if ainull(g_u1) or (aibj(s_umgl,g_u0) and ainull(g_u2)) then unme=unme&" class=""l-va"""
unme=unme&" href="""&eshref(s_udun&g_urz,1)&""">"&s_umqbs&s_uduns&"</a></li>"
unme=unme&"<li class=""l-1 pt"">"&iclbico(0,"tag",1)&"<a"
if aibj("1",g_u10) then unme=unme&" class=""l-va"""
unme=unme&" href="""&eshref(s_udun&g_urg&g_u1&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"1"&g_urz,1)&""">我创建的"&s_uduns&"</a></li>"
unme=unme&"<li class=""pt"">"&iclbico(0,"tag",1)&"<a"
if aibj("2",g_u10) then unme=unme&" class=""l-va"""
unme=unme&" href="""&eshref(s_udun&g_urg&g_u1&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"2"&g_urz,1)&""">当群主的"&s_uduns&"</a></li>"
unme=unme&"<li class=""l-1 pt"">"&iclbico(0,"tag",1)&"<a"
if aibj("3",g_u10) then unme=unme&" class=""l-va"""
unme=unme&" href="""&eshref(s_udun&g_urg&g_u1&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"3"&g_urz,1)&""">我加入的"&s_uduns&"</a></li>"
for unmi=ubound(unmrr) to 0 step -1
if unmi mod 2=0 then
unme=unme&"<li class=""l-1 pt"">"
else
unme=unme&"<li class=""pt"">"
end if
unme=unme&""&iclbico(0,"tag",1)&"<a"
if aibj(g_u10,"100"&unmi) then unme=unme&" class=""l-va"""
unme=unme&" href="""&eshref(s_udun&g_urg&g_u1&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"100"&unmi&g_urz,1)&""">群聚等级："&unmrr(unmi)&"</a></li>"
next
unme=unme&"</ul></div>"
End Function
'-----------------------------------
'add/edit form
'=unform()
'-----------------------------------
Function unform(unfty,unfqx)
if unfty=0 then
un_sn="UN"&aisn(1)
un_us=e_uer
un_sl=0
un_tm=now()
if unfqx=1 then
un_ef=g_u2
else
un_ef=g_u1
end if
un_xt=espxx(s_umtjs&i_gg&e_uer)
else
un_xt=un_xt&espxx(s_umxgs&i_gg&e_uer)
end if
unform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
if unfqx=1 then
unform=unform&icflsr(5,"标题","","bt","",0,200,"*群标题","",un_bt)&icflsr(25,"编码","","sn","",3,50,"*编码","",un_sn)&icflxz(25,"状态","xy","","*","f-s",un_xy,0,i_bunxy)
unform=unform&icflsr(25,"创人","","us","",66,50,"*群创始人","",un_us)&icflsr(25,"群主","","uz","",0,200,"*群主们，多个群主使用,号隔开（注意：群主前后都得要加逗号,）","",un_uz)&icflsr(25,"人数","","sl","",6,50,"群内人数","",un_sl)&icflsr(25,"时间","","tm","",99,200,"*","",un_tm)&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script></li>"
unform=unform&icflot(10,"标志",aiinput("","up","",0,200,"群标志图片","f-up",un_up)&esup("0|1|"&un_sn&"|"&esupcc(s_udun,un_sn)&"|0|AsaiForm|up|7|"&ew_ps&"|0|0.ees"))
unform=unform&icflwb(10,"成员","uc","","",0,8000,"群成员代码","",un_uc)
unform=unform&icflot(10,"分类",efselect(0,i_xkfl,"ef",s_udun,un_ef))
unform=unform&icflot(10,"内容",esedit(esnr(un_nr),"nr",8))
unform=unform&"</ul><ul>"&icflot(10,"点评",eseditxt(un_xt,"xt",1))
else
unform=unform&icflsr(10,"标题","","bt","",0,200,"*群标题","",un_bt)
if ainull(un_ef) then
unform=unform&icflot(10,"分类",efselect(0,i_xkfl,"ef",s_udun,un_ef))
else
unform=unform&aiinput("hidden","ef","",0,0,"","",un_ef)
end if
unform=unform&icflsr(10,"群主","","uz","",0,200,"*群主们，多个群主使用,号隔开（注意：群主前后都得要加逗号,）","",un_uz)
unform=unform&icflot(10,"标志",aiinput("","up","",0,200,"群标志图片","f-up",un_up)&esup("0|1|"&un_sn&"|"&esupcc(s_udun,un_sn)&"|0|AsaiForm|up|7|"&ew_ps&"|0|0.ees"))
unform=unform&icflot(10,"内容",esedit(esnr(un_nr),"nr",8))
unform=unform&aiinput("hidden","sn","",0,0,"","",un_sn)&aiinput("hidden","us","",0,0,"","",un_us)&aiinput("hidden","tm","",0,0,"","",un_tm)&aiinput("hidden","xy","",0,0,"","",un_xy)&aiinput("hidden","sl","",0,0,"","",un_sl)&aiinput("hidden","uc","",0,0,"","",un_uc)&aiinput("hidden","xt","",0,0,"","",un_xt)
end if
unform=unform&icflot(10,"验证",eskyx(0,1,2))
if unfty=1 then
unform=unform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",un_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif unfty=0 then
unform=unform&icflot(10,"",aibutton(2,"","","f-sb f-skx","添加")&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
unform=unform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=unadd()
'-----------------------------------
Function unadd(unfqx)
ew_bt=s_umtjs&s_uduns&","&ew_bt:ew_zt=s_umtjs&s_uduns&","&ew_zt:ew_nr=s_umtjs&s_uduns&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_uduns&"</a></li>"
e_mt=esbts(ep_sx,s_udlun,s_umtjs&s_uduns&g_gy&e_lj1,s_uduns&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("sn,bt,us") then
if gysfm(unlie("form"),unbiao,"un_sn='"&aistr(aireq("sn"))&"'","un_",1) then
Call aisn(0)
if unfqx=0 then
e_ma=e_ma&aigo(s_umtjs&s_uduns&s_ztcg,1)
else
e_ma=e_ma&aigo(s_umtjs&s_uduns&s_ztcg,e_lj0)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduns&s_ztsb&"[已存在群组编码]",1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_uduns&s_ztsb&"[请填写完整表单]",1)
end if
else
e_ma=unform(0,unfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=unedit()
'-----------------------------------
Function unedit(unfqx)
ew_bt=s_umxgs&s_uduns&","&ew_bt:ew_zt=s_umxgs&s_uduns&","&ew_zt:ew_nr=s_umxgs&s_uduns&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udun&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_uduns&"</a></li>"
e_mt=esbts(ep_sx,s_udlun,s_umxgs&s_uduns&g_gy&eshref(s_umgl&g_urg&s_udun&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_uduns&g_gy&e_lj1&g_gx&s_uduns&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("sn,bt,us") then
if unfqx=1 then
unwhere="un_id="&aiint(aireq("id"))&""
else
unwhere="un_id="&aiint(aireq("id"))&" and un_us='"&e_uer&"'"
end if
if gysfm(unlie("form"),unbiao,unwhere,"un_",2) then
e_ma=e_ma&aigo(s_umxgs&s_uduns&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_uduns&s_ztsb&"[不存在或无权修改]",1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_uduns&s_ztsb&"[请填写完整表单]",1)
end if
else
if unfqx=1 then
unwhere="un_id="&aiint(g_u4)&""
else
unwhere="un_id="&aiint(g_u3)&" and un_us='"&e_uer&"'"
end if
if gysread(unlie("all"),unbiao,unwhere,"") then
ew_bt=un_us&","&ew_bt:ew_zt=un_us&","&ew_zt:ew_nr=un_us&","&ew_nr
e_ma=unform(1,unfqx)&e_ma
else
e_ma=e_ma&aigo(s_uduns&s_ztno&"[不存在或无权修改]",1)
end if
end if
End Function
'-----------------------------------
'del
'=undel(unfqx)
'-----------------------------------
Function undel(unfqx)
ew_bt=s_uduns&s_umscs&","&ew_bt:ew_zt=s_uduns&s_umscs&","&ew_zt:ew_nr=s_uduns&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_uduns&s_umscs&"</li>"
e_mt=esbts(ep_sx,s_udlun,s_umscs&s_uduns,s_umtjs&s_uduns&g_gy&e_lj1&g_gx&s_uduns&s_umlbs&g_gy&e_lj0)
if unfqx=1 then
if e_uxy>2 then
if aiint(g_u3)>0 then
if gysdel(unbid,unbiao,"un_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_uduns&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduns&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(unbid,unbiao,0) then
e_ma=e_ma&aitiao(s_uduns&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduns&s_umscs&s_ztsb,1)
end if
end if
end if

else
if g_u2<>"" then
if gysdel(unbid,unbiao,"un_us='"&e_uer&"' and un_xy<2") then
e_ma=e_ma&aitiao(s_uduns&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduns&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u1,s_umsc&"-x") then
if gysdel(unbid,unbiao,"un_us='"&e_uer&"' and un_xy<2") then
e_ma=e_ma&aitiao(s_uduns&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_uduns&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'show
'=unshow()
'-----------------------------------
Function unshow(unfqx)
if unfqx=1 then
unwhere="un_sn='"&g_u4&"'"
else
unwhere="un_sn='"&g_u3&"'"
end if
if gysread(unlie("all"),unbiao,unwhere,"") then
ew_bt=un_bt&","&usren(un_us)&","&ew_bt:ew_zt=un_bt&","&usren(un_us)&","&ew_zt:ew_nr=un_bt&","&usren(un_us)&","&ew_nr:ew_cp=un_bt&","&usren(un_us)&","&ew_cp
dim undsx,lidgl,undoer
undsx=ep_sx
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li>"&un_bt&"</li>"
'admin 0
lidgl=g_gx&"编辑"&s_uduns&g_gy&eshref(s_umgl&g_urg&s_udun&g_urg&un_ef&g_urg&s_umxg&g_urg&un_id&g_urz,77)&g_gx&"删除"&s_uduns&g_gy&eshref(s_umgl&g_urg&s_udun&g_urg&un_ef&g_urg&s_umsc&g_urg&un_id&g_urz,77)
'admin 1
e_mt=esbts(undsx,s_udlun,s_uduns&s_umxxs,s_uduns&s_umlbs&g_gy&eshref(s_umgl&g_urg&s_udun&g_urg&un_ef&g_urg&d_sunls&g_urz,77)&lidgl)
else
e_wl=e_wl&"<li>"&un_bt&"</li>"
'admin 0
lidgl=""
if aibj(un_us,e_uer)  then lidgl=lidgl&g_gx&"编辑"&s_uduns&g_gy&eshref(s_udun&g_urg&un_ef&g_urg&s_umxg&g_urg&un_id&g_urz,66)
if aibj(un_us,e_uer) and aiint(un_xy)<2 then lidgl=lidgl&g_gx&"删除"&s_uduns&g_gy&eshref(s_udun&g_urg&un_ef&g_urg&s_umsc&g_urg&un_id&g_urz,66)
'admin 1
e_mt=esbts(undsx,s_udlun,s_umzss&s_uduns,s_uduns&s_umlbs&g_gy&eshref(s_udun&g_urg&un_ef&g_urg&d_sunls&g_urz,66)&lidgl)
end if
icdcb=un_bt
'--------------------------------HENG 0
icdcd="创始人："&usren(un_us)&"　成员数："&un_sl&aitms("　创建时间：",un_tm,9)&"　群聚等级："&aiarr(i_bunxy,"|",un_xy)
'--------------------------------HENG 1
if not ainull(un_nr) then icdci=un_nr
icdty=9
e_ma=e_ma&icnr(icdty,s_uduns,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
if not ainull(un_up) then unuzer=unuzer&"<img style=""width:100%"" src="""&esups(un_up,1)&""">"
unuzer=unuzer&unuzx(0,e_uer,un_uz,un_uc,un_id)
if instr(un_uc,i_gg&e_uer&"|")>0 then
if g_u4="91" or g_u4="93" then
undoer=e_uer 
else
undoer=g_u5 
end if
if g_u4="91" or (g_u4="92" and undoer<>"" and instr(un_uz,","&e_uer&",")>0) then
if request.Form("actus")<>"" and request.Form("actgm")<>"" then
if unuzx(2,request.Form("actus"),un_uz,un_uc,un_id) then
e_ma=e_ma&aitiao("恭喜"&undoer&"修改昵称【"&request.Form("actgm")&"】"&s_ztcg,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz)
else
e_ma=e_ma&aitiao("[提示："&undoer&"暂时无法修改]修改昵称【"&request.Form("actgm")&"】"&s_ztsb,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz-1)
end if
else
e_ma=e_ma&"<div class=""c-i tc""><table border=0 cellspacing=0 cellpadding=5 align=center class='gch' width='100%'><form action="""&eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urg&g_u4&g_urg&g_u5&g_urz,66)&""" method=""post""><tr><td align=center>请输入新昵称：<input type=""hidden"" name=""actus"" value="""&undoer&"""><input type=text name=actgm id=actgm maxlength=50 style='width:40%'><input type=""submit"" value=""更改用户["&undoer&"]群内昵称""></td></tr></form></table></div>"
end if
elseif g_u4="93" or (g_u4="94" and undoer<>"" and instr(un_uz,","&e_uer&",")>0) then
if unuzx(4,undoer,un_uz,un_uc,un_id) then
e_ma=e_ma&aitiao(""&undoer&"离开【"&un_bt&"】群聚"&s_ztcg,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz)
else
e_ma=e_ma&aitiao("[提示："&undoer&"暂时无法离开]离开【"&un_bt&"】群聚"&s_ztsb,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz-1)
end if
elseif g_u4="95" and undoer<>"" and instr(un_uz,","&e_uer&",")>0 then
if unuzx(5,undoer,un_uz,un_uc,un_id) then
e_ma=e_ma&aitiao(""&undoer&"提升"&s_ztcg,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz)
else
e_ma=e_ma&aitiao("[提示："&undoer&"暂时无法提升]提升"&s_ztsb,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz-1)
end if
elseif g_u4="96" and undoer<>"" and instr(un_uz,","&e_uer&",")>0 then
if unuzx(6,undoer,un_uz,un_uc,un_id) then
e_ma=e_ma&aitiao(""&undoer&"降级"&s_ztcg,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz)
else
e_ma=e_ma&aitiao("[提示："&undoer&"暂时无法降级]降级"&s_ztsb,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz-1)
end if
else
if unucxy>0 then
ew_sc=0
e_ma=e_ma&replace(espl(9023,"",eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),un_id,un_xt,unbiao,"un_xt","un_id",""),"点评","消息")
else
e_ma=e_ma&"<div class=""c-i"">对不起，您当前状态 【"&aiarr(i_bunuc,"|",unucxy)&"】</div>"
end if
end if
else
if request.Form("actin")="1" then
if unuzx(1,e_uer,un_uz,un_uc,un_id) then
e_ma=e_ma&aitiao("恭喜您加入【"&un_bt&"】群聚"&s_ztcg,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz)
else
e_ma=e_ma&aitiao("[提示：您可能已经加入过或暂时无权加入]加入【"&un_bt&"】群聚"&s_ztsb,eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66),i_nmtz-1)
end if
else
e_ma=e_ma&"<div class=""c-i tc""><table border=0 cellspacing=0 cellpadding=5 align=center class='gch' width='100%'><form action="""&eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urz,66)&""" method=""post""><tr><td align=center><input type=""hidden"" name=""actin"" value=""1""><input type=""submit"" value=""点击加入该群聚""></td></tr></form></table></div>"
end if
end if
e_ma=e_ma&"<div class=""cr""></div>"
else
e_ma=e_ma&aigo(s_uduns&s_ztno,1)
end if
End Function
'-----------------------------------
'unuzx
'i_gg+user|xy|mc|sl
'=unuzx(unfty=0read|1in|2edit|3out|100+*set xy,unfus,unfuz,unfuc)
'-----------------------------------
Function unuzx(unfty,unfus,unfuz,unfuc,unfid)
dim unduz,unduc,undllz,undllxy,unducrr,unducii,unducud,unducr
if unfty=1 then
unuzx=false
if instr(unfuz,i_gg&unfus&"|")=0 then
if gysgx(unbiao,"un_uc='"&i_gg&unfus&"|1|"&e_ubt&"|0"&unfuc&"'","un_id="&unfid&"") then
unuzx=true
end if
end if
elseif unfty=2 or unfty=4 or unfty=5 or unfty=6 then
unuzx=false
if aibj(e_uer,unfus) or instr(unfuz,","&e_uer&",")>0 then
unducrr=split(unfuc,i_gg&unfus&"|")
unducud=ubound(unducrr)
if unducud>0 then
unduz=unducrr(0)
undllz=unducrr(1)
unducr=split(undllz,i_gg)
if ubound(unducr)>0 then unduz=unduz&right(undllz,len(undllz)-len(unducr(0)))
if unfty=4 then
if gysgx(unbiao,"un_uc='"&unduz&"'","un_id="&unfid&"") then
unuzx=true
end if
else
unducr=split(undllz&"|||","|")
if unfty=2 then
unduc=i_gg&unfus&"|"&aiint(unducr(0))&"|"&replace(request.Form("actgm"),"|","")&"|"&aiint(unducr(2))
unduc=unduc&unduz
elseif unfty=5 then
undllxy=aiint(unducr(0))+1
if undllxy>5 then undllxy=5
unduc=i_gg&unfus&"|"&undllxy&"|"&unducr(1)&"|"&aiint(unducr(2))
unduc=unduc&unduz
elseif unfty=6 then
undllxy=aiint(unducr(0))-1
if undllxy<1 then undllxy=0
unduc=i_gg&unfus&"|"&undllxy&"|"&unducr(1)&"|"&aiint(unducr(2))
if undllxy=0 then
unduc=unduc&unduz
else
unduc=unduz&unduc
end if
end if
if gysgx(unbiao,"un_uc='"&unduc&"'","un_id="&unfid&"") then
unuzx=true
end if
end if
end if
end if
else
if not ainull(unfuc) then
unducrr=split(unfuc,i_gg)
unducud=ubound(unducrr)
if unducud>0 then
unuzx=unuzx&esbts(0,0,s_uduns&"成员","")
for unducii=1 to unducud
unducr=split(unducrr(unducii)&"|||","|")
if not ainull(unducr(0)) then
if instr(unfuz,","&unducr(0)&",")>0 then
unduz=unduz&unuzr(1,unfuz,unducr(0),unducr(1),unducr(2),unducr(3))
else
unduc=unduc&unuzr(0,unfuz,unducr(0),unducr(1),unducr(2),unducr(3))
end if
end if
next
end if
end if
if not ainull(unduz) or not ainull(unduc) then
unuzx=unuzx&"<div class=""l-u""><ul>"
if not ainull(unduz)  then unuzx=unuzx&"<li class=""l-ut"">群主</li>"&unduz
if not ainull(unduc)  then unuzx=unuzx&"<li class=""l-ut"">群众</li>"&unduc
unuzx=unuzx&"</ul></div><div class=""crg""></div>"
end if
end if
End Function
'-----------------------------------
'read user
'=unuzr()
'-----------------------------------
Function unuzr(unfty,unfuz,unfrr0,unfrr1,unfrr2,unfrr3)
unuzr=""
if ainull(unfrr2) then
unuzr=unuzr&unfrr0
else
unuzr=unuzr&unfrr2&"("&unfrr0&")"
end if
if aiint(unfrr3)>0 then unuzr=unuzr&"<sup>"&unfrr3&"</sup>"
if aibj(e_uer,unfrr0) then
unuzr="<font class=""ft"">"&unuzr&"</font><br><a href="""&eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urg&91&g_urz,66)&""">[改名]</a>"
unucxy=aiint(unfrr1)
if unucxy<1 then
unuzr=unuzr&"[黑屋]"
else
unuzr=unuzr&"<a href="""&eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urg&93&g_urz,66)&""">[退出]</a>"
end if
end if
if unfty=1 then
unuzr="<b>"&unuzr&"</b><span><a target=_blank href="""&eshref(s_udus&g_urg&s_umzs&g_urg&unfrr0&g_urz,66)&""">[查看资料]</a><a target=_blank href="""&eshref(s_udux&g_urg&s_umtj&g_urz,66)&""">[短信]</a></span>"
elseif instr(unfuz,","&e_uer&",")>0 then
unuzr=""&unuzr&"<span><a href="""&eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urg&95&g_urg&unfrr0&g_urz,66)&""">[提拔]</a><a href="""&eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urg&96&g_urg&unfrr0&g_urz,66)&""">[降级]</a><a href="""&eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urg&92&g_urg&unfrr0&g_urz,66)&""">[改名]</a><a href="""&eshref(s_udun&g_urg&un_ef&g_urg&s_umxx&g_urg&un_sn&g_urg&94&g_urg&unfrr0&g_urz,66)&""">[请离]</a></span>"
end if
unuzr="<li class=""l-1 p"&aiint(unfrr1)&""">"&unuzr&"</li>"
End Function
'-----------------------------------
'list
'=unlist()
'-----------------------------------
Function unlist(unfqx)
if g_u10="1" then
e_mt=esbts(ep_sx,s_udlun,"我创建的群聚","")
e_wl=e_wl&"<li>我创建的群聚</li>"
elseif g_u10="3" then
e_mt=esbts(ep_sx,s_udlun,"我加入的群聚"&g_gy&e_lj0,"")
e_wl=e_wl&"<li>我加入的群聚</li>"
elseif not ainull(ef_sn) then
e_mt=esbts(ep_sx,s_udlun,ef_bt,"")
e_wl=e_wl&"<li>"&s_uduns&"列表</li>"
else
e_mt=esbts(ep_sx,s_udlun,s_uduns&s_umlbs,"")
e_wl=e_wl&"<li>"&s_uduns&"列表</li>"
end if
dim unlpg,unlps,unlpuq,unlpuh,unlpur,unlgrr
if unfqx=1 then
unlef=g_u2
unlpuq=eshref(s_umgl&g_urg&s_udun&g_urg&unlef,77)
lidms=g_u3
unlpuh=g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10
unlpur=unlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&unlpuh&g_urz
unlpg=aiint(g_u4)
unlps=aiint(g_u5)
else
unlef=g_u1
unlpuq=eshref(s_udun&g_urg&unlef,66)
lidms=g_u2
unlpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
unlpur=unlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&unlpuh&g_urz
unlpg=aiint(g_u3)
unlps=aiint(g_u4)
end if
iclls=icliqls(0,lidms,eshref(unlpuq&g_urg&unlef&g_urg&g_gg&g_urg&g_urg&g_urg&unlpuh&g_urz,66))
Call unsers()
e_mz=e_mz&icliq(iclls,unlpuq&g_urg&lidms,unlpuh,e_gdj,unfqx,"un")
Call unsersql(unlef)
if unlps=0 then
if aibj(lidms,s_umlpy) then
unlps=i_nmhc
else
unlps=i_nmlb
end if
end if
'@@0un_id,1un_sn,2un_bt,3un_up,4un_us,5un_uz,6un_sl,7un_tm,8un_ef,9un_xy
if gyslist(unbid,unlie(s_umlb),unbiao,unwhere,unorder,unlpur,unlpg,unlps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if unfqx=1 then lidti=lidti&"<b>操作</b>"
lidti=lidti&"<i>人数</i>"
lidti=lidti&"<u>星级</u>"
lidti=lidti&"<u>创建时间</u>"
lidti=lidti&"<u>创始人</u>"
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
lidbt=unlic(1,0,gysay(9),gysay(7))&gysay(2)&unlic(1,1,gysay(9),gysay(7))
lidtt="标题："&gysay(2)&vbNewLine
lidtt=lidtt&"创始："&usren(gysay(4))&vbNewLine
lidtt=lidtt&"时间："&gysay(7)
if unfqx=1 then
lidlj=eshref(s_umgl&g_urg&s_udun&g_urg&gysay(8)&g_urg&s_umxx&g_urg&gysay(1)&g_urz,77)
else
lidlj=eshref(s_udun&g_urg&gysay(8)&g_urg&s_umxx&g_urg&gysay(1)&g_urz,66)
end if
if unfqx=1 then
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_udun&g_urg&gysay(8)&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udun&g_urg&gysay(8)&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_uduns&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if
'list
if aibj(lidms,s_umlb) then
lids1=lids1&"<i>"&gysay(6)&"</i>"
lids1=lids1&"<u>"&aiarr(i_bunxy,"|",gysay(9))&"</u>"
lids1=lids1&"<u>"&gysay(7)&"</u>"
lids1=lids1&"<u>"&usren(gysay(4))&"</u>"
else
lidms=s_umlpc
lids1=gysay(6)&" 人"
lids3=lids3&"　创始人："&usren(gysay(4))&aitms("　创建时间：",gysay(7),2)&"　群聚等级："&aiarr(i_bunxy,"|",gysay(9))
if not ainull(gysay(3)) then lids4=lids4&"<img src="""&esups(gysay(3),1)&""">"
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,unfqx,eshref(s_umgl&g_urg&s_udun&g_urg&s_umsc&"-x"&g_urz,77),"un")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=unlic(1,"")
'-----------------------------------
Function unlic(unfkg,unfty,unfxy,unftm)
unlic=""
if unfkg=1 and unfty=0 then
unlic=unlic&icqz(s_udlun,1,unfxy,0)
elseif unfkg=1 and unfty=1 then
unlic=unlic&ichz(1,unftm,0,"")
end if
End Function
'-----------------------------------
'=unsers()
'Call unsers()
'-----------------------------------
Function unsers()
icdssp="排序|最新|时间|人数"
icdrrp=split("un_id desc|un_id desc|un_tm desc|un_sl desc","|")
icdssf="范围|"&usren(ew_kt)&"|"&usren(ew_kg)&"|"&esqday(0)&"|创建"
icdrrf=split("|un_us='"&ew_kt&"'|un_us='"&ew_kg&"'|"&esqday("un_tm")&"|un_us='"&e_uer&"'","|")
icdssx="项目|标题|介绍|创建|群主|系统"
icdrrx=split("un_bt|un_bt|un_nr|un_us|un_uz|un_xt","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=unsersql()
'-----------------------------------
Function unsersql(unfef)
Call icserq()
unwhere=iclwhere
unorder=iclorder
iclapp=1
'order
if ainull(unorder) then unorder=unordermo
if not ainull(unfef) then
if not ainull(unwhere) then unwhere=unwhere&" and "
unwhere=unwhere&"un_ef like '"&unfef&"%'"
end if
if not aibj(g_u0,s_umgl) and not ainull(g_u10) then
if g_u10="1" then
if not ainull(unwhere) then unwhere=unwhere&" and "
unwhere=unwhere&" un_us='"&e_uer&"'"
elseif g_u10="2" then
if not ainull(unwhere) then unwhere=unwhere&" and "
unwhere=unwhere&" un_uz like '%,"&e_uer&",%'"
elseif g_u10="3" then
if not ainull(unwhere) then unwhere=unwhere&" and "
unwhere=unwhere&" un_uc like '%"&i_gg&e_uer&"|%'"
elseif left(g_u10,3)="100" then
if not ainull(unwhere) then unwhere=unwhere&" and "
unwhere=unwhere&" un_xy="&right(g_u10,1)&""
end if
end if
End Function
%>