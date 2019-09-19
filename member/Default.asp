<!--#include file="../AsaiData/cf.asp"--><!--#include file="../AsaiInc/incba.asp"--><!--#include file="../AsaiInc/incbu.asp"--><%
Call esq()
'reg panduan
Function mzregx()
mzregx=false
if aireq("mm")<>aireq("mm1") then
Response.Write aigo("【"&aireq("mm")&"≠"&aireq("mm1")&"】两次输入密码不一样！",1)
Response.End()
end if
if aiint(ew_sh)=0 then
if instr(aireq("em"),"@")=0 or instr(aireq("em"),".")=0 or len(aireq("em"))<7 then
Response.Write aigo("【"&aireq("em")&"】不正确的邮箱！",1)
Response.End()
end if
end if
if len(aireq("er"))>i_buc and len(aireq("er"))<i_bud then
Response.Write aigo("【"&aireq("er")&" 长度="&len(aireq("er"))&"】超出规定长度（"&i_bud&"-"&i_buc&"）",1)
Response.End()
end if
if instr("|"&i_bux&"|","|"&lcase(aireq("er"))&"|")>0 then
Response.Write aigo("【"&aireq("er")&"】不能使用系统保留账户！",1)
Response.End()
end if
mzregx=true
End Function
'top
Function mztop(mzfty,mzfstr)
if mzfty>0 then mztop="<!doctype html>"
mztop=mztop&"<html><head>"
mztop=mztop&"<meta charset=""utf-8"">"
mztop=mztop&"<title>"&mzfstr&",账户中心,"&ew_bt&"</title>"
mztop=mztop&"<meta name=""keywords"" content="""&mzfstr&",账户中心,"&ew_zt&""">"
mztop=mztop&"<meta name=""description"" content="""&mzfstr&",账户中心,"&ew_nr&""">"
mztop=mztop&"<meta name=""copyright"" content="""&e_ubt&"[EESai.Com],"&ew_cp&""">"
mztop=mztop&"<meta name=""viewport"" content=""width=480""><meta http-equiv=""Cache-Control"" content=""no-cache""><meta name=""format-detection"" content=""telephone=no"">"
mztop=mztop&escss()
mztop=mztop&"</head>"
mztop=mztop&"<body>"
if mzfty>1 then
mztop=mztop&"<div class=""m-lr"">"
mztop=mztop&"<div class=""m-lro""><a href="""&ew_il&""" target=""_blank"" title="""&ew_is&"""><img src="""&eshref(ew_sk&"img/"&ew_ig&"",3)&""" alt="""&ew_is&"""></a></div>"

mztop=mztop&"<div class=""m-lrm"">"
mztop=mztop&"<a class=""m-lra"
if mzfty=10 then mztop=mztop&"x"
mztop=mztop&""" href=""?xy.html"">协议</a>"
mztop=mztop&"<a class=""m-lra"
if mzfty=20 then mztop=mztop&"x"
mztop=mztop&""" href="""&u_reg&""">注册</a>"
mztop=mztop&"<a class=""m-lra"
if mzfty=50 then mztop=mztop&"x"
mztop=mztop&""" href="""&u_login&""">登录</a>"
mztop=mztop&"<a class=""m-lra"
if mzfty=60 then mztop=mztop&"x"
mztop=mztop&""" href=""?email.html"">邮件</a>"
mztop=mztop&"<a class=""m-lra"
if mzfty=80 then mztop=mztop&"x"
mztop=mztop&""" href="""&u_exit&""">离开</a>"
mztop=mztop&"</div>"

mztop=mztop&"<div class=""m-lrc"">"
end if
End Function
'end
Function mzend(mzfty)
mzend=""
if mzfty>9 then
mzend=mzend&"</div></div>"
mzend=mzend&"<div class=""m-lre"">您当前IP：<a target=""_blank"" href=""http://ip.780.pub/?ip="&aiip()&""">"&aiip()&"</a>&nbsp;&nbsp;操作时间："&now()&"</div>"
end if
mzend=mzend&"</body></html>"
End Function
'user show
Sub mzshow()
%>
<%IF NOT ainull(e_uup) and e_uup<>"0" THEN%><tr><td class="m-lrl">标志头像：</td><td><%=replace(uspic(e_uup,e_ubt,e_ubt,e_uup,4),"<img","<img width=120")%></td></tr><%end if%>
<tr><td class="m-lrl">帐户：</td><td><b><%=e_uer%></b><%if not ainull(e_usj)  and e_usj<>"0" then%>（<%=s_ztyq%>账号：<%=e_usj%>）<%end if%></td></tr>
<%if not ainull(e_ubt)  and e_ubt<>"0" then%><tr><td class="m-lrl">名称：</td><td><%=e_ubt%></td></tr><%end if%>
<%if not ainull(e_uem) then%><tr><td class="m-lrl">电子邮箱：</td><td><%=e_uem%><%if aiint(e_uxy)=<aiint(ew_sh) then%>&nbsp;<a href="<%=eshref(s_druser&"?email/1"&g_urz,3)%>"><b>验证&gt;&gt;</b></a><%end if%></td></tr><%end if%>
<%if not ainull(e_udh) then%><tr><td class="m-lrl">电话：</td><td><%=e_udh%></td></tr><%end if%>
<tr><td class="m-lrl">血型：</td><td><%=aiarr(i_busax,"|",e_uax)%></td></tr>
<tr><td class="m-lrl">性别：</td><td><%=aiarr(i_busab,"|",e_uab)%></td></tr>
<tr><td class="m-lrl">婚姻：</td><td><%=aiarr(i_busah,"|",e_uah)%></td></tr>
<%if aiint(e_uas)>0 then%><tr><td class="m-lrl">生日：</td><td><%=aitm(8,e_uas)%></td></tr><%end if%>
<tr><td class="m-lrl">故乡：</td><td><%=e_uca%></td></tr>
<tr><td class="m-lrl">现居城市：</td><td><%=e_uct%></td></tr>
<tr><td class="m-lrl">单位：</td><td><%=e_uad%></td></tr>
<tr><td class="m-lrl">职业：</td><td><%=e_uaz%></td></tr>
<tr><td class="m-lrl">收入：</td><td><%=e_uar%>（万元/年）</td></tr>
<tr><td class="m-lrl">账户状态：</td><td><%=aiarr(i_bxy,"|",e_uxy)%></td></tr>
<tr><td class="m-lrl">身份认证：</td><td><%=aiarr(i_buszy,"|",e_uzy)%></td></tr>
<tr><td class="m-lrl">其他信息：</td><td>被看了<b><%=e_uhi%></b>次</td></tr>
<tr><td class="m-lrl"></td><td>积攒了金币<b><%=e_ujb%></b> 经验<b><%=e_ujy%></b></td></tr>
<%if ewxgn("ua") then%>
<tr><td class="m-lrl"></td><td>被喜欢<b><%=e_uxi%></b>次(^_^) 被讨厌<b><%=e_uxo%></b>次(-_-)</td></tr>
<tr><td class="m-lrl"></td><td>拥有金钱<b><%=e_ujq%></b></td></tr>
<%end if%>
<%
End Sub
if userx=0 and not aibj(g_u0,"qqlogin") and not aibj(g_u0,"login") and not aibj(g_u0,"xy") and not aibj(g_u0,"exit") and not aibj(g_u0,"reg") and not aibj(g_u0,"email") then
Response.Write aigo("",eshref(s_druser&"?login.html",3))
'---------------------------xy
elseif aibj(g_u0,"xy") then
%><%=mztop(10,"注册协议")%>
<p>一、总则</p>
<p>1.1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"同意"按钮即表示用户与<%=ew_mc%>达成协议，完全接受本协议项下的全部条款。</p>
<p>1.2　用户注册成功后，<%=ew_mc%>将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。</p>
<p>1.3　用户可以使用<%=ew_mc%>各个频道单项服务，当用户使用<%=ew_mc%>各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及<%=ew_mc%>在该单项服务中发出的各类公告的同意。</p>
<p>1.4　<%=ew_mc%>会员服务协议以及各个频道单项服务条款和公告可由<%=ew_mc%>随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。您在使用<%=ew_mc%>提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消<%=ew_mc%>提供的服务；您一旦使用<%=ew_mc%>服务，即视为您已了解并完全同意本服务协议各项内容，包括<%=ew_mc%>对服务协议随时所做的任何修改，并成为<%=ew_mc%>用户。</p>
<p>二、注册信息和隐私保护</p>
<p>2.1　<%=ew_mc%>帐号（即<%=ew_mc%>用户ID）的所有权归<%=ew_mc%>，用户完成注册申请手续后，获得<%=ew_mc%>帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，<%=ew_mc%>不负任何责任。</p>
<p>2.2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知<%=ew_mc%>。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，<%=ew_mc%>不承担任何责任。</p>
<p>2.3　<%=ew_mc%>不对外公开或向第三方提供单个用户的注册资料，除非：</p>
<p>• 事先获得用户的明确授权；</p>
<p>• 只有透露您的个人资料，才能提供您所要求的产品和服务；</p>
<p>• 根据有关的法律法规要求；</p>
<p>• 按照相关政府主管部门的要求；</p>
<p>• 为维护<%=ew_mc%>的合法权益。</p>

<p>2.4　在您注册<%=ew_mc%>账户，使用其他<%=ew_mc%>产品或服务，访问<%=ew_mc%>网页, 或参加促销和有奖游戏时，<%=ew_mc%>会收集您的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。</p>
<p>三、使用规则</p>
<p>3.1　用户在使用<%=ew_mc%>服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶</p>
<p>上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：</p>
<p>不得为任何非法目的而使用网络服务系统</p>
<p>不利用<%=ew_mc%>服务从事以下活动：</p>
<p>未经允许，进入计算机信息网络或者使用计算机信息网络资源的；</p>
<p>未经允许，对计算机信息网络功能进行删除、修改或者增加的；</p>
<p>未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；</p>
<p>故意制作、传播计算机病毒等破坏性程序的；</p>
<p>其他危害计算机信息网络安全的行为。</p>

<p>3.2　用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿<%=ew_mc%>与合作公司、关联公司，并使之免受损害。对此，<%=ew_mc%>有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收<%=ew_mc%>帐号、追究法律责任等措施。对恶意注册<%=ew_mc%>帐号或利用<%=ew_mc%>帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，<%=ew_mc%>有权回收其帐号。同时，<%=ew_mc%>会视司法部门的要求，协助调查。</p>
<p>3.3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。</p>
<p>3.4　用户须对自己在使用<%=ew_mc%>服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在<%=ew_mc%>首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予<%=ew_mc%>等额的赔偿。</p>
<p>四、服务内容</p>
<p>4.1　<%=ew_mc%>网络服务的具体内容由<%=ew_mc%>根据实际情况提供。</p>
<p>4.2　除非本服务协议另有其它明示规定，<%=ew_mc%>所推出的新产品、新功能、新服务，均受到本服务协议之规范。</p>
<p>4.3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。</p>
<p>4.4　鉴于网络服务的特殊性，用户同意<%=ew_mc%>有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。<%=ew_mc%>不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。</p>
<p>4.5　<%=ew_mc%>需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，<%=ew_mc%>无需为此承担任何责任。<%=ew_mc%>保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。</p>
<p>4.6　本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于<%=ew_mc%>无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，<%=ew_mc%>不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，<%=ew_mc%>亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、商品或服务所产生的任何损害或损失，<%=ew_mc%>不承担任何责任。</p>
<p>4.7　用户明确同意其使用<%=ew_mc%>网络服务所存在的风险将完全由其自己承担。用户理解并接受下载或通过<%=ew_mc%>服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。<%=ew_mc%>对在服务网上得到的任何商品购物服务、交易进程、招聘信息，都不作担保。</p>
<p>4.8　6个月未登录的帐号，<%=ew_mc%>保留关闭的权利。</p>
<p>4.9　<%=ew_mc%>有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，<%=ew_mc%>对用户和任何第三人均无需承担任何责任。</p>
<p>4.10　终止服务</p>
<p>您同意<%=ew_mc%>得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或<%=ew_mc%>认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并同意，<%=ew_mc%>可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您的帐号及相关信息和文件被关闭或删除，<%=ew_mc%>对您或任何第三人均不承担任何责任。</p>
<p>五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）</p>
<p>5.1　用户专属权利</p>
<p><%=ew_mc%>尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向<%=ew_mc%>提供资料∶</p>
<p>请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，<%=ew_mc%>建议该个人或单位首先咨询专业人士。</p>
<p>为了<%=ew_mc%>有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：</p>
<p>• 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明。</p>
<p>• 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。</p>
<p>• 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。</p>
<p>• 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。</p>
<p>• 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。</p>
<p>• 请在权利通知中加入如下关于通知内容真实性的声明： "我保证，本通知中所述信息是充分、真实、准确的，如果本权利通知内容不完全属实，本人将承担由此产生的一切法律责任。"</p>
<p>• 请您签署该文件，如果您是依法成立的机构或组织，请您加盖公章。</p>
<p>请您把以上资料和联络方式书面发往以下地址：　　</p>
<p><%=ew_lz%></p>
<p><%=ew_mc%>　会员服务部</p>
<p>邮政编码：<%=ew_lb%></p>

<p>5.2　对于用户通过<%=ew_mc%>服务（包括但不限于贴吧、知道、MP3、影视等）上传到<%=ew_mc%>网站上可公开获取区域的任何内容，用户同意<%=ew_mc%>在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），或将此等内容编入当前已知的或以后开发的其他任何形式的作品、媒体或技术中。</p>
<p>5.3　<%=ew_mc%>拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：</p>
<p>• 所有的资料和图象均不得用于商业目的；</p>
<p>• 所有的资料、图象及其任何部分都必须包括此版权声明；</p>
<p>• 本网站（<%=e_tur%>）所有的产品、技术与所有程序均属于<%=ew_mc%>知识产权，在此并未授权。</p>
<p>• <%=ew_mc%>及相关图形等为<%=ew_mc%>的注册商标。</p>
<p>• 未经<%=ew_mc%>许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，<%=ew_mc%>将依法追究法律责任。</p>

<p>六、青少年用户特别提示</p>
<p>青少年用户必须遵守全国青少年网络文明公约：</p>
<p>要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。</p>
<p>七、其他</p>
<p>7.1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。</p>
<p>7.2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向<%=ew_mc%>所在地的人民法院提起诉讼。</p>
<p>7.3　<%=ew_mc%>未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。</p>
<p>7.4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</p>
<p>请您在发现任何违反本服务协议以及其他任何单项服务的服务条款、<%=ew_mc%>各类公告之情形时，通知<%=ew_mc%>。您可以通过如下联络方式同<%=ew_mc%>联系∶</p>
<p><%=ew_lz%></p>
<p><%=ew_mc%>　会员服务部</p>
<p>邮政编码：<%=ew_lb%></p>
<%=mzend(10)%>
<%
'---------------------------reg
elseif aibj(g_u0,"reg") then
%><%=mztop(20,"注册新账户")%>
<%
dim zzcxx,zer,zmm,zmm1,zem,zbt,zdh,zyzins
if aireq("er")<>"" then
zer=aireq("er")
zmm=aireq("mm")
zmm1=aireq("mm1")
zem=aireq("em")
zbt=aireq("bt")
zdh=aireq("dh")
us_ax=aireq("ax")
us_ah=aireq("ah")
us_ab=aireq("ab")
us_as=aiint(aireq("as"))
response.Cookies(w_sn&"zcxx")=zer&"|"&zmm&"|"&zmm1&"|"&zem&"|"&zbt&"|"&zdh&"|"&us_ax&"|"&us_ah&"|"&us_ab&"|"&us_as
else
if request.Cookies(w_sn&"zcxx")<>"" then
zzcxx=split(request.Cookies(w_sn&"zcxx")&"|||||||||||||||","|")
zer=zzcxx(0)
zmm=zzcxx(1)
zmm1=zzcxx(2)
zem=zzcxx(3)
zbt=zzcxx(4)
zdh=zzcxx(5)
us_ax=zzcxx(6)
us_ah=zzcxx(7)
us_ab=zzcxx(8)
us_as=zzcxx(9)
end if
end if
zyzins="er,mm,mm1,ax,ah,ab"
if esky(1,0) and aireqx(zyzins) then
if mzregx() then
dim rszhz,rsmmz
rszhz=Left(Request.Form("er"),50)
rsmmz=aimm(g_gmm,Left(Request.Form("mm"),50),0)
if ew_sh=0 then
uswhere=" where us_er='"&rszhz&"' or us_em='"&Left(Request.Form("em"),100)&"'"
else
uswhere=" where us_er='"&rszhz&"'"
end if
Call saik(rs,"select * from "&usbiao&uswhere,1,3)
if rs.recordcount=0 then
rs.addnew
rs("us_er")=rszhz
rs("us_mm")=rsmmz
rs("us_ax")=us_ax
rs("us_ah")=us_ah
rs("us_ab")=us_ab
rs("us_as")=us_as
rs("us_em")=zem
rs("us_bt")=zbt
rs("us_dh")=zdh

rs("us_ef")=aireq("ef")
rs("us_ca")=aireq("ca")
rs("us_ct")=aireq("ct")
rs("us_ar")=aireq("ar")
rs("us_ad")=aireq("ad")
rs("us_az")=aireq("az")
if us_zs<>"" and us_zs<>"0" then
rs("us_zy")=2
rs("us_zs")=aireq("zs")
end if
rs("us_sj")=aireq("sj")
rs("us_ss")=aireq("ss")
rs("us_ff")=aireq("ff")
rs("us_qm")=aireq("qm")

rs("us_tm")=aitm(3,now())
rs("us_t1")=0
rs("us_t2")=0
rs("us_ip")=aiip()
rs("us_xy")=ew_sh
rs("us_hi")=0
rs("us_xi")=0
rs("us_xo")=0
rs("us_jq")=0
rs("us_jb")=i_jcjb
rs("us_jy")=i_jcjy
rs.update
Call saig(rs)

'Response.Write usein(11,rszhz,rsmmz)

if gysread(uslie("login"),usbiao,"us_er='"&rszhz&"'","") then Call icuser(3)

Response.Write aitiao("恭喜您,注册成功.",u_user,i_nmtz)
'if i_xkuhy>0 and i_xkuhj=1 then
'if gysat("us_ux",usbiao,"us_er='"&ew_kf&"'","+1") then'提醒客服有新的注册信息
'Call gysin(uxbiao,"ux_co,ux_us,ux_u1,ux_y1","'<a href=/?"&s_umgl&g_urg&s_udus&"/>欢迎"&rszhz&"加入"&ew_mc&"！</a>','"&rszhz&"','"&ew_kf&"',1","")
'end if
'end if


else
Response.Write aitiao("对不起,已存在相同的信息,请重新再来.",u_reg,i_nmtz+1)
end if
end if
else
%>
<table class="table-hover">
<form id="AsaiForm" name="AsaiForm" action="" method="post">
<tr><td class="m-lrl">帐户：</td><td><%=aibutian(2)%><%=aiinput("","er","",66,50,"*请输入帐户，限英文与数字。","f-ua",zer)%><span id="m-ler" class="m-lrs">*</span></td></tr>
<tr><td class="m-lrl">密码：</td><td><%=aiinput("password","mm","",3,50,"*请输入密码，限英文与数字。","f-ua",zmm)%><span id="m-lmm" class="m-lrs">*</span></td></tr>
<tr><td class="m-lrl">再次输入密码：</td><td><%=aiinput("password","mm1","",3,50,"*请再次输入密码，限英文与数字。","f-ua",zmm1)%><span id="m-lmm1" class="m-lrs">*</span></td></tr>
<tr><td class="m-lrl">性别：</td><td><%=aiselect("ab","","","f-sa",us_ab,0,i_busab)%><span id="m-lmm" class="m-lrs">*</span></td></td></tr>
<tr><td class="m-lrl">婚姻：</td><td><%=aiselect("ah","","","f-sa",us_ah,0,i_busah)%><span id="m-lmm" class="m-lrs">*</span></td></td></tr>
<tr><td class="m-lrl">血型：</td><td><%=aiselect("ax","","","f-sa",us_ax,0,i_busax)%><span id="m-lmm" class="m-lrs">*</span></td></td></tr>
<tr><td class="m-lrl">生日：</td><td><input type="hidden" name="as" value="<%=us_as%>" required><input type="date" class="f-u" id="asx" name="asx" onChange="as.value=this.value.replace(/-/g,'');" placeholder="" value=""></td></tr>
<tr><td class="m-lrl">电话：</td><td><%=aiinput("","dh","",7,50,"请输入您常用电话号码，限电话。","f-u",zdh)%></td></tr>
<tr><td class="m-lrl">电子邮箱：</td><td><%=aiinput("","em","",8,200,"请输入您常用的email地址。","f-u",zem)%></td></tr>
<tr><td class="m-lrl">称呼：</td><td><%=aiinput("","bt","",77,200,"请输入个人称呼或单位名称。","f-u",zbt)%></td></tr>
<tr><td class="m-lrl">注意：</td><td>以上带<span class="m-lrs">*</span>为必填项　<input type="checkbox" id="more" name="more" value="1" onClick="if (this.checked){document.getElementById('easmid').style.display='';}else{document.getElementById('easmid').style.display='none';}"> <label for="more"> 更多选填项</label></td></tr>
<tbody id="easmid" style="display:none;">
<tr><td class="m-lrl">分类：</td><td><%=efselect(0,i_xkfl,"ef",s_udus,us_ef)%></td></td></tr>
<tr><td class="m-lrl">故乡：</td><td><%=aiinput("","ca","",77,200,"请输入老家（故乡）城市。","f-u",us_ca)%></td></tr>
<tr><td class="m-lrl">城市：</td><td><%=aiinput("","ct","",77,200,"请输入现居城市名称。","f-u",us_ct)%></td></tr>
<tr><td class="m-lrl">单位：</td><td><%=aiinput("","ad","",77,200,"请输入工作单位。","f-u",us_ad)%></td></tr>
<tr><td class="m-lrl">职业：</td><td><%=aiinput("","az","",77,200,"请输入当前职业。","f-u",us_az)%></td></tr>
<tr><td class="m-lrl">收入：</td><td><%=aiinput("number","ar","",77,200,"请输入个人年收入（万元/年）。","f-u",us_ar)%></td></tr>
<tr><td class="m-lrl">身份认证号码：</td><td><%=aiinput("","zs","",0,50,"","f-u",us_zs)%></td></td></tr>
<tr><td class="m-lrl">经纪人：</td><td><%=aiinput("","sj","",0,200,"","f-u",us_sj)%></td></td></tr>
<tr><td class="m-lrl">个人简介：</td><td><%=aiinput("","ss","",0,200,"","f-u",us_ss)%></td></td></tr>
<tr><td class="m-lrl">个人技能：</td><td><%=aiinput("","ff","",0,200,"","f-u",us_ff)%></td></td></tr>
<tr><td class="m-lrl">个性签名：</td><td><%=aiinput("","qm","",0,200,"","f-u",us_qm)%></td></td></tr>
</tbody>
<tr<%if ew_yz=0 or e_uxy>i_xkyz or aiint(e_uzy)>i_xkyz then%> style="display:none;"<%end if%>><td class="m-lrl">计算验证：</td><td><%=replace(eskyx(0,0,0),"验证：","")%></td></tr>
<tr><td class="m-lrl">注册协议：</td><td><input type="checkbox" id="zy" name="zy" value="1" onClick="if (this.checked){document.getElementById('eeszc').disabled=false;}else{document.getElementById('eeszc').disabled=ture;}"><label for="zy"><a target="_blank" href=?xy.html><b>《注册协议》</b></a>单击选中,表示已阅读并同意.</label></td></tr>
<tr><td class="m-lrl"></td><td><input disabled="true" type="submit" name="eeszc" id="eeszc" class="f-sb f-skx" value="注册新账户"><a href="<%=u_login%>">账户登录&gt;&gt;</a></td></tr>
</form>
</table>
<script language="JavaScript">var eesaialtsx=<%=aiint(ep_sx)%>;</script><script language="JavaScript" charset="utf-8" src="<%=w_asai%>AsaiSkin/js/alt.js"></script>
<%end if%>
<%=mzend(20)%>
<%
'---------------------------login
elseif aibj(g_u0,"login") then
%><%=mztop(50,"账户中心登录入口")%>
<%
if esky(1,0) and aireqx("er,mm") then
dim rszh,rsmm
rszh=Left(Request.Form("er"),50)
rsmm=aimm(g_gmm,Left(Request.Form("mm"),50),0)
response.Write usein(0,rszh,rsmm)
else
%>
<table width="100%" border="0" cellpadding="2" cellspacing="5">
<%if aiint(e_uid)>0 then%>
<%Call mzshow()%>
<tr><td class="m-lrl"></td><td><a href="<%=u_user%>" class="f-sb f-skx b-cfb" target="_top">进入账户中心</a> 
<a href="<%=u_exit%>" class="f-sb f-skx b-cfb" target="_top">退出登录</a></td></tr>
<%else%>
<form id="AsaiForm" name="AsaiForm" action="" method="post">
<tr><td class="m-lrl">帐户：</td><td><%=aiinput("","er","",66,50,"*请输入帐户，限英文与数字。","f-ua","")%><span class="m-lrs">*</span></td></tr>
<tr><td class="m-lrl">密码：</td><td><%=aiinput("password","mm","",3,50,"*请输入密码，限英文与数字。","f-ua","")%><span class="m-lrs">*</span></td></tr>
<tr<%if ew_yz=0 or e_uxy>i_xkyz or aiint(e_uzy)>i_xkyz then%> style="display:none;"<%end if%>><td class="m-lrl">计算验证：</td><td><%=replace(eskyx(0,0,0),"验证：","")%></td></tr>
<tr><td class="m-lrl"></td><td><%=aibutton(2,"","","f-sb f-skx","账户登录")%><a href="<%=u_reg%>">注册新账户&gt;&gt;</a> <a href="<%=eshref(s_druser&"?email/3"&g_urz,3)%>">找回账户信息&gt;&gt;</a></td></tr>
</form>
<script language="JavaScript">var eesaialtsx=<%=aiint(ep_sx)%>;</script><script language="JavaScript" charset="utf-8" src="<%=w_asai%>AsaiSkin/js/alt.js"></script>
<%end if%>
</table>
<%end if%>
<%=mzend(50)%>
<%
'---------------------------email
elseif aibj(g_u0,"email") then
if aibj(g_u2,s_umfb) then%>
<%=mztop(1,"在线发邮件")%>
<p class="tc b-cf">在线发邮件</p>
<div style="display:none;"><%=aiiframe("about:blank","mnkfrm","0","0")%></div><%=replace(usemail(),"action="""" method=""post""","action="""&g_u&""" method=""post"" target=""mnkfrm""")%>
<%
elseif aibj(g_u1,"3") then%>
<%=mztop(60,"邮箱找回账户")%>
<%
if esky(1,e_uzy) and aireqx("email") then
dim usdems
if instr(aireq("email"),"@")>0 and instr(aireq("email"),".")>0 and len(aireq("email"))>6 and len(aireq("email"))<196 then
Call saik(rs,"select us_er,us_mm,us_em,us_sb from "&usbiao&" where us_em='"&aireq("email")&"'",1,3)
if rs.recordcount=1 then

us_sb=aiint(rs("us_sb"))
us_er=rs("us_er")

usdems="<p>账户：<b>"&rs("us_er")&"</b></p><p>密码：<b>"&aimm(g_gmm,rs("us_mm"),1)&"</b></p>"
rs.update
Response.Write aitiao(aiemail(g_emkg,g_emci,g_emrp,aireq("email"),"","","",ew_mc&"的账户与密码信息",1,""&usdems&"<p>以上是您找回的账户与密码信息。</p><p><a href=http://"&g_uhost&">"&ew_mc&"　http://"&g_uhost&"</a></p>","","<p>账户与密码信息已发送，请注意查收。</p>"),u_login,i_nmtz)
else
Response.Write aitiao("对不起，该邮箱的注册信息获取失败。",eshref(s_druser&"?email/3"&g_urz,3),i_nmtz+1)
end if
Call saig(rs)
if us_sb>0 then Call gysgx(usbiao&"_"&us_sb,"us_xt=us_xt"&espdbi()&"'"&espxx("找回密码"&i_gg&aiip())&"'","us_er='"&us_er&"'")
else
Response.Write aitiao("对不起，邮箱格式不正确。",eshref(s_druser&"?email/3"&g_urz,3),i_nmtz+1)
end if
else
%>
<table width="100%" border="0" cellpadding="2" cellspacing="5">
<form id="AsaiForm" name="AsaiForm" action="" method="post">
<tr><td class="m-lrl">您的邮箱：</td><td><%=aiinput("","email","",8,200,"*请输入您账户使用的邮箱","f-ua","")%></td></tr>
<tr<%if ew_yz=0 or e_uxy>i_xkyz or aiint(e_uzy)>i_xkyz then%> style="display:none;"<%end if%>><td class="m-lrl">计算验证：</td><td><%=replace(eskyx(0,0,0),"验证：","")%></td></tr>
<tr><td class="m-lrl"></td><td><%=aibutton(2,"","","f-sb f-skx","账户信息发送到邮箱")%></td></tr>
</form>
</table>
<%end if
else
'---------------------------email-0
if aiint(e_uid)=0 then%>
<%=mztop(60,"需要登录账户")%>
<%Response.Write aitiao("请您先登录账户.",u_login,i_nmtz+1)
'---------------------------email-1
elseif e_uxy>ew_sh and (aibj(g_u1,"0") or aibj(g_u1,"1")) then%>
<%=mztop(60,"电子邮箱认证")%>
<%Response.Write aitiao("您当前无需进行电子邮箱认证。",u_user,i_nmtz+1)
'---------------------------email-w
elseif aibj(g_u1,"0") or instr(e_uem,"@")=0 or instr(e_uem,".")=0 or len(e_uem)<7 then
%>
<%=mztop(60,"完善邮箱信息")%>
<%if esky(1,e_uzy) and aireqx("email") then
if instr(aireq("email"),"@")>0 and instr(aireq("email"),".")>0 and len(aireq("email"))>6 and len(aireq("email"))<196 then
if gyscc("us_id",usbiao,"us_em='"&aireq("email")&"'") then
Response.Write aitiao("对不起，邮箱已存在。",eshref(s_druser&"?email/0"&g_urz,3),i_nmtz+1)
else
Call gysgx(usbiao,"us_em='"&aireq("email")&"'","us_id="&e_uid&"")
Call usergx(0,"em",aireq("email"))
Response.Write aitiao("恭喜您，邮箱信息修改成功，即将进入邮箱验证页。",eshref(s_druser&"?email/1"&g_urz,3),i_nmtz)
end if
else
Response.Write aitiao("对不起，邮箱格式不符合要求。",eshref(s_druser&"?email/0"&g_urz,3),i_nmtz+1)
end if
else
%>
<table width="100%" border="0" cellpadding="2" cellspacing="5">
<form id="AsaiForm" name="AsaiForm" action="" method="post">
<tr><td class="m-lrl">您的邮箱：</td><td><%=aiinput("","email","",8,200,"*请输入您常用的邮箱","f-ua",e_uem)%></td></tr>
<tr<%if ew_yz=0 or e_uxy>i_xkyz or aiint(e_uzy)>i_xkyz then%> style="display:none;"<%end if%>><td class="m-lrl">计算验证：</td><td><%=replace(eskyx(0,0,0),"验证：","")%></td></tr>
<tr><td class="m-lrl"></td><td><%=aibutton(2,"","","f-sb f-skx","确认邮箱")%><a href="<%=eshref(s_druser&"?email/1"&g_urz,3)%>">验证电子邮箱&gt;&gt;</a></td></tr>
</form>
</table>
<%end if%>
<%
'---------------------------email-1
elseif aibj(g_u1,"1") then%>
<%=mztop(60,"验证电子邮箱")%>
<%
dim mzdyzur,mzdyz
mzdyz=Request.Cookies(g_emck&e_uid)
mzdyzur=split(e_uem&"@","@")(1)
if len(mzdyzur)<5 then
Response.Write aitiao("您需要完善您的电子邮箱信息。",eshref(s_druser&"?email/0"&g_urz,3),i_nmtz+1)
else
mzdyzur="mail."&mzdyzur
if esky(1,e_uzy) and aireqx("yz") then
if lcase(mzdyz)=lcase(request("yz")) and mzdyz<>"" then
Call saik(rs,"select us_sb,us_xy,us_jb from "&usbiao&" where us_id="&e_uid&"",1,3)
if rs.eof and rs.bof then
else
rs("us_xy")=ew_sh+1
rs("us_jb")=rs("us_jb")+i_jlzc

us_sb=aiint(rs("us_sb"))
if us_sb>0 then Call gysgx(usbiao&"_"&us_sb,"us_xt=us_xt"&espdbi()&"'"&espxx("验证电邮"&i_gg&e_uer)&"'","us_er='"&e_uer&"'")

rs.update
Call usergx(0,"xy",ew_sh+1)
if not ainull(e_usj) and e_usj<>"0" then Call gysat("us_jb",usbiao,"us_er="&e_usj&" or us_er="&e_uer&"","+"&i_jlyq)
Response.Write aitiao("恭喜您，电子邮箱已经验证成功。",eshref(s_druser&"?login.html",3),i_nmtz)
end if
Call saig(rs)
else
Response.Write aitiao("对不起，验证密钥填写有误！请重新登录邮箱确认。",eshref(s_druser&"?email/1"&g_urz,3),i_nmtz+1)
end if
else
%>
<table width="100%" border="0" cellpadding="2" cellspacing="5">
<form id="AsaiForm" name="AsaiForm" action="" method="post">
<tr><td class="m-lrl">电子邮箱：</td><td><b><%=e_uem%></b></td></tr>
<tr><td class="m-lrl"></td><td><%
if ainull(mzdyz) then
mzdyz=right(aisn(1),6)
Response.Cookies(g_emck&e_uid)=mzdyz
Call aisn(0)

end if
if g_u6="mm" then%>您的验证码：<%=mzdyz%><%else%><%=aiemail(g_emkg,g_emci,g_emrp,e_uem,"","","",ew_mc&"的验证码",1,"您的验证码：<b>"&mzdyz&"</b><p>该验证码用来验证注册邮箱的真实性。</p><p><a href=http://"&g_uhost&">"&ew_mc&"　http://"&g_uhost&"</a></p>","","<p>验证码已发送，请注意查收。</p>")%><%end if%></td></tr>
<tr><td class="m-lrl">验证密钥：</td><td><%=aiinput("","yz","",0,200,"*请输入您邮箱中收到的验证密钥","f-ua","")%><a target="_blank" href="http://<%=mzdyzur%>">登录邮箱</a></td></tr>
<tr<%if ew_yz=0 or e_uxy>i_xkyz or aiint(e_uzy)>i_xkyz then%> style="display:none;"<%end if%>><td class="m-lrl">计算验证：</td><td><%=replace(eskyx(0,0,0),"验证：","")%></td></tr>
<tr><td class="m-lrl"></td><td><%=aibutton(2,"","","f-sb f-skx","验证电子邮箱")%><a href="<%=eshref(s_druser&"?email/0"&g_urz,3)%>">修改电子邮箱&gt;&gt;</a></td></tr>
</form>
</table>
<%end if
end if%>
<%
'---------------------------email
elseif e_uxy>ew_sh then%>
<%if aibj(g_u2,"asai") then%>
<%=mztop(0,"会员在线发送邮件")%>
<%else%>
<%=mztop(60,"会员在线发送邮件")%>
<%end if
Response.Write usemail()
else%>
<%=mztop(60,"需要验证电子邮箱")%>
<%Response.Write aitiao("请您先验证电子邮箱.",eshref(s_druser&"?email/1"&g_urz,3),i_nmtz+1)
end if
end if
if aibj(g_u2,"asai") or aibj(g_u2,s_umfb) then%>
<%=mzend(0)%>
<%else%>
<%=mzend(60)%>
<%end if
'---------------------------exit
elseif aibj(g_u0,"exit") then
%><%=mztop(80,"退出账户")%>
<%
Call icuser(0)
Response.Write aitiao("账户退出"&s_ztcg,e_tug,i_nmtz)
%>
<%=mzend(80)%>
<%
'refresh cookies
elseif aibj(g_u0,"EESai") then%>
<%=mztop(0,"更新本地账户缓存")%><body>
<%=icuser(1)%><%=mzend(0)%><%
elseif aibj(g_u0,s_umgl) and aibj(g_u1,"usermenu") then
%>
<%=mztop(1,"账户后台左侧导航")%>
<script id="AsaiReload" language="javascript"></script>
<script language="javascript">
function AsaiKeepSession(){
document.all["AsaiReload"].src="<%=eshref("EESai"&g_urz,2)%>";
window.setTimeout("AsaiKeepSession()",10000);}
AsaiKeepSession();
</script>
<SCRIPT language=javascript1.2>
function showAsaiMenu(sid)
{if(document.getElementById("AsaiMenu"+sid).style.display=="none"){document.getElementById("AsaiMenu"+sid).style.display=""}
else{document.getElementById("AsaiMenu"+sid).style.display="none"}}
</SCRIPT>
<div class="gys1">
<div class="m-mu">
<h3 onClick="showAsaiMenu(0)"><%=ew_mc%></h3>
<ul id='AsaiMenu0'>
<li><a href="<%=e_tug%>" class="m-ma" target="_blank">网站首页</a> <a href="<%=eshref(s_druser,3)%>" class="m-ma" target="_top">会员后台</a></li>
<%if aiint(e_gdj)>2 then%><li><a href="<%=e_aadmin%>" class="m-max" target="_top">进入网站管理后台</a></li><%end if%>
</ul>
</div>
</div>

<div class="gys2">
<div class="m-mu">
<h3 onClick="showAsaiMenu(888)">我的信息</h3>
<ul id='AsaiMenu888'>
<li><a href="<%=eshref(s_udus&g_urg&s_umzs&g_urz,66)%>" class="m-max" target="AMF" title="<%=e_uer%> <%=e_ubt%>"><%if ainull(e_ubt) then%><%=e_uer%><%else%><%if len(e_ubt)>8 then%><marquee direction="left" behavior="alternate" scrollamount="5" loop="-1"><%=e_ubt%></marquee><%else%><%=e_ubt%><%end if%><%end if%></a></li>
<li><a href="<%=eshref(s_udus&g_urg&s_umxg&g_urz,66)%>" class="m-ma" target="AMF">[更新资料]</a><a href="<%=u_exit%>" class="m-ma" target="_top">[退出]</a></li>
<%if ew_sh=0 then%>
<li><%if aiint(e_uxy)=<aiint(ew_sh) then%><a href="<%=eshref(s_druser&"?email/1"&g_urz,3)%>" class="m-ma" target="AMF"><b>第一步：邮箱验证</b></a><%elseif e_uzy<2 then%><a href="<%=eshref(s_udus&g_urg&s_umxg&g_urz,66)%>" class="m-ma" target="AMF"><b>第二步：身份认证</b></a><%else%><a href="<%=eshref(s_udus&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"12"&g_urg&g_urg&e_uer&g_urz,66)%>" class="m-ma" target="AMF">我的<%=s_ztyq%></a> <a href="<%=eshref(s_udus&g_urg&s_umtj&g_urz,66)%>" class="m-ma" target="AMF"><%=s_ztyq&s_uduss%></a><%end if%></li>
<%end if%>
</ul>
</div>
</div>

<%if ewxgn("uk") then
if e_uzy>1 then
Call gysread(uklie("all"),ukbiao,"uk_us='"&aistr(e_uer)&"' and "&esrew("uk",ew_sn)&"","")%>
<div class="m-mu">
<h3 onClick="showAsaiMenu(22)">空间管理</h3>
<ul id='AsaiMenu22'>
<li><a href="<%=eshref(s_uduk&g_urg&s_umxg&g_urz,66)%>" class="m-max" target="AMF">更新<%=s_uduks%>资料</a><%
if aiint(uk_id)>0 then
%><a href="<%=eshrej("",uk_ur,"",66)%>" class="m-ma" target="AMF">访问</a></li>
<li><a href="<%=eshref(s_umgl&g_urg&s_uduk&g_urg&uk_ur&g_urg&s_umqb&g_urg&s_udef&g_urg&s_umtj&g_urz,66)%>" class="m-ma" target="AMF">编辑<%=s_uduks%>频道与目录</a></li>
<%=ukxfl(13,s_umqb,uk_fl,e_uer,"")%>
<%else
%></li><%
end if%>
</ul>
</div>
<%end if
end if%>

<%if e_uxy>0 then%>
<%if ewxgn("uu") and ewxgn("un") then%>
<div class="m-mu">
<h3 onClick="showAsaiMenu(77)">我的社交</h3>
<ul id='AsaiMenu77'>
<li><a href="<%=eshref(s_uduu&g_urz,66)%>" class="m-ma" target="AMF"><%=s_uduus%>管理</a><a href="<%=eshref(s_udus&g_urg&s_umqb&g_urg&d_susls&g_urz,66)%>" class="m-ma" target="AMF">寻找<%=s_uduus%></a></li>
<li><a href="<%=eshref(s_udun&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"3"&g_urz,66)%>" class="m-ma" target="AMF">有我<%=s_uduns%></a><a href="<%=eshref(s_udun&g_urz,66)%>" class="m-ma" target="AMF">寻找<%=s_uduns%></a></li>
<li><a href="<%=eshref(s_udun&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&g_urg&"1"&g_urz,66)%>" class="m-ma" target="AMF">我的<%=s_uduns%></a><a href="<%=eshref(s_udun&g_urg&g_urg&s_umtj&g_urz,66)%>" class="m-ma" target="AMF">添加<%=s_uduns%></a></li>
</ul>
</div>
<%end if%>

<div class="m-mu">
<h3 onClick="showAsaiMenu(2)">我的权限</h3>
<ul style="display:block" id='AsaiMenu2'>
<%if i_xkadd>0 then%>
<li><a href="<%=eshref(s_uduy&g_urz,66)%>" class="m-max" target="AMF">管理我的<%=s_uduys%></a></li>
<%if ewxgn("uh") then%><li><a href="<%=eshref(s_uduq&g_urg&s_umlb&g_urz,66)%>" class="m-ma" target="AMF">我的<%=s_uduqs%></a><a href="<%=eshref(s_uduh&g_urg&s_umlb&g_urz,66)%>" class="m-ma" target="AMF">最新<%=s_uduhs%></a></li><%end if%>
<%end if%>
<%if ewxgn("ux") then%><li><a href="<%=eshref(s_udux&g_urg&s_umlb&g_urz,66)%>" class="m-ma" target="AMF">我的<%=s_uduxs%></a><a href="<%=eshref(s_udux&g_urg&s_umtj&g_urz,66)%>" class="m-max" target="AMF">发送<%=s_uduxs%></a></li><%end if%>
<%if ewxgn("uj") then%><li><a href="<%=eshref(s_uduj&g_urz,66)%>" class="m-ma" target="AMF"><%=s_udujs&s_umlbs%></a><a href="<%=eshref(s_uduj&g_urg&s_umtj&g_urz,66)%>" class="m-ma" target="AMF"><%=s_umtjs&s_udujs%></a></li><%end if%>
<%if ewxgn("ey") then%><li><a href="<%=eshref(s_udey&g_urg&"0"&g_urg&s_umlb&g_urz,1)%>" class="m-ma" target="AMF">留言列表</a><a href="<%=eshref(s_udey&g_urg&"2"&g_urg&s_umtj&g_urz,1)%>" class="m-ma" target="AMF">留言反馈</a></li><%end if%>
<%if i_xkqj>0 and i_xksj>0 and ewxgn("eq") and ewxgn("ek") then%><li><a href="<%=eshref(s_udeq&g_urg&s_umlb&g_urz,66)%>" class="m-ma" target="AMF"><%=s_udeqs&s_umlbs%></a><a href="<%=eshref(s_udek&g_urg&s_umlb&g_urz,66)%>" class="m-ma" target="AMF"><%=s_udeks&s_umlbs%></a></li><%end if%>
<li><a href="<%=eshref(s_udef&g_urg&s_udus&g_urg&s_umds&"-m1"&g_urz,66)%>" class="m-ma" target="AMF"><%=s_uduss&s_udefs%></a><a href="<%=eshref(s_udus&g_urg&s_umqb&g_urg&d_susls&g_urz,66)%>" class="m-ma" target="AMF"><%=s_uduss%>列表</a></li>
<%if ewxgn("uk") then%><li><a href="<%=eshref(s_udef&g_urg&ew_kj&g_urg&s_umds&"-m1"&g_urz,66)%>" class="m-ma" target="AMF"><%=s_uduks&s_udefs%></a><a href="<%=eshref(s_uduk&g_urg&s_umqb&g_urg&d_sukls&g_urz,66)%>" class="m-ma" target="AMF"><%=s_uduks%>列表</a></li><%end if%>
<%if ewxgn("bb") then%><li><a href="<%=eshref(s_udef&g_urg&s_udbb&g_urg&s_umds&"-m1"&g_urz,66)%>" class="m-ma" target="AMF"><%=s_udbbs&s_udefs%></a><a href="<%=eshref(s_udbb&g_urg&s_umqb&g_urg&d_sbbls&g_urz,66)%>" class="m-ma" target="AMF"><%=s_udbbs%>列表</a></li><%end if%>
<li><a href="<%=eshref(s_udef&g_urg&s_umqb&g_urg&s_umds&"-m1"&g_urz,66)%>" class="m-ma" target="AMF">全站<%=s_udefs%></a><a href="<%=eshref(s_umso&g_urz,1)%>" class="m-ma" target="AMF">全站列表</a></li>
<%if aiint(uk_id)=0 then%><%=ukxfl(16,s_umqb,"",e_uer,"")%><%end if%>
<%if ewxgn("ut") then%><li><a href="<%=eshref(s_udut&g_urg&s_umlb&g_urz,66)%>" class="m-ma" target="AMF"><%=s_uduts%>列表信息</a></li><%end if%>
</ul>
</div>
<%end if%>

<%if e_gdj>1 then%>
<div class="m-mu">
<h3 onClick="showAsaiMenu(1)">全局管理</h3>
<ul id='AsaiMenu1'>
<%if e_gdj>2 then%>
<%if i_xkadd>0 then%>
<li><a href="<%=eshref(s_umgl&g_urg&s_udus&g_urg&""&g_urg&""&g_urg&""&g_urg&""&g_urg&""&g_urg&"11"&g_urz,77)%>" class="m-ma" target="AMF"><%=s_uduss%>认证</a><a href="<%=eshref(s_umgl&g_urg&s_uduy&g_urz,77)%>" class="m-max" target="AMF">交易管理</a></li>
<%if ewxgn("uh") then%>
<li><a href="<%=eshref(s_umgl&g_urg&s_uduh&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF"><%=s_uduhs%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_uduh&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加<%=s_uduhs%></a></li>
<li><a href="<%=eshref(s_umgl&g_urg&s_uduq&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF"><%=s_uduqs%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_uduq&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加<%=s_uduqs%></a></li>
<%end if%>
<%else%>
<li><a href="<%=eshref(s_umgl&g_urg&s_udus&g_urg&""&g_urg&""&g_urg&""&g_urg&""&g_urg&""&g_urg&"11"&g_urz,77)%>" class="m-max" target="AMF">等待认证<%=s_uduss%></a></li>
<%end if%>
<%if ewxgn("ux") then%><li><a href="<%=eshref(s_umgl&g_urg&s_udux&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF"><%=s_uduxs%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_udux&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加<%=s_uduxs%></a></li><%end if%>
<%if ewxgn("uj") then%><li><a href="<%=eshref(s_umgl&g_urg&s_uduj&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF"><%=s_udujs%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_uduj&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加<%=s_udujs%></a></li><%end if%>
<%if ewxgn("uu") then%><li><a href="<%=eshref(s_umgl&g_urg&s_uduu&g_urz,77)%>" class="m-ma" target="AMF"><%=s_uduus%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_uduu&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加<%=s_uduus%></a></li><%end if%>
<%if ewxgn("un") then%><li><a href="<%=eshref(s_umgl&g_urg&s_udun&g_urz,77)%>" class="m-ma" target="AMF"><%=s_uduns%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_udef&g_urg&s_udun&g_urg&s_umds&g_urz,77)%>" class="m-ma" target="AMF"><%=s_udefs%></a><a href="<%=eshref(s_umgl&g_urg&s_udun&g_urg&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加</a></li><%end if%>
<li><a href="<%=eshref(s_umgl&g_urg&s_udus&g_urg&s_umqb&g_urg&d_susls&g_urz,77)%>" class="m-ma" target="AMF"><%=s_uduss%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_udef&g_urg&s_udus&g_urg&s_umds&g_urz,77)%>" class="m-ma" target="AMF"><%=s_udefs%></a><a href="<%=eshref(s_umgl&g_urg&s_udus&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加</a></li>
<%end if%>
<%if ewxgn("uk") then%><li><a href="<%=eshref(s_umgl&g_urg&s_uduk&g_urg&s_umqb&g_urg&d_sukls&g_urz,77)%>" class="m-ma" target="AMF"><%=s_uduks%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_udef&g_urg&ew_kj&g_urg&s_umds&g_urz,77)%>" class="m-ma" target="AMF"><%=s_udefs%></a><a href="<%=eshref(s_umgl&g_urg&s_uduk&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加</a></li><%end if%>
<%if ewxgn("bb") and e_gdj>2 then%><li><a href="<%=eshref(s_umgl&g_urg&s_udbb&g_urg&s_umqb&g_urg&d_sbbls&g_urz,77)%>" class="m-ma" target="AMF"><%=s_udbbs%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_udef&g_urg&s_udbb&g_urg&s_umds&g_urz,77)%>" class="m-ma" target="AMF"><%=s_udefs%></a><a href="<%=eshref(s_umgl&g_urg&s_udbb&g_urg&s_umqb&g_urg&s_umfb&g_urz,77)%>" class="m-ma" target="AMF">添加</a></li><%end if%>
<%if ewxgn("ut") and e_gdj>3 then%><li><a href="<%=eshref(s_umgl&g_urg&s_udut&g_urg&s_umlb&g_urz,77)%>" class="m-ma" target="AMF"><%=s_uduts%>管理</a><a href="<%=eshref(s_umgl&g_urg&s_udut&g_urg&s_umtj&g_urz,77)%>" class="m-ma" target="AMF">添加<%=s_uduts%></a></li><%end if%>
</ul>
</div>
<%end if%>

<%if ewxgn("e4") then%>
<div class="m-mu">
<h3 onClick="showAsaiMenu(99)">版本信息</h3>
<ul id='AsaiMenu99'>
<li>版本：<a class="m-ma" target="_blank" href="http://eesai.com/">EESai20</a></li>
<li>版权：<a class="m-ma" target="_blank" href="http://eesai.com/">阿赛工作室</a></li>
</ul>
</div>
<%end if%>
<%=mzend(0)%><%

elseif aibj(g_u0,s_umgl) and aibj(g_u1,"usermain") then
%><%=mztop(1,"账户后台欢迎页")%>
<div class="a-gh"><div class="a-g"><div class="a-ga">亲爱的 <%=aimo(e_ubt,e_uer)%>，欢迎光临 <%=ew_mc%> 会员中心！</div></div></div>
<div class="gal"><ul>
<%
if aibj(g_u2,"2") then
Call gysgx(usbiao,"us_ux=0,us_uy=0","us_id="&e_uid&"")
Response.Write aigo("消除成功！",0)
elseif aibj(g_u2,"1") then
uswhere="us_id="&aiint(e_uid)&""
if gysread(uslie("login"),usbiao,uswhere,"") then Call icuser(3)
end if
%>
<li class=g-ll0>
<table width="480" border="0" cellpadding="2" cellspacing="5" class="table-hover">
<%Call mzshow()%>

<%if e_ujb<0 then%><tr><td class="m-lrl">新人帮助：</td><td class="gys1"><a class="f-sb f-skx" target="_blank" href="http://www.eesai.com/help/info/ESQNZHRZU5O.html">快速上手教程为您专属呈现，点击阅读吧！</a></td></tr>
<tr><td class="m-lrl"></td><td class="gys2">
<a class="f-sb f-skx" target="_blank" href="http://www.eesai.com/help/info/ESQNKEOL1C5.html">如何登录</a>
<a class="f-sb f-skx" target="_blank" href="http://www.eesai.com/help/info/ESQNKO2G1IC.html">开通企业网站</a>
</td></tr>
<tr><td class="m-lrl"></td><td class="gys1">
<a class="f-sb f-skx" target="_blank" href="http://www.eesai.com/help/info/ESQNKO1UXH0.html">论坛发帖推广</a>
<a class="f-sb f-skx" target="_blank" href="http://www.eesai.com/help/info/ESQNKJI6UUD.html">修改已发布信息</a>
</td></tr>
<tr><td class="m-lrl"></td><td>
<a class="f-sb f-skx" target="_blank" href="http://www.eesai.com/bbs/ascdai">EESai帮助中心</a>
</td></tr>
<%end if%>
</table></li>
<li class=g-ll0><%=aibuttonk(u_exit,"","","","f-sb f-skx","退出登录")%><%=aibuttonk(eshref(s_umgl&g_urg&"usermain"&g_urg&"1"&g_urz,2),"","","","f-sb f-skx","刷新账户状态")%>
<%dim usdux,usduy,usdxk
Call gysread("us_ip,us_t1,us_ux,us_uy",usbiao,"us_id="&e_uid&"","")
usdux=aiint(us_ux)
usduy=aiint(us_uy)
if usdux>0 and ewxgn("ux") then
%>　<a class="f-sb f-skx" href="<%=eshref(s_udux&g_urz,66)%>">新短信 <span class="b-sp"><%=usdux%></span></a>　
<%end if
if usduy>0 then
%>　<a class="f-sb f-skx" href="<%=eshref(s_uduy&g_urz,66)%>">新订单 <span class="b-sp"><%=usduy%></span></a>
<%end if
if usdux>0 or usduy>0 then
%>　<a class="f-sb f-skx" href="<%=eshref(s_umgl&g_urg&"usermain"&g_urg&"2"&g_urz,2)%>">消除提示</a>
<%end if%>
</li>
<%if aiint(e_uxy)=<aiint(ew_sh) or ainull(e_uem) then%>
<li class=g-ll0>为了获得更好的会员体验，建议您对您的账户进行完善升级：</li>
<li class=g-ll1><strong>验证您的邮箱保障您的账户安全</strong>（验证通过后，您可以随时通过邮箱找回您的账户和密码）；</li>
<li class=g-ll0>
<%if ainull(e_uem) then%>
<%=aibuttonk(eshref(s_druser&"?email/1"&g_urz,3),"","","","f-sb f-skx","填写邮箱")%>
<%else%>
<%=aibuttonk(eshref(s_udus&g_urg&s_umxg&g_urz,66),"","","","f-sb f-skx","编辑邮箱")%>
<%=aibuttonk(eshref(s_druser&"?email/1"&g_urz,3),"","","","f-sb f-skx","验证邮箱（"&e_uem&"）")%>
<%end if%>
</li>
<%else%>
<li class=g-ll1><strong>√ 您的邮箱 <%=e_uem%> 已经验证成功</strong>（您可以随时通过邮箱找回您的账户和密码）；</li>
<%end if%>
<%if e_uzy=0 then%>
<li class=g-ll1><strong>认证您的身份获取豪华会员网站</strong>（认证通过后，您可以拥有独立的会员网站空间，更好地管理自己发布的信息）。</li>
<li class=g-ll0><%=aibuttonk(eshref(s_udus&g_urg&s_umxg&g_urz,66),"","","","f-sb f-skx","申请认证")%></li>
<%elseif e_uzy=1 then%>
<li class=g-ll1><strong>认证您的身份获取豪华会员网站</strong>（认证通过后，您可以拥有独立的会员网站空间，更好地管理自己发布的信息）。</li>
<li class=g-ll0><%=aibuttonk(eshref(s_udus&g_urg&s_umxg&g_urz,66),"","","","f-sb f-skx","编辑认证")%>　<a class="f-sb f-skx" href="<%=eshref(s_udux&g_urg&s_umtj&g_urg&ew_kf&g_urz,66)%>">联系管理员</a>　*正在等待身份认证信息的审核</li>
<%else%>
<li class=g-ll1><strong>√ 您已完成身份认证，认证等级为 <%=aiarr(i_buszy,"|",aiint(e_uzy))%></strong>（已完成）。</li>
<%end if%>

<li class=g-ll0>
您最近一次登录日期为<%=us_t1%>，当前页面时间<%=now()%>
<br>您最近一次登录地址为<a target="_blank" href="http://ip.780.pub/?ip=<%=us_ip%>"><%=us_ip%></a></script>，当前IP地址<a target="_blank" href="http://ip.780.pub/?ip=<%=aiip()%>"><%=aiip()%></a>
</li>
</ul></div>
<%=mzend(0)%><%
else
Response.write mztop(0,"会员后台服务")%>
<script type="text/javascript">if (window!=top){top.location.href=window.location.href;}</script>
<table class=FR-b width=100% height=100% border=0 cellspacing=0 cellpadding=0><tr><td rowspan=3 width=5></td><td colspan=3 height=5></td><td rowspan=3 width=5></td></tr><tr><td width=158 height=100% id=frl>
<iframe class=FR-m src=<%=eshref(s_umgl&g_urg&"usermenu"&g_urz,2)%> frameborder=0 scrolling=auto></iframe>
</td><td width=8 title=单击可以关闭或打开左侧页面 class=FR-z onMouseOver=this.className='FR-za'; onMouseOut=this.className='FR-z'; onClick="if(document.getElementById('frl').style.display==''){document.getElementById('frl').style.display='none';document.getElementById('frlimg').className='glyphicon glyphicon-chevron-right';}else{document.getElementById('frl').style.display='';document.getElementById('frlimg').className='glyphicon glyphicon-chevron-left';}">
<span id="frlimg" class="glyphicon glyphicon-chevron-left"></span>
</td><td height=100%>
<iframe class=FR-m src=<%=eshref(s_umgl&g_urg&"usermain"&g_urz,2)%> name=AMF id=AMF frameborder=0 scrolling=auto></iframe>
</td></tr><tr><td colspan=3 height=5></td></tr></table>
</body>
</html>
<%end if%><!--#include file="../AsaiInc/incma.asp"-->