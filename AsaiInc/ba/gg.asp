<%
'@@0manage/1s_udgg/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_udgg/2edit|add|del/3*id.HTML

'@@0s_udgg/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_udgg/1edit|add/2*id.HTML
'@@0s_udgg/1show/2*sn|-.HTML

if e_xa<1 and (aibj(g_u0,s_udgg) or aibj(g_u1,s_udgg)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,7,g_u0,s_udgg,s_udggs&s_umlbs)

if e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udgg) and aibj(g_u3,s_umtj) then
Call ggadd(1)
elseif aibj(g_u0,s_udgg) and aibj(g_u2,s_umtj) then
Call ggadd(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udgg) and aibj(g_u3,s_umxg) and aiint(g_u4)>0 then
Call ggedit(1)
elseif aibj(g_u0,s_udgg) and aibj(g_u2,s_umxg) then
Call ggedit(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udgg) and (aibj(g_u3,s_umxx) or aibj(g_u3,s_umzs)) and not ainull(g_u4) then
Call ggshow(g_u4)
elseif aibj(g_u0,s_udgg) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and not ainull(g_u3) then
Call ggshow(g_u3)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udgg) and ((aibj(g_u3,s_umsc) and aiint(g_u4)>0) or aibj(g_u3,s_umsc&"-x")) then
Call ggdel(1)
elseif aibj(g_u0,s_udgg) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call ggdel(0)
elseif e_gdj>2 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udgg) and dkdir(2,g_u3) then
Call gglist(1)
elseif aibj(g_u0,s_udgg) and dkdir(2,g_u2) then
Call gglist(0)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","gg")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=gglie()
'-----------------------------------
Function gglie(ggfty)
if ggfty="form" then
gglie="ew,gy,sn,er,ck,cg,bt,lj,jg,tm,t1,ty,xx,jk,jz,jd,px,xy,nr,xt"
elseif ggfty=s_umlb then
'@@gg_id,1gg_ew,2gg_gy,3gg_sn,4gg_er,5gg_ck,6gg_cg,7gg_bt,8gg_lj,9gg_jg,10gg_tm,11gg_t1,12gg_ty,13gg_xx,14gg_jk,15gg_jz,16gg_jd,17gg_px,18gg_xy,19gg_nr
gglie="gg_id,gg_ew,gg_gy,gg_sn,gg_er,gg_ck,gg_cg,gg_bt,gg_lj,gg_jg,gg_tm,gg_t1,gg_ty,gg_xx,gg_jk,gg_jz,gg_jd,gg_px,gg_xy,gg_nr"
elseif ggfty="all" then
gglie="gg_id,gg_ew,gg_gy,gg_sn,gg_er,gg_ck,gg_cg,gg_bt,gg_lj,gg_jg,gg_tm,gg_t1,gg_ty,gg_xx,gg_jk,gg_jz,gg_jd,gg_px,gg_xy,gg_nr,gg_xt"
end if
End Function
'-----------------------------------
'gg menu
'=ggme()
'-----------------------------------
Function ggme()
ggme="<div class=""l-ra""><ul>"
dim ggmrr,ggmi
ggmrr=split(i_bggty,"|")
ggme=ggme&"<li class=""pt"">"
ggme=ggme&""&iclbico(0,"tag",1)&"<a"
if ainull(g_u1) or (aibj(s_umgl,g_u0) and ainull(g_u2)) then ggme=ggme&" class=""l-va"""
ggme=ggme&" href="""&eshref(s_udgg&g_urz,1)&""">"&s_umqbs&s_udggs&"</a></li>"
for ggmi=0 to ubound(ggmrr)
if ggmi mod 2=0 then
ggme=ggme&"<li class=""l-1 pt"">　"
else
ggme=ggme&"<li class=""pt"">　"
end if
ggme=ggme&""&iclbico(0,"tag",1)&"<a"
if aibj(g_u1,ggmi) or (aibj(s_umgl,g_u0) and aibj(g_u2,ggmi)) then ggme=ggme&" class=""l-va"""
ggme=ggme&" href="""&eshref(s_udgg&g_urg&ggmi&g_urg&d_sggls&g_urz,1)&""">"&ggmrr(ggmi)&"</a></li>"
next
ggme=ggme&"</ul></div>"
End Function
'-----------------------------------
'add/edit form
'=ggform()
'-----------------------------------
Function ggform(ggfty,ggfqx)
dim moggdft,eadupd
if ggfty=0 then
gg_ew=aiint(ew_sn)
if aibj(g_u0,s_umgl) then
gg_gy=aiint(g_u2)
else
gg_gy=aiint(g_u1)
end if
gg_sn="GG"&aisn(1)
gg_tm=now()
gg_t1=date()+30
gg_er=e_gmc
gg_ck=0
gg_cg=0
gg_ty=0
gg_jg=0
gg_jk=0
gg_jz=0
gg_jd=0
gg_px=0
gg_xy=1
gg_xt=espxx("发布"&s_udggs&i_gg&e_gmc)
else
gg_xt=gg_xt&espxx("操作{"&aiarr(i_bxy,"|",aiint(gg_xy))&"}"&i_gg&e_gmc)
end if
eadupd=esupcc(s_udgg,gg_sn)
ggform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post"" AUTOCOMPLETE=""off""><ul>"
if ggfqx=1 then
ggform=ggform&icflsr(10,"标题","","bt","",0,200,"*"&s_udggs&"的标题","",gg_bt)
ggform=ggform&icflsr(75,"链接","","lj","",0,200,"*"&s_udggs&"的链接","",gg_lj)&icflxz(25,"类型","ty","","*"&s_udggs&"的类型","",gg_ty,0,i_bggty)
ggform=ggform&icflsr(25,"编码","","sn","",3,50,"*"&s_udggs&"的编码","",gg_sn)&icflxz(25,"状态","xy","","*"&s_udggs&"的状态","",gg_xy,0,i_bxy)&icflsr(25,"宽度","","ck","",6,50,"*"&s_udggs&"的宽度","",gg_ck)&icflsr(25,"高度","","cg","",6,50,"*"&s_udggs&"的高度","",gg_cg)
ggform=ggform&icflot(10,"广告",aiinput("","xx","",0,200,"广告文件(注意：如果自定义了广告编码，请在提交广告后，再进行修改添加广告文件，以避免广告编码重复)","f-up",gg_xx)&esup("0|4|"&gg_sn&"|"&eadupd&"|0|AsaiForm|xx|7|"&ew_ps&"|0|0.ees"))
ggform=ggform&icflsr(5,"开始","","tm","",99,100,"开始时间","",gg_tm)&icflsr(5,"结束","","t1","",99,100,"结束时间","",gg_t1)&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script></li>"
ggform=ggform&icflxz(25,"分类","gy","",""&s_udggs&"的分类","",gg_gy,0,i_bgggy)&icflxz(25,"统计","jk","",""&s_udggs&"的统计开关","",gg_jk,0,i_bggjk)&icflsr(25,"展示","","jz","",6,50,""&s_udggs&"的展示次数","",gg_jz)&icflsr(25,"点击","","jd","",6,50,""&s_udggs&"的点击次数","",gg_jd)
ggform=ggform&icflot(25,"网站",ewselect(1,gg_ew))&icflsr(25,"用户","","er","",0,50,""&s_udggs&"的用户","",gg_er)&icflsr(25,"排序","","px","",6,50,""&s_udggs&"的排序","",gg_px)&icflsr(25,"价格","","jg","",6,50,""&s_udggs&"的价格","",gg_jg)
ggform=ggform&icflot(10,"代码",esedit(esnr(gg_nr),"nr",8))
ggform=ggform&"</ul><ul>"&icflot(10,"点评",eseditxt(gg_xt,"xt",1))
else
ggform=ggform&icflot(10,"","您不能这么操作！")
end if
ggform=ggform&icflot(10,"验证",eskyx(1,1,2))
if ggfty=1 then
ggform=ggform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",gg_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif ggfty=0 then
ggform=ggform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
ggform=ggform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=ggadd()
'-----------------------------------
Function ggadd(ggfqx)
ew_bt=s_umtjs&s_udggs&","&ew_bt:ew_zt=s_umtjs&s_udggs&","&ew_zt:ew_nr=s_umtjs&s_udggs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_udggs&"</a></li>"
e_mt=esbts(s_udxgg,s_udlgg,s_umtjs&s_udggs&g_gy&e_lj1,s_udggs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("ew,sn,bt,ty") then
if gysfm(gglie("form"),ggbiao,"gg_sn='"&aistr(aireq("sn"))&"'","gg_",1) then
Call aisn(0)
Call eskod(8,8,aireq("sn"))
e_ma=e_ma&aigo(s_umtjs&s_udggs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umtjs&s_udggs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_udggs&s_ztsb,1)
end if
else
e_ma=ggform(0,ggfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=ggedit()
'-----------------------------------
Function ggedit(ggfqx)
ew_bt=s_umxgs&s_udggs&","&ew_bt:ew_zt=s_umxgs&s_udggs&","&ew_zt:ew_nr=s_umxgs&s_udggs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udgg&g_urg&"0"&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_udggs&"</a></li>"
e_mt=esbts(s_udxgg,s_udlgg,s_umxgs&s_udggs&g_gy&eshref(s_umgl&g_urg&s_udgg&g_urg&"0"&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_udggs&g_gy&e_lj1&g_gx&s_udggs&s_umlbs&g_gy&e_lj0)
if esky(1,e_uzy) then
if aireqx("ew,sn,bt,ty") then
if gysfm(gglie("form"),ggbiao,"gg_id="&aiint(aireq("id"))&" or (gg_id<>"&aiint(aireq("id"))&" and gg_sn='"&aistr(aireq("sn"))&"')","gg_",2) then
e_ma=e_ma&aigo(s_umxgs&s_udggs&s_ztcg,e_lj0)
Call eskod(8,8,aireq("sn"))
else
e_ma=e_ma&aigo(s_umxgs&s_udggs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_udggs&s_ztsb,1)
end if
else
if ggfqx=1 then
ggwhere="gg_id="&aiint(g_u4)&""
else
ggwhere="gg_id="&aiint(g_u3)&" and gg_er='"&e_gmc&"'"
end if
if gysread(gglie("all"),ggbiao,ggwhere,"") then
ew_bt=gg_bt&","&ew_bt:ew_zt=gg_bt&","&ew_zt:ew_nr=gg_bt&","&ew_nr
e_ma=ggform(1,ggfqx)&e_ma
else
e_ma=e_ma&aigo(s_udggs&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=ggdel(ggfqx)
'-----------------------------------
Function ggdel(ggfqx)
ew_bt=s_udggs&s_umscs&","&ew_bt:ew_zt=s_udggs&s_umscs&","&ew_zt:ew_nr=s_udggs&s_umscs&","&ew_nr:ew_cp=e_ubt&","&ew_cp
e_wl=e_wl&"<li>"&s_udggs&s_umscs&"</li>"
e_mt=esbts(s_udxgg,s_udlgg,s_umscs&s_udggs,s_umtjs&s_udggs&g_gy&e_lj1&g_gx&s_udggs&s_umlbs&g_gy&e_lj0)
if ggfqx=1 then
if e_uxy>2 then
if aiint(g_u4)>0 then
if gysdel(ggbid,ggbiao,"gg_id="&aiint(g_u4)) then
e_ma=e_ma&aitiao(s_udggs&s_umscs&s_ztcg,e_lj0,i_nmtz)
Call eskod(8,8,"00")
else
e_ma=e_ma&aigo(s_udggs&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u3,s_umsc&"-x") then
if gysdel(ggbid,ggbiao,0) then
e_ma=e_ma&aitiao(s_udggs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udggs&s_umscs&s_ztsb,1)
end if
end if
end if
end if
End Function
'-----------------------------------
'show
'=ggshow()
'-----------------------------------
Function ggshow(ggfid)
if aibj(g_u0,s_umgl) then
ggwhere="gg_id="&aiint(ggfid)&""
else
ggwhere="gg_sn='"&ggfid&"' and gg_xy>0"
end if
if gysread(gglie("all"),ggbiao,ggwhere,"") then
ew_bt=gg_bt&","&ew_bt:ew_zt=gg_bt&","&ew_zt:ew_nr=gg_bt&","&ew_nr:ew_cp=gg_sn&","&ew_cp
dim ggdsx
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udgg&g_urg&gg_gy&g_urg&s_umxx&g_urg&gg_id&g_urz,77)&""">"&gg_bt&"</a></li>"
e_mt=esbts(ggdsx,s_udlgg,s_udggs&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_udgg&g_urg&gg_gy&g_urg&s_umxx&g_urg&gg_id&g_urz,77),s_umtjs&s_udggs&g_gy&e_lj1&g_gx&s_udggs&s_umlbs&g_gy&e_lj0)
else
e_wl=e_wl&"<li><a href="""&eshref(s_udgg&g_urg&gg_gy&g_urg&s_umxx&g_urg&gg_id&g_urz,66)&""">"&gg_bt&"</a></li>"
e_mt=esbts(ggdsx,s_udlgg,s_udggs&s_umxxs&g_gy&eshref(s_udgg&g_urg&s_umxx&g_urg&gg_sn&g_urz,66),s_udggs&s_umlbs&g_gy&e_lj0)
end if
icdcb=gg_bt
'--------------------------------HENG 0
if aiint(gg_jk)>1 then Call gysgx(ggbiao,"gg_jk="&aiint(gg_jk)+1&"","gg_id="&gg_id&"")
icdcd=icdcd&"编码："&gg_sn
icdcd=icdcd&" 类型："&aiarr(i_bggty,"|",aiint(gg_ty))
icdcd=icdcd&" 状态："&aiarr(i_bxy,"|",aiint(gg_xy))
icdcd=icdcd&" 排序："&gg_px
icdcd=icdcd&" 统计："&aiarr(i_bggjk,"|",aiint(gg_jk))
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdcg=icdcg&"<li>分类："&aiarr(i_bgggy,"|",aiint(gg_gy))&"</li>"
if isdate(gg_tm) then icdcg=icdcg&"<li>开始："&aitmx(gg_tm,9)&"</li>"
if isdate(gg_t1) then icdcg=icdcg&"<li>结束："&aitmx(gg_t1,9)&"</li>"
icdcg=icdcg&"<li>尺寸："&aiint(gg_ck)&" * "&aiint(gg_cg)&"</li>"
if not ainull(gg_er) then icdcg=icdcg&"<li>用户："&gg_er&"</li>"
if aiint(gg_jg)>0 then icdcg=icdcg&"<li>价格："&gg_jg&"</li>"
icdci="广告预览：<div class=""g-g"">"&icgg(gg_sn,5,gg_jk,gg_ck,gg_cg,gg_bt,gg_lj,gg_jg,gg_tm,gg_t1,gg_ty,gg_xx,gg_nr)&"</div>"
'icnr(icdty=0标题|1,icddm=短名,icdcb=标题,icdcc=摘要,icdcd=横条备注,icdcf=左侧封面图,icdcg=右侧备注,icdci=内容,icdcj=媒体展示,icdcm=点评分享区)
icdty=9
e_ma=e_ma&icnr(icdty,icddm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
'--------------------------------CONTENT 1
e_ma=e_ma&espl(90234,s_udggs,eshref(s_udgg&g_urg&g_u1&g_urg&gg_id&g_urz,66),gg_id,gg_xt,ggbiao,"gg_xt","gg_id","")
else
e_ma=e_ma&aigo(s_udggs&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=gglist()
'-----------------------------------
Function gglist(ggfqx)
e_mt=esbts(s_udxgg,s_udlgg,s_udggs&s_umlbs&g_gy&e_lj0,s_umtjs&s_udggs&g_gy&e_lj1)
dim gglpg,gglps,gglpuq,gglpgg,gglpur,gglgrr
if ggfqx=1 then
gglty=g_u2
gglpuq=eshref(s_umgl&g_urg&s_udgg&g_urg&gglty,66)
lidms=g_u3
gglpgg=g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10
gglpur=gglpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&gglpgg&g_urz
gglpg=aiint(g_u4)
gglps=aiint(g_u5)
else
gglty=g_u1
gglpuq=eshref(s_udgg&g_urg&gglty,66)
lidms=g_u2
gglpgg=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
gglpur=gglpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&gglpgg&g_urz
gglpg=aiint(g_u3)
gglps=aiint(g_u4)
end if
if ainull(lidms) then lidms=d_sggls
iclls=icliqls(0,lidms,gglpuq&g_urg&g_gg&g_urg&g_urg&g_urg&gglpgg&g_urz)
Call ggsers()
e_mz=e_mz&icliq(iclls,gglpuq&g_urg&lidms,gglpgg,e_gdj,ggfqx,"gg")
Call ggsersql()
if not ainull(gglty) and gglty<>"0" then
if not ainull(ggwhere) then ggwhere=ggwhere&" and "
ggwhere=ggwhere&"gg_gy="&gglty&""
end if
if gglps=0 then
if aibj(lidms,s_umlpy) then
gglps=i_nmhc
else
gglps=i_nmlb
end if
end if

'@@gg_id,1gg_ew,2gg_gy,3gg_sn,4gg_er,5gg_ck,6gg_cg,7gg_bt,8gg_lj,9gg_jg,10gg_tm,11gg_t1,12gg_ty,13gg_xx,14gg_jk,15gg_jz,16gg_jd,17gg_px,18gg_xy,19gg_nr
if gyslist(ggbid,gglie(s_umlb),ggbiao,ggwhere,ggorder,gglpur,gglpg,gglps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if ggfqx=1 then lidti=lidti&"<b>操作</b>"
lidti=lidti&"<u>状态</u>"
lidti=lidti&"<i>分类</i>"
lidti=lidti&"<i>排序</i>"
lidti=lidti&"<i>点击</i>"
lidti=lidti&"<i>展示</i>"
lidti=lidti&"<i>价格</i>"
lidti=lidti&"<u>结束日期</u>"
lidti=lidti&"<u>开始日期</u>"
lidti=lidti&"<b>广告代码　##代码##</b>"
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
lidbt=gglic(1,0,gysay(18),gysay(15),gysay(16),gysay(17),gysay(10))&gysay(7)&gglic(1,1,gysay(18),gysay(15),gysay(16),gysay(17),gysay(10))
lidtt="标题："&gysay(7)&vbNewLine
lidtt=lidtt&"宽度："&aiint(gysay(5))&vbNewLine
lidtt=lidtt&"高度："&aiint(gysay(6))&vbNewLine
lidtt=lidtt&"类型："&aiarr(i_bggty,"|",aiint(gysay(12)))&vbNewLine
lidtt=lidtt&"统计："&aiarr(i_bggjk,"|",aiint(gysay(14)))
if ggfqx=1 then
lidlj=eshref(s_umgl&g_urg&s_udgg&g_urg&gysay(2)&g_urg&s_umxx&g_urg&gysay(0)&g_urz,77)
else
lidlj=eshref(s_udgg&g_urg&gysay(2)&g_urg&s_umxx&g_urg&gysay(3)&g_urz,66)
end if
if ggfqx=1 then
lidgl="<b>"
lidgl=lidgl&"<input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_udgg&g_urg&gysay(2)&g_urg&s_umxg&g_urg&gysay(0)&g_urz,66),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udgg&g_urg&gysay(2)&g_urg&s_umsc&g_urg&gysay(0)&g_urz,66),s_umscs&s_udggs&s_ztqr,"","","f-sb",s_umscs)
lidgl=lidgl&"</b>"
end if
'yunqian
if aibj(lidms,s_umlb) then
lids1=lids1&"<u"
if aiint(gysay(18))>3 then lids1=lids1&" class=""ftt"""
lids1=lids1&">"&aiarr(i_bxy,"|",aiint(gysay(18)))&"</u>"
lids1=lids1&"<i>"&aiarr(i_bgggy,"|",aiint(gysay(2)))&"</i>"
lids1=lids1&"<i>"&aiint(gysay(17))&"</i>"
lids1=lids1&"<i>"&aiint(gysay(16))&"</i>"
lids1=lids1&"<i>"&aiint(gysay(15))&"</i>"
lids1=lids1&"<i>"&aiint(gysay(9))&"</i>"
lids1=lids1&"<u>"&aitmx(gysay(11),2)&"</u>"
lids1=lids1&"<u>"&aitmx(gysay(10),2)&"</u>"
lids1=lids1&"<b>"&gysay(3)&"</b>"
else
lidms=s_umlpc
lids3=lids3&aitms("开始时间：",gysay(10),2)&aitms(" 结束时间：",gysay(11),2)
lids2=lids2&icgg(gysay(3),5,gysay(14),gysay(5),gysay(6),gysay(7),gysay(8),gysay(9),gysay(10),gysay(11),gysay(12),gysay(13),gysay(19))
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,ggfqx,eshref(s_umgl&g_urg&s_udgg&g_urg&s_umsc&"-x"&g_urz,77),"gg")&"<p>提示：如果调用自适应高度的广告（高度为0，宽度为0表示100%）请务必加入以下调用代码。<br>&lt;script src=&quot;&lt;%=i_dir&amp;s_drplug%&gt;AsaiGG/heightauto.js&quot;&gt;&lt;/script&gt;</p>"
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=gglic(1,"")
'-----------------------------------
Function gglic(ggfkg,ggfty,ggfxy,ggfjz,ggfjd,ggfpx,ggftm)
gglic=""
if ew_qz>0 and ggfkg=1 and ggfty=0 then
if ew_qz=2 then
gglic=esicoh(1,s_udlgg)
else
gglic=gglic&icqz(s_udlgg,1,ggfxy,ggfpx)
end if
elseif ggfkg=1 and ggfty=1 then
gglic=gglic&ichz(1,ggftm,int((aiint(ggfjz)+aiint(ggfjd))/2),"")
end if
End Function
'-----------------------------------
'=ggsers()
'Call ggsers()
'-----------------------------------
Function ggsers()
icdssp="排序|金额|限额|数量|已发|发放|起效|过期"
icdrrp=split("gg_id desc|gg_jq desc|gg_je desc|gg_ns desc|gg_nl desc|gg_tm desc|gg_t1 desc|gg_t2 desc","|")
icdssf="范围|即将|正在|过期|金币|经验|金钱|"&esqday(0)&""
icdrrf=split("|gg_xy=0|gg_xy=1|gg_xy=2|gg_ty=0|gg_ty=1|gg_ty=2|"&esqday("gg_tm")&"","|")
icdssx="项目|标题|编码|系统|时间"
icdrrx=split("gg_bt|gg_bt|gg_sn|gg_xt|gg_tm","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=ggsersql()
'-----------------------------------
Function ggsersql()
Call icserq()
ggwhere=iclwhere
ggorder=iclorder
'order
if ainull(ggorder) then ggorder=ggordermo
'admin
if aibj(g_u0,s_umgl) then
iclapp=1
end if
End Function
%>