<%
'{上传参数设置}
const p_ver="8"'系统版本:上传系统版本号.
const p_err=0'调试模式-关闭调试|开启调试*是否开启上传文件调试测试
const p_zjk=0'组件开关-使用阿赛无组件|使用ASPupload组件*当服务器有限制只给上传200KB文件的时候启用组件上传
const p_psk=1'缩图样式-等比缩放|固定裁剪*选择缩略图裁剪样式
const p_psw=200'缩略图宽-缩略图宽
const p_psh=200'缩略图高-缩略图高
const p_pyk=1'水印开关-关闭水印|原图水印|缩图水印|原图缩图都水印*水印处理方式
const p_pyt=""'水印图片:输入水印图片所在位置
const p_pyc="000000"'水印颜色:使用文字水印时的文字颜色，默认000000；使用图片水印的时候的是图片的背景色。
const p_pyf="24"'水印大小:使用文字水印时的文字的大小。
const p_qs="asaiup"'权限缓存:使用上传权限的缓存名称
const p_qx=1'使用权限-☆☆☆☆☆|★☆☆☆☆|★★☆☆☆|★★★☆☆|★★★★☆|★★★★★*大于等于会员星级xy值方可使用上传功能，0表示任何人都能上传
const p_tjg="-_-"'特殊间隔:特殊替换字符
const p_ujg="|"'参数间隔:地址栏参数间隔符.
const p_fs0=200'限大小00-默认，单位KB，1024kb=1Mb.
const p_ft0="jpg,gif,rar,zip,txt,doc"'扩展名01:默认，允许扩展名，请用英文的逗号隔开.
const p_fs1=200'限大小00-图片，单位KB，1024kb=1Mb.
const p_ft1="jpg,gif,png,bmp"'扩展名01:图片，允许扩展名，请用英文的逗号隔开.
const p_fs2=200'限大小02-影音，单位KB，1024kb=1Mb.
const p_ft2="swf,flv,avi,wmv,asf,mov,dat,mp3,mp4,wma,rm,ra,ram,rmvb"'扩展名02:影音，允许扩展名，请用英文的逗号隔开.
const p_fs3=200'限大小03-下载，单位KB，1024kb=1Mb.
const p_ft3="rar,zip,txt,exe,7z,doc,xls,ppt,docx,xlsx"'扩展名03:下载，允许扩展名，请用英文的逗号隔开.
const p_fs4=200'限大小04-全部，单位KB，1024kb=1Mb.
const p_ft4="jpg,gif,png,bmp,swf,flv,avi,wmv,asf,mov,dat,mp3,mp4,wma,rm,ra,ram,rmvb,rar,zip,txt,exe,7z,doc,xls,ppt,docx,xlsx"'扩展名04:全部，允许扩展名，请用英文的逗号隔开.
const p_fs5=200'限大小05-特殊，单位KB，1024kb=1Mb.
const p_ft5="jpg,gif"'扩展名05:特殊，允许扩展名，请用英文的逗号隔开.
const p_fll=6'限制数量-最大限制数量等于下列限制数组最大值加1.
const p_hei="22"'上传高度:上传系统高度.
'{组合参数设置}
const p_upiqx=1'上传权限-所有用户|注册用户|推荐用户|管理员*是否使用网站附图显示功能
const p_upixf=1'附图开关-关闭附图|智能附图|打开附图*是否使用网站附图显示功能
const p_upixy=1'图片保存-保存到同频道|保存到同时间|保存到同频道同时间|上传到根目录*上传图片保存位置处理.
const p_upixn=2'难图替换-关闭难图替换|使用跨域调图|开启难图替换*如果图片打开过慢或无法打开是否显示替换的随机图片跨域调图获取另一地址上的图片需要设置JS名upimg的文件.
const p_upijj="AsaiUpFile/"'上传文件:默认储存图片文件夹，请使用绝对地址，前后均加/（配合网站的根目录i_dir参数前面无需加/）注意需要使用含AsaiUpFile/字符的文件夹
const p_dir="/"'储存根目录:文件储存根目录
const p_upist="s"'缩图保存:相对原图文件夹的缩图文件夹名，或缩图前缀名，前后均不加/
const p_upifh="EESai_"'特殊符号:上传传递中的默认符号不可修改.
const p_upihz=".ees"'后缀名称:地址栏参数后缀名不可修改.
const p_upwur=""'返回网址:返回带网址的地址时候使用，以/为结尾，一般情况下p_upwur和p_upwdu值是一样的.
const p_upwdu=""'独立图库:是否启用独立图库功能(当网站启用上传文件至其他指定文件夹时)默认为空，以/为结尾.
const p_upwdr=""'跨域保存:使用绝对地址如D：\EESai\结尾必加符号\通过js正则处理内容中的图片地址，注意需要p_upijj使用含AsaiUpFile/字符的文件夹为正则标示默认为空.
%>