<%
dim w_htmls,w_wwkg,w_asai,w_chat,w_bbmo
dim w_sn,w_mosn,w_mour,w_motm,w_mott,w_motk,w_motd,w_motc,w_mobq,w_moby
dim w_dbss,w_dbqz,w_dbdn,w_dbdm,w_dbur,w_dbty,w_dbsf,w_dbsn,w_dbsu,w_dbsm
w_dbur=lcase(Request.ServerVariables("HTTP_HOST"))
w_dbqz="ees_"
w_sn="Free.Asai.Wang"'商业序号:免费版请填写Asai.Wang,商业版请填写您在官方购买时获得SN.
w_mosn=9'默认编号-当网站域名不存在的时候使用这个编码下网站信息.
w_htmls="news"'伪静态链:当您开启HTML伪静态功能时在这里设置伪静态范围.
w_wwkg=0'二级域名-全部关闭|频道二级|空间二级|全部打开*请选择启用二级域名的状态，需要设置IIS伪静态支持
w_asai="/"'插件地址:调用一些常用JS插件的地址.
w_chat="/AsaiPlug/AsaiChat/"'聊天室:聊天室网站网址.
w_bbmo="itbbs"'默认版块:帖子默认发到这个版块.
w_mour="http://www.asai.wang"'网站网址:上传网站需要修改为网站地址[注意结尾不要加/].
w_motm="阿赛工作室"'网站名称:网站名称[当数据库中没有对应网站信息时候默认显示的名称].
w_mott="阿赛工作室,阿赛企业网站,阿赛门户网站,阿赛博客,游梦鱼,郭言赛"'网站标题:网站标题[当数据库中没有对应网站信息时候默认显示的标题].
w_motk="阿赛,郭言赛,阿赛工作室,EESai,Asai,GuoYanSai,阿赛网站系统,阿赛门户网站,企业网站系统,阿不,原创歌曲"'关键词组:网站关键词组[当数据库中没有对应网站信息时候默认显示的关键词].
w_motd="阿赛工作室-专注于企业网站的建设服务，同时提供专业的门户、行业网站建设服务，同时记载阿赛日常点滴生活大话。"'网站说明:网站说明信息[当数据库中没有对应网站信息时候默认显示的信息].
w_motc="阿赛,郭言赛,EESai"'网站版权:网站的版权[当数据库中没有对应网站信息时候默认显示的版权].
w_mobq="Asai.Wang"'网站版权:多个版权请使用英文逗号,隔开.
w_moby="Asai.Wang"'标记域名:二级域名启用的标记域名需要设置IIS伪静态支持

'===================★ACCESS
w_dbty=0'1=MSSQL 0=ACCESS
w_dbdn=s_drsys&"Asai.Wang.mdb"'
w_dbdm=""'pass
%>