<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"-->function setCookie(name,value){var Days = 30;var exp = new Date();exp.setTime(exp.getTime() + Days*24*60*60*1000);document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();}function getCookie(name){var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");if(arr=document.cookie.match(reg)){return unescape(arr[2]);}else{return null;}}function delCookie(name){var exp = new Date();exp.setTime(exp.getTime() - 1);var cval=getCookie(name);if(cval!=null)document.cookie= name + "="+cval+";expires="+exp.toGMTString();}
<%

Function saimetajs(saifnm,saifurl,saifstr)
saimetajs="function saigourl"&saifnm&"(){location.replace('"&saifurl&"');}"
saimetajs=saimetajs&"setTimeout('saigourl"&saifnm&"()',"&i_nmtz*1000&");"
saimetajs=saimetajs&"document.write(""<a href="&saifurl&">"&saifstr&"<br>"&i_nmtz&" 秒后跳转。</a>"");"
End Function
'0密钥位数/1密钥验证/0=exit|1=index|2=reg&login|3=edit/3(0来自网站_sai-1用户名_sai-2密码_sai-3邮箱_sai-4电话_sai-5名称_sai-6id|us_sj)
dim sai_ur,sai_urr,sai_urx,sai_ty,sai_ww,sai_ip,sai_us,sai_mm,sai_em,sai_dh,sai_bt,sai_xy,sai_id,sai_sj,sai_sn,sai_cks,sai_emx
sai_ur=aimm(g_gmm,g_ustring,1)
'response.Write("document.write("""&sai_ur&"<br>"");")
sai_urr=split(sai_ur,"/")
if aiint(sai_urr(0))>0 and left(g_gmm,sai_urr(0))=sai_urr(1) then'验证密钥
sai_ty=aiint(sai_urr(2))
if sai_ty=0 then'exit
Call icuser(0)
response.Write(saimetajs("","?user/login/","成功退出登录状态！"))
response.Write("delCookie("""&w_ucs&""");")


elseif sai_ty=1 then'index
sai_ip=aiip()
sai_urx=split(sai_urr(3)&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx,g_gx)
sai_mm=sai_urx(0)
Randomize
if sai_ip<>"" then
Call opendb(i_dir)
Call saik(rs,"select * from "&usbiao&" where us_ip='"&sai_ip&"' and us_mm='"&sai_mm&"'",1,3)
if rs.eof and rs.bof then
rs.addnew
sai_sn="UW"&aisn(1)
rs("us_er")=sai_sn&"_IP"
rs("us_bt")=split(s_ztpm,"|")(int(333*Rnd))&"IP"&right(sai_sn,2)
rs("us_mm")=sai_mm
rs("us_tm")=aitm(3,now())
rs("us_t1")=aitm(2,now())
rs("us_t2")=aitm(2,now())+7
rs("us_ip")=sai_ip
rs("us_xy")=ew_sh
rs("us_hi")=0
rs("us_xi")=0
rs("us_xo")=0
rs("us_jq")=0
rs("us_jb")=0
rs("us_jy")=0
rs("us_xt")=espxx("IP来自"&sai_ww)
rs.update
Call saig(rs)
Call aisn(0)
Call saik(rs,"select * from "&usbiao&" where us_er='"&sai_sn&"_IP"&"'",1,1)
Call icuser(2)
response.Write("setCookie("""&w_ucs&""","""&userlin&""");")
Call saig(rs)
response.Write(saimetajs("","?user/edit/","提示："&sai_ip&"第一次登录，已经注册成功，并登录成功。"))
else
rs("us_t1")=now()
rs("us_xt")=rs("us_xt")&espxx("IP登录自"&sai_ww)
rs.update
Call icuser(2)
response.Write("setCookie("""&w_ucs&""","""&userlin&""");")
Call saig(rs)
response.Write(saimetajs("","?user/edit/",""&sai_ip&"登录成功！"))
end if
Call saio()

else
response.Write("document.write(""对不起，无法获取用户信息！"");")
end if


elseif sai_ty=2 then'reg&login
sai_urx=split(sai_urr(3)&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx,g_gx)
sai_ww=sai_urx(0)
sai_us=sai_urx(1)
sai_mm=aimm(g_gmm,sai_urx(2),0)
sai_em=sai_urx(3)
sai_dh=sai_urx(4)
sai_bt=aijie(sai_urx(5))
sai_sj=sai_urx(6)
if sai_us<>"" and sai_mm<>"" then
Call opendb(i_dir)
if sai_em<>"" then
Call saik(rs,"select * from "&usbiao&" where us_er='"&sai_us&"' or us_em='"&sai_em&"'",1,3)
else
Call saik(rs,"select * from "&usbiao&" where us_er='"&sai_us&"'",1,3)
end if
if rs.eof and rs.bof then
rs.addnew
rs("us_er")=sai_us
rs("us_mm")=sai_mm
rs("us_em")=sai_em
rs("us_bt")=sai_bt
rs("us_dh")=sai_dh
rs("us_sj")=sai_sj
rs("us_tm")=aitm(3,now())
rs("us_t1")=aitm(2,now())
rs("us_t2")=aitm(2,now())+7
rs("us_ip")=aiip()
rs("us_xy")=ew_sh
rs("us_hi")=0
rs("us_xi")=0
rs("us_xo")=0
rs("us_jq")=0
rs("us_jb")=0
rs("us_jy")=0
rs("us_xt")=espxx("来自"&sai_ww)
rs.update
Call saig(rs)
Call aisn(0)
Call saik(rs,"select * from "&usbiao&" where us_er='"&sai_us&"'",1,1)
Call icuser(2)
response.Write("setCookie("""&w_ucs&""","""&userlin&""");")
Call saig(rs)
response.Write(saimetajs("","?user/edit/","提示：该用户第一次登录，新用户"&sai_us&"已经注册成功，并登录成功。"))
else
if sai_mm=rs("us_mm") then
rs("us_ip")=aiip()
rs("us_t1")=now()

us_sb=aiint(rs("us_sb"))
us_er=rs("us_er")
if us_sb>0 then Call gysgx("ees_us_"&us_sb,"us_xt=us_xt"&espdbi()&"'"&espxx("登录自"&sai_ww)&"'","us_er='"&us_er&"'")

rs.update
Call icuser(2)
response.Write("setCookie("""&w_ucs&""","""&userlin&""");")
response.Write(saimetajs("","?user/edit/","登录成功！"))
else
response.Write("document.write(""登录失败，用户或密码有误！"");")
end if
Call saig(rs)
end if
Call saio()
else
response.Write("document.write(""登录失败，用户和密码不能为空！"");")
end if


elseif sai_ty=3 then'edit
sai_urx=split(sai_urr(3)&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx,g_gx)
sai_ww=sai_urx(0)
sai_us=sai_urx(1)
sai_mm=aimm(g_gmm,sai_urx(2),0)
sai_em=sai_urx(3)
sai_dh=sai_urx(4)
sai_bt=aijie(sai_urx(5))
sai_id=aiint(sai_urx(6))
if sai_id>0 then
sai_emx=""
Call opendb(i_dir)
if sai_em<>"" then
Call saik(rs,"select us_id from "&usbiao&" where us_id<>"&sai_id&" and us_em='"&sai_em&"'",1,3)
if rs.eof and rs.bof then
else
sai_emx="1"
end if
Call saig(rs)
end if
if sai_emx="1" then
response.Write("document.write(""编辑失败，邮箱"&sai_em&"已存在！"");")
else
Call saik(rs,"select * from "&usbiao&" where us_id="&sai_id&"",1,3)
if rs.eof and rs.bof then
response.Write("document.write(""编辑失败，该用户不存在！"");")
Call saig(rs)
else
if e_uer=rs("us_er") then
if not ainull(sai_us) then rs("us_er")=sai_us
if not ainull(us_mm) then rs("us_mm")=sai_mm
rs("us_em")=sai_em
rs("us_bt")=sai_bt
rs("us_dh")=sai_dh
rs("us_ip")=aiip()
rs("us_t1")=now()

us_sb=aiint(rs("us_sb"))
us_er=rs("us_er")
if us_sb>0 then Call gysgx("ees_us_"&us_sb,"us_xt=us_xt"&espdbi()&"'"&espxx("编辑自"&sai_ww)&"'","us_er='"&us_er&"'")

rs.update
Call saig(rs)
Call saik(rs,"select * from "&usbiao&" where us_id="&sai_id&"",1,1)
Call icuser(2)
response.Write("setCookie("""&w_ucs&""","""&userlin&""");")
Call saig(rs)
response.Write(saimetajs("","?user/edit/","编辑成功！"))
else
Call saig(rs)
response.Write("document.write(""编辑失败，无权执行编辑操作！"");")
end if
end if
end if
Call saio()
else
response.Write("document.write(""编辑失败，id值不能为空！"");")
end if


elseif sai_ty=4 then'find mm
sai_urx=split(sai_urr(3)&g_gx&g_gx&g_gx&g_gx&g_gx&g_gx,g_gx)
sai_us=sai_urx(1)'储存网址
sai_em=sai_urx(3)'储存邮箱
sai_bt=aijie(sai_urx(5))'储存网站名
if sai_em<>"" then
Call opendb(i_dir)
Call saik(rs,"select us_er,us_mm,us_ip,us_t1 from "&usbiao&" where us_em='"&sai_em&"'",1,3)
if rs.eof and rs.bof then
response.Write("document.write(""该邮箱不存在！"");")
else
Call aiemail(g_emkg,g_emci,g_emrp,sai_em,"","","",sai_bt&"的账户与密码信息",1,"<p>账户：<b>"&rs("us_er")&"</b></p><p>密码：<b>"&aimm(g_gmm,rs("us_mm"),1)&"</b></p><p>最后一次在 "&rs("us_t1")&" 来自 "&rs("us_ip")&"</p><p>以上是您的账户和密码信息。</p><p><a href=http://"&sai_us&">"&sai_bt&"　http://"&sai_us&"</a></p>","","<p>账户与密码信息已发送，请注意查收。</p>")
response.Write(saimetajs("","?user/login/","提示：用户和密码信息已经成功发送到邮箱"&sai_em&"，请注意查收！"))
end if
Call saig(rs)
Call saio()
else
response.Write("document.write(""邮箱不能为空！"");")
end if


elseif sai_ty=5 then'ip list
sai_ip=aiip()
Call opendb(i_dir)
Call saik(rs,"select us_er,us_bt,us_tm,us_t1 from "&usbiao&" where us_ip='"&sai_ip&"' order by us_t1 desc",1,1)
if rs.eof and rs.bof then
response.Write("document.write(""最近暂无用户从"&sai_ip&"登录！"");")
else
response.Write("document.write(""<table border=1 cellspacing=0 cellpadding=0>"");")
response.Write("document.write(""<tr><td colspan=4 align=center><b>"&sai_ip&"最近登录记录</b></td></tr>"");")
response.Write("document.write(""<tr bgcolor=#D8D8D8><td>用户</td><td>称呼</td><td>注册时间</td><td>登录时间</td></tr>"");")
Do While Not rs.eof
response.Write("document.write(""<tr><td>"&rs("us_er")&"</td><td>"&rs("us_bt")&"</td><td>"&rs("us_tm")&"</td><td>"&rs("us_t1")&"</td></tr>"");")
rs.movenext
loop
response.Write("document.write(""</table>"");")
end if
Call saig(rs)
Call saio()


end if
else
response.Write("document.write(""请注意：登录接口不匹配，请联系管理员！"");")
end if
%>
