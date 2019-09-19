<%
'调用方法，对比值【Session("AsaiCode"),Request.Cookies("AsaiCode")】
'<img id="checkcode" src="../EESaiCodeImg/New/?code.jpg" style="cursor:hand;width:80px;height:20px;" alt="看不清楚？请点击刷新！" onClick="this.src=this.src+'?'+Math.random();"><a href='#' onClick="checkcode.src=checkcode.src+'?'+Math.random();" title="看不清楚，换个图片！">看不清楚，换个图片！</a>
Response.expires=-1
Response.AddHeader"pragma","no-cache"
Response.AddHeader"cache-control","no-store"
dim AChiiaodu,ACDgeshu,ACDcty,ACDcname

ACDcname="AsaiCode"'这里修改验证码记录缓存名称，调用方法：Session("AsaiCode"),Request.Cookies("AsaiCode")
ACDcty=0'这里修改随机码记录模式,临时数据-cookies|session|cookies+session*选择验证码编码等缓存的方式

Randomize
AChiiaodu=int(18*Rnd)'角度随机量
Randomize
ACDgeshu=int(5*Rnd)+1 '产生的字符个数，修改数字5为其他数值，表示产生1-5之间的字符数，也可以设为固定值
const ACDbaohe=100'最大色彩饱和度
const ACDzaodian=0.1'空白处噪点率0-0.9
const ACDzaodianbai=0.1'有色处噪点率0-0.9
const ACDzikuan=20'单个字符位图的宽度
const ACDzigao=20'单个字符位图的高度
const ACDsediao=-1'显示验证码的色调(-1表示随机色调,-2表示灰度色调)
const ACDchangdu=10'长度随机量(百分比)
const ACDzifu="0123456789"'构成验证码的字符集;如果扩充了下边的字母矢量库

Dim Buf(),DigtalStr
Dim Lines(),LineCount
Dim CursorX,CursorY,DirX,DirY

Randomize
Call ACDmakecode(ACDcname,ACDcty)'这里修改随机码

Sub CDGen_Reset()
'复位矢量笔和环境变量
LineCount=0
CursorX=0
CursorY=0
'初始的光笔方向是垂直向下
DirX=0
DirY=1
End Sub

Sub CDGen_Clear()
'清空位图阵列
Dim i,j
ReDim Buf(ACDzigao-1,ACDgeshu*ACDzikuan-1)

For j=0 To ACDzigao-1
For i=0 To ACDgeshu*ACDzikuan-1
Buf(j,i)=0
Next
Next
End Sub

Sub CDGen_PSet(X,Y)
'在位图阵列上画点
Buf(Y,X)=1
End Sub

Sub CDGen_Line(X1,Y1,X2,Y2)
'在位图阵列上画线
Dim DX,DY,DeltaT,i

DX=X2-X1
DY=Y2-Y1
If Abs(DX)>Abs(DY) Then DeltaT=Abs(DX) Else DeltaT=Abs(DY)
For i=0 To DeltaT
CDGen_PSet X1+DX*i/DeltaT,Y1+DY*i/DeltaT
Next
End Sub

Sub CDGen_FowardDraw(nLength)
'按当前光笔方向绘制指定长度并移动光笔，正数表示从左向右/从上向下绘制，负数表示从右向左/从下向上绘制
nLength=Sgn(nLength)*Abs(nLength)*(1-ACDchangdu/100+Rnd*nLenghtRandom*2/100)
ReDim Preserve Lines(3,LineCount)
Lines(0,LineCount)=CursorX
Lines(1,LineCount)=CursorY
CursorX=CursorX+DirX*nLength
CursorY=CursorY+DirY*nLength
Lines(2,LineCount)=CursorX
Lines(3,LineCount)=CursorY
LineCount=LineCount+1
End Sub

Sub CDGen_SetDirection(nAngle)
'按指定角度设定画笔方向,正数表示相对当前方向顺时针改变方向，负数表示相对当前方向逆时针改变方向
Dim DX,DY

nAngle=Sgn(nAngle)*(Abs(nAngle)-AChiiaodu+Rnd*AChiiaodu*2)/180*3.1415926
DX=DirX
DY=DirY
DirX=DX*Cos(nAngle)-DY*Sin(nAngle)
DirY=DX*Sin(nAngle)+DY*Cos(nAngle)
End Sub

Sub CDGen_MoveToMiddle(nActionindex,nPercent)
'将画笔光标移动到指定动作的中间点上，nPercent为中间位置的百分比
Dim DeltaX,DeltaY

DeltaX=Lines(2,nActionindex)-Lines(0,nActionindex)
DeltaY=Lines(3,nActionindex)-Lines(1,nActionindex)
CursorX=Lines(0,nActionindex)+Sgn(DeltaX)*Abs(DeltaX)*nPercent/100
CursorY=Lines(1,nActionindex)+Sgn(DeltaY)*Abs(DeltaY)*nPercent/100
End Sub

Sub CDGen_MoveCursor(nActionindex)
'将画笔光标移动到指定动作的起始点上
CursorX=Lines(0,nActionindex)
CursorY=Lines(1,nActionindex)
End Sub

Sub CDGen_Close(nActionindex)
'将当前光笔位置与指定动作的起始点闭合并移动光笔
ReDim Preserve Lines(3,LineCount)
Lines(0,LineCount)=CursorX
Lines(1,LineCount)=CursorY
CursorX=Lines(0,nActionindex)
CursorY=Lines(1,nActionindex)
Lines(2,LineCount)=CursorX
Lines(3,LineCount)=CursorY
LineCount=LineCount+1
End Sub

Sub CDGen_CloseToMiddle(nActionindex,nPercent)
'将当前光笔位置与指定动作的中间点闭合并移动光笔，nPercent为中间位置的百分比
Dim DeltaX,DeltaY

ReDim Preserve Lines(3,LineCount)
Lines(0,LineCount)=CursorX
Lines(1,LineCount)=CursorY
DeltaX=Lines(2,nActionindex)-Lines(0,nActionindex)
DeltaY=Lines(3,nActionindex)-Lines(1,nActionindex)
CursorX=Lines(0,nActionindex)+Sgn(DeltaX)*Abs(DeltaX)*nPercent/100
CursorY=Lines(1,nActionindex)+Sgn(DeltaY)*Abs(DeltaY)*nPercent/100
Lines(2,LineCount)=CursorX
Lines(3,LineCount)=CursorY
LineCount=LineCount+1
End Sub

Sub CDGen_Flush(X0,Y0)
'按照当前的画笔动作序列绘制位图点阵
Dim MaxX,MinX,MaxY,MinY
Dim DeltaX,DeltaY,StepX,StepY,OffsetX,OffsetY
Dim i

MaxX=MinX=MaxY=MinY=0
For i=0 To LineCount-1
If MaxX<Lines(0,i) Then MaxX=Lines(0,i)
If MaxX<Lines(2,i) Then MaxX=Lines(2,i)
If MinX>Lines(0,i) Then MinX=Lines(0,i)
If MinX>Lines(2,i) Then MinX=Lines(2,i)
If MaxY<Lines(1,i) Then MaxY=Lines(1,i)
If MaxY<Lines(3,i) Then MaxY=Lines(3,i)
If MinY>Lines(1,i) Then MinY=Lines(1,i)
If MinY>Lines(3,i) Then MinY=Lines(3,i)
Next
DeltaX=MaxX-MinX
DeltaY=MaxY-MinY
If DeltaX=0 Then DeltaX=1
If DeltaY=0 Then DeltaY=1
MaxX=MinX
MaxY=MinY
If DeltaX>DeltaY Then
StepX=(ACDzikuan-2)/DeltaX
StepY=(ACDzigao-2)/DeltaX
OffsetX=0
OffsetY=(DeltaX-DeltaY)/2
Else
StepX=(ACDzikuan-2)/DeltaY
StepY=(ACDzigao-2)/DeltaY
OffsetX=(DeltaY-DeltaX)/2
OffsetY=0
End If
For i=0 To LineCount-1
Lines(0,i)=Round((Lines(0,i)-MaxX+OffsetX)*StepX,0)
If Lines(0,i)<0 Then Lines(0,i)=0
If Lines(0,i)>=ACDzikuan-2 Then Lines(0,i)=ACDzikuan-3
Lines(1,i)=Round((Lines(1,i)-MaxY+OffsetY)*StepY,0)
If Lines(1,i)<0 Then Lines(1,i)=0
If Lines(1,i)>=ACDzigao-2 Then Lines(1,i)=ACDzigao-3
Lines(2,i)=Round((Lines(2,i)-MinX+OffsetX)*StepX,0)
If Lines(2,i)<0 Then Lines(2,i)=0
If Lines(2,i)>=ACDzikuan-2 Then Lines(2,i)=ACDzikuan-3
Lines(3,i)=Round((Lines(3,i)-MinY+OffsetY)*StepY,0)
If Lines(3,i)<0 Then Lines(3,i)=0
If Lines(3,i)>=ACDzigao-2 Then Lines(3,i)=ACDzigao-3
CDGen_Line Lines(0,i)+X0+1,Lines(1,i)+Y0+1,Lines(2,i)+X0+1,Lines(3,i)+Y0+1
Next
End Sub

Sub CDGen_Char(cChar,X0,Y0)
'在指定坐标处生成指定字符的位图阵列
CDGen_Reset
Select Case cChar
Case "0"
CDGen_SetDirection -60'逆时针60度(相对于垂直线)
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection -60'逆时针60度
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw 1.5'绘制1.5个单位
CDGen_SetDirection -60'逆时针60度
CDGen_FowardDraw 0.7'绘制0.7个单位
CDGen_SetDirection -60'顺时针120度
CDGen_FowardDraw 0.7'绘制0.7个单位
CDGen_Close 0'封闭当前笔与第0笔(0开始)
Case "1"
CDGen_SetDirection -90'逆时针90度(相对于垂直线)
CDGen_FowardDraw 0.5'绘制0.5个单位
CDGen_MoveToMiddle 0,50'移动画笔的位置到第0笔(0开始)的50%处
CDGen_SetDirection 90'逆时针90度
CDGen_FowardDraw -1.4'反方向绘制1.4个单位
CDGen_SetDirection 30'逆时针30度
CDGen_FowardDraw 0.4'绘制0.4个单位
Case "2"
CDGen_SetDirection 45'顺时针45度(相对于垂直线)
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection -120'逆时针120度
CDGen_FowardDraw 0.4'绘制0.4个单位
CDGen_SetDirection 60'顺时针60度
CDGen_FowardDraw 0.6'绘制0.6个单位
CDGen_SetDirection 60'顺时针60度
CDGen_FowardDraw 1.6'绘制1.6个单位
CDGen_SetDirection -135'逆时针135度
CDGen_FowardDraw 1.0'绘制1.0个单位
Case "3"
CDGen_SetDirection -90'逆时针90度(相对于垂直线)
CDGen_FowardDraw 0.8'绘制0.8个单位
CDGen_SetDirection 135'顺时针135度
CDGen_FowardDraw 0.8'绘制0.8个单位
CDGen_SetDirection -120'逆时针120度
CDGen_FowardDraw 0.6'绘制0.6个单位
CDGen_SetDirection 80'顺时针80度
CDGen_FowardDraw 0.5'绘制0.5个单位
CDGen_SetDirection 60'顺时针60度
CDGen_FowardDraw 0.5'绘制0.5个单位
CDGen_SetDirection 60'顺时针60度
CDGen_FowardDraw 0.5'绘制0.5个单位
Case "4"
CDGen_SetDirection 20'顺时针20度(相对于垂直线)
CDGen_FowardDraw 0.8'绘制0.8个单位
CDGen_SetDirection -110'逆时针110度
CDGen_FowardDraw 1.2'绘制1.2个单位
CDGen_MoveToMiddle 1,60'移动画笔的位置到第1笔(0开始)的60%处
CDGen_SetDirection 90'顺时针90度
CDGen_FowardDraw 0.7'绘制0.7个单位
CDGen_MoveCursor 2'移动画笔到第2笔(0开始)的开始处
CDGen_FowardDraw -1.5'反方向绘制1.5个单位
Case "5"
CDGen_SetDirection 90'顺时针90度(相对于垂直线)
CDGen_FowardDraw 1.0'绘制1.0个单位
CDGen_SetDirection -90'逆时针90度
CDGen_FowardDraw 0.8'绘制0.8个单位
CDGen_SetDirection -90'逆时针90度
CDGen_FowardDraw 0.8'绘制0.8个单位
CDGen_SetDirection 30'顺时针30度
CDGen_FowardDraw 0.4'绘制0.4个单位
CDGen_SetDirection 60'顺时针60度
CDGen_FowardDraw 0.4'绘制0.4个单位
CDGen_SetDirection 30'顺时针30度
CDGen_FowardDraw 0.5'绘制0.5个单位
CDGen_SetDirection 60'顺时针60度
CDGen_FowardDraw 0.8'绘制0.8个单位
Case "6"
CDGen_SetDirection -60'逆时针60度(相对于垂直线)
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection -60'逆时针60度
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw 1.5'绘制1.5个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw 0.7'绘制0.7个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw 0.5'绘制0.5个单位
CDGen_CloseToMiddle 2,50'将当前画笔位置与第2笔(0开始)的50%处封闭
Case "7"
CDGen_SetDirection 180'顺时针180度(相对于垂直线)
CDGen_FowardDraw 0.3'绘制0.3个单位
CDGen_SetDirection 90'顺时针90度
CDGen_FowardDraw 0.9'绘制0.9个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw 1.3'绘制1.3个单位
Case "8"
CDGen_SetDirection -60'逆时针60度(相对于垂直线)
CDGen_FowardDraw -0.8'反方向绘制0.8个单位
CDGen_SetDirection -60'逆时针60度
CDGen_FowardDraw -0.8'反方向绘制0.8个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw 0.8'绘制0.8个单位
CDGen_SetDirection 110'顺时针110度
CDGen_FowardDraw -1.5'反方向绘制1.5个单位
CDGen_SetDirection -110'逆时针110度
CDGen_FowardDraw 0.9'绘制0.9个单位
CDGen_SetDirection 60'顺时针60度
CDGen_FowardDraw 0.8'绘制0.8个单位
CDGen_SetDirection 60'顺时针60度
CDGen_FowardDraw 0.8'绘制0.8个单位
CDGen_SetDirection 60'顺时针60度
CDGen_FowardDraw 0.9'绘制0.9个单位
CDGen_SetDirection 70'顺时针70度
CDGen_FowardDraw 1.5'绘制1.5个单位
CDGen_Close 0'封闭当前笔与第0笔(0开始)
Case "9"
CDGen_SetDirection 120'逆时针60度(相对于垂直线)
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection -60'逆时针60度
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection -60'顺时针120度
CDGen_FowardDraw -1.5'绘制1.5个单位
CDGen_SetDirection -60'顺时针120度
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection -60'顺时针120度
CDGen_FowardDraw -0.7'绘制0.7个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw 0.7'反方向绘制0.7个单位
CDGen_SetDirection -60'顺时针120度
CDGen_FowardDraw 0.5'绘制0.5个单位
CDGen_CloseToMiddle 2,50'将当前画笔位置与第2笔(0开始)的50%处封闭
'以下为字母的矢量动作，有兴趣的可以继续
Case "A"
CDGen_SetDirection -(Rnd*20+150)'逆时针150-170度(相对于垂直线)
CDGen_FowardDraw Rnd*0.2+1.1'绘制1.1-1.3个单位
CDGen_SetDirection Rnd*20+140'顺时针140-160度
CDGen_FowardDraw Rnd*0.2+1.1'绘制1.1-1.3个单位
CDGen_MoveToMiddle 0,30'移动画笔的位置到第1笔(0开始)的30%处
CDGen_CloseToMiddle 1,70'将当前画笔位置与第1笔(0开始)的70%处封闭
Case "B"
CDGen_SetDirection -(Rnd*20+50)'逆时针50-70度(相对于垂直线)
CDGen_FowardDraw Rnd*0.4+0.8'绘制0.8-1.2个单位
CDGen_SetDirection Rnd*20+110'顺时针110-130度
CDGen_FowardDraw Rnd*0.2+0.6'绘制0.6-0.8个单位
CDGen_SetDirection -(Rnd*20+110)'逆时针110-130度
CDGen_FowardDraw Rnd*0.2+0.6'绘制0.6-0.8个单位
CDGen_SetDirection Rnd*20+110'顺时针110-130度
CDGen_FowardDraw Rnd*0.4+0.8'绘制0.8-1.2个单位
CDGen_Close 0'封闭当前笔与第1笔(0开始)
Case "C"
CDGen_SetDirection -60'逆时针60度(相对于垂直线)
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection -60'逆时针60度
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw 1.5'绘制1.5个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw -0.7'反方向绘制0.7个单位
CDGen_SetDirection 120'顺时针120度
CDGen_FowardDraw 0.7'绘制0.7个单位
'增加更多字符集，请相应修改 ACDzifu 的属性值

End Select
CDGen_Flush X0,Y0
End Sub

Sub CDGen_Blur()
'对产生的位图进行柔化处理
Dim i,j

For j=1 To ACDzigao-2
For i=1 To ACDgeshu*ACDzikuan-2
If Buf(j,i)=0 Then
If ((Buf(j,i-1) or Buf(j+1,i)) And 1) <> 0 Then
'如果当前点是空白点，且上下左右四个点中有一个点是有色点，则该点做柔化处理
Buf(j,i)=2
End If
End If
Next
Next
End Sub

Sub CDGen_NoisyDot()
'对产生的位图进行噪点处理
Dim i,j,NoisyDot,CurDot

For j=0 To ACDzigao-1
For i=0 To ACDgeshu*ACDzikuan-1
If Buf(j,i) <> 0 Then
NoisyDot=Int(Rnd*Rnd*ACDbaohe)
Select Case ACDzaodianbai
Case 0
CurDot=ACDbaohe
Case 1
CurDot=0
Case Else
CurDot=NoisyDot
End Select
If Rnd<ACDzaodianbai Then Buf(j,i)=CurDot Else Buf(j,i)=ACDbaohe
Else
NoisyDot=Int(Rnd*ACDbaohe)
Select Case ACDzaodian
Case 0
CurDot=0
Case 1
CurDot=ACDbaohe
Case Else
CurDot=NoisyDot
End Select
If Rnd<ACDzaodian Then Buf(j,i)=CurDot Else Buf(j,i)=0
End If
Next
Next
End Sub

Sub CDGen()
'生成位图阵列
Dim i,Ch

DigtalStr=""
CDGen_Clear
For i=0 To ACDgeshu-1
Ch=Mid(ACDzifu,Int(Rnd*Len(ACDzifu))+1,1)
DigtalStr=DigtalStr+Ch
CDGen_Char Ch,i*ACDzikuan,0
Next
CDGen_Blur
CDGen_NoisyDot
End Sub

Function HSBToRGB(vH,vS,vB)
'将颜色值由HSB转换为RGB
Dim aRGB(3),RGB1st,RGB2nd,RGB3rd
Dim nH,nS,nB
Dim lH,nF,nP,nQ,nT

vH=(vH Mod 360)
If vS>100 Then
vS=100
ElseIf vS<0 Then
vS=0
End If
If vB>100 Then
vB=100
ElseIf vB<0 Then
vB=0
End If
If vS>0 Then
nH=vH/60
nS=vS/100
nB=vB/100
lH=Int(nH)
nF=nH-lH
nP=nB*(1-nS)
nQ=nB*(1-nS*nF)
nT=nB*(1-nS*(1-nF))
Select Case lH
Case 0
aRGB(0)=nB*255
aRGB(1)=nT*255
aRGB(2)=nP*255
Case 1
aRGB(0)=nQ*255
aRGB(1)=nB*255
aRGB(2)=nP*255
Case 2
aRGB(0)=nP*255
aRGB(1)=nB*255
aRGB(2)=nT*255
Case 3
aRGB(0)=nP*255
aRGB(1)=nQ*255
aRGB(2)=nB*255
Case 4
aRGB(0)=nT*255
aRGB(1)=nP*255
aRGB(2)=nB*255
Case 5
aRGB(0)=nB*255
aRGB(1)=nP*255
aRGB(2)=nQ*255
End Select
Else
aRGB(0)=(vB*255)/100
aRGB(1)=aRGB(0)
aRGB(2)=aRGB(0)
End If
HSBToRGB=ChrB(Round(aRGB(2),0))&ChrB(Round(aRGB(1),0))&ChrB(Round(aRGB(0),0))
End Function

Sub ACDmakecode(Ssestr,Ssesty)
Dim i,j,CurColorHue

'禁止缓存
Response.Expires=-9999
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-ctrol","no-cache"
Response.ContentType="image/bmp"

Call CDGen
if Ssesty=0 then
response.Cookies(Ssestr)=DigtalStr'记录入Cookies
elseif Ssesty=1 then
Session(Ssestr)=DigtalStr'记录入Session
else
Session(Ssestr)=DigtalStr'记录入Session
response.Cookies(Ssestr)=DigtalStr'记录入Cookies
end if

Dim PicWidth,PicHeight,FileSize,PicDataSize
PicWidth=ACDgeshu*ACDzikuan
PicHeight=ACDzigao
PicDataSize=PicWidth*PicHeight*3
FileSize=PicDataSize+54

'输出BMP文件信息头
Response.BinaryWrite ChrB(66)&ChrB(77)&_
ChrB(FileSize Mod 256)&ChrB((FileSize\256) Mod 256)&ChrB((FileSize\256\256) Mod 256)&ChrB(FileSize\256\256\256)&_
ChrB(0)&ChrB(0)&ChrB(0)&ChrB(0)&_
ChrB(54)&ChrB(0)&ChrB(0)&ChrB(0)

'输出BMP位图信息头
Response.BinaryWrite ChrB(40)&ChrB(0)&ChrB(0)&ChrB(0)&_
ChrB(PicWidth Mod 256)&ChrB((PicWidth\256) Mod 256)&ChrB((PicWidth\256\256) Mod 256)&ChrB(PicWidth\256\256\256)&_
ChrB(PicHeight Mod 256)&ChrB((PicHeight\256) Mod 256)&ChrB((PicHeight\256\256) Mod 256)&ChrB(PicHeight\256\256\256)&_
ChrB(1)&ChrB(0)&_
ChrB(24)&ChrB(0)&_
ChrB(0)&ChrB(0)&ChrB(0)&ChrB(0)&_
ChrB(PicDataSize Mod 256)&ChrB((PicDataSize\256) Mod 256)&ChrB((PicDataSize\256\256) Mod 256)&ChrB(PicDataSize\256\256\256)&_
ChrB(18)&ChrB(11)&ChrB(0)&ChrB(0)&_
ChrB(18)&ChrB(11)&ChrB(0)&ChrB(0)&_
ChrB(0)&ChrB(0)&ChrB(0)&ChrB(0)&_
ChrB(0)&ChrB(0)&ChrB(0)&ChrB(0)

'逐点输出位图阵列
If ACDsediao=-1 Then
CurColorHue=Int(Rnd*360)
ElseIf ACDsediao=-2 Then
CurColorHue=0
Else
CurColorHue=ACDsediao
End If
For j=0 To ACDzigao-1
For i=0 To Len(DigtalStr)*ACDzikuan-1
If ACDsediao=-2 Then
Response.BinaryWrite HSBToRGB(CurColorHue,0,100-Buf(ACDzigao-1-j,i))
Else
Response.BinaryWrite HSBToRGB(CurColorHue,Buf(ACDzigao-1-j,i),100)
End If
Next
Next
End Sub
%>