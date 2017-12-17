! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:15 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module RGEs_seesaw1nmssm 
 
Use Control 
Use Settings 
Use Model_Data_seesaw1nmssm 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters308(g,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,           & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3)

Implicit None 
Real(dp), Intent(in) :: g(308) 
Real(dp),Intent(out) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters308' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+4), g(SumI+5), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+22), g(SumI+23), dp) 
End Do 
 End Do 
 
lam= Cmplx(g(40),g(41),dp) 
kap= Cmplx(g(42),g(43),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
lamN(i1,i2) = Cmplx( g(SumI+44), g(SumI+45), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+62), g(SumI+63), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yv(i1,i2) = Cmplx( g(SumI+80), g(SumI+81), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Td(i1,i2) = Cmplx( g(SumI+98), g(SumI+99), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Te(i1,i2) = Cmplx( g(SumI+116), g(SumI+117), dp) 
End Do 
 End Do 
 
Tlam= Cmplx(g(134),g(135),dp) 
Tk= Cmplx(g(136),g(137),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
TLN(i1,i2) = Cmplx( g(SumI+138), g(SumI+139), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tu(i1,i2) = Cmplx( g(SumI+156), g(SumI+157), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tv(i1,i2) = Cmplx( g(SumI+174), g(SumI+175), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mq2(i1,i2) = Cmplx( g(SumI+192), g(SumI+193), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
ml2(i1,i2) = Cmplx( g(SumI+210), g(SumI+211), dp) 
End Do 
 End Do 
 
mHd2= g(228) 
mHu2= g(229) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
md2(i1,i2) = Cmplx( g(SumI+230), g(SumI+231), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mu2(i1,i2) = Cmplx( g(SumI+248), g(SumI+249), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
me2(i1,i2) = Cmplx( g(SumI+266), g(SumI+267), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mv2(i1,i2) = Cmplx( g(SumI+284), g(SumI+285), dp) 
End Do 
 End Do 
 
ms2= g(302) 
M1= Cmplx(g(303),g(304),dp) 
M2= Cmplx(g(305),g(306),dp) 
M3= Cmplx(g(307),g(308),dp) 
Do i1=1,308 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters308

Subroutine ParametersToG308(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,             & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,g)

Implicit None 
Real(dp), Intent(out) :: g(308) 
Real(dp), Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp), Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG308' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+4) = Real(Yd(i1,i2), dp) 
g(SumI+5) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+22) = Real(Ye(i1,i2), dp) 
g(SumI+23) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(40) = Real(lam,dp)  
g(41) = Aimag(lam)  
g(42) = Real(kap,dp)  
g(43) = Aimag(kap)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+44) = Real(lamN(i1,i2), dp) 
g(SumI+45) = Aimag(lamN(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+62) = Real(Yu(i1,i2), dp) 
g(SumI+63) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+80) = Real(Yv(i1,i2), dp) 
g(SumI+81) = Aimag(Yv(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+98) = Real(Td(i1,i2), dp) 
g(SumI+99) = Aimag(Td(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+116) = Real(Te(i1,i2), dp) 
g(SumI+117) = Aimag(Te(i1,i2)) 
End Do 
End Do 

g(134) = Real(Tlam,dp)  
g(135) = Aimag(Tlam)  
g(136) = Real(Tk,dp)  
g(137) = Aimag(Tk)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+138) = Real(TLN(i1,i2), dp) 
g(SumI+139) = Aimag(TLN(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+156) = Real(Tu(i1,i2), dp) 
g(SumI+157) = Aimag(Tu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+174) = Real(Tv(i1,i2), dp) 
g(SumI+175) = Aimag(Tv(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+192) = Real(mq2(i1,i2), dp) 
g(SumI+193) = Aimag(mq2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+210) = Real(ml2(i1,i2), dp) 
g(SumI+211) = Aimag(ml2(i1,i2)) 
End Do 
End Do 

g(228) = mHd2  
g(229) = mHu2  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+230) = Real(md2(i1,i2), dp) 
g(SumI+231) = Aimag(md2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+248) = Real(mu2(i1,i2), dp) 
g(SumI+249) = Aimag(mu2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+266) = Real(me2(i1,i2), dp) 
g(SumI+267) = Aimag(me2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+284) = Real(mv2(i1,i2), dp) 
g(SumI+285) = Aimag(mv2(i1,i2)) 
End Do 
End Do 

g(302) = ms2  
g(303) = Real(M1,dp)  
g(304) = Aimag(M1)  
g(305) = Real(M2,dp)  
g(306) = Aimag(M2)  
g(307) = Real(M3,dp)  
g(308) = Aimag(M3)  
Iname = Iname - 1 
 
End Subroutine ParametersToG308

Subroutine rge308(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,mHd2,betamHd21,betamHd22,DmHd2,mHu2,betamHu21,betamHu22,DmHu2,ms2,betams21,        & 
& betams22,Dms2
Complex(dp) :: Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)          & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),lam,betalam1,betalam2,Dlam,             & 
& kap,betakap1,betakap2,Dkap,lamN(3,3),betalamN1(3,3),betalamN2(3,3),DlamN(3,3)          & 
& ,adjlamN(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yv(3,3)            & 
& ,betaYv1(3,3),betaYv2(3,3),DYv(3,3),adjYv(3,3),Td(3,3),betaTd1(3,3),betaTd2(3,3)       & 
& ,DTd(3,3),adjTd(3,3),Te(3,3),betaTe1(3,3),betaTe2(3,3),DTe(3,3),adjTe(3,3)             & 
& ,Tlam,betaTlam1,betaTlam2,DTlam,Tk,betaTk1,betaTk2,DTk,TLN(3,3),betaTLN1(3,3)          & 
& ,betaTLN2(3,3),DTLN(3,3),adjTLN(3,3),Tu(3,3),betaTu1(3,3),betaTu2(3,3),DTu(3,3)        & 
& ,adjTu(3,3),Tv(3,3),betaTv1(3,3),betaTv2(3,3),DTv(3,3),adjTv(3,3),mq2(3,3)             & 
& ,betamq21(3,3),betamq22(3,3),Dmq2(3,3),ml2(3,3),betaml21(3,3),betaml22(3,3)            & 
& ,Dml2(3,3),md2(3,3),betamd21(3,3),betamd22(3,3),Dmd2(3,3),mu2(3,3),betamu21(3,3)       & 
& ,betamu22(3,3),Dmu2(3,3),me2(3,3),betame21(3,3),betame22(3,3),Dme2(3,3),               & 
& mv2(3,3),betamv21(3,3),betamv22(3,3),Dmv2(3,3),M1,betaM11,betaM12,DM1,M2,              & 
& betaM21,betaM22,DM2,M3,betaM31,betaM32,DM3
Real(dp) :: Tr1(3),Tr2(3),Tr3(3) 
Real(dp) :: Tr2U1(3,3) 
Real(dp) :: Abslam,Abskap,AbsTlam,AbsTk,AbsM1,AbsM2,AbsM3
Complex(dp) :: md2Yd(3,3),me2Ye(3,3),ml2adjYe(3,3),ml2adjYv(3,3),mq2adjYd(3,3),mq2adjYu(3,3),        & 
& mu2Yu(3,3),mv2Yv(3,3),Ydmq2(3,3),YdadjYd(3,3),Yeml2(3,3),YeadjYe(3,3),Yumq2(3,3),      & 
& YuadjYu(3,3),Yvml2(3,3),YvadjYv(3,3),lamNClamN(3,3),adjYdmd2(3,3),adjYdYd(3,3),        & 
& adjYdTd(3,3),adjYeme2(3,3),adjYeYe(3,3),adjYeTe(3,3),adjYumu2(3,3),adjYuYu(3,3),       & 
& adjYuTu(3,3),adjYvmv2(3,3),adjYvYv(3,3),adjYvlamN(3,3),adjYvTv(3,3),adjYvTLN(3,3),     & 
& adjTdTd(3,3),adjTeTe(3,3),adjTuTu(3,3),adjTvTv(3,3),Cmv2ClamN(3,3),CYvTpYv(3,3),       & 
& CYvTpTv(3,3),ClamNmv2(3,3),ClamNYv(3,3),ClamNlamN(3,3),ClamNTv(3,3),ClamNTLN(3,3),     & 
& CTdTpTd(3,3),CTeTpTe(3,3),CTuTpTu(3,3),CTvTpTv(3,3),CTLNTLN(3,3),TdadjTd(3,3),         & 
& TeadjTe(3,3),TuadjTu(3,3),TvadjTv(3,3),TLNCTLN(3,3),md2YdadjYd(3,3),me2YeadjYe(3,3),   & 
& ml2adjYeYe(3,3),ml2adjYvYv(3,3),mq2adjYdYd(3,3),mq2adjYuYu(3,3),mu2YuadjYu(3,3),       & 
& mv2YvadjYv(3,3),mv2lamNClamN(3,3),Ydmq2adjYd(3,3),YdadjYdmd2(3,3),YdadjYdYd(3,3),      & 
& YdadjYdTd(3,3),YdadjYuYu(3,3),YdadjYuTu(3,3),Yeml2adjYe(3,3),YeadjYeme2(3,3),          & 
& YeadjYeYe(3,3),YeadjYeTe(3,3),YeadjYvYv(3,3),YeadjYvTv(3,3),Yumq2adjYu(3,3),           & 
& YuadjYdYd(3,3),YuadjYdTd(3,3),YuadjYumu2(3,3),YuadjYuYu(3,3),YuadjYuTu(3,3),           & 
& Yvml2adjYv(3,3),YvadjYeYe(3,3),YvadjYeTe(3,3),YvadjYvmv2(3,3),YvadjYvYv(3,3),          & 
& YvadjYvlamN(3,3),YvadjYvTv(3,3),YvadjYvTLN(3,3),lamNCmv2ClamN(3,3),lamNCYvTpYv(3,3),   & 
& lamNCYvTpTv(3,3),lamNClamNmv2(3,3),lamNClamNYv(3,3),lamNClamNlamN(3,3),lamNClamNTv(3,3),& 
& lamNClamNTLN(3,3),adjYdmd2Yd(3,3),adjYdYdmq2(3,3),adjYeme2Ye(3,3),adjYeYeml2(3,3),     & 
& adjYumu2Yu(3,3),adjYuYumq2(3,3),adjYvmv2Yv(3,3),adjYvYvml2(3,3),TdadjYdYd(3,3),        & 
& TdadjYuYu(3,3),TeadjYeYe(3,3),TeadjYvYv(3,3),TuadjYdYd(3,3),TuadjYuYu(3,3),            & 
& TvadjYeYe(3,3),TvadjYvYv(3,3),TvadjYvlamN(3,3),TLNCYvTpYv(3,3),TLNClamNYv(3,3),        & 
& TLNClamNlamN(3,3)

Complex(dp) :: Trmd2,Trme2,Trml2,Trmq2,Trmu2,TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYvadjYv,TrlamNClamN,    & 
& TradjYdTd,TradjYeTe,TradjYuTu,TradjYvTv,TrClamNTLN,TrCTdTpTd,TrCTeTpTe,TrCTuTpTu,      & 
& TrCTvTpTv,TrCTLNTLN,Trmd2YdadjYd,Trme2YeadjYe,Trml2adjYeYe,Trml2adjYvYv,               & 
& Trmq2adjYdYd,Trmq2adjYuYu,Trmu2YuadjYu,Trmv2YvadjYv,Trmv2lamNClamN

Real(dp) :: g1p2,g1p3,g2p2,g2p3,g3p2,g3p3

Complex(dp) :: sqrt3ov5,ooSqrt15,lamp2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge308' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters308(gy,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,             & 
& TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3)

Abslam = Conjg(lam)*lam
Abskap = Conjg(kap)*kap
AbsTlam = Conjg(Tlam)*Tlam
AbsTk = Conjg(Tk)*Tk
AbsM1 = Conjg(M1)*M1
AbsM2 = Conjg(M2)*M2
AbsM3 = Conjg(M3)*M3
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(lamN,adjlamN)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yv,adjYv)
Call Adjungate(Td,adjTd)
Call Adjungate(Te,adjTe)
Call Adjungate(TLN,adjTLN)
Call Adjungate(Tu,adjTu)
Call Adjungate(Tv,adjTv)
 md2Yd = Matmul2(md2,Yd,OnlyDiagonal) 
 me2Ye = Matmul2(me2,Ye,OnlyDiagonal) 
 ml2adjYe = Matmul2(ml2,adjYe,OnlyDiagonal) 
 ml2adjYv = Matmul2(ml2,adjYv,OnlyDiagonal) 
 mq2adjYd = Matmul2(mq2,adjYd,OnlyDiagonal) 
 mq2adjYu = Matmul2(mq2,adjYu,OnlyDiagonal) 
 mu2Yu = Matmul2(mu2,Yu,OnlyDiagonal) 
 mv2Yv = Matmul2(mv2,Yv,OnlyDiagonal) 
 Ydmq2 = Matmul2(Yd,mq2,OnlyDiagonal) 
 YdadjYd = Matmul2(Yd,adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 Yeml2 = Matmul2(Ye,ml2,OnlyDiagonal) 
 YeadjYe = Matmul2(Ye,adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 Yumq2 = Matmul2(Yu,mq2,OnlyDiagonal) 
 YuadjYu = Matmul2(Yu,adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 Yvml2 = Matmul2(Yv,ml2,OnlyDiagonal) 
 YvadjYv = Matmul2(Yv,adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYv(i2,i2) =  Real(YvadjYv(i2,i2),dp) 
 lamNClamN = Matmul2(lamN,adjlamN,OnlyDiagonal) 
 adjYdmd2 = Matmul2(adjYd,md2,OnlyDiagonal) 
 adjYdYd = Matmul2(adjYd,Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYdTd = Matmul2(adjYd,Td,OnlyDiagonal) 
 adjYeme2 = Matmul2(adjYe,me2,OnlyDiagonal) 
 adjYeYe = Matmul2(adjYe,Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTe = Matmul2(adjYe,Te,OnlyDiagonal) 
 adjYumu2 = Matmul2(adjYu,mu2,OnlyDiagonal) 
 adjYuYu = Matmul2(adjYu,Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 adjYuTu = Matmul2(adjYu,Tu,OnlyDiagonal) 
 adjYvmv2 = Matmul2(adjYv,mv2,OnlyDiagonal) 
 adjYvYv = Matmul2(adjYv,Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYv(i2,i2) =  Real(adjYvYv(i2,i2),dp) 
 adjYvlamN = Matmul2(adjYv,lamN,OnlyDiagonal) 
 adjYvTv = Matmul2(adjYv,Tv,OnlyDiagonal) 
 adjYvTLN = Matmul2(adjYv,TLN,OnlyDiagonal) 
 adjTdTd = Matmul2(adjTd,Td,OnlyDiagonal) 
 adjTeTe = Matmul2(adjTe,Te,OnlyDiagonal) 
 adjTuTu = Matmul2(adjTu,Tu,OnlyDiagonal) 
 adjTvTv = Matmul2(adjTv,Tv,OnlyDiagonal) 
 Cmv2ClamN = Matmul2(Conjg(mv2),adjlamN,OnlyDiagonal) 
 CYvTpYv = Matmul2(Conjg(Yv),Transpose(Yv),OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYv(i2,i2) =  Real(CYvTpYv(i2,i2),dp) 
 CYvTpTv = Matmul2(Conjg(Yv),Transpose(Tv),OnlyDiagonal) 
 ClamNmv2 = Matmul2(adjlamN,mv2,OnlyDiagonal) 
 ClamNYv = Matmul2(adjlamN,Yv,OnlyDiagonal) 
 ClamNlamN = Matmul2(adjlamN,lamN,OnlyDiagonal) 
 ClamNTv = Matmul2(adjlamN,Tv,OnlyDiagonal) 
 ClamNTLN = Matmul2(adjlamN,TLN,OnlyDiagonal) 
 CTdTpTd = Matmul2(Conjg(Td),Transpose(Td),OnlyDiagonal) 
Forall(i2=1:3)  CTdTpTd(i2,i2) =  Real(CTdTpTd(i2,i2),dp) 
 CTeTpTe = Matmul2(Conjg(Te),Transpose(Te),OnlyDiagonal) 
Forall(i2=1:3)  CTeTpTe(i2,i2) =  Real(CTeTpTe(i2,i2),dp) 
 CTuTpTu = Matmul2(Conjg(Tu),Transpose(Tu),OnlyDiagonal) 
Forall(i2=1:3)  CTuTpTu(i2,i2) =  Real(CTuTpTu(i2,i2),dp) 
 CTvTpTv = Matmul2(Conjg(Tv),Transpose(Tv),OnlyDiagonal) 
Forall(i2=1:3)  CTvTpTv(i2,i2) =  Real(CTvTpTv(i2,i2),dp) 
 CTLNTLN = Matmul2(adjTLN,TLN,OnlyDiagonal) 
 TdadjTd = Matmul2(Td,adjTd,OnlyDiagonal) 
 TeadjTe = Matmul2(Te,adjTe,OnlyDiagonal) 
 TuadjTu = Matmul2(Tu,adjTu,OnlyDiagonal) 
 TvadjTv = Matmul2(Tv,adjTv,OnlyDiagonal) 
 TLNCTLN = Matmul2(TLN,adjTLN,OnlyDiagonal) 
 md2YdadjYd = Matmul2(md2,YdadjYd,OnlyDiagonal) 
 me2YeadjYe = Matmul2(me2,YeadjYe,OnlyDiagonal) 
 ml2adjYeYe = Matmul2(ml2,adjYeYe,OnlyDiagonal) 
 ml2adjYvYv = Matmul2(ml2,adjYvYv,OnlyDiagonal) 
 mq2adjYdYd = Matmul2(mq2,adjYdYd,OnlyDiagonal) 
 mq2adjYuYu = Matmul2(mq2,adjYuYu,OnlyDiagonal) 
 mu2YuadjYu = Matmul2(mu2,YuadjYu,OnlyDiagonal) 
 mv2YvadjYv = Matmul2(mv2,YvadjYv,OnlyDiagonal) 
 mv2lamNClamN = Matmul2(mv2,lamNClamN,OnlyDiagonal) 
 Ydmq2adjYd = Matmul2(Yd,mq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  Ydmq2adjYd(i2,i2) =  Real(Ydmq2adjYd(i2,i2),dp) 
 YdadjYdmd2 = Matmul2(Yd,adjYdmd2,OnlyDiagonal) 
 YdadjYdYd = Matmul2(Yd,adjYdYd,OnlyDiagonal) 
 YdadjYdTd = Matmul2(Yd,adjYdTd,OnlyDiagonal) 
 YdadjYuYu = Matmul2(Yd,adjYuYu,OnlyDiagonal) 
 YdadjYuTu = Matmul2(Yd,adjYuTu,OnlyDiagonal) 
 Yeml2adjYe = Matmul2(Ye,ml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  Yeml2adjYe(i2,i2) =  Real(Yeml2adjYe(i2,i2),dp) 
 YeadjYeme2 = Matmul2(Ye,adjYeme2,OnlyDiagonal) 
 YeadjYeYe = Matmul2(Ye,adjYeYe,OnlyDiagonal) 
 YeadjYeTe = Matmul2(Ye,adjYeTe,OnlyDiagonal) 
 YeadjYvYv = Matmul2(Ye,adjYvYv,OnlyDiagonal) 
 YeadjYvTv = Matmul2(Ye,adjYvTv,OnlyDiagonal) 
 Yumq2adjYu = Matmul2(Yu,mq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  Yumq2adjYu(i2,i2) =  Real(Yumq2adjYu(i2,i2),dp) 
 YuadjYdYd = Matmul2(Yu,adjYdYd,OnlyDiagonal) 
 YuadjYdTd = Matmul2(Yu,adjYdTd,OnlyDiagonal) 
 YuadjYumu2 = Matmul2(Yu,adjYumu2,OnlyDiagonal) 
 YuadjYuYu = Matmul2(Yu,adjYuYu,OnlyDiagonal) 
 YuadjYuTu = Matmul2(Yu,adjYuTu,OnlyDiagonal) 
 Yvml2adjYv = Matmul2(Yv,ml2adjYv,OnlyDiagonal) 
Forall(i2=1:3)  Yvml2adjYv(i2,i2) =  Real(Yvml2adjYv(i2,i2),dp) 
 YvadjYeYe = Matmul2(Yv,adjYeYe,OnlyDiagonal) 
 YvadjYeTe = Matmul2(Yv,adjYeTe,OnlyDiagonal) 
 YvadjYvmv2 = Matmul2(Yv,adjYvmv2,OnlyDiagonal) 
 YvadjYvYv = Matmul2(Yv,adjYvYv,OnlyDiagonal) 
 YvadjYvlamN = Matmul2(Yv,adjYvlamN,OnlyDiagonal) 
 YvadjYvTv = Matmul2(Yv,adjYvTv,OnlyDiagonal) 
 YvadjYvTLN = Matmul2(Yv,adjYvTLN,OnlyDiagonal) 
 lamNCmv2ClamN = Matmul2(lamN,Cmv2ClamN,OnlyDiagonal) 
 lamNCYvTpYv = Matmul2(lamN,CYvTpYv,OnlyDiagonal) 
 lamNCYvTpTv = Matmul2(lamN,CYvTpTv,OnlyDiagonal) 
 lamNClamNmv2 = Matmul2(lamN,ClamNmv2,OnlyDiagonal) 
 lamNClamNYv = Matmul2(lamN,ClamNYv,OnlyDiagonal) 
 lamNClamNlamN = Matmul2(lamN,ClamNlamN,OnlyDiagonal) 
 lamNClamNTv = Matmul2(lamN,ClamNTv,OnlyDiagonal) 
 lamNClamNTLN = Matmul2(lamN,ClamNTLN,OnlyDiagonal) 
 adjYdmd2Yd = Matmul2(adjYd,md2Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdmd2Yd(i2,i2) =  Real(adjYdmd2Yd(i2,i2),dp) 
 adjYdYdmq2 = Matmul2(adjYd,Ydmq2,OnlyDiagonal) 
 adjYeme2Ye = Matmul2(adjYe,me2Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeme2Ye(i2,i2) =  Real(adjYeme2Ye(i2,i2),dp) 
 adjYeYeml2 = Matmul2(adjYe,Yeml2,OnlyDiagonal) 
 adjYumu2Yu = Matmul2(adjYu,mu2Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYumu2Yu(i2,i2) =  Real(adjYumu2Yu(i2,i2),dp) 
 adjYuYumq2 = Matmul2(adjYu,Yumq2,OnlyDiagonal) 
 adjYvmv2Yv = Matmul2(adjYv,mv2Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvmv2Yv(i2,i2) =  Real(adjYvmv2Yv(i2,i2),dp) 
 adjYvYvml2 = Matmul2(adjYv,Yvml2,OnlyDiagonal) 
 TdadjYdYd = Matmul2(Td,adjYdYd,OnlyDiagonal) 
 TdadjYuYu = Matmul2(Td,adjYuYu,OnlyDiagonal) 
 TeadjYeYe = Matmul2(Te,adjYeYe,OnlyDiagonal) 
 TeadjYvYv = Matmul2(Te,adjYvYv,OnlyDiagonal) 
 TuadjYdYd = Matmul2(Tu,adjYdYd,OnlyDiagonal) 
 TuadjYuYu = Matmul2(Tu,adjYuYu,OnlyDiagonal) 
 TvadjYeYe = Matmul2(Tv,adjYeYe,OnlyDiagonal) 
 TvadjYvYv = Matmul2(Tv,adjYvYv,OnlyDiagonal) 
 TvadjYvlamN = Matmul2(Tv,adjYvlamN,OnlyDiagonal) 
 TLNCYvTpYv = Matmul2(TLN,CYvTpYv,OnlyDiagonal) 
 TLNClamNYv = Matmul2(TLN,ClamNYv,OnlyDiagonal) 
 TLNClamNlamN = Matmul2(TLN,ClamNlamN,OnlyDiagonal) 
 Trmd2 = Real(cTrace(md2),dp) 
 Trme2 = Real(cTrace(me2),dp) 
 Trml2 = Real(cTrace(ml2),dp) 
 Trmq2 = Real(cTrace(mq2),dp) 
 Trmu2 = Real(cTrace(mu2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYvadjYv = Real(cTrace(YvadjYv),dp) 
 TrlamNClamN = cTrace(lamNClamN) 
 TradjYdTd = cTrace(adjYdTd) 
 TradjYeTe = cTrace(adjYeTe) 
 TradjYuTu = cTrace(adjYuTu) 
 TradjYvTv = cTrace(adjYvTv) 
 TrClamNTLN = cTrace(ClamNTLN) 
 TrCTdTpTd = Real(cTrace(CTdTpTd),dp) 
 TrCTeTpTe = Real(cTrace(CTeTpTe),dp) 
 TrCTuTpTu = Real(cTrace(CTuTpTu),dp) 
 TrCTvTpTv = Real(cTrace(CTvTpTv),dp) 
 TrCTLNTLN = cTrace(CTLNTLN) 
 Trmd2YdadjYd = cTrace(md2YdadjYd) 
 Trme2YeadjYe = cTrace(me2YeadjYe) 
 Trml2adjYeYe = cTrace(ml2adjYeYe) 
 Trml2adjYvYv = cTrace(ml2adjYvYv) 
 Trmq2adjYdYd = cTrace(mq2adjYdYd) 
 Trmq2adjYuYu = cTrace(mq2adjYuYu) 
 Trmu2YuadjYu = cTrace(mu2YuadjYu) 
 Trmv2YvadjYv = cTrace(mv2YvadjYv) 
 Trmv2lamNClamN = cTrace(mv2lamNClamN) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g3p2 =g3**2 
 g3p3 =g3**3 
 lamp2 =lam**2 


If (TwoLoopRGE) Then 
End If 
 
 
Tr1(1) = g1*sqrt3ov5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 + Trmq2 -          & 
&  2._dp*(Trmu2))

If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 33._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = g2p3

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = (Abslam - 7._dp*(g1p2)/15._dp - 3._dp*(g2p2) - 16._dp*(g3p2)               & 
& /3._dp + 3._dp*(TrYdadjYd) + TrYeadjYe)*Yd + 3._dp*(YdadjYdYd) + YdadjYuYu

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = (Abslam - 9._dp*(g1p2)/5._dp - 3._dp*(g2p2) + 3._dp*(TrYdadjYd)            & 
&  + TrYeadjYe)*Ye + 3._dp*(YeadjYeYe) + YeadjYvYv

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! lam 
!-------------------- 
 
betalam1  = 2*Abskap*lam - (3*g1p2*lam)/5._dp - 3*g2p2*lam + 2*TrlamNClamN*lam +      & 
&  3*TrYdadjYd*lam + TrYeadjYe*lam + 3*TrYuadjYu*lam + TrYvadjYv*lam + 4*lamp2*Conjg(lam)

 
 
If (TwoLoopRGE) Then 
betalam2 = 0

 
Dlam = oo16pi2*( betalam1 + oo16pi2 * betalam2 ) 

 
Else 
Dlam = oo16pi2* betalam1 
End If 
 
 
Call Chop(Dlam) 

!-------------------- 
! kap 
!-------------------- 
 
betakap1  = 6*(Abskap + Abslam + TrlamNClamN)*kap

 
 
If (TwoLoopRGE) Then 
betakap2 = 0

 
Dkap = oo16pi2*( betakap1 + oo16pi2 * betakap2 ) 

 
Else 
Dkap = oo16pi2* betakap1 
End If 
 
 
Call Chop(Dkap) 

!-------------------- 
! lamN 
!-------------------- 
 
betalamN1  = 2*(4._dp*(lamNClamNlamN) + lamNCYvTpYv + YvadjYvlamN + Abskap*lamN +     & 
&  Abslam*lamN + TrlamNClamN*lamN)

 
 
If (TwoLoopRGE) Then 
betalamN2 = 0

 
DlamN = oo16pi2*( betalamN1 + oo16pi2 * betalamN2 ) 

 
Else 
DlamN = oo16pi2* betalamN1 
End If 
 
 
Call Chop(DlamN) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (Abslam - 13._dp*(g1p2)/15._dp - 3._dp*(g2p2) - 16._dp*(g3p2)              & 
& /3._dp + 3._dp*(TrYuadjYu) + TrYvadjYv)*Yu + YuadjYdYd + 3._dp*(YuadjYuYu)

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yv 
!-------------------- 
 
betaYv1  = 4._dp*(lamNClamNYv) + (Abslam - 3._dp*(g1p2)/5._dp - 3._dp*(g2p2)          & 
&  + 3._dp*(TrYuadjYu) + TrYvadjYv)*Yv + YvadjYeYe + 3._dp*(YvadjYvYv)

 
 
If (TwoLoopRGE) Then 
betaYv2 = 0

 
DYv = oo16pi2*( betaYv1 + oo16pi2 * betaYv2 ) 

 
Else 
DYv = oo16pi2* betaYv1 
End If 
 
 
Call Chop(DYv) 

!-------------------- 
! Td 
!-------------------- 
 
betaTd1  = 5._dp*(TdadjYdYd) + TdadjYuYu + 4._dp*(YdadjYdTd) + 2._dp*(YdadjYuTu)      & 
&  + Abslam*Td - (7*g1p2*Td)/15._dp - 3*g2p2*Td - (16*g3p2*Td)/3._dp + 3*TrYdadjYd*Td +  & 
&  TrYeadjYe*Td + Yd*((14*g1p2*M1)/15._dp + (32*g3p2*M3)/3._dp + 6*g2p2*M2 +             & 
&  6._dp*(TradjYdTd) + 2._dp*(TradjYeTe) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTd2 = 0

 
DTd = oo16pi2*( betaTd1 + oo16pi2 * betaTd2 ) 

 
Else 
DTd = oo16pi2* betaTd1 
End If 
 
 
Call Chop(DTd) 

!-------------------- 
! Te 
!-------------------- 
 
betaTe1  = 5._dp*(TeadjYeYe) + TeadjYvYv + 4._dp*(YeadjYeTe) + 2._dp*(YeadjYvTv)      & 
&  + Abslam*Te - (9*g1p2*Te)/5._dp - 3*g2p2*Te + 3*TrYdadjYd*Te + TrYeadjYe*Te +         & 
&  Ye*((18*g1p2*M1)/5._dp + 6*g2p2*M2 + 6._dp*(TradjYdTd) + 2._dp*(TradjYeTe)            & 
&  + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTe2 = 0

 
DTe = oo16pi2*( betaTe1 + oo16pi2 * betaTe2 ) 

 
Else 
DTe = oo16pi2* betaTe1 
End If 
 
 
Call Chop(DTe) 

!-------------------- 
! Tlam 
!-------------------- 
 
betaTlam1  = (2*(3*g1p2*M1 + 15*g2p2*M2 + 15._dp*(TradjYdTd) + 5._dp*(TradjYeTe)      & 
&  + 15._dp*(TradjYuTu) + 5._dp*(TradjYvTv) + 10._dp*(TrClamNTLN))*lam)/5._dp +          & 
&  (12._dp*(Abslam) - 3._dp*(g1p2)/5._dp - 3._dp*(g2p2) + 2._dp*(TrlamNClamN)            & 
&  + 3._dp*(TrYdadjYd) + TrYeadjYe + 3._dp*(TrYuadjYu) + TrYvadjYv)*Tlam +               & 
&  2*Conjg(kap)*(2*lam*Tk + kap*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTlam2 = 0

 
DTlam = oo16pi2*( betaTlam1 + oo16pi2 * betaTlam2 ) 

 
Else 
DTlam = oo16pi2* betaTlam1 
End If 
 
 
Call Chop(DTlam) 

!-------------------- 
! Tk 
!-------------------- 
 
betaTk1  = 6*(2*TrClamNTLN*kap + 3*Abskap*Tk + TrlamNClamN*Tk + Conjg(lam)            & 
& *(lam*Tk + 2*kap*Tlam))

 
 
If (TwoLoopRGE) Then 
betaTk2 = 0

 
DTk = oo16pi2*( betaTk1 + oo16pi2 * betaTk2 ) 

 
Else 
DTk = oo16pi2* betaTk1 
End If 
 
 
Call Chop(DTk) 

!-------------------- 
! TLN 
!-------------------- 
 
betaTLN1  = 2*(6._dp*(lamNClamNTLN) + 2._dp*(lamNCYvTpTv) + 6._dp*(TLNClamNlamN)      & 
&  + TLNCYvTpYv + 2._dp*(TvadjYvlamN) + YvadjYvTLN + 2*TrClamNTLN*lamN + TrlamNClamN*TLN +& 
&  Conjg(kap)*(2*lamN*Tk + kap*TLN) + Conjg(lam)*(2*lamN*Tlam + lam*TLN))

 
 
If (TwoLoopRGE) Then 
betaTLN2 = 0

 
DTLN = oo16pi2*( betaTLN1 + oo16pi2 * betaTLN2 ) 

 
Else 
DTLN = oo16pi2* betaTLN1 
End If 
 
 
Call Chop(DTLN) 

!-------------------- 
! Tu 
!-------------------- 
 
betaTu1  = TuadjYdYd + 5._dp*(TuadjYuYu) + 2._dp*(YuadjYdTd) + 4._dp*(YuadjYuTu)      & 
&  + Abslam*Tu - (13*g1p2*Tu)/15._dp - 3*g2p2*Tu - (16*g3p2*Tu)/3._dp + 3*TrYuadjYu*Tu + & 
&  TrYvadjYv*Tu + Yu*((26*g1p2*M1)/15._dp + (32*g3p2*M3)/3._dp + 6*g2p2*M2 +             & 
&  6._dp*(TradjYuTu) + 2._dp*(TradjYvTv) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTu2 = 0

 
DTu = oo16pi2*( betaTu1 + oo16pi2 * betaTu2 ) 

 
Else 
DTu = oo16pi2* betaTu1 
End If 
 
 
Call Chop(DTu) 

!-------------------- 
! Tv 
!-------------------- 
 
betaTv1  = 4._dp*(lamNClamNTv) + 8._dp*(TLNClamNYv) + TvadjYeYe + 5._dp*(TvadjYvYv)   & 
&  + 2._dp*(YvadjYeTe) + 4._dp*(YvadjYvTv) + Abslam*Tv - (3*g1p2*Tv)/5._dp -             & 
&  3*g2p2*Tv + 3*TrYuadjYu*Tv + TrYvadjYv*Tv + Yv*((6*g1p2*M1)/5._dp + 6*g2p2*M2 +       & 
&  6._dp*(TradjYuTu) + 2._dp*(TradjYvTv) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTv2 = 0

 
DTv = oo16pi2*( betaTv1 + oo16pi2 * betaTv2 ) 

 
Else 
DTv = oo16pi2* betaTv1 
End If 
 
 
Call Chop(DTv) 

!-------------------- 
! mq2 
!-------------------- 
 
betamq21  = 2._dp*(adjTdTd) + 2._dp*(adjTuTu) + 2._dp*(adjYdmd2Yd) + adjYdYdmq2 +     & 
&  2._dp*(adjYumu2Yu) + adjYuYumq2 - (2*AbsM1*g1p2*id3R)/15._dp - 6*AbsM2*g2p2*id3R -    & 
&  (32*AbsM3*g3p2*id3R)/3._dp + 2*adjYdYd*mHd2 + 2*adjYuYu*mHu2 + mq2adjYdYd +           & 
&  mq2adjYuYu + g1*id3R*ooSqrt15*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamq22 = 0

 
Dmq2 = oo16pi2*( betamq21 + oo16pi2 * betamq22 ) 

 
Else 
Dmq2 = oo16pi2* betamq21 
End If 
 
 
Call Chop(Dmq2) 

Forall(i1=1:3) Dmq2(i1,i1) =  Real(Dmq2(i1,i1),dp) 
Dmq2 = 0.5_dp*(Dmq2+ Conjg(Transpose(Dmq2)) ) 
!-------------------- 
! ml2 
!-------------------- 
 
betaml21  = 2._dp*(adjTeTe) + 2._dp*(adjTvTv) + 2._dp*(adjYeme2Ye) + adjYeYeml2 +     & 
&  2._dp*(adjYvmv2Yv) + adjYvYvml2 - (6*AbsM1*g1p2*id3R)/5._dp - 6*AbsM2*g2p2*id3R +     & 
&  2*adjYeYe*mHd2 + 2*adjYvYv*mHu2 + ml2adjYeYe + ml2adjYvYv - g1*id3R*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betaml22 = 0

 
Dml2 = oo16pi2*( betaml21 + oo16pi2 * betaml22 ) 

 
Else 
Dml2 = oo16pi2* betaml21 
End If 
 
 
Call Chop(Dml2) 

Forall(i1=1:3) Dml2(i1,i1) =  Real(Dml2(i1,i1),dp) 
Dml2 = 0.5_dp*(Dml2+ Conjg(Transpose(Dml2)) ) 
!-------------------- 
! mHd2 
!-------------------- 
 
betamHd21  = 2._dp*(AbsTlam) - (6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 2*Abslam*mHd2 +  & 
&  2*Abslam*mHu2 + 2*Abslam*ms2 + 6._dp*(TrCTdTpTd) + 2._dp*(TrCTeTpTe) + 6._dp*(Trmd2YdadjYd)& 
&  + 2._dp*(Trme2YeadjYe) + 2._dp*(Trml2adjYeYe) + 6._dp*(Trmq2adjYdYd) + 6*mHd2*TrYdadjYd +& 
&  2*mHd2*TrYeadjYe - g1*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamHd22 = 0

 
DmHd2 = oo16pi2*( betamHd21 + oo16pi2 * betamHd22 ) 

 
Else 
DmHd2 = oo16pi2* betamHd21 
End If 
 
 
!-------------------- 
! mHu2 
!-------------------- 
 
betamHu21  = 2._dp*(AbsTlam) - (6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 2*Abslam*mHd2 +  & 
&  2*Abslam*mHu2 + 2*Abslam*ms2 + 6._dp*(TrCTuTpTu) + 2._dp*(TrCTvTpTv) + 2._dp*(Trml2adjYvYv)& 
&  + 6._dp*(Trmq2adjYuYu) + 6._dp*(Trmu2YuadjYu) + 2._dp*(Trmv2YvadjYv) + 6*mHu2*TrYuadjYu +& 
&  2*mHu2*TrYvadjYv + g1*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamHu22 = 0

 
DmHu2 = oo16pi2*( betamHu21 + oo16pi2 * betamHu22 ) 

 
Else 
DmHu2 = oo16pi2* betamHu21 
End If 
 
 
!-------------------- 
! md2 
!-------------------- 
 
betamd21  = (-8*AbsM1*g1p2*id3R)/15._dp - (32*AbsM3*g3p2*id3R)/3._dp + 2._dp*(md2YdadjYd)& 
&  + 4._dp*(TdadjTd) + 4*mHd2*YdadjYd + 2._dp*(YdadjYdmd2) + 4._dp*(Ydmq2adjYd)          & 
&  + 2*g1*id3R*ooSqrt15*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamd22 = 0

 
Dmd2 = oo16pi2*( betamd21 + oo16pi2 * betamd22 ) 

 
Else 
Dmd2 = oo16pi2* betamd21 
End If 
 
 
Call Chop(Dmd2) 

Forall(i1=1:3) Dmd2(i1,i1) =  Real(Dmd2(i1,i1),dp) 
Dmd2 = 0.5_dp*(Dmd2+ Conjg(Transpose(Dmd2)) ) 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = (-32*AbsM1*g1p2*id3R)/15._dp - (32*AbsM3*g3p2*id3R)/3._dp +               & 
&  2._dp*(mu2YuadjYu) + 4._dp*(TuadjTu) + 4*mHu2*YuadjYu + 2._dp*(YuadjYumu2)            & 
&  + 4._dp*(Yumq2adjYu) - 4*g1*id3R*ooSqrt15*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Forall(i1=1:3) Dmu2(i1,i1) =  Real(Dmu2(i1,i1),dp) 
Dmu2 = 0.5_dp*(Dmu2+ Conjg(Transpose(Dmu2)) ) 
!-------------------- 
! me2 
!-------------------- 
 
betame21  = (-24*AbsM1*g1p2*id3R)/5._dp + 2*(me2YeadjYe + 2._dp*(TeadjTe)             & 
&  + 2*mHd2*YeadjYe + YeadjYeme2 + 2._dp*(Yeml2adjYe)) + 2*g1*id3R*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betame22 = 0

 
Dme2 = oo16pi2*( betame21 + oo16pi2 * betame22 ) 

 
Else 
Dme2 = oo16pi2* betame21 
End If 
 
 
Call Chop(Dme2) 

Forall(i1=1:3) Dme2(i1,i1) =  Real(Dme2(i1,i1),dp) 
Dme2 = 0.5_dp*(Dme2+ Conjg(Transpose(Dme2)) ) 
!-------------------- 
! mv2 
!-------------------- 
 
betamv21  = 2*(2._dp*(lamNClamNmv2) + 4._dp*(lamNCmv2ClamN) + 4*lamNClamN*ms2 +       & 
&  2._dp*(mv2lamNClamN) + mv2YvadjYv + 4._dp*(TLNCTLN) + 2._dp*(TvadjTv) +               & 
&  2*mHu2*YvadjYv + YvadjYvmv2 + 2._dp*(Yvml2adjYv))

 
 
If (TwoLoopRGE) Then 
betamv22 = 0

 
Dmv2 = oo16pi2*( betamv21 + oo16pi2 * betamv22 ) 

 
Else 
Dmv2 = oo16pi2* betamv21 
End If 
 
 
Call Chop(Dmv2) 

Forall(i1=1:3) Dmv2(i1,i1) =  Real(Dmv2(i1,i1),dp) 
Dmv2 = 0.5_dp*(Dmv2+ Conjg(Transpose(Dmv2)) ) 
!-------------------- 
! ms2 
!-------------------- 
 
betams21  = 4*(AbsTk + AbsTlam + 3*Abskap*ms2 + Abslam*(mHd2 + mHu2 + ms2)            & 
&  + TrCTLNTLN + ms2*TrlamNClamN + 2._dp*(Trmv2lamNClamN))

 
 
If (TwoLoopRGE) Then 
betams22 = 0

 
Dms2 = oo16pi2*( betams21 + oo16pi2 * betams22 ) 

 
Else 
Dms2 = oo16pi2* betams21 
End If 
 
 
!-------------------- 
! M1 
!-------------------- 
 
betaM11  = (66*g1p2*M1)/5._dp

 
 
If (TwoLoopRGE) Then 
betaM12 = 0

 
DM1 = oo16pi2*( betaM11 + oo16pi2 * betaM12 ) 

 
Else 
DM1 = oo16pi2* betaM11 
End If 
 
 
Call Chop(DM1) 

!-------------------- 
! M2 
!-------------------- 
 
betaM21  = 2*g2p2*M2

 
 
If (TwoLoopRGE) Then 
betaM22 = 0

 
DM2 = oo16pi2*( betaM21 + oo16pi2 * betaM22 ) 

 
Else 
DM2 = oo16pi2* betaM21 
End If 
 
 
Call Chop(DM2) 

!-------------------- 
! M3 
!-------------------- 
 
betaM31  = -6*g3p2*M3

 
 
If (TwoLoopRGE) Then 
betaM32 = 0

 
DM3 = oo16pi2*( betaM31 + oo16pi2 * betaM32 ) 

 
Else 
DM3 = oo16pi2* betaM31 
End If 
 
 
Call Chop(DM3) 

Call ParametersToG308(Dg1,Dg2,Dg3,DYd,DYe,Dlam,Dkap,DlamN,DYu,DYv,DTd,DTe,            & 
& DTlam,DTk,DTLN,DTu,DTv,Dmq2,Dml2,DmHd2,DmHu2,Dmd2,Dmu2,Dme2,Dmv2,Dms2,DM1,             & 
& DM2,DM3,f)

Iname = Iname - 1 
 
End Subroutine rge308  

Subroutine GToParameters311(g,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,           & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS)

Implicit None 
Real(dp), Intent(in) :: g(311) 
Real(dp),Intent(out) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters311' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+4), g(SumI+5), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+22), g(SumI+23), dp) 
End Do 
 End Do 
 
lam= Cmplx(g(40),g(41),dp) 
kap= Cmplx(g(42),g(43),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
lamN(i1,i2) = Cmplx( g(SumI+44), g(SumI+45), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+62), g(SumI+63), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yv(i1,i2) = Cmplx( g(SumI+80), g(SumI+81), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Td(i1,i2) = Cmplx( g(SumI+98), g(SumI+99), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Te(i1,i2) = Cmplx( g(SumI+116), g(SumI+117), dp) 
End Do 
 End Do 
 
Tlam= Cmplx(g(134),g(135),dp) 
Tk= Cmplx(g(136),g(137),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
TLN(i1,i2) = Cmplx( g(SumI+138), g(SumI+139), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tu(i1,i2) = Cmplx( g(SumI+156), g(SumI+157), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tv(i1,i2) = Cmplx( g(SumI+174), g(SumI+175), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mq2(i1,i2) = Cmplx( g(SumI+192), g(SumI+193), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
ml2(i1,i2) = Cmplx( g(SumI+210), g(SumI+211), dp) 
End Do 
 End Do 
 
mHd2= g(228) 
mHu2= g(229) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
md2(i1,i2) = Cmplx( g(SumI+230), g(SumI+231), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mu2(i1,i2) = Cmplx( g(SumI+248), g(SumI+249), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
me2(i1,i2) = Cmplx( g(SumI+266), g(SumI+267), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mv2(i1,i2) = Cmplx( g(SumI+284), g(SumI+285), dp) 
End Do 
 End Do 
 
ms2= g(302) 
M1= Cmplx(g(303),g(304),dp) 
M2= Cmplx(g(305),g(306),dp) 
M3= Cmplx(g(307),g(308),dp) 
vd= g(309) 
vu= g(310) 
vS= g(311) 
Do i1=1,311 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters311

Subroutine ParametersToG311(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,             & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,g)

Implicit None 
Real(dp), Intent(out) :: g(311) 
Real(dp), Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp), Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG311' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+4) = Real(Yd(i1,i2), dp) 
g(SumI+5) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+22) = Real(Ye(i1,i2), dp) 
g(SumI+23) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(40) = Real(lam,dp)  
g(41) = Aimag(lam)  
g(42) = Real(kap,dp)  
g(43) = Aimag(kap)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+44) = Real(lamN(i1,i2), dp) 
g(SumI+45) = Aimag(lamN(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+62) = Real(Yu(i1,i2), dp) 
g(SumI+63) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+80) = Real(Yv(i1,i2), dp) 
g(SumI+81) = Aimag(Yv(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+98) = Real(Td(i1,i2), dp) 
g(SumI+99) = Aimag(Td(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+116) = Real(Te(i1,i2), dp) 
g(SumI+117) = Aimag(Te(i1,i2)) 
End Do 
End Do 

g(134) = Real(Tlam,dp)  
g(135) = Aimag(Tlam)  
g(136) = Real(Tk,dp)  
g(137) = Aimag(Tk)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+138) = Real(TLN(i1,i2), dp) 
g(SumI+139) = Aimag(TLN(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+156) = Real(Tu(i1,i2), dp) 
g(SumI+157) = Aimag(Tu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+174) = Real(Tv(i1,i2), dp) 
g(SumI+175) = Aimag(Tv(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+192) = Real(mq2(i1,i2), dp) 
g(SumI+193) = Aimag(mq2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+210) = Real(ml2(i1,i2), dp) 
g(SumI+211) = Aimag(ml2(i1,i2)) 
End Do 
End Do 

g(228) = mHd2  
g(229) = mHu2  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+230) = Real(md2(i1,i2), dp) 
g(SumI+231) = Aimag(md2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+248) = Real(mu2(i1,i2), dp) 
g(SumI+249) = Aimag(mu2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+266) = Real(me2(i1,i2), dp) 
g(SumI+267) = Aimag(me2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+284) = Real(mv2(i1,i2), dp) 
g(SumI+285) = Aimag(mv2(i1,i2)) 
End Do 
End Do 

g(302) = ms2  
g(303) = Real(M1,dp)  
g(304) = Aimag(M1)  
g(305) = Real(M2,dp)  
g(306) = Aimag(M2)  
g(307) = Real(M3,dp)  
g(308) = Aimag(M3)  
g(309) = vd  
g(310) = vu  
g(311) = vS  
Iname = Iname - 1 
 
End Subroutine ParametersToG311

Subroutine rge311(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,mHd2,betamHd21,betamHd22,DmHd2,mHu2,betamHu21,betamHu22,DmHu2,ms2,betams21,        & 
& betams22,Dms2,vd,betavd1,betavd2,Dvd,vu,betavu1,betavu2,Dvu,vS,betavS1,betavS2,DvS
Complex(dp) :: Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)          & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),lam,betalam1,betalam2,Dlam,             & 
& kap,betakap1,betakap2,Dkap,lamN(3,3),betalamN1(3,3),betalamN2(3,3),DlamN(3,3)          & 
& ,adjlamN(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yv(3,3)            & 
& ,betaYv1(3,3),betaYv2(3,3),DYv(3,3),adjYv(3,3),Td(3,3),betaTd1(3,3),betaTd2(3,3)       & 
& ,DTd(3,3),adjTd(3,3),Te(3,3),betaTe1(3,3),betaTe2(3,3),DTe(3,3),adjTe(3,3)             & 
& ,Tlam,betaTlam1,betaTlam2,DTlam,Tk,betaTk1,betaTk2,DTk,TLN(3,3),betaTLN1(3,3)          & 
& ,betaTLN2(3,3),DTLN(3,3),adjTLN(3,3),Tu(3,3),betaTu1(3,3),betaTu2(3,3),DTu(3,3)        & 
& ,adjTu(3,3),Tv(3,3),betaTv1(3,3),betaTv2(3,3),DTv(3,3),adjTv(3,3),mq2(3,3)             & 
& ,betamq21(3,3),betamq22(3,3),Dmq2(3,3),ml2(3,3),betaml21(3,3),betaml22(3,3)            & 
& ,Dml2(3,3),md2(3,3),betamd21(3,3),betamd22(3,3),Dmd2(3,3),mu2(3,3),betamu21(3,3)       & 
& ,betamu22(3,3),Dmu2(3,3),me2(3,3),betame21(3,3),betame22(3,3),Dme2(3,3),               & 
& mv2(3,3),betamv21(3,3),betamv22(3,3),Dmv2(3,3),M1,betaM11,betaM12,DM1,M2,              & 
& betaM21,betaM22,DM2,M3,betaM31,betaM32,DM3
Real(dp) :: Tr1(3),Tr2(3),Tr3(3) 
Real(dp) :: Tr2U1(3,3) 
Real(dp) :: Abslam,Abskap,AbsTlam,AbsTk,AbsM1,AbsM2,AbsM3
Complex(dp) :: md2Yd(3,3),me2Ye(3,3),ml2adjYe(3,3),ml2adjYv(3,3),mq2adjYd(3,3),mq2adjYu(3,3),        & 
& mu2Yu(3,3),mv2Yv(3,3),Ydmq2(3,3),YdadjYd(3,3),Yeml2(3,3),YeadjYe(3,3),Yumq2(3,3),      & 
& YuadjYu(3,3),Yvml2(3,3),YvadjYv(3,3),lamNClamN(3,3),adjYdmd2(3,3),adjYdYd(3,3),        & 
& adjYdTd(3,3),adjYeme2(3,3),adjYeYe(3,3),adjYeTe(3,3),adjYumu2(3,3),adjYuYu(3,3),       & 
& adjYuTu(3,3),adjYvmv2(3,3),adjYvYv(3,3),adjYvlamN(3,3),adjYvTv(3,3),adjYvTLN(3,3),     & 
& adjTdTd(3,3),adjTeTe(3,3),adjTuTu(3,3),adjTvTv(3,3),Cmv2ClamN(3,3),CYvTpYv(3,3),       & 
& CYvTpTv(3,3),ClamNmv2(3,3),ClamNYv(3,3),ClamNlamN(3,3),ClamNTv(3,3),ClamNTLN(3,3),     & 
& CTdTpTd(3,3),CTeTpTe(3,3),CTuTpTu(3,3),CTvTpTv(3,3),CTLNTLN(3,3),TdadjTd(3,3),         & 
& TeadjTe(3,3),TuadjTu(3,3),TvadjTv(3,3),TLNCTLN(3,3),md2YdadjYd(3,3),me2YeadjYe(3,3),   & 
& ml2adjYeYe(3,3),ml2adjYvYv(3,3),mq2adjYdYd(3,3),mq2adjYuYu(3,3),mu2YuadjYu(3,3),       & 
& mv2YvadjYv(3,3),mv2lamNClamN(3,3),Ydmq2adjYd(3,3),YdadjYdmd2(3,3),YdadjYdYd(3,3),      & 
& YdadjYdTd(3,3),YdadjYuYu(3,3),YdadjYuTu(3,3),Yeml2adjYe(3,3),YeadjYeme2(3,3),          & 
& YeadjYeYe(3,3),YeadjYeTe(3,3),YeadjYvYv(3,3),YeadjYvTv(3,3),Yumq2adjYu(3,3),           & 
& YuadjYdYd(3,3),YuadjYdTd(3,3),YuadjYumu2(3,3),YuadjYuYu(3,3),YuadjYuTu(3,3),           & 
& Yvml2adjYv(3,3),YvadjYeYe(3,3),YvadjYeTe(3,3),YvadjYvmv2(3,3),YvadjYvYv(3,3),          & 
& YvadjYvlamN(3,3),YvadjYvTv(3,3),YvadjYvTLN(3,3),lamNCmv2ClamN(3,3),lamNCYvTpYv(3,3),   & 
& lamNCYvTpTv(3,3),lamNClamNmv2(3,3),lamNClamNYv(3,3),lamNClamNlamN(3,3),lamNClamNTv(3,3),& 
& lamNClamNTLN(3,3),adjYdmd2Yd(3,3),adjYdYdmq2(3,3),adjYeme2Ye(3,3),adjYeYeml2(3,3),     & 
& adjYumu2Yu(3,3),adjYuYumq2(3,3),adjYvmv2Yv(3,3),adjYvYvml2(3,3),TdadjYdYd(3,3),        & 
& TdadjYuYu(3,3),TeadjYeYe(3,3),TeadjYvYv(3,3),TuadjYdYd(3,3),TuadjYuYu(3,3),            & 
& TvadjYeYe(3,3),TvadjYvYv(3,3),TvadjYvlamN(3,3),TLNCYvTpYv(3,3),TLNClamNYv(3,3),        & 
& TLNClamNlamN(3,3)

Complex(dp) :: Trmd2,Trme2,Trml2,Trmq2,Trmu2,TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYvadjYv,TrlamNClamN,    & 
& TradjYdTd,TradjYeTe,TradjYuTu,TradjYvTv,TrClamNTLN,TrCTdTpTd,TrCTeTpTe,TrCTuTpTu,      & 
& TrCTvTpTv,TrCTLNTLN,Trmd2YdadjYd,Trme2YeadjYe,Trml2adjYeYe,Trml2adjYvYv,               & 
& Trmq2adjYdYd,Trmq2adjYuYu,Trmu2YuadjYu,Trmv2YvadjYv,Trmv2lamNClamN

Real(dp) :: g1p2,g1p3,g2p2,g2p3,g3p2,g3p3

Complex(dp) :: sqrt3ov5,ooSqrt15,lamp2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge311' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters311(gy,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,             & 
& TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS)

Abslam = Conjg(lam)*lam
Abskap = Conjg(kap)*kap
AbsTlam = Conjg(Tlam)*Tlam
AbsTk = Conjg(Tk)*Tk
AbsM1 = Conjg(M1)*M1
AbsM2 = Conjg(M2)*M2
AbsM3 = Conjg(M3)*M3
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(lamN,adjlamN)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yv,adjYv)
Call Adjungate(Td,adjTd)
Call Adjungate(Te,adjTe)
Call Adjungate(TLN,adjTLN)
Call Adjungate(Tu,adjTu)
Call Adjungate(Tv,adjTv)
 md2Yd = Matmul2(md2,Yd,OnlyDiagonal) 
 me2Ye = Matmul2(me2,Ye,OnlyDiagonal) 
 ml2adjYe = Matmul2(ml2,adjYe,OnlyDiagonal) 
 ml2adjYv = Matmul2(ml2,adjYv,OnlyDiagonal) 
 mq2adjYd = Matmul2(mq2,adjYd,OnlyDiagonal) 
 mq2adjYu = Matmul2(mq2,adjYu,OnlyDiagonal) 
 mu2Yu = Matmul2(mu2,Yu,OnlyDiagonal) 
 mv2Yv = Matmul2(mv2,Yv,OnlyDiagonal) 
 Ydmq2 = Matmul2(Yd,mq2,OnlyDiagonal) 
 YdadjYd = Matmul2(Yd,adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 Yeml2 = Matmul2(Ye,ml2,OnlyDiagonal) 
 YeadjYe = Matmul2(Ye,adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 Yumq2 = Matmul2(Yu,mq2,OnlyDiagonal) 
 YuadjYu = Matmul2(Yu,adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 Yvml2 = Matmul2(Yv,ml2,OnlyDiagonal) 
 YvadjYv = Matmul2(Yv,adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYv(i2,i2) =  Real(YvadjYv(i2,i2),dp) 
 lamNClamN = Matmul2(lamN,adjlamN,OnlyDiagonal) 
 adjYdmd2 = Matmul2(adjYd,md2,OnlyDiagonal) 
 adjYdYd = Matmul2(adjYd,Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYdTd = Matmul2(adjYd,Td,OnlyDiagonal) 
 adjYeme2 = Matmul2(adjYe,me2,OnlyDiagonal) 
 adjYeYe = Matmul2(adjYe,Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTe = Matmul2(adjYe,Te,OnlyDiagonal) 
 adjYumu2 = Matmul2(adjYu,mu2,OnlyDiagonal) 
 adjYuYu = Matmul2(adjYu,Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 adjYuTu = Matmul2(adjYu,Tu,OnlyDiagonal) 
 adjYvmv2 = Matmul2(adjYv,mv2,OnlyDiagonal) 
 adjYvYv = Matmul2(adjYv,Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYv(i2,i2) =  Real(adjYvYv(i2,i2),dp) 
 adjYvlamN = Matmul2(adjYv,lamN,OnlyDiagonal) 
 adjYvTv = Matmul2(adjYv,Tv,OnlyDiagonal) 
 adjYvTLN = Matmul2(adjYv,TLN,OnlyDiagonal) 
 adjTdTd = Matmul2(adjTd,Td,OnlyDiagonal) 
 adjTeTe = Matmul2(adjTe,Te,OnlyDiagonal) 
 adjTuTu = Matmul2(adjTu,Tu,OnlyDiagonal) 
 adjTvTv = Matmul2(adjTv,Tv,OnlyDiagonal) 
 Cmv2ClamN = Matmul2(Conjg(mv2),adjlamN,OnlyDiagonal) 
 CYvTpYv = Matmul2(Conjg(Yv),Transpose(Yv),OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYv(i2,i2) =  Real(CYvTpYv(i2,i2),dp) 
 CYvTpTv = Matmul2(Conjg(Yv),Transpose(Tv),OnlyDiagonal) 
 ClamNmv2 = Matmul2(adjlamN,mv2,OnlyDiagonal) 
 ClamNYv = Matmul2(adjlamN,Yv,OnlyDiagonal) 
 ClamNlamN = Matmul2(adjlamN,lamN,OnlyDiagonal) 
 ClamNTv = Matmul2(adjlamN,Tv,OnlyDiagonal) 
 ClamNTLN = Matmul2(adjlamN,TLN,OnlyDiagonal) 
 CTdTpTd = Matmul2(Conjg(Td),Transpose(Td),OnlyDiagonal) 
Forall(i2=1:3)  CTdTpTd(i2,i2) =  Real(CTdTpTd(i2,i2),dp) 
 CTeTpTe = Matmul2(Conjg(Te),Transpose(Te),OnlyDiagonal) 
Forall(i2=1:3)  CTeTpTe(i2,i2) =  Real(CTeTpTe(i2,i2),dp) 
 CTuTpTu = Matmul2(Conjg(Tu),Transpose(Tu),OnlyDiagonal) 
Forall(i2=1:3)  CTuTpTu(i2,i2) =  Real(CTuTpTu(i2,i2),dp) 
 CTvTpTv = Matmul2(Conjg(Tv),Transpose(Tv),OnlyDiagonal) 
Forall(i2=1:3)  CTvTpTv(i2,i2) =  Real(CTvTpTv(i2,i2),dp) 
 CTLNTLN = Matmul2(adjTLN,TLN,OnlyDiagonal) 
 TdadjTd = Matmul2(Td,adjTd,OnlyDiagonal) 
 TeadjTe = Matmul2(Te,adjTe,OnlyDiagonal) 
 TuadjTu = Matmul2(Tu,adjTu,OnlyDiagonal) 
 TvadjTv = Matmul2(Tv,adjTv,OnlyDiagonal) 
 TLNCTLN = Matmul2(TLN,adjTLN,OnlyDiagonal) 
 md2YdadjYd = Matmul2(md2,YdadjYd,OnlyDiagonal) 
 me2YeadjYe = Matmul2(me2,YeadjYe,OnlyDiagonal) 
 ml2adjYeYe = Matmul2(ml2,adjYeYe,OnlyDiagonal) 
 ml2adjYvYv = Matmul2(ml2,adjYvYv,OnlyDiagonal) 
 mq2adjYdYd = Matmul2(mq2,adjYdYd,OnlyDiagonal) 
 mq2adjYuYu = Matmul2(mq2,adjYuYu,OnlyDiagonal) 
 mu2YuadjYu = Matmul2(mu2,YuadjYu,OnlyDiagonal) 
 mv2YvadjYv = Matmul2(mv2,YvadjYv,OnlyDiagonal) 
 mv2lamNClamN = Matmul2(mv2,lamNClamN,OnlyDiagonal) 
 Ydmq2adjYd = Matmul2(Yd,mq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  Ydmq2adjYd(i2,i2) =  Real(Ydmq2adjYd(i2,i2),dp) 
 YdadjYdmd2 = Matmul2(Yd,adjYdmd2,OnlyDiagonal) 
 YdadjYdYd = Matmul2(Yd,adjYdYd,OnlyDiagonal) 
 YdadjYdTd = Matmul2(Yd,adjYdTd,OnlyDiagonal) 
 YdadjYuYu = Matmul2(Yd,adjYuYu,OnlyDiagonal) 
 YdadjYuTu = Matmul2(Yd,adjYuTu,OnlyDiagonal) 
 Yeml2adjYe = Matmul2(Ye,ml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  Yeml2adjYe(i2,i2) =  Real(Yeml2adjYe(i2,i2),dp) 
 YeadjYeme2 = Matmul2(Ye,adjYeme2,OnlyDiagonal) 
 YeadjYeYe = Matmul2(Ye,adjYeYe,OnlyDiagonal) 
 YeadjYeTe = Matmul2(Ye,adjYeTe,OnlyDiagonal) 
 YeadjYvYv = Matmul2(Ye,adjYvYv,OnlyDiagonal) 
 YeadjYvTv = Matmul2(Ye,adjYvTv,OnlyDiagonal) 
 Yumq2adjYu = Matmul2(Yu,mq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  Yumq2adjYu(i2,i2) =  Real(Yumq2adjYu(i2,i2),dp) 
 YuadjYdYd = Matmul2(Yu,adjYdYd,OnlyDiagonal) 
 YuadjYdTd = Matmul2(Yu,adjYdTd,OnlyDiagonal) 
 YuadjYumu2 = Matmul2(Yu,adjYumu2,OnlyDiagonal) 
 YuadjYuYu = Matmul2(Yu,adjYuYu,OnlyDiagonal) 
 YuadjYuTu = Matmul2(Yu,adjYuTu,OnlyDiagonal) 
 Yvml2adjYv = Matmul2(Yv,ml2adjYv,OnlyDiagonal) 
Forall(i2=1:3)  Yvml2adjYv(i2,i2) =  Real(Yvml2adjYv(i2,i2),dp) 
 YvadjYeYe = Matmul2(Yv,adjYeYe,OnlyDiagonal) 
 YvadjYeTe = Matmul2(Yv,adjYeTe,OnlyDiagonal) 
 YvadjYvmv2 = Matmul2(Yv,adjYvmv2,OnlyDiagonal) 
 YvadjYvYv = Matmul2(Yv,adjYvYv,OnlyDiagonal) 
 YvadjYvlamN = Matmul2(Yv,adjYvlamN,OnlyDiagonal) 
 YvadjYvTv = Matmul2(Yv,adjYvTv,OnlyDiagonal) 
 YvadjYvTLN = Matmul2(Yv,adjYvTLN,OnlyDiagonal) 
 lamNCmv2ClamN = Matmul2(lamN,Cmv2ClamN,OnlyDiagonal) 
 lamNCYvTpYv = Matmul2(lamN,CYvTpYv,OnlyDiagonal) 
 lamNCYvTpTv = Matmul2(lamN,CYvTpTv,OnlyDiagonal) 
 lamNClamNmv2 = Matmul2(lamN,ClamNmv2,OnlyDiagonal) 
 lamNClamNYv = Matmul2(lamN,ClamNYv,OnlyDiagonal) 
 lamNClamNlamN = Matmul2(lamN,ClamNlamN,OnlyDiagonal) 
 lamNClamNTv = Matmul2(lamN,ClamNTv,OnlyDiagonal) 
 lamNClamNTLN = Matmul2(lamN,ClamNTLN,OnlyDiagonal) 
 adjYdmd2Yd = Matmul2(adjYd,md2Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdmd2Yd(i2,i2) =  Real(adjYdmd2Yd(i2,i2),dp) 
 adjYdYdmq2 = Matmul2(adjYd,Ydmq2,OnlyDiagonal) 
 adjYeme2Ye = Matmul2(adjYe,me2Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeme2Ye(i2,i2) =  Real(adjYeme2Ye(i2,i2),dp) 
 adjYeYeml2 = Matmul2(adjYe,Yeml2,OnlyDiagonal) 
 adjYumu2Yu = Matmul2(adjYu,mu2Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYumu2Yu(i2,i2) =  Real(adjYumu2Yu(i2,i2),dp) 
 adjYuYumq2 = Matmul2(adjYu,Yumq2,OnlyDiagonal) 
 adjYvmv2Yv = Matmul2(adjYv,mv2Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvmv2Yv(i2,i2) =  Real(adjYvmv2Yv(i2,i2),dp) 
 adjYvYvml2 = Matmul2(adjYv,Yvml2,OnlyDiagonal) 
 TdadjYdYd = Matmul2(Td,adjYdYd,OnlyDiagonal) 
 TdadjYuYu = Matmul2(Td,adjYuYu,OnlyDiagonal) 
 TeadjYeYe = Matmul2(Te,adjYeYe,OnlyDiagonal) 
 TeadjYvYv = Matmul2(Te,adjYvYv,OnlyDiagonal) 
 TuadjYdYd = Matmul2(Tu,adjYdYd,OnlyDiagonal) 
 TuadjYuYu = Matmul2(Tu,adjYuYu,OnlyDiagonal) 
 TvadjYeYe = Matmul2(Tv,adjYeYe,OnlyDiagonal) 
 TvadjYvYv = Matmul2(Tv,adjYvYv,OnlyDiagonal) 
 TvadjYvlamN = Matmul2(Tv,adjYvlamN,OnlyDiagonal) 
 TLNCYvTpYv = Matmul2(TLN,CYvTpYv,OnlyDiagonal) 
 TLNClamNYv = Matmul2(TLN,ClamNYv,OnlyDiagonal) 
 TLNClamNlamN = Matmul2(TLN,ClamNlamN,OnlyDiagonal) 
 Trmd2 = Real(cTrace(md2),dp) 
 Trme2 = Real(cTrace(me2),dp) 
 Trml2 = Real(cTrace(ml2),dp) 
 Trmq2 = Real(cTrace(mq2),dp) 
 Trmu2 = Real(cTrace(mu2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYvadjYv = Real(cTrace(YvadjYv),dp) 
 TrlamNClamN = cTrace(lamNClamN) 
 TradjYdTd = cTrace(adjYdTd) 
 TradjYeTe = cTrace(adjYeTe) 
 TradjYuTu = cTrace(adjYuTu) 
 TradjYvTv = cTrace(adjYvTv) 
 TrClamNTLN = cTrace(ClamNTLN) 
 TrCTdTpTd = Real(cTrace(CTdTpTd),dp) 
 TrCTeTpTe = Real(cTrace(CTeTpTe),dp) 
 TrCTuTpTu = Real(cTrace(CTuTpTu),dp) 
 TrCTvTpTv = Real(cTrace(CTvTpTv),dp) 
 TrCTLNTLN = cTrace(CTLNTLN) 
 Trmd2YdadjYd = cTrace(md2YdadjYd) 
 Trme2YeadjYe = cTrace(me2YeadjYe) 
 Trml2adjYeYe = cTrace(ml2adjYeYe) 
 Trml2adjYvYv = cTrace(ml2adjYvYv) 
 Trmq2adjYdYd = cTrace(mq2adjYdYd) 
 Trmq2adjYuYu = cTrace(mq2adjYuYu) 
 Trmu2YuadjYu = cTrace(mu2YuadjYu) 
 Trmv2YvadjYv = cTrace(mv2YvadjYv) 
 Trmv2lamNClamN = cTrace(mv2lamNClamN) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g3p2 =g3**2 
 g3p3 =g3**3 
 lamp2 =lam**2 


If (TwoLoopRGE) Then 
End If 
 
 
Tr1(1) = g1*sqrt3ov5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 + Trmq2 -          & 
&  2._dp*(Trmu2))

If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 33._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = g2p3

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = (Abslam - 7._dp*(g1p2)/15._dp - 3._dp*(g2p2) - 16._dp*(g3p2)               & 
& /3._dp + 3._dp*(TrYdadjYd) + TrYeadjYe)*Yd + 3._dp*(YdadjYdYd) + YdadjYuYu

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = (Abslam - 9._dp*(g1p2)/5._dp - 3._dp*(g2p2) + 3._dp*(TrYdadjYd)            & 
&  + TrYeadjYe)*Ye + 3._dp*(YeadjYeYe) + YeadjYvYv

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! lam 
!-------------------- 
 
betalam1  = 2*Abskap*lam - (3*g1p2*lam)/5._dp - 3*g2p2*lam + 2*TrlamNClamN*lam +      & 
&  3*TrYdadjYd*lam + TrYeadjYe*lam + 3*TrYuadjYu*lam + TrYvadjYv*lam + 4*lamp2*Conjg(lam)

 
 
If (TwoLoopRGE) Then 
betalam2 = 0

 
Dlam = oo16pi2*( betalam1 + oo16pi2 * betalam2 ) 

 
Else 
Dlam = oo16pi2* betalam1 
End If 
 
 
Call Chop(Dlam) 

!-------------------- 
! kap 
!-------------------- 
 
betakap1  = 6*(Abskap + Abslam + TrlamNClamN)*kap

 
 
If (TwoLoopRGE) Then 
betakap2 = 0

 
Dkap = oo16pi2*( betakap1 + oo16pi2 * betakap2 ) 

 
Else 
Dkap = oo16pi2* betakap1 
End If 
 
 
Call Chop(Dkap) 

!-------------------- 
! lamN 
!-------------------- 
 
betalamN1  = 2*(4._dp*(lamNClamNlamN) + lamNCYvTpYv + YvadjYvlamN + Abskap*lamN +     & 
&  Abslam*lamN + TrlamNClamN*lamN)

 
 
If (TwoLoopRGE) Then 
betalamN2 = 0

 
DlamN = oo16pi2*( betalamN1 + oo16pi2 * betalamN2 ) 

 
Else 
DlamN = oo16pi2* betalamN1 
End If 
 
 
Call Chop(DlamN) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (Abslam - 13._dp*(g1p2)/15._dp - 3._dp*(g2p2) - 16._dp*(g3p2)              & 
& /3._dp + 3._dp*(TrYuadjYu) + TrYvadjYv)*Yu + YuadjYdYd + 3._dp*(YuadjYuYu)

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yv 
!-------------------- 
 
betaYv1  = 4._dp*(lamNClamNYv) + (Abslam - 3._dp*(g1p2)/5._dp - 3._dp*(g2p2)          & 
&  + 3._dp*(TrYuadjYu) + TrYvadjYv)*Yv + YvadjYeYe + 3._dp*(YvadjYvYv)

 
 
If (TwoLoopRGE) Then 
betaYv2 = 0

 
DYv = oo16pi2*( betaYv1 + oo16pi2 * betaYv2 ) 

 
Else 
DYv = oo16pi2* betaYv1 
End If 
 
 
Call Chop(DYv) 

!-------------------- 
! Td 
!-------------------- 
 
betaTd1  = 5._dp*(TdadjYdYd) + TdadjYuYu + 4._dp*(YdadjYdTd) + 2._dp*(YdadjYuTu)      & 
&  + Abslam*Td - (7*g1p2*Td)/15._dp - 3*g2p2*Td - (16*g3p2*Td)/3._dp + 3*TrYdadjYd*Td +  & 
&  TrYeadjYe*Td + Yd*((14*g1p2*M1)/15._dp + (32*g3p2*M3)/3._dp + 6*g2p2*M2 +             & 
&  6._dp*(TradjYdTd) + 2._dp*(TradjYeTe) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTd2 = 0

 
DTd = oo16pi2*( betaTd1 + oo16pi2 * betaTd2 ) 

 
Else 
DTd = oo16pi2* betaTd1 
End If 
 
 
Call Chop(DTd) 

!-------------------- 
! Te 
!-------------------- 
 
betaTe1  = 5._dp*(TeadjYeYe) + TeadjYvYv + 4._dp*(YeadjYeTe) + 2._dp*(YeadjYvTv)      & 
&  + Abslam*Te - (9*g1p2*Te)/5._dp - 3*g2p2*Te + 3*TrYdadjYd*Te + TrYeadjYe*Te +         & 
&  Ye*((18*g1p2*M1)/5._dp + 6*g2p2*M2 + 6._dp*(TradjYdTd) + 2._dp*(TradjYeTe)            & 
&  + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTe2 = 0

 
DTe = oo16pi2*( betaTe1 + oo16pi2 * betaTe2 ) 

 
Else 
DTe = oo16pi2* betaTe1 
End If 
 
 
Call Chop(DTe) 

!-------------------- 
! Tlam 
!-------------------- 
 
betaTlam1  = (2*(3*g1p2*M1 + 15*g2p2*M2 + 15._dp*(TradjYdTd) + 5._dp*(TradjYeTe)      & 
&  + 15._dp*(TradjYuTu) + 5._dp*(TradjYvTv) + 10._dp*(TrClamNTLN))*lam)/5._dp +          & 
&  (12._dp*(Abslam) - 3._dp*(g1p2)/5._dp - 3._dp*(g2p2) + 2._dp*(TrlamNClamN)            & 
&  + 3._dp*(TrYdadjYd) + TrYeadjYe + 3._dp*(TrYuadjYu) + TrYvadjYv)*Tlam +               & 
&  2*Conjg(kap)*(2*lam*Tk + kap*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTlam2 = 0

 
DTlam = oo16pi2*( betaTlam1 + oo16pi2 * betaTlam2 ) 

 
Else 
DTlam = oo16pi2* betaTlam1 
End If 
 
 
Call Chop(DTlam) 

!-------------------- 
! Tk 
!-------------------- 
 
betaTk1  = 6*(2*TrClamNTLN*kap + 3*Abskap*Tk + TrlamNClamN*Tk + Conjg(lam)            & 
& *(lam*Tk + 2*kap*Tlam))

 
 
If (TwoLoopRGE) Then 
betaTk2 = 0

 
DTk = oo16pi2*( betaTk1 + oo16pi2 * betaTk2 ) 

 
Else 
DTk = oo16pi2* betaTk1 
End If 
 
 
Call Chop(DTk) 

!-------------------- 
! TLN 
!-------------------- 
 
betaTLN1  = 2*(6._dp*(lamNClamNTLN) + 2._dp*(lamNCYvTpTv) + 6._dp*(TLNClamNlamN)      & 
&  + TLNCYvTpYv + 2._dp*(TvadjYvlamN) + YvadjYvTLN + 2*TrClamNTLN*lamN + TrlamNClamN*TLN +& 
&  Conjg(kap)*(2*lamN*Tk + kap*TLN) + Conjg(lam)*(2*lamN*Tlam + lam*TLN))

 
 
If (TwoLoopRGE) Then 
betaTLN2 = 0

 
DTLN = oo16pi2*( betaTLN1 + oo16pi2 * betaTLN2 ) 

 
Else 
DTLN = oo16pi2* betaTLN1 
End If 
 
 
Call Chop(DTLN) 

!-------------------- 
! Tu 
!-------------------- 
 
betaTu1  = TuadjYdYd + 5._dp*(TuadjYuYu) + 2._dp*(YuadjYdTd) + 4._dp*(YuadjYuTu)      & 
&  + Abslam*Tu - (13*g1p2*Tu)/15._dp - 3*g2p2*Tu - (16*g3p2*Tu)/3._dp + 3*TrYuadjYu*Tu + & 
&  TrYvadjYv*Tu + Yu*((26*g1p2*M1)/15._dp + (32*g3p2*M3)/3._dp + 6*g2p2*M2 +             & 
&  6._dp*(TradjYuTu) + 2._dp*(TradjYvTv) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTu2 = 0

 
DTu = oo16pi2*( betaTu1 + oo16pi2 * betaTu2 ) 

 
Else 
DTu = oo16pi2* betaTu1 
End If 
 
 
Call Chop(DTu) 

!-------------------- 
! Tv 
!-------------------- 
 
betaTv1  = 4._dp*(lamNClamNTv) + 8._dp*(TLNClamNYv) + TvadjYeYe + 5._dp*(TvadjYvYv)   & 
&  + 2._dp*(YvadjYeTe) + 4._dp*(YvadjYvTv) + Abslam*Tv - (3*g1p2*Tv)/5._dp -             & 
&  3*g2p2*Tv + 3*TrYuadjYu*Tv + TrYvadjYv*Tv + Yv*((6*g1p2*M1)/5._dp + 6*g2p2*M2 +       & 
&  6._dp*(TradjYuTu) + 2._dp*(TradjYvTv) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTv2 = 0

 
DTv = oo16pi2*( betaTv1 + oo16pi2 * betaTv2 ) 

 
Else 
DTv = oo16pi2* betaTv1 
End If 
 
 
Call Chop(DTv) 

!-------------------- 
! mq2 
!-------------------- 
 
betamq21  = 2._dp*(adjTdTd) + 2._dp*(adjTuTu) + 2._dp*(adjYdmd2Yd) + adjYdYdmq2 +     & 
&  2._dp*(adjYumu2Yu) + adjYuYumq2 - (2*AbsM1*g1p2*id3R)/15._dp - 6*AbsM2*g2p2*id3R -    & 
&  (32*AbsM3*g3p2*id3R)/3._dp + 2*adjYdYd*mHd2 + 2*adjYuYu*mHu2 + mq2adjYdYd +           & 
&  mq2adjYuYu + g1*id3R*ooSqrt15*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamq22 = 0

 
Dmq2 = oo16pi2*( betamq21 + oo16pi2 * betamq22 ) 

 
Else 
Dmq2 = oo16pi2* betamq21 
End If 
 
 
Call Chop(Dmq2) 

Forall(i1=1:3) Dmq2(i1,i1) =  Real(Dmq2(i1,i1),dp) 
Dmq2 = 0.5_dp*(Dmq2+ Conjg(Transpose(Dmq2)) ) 
!-------------------- 
! ml2 
!-------------------- 
 
betaml21  = 2._dp*(adjTeTe) + 2._dp*(adjTvTv) + 2._dp*(adjYeme2Ye) + adjYeYeml2 +     & 
&  2._dp*(adjYvmv2Yv) + adjYvYvml2 - (6*AbsM1*g1p2*id3R)/5._dp - 6*AbsM2*g2p2*id3R +     & 
&  2*adjYeYe*mHd2 + 2*adjYvYv*mHu2 + ml2adjYeYe + ml2adjYvYv - g1*id3R*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betaml22 = 0

 
Dml2 = oo16pi2*( betaml21 + oo16pi2 * betaml22 ) 

 
Else 
Dml2 = oo16pi2* betaml21 
End If 
 
 
Call Chop(Dml2) 

Forall(i1=1:3) Dml2(i1,i1) =  Real(Dml2(i1,i1),dp) 
Dml2 = 0.5_dp*(Dml2+ Conjg(Transpose(Dml2)) ) 
!-------------------- 
! mHd2 
!-------------------- 
 
betamHd21  = 2._dp*(AbsTlam) - (6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 2*Abslam*mHd2 +  & 
&  2*Abslam*mHu2 + 2*Abslam*ms2 + 6._dp*(TrCTdTpTd) + 2._dp*(TrCTeTpTe) + 6._dp*(Trmd2YdadjYd)& 
&  + 2._dp*(Trme2YeadjYe) + 2._dp*(Trml2adjYeYe) + 6._dp*(Trmq2adjYdYd) + 6*mHd2*TrYdadjYd +& 
&  2*mHd2*TrYeadjYe - g1*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamHd22 = 0

 
DmHd2 = oo16pi2*( betamHd21 + oo16pi2 * betamHd22 ) 

 
Else 
DmHd2 = oo16pi2* betamHd21 
End If 
 
 
!-------------------- 
! mHu2 
!-------------------- 
 
betamHu21  = 2._dp*(AbsTlam) - (6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 2*Abslam*mHd2 +  & 
&  2*Abslam*mHu2 + 2*Abslam*ms2 + 6._dp*(TrCTuTpTu) + 2._dp*(TrCTvTpTv) + 2._dp*(Trml2adjYvYv)& 
&  + 6._dp*(Trmq2adjYuYu) + 6._dp*(Trmu2YuadjYu) + 2._dp*(Trmv2YvadjYv) + 6*mHu2*TrYuadjYu +& 
&  2*mHu2*TrYvadjYv + g1*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamHu22 = 0

 
DmHu2 = oo16pi2*( betamHu21 + oo16pi2 * betamHu22 ) 

 
Else 
DmHu2 = oo16pi2* betamHu21 
End If 
 
 
!-------------------- 
! md2 
!-------------------- 
 
betamd21  = (-8*AbsM1*g1p2*id3R)/15._dp - (32*AbsM3*g3p2*id3R)/3._dp + 2._dp*(md2YdadjYd)& 
&  + 4._dp*(TdadjTd) + 4*mHd2*YdadjYd + 2._dp*(YdadjYdmd2) + 4._dp*(Ydmq2adjYd)          & 
&  + 2*g1*id3R*ooSqrt15*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamd22 = 0

 
Dmd2 = oo16pi2*( betamd21 + oo16pi2 * betamd22 ) 

 
Else 
Dmd2 = oo16pi2* betamd21 
End If 
 
 
Call Chop(Dmd2) 

Forall(i1=1:3) Dmd2(i1,i1) =  Real(Dmd2(i1,i1),dp) 
Dmd2 = 0.5_dp*(Dmd2+ Conjg(Transpose(Dmd2)) ) 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = (-32*AbsM1*g1p2*id3R)/15._dp - (32*AbsM3*g3p2*id3R)/3._dp +               & 
&  2._dp*(mu2YuadjYu) + 4._dp*(TuadjTu) + 4*mHu2*YuadjYu + 2._dp*(YuadjYumu2)            & 
&  + 4._dp*(Yumq2adjYu) - 4*g1*id3R*ooSqrt15*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Forall(i1=1:3) Dmu2(i1,i1) =  Real(Dmu2(i1,i1),dp) 
Dmu2 = 0.5_dp*(Dmu2+ Conjg(Transpose(Dmu2)) ) 
!-------------------- 
! me2 
!-------------------- 
 
betame21  = (-24*AbsM1*g1p2*id3R)/5._dp + 2*(me2YeadjYe + 2._dp*(TeadjTe)             & 
&  + 2*mHd2*YeadjYe + YeadjYeme2 + 2._dp*(Yeml2adjYe)) + 2*g1*id3R*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betame22 = 0

 
Dme2 = oo16pi2*( betame21 + oo16pi2 * betame22 ) 

 
Else 
Dme2 = oo16pi2* betame21 
End If 
 
 
Call Chop(Dme2) 

Forall(i1=1:3) Dme2(i1,i1) =  Real(Dme2(i1,i1),dp) 
Dme2 = 0.5_dp*(Dme2+ Conjg(Transpose(Dme2)) ) 
!-------------------- 
! mv2 
!-------------------- 
 
betamv21  = 2*(2._dp*(lamNClamNmv2) + 4._dp*(lamNCmv2ClamN) + 4*lamNClamN*ms2 +       & 
&  2._dp*(mv2lamNClamN) + mv2YvadjYv + 4._dp*(TLNCTLN) + 2._dp*(TvadjTv) +               & 
&  2*mHu2*YvadjYv + YvadjYvmv2 + 2._dp*(Yvml2adjYv))

 
 
If (TwoLoopRGE) Then 
betamv22 = 0

 
Dmv2 = oo16pi2*( betamv21 + oo16pi2 * betamv22 ) 

 
Else 
Dmv2 = oo16pi2* betamv21 
End If 
 
 
Call Chop(Dmv2) 

Forall(i1=1:3) Dmv2(i1,i1) =  Real(Dmv2(i1,i1),dp) 
Dmv2 = 0.5_dp*(Dmv2+ Conjg(Transpose(Dmv2)) ) 
!-------------------- 
! ms2 
!-------------------- 
 
betams21  = 4*(AbsTk + AbsTlam + 3*Abskap*ms2 + Abslam*(mHd2 + mHu2 + ms2)            & 
&  + TrCTLNTLN + ms2*TrlamNClamN + 2._dp*(Trmv2lamNClamN))

 
 
If (TwoLoopRGE) Then 
betams22 = 0

 
Dms2 = oo16pi2*( betams21 + oo16pi2 * betams22 ) 

 
Else 
Dms2 = oo16pi2* betams21 
End If 
 
 
!-------------------- 
! M1 
!-------------------- 
 
betaM11  = (66*g1p2*M1)/5._dp

 
 
If (TwoLoopRGE) Then 
betaM12 = 0

 
DM1 = oo16pi2*( betaM11 + oo16pi2 * betaM12 ) 

 
Else 
DM1 = oo16pi2* betaM11 
End If 
 
 
Call Chop(DM1) 

!-------------------- 
! M2 
!-------------------- 
 
betaM21  = 2*g2p2*M2

 
 
If (TwoLoopRGE) Then 
betaM22 = 0

 
DM2 = oo16pi2*( betaM21 + oo16pi2 * betaM22 ) 

 
Else 
DM2 = oo16pi2* betaM21 
End If 
 
 
Call Chop(DM2) 

!-------------------- 
! M3 
!-------------------- 
 
betaM31  = -6*g3p2*M3

 
 
If (TwoLoopRGE) Then 
betaM32 = 0

 
DM3 = oo16pi2*( betaM31 + oo16pi2 * betaM32 ) 

 
Else 
DM3 = oo16pi2* betaM31 
End If 
 
 
Call Chop(DM3) 

!-------------------- 
! vd 
!-------------------- 
 
betavd1  = (vd*(-20._dp*(Abslam) + 3._dp*(g1p2) + 15._dp*(g2p2) - 60._dp*(TrYdadjYd)  & 
&  - 20._dp*(TrYeadjYe) + 3*g1p2*Xi + 15*g2p2*Xi))/20._dp

 
 
If (TwoLoopRGE) Then 
betavd2 = 0

 
Dvd = oo16pi2*( betavd1 + oo16pi2 * betavd2 ) 

 
Else 
Dvd = oo16pi2* betavd1 
End If 
 
 
!-------------------- 
! vu 
!-------------------- 
 
betavu1  = (vu*(-20._dp*(Abslam) + 3._dp*(g1p2) + 15._dp*(g2p2) - 60._dp*(TrYuadjYu)  & 
&  - 20._dp*(TrYvadjYv) + 3*g1p2*Xi + 15*g2p2*Xi))/20._dp

 
 
If (TwoLoopRGE) Then 
betavu2 = 0

 
Dvu = oo16pi2*( betavu1 + oo16pi2 * betavu2 ) 

 
Else 
Dvu = oo16pi2* betavu1 
End If 
 
 
!-------------------- 
! vS 
!-------------------- 
 
betavS1  = -2*(Abskap + Abslam + TrlamNClamN)*vS

 
 
If (TwoLoopRGE) Then 
betavS2 = 0

 
DvS = oo16pi2*( betavS1 + oo16pi2 * betavS2 ) 

 
Else 
DvS = oo16pi2* betavS1 
End If 
 
 
Call ParametersToG311(Dg1,Dg2,Dg3,DYd,DYe,Dlam,Dkap,DlamN,DYu,DYv,DTd,DTe,            & 
& DTlam,DTk,DTLN,DTu,DTv,Dmq2,Dml2,DmHd2,DmHu2,Dmd2,Dmu2,Dme2,Dmv2,Dms2,DM1,             & 
& DM2,DM3,Dvd,Dvu,DvS,f)

Iname = Iname - 1 
 
End Subroutine rge311  

End Module RGEs_seesaw1nmssm 
 
