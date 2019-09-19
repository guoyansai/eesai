<%
Function zfform(zfffk,zffmj,zffbh,zffmc,zffms,zffwz,zffip)
'付款金额：必填
zfform="<input type=""hidden"" value="""&zfffk&""" name=""WIDtotal_fee"">"
'卖家支付宝帐户：必填
zfform=zfform&"<input type=""hidden"" value="""&zffmj&""" name=""WIDseller_email"">"
'商户订单号：商户网站订单系统中唯一订单号，必填
zfform=zfform&"<input type=""hidden"" value="""&zffbh&""" name=""WIDout_trade_no"">"
'订单名称：必填
zfform=zfform&"<input type=""hidden"" value="""&zffmc&""" name=""WIDsubject"">"
'订单描述：
zfform=zfform&"<input type=""hidden"" value="""&zffms&""" name=""WIDbody"">"
'商品展示地址：需以http://开头的完整路径，例如：http://www.eesai.com/myorder.html
zfform=zfform&"<input type=""hidden"" value="""&zffwz&""" name=""WIDshow_url"">"
'客户端的IP地址：非局域网的外网IP地址，如：221.0.0.1
zfform=zfform&"<input type=""hidden"" value="""&zffip&""" name=""WIDexter_invoke_ip"">"
End Function


Function zffan(zffdd,zffjy,zffzt)

Call opendb(i_dir)
gyssql="select uy_ft,uy_ot,uy_fk,uy_xy,uy_ty,uy_sn from ees_uy where uy_sn='"&zffdd&"'"
Call saik(gysrs,gyssql,1,3)
if gysrs.eof and gysrs.bof then
zffan=false
else
dim uyzfft,uyzfot,uyzffk,uyzfxy,uyzfty,uyzfsn
uyzfft=aiint(gysrs(0))'默认状态|等待支付|完成支付
uyzffk=aiint(gysrs(2))'账户金币|账户经验|账户金钱|在线支付|线下交易
uyzfot=gysrs(1)
uyzfxy=aiint(gysrs(3))'买家发起交易|卖家同意交易|卖家取消交易|买家取消交易|卖家无法交易|证方取消交易|官方取消交易|买家确认服务|证方确认服务|官方确认服务|系统确认服务
uyzfty=aiint(gysrs(4))'提现服务|充值服务|官方服务|商家服务|个人交易|竞拍服务|定金交易|购买定制|出售定制|红包服务|订单服务
uyzfsn=gysrs(5)
if aiint(right(gysrs(0),1))<5 and uyzffk>1 then
gysrs(0)=left(gysrs(0),1)&"8"
if ainull(uyzfot) then
uyzfot=zffjy
else
uyzfot=zffjy&"@@"&uyzfot
end if
gysrs(1)=uyzfot
gysrs.update
zffan=true
else
zffan=false
end if
end if
Call saig(gysrs)

if zffzt=10 then response.Write("<script language=""javascript"">top.location='"&i_dir&"?deal/"&uyzfty&"/info/"&uyzfsn&".html';</script>")
'if zffzt=10 then response.Redirect(i_dir&"?deal/"&uyzfty&"/info/"&uyzfsn&".html")
End Function
%>