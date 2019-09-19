<!--#include file="../../AsaiData/cf.asp"--><%
'const i_dir="/"'根目录名:填写网站的根目录文件夹,特别在本地调试的时候,一定要正确填写[注意以/开头并以/结尾].
'const s_drsys="AsaiData/"'核心数据:网站设置与核心数据文件夹.
'const s_drplug="GuoYanSai_AsaiPlug/"'插件夹子:插件保存的文件夹.
dim amcdir,amcfso,amcfile,amctors,amctrr,amct0,amct1,amct2,amct3,amct4,amct5,amct6,amct7,amct8,amcappm,restr
dim amcaptm
'dim amcty:amcty=2
amcdir=i_dir&s_drplug&"AsaiCount/"
amcfile=i_dir&s_drsys&"AsaiCount.txt"
'amcfile="AsaiCount.txt"
amcappm="AsaiCount"
amcaptm=100'单位秒，同IP在该时间内多次访问入库一次（排除恶意刷新）
restr=Request.ServerVariables("QUERY_STRING")
if restr="counter0.js" or restr="counter.js" then
response.Write("document.write("""&asaicounter(0)&""");")
elseif Lcase(restr)="counter1.js" then
response.Write("document.write("""&asaicounter(1)&""");")
elseif Lcase(restr)="counter2.js" then
response.Write("document.write("""&asaicounter(2)&""");")
elseif Lcase(restr)="counter3.js" then
response.Write("document.write("""&asaicounter(3)&""");")
elseif Lcase(restr)="counter4.js" then
response.Write("document.write("""&asaicounter(4)&""");")
elseif Lcase(restr)="counter5.js" then
response.Write("document.write("""&asaicounter(5)&""");")
elseif Lcase(restr)="counter6.js" then
response.Write("document.write("""&asaicounter(6)&""");")
elseif Lcase(restr)="counter7.js" then
response.Write("document.write("""&asaicounter(7)&""");")
elseif Lcase(restr)="counter8.js" then
response.Write("document.write("""&asaicounter(8)&""");")
elseif Lcase(restr)="counter9.js" then
response.Write("document.write("""");")
else
%><!--#include file="../inc.asp"--><%=pdt("网站访问统计插件")%>
<body>
<%if request("ty")<>"" then%>
<script language=JavaScript charset=utf-8 src=./?counter<%=request("ty")%>.js></script>
<%else
if not pqx(3) then
response.Write "对不起，您无权使用本功能！"
else
if not Isnull(request("actj")) and request("asai")="asai" then
dim amcreq:amcreq=replace(request("actj")," ","")
Call apfw(amcreq,amcappm,1)
Call anfw(amcreq,amcfile)
end if%>
<div class=g-lt>网站访问统计在线管理</div>
<div class=g-ll><ul>
<li class=g-ll0><strong>完整统计信息：（统计信息管理）</strong></li>
<li class=g-ll1><%response.Write(asaicounter(4))%></li>
<form action="" method="post">
<li class=g-ll0>总计：<input type="text" name="actj" id="actj" value="<%=amct0%>" style="width:508px;"></li>
<li class=g-ll1>今日：<input type="text" name="actj" id="actj" value="<%=amct1%>" style="width:228px;"> 访问：<input type="text" name="actj" id="actj" value="<%=amct2%>" style="width:228px;"></li>
<li class=g-ll0>昨日：<input type="text" name="actj" id="actj" value="<%=amct3%>" style="width:228px;"> 访问：<input type="text" name="actj" id="actj" value="<%=amct4%>" style="width:228px;"></li>
<li class=g-ll1>最高：<input type="text" name="actj" id="actj" value="<%=amct5%>" style="width:228px;"> 访问：<input type="text" name="actj" id="actj" value="<%=amct6%>" style="width:228px;"></li>
<li class=g-ll0>起始：<input type="text" name="actj" id="actj" value="<%=amct7%>" style="width:228px;"> 天数：<input type="text" name="actj" id="actj" value="<%=amct8%>" style="width:228px;"></li>
<li class=g-ll1><input type="hidden" name="asai" value="asai"><input type="submit" value="提交"><input type="reset" value="重置"></li>
</form>
<%if request("ct")<>"" then%>
<li class=g-ll0>当前统计演示 CT<%=request("ct")%> 统计显示效果</li>
<li class=g-ll1><iframe border="0" name="tj2" src="./?ty=<%=request("ct")%>" allowtransparency="true" style="background-color:transparent" frameborder="0" width="100%" height="36px" scrolling="auto"></iframe></li>
<%end if%>
<li class=g-ll0>CT0 隐藏统计结果显示：（在后台可查看统计结果，不显示在前台。）</li>
<li class=g-ll1>CT0 调用代码：&lt;script language=JavaScript charset=utf-8 src=<%=amcdir%>?counter.js&gt;&lt;/script&gt;</li>
<li class=g-ll0>CT1 精简显示完整统计信息：<a href=./?ct=1>[查看演示]</a></li>
<li class=g-ll1>CT1 调用代码：&lt;script language=JavaScript charset=utf-8 src=<%=amcdir%>?counter1.js&gt;&lt;/script&gt;</li>
<li class=g-ll0>CT2 仅显示访问总次数：<a href=./?ct=2>[查看演示]</a></li>
<li class=g-ll1>CT2 调用代码：&lt;script language=JavaScript charset=utf-8 src=<%=amcdir%>?counter2.js&gt;&lt;/script&gt;</li>
<li class=g-ll0>CT3 仅显示今、昨、总统计数：<a href=./?ct=3>[查看演示]</a></li>
<li class=g-ll1>CT3 调用代码：&lt;script language=JavaScript charset=utf-8 src=<%=amcdir%>?counter3.js&gt;&lt;/script&gt;</li>
<li class=g-ll0>CT4 显示完整统计信息：<a href=./?ct=4>[查看演示]</a></li>
<li class=g-ll1>CT4 调用代码：&lt;script language=JavaScript charset=utf-8 src=<%=amcdir%>?counter4.js&gt;&lt;/script&gt;</li>
<li class=g-ll0>CT5 最高访问和每天平均访问：<a href=./?ct=5>[查看演示]</a></li>
<li class=g-ll1>CT5 调用代码：&lt;script language=JavaScript charset=utf-8 src=<%=amcdir%>?counter5.js&gt;&lt;/script&gt;</li>
<li class=g-ll0>CT6 统计天数与每天平均访问：<a href=./?ct=6>[查看演示]</a></li>
<li class=g-ll1>CT6 调用代码：&lt;script language=JavaScript charset=utf-8 src=<%=amcdir%>?counter6.js&gt;&lt;/script&gt;</li>
<li class=g-ll0>CT7 统计来每日平均访问：<a href=./?ct=7>[查看演示]</a></li>
<li class=g-ll1>CT7 调用代码：&lt;script language=JavaScript charset=utf-8 src=<%=amcdir%>?counter7.js&gt;&lt;/script&gt;</li>
<li class=g-ll0>CT8 运行来总访问：<a href=./?ct=8>[查看演示]</a></li>
<li class=g-ll1>CT8 调用代码：&lt;script language=JavaScript charset=utf-8 src=<%=amcdir%>?counter8.js&gt;&lt;/script&gt;</li>
</ul></div>
<%end if%>
<div class=g-lt>使用须知（请在使用前阅读）：</div>
<div class=g-ll><ul>
<li class=g-ll0>1、网站所在空间必须开启FSO；</li>
<li class=g-ll1>2、请按以上已有数据模版填写与修改，不可为空；</li>
<li class=g-ll0>3、将调用代码复制到网站需要统计访问的地方即可使用；</li>
<li class=g-ll1>4、代码可以随处粘贴使用；</li>
<li class=g-ll0>5、功能使用需要设置好文件夹、文件的可读写属性。</li>
</ul></div>
<%end if%>
<%=pde("")%></body>
</html><%end if
'+++++++++++++++++++++++++++++++++++++++++++THIS IS FUNCTION START
'-----------------------------------
'PS:file read
'-----------------------------------
Function anfr(anrko)
dim anrkols,anfrfsou
anrkols=Server.MapPath(anrko)
Set anfrfsou=CreateObject("A"&"dod"&"b.St"&"r"&"eam")
anfrfsou.Open
anfrfsou.Type=2
anfrfsou.Charset="utf-8"
anfrfsou.LoadFromFile(anrkols)
anfr=anfrfsou.ReadText
anfrfsou.Close
Set anfrfsou=Nothing
End Function
'-----------------------------------
'PS:file write
'-----------------------------------
Function anfw(anfstr,anwko)
if anfstr<>"" then
dim anwkols,anfwtado
anwkols=Server.MapPath(anwko)
set anfwtado=server.CreateObject("A"&"dod"&"b.St"&"r"&"eam")
With anfwtado
.type=2
.mode=3
.charset="utf-8"
.open
.WriteText=anfstr
.SaveToFile anwkols,2
.flush
.Close
End With
set anfwtado=nothing
end if
End Function
'-----------------------------------
'PS:app read
'-----------------------------------
Function apfr(aprko,apfty)
if apfty=1 then
apfr=application(aprko)
elseif apfty=2 then
apfr=session(aprko)
else
apfr=request.Cookies(aprko)
end if
End Function
'-----------------------------------
'PS:app write
'-----------------------------------
Function apfw(apfstr,apwko,apfty)
if apfstr<>"" then
if apfty=1 then
application.lock
application(apwko)=apfstr
application.unlock
elseif apfty=2 then
session(apwko)=apfstr
else
response.Cookies(apwko)=apfstr
end if
end if
End Function
'-----------------------------------
'PS:number format
'-----------------------------------
Function aint(aifstr)
if isnumeric(aifstr) then
aint=int(aifstr)
else
aint=0
end if
End Function
'-----------------------------------
'PS:string format
'-----------------------------------
Function astr(aifstr)
astr=trim(aifstr)
'if len(astr)>100 then astr=""
End Function
'-----------------------------------
'PS:time format
'-----------------------------------
Function atime(aifstr)
aifstr=astr(aifstr)
if isdate(aifstr) then
atime=year(aifstr)&"-"&right("0"&month(aifstr),2)&"-"&right("0"&day(aifstr),2)
else
atime=year(Date())&"-"&right("0"&month(Date()),2)&"-"&right("0"&day(Date()),2)
end if
End Function
'-----------------------------------
'PS:read counter arr
'-----------------------------------
Sub Asaicko(asckos)
if asckos="" then asckos=anfr(amcfile)
amctrr=split(asckos,",")
amct0=aint(amctrr(0))+1
amct7=atime(amctrr(7))
amct8=aint(amctrr(8))
if atime(Date())=atime(amctrr(1)) then
amct1=atime(amctrr(1))
amct2=aint(amctrr(2))+1
amct3=atime(amctrr(3))
amct4=aint(amctrr(4))
amct5=atime(amctrr(5))
amct6=aint(amctrr(6))
elseif atime(Date())<>atime(amctrr(1)) then
amct1=atime(Date())
amct2=1
amct3=atime(amctrr(1))
amct4=aint(amctrr(2))
if amct4>aint(amctrr(6)) then
amct5=atime(amctrr(1))
amct6=aint(amctrr(2))
else
amct5=atime(amctrr(5))
amct6=aint(amctrr(6))
end if
amct8=amct8+1
end if
amctors=amct0&","&amct1&","&amct2&","&amct3&","&amct4&","&amct5&","&amct6&","&amct7&","&amct8
End Sub
'-----------------------------------
'PS:counter out
'-----------------------------------
Function asaicounter(amcty)
Call Asaicko(apfr(amcappm,1))
Call apfw(amctors,amcappm,1)
if not isdate(apfr(amcappm&"tm",0)) then
Call apfw(now(),amcappm&"tm",0)
Call anfw(amctors,amcfile)
else
if DateDiff("s",apfr(amcappm&"tm",0),now())>amcaptm then
Call apfw(now(),amcappm&"tm",0)
Call anfw(amctors,amcfile)
end if
end if
if amcty=0 then
asaicounter=""
elseif amcty=1 then
asaicounter="<font title='今天"&amct1&"访问"&amct2&"人　昨天"&amct3&"访问"&amct4&"人　最高"&amct5&"访问"&amct6&"人　自从"&amct7&"访问"&amct0&"人　统计"&amct8&"天每天约"&int(amct0/amct8)&"人访问'>访问 <b>"&amct0&"</b> 人</font>"
elseif amcty=2 then
asaicounter="访问 <b>"&amct0&"</b> 人"
elseif amcty=3 then
asaicounter="<font title='今天"&amct1&"访问"&amct2&"人　昨天"&amct3&"访问"&amct4&"人　最高"&amct5&"访问"&amct6&"人　自从"&amct7&"访问"&amct0&"人　统计"&amct8&"天每天约"&int(amct0/amct8)&"人访问'>今天访问 <b>"&amct2&"</b> 人　昨天访问 <b>"&amct4&"</b> 人　"&amct8&"天来访 <b>"&amct0&"</b> 人</font>"
elseif amcty=5 then
asaicounter="最高 <b>"&amct5&"</b> 访问 <b>"&amct6&"</b> 人　共统计 <b>"&amct8&"</b> 天每天约 <b>"&int(amct0/amct8)&"</b> 人访问"
elseif amcty=6 then
asaicounter="统计 <b>"&amct8&"</b> 天每天约 <b>"&int(amct0/amct8)&"</b> 人访问"
elseif amcty=7 then
asaicounter="自从 <b>"&amct7&"</b> 统计以来每天约 <b>"&int(amct0/amct8)&"</b> 人访问"
elseif amcty=8 then
asaicounter="自 <b>"&amct7&"</b> 始统计 <b>"&amct8&"</b> 天共访 <b>"&amct0&"</b> 人"
else
asaicounter="今天"&amct1&"访问 <b>"&amct2&"</b> 人　昨天"&amct3&"访问 <b>"&amct4&"</b> 人　最高"&amct5&"访问 <b>"&amct6&"</b> 人　自从"&amct7&"访问 <b>"&amct0&"</b> 人　统计 <b>"&amct8&"</b> 天每天约 <b>"&int(amct0/amct8)&"</b> 人访问"
end if
End Function
'+++++++++++++++++++++++++++++++++++++++++++THIS IS FUNCTION END
%>