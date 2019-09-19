<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"--><%call esq()
dim pu_xir,pu_xim,pu_ximm
pu_xir=ew_sk
pu_xim="sys.css"
dim pu_rri,pu_rrm,puri
pu_rri=split("css/sys_s1|css/sys_q1|css/sys_q2|css/sys_q3|css/sys_h1","|")'自建风格存储在风格修改文件夹中，将CSS文件名字加|按规则添加在这里
pu_rrm=split("线框深黑图|线框浅彩|浅彩|浅黑图|黑夜","|")'自建风格存储在风格修改文件夹中，将CSS风格名加|按规则添加在这里
Dim AFF,AF1,AF2,AF3,AF4,AFAll,klrr
Dim asaiyansezu,asaiysarr,asaiyansezux,asaiysarrx,asaiysii,asaiski,asaiskri,asaiskarr,asaiskaii,asiskok
Dim askfile_,askfile,askfilec,askfilet,asktxts
asktxts="AsaiSkin.txt"
askfile_=server.mappath("../../"&pu_xir&replace(pu_xim,".css","_.css")&"")
askfile=server.mappath("../../"&pu_xir&pu_xim&"")
askfilet=server.mappath("AsaiSkin.txt")
'FSO RD 0
Function SKfrd(sffile)
dim FsoRD
Set FsoRD=CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With FsoRD
.Open
.Type=2
.Charset="utf-8"
.LoadFromFile(Server.MapPath(sffile))
SKfrd=FsoRD.ReadText
.Close
End With
Set FsoRD=Nothing
END Function
'FSO RD 1
'FSO WR 0
Function SKfwr(sffile,sffstr)
dim FsoWR
set FsoWR=Server.CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With FsoWR
.type=2
.mode=3
.charset="utf-8"
.open
.WriteText=sffstr
.SaveToFile Server.MapPath(sffile),2
.flush
.Close
End With
Set FsoWR=nothing
END Function
'FSO WR 1
'读取系统推荐颜色表
Function SKysl()
Dim AFFL,AFL,AFLR,sli
Set AFFL=CreateObject("Scripting.FileSystemObject")
Set AFL=AFFL.OpenTextFile(askfilet,1)
For sli=1 to 5
AFL.ReadLine
Next
AFLR=AFL.ReadAll
AFL.Close
SKysl=split(AFLR,CHR(10))
Set AFFL=Nothing
END Function
'读取当前样式颜色值
Function SKysx(skfstr)
dim AFFX,AFX,sxi
Set AFFX=CreateObject("Scripting.FileSystemObject")
Set AFX=AFFX.OpenTextFile(skfstr,1)
For sxi=1 to 2
AFX.ReadLine
Next
SKysx=AFX.ReadLine
AFX.Close
Set AFFX=Nothing
End Function
'函数名：SKrep
'作 用：内容替换
'参 数：{需要替换的原字符,设置模式(可理解为将要被替换掉的字符),指定要替换后的字符,设置是否忽略大小写(1为忽略,0为大小写匹配)}
Function SKrep(NowStr,patrn,repStr)
Dim askiregex,LUCase'建立变量。
LUCase=0
Set askiregex=New RegExp'建立正则表达式
askiregex.Pattern=patrn'设置模式
if LUCase=1 then
askiregex.IgnoreCase=True'设置是否区分大小写
else
askiregex.IgnoreCase=False'设置是否区分大小写
end if
askiregex.Global=True'指定是否进行全局替换，默认为False，即只替换第一个
SKrep=askiregex.Replace(NowStr,repStr)'作替换
Set askiregex=Nothing
End Function
'作 用：制作系统css
Function SKmad(skfstr)
dim diyycss,diyyci,diyyst,diyysy,diycss,diytrr,diyyrr,diytii
diyyst=SKysx(server.mappath("../../"&skfstr&pu_xim&""))
diyycss=SKfrd("../../"&i_msk&"asaisyscss.css")
diyysy=split(diyycss,vbcrlf)(2)
diyyrr=split(diyysy,"|")
diytrr=split(diyyst,"|")
for diytii=0 to ubound(diytrr)
diyycss=SKrep(diyycss,diyyrr(diytii),diytrr(diytii))
next
diycss=diyycss
diyycss=SKfwr("../../"&skfstr&"asaisyscss_.css",diycss)
application.lock
application(replace(skfstr,"/",""))="1"
application.unlock
End Function
'这里是用户自行配置色彩的程序------------------------------0
'response.Cookies(w_sn&ew_sn&"skin")="706D73|868388|F4F4F4|FCFCFC|705139|866B57|F7F5F4|FCFCFB|639A7B|7BA98F|F6F9F8|FCFDFD|123123|565656|FF0002|fffffe"
'response.Write request.Cookies(w_sn&ew_sn&"skin")
if lcase(Request.ServerVariables("QUERY_STRING"))="cssees" then

if len(request.Cookies(w_sn&ew_sn&"skin")&"1")=112 then
if application(replace(pu_xir,"/",""))<>"1" then
Call SKmad(pu_xir)
end if

dim usytrr,uscss,uscssm,asaiysiicss,asaiskicss,asaiyansezucss,asaiysarrcss
usytrr=split(request.Cookies(w_sn&ew_sn&"skin"),"|")
uscss=SKfrd("../../"&pu_xir&pu_xim&"")
uscssm=SKfrd("../../"&pu_xir&"asaisyscss_.css")
asaiyansezucss=split(uscss,vbcrlf)(2)
asaiysarrcss=split(asaiyansezucss,"|")'Read原始配色
for asaiysiicss=0 to ubound(usytrr)
uscss=SKrep(uscss,asaiysarrcss(asaiysiicss),usytrr(asaiysiicss))
uscssm=SKrep(uscssm,asaiysarrcss(asaiysiicss),usytrr(asaiysiicss))
next

response.Write "document.write('<style>"&SKrep(SKrep(SKrep(SKrep(uscssm&uscss,"'",""""),vbcrlf,""),"img/","../../"&pu_xir&"img/"),"sys/","../../"&pu_xir&"sys/")&"</style>');"
end if

elseif lcase(Request.ServerVariables("QUERY_STRING"))="css-ees" then
Call SKmad(pu_xir)
response.Write "document.write('<link rel=""stylesheet"" type=""text/css"" rev=""stylesheet"" href="""&i_dir&pu_xir&"asaisyscss_.css"">');"
else%><!--#include file="../inc.asp"--><%=pdt("阿赛网站通用配色在线管理插件")%>
<body>
<%if left(lcase(Request.ServerVariables("QUERY_STRING")),7)="cssees-" then
response.Cookies(w_sn&ew_sn&"skin")=replace(lcase(Request.ServerVariables("QUERY_STRING")),"cssees-","")
response.Write "<script language=javascript>if(confirm(""成功替换配色，请刷新网页欣赏您选择的配色。"")){window.location.href=""../../""}else{window.history.back(-1);}</script>"
elseif lcase(Request.ServerVariables("QUERY_STRING"))="csseesai" then
if request("cssy")=1 then
response.Cookies(w_sn&ew_sn&"skin")=""
response.Write "<script language=javascript>if(confirm(""成功返回原配色。"")){window.location.href=""../../""}else{window.history.back(-1);}</script>"
elseif request("css0")<>"" and request("css1")<>"" then
response.Cookies(w_sn&ew_sn&"skin")=request("css0")&"|"&request("css1")&"|"&request("css2")&"|"&request("css3")&"|"&request("css4")&"|"&request("css5")&"|"&request("css6")&"|"&request("css7")&"|"&request("css8")&"|"&request("css9")&"|"&request("css10")&"|"&request("css11")&"|"&request("css12")&"|"&request("css13")&"|"&request("css14")&"|"&request("css15")
response.Write "<script language=javascript>if(confirm(""成功替换配色，请刷新网页欣赏您的新配色。"")){window.location.href=""../../""}else{window.history.back(-1);}</script>"
end if
%>
<div class=g-lt>阿赛网站通用配色——用户自定义</div>
<div class=g-ll><ul><form name="csseesai" action="" method="post">
<%
dim usyfsoy,usycssd,uscssy,usckyi,usyti,usyys,usyysrr,usyli,usckysrr
usyys=SKysx(server.mappath("../../"&pu_xir&pu_xim&""))
usyysrr=split(usyys,"|")'Read原始配色
if len(request.Cookies(w_sn&ew_sn&"skin"))=111 then
usckysrr=split(request.Cookies(w_sn&ew_sn&"skin"),"|")
else
usckysrr=usyysrr
end if
for usckyi=0 to ubound(usyysrr)
if usckyi mod 2=0 then
usyli="0"
else
usyli="1"
end if
%>
<script type="text/javascript" src="jscolor/jscolor.js"></script>
<li class=g-ll<%=usyli%>>原色：<input type="text" name="csstest" value="<%=usyysrr(usckyi)%>" style="border:0px;width:80px;" class="color"> 替换色：<input type="text" name="css<%=usckyi%>" value="<%=usckysrr(usckyi)%>" style="width:234px;" class="color">*单击左侧文本框选择替换颜色</li>
<%next%>
<li class=g-ll0>提示：请您依照原色深度与规则，选择相应的替换色。</li>
<li class=g-ll1>
<input type="checkbox" value="1" name="cssy">使用原配色 <input type="submit" value="确认提交我的配色" />
</li>
</form>
</ul></div>
<div class=g-lt>阿赛网站通用配色——系统推荐配色选择</div>
<div class=g-ll><ul>
<li class=g-ll0><table width="100%" border="0" cellspacing="1" cellpadding="5" style="background-color:#000000;">
<tr bgcolor="#FFFFFF" align="center">
<td colspan="4">网站主色块</td><td colspan="4">网站辅色一</td><td colspan="4">网站辅色二</td><td>字色</td><td>界色</td><td>醒色</td><td>影色
</td><td>应用操作</td>
</tr>
<%
dim usli,uslrr,uslij
klrr=SKysl()
for usli=0 to ubound(klrr)
if klrr(usli)<>"" then%><tr align="center">
<%uslrr=split(klrr(usli),"|")
for uslij=0 to ubound(uslrr)%><td style="background-color:#<%=uslrr(uslij)%>;"><%=uslrr(uslij)%></td><%next%>
<td style="background-color:#FFFFFF;"><a href="./?cssees-<%=klrr(usli)%>">应用此配色</a></td>
</tr><%end if
next%>
</table>
</li>
</ul></div>
<%elseif not pqx(2) then
response.Write "对不起，您无权使用本功能！"
else
'第一步：定义FSO组件，取得当前配色颜色值组
klrr=SKysl()
Set AFF=CreateObject("Scripting.FileSystemObject")
if request("skins")<>"" then
asaiyansezu=trim(request("skins"))
else
asaiyansezu=SKysx(askfile)
end if
asaiysarr=split(asaiyansezu,"|")
if request("ty")="act" then
if request("skins1")<>"" then
asaiyansezux=trim(request("skins1"))
asaiysarrx=split(asaiyansezux,"|")
asiskok=1
end if
if request("act")="添加配色" and trim(request("skins1"))<>"" then
Call anfile(3,g_char,0,trim(request("skins1")),server.mappath(asktxts))
response.Write "<script language=javascript>alert('添加配色成功!');history.go(-1);</script>"
elseif request("act")="预览配色" and trim(request("skins1"))<>"" then
asaiyansezux=trim(request("skins1"))
asaiysarrx=split(asaiyansezux,"|")
asiskok=1
elseif request("asai")="sysback" then'★原始系统配色与样式还原
'第二步：读取当前CSS配色源码
Set AF4=AFF.OpenTextFile(askfile,1)'1读取
AFAll=AF4.ReadAll'ReadAll读取所有内容
'第三步：备份一份当前CSS配色源码
Set AF2=AFF.OpenTextFile(askfile_,2, True)'2写入
AF2.Write AFAll'Write写入
AF2.Close
'第四步：读取系统备份的CSS配色源码
askfilec=server.mappath("../../"&i_msk&request("css")&".css")
Set AF1=AFF.OpenTextFile(askfilec,1)'1读取
AFAll=AF1.ReadAll'ReadAll读取所有内容
'第五步：覆盖存入新的源码
Set AF3=AFF.CreateTextFile(askfile,True)'覆盖写入
AF3.Write AFAll'Write写入
AF3.Close
response.Write "<script language=javascript>alert('成功使用原始系统配色与样式["&request("css")&"]还原成功!');history.go(-1);</script>"
elseif request("asai")="reback" then'★以下还原备份配色
'第二步：读取系统备份的CSS配色源码
Set AF1=AFF.OpenTextFile(askfile_,1)'1读取
AFAll=AF1.ReadAll'ReadAll读取所有内容
'第三步：覆盖存入新的源码
Set AF3=AFF.CreateTextFile(askfile,True)'覆盖写入
AF3.Write AFAll'Write写入
AF3.Close
response.Write "<script language=javascript>alert('配色还原成功!');history.go(-1);</script>"
elseif asiskok=1 then'★以下更换配色的处理过程
'第二步：读取系统CSS配色源码
Set AF1=AFF.OpenTextFile(askfile,1)'1读取
AFAll=AF1.ReadAll'ReadAll读取所有内容
'第三步：备份一份CSS配色源码
Set AF2=AFF.OpenTextFile(askfile_,2, True)'2写入
AF2.Write AFAll'Write写入
AF2.Close
'第四步：开始替换源码配色颜色值
for asaiysii=0 to ubound(asaiysarrx)
AFAll=SKrep(AFAll,asaiysarr(asaiysii),asaiysarrx(asaiysii))
next
'第五步：覆盖存入新的源码
'Set AF3=AFF.OpenTextFile(askfile,8, True)'2添加写入
Set AF3=AFF.CreateTextFile(askfile,True)'覆盖写入
AF3.Write AFAll'Write写入
AF3.Close
Call SKmad(pu_xir)
response.Write "<script language=javascript>alert('配色替换成功!');history.go(-1);</script>"
else
response.Write "<script language=javascript>alert('对不起，没有收到任何操作！请仔细阅读使用说明。');history.go(-1);</script>"
end if
end if
Set AFF=Nothing
%>
<div class=g-lt>网站通用配色在线管理</div>
<div class=g-ll><ul>
<form name="asaiskin" action="./?ty=act" method="post">
<li class=g-ll1>自定义配色组：（请仿照“当前网站配色”模式输入颜色值，每个颜色值之间使用“|”隔开。）</li>
<li class=g-ll0><input type="text" name="skins1" id="skins1" style="width:100%;" size="56" value="<%=asaiyansezux%>" /></li>
<%if request("act")="预览配色" then%>
<li class=g-ll0>
<table width="100%" border="0" cellspacing="1" cellpadding="5" style="background-color:#000000;"><tr bgcolor="#FFFFFF" align="center">
<td colspan="4">网站主色块</td><td colspan="4">网站辅色一</td><td colspan="4">网站辅色二</td><td>字色</td><td>界色</td><td>醒色</td><td>影色
</td><td>说明</td>
</tr>
<tr align="center">
<%for asaiysii=0 to ubound(asaiysarrx)%><td style="background-color:#<%=asaiysarrx(asaiysii)%>;"><%=asaiysarrx(asaiysii)%></td><%next%>
<td style="background-color:#FFFFFF;">自定义配色</td>
</tr></table></li>
<%end if%>
<li class=g-ll1>当前网站配色：<%=askfile%></li>
<li class=g-ll0><input type="text" name="skins" id="skins" style="width:100%;" value="<%=asaiyansezu%>" /></li>
<li class=g-ll1>网站配色预览：</li>
<li class=g-ll0><table width="100%" border="0" cellspacing="1" cellpadding="5" style="background-color:#000000;"><tr bgcolor="#FFFFFF" align="center">
<td colspan="4">网站主色块</td><td colspan="4">网站辅色一</td><td colspan="4">网站辅色二</td><td>字色</td><td>界色</td><td>醒色</td><td>影色
</td><td>说明</td>
</tr><tr align="center">
<%for asaiysii=0 to ubound(asaiysarr)%><td style="background-color:#<%=asaiysarr(asaiysii)%>;"><%=asaiysarr(asaiysii)%></td><%next%>
<td style="background-color:#FFFFFF;">当前的配色</td>
</tr></table></li>
<li class=g-ll0>
<input type="button" onClick="window.location='?ty=act&asai=reback'" title="还原到上一次的配色" value="还原配色" />&nbsp;&nbsp;
<input type="submit" name="act" title="向颜色组添加风格配色" value="添加配色" />&nbsp;&nbsp;
<input type="submit" name="act" title="对比看一下配色颜色条" value="预览配色" />&nbsp;&nbsp;
<input type="submit" title="替换前台CSS的配色" value="替换配色" />
</li></form>
<li class=g-ll1>当前供选配色：（配色文件存储在<%=server.mappath(asktxts)%>，可在写字板中打开按文件内规则修改。）</li>
<li class=g-ll0><table width="100%" border="0" cellspacing="1" cellpadding="5" style="background-color:#000000;">
<tr bgcolor="#FFFFFF" align="center">
<td colspan="4">网站主色块</td><td colspan="4">网站辅色一</td><td colspan="4">网站辅色二</td><td>字色</td><td>界色</td><td>醒色</td><td>影色
</td><td>应用操作</td>
</tr>
<%for asaiskri=0 to ubound(klrr)
if klrr(asaiskri)<>"" then%><tr align="center">
<%asaiskarr=split(klrr(asaiskri),"|")
for asaiskaii=0 to ubound(asaiskarr)%><td style="background-color:#<%=asaiskarr(asaiskaii)%>;"><%=asaiskarr(asaiskaii)%></td><%next%>
<td style="background-color:#FFFFFF;"><a href="./?ty=act&skins1=<%=klrr(asaiskri)%>">应用此配色</a></td>
</tr><%end if
next%>
</table></li>
<li class=g-ll1>点击“应用此配色”即可替换网站正在使用的风格。</li>
</ul></div>
<!---
<div class=g-lt>网站系统风格切换管理</div>
<div class=g-ll><ul>
<li class=g-ll0>更改网站风格样式：（此修改会还原配色，请注意保存您的自定义配色。默认系统配色按风格ID名称保存在文件夹：<%=server.mappath("../../"&i_msk&"")%>中，如遇无法使用此功能，也可直接抵达，手工替换。）</li>
<li class=g-ll1>
<%for puri=0 to ubound(pu_rri)%>
<input type="button" onClick="{if(confirm('确定回归系统原始样式[<%=pu_rrm(puri)%>=<%=pu_rri(puri)%>]CSS及配色吗？（会覆盖您修改过的CSS，使用官方配色及颜色样式。）\nYes,Go; No,Back.')){javascript:window.location.href='?ty=act&asai=sysback&css=<%=pu_rri(puri)%>';return true;}return false;}" title="确定回归系统原始样式[<%=pu_rrm(puri)%>=<%=pu_rri(puri)%>]CSS及配色吗？（会覆盖您修改过的CSS，使用官方配色及颜色样式。）" value="<%=pu_rrm(puri)%>" />&nbsp;&nbsp;
<%next%>
</li>
</ul></div>
--->
<div class=g-lt>系统风格覆盖<a name=sks></a></div>
<div class=g-ll><form name="asaiskin" action="./?ty=sks#sks" method="post"><ul>
<%if request("sks")<>"" then%>
<li class=g-ll0><%
dim sksdrr,sksdi
sksdrr=split(request("sks"),"|")
for sksdi=0 to ubound(sksdrr)
Call SKmad(sksdrr(sksdi))
response.Write sksdi+1&"、"&sksdrr(sksdi)&" 已经生成新的样式表！<br>"
next
%></li>
<%end if%>
<li class=g-ll0>请输入覆盖范围：<input type="text" name="sks" id="sks" style="width:50%;" value="<%=request("sks")%>" /> 多个网站请使用|隔开，如:skin_xnj/|skin_xnj4/|skin_xnj5/|skin_xnj6/|skin_xnj7/|skin_xnj8/|skin_uccnn/|skin_asai/</li>
<li class=g-ll1><input type="submit" value="确认覆盖" /></li>
</ul></form></div>
<div class=g-lt>使用须知（请在使用前阅读）：</div>
<div class=g-ll><ul>
<li class=g-ll0>1、此功能需要空间支持FSO；</li>
<li class=g-ll1>2、网站风格（CSS文件）所在文件夹必须设置属性为可读写；</li>
<li class=g-ll0>3、必须正确设置网站的网站所在的文件夹(网站根目录)；</li>
<li class=g-ll1>4、请不要在网站访问高峰期使用该功能；</li>
<li class=g-ll0>5、请注意操作前一定要备份，以防发生未知错误；</li>
<li class=g-ll1>6、如果您设计新的网站模版或风格，此功能不可用。</li>
</ul></div>
<%end if%>
<%=pde("")%></body>
</html><%end if%>