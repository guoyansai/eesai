<%
dim e_gmc,e_gdj,e_gxy,e_gjb,e_gxi,e_gxo,e_gus
e_gmc="":e_gdj=0:e_gxy=0:e_gjb=0:e_gxi=0:e_gxo=0:e_gus="-"
dim e_aexit,e_alogin,e_aadmin
e_aexit=eshref(s_dradmin&"?exit.html",3)
e_alogin=eshref(s_dradmin&"?login.html",3)
e_aadmin=eshref(s_dradmin,3)

if aiks(i_xkhc,i_hccgl,"",2)<>"" then
dim adminarr
adminarr=split(aimm(g_gmm,aiks(i_xkhc,i_hccgl,"",2),1),g_gx)
if ubound(adminarr)=6 then
e_gmc=adminarr(0)
e_gdj=aiint(adminarr(1))
e_gxy=aiint(adminarr(2))
e_gjb=aiint(adminarr(3))
e_gxi=aiint(adminarr(4))
e_gxo=aiint(adminarr(5))
e_gus=adminarr(6)
end if
elseif i_xklg=1 then
e_gmc="EESai"
e_gdj=aiint(i_xklx)
Response.Cookies("gl")=i_xklx
e_gxy=2
e_gjb=0
e_gxi=0
e_gxo=0
e_gus="EESai"
end if

Function admingx(eefty,eefva)
if aiks(i_xkhc,i_hccgl,"",2)<>"" then
dim eedurr,eeduii,eeduts
eeduts=adminarr(0)
eedurr=split("id,sn,sj,er,zj,bt,dh,em,ty,xy,hi,xi,jx,px,jd,jq,jt,jb,jy,up,qm,t1,ip",",")
for eeduii=1 to ubound(eedurr)
if aibj(eefty,eedurr(eeduii)) then
eeduts=eeduts&g_gx&eefva
if aibj(eefty,"jy") or aibj(eefty,"jb") then
admingx="<script language=""javascript"">function boxts(){var boxtsdiv=document.getElementById(""bbtsbox"");boxtsdiv.style.display=""none"";}setTimeout(""boxts()"",3000);</script><div id=""bbtsbox"" class=""boxts"">提示：感谢您的支持 "
if aibj(eefty,"jy") then
admingx=admingx&"经验 "&aiint(eefva)-aiint(e_ujy)&"(您还有 "&eefva&" 经验)"
elseif aibj(eefty,"jb") then
admingx=admingx&"金币 "&aiint(eefva)-aiint(e_ujb)&"(您还有 "&eefva&" 金币)"
end if
admingx=admingx&"</div>"
end if
else
eeduts=eeduts&g_gx&adminarr(eeduii)
end if
next
Call aiks(i_xkhc,i_hccgl,aimm(g_gmm,eeduts,0),1)
end if
End Function
%>