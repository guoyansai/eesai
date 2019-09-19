<%
const x_ddy=0
const x_ddm=1
const x_ddck="EESaigysok"
const x_ddgx="@@"
const x_ddga="##"
const x_ddgb="||"
dim x_ddtj:x_ddtj=i_dir&"?deal/0/asai.html"
dim x_dddcs,x_dddus,x_dddjj,x_dddsn,x_dddsl,x_dddzl
'-----------------------------------
'order main sub (start)
'ddsai(ddfty=11del cokies|1=del|2=jian|>3=jia|8=act,ddfstr,ddfsn=0|,ddfjg,ddfsl,ddfbt,ddfus)
'-----------------------------------
function ddsai(ddfty,ddfstr,ddfsn,ddfjg,ddfsl,ddfbt,ddfel,ddfus)
if not isNumeric(ddfty) then ddfty=0
if ddfsn="" or ddfsn="0" then'no sn
if ddfty=11 then
response.Cookies(x_ddck)=""
else
response.Cookies(x_ddck)=ddfstr
end if
else
if not isNumeric(ddfjg) then ddfjg=0
if not isNumeric(ddfsl) then ddfsl=0
if ddfbt="" then ddfbt=ddfsn
if ddfus="" then ddfus=ew_kz
dim ddxdrr,ddxdi,ddxdls,ddxdud,ddadrr,ddadi,ddadls,ddadud,ddbdrr,ddbdsn,ddbdjg,ddbdsl,ddbdbt,ddbdel,ddadus,ddzdcl,ddzdck,ddzdty,ddzdact
ddzdty=0
ddzdck=""
ddzdcl=x_ddgx&ddfus&x_ddga&ddfsn&x_ddgb&ddfjg&x_ddgb&ddfsl&x_ddgb&ddfbt&x_ddgb&ddfel
if ddfstr<>"" then'0-1-A
ddxdrr=split(ddfstr,x_ddgx)
ddxdud=ubound(ddxdrr)
if ddxdud>0 then
if instr(ddfstr,x_ddgx&ddfus)>0 then'0-3-A
ddzdty=1
for ddxdi=1 to ddxdud'@@
ddxdls=ddxdrr(ddxdi)
if ddxdls<>"" then
ddadrr=split(ddxdls,x_ddga)
ddadud=ubound(ddadrr)
ddadus=ddadrr(0)
if ddadud>0 then
if ddadus=ddfus then'0-5-A
ddzdcl=x_ddgx&ddadus
if instr(ddxdls,x_ddga&ddfsn&x_ddgb)>0 then'0-6-A
for ddadi=1 to ddadud'##
ddadls=ddadrr(ddadi)
ddbdrr=split(ddadls,x_ddgb)'||
if ubound(ddbdrr)=4 then
ddbdsn=ddbdrr(0)
ddbdjg=ddbdrr(1)
ddbdsl=ddbdrr(2)
ddbdbt=ddbdrr(3)
ddbdel=ddbdrr(4)
if not isNumeric(ddbdjg) then ddbdjg=0
if not isNumeric(ddbdsl) then ddbdsl=0
if ddbdsn=ddfsn then'0-8-A
if ddfty=1 then'0-9-A------del
'ddzdcl=ddzdcl
elseif ddfty=2 then'0-9-A------jian
if ddfsl<2 then ddfsl=1
ddbdsl=ddbdsl-ddfsl
if ddbdsl>0 then ddzdcl=ddzdcl&x_ddga&ddbdsn&x_ddgb&ddbdjg&x_ddgb&ddbdsl&x_ddgb&ddbdbt&x_ddgb&ddbdel
elseif ddfty>2 then'0-9-A------jia
if ddfjg>0 and not ddbdjg=ddfjg then ddbdjg=ddfjg
if ddfty=3 then
if ddfsl>0 then ddbdsl=ddfsl
ddzdcl=ddzdcl&x_ddga&ddbdsn&x_ddgb&ddbdjg&x_ddgb&ddbdsl&x_ddgb&ddbdbt&x_ddgb&ddbdel
elseif ddfty>3 then
if ddfsl<2 then ddfsl=1
ddbdsl=int(ddbdsl)+int(ddfsl)
ddzdcl=ddzdcl&x_ddga&ddbdsn&x_ddgb&ddbdjg&x_ddgb&ddbdsl&x_ddgb&ddbdbt&x_ddgb&ddbdel
if ddfty=9 then ddzdact="<script language=javascript>alert('提示：购物车已有["&ddbdbt&"]，本操作在原数量上增加"&ddfsl&"件，当前共有["&ddbdsl&"]件。');</script>"
end if
end if'0-9-C
else'0-8-B
ddzdcl=ddzdcl&x_ddga&ddadls
end if'0-8-C
end if
next
else'0-6-B
ddzdcl=x_ddgx&ddxdls&x_ddga&ddfsn&x_ddgb&ddfjg&x_ddgb&ddfsl&x_ddgb&ddfbt&x_ddgb&ddfel
if ddfty=9 then ddzdact="<script language=javascript>alert('提示：成功添加"&ddadus&"["&ddfbt&"]"&ddfsl&"件。');</script>"
end if'0-6-C
else'0-5-B
ddzdck=ddzdck&x_ddgx&ddxdls
end if'0-5-C
end if
end if
next
end if'0-3-C
end if
end if'0-1-C
if ddzdty>0 then
ddzdck=ddzdcl&ddzdck
else
ddzdck=ddzdcl&ddfstr
if ddfty=9 then ddzdact="<script language=javascript>alert('提示：成功添加["&ddfbt&"]"&ddfsl&"件。');</script>"
end if
if ddfty>0 then response.Cookies(x_ddck)=ddzdck
if ddzdact<>"" and ddfty=9 then ddsai=ddzdact
end if
end function
'-----------------------------------
'order show
'-----------------------------------
dim ddshid,ddshyh,ddshhj,ddshsf,ddshzl,ddshsl,ddshyhx,ddshhjx,ddshsfx,ddshzlx,ddshslx,ddshxxx,ddshusx,ddduhty,ddduhjq,ddduhje,ddduhus
function ddshow(ddfstr,ddfty,ddfjm)
'response.Write ddfstr
'response.Cookies(x_ddck)=""
dim ddjmrr,ddjmy,ddjmx,ddjmn,ddjmh,ddjmlm
'ddfjm=减免|限额|编码|用户
ddjmrr=split(ddfjm,"|")
ddjmlm=0
if ubound(ddjmrr)=3 then
ddjmy=int(ddjmrr(0))
ddjmx=int(ddjmrr(1))
ddjmn=ddjmrr(2)
ddjmh=ddjmrr(3)
else
ddjmy=0
ddjmx=0
ddjmn=""
ddjmh=""
end if
dim ddxdrr,ddxdi,ddxdls,ddxdud,ddadrr,ddadi,ddadls,ddadud,ddbdrr,ddbdsn,ddbdjg,ddbdsl,ddbdbt,ddbdel,ddadus,ddadxj
ddshyh=0
ddshyhx=0
ddshzlx=0
ddshslx=0
ddshhjx=0
ddshid=0
ddshxxx=""
if not isNumeric(ddfty) then ddfty=4
ddshow="<table border=0 cellspacing=0 cellpadding=0 class=d-vt>"
if ddfstr<>"" then'0-1-A
ddxdrr=split(ddfstr,x_ddgx)
ddxdud=ubound(ddxdrr)
x_dddcs=ddxdud
if ddxdud>0 then
for ddxdi=1 to ddxdud'@@
ddxdls=ddxdrr(ddxdi)
if ddxdls<>"" then
ddadrr=split(ddxdls,x_ddga)
ddadud=ubound(ddadrr)
ddadus=ddadrr(0)
if ddadud>0 then
ddshzl=0
ddshsl=0
ddshhj=0
ddshid=ddshid+1
x_dddus=x_dddus&x_ddgx&ddadus
ddshow=ddshow&"<tr class=d-vta><td colspan="&ddfty&">"&ddadus&" 订单"&ddxdi&"</td></tr>"
if ddfty="5" then
ddshow=ddshow&"<tr class=d-vtt><td>名称</td><td width=32 class=tc>单价</td><td width=78 class=tc>数量</td><td width=32 class=tc>小计</td><td width=32 class=tc>删除</td></tr>"
else
ddshow=ddshow&"<tr class=d-vtt><td>名称</td><td width=58 class=tc>单价</td><td width=58 class=tc>数量</td><td width=58 class=tc>小计</td></tr>"
end if
for ddadi=1 to ddadud'##
ddadls=ddadrr(ddadi)
ddbdrr=split(ddadls,x_ddgb)'||
if ubound(ddbdrr)=4 then
ddbdsn=ddbdrr(0)
ddbdjg=ddbdrr(1)
ddbdsl=ddbdrr(2)
ddbdbt=ddbdrr(3)
ddbdel=ddbdrr(4)
x_dddsn=x_dddsn&x_ddgx&ddbdsn
x_dddsl=x_dddsl&x_ddgx&ddbdsl
if not isNumeric(ddbdjg) then ddbdjg=0
if not isNumeric(ddbdsl) then ddbdsl=0
ddadxj=int(ddbdjg*ddbdsl)
if ddadi mod 2=0 then
ddshow=ddshow&"<tr class=d-vt1>"
else
ddshow=ddshow&"<tr class=d-vt0>"
end if
ddshow=ddshow&"<td><a class=d-vbt title="""&ddbdbt&""" target=""_blank"" href=""/?info/"&ddbdsn&".html"">"&ddbdbt&"</a></td><td class=tc>"&ddbdjg&"</td>"
if ddfty="5" then
ddshow=ddshow&"<td class=tc>"
if ddbdsl<2 then
ddshow=ddshow&"<span class=d-vfs title=已达最小值>-</span>"
else
ddshow=ddshow&"<a class=d-vaj href=?jian/"&ddbdsn&"/"&ddadus&">-</a>"
end if
ddshow=ddshow&"<input type=text value="&ddbdsl&" class=d-vfi onchange=""if(this.value!=0&&this.value!==''){location.href='?edit/"&ddbdsn&"/"&ddadus&"/'+this.value+'';}""><a class=d-vaj href=?jia/"&ddbdsn&"/"&ddadus&">+</a></td><td class=tc>"&ddadxj&"</td><td class=tc><a class=d-vajx href=?del/"&ddbdsn&"/"&ddadus&">×</a></td>"
else
ddshow=ddshow&"<td class=tc>"&ddbdsl&"</td><td class=tc>"&ddadxj&"</td>"
end if
ddshow=ddshow&"</tr>"
ddshzl=ddshzl+1
ddshsl=ddshsl+ddbdsl
if ew_dd=0 and ddadxj<x_ddm then
ddshhj=ddshhj+ddadxj+x_ddy
ddshyh=ddshyh+x_ddy
else
ddshhj=ddshhj+ddadxj
end if
end if
next
if ddshhj<x_ddm and ew_dd>0 then
ddshsf=ddshhj
ddshhj=ddshhj-ddshyh
else
ddshyh=x_ddy
ddshsf=ddshhj+ddshyh
end if
ddshow=ddshow&"<tr class=d-vtd><td colspan="&ddfty&" align=left>单品种类：<b>"&ddshzl&"</b> 种<br>商品数量：<b>"&ddshsl&"</b> 件"
if ew_dd=0 then ddshow=ddshow&"<br>订单数量：<b>"&ddshzl&"</b> 个"
ddshow=ddshow&"<br>总计价格：<b>"&ddshhj&"</b> 元"
ddshow=ddshow&"<br>服务费用：<b>"&ddshyh&"</b> 元<div class=d-vsm>"&s_ztfw&"<br>正值活动期间！单个订单满 <b>"&x_ddm&"</b> 元减免服务费用</div>"
if ddjmh<>"" and ddjmh=ddadus and ddshsf>=ddjmx then
ddjmlm=1
ddshow=ddshow&"<br>优惠信息：<b>"&ddjmy&"</b> 元（使用"&ddjmh&"优惠券"&ddjmn&"满"&ddjmx&"减免"&ddjmy&"）"
ddshsf=ddshsf-ddjmy
end if
x_dddjj=x_dddjj&x_ddgx&ddshsf
ddshow=ddshow&"<div class=d-vsf>["&ddadus&" 订单"&ddxdi&""
if ew_dd=0 then ddshow=ddshow&"(含子订单"&ddshzl&"个)"
ddshow=ddshow&"] 实际应付 <b>"&ddshsf&"</b> 元"
if instr(uy_sn,"-")>0 then ddshow=ddshow&"<br>* 若组合订单["&split(uy_sn,"-")(0)&"]满 "&x_ddm&" 元，免收服务费 "&x_ddy&" 元"
ddshow=ddshow&"</div>"
ddshxxx=ddshxxx&"|"&ddadus&"|"&ddshsf
ddshow=ddshow&"</td></tr>"
ddshzlx=ddshzlx+ddshzl
ddshslx=ddshslx+ddshsl
ddshhjx=ddshhjx+ddshhj
ddshyhx=ddshyhx+ddshyh
ddshsfx=ddshsfx+ddshsf
end if
end if
next
dim ddshlin
ddshlin="<tr class=d-vta><td colspan="&ddfty&">合计报告</td></tr>"
ddshlin=ddshlin&"<tr class=d-vtd><td colspan="&ddfty&" align=left>"
if ew_dd=0 then
ddshlin=ddshlin&"<br>订单合计：<b>"&ddshzlx&"</b> 个<br>"
x_dddzl=ddshzlx
else
ddshlin=ddshlin&"订单总数：<b>"&ddxdi-1&"</b> 个<br>"
x_dddzl=ddxdi-1
end if
ddshlin=ddshlin&"单品种类：<b>"&ddshzlx&"</b> 种<br>商品数量：<b>"&ddshslx&"</b> 件<br>总计价格：<b>"&ddshhjx&"</b> 元"
ddshlin=ddshlin&"<br>服务费用：<b>"&ddshyhx&"</b> 元"
if ddjmh<>"" and ddjmh=ew_kt and ddshsfx>=ddjmx then
ddjmlm=2
ddshlin=ddshlin&"<br>优惠信息：约<b>"&ddjmy&"</b> 元（使用优惠券"&ddjmn&"满"&ddjmx&"减免约"&ddjmy&"）"
ddshsfx=ddshsfx-ddjmy
end if
if ddshid>1 and ddjmlm=2 then
dim ddsxrr,ddsxi,ddsxsfl,ddsxsf,ddsxjm
ddsxrr=split(ddshxxx,"|")
ddsxsfl=ddshsfx
ddshsfx=0
ddshlin=ddshlin&"<br>子订单优惠价格如下："
for ddsxi=1 to ubound(ddsxrr) step 2
ddsxsf=int(ddsxrr(ddsxi+1))
ddshlin=ddshlin&"<br>"&ddsxrr(ddsxi)&"："&ddsxsf&"-"&int(ddjmy*(ddsxsf/ddsxsfl))&"="
ddsxsf=ddsxsf-int(ddjmy*(ddsxsf/ddsxsfl))
ddshlin=ddshlin&"<b>"&ddsxsf&"</b> 元"
ddshsfx=ddshsfx+ddsxsf
next
end if
ddshusx=""
if ddxdi=2 then ddshusx=ddadus
if ddshusx="" then ddshusx=ew_kf
ddshlin=ddshlin&"<div class=d-vsf>合计支付 <b>"&ddshsfx&"</b> 元</div>"
ddshlin=ddshlin&"</td></tr>"
if x_dddcs>1 then ddshow=ddshow&ddshlin
end if
end if'0-1-C
if ddshslx=0 then ddshow=ddshow&"<tr class=d-vtd><td colspan="&ddfty&" align=center>暂无商品</td></tr>"
ddshow=ddshow&"</table>"
End function
'-----------------------------------
'car show
'-----------------------------------
function ddcar(ddfstr)
'ddcar=ddshow(ddfstr,5,"200|2000|ddfgtgvbcvgh|eesai")
ddcar=ddshow(ddfstr,5,"100|2000|ddfgtgvbcvgh|"&ew_kt&"")
'ddcar=ddshow(ddfstr,7,0)
End function
'-----------------------------------
'order read
'-----------------------------------
function ddread(ddfstr,ddfjm)
ddread=ddshow(ddfstr,4,ddfjm)
end function
%>