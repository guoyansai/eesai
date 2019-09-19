<%
'-----------------------------------
'web sitemap
'=eamap(skfsn,skfile)
'-----------------------------------
Function eamap(skfsn,skfile)
dim eamlin,eamepall
eamlin=""
if not ainull(skfsn) then
Call epread(skfsn)
e_wl=e_wl&"<li><a href="""&eshref(ep_sn&g_urz,1)&""">"&ep_mc&"</a></li>"
eamlin=eamlin&esbts(ep_sx,ep_el,ep_mc&g_gy&eshref(ep_sn&g_urz,1),"more>>"&g_gy&eshref(ep_sn&g_urz,1))
eamlin=eamlin&icmenu(ep_sx,"d-2 d-3 d-5","1|"&ep_sn,"",4000,0,14,28,0)
eamlin=eamlin&"<div class=""crg""></div>"
else
eamepall=epall
if eamepall<>"" then
gysaxbb=split(eamepall,g_gx)
for gysibb=0 to ubound(gysaxbb)
gysaybb=split(gysaxbb(gysibb),g_gy)
eamlin=eamlin&esbts(gysaybb(5),gysaybb(9),gysaybb(2)&g_gy&eshref(gysaybb(1)&g_urz,1),"more>>"&g_gy&eshref(gysaybb(1)&g_urz,1))
if instr(lcase(g_ud)&"/",s_drwap)=0 then
eamlin=eamlin&icmenu(gysaybb(5),"d-2 d-3 d-5","1|"&gysaybb(1),"",4002,0,14,28,0)
else
eamlin=eamlin&icmenu(gysaybb(5),"d-2 d-3 d-5","1|"&gysaybb(1),"",4000,0,14,28,0)
end if
eamlin=eamlin&"<div class=""crg""></div>"
next
end if
end if
e_ma=e_ma&eamlin
eamap=esr(0,skfile)
End Function
'-----------------------------------
'default page
'=eadefault(skfile)
'-----------------------------------
Function eadefault(skfile)
if ew_vi=3 then
Call ealist(72,"","",g_u0,g_u1,g_u2,g_u3&g_urg&g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7)
else
if ew_vi=2 or (e_tuh=1 and ew_vi=1) then
dim eadslin,eadsapp
if instr(lcase(g_ud)&"/",s_drwap)=0 then
eadsapp=esapm(3,"default")
else
eadsapp=esapm(3,"default-wap")
end if
if ankck(eadsapp) then
if instr(lcase(g_ud)&"/",s_drwap)=0 then
eadslin=eadefaults(3,ew_vy)
else
eadslin=eadefaults(3,4)
end if
Call ankop(2,0,ansav(eadslin),eadsapp)
else
eadslin=anreq(ankop(1,0,0,eadsapp))
end if
e_ma=e_ma&eadslin
else
e_ma=e_ma&""
end if
end if
if ainull(skfile) then skfile="b/default"
eadefault=esr(0,skfile)
End Function
'-----------------------------------
'index page
'=eaindex(skfile,eafep)
'-----------------------------------
Function eaindex(skfile,eafep)
if right(eafep,1)="-" then:Call epread(left(eafep,len(eafep)-1)):else:Call epread(eafep):end if
if aibj(s_umqb,ep_sn) then
Response.Redirect(e_tug)
else
if ep_ef=5 or ep_bs=4 then
Call ealist(71,ep_sn,"",g_u1,g_u2,g_u3,g_u4&g_urg&g_u5&g_urg&g_u6&g_urg&g_u7&g_urg&g_u8)
else
e_wl=e_wl&"<li>"&ep_dm&"首页</li>"
if aiint(ep_bs)<5 or (e_tuh=1 and aiint(ep_bs)=5) then
dim eadslin,eadsapp
if instr(lcase(g_ud)&"/",s_drwap)=0 then
eadsapp=esapm(3,"P_"&eafep&g_apj&"index")
else
eadsapp=esapm(3,"P_"&eafep&g_apj&"index-wap")
end if
if ankck(eadsapp) then
if instr(lcase(g_ud)&"/",s_drwap)=0 then
eadslin=eaindexs(ep_sn,ep_el,ep_ls,ep_bs)
else
eadslin=eaindexs(ep_sn,ep_el,ep_ls,4)
end if
Call ankop(2,0,ansav(eadslin),eadsapp)
else
eadslin=anreq(ankop(1,0,0,eadsapp))
end if
e_ma=e_ma&eadslin
else
e_ma=e_ma&""
end if
end if
eaindex=esr(0,skfile)
end if
End Function
'-----------------------------------
'=eaindexs()
'-----------------------------------
Function eaindexs(eafep,eafel,eafls,eafbs)
dim eaili,eaiud,eaisqb,eaisqc
eaindexs=""
efwhere="ef_xy>1 and ef_sx='0' and ef_ep='"&esrfd(0,eafep,ew_kj)&"'"
if aiint(ew_sn)>0 then
if not ainull(efwhere) then efwhere=efwhere&" and "
efwhere=efwhere&" "&esrew("ef",ew_sn)&""
end if
if gystop(i_nmtp,efbid,"ef_sn,ef_bt",efbiao,efwhere,efordermo,"") then
gysaxcc=split(gysar,g_gx)
eaiud=ubound(gysaxcc)
for gysicc=0 to eaiud
gysaycc=split(gysaxcc(gysicc),g_gy)
'ls普通标题|1简介模式|2图文预览|3全文预览|4图片列表|5云签模式
'bs移动标签|1一列到底|2两列排行
'----------top bs 0
if eafbs=2 then'2 lie
if gysicc=0 and eaiud mod 2=0 then
eaili=1
elseif (gysicc-eaili) mod 2=0 then
eaindexs=eaindexs&"<div class=""sy-c5"">"
else
eaindexs=eaindexs&"<div class=""sy-c5""><div class=""sy-cl"">"
end if
eaindexs=eaindexs&esbts(0,eafel,gysaycc(1)&g_gy&eshref(eafep&g_urg&gysaycc(0)&g_urz,1),"more>>"&g_gy&eshref(eafep&g_urg&gysaycc(0)&g_urz,1))
elseif eafbs=1 or eafbs=4 then'1lie
eaindexs=eaindexs&esbts(0,eafel,gysaycc(1)&g_gy&eshref(eafep&g_urg&gysaycc(0)&g_urz,1),"more>>"&g_gy&eshref(eafep&g_urg&gysaycc(0)&g_urz,1))
else'tag
if gysicc>0 then eaisqb=eaisqb&g_gx
eaisqb=eaisqb&"<a class=""l-xa"" href="""&eshref(eafep&g_urg&gysaycc(0)&g_urz,1)&""">"&gysaycc(1)&"</a>"
end if
'----------top bs 1
'----------AI 0
if eafbs=0 then'0 tag
if gysicc>0 then eaisqc=eaisqc&g_gx
eaisqc=eaisqc&eaxshow(eafep&"/"&gysaycc(0),0,eafel,eafls,eafbs,gysicc,eaili)
else
eaindexs=eaindexs&eaxshow(eafep&"/"&gysaycc(0),0,eafel,eafls,eafbs,gysicc,eaili)
end if
'----------AI 1
'----------end bs 0
if eafbs=2 then'2 lie
if gysicc=0 and eaiud mod 2=0 then
eaindexs=eaindexs&"<div class=""crg""></div>"
elseif (gysicc-eaili) mod 2=0 then
eaindexs=eaindexs&"</div>"
else
eaindexs=eaindexs&"</div></div>"
eaindexs=eaindexs&"<div class=""crg""></div>"
end if
elseif eafbs=1 or eafbs=4 then'1lie
eaindexs=eaindexs&"<div class=""crg""></div>"
else'tag

end if
'----------end bs 1
next
if eafbs=0 then'0 tag
eaindexs=eaindexs&icsq("<a href="""&eshref(eafep&g_urz,1)&""">more>></a>",eaisqb,eaisqc,"")
end if
else
eaindexs=eaindexs&""
end if
End Function
'-----------------------------------
'=eadefaults()
'-----------------------------------
Function eadefaults(eafsx,eafbs)
dim eaili,eaiud,eaisqb,eaisqc,eaidsx,eaiots
eadefaults=""
if eafbs=4 then
eawhere="ep_xy>0"
g_app=esapm(0,s_udep&g_apj&aiint(ew_sn)&"-1")
else
eawhere="ep_xy>1"
g_app=esapm(0,s_udep&g_apj&aiint(ew_sn)&"-2")
end if
if aiint(ew_sn)>0 then
if not ainull(eawhere) then eawhere=eawhere&" and "
eawhere=eawhere&" "&esrew("ep",ew_sn)&""
end if
if gystop(i_nmtp,epbid,"ep_sn,ep_mc,ep_el,ep_ls,ep_sx,ep_xy",epbiao,eawhere,epordermo,g_app) then
gysaxcc=split(gysar,g_gx)
eaiud=ubound(gysaxcc)
if aiint(eafsx)>0 then eadefaults=eadefaults&"<div class=""gys"&eafsx&""">"
for gysicc=0 to eaiud
gysaycc=split(gysaxcc(gysicc),g_gy)
'ls普通标题|1简介模式|2图文预览|3全文预览|4图片列表|5云签模式
'bs移动标签|1一列到底|2两列排行
if eafbs=4 and aiint(gysaycc(5))=1 then
eaiots="<a href="&eshref(gysaycc(0)&g_urz,1)&">"&gysaycc(1)&"</a>　"&eaiots
else
if eafsx>2 then
eaidsx=gysaycc(4)
else
eaidsx=eafsx
end if
'----------top bs 0
if eafbs=2 then'2 lie
if gysicc=0 and eaiud mod 2=0 then
eaili=1
elseif (gysicc-eaili) mod 2=0 then
eadefaults=eadefaults&"<div class=""sy-c5"">"
else
eadefaults=eadefaults&"<div class=""sy-c5""><div class=""sy-cl"">"
end if
eadefaults=eadefaults&esbts(eaidsx,gysaycc(2),gysaycc(1)&g_gy&eshref(gysaycc(0)&g_urz,1),"more>>"&g_gy&eshref(gysaycc(0)&g_urz,1))
elseif eafbs=1 or eafbs=4 then'1lie
eadefaults=eadefaults&esbts(eaidsx,gysaycc(2),gysaycc(1)&g_gy&eshref(gysaycc(0)&g_urz,1),"more>>"&g_gy&eshref(gysaycc(0)&g_urz,1))
else'tag
if gysicc>0 then eaisqb=eaisqb&g_gx
eaisqb=eaisqb&"<a class=""l-xa"" href="""&eshref(gysaycc(0)&g_urz,1)&""">"&gysaycc(1)&"</a>"
end if
'----------top bs 1
'----------AI 0
if eafbs=0 then'0 tag
if gysicc>0 then eaisqc=eaisqc&g_gx
eaisqc=eaisqc&eaxshow(gysaycc(0)&g_urg,eaidsx,gysaycc(2),gysaycc(3),eafbs,gysicc,eaili)
else
if eafsx>2 then
eadefaults=eadefaults&eaxshow(gysaycc(0)&g_urg,eaidsx,gysaycc(2),gysaycc(3),eafbs,gysicc,eaili)
else
eadefaults=eadefaults&eaxshow(gysaycc(0)&g_urg,eaidsx,gysaycc(2),gysaycc(3),eafbs,gysicc,eaili)
end if
end if
'----------AI 1
'----------end bs 0
if eafbs=2 then'2 lie
if gysicc=0 and eaiud mod 2=0 then
eadefaults=eadefaults&"<div class=""crg""></div>"
elseif (gysicc-eaili) mod 2=0 then
eadefaults=eadefaults&"</div>"
else
eadefaults=eadefaults&"</div></div>"
eadefaults=eadefaults&"<div class=""crg""></div>"
end if
elseif eafbs=1 or eafbs=4 then'1lie
eadefaults=eadefaults&"<div class=""crg""></div>"
else'tag

end if
end if
'----------end bs 1
next
if eafbs=4 and eaiots<>"" then eadefaults=eadefaults&"<p class=tc>其他频道："&eaiots&"</p>"
if eafbs=0 then'0 tag
eadefaults=eadefaults&icsq("",eaisqb,eaisqc,"")
end if
if aiint(eafsx)>0 then eadefaults=eadefaults&"</div>"
else
eadefaults=eadefaults&""
end if
End Function
'-----------------------------------
'=eaxshow()
'-----------------------------------
Function eaxshow(eafpf,eafsx,eafel,eafls,eafbs,eafsc,eafsi)
'ls=1title
if eafls=1 then
if eafbs<2 or (eafsc=0 and eafsi=1) then
eaxshow=eaxshow&ictop(eafsx,"",eafpf,24,"2",11,"0","0",11)
else
eaxshow=eaxshow&ictop(eafsx,"",eafpf,12,"1",11,"0","0",11)
end if
'ls=2title+con
elseif eafls=2 then
if eafbs<2 or (eafsc=0 and eafsi=1) then
eaxshow=eaxshow&ictop(eafsx,"",eafpf&"/"&ew_vs&"/0/1",4,"4",32,"143","1",11)
eaxshow=eaxshow&ictop(eafsx,"",eafpf,16,"2",10,"1","0",11)
elseif eafbs=4 then
eaxshow=eaxshow&ictop(eafsx,"",eafpf&"/"&ew_vs&"/0/1",2,"2",32,"143","1",11)
eaxshow=eaxshow&ictop(eafsx,"",eafpf,8,"1",10,"1","0",11)
else
eaxshow=eaxshow&ictop(eafsx,"",eafpf&"/"&ew_vs&"/0/1",2,"2",32,"143","1",11)
eaxshow=eaxshow&ictop(eafsx,"",eafpf,8,"1",10,"1","0",11)
end if
'ls=3title+con+pic
elseif eafls=3 then
if eafbs<2 or (eafsc=0 and eafsi=1) then
eaxshow=eaxshow&ictop(eafsx,"",eafpf&"/"&ew_vs&"/0/1",2,"2",41,"143","1",11)
eaxshow=eaxshow&ictop(eafsx,"",eafpf,16,"2",10,"1","0",11)
elseif eafbs=4 then
eaxshow=eaxshow&ictop(eafsx,"",eafpf&"/"&ew_vs&"/0/1",1,"1",41,"143","1",11)
eaxshow=eaxshow&ictop(eafsx,"",eafpf,8,"1",10,"1","0",11)
else
eaxshow=eaxshow&ictop(eafsx,"",eafpf&"/"&ew_vs&"/0/1",1,"1",41,"143","1",11)
eaxshow=eaxshow&ictop(eafsx,"",eafpf,8,"1",10,"1","0",11)
end if
'ls=4title+pic
elseif eafls=4 then
if eafbs<2 or (eafsc=0 and eafsi=1) then
eaxshow=eaxshow&ictop(eafsx,"",eafpf&"/"&ew_vs&"/0/1",12,"4",32,"143","1",11)
elseif eafbs=4 then
eaxshow=eaxshow&ictop(eafsx,"",eafpf&"/"&ew_vs&"/0/1",6,"2",32,"143","1",11)
else
eaxshow=eaxshow&ictop(eafsx,"",eafpf&"/"&ew_vs&"/0/1",6,"2",32,"143","1",11)
end if
'ls=0
else
if eafbs<2 or (eafsc=0 and eafsi=1) then
eaxshow=eaxshow&ictop(eafsx,"",eafpf,20,"2",11,"1","0",11)
else
eaxshow=eaxshow&ictop(eafsx,"",eafpf,10,"1",11,"1","0",11)
end if
end if
End Function
%>