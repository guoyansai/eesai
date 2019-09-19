<%
const w_ucy=1'缓存方式-0Session1Cookies
const w_ucs="AsaiUser"'缓存名称:输入英文缓存名默认AsaiUser
const w_ugg="_-"'间隔符号:缓存字段之间的间隔符号
const w_urr="id*,sj,er,ef,ff,zy*,as*,ax*,ab*,ah*,ar*,az,ad,bt,ca,ct,dh,em,up,ip,t1*,t2*,ux*,uy*,hi*,xi*,xo*,jb*,jy*,jq*,xy*,zx*,sb*"'缓存字段:缓存字段合集
const w_uck="qx"'跨界权限:输入英文缓存名默认qx,=userx

Execute("dim e_u"&replace(replace(w_urr,"*",""),",",",e_u")&"")'自定义缓存字段
dim userx,userlin
userx=0'会员等级或状态
Call icuser(1)'登录
Response.Cookies("asaiup")=userx'赋值上传权限
Response.Cookies(w_uck)=userx'cookies跨网页赋权
Response.Cookies(w_uck).Expires=date()+7
'---------------------------
'储存缓存过程
'---------------------------
Function icusck(icufstr)
if w_ucy=1 then
Response.Cookies(w_ucs)=icufstr
else
Session(w_ucs)=icufstr
end if
if icufstr="" then Response.Cookies(w_uck)=""
End Function
'---------------------------
'数字空默认为0
'---------------------------
Function icusnm(icufstr)
if icufstr="" then
icusnm=0
else
icusnm=int(icufstr)
end if
End Function
'---------------------------
'缓存读写过程0del、1read、2rs writer、3read writer、4request writer、5user writer
'---------------------------
Function icuser(icufty)
if icufty=0 then
Call icusck("")
else
dim userrr,userii,userr,userud,userll
userlin=""
userr=split(w_urr,",")
userud=ubound(userr)
if icufty=1 then
dim userss
if w_ucy=1 then
userss=Request.Cookies(w_ucs)
else
userss=Session(w_ucs)
end if
if userss<>"" then
userrr=split(userss,w_ugg)
if userud=ubound(userrr) then
for userii=0 to userud
userlin="e_u"&userr(userii)
userll=userrr(userii)
if right(userlin,1)="*" then
userlin=replace(userlin,"*","")
userll=icusnm(userll)
end if
'Response.Write userii&"/"&userud&""&userlin&"="&userll&"<br>"
Execute(userlin&"=userll")
next
userx=icusnm(e_uxy)+1
end if
end if
else

		for userii=0 to userud
		if userii>0 then userlin=userlin&w_ugg
			if icufty=2 then
			Execute("userll=rs(""us_"&replace(userr(userii),"*","")&""")")
			elseif icufty=3 then
			Execute("userll=us_"&replace(userr(userii),"*",""))
			elseif icufty=4 then
			Execute("userll=request("""&replace(userr(userii),"*","")&""")")
			elseif icufty=5 then
			Execute("userll=e_u"&replace(userr(userii),"*",""))
			end if
		'response.Write userii&userr(userii)&"="&userll&"<br>"
		userlin=userlin&userll
		next
		'response.Write "<br>保存的缓存："&userlin&"<br>"
		Call icusck(userlin)

end if
end if
End Function
%>