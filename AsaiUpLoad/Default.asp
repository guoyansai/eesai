<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="config.asp"--><!--#include file="upsai.asp"--><%On Error Resume Next'display err
'Response.Cookies(p_qs)="2"'把这段赋值上传权限的代码加到您网站管理或会员登录处。
dim esupqx
if Request.Cookies(p_qs)<>"" then
esupqx=int(Request.Cookies(p_qs))
else
esupqx=0
end if
if esupqx>=p_qx then'通过COOKIES从外部判断是否可以使用上传功能
'?功能块012|类型123|文件名01#|保存位置01#|返回值012#|表单formID0#|文本框ID0#|加水印0#|缩略图012|翻页|临时储存文件名.ees
'?0|0|0|0|0|formsai|up|0|0|0|0.ees
'出现404.13错误的话，可尝试的操作:修改IIS的applicationhost.config，文件位置： %windir%/system32/inetsrv/config/applicationhost.config找到<requestFiltering>节点，该节点下默认 <requestLimits maxAllowedContentLength="上传大小的值(单位：byte)" /> 元素。为这个节点添加如下元素：<requestLimits maxAllowedContentLength="2147483647" />(上传的大小将改为2G)
'==========================取回地址栏的值
if ubound(esuarr)=1 then'用来处理AJAX的上传
Function euckfile(eucffile) '检查某一文件是否存在
Dim euckfso
Set euckfso = Server.CreateObject("Scripting.FileSystemObject")
If euckfso.FileExists(eucffile) then
euckfile = True
Else
euckfile = False
End if
Set euckfso = nothing
End Function
dim locty,lochttp,locarr,locarrx,locfileu,locwdir,locfilec,locfile,locfilej,locerr
locty=eupre(esuarr(0))'99判断
lochttp=eupre(esuarr(1))'保存图片的网络位置
if locty="99" then
'if instr(lochttp,"://")>0 and instr(lochttp,"02590.com")=0 and instr(lochttp,"77ya.com")=0 and instr(lochttp,"eesai.com")=0 then
if instr(lochttp,"://")>0 then
locerr=locerr&"<a href="&lochttp&">"&lochttp&"</a>=远程图片地址<br>"
locarr=split(lochttp,"://")
locarrx=split(locarr(1),"/")
locfileu=replace(locarrx(0),".","-")&replace(lochttp,locarr(0)&"://"&locarrx(0)&"","")
'locfileu=replace(lochttp,locarr(0)&"://"&locarrx(0)&"/","")
locerr=locerr&locfileu&"=locfileu原网站图片位置<br>"
esusv=0'0保留原网站的目录结构（对重复图片只储存在同个位置的同一个文件）1获得含信息SN的位置（每张图片都储存在对于的信息SN文件夹中）
locfilec=eupsv(0)
locerr=locerr&locfilec&"=locfilec缓存中的本地保存目录前缀<br>"
esufh=0
locfile=replace(eupfh(locfileu),"//","/")
if left(locfile,1)<>"/" then locfile="/"&locfile
locerr=locerr&locfile&"=locfile本地保存图片相对位置<br>"
locarrx=split(locfile,"/")
locwdir=eupmp(replace(locfile,"/"&locarrx(ubound(locarrx)),"/"))
locerr=locerr&locwdir&"=locwdir本地图片目录绝对位置<br>"
locfilej=eupmp(locfile)
locerr=locerr&locfilej&"=locfilej本地保存图片绝对位置<br>"
if eupmfolder(locwdir) then Call eupurlfile(locfilej,lochttp)
if euckfile(locfilej) then
if p_upwur<>"" then
locfile=p_upwur&mid(locfile,len(p_upijj)+2)
locerr=locerr&locfile&"=locfile本地保存图片相对位置（返回完整地址）<br>"
else
locerr=locerr&locfile&"=locfile返回值<br>"
end if
locerr=locerr&lochttp&"储存到<a href="&locfile&">"&locfilej&"</a>已经完成<br>"
Response.Write "##"&locfile
else
locerr=locerr&"上传失败！<br>"
end if
'response.Write ""&locerr
end if
end if
else%><!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="author" content="阿赛工作室" />
<meta name="description" content="阿赛工作室特别制作文件上传系统，官网支持eesai.com" />
<meta name="keywords" content="阿赛,ASP,Upload,文件上传" />
<style type="text/css">*{margin:0px;border:0px;padding:0px;}form,body,input,select{margin:0px;padding:0px;border:0px;font-size:12px;}body,.ftb{height:<%=p_hei%>px;line-height:<%=p_hei%>px;}.ftb{width:98%;overflow:hidden;}.fin{padding:0px 2px;font-size:12px;width:100px;border:1px solid #5599ff;}.fsl{padding:0px 2px 1px 2px;font-size:12px;margin:1px 1px 1px 1px;border:1px solid #5599ff;}.fst{padding:0px 2px;font-size:12px;background-color:#5599ff;border:1px solid #5599ff;color:#ffffff;}.fimg{margin:0px 0px -5px 0px;width:<%=p_hei%>px;height:<%=p_hei-2%>px;}</style>
<title>阿赛文件上传系统<%=p_ver%></title>
</head>
<body id="body" style="background-color:transparent">
<%
if ubound(esuarr)=10 then
esugn=eupre(esuarr(0))'功能块：0本地上传1远程上传2选择本地图片3普通上传7加用户名8不加水印9加水印
esuty=eupre(esuarr(1))'类型：0默认1图片2影音3下载4全部5特殊...可自行增加定义
esunm=eupre(esuarr(2))'文件名：0随机重命名1按上传文件名命名#（EESai按指定文件名命名）
esusv=eupre(esuarr(3))'保存位置：0上传到默认文件夹1通过读取request.Cookies(p_qs&"qz")确定上传位置#（../up/或/AsaiInc/up/指定相对或绝对地址确定上传位置）
esufh=eupre(esuarr(4))'返回值：0绝对根目录1网络http开头地址2仅返回文件名#（相对指定目录，如=/up/，储存在/up/SAC/mo.jpg位置的图片，返回值为SAC/mo.jpg）
esufm=eupre(esuarr(5))'表单formID：0无表单#（表单ID）
esufi=eupre(esuarr(6))'文本框ID：0无文本框#（文本框ID）
if esugn=8 then
esuss="0"
else
if esugn=7 then
if request.cookies(p_qs&"us")<>"" then esuss="#"&p_pyc&request.cookies(p_qs&"us")
else
esuss=aijie(eupre(esuarr(7)))'加水印：0关闭加水印#（EESai.Com加水印的文字内容）。需要AspJpeg组件支持！！
end if
if esuss="0" or esuss="" then
esuss=request.cookies(p_qs&"py")
if esuss="" or esuss="0" then esuss="0"
end if
if esugn=9 and esuss="0" then esuss="#"&p_pyc&w_motm
end if
esusn=eupre(esuarr(8))'缩略图：0关闭缩图生成1缩图覆盖原图2缩图和原图同文件夹,名称加前缀3缩图存入缩图文件夹。需要AspJpeg组件支持！！
esupg=eupre(esuarr(9))'翻页：0,1仅[功能块]=2有效[7=表示返回大图值 For EESai]
esumm=eupre(esuarr(10))'临时储存文件名：上传本地文件是储存本地文件名称
'response.Write esuss
'==========================上传操作中的一些常规值设置
dim eugpost,eugpostgn,eugpostnm,eugpostpg,eugpostmm,eugm,eugz,eugs,euknm,euknmm,euknmg,euksnmm,euksnmg,eufyn
eugpostgn="?"&p_tjg&p_ujg&esuarr(1)&p_ujg&esuarr(2)&p_ujg&esuarr(3)&p_ujg&esuarr(4)&p_ujg&esuarr(5)&p_ujg&esuarr(6)&p_ujg&esuarr(7)&p_ujg&esuarr(8)&p_ujg&esuarr(9)&p_ujg&eudhz'上传功能转换用
eugpostnm="?"&esuarr(0)&p_ujg&esuarr(1)&p_ujg&p_tjg&p_ujg&esuarr(3)&p_ujg&esuarr(4)&p_ujg&esuarr(5)&p_ujg&esuarr(6)&p_ujg&esuarr(7)&p_ujg&esuarr(8)&p_ujg&esuarr(9)&p_ujg&eudhz'重新上传用
eugpostpg="?"&esuarr(0)&p_ujg&esuarr(1)&p_ujg&esuarr(2)&p_ujg&esuarr(3)&p_ujg&esuarr(4)&p_ujg&esuarr(5)&p_ujg&esuarr(6)&p_ujg&esuarr(7)&p_ujg&esuarr(8)&p_ujg&p_tjg&p_ujg&eudhz'翻页用
eugpostmm="?"&esuarr(0)&p_ujg&esuarr(1)&p_ujg&esuarr(2)&p_ujg&esuarr(3)&p_ujg&esuarr(4)&p_ujg&esuarr(5)&p_ujg&esuarr(6)&p_ujg&esuarr(7)&p_ujg&esuarr(8)&p_ujg&esuarr(9)&p_ujg'本地文件名临时储存用
'FUNCTION
'★获得上传文件名、扩展名、大小并进一步检测
Sub AsaiUpFileSub()
DIM ASPUpload,ASPUPFile
if esugn=1 then'远程上传
eugpost=request("AsaiUpFileFile")
if len(eugpost)<3 then Exit Sub
eugm=Mid(eugpost,InstrRev(eugpost,"/")+1)
eugz=eupgext(eugm)
eugs=eupgsize(eugpost)
if p_err=1 then errs=errs&"上传文件属性：远程文件["&eugpost&"]，文件名="&eugm&"|扩展名="&eugz&"|大小="&eugs&"<br>"
elseif esugn=0 or esugn=7 or esugn=8 or esugn=9 or esugn=3 then'本地上传

if p_zjk=2 then'aspupload
Set ASPUpload=Server.CreateObject("Persits.Upload.1")'新建AspUpload对象
ASPUpload.SetMaxSize eupty(esuty,1),False'限制文件大小不超过2M，否则截断
ASPUpload.OverwriteFiles=True'True表示可以覆盖
ASPUpload.Save()'先上传文件至服务器内存
'检测上传错误
If Err.Number=8 Then
if p_err=1 then errs=errs&"错误: 文件过大!"
Else
If Err <> 0 Then
if p_err=1 then errs=errs&"发生错误："&Err.Description
End If
End If
'指定一个上传的表单文件
Set ASPUPFile=ASPUpload.Files("AsaiUpFileFile")
If Not ASPUPFile Is Nothing Then
eugm=ASPUPFile.Filename'获取原本文件名
eugz=ASPUPFile.Ext'获取文件扩展名
If Err.Number=8 Then ASPUPFile.Delete
If eupgextce(eugz) Then ASPUPFile.Delete
eugs=1
else
eugm=""
eugz=""
eugs=1
end if
else'asai
eugs=Request.TotalBytes
eugpost=esumm
if len(eugpost)<3 then Exit Sub
eugz=eupgext(eugpost)
eugm=Mid(eugpost,InstrRev(eugpost,"\")+1)
if p_err=1 then errs=errs&"上传文件属性：本地文件["&eugpost&"]，文件名="&eugm&"|扩展名="&eugz&"|大小="&eugs&"<br>"
end if

end if


if eugs>0 then
if eupmfolder(eupsv(0)) then
If eugs<eupty(esuty,1) then'检测上传文件大小
if p_err=1 then errs=errs&"文件大小检测："&eugs&"（上传文件大小）<"&eupty(esuty,1)&"<br>"
If eupgextce(eugz) Then'检测上传文件扩展名
if p_err=1 then errs=errs&"文件扩展名检测："&eugz&"（"&eupty(esuty,0)&"）<br>"
eugz=lcase(replace("."&eugz,"..","."))
'☆确定上传文件名（不带后缀名，带后缀，完整位置）
'esunm文件名：0随机重命名1按上传文件名命名#（EESai按指定文件名命名）
if esunm="0" then
euknm=eupsn()
elseif esunm="1" then
euknm=replace(lcase(eugm),eugz,"")
else
euknm=esunm
end if
eugpostnm=replace(eugpostnm,p_ujg&p_tjg&p_ujg,p_ujg&euknm&p_ujg)
euknmm=euknm&eugz
if p_err=1 then errs=errs&"保存文件名："&euknmm&"<br>"
euknmg=eupmp(eupsv(0)&euknmm)
if p_err=1 then errs=errs&"文件储存位置："&euknmg&"<br>"

'☆无组件上传文件核心程序调用
if esugn=1 then'远程上传
Call eupurlfile(euknmg,eugpost)
else'本地上传

if p_zjk=1 then'aspupload
ASPUPFile.SaveAs euknmg
else'asai
Call eupmyfile()
end if

end if

if p_err=1 then errs=errs&"<h1>上传文件已保存至："&euknmg&"</h1>"
'☆需要ASPJEPG组件才能完成的缩图和水印
'缩略图：0关闭缩图生成1缩图覆盖原图2缩图和原图同文件夹,名称加前缀3缩图存入缩图文件夹。需要AspJpeg组件支持！！
if esusn="0" then
euksnmg=""
else
if esusn="1" then
euksnmg=euknmg
elseif esusn="2" then
euksnmg=replace(euknmg,euknmm,eudst&euknmm)
elseif esusn="3" then
if eupmfolder(eupsv(0)&"s/") then
euksnmg=replace(euknmg,euknmm,eudst&"\"&euknmm)
end if
end if
if p_err=1 then errs=errs&"缩图储存位置："&euksnmg&"<br>"
end if
'加水印：0关闭加水印#（EESai.Com加水印的文字内容）。需要AspJpeg组件支持！！
if esuss="0" or esuss="7" then
esuss=""
else
if p_err=1 then errs=errs&"加水印的内容："&esuss&"<br>"
end if
'综合处理缩图和加水印的请求
if esuss<>"" and esuss<>"0" and esuss<>"7" and euksnmg<>"" then
Call eupxsuo(euknmg,euksnmg)
if p_pyk=1 or p_pyk=3 then Call eupxshui(euknmg,esuss)
if p_pyk=2 or p_pyk=3 then Call eupxshui(euksnmg,esuss)
elseif euksnmg<>"" then
Call eupxsuo(euknmg,euksnmg)
elseif esuss<>"" and esuss<>"0" and esuss<>"7" then
if p_pyk=1 or p_pyk=3 then Call eupxshui(euknmg,esuss)
end if
'☆将返回值返回调用的源表单并完成上传操作
'表单formID：0无表单#（表单ID）
'文本框ID：0无文本框#（文本框ID）
if esufm<>"0" and esufi<>"0" then
Response.write"<script language=javascript>parent.document."&esufm&"."&esufi&".value='"&eupfh(euknmm)&"';"
if esufi<>"path" then Response.write"parent.document.getElementById("""&esufi&"img"").src='"&aiufile(1,eupsv(0)&euknmm,eudjj,euddu)&"';"
Response.write"</script>"
if p_err=1 then errs=errs&"返回到表单"&esufm&"的id="&esufi&"的文本框中，值为"&eupfh(euknmm)&"<br>"
elseif esufi<>"0" then
Response.write"<script language=javascript>parent.document.getElementById("""&esufi&""").value='"&eupfh(euknmm)&"';"
if esufi<>"path" then Response.write"parent.document.getElementById("""&esufi&"img"").src='"&aiufile(1,eupsv(0)&euknmm,eudjj,euddu)&"';"
Response.write"</script>"
if p_err=1 then errs=errs&"返回到id="&esufi&"的文本框中，值为"&eupfh(euknmm)&"<br>"
end if
Response.write "<a href="""&aiufile(1,eupsv(0)&euknmm,eudjj,euddu)&""" target=""_blank"" title=""文件名称："&euknmm&vbcrlf&"文件大小："&int(eugs/1024)&"KB"&vbcrlf&"友情提示：点击打开预览"" style=""color:red;text-decoration:none;"">"
Response.write "<img border=""0"" src="""&aiufile(1,eupsv(0)&euknmm,eudjj,euddu)&""" class=""fimg"">"
if len(euknmm)>22 then
Response.write left(euknmm,8)&"**"&eugz
else
Response.write euknmm
end if
Response.write"</a> <input type=""button"" title=""点击重新上传"" onclick=""javascript:window.location.href='"&eugpostnm&"';"" class=""fst"" value=""上传成功"">"
eufyn="1"
'☆关于失败的一些反馈信息
else
Response.write"<span style=""color:red;"" title=""仅限上传"&replace(eupty(esuty,0),",","、")&"格式文件"">格式错误!</span> <input type=""button"" onclick=""javascript:window.location.href='"&eugpostnm&"';"" class=""fst"" value=""重新上传"">"
eufyn="1"
end if
else
Response.Write"<span style=""color:red;"" title=""当前文件大小："&eugs&" B > "&eupty(esuty,1)&" B(大小限制)"">文件过大!</span> <input type=""button"" onclick=""javascript:window.location.href='"&eugpostnm&"';"" class=""fst"" value=""重新上传"">"
eufyn="1"
end if
else
if p_err=1 then errs=errs&"文件夹不存在，且创建文件夹操作失败。<br>"
end if
end if
End Sub
%>
<table class="ftb" title="可上传文件类型：<%=eupty(esuty,0)%>
可上传文件大小：=< <%=eupty(esuty,1)/1024%>KB<%if eupsv(0)<>"" then%>
上传文件保存至：<%=eupsv(0)%><%if len(esunm)>1 then%>
上传文件新名称：<%=esunm%><%end if%><%end if%>" border="0" cellspacing="0" cellpadding="0"><tr><script language="Javascript">function AsaiJumpHref(targ,selObj,restore){eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");if (restore) selObj.selectedIndex=0;}</script><%
if esugn=2 then
%><td><script language="Javascript">
function AsaiInputS(inpname){
<%if esufm<>"0" and esufi<>"0" then%>
parent.document.<%=esufm%>.<%=esufi%>.value='<%=eupfh("1")%>'+inpname+'';
<%if esufi<>"path" then Response.write"parent.document.getElementById("""&esufi&"img"").src='"&eupfh("1")&"'+inpname+'';"%>
<%elseif esufi<>"0" then%>
parent.document.getElementById("<%=esufi%>").value='<%=eupfh("1")%>'+inpname+'';
<%if esufi<>"path" then Response.write"parent.document.getElementById("""&esufi&"img"").src='"&eupfh("1")&"'+inpname+'';"%>
<%end if%>
}
</script>
<%=euplist(eupsv(0))%>
<%if p_upwdu<>"" then%><script language="Javascript">
var AsaiUImgs = document.getElementsByTagName("img");
for(var AsaiUImgsi = 0;AsaiUImgsi<AsaiUImgs.length;AsaiUImgsi++)
{AsaiUImgs[AsaiUImgsi].src=AsaiUImgs[AsaiUImgsi].src.replace(/.*?<%=replace(p_upijj,"/","\/")%>.*?/gi,"<%=p_upwdu%>");}
</script><%end if%>
<%else%><td width="108"><%
Call AsaiUpFileSub()

if eufyn<>"1" then
%><script language="Javascript">
function AsaiCheckFile(){
if(document.AsaiUpFileForm.AsaiUpFileFile.value=="")
{alert("请选择上传文件！")
document.AsaiUpFileForm.AsaiUpFileFile.focus()
return false}
document.AsaiUpFileForm.action="<%=eugpostmm%>"+document.AsaiUpFileForm.un.value+"<%=eudhz%>";
return true}
</script><form method="post" id="AsaiUpFileForm" name="AsaiUpFileForm" onSubmit="return AsaiCheckFile()" action=""<%if esugn=0 or esugn=7 or esugn=8 or esugn=9 or esugn=3 then%> enctype="multipart/form-data"<%end if%>><%
if esugn=1 then
%><input class="fin" type="text" id="AsaiUpFileFile" name="AsaiUpFileFile" onpropertyChange="document.AsaiUpFileForm.un.value=this.value" onChange="document.AsaiUpFileForm.un.value=this.value" value=""><input type="hidden" id="un" name="un" value=""><%
elseif esugn=0 or esugn=7 or esugn=8 or esugn=9 then
%><style>.asaiupm{font-size:12px;text-align:center;width:100px;padding:0px 3px;margin:0px 0px -5px 0px;height:18px;line-height:18px;position:relative;cursor:pointer;background-color:#5599ff;border:1px solid #5599ff;color:#ffffff;overflow:hidden;display:inline-block;*display:inline;*zoom:1;text-decoration:none;}.asaiupm input{overflow:hidden;position:absolute;font-size:100px;right:0;top:0;opacity:0;filter:alpha(opacity=0);cursor:pointer;}.asaiupm:hover{background-color:#ffffff;color:#5599ff;text-decoration:none;}</style>
<script>function asaiupm(showid,filefz){document.AsaiUpFileForm.un.value=filefz;if(filefz==''){document.getElementById(showid).innerHTML='点击选择上传文件';}else{document.getElementById(showid).innerHTML=filefz;AsaiCheckFile();document.getElementById('AsaiUpFileForm').submit();};}</script>
<a href="javascript:;" class="asaiupm"><input type="file" id="AsaiUpFileFile" name="AsaiUpFileFile" onChange="asaiupm('asaiups',this.value);"><div id="asaiups">点击选择上传文件</div></a><input type="hidden" id="un" name="un" value=""><%
elseif esugn=3 then
%><input class="fin" type="file" id="AsaiUpFileFile" name="AsaiUpFileFile" onpropertyChange="document.AsaiUpFileForm.un.value=this.value" onChange="document.AsaiUpFileForm.un.value=this.value"><input type="hidden" id="un" name="un" value=""><%
end if
%></td>
<%if esugn=0 or esugn=7 or esugn=8 or esugn=9 then%>
<td><select class="fsl" language="javascript" onChange="AsaiJumpHref('self',this,0)" name="aty" id="aty">
<option <%if esugn=0 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?0"&p_ujg)%>">本地上传</option>
<option <%if esugn=8 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?8"&p_ujg)%>">不加水印</option>
<option <%if esugn=9 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?9"&p_ujg)%>">加上水印</option>
<option <%if esugn=7 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?7"&p_ujg)%>">加用户名</option>
<option <%if esugn=1 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?1"&p_ujg)%>">远程上传</option>
<option <%if esugn=2 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?2"&p_ujg)%>">已传文件</option>
<option <%if esugn=3 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?3"&p_ujg)%>">普通上传</option>
</select>
<%else%>
<td width="58"><select class="fsl" language="javascript" onChange="AsaiJumpHref('self',this,0)" name="aty" id="aty">
<option <%if esugn=0 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?0"&p_ujg)%>">本地</option>
<option <%if esugn=1 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?1"&p_ujg)%>">远程</option>
<option <%if esugn=2 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?2"&p_ujg)%>">已传</option>
<option <%if esugn=3 then%>selected="selected" <%end if%>value="<%=replace(eugpostgn,"?"&p_tjg&p_ujg,"?3"&p_ujg)%>">普通</option>
</select></td><td><input class="fst" type="submit" value="上传"><%end if%>

</form><%
end if

if p_err=1 then Response.Write errs
end if%>
</td></tr></table>
<%
else
Response.Write "<script language=javascript>alert('上传配置出错或操作有误！');</script>"
Response.End()
end if
%>
</body>
</html><%end if
else
'Response.Write "<script language=javascript>alert('对不起,您无权上传文件，请直接输入文件完整地址。');</scri"&"pt>"
response.Write("<span style=""color:#999;font-size:12px;"" title=""用户注册登录并完成认证后可自由上传文件或图片"">请输入网络文件或图片的地址</span>")
end if
%>