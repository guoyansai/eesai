<%
'{缓存设置选项}
const g_apts=3'更新时间-直接输入数字单位天数100表示不更新
const g_apx=2'数据缓存-关闭缓存|Application|生成文件缓存*网站数据库读取的缓存位置
const g_apd="gys/"'缓存储存:请使用相对网站的绝对路径,最后必须带/.
const g_aps=1'删除次数-缓存循环删除次数.越多删除越彻底越耗内存.
const g_char="utf-8"'缓存编码:缓存默认编码.
const g_apt="!"'空值替换:当缓存值为空时使用此符号替换.
const g_apz=".txt"'文件后缀:缓存文件的后缀名,可用.html,.asp,.asa,.htm等.
const g_apj="__"'替文件夹:文件夹替换符合.
const g_atxg="2,3,4"'更新时间:在哪几个时间段进行文件更新操作，如5,8,12表示在5点8点12点中执行更新操作
const g_atxm=888888'文件更新-缓存时间超过设置时间即可更新，0表示全部，单位N秒，大于100000（十万）关闭自动更新功能
const g_atxn=2'更新数量-每次更新缓存数量
const g_atxw=0'即时维新-关闭维新|开启维新*每次都只需获取最新ID并判断ID是否有变来执行缓存更新操作
const g_atxx="eesx_"'更新关键:判断是否自动更新的关键词，同时作为缓存名称。
'{控制与测试参数设置}
const g_err=0'执行过程-隐藏执行|管理执行|管执后现|显示执行|执行后现*显示数据库操作执行过程.
const g_wapk=1'强制WAP-关闭Wap|首页不跳|跳转wap*是否启用WAP强制跳转.
const g_wapc="manage|member|GuoYanSai_Plug"'无作目录:不作WAP判断处理的目录，以/结束.
const g_ckks="ckeesfm"'验证表单:验证表单名称.
const g_cksn="snees"'临时编码:临时编码的缓存名称.
const g_vdw=600'媒体宽度-媒体播放时显示的宽度.
const g_vdh=450'媒体高度-媒体播放时显示的高度.
const g_svkx=1'储存空值-默认不空值|不储存空值|储存空值*如果是管理员操作是否储存空值.
'{分页显示选项}
const g_pgly=1000'数据容量-直接填写数据条目数如大于10000则自动启用超级数据模式.
const g_pglt=1'分页跳转-不要跳转|显示跳转*是否显示分页跳转表单项.
const g_pgln=11'分页个数-分页按钮的个数.
const g_pgls=20'储存条目-一次循环列表中默认储存的信息条目数.每页显示数量.
'{内容分页}
const g_pgcx=1'内容分页-不要分页|内容分页*内容分页显示开关.
const g_pgcg="[page]"'分页符号:默认内容页面插入的分页符号.每个分页符代表一个分页[需同步AsaiEdit编辑器修改].
const g_pgct="<br>"'分页替换:内容全部显示的时候,此代码替换分页符.
'{缓存简介字数控制}
const g_lcn=200'简介字数-列表及简介内容限定的最多显示字数.储存到缓存的文本字数.
const g_lcsn=50'服务缓存-服务器缓存session的储存字数上限.
const g_lckn=20'本地缓存-本地缓存cookies的储存字数上限.需要开启自动缓存模式.
const g_lcpn=100'远程缓存-远程服务器缓存application的储存字数上限.需要开启自动缓存模式.
'{地址栏默认参数设置}
const g_ura="_A_"'一级间隔:地址栏多个参数聚合间隔符,需要可以建立文件夹名称的字符
const g_urb="_B_"'二级间隔:地址栏多个参数聚合间隔符,需要可以建立文件夹名称的字符
const g_urk="-"'默认空值:默认地址栏空值
const g_urg="/"'间隔字符:地址栏值与值之间的间隔符
const g_urz=".html"'后缀名称:地址栏的地址后缀名
'{网站发信邮箱与服务器设置}
Const g_emkg=1'发信开关-不发邮件|发送邮件*需要Jmail组件支持,可到官方eesai.com下载.
Const g_emci=100'发信次数-可以发信的次数1000次以上为不限制.
Const g_emfw="smtp.126.com"'Smtp服务:发送邮件所使用的SMTP服务器,建议大家使用126等专业邮箱.
Const g_emzh="EESaicom@126.com"'邮箱用户:与SMTP服务器对应的邮箱用户名,126等大多邮箱即邮箱地址.
Const g_emmm="Guoyansai2017"'邮箱密码:与SMTP服务器对应的邮箱密码.
Const g_emfr="EESaicom@126.com"'发信邮箱:SMTP服务器发信邮箱.
Const g_emrp="guoyansai@qq.com"'回信邮箱:回信默认发往的邮箱.
Const g_emck="emx"'限制缓存:发送邮件限制发送次数的缓存名.
'{特殊字符与间隔符设置}
const g_gg="-_-"'普通间隔:普通间隔特殊符号.
const g_gx="-x-"'特殊符一:间隔特殊符号1.
const g_gy="_y_"'特殊符二:间隔特殊符号2.
const g_gz="_z-"'特殊符三:标签间隔及某些特别字符替换的特殊符号3，自动更新时间与内容间隔符号.
const g_gp="-p_"'特殊符四:翻页页码字符替换的特殊符号4.
const g_gn=",nr,xt,"'编辑标示:编辑器处理的表单标示前后间隔须加半角逗号，可以放宽处理限度.
const g_gr="-r_"'内容换行:编辑器中内容内换行特殊替换符.
const g_gmm="Gys.Z1nHdFYefo@Q2pqrxUAjBI~WzCwEaRtSc9Kh=TkP6XiJNuOMv5_0D3Vg4b7mL8l-"'密钥字串:系统密钥字符设置一经启用谨慎修改.
%>