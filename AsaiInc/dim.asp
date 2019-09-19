<%
'EESai-----------------------EESai
dim e_wl,e_wr,e_mt,e_ma,e_mx,e_my,e_mz,e_mzs,e_lj0,e_lj1,e_tur,e_tuw,e_tug,e_tuh
dim e_ii,e_idu,e_idi,e_aiids,e_aiidl,e_man,e_skt,e_skc,e_ske,e_sks,e_tci
dim e_xa,e_lcss,e_lonload,e_cdy,gyshtml,gystemp,esplud,e_ler,e_lss,e_js
dim lidms,lidgl,lidtt,lidlj,lidbt,lidti,lids1,lids2,lids3,lids4,treejsl
dim icdty,icddm,icdcb,icdcc,icdcd,icdcf,icdcg,icdci,icdcj,icdcm
dim csppt,csppx,cstc,csyz,eeslin
dim e_psl,e_psa,e_psb,e_pss,e_psx,e_psc,e_pscb,e_psci,e_pscs,e_lni
e_psci=0
e_tug=i_dir
e_tuh=0
e_xa=0
e_tci=0
e_lni=0
'check sys dir
function dkdir(dkfty,dkfstr)
if ainull(dkfstr) then
dkdir=true
else
dim dkds2,dkds3,dkds1
dkds3=",index,default,"&s_umfb&","&s_umtj&","&s_umxg&","&s_umsc&","&s_umzs&","&s_umxx&","&s_umgl&","&s_umqb&","&s_umso&","&s_udukw&","&s_udgg&","&s_udee&","&s_udux&","&s_uduh&","&s_uduq&","&s_uduy&","&s_udut&","&s_udeq&","&s_udek&","&s_udey&","&s_udel&","&s_udew&","&s_udep&","&s_udef&","&s_udea
dkds2=","&s_umlpy&","&s_umlb&","&s_umlp&","&s_umlbw&","&s_umlpw&","&s_umlpc&","&s_umxs&","&s_umds
dkds1=",index,default,"&s_umfb&","&s_umtj&","&s_umxg&","&s_umsc&","&s_umzs&","&s_umxx&","&s_umgl&","&s_umqb&","&s_umso&","&s_udukw&","&s_udus&","&s_udbb&","&s_udgg&","&s_uded&","&s_udee&","&s_udux&","&s_uduh&","&s_uduq&","&s_uduy&","&s_udut&","&s_udeq&","&s_udek&","&s_udey&","&s_udel&","&s_udew&","&s_udbb&","&s_udep&","&s_udef&","&s_udea
if dkfty=4 then
if instr(lcase(dkds3&dkds2&","),","&dkfstr&",")>0 or ainull(dkfstr) then
dkdir=true
else
dkdir=false
end if
elseif dkfty=3 then
if instr(lcase(dkds2&",,"),","&split(dkfstr,"-")(0)&",")>0 or ainull(dkfstr) then
dkdir=true
else
dkdir=false
end if
elseif dkfty=2 then
if instr(lcase(dkds2&",,"),","&dkfstr&",")>0 or ainull(dkfstr) then
dkdir=true
else
dkdir=false
end if
else
if instr(lcase(dkds2&dkds1&","),","&dkfstr&",")>0 or ainull(dkfstr) then
dkdir=true
else
dkdir=false
end if
end if
end if
'response.Write dkdir&"oooooooooooo"
end function
'inc-----------------------inc
dim iclls,iclwhere,iclorder,iclapp,fi
dim icdssx,icdrrx,icdssm,icdssf,icdrrf,icdssp,icdrrp,icvrr,icvep,icveps,icvef,icvsx,icvsm,icvsf,icvsp,icvss
'eeee-----------------------eeee
dim ee_id,ee_ew,ee_mc,ee_mm,ee_dj,ee_xy,ee_us,ee_jb,ee_xi,ee_xo,ee_tm,ee_ot,ee_xt
dim eebiao,eebid,eewhere,eeorder,eewheremo,eeordermo
eebiao=w_dbqz&"ee"
eebid="ee_id"
if ew_sn="0" or ew_sn="" then
eewheremo="ee_xy>0"
else
eewheremo="ee_xy>0 and "&esrew("ee",ew_sn)
end if
eeordermo="ee_dj desc"
'gggg-----------------------gggg
dim gg_id,gg_ew,gg_gy,gg_sn,gg_er,gg_ck,gg_cg,gg_bt,gg_lj,gg_jg,gg_tm,gg_t1,gg_ty,gg_xx,gg_jk,gg_jz,gg_jd,gg_px,gg_xy,gg_nr,gg_xt
dim ggbiao,ggbid,ggwhere,ggorder,ggwheremo,ggordermo,d_sggls,gglty
ggbiao=w_dbqz&"gg"
ggbid="gg_id"
ggwheremo=""
ggordermo="gg_id desc"
d_sggls=s_umlb
'usus-----------------------usus
dim us_id,us_sj,us_er,us_mm,us_ef,us_ff,us_zy,us_zs,us_as,us_ax,us_ab,us_ah,us_ar,us_az,us_ad,us_bt,us_ss,us_ca,us_ct,us_dz,us_dh,us_em,us_qm,us_up,us_ip,us_t1,us_t2,us_ux,us_uy,us_hi,us_xi,us_xo,us_jb,us_jy,us_jq,us_xy,us_zx,us_sb,us_tm,us_nr,us_nx,us_xt
dim usbiao,usbid,uswhere,usorder,uswheremo,usordermo,uslef,d_susls,d_ussx
d_ussx=0
usbiao=w_dbqz&"us"
usbid="us_id"
uswheremo="us_xy>0"
usordermo="us_id desc"
d_susls=s_umlpw
'uuuu-----------------------uuuu
dim uu_id,uu_u1,uu_b1,uu_z1,uu_x1,uu_u2,uu_b2,uu_z2,uu_x2,uu_tm,uu_t1
dim uubiao,uubid,uuwhere,uuorder,uuwheremo,uuordermo,d_suuls,uulty
uubiao=w_dbqz&"uu"
uubid="uu_id"
uuwheremo="uu_xy>0"
uuordermo="uu_id desc"
d_suuls=s_umlb
'unun-----------------------unun
dim un_id,un_sn,un_bt,un_nr,un_up,un_us,un_uz,un_sl,un_tm,un_ef,un_xy,un_uc,un_xt
dim unbiao,unbid,unwhere,unorder,unwheremo,unordermo,unlef,d_sunls,unuzer,unucxy
unbiao=w_dbqz&"un"
unbid="un_id"
unwheremo="un_xy>0"
unordermo="un_id desc"
d_sunls=s_umlb
unuzer=""
unucxy=0
'ujuj-----------------------ujuj
dim uj_id,uj_us,uj_ty,uj_co,uj_tm
dim ujbiao,ujbid,ujwhere,ujorder,ujwheremo,ujordermo
ujbiao=w_dbqz&"uj"
ujbid="uj_id"
ujwheremo=""
ujordermo="uj_id desc"
'uxux-----------------------uxux
dim ux_id,ux_co,ux_tm,ux_us,ux_u1,ux_ya,ux_y1,ux_t1,ux_ty
dim uxbiao,uxbid,uxwhere,uxorder,uxwheremo,uxordermo
uxbiao=w_dbqz&"ux"
uxbid="ux_id"
uxwheremo=""
uxordermo="ux_id desc"
'uhuh-----------------------uhuh
dim uh_id,uh_bt,uh_sn,uh_us,uh_nl,uh_ns,uh_ty,uh_jq,uh_je,uh_xy,uh_tm,uh_t1,uh_t2,uh_xt
dim uhbiao,uhbid,uhwhere,uhorder,uhwheremo,uhordermo
uhbiao=w_dbqz&"uh"
uhbid="uh_id"
uhwheremo=""
uhordermo="uh_id desc"
'uquq-----------------------uquq
dim uq_id,uq_uh,uq_sn,uq_us,uq_u1,uq_xy,uq_tm
dim uqbiao,uqbid,uqwhere,uqorder,uqwheremo,uqordermo
uqbiao=w_dbqz&"uq"
uqbid="uq_id"
uqwheremo=""
uqordermo="uq_id desc"
'uyuy-----------------------uyuy
dim uy_id,uy_sn,uy_ty,uy_yr,uy_uh,uy_tm,uy_t1,uy_j1,uy_e1,uy_s1,uy_j2,uy_e2,uy_s2,uy_j3,uy_e3,uy_s3,uy_m1,uy_h1,uy_c1,uy_d1,uy_m2,uy_h2,uy_c2,uy_d2,uy_xy,uy_fk,uy_ft,uy_zt,uy_pf,uy_ot,uy_xt
dim uybiao,uybid,uywhere,uyorder,uywheremo,uyordermo,d_suyls,d_uytyrr,d_uydtty,d_uydtzt,d_uydtft,d_uyddts
uybiao=w_dbqz&"uy"
uybid="uy_id"
uywheremo=""
uyordermo="uy_id desc"
d_suyls=s_umlb
'utut-----------------------utut
dim ut_id,ut_sj,ut_sn,ut_mc,ut_xi,ut_px,ut_xy,ut_ot
dim utbiao,utbid,utwhere,utorder,utwheremo,utordermo
utbiao=w_dbqz&"ut"
utbid="ut_id"
utwheremo="ut_xy>0"
utordermo="ut_id desc"
'eqeq-----------------------eqeq
dim eq_id,eq_ew,eq_sn,eq_mc,eq_nr,eq_cs,eq_px,eq_tm,eq_t1,eq_xx,eq_xy
dim eqbiao,eqbid,eqwhere,eqorder,eqwheremo,eqordermo
eqbiao=w_dbqz&"eq"
eqbid="eq_id"
eqwheremo="eq_xy>0 and "&esrew("eq",ew_sn)
eqordermo="eq_px desc"
'ekek-----------------------ekek
dim ek_id,ek_ew,ek_sn,ek_mc,ek_nr,ek_cs,ek_px,ek_tm,ek_t1,ek_xx,ek_xy
dim ekbiao,ekbid,ekwhere,ekorder,ekwheremo,ekordermo
ekbiao=w_dbqz&"ek"
ekbid="ek_id"
ekwheremo="ek_xy>0 and "&esrew("ek",ew_sn)
ekordermo="ek_px desc"
'eyey-----------------------eyey
dim ey_id,ey_ew,ey_ty,ey_es,ey_em,ey_er,ey_mm,ey_bt,ey_yr,ey_tm,ey_ip,ey_yh,ey_t1,ey_xy,ey_ot
dim eybiao,eybid,eywhere,eyorder,eywheremo,eyordermo,d_seyls,eylfl
eybiao=w_dbqz&"ey"
eybid="ey_id"
eywheremo=""
eyordermo="ey_id desc"
d_seyls=s_umlb
'elel-----------------------elel
dim el_id,el_sn,el_mc,el_xy,el_px,el_ot,el_xt
dim elbiao,elbid,elwhere,elorder,elwheremo,elordermo
elbiao=w_dbqz&"el"
elbid="el_id"
elwheremo="el_xy>0"
elordermo="el_px desc"
'ewew-----------------------ewew
dim ew_id,ew_sn,ew_mc,ew_bt,ew_nr,ew_zt,ew_ur,ew_ui,ew_cp,ew_sk,ew_ps,ew_py,ew_ba,ew_lr,ew_lq,ew_ls,ew_lh,ew_lc,ew_lj,ew_le,ew_lz,ew_lb,ew_lo,ew_hc,ew_tj,ew_c0,ew_n0,ew_c1,ew_n1,ew_c2,ew_n2,ew_c3,ew_n3,ew_pt,ew_mma,ew_mmb,ew_mmc,ew_mmd,ew_kx,ew_kt,ew_kz,ew_kg,ew_ky,ew_kf,ew_is,ew_il,ew_ig,ew_ts,ew_tl,ew_tg,ew_s1,ew_u1,ew_p1,ew_s2,ew_u2,ew_p2,ew_s3,ew_u3,ew_p3,ew_s4,ew_u4,ew_p4,ew_s5,ew_u5,ew_p5,ew_s6,ew_u6,ew_p6,ew_pg,ew_vy,ew_vi,ew_vb,ew_vg,ew_vs,ew_ap,ew_gn,ew_dj,ew_pj,ew_sz,ew_sp,ew_lm,ew_cf,ew_qz,ew_hz,ew_tc,ew_sc,ew_pl,ew_pz,ew_lt,ew_ll,ew_dd,ew_yz,ew_sh,ew_bq,ew_xy,ew_px,ew_kj,ew_ot,ew_xt
dim ewbiao,ewbid,ewwhere,eworder,ewwheremo,ewordermo
ewbiao=w_dbqz&"ew"
ewbid="ew_id"
ewwheremo="ew_xy>0"
ewordermo="ew_px desc"
'ukuk-----------------------ukuk
dim uk_id,uk_ew,uk_us,uk_sn,uk_ef,uk_cy,uk_cs,uk_ka,uk_kb,uk_kc,uk_kd,uk_fl,uk_up,uk_mc,uk_bt,uk_co,uk_nr,uk_zt,uk_ur,uk_xy,uk_px,uk_ot,uk_tm,uk_tn,uk_t1,uk_xt
dim ukbiao,ukbid,ukwhere,ukorder,ukwheremo,ukordermo,uklef,d_sukls,ukskdr,ukskin
ukbiao=w_dbqz&"uk"
ukbid="uk_id"
ukwheremo=""
ukordermo="uk_id desc"
d_sukls=s_umlpc
ukskdr=""
ukskin=""
'bbbb-----------------------bbbb
dim bb_id,bb_ew,bb_ef,bb_sx,bb_dx,bb_jx,bb_xx,bb_sn,bb_bt,bb_ot,bb_nr,bb_up,bb_tm,bb_xi,bb_xy,bb_xt,bb_us,bb_um,bb_t1,bb_zi,bb_hi,bb_qx,bb_jj,bb_mm
dim bbbiao,bbbid,bbwhere,bborder,bbwheremo,bbordermo,d_sbbls,d_bblq,d_ysl,d_ysz
bbbiao=w_dbqz&"bb"
bbbid="bb_id"
bbwheremo="bb_xy>0"
bbordermo="bb_xx asc,bb_id asc"
d_sbbls=s_umds&"-k"
'epep-----------------------epep
dim ep_id,ep_ew,ep_el,ep_sn,ep_mc,ep_dm,ep_sk,ep_sx,ep_bs,ep_ls,ep_xy,ep_px,ep_qw,ep_qx,ep_lm,ep_sp,ep_pl,ep_zs,ep_pj,ep_nr,ep_ef,ep_cs,ep_ot,ep_fl,ep_xt
dim epbiao,epbid,epwhere,eporder,epwheremo,epordermo,epzsda,epzsdb
ep_sx=0
epbiao=w_dbqz&"ep"
epbid="ep_id"
epwheremo="ep_xy>0"
epordermo="ep_px desc,ep_id asc"
'efef-----------------------efef
dim ef_id,ef_ew,ef_el,ef_ep,ef_sx,ef_dx,ef_jx,ef_xx,ef_sn,ef_bt,ef_ot,ef_nr,ef_up,ef_tm,ef_xi,ef_xy,ef_xt,ef_us
dim efbiao,efbid,efwhere,eforder,efwheremo,efordermo,d_sefls,d_sefsx
efbiao=w_dbqz&"ef"
efbid="ef_id"
efwheremo="ef_xy>0"
efordermo="ef_xx asc,ef_id asc"
d_sefls=s_umds
'eaea-----------------------eaea
dim ai_id,ai_ew,ai_el,ai_ep,ai_ef,ai_us,ai_um,ai_ee,ai_eq,ai_sn,ai_bt,ai_jj,ai_ss,ai_nr,ai_tm,ai_xy,ai_px,ai_hi,ai_xi,ai_bd,ai_bc,ai_jg,ai_jy,ai_oz,ai_oy,ai_t1,ai_t2,ai_mm,ai_up,ai_uf,ai_cs,ai_ot,ai_pl,ai_yy,ai_xt,ai_sb
dim eabiao,eabid,eawhere,eaorder,eawheremo,eaordermo,d_seals,d_alie,d_alzy
dim eupdmxx,eupdmxr,eupdmrr,eupdmud,eupdmi,eupdmj,eupdmlin,eupdmnr
eabiao=w_dbqz&"ai"
eabid="ai_id"
eawheremo="ai_xy>0"
eaordermo="ai_id desc"
d_seals=s_umlpw
'+++++++++++++++++++++++++++teshu!
%>