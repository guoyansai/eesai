<%
'@@0manage/1s_udek/2list|yun/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0manage/1s_udek/2edit|add|del/3*id.HTML

'@@0s_udek/1list|yun/2page/3psize/4ssx/5ssm/6ssf/7ssp/8sss.HTML
'@@0s_udek/1info|show/2id*/3page.HTML

if e_xa<1 and (aibj(g_u0,s_udek) or aibj(g_u1,s_udek)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_udek,s_udeks&s_umlbs)

if e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udek) and aibj(g_u2,s_umtj) then
Call ekadd(1)
elseif e_gdj>1 and aibj(g_u0,s_udek) and aibj(g_u1,s_umtj) then
Call ekadd(0)
elseif e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udek) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call ekedit(1)
elseif e_gdj>1 and aibj(g_u0,s_udek) and aibj(g_u1,s_umxg) and aiint(g_u2)>0 then
Call ekedit(0)
elseif e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udek) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call ekdel(1)
elseif e_gdj>1 and aibj(g_u1,s_udek) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call ekdel(0)
elseif e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udek) and dkdir(2,g_u2) then
Call eklist(1)
elseif aibj(g_u0,s_udek) and dkdir(2,g_u1) then
Call eklist(0)
elseif e_gdj>1 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udek) and (aibj(g_u2,s_umxx) or aibj(g_u2,s_umzs)) and aiint(g_u3)>0 then
Call ekshow(g_u3)
elseif aibj(g_u0,s_udek) and (aibj(g_u1,s_umxx) or aibj(g_u1,s_umzs)) and aiint(g_u2)>0 then
Call ekshow(g_u2)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","9","ek")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Data Table
'=eklie()
'-----------------------------------
Function eklie(ekfty)
if ekfty="form" then
eklie="ew,sn,mc,nr,cs,px,tm,t1,xx,xy"
elseif ekfty=s_umlb then
eklie="ek_id,ek_mc,ek_cs,ek_px,ek_tm,ek_t1,ek_xy"
elseif ekfty="all" then
eklie="ek_id,ek_ew,ek_sn,ek_mc,ek_nr,ek_cs,ek_px,ek_tm,ek_t1,ek_xx,ek_xy"
end if
End Function
'-----------------------------------
'ekin
'=ekin()
'-----------------------------------
Function ekin(ekfstr)
iclapp=1
if i_xksj=1 and ewxgn("ek") then
if not ainull(trim(ekfstr)) then
dim ekdrr,ekdii
ekdrr=split(replace(trim(ekfstr),"，",","),",")
for ekdii=0 to ubound(ekdrr)
if not ainull(trim(ekfstr)) then
Call gysat("ek_ew,ek_cs,ek_sn,ek_mc,ek_xy,ek_tm,ek_t1",ekbiao,"ek_mc='"&trim(ekfstr)&"' and "&esrew("ek",ew_sn),aiint(ew_sn)&g_gg&"1"&g_gg&"AK"&aisn(1)&g_gg&trim(ekfstr)&g_gg&ew_sh&g_gg&now()&g_gg&now())
Call aisn(0)
end if
next
end if
end if
End Function
'-----------------------------------
'add/edit form
'=ekform()
'-----------------------------------
Function ekform(ekfty,ekfqx)
if ekfty=0 then
ek_ew=aiint(ew_sn)
ek_sn="TK"&aisn(1)
ek_cs=0
ek_tm=now()
ek_t1=now()
ek_px=0
ek_xy=1
else
ek_t1=date()
end if
ekform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
ekform=ekform&icflsr(25,"名称","","mc","",0,50,"*","",ek_mc)&icflsr(25,"次数","","cs","",6,50,"*","",ek_cs)&icflsr(25,"排序","","px","",6,50,"*","",ek_px)&icflxz(25,"状态","xy","","*","",ek_xy,0,i_bxy)
ekform=ekform&icflsr(25,"时间","","tm","",99,200,"*创建时间","",ek_tm)&icflsr(25,"更新","","t1","",99,200,"*更新时间","",ek_t1)&icflsr(25,"编码","","sn","",0,50,"*","",ek_sn)&icflot(25,"网站",ewselect(0,ek_ew))
ekform=ekform&icflot(10,"内容",esedit(esnr(ek_nr),"nr",1))

if e_gdj>1 then
ekform=ekform&icflot(10,"推广","广告推广选项开关　<input type=""button""  onclick=""document.getElementById('easmid').style.display='block';"" class=""f-sb"" value=""打开""><input type=""button""  onclick=""document.getElementById('easmid').style.display='none';"" class=""f-sb"" value=""关闭""></li><ul id=""easmid"" style=""display:none;"">")

dim ekfii,ekfrr,ekfrra,eadupd
eadupd=esupcc(s_udek,ek_sn)
ekfrr=split(ek_xx&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg&g_gg,g_gg)
for ekfii=1 to 8
ekfrra=split(ekfrr(ekfii)&", , , , , , , , , , ",", ")
ekform=ekform&aiinput("hidden","xx","",0,0,"","",g_gg)
ekform=ekform&icflsr(10,"推广"&ekfii&"","","xx","",0,100,"*推广标题","",ekfrra(1))
ekform=ekform&icflsr(75,"链接","","xx","",0,200,"*链接","",ekfrra(2))&icflsr(25,"价格","","xx","",6,50,"*推广价格","",ekfrra(3))
ekform=ekform&icflot(25,"开始","<input type=""text"" name=""xx"" id=""xx_k"&ekfii&""" onkeyup=""value=value.replace(/[^\0-9\:\ \-\/]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\0-9\:\ \-\/]/g,''))"" maxlength=""200"" title=""*开始时间"" class=""f-a"" onclick=""this.className='f-b1';FTM(xx_k"&ekfii&");"" value="""&ekfrra(4)&""">")&icflot(5,"结束","<input type=""text"" name=""xx"" id=""xx_j"&ekfii&""" onkeyup=""value=value.replace(/[^\0-9\:\ \-\/]/g,'')"" onbeforepaste=""clipboardData.setData('text',clipboardData.getData('text').replace(/[^\0-9\:\ \-\/]/g,''))"" maxlength=""200"" title=""*结束时间"" class=""f-a"" onclick=""this.className='f-b2';FTM(xx_j"&ekfii&");"" value="""&ekfrra(5)&""">")&icflxz(25,"类型","xx","","*","",ekfrra(6),0,i_bggty)
ekform=ekform&icflot(10,"广告","<input type=""text"" name=""xx"" id=""xx_"&ekfii&""" maxlength=""500"" title="""" class=""f-up"" value="""&ekfrra(7)&""">"&esup("0|4|"&ek_sn&"_"&ekfii&"|"&eadupd&"|0|AsaiForm|xx_"&ekfii&"|"&aijia(ew_py)&"|"&ew_ps&"|0|0.ees"))
next

ekform=ekform&"</ul><div class=cr></div>"
end if
ekform=ekform&icflot(10,"验证",eskyx(1,2,2))
if ekfty=1 then
ekform=ekform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",ek_id)&aibutton(1,"","","f-sb f-skx",s_ztcz))
elseif ekfty=0 then
ekform=ekform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
ekform=ekform&"<script src="""&eshref(w_asai&i_msk&"js/FTM.js",3)&"""></script></ul></form></div>"
End Function
'-----------------------------------
'add action
'=ekadd()
'-----------------------------------
Function ekadd(ekfqx)
ew_bt=s_umtjs&s_udeks&","&ew_bt:ew_zt=s_umtjs&s_udeks&","&ew_zt:ew_nr=s_umtjs&s_udeks&","&ew_nr
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_udeks&"</a></li>"
e_mt=esbts(s_udxek,s_udlek,s_umtjs&s_udeks&g_gy&e_lj1,s_udeks&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("mc,cs,px,xy,tm,t1") then
if gysfm(eklie("form"),ekbiao,"ek_mc='"&aistr(aireq("mc"))&"' and "&esrew("ek",ew_sn),"ek_",1) then
e_ma=e_ma&aigo(s_umtjs&s_udeks&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umtjs&s_udeks&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_udeks&s_ztsb,1)
end if
else
e_ma=ekform(0,ekfqx)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=ekedit()
'-----------------------------------
Function ekedit(ekfqx)
ew_bt=s_umxgs&s_udeks&","&ew_bt:ew_zt=s_umxgs&s_udeks&","&ew_zt:ew_nr=s_umxgs&s_udeks&","&ew_nr
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udek&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_udeks&"</a></li>"
e_mt=esbts(s_udxek,s_udlek,s_umxgs&s_udeks&g_gy&eshref(s_umgl&g_urg&s_udek&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_udeks&g_gy&e_lj1&g_gx&s_udeks&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("mc,cs,px,xy,tm,t1") then
if gysfm(eklie("form"),ekbiao,"ek_id="&aiint(aireq("id"))&" or (ek_id<>"&aiint(aireq("id"))&" and ek_mc='"&aistr(aireq("mc"))&"')","ek_",2) then
e_ma=e_ma&aigo(s_umxgs&s_udeks&s_ztcg,e_lj0)
else
e_ma=e_ma&aigo(s_umxgs&s_udeks&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_udeks&s_ztsb,1)
end if
else
if gysread(eklie("all"),ekbiao,"ek_id="&aiint(g_u3)&"","") then
ew_bt=ek_mc&","&ew_bt:ew_zt=ek_mc&","&ew_zt:ew_nr=ek_mc&","&ew_nr
e_ma=ekform(1,ekfqx)&e_ma
else
e_ma=e_ma&aigo(s_udeks&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=ekdel()
'-----------------------------------
Function ekdel(ekfqx)
ew_bt=s_udeks&s_umscs&","&ew_bt:ew_zt=s_udeks&s_umscs&","&ew_zt:ew_nr=s_udeks&s_umscs&","&ew_nr
e_wl=e_wl&"<li>"&s_udeks&s_umscs&"</li>"
e_mt=esbts(s_udxek,s_udlek,s_umscs&s_udeks,s_umtjs&s_udeks&g_gy&e_lj1&g_gx&s_udeks&s_umlbs&g_gy&e_lj0)
if e_gdj>2 then
if aiint(g_u3)>0 then
if gysdel(ekbid,ekbiao,"ek_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_udeks&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udeks&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(ekbid,ekbiao,esrew("ek",ew_sn)) then
e_ma=e_ma&aitiao(s_udeks&s_umscs&s_ztcg,e_lj0,i_nmtz)
else
e_ma=e_ma&aigo(s_udeks&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'show
'=ekshow()
'-----------------------------------
Function ekshow(ekfid)
if aibj(g_u0,s_umgl) then
ekwhere="ek_id="&aiint(ekfid)&""
else
ekwhere="ek_id="&aiint(ekfid)&" and ek_xy>0"
end if
if gysread(eklie("all"),ekbiao,ekwhere,"") then
ew_bt=ek_mc&","&ew_bt:ew_zt=ek_mc&","&ew_zt:ew_nr=ek_mc&","&ew_nr
dim ekdsx,ekdpur,ekdpg,ekdmm
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udek&g_urg&s_umxx&g_urg&ek_id&g_urz,77)&""">"&s_udeks&s_umxxs&"</a></li>"
if ainull(g_u4) then
ekdpg=1
else
ekdpg=aiint(g_u4)
end if
ekdmm=g_u5
e_mt=esbts(ekdsx,s_udlek,s_udeks&s_umxxs&g_gy&eshref(s_umgl&g_urg&s_udek&g_urg&s_umxx&g_urg&ek_id&g_urz,77),s_umtjs&s_udeks&g_gy&e_lj1&g_gx&s_udeks&s_umlbs&g_gy&e_lj0)
ekdpur=eshref(s_umgl&g_urg&s_udek&g_urg&s_umxx&g_urg&g_gp&g_urg&ekdmm&g_urz,77)
else
e_wl=e_wl&"<li><a href="""&eshref(s_udek&g_urg&s_umxx&g_urg&ek_id&g_urz,66)&""">"&s_udeks&s_umxxs&"</a></li>"
if ainull(g_u3) then
ekdpg=1
else
ekdpg=aiint(g_u3)
end if
ekdmm=g_u4
e_mt=esbts(ekdsx,s_udlek,s_umzss&s_udeks&g_gy&eshref(s_udek&g_urg&s_umzs&g_urg&ek_id&g_urz,1),s_udeks&s_umlbs&g_gy&e_lj0)
ekdpur=eshref(s_udek&g_urg&s_umzs&g_urg&g_gp&g_urg&ekdmm&g_urz,1)
end if
icdcb=ek_mc&"<span>"&aiarr(i_bxy,"|",aiint(ek_xy))&"</span>"
'--------------------------------HENG 0
if aiint(ek_cs)>0 then icdcd=icdcd&"搜索次数："&ek_cs&""
if not ainull(ek_tm) then icdcd=icdcd&aitms(" 首次搜索时间：",ek_tm,9)
if cdate(ek_t1)>aicd(ek_tm) then icdcd=icdcd&aitms(" 最近搜索：",ek_t1,3)
if aiint(ek_px)>0 then icdcd=icdcd&" 排序："&aiint(ek_px)
'--------------------------------HENG 1
'--------------------------------CONTENT 0
icdci=esnrgys(ek_nr,ekdpur,ekdpg)
icdcj="<a target=""_blank"" href="""&eshref(s_umso&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&aijia(ek_mc)&g_urz,1)&""">点击搜索【"&ek_mc&"】</a>"
'icnr(icdty=0标题|1,icddm=短名,icdcb=标题,icdcc=摘要,icdcd=横条备注,icdcf=左侧封面图,icdcg=右侧备注,icdci=内容,icdcj=媒体展示,icdcm=点评分享区)
icdty=9
e_ma=e_ma&icnr(icdty,icddm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm)
'--------------------------------CONTENT 1
else
e_ma=e_ma&aigo(s_udeks&s_ztno,1)
end if
End Function
'-----------------------------------
'list
'=eklist()
'-----------------------------------
Function eklist(ekfqx)
dim eklpg,eklps,eklpuq,eklpuh,eklpur,eklgrr,eklpum
if ekfqx=1 then
e_mt=esbts(s_udxek,s_udlek,s_udeks&s_umlbs&g_gy&e_lj0,s_umtjs&s_udeks&g_gy&e_lj1)
eklpum=77
eklpuq=s_umgl&g_urg&s_udek
lidms=g_u2
eklpuh=g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9
eklpur=eshref(eklpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&eklpuh&g_urz,eklpum)
eklpg=aiint(g_u3)
eklps=aiint(g_u4)
else
e_mt=esbts(s_udxek,s_udlek,s_udeks&s_umlbs&g_gy&e_lj0,"")
eklpum=11
eklpuq=s_udek
lidms=g_u1
eklpuh=g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8
eklpur=eshref(eklpuq&g_urg&lidms&g_urg&g_gp&g_urg&g_gp&g_urg&eklpuh&g_urz,eklpum)
eklpg=aiint(g_u2)
eklps=aiint(g_u3)
end if
if ainull(lidms) then lidms=s_umlb
iclls=icliqls(5,lidms,eshref(eklpuq&g_urg&g_gg&g_urg&g_urg&g_urg&eklpuh&g_urz,eklpum))
Call eksers()
e_mz=e_mz&icliq(iclls,eklpuq&g_urg&lidms,eklpuh,e_gdj,ekfqx,"ek")

Call eksersql()
if eklps=0 then
if aibj(lidms,s_umlpy) then
eklps=i_nmhc
else
eklps=i_nmlb
end if
end if

'@@ek_id,1ek_mc,2ek_cs,3ek_px,4ek_tm,5ek_t1,6ek_xy
if gyslist(ekbid,eklie(s_umlb),ekbiao,ekwhere,ekorder,eklpur,eklpg,eklps,200,"") then
lidti=""
'top------0
if aibj(lidms,s_umlb) then
if ekfqx=1 then lidti=lidti&"<b>管理</b>"
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


if ekfqx=1 then
lidgl="<b><input type=""checkbox"" id=""sid"" name=""sid"" value="""&gysay(0)&""">"&aibuttonk(eshref(s_umgl&g_urg&s_udek&g_urg&s_umxg&g_urg&gysay(0)&g_urz,77),"","","","f-sb",s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udek&g_urg&s_umsc&g_urg&gysay(0)&g_urz,77),s_umscs&s_udeks&s_ztqr,"","","f-sb",s_umscs)&"</b>"
lidlj=eshref(s_umgl&g_urg&s_udek&g_urg&s_umxx&g_urg&gysay(0)&g_urz,1)
else
lidlj=eshref(s_udek&g_urg&s_umxx&g_urg&gysay(0)&g_urz,1)
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

e_mz=e_mz&iclih(gyspage,e_gdj,ekfqx,eshref(s_umgl&g_urg&s_udek&g_urg&s_umsc&"-x"&g_urz,77),"ek")
e_ma=e_ma&e_mx&e_mzs&e_mz
End Function
'-----------------------------------
'=eksers()
'Call eksers()
'-----------------------------------
Function eksers()
icdssp="排序|次数|排序|推荐|时间|更新|名称"
icdrrp=split("ek_id asc|ek_cs desc|ek_px desc|ek_xy desc|ek_tm desc|ek_t1 desc|ek_mc asc","|")
icdssf="范围|推荐|"&esqday(0)&"|普通"
if e_uxy>2 then icdssf=icdssf&"|禁用"
icdrrf=split("|ek_xy>1|"&esqday("ek_tm")&"|ek_xy=1|ek_xy=0","|")
icdssx="项目|标题|内容|时间|更新"
if e_uxy>2 then icdssx=icdssx&"|推广"
icdrrx=split("ek_mc|ek_mc|ek_nr|ek_tm|ek_t1|ek_xx","|")
icdssm=i_bsm
End Function
'-----------------------------------
'=eksersql(ekfstr)
'-----------------------------------
Function eksersql()
Call icserq()
ekwhere=iclwhere
ekorder=iclorder
'order
if ainull(ekorder) then ekorder=ekordermo
'admin
if not aibj(g_u0,s_umgl) then
if not ainull(ekwhere) then ekwhere=" and "&ekwhere
ekwhere="ek_xy>0"&ekwhere
end if
End Function
%>