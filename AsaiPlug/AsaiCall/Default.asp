<!--#include file="../../AsaiData/cf.asp"--><!--#include file="../../AsaiInc/incba.asp"--><!--#include file="../../AsaiInc/incbu.asp"--><%Call esq()%><!--#include file="../inc.asp"--><%=pdt("Asai系统调用代码生成")%>
<%=escss()%>
<body>
<%
dim r_rw,r_sx,r_by,r_ss,r_nm,r_nl,r_ty,r_t1,r_t2,r_ip,r_ip1,r_ip2,r_str,r_tb,r_tb1,r_tb2,r_va,r_sz,r_lh,r_ot,r_ot1,r_ot2,r_ot3,r_ot4,r_ot5
if request.Form("ty")="act" then
r_rw=aiint(aireq("frw"))
r_sx=aiint(aireq("fsx"))
r_by=trim(replace(aistr(aireq("fby")),",",""))
r_ty=aiint(aireq("fty"))
if request("a")="1" then
r_tb1=aiint(aireq("ftb1"))
r_tb2=aistr(aireq("ftb2"))
r_tb=r_tb1&"|"&r_tb2
r_va=aistr(aireq("fva"))
r_nm=aistr(aireq("fnm"))
r_sz=aistr(aireq("fsz"))
r_lh=aistr(aireq("flh"))
r_ot1=aistr(aireq("fot1"))
r_ot2=aistr(aireq("fot2"))
r_ot3=aistr(aireq("fot3"))
r_ot4=aistr(aireq("fot4"))
r_ot5=aistr(aireq("fot5"))
r_ot=r_ot1&"|"&r_ot2&"|"&r_ot3&"|"&r_ot4&"|"&r_ot5
r_str="&lt;%=icmenu("&r_sx&",&quot;"&r_by&"&quot;,&quot;"&r_tb&"&quot;,&quot;"&r_va&"&quot;,&quot;"&r_ty&"&quot;,&quot;"&r_nm&"&quot;,&quot;"&r_sz&"&quot;,&quot;"&r_lh&"&quot;,&quot;"&r_ot&"&quot;)%&gt;"
%>
<div class=g-lt>调用代码</div>
<div class=g-ll><ul>
<li class=g-ll0><H2><%=r_str%></H2></li>
</ul></div>
<%
else
r_ss=aistr(aireq("fss"))
r_nm=aiint(aireq("fnm"))
r_nl=aireq("fnl")
r_t1=aireq("ft1")
r_t2=aireq("ft2")
r_ip1=aiint(aireq("fip1"))
r_ip2=aiint(aireq("fip2"))
r_ip=aiint(r_ip1&r_ip2)
r_str="&lt;%=ictop("&r_sx&",&quot;"&r_by&"&quot;,&quot;"&r_ss&"&quot;,"&r_nm&",&quot;"&r_nl&"&quot;,"&r_ty&",&quot;"&r_t1&"&quot;,&quot;"&r_t2&"&quot;,"&r_ip&")%&gt;"
%>
<div class=g-lt>调用代码</div>
<div class=g-ll><ul>
<li class=g-ll0><H2><%=r_str%></H2></li>
</ul></div>
<%
end if
else
r_rw=0
r_sx=0
r_by=""
r_ss=""
r_nm=10
r_nl=1
r_ty=10
r_t1=0
r_t2=1
r_ip1=1
r_ip2=1
r_va="ef_sn"
r_sz="14px"
r_lh="45px"
'|70|71|72|80|81|82|83|94|95
end if

if r_rw>0 then%>
<div class=g-lt>调用预览</div>
<div style="padding:20px;width:<%=r_rw%>px;margin:0px auto;">
<%if request("a")="1" then%>
<%=icmenu(r_sx,r_by,r_tb,r_va,r_ty,r_nm,r_sz,r_lh,r_ot)%>
<%else%>
<%=ictop(r_sx,r_by,r_ss,r_nm,r_nl,r_ty,r_t1,r_t2,r_ip)%>
<%end if%>
</div>
<div class="crg"></div>
<%end if

if request("a")="1" then
%>
<div class=g-lt>网站分类菜单调用生成表单　<a href="./?a=">内容-论坛-会员-空间调用生成表单</a></div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll0>0容器宽度：<%=aiinput("","frw","100px",6,8,"","",r_rw)%>请输入容器宽度（本项不计入调用代码中，仅作调试用，且数值大于0时调试有效）</li>
<li class=g-ll1>1选择色系：<%=aiselect("fsx","","","",r_sx,0,i_bsx&"|无色")%>当您选择无色，则以外框色为基准，调用中不绑定色彩。</li>
<li class=g-ll0>2边框样式：<%=aiselect("fby","","","",left(r_by,3),"|k-1|k-2|k-3|k-4|k-5","请选择边框|k-1顶部线条|k-2左右线条|k-3左右下线条|k-4左右上线条|k-5完整边框")%>　<input name="fby"<%if instr(r_by,"d-0")>0 then%> checked<%end if%> type="checkbox" value="d-0">d-0列表白线分割　<input name="fby"<%if instr(r_by,"d-1")>0 then%> checked<%end if%> type="checkbox" value="d-1">d-1列表下划线　<input name="fby"<%if instr(r_by,"d-2")>0 then%> checked<%end if%> type="checkbox" value="d-2">d-2背景颜色　<input name="fby"<%if instr(r_by,"d-3")>0 then%> checked<%end if%> type="checkbox" value="d-3">d-3动态划过　<input name="fby"<%if instr(r_by,"d-4")>0 then%> checked<%end if%> type="checkbox" value="d-4">d-4彩色文字</li>
<li class=g-ll1>3调用范围：<%=aiselect("ftb1","","","",r_tb1,"1|2|3|4|5|0","1频道|2分类|3版块|4帖子|5导航|0整站")%>输入顶级SN编码/EP<%=aiinput("","ftb2","200px",0,200,"","",r_tb2)%></li>
<li class=g-ll0>4当前的值：<%=aiinput("","fva","100px",0,100,"","",r_va)%>当前页面的对应值。</li>
<li class=g-ll1>5调用样式：<%=aiselect("fty","","","",r_ty,"10|11|19|20|21|22|29|30|31|32|39|40|42|44|45|49|50|51|60|61|70|71|80|81|90|91","10普通列表(顶级)|++++11所有菜单|++++19带内容简介|20大型树形|++++21展开大树|++++22关闭大树|++++29大树内容|30小型树形|++++31展开小树|++++32关闭小树|++++39小树内容|40梯形模式|++++42两列梯形|++++44四列梯形|++++45五列梯形|++++49云签梯形|50云签模式|++++51云签瀑布流|60多级模式·竖向-无边框|++++61多级模式·竖向-有边框|70多级模式·横向-无边框|++++71多级模式·横向-有边框|80二级模式·竖向-无边框|++++81二级模式·竖向-有边框|90二级模式·横向-无边框|++++91二级模式·横向-有边框")%></li>
<li class=g-ll0>6顶级数量：<%=aiinput("","fnm","100px",0,8,"","",r_nm)%>请直接输入数字，顶级菜单的最高数量，如：7。</li>
<li class=g-ll1>7菜单字号：<%=aiinput("","fsz","100px",0,8,"","",r_sz)%>菜单的字体大小，如:12px</li>
<li class=g-ll0>8菜单行距：<%=aiinput("","flh","100px",0,8,"","",r_lh)%>菜单的行距，如180%|28px</li>
<li class=g-ll1>9其他属性：<%=aiinput("","fot1","50px",0,8,"","",r_ot1)%>|<%=aiinput("","fot2","50px",0,8,"","",r_ot2)%>|<%=aiinput("","fot3","50px",0,8,"","",r_ot3)%>|<%=aiinput("","fot4","50px",0,8,"","",r_ot4)%>|<%=aiinput("","fot5","50px",0,8,"","",r_ot5)%></li>
<li class=g-ll0><%=aiinput("hidden","ty","",0,0,"","","act")%><input type="submit" name="act" value="生成菜单代码并预览" /></form>
<li class=g-ll1>调用代码概述：<br>&lt;%=icmenu(<br>
★1icfsx,[色系0主色|1辅助色|2跳跃色|3无色]<br>
★2icfby=边框样式，d-1列表下划线|d-2背景颜色|d-3动态划过|d-4彩色文字<br>
★3icftb,显示范围，L1+SN{0整站|1频道|2分类|3帖子}+SN值/EP，获取gysar数组值<br>
★4icfva,当前值<br>
★5icfty,显示样式，L1+R1{1普通列表[0顶级|1所有]||2大型树形[0大树|1展开大树|2关闭大树|9大树枝叶]||3小型树形[0小树|1展开小树|2关闭小树|9小树枝叶]||4梯田模式[0普通梯田|2两列梯田|4四列梯田|5五列梯田]||5云签模式||6多级导航·竖向[0无边框|1有边框]||7多级导航·横向[0无边框|1有边框]||8二级导航·竖向[0无边框|1有边框]||9二级导航·横向[0无边框|1有边框]}len(icfty)=3select<br>
★6icfnm,调用数量<br>
★7icfsz,字号<br>
★8icflh,行距<br>
★9icfot,其他信息组合，使用|隔开<br>
----1=列数|内容文本字号(>0显示文本简介)|是否显示列表表头0不带-1带|标题字数<br>
----2/3=缩进宽度|内容文本字号(>0显示文本简介)|是否显示列表表头0不带-1带|标题字数<br>
----4=子类宽度0表示不控制<br>
----5=0宽度<br>
----6=顶级宽度|子级宽度|导航高度<br>
----7=顶级宽度|子级宽度|导航宽度<br>
----8=顶级宽度|子级宽度|子级总宽|子级总高|导航高度<br>
----9=顶级宽度|子级宽度|子级总宽|导航宽度<br>
)%&gt;</li>
<li class=g-ll0>例如：&lt;%=ictop(0,"","",10,"1",10,"0","1",11)%&gt;  　&lt;%=ictop(0,"","all",10,"2",31,"200px","1",11)%&gt;
</li>
</ul>
</div>
<%else%>
<div class=g-lt>内容-论坛-会员-空间调用生成表单　<a href="./?a=1">网站分类菜单调用生成表单</a></div>
<div class=g-ll><ul>
<form name="asaiba" action="" method="post">
<li class=g-ll0>0容器宽度：<%=aiinput("","frw","100px",6,8,"","",r_rw)%>请输入容器宽度（本项不计入调用代码中，仅作调试用，且数值大于0时调试有效）</li>
<li class=g-ll1>1选择色系：<%=aiselect("fsx","","","",r_sx,0,i_bsx&"|无色")%>当您选择无色，则以外框色为基准，调用中不绑定色彩。</li>
<li class=g-ll0>2边框样式：<%=aiselect("fby","","","",left(r_by,3),"|k-1|k-2|k-3|k-4|k-5","请选择边框|k-1顶部线条|k-2左右线条|k-3左右下线条|k-4左右上线条|k-5完整边框")%>　<input name="fby"<%if instr(r_by,"d-0")>0 then%> checked<%end if%> type="checkbox" value="d-0">d-0列表白线分割　<input name="fby"<%if instr(r_by,"d-1")>0 then%> checked<%end if%> type="checkbox" value="d-1">d-1列表下划线　<input name="fby"<%if instr(r_by,"d-2")>0 then%> checked<%end if%> type="checkbox" value="d-2">d-2背景颜色　<input name="fby"<%if instr(r_by,"d-3")>0 then%> checked<%end if%> type="checkbox" value="d-3">d-3动态划过　<input name="fby"<%if instr(r_by,"d-4")>0 then%> checked<%end if%> type="checkbox" value="d-4">d-4彩色文字</li>
<li class=g-ll1>3调用范围：<%=aiinput("","fss","200px",0,200,"","",r_ss)%>输入模式【频道ep/1分类ef/2排序ssp/3范围ssf/4项目ssx/5模式ssm/6关键词sss】</li>
<li class=g-ll0>4调用数量：<%=aiinput("","fnm","100px",0,8,"","",r_nm)%>请直接输入调用总量的数字。</li>
<li class=g-ll1>5列表列数：<%=aiinput("","fnl","100px",6,8,"","",r_nl)%>请直接输入调用信息的列数，或者直接输入每一列的宽度，如：180px或77%。</li>
<li class=g-ll0>6调用样式：<%=aiselect("fty","","","",r_ty,"","10文字~10|++++11概述~11|++++12排序~12|20文字（无样式）~20|++++21换行~21|++++22一行~22|30图片~30|++++31深色标题~31|++++32浅色标题~32|++++33白色标题~33|++++38组合表格大图列表~38|++++39组合表格图片右下角~39|40图片（图文)~40|++++41图文样式（单行标题）~41|++++42图文样式（标题换行）~42|50图片（无格式）~50|++++51一列多行~51|++++52一行多列~52|60图片（幻灯片）~60|++++61数字~61|++++62标题~62|70框图显示~70|++++71用户~71|++++72价格~72|80图文列表·右侧+默认图~80|++++81左侧+都有图~81|++++82无图~82|++++83无摘要(常规列表)~83|94云签·默认四列~94|++++95五列模式~95")%></li>
<li class=g-ll1>7特殊数一：<%=aiinput("","ft1","100px",0,8,"","",r_t1)%>文字（特殊行数）/图片（图片的高度*幻灯片状态此处为宽度值）</li>
<li class=g-ll0>8特殊数二：<%=aiinput("","ft2","100px",0,8,"","",r_t2)%>文字（附加显示项=0|1时间|2点击|3我顶|4会员）/图片（0无标题|1有标题*幻灯片状态此处为高度值）</li>
<li class=g-ll1>9调用频道：<%=aiselect("fip1","","","",r_ip1,"1|2|3|4","1内容|2论坛|3会员|4空间")%>+<%=aiselect("fip2","","","",r_ip2,"0|1|2","0列表|1调用|2后台")%></li>
<li class=g-ll0><%=aiinput("hidden","ty","",0,0,"","","act")%><input type="submit" name="act" value="生成调用代码并预览" /></form>
<li class=g-ll1>调用代码概述：<br>&lt;%=ictop(<br>
★1icfsx,[色系0主色|1辅助色|2跳跃色|3无色]<br>
★2icfby=边框样式，d-1列表下划线|d-2背景颜色|d-3动态划过|d-4彩色文字<br>
★3icfss,通过【频道ep/分类ef/排序ssp/范围ssf/项目ssx/模式ssm/关键词sss】获取gysar值<br>
★4icfnm,调用数量<br>
★5icfnl,列数<br>
★6icfty,调用样式：1文字(0文字|1概述|2排序)|2无样式文字(0普通|1换行|2一行)|3图片(0图片|1深色标题|2浅色标题|3白色标题)|4图文(0图片|1图文样式|2图文样式2)|5图片无格式(0普通|1一列多行|2一行多列)|6图片·幻灯片(0图片|1数字|2标题)|7框图显示(0标题|1用户|2价格)|8图文列表(0右侧+默认图|1左侧+都有图|2无图|3无摘要)|9云签(0默认四列|5五列模式)<br>
★7icft1,特殊参数：图片+（宽/高）、文字（特殊行数量）<br>
★8icft2,图片+'（0无标题|1有标题）、文字（附加显示项=0|1time|2click|3good|4user）<br>
★9icfip,left(1内容|2论坛|3会员|4空间)/right(0列表|1调用|2后台)<br>
)%&gt;</li>
<li class=g-ll0>例如：&lt;%=ictop(0,"","",10,"1",10,"0","1",11)%&gt;  　&lt;%=ictop(0,"","all",10,"2",31,"200px","1",11)%&gt;
</li>
</ul>
</div>
<%end if%>

<div class=g-lt>常规调用代码</div>
<div class=g-ll><ul>
<li class=g-ll0><strong>esbts(ep_sx,ep_el,&quot;标题名称&quot;g_gy&amp;eshref(ep_sn&amp;g_urz,1),&quot;more标题&quot;g_gy&amp;&quot;链接1&quot;&amp;g_gx&amp;&quot;more标题2&quot;g_gy&amp;&quot;链接2&quot;)
  标题样式调用</strong></li>
<li class=g-ll1><strong>icsq(eatqbtd,eatfbt,eatfnr,eatfcs)</strong></li>
<li class=g-ll1><strong>efmenu(&quot;频道sn&quot;,1,8显示数量,237自身宽度,1200弹出宽度,295高度)</strong>频道导航菜单调用</li>
<li class=g-ll0><strong>ew_bt</strong>当前页标题、<strong>ew_zt</strong>当前页关键词、<strong>ew_nr</strong>当前页简述、<strong>ew_cp</strong>当前页面版权信息</li>
<li class=g-ll1><strong>eskhf(0默认|1html|2js,横幅宽,横幅高)</strong>横幅调用后台-站点管理-编辑网站信息中可以修改</li>
<li class=g-ll0><strong>e_mt</strong>当前页标题、<strong>e_ma</strong>当前页内容信息</li>
<li class=g-ll1><strong>escss()</strong>调用样式表、<strong>eyme()</strong>留言分类调用、<strong>eskjs()</strong>底部常用JS调用、<strong>edmenut(0默认导航\1底部\2大型下拉\3自拟,8调用数量)</strong>网站底部菜单样式调用</li>
<li class=g-ll0><strong>eaindexs(&quot;频道sn&quot;,1频道类型,1普通标题|2简介模式|3图文预览|4全文预览|5图片列表|6云签模式,0移动标签|1一列到底|2两列排行|3无类板式|4手机板式|5列表板式|6自由组合)</strong>频道分类内容版块显示调用</li>
<li class=g-ll1><strong>ictb(ep_sx,ep_sn/ef_sn/&quot;搜索条件&quot;,ai_sn当前内容编码)</strong>内容标题特殊导航，多用于关于我们侧栏导航</li>
<li class=g-ll0><strong>icxq(&quot;频道sn&quot;,&quot;分类sn&quot;,&quot;内容sn&quot;,eafty=0截取固定长度|9全部内容,eaflen=需要截取的长度)</strong>调用单独的内容</li>

</ul></div>

<div class=g-lt>其他特殊调用与代码</div>
<div class=g-ll><ul>
<li class=g-ll0>&lt;%=replace(edmenu(40,10,1200),g_gg,&quot;&lt;ul id=&quot;&quot;ulmenu&quot;&quot; class=&quot;&quot;mk&quot;&quot; style=&quot;&quot;width:239px;&quot;&quot; onclick=&quot;&quot;stmenu()&quot;&quot;&gt;&lt;li class=&quot;&quot;mu&quot;&quot;&gt;&lt;a href=&quot;&quot;#&quot;&quot; class=&quot;&quot;mua&quot;&quot;&gt;&lt;span id=&quot;&quot;tmenuc&quot;&quot;&gt;全部分类　↓&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&quot;)%&gt;<br>
&lt;script&gt;<br>
function stmenu(){<br>
if(document.getElementById('tmenu').style.display==&quot;block&quot;){<br>
document.getElementById('ulmenu').className='mk';<br>
document.getElementById('tmenu').style.display='none';<br>
document.getElementById('tmenuc').innerText='全部分类　↓';<br>
}else{<br>
document.getElementById('ulmenu').className='mkl';<br>
document.getElementById('tmenu').style.display='block';<br>
document.getElementById('tmenuc').innerText='全部分类　↑';<br>
}<br>
}<br>
&lt;/script&gt;<br>
&lt;div id=&quot;tmenu&quot; style=&quot;position:absolute;width:100%;top:162px;display:none;&quot;&gt;<br>
&lt;div class=&quot;eesai&quot;&gt;<br>
&lt;div class=&quot;eesai2l&quot;&gt;<br>
&lt;%=icmenu(1,"k-4 d-0 d-1 d-2 d-3 d-4","1|sell","","61","10","14px","22px","280|120|500||")
%&gt;<br>
&lt;/div&gt;<br>
&lt;div class=&quot;eesai8r&quot;&gt;<br>
&lt;/div&gt;<br>
&lt;div class=&quot;cr&quot;&gt;&lt;/div&gt;<br>
&lt;/div&gt;<br>
&lt;div class=&quot;cr&quot;&gt;&lt;/div&gt;<br>
&lt;/div&gt;</li>
<li class=g-ll1>其他待整理......</li>
</ul></div>

<div class=g-lt>使用须知（请在使用前阅读）：</div>
<div class=g-ll><ul>
<li class=g-ll0>1、为提升服务具体调用在官网同步更新；</li>
<li class=g-ll1>2、使用此功能必须联网；</li>
</ul></div>
<%=pde("")%></body>
</html><!--#include file="../../AsaiInc/incma.asp"-->
