<%
Call aiurl(i_html)
Call esfcj(i_nmlc,i_nmtd,g_u)
'-----------------------------------
'Assignment
'=esq()
'-----------------------------------
Function esq()
if aibj(g_u0,s_udbb) or instr(lcase(g_ud)&"/",lcase(s_dradmin))>0 or instr(lcase(g_ud)&"/",lcase(s_drplug))>0 or instr(lcase(g_ud)&"/",lcase(s_druser))>0 then
'default
elseif ainull(g_u1) and ainull(g_u2) and ainull(g_u3) and (aibj(g_u0,"index") or aibj(g_u0,"index-") or aibj(g_u0,"default") or aibj(g_u0,"default-") or ainull(g_u0)) then
Call dohc(g_u0,"0")
'index
elseif ainull(g_u1) and ainull(g_u2) and ainull(g_u3) and not ainull(g_u0) then
Call dohc(g_u0,"0")
end if
dim ewlies,ewurlr,ewurlapp
e_tuw=lcase(g_uhost)
if w_wwkg>0 then
if g_um<>"" and g_umi<>"" then
if instr(","&i_wwyx&","&i_htmlw&","&w_htmls&",",","&g_um&",")=0 and instr(","&w_moby&",",","&g_umi&",")>0 then
g_umx="1"
e_tuw=g_umi
end if
end if
end if
ewurlr=replace(lcase(g_uurl),"default.asp","")
ewurlapp=replace(replace(e_tuw,".",""),":","")
g_app=esapm(0,s_udew&g_apj&ewurlapp)
e_tur="http://"&e_tuw&e_tug
if g_errx then Call saierr(1,"do——esq——"&e_tuw&"网站信息即将存入"&g_app)
ewlies="ew_id,ew_sn,ew_mc,ew_bt,ew_nr,ew_zt,ew_ur,ew_ui,ew_cp,ew_sk,ew_ps,ew_py,ew_ba,ew_lr,ew_lq,ew_ls,ew_lh,ew_lc,ew_lj,ew_le,ew_lz,ew_lb,ew_lo,ew_hc,ew_tj,ew_c0,ew_n0,ew_c1,ew_n1,ew_c2,ew_n2,ew_c3,ew_n3,ew_pt,ew_mma,ew_mmb,ew_mmc,ew_mmd,ew_kx,ew_kt,ew_kz,ew_kg,ew_ky,ew_kf,ew_is,ew_il,ew_ig,ew_ts,ew_tl,ew_tg,ew_s1,ew_u1,ew_p1,ew_s2,ew_u2,ew_p2,ew_s3,ew_u3,ew_p3,ew_s4,ew_u4,ew_p4,ew_s5,ew_u5,ew_p5,ew_s6,ew_u6,ew_p6,ew_pg,ew_vy,ew_vi,ew_vb,ew_vg,ew_vs,ew_ap,ew_gn,ew_dj,ew_pj,ew_sz,ew_sp,ew_lm,ew_cf,ew_qz,ew_hz,ew_tc,ew_sc,ew_pl,ew_pz,ew_lt,ew_ll,ew_dd,ew_yz,ew_sh,ew_bq,ew_xy,ew_px,ew_kj,ew_ot"
if gysread(ewlies,w_dbqz&"ew","ew_ur like '%,"&e_tuw&",%'",g_app) then
aiTF=true
else
aiTF=gysread(ewlies,w_dbqz&"ew","ew_xy>0",g_app)
end if
if aiTF then
if ew_ur<>"" then e_tuw=split(ew_ur&",",",")(1)
if not ainull(ew_ui) then e_tur=ew_ui
if g_errx then Call saierr(1,"do——esq——当前网站信息：名称="&ew_mc&"，编码="&ew_sn&"，主域名="&e_tur&"")
else
if g_errx then Call saierr(1,"do——esq——没有对应的网站信息")
'no site use config.asp
if w_mour<>"" and w_wwkg=0 and instr(g_u,w_mour)=0 then
Response.Redirect w_mour
response.end()
end if
ew_gn=1
ew_vi=2
end if
'response.Write now()&"---------------------"&ew_sn
ew_ap=aiint(ew_ap):ew_gn=aiint(ew_gn):ew_dj=aiint(ew_dj):ew_pj=aiint(ew_pj):ew_sz=aiint(ew_sz):ew_sp=aiint(ew_sp):ew_lm=aiint(ew_lm):ew_cf=aiint(ew_cf):ew_qz=aiint(ew_qz):ew_hz=aiint(ew_hz):ew_tc=aiint(ew_tc):ew_sc=aiint(ew_sc):ew_pl=aiint(ew_pl):ew_pz=aiint(ew_pz):ew_lt=aiint(ew_lt):ew_ll=aiint(ew_ll):ew_dd=aiint(ew_dd):ew_yz=aiint(ew_yz):ew_sh=aiint(ew_sh):ew_bq=aiint(ew_bq)
if instr(lcase(g_ud)&"/",s_drwap)>0 then
e_tuh=1
e_tug=ewurlr
end if
if ainull(ew_kj) then ew_kj=s_uduk
if ainull(ew_sn) then ew_sn=w_mosn
if ainull(ew_sk) then
ew_sk=i_msk
else
if not anfilecheck(i_dir&ew_sk&"asaisyscss_.css") then
ew_sk=i_msk
end if
end if
if ainull(ew_mc) then ew_mc=w_motm
if ainull(ew_bt) then ew_bt=w_mott
if ainull(ew_zt) then ew_zt=w_motk
if ainull(ew_nr) then ew_nr=w_motd
if ainull(ew_cp) then ew_cp=w_motc
if ainull(ew_ig) then ew_ig="logo.gif"
if instr(lcase(g_ud)&"/",s_drwap)=0 then
e_wl="<li><a href="""&e_tur&""">"&ew_mc&"</a></li>"
else
e_wl="<li><a href="""&e_tur&s_drwap&""">"&ew_mc&"</a></li>"
end if
e_wr=e_wr
e_mt=e_mt
e_ma=e_ma
End Function
'-----------------------------------
'Assignment
'=doq(dofus=0no|1us|2uk,dofusk,dofty=0ep|1so|2uk|3ukWEB|6sys|7sys+ty|8bbs|9class|10default|11map,dofr0=/admin,dofr1,dofr2)
'-----------------------------------
Function doq(dofus,dofusk,dofty,dofr0,dofr1,dofr2)
dim eadef,eadljl,eadljty,eadsysty
eadef=esnff(dofr2)
eadljl=""
'GL=admin
if aibj(dofr0,s_umgl) then
eadljty=77
eadljl=s_umgl&g_urg
ew_bt="后台管理,"&ew_bt:ew_zt="后台管理,"&ew_zt:ew_nr="后台管理,"&ew_nr:ew_cp=e_gmc&","&ew_cp
if dofty=7 then eadsysty=g_u2
else
eadljty=1
if dofty=7 then eadsysty=g_u1
end if

'UK/US
if dofus>1 then
if not aibj(s_umqb,dofusk) and not ainull(dofusk) then
if dofty=3 then
Call ukread(dofusk)
elseif dofus mod 2=0 then
Call ukread(dofusk)
else
Call ukusread(dofusk)
end if
if not ainull(uk_bt) then
ew_bt=uk_bt&","&ew_bt:ew_zt=uk_zt&","&ew_zt:ew_nr=uk_co&","&ew_nr:ew_cp=uk_mc&","&ew_cp
if dofus>2 then eadljl=eadljl&s_udukw&g_urg&uk_ur&g_urg
if dofty=3 then
e_wl="<li><a href="""&i_dir&""">"&uk_mc&"</a></li>"
elseif dofty=2 then
e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">"&uk_mc&"</a></li>"
end if
end if
end if
end if

'UU=62uu+ty
if dofty=62 then
ew_bt=dofr2&","&ew_bt:ew_zt=dofr2&","&ew_zt:ew_nr=dofr2&","&ew_nr
eadljl=eadljl&dofr1&g_urg
e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">"&dofr2&"</a></li>"
e_lj0=eshref(eadljl&uulty,eadljty)
e_lj1=eshref(eadljl&s_umtj,eadljty)

'UN=63un+ef
elseif dofty=63 then
ew_bt=s_uduns&s_umlbs&","&ew_bt:ew_zt=s_uduns&s_umlbs&","&ew_zt:ew_nr=s_uduns&s_umlbs&","&ew_nr
eadljl=eadljl&s_udun&g_urg
e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">群聚主页</a></li>"
if not ainull(dofr2) and not dkdir(0,dofr2) then
Call doqef(eadljl,eadljty,dofr2)
eadljl=eadljl&dofr2&g_urg
end if
e_lj0=eshref(eadljl,eadljty)
e_lj1=eshref(eadljl&s_umtj,eadljty)

'TY=6sys
elseif dofty=6 then
ew_bt=dofr2&","&ew_bt:ew_zt=dofr2&","&ew_zt:ew_nr=dofr2&","&ew_nr
eadljl=eadljl&dofr1&g_urg
e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">"&dofr2&"</a></li>"
e_lj0=eshref(eadljl,eadljty)
e_lj1=eshref(eadljl&s_umtj,eadljty)

'TY=7sys+ty
elseif dofty=7 then
ew_bt=dofr2&","&ew_bt:ew_zt=dofr2&","&ew_zt:ew_nr=dofr2&","&ew_nr
eadljl=eadljl&dofr1&g_urg&eadsysty&g_urg
e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">"&dofr2&"</a></li>"
e_lj0=eshref(eadljl,eadljty)
e_lj1=eshref(eadljl&s_umtj,eadljty)

'TY=8bbs
elseif dofty=8 then
ew_bt=s_udbbs&s_umlbs&","&ew_bt:ew_zt=s_udbbs&s_umlbs&","&ew_zt:ew_nr=s_udbbs&s_umlbs&","&ew_nr
eadljl=eadljl&s_udbb&g_urg
e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">论坛首页</a></li>"
if not ainull(dofr2) and not dkdir(0,dofr2) then
Call doqef(eadljl,eadljty,dofr2)
eadljl=eadljl&dofr2&g_urg
end if
e_lj0=eshref(eadljl,eadljty)
e_lj1=eshref(eadljl&s_umtj,eadljty)

'TY=9class
elseif dofty=9 then
eadljl=eadljl&s_udef&g_urg
if not ainull(dofr1) and not dkdir(4,dofr1) then
Call epread(dofr1)
ew_bt=ep_mc&","&ep_dm&","&ew_bt:ew_zt=ep_mc&","&ep_dm&","&ew_zt:ew_nr=ep_mc&","&ep_dm&","&ew_nr
eadljl=eadljl&ep_sn&g_urg
e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">"&ep_mc&"</a></li>"
end if
e_lj0=eshref(eadljl,eadljty)
e_lj1=eshref(eadljl&s_umtj,eadljty)


'PINDAO=0ep
elseif dofty=11 then
ew_bt="网站导航,"&ew_bt:ew_zt="网站导航,"&ew_zt:ew_nr="网站导航,"&ew_nr
e_wl=e_wl&"<li><a href="""&eshref("map"&g_urz,1)&""">网站导航</a></li>"
elseif dofty=10 then
'default
else
'TY=1so
if dofty=1 then
ew_bt="搜索"&s_umlbs&","&ew_bt:ew_zt="搜索"&s_umlbs&","&ew_zt:ew_nr="搜索"&s_umlbs&","&ew_nr
eadljl=eadljl&s_umso&g_urg
e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">搜索"&s_umlbs&"</a></li>"
end if
'EP
if ainull(dofr1) or dkdir(0,dofr1) then
'no ep
elseif not ainull(dofr1) and not dkdir(0,dofr1) then
Call epread(dofr1)
ew_bt=ep_mc&","&ep_dm&","&ew_bt:ew_zt=ep_mc&","&ep_dm&","&ew_zt:ew_nr=ep_mc&","&ep_dm&","&ew_nr
eadljl=eadljl&ep_sn&g_urg
e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">"&ep_mc&"</a></li>"
end if
'EF
if ainull(dofr2) or dkdir(0,dofr2) then
'ew_bt=ep_dm&"首页,"&ew_bt:ew_zt=ep_dm&"首页,"&ew_zt:ew_nr=ep_dm&"首页,"&ew_nr
eadljl=eadljl&s_umqb&g_urg
'e_wl=e_wl&"<li><a href="""&eshref(eadljl,eadljty)&""">"&ep_dm&"首页</a></li>"
elseif not ainull(dofr2) and not dkdir(0,dofr2) then
Call doqef(eadljl,eadljty,dofr2)
end if
end if
End Function
Function doqef(doflq,doflty,dofstr)
dim eadfslin,eadfi,eadefwl,eadefseo
eadfslin=esnff(dofstr)
if not dkdir(0,eadfslin) and eadfslin<>"0" and not ainull(eadfslin) then
Call efread(eadfslin)
eadefseo=ef_bt&","
eadefwl="<li><a href="""&eshref(doflq&ef_sn&g_urg,doflty)&""">"&ef_bt&"</a></li>"
for eadfi=1 to 8
if not ainull(ef_sx) and not aibj(ef_sx,s_umqb) and not aibj(ef_sx,"0") then
Call efread(ef_sx)
eadefseo=eadefseo&ef_bt&","
eadefwl="<li><a href="""&eshref(doflq&ef_sn&g_urg,doflty)&""">"&ef_bt&"</a></li>"&eadefwl
else
if eadfi>1 then Call efread(eadfslin)
exit for
end if
next
ew_bt=eadefseo&ew_bt:ew_zt=eadefseo&ew_zt:ew_nr=eadefseo&ew_nr
e_wl=e_wl&eadefwl
end if
End Function
'-----------------------------------
'Cache default/index
'=dohc(cafile,cafhc)
'-----------------------------------
Function dohc(cafile,cafhc)
if len(cafile&",")<3 then cafile="default"
dohc=""
if right(cafile,1)<>"-" then
if ew_hc<>"" and ew_hc<>"0" then
if instr(ew_hc&",",cafile&",")>0 or ew_hc="eesai" then

if g_apptm=1 then
if application("G"&g_atxx&"X")<>"1" then
Call ankop(0,1,0,i_hc4&g_apj)
Call ankop(0,1,0,i_hc3&g_apj)
application.lock
application("G"&g_atxx&"X")="1"
application.unlock
end if
'response.Write application("G"&g_atxx&"X")&i_hc4&g_apj&"G"&g_atxx&"X"
else
if application("G"&g_atxx&"X")<>"0" then
application.lock
application("G"&g_atxx&"X")="0"
application.unlock
end if
dim cadurl
cadurl=replace(replace(lcase(g_uhost),".",""),":","")
if instr(lcase(g_ud)&"/",s_drwap)>0 then cafile=cafile&"-wap"
if aibj(cafhc,"0") then
dohc=ankop(1,0,0,esapm(4,i_htmld&g_apj&cadurl&"-"&cafile))
else
Call ankop(2,0,cafhc,esapm(4,i_htmld&g_apj&cadurl&"-"&cafile))
end if
end if

end if
end if
end if
End Function
'-----------------------------------
'get skin file
'=dosk(absd,moren,file)
'-----------------------------------
Function dosk(dofdr,dofmr,dofstr)
'response.Write "{"&dofdr&"-"&dofmr&"-"&dofstr&"}<br />"
dim dodfile,dodir
if ainull(dofdr) and ainull(dofmr) and ainull(dofstr) then
dodfile=""
dodir=""
ukskdr=""
else
if instr(lcase(g_ud)&"/",s_drwap)>0 then
'dodfile="../"&ew_sk&"sai/a/wap.asp"
'if not anfilecheck(dodfile) then dodfile="../"&i_msk&"sai/a/wap.asp"
'wap---0
if not ainull(dofmr) then
dodir="../"&ew_sk&"sai/e/"
dodfile=dodir&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile=dodir&"sai.asp"
  if not anfilecheck(dodfile) then
  dodfile="../"&ew_sk&"sai/e/"&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile="../"&ew_sk&"sai/e/sai.asp"
  if not anfilecheck(dodfile) then
  dodfile="../"&i_msk&"sai/e/"&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile="../"&i_msk&"sai/e/sai.asp"
  end if
  end if
  end if
  end if
  end if
else
  dodir="../"&ew_sk&"sai/e/"
  dodfile=dodir&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile=dodir&"sai.asp"
  if not anfilecheck(dodfile) then
  dodfile="../"&i_msk&"sai/e/"&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile="../"&i_msk&"sai/e/sai.asp"
  end if
  end if
  end if
end if
if anfilecheck(dodir&"top.asp") then
ukskdr=dodir
else
ukskdr="../"&i_msk&"sai/e/"
end if
'wap---1
else
if aibj(dofdr,"a") then
dodfile=ew_sk&"sai/a/"&dofmr&""&dofstr&".asp"
if not anfilecheck(dodfile) then
dodfile=ew_sk&"sai/a/"&dofmr&".asp"
if ainull(dofstr) or not anfilecheck(dodfile) then
dodfile=ew_sk&"sai/a/sai.asp"
if ainull(dofstr) or not anfilecheck(dodfile) then
dodfile=i_msk&"sai/a/"&dofmr&".asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/a/sai.asp"
end if
end if
end if
end if
elseif aibj(dofdr,"b") then
if aibj(left(dofmr,2),"a/") then
dodfile=ew_sk&"sai/"&dofmr&".asp"
if not anfilecheck(dodfile) then
dodfile=ew_sk&"sai/a/sai.asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/"&dofmr&".asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/a/sai.asp"
end if
end if
end if
else
if aibj(left(dofmr,2),"8/") or aibj(left(dofmr,2),"9/") then
dodir=ew_sk&"sai/b/"
if aibj(s_umzs,g_u1) or aibj(s_umzs,g_u2) then
dodfile=dodir&"show.asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/b/show.asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/b/sai.asp"
end if
end if
else
dodfile=dodir&dofmr&".asp"
end if
if not anfilecheck(dodfile) then
dodfile=dodir&"sai.asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/b/"&dofmr&".asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/b/sai.asp"
end if
end if
end if

elseif aibj(dofmr,"8") or aibj(dofmr,"9") then
dodir=ew_sk&"sai/b/"
dodfile=dodir&dofmr&"/"&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile=i_msk&"sai/b/"&dofmr&"/"&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile=dodir&"sai.asp"
  if not anfilecheck(dodfile) then
  dodfile=i_msk&"sai/b/sai.asp"
  end if
  end if
  end if
else
if not ainull(dofmr) then
dodir=ew_sk&"sai/b/"&dofmr&"/"
dodfile=dodir&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile=dodir&"sai.asp"
  if not anfilecheck(dodfile) then
  dodfile=ew_sk&"sai/b/"&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile=ew_sk&"sai/b/sai.asp"
  if not anfilecheck(dodfile) then
  dodfile=i_msk&"sai/b/"&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile=i_msk&"sai/b/sai.asp"
  end if
  end if
  end if
  end if
  end if
if anfilecheck(dodir&"top.asp") then
ukskdr=dodir
else
dodir=ew_sk&"sai/b/"
ukskdr=""
end if
else
  dodir=ew_sk&"sai/b/"
  dodfile=dodir&dofstr&".asp"
  if not anfilecheck(dodfile) then
  dodfile=dodir&"sai.asp"
  if not anfilecheck(dodfile) then
  dodfile=i_msk&"sai/b/"&dofstr&".asp"
'response.Write dodfile&now()
  if not anfilecheck(dodfile) then
  dodfile=i_msk&"sai/b/sai.asp"
  end if
  end if
  end if
end if
end if
if ukskdr="" then
if anfilecheck(dodir&"top.asp") then
ukskdr=dodir
else
ukskdr=i_msk&"sai/b/"
end if
end if
end if

elseif aibj(dofdr,"c") then
dodir=ew_sk&"sai/c/"
dodfile=dodir&dofstr&".asp"
if not anfilecheck(dodfile) then
dodfile=dodir&"sai/c/sai.asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/c/"&dofstr&".asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/c/sai.asp"
end if
end if
end if
if anfilecheck(dodir&"top.asp") then
ukskdr=dodir
else
ukskdr=i_msk&"sai/c/"
end if

elseif aibj(dofdr,"d") then
if dofmr="" then dofmr="0"
dodir=ew_sk&"sai/d/"&dofmr&"/"
dodfile=dodir&dofstr&".asp"
if not anfilecheck(dodfile) then
dodfile=dodir&"sai.asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/d/"&dofmr&"/"&dofstr&".asp"
if dofmr<>"0" then
if not anfilecheck(dodfile) then
dodfile=ew_sk&"sai/d/0/"&dofstr&".asp"
if not anfilecheck(dodfile) then
dodfile=ew_sk&"sai/d/0/sai.asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/d/0/"&dofstr&".asp"
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/d/0/sai.asp"
end if
end if
end if
end if
else
if not anfilecheck(dodfile) then
dodfile=i_msk&"sai/d/0/sai.asp"
end if
end if
end if
end if
if anfilecheck(dodir&"top.asp") then
ukskdr=dodir
else
ukskdr=ew_sk&"sai/d/0/"
if not anfilecheck(ukskdr&"top.asp") then
ukskdr=i_msk&"sai/d/"&dofmr&"/"
if not anfilecheck(ukskdr&"top.asp") then
ukskdr=i_msk&"sai/d/0/"
end if
end if
end if

end if

end if
end if
dosk=dodfile
'response.Write "{"&dosk&"}{"&ukskdr&"}<br />"
End Function
'-----------------------------------
'READ page
'=esr()
'-----------------------------------
Function esr(skfstr,skfile)
'On Error Resume Next'display err
dim esrdfile
if instr(lcase(g_ud)&"/",s_drwap)>0 then
if ainull(ukskdr) then
esr=aninc(0,skfile)
else
esr=aninc(0,ukskdr&"top.asp")
esr=esr&aninc(0,skfile)
esr=esr&aninc(0,ukskdr&"end.asp")
end if
else
if ainull(skfstr) or skfstr="0" then
if ainull(ukskdr) then
esr=aninc(0,skfile)
else
esr=aninc(0,ukskdr&"top.asp")
esr=esr&aninc(0,skfile)
esr=esr&aninc(0,ukskdr&"end.asp")
end if
else
esr=aninc(1,skfstr)
end if
end if

if esr<>"" then
if instr(skfile,"print")>0 then
'
elseif instr(lcase(g_ud)&"/",s_drwap)>0 then
'
else
esr=aninc(0,i_dir&i_msk&"sai/Asai_H5T.asp")&esr&aninc(0,i_dir&i_msk&"sai/Asai_H5E.asp")
end if
if i_xkcj>0 and i_xtizi<>"" then esr=aicjsha(i_xkcj,i_xtizi,esr)'caiji killer
if p_upwdu<>"" then esr=aiufile(0,esr,p_upijj,p_upwdu)
if not aibj(g_u0,s_umgl) then esr=icggx(esr)
else
Response.Redirect(i_dir)
end if
esr=esr&sqlerr
End Function
%>