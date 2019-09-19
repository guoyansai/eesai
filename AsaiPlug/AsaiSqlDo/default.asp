<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"--><%call esq()%><!--#include file="../inc.asp"--><%=pdt("Asai系统高级执行SQL操作")%>
<body>
<%
dim pic_dirnew
pic_dirnew="E:\file.asai.wang\"'转存图片的新文件夹位置如：E:\Asai\
if not pqx(5) then
Response.Write "对不起，您无权使用本功能！"
else
dim pg,pa,ps,pi
pg=request("page")
if pg="" then
%>
<%if aibj(request("ty"),"yuju") then%>
<div class=g-lt>Asai系统高级执行——报告：</div>
<div class=g-ll><ul>
<li class=g-ll0>
<%
dim ystr
ystr=trim(request("ystr"))
if len(ystr)>10 then
if request("yty")="1" then
Execute(ystr)
Response.Write("执行ASP操作完成")
else
conn.execute(ystr)
Response.Write("执行SQL操作完成")
end if
else
Response.Write("执行操作失败")
end if%>
</li>
</ul></div>
<%end if%>
<div class=g-lt>Asai系统高级执行：</div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll0>语句：<textarea name="ystr" id="ystr" style="width:80%;height:120px;"><%=ystr%></textarea></li>
<li class=g-ll1>类型：<select name="yty"><option value="0"<%if request("yty")="0" then%> selected<%end if%>>执行SQL语句</option><option value="1"<%if request("yty")="1" then%> selected<%end if%>>执行asp语句</option></select></li>
<li class=g-ll0><%=aiinput("hidden","ty","",0,0,"","","yuju")%><input type="submit" name="act" value="点击执行" /></li>
</form>
</ul></div>

<%if aibj(request("ty"),"piliang") then%>
<div class=g-lt>Asai系统数据批量添加——报告：</div>
<div class=g-ll><ul>
<li class=g-ll0>
<%
function plins(plfstr)
if left(plfstr,1)="""" and right(plfstr,1)="""" then
dim pldlen
pldlen=len(plfstr)-1
plfstr=left(right(plfstr,pldlen),pldlen-1)
end if
plins=replace(plfstr,"""""","""")
end function
dim pstr,plie,pmo,psrr,psud,psii,psry,plierr,plieud,pmorr,pmory,pmoud,pliei,pmoi
pstr=trim(request("pstr"))
plie=trim(request("plie"))
pmo=trim(request("pmo"))
if len(pstr)>10 and len(plie)>4 then
plierr=split(plie,"|")
plieud=ubound(plierr)
pmorr=split(pmo,"|")
pmoud=ubound(pmorr)
psrr=split(pstr,vbcrlf)
psud=ubound(psrr)

Call saik(gysrs,"select * from ees_ai",1,3)
for psii=0 to psud
gysrs.addnew
psry=split(psrr(psii),"	")
for pliei=0 to plieud
gysrs(plierr(pliei))=plins(psry(pliei))
next
for pmoi=0 to pmoud
pmory=split(pmorr(pmoi),"=")
gysrs(pmory(0))=pmory(1)
next
gysrs.update
response.Write "《"&psry(0)&"》添加成功<br>"
next
Call saig(gysrs)

Response.Write("批量操作完成。")
else
Response.Write("批量操作失败！")
end if%>
</li>
</ul></div>
<%end if%>
<div class=g-lt>Asai系统数据批量添加：</div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll0>数据：<textarea name="pstr" id="pstr" style="width:80%;height:120px;"><%=pstr%></textarea></li>
<li class=g-ll1>列名：<%=aiinput(0,"plie","500px;",0,0,"导入列名，多个列使用|隔开","",plie)%> 快捷选择：<select name="pty" onChange="plie.value=this.value"><option value="">手工输入</option><option value="ai_bt|ai_up|ai_tm|ai_nr">文章模式</option><option value="ai_bt|ai_up|ai_jg|ai_jy|ai_nr">产品模式</option></select>导入列名，多个列使用|隔开，如：ai_bt|ai_sn|ai_nr|ai_tm</li>
<li class=g-ll0>默认：<%=aiinput(0,"pmo","500px;",0,0,"默认值设置","",pmo)%> 默认值设置，使用等号分隔，多个默认值设置使用|隔开，如：ai_xy=1|ai_ew=2|ai_ep=news|ai_ef=xwywrb</li>
<li class=g-ll0><%=aiinput("hidden","ty","",0,0,"","","piliang")%><input type="submit" name="act" value="点击执行" /></li>
</form>
</ul></div>

<%if aibj(request("ty"),"actgmy")  and len(request("myx")&"0")>20 then%>
<div class=g-lt>Asai系统密码加密用的密钥替换——报告：</div>
<div class=g-ll><ul>
<li class=g-ll0>
<%
dim dbdmms,dbdmml
dbdmms=request("myx")
Function dbgmy(dbfnm,dbfty)
dbgmy=""
Call saik(gysrs,"select "&dbfnm&"_mm from ees_"&dbfnm&" where "&dbfnm&"_mm<>''",3,3)
if gysrs.eof and gysrs.bof then
dbgmy=""&dbfnm&"表中没有需要替换的密钥！"
else
Do While Not gysrs.eof
dbdmml=aimm(g_gmm,gysrs(dbfnm&"_mm"),1)
dbgmy=dbgmy&"解密："&dbdmml
dbdmml=aimm(dbdmms,dbdmml,0)
dbgmy=dbgmy&"<br>加密："&dbdmml&"<br><br>"
gysrs(dbfnm&"_mm")=dbdmml
gysrs.update
gysrs.movenext
loop
dbgmy=dbgmy&"已经成功替换"&dbfnm&"表中密钥！"
end if
Call saig(gysrs)
End Function
Response.Write dbgmy("ai",0)&"<br>"
Response.Write dbgmy("bb",0)&"<br>"
Response.Write dbgmy("ey",0)&"<br>"
Response.Write dbgmy("ee",0)&"<br>"
Response.Write dbgmy("us",0)&"<br>"
%>
</li>
</ul></div>
<%end if%>
<div class=g-lt>Asai系统密码加密用的密钥替换：</div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll1>当前密钥：<%=aiinput(0,"myy","500px;",0,0,"当前密钥","",g_gmm)%></li>
<li class=g-ll0>新设密钥：<%=aiinput(0,"myx","500px;",0,0,"替换的密钥","",dbdmms)%></li>
<li class=g-ll0><%=aiinput("hidden","ty","",0,0,"","","actgmy")%><input type="submit" name="act" value="点击执行" /></li>
</form>
</ul></div>
<%else
dim pcdci,pcdtx,pcdook,pcdshui,pcdshow,pcdid
pcdshow=""
pcdci=0
pcdshui=""'水印文字
pcdid=0
'get old name
function pcdtp(pcfuy,pcfty,pcfstr)
if (pcfty=1 or pcfty=2) and (instr(pcfstr,p_upijj)>0 or instr(pcfstr,p_upwdu)>0) then
  if instr(pcfstr,p_upijj)>0 then
  pcdtp=split(pcfstr,p_upijj)(1)
  else
  pcdtp=split(pcfstr,p_upwdu)(1)
  end if
  if pcfuy=2 then
  if p_upwdr<>"" then
  pcdtp=p_upwdr&(replace(p_upijj&pcdtp,"/","\"))
  else
  pcdtp=Server.MapPath(i_dir&p_upijj&pcdtp)
  end if
  elseif pcfuy=1 then
  if p_upwdu<>"" then
  pcdtp=p_upwdu&pcdtp
  else
  pcdtp="http://"&Request.ServerVariables("HTTP_HOST")&i_dir&p_upijj&pcdtp
  end if
  end if
elseif (pcfty=0 or pcfty=2) and aibj(left(pcfstr,7),"http://") then
  pcdtp=split(right(pcfstr,len(pcfstr)-7),"/")(0)
  pcdtp=right(pcfstr,len(pcfstr)-8-len(pcdtp))
  if pcfuy=1 then pcdtp=pcfstr
elseif pcfty=2 then
  if left(pcfstr,1)="/" then
  pcdtp=right(pcfstr,len(pcfstr)-1)
  else
  pcdtp=pcfstr
  end if
  if pcfuy=1 then
  pcdtp="http://"&Request.ServerVariables("HTTP_HOST")&i_dir&pcfstr
  end if
end if
end function
'save pic to new place
function pcdsv(pcfty,pcfstr,pcfold,pcfti,pcfnew)
dim pcfoldlin,pcfoldwei
pcfoldlin=pcdtp(1,pcfty,pcfold)
pcdshow=pcdshow&"<br>原图："&pcfold&""
if pcfty="1" then
'pcfoldwei=pcdtp(2,pcfty,pcfold)
'pcdshow=pcdshow&"<br>原位："&pcfoldwei&""
else
pcdshow=pcdshow&"<br>原链："&pcfoldlin&""
pcdshow=pcdshow&"<br>替链："&pcfti&""
end if
pcdshow=pcdshow&"<br>新图："&pcfnew&"<br>"
if pcfty="1" then
'Call anfilesave(pcdshui,pcfnew,pcfoldlin)
Call anurlsave(pcdshui,pcfnew,pcfoldlin)
pcdci=pcdci+1
else
if anurlsave(pcdshui,pcfnew,pcfoldlin) then
pcdsv=replace(pcfstr,pcfold,pcfti)
pcdtx=1
pcdci=pcdci+1
else
pcfti=p_upijj&"k.gif"
pcdsv=replace(pcfstr,pcfold,pcfti)
pcdtx=1
end if
end if
end function

'made new content
function pcrc(pcfuy,pcfty,pcfep,pcfsn,pcfstr)
dim pcdrr,pcdud,pcdii,pcdll,pcdlt,pcdlc,pcdoks
if pcfuy=1 then
'response.Write pcfstr&"<br><br>"&aiimgs(0,"||",pcfstr)&"<br><br>"
pcdrr=split(aiimgs(0,"||",pcfstr),"||")
else
'response.Write pcfstr&"<br><br><br><br>"
pcdrr=split("||"&pcfstr,"||")
end if
pcdud=ubound(pcdrr)
for pcdii=1 to pcdud
pcdll=pcdrr(pcdii)
if pcfty=1 and (instr(pcdll,p_upijj)>0 or instr(pcdll,p_upwdu)>0) then
if instr(pcdll,p_upijj)>0 then
pcdlt=split(pcdll,p_upijj)(1)
else
pcdlt=split(pcdll,p_upwdu)(1)
end if
if instr(pcdoks,pcdlt)=0 then
if pic_dirnew<>"" then
pcdlc=pic_dirnew&replace(p_upijj&pcdlt,"/","\")
else
pcdlc=Server.MapPath(i_dir&p_upijj&pcdlt)
end if
pcdlt=p_upijj&pcdlt
pcfstr=pcdsv(pcfty,pcfstr,pcdll,pcdlt,pcdlc)
pcdoks=pcdoks&"||"&pcdll
end if
elseif pcfty=0 and instr(pcdll,p_upijj)=0 and instr(pcdll,p_upwdu)=0 and aibj(left(pcdll,7),"http://") then
pcdlt=p_upijj&pcdtp(0,pcfty,pcdll)
if instr(pcdoks,pcdlt)=0 then
if p_upwdr<>"" then
pcdlc=p_upwdr&replace(pcdlt,"/","\")
else
pcdlc=Server.MapPath(i_dir&p_upijj&pcdlt)
end if
if p_upwdu<>"" then
pcdlt=p_upwdu&p_upijj&pcdlt
else
pcdlt=i_dir&pcdlt
end if
pcfstr=pcdsv(pcfty,pcfstr,pcdll,pcdlt,pcdlc)
pcdoks=pcdoks&"||"&pcdll
end if
else
pcdlt=p_upijj&esupcc(pcfep,pcfsn)
if pcdci=1 then
pcdlt=pcdlt&pcfsn&"."&split(pcdll,".")(ubound(split(pcdll,".")))
else
pcdlt=pcdlt&pcfsn&"_"&pcdci&"."&split(pcdll,".")(ubound(split(pcdll,".")))
end if
if pic_dirnew<>"" then
pcdlc=pic_dirnew&replace(pcdlt,"/","\")
else
pcdlc=Server.MapPath(i_dir&pcdlt)
end if
'response.Write pcdlt&"<br><br>"&pcdlc&"<br><br>"
pcfstr=pcdsv(pcfty,pcfstr,pcdll,pcdlt,pcdlc)
pcdoks=pcdoks&"||"&pcdll
end if
next
pcrc=pcfstr
end function
'main doing
function pcsq(pcftm,pcfty,pcfsql,pcflie,pcfnm,pcfpg)
pcdook=0
Call opendb(i_dir)
dim pcdlierr,pcdlieud,pcdlieii,pcdlins,pcdliem,pcdlie,pcdsye,pcdsty
pcsq=""
pg=int(pcfpg)
ps=int(pcfnm)
pcdid=aiint(request("pid"))
if pcdid=0 then pcdid=aiint(split(pcfsql&"|","|")(1))
pcdlierr=split(pcflie,"|")
pcdlieud=ubound(pcdlierr)
if instr(pcfsql,"from")=0 then
pcdsty="1"
pcfsql=split(pcfsql,"|")(0)
pcfsql="select top "&ps&" ai_id,ai_sn,ai_ep,ai_up,ai_nr from "&pcfsql&" where ai_id>"&pcdid&" order by ai_id asc"
Call saik(gysrs,pcfsql,1,3)
else
pcdsty="0"
Call saik(gysrs,pcfsql,1,3)
gysrs.PageSize=ps'每页数量
if request.Cookies("upage")<>"" and request("usql")="" then
pa=aiint(request.Cookies("upage"))
else
pa=gysrs.PageCount'总页码
response.Cookies("upage")=pa
end if
if pg<1 then
pg=1
elseif pg>pa then
pg=pa
end if
gysrs.AbsolutePage=pg'当前页码
end if

'response.Write pcfsql&"<br>"
if gysrs.bof and gysrs.eof then
pcsq=pcsq&"暂无内容！"
else
pi=0
Do While Not gysrs.eof
pcdtx=0
for pcdlieii=0 to pcdlieud
pcdliem=pcdlierr(pcdlieii)
pcdlie=gysrs(pcdliem)
if not ainull(pcdlie) then
if right(pcdliem,2)="nr" then
if p_upwdu<>"" then
pcdlins=pcrc(1,pcfty,gysrs(1),gysrs(2),aiufile(0,pcdlie,p_upijj,p_upwdu))
else
pcdlins=pcrc(1,pcfty,gysrs(1),gysrs(2),pcdlie)
end if
else
pcdlins=pcrc(0,pcfty,gysrs(1),gysrs(2),pcdlie)
'Response.Write gysrs(1)&pcdliem&pcdlieud&"<br>"
'response.Write "dddddddddd"&pcdlie
end if
if pcdtx=1 and pcfty<>"1" then
gysrs(pcdliem)=pcdlins
pcdtx=2
end if
end if
next
if pcdtx=2 then gysrs.update
pcdtx=0
pcsq=pcsq&"<div style=""float:left;width:280px;"">"&pi&"、"&gysrs(1)&"含图片"&pcdci&"张</div>"
'Response.Write pcsq&"<br>"
pcdci=0
pi=pi+1
if pi>ps then exit do
pcdid=gysrs(0)
gysrs.movenext
loop
end if
Call saig(gysrs)


pcsq=pcsq&"<div style=""clear:both""></div><br>"
if pcdsty="1" then
Response.Cookies("ushua")="0"
if pi>0 then
pcsq=pcsq&"本次合计完成<strong>"&pi&"</strong>条信息的图片转移，即将执行大于<strong>"&pcdid&"</strong>的前<strong>"&ps&"</strong>条信息转移操作！"
pcsq=pcsq&"<script>function asaigozcs(){location.replace(""?ty=updo&page="&pg+1&"&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""");}setTimeout('asaigozcs()',"&aiint(pcftm)&"000);</script>"
else
pcsq=pcsq&"本次转移操作完成！"
end if
else
if pg>0 and pg<pa then
pcsq=pcsq&"<a href=""?ty=updo&page=1&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""">首页</a>|"
if pg=1 then
pcsq=pcsq&"<a href=""?ty=updo&page=1&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""">前一页</a>|"
else
pcsq=pcsq&"<a href=""?ty=updo&page="&pg-1&"&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""">前一页</a>|"
end if
pcsq=pcsq&"<a href=""?ty=updo&page="&pg+1&"&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""">后一页</a>|"
pcsq=pcsq&"<a href=""?ty=updo&page="&pa&"&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""">末页</a>"
Response.Cookies("ushua")="0"
pcsq=pcsq&"<script>function asaigozcs(){location.replace(""?ty=updo&page="&pg+1&"&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""");}setTimeout('asaigozcs()',"&aiint(pcftm)&"000);</script>"
elseif pg=pa then
pcsq=pcsq&"<a href=""?ty=updo&page=1&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""">首页</a>|"
pcsq=pcsq&"<a href=""?ty=updo&page="&pg-1&"&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""">前一页</a>|"
pcsq=pcsq&"下一页| 末页"
end if
pcdsye=int(pa-pg)
pcsq=pcsq&"<br><br>报告：合计需要处理<strong>"&pa&"</strong>页！每页处理"&ps&"条！当前处理第"&pg&"页！还有<strong>"&pcdsye&"</strong>页等待处理！"
if pcdsye>1200 then
pcsq=pcsq&"大概还需要<strong>"&int(pcdsye/1200)&"小时</strong>"
else
pcsq=pcsq&"即将完成，还需要<strong>"&int(pcdsye/20)&"分钟</strong>"
end if
pcsq=pcsq&"（以3秒/页计算）。"
pcsq=pcsq&"<br>"
end if
'Response.Write pcsq&"<br>"
pcdook=1
end function

end if%>
<%if aibj(request("ty"),"updo") then%>
<div class=g-lt>Asai系统图片转移处理——报告：</div>
<div class=g-ll><ul>
<li class=g-ll0>
<%
dim usql,ulie,uty,unm
if request("usql")<>"" then
usql=request("usql")
if usql="0" then usql="ees_ai"
ulie=request("ulie")
uty=request("uty")
unm=aiint(request("unm"))
Response.Cookies("usql")=usql
Response.Cookies("ulie")=ulie
Response.Cookies("uty")=uty
Response.Cookies("unm")=unm
else
usql=request.Cookies("usql")
ulie=request.Cookies("ulie")
uty=request.Cookies("uty")
unm=aiint(request.Cookies("unm"))
end if
Response.Write pcsq(1,uty,usql,ulie,unm,pg)
if pcdook=0 then
if aiint(request.Cookies("ushua"))>5 then
pcdid=aiint(pcdid)+1
Response.Write "<h1>第"&request.Cookies("ushua")&"次尝试，依旧失败！即将进行下一项操作！</h1><script>function asaigozcs(){location.replace(""?ty=updo&page="&aiint(request("page"))+1&"&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""");}setTimeout('asaigozcs()',1000);</script>"
Response.Cookies("ushua")=0
else
Response.Cookies("ushua")=aiint(request.Cookies("ushua"))+1
Response.Write "<h1>第"&request.Cookies("ushua")&"次尝试</h1><script>function asaigozcs(){location.replace(""?ty=updo&page="&aiint(request("page"))&"&ulie="&request("ulie")&"&uty="&request("uty")&"&pid="&pcdid&""");}setTimeout('asaigozcs()',1000);</script>"
end if
end if
Response.Write pcdshow
%>
</li>
</ul></div>
<%end if
if usql="" then usql="select ai_id,ai_sn,ai_ep,ai_up,ai_nr from ees_ai where ai_id>200000 and ai_id<600000 and ai_up<>''"
if ulie="" then ulie="ai_up|ai_nr"
if unm<2 then unm=20
%>
<div class=g-lt>Asai系统图片转移处理：</div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll1>语句：<%=aiinput(0,"usql","500px;",0,0,"处理SQL语句，或表名称|起始ID","",usql)%></li>
<li class=g-ll0>列名：<%=aiinput(0,"ulie","200px;",0,0,"多个列名使用|隔开","",ulie)%> 数量：<%=aiinput(0,"unm","100px;",0,0,"每次处理数量","",unm)%>输入每次处理数量</li>
<li class=g-ll1>方式：<select name="uty"><option value="0"<%if uty="0" then%> selected<%end if%>>本地化图片：将外网图片[http://]本地化到网站所在服务器(原始文件夹与文件名+动数据库)</option><option value="1"<%if uty="1" then%> selected<%end if%>>转移图片：将所有本地图片[<%=p_upijj%>]转移到新设置的文件夹位置(原始文件夹与文件名+不动数据库+可用来清理无用图片)</option><option value="2"<%if uty="2" then%> selected<%end if%>>重处理图片：将所有图片[<%=p_upijj%>+http://]重新命名并储存到新设置的文件夹位置(全新位置全新名称+动数据库)</option></select></li>
<li class=g-ll0><%=aiinput("hidden","ty","",0,0,"","","updo")%><%=aiinput("hidden","page","",0,0,"","","0")%><input type="submit" name="act" value="点击执行" /></li>
</form>
</ul></div>

<%if aibj(request("ty"),"actsql") then%>
<div class=g-lt>Asai系统数据库导入——报告：</div>
<div class=g-ll><ul>
<li class=g-ll0>
<%
dim conndr,adoconndr,rdrlx,rdrlj,rdrljrr,rdrtb,rdrid,rdrwh,rdrwhx,rid,kid,rps,rdrin,rdrzd,rdrzdrr,rdrzdxx,rdrzdi,drsqls
dim drinrs,drsqlin,drs,drsql
rdrlx=aireq("drlx")
rdrlj=aireq("drlj")
rdrtb=aireq("drtb")
rdrid=aireq("drid")
rdrwh=aireq("drwh")
if aireq("rid")<>"" then
rid=int(aireq("rid"))
else
rid=0
end if
if aireq("rps")<>"" then
rps=int(aireq("rps"))
else
rps=20
end if
rdrin=aireq("drin")
rdrzd=aireq("drzd")
if rdrlx<>"" and rdrlj<>"" and rdrtb<>"" and rdrid<>"" and rdrin<>"" and rdrzd<>"" then
Response.Cookies("drx")="1"
Response.Cookies("drlx")=rdrlx
Response.Cookies("drlj")=rdrlj
Response.Cookies("drtb")=rdrtb
Response.Cookies("drid")=rdrid
Response.Cookies("drwh")=rdrwh
Response.Cookies("drin")=rdrin
Response.Cookies("drzd")=rdrzd
elseif request.Cookies("drx")="1" then
rdrlx=request.Cookies("drlx")
rdrlj=request.Cookies("drlj")
rdrtb=request.Cookies("drtb")
rdrid=request.Cookies("drid")
rdrwh=request.Cookies("drwh")
rdrin=request.Cookies("drin")
rdrzd=request.Cookies("drzd")
end if

if rdrlx<>"" and rdrlj<>"" and rdrtb<>"" and rdrid<>"" and rdrin<>"" and rdrzd<>"" then
rdrljrr=split(rdrlj,",")
rdrzdrr=split(rdrzd,"-=-")
if rdrwh<>"" then rdrwhx=" and "&rdrwh&""
if rdrlx=1 then'MSSQL
Set conndr=Server.CreateObject("ADODB.CONNECTION")
adoconndr="Provider=Sqloledb;Data Source="&rdrljrr(0)&";Initial Catalog="&rdrljrr(1)&";User ID="&rdrljrr(2)&";Password="&rdrljrr(3)&";"
else'ACCESS
set conndr=server.CreateObject("ADODB.CONNECTION")
if ubound(rdrljrr)>0 then
adoconndr="DBQ="+server.mappath(""&rdrljrr(0)&"")+";PWD="+""&rdrljrr(1)&""+";DefaultDir=;DRIVER={Microsoft Access Driver(*.mdb)};"
else
adoconndr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath(""&rdrljrr(0)&"")
'adoconndr="DRIVER={Microsoft Access Driver(*.mdb)};DBQ="&Server.MapPath(""&rdrljrr(0)&"")
end if
end if
if err then
err.Clear
Set conndr=Nothing
Response.Write "Sorry!Err..."
Response.End
else
conndr.open adoconndr
end if

Set drs=Server.CreateObject("ADODB.Recordset")
drsql="SELECT top "&rps&" * FROM "&rdrtb&" where "&rdrid&">"&rid&""&rdrwhx&" order by "&rdrid&" asc"
Response.Write drsql&"<br><br><br>"
drs.Open drsql, conndr, 1, 3
While not drs.eof

Set drinrs=Server.CreateObject("ADODB.Recordset")
drsqlin="SELECT * FROM "&rdrin&""
drinrs.Open drsqlin, conn, 1, 3
drinrs.addnew
for rdrzdi=0 to ubound(rdrzdrr)
rdrzdxx=split(rdrzdrr(rdrzdi)&"||||","|")
Response.Write rdrzdxx(0)&"<br>"
Response.Write rdrzdxx(1)&"<br>"
Response.Write rdrzdxx(2)&"<br><br>"
if rdrzdxx(0)<>"" and rdrzdxx(1)<>"" then
if drs(rdrzdxx(1))<>"" then
drinrs(rdrzdxx(0))=drs(rdrzdxx(1))
elseif rdrzdxx(2)<>"" then
drinrs(rdrzdxx(0))=rdrzdxx(2)
end if
elseif rdrzdxx(0)<>"" and rdrzdxx(2)<>"" then
drinrs(rdrzdxx(0))=rdrzdxx(2)
end if
next
drinrs.Update
drinrs.Close

kid=drs(rdrid)
drs.movenext
wend
drs.Close

conndr.Close
Set conndr=Nothing
Response.Write aitiao("恭喜您"&rdrid&"的"&rid&"——"&kid&"导入成功，等待下个指令。","?ty=actsql&rid="&kid&"",6)
else
Response.Write("条件不足 执行操作失败")
end if%>
</li>
</ul></div>
<%end if%>
<div class=g-lt>Asai系统数据库导入：</div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll0>数据库型：<select name="drlx"><option value="0">ACCESS</option><option value="1">MSSQL</option></select> 链接字串：<%=aiinput(0,"drlj","",0,0,"ACCESS=0:access/access,pass；MSSQL=1:ip,dataneme,userid,pass","","/dr.mdb")%> ACCESS=0:access/access,pass；MSSQL=1:ip,dataneme,userid,pass</li>
<li class=g-ll1>数据表名：<%=aiinput(0,"drtb","",0,0,"被导入数据库中的表名","","asai_NR")%> 主键列名：<%=aiinput(0,"drid","",0,0,"被导入数据库中的表里的列名","","id")%> 条件语句：<%=aiinput(0,"drwh","",0,0,"使用条件筛选对于数据","","pd=4")%></li>
<li class=g-ll0>导入表名：<%=aiinput(0,"drin","",0,0,"","","ees_ai")%></li>
<li class=g-ll1>字段对应：<textarea name="drzd" id="drzd" style="width:40%;height:120px;">ai_ew||<%=ew_sn%>-=-ai_el||77-=-ai_ep||zym-=-ai_ef||xh-=-ai_us||sys-=-ai_ee||sys-=-ai_eq|b1|-=-ai_sn|sn|-=-ai_nr|nr|-=-ai_tm|t1|-=-ai_xy||1-=-ai_hi|dj|-=-ai_xi|ds|</textarea><br>
格式说明：导入列名|来自表名|默认值（当导入的值为空时或来自表名为空时使用默认值），如：ai_ew||<%=ew_sn%>-=-ai_el||77-=-ai_ep||zym-=-ai_ef||xh-=-ai_us||sys-=-ai_ee||sys-=-ai_eq|b1|-=-ai_sn|sn|-=-ai_nr|nr|-=-ai_tm|t1|-=-ai_xy||1-=-ai_hi|dj|-=-ai_xi|ds|</li>
<li class=g-ll0><%=aiinput("hidden","ty","",0,0,"","","actsql")%><%=aiinput("hidden","page","",0,0,"","","0")%><input type="submit" name="act" value="点击执行" /></li>
</form>
</ul></div>


<%end if%>
<div class=g-lt>友情提醒：</div>
<div class=g-ll><ul>
<li class=g-ll0>1.本操作直接针对数据库、文件等底层操作，请操作前务必备份您的数据库和网站源代码，以防出错；</li>
<li class=g-ll1>2.请选择访客稀疏的时间段进行以上操作。</li>
</ul></div>
<%=pde("")%></body>
</html><!--#include file="../../AsaiInc/incma.asp"-->