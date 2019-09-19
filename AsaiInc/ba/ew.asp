<%
'@@0manage/1s_udew/2list.HTML
'@@0manage/1s_udew/2edit|add|del/3*id.HTML

if e_xa<1 and (aibj(g_u0,s_udew) or aibj(g_u1,s_udew)) then
e_xa=e_xa+1
Call esq()
Call doq(1,e_uer,6,g_u0,s_udew,s_udews&s_umlbs)

if e_gdj>3 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udew) and aibj(g_u2,s_umtj) then
Call ewadd()
elseif e_gdj>3 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udew) and aibj(g_u2,s_umxg) and aiint(g_u3)>0 then
Call ewedit()
elseif e_gdj>3 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udew) and ((aibj(g_u2,s_umsc) and aiint(g_u3)>0) or aibj(g_u2,s_umsc&"-x")) then
Call ewdel()
elseif e_gdj>3 and aibj(g_u0,s_umgl) and aibj(g_u1,s_udew) and dkdir(2,g_u2) then
Call ewlist()
end if
'------get skin 0
if ainull(e_skc) then
e_skc=dosk("a","admin","")
end if
'------get skin 1
Response.Write esr(0,e_skc):Response.End()
end if
'-----------------------------------
'Assignment
'=erq()
'-----------------------------------
Function ewq()
Call esq()
ew_bt=s_udews&","&ew_bt
ew_zt=s_udews&","&ew_zt
ew_nr=s_udews&","&ew_nr
if aibj(g_u0,s_umgl) then
e_wl=e_wl&"<li><a href="""&e_lj0&""">"&s_udews&s_umlbs&"</a></li>"
else
e_wl=e_wl&"<li><a href="""&eshref(s_udew&g_urg&s_umlb&g_urz,1)&""">"&s_udews&s_umlbs&s_umxxs&"</a></li>"
end if
e_wr="<a href="""&e_lj1&""">"&s_umtjs&s_udews&"</a>|<a href="""&e_lj0&""">"&s_udews&s_umlbs&"</a>"&e_wr
ew_cp=ew_cp
e_mt=e_mt
e_ma=e_ma
End Function
'-----------------------------------
'Data Table
'=ewlie()
'-----------------------------------
Function ewlie(ewfty)
if ewfty="form" then
ewlie="sn,mc,bt,nr,zt,ur,ui,cp,sk,ps,py,ba,lr,lq,ls,lh,lc,lj,le,lz,lb,lo,hc,tj,c0,n0,c1,n1,c2,n2,c3,n3,pt,mma,mmb,mmc,mmd,kx,kt,kz,kg,ky,kf,is,il,ig,ts,tl,tg,s1,u1,p1,s2,u2,p2,s3,u3,p3,s4,u4,p4,s5,u5,p5,s6,u6,p6,pg,vy,vi,vb,vg,vs,ap,gn,dj,pj,sz,sp,lm,cf,qz,hz,tc,sc,pl,pz,lt,ll,dd,yz,sh,bq,xy,px,kj,ot,xt"
elseif ewfty=s_umlb then
ewlie="ew_id,ew_sn,ew_mc,ew_bt,ew_nr,ew_zt,ew_cp,ew_sk,ew_xy"
elseif ewfty=s_umlb&"s" then
ewlie="id,sn,mc,bt,nr,zt,cp,sk,xy"
elseif ewfty="all" then
ewlie="ew_id,ew_sn,ew_mc,ew_bt,ew_nr,ew_zt,ew_ur,ew_ui,ew_cp,ew_sk,ew_ps,ew_py,ew_ba,ew_lr,ew_lq,ew_ls,ew_lh,ew_lc,ew_lj,ew_le,ew_lz,ew_lb,ew_lo,ew_hc,ew_tj,ew_c0,ew_n0,ew_c1,ew_n1,ew_c2,ew_n2,ew_c3,ew_n3,ew_pt,ew_mma,ew_mmb,ew_mmc,ew_mmd,ew_kx,ew_kt,ew_kz,ew_kg,ew_ky,ew_kf,ew_is,ew_il,ew_ig,ew_ts,ew_tl,ew_tg,ew_s1,ew_u1,ew_p1,ew_s2,ew_u2,ew_p2,ew_s3,ew_u3,ew_p3,ew_s4,ew_u4,ew_p4,ew_s5,ew_u5,ew_p5,ew_s6,ew_u6,ew_p6,ew_pg,ew_vy,ew_vi,ew_vb,ew_vg,ew_vs,ew_ap,ew_gn,ew_dj,ew_pj,ew_sz,ew_sp,ew_lm,ew_cf,ew_qz,ew_hz,ew_tc,ew_sc,ew_pl,ew_pz,ew_lt,ew_ll,ew_dd,ew_yz,ew_sh,ew_bq,ew_xy,ew_px,ew_kj,ew_ot,ew_xt"
end if
End Function
'-----------------------------------
'=ewxgn(ewfty)
'0极简模式|1极速功能|2企业网站|3行业网站|4门户网站|5互动社区|6全部功能
'-----------------------------------
Function ewxgn(ewfbm)
if e_gdj=6 or ew_gn=6 or ainull(ewfbm) then
ewxgn=true
elseif instr("e1|ey|tm",ewfbm)>0 and ew_gn>0 then
ewxgn=true
elseif instr("e2|ey|tm|ux|pl|pj|dj",ewfbm)>0 and ew_gn>1 then
ewxgn=true
elseif instr("e3|ey|tm|ux|pl|pj|dj|gg|uk|bb",ewfbm)>0 and ew_gn>2 then
ewxgn=true
elseif instr("e4|ey|tm|ux|pl|pj|dj|gg|uk|bb|uj|ut|ua",ewfbm)>0 and ew_gn>3 then
ewxgn=true
elseif instr("e5|ey|tm|ux|pl|pj|dj|gg|uk|bb|uj|ut|ua|un|uu",ewfbm)>0 and ew_gn>4 then
ewxgn=true
elseif instr("e6|ey|tm|ux|pl|pj|dj|gg|uk|bb|uj|ut|ua|un|uu|eq|ek|uh|uq",ewfbm)>0 and ew_gn>5 then
ewxgn=true
else
ewxgn=false
end if
End Function
'-----------------------------------
'关闭论坛|1隐藏论坛|2打开论坛|3注册浏览|4审核浏览|5认证浏览|6高级浏览|7经验浏览|8等级浏览
'ew bbs
'=ewxlt()
'-----------------------------------
Function ewxlt()
ewxlt=false
ew_lt=aiint(ew_lt)
if ew_lt=2 then
ewxlt=true
elseif ew_lt=3 and aiint(e_uid)>0 then
ewxlt=true
elseif ew_lt=4 and aiint(e_uxy)>0 then
ewxlt=true
elseif ew_lt=5 and aiint(e_uzy)>1 then
ewxlt=true
elseif ew_lt=6 and aiint(e_uzy)>2 then
ewxlt=true
elseif ew_lt=7 and aiint(e_ujy)>i_shjy then
ewxlt=true
elseif ew_lt=8 and aiint(e_ujy)>i_shjd then
ewxlt=true
end if
End Function
'-----------------------------------
'ew select
'=ewselect(ewfty=0sn/1mc)
'-----------------------------------
Function ewselect(ewfty,ewfid)
if aiint(ewfid)=0 and ewfty=1 then ewfid=aiint(ew_sn)
dim ewselectid,ewselectmc
g_app=esapm(0,s_udew&"_Select_"&ewfid)
ewwhere=ewwheremo
eworder=ewordermo
if gystop(i_nmtp,ewbid,ewlie(s_umlb),ewbiao,ewwhere,eworder,g_app) then
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi=0 then
ewselectid=gysay(1)
ewselectmc=gysay(2)
else
ewselectid=ewselectid&"|"&gysay(1)
ewselectmc=ewselectmc&"|"&gysay(2)
end if
next
end if
ewselect=aiselect("ew","","","f-s",ewfid,ewselectid,ewselectmc)
End Function
'-----------------------------------
'add/edit form
'=ewform()
'-----------------------------------
Function ewform(ewfty)
ew_yz=1
if ewfty=0 then
ew_sn=w_mosn:ew_mc=w_motm:ew_bt=w_mott:ew_nr=w_motd:ew_zt=w_motk:ew_ui="http://www.":ew_ur=",localhost,":ew_cp=w_motc:ew_sk=i_msk
ew_ps=0:ew_py="0"
ew_ba=""
ew_lr="阿赛":ew_lq="888888":ew_ls="8888888,28282828,98989898":ew_lh="025-88888888":ew_lc="025-88888888":ew_lj="15888888888":ew_le="admin@eesai.com":ew_lz="江苏省南京市江宁科学园":ew_lb="221100":ew_lo=""
ew_hc="":ew_tj="<script language=JavaScript charset=utf-8 src=http://eesai.com/t.js></script>"
ew_c0="QQ":ew_n0="即时咨询":ew_c1="about/info/jieshao.html":ew_n1="关于我们":ew_c2="about/info/wenhua.html":ew_n2="企业文化":ew_c3="about/info/lianxi.html":ew_n3="联系我们":ew_pt="<img src="&i_dir&i_msk&"img/logo.gif><br>欢迎您的访问"
ew_kx="EESaikx":ew_kt="EESaikt":ew_kz="EESaikz":ew_kg="EESaikg":ew_ky="EESaiky":ew_kf="EESaikf"
ew_is=w_motm:ew_il=i_dir:ew_ig="logo.gif"
ew_ts=w_mott:ew_tl=i_dir:ew_tg="tj.gif"
ew_s1="横幅展示":ew_u1=i_dir:ew_p1="b1.jpg"
ew_s2="横幅展示":ew_u2=i_dir:ew_p2="b2.jpg"
ew_s3="横幅展示":ew_u3=i_dir:ew_p3="b3.jpg"
ew_s4="横幅展示":ew_u4=i_dir:ew_p4="b4.jpg"
ew_s5="横幅展示":ew_u5=i_dir:ew_p5="b5.jpg"
ew_s6="横幅展示":ew_u6=i_dir:ew_p6="b6.jpg"
ew_pg="#fbfef7|#FFFDFA|#FEF6EC|#fbfef7|#F0FBF3|#FEF6EC"
ew_vy=0:ew_vi=0:ew_vb=0:ew_vg=0:ew_vs="0/1"
ew_xy=1:ew_px=0
ew_ap=1:ew_gn=1:ew_dj=2:ew_pj=2:ew_sz=1:ew_sp=2:ew_lm=1:ew_cf=1:ew_qz=1:ew_hz=1:ew_tc=1:ew_sc=1:ew_pl=1:ew_pz=0:ew_lt=1:ew_ll=116:ew_dd=0:ew_yz=1:ew_sh=0:ew_bq=1
else

if ew_xt<>"" then
ew_xt=ew_xt&espxx("修改"&i_gg&e_gmc)
else
ew_xt=espxx("修改"&i_gg&e_gmc)
end if
end if
if ainull(ew_kj) then ew_kj=s_uduk
if ainull(ew_sn) then ew_sn=w_mosn
if ainull(ew_sk) then ew_sk=i_msk
if ainull(ew_mc) then ew_mc=w_motm
if ainull(ew_bt) then ew_bt=w_mott
if ainull(ew_zt) then ew_zt=w_motk
if ainull(ew_nr) then ew_nr=w_motd
if ainull(ew_cp) then ew_cp=w_motc

ewform="<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
ewform=ewform&icflsr(25,"名称","","mc","",0,50,"*","",ew_mc)&icflsr(25,"编码","","sn","",6,50,"*只能填数字，且不能和其他重复","",ew_sn)&aiinput("hidden","y_sn","",0,0,"","",ew_sn)&icflsr(5,"标题","","bt","",0,200,"*推广优化显示在页面顶端的标题","",ew_bt)
ewform=ewform&icflsr(5,"主题","","zt","",0,200,"*关键词组","",ew_zt)&icflsr(5,"版权","","cp","",0,200,"*网站版权信息","",ew_cp)
ewform=ewform&icflsr(10,"介绍","","nr","",0,200,"*网站介绍信息","",ew_nr)
ewform=ewform&icflsr(5,"主站","","ui","",0,200,"*主站：网站主网址以/结束，如："&w_mour&"","",ew_ui)&icflsr(5,"网址","","ur","",0,200,"*不带http://，各个网址后须添加英文逗号,如：，localhost,127.0.0.1,(开头和结尾均带,)","",ew_ur)
ewform=ewform&icflxz(25,"首样","vy","","*首页默认内容列表样式.","f-s",ew_vy,0,"移动标签|一列到底|两列排行|特殊一列")&icflxz(25,"首读","vi","","*可以选择开启或关闭首页预读功能.","f-s",ew_vi,0,"关闭首页预读|仅WAP首页预读|全部首页预读|简式列表首页")&icflxz(25,"板标","vb","","*板块标志-是否启用网站板块标志.","f-s",ew_vb,0,"关闭板块标志|打开板块标志|使用唯一标志")&icflxz(25,"背景","vg","","背景图片-是否显示网页背景图片..","f-s",ew_vg,0,"关闭背景图片|开启背景图片|背景随机图片")
ewform=ewform&icflxz(25,"缓存","ap","","*网站缓存量占用网站空间.","f-s",ew_ap,0,"系统常规缓存|+top调用缓存|+list列表第一页缓存|+show内容缓存|+list分页全缓存")&icflxz(25,"功能","gn","","*是否启用网站除以上之外的所有功能系统.","f-s",ew_gn,0,"极简模式|极速功能|企业网站|行业网站|门户网站|互动社区|全部功能")&icflxz(25,"点击","dj","","*是否启用网站点击浏览次数记录.","f-s",ew_dj,0,"关闭点击记录|隐藏点击记录|内显点击记录|打开点击记录")&icflxz(25,"评价","pj","","*是否启用网站评价功能.","f-s",ew_pj,0,i_bpj)

ewform=ewform&icflxz(25,"全搜","sz","","*可以选择开启或关闭全站搜索功能块.","f-s",ew_sz,0,"关闭全站搜索|打开全站搜索")&icflxz(25,"频搜","sp","","*是否启用频道搜索.","f-s",ew_sp,0,i_bsp)&icflxz(25,"列表","lm","","*网站内容列表是否可以切换不同显示模式.","f-s",ew_lm,0,i_blm)&icflxz(25,"重复","cf","","*当循环列表的内容不足之时是否容许重复与自动填充..","f-s",ew_cf,0,"同页禁止调用重复|同类禁止调用重复|调用重复不要填充|调用重复循环填充")
ewform=ewform&icflxz(25,"前缀","qz","","*调用列表标题名前的图标..","f-s",ew_qz,0,"关闭前缀图标|开启前缀图标|开启类别图标")&icflxz(25,"后缀","hz","","*列表标题后的热门和新鲜图标..","f-s",ew_hz,0,"关闭后缀图标|开启后缀图标")&icflxz(25,"弹窗","tc","","*弹出在网站右下角的互动小窗口..","f-s",ew_tc,0,"关闭互动|+GoTop|+客服|+留言|+聊天")&icflxz(25,"评论","pl","","*是否启用网站评论模块的功能.","f-s",ew_pl,0,i_bpl)
ewform=ewform&icflxz(25,"收藏","sc","","*是否启用网站内容收藏功能.","f-s",ew_sc,0,"关闭收藏|打开收藏")&icflxz(25,"自评","pz","","*是否启用网站自动评论的功能.","f-s",ew_pz,0,"关闭自动评论|打开自动评论")&icflxz(25,"论坛","lt","","*是否启用网站论坛的功能.","f-s",ew_lt,0,"关闭论坛|隐藏论坛|打开论坛|注册浏览|审核浏览|认证浏览|高级浏览|经验浏览|等级浏览")&icflxz(25,"版权","bq","","*是否启用网站版权自爆维护功能1单篇2单篇全爆3作者4作者全爆.","f-s",ew_bq,0,"关闭版权自爆|一级版权自爆|二级版权自爆|三级版权自爆|四级版权自爆")
ewform=ewform&icflxz(25,"订单","dd","","*将订单拆分为一个商品一个订单，或选择一个用户一个订单选择固定订单类型。","f-s",ew_dd,0,"拆分订单~0|"&i_buyty)&icflxz(25,"验证","yz","","*是否启用网站自动评论的功能.","f-s",ew_yz,0,"自动验证|加法验证|数字验证|图片数字|图片混合")&icflxz(25,"论模","ll","","*请选择论坛列表和显示模式.","f-s",ew_ll,0,i_bbbel)&icflxz(25,"审核","sh","","*是否启用网站自动审核功能.","f-s",ew_sh,0,"需要手工审核|开启自动审核")

ewform=ewform&icflsr(25,"备案","","ba","",0,20,"*网站备案号","",ew_ba)&icflxz(25,"缩图","ps","","*生成的缩略图存储的位置","f-s",ew_ps,0,"关闭缩图|启用覆盖|缩图前缀新存|缩图存文件夹")&icflxz(25,"状态","xy","","*","f-s",ew_xy,0,i_bxy)&icflxz(25,"规则","vs","","*首页图样：网站和频道首页的自动栏目图片显示规则依据调用代码填写默认0/1带图片3/2推荐排序3/3三星排序.","f-s",ew_vs,"0/1|3/2|3/3","带图片|推荐排序|三星排序")

ewform=ewform&icflsr(25,"空间","","kj","",3,3,"空间分类编码：前两个字符为判断是否启用同编码分类，第三个字符是分类定义区别名。如：gy表示频道分类中以gy开头的将使用gy+第三个字符为分类，gys表示空间和以gys开头编码的频道都是以gys为分类的。为空表示以默认的"&s_uduk&"为分类。","",ew_kj)&icflsr(25,"水印","","py","",0,50,"*0为关闭该功能，普通文字模板（#FF0000阿赛工作室）透明文字模板（_#FF0000阿赛工作室）图片水印模板（-#000000图片地址），文字水印后面加上首字母大写的Size（如：Size12，意思为水印文字字号为12）可以设置水印文字大小","",ew_py)&icflsr(25,"排序","","px","",6,50,"排序越大越靠前","",ew_px)&icflsr(25,"风格","","sk","",0,50,"*请输入风格文件夹，开头不带/,以/结尾","",ew_sk)
ewform=ewform&"</ul><ul>"&icflot(10,"点评",eseditxt(ew_xt,"xt",1))
ewform=ewform&icflot(10,"选填","<input type=""checkbox"" id=""more"" name=""more"" value=""1"" onClick=""if (this.checked){document.getElementById('easmid').style.display='';}else{document.getElementById('easmid').style.display='none';}""> <label for=""more"">填写更多信息</label>")&"<ul id=""easmid"" style=""display:none;"">"
ewform=ewform&icflsr(25,"站长","","lr","",0,50,"*联系人","",ew_lr)&icflsr(25,"ＱＱ","","lq","",6,20,"*站长QQ号码","",ew_lq)&icflsr(5,"客服","","ls","",0,200,"*客服QQ号码,多个号码请使用,隔开,最多支持6个.","",ew_ls)
ewform=ewform&icflsr(25,"电话","","lh","",0,50,"*固定电话","",ew_lh)&icflsr(25,"手机","","lj","",0,50,"*手机号码","",ew_lj)&icflsr(25,"传真","","lc","",0,50,"*传真号码","",ew_lc)&icflsr(25,"邮箱","","le","",0,50,"*电子邮箱","",ew_le)
ewform=ewform&icflsr(75,"地址","","lz","",0,50,"*详细地址","",ew_lz)&icflsr(25,"邮编","","lb","",6,10,"*邮政编码","",ew_lb)
ewform=ewform&icflsr(10,"附加","","lo","",0,200,"*联系附加信息","",ew_lo)
ewform=ewform&icflsr(5,"缓存","","hc","",0,200,"*网站缓存的主页面,为空或0表示不缓存,使用英文逗号隔开,输入eesai表示所有频道","",ew_hc)&icflsr(5,"统计","","tj","",0,200,"*外部统计，直接输入统计代码,注意一定要去掉统计代码中的所有单引号和双引号,否则一定出错.","",ew_tj)
ewform=ewform&icflsr(25,"特０","","n0","",0,50,"*特别快捷方式的文字","",ew_n0)&icflsr(25,"特链","","c0","",0,50,"*特别快捷方式的链接","",ew_c0)&icflsr(25,"特１","","n1","",0,50,"*特别快捷方式的文字","",ew_n1)&icflsr(25,"特链","","c1","",0,50,"*特别快捷方式的链接","",ew_c1)
ewform=ewform&icflsr(25,"特２","","n2","",0,50,"*特别快捷方式的文字","",ew_n2)&icflsr(25,"特链","","c2","",0,50,"*特别快捷方式的链接","",ew_c2)&icflsr(25,"特３","","n3","",0,50,"*特别快捷方式的文字","",ew_n3)&icflsr(25,"特链","","c3","",0,50,"*特别快捷方式的链接","",ew_c3)
ewform=ewform&icflsr(10,"图替","","pt","",0,200,"*无图替换:内容显示过程中,当信息无图片时显示,可输入广告代码[不可含单引号与双引号],可为空.","",ew_pt)
ewform=ewform&icflsr(25,"顶密","","mma","",0,50,"*顶级密钥:请输入顶级密钥,可以查看所有密钥内容.","",aimm(g_gmm,ew_mma,1))&icflsr(25,"高密","","mmb","",0,50,"*高级密钥:请输入高级密钥,可以查看8位以下的密钥.","",aimm(g_gmm,ew_mmb,1))&icflsr(25,"中密","","mmc","",0,50,"*中级密钥:请输入中级密钥,可以查看6位以下的密钥.","",aimm(g_gmm,ew_mmc,1))&icflsr(25,"初密","","mmd","",0,50,"*初级密钥:请输入初级密钥,可以查看4位以下的密钥.","",aimm(g_gmm,ew_mmd,1))
ewform=ewform&icflsr(25,"小秘","","kx","",0,50,"*系统小秘:系统小秘书名称.","",ew_kx)&icflsr(25,"系统","","kt","",0,50,"*系统帐户:系统帐户充值提现","",ew_kt)&icflsr(25,"站长","","kz","",0,50,"*站长帐户:站长帐户网站上面交易","",ew_kz)&icflsr(25,"公共","","kg","",0,50,"*公共帐户:公共帐户证方定金","",ew_kg)
ewform=ewform&icflsr(5,"优惠","","ky","",0,50,"*优惠帐户:优惠券帐户订单中优惠券金额接收","",ew_ky)&icflsr(5,"客服","","kf","",0,50,"*客服帐户:客服帐户分单和优惠券","",ew_kf)

ewform=ewform&icflsr(5,"标名","","is","",0,50,"*网站标志名称","",ew_is)&icflsr(5,"链接","","il","",0,50,"*网站标志链接地址","",ew_il)
ewform=ewform&icflot(10,"图片",aiinput("","ig","",0,200,"标志图片或LOGO图片","f-up",ew_ig)&esup("0|1|logo|"&eshref(ew_sk&"img/",3)&"|2|AsaiForm|ig|0|0|0|0.ees"))
ewform=ewform&icflsr(5,"荐名","","ts","",0,50,"*推荐图片名称","",ew_ts)&icflsr(5,"链接","","tl","",0,50,"*推荐图片的链接地址","",ew_tl)
ewform=ewform&icflot(10,"图片",aiinput("","tg","",0,200,"推荐图片","f-up",ew_tg)&esup("0|1|tj|"&eshref(ew_sk&"img/",3)&"|2|AsaiForm|tg|0|0|0|0.ees"))

ewform=ewform&icflsr(5,"一幅","","s1","",0,50,"*横幅的名称","",ew_s1)&icflsr(5,"链接","","u1","",0,50,"*横幅的的链接地址","",ew_u1)
ewform=ewform&icflot(10,"图片",aiinput("","p1","",0,200,"横幅图片","f-up",ew_p1)&esup("0|1|b1|"&eshref(ew_sk&"img/",3)&"|2|AsaiForm|p1|0|0|0|0.ees"))
ewform=ewform&icflsr(5,"二幅","","s2","",0,50,"*横幅的名称","",ew_s2)&icflsr(5,"链接","","u2","",0,50,"*横幅的的链接地址","",ew_u2)
ewform=ewform&icflot(10,"图片",aiinput("","p2","",0,200,"横幅图片","f-up",ew_p2)&esup("0|1|b2|"&eshref(ew_sk&"img/",3)&"|2|AsaiForm|p2|0|0|0|0.ees"))
ewform=ewform&icflsr(5,"三幅","","s3","",0,50,"*横幅的名称","",ew_s3)&icflsr(5,"链接","","u3","",0,50,"*横幅的的链接地址","",ew_u3)
ewform=ewform&icflot(10,"图片",aiinput("","p3","",0,200,"横幅图片","f-up",ew_p3)&esup("0|1|b3|"&eshref(ew_sk&"img/",3)&"|2|AsaiForm|p3|0|0|0|0.ees"))
ewform=ewform&icflsr(5,"四幅","","s4","",0,50,"*横幅的名称","",ew_s4)&icflsr(5,"链接","","u4","",0,50,"*横幅的的链接地址","",ew_u4)
ewform=ewform&icflot(10,"图片",aiinput("","p4","",0,200,"横幅图片","f-up",ew_p4)&esup("0|1|b4|"&eshref(ew_sk&"img/",3)&"|2|AsaiForm|p4|0|0|0|0.ees"))
ewform=ewform&icflsr(5,"五幅","","s5","",0,50,"*横幅的名称","",ew_s5)&icflsr(5,"链接","","u5","",0,50,"*横幅的的链接地址","",ew_u5)
ewform=ewform&icflot(10,"图片",aiinput("","p5","",0,200,"横幅图片","f-up",ew_p5)&esup("0|1|b5|"&eshref(ew_sk&"img/",3)&"|2|AsaiForm|p5|0|0|0|0.ees"))
ewform=ewform&icflsr(5,"六幅","","s6","",0,50,"*横幅的名称","",ew_s6)&icflsr(5,"链接","","u6","",0,50,"*横幅的的链接地址","",ew_u6)
ewform=ewform&icflot(10,"图片",aiinput("","p6","",0,200,"横幅图片","f-up",ew_p6)&esup("0|1|b6|"&eshref(ew_sk&"img/",3)&"|2|AsaiForm|p6|0|0|0|0.ees"))

ewform=ewform&icflsr(10,"背景","","pg","",0,200,"*横幅背景颜色，使用|隔开.","",ew_pg)
ewform=ewform&icflsr(10,"其他","","ot","",0,50,"","",ew_ot)
ewform=ewform&"</ul><div class=cr></div>"
ewform=ewform&icflot(10,"验证",eskyx(1,2,2))
if ewfty=1 then
ewform=ewform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aiinput("hidden","id","",0,0,"","",ew_id)&aibutton(1,"","","f-sb f-skx",s_ztcz)&aiselect("lian","","选填项","f-s","0",0,"禁用联动|联动主要|联动所有")&"联动处理(修改编码的时候建议启用)")
elseif ewfty=0 then
ewform=ewform&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umtjs)&aibutton(1,"","","f-sb f-skx",s_ztcz))
end if
ewform=ewform&"<div class=cr></div></ul></form></div>"
End Function
'-----------------------------------
'add action
'=ewadd()
'-----------------------------------
Function ewadd()
ew_bt=s_umtjs&s_udews&","&ew_bt:ew_zt=s_umtjs&s_udews&","&ew_zt:ew_nr=s_umtjs&s_udews&","&ew_nr
e_wl=e_wl&"<li><a href="""&e_lj1&""">"&s_umtjs&s_udews&"</a></li>"
e_mt=esbts(s_udxew,s_udlew,s_umtjs&s_udews&g_gy&e_lj1,s_udews&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("sn,mc,bt,nr,zt,ur,cp,sk,xy") then
if gysfm(ewlie("form"),ewbiao,"1=2","ew_",1) then
e_ma=e_ma&aitiao(s_umtjs&s_udews&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udew&g_apj))
else
e_ma=e_ma&aigo(s_umtjs&s_udews&s_ztsb&"[未知错误]",1)
end if
else
e_ma=e_ma&aigo(s_umtjs&s_udews&s_ztsb&"[请认真填写各选项]",1)
end if
else
e_ma=ewform(0)&e_ma
end if
End Function
'-----------------------------------
'edit action
'=ewedit()
'-----------------------------------
Function ewedit()
ew_bt=s_umxgs&s_udews&","&ew_bt:ew_zt=s_umxgs&s_udews&","&ew_zt:ew_nr=s_umxgs&s_udews&","&ew_nr
e_wl=e_wl&"<li><a href="""&eshref(s_umgl&g_urg&s_udew&g_urg&s_umxg&g_urg&g_u3&g_urz,77)&""">"&s_umxgs&s_udews&"</a></li>"
e_mt=esbts(s_udxew,s_udlew,s_umxgs&s_udews&g_gy&eshref(s_umgl&g_urg&s_udew&g_urg&s_umxg&g_urg&g_u3&g_urz,77),s_umtjs&s_udews&g_gy&e_lj1&g_gx&s_udews&s_umlbs&g_gy&e_lj0)
if esky(1,e_gdj) then
if aireqx("sn,mc,bt,nr,zt,ur,cp,sk,xy") then
if gysfm(ewlie("form"),ewbiao,"ew_id="&aiint(aireq("id"))&"","ew_",2) then
if aireq("sn")<>aireq("y_sn") and (aireq("lian")="1" or aireq("lian")="2") then'处理内容分类编码更换,内容太多速度会比较慢。
Call gysgx(w_dbqz&"ai","ai_ew="&aireq("sn")&"","ai_ew="&aireq("y_sn")&"")
Call gysgx(w_dbqz&"ef","ef_ew="&aireq("sn")&"","ef_ew="&aireq("y_sn")&"")
Call gysgx(w_dbqz&"ep","ep_ew="&aireq("sn")&"","ep_ew="&aireq("y_sn")&"")
if aireq("lian")="2" then
Call gysgx(w_dbqz&"ek","ek_ew="&aireq("sn")&"","ek_ew="&aireq("y_sn")&"")
Call gysgx(w_dbqz&"eq","eq_ew="&aireq("sn")&"","eq_ew="&aireq("y_sn")&"")
Call gysgx(w_dbqz&"uk","uk_ew="&aireq("sn")&"","uk_ew="&aireq("y_sn")&"")
Call gysgx(w_dbqz&"gg","gg_ew="&aireq("sn")&"","gg_ew="&aireq("y_sn")&"")
Call gysgx(w_dbqz&"ey","ey_ew="&aireq("sn")&"","ey_ew="&aireq("y_sn")&"")
Call gysgx(w_dbqz&"ee","ee_ew="&aireq("sn")&"","ee_ew="&aireq("y_sn")&"")
end if
end if
e_ma=e_ma&aitiao(s_umxgs&s_udews&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udew&g_apj))
else
e_ma=e_ma&aigo(s_umxgs&s_udews&s_ztsb,1)
end if
else
e_ma=e_ma&aigo(s_umxgs&s_udews&s_ztsb,1)
end if
else
if gysread(ewlie("all"),ewbiao,"ew_id="&aiint(g_u3)&"","") then
e_ma=ewform(1)&e_ma
else
e_ma=e_ma&aigo(s_udews&s_ztno,1)
end if
end if
End Function
'-----------------------------------
'del
'=ewdel()
'-----------------------------------
Function ewdel()
ew_bt=s_udews&s_umscs&","&ew_bt:ew_zt=s_udews&s_umscs&","&ew_zt:ew_nr=s_udews&s_umscs&","&ew_nr
e_wl=e_wl&"<li>"&s_udews&s_umscs&"</li>"
e_mt=esbts(s_udxew,s_udlew,s_umscs&s_udews,s_umtjs&s_udews&g_gy&e_lj1&g_gx&s_udews&s_umlbs&g_gy&e_lj0)
if e_gdj>2 then
if aiint(g_u3)>0 then
if gysdel(ewbid,ewbiao,"ew_id="&aiint(g_u3)) then
e_ma=e_ma&aitiao(s_udews&s_umscs&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udew&g_apj))
else
e_ma=e_ma&aigo(s_udews&s_umscs&s_ztsb,1)
end if
elseif aibj(g_u2,s_umsc&"-x") then
if gysdel(ewbid,ewbiao,0) then
e_ma=e_ma&aitiao(s_udews&s_umscs&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udew&g_apj))
else
e_ma=e_ma&aigo(s_udews&s_umscs&s_ztsb,1)
end if
end if
end if
End Function
'-----------------------------------
'list
'=ewlist()
'-----------------------------------
Function ewlist()
e_mt=esbts(s_udxew,s_udlew,s_udews&s_umlbs&g_gy&e_lj0,s_umtjs&s_udews&g_gy&e_lj1)
if esky(1,e_gdj) then
if gysfm(ewlie(s_umlb&"s"),ewbiao,1,"ew_",22) then
e_ma=e_ma&aitiao(s_umxgs&s_udews&s_ztcg,e_lj0,i_nmtz)
e_ma=e_ma&eskod(17,77,esapm(0,s_udew&g_apj))
else
e_ma=e_ma&aigo(s_umxgs&s_udews&s_ztsb,1)
end if
else
'@@ew_id,1ew_sn,2ew_mc,3ew_bt,4ew_nr,5ew_zt,6ew_cp,7ew_sk,8ew_xy
if gystop(i_nmtp,ewbid,ewlie(s_umlb),ewbiao,"",ewordermo,"") then
e_ma=e_ma&"<div class=""f-l""><form id=""AsaiForm"" name=""AsaiForm"" action="""" method=""post""><ul>"
gysax=split(gysar,g_gx)
for gysi=0 to ubound(gysax)
gysay=split(gysax(gysi),g_gy)
if gysi mod 2=0 then
e_lcss="l-1"
else
e_lcss="l-2"
end if
if aiint(gysay(8))>1 then
e_lcss=e_lcss&" ft"
elseif aiint(gysay(8))<1 then
e_lcss=e_lcss&" ftq"
end if
e_ma=e_ma&icflsr("25 "&e_lcss,"名称","","mc","",0,50,"*","",gysay(2))&icflsr("25 "&e_lcss,"编码","","sn","",6,50,"*","",gysay(1))&icflsr("25 "&e_lcss,"标题","","bt","",6,200,"","",gysay(3))&icflsr("25 "&e_lcss,"主题","","zt","",0,200,"","",gysay(5))
e_ma=e_ma&icflxz("25 "&e_lcss,"状态","xy","","","f-s",gysay(8),0,i_bxy)&icflsr("25 "&e_lcss,"介绍","","nr","",0,200,"","",gysay(4))&icflsr("25 "&e_lcss,"风格","","sk","",0,200,"","",gysay(7))&icflot("25 "&e_lcss,"",aiinput("hidden","id","",0,0,"","",gysay(0))&aibutton(2,"","","f-sb","快速"&s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udew&g_urg&s_umxg&g_urg&gysay(0)&g_urz,77),"","","","f-sb","详细"&s_umxgs)&aibuttonk(eshref(s_umgl&g_urg&s_udew&g_urg&s_umsc&g_urg&gysay(0)&g_urz,77),s_umscs&s_udews&s_ztqr,"","","f-sb",s_umscs))
next
e_ma=e_ma&icflot(10,"验证",eskyx(0,2,2))
e_ma=e_ma&icflot(10,"",aibutton(2,"","","f-sb f-skx",s_umxgs)&aibutton(1,"","","f-sb f-skx",s_ztcz)&aibuttonk(eshref(s_umgl&g_urg&s_udew&g_urg&s_umsc&"-x"&g_urz,77),s_umscs&s_udews&s_ztqr,"","","f-sb f-skx","清空"))
e_ma=e_ma&"<div class=cr></div></ul></form></div>"
else
e_ma=e_ma&aigo(s_udews&s_ztno,e_lj1)
end if
end if
End Function
%>