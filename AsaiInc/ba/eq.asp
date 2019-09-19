<%
'@@0manage/1s_udeq/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_udeq/2edit|add|del/3*id.HTML

'@@0s_udeq/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_udeq/1info|show/2id*/3page.HTML

if e_xa<1 and (aibj(g_u0,s_udeq) or aibj(g_u1,s_udeq)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_udeq,s_udeqs&s_umlbs)

if e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udeq) and aibj(g_u2,s_umtj) then
Call eqadd(1)
elseif e_gdj>1 and aibj(g_u0,s_udeq) and aibj(g_u1,s_umtj) then
Call eqadd(0)
elseif e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udeq) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call eqedit(1)
elseif e_gdj>1 and aibj(g_u0,s_udeq) and aibj(g_u1,s_umxg) and aiint(g_u2)>0 then
Call eqedit(0)
elseif e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udeq) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call eqdel(1)
elseif e_gdj>1 and aibj(g_u1,s_udeq) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call eqdel(0)
elseif e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udeq) and dkdir(2,g_u2) then
Call eqlist(1)
elseif aibj(g_u0,s_udeq) and dkdir(2,g_u1) then
Call eqlist(0)
elseif e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udeq) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and aiint(g_u3)>0 then
Call eqshow(g_u3)
elseif aibj(g_u0,s_udeq) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) and aiint(g_u2)>0 then
Call eqshow(g_u2)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","eq")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=eqlie()
'-----------------------------------
Function eqlie(eqfty)
if eqfty="form" then
eqlie="ew,sn,mc,nr,cs,px,tm,t1,xx,xy"
elseif eqfty=s_umlb then
eqlie="eq_id,eq_mc,eq_cs,eq_px,eq_tm,eq_t1,eq_xy"
elseif eqfty="all" then
eqlie="eq_id,eq_ew,eq_sn,eq_mc,eq_nr,eq_cs,eq_px,eq_tm,eq_t1,eq_xx,eq_xy"
end if
End Function
'-----------------------------------
'eqin
'=eqin()
'-----------------------------------
Function eqin(eqfstr)
iclapp=1
if i_xkqj=1 and ewxgn("eq") then
if not ainull(trim(eqfstr)) then
dim eqdrr,eqdii
eqdrr=split(replace(trim(eqfstr),"，",","),",")
for eqdii=0 to ubound(eqdrr)
if not ainull(trim(eqfstr)) then
Call gysat("eq_ew,eq_cs,eq_sn,eq_mc,eq_xy,eq_tm,eq_t1",eqbiao,"eq_mc='"&trim(eqfstr)&"' and "&esrew("eq",ew_sn),aiint(ew_sn)&g_gg&"1"&g_gg&"AK"&aisn(1)&g_gg&trim(eqfstr)&g_gg&ew_sh&g_gg&now()&g_gg&now())
Call aisn(0)
end if
next
end if
end if
End Function
'-----------------------------------
'add/edit form
'=eqform()
'-----------------------------------
Function eqform(eqfty,eqfqx)
if eqfty=0 then
eq_ew=aiint(ew_sn)
eq_sn="TK"&aisn(1)
eq_cs=0
eq_tm=now()
eq_t1=now()
eq_px=0
eq_xy=1
else
eq_t1=date()
end if
eqform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
eqform=eqform&icflsr(25,"名称","","mc","",0,50,"*","",eq_mc)&icflsr(25,"次数","","cs","",6,50,"*","",eq_cs)&icflsr(25,"排序","","px","",6,50,"*","",eq_px)&icflxz(25,"状态","xy","","*","",eq_xy,0,i_bxy)
eqform=eqform&icflsr(25,"时间","","tm","",99,200,"*创建时间","",eq_tm)&icflsr(25,"更新","","t1","",99,200,"*更新时间","",eq_t1)&icflsr(25,"编码","","sn","",0,50,"*","",eq_sn)&icflot(25,"网站",ewselect(0,eq_ew))
eqform=eqform&icflot(10,"内容",esedit(esnr(eq_nr),"nr",1))

if e_gdj>1 then
eqform=eqform&icflot(10,"推广","广告推广选项开关　<input type=""button""  onclick=""document.getElementById('easmid').style.display='block';"" class=""f-sb"" value=""打开""><input type=""button""  onclick=""document.getElementById('easmid').style.display='none';"" class=""f-sb"" value=""关闭""></li><ul id=""easmid"" style=""display:none;"">")

dim eqfii,eqfrr,eqfrra,eadupd
eadupd=esupcc(s_udeq,eq_sn)
eqfrr=split(eq_xx&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg,g_gg)
for eqfii=1 to 8
eqfrra=split(eqfrr(eqfii)&", , , , , , , , , , ",", ")
eqform=eqform&aiinput("hidden","xx","",0,0,"","",g_gg)
eqform=eqform&icflsr(10,"推广"&eqfii&"","","xx","",0,100,"*推广标题","",eqfrra(1))
eqform=eqform&icflsr(75,"链接","","xx","",0,200,"*链接","",eqfrra(2))&icflsr(25,"价格","","xx","",6,50,"*推广价格","",eqfrra(3))
eqform=eqform&icflot(25,"开始","<input type=""text"" name=""xx"" id=""xx_k"&eqfii&""" onkeyup=""value=value.replace(/[^\0-9\:\ \-\/]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\0-9\:\ \-\/]/g,''))"" maxlength=""200"" title=""*开始时间"" class=""f-a"" onclick=""this.className='f-b1';FTM(xx_k"&eqfii&");"" value="""&eqfrra(4)&""">")&icflot(5,"结束","<input type=""text"" name=""xx"" id=""xx_j"&eqfii&""" onkeyup=""value=value.replace(/[^\0-9\:\ \-\/]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\0-9\:\ \-\/]/g,''))"" maxlength=""200"" title=""*结束时间"" class=""f-a"" onclick=""this.className='f-b2';FTM(xx_j"&eqfii&");"" value="""&eqfrra(5)&""">")&icflxz(25,"类型","xx","","*","",eqfrra(6),0,i_bggty)
eqform=eqform&icflot(10,"广告","<input type=""text"" name=""xx"" id=""xx_"&eqfii&""" maxlength=""500"" title="""" class=""f-up"" value="""&eqfrra(7)&""">"&esup("0|4|"&eq_sn&"_"&eqfii&"|"&eadupd&"|0|AsaiForm|xx_"&eqfii&"|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees"))
next

eqform=eqform&"</ul><div class=cr></div>"
end if
eqform=eqform&icflot(10,"验证",eskyx(1,2,2))
if eqfty=1 then
eqform=eqform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",eq_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif eqfty=0 then
eqform=eqform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
eqform=eqform&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script></ul></form></div>"
End Function
'-----------------------------------
'add action
'=eqadd()
'-----------------------------------
Function eqadd(eqfqx)
ew_bt=s_umtjs&s_udeqs&","&ew_bt:ew_zt=s_umtjs&s_udeqs&","&ew_zt:ew_nr=s_umtjs&s_udeqs&","&ew_nr
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_udeqs&"</a></li>"
e_mt=esbts(s_udxeq,s_udleq,s_umtjs&s_udeqs&g_gy&e_lj1,s_udeqs&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("mc,cs,px,xy,tm,t1") then
if gysfm(eqlie("form"),eqbiao,"eq_mc='"&aistr(aireq("mc"))&"' and "&esrew("eq",ew_sn),"eq_",1) then
e_ma=e_ma&aigo(s_umtjs&s_udeqs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umtjs&s_udeqs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_udeqs&s_ztsb,1)
end if
else
e_ma=eqform(0,eqfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=eqedit()
'-----------------------------------
Function eqedit(eqfqx)
ew_bt=s_umxgs&s_udeqs&","&ew_bt:ew_zt=s_umxgs&s_udeqs&","&ew_zt:ew_nr=s_umxgs&s_udeqs&","&ew_nr
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udeq&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_udeqs&"</a></li>"
e_mt=esbts(s_udxeq,s_udleq,s_umxgs&s_udeqs&g_gy&eshref(s_umgl&g_urg&s_udeq&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_udeqs&g_gy&e_lj1&g_gx&s_udeqs&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("mc,cs,px,xy,tm,t1") then
'if gysfm(eqlie("form"),eqbiao,"eq_id="&aiint(aireq("id"))&" or (eq_id<>"&aiint(aireq("id"))&" and eq_mc='"&aistr(aireq("mc"))&"')","eq_",2) then
if gysfm(eqlie("form"),eqbiao,"eq_id="&aiint(aireq("id"))&"","eq_",2) then
e_ma=e_ma&aigo(s_umxgs&s_udeqs&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_udeqs&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_udeqs&s_ztsb,1)
end if
else
if gysread(eqlie("all"),eqbiao,"eq_id="&aiint(g_u3)&"","") then
ew_bt=eq_mc&","&ew_bt:ew_zt=eq_mc&","&ew_zt:ew_nr=eq_mc&","&ew_nr
e_ma=eqform(1,eqfqx)&e_ma
else
e_ma=e_ma&aigo(s_udeqs&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=eqdel()
'-----------------------------------
Function eqdel(eqfqx)
ew_bt=s_udeqs&s_umscs&","&ew_bt:ew_zt=s_udeqs&s_umscs&","&ew_zt:ew_nr=s_udeqs&s_umscs&","&ew_nr
e_wl=e_wl&"<li>"&s_udeqs&s_umscs&"</li>"
e_mt=esbts(s_udxeq,s_udleq,s_umscs&s_udeqs,s_umtjs&s_udeqs&g_gy&e_lj1&g_gx&s_udeqs&s_umlbs&g_gy&e_lj0)
if e_gdj>2 then
if aiint(g_u3)>0 then
if gysdel(eqbid,eqbiao,"eq_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_udeqs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udeqs&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(eqbid,eqbiao,esrew("eq",ew_sn)) then
e_ma=e_ma&aitiao(s_udeqs&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udeqs&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'show
'=eqshow()
'-----------------------------------
Function eqshow(eqfid)
if aibj(g_u0,s_umgl) then
eqwhere="eq_id="&aiint(eqfid)&""
else
eqwhere="eq_id="&aiint(eqfid)&" and eq_xy>0"
end if
if gysread(eqlie("all"),eqbiao,eqwhere,"") then
ew_bt=eq_mc&","&ew_bt:ew_zt=eq_mc&","&ew_zt:ew_nr=eq_mc&","&ew_nr
dim eqdsx,eqdpur,eqdpg,eqdmm
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udeq&g_urg&s_umxx&g_urg&eq_id&g_urz,77)&""">"&s_udeqs&s_umxxs&"</a></li>"
if ainull(g_u4) then
eqdpg=1
else
eqdpg=aiint(g_u4)
end if
eqdmm=g_u5
e_mt=esbts(eqdsx,s_udleq,s_udeqs&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_udeq&g_urg&s_umxx&g_urg&eq_id&g_urz,77),s_umtjs&s_udeqs&g_gy&e_lj1&g_gx&s_udeqs&s_umlbs&g_gy&e_lj0)
eqdpur=eshref(s_umgl&g_urg&s_udeq&g_urg&s_umxx&g_urg&g_gp&g_urg&eqdmm&g_urz,77)
else
e_wl=e_wl&"<li><a href="""&eshref(s_udeq&g_urg&s_umxx&g_urg&eq_id&g_urz,66)&""">"&s_udeqs&s_umxxs&"</a></li>"
if ainull(g_u3) then
eqdpg=1
else
eqdpg=aiint(g_u3)
end if
eqdmm=g_u4
e_mt=esbts(eqdsx,s_udleq,s_umzss&s_udeqs&g_gy&eshref(s_udeq&g_urg&s_umzs&g_urg&eq_id&g_urz,1),s_udeqs&s_umlbs&g_gy&e_lj0)
eqdpur=eshref(s_udeq&g_urg&s_umzs&g_urg&g_gp&g_urg&eqdmm&g_urz,1)
end if
icdcb=eq_mc&"<span>"&aiarr(i_bxy,"|",aiint(eq_xy))&"</span>"
'--------------------------------HENG 0
if aiint(eq_cs)>0 then icdcd=icdcd&"搜索次数："&eq_cs&""
if not ainull(eq_tm) then icdcd=icdcd&aitms(" 首次搜索时间：",eq_tm,9)
if cdate(eq_t1)>aicd(eq_tm) then icdcd=icdcd&aitms(" 最近搜索：",eq_t1,3)
if aiint(eq_px)>0 then icdcd=icdcd&" 排序："&aiint(eq_px)
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdci=esnrgys(eq_nr,eqdpur,eqdpg)
icdcj="<a target=""_blank"" href="""&eshref(s_umso&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&aijia(eq_mc)&g_urz,1)&""">点击搜索【"&eq_mc&"】</a>"
'icnr(icdty=0标题|1,icddm=短名,icdcb=标题,icdcc=摘要,icdcd=横条备注,icdcf=左侧封面图,icdcg=右侧备注,icdci=内容,icdcj=媒体展示,icdcm=点评分享区)
icdty=9
e_ma=e_ma&icnr(icdty,icddm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
'--------------------------------CONTENT 1
else
e_ma=e_ma&aigo(s_udeqs&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=eqlist()
'-----------------------------------
Function eqlist(eqfqx)

dim eqlpg,eqlps,eqlpuq,eqlpuh,eqlpur,eqlgrr,eqlpum
if eqfqx=1 then
e_mt=esbts(s_udxeq,s_udleq,s_udeqs&s_umlbs&g_gy&e_lj0,s_umtjs&s_udeqs&g_gy&e_lj1)
eqlpum=77
eqlpuq=s_umgl&g_urg&s_udeq
lidms=g_u2
eqlpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
eqlpur=eshref(eqlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&eqlpuh&g_urz,eqlpum)
eqlpg=aiint(g_u3)
eqlps=aiint(g_u4)
else
e_mt=esbts(s_udxeq,s_udleq,s_udeqs&s_umlbs&g_gy&e_lj0,"")
eqlpum=11
eqlpuq=s_udeq
lidms=g_u1
eqlpuh=g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8
eqlpur=eshref(eqlpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&eqlpuh&g_urz,eqlpum)
eqlpg=aiint(g_u2)
eqlps=aiint(g_u3)
end if
if ainull(lidms) then lidms=s_umlb
iclls=icliqls(5,lidms,eshref(eqlpuq&g_urg&g_gg&g_urg&g_urg&g_urg&eqlpuh&g_urz,eqlpum))
Call eqsers()
e_mz=e_mz&icliq(iclls,eqlpuq&g_urg&lidms,eqlpuh,e_gdj,eqfqx,"eq")

Call eqsersql()
if eqlps=0 then
if aibj(lidms,s_umlpy) then
eqlps=i_nmhc
else
eqlps=i_nmlb
end if
end if

'@@eq_id,1eq_mc,2eq_cs,3eq_px,4eq_tm,5eq_t1,6eq_xy
if gyslist(eqbid,eqlie(s_umlb),eqbiao,eqwhere,eqorder,eqlpur,eqlpg,eqlps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if eqfqx=1 then lidti=lidti&"<b>管理</b>"
lidti=lidti&"<u>状态</u>"
lidti=lidti&"<u>更新时间</u>"
lidti=lidti&"<u>创建时间</u>"
lidti=lidti&"<i>排序</i>"
lidti=lidti&"<i>次数</i>"
lidti=lidti&"名称"
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
lidbt=gysay(1)
lidtt=gysay(1)


if eqfqx=1 then
lidgl="<b><input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_udeq&g_urg&s_umxg&g_urg&gysay(0)&g_urz,77),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udeq&g_urg&s_umsc&g_urg&gysay(0)&g_urz,77),s_umscs&s_udeqs&s_ztqr,"","","f-sb",s_umscs)&"</b>"
lidlj=eshref(s_umgl&g_urg&s_udeq&g_urg&s_umxx&g_urg&gysay(0)&g_urz,1)
else
lidlj=eshref(s_udeq&g_urg&s_umxx&g_urg&gysay(0)&g_urz,1)
end if
if aibj(lidms,s_umlpy) then
lids4=gysay(2)
else
lids1="<u>"&aiarr(i_bxy,"|",aiint(gysay(6)))&"</u>"
lids1=lids1&"<u>"&gysay(5)&"</u>"
lids1=lids1&"<u>"&gysay(4)&"</u>"
lids1=lids1&"<i>"&gysay(3)&"</i>"
lids1=lids1&"<i>"&gysay(2)&"</i>"
end if
e_mz=e_mz&iclist(lidms,lidti,gysi,lidbt,lidtt,lidlj,lidgl,lids1,lids2,lids3,lids4)
next
e_mz=e_mz&iclistend(lidms,"")
else
e_mz=e_mz&"<div class=""l-tc"">"&s_ztkl&"</div>"
end if

e_mz=e_mz&iclih(gyspage,e_gdj,eqfqx,eshref(s_umgl&g_urg&s_udeq&g_urg&s_umsc&"-x"&g_urz,77),"eq")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=eqsers()
'Call eqsers()
'-----------------------------------
Function eqsers()
icdssp="排序|次数|排序|推荐|时间|更新|名称"
icdrrp=split("eq_id asc|eq_cs desc|eq_px desc|eq_xy desc|eq_tm desc|eq_t1 desc|eq_mc asc","|")
icdssf="范围|推荐|"&esqday(0)&"|普通"
if e_uxy>2 then icdssf=icdssf&"|禁用"
icdrrf=split("|eq_xy>1|"&esqday("eq_tm")&"|eq_xy=1|eq_xy=0","|")
icdssx="项目|标题|内容|时间|更新"
if e_uxy>2 then icdssx=icdssx&"|推广"
icdrrx=split("eq_mc|eq_mc|eq_nr|eq_tm|eq_t1|eq_xx","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=eqsersql(eqfstr)
'-----------------------------------
Function eqsersql()
Call icserq()
eqwhere=iclwhere
eqorder=iclorder
'order
if ainull(eqorder) then eqorder=eqordermo
'admin
if not aibj(g_u0,s_umgl) then
if not ainull(eqwhere) then eqwhere=" and "&eqwhere
eqwhere="eq_xy>0"&eqwhere
end if
End Function
%>