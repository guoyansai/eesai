<%
'++++++++++++++++++++
'EESAI main
'++++++++++++++++++++
'@@0manage/1*pd|all/2*fl|all/3list|pian|hunj|hun|hunc/4page/5psize/6ssx/7ssm/8ssf/9ssp/10sss.HTML
'@@0manage/1*pd|all/2*fl|all/3edit|add|del|del-x/4*id|*sn.HTML

'@@0*pd|all/1*fl|all/2list|pian|hunj|hun|hunc/3page/4psize/5ssx/6ssm/7ssf/8ssp/9sss.HTML
'@@0*pd|all/1*fl|all/2edit|add|del/3*id|*sn.HTML
'@@0*pd|all/1*fl|all/2show|info/3*sn/4*mm|**/5page.HTML

'@@0*pd|all|map|index.HTML
'map
if e_xa<1 and aibj(g_u0,"map") then
e_xa=e_xa+1
Call esq()
Call doq(0,"",11,g_u0,"","")
gyshtml=dohc(g_u0,"0")
if ainull(gyshtml) then
e_sks=1
e_skc=dosk("b","","sai")
gyshtml=eamap(g_u1,e_skc)
Call dohc(g_u0,gyshtml)
end if
Response.Write gyshtml
Response.End()

'search
elseif e_xa<1 and aibj(g_u0,s_umso) or aibj(g_u1,s_umso) then
if not aibj(aireq("t"),s_umso) and not ainull(aireq("t")) then
Response.Redirect eshref(aireq("t")&"//0/0/0/0/0/0/"&aijia(aireq("s"))&".html",1)
Response.End()
end if
e_xa=e_xa+1
Call esq()
if aibj(g_u0,s_umgl) then
Call doq(1,e_uer,1,g_u0,g_u2,g_u3)
else
Call doq(1,e_uer,1,g_u0,g_u1,g_u2)
end if
if e_gdj>0 and aibj(g_u0,s_umgl) and aibj(g_u1,s_umso) and dkdir(2,g_u2) then
Call ealist(512,s_umgl&g_urg&s_umso,"",g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9)
elseif e_gdj>0 and aibj(g_u0,s_umgl) and aibj(g_u1,s_umso) and not ainull(g_u2) and dkdir(2,g_u3) then
Call ealist(511,s_umgl&g_urg&s_umso&g_urg&ep_sn,"",g_u3,g_u4,g_u5,g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10)
elseif e_gdj>0 and aibj(g_u0,s_umgl) and aibj(g_u1,s_umso) and not ainull(g_u2) and not ainull(g_u4) and dkdir(2,g_u4) then
Call ealist(510,s_umgl&g_urg&s_umso&g_urg&ep_sn,g_u3,g_u4,g_u5,g_u6,g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10&g_urg&g_u11)
elseif aibj(g_u0,s_umso) and dkdir(2,g_u1) then
Call ealist(52,s_umso,"",g_u1,g_u2,g_u3,g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8)
elseif aibj(g_u0,s_umso) and not ainull(g_u1) and dkdir(2,g_u2) then
Call ealist(51,s_umso&g_urg&ep_sn,"",g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9)
elseif aibj(g_u0,s_umso) and not ainull(g_u1) and not ainull(g_u2) and dkdir(2,g_u3) then
Call ealist(50,s_umso&g_urg&ep_sn,g_u2,g_u3,g_u4,g_u5,g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("a","so","")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()

'default
elseif e_xa<1 and (aibj(g_u0,"index") or aibj(g_u0,"index-") or aibj(g_u0,"default") or aibj(g_u0,"default-") or (ainull(g_u0) and ainull(g_u1) and ainull(g_u2))) then
e_xa=e_xa+1
if i_html>1 and (aibj(g_u0,"index") or (ainull(g_u0) and ainull(g_u1) and ainull(g_u2))) then
gyshtml=anfileread(g_char,eshref(w_sn&"-"&lcase(g_uhost)&".html",3))
else
Call esq()
gyshtml=dohc(g_u0,"0")
end if
if ainull(gyshtml) then
if g_umx="1" then
if aibj(g_u0,s_umgl) then
Call doq(4,g_um,3,s_umgl,"","")
else
Call doq(4,g_um,3,"","","")
end if
if aibj(g_u0,s_umgl) and dkdir(2,g_u1) then
Call ealist(712,eshrej(s_umgl,uk_ur,"",1),"",g_u1,g_u2,g_u3,g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8)
elseif ainull(g_u0) and ainull(g_u1) then
e_skc=ukks(1,uk_cy,uk_ka):Call ealist(72,eshrej("",uk_ur,"",1),"",g_u0,g_u1,g_u2,g_u3&g_urg&g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7)
end if
Response.Write esr(0,e_skc):Response.End()
else
Call doq(0,"",10,g_u0,"","")
end if
e_sks=0
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b","","default")
end if
end if
'------get skin 1
gyshtml=eadefault(e_skc)
if ainull(gyshtml) then
if g_errx then Call saierr(1,"incindex——网站编码：["&ew_sn&"]；模板页：["&e_skc&"]有问题")
gyshtml=s_ztht
else
Call dohc(g_u0,gyshtml)
end if
end if
Response.Write gyshtml
Response.End()
'index
elseif e_xa<1 and not aibj(g_u0,s_udbb) and ainull(g_u1) and ainull(g_u2) and not ainull(g_u0) then
e_xa=e_xa+1
Call esq()
gyshtml=dohc(g_u0,0)
if ainull(gyshtml) then
if g_umx="1" then
if aibj(g_u0,s_umgl) then
Call doq(4,g_um,3,s_umgl,g_u1,"")
else
Call doq(4,g_um,3,"",g_u0,"")
end if
if aibj(g_u0,s_umgl) and not ainull(g_u1) and dkdir(2,g_u2) then
Call ealist(711,eshrej(s_umgl,uk_ur,ep_sn,1),"",g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9)
elseif not ainull(g_u0) and ainull(g_u1) and ainull(g_u2)  then
e_skc=ukks(2,uk_cy,uk_kb):Call ealist(70,eshrej("",uk_ur,ep_sn,1),g_u1,g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9)
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b",ep_sk,"index")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
elseif aibj(g_u0,s_umgl) then
Call doq(1,e_uer,0,g_u0,g_u1,g_u2)
else
Call doq(1,e_uer,0,"",g_u0,g_u1)
end if
e_sks=1
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b",ep_sk,"index")
end if
end if
'------get skin 1
gyshtml=eaindex(e_skc,g_u0)
Call dohc(ep_sn,gyshtml)
end if
Response.Write gyshtml
Response.End()

'Main show
elseif e_xa<1 then
if g_umx="1" then Call epread(s_uduk)
e_xa=e_xa+1
Call esq()

'KJ
if g_umx="1" then
if aibj(left(g_u0,len(s_umzs)),s_umzs) or aibj(left(g_u0,len(s_umxx)),s_umxx) or aibj(left(g_u1,len(s_umzs)),s_umzs) or aibj(left(g_u1,len(s_umxx)),s_umxx) or aibj(left(g_u2,len(s_umzs)),s_umzs) or aibj(left(g_u2,len(s_umxx)),s_umxx) or aibj(left(g_u3,len(s_umzs)),s_umzs) or aibj(left(g_u3,len(s_umxx)),s_umxx) or aibj(g_u2,"pp") then
Call doq(4,g_um,3,"","","")
elseif aibj(g_u0,s_umgl) then
Call doq(4,g_um,3,g_u0,g_u1,g_u2)
else
Call doq(4,g_um,3,"",g_u0,g_u1)
end if
'KJ-----------------------0
if aibj(g_u0,s_umgl) and aibj(left(g_u1,len(s_umxg)),s_umxg) and g_u2<>"" then
Call eaedit(712,g_u1,g_u2)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u1,len(s_umsc)),s_umsc) and g_u2<>"" then
Call eadel(712,g_u1,g_u2,g_u3)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umtj)),s_umtj) then
Call eaadd(711,g_u2,g_u3)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umxg)),s_umxg) and g_u3<>"" then
Call eaedit(711,g_u2,g_u3)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umsc)),s_umsc) and g_u3<>"" then
Call eadel(711,g_u2,g_u3,g_u4)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umtj)),s_umtj) then
Call eaadd(710,g_u3,g_u4)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umxg)),s_umxg) and g_u4<>"" then
Call eaedit(710,g_u3,g_u4)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umsc)),s_umsc) and g_u4<>"" then
Call eadel(710,g_u3,g_u4,g_u5)

elseif aibj(left(g_u0,len(s_umxg)),s_umxg) and g_u1<>"" then
e_skc=ukks(11,uk_cy,uk_kd):Call eaedit(72,g_u0,g_u1)
elseif aibj(left(g_u0,len(s_umsc)),s_umsc) and g_u1<>"" then
e_skc=ukks(11,uk_cy,uk_kd):Call eadel(72,g_u0,g_u1,g_u2)
elseif aibj(left(g_u1,len(s_umtj)),s_umtj) then
e_skc=ukks(4,uk_cy,uk_kd):Call eaadd(71,g_u1,g_u2)
elseif aibj(left(g_u1,len(s_umxg)),s_umxg) and g_u2<>"" then
e_skc=ukks(4,uk_cy,uk_kd):Call eaedit(71,g_u1,g_u2)
elseif aibj(left(g_u1,len(s_umsc)),s_umsc) and g_u2<>"" then
e_skc=ukks(4,uk_cy,uk_kd):Call eadel(71,g_u3,g_u2,g_u3)
elseif aibj(left(g_u2,len(s_umtj)),s_umtj) then
e_skc=ukks(4,uk_cy,uk_kd):Call eaadd(70,g_u2,g_u3)
elseif aibj(left(g_u2,len(s_umxg)),s_umxg) and g_u3<>"" then
e_skc=ukks(4,uk_cy,uk_kd):Call eaedit(70,g_u2,g_u3)
elseif aibj(left(g_u2,len(s_umsc)),s_umsc) and g_u3<>"" then
e_skc=ukks(4,uk_cy,uk_kd):Call eadel(70,g_u2,g_u3)

elseif aibj(g_u0,s_umgl) and aibj(left(g_u1,len(s_umzs)),s_umzs) and g_u2<>"" then
Call eashow(712,0,g_u2):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u1,len(s_umxx)),s_umxx) and g_u2<>"" then
Call eashow(712,1,g_u2):e_skc=ukks(4,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umzs)),s_umzs) and g_u3<>"" then
Call eashow(711,0,g_u3):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umxx)),s_umxx) and g_u3<>"" then
Call eashow(711,1,g_u3):e_skc=ukks(4,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umzs)),s_umzs) and g_u4<>"" then
Call eashow(710,0,g_u4):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umxx)),s_umxx) and g_u4<>"" then
Call eashow(710,1,g_u4):e_skc=ukks(4,uk_cy,uk_kd)

elseif aibj(left(g_u0,len(s_umzs)),s_umzs) and g_u1<>"" then
Call eashow(72,0,g_u1):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(left(g_u0,len(s_umxx)),s_umxx) and g_u1<>"" then
Call eashow(72,1,g_u1):e_skc=ukks(4,uk_cy,uk_kd)
elseif aibj(left(g_u1,len(s_umzs)),s_umzs) and g_u2<>"" then
Call eashow(71,0,g_u2):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(left(g_u1,len(s_umxx)),s_umxx) and g_u2<>"" then
Call eashow(71,1,g_u2):e_skc=ukks(4,uk_cy,uk_kd)
elseif aibj(left(g_u2,len(s_umzs)),s_umzs) and g_u3<>"" then
Call eashow(70,0,g_u3):e_skc=ukks(10,uk_cy,uk_kd)
elseif aibj(left(g_u2,len(s_umxx)),s_umxx) and g_u3<>"" then
Call eashow(70,1,g_u3):e_skc=ukks(4,uk_cy,uk_kd)

elseif aibj(g_u0,s_umgl) and dkdir(2,g_u1) then
Call ealist(712,eshrej(s_umgl,uk_ur,"",1),"",g_u1,g_u2,g_u3,g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8)
elseif aibj(g_u0,s_umgl) and not ainull(g_u1) and dkdir(2,g_u2) then
Call ealist(711,eshrej(s_umgl,uk_ur,ep_sn,1),"",g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9)
elseif aibj(g_u0,s_umgl) and not ainull(g_u1) and not ainull(g_u2) and dkdir(2,g_u3) then
Call ealist(710,eshrej(s_umgl,uk_ur,ep_sn,1),g_u2,g_u3,g_u4,g_u5,g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10)
elseif ainull(g_u0) and ainull(g_u1) then
e_skc=ukks(1,uk_cy,uk_ka):Call ealist(72,eshrej("",uk_ur,"",1),"",g_u0,g_u1,g_u2,g_u3&g_urg&g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7)
elseif not ainull(g_u0) and ainull(g_u1) and ainull(g_u2) then
e_skc=ukks(2,uk_cy,uk_kb):Call ealist(70,eshrej("",uk_ur,ep_sn,1),g_u1,g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9)
elseif not ainull(g_u0) and dkdir(2,g_u1) then
e_skc=ukks(3,uk_cy,uk_kc):Call ealist(71,eshrej("",uk_ur,ep_sn,1),"",g_u1,g_u2,g_u3,g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8)
elseif dkdir(2,g_u2) then
e_skc=ukks(3,uk_cy,uk_kc):Call ealist(70,eshrej("",uk_ur,ep_sn,1),g_u1,g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9)
end if
'KJ-----------------------1
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("d",uk_cy,"admin")
else
e_skc=dosk("d",uk_cy,"sai")
end if
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()

elseif aibj(left(g_u0,len(s_umzs)),s_umzs) or aibj(left(g_u0,len(s_umxx)),s_umxx) or aibj(left(g_u1,len(s_umzs)),s_umzs) or aibj(left(g_u1,len(s_umxx)),s_umxx) or aibj(left(g_u2,len(s_umzs)),s_umzs) or aibj(left(g_u2,len(s_umxx)),s_umxx) or aibj(left(g_u3,len(s_umzs)),s_umzs) or aibj(left(g_u3,len(s_umxx)),s_umxx) or aibj(g_u2,"pp") then
'no show
elseif aibj(g_u0,s_umgl) then
Call doq(1,e_uer,0,g_u0,g_u1,g_u2)
else
Call doq(1,e_uer,0,"",g_u0,g_u1)
end if

'ai
'ai--gl/pd/fl/dox*.html
if aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umtj)),s_umtj) then
Call eaadd(710,g_u3,g_u4)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umxg)),s_umxg) and g_u4<>"" then
Call eaedit(710,g_u3,g_u4)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umsc)),s_umsc) then
Call eadel(710,g_u3,g_u4,g_u5)
'ai--gl/pd/dox*.html
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umtj)),s_umtj) then
Call eaadd(711,g_u2,g_u3)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umxg)),s_umxg) and g_u3<>"" then
Call eaedit(711,g_u2,g_u3)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umsc)),s_umsc) then
Call eadel(711,g_u2,g_u3,g_u4)
'ai--gl/dox*.html
elseif aibj(g_u0,s_umgl) and aibj(left(g_u1,len(s_umxg)),s_umxg) and g_u2<>"" then
Call eaedit(712,g_u1,g_u2)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u1,len(s_umsc)),s_umsc) then
Call eadel(712,g_u1,g_u2,g_u3)
'ai--pd/fl/dox*.html
elseif aibj(left(g_u2,len(s_umtj)),s_umtj) or aibj(left(g_u2,len(s_umfb)),s_umfb) then
e_sks=3
Call eaadd(70,g_u2,g_u3):e_skc=dosk("b",ep_sk,"sai")
elseif aibj(left(g_u2,len(s_umxg)),s_umxg) and g_u3<>"" then
e_sks=3
Call eaedit(70,g_u2,g_u3):e_skc=dosk("b",ep_sk,"sai")
elseif aibj(left(g_u2,len(s_umsc)),s_umsc) then
e_sks=3
Call eadel(70,g_u2,g_u3,g_u4):e_skc=dosk("b",ep_sk,"sai")
'ai--pd/dox*.html
elseif aibj(left(g_u1,len(s_umtj)),s_umtj) or aibj(left(g_u1,len(s_umfb)),s_umfb) then
e_sks=1
Call eaadd(71,g_u1,g_u2):e_skc=dosk("b",ep_sk,"sai")
elseif aibj(left(g_u1,len(s_umxg)),s_umxg) and g_u2<>"" then
e_sks=1
Call eaedit(71,g_u1,g_u2):e_skc=dosk("b",ep_sk,"sai")
elseif aibj(left(g_u1,len(s_umsc)),s_umsc) then
e_sks=1
Call eadel(71,g_u1,g_u2,g_u3):e_skc=dosk("b",ep_sk,"sai")
'ai--dox*.html
elseif aibj(left(g_u0,len(s_umxg)),s_umxg) and g_u1<>"" then
e_sks=0
Call eaedit(72,g_u0,g_u1):e_skc=dosk("b","","sai")
elseif aibj(left(g_u0,len(s_umsc)),s_umsc) then
e_sks=0
Call eadel(72,g_u0,g_u1,g_u2):e_skc=dosk("b","","sai")
'ai--gl/pd/fl/xxs*/sn##.html
elseif aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umzs)),s_umzs) and g_u4<>"" then
Call eashow(710,0,g_u4)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u3,len(s_umxx)),s_umxx) and g_u4<>"" then
Call eashow(710,1,g_u4)
'ai--gl/pd/xxs*/sn##.html
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umzs)),s_umzs) and g_u3<>"" then
Call eashow(711,0,g_u3)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u2,len(s_umxx)),s_umxx) and g_u3<>"" then
Call eashow(711,1,g_u3)
'ai--gl/xxs*/sn##.html
elseif aibj(g_u0,s_umgl) and aibj(left(g_u1,len(s_umzs)),s_umzs) and g_u2<>"" then
Call eashow(712,0,g_u2)
elseif aibj(g_u0,s_umgl) and aibj(left(g_u1,len(s_umxx)),s_umxx) and g_u2<>"" then
Call eashow(712,1,g_u2)
'print
elseif aibj(left(g_u1,5),"print") and g_u2<>"" then
e_sks=3
Call eashow(73,0,g_u2)
if aibj(left(g_u1,6),"printe") then
'EXCEL
session.CodePage = 936 '设置为gb2312编码输出
Response.ContentType ="application/vnd.ms-excel"
Response.AddHeader "Content-Disposition", "attachment; filename="&ai_bt&".xls"
session.CodePage = 65001 '恢复为utf-8编码输出
elseif aibj(left(g_u1,6),"printw") then
'WORD
session.CodePage = 936 '设置为gb2312编码输出
Response.ContentType ="application/vnd.ms-word"
Response.AddHeader "Content-Disposition", "attachment; filename="&ai_bt&".doc"
session.CodePage = 65001 '恢复为utf-8编码输出
end if
e_skc=dosk("a","print","")
elseif aibj(left(g_u2,5),"print") and g_u3<>"" then
e_sks=3
Call eashow(73,0,g_u3)
if aibj(left(g_u2,6),"printe") then
'EXCEL
session.CodePage = 936 '设置为gb2312编码输出
Response.ContentType ="application/vnd.ms-excel"
Response.AddHeader "Content-Disposition", "attachment; filename="&ai_bt&".xls"
session.CodePage = 65001 '恢复为utf-8编码输出
elseif aibj(left(g_u2,6),"printw") then
'WORD
session.CodePage = 936 '设置为gb2312编码输出
Response.ContentType ="application/vnd.ms-word"
Response.AddHeader "Content-Disposition", "attachment; filename="&ai_bt&".doc"
session.CodePage = 65001 '恢复为utf-8编码输出
end if
e_skc=dosk("a","print","")
'ai--pd/fl/xxs*/sn##.html
elseif aibj(left(g_u2,len(s_umxx)),s_umxx) and g_u3<>"" then
e_sks=3
Call eashow(70,1,g_u3):e_skc=dosk("b",ep_sk,"info")
elseif aibj(left(g_u2,len(s_umzs)),s_umzs) and g_u3<>"" then
e_sks=3
Call eashow(70,0,g_u3):e_skc=dosk("b",ep_sk,"show")
'ai--pd/xxs*/sn##.html
elseif aibj(left(g_u1,len(s_umxx)),s_umxx) and g_u2<>"" then
e_sks=1
Call eashow(71,1,g_u2):e_skc=dosk("b",ep_sk,"info")
elseif aibj(left(g_u1,len(s_umzs)),s_umzs) and g_u2<>"" then
e_sks=1
Call eashow(71,0,g_u2):e_skc=dosk("b",ep_sk,"show")
'ai--xxs*/sn##.html
elseif aibj(left(g_u0,len(s_umxx)),s_umxx) and g_u1<>"" then
e_sks=0
Call eashow(72,1,g_u1):e_skc=dosk("b",ep_sk,"info")
elseif aibj(left(g_u0,len(s_umzs)),s_umzs) and g_u1<>"" then
e_sks=0
Call eashow(72,0,g_u1):e_skc=dosk("b",ep_sk,"show")
'ai--pd/fl/xxs*/sn##.html  for jingpai
elseif aibj(g_u2,"pp") and g_u3<>"" then
Call eashow(70,11,g_u3):e_skc=dosk("a","frm","")
'ai--gl/list*.html
elseif e_gdj>0 and aibj(g_u0,s_umgl) and dkdir(2,g_u1) then
ep_dm=s_udeas
Call ealist(712,s_umgl,"",g_u1,g_u2,g_u3,g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8)
'ai--gl/pd/list*.html
elseif e_gdj>0 and aibj(g_u0,s_umgl) and not ainull(g_u1) and dkdir(2,g_u2) then
Call ealist(711,s_umgl&g_urg&ep_sn,"",g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9)
'ai--gl/pd/fl/list*.html
elseif e_gdj>0 and aibj(g_u0,s_umgl) and not ainull(g_u1) and not ainull(g_u2) and dkdir(2,g_u3) then
Call ealist(710,s_umgl&g_urg&ep_sn,g_u2,g_u3,g_u4,g_u5,g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9&g_urg&g_u10)
'ai--list*.html
elseif dkdir(2,g_u0) then
e_sks=2
Call ealist(72,"","",g_u0,g_u1,g_u2,g_u3&g_urg&g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7):e_skc=dosk("b","8","li")
'ai--pd/list*.html
elseif not ainull(g_u0) and dkdir(2,g_u1) then
e_sks=2
Call ealist(71,ep_sn,"",g_u1,g_u2,g_u3,g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8):e_skc=dosk("b",ep_sk,"list")
'ai--pd/fl/list*.html
elseif not ainull(g_u0) and not ainull(g_u1) and dkdir(2,g_u2) then
e_sks=2
Call ealist(70,ep_sn,g_u1,g_u2,g_u3,g_u4,g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8&g_urg&g_u9):e_skc=dosk("b",ep_sk,"list")
end if
'------get skin 0
if ainull(e_skc) then
if aibj(g_u0,s_umgl) then
e_skc=dosk("a","admin","")
else
e_skc=dosk("b",ep_sk,"sai")
end if
end if
'------get skin 1
'response.Write e_skc&"------"&ep_sk
if aibj(left(g_u2,5),"print") and g_u3<>"" then
Response.Write replace(replace(replace(replace(esr(0,e_skc),"""/"&p_upijj&"","""http://"&g_uhost&"/"&p_upijj&""),"""/"&ew_sk&"","""http://"&g_uhost&"/"&ew_sk&""),"""/eesai","""http://"&g_uhost&"/eesai"),"""/gonggao","""http://"&g_uhost&"/gonggao")
else
Response.Write esr(0,e_skc)
end if
Response.End()
end if
'+++++++++++++++++++++++++++wap!

'-----------------------------------
'wap top
'=eawaptop(eawfty)
'-----------------------------------
Function eawaptop(eawfty)
eawaptop=""
if len(ew_ig)>3 then
if eawfty=7 then
eawaptop=eawaptop&"<div id=""y-i""><div class=""sy-ka""><div class=""sy-c4 tc""><a href="""&ew_il&s_drwap&""" target=""_blank"" title="""&ew_is&"""><img src="""&eshref(ew_sk&"img/"&ew_ig&"",3)&""" alt="""&ew_is&"""></a></div><div class=""sy-c4"">"&esso(eawfty,icvss)&"</div><div class=""sy-c2""></div></div></div>"
else
eawaptop=eawaptop&"<div id=""y-i""><div class=""sy-ka""><div class=""sy-c4 tc""><a href="""&ew_il&s_drwap&""" target=""_blank"" title="""&ew_is&"""><img src="""&eshref(ew_sk&"img/"&ew_ig&"",3)&""" alt="""&ew_is&"""></a></div><div class=""sy-c4"">"&esso(ep_sn&"|"&ep_dm,"")&"</div><div class=""sy-c2""></div></div></div>"
end if
end if
if aiint(e_sks)>0 then
eawaptop=eawaptop&"<div class=""crg""></div><div class=""y-p""><div class=""sy-ka""><div class=""sy-dr"">"&e_wl&"<div class=""fr"">"&e_wr&"</div></div></div></div>"
end if
End Function
'-----------------------------------
'wap end
'=eawapend()
'-----------------------------------
Function eawapend()
eawapend=""
if aiint(e_sks)>0 and aiint(ep_ef)<5 then
if aiint(e_sks)=2 then
eawapend=eawapend&"<div class=""crg""></div>"
eawapend=eawapend&esbts(ep_sx,ep_el,"热门"&ep_dm&g_gy&eshref(ep_sn&"/"&ef_sn&g_urz,1),"")
eawapend=eawapend&ictop(ep_sx,"",ep_sn&"/"&ef_sn&"/1/6",12,"1",12,"3","2",11)
elseif aiint(e_sks)=3 then
eawapend=eawapend&"<div class=""crg""></div>"
eawapend=eawapend&esbts(ep_sx,ep_el,"相关"&ep_dm&g_gy&eshref(ep_sn&"/"&ef_sn&g_urz,1),"")
eawapend=eawapend&ictop(1,"",ep_sn&"/"&ef_sn&"",12,"1",11,"2","1",11)
end if
eawapend=eawapend&"<div class=""crg""></div>"
eawapend=eawapend&esbts(ep_sx,ep_el,ep_dm&s_udefs&g_gy&eshref(ep_sn&g_urz,1),"more>>"&g_gy&eshref(ep_sn&g_urz,1))
eawapend=eawapend&icmenu(ep_sx,"","1|"&ep_sn,ef_sn,4000,0,14,28,0)
end if
eawapend=eawapend&"<div class=""crg""></div><div class=""y-vc"">"&year(date())&" &copy; <a target=""_blank"" href="""&e_tur&""">"&ew_mc&"</a>"
if len(ew_ba)>3 then eawapend=eawapend&"<br>备案号：<a target=""_blank"" href=""http://www.miitbeian.gov.cn/"">"&ew_ba&"</a>"
eawapend=eawapend&"<br>"&eskds()&eskjs()&""
eawapend=eawapend&"</div>"
End Function

'+++++++++++++++++++++++++++teshu!
'-----------------------------------
'add/edit form
'=eaformx()
'-----------------------------------
Function eaformx(eafqh,eafty,eafqx,eafel,eafup)
'
End Function
'-----------------------------------
'ai show
'=easshowx(eafty)
'-----------------------------------
Function easshowx(eafel,eafqh,eafty,eafsn)
'
End Function
'-----------------------------------
'ai list show
'=easlistxx(eafel,eafxpms,eafqh)
'-----------------------------------
Function easlistx(eafel,eafqh,eafuq,eafef,eafpg,eafps,eafph,eafqx,eafqxyz,eafity,eafuqs,eafxpur,eafxpms,eafxpum)
if not ainull(eafuqs) and not aibj(right(eafuqs,len(g_urg)),g_urg) then eafuqs=eafuqs&g_urg
if aibj(eafel,"18") then
easlistx=""
else
easlistx=""
end if
End Function
'-----------------------------------
'top xunhuan list
'<%=eatxxx(★eafsx[色系0主色|1辅助色|2跳跃色|3无色],★eafps[频道/分类/0最新|1浏览|2我顶|3手工排序|4推荐|5时间|6更新|0/1最新图片|4/1推荐图片*可从搜索处获取参数],★eafty[0文字列表|1幻灯图片|2图文框框|3图片框框|4滚动图片],★eafnm[调用数量],★eafwid[图片宽度+{ty文字=特殊显示数量}],★eafhei[图片高度+{ty文字=特殊样式|0文字|1加粗|2概述|<3}],★eafnl[文字列表列数+{ty幻灯片=展示样式|0no|1数字|2数字+标题|}],★eafnq[{ty文字=0tit|1time|2click|3good|4user}+{ty幻灯片=切换时间3s}])%
'-----------------------------------
Function eatxxx(eafsx,eafps,eafty,eafnm,eafwid,eafhei,eafnl,eafnq)
if eafty=88 then
eatxxx=""
else
eatxxx=""
end if
End Function
%>