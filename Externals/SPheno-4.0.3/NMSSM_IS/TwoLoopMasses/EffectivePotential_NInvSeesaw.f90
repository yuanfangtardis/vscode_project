Module EffectivePotential_NInvSeesaw 
 
Use Control 
Use Settings 
Use Couplings_NInvSeesaw 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_NInvSeesaw 
Use StandardModel 
Use TreeLevelMasses_NInvSeesaw 
Use EffPotFunctions
Use DerivativesEffPotFunctions
 
Contains 
 
Subroutine CalculateCorrectionsEffPot(ti_ep2L,pi_ep2L,vd,vu,vS,g1,g2,g3,              & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,kont)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Integer , Intent(inout):: kont 
Integer :: iout 
Real(dp) :: err,h_start,vevs(3) 
Real(dp), Intent(out) :: ti_ep2L(3)  
Real(dp), Intent(out) :: pi_ep2L(3,3)


err2L = 0._dp 
If (.not.PurelyNumericalEffPot) Then 
epsM = 1.0E-8_dp 
epsD = 1.0E-8_dp 
! 2nd deriv. also calculates the 1st deriv. of V
Call SecondDerivativeEffPot2Loop(vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,             & 
& Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,             & 
& mx2,M1,M2,M3,kont,pi_ep2L,ti_ep2L)

Else 
epsM = 1.0E-6_dp 
epsD = 1.0E-6_dp 
vevs = (/vd,vu,vS/) 
! Calculate 1st (ti_ep) and 2nd derivatives (pi_ep)
ti_ep2L(1) = partialDiff_Ridders(EffPotFunction2Loop,vevs,1,3,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(2) = partialDiff_Ridders(EffPotFunction2Loop,vevs,2,3,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(3) = partialDiff_Ridders(EffPotFunction2Loop,vevs,3,3,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(1,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,1,1,3,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(2,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,2,1,3,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(2,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,2,2,3,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(3,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,3,1,3,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(3,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,3,2,3,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(3,3) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,3,3,3,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(1,2)=pi_ep2L(2,1)
pi_ep2L(1,3)=pi_ep2L(3,1)
pi_ep2L(2,3)=pi_ep2L(3,2)
End If 
Contains 

Real(dp) Function EffPotFunction(vevs) 
  ! a wrapping function to be passed to numerical differentiation 
  Implicit None 
  Real(dp), Intent(in) :: vevs(3) 
  Real(dp) :: effPot 
Call CalculateEffPot(vevs(1),vevs(2),vevs(3),g1,g2,g3,Yd,Ye,lam,kap,lamN,             & 
& Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,mx2,M1,M2,M3,kont,effPot)

  EffPotFunction = effPot 
  End Function 

Real(dp) Function EffPotFunction2Loop(vevs) 
  ! a wrapping function to be passed to numerical differentiation 
  Implicit None 
  Real(dp), Intent(in) :: vevs(3) 
  Real(dp) :: effPot2L 
Call CalculateEffPot2Loop(vevs(1),vevs(2),vevs(3),g1,g2,g3,Yd,Ye,lam,kap,             & 
& lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,             & 
& mv2,ms2,mx2,M1,M2,M3,kont,effPot2L)

  EffPotFunction2Loop = effPot2L 
  End Function 

End subroutine CalculateCorrectionsEffPot 


Subroutine CalculateEffPot(vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,            & 
& Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,             & 
& M2,M3,kont,effPot)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),              & 
& MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),ZVR(9,9),ZW(2,2)

Integer, Intent(inout):: kont
Integer :: i 
Real(dp) :: effpot,Qscale,result,temp


Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,mv2,ms2,mx2,M1,M2,M3,.True.,kont)

Qscale= getRenormalizationScale()
result=0._dp
temp=0._dp
! sum over real scalars (color *[2 if complex]) 
Do i=1,6
temp=temp+(3*2) * h_SMartin(MSd2(i),Qscale) ! Sd
End Do
Do i=1,9
temp=temp+          h_SMartin(MSvIm2(i),Qscale) ! SvIm
End Do
Do i=1,9
temp=temp+          h_SMartin(MSvRe2(i),Qscale) ! SvRe
End Do
Do i=1,6
temp=temp+(3*2) * h_SMartin(MSu2(i),Qscale) ! Su
End Do
Do i=1,6
temp=temp+(2)    * h_SMartin(MSe2(i),Qscale) ! Se
End Do
Do i=1,3
temp=temp+          h_SMartin(Mhh2(i),Qscale) ! hh
End Do
Do i=2,3
temp=temp+          h_SMartin(MAh2(i),Qscale) ! Ah
End Do
Do i=2,2
temp=temp+(2)    * h_SMartin(MHpm2(i),Qscale) ! Hpm
End Do
result=(+1)*temp !scalars

temp=0._dp
! sum over two-component fermions (*color [*2 if Dirac Fermion]) 
Do i=1,2
temp=temp+          h_SMartin(MCha2(i),Qscale)*2 ! Cha
End Do
Do i=1,5
temp=temp+          h_SMartin(MChi2(i),Qscale)*1 ! Chi
End Do
Do i=1,3
temp=temp+(3)   * h_SMartin(MFd2(i),Qscale)*2 ! Fd
End Do
Do i=1,3
temp=temp+          h_SMartin(MFe2(i),Qscale)*2 ! Fe
End Do
Do i=1,3
temp=temp+(3)   * h_SMartin(MFu2(i),Qscale)*2 ! Fu
End Do
Do i=1,9
temp=temp+          h_SMartin(MFv2(i),Qscale)*1 ! Fv
End Do
temp=temp+(8)   * h_SMartin(MGlu2,Qscale)*1 ! Glu
result=result+(-2)*temp ! fermions

temp=0._dp
! sum over real vectors (color *[2 if complex]) 
temp=temp+(8)   * h_SMartin(0._dp,Qscale) ! VG
temp=temp+          h_SMartin(0._dp,Qscale) ! VP
temp=temp+          h_SMartin(MVZ2,Qscale) ! VZ
temp=temp+(2)    * h_SMartin(MVWm2,Qscale) ! VWm
result=result+(+3)*temp ! vectors

effPot = result * oo16pi2

End Subroutine CalculateEffPot 



 
 
Subroutine CalculateEffPot2Loop(vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,              & 
& Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,             & 
& mx2,M1,M2,M3,kont,effPot2L)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),              & 
& MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),ZVR(9,9),ZW(2,2)

Integer, Intent(inout):: kont
Real(dp), Intent(out) :: effpot2L
Integer :: i,i1,i2,i3,includeGhosts,NrContr 
Integer :: NrContr1,NrContr2 !nr of contributing diagrams
Real(dp) :: Qscale,result,colorfactor,coeff,coeffbar
Complex(dp) :: temp,coupx,coupxbar,coup1,coup2,coup1L,coup1R,coup2L,coup2R
Complex(dp) :: dcoupx,dcoupxbar,dcoup1,dcoup2,dcoup1L,dcoup1R,dcoup2L,dcoup2R
Complex(dp) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),            & 
& cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),            & 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),     & 
& cplHpmSvRecSe(2,9,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),    & 
& cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),           & 
& cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),cplAhAhSdcSd(3,3,6,6),& 
& cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,9,9),cplAhAhSvReSvRe(3,3,9,9),& 
& cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),& 
& cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,9,9),cplhhhhSvReSvRe(3,3,9,9),               & 
& cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),          & 
& cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,9,9,2),cplHpmSvReSvRecHpm(2,9,9,2),      & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvImSvImcSe(6,9,9,6),cplSeSvReSvRecSe(6,9,9,6),cplSuSucSucSu(6,6,6,6),            & 
& cplSuSvImSvImcSu(6,9,9,6),cplSuSvReSvRecSu(6,9,9,6),cplSvImSvImSvImSvIm(9,9,9,9),      & 
& cplSvImSvImSvReSvRe(9,9,9,9),cplSvReSvReSvReSvRe(9,9,9,9),cplSdcSdVGVG(6,6),           & 
& cplSucSuVGVG(6,6)

Real(dp) :: results1(54),results2(35)


Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,              & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,.True.,kont)

Call CouplingsForEffPot3(lam,Tlam,kap,Tk,vd,vu,vS,ZA,ZH,ZP,Yd,Td,ZD,Ye,               & 
& Te,ZE,Yu,Tu,ZU,MUX,lamN,TLN,Yv,Tv,ZVI,ZVR,g3,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,ZUL,             & 
& ZUR,UV,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,            & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,      & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,              & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,          & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsForEffPot4(lam,kap,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,ZU,lamN,Yv,ZVI,              & 
& ZVR,g3,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,               & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)


Qscale = getRenormalizationScale()
result=0._dp
results1=0._dp
results2=0._dp
temp=0._dp
! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices

! ----- diagrams of type SSS, 21 ------ 
! ---- Ah,Ah,Ah ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplAhAhAh(i1,i2,i3)
coup2 = cplAhAhAh(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*1._dp/12._dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MAh2(i2),MAh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Ah, Ah]' 
    End Do
  End Do
End Do
results1(1)=temp
! ---- Ah,Ah,hh ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplAhAhhh(i1,i2,i3)
coup2 = cplAhAhhh(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MAh2(i2),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Ah, hh]' 
    End Do
  End Do
End Do
results1(2)=temp
! ---- Ah,hh,hh ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplAhhhhh(i1,i2,i3)
coup2 = cplAhhhhh(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, hh, hh]' 
    End Do
  End Do
End Do
results1(3)=temp
! ---- Ah,Hpm,conj[Hpm] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,2
coup1 = cplAhHpmcHpm(i1,i2,i3)
coup2 = cplAhHpmcHpm(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Hpm, conj[Hpm]]' 
    End Do
  End Do
End Do
results1(4)=temp
! ---- Ah,Sd,conj[Sd] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSdcSd(i1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSd2(i2),MSd2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
results1(5)=temp
! ---- Ah,Se,conj[Se] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSecSe(i1,i2,i3)
coup2 = cplAhSecSe(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSe2(i2),MSe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Se, conj[Se]]' 
    End Do
  End Do
End Do
results1(6)=temp
! ---- Ah,Su,conj[Su] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSucSu(i1,i2,i3)
coup2 = cplAhSucSu(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSu2(i2),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Su, conj[Su]]' 
    End Do
  End Do
End Do
results1(7)=temp
! ---- Ah,SvIm,SvIm ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplAhSvImSvIm(i1,i2,i3)
coup2 = cplAhSvImSvIm(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvIm]' 
    End Do
  End Do
End Do
results1(8)=temp
! ---- Ah,SvIm,SvRe ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplAhSvImSvRe(i1,i2,i3)
coup2 = cplAhSvImSvRe(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvRe]' 
    End Do
  End Do
End Do
results1(9)=temp
! ---- Ah,SvRe,SvRe ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplAhSvReSvRe(i1,i2,i3)
coup2 = cplAhSvReSvRe(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvRe, SvRe]' 
    End Do
  End Do
End Do
results1(10)=temp
! ---- hh,hh,hh ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplhhhhhh(i1,i2,i3)
coup2 = cplhhhhhh(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*1._dp/12._dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, hh, hh]' 
    End Do
  End Do
End Do
results1(11)=temp
! ---- hh,Hpm,conj[Hpm] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,2
coup1 = cplhhHpmcHpm(i1,i2,i3)
coup2 = cplhhHpmcHpm(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Hpm, conj[Hpm]]' 
    End Do
  End Do
End Do
results1(12)=temp
! ---- hh,Sd,conj[Sd] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSdcSd(i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSd2(i2),MSd2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
results1(13)=temp
! ---- hh,Se,conj[Se] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSecSe(i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSe2(i2),MSe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Se, conj[Se]]' 
    End Do
  End Do
End Do
results1(14)=temp
! ---- hh,Su,conj[Su] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSucSu(i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSu2(i2),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Su, conj[Su]]' 
    End Do
  End Do
End Do
results1(15)=temp
! ---- hh,SvIm,SvIm ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplhhSvImSvIm(i1,i2,i3)
coup2 = cplhhSvImSvIm(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvIm, SvIm]' 
    End Do
  End Do
End Do
results1(16)=temp
! ---- hh,SvIm,SvRe ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplhhSvImSvRe(i1,i2,i3)
coup2 = cplhhSvImSvRe(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvIm, SvRe]' 
    End Do
  End Do
End Do
results1(17)=temp
! ---- hh,SvRe,SvRe ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplhhSvReSvRe(i1,i2,i3)
coup2 = cplhhSvReSvRe(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvRe, SvRe]' 
    End Do
  End Do
End Do
results1(18)=temp
! ---- Sd,conj[Hpm],conj[Su] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSdcHpmcSu(i1,i2,i3)
coup2 = cplHpmSucSd(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*1._dp*abs(coup1)**2*Fep_SSS(MSd2(i1),MHpm2(i2),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Sd, conj[Hpm], conj[Su]]' 
    End Do
  End Do
End Do
results1(19)=temp
! ---- Se,SvIm,conj[Hpm] ----
temp=0._dp
Do i1=1,6
 Do i2=1,9
    Do i3=1,2
coup1 = cplSeSvImcHpm(i1,i2,i3)
coup2 = cplHpmSvImcSe(i3,i2,i1)
colorfactor=1
temp=temp+colorfactor*1._dp*abs(coup1)**2*Fep_SSS(MSe2(i1),MSvIm2(i2),MHpm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, SvIm, conj[Hpm]]' 
    End Do
  End Do
End Do
results1(20)=temp
! ---- Se,SvRe,conj[Hpm] ----
temp=0._dp
Do i1=1,6
 Do i2=1,9
    Do i3=1,2
coup1 = cplSeSvRecHpm(i1,i2,i3)
coup2 = cplHpmSvRecSe(i3,i2,i1)
colorfactor=1
temp=temp+colorfactor*1._dp*abs(coup1)**2*Fep_SSS(MSe2(i1),MSvRe2(i2),MHpm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, SvRe, conj[Hpm]]' 
    End Do
  End Do
End Do
results1(21)=temp
! ----- diagrams of type FFS, 27 ------ 
! ---- Ah,Cha,bar[Cha] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChaAhL(i3,i2,i1)
coup1R = cplcChaChaAhR(i3,i2,i1)
coup2L = cplcChaChaAhL(i2,i3,i1)
coup2R = cplcChaChaAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MCha2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Cha, bar[Cha]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MCha(i2)*MCha(i3)*Fep_FFSbar(MCha2(i3),MCha2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(22)=temp
! ---- Ah,Chi,Chi ----
temp=0._dp
Do i1=1,3
 Do i2=1,5
    Do i3=1,5
coup1L = cplChiChiAhL(i2,i3,i1)
coup1R = cplChiChiAhR(i2,i3,i1)
coup2L = cplChiChiAhL(i2,i3,i1)
coup2R = cplChiChiAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFS(MChi2(i3),MChi2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Chi, Chi]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MChi(i2)*MChi(i3)*Fep_FFSbar(MChi2(i3),MChi2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(23)=temp
! ---- Ah,Fd,bar[Fd] ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdAhL(i3,i2,i1)
coup1R = cplcFdFdAhR(i3,i2,i1)
coup2L = cplcFdFdAhL(i2,i3,i1)
coup2R = cplcFdFdAhR(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MFd2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fd, bar[Fd]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFd(i2)*MFd(i3)*Fep_FFSbar(MFd2(i3),MFd2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(24)=temp
! ---- Ah,Fe,bar[Fe] ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFeAhL(i3,i2,i1)
coup1R = cplcFeFeAhR(i3,i2,i1)
coup2L = cplcFeFeAhL(i2,i3,i1)
coup2R = cplcFeFeAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MFe2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fe, bar[Fe]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFe(i2)*MFe(i3)*Fep_FFSbar(MFe2(i3),MFe2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(25)=temp
! ---- Ah,Fu,bar[Fu] ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuAhL(i3,i2,i1)
coup1R = cplcFuFuAhR(i3,i2,i1)
coup2L = cplcFuFuAhL(i2,i3,i1)
coup2R = cplcFuFuAhR(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MFu2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fu, bar[Fu]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFu(i2)*MFu(i3)*Fep_FFSbar(MFu2(i3),MFu2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(26)=temp
! ---- Ah,Fv,Fv ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1L = cplFvFvAhL(i2,i3,i1)
coup1R = cplFvFvAhR(i2,i3,i1)
coup2L = cplFvFvAhL(i2,i3,i1)
coup2R = cplFvFvAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFS(MFv2(i3),MFv2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fv, Fv]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MFv(i2)*MFv(i3)*Fep_FFSbar(MFv2(i3),MFv2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(27)=temp
! ---- Cha,hh,bar[Cha] ----
temp=0._dp
Do i1=1,2
 Do i2=1,3
    Do i3=1,2
coup1L = cplcChaChahhL(i3,i1,i2)
coup1R = cplcChaChahhR(i3,i1,i2)
coup2L = cplcChaChahhL(i1,i3,i2)
coup2R = cplcChaChahhR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MCha2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Cha, hh, bar[Cha]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MCha(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MCha2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(28)=temp
! ---- Chi,Chi,hh ----
temp=0._dp
Do i1=1,5
 Do i2=1,5
    Do i3=1,3
coup1L = cplChiChihhL(i1,i2,i3)
coup1R = cplChiChihhR(i1,i2,i3)
coup2L = cplChiChihhL(i1,i2,i3)
coup2R = cplChiChihhR(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFS(MChi2(i2),MChi2(i1),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Chi, hh]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MChi(i1)*MChi(i2)*Fep_FFSbar(MChi2(i2),MChi2(i1),Mhh2(i3),Qscale)
    End Do
  End Do
End Do
results1(29)=temp
! ---- Chi,Fv,SvIm ----
temp=0._dp
Do i1=1,5
 Do i2=1,9
    Do i3=1,9
coup1L = cplChiFvSvImL(i1,i2,i3)
coup1R = cplChiFvSvImR(i1,i2,i3)
coup2L = cplChiFvSvImL(i1,i2,i3)
coup2R = cplChiFvSvImR(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2)*Fep_FFS(MFv2(i2),MChi2(i1),MSvIm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Fv, SvIm]' 
temp=temp+colorfactor*Real(coup1L**2,dp)*MChi(i1)*MFv(i2)*Fep_FFSbar(MFv2(i2),MChi2(i1),MSvIm2(i3),Qscale)
    End Do
  End Do
End Do
results1(30)=temp
! ---- Chi,Fv,SvRe ----
temp=0._dp
Do i1=1,5
 Do i2=1,9
    Do i3=1,9
coup1L = cplChiFvSvReL(i1,i2,i3)
coup1R = cplChiFvSvReR(i1,i2,i3)
coup2L = cplChiFvSvReL(i1,i2,i3)
coup2R = cplChiFvSvReR(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2)*Fep_FFS(MFv2(i2),MChi2(i1),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Fv, SvRe]' 
temp=temp+colorfactor*Real(coup1L**2,dp)*MChi(i1)*MFv(i2)*Fep_FFSbar(MFv2(i2),MChi2(i1),MSvRe2(i3),Qscale)
    End Do
  End Do
End Do
results1(31)=temp
! ---- Chi,Hpm,bar[Cha] ----
temp=0._dp
Do i1=1,5
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChiHpmL(i3,i1,i2)
coup1R = cplcChaChiHpmR(i3,i1,i2)
coup2L = cplChiChacHpmL(i1,i3,i2)
coup2R = cplChiChacHpmR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MChi2(i1),MHpm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Hpm, bar[Cha]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MChi2(i1),MHpm2(i2),Qscale)
    End Do
  End Do
End Do
results1(32)=temp
! ---- Chi,Sd,bar[Fd] ----
temp=0._dp
Do i1=1,5
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdChiSdL(i3,i1,i2)
coup1R = cplcFdChiSdR(i3,i1,i2)
coup2L = cplChiFdcSdL(i1,i3,i2)
coup2R = cplChiFdcSdR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MChi2(i1),MSd2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Sd, bar[Fd]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFd(i3)*Fep_FFSbar(MFd2(i3),MChi2(i1),MSd2(i2),Qscale)
    End Do
  End Do
End Do
results1(33)=temp
! ---- Chi,Se,bar[Fe] ----
temp=0._dp
Do i1=1,5
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeChiSeL(i3,i1,i2)
coup1R = cplcFeChiSeR(i3,i1,i2)
coup2L = cplChiFecSeL(i1,i3,i2)
coup2R = cplChiFecSeR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MChi2(i1),MSe2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Se, bar[Fe]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFe(i3)*Fep_FFSbar(MFe2(i3),MChi2(i1),MSe2(i2),Qscale)
    End Do
  End Do
End Do
results1(34)=temp
! ---- Chi,Su,bar[Fu] ----
temp=0._dp
Do i1=1,5
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuChiSuL(i3,i1,i2)
coup1R = cplcFuChiSuR(i3,i1,i2)
coup2L = cplChiFucSuL(i1,i3,i2)
coup2R = cplChiFucSuR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MChi2(i1),MSu2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Su, bar[Fu]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFu(i3)*Fep_FFSbar(MFu2(i3),MChi2(i1),MSu2(i2),Qscale)
    End Do
  End Do
End Do
results1(35)=temp
! ---- Fd,hh,bar[Fd] ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdhhL(i3,i1,i2)
coup1R = cplcFdFdhhR(i3,i1,i2)
coup2L = cplcFdFdhhL(i1,i3,i2)
coup2R = cplcFdFdhhR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MFd2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, hh, bar[Fd]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFd(i1)*MFd(i3)*Fep_FFSbar(MFd2(i3),MFd2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(36)=temp
! ---- Fd,bar[Cha],conj[Su] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFdcSuL(i2,i1,i3)
coup1R = cplcChaFdcSuR(i2,i1,i3)
coup2L = cplcFdChaSuL(i1,i2,i3)
coup2R = cplcFdChaSuR(i1,i2,i3)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i2),MFd2(i1),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, bar[Cha], conj[Su]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFd(i1)*MCha(i2)*Fep_FFSbar(MCha2(i2),MFd2(i1),MSu2(i3),Qscale)
    End Do
  End Do
End Do
results1(37)=temp
! ---- Fe,hh,bar[Fe] ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFehhL(i3,i1,i2)
coup1R = cplcFeFehhR(i3,i1,i2)
coup2L = cplcFeFehhL(i1,i3,i2)
coup2R = cplcFeFehhR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MFe2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, hh, bar[Fe]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFe(i1)*MFe(i3)*Fep_FFSbar(MFe2(i3),MFe2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(38)=temp
! ---- Fe,SvIm,bar[Cha] ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
    Do i3=1,2
coup1L = cplcChaFeSvImL(i3,i1,i2)
coup1R = cplcChaFeSvImR(i3,i1,i2)
coup2L = cplcFeChaSvImL(i1,i3,i2)
coup2R = cplcFeChaSvImR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MFe2(i1),MSvIm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, SvIm, bar[Cha]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFe(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MFe2(i1),MSvIm2(i2),Qscale)
    End Do
  End Do
End Do
results1(39)=temp
! ---- Fe,SvRe,bar[Cha] ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
    Do i3=1,2
coup1L = cplcChaFeSvReL(i3,i1,i2)
coup1R = cplcChaFeSvReR(i3,i1,i2)
coup2L = cplcFeChaSvReL(i1,i3,i2)
coup2R = cplcFeChaSvReR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MFe2(i1),MSvRe2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, SvRe, bar[Cha]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFe(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MFe2(i1),MSvRe2(i2),Qscale)
    End Do
  End Do
End Do
results1(40)=temp
! ---- Fu,hh,bar[Fu] ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuhhL(i3,i1,i2)
coup1R = cplcFuFuhhR(i3,i1,i2)
coup2L = cplcFuFuhhL(i1,i3,i2)
coup2R = cplcFuFuhhR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MFu2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, hh, bar[Fu]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFu(i1)*MFu(i3)*Fep_FFSbar(MFu2(i3),MFu2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(41)=temp
! ---- Fu,Hpm,bar[Fd] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFdFuHpmL(i3,i1,i2)
coup1R = cplcFdFuHpmR(i3,i1,i2)
coup2L = cplcFuFdcHpmL(i1,i3,i2)
coup2R = cplcFuFdcHpmR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MFu2(i1),MHpm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, Hpm, bar[Fd]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFu(i1)*MFd(i3)*Fep_FFSbar(MFd2(i3),MFu2(i1),MHpm2(i2),Qscale)
    End Do
  End Do
End Do
results1(42)=temp
! ---- Fv,Fv,hh ----
temp=0._dp
Do i1=1,9
 Do i2=1,9
    Do i3=1,3
coup1L = cplFvFvhhL(i1,i2,i3)
coup1R = cplFvFvhhR(i1,i2,i3)
coup2L = cplFvFvhhL(i1,i2,i3)
coup2R = cplFvFvhhR(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFS(MFv2(i2),MFv2(i1),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Fv, hh]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MFv(i1)*MFv(i2)*Fep_FFSbar(MFv2(i2),MFv2(i1),Mhh2(i3),Qscale)
    End Do
  End Do
End Do
results1(43)=temp
! ---- Fv,Hpm,bar[Fe] ----
temp=0._dp
Do i1=1,9
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFeFvHpmL(i3,i1,i2)
coup1R = cplcFeFvHpmR(i3,i1,i2)
coup2L = cplFvFecHpmL(i1,i3,i2)
coup2R = cplFvFecHpmR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MFv2(i1),MHpm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Hpm, bar[Fe]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFv(i1)*MFe(i3)*Fep_FFSbar(MFe2(i3),MFv2(i1),MHpm2(i2),Qscale)
    End Do
  End Do
End Do
results1(44)=temp
! ---- Fv,Se,bar[Cha] ----
temp=0._dp
Do i1=1,9
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFvSeL(i3,i1,i2)
coup1R = cplcChaFvSeR(i3,i1,i2)
coup2L = cplFvChacSeL(i1,i3,i2)
coup2R = cplFvChacSeR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MFv2(i1),MSe2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Se, bar[Cha]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFv(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MFv2(i1),MSe2(i2),Qscale)
    End Do
  End Do
End Do
results1(45)=temp
! ---- Glu,Sd,bar[Fd] ----
temp=0._dp
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdGluSdL(i3,i2)
coup1R = cplcFdGluSdR(i3,i2)
coup2L = cplGluFdcSdL(i3,i2)
coup2R = cplGluFdcSdR(i3,i2)
colorfactor=4
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MGlu2,MSd2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Sd, bar[Fd]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MGlu*MFd(i3)*Fep_FFSbar(MFd2(i3),MGlu2,MSd2(i2),Qscale)
    End Do
  End Do
results1(46)=temp
! ---- Glu,Su,bar[Fu] ----
temp=0._dp
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuGluSuL(i3,i2)
coup1R = cplcFuGluSuR(i3,i2)
coup2L = cplGluFucSuL(i3,i2)
coup2R = cplGluFucSuR(i3,i2)
colorfactor=4
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MGlu2,MSu2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Su, bar[Fu]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MGlu*MFu(i3)*Fep_FFSbar(MFu2(i3),MGlu2,MSu2(i2),Qscale)
    End Do
  End Do
results1(47)=temp
! ---- Sd,bar[Cha],bar[Fu] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFuSdL(i2,i3,i1)
coup1R = cplcChacFuSdR(i2,i3,i1)
coup2L = cplChaFucSdL(i2,i3,i1)
coup2R = cplChaFucSdR(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MCha2(i2),MSd2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Sd, bar[Cha], bar[Fu]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MCha(i2)*MFu(i3)*Fep_FFSbar(MFu2(i3),MCha2(i2),MSd2(i1),Qscale)
    End Do
  End Do
End Do
results1(48)=temp
! ----- diagrams of type SSV, 2 ------ 
! ---- Sd,VG,conj[Sd] ----
temp=0._dp
Do i1=1,6
    Do i3=1,6
coup1 = cplSdcSdVG(i1,i3)
coup2 = cplSdcSdVG(i3,i1)
colorfactor=4
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSV(MSd2(i3),MSd2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Sd, VG, conj[Sd]]' 
    End Do
End Do
results1(49)=temp
! ---- Su,VG,conj[Su] ----
temp=0._dp
Do i1=1,6
    Do i3=1,6
coup1 = cplSucSuVG(i1,i3)
coup2 = cplSucSuVG(i3,i1)
colorfactor=4
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSV(MSu2(i3),MSu2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Su, VG, conj[Su]]' 
    End Do
End Do
results1(50)=temp
! ----- diagrams of type FFV, 3 ------ 
! ---- Fd,VG,bar[Fd] ----
temp=0._dp
Do i1=1,3
    Do i3=1,3
coup1L = cplcFdFdVGL(i3,i1)
coup1R = cplcFdFdVGR(i3,i1)
coup2L = cplcFdFdVGL(i1,i3)
coup2R = cplcFdFdVGR(i1,i3)
colorfactor=4
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFV(MFd2(i3),MFd2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fd, VG, bar[Fd]]' 
temp=temp+colorfactor*0.5_dp*2*Real(-coup1L*conjg(coup1R),dp)*MFd(i1)*MFd(i3)*Fep_FFVbar(MFd2(i3),MFd2(i1),0._dp,Qscale)
    End Do
End Do
results1(51)=temp
! ---- Fu,VG,bar[Fu] ----
temp=0._dp
Do i1=1,3
    Do i3=1,3
coup1L = cplcFuFuVGL(i3,i1)
coup1R = cplcFuFuVGR(i3,i1)
coup2L = cplcFuFuVGL(i1,i3)
coup2R = cplcFuFuVGR(i1,i3)
colorfactor=4
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFV(MFu2(i3),MFu2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fu, VG, bar[Fu]]' 
temp=temp+colorfactor*0.5_dp*2*Real(-coup1L*conjg(coup1R),dp)*MFu(i1)*MFu(i3)*Fep_FFVbar(MFu2(i3),MFu2(i1),0._dp,Qscale)
    End Do
End Do
results1(52)=temp
! ---- Glu,Glu,VG ----
temp=0._dp
coup1L = cplGluGluVGL
coup1R = cplGluGluVGR
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
colorfactor=24
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFV(MGlu2,MGlu2,0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Glu, Glu, VG]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MGlu*MGlu*Fep_FFVbar(MGlu2,MGlu2,0._dp,Qscale)
results1(53)=temp
! ----- diagrams of type VVV, 1 ------ 
! ---- VG,VG,VG ----
temp=0._dp
coup1 = cplVGVGVG
coup2 = cplVGVGVG
colorfactor=24
temp=temp+colorfactor*1._dp/12._dp*(coup1)**2*Fep_gauge(0._dp,0._dp,0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at VVV C[VG, VG, VG]' 
results1(54)=temp
! ----- Topology2: diagrams w. 2 Particles and 1 Vertex

! ----- diagrams of type SS, 33 ------ 
! ---- Ah,Ah ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
coup1 = cplAhAhAhAh(i1,i1,i2,i2)
temp=temp+(-1._dp/8._dp)*(-coup1)*Fep_SS(MAh2(i1),MAh2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Ah, Ah]' 
  End Do
End Do
results2(1)=temp
! ---- Ah,hh ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
coup1 = cplAhAhhhhh(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(MAh2(i1),Mhh2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, hh, hh]' 
  End Do
End Do
results2(2)=temp
! ---- Ah,Hpm ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
coup1 = cplAhAhHpmcHpm(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MHpm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Hpm, conj[Hpm]]' 
  End Do
End Do
results2(3)=temp
! ---- Ah,Sd ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
coup1 = cplAhAhSdcSd(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Sd, conj[Sd]]' 
  End Do
End Do
results2(4)=temp
! ---- Ah,Se ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
coup1 = cplAhAhSecSe(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Se, conj[Se]]' 
  End Do
End Do
results2(5)=temp
! ---- Ah,Su ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
coup1 = cplAhAhSucSu(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Su, conj[Su]]' 
  End Do
End Do
results2(6)=temp
! ---- Ah,SvIm ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
coup1 = cplAhAhSvImSvIm(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(MAh2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, SvIm, SvIm]' 
  End Do
End Do
results2(7)=temp
! ---- Ah,SvRe ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
coup1 = cplAhAhSvReSvRe(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(MAh2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, SvRe, SvRe]' 
  End Do
End Do
results2(8)=temp
! ---- hh,hh ----
temp=0._dp
Do i1=1,3
 Do i2=1,3
coup1 = cplhhhhhhhh(i1,i1,i2,i2)
temp=temp+(-1._dp/8._dp)*(-coup1)*Fep_SS(Mhh2(i1),Mhh2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, hh, hh]' 
  End Do
End Do
results2(9)=temp
! ---- hh,Hpm ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
coup1 = cplhhhhHpmcHpm(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MHpm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Hpm, conj[Hpm]]' 
  End Do
End Do
results2(10)=temp
! ---- hh,Sd ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
coup1 = cplhhhhSdcSd(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Sd, conj[Sd]]' 
  End Do
End Do
results2(11)=temp
! ---- hh,Se ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
coup1 = cplhhhhSecSe(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Se, conj[Se]]' 
  End Do
End Do
results2(12)=temp
! ---- hh,Su ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
coup1 = cplhhhhSucSu(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Su, conj[Su]]' 
  End Do
End Do
results2(13)=temp
! ---- hh,SvIm ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
coup1 = cplhhhhSvImSvIm(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, SvIm, SvIm]' 
  End Do
End Do
results2(14)=temp
! ---- hh,SvRe ----
temp=0._dp
Do i1=1,3
 Do i2=1,9
coup1 = cplhhhhSvReSvRe(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, SvRe, SvRe]' 
  End Do
End Do
results2(15)=temp
! ---- Hpm,Hpm ----
temp=0._dp
Do i1=1,2
 Do i2=1,2
coup1 = cplHpmHpmcHpmcHpm(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MHpm2(i1),MHpm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Hpm, conj[Hpm], conj[Hpm]]' 
  End Do
End Do
results2(16)=temp
! ---- Hpm,Sd ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSdcHpmcSd(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Sd, conj[Hpm], conj[Sd]]' 
  End Do
End Do
results2(17)=temp
! ---- Hpm,Se ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSecHpmcSe(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Se, conj[Hpm], conj[Se]]' 
  End Do
End Do
results2(18)=temp
! ---- Hpm,Su ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSucHpmcSu(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Su, conj[Hpm], conj[Su]]' 
  End Do
End Do
results2(19)=temp
! ---- Hpm,SvIm ----
temp=0._dp
Do i1=1,2
 Do i2=1,9
coup1 = cplHpmSvImSvImcHpm(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MHpm2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, SvIm, SvIm, conj[Hpm]]' 
  End Do
End Do
results2(20)=temp
! ---- Hpm,SvRe ----
temp=0._dp
Do i1=1,2
 Do i2=1,9
coup1 = cplHpmSvReSvRecHpm(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MHpm2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, SvRe, SvRe, conj[Hpm]]' 
  End Do
End Do
results2(21)=temp
! ---- Sd,Sd ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSdcSdcSd(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSd2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Sd, conj[Sd], conj[Sd]]' 
  End Do
End Do
results2(22)=temp
! ---- Sd,Se ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSecSdcSe(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MSd2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Se, conj[Sd], conj[Se]]' 
  End Do
End Do
results2(23)=temp
! ---- Sd,Su ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSucSdcSu(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MSd2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Su, conj[Sd], conj[Su]]' 
  End Do
End Do
results2(24)=temp
! ---- Se,Se ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSecSecSe(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSe2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, Se, conj[Se], conj[Se]]' 
  End Do
End Do
results2(25)=temp
! ---- Se,SvIm ----
temp=0._dp
Do i1=1,6
 Do i2=1,9
coup1 = cplSeSvImSvImcSe(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSe2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, SvIm, SvIm, conj[Se]]' 
  End Do
End Do
results2(26)=temp
! ---- Se,SvRe ----
temp=0._dp
Do i1=1,6
 Do i2=1,9
coup1 = cplSeSvReSvRecSe(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSe2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, SvRe, SvRe, conj[Se]]' 
  End Do
End Do
results2(27)=temp
! ---- Su,Su ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSucSucSu(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSu2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, Su, conj[Su], conj[Su]]' 
  End Do
End Do
results2(28)=temp
! ---- Su,SvIm ----
temp=0._dp
Do i1=1,6
 Do i2=1,9
coup1 = cplSuSvImSvImcSu(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSu2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, SvIm, SvIm, conj[Su]]' 
  End Do
End Do
results2(29)=temp
! ---- Su,SvRe ----
temp=0._dp
Do i1=1,6
 Do i2=1,9
coup1 = cplSuSvReSvRecSu(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSu2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, SvRe, SvRe, conj[Su]]' 
  End Do
End Do
results2(30)=temp
! ---- SvIm,SvIm ----
temp=0._dp
Do i1=1,9
 Do i2=1,9
coup1 = cplSvImSvImSvImSvIm(i1,i1,i2,i2)
temp=temp+(-1._dp/8._dp)*(-coup1)*Fep_SS(MSvIm2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvIm, SvIm]' 
  End Do
End Do
results2(31)=temp
! ---- SvIm,SvRe ----
temp=0._dp
Do i1=1,9
 Do i2=1,9
coup1 = cplSvImSvImSvReSvRe(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(MSvIm2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvRe, SvRe]' 
  End Do
End Do
results2(32)=temp
! ---- SvRe,SvRe ----
temp=0._dp
Do i1=1,9
 Do i2=1,9
coup1 = cplSvReSvReSvReSvRe(i1,i1,i2,i2)
temp=temp+(-1._dp/8._dp)*(-coup1)*Fep_SS(MSvRe2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvRe, SvRe, SvRe, SvRe]' 
  End Do
End Do
results2(33)=temp
! ----- diagrams of type VS, 2 ------ 
! ---- Sd,VG ----
temp=0._dp
Do i1=1,6
coup1 = cplSdcSdVGVG(i1,i1)
temp=temp+0.25_dp*coup1*Fep_VS(0._dp,MSd2(i1),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Sd, VG, VG, conj[Sd]]' 
End Do
results2(34)=temp
! ---- Su,VG ----
temp=0._dp
Do i1=1,6
coup1 = cplSucSuVGVG(i1,i1)
temp=temp+0.25_dp*coup1*Fep_VS(0._dp,MSu2(i1),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Su, VG, VG, conj[Su]]' 
End Do
results2(35)=temp
result = sum(results1)+sum(results2) 
effPot2L = result * oo16pi2 * oo16Pi2
End Subroutine CalculateEffPot2Loop


Subroutine SecondDerivativeEffPot2Loop(vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,               & 
& lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,             & 
& mv2,ms2,mx2,M1,M2,M3,kont,pi2L,ti2L)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Integer, Intent(inout):: kont
Real(dp), Intent(out) :: pi2L(3,3),ti2L(3)
Integer :: i,i1,i2,i3,NrContr 
Integer :: iv1, iv2 
Integer :: NrContr1,NrContr2 !nr of contributing diagrams
Real(dp) :: Q2,colorfactor,coeff,coeffbar
Complex(dp) :: result,result_ti,temp,temp_ti,temp_tj,tempbar,tempbar_ti,tempbar_tj
Complex(dp) :: coup1,coup2,coup1L,coup1R,coup2L,coup2R,coupx,coupxbar
Complex(dp) :: Di_coup1,Di_coup2,Di_coup1L,Di_coup1R,Di_coup2L,Di_coup2R,Di_coupx,Di_coupxbar
Complex(dp) :: Dj_coup1,Dj_coup2,Dj_coup1L,Dj_coup1R,Dj_coup2L,Dj_coup2R,Dj_coupx,Dj_coupxbar
Complex(dp) :: DDcoup1,DDcoup2,DDcoup1L,DDcoup1R,DDcoup2L,DDcoup2R,DDcoupx,DDcoupxbar
Complex(dp) :: results1(54),results2(35)
Complex(dp) :: results1_ti(54),results2_ti(35)
Real(dp) :: gout(106350) 
Complex(dp) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),            & 
& cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),            & 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),     & 
& cplHpmSvRecSe(2,9,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),    & 
& cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),           & 
& cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),cplAhAhSdcSd(3,3,6,6),& 
& cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,9,9),cplAhAhSvReSvRe(3,3,9,9),& 
& cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),& 
& cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,9,9),cplhhhhSvReSvRe(3,3,9,9),               & 
& cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),          & 
& cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,9,9,2),cplHpmSvReSvRecHpm(2,9,9,2),      & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvImSvImcSe(6,9,9,6),cplSeSvReSvRecSe(6,9,9,6),cplSuSucSucSu(6,6,6,6),            & 
& cplSuSvImSvImcSu(6,9,9,6),cplSuSvReSvRecSu(6,9,9,6),cplSvImSvImSvImSvIm(9,9,9,9),      & 
& cplSvImSvImSvReSvRe(9,9,9,9),cplSvReSvReSvReSvRe(9,9,9,9),cplSdcSdVGVG(6,6),           & 
& cplSucSuVGVG(6,6)

Complex(dp) :: dcplAhAhAh(3,3,3,3),dcplAhAhhh(3,3,3,3),dcplAhhhhh(3,3,3,3),dcplAhHpmcHpm(3,2,2,3),   & 
& dcplAhSdcSd(3,6,6,3),dcplAhSecSe(3,6,6,3),dcplAhSucSu(3,6,6,3),dcplAhSvImSvIm(3,9,9,3),& 
& dcplAhSvImSvRe(3,9,9,3),dcplAhSvReSvRe(3,9,9,3),dcplhhhhhh(3,3,3,3),dcplhhHpmcHpm(3,2,2,3),& 
& dcplhhSdcSd(3,6,6,3),dcplhhSecSe(3,6,6,3),dcplhhSucSu(3,6,6,3),dcplhhSvImSvIm(3,9,9,3),& 
& dcplhhSvImSvRe(3,9,9,3),dcplhhSvReSvRe(3,9,9,3),dcplHpmSucSd(2,6,6,3),dcplHpmSvImcSe(2,9,6,3),& 
& dcplHpmSvRecSe(2,9,6,3),dcplSdcHpmcSu(6,2,6,3),dcplSeSvImcHpm(6,9,2,3),dcplSeSvRecHpm(6,9,2,3),& 
& dcplSdcSdVG(6,6,3),dcplSucSuVG(6,6,3),dcplVGVGVG(3),dcplcChaChaAhL(2,2,3,3),           & 
& dcplcChaChaAhR(2,2,3,3),dcplChiChiAhL(5,5,3,3),dcplChiChiAhR(5,5,3,3),dcplcFdFdAhL(3,3,3,3),& 
& dcplcFdFdAhR(3,3,3,3),dcplcFeFeAhL(3,3,3,3),dcplcFeFeAhR(3,3,3,3),dcplcFuFuAhL(3,3,3,3),& 
& dcplcFuFuAhR(3,3,3,3),dcplFvFvAhL(9,9,3,3),dcplFvFvAhR(9,9,3,3),dcplChiChacHpmL(5,2,2,3),& 
& dcplChiChacHpmR(5,2,2,3),dcplChaFucSdL(2,3,6,3),dcplChaFucSdR(2,3,6,3),dcplFvChacSeL(9,2,6,3),& 
& dcplFvChacSeR(9,2,6,3),dcplcChaChahhL(2,2,3,3),dcplcChaChahhR(2,2,3,3),dcplcFdChaSuL(3,2,6,3),& 
& dcplcFdChaSuR(3,2,6,3),dcplcFeChaSvImL(3,2,9,3),dcplcFeChaSvImR(3,2,9,3),              & 
& dcplcFeChaSvReL(3,2,9,3),dcplcFeChaSvReR(3,2,9,3),dcplChiChihhL(5,5,3,3),              & 
& dcplChiChihhR(5,5,3,3),dcplChiFdcSdL(5,3,6,3),dcplChiFdcSdR(5,3,6,3),dcplChiFecSeL(5,3,6,3),& 
& dcplChiFecSeR(5,3,6,3),dcplChiFucSuL(5,3,6,3),dcplChiFucSuR(5,3,6,3),dcplChiFvSvImL(5,9,9,3),& 
& dcplChiFvSvImR(5,9,9,3),dcplChiFvSvReL(5,9,9,3),dcplChiFvSvReR(5,9,9,3),               & 
& dcplcChaChiHpmL(2,5,2,3),dcplcChaChiHpmR(2,5,2,3),dcplcFdChiSdL(3,5,6,3),              & 
& dcplcFdChiSdR(3,5,6,3),dcplcFeChiSeL(3,5,6,3),dcplcFeChiSeR(3,5,6,3),dcplcFuChiSuL(3,5,6,3),& 
& dcplcFuChiSuR(3,5,6,3),dcplGluFdcSdL(3,6,3),dcplGluFdcSdR(3,6,3),dcplcFdFdhhL(3,3,3,3),& 
& dcplcFdFdhhR(3,3,3,3),dcplcChaFdcSuL(2,3,6,3),dcplcChaFdcSuR(2,3,6,3),dcplcFuFdcHpmL(3,3,2,3),& 
& dcplcFuFdcHpmR(3,3,2,3),dcplFvFecHpmL(9,3,2,3),dcplFvFecHpmR(9,3,2,3),dcplcFeFehhL(3,3,3,3),& 
& dcplcFeFehhR(3,3,3,3),dcplcChaFeSvImL(2,3,9,3),dcplcChaFeSvImR(2,3,9,3),               & 
& dcplcChaFeSvReL(2,3,9,3),dcplcChaFeSvReR(2,3,9,3),dcplGluFucSuL(3,6,3),dcplGluFucSuR(3,6,3),& 
& dcplcFuFuhhL(3,3,3,3),dcplcFuFuhhR(3,3,3,3),dcplcFdFuHpmL(3,3,2,3),dcplcFdFuHpmR(3,3,2,3),& 
& dcplFvFvhhL(9,9,3,3),dcplFvFvhhR(9,9,3,3),dcplcFeFvHpmL(3,9,2,3),dcplcFeFvHpmR(3,9,2,3),& 
& dcplcChaFvSeL(2,9,6,3),dcplcChaFvSeR(2,9,6,3),dcplcFdGluSdL(3,6,3),dcplcFdGluSdR(3,6,3),& 
& dcplcFuGluSuL(3,6,3),dcplcFuGluSuR(3,6,3),dcplcChacFuSdL(2,3,6,3),dcplcChacFuSdR(2,3,6,3),& 
& dcplcFdFdVGL(3,3,3),dcplcFdFdVGR(3,3,3),dcplcFuFuVGL(3,3,3),dcplcFuFuVGR(3,3,3),       & 
& dcplGluGluVGL(3),dcplGluGluVGR(3)

Complex(dp) :: dcplAhAhAhAh(3,3,3,3,3),dcplAhAhhhhh(3,3,3,3,3),dcplAhAhHpmcHpm(3,3,2,2,3),           & 
& dcplAhAhSdcSd(3,3,6,6,3),dcplAhAhSecSe(3,3,6,6,3),dcplAhAhSucSu(3,3,6,6,3),            & 
& dcplAhAhSvImSvIm(3,3,9,9,3),dcplAhAhSvReSvRe(3,3,9,9,3),dcplhhhhhhhh(3,3,3,3,3),       & 
& dcplhhhhHpmcHpm(3,3,2,2,3),dcplhhhhSdcSd(3,3,6,6,3),dcplhhhhSecSe(3,3,6,6,3),          & 
& dcplhhhhSucSu(3,3,6,6,3),dcplhhhhSvImSvIm(3,3,9,9,3),dcplhhhhSvReSvRe(3,3,9,9,3),      & 
& dcplHpmHpmcHpmcHpm(2,2,2,2,3),dcplHpmSdcHpmcSd(2,6,2,6,3),dcplHpmSecHpmcSe(2,6,2,6,3), & 
& dcplHpmSucHpmcSu(2,6,2,6,3),dcplHpmSvImSvImcHpm(2,9,9,2,3),dcplHpmSvReSvRecHpm(2,9,9,2,3),& 
& dcplSdSdcSdcSd(6,6,6,6,3),dcplSdSecSdcSe(6,6,6,6,3),dcplSdSucSdcSu(6,6,6,6,3),         & 
& dcplSeSecSecSe(6,6,6,6,3),dcplSeSvImSvImcSe(6,9,9,6,3),dcplSeSvReSvRecSe(6,9,9,6,3),   & 
& dcplSuSucSucSu(6,6,6,6,3),dcplSuSvImSvImcSu(6,9,9,6,3),dcplSuSvReSvRecSu(6,9,9,6,3),   & 
& dcplSvImSvImSvImSvIm(9,9,9,9,3),dcplSvImSvImSvReSvRe(9,9,9,9,3),dcplSvReSvReSvReSvRe(9,9,9,9,3),& 
& dcplSdcSdVGVG(6,6,3),dcplSucSuVGVG(6,6,3)

Complex(dp) :: ddcplAhAhAh(3,3,3,3,3),ddcplAhAhhh(3,3,3,3,3),ddcplAhhhhh(3,3,3,3,3),ddcplAhHpmcHpm(3,2,2,3,3),& 
& ddcplAhSdcSd(3,6,6,3,3),ddcplAhSecSe(3,6,6,3,3),ddcplAhSucSu(3,6,6,3,3),               & 
& ddcplAhSvImSvIm(3,9,9,3,3),ddcplAhSvImSvRe(3,9,9,3,3),ddcplAhSvReSvRe(3,9,9,3,3),      & 
& ddcplhhhhhh(3,3,3,3,3),ddcplhhHpmcHpm(3,2,2,3,3),ddcplhhSdcSd(3,6,6,3,3),              & 
& ddcplhhSecSe(3,6,6,3,3),ddcplhhSucSu(3,6,6,3,3),ddcplhhSvImSvIm(3,9,9,3,3),            & 
& ddcplhhSvImSvRe(3,9,9,3,3),ddcplhhSvReSvRe(3,9,9,3,3),ddcplHpmSucSd(2,6,6,3,3),        & 
& ddcplHpmSvImcSe(2,9,6,3,3),ddcplHpmSvRecSe(2,9,6,3,3),ddcplSdcHpmcSu(6,2,6,3,3),       & 
& ddcplSeSvImcHpm(6,9,2,3,3),ddcplSeSvRecHpm(6,9,2,3,3),ddcplSdcSdVG(6,6,3,3),           & 
& ddcplSucSuVG(6,6,3,3),ddcplVGVGVG(3,3),ddcplcChaChaAhL(2,2,3,3,3),ddcplcChaChaAhR(2,2,3,3,3),& 
& ddcplChiChiAhL(5,5,3,3,3),ddcplChiChiAhR(5,5,3,3,3),ddcplcFdFdAhL(3,3,3,3,3),          & 
& ddcplcFdFdAhR(3,3,3,3,3),ddcplcFeFeAhL(3,3,3,3,3),ddcplcFeFeAhR(3,3,3,3,3),            & 
& ddcplcFuFuAhL(3,3,3,3,3),ddcplcFuFuAhR(3,3,3,3,3),ddcplFvFvAhL(9,9,3,3,3),             & 
& ddcplFvFvAhR(9,9,3,3,3),ddcplChiChacHpmL(5,2,2,3,3),ddcplChiChacHpmR(5,2,2,3,3),       & 
& ddcplChaFucSdL(2,3,6,3,3),ddcplChaFucSdR(2,3,6,3,3),ddcplFvChacSeL(9,2,6,3,3),         & 
& ddcplFvChacSeR(9,2,6,3,3),ddcplcChaChahhL(2,2,3,3,3),ddcplcChaChahhR(2,2,3,3,3),       & 
& ddcplcFdChaSuL(3,2,6,3,3),ddcplcFdChaSuR(3,2,6,3,3),ddcplcFeChaSvImL(3,2,9,3,3),       & 
& ddcplcFeChaSvImR(3,2,9,3,3),ddcplcFeChaSvReL(3,2,9,3,3),ddcplcFeChaSvReR(3,2,9,3,3),   & 
& ddcplChiChihhL(5,5,3,3,3),ddcplChiChihhR(5,5,3,3,3),ddcplChiFdcSdL(5,3,6,3,3),         & 
& ddcplChiFdcSdR(5,3,6,3,3),ddcplChiFecSeL(5,3,6,3,3),ddcplChiFecSeR(5,3,6,3,3),         & 
& ddcplChiFucSuL(5,3,6,3,3),ddcplChiFucSuR(5,3,6,3,3),ddcplChiFvSvImL(5,9,9,3,3),        & 
& ddcplChiFvSvImR(5,9,9,3,3),ddcplChiFvSvReL(5,9,9,3,3),ddcplChiFvSvReR(5,9,9,3,3),      & 
& ddcplcChaChiHpmL(2,5,2,3,3),ddcplcChaChiHpmR(2,5,2,3,3),ddcplcFdChiSdL(3,5,6,3,3),     & 
& ddcplcFdChiSdR(3,5,6,3,3),ddcplcFeChiSeL(3,5,6,3,3),ddcplcFeChiSeR(3,5,6,3,3),         & 
& ddcplcFuChiSuL(3,5,6,3,3),ddcplcFuChiSuR(3,5,6,3,3),ddcplGluFdcSdL(3,6,3,3),           & 
& ddcplGluFdcSdR(3,6,3,3),ddcplcFdFdhhL(3,3,3,3,3),ddcplcFdFdhhR(3,3,3,3,3),             & 
& ddcplcChaFdcSuL(2,3,6,3,3),ddcplcChaFdcSuR(2,3,6,3,3),ddcplcFuFdcHpmL(3,3,2,3,3),      & 
& ddcplcFuFdcHpmR(3,3,2,3,3),ddcplFvFecHpmL(9,3,2,3,3),ddcplFvFecHpmR(9,3,2,3,3),        & 
& ddcplcFeFehhL(3,3,3,3,3),ddcplcFeFehhR(3,3,3,3,3),ddcplcChaFeSvImL(2,3,9,3,3),         & 
& ddcplcChaFeSvImR(2,3,9,3,3),ddcplcChaFeSvReL(2,3,9,3,3),ddcplcChaFeSvReR(2,3,9,3,3),   & 
& ddcplGluFucSuL(3,6,3,3),ddcplGluFucSuR(3,6,3,3),ddcplcFuFuhhL(3,3,3,3,3),              & 
& ddcplcFuFuhhR(3,3,3,3,3),ddcplcFdFuHpmL(3,3,2,3,3),ddcplcFdFuHpmR(3,3,2,3,3),          & 
& ddcplFvFvhhL(9,9,3,3,3),ddcplFvFvhhR(9,9,3,3,3),ddcplcFeFvHpmL(3,9,2,3,3),             & 
& ddcplcFeFvHpmR(3,9,2,3,3),ddcplcChaFvSeL(2,9,6,3,3),ddcplcChaFvSeR(2,9,6,3,3),         & 
& ddcplcFdGluSdL(3,6,3,3),ddcplcFdGluSdR(3,6,3,3),ddcplcFuGluSuL(3,6,3,3),               & 
& ddcplcFuGluSuR(3,6,3,3),ddcplcChacFuSdL(2,3,6,3,3),ddcplcChacFuSdR(2,3,6,3,3),         & 
& ddcplcFdFdVGL(3,3,3,3),ddcplcFdFdVGR(3,3,3,3),ddcplcFuFuVGL(3,3,3,3),ddcplcFuFuVGR(3,3,3,3),& 
& ddcplGluGluVGL(3,3),ddcplGluGluVGR(3,3)

Complex(dp) :: ddcplAhAhAhAh(3,3,3,3,3,3),ddcplAhAhhhhh(3,3,3,3,3,3),ddcplAhAhHpmcHpm(3,3,2,2,3,3),  & 
& ddcplAhAhSdcSd(3,3,6,6,3,3),ddcplAhAhSecSe(3,3,6,6,3,3),ddcplAhAhSucSu(3,3,6,6,3,3),   & 
& ddcplAhAhSvImSvIm(3,3,9,9,3,3),ddcplAhAhSvReSvRe(3,3,9,9,3,3),ddcplhhhhhhhh(3,3,3,3,3,3),& 
& ddcplhhhhHpmcHpm(3,3,2,2,3,3),ddcplhhhhSdcSd(3,3,6,6,3,3),ddcplhhhhSecSe(3,3,6,6,3,3), & 
& ddcplhhhhSucSu(3,3,6,6,3,3),ddcplhhhhSvImSvIm(3,3,9,9,3,3),ddcplhhhhSvReSvRe(3,3,9,9,3,3),& 
& ddcplHpmHpmcHpmcHpm(2,2,2,2,3,3),ddcplHpmSdcHpmcSd(2,6,2,6,3,3),ddcplHpmSecHpmcSe(2,6,2,6,3,3),& 
& ddcplHpmSucHpmcSu(2,6,2,6,3,3),ddcplHpmSvImSvImcHpm(2,9,9,2,3,3),ddcplHpmSvReSvRecHpm(2,9,9,2,3,3),& 
& ddcplSdSdcSdcSd(6,6,6,6,3,3),ddcplSdSecSdcSe(6,6,6,6,3,3),ddcplSdSucSdcSu(6,6,6,6,3,3),& 
& ddcplSeSecSecSe(6,6,6,6,3,3),ddcplSeSvImSvImcSe(6,9,9,6,3,3),ddcplSeSvReSvRecSe(6,9,9,6,3,3),& 
& ddcplSuSucSucSu(6,6,6,6,3,3),ddcplSuSvImSvImcSu(6,9,9,6,3,3),ddcplSuSvReSvRecSu(6,9,9,6,3,3),& 
& ddcplSvImSvImSvImSvIm(9,9,9,9,3,3),ddcplSvImSvImSvReSvRe(9,9,9,9,3,3),ddcplSvReSvReSvReSvRe(9,9,9,9,3,3),& 
& ddcplSdcSdVGVG(6,6,3,3),ddcplSucSuVGVG(6,6,3,3)

Real(dp) :: MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MSu(6),MSu2(6),MSe(6),           & 
& MSe2(6),Mhh(3),Mhh2(3),MAh(3),MAh2(3),MHpm(2),MHpm2(2),MChi(5),MChi2(5),               & 
& MFv(9),MFv2(9),MCha(2),MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2

Complex(dp) :: dMSd(6,3),dMSd2(6,3),dMSvIm(9,3),dMSvIm2(9,3),dMSvRe(9,3),dMSvRe2(9,3),               & 
& dMSu(6,3),dMSu2(6,3),dMSe(6,3),dMSe2(6,3),dMhh(3,3),dMhh2(3,3),dMAh(3,3),              & 
& dMAh2(3,3),dMHpm(2,3),dMHpm2(2,3),dMChi(5,3),dMChi2(5,3),dMFv(9,3),dMFv2(9,3),         & 
& dMCha(2,3),dMCha2(2,3),dMFe(3,3),dMFe2(3,3),dMFd(3,3),dMFd2(3,3),dMFu(3,3),            & 
& dMFu2(3,3),dMGlu(1,3),dMGlu2(1,3),dMVZ(1,3),dMVZ2(1,3),dMVWm(1,3),dMVWm2(1,3)

Complex(dp) :: ddMSd(6,3,3),ddMSd2(6,3,3),ddMSvIm(9,3,3),ddMSvIm2(9,3,3),ddMSvRe(9,3,3),             & 
& ddMSvRe2(9,3,3),ddMSu(6,3,3),ddMSu2(6,3,3),ddMSe(6,3,3),ddMSe2(6,3,3),ddMhh(3,3,3),    & 
& ddMhh2(3,3,3),ddMAh(3,3,3),ddMAh2(3,3,3),ddMHpm(2,3,3),ddMHpm2(2,3,3),ddMChi(5,3,3),   & 
& ddMChi2(5,3,3),ddMFv(9,3,3),ddMFv2(9,3,3),ddMCha(2,3,3),ddMCha2(2,3,3),ddMFe(3,3,3),   & 
& ddMFe2(3,3,3),ddMFd(3,3,3),ddMFd2(3,3,3),ddMFu(3,3,3),ddMFu2(3,3,3),ddMGlu(1,3,3),     & 
& ddMGlu2(1,3,3),ddMVZ(1,3,3),ddMVZ2(1,3,3),ddMVWm(1,3,3),ddMVWm2(1,3,3)

!! ------------------------------------------------- 
!! Calculate masses, couplings and their derivatives 
!! ------------------------------------------------- 

Do i1=1,3
Call FirstDerivativeMassesCoups(i1,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,              & 
& Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,mx2,M1,M2,M3,gout)

Call GToMassesCoups(gout,MSd,MSd2,MSvIm,MSvIm2,MSvRe,MSvRe2,MSu,MSu2,MSe,             & 
& MSe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,             & 
& MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,        & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,   & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,      & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,              & 
& cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,      & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,         & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,             & 
& cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,            & 
& cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,         & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

dMSd(:,i1) = MSd
dMSd2(:,i1) = MSd2
dMSvIm(:,i1) = MSvIm
dMSvIm2(:,i1) = MSvIm2
dMSvRe(:,i1) = MSvRe
dMSvRe2(:,i1) = MSvRe2
dMSu(:,i1) = MSu
dMSu2(:,i1) = MSu2
dMSe(:,i1) = MSe
dMSe2(:,i1) = MSe2
dMhh(:,i1) = Mhh
dMhh2(:,i1) = Mhh2
dMAh(:,i1) = MAh
dMAh2(:,i1) = MAh2
dMHpm(:,i1) = MHpm
dMHpm2(:,i1) = MHpm2
dMChi(:,i1) = MChi
dMChi2(:,i1) = MChi2
dMFv(:,i1) = MFv
dMFv2(:,i1) = MFv2
dMCha(:,i1) = MCha
dMCha2(:,i1) = MCha2
dMFe(:,i1) = MFe
dMFe2(:,i1) = MFe2
dMFd(:,i1) = MFd
dMFd2(:,i1) = MFd2
dMFu(:,i1) = MFu
dMFu2(:,i1) = MFu2
dMGlu(:,i1) = MGlu
dMGlu2(:,i1) = MGlu2
dMVZ(:,i1) = MVZ
dMVZ2(:,i1) = MVZ2
dMVWm(:,i1) = MVWm
dMVWm2(:,i1) = MVWm2
dcplAhAhAh(:,:,:,i1) = cplAhAhAh
dcplAhAhhh(:,:,:,i1) = cplAhAhhh
dcplAhhhhh(:,:,:,i1) = cplAhhhhh
dcplAhHpmcHpm(:,:,:,i1) = cplAhHpmcHpm
dcplAhSdcSd(:,:,:,i1) = cplAhSdcSd
dcplAhSecSe(:,:,:,i1) = cplAhSecSe
dcplAhSucSu(:,:,:,i1) = cplAhSucSu
dcplAhSvImSvIm(:,:,:,i1) = cplAhSvImSvIm
dcplAhSvImSvRe(:,:,:,i1) = cplAhSvImSvRe
dcplAhSvReSvRe(:,:,:,i1) = cplAhSvReSvRe
dcplhhhhhh(:,:,:,i1) = cplhhhhhh
dcplhhHpmcHpm(:,:,:,i1) = cplhhHpmcHpm
dcplhhSdcSd(:,:,:,i1) = cplhhSdcSd
dcplhhSecSe(:,:,:,i1) = cplhhSecSe
dcplhhSucSu(:,:,:,i1) = cplhhSucSu
dcplhhSvImSvIm(:,:,:,i1) = cplhhSvImSvIm
dcplhhSvImSvRe(:,:,:,i1) = cplhhSvImSvRe
dcplhhSvReSvRe(:,:,:,i1) = cplhhSvReSvRe
dcplHpmSucSd(:,:,:,i1) = cplHpmSucSd
dcplHpmSvImcSe(:,:,:,i1) = cplHpmSvImcSe
dcplHpmSvRecSe(:,:,:,i1) = cplHpmSvRecSe
dcplSdcHpmcSu(:,:,:,i1) = cplSdcHpmcSu
dcplSeSvImcHpm(:,:,:,i1) = cplSeSvImcHpm
dcplSeSvRecHpm(:,:,:,i1) = cplSeSvRecHpm
dcplSdcSdVG(:,:,i1) = cplSdcSdVG
dcplSucSuVG(:,:,i1) = cplSucSuVG
dcplVGVGVG(i1) = cplVGVGVG
dcplcChaChaAhL(:,:,:,i1) = cplcChaChaAhL
dcplcChaChaAhR(:,:,:,i1) = cplcChaChaAhR
dcplChiChiAhL(:,:,:,i1) = cplChiChiAhL
dcplChiChiAhR(:,:,:,i1) = cplChiChiAhR
dcplcFdFdAhL(:,:,:,i1) = cplcFdFdAhL
dcplcFdFdAhR(:,:,:,i1) = cplcFdFdAhR
dcplcFeFeAhL(:,:,:,i1) = cplcFeFeAhL
dcplcFeFeAhR(:,:,:,i1) = cplcFeFeAhR
dcplcFuFuAhL(:,:,:,i1) = cplcFuFuAhL
dcplcFuFuAhR(:,:,:,i1) = cplcFuFuAhR
dcplFvFvAhL(:,:,:,i1) = cplFvFvAhL
dcplFvFvAhR(:,:,:,i1) = cplFvFvAhR
dcplChiChacHpmL(:,:,:,i1) = cplChiChacHpmL
dcplChiChacHpmR(:,:,:,i1) = cplChiChacHpmR
dcplChaFucSdL(:,:,:,i1) = cplChaFucSdL
dcplChaFucSdR(:,:,:,i1) = cplChaFucSdR
dcplFvChacSeL(:,:,:,i1) = cplFvChacSeL
dcplFvChacSeR(:,:,:,i1) = cplFvChacSeR
dcplcChaChahhL(:,:,:,i1) = cplcChaChahhL
dcplcChaChahhR(:,:,:,i1) = cplcChaChahhR
dcplcFdChaSuL(:,:,:,i1) = cplcFdChaSuL
dcplcFdChaSuR(:,:,:,i1) = cplcFdChaSuR
dcplcFeChaSvImL(:,:,:,i1) = cplcFeChaSvImL
dcplcFeChaSvImR(:,:,:,i1) = cplcFeChaSvImR
dcplcFeChaSvReL(:,:,:,i1) = cplcFeChaSvReL
dcplcFeChaSvReR(:,:,:,i1) = cplcFeChaSvReR
dcplChiChihhL(:,:,:,i1) = cplChiChihhL
dcplChiChihhR(:,:,:,i1) = cplChiChihhR
dcplChiFdcSdL(:,:,:,i1) = cplChiFdcSdL
dcplChiFdcSdR(:,:,:,i1) = cplChiFdcSdR
dcplChiFecSeL(:,:,:,i1) = cplChiFecSeL
dcplChiFecSeR(:,:,:,i1) = cplChiFecSeR
dcplChiFucSuL(:,:,:,i1) = cplChiFucSuL
dcplChiFucSuR(:,:,:,i1) = cplChiFucSuR
dcplChiFvSvImL(:,:,:,i1) = cplChiFvSvImL
dcplChiFvSvImR(:,:,:,i1) = cplChiFvSvImR
dcplChiFvSvReL(:,:,:,i1) = cplChiFvSvReL
dcplChiFvSvReR(:,:,:,i1) = cplChiFvSvReR
dcplcChaChiHpmL(:,:,:,i1) = cplcChaChiHpmL
dcplcChaChiHpmR(:,:,:,i1) = cplcChaChiHpmR
dcplcFdChiSdL(:,:,:,i1) = cplcFdChiSdL
dcplcFdChiSdR(:,:,:,i1) = cplcFdChiSdR
dcplcFeChiSeL(:,:,:,i1) = cplcFeChiSeL
dcplcFeChiSeR(:,:,:,i1) = cplcFeChiSeR
dcplcFuChiSuL(:,:,:,i1) = cplcFuChiSuL
dcplcFuChiSuR(:,:,:,i1) = cplcFuChiSuR
dcplGluFdcSdL(:,:,i1) = cplGluFdcSdL
dcplGluFdcSdR(:,:,i1) = cplGluFdcSdR
dcplcFdFdhhL(:,:,:,i1) = cplcFdFdhhL
dcplcFdFdhhR(:,:,:,i1) = cplcFdFdhhR
dcplcChaFdcSuL(:,:,:,i1) = cplcChaFdcSuL
dcplcChaFdcSuR(:,:,:,i1) = cplcChaFdcSuR
dcplcFuFdcHpmL(:,:,:,i1) = cplcFuFdcHpmL
dcplcFuFdcHpmR(:,:,:,i1) = cplcFuFdcHpmR
dcplFvFecHpmL(:,:,:,i1) = cplFvFecHpmL
dcplFvFecHpmR(:,:,:,i1) = cplFvFecHpmR
dcplcFeFehhL(:,:,:,i1) = cplcFeFehhL
dcplcFeFehhR(:,:,:,i1) = cplcFeFehhR
dcplcChaFeSvImL(:,:,:,i1) = cplcChaFeSvImL
dcplcChaFeSvImR(:,:,:,i1) = cplcChaFeSvImR
dcplcChaFeSvReL(:,:,:,i1) = cplcChaFeSvReL
dcplcChaFeSvReR(:,:,:,i1) = cplcChaFeSvReR
dcplGluFucSuL(:,:,i1) = cplGluFucSuL
dcplGluFucSuR(:,:,i1) = cplGluFucSuR
dcplcFuFuhhL(:,:,:,i1) = cplcFuFuhhL
dcplcFuFuhhR(:,:,:,i1) = cplcFuFuhhR
dcplcFdFuHpmL(:,:,:,i1) = cplcFdFuHpmL
dcplcFdFuHpmR(:,:,:,i1) = cplcFdFuHpmR
dcplFvFvhhL(:,:,:,i1) = cplFvFvhhL
dcplFvFvhhR(:,:,:,i1) = cplFvFvhhR
dcplcFeFvHpmL(:,:,:,i1) = cplcFeFvHpmL
dcplcFeFvHpmR(:,:,:,i1) = cplcFeFvHpmR
dcplcChaFvSeL(:,:,:,i1) = cplcChaFvSeL
dcplcChaFvSeR(:,:,:,i1) = cplcChaFvSeR
dcplcFdGluSdL(:,:,i1) = cplcFdGluSdL
dcplcFdGluSdR(:,:,i1) = cplcFdGluSdR
dcplcFuGluSuL(:,:,i1) = cplcFuGluSuL
dcplcFuGluSuR(:,:,i1) = cplcFuGluSuR
dcplcChacFuSdL(:,:,:,i1) = cplcChacFuSdL
dcplcChacFuSdR(:,:,:,i1) = cplcChacFuSdR
dcplcFdFdVGL(:,:,i1) = cplcFdFdVGL
dcplcFdFdVGR(:,:,i1) = cplcFdFdVGR
dcplcFuFuVGL(:,:,i1) = cplcFuFuVGL
dcplcFuFuVGR(:,:,i1) = cplcFuFuVGR
dcplGluGluVGL(i1) = cplGluGluVGL
dcplGluGluVGR(i1) = cplGluGluVGR
dcplAhAhAhAh(:,:,:,:,i1) = cplAhAhAhAh
dcplAhAhhhhh(:,:,:,:,i1) = cplAhAhhhhh
dcplAhAhHpmcHpm(:,:,:,:,i1) = cplAhAhHpmcHpm
dcplAhAhSdcSd(:,:,:,:,i1) = cplAhAhSdcSd
dcplAhAhSecSe(:,:,:,:,i1) = cplAhAhSecSe
dcplAhAhSucSu(:,:,:,:,i1) = cplAhAhSucSu
dcplAhAhSvImSvIm(:,:,:,:,i1) = cplAhAhSvImSvIm
dcplAhAhSvReSvRe(:,:,:,:,i1) = cplAhAhSvReSvRe
dcplhhhhhhhh(:,:,:,:,i1) = cplhhhhhhhh
dcplhhhhHpmcHpm(:,:,:,:,i1) = cplhhhhHpmcHpm
dcplhhhhSdcSd(:,:,:,:,i1) = cplhhhhSdcSd
dcplhhhhSecSe(:,:,:,:,i1) = cplhhhhSecSe
dcplhhhhSucSu(:,:,:,:,i1) = cplhhhhSucSu
dcplhhhhSvImSvIm(:,:,:,:,i1) = cplhhhhSvImSvIm
dcplhhhhSvReSvRe(:,:,:,:,i1) = cplhhhhSvReSvRe
dcplHpmHpmcHpmcHpm(:,:,:,:,i1) = cplHpmHpmcHpmcHpm
dcplHpmSdcHpmcSd(:,:,:,:,i1) = cplHpmSdcHpmcSd
dcplHpmSecHpmcSe(:,:,:,:,i1) = cplHpmSecHpmcSe
dcplHpmSucHpmcSu(:,:,:,:,i1) = cplHpmSucHpmcSu
dcplHpmSvImSvImcHpm(:,:,:,:,i1) = cplHpmSvImSvImcHpm
dcplHpmSvReSvRecHpm(:,:,:,:,i1) = cplHpmSvReSvRecHpm
dcplSdSdcSdcSd(:,:,:,:,i1) = cplSdSdcSdcSd
dcplSdSecSdcSe(:,:,:,:,i1) = cplSdSecSdcSe
dcplSdSucSdcSu(:,:,:,:,i1) = cplSdSucSdcSu
dcplSeSecSecSe(:,:,:,:,i1) = cplSeSecSecSe
dcplSeSvImSvImcSe(:,:,:,:,i1) = cplSeSvImSvImcSe
dcplSeSvReSvRecSe(:,:,:,:,i1) = cplSeSvReSvRecSe
dcplSuSucSucSu(:,:,:,:,i1) = cplSuSucSucSu
dcplSuSvImSvImcSu(:,:,:,:,i1) = cplSuSvImSvImcSu
dcplSuSvReSvRecSu(:,:,:,:,i1) = cplSuSvReSvRecSu
dcplSvImSvImSvImSvIm(:,:,:,:,i1) = cplSvImSvImSvImSvIm
dcplSvImSvImSvReSvRe(:,:,:,:,i1) = cplSvImSvImSvReSvRe
dcplSvReSvReSvReSvRe(:,:,:,:,i1) = cplSvReSvReSvReSvRe
dcplSdcSdVGVG(:,:,i1) = cplSdcSdVGVG
dcplSucSuVGVG(:,:,i1) = cplSucSuVGVG
End Do 
 
Do i1=1,3
  Do i2=i1,3
Call SecondDerivativeMassesCoups(i1,i2,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,               & 
& lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,             & 
& mv2,ms2,mx2,M1,M2,M3,gout)

Call GToMassesCoups(gout,MSd,MSd2,MSvIm,MSvIm2,MSvRe,MSvRe2,MSu,MSu2,MSe,             & 
& MSe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,             & 
& MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,        & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,   & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,      & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,              & 
& cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,      & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,         & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,             & 
& cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,            & 
& cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,         & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

ddMSd(:,i1,i2) = MSd
ddMSd2(:,i1,i2) = MSd2
ddMSvIm(:,i1,i2) = MSvIm
ddMSvIm2(:,i1,i2) = MSvIm2
ddMSvRe(:,i1,i2) = MSvRe
ddMSvRe2(:,i1,i2) = MSvRe2
ddMSu(:,i1,i2) = MSu
ddMSu2(:,i1,i2) = MSu2
ddMSe(:,i1,i2) = MSe
ddMSe2(:,i1,i2) = MSe2
ddMhh(:,i1,i2) = Mhh
ddMhh2(:,i1,i2) = Mhh2
ddMAh(:,i1,i2) = MAh
ddMAh2(:,i1,i2) = MAh2
ddMHpm(:,i1,i2) = MHpm
ddMHpm2(:,i1,i2) = MHpm2
ddMChi(:,i1,i2) = MChi
ddMChi2(:,i1,i2) = MChi2
ddMFv(:,i1,i2) = MFv
ddMFv2(:,i1,i2) = MFv2
ddMCha(:,i1,i2) = MCha
ddMCha2(:,i1,i2) = MCha2
ddMFe(:,i1,i2) = MFe
ddMFe2(:,i1,i2) = MFe2
ddMFd(:,i1,i2) = MFd
ddMFd2(:,i1,i2) = MFd2
ddMFu(:,i1,i2) = MFu
ddMFu2(:,i1,i2) = MFu2
ddMGlu(:,i1,i2) = MGlu
ddMGlu2(:,i1,i2) = MGlu2
ddMVZ(:,i1,i2) = MVZ
ddMVZ2(:,i1,i2) = MVZ2
ddMVWm(:,i1,i2) = MVWm
ddMVWm2(:,i1,i2) = MVWm2
ddcplAhAhAh(:,:,:,i1,i2) = cplAhAhAh
ddcplAhAhhh(:,:,:,i1,i2) = cplAhAhhh
ddcplAhhhhh(:,:,:,i1,i2) = cplAhhhhh
ddcplAhHpmcHpm(:,:,:,i1,i2) = cplAhHpmcHpm
ddcplAhSdcSd(:,:,:,i1,i2) = cplAhSdcSd
ddcplAhSecSe(:,:,:,i1,i2) = cplAhSecSe
ddcplAhSucSu(:,:,:,i1,i2) = cplAhSucSu
ddcplAhSvImSvIm(:,:,:,i1,i2) = cplAhSvImSvIm
ddcplAhSvImSvRe(:,:,:,i1,i2) = cplAhSvImSvRe
ddcplAhSvReSvRe(:,:,:,i1,i2) = cplAhSvReSvRe
ddcplhhhhhh(:,:,:,i1,i2) = cplhhhhhh
ddcplhhHpmcHpm(:,:,:,i1,i2) = cplhhHpmcHpm
ddcplhhSdcSd(:,:,:,i1,i2) = cplhhSdcSd
ddcplhhSecSe(:,:,:,i1,i2) = cplhhSecSe
ddcplhhSucSu(:,:,:,i1,i2) = cplhhSucSu
ddcplhhSvImSvIm(:,:,:,i1,i2) = cplhhSvImSvIm
ddcplhhSvImSvRe(:,:,:,i1,i2) = cplhhSvImSvRe
ddcplhhSvReSvRe(:,:,:,i1,i2) = cplhhSvReSvRe
ddcplHpmSucSd(:,:,:,i1,i2) = cplHpmSucSd
ddcplHpmSvImcSe(:,:,:,i1,i2) = cplHpmSvImcSe
ddcplHpmSvRecSe(:,:,:,i1,i2) = cplHpmSvRecSe
ddcplSdcHpmcSu(:,:,:,i1,i2) = cplSdcHpmcSu
ddcplSeSvImcHpm(:,:,:,i1,i2) = cplSeSvImcHpm
ddcplSeSvRecHpm(:,:,:,i1,i2) = cplSeSvRecHpm
ddcplSdcSdVG(:,:,i1,i2) = cplSdcSdVG
ddcplSucSuVG(:,:,i1,i2) = cplSucSuVG
ddcplVGVGVG(i1,i2) = cplVGVGVG
ddcplcChaChaAhL(:,:,:,i1,i2) = cplcChaChaAhL
ddcplcChaChaAhR(:,:,:,i1,i2) = cplcChaChaAhR
ddcplChiChiAhL(:,:,:,i1,i2) = cplChiChiAhL
ddcplChiChiAhR(:,:,:,i1,i2) = cplChiChiAhR
ddcplcFdFdAhL(:,:,:,i1,i2) = cplcFdFdAhL
ddcplcFdFdAhR(:,:,:,i1,i2) = cplcFdFdAhR
ddcplcFeFeAhL(:,:,:,i1,i2) = cplcFeFeAhL
ddcplcFeFeAhR(:,:,:,i1,i2) = cplcFeFeAhR
ddcplcFuFuAhL(:,:,:,i1,i2) = cplcFuFuAhL
ddcplcFuFuAhR(:,:,:,i1,i2) = cplcFuFuAhR
ddcplFvFvAhL(:,:,:,i1,i2) = cplFvFvAhL
ddcplFvFvAhR(:,:,:,i1,i2) = cplFvFvAhR
ddcplChiChacHpmL(:,:,:,i1,i2) = cplChiChacHpmL
ddcplChiChacHpmR(:,:,:,i1,i2) = cplChiChacHpmR
ddcplChaFucSdL(:,:,:,i1,i2) = cplChaFucSdL
ddcplChaFucSdR(:,:,:,i1,i2) = cplChaFucSdR
ddcplFvChacSeL(:,:,:,i1,i2) = cplFvChacSeL
ddcplFvChacSeR(:,:,:,i1,i2) = cplFvChacSeR
ddcplcChaChahhL(:,:,:,i1,i2) = cplcChaChahhL
ddcplcChaChahhR(:,:,:,i1,i2) = cplcChaChahhR
ddcplcFdChaSuL(:,:,:,i1,i2) = cplcFdChaSuL
ddcplcFdChaSuR(:,:,:,i1,i2) = cplcFdChaSuR
ddcplcFeChaSvImL(:,:,:,i1,i2) = cplcFeChaSvImL
ddcplcFeChaSvImR(:,:,:,i1,i2) = cplcFeChaSvImR
ddcplcFeChaSvReL(:,:,:,i1,i2) = cplcFeChaSvReL
ddcplcFeChaSvReR(:,:,:,i1,i2) = cplcFeChaSvReR
ddcplChiChihhL(:,:,:,i1,i2) = cplChiChihhL
ddcplChiChihhR(:,:,:,i1,i2) = cplChiChihhR
ddcplChiFdcSdL(:,:,:,i1,i2) = cplChiFdcSdL
ddcplChiFdcSdR(:,:,:,i1,i2) = cplChiFdcSdR
ddcplChiFecSeL(:,:,:,i1,i2) = cplChiFecSeL
ddcplChiFecSeR(:,:,:,i1,i2) = cplChiFecSeR
ddcplChiFucSuL(:,:,:,i1,i2) = cplChiFucSuL
ddcplChiFucSuR(:,:,:,i1,i2) = cplChiFucSuR
ddcplChiFvSvImL(:,:,:,i1,i2) = cplChiFvSvImL
ddcplChiFvSvImR(:,:,:,i1,i2) = cplChiFvSvImR
ddcplChiFvSvReL(:,:,:,i1,i2) = cplChiFvSvReL
ddcplChiFvSvReR(:,:,:,i1,i2) = cplChiFvSvReR
ddcplcChaChiHpmL(:,:,:,i1,i2) = cplcChaChiHpmL
ddcplcChaChiHpmR(:,:,:,i1,i2) = cplcChaChiHpmR
ddcplcFdChiSdL(:,:,:,i1,i2) = cplcFdChiSdL
ddcplcFdChiSdR(:,:,:,i1,i2) = cplcFdChiSdR
ddcplcFeChiSeL(:,:,:,i1,i2) = cplcFeChiSeL
ddcplcFeChiSeR(:,:,:,i1,i2) = cplcFeChiSeR
ddcplcFuChiSuL(:,:,:,i1,i2) = cplcFuChiSuL
ddcplcFuChiSuR(:,:,:,i1,i2) = cplcFuChiSuR
ddcplGluFdcSdL(:,:,i1,i2) = cplGluFdcSdL
ddcplGluFdcSdR(:,:,i1,i2) = cplGluFdcSdR
ddcplcFdFdhhL(:,:,:,i1,i2) = cplcFdFdhhL
ddcplcFdFdhhR(:,:,:,i1,i2) = cplcFdFdhhR
ddcplcChaFdcSuL(:,:,:,i1,i2) = cplcChaFdcSuL
ddcplcChaFdcSuR(:,:,:,i1,i2) = cplcChaFdcSuR
ddcplcFuFdcHpmL(:,:,:,i1,i2) = cplcFuFdcHpmL
ddcplcFuFdcHpmR(:,:,:,i1,i2) = cplcFuFdcHpmR
ddcplFvFecHpmL(:,:,:,i1,i2) = cplFvFecHpmL
ddcplFvFecHpmR(:,:,:,i1,i2) = cplFvFecHpmR
ddcplcFeFehhL(:,:,:,i1,i2) = cplcFeFehhL
ddcplcFeFehhR(:,:,:,i1,i2) = cplcFeFehhR
ddcplcChaFeSvImL(:,:,:,i1,i2) = cplcChaFeSvImL
ddcplcChaFeSvImR(:,:,:,i1,i2) = cplcChaFeSvImR
ddcplcChaFeSvReL(:,:,:,i1,i2) = cplcChaFeSvReL
ddcplcChaFeSvReR(:,:,:,i1,i2) = cplcChaFeSvReR
ddcplGluFucSuL(:,:,i1,i2) = cplGluFucSuL
ddcplGluFucSuR(:,:,i1,i2) = cplGluFucSuR
ddcplcFuFuhhL(:,:,:,i1,i2) = cplcFuFuhhL
ddcplcFuFuhhR(:,:,:,i1,i2) = cplcFuFuhhR
ddcplcFdFuHpmL(:,:,:,i1,i2) = cplcFdFuHpmL
ddcplcFdFuHpmR(:,:,:,i1,i2) = cplcFdFuHpmR
ddcplFvFvhhL(:,:,:,i1,i2) = cplFvFvhhL
ddcplFvFvhhR(:,:,:,i1,i2) = cplFvFvhhR
ddcplcFeFvHpmL(:,:,:,i1,i2) = cplcFeFvHpmL
ddcplcFeFvHpmR(:,:,:,i1,i2) = cplcFeFvHpmR
ddcplcChaFvSeL(:,:,:,i1,i2) = cplcChaFvSeL
ddcplcChaFvSeR(:,:,:,i1,i2) = cplcChaFvSeR
ddcplcFdGluSdL(:,:,i1,i2) = cplcFdGluSdL
ddcplcFdGluSdR(:,:,i1,i2) = cplcFdGluSdR
ddcplcFuGluSuL(:,:,i1,i2) = cplcFuGluSuL
ddcplcFuGluSuR(:,:,i1,i2) = cplcFuGluSuR
ddcplcChacFuSdL(:,:,:,i1,i2) = cplcChacFuSdL
ddcplcChacFuSdR(:,:,:,i1,i2) = cplcChacFuSdR
ddcplcFdFdVGL(:,:,i1,i2) = cplcFdFdVGL
ddcplcFdFdVGR(:,:,i1,i2) = cplcFdFdVGR
ddcplcFuFuVGL(:,:,i1,i2) = cplcFuFuVGL
ddcplcFuFuVGR(:,:,i1,i2) = cplcFuFuVGR
ddcplGluGluVGL(i1,i2) = cplGluGluVGL
ddcplGluGluVGR(i1,i2) = cplGluGluVGR
ddcplAhAhAhAh(:,:,:,:,i1,i2) = cplAhAhAhAh
ddcplAhAhhhhh(:,:,:,:,i1,i2) = cplAhAhhhhh
ddcplAhAhHpmcHpm(:,:,:,:,i1,i2) = cplAhAhHpmcHpm
ddcplAhAhSdcSd(:,:,:,:,i1,i2) = cplAhAhSdcSd
ddcplAhAhSecSe(:,:,:,:,i1,i2) = cplAhAhSecSe
ddcplAhAhSucSu(:,:,:,:,i1,i2) = cplAhAhSucSu
ddcplAhAhSvImSvIm(:,:,:,:,i1,i2) = cplAhAhSvImSvIm
ddcplAhAhSvReSvRe(:,:,:,:,i1,i2) = cplAhAhSvReSvRe
ddcplhhhhhhhh(:,:,:,:,i1,i2) = cplhhhhhhhh
ddcplhhhhHpmcHpm(:,:,:,:,i1,i2) = cplhhhhHpmcHpm
ddcplhhhhSdcSd(:,:,:,:,i1,i2) = cplhhhhSdcSd
ddcplhhhhSecSe(:,:,:,:,i1,i2) = cplhhhhSecSe
ddcplhhhhSucSu(:,:,:,:,i1,i2) = cplhhhhSucSu
ddcplhhhhSvImSvIm(:,:,:,:,i1,i2) = cplhhhhSvImSvIm
ddcplhhhhSvReSvRe(:,:,:,:,i1,i2) = cplhhhhSvReSvRe
ddcplHpmHpmcHpmcHpm(:,:,:,:,i1,i2) = cplHpmHpmcHpmcHpm
ddcplHpmSdcHpmcSd(:,:,:,:,i1,i2) = cplHpmSdcHpmcSd
ddcplHpmSecHpmcSe(:,:,:,:,i1,i2) = cplHpmSecHpmcSe
ddcplHpmSucHpmcSu(:,:,:,:,i1,i2) = cplHpmSucHpmcSu
ddcplHpmSvImSvImcHpm(:,:,:,:,i1,i2) = cplHpmSvImSvImcHpm
ddcplHpmSvReSvRecHpm(:,:,:,:,i1,i2) = cplHpmSvReSvRecHpm
ddcplSdSdcSdcSd(:,:,:,:,i1,i2) = cplSdSdcSdcSd
ddcplSdSecSdcSe(:,:,:,:,i1,i2) = cplSdSecSdcSe
ddcplSdSucSdcSu(:,:,:,:,i1,i2) = cplSdSucSdcSu
ddcplSeSecSecSe(:,:,:,:,i1,i2) = cplSeSecSecSe
ddcplSeSvImSvImcSe(:,:,:,:,i1,i2) = cplSeSvImSvImcSe
ddcplSeSvReSvRecSe(:,:,:,:,i1,i2) = cplSeSvReSvRecSe
ddcplSuSucSucSu(:,:,:,:,i1,i2) = cplSuSucSucSu
ddcplSuSvImSvImcSu(:,:,:,:,i1,i2) = cplSuSvImSvImcSu
ddcplSuSvReSvRecSu(:,:,:,:,i1,i2) = cplSuSvReSvRecSu
ddcplSvImSvImSvImSvIm(:,:,:,:,i1,i2) = cplSvImSvImSvImSvIm
ddcplSvImSvImSvReSvRe(:,:,:,:,i1,i2) = cplSvImSvImSvReSvRe
ddcplSvReSvReSvReSvRe(:,:,:,:,i1,i2) = cplSvReSvReSvReSvRe
ddcplSdcSdVGVG(:,:,i1,i2) = cplSdcSdVGVG
ddcplSucSuVGVG(:,:,i1,i2) = cplSucSuVGVG
  End Do 
 End Do 
 
Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,              & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,.True.,kont)

Call CouplingsForEffPot3(lam,Tlam,kap,Tk,vd,vu,vS,ZA,ZH,ZP,Yd,Td,ZD,Ye,               & 
& Te,ZE,Yu,Tu,ZU,MUX,lamN,TLN,Yv,Tv,ZVI,ZVR,g3,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,ZUL,             & 
& ZUR,UV,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,            & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,      & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,              & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,          & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsForEffPot4(lam,kap,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,ZU,lamN,Yv,ZVI,              & 
& ZVR,g3,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,               & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)



!! ------------------------------------------------- 
!! Calculate derivative of effective potential      
!! ------------------------------------------------- 



Q2 = getRenormalizationScale()
Do iv1=1,3
  Do iv2=iv1,3
    result = ZeroC
    result_ti = ZeroC
    results1 = ZeroC
    results1_ti = ZeroC
    results2 = ZeroC
    results2_ti = ZeroC


! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices


! ----- diagrams of type SSS, 21 ------ 

! ---- Ah,Ah,Ah ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplAhAhAh(i1,i2,i3)
coup2 = cplAhAhAh(i1,i2,i3)
Di_coup1 = dcplAhAhAh(i1,i2,i3,iv1)
Dj_coup1 = dcplAhAhAh(i1,i2,i3,iv2)
DDcoup1 = ddcplAhAhAh(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MAh2(i2),MAh2(i3),dMAh2(i1,iv1)            & 
& ,dMAh2(i2,iv1),dMAh2(i3,iv1),dMAh2(i1,iv2),dMAh2(i2,iv2),dMAh2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMAh2(i2,iv1,iv2),ddMAh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp/12._dp
colorfactor = 1
results1(1)=results1(1) + coeff*colorfactor*temp
results1_ti(1)=results1_ti(1) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(1).eq.results1(1)))  write(*,*) 'NaN at SSS C[Ah, Ah, Ah]' 
! ---- Ah,Ah,hh ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplAhAhhh(i1,i2,i3)
coup2 = cplAhAhhh(i1,i2,i3)
Di_coup1 = dcplAhAhhh(i1,i2,i3,iv1)
Dj_coup1 = dcplAhAhhh(i1,i2,i3,iv2)
DDcoup1 = ddcplAhAhhh(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MAh2(i2),Mhh2(i3),dMAh2(i1,iv1)            & 
& ,dMAh2(i2,iv1),dMhh2(i3,iv1),dMAh2(i1,iv2),dMAh2(i2,iv2),dMhh2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMAh2(i2,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(2)=results1(2) + coeff*colorfactor*temp
results1_ti(2)=results1_ti(2) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(2).eq.results1(2)))  write(*,*) 'NaN at SSS C[Ah, Ah, hh]' 
! ---- Ah,hh,hh ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplAhhhhh(i1,i2,i3)
coup2 = cplAhhhhh(i1,i2,i3)
Di_coup1 = dcplAhhhhh(i1,i2,i3,iv1)
Dj_coup1 = dcplAhhhhh(i1,i2,i3,iv2)
DDcoup1 = ddcplAhhhhh(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),Mhh2(i2),Mhh2(i3),dMAh2(i1,iv1)            & 
& ,dMhh2(i2,iv1),dMhh2(i3,iv1),dMAh2(i1,iv2),dMhh2(i2,iv2),dMhh2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMhh2(i2,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(3)=results1(3) + coeff*colorfactor*temp
results1_ti(3)=results1_ti(3) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(3).eq.results1(3)))  write(*,*) 'NaN at SSS C[Ah, hh, hh]' 
! ---- Ah,Hpm,conj[Hpm] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,2
coup1 = cplAhHpmcHpm(i1,i2,i3)
coup2 = cplAhHpmcHpm(i1,i3,i2)
Di_coup1 = dcplAhHpmcHpm(i1,i2,i3,iv1)
Dj_coup1 = dcplAhHpmcHpm(i1,i2,i3,iv2)
DDcoup1 = ddcplAhHpmcHpm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MHpm2(i2),MHpm2(i3),dMAh2(i1,iv1)          & 
& ,dMHpm2(i2,iv1),dMHpm2(i3,iv1),dMAh2(i1,iv2),dMHpm2(i2,iv2),dMHpm2(i3,iv2)             & 
& ,ddMAh2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),ddMHpm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(4)=results1(4) + coeff*colorfactor*temp
results1_ti(4)=results1_ti(4) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(4).eq.results1(4)))  write(*,*) 'NaN at SSS C[Ah, Hpm, conj[Hpm]]' 
! ---- Ah,Sd,conj[Sd] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSdcSd(i1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
Di_coup1 = dcplAhSdcSd(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSdcSd(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSdcSd(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSd2(i2),MSd2(i3),dMAh2(i1,iv1)            & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),dMAh2(i1,iv2),dMSd2(i2,iv2),dMSd2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSd2(i2,iv1,iv2),ddMSd2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(5)=results1(5) + coeff*colorfactor*temp
results1_ti(5)=results1_ti(5) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(5).eq.results1(5)))  write(*,*) 'NaN at SSS C[Ah, Sd, conj[Sd]]' 
! ---- Ah,Se,conj[Se] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSecSe(i1,i2,i3)
coup2 = cplAhSecSe(i1,i3,i2)
Di_coup1 = dcplAhSecSe(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSecSe(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSecSe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSe2(i2),MSe2(i3),dMAh2(i1,iv1)            & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),dMAh2(i1,iv2),dMSe2(i2,iv2),dMSe2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSe2(i2,iv1,iv2),ddMSe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(6)=results1(6) + coeff*colorfactor*temp
results1_ti(6)=results1_ti(6) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(6).eq.results1(6)))  write(*,*) 'NaN at SSS C[Ah, Se, conj[Se]]' 
! ---- Ah,Su,conj[Su] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSucSu(i1,i2,i3)
coup2 = cplAhSucSu(i1,i3,i2)
Di_coup1 = dcplAhSucSu(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSucSu(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSucSu(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSu2(i2),MSu2(i3),dMAh2(i1,iv1)            & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),dMAh2(i1,iv2),dMSu2(i2,iv2),dMSu2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSu2(i2,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(7)=results1(7) + coeff*colorfactor*temp
results1_ti(7)=results1_ti(7) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(7).eq.results1(7)))  write(*,*) 'NaN at SSS C[Ah, Su, conj[Su]]' 
! ---- Ah,SvIm,SvIm ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplAhSvImSvIm(i1,i2,i3)
coup2 = cplAhSvImSvIm(i1,i2,i3)
Di_coup1 = dcplAhSvImSvIm(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSvImSvIm(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSvImSvIm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSvIm2(i2),MSvIm2(i3),dMAh2(i1,iv1)        & 
& ,dMSvIm2(i2,iv1),dMSvIm2(i3,iv1),dMAh2(i1,iv2),dMSvIm2(i2,iv2),dMSvIm2(i3,iv2)         & 
& ,ddMAh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMSvIm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(8)=results1(8) + coeff*colorfactor*temp
results1_ti(8)=results1_ti(8) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(8).eq.results1(8)))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvIm]' 
! ---- Ah,SvIm,SvRe ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplAhSvImSvRe(i1,i2,i3)
coup2 = cplAhSvImSvRe(i1,i2,i3)
Di_coup1 = dcplAhSvImSvRe(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSvImSvRe(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSvImSvRe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSvIm2(i2),MSvRe2(i3),dMAh2(i1,iv1)        & 
& ,dMSvIm2(i2,iv1),dMSvRe2(i3,iv1),dMAh2(i1,iv2),dMSvIm2(i2,iv2),dMSvRe2(i3,iv2)         & 
& ,ddMAh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(9)=results1(9) + coeff*colorfactor*temp
results1_ti(9)=results1_ti(9) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(9).eq.results1(9)))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvRe]' 
! ---- Ah,SvRe,SvRe ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplAhSvReSvRe(i1,i2,i3)
coup2 = cplAhSvReSvRe(i1,i2,i3)
Di_coup1 = dcplAhSvReSvRe(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSvReSvRe(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSvReSvRe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSvRe2(i2),MSvRe2(i3),dMAh2(i1,iv1)        & 
& ,dMSvRe2(i2,iv1),dMSvRe2(i3,iv1),dMAh2(i1,iv2),dMSvRe2(i2,iv2),dMSvRe2(i3,iv2)         & 
& ,ddMAh2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(10)=results1(10) + coeff*colorfactor*temp
results1_ti(10)=results1_ti(10) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(10).eq.results1(10)))  write(*,*) 'NaN at SSS C[Ah, SvRe, SvRe]' 
! ---- hh,hh,hh ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplhhhhhh(i1,i2,i3)
coup2 = cplhhhhhh(i1,i2,i3)
Di_coup1 = dcplhhhhhh(i1,i2,i3,iv1)
Dj_coup1 = dcplhhhhhh(i1,i2,i3,iv2)
DDcoup1 = ddcplhhhhhh(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),Mhh2(i2),Mhh2(i3),dMhh2(i1,iv1)            & 
& ,dMhh2(i2,iv1),dMhh2(i3,iv1),dMhh2(i1,iv2),dMhh2(i2,iv2),dMhh2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMhh2(i2,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp/12._dp
colorfactor = 1
results1(11)=results1(11) + coeff*colorfactor*temp
results1_ti(11)=results1_ti(11) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(11).eq.results1(11)))  write(*,*) 'NaN at SSS C[hh, hh, hh]' 
! ---- hh,Hpm,conj[Hpm] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,2
coup1 = cplhhHpmcHpm(i1,i2,i3)
coup2 = cplhhHpmcHpm(i1,i3,i2)
Di_coup1 = dcplhhHpmcHpm(i1,i2,i3,iv1)
Dj_coup1 = dcplhhHpmcHpm(i1,i2,i3,iv2)
DDcoup1 = ddcplhhHpmcHpm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MHpm2(i2),MHpm2(i3),dMhh2(i1,iv1)          & 
& ,dMHpm2(i2,iv1),dMHpm2(i3,iv1),dMhh2(i1,iv2),dMHpm2(i2,iv2),dMHpm2(i3,iv2)             & 
& ,ddMhh2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),ddMHpm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(12)=results1(12) + coeff*colorfactor*temp
results1_ti(12)=results1_ti(12) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(12).eq.results1(12)))  write(*,*) 'NaN at SSS C[hh, Hpm, conj[Hpm]]' 
! ---- hh,Sd,conj[Sd] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSdcSd(i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
Di_coup1 = dcplhhSdcSd(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSdcSd(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSdcSd(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSd2(i2),MSd2(i3),dMhh2(i1,iv1)            & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),dMhh2(i1,iv2),dMSd2(i2,iv2),dMSd2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSd2(i2,iv1,iv2),ddMSd2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(13)=results1(13) + coeff*colorfactor*temp
results1_ti(13)=results1_ti(13) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(13).eq.results1(13)))  write(*,*) 'NaN at SSS C[hh, Sd, conj[Sd]]' 
! ---- hh,Se,conj[Se] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSecSe(i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
Di_coup1 = dcplhhSecSe(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSecSe(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSecSe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSe2(i2),MSe2(i3),dMhh2(i1,iv1)            & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),dMhh2(i1,iv2),dMSe2(i2,iv2),dMSe2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSe2(i2,iv1,iv2),ddMSe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(14)=results1(14) + coeff*colorfactor*temp
results1_ti(14)=results1_ti(14) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(14).eq.results1(14)))  write(*,*) 'NaN at SSS C[hh, Se, conj[Se]]' 
! ---- hh,Su,conj[Su] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSucSu(i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
Di_coup1 = dcplhhSucSu(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSucSu(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSucSu(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSu2(i2),MSu2(i3),dMhh2(i1,iv1)            & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),dMhh2(i1,iv2),dMSu2(i2,iv2),dMSu2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSu2(i2,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(15)=results1(15) + coeff*colorfactor*temp
results1_ti(15)=results1_ti(15) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(15).eq.results1(15)))  write(*,*) 'NaN at SSS C[hh, Su, conj[Su]]' 
! ---- hh,SvIm,SvIm ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplhhSvImSvIm(i1,i2,i3)
coup2 = cplhhSvImSvIm(i1,i2,i3)
Di_coup1 = dcplhhSvImSvIm(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSvImSvIm(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSvImSvIm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSvIm2(i2),MSvIm2(i3),dMhh2(i1,iv1)        & 
& ,dMSvIm2(i2,iv1),dMSvIm2(i3,iv1),dMhh2(i1,iv2),dMSvIm2(i2,iv2),dMSvIm2(i3,iv2)         & 
& ,ddMhh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMSvIm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(16)=results1(16) + coeff*colorfactor*temp
results1_ti(16)=results1_ti(16) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(16).eq.results1(16)))  write(*,*) 'NaN at SSS C[hh, SvIm, SvIm]' 
! ---- hh,SvIm,SvRe ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplhhSvImSvRe(i1,i2,i3)
coup2 = cplhhSvImSvRe(i1,i2,i3)
Di_coup1 = dcplhhSvImSvRe(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSvImSvRe(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSvImSvRe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSvIm2(i2),MSvRe2(i3),dMhh2(i1,iv1)        & 
& ,dMSvIm2(i2,iv1),dMSvRe2(i3,iv1),dMhh2(i1,iv2),dMSvIm2(i2,iv2),dMSvRe2(i3,iv2)         & 
& ,ddMhh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(17)=results1(17) + coeff*colorfactor*temp
results1_ti(17)=results1_ti(17) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(17).eq.results1(17)))  write(*,*) 'NaN at SSS C[hh, SvIm, SvRe]' 
! ---- hh,SvRe,SvRe ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplhhSvReSvRe(i1,i2,i3)
coup2 = cplhhSvReSvRe(i1,i2,i3)
Di_coup1 = dcplhhSvReSvRe(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSvReSvRe(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSvReSvRe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSvRe2(i2),MSvRe2(i3),dMhh2(i1,iv1)        & 
& ,dMSvRe2(i2,iv1),dMSvRe2(i3,iv1),dMhh2(i1,iv2),dMSvRe2(i2,iv2),dMSvRe2(i3,iv2)         & 
& ,ddMhh2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(18)=results1(18) + coeff*colorfactor*temp
results1_ti(18)=results1_ti(18) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(18).eq.results1(18)))  write(*,*) 'NaN at SSS C[hh, SvRe, SvRe]' 
! ---- Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSdcHpmcSu(i1,i2,i3)
coup2 = cplHpmSucSd(i2,i3,i1)
Di_coup1 = dcplSdcHpmcSu(i1,i2,i3,iv1)
Dj_coup1 = dcplSdcHpmcSu(i1,i2,i3,iv2)
DDcoup1 = ddcplSdcHpmcSu(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSd2(i1),MHpm2(i2),MSu2(i3),dMSd2(i1,iv1)           & 
& ,dMHpm2(i2,iv1),dMSu2(i3,iv1),dMSd2(i1,iv2),dMHpm2(i2,iv2),dMSu2(i3,iv2)               & 
& ,ddMSd2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp
colorfactor = 3
results1(19)=results1(19) + coeff*colorfactor*temp
results1_ti(19)=results1_ti(19) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(19).eq.results1(19)))  write(*,*) 'NaN at SSS C[Sd, conj[Hpm], conj[Su]]' 
! ---- Se,SvIm,conj[Hpm] ----
Do i1=1,6
 Do i2=1,9
    Do i3=1,2
coup1 = cplSeSvImcHpm(i1,i2,i3)
coup2 = cplHpmSvImcSe(i3,i2,i1)
Di_coup1 = dcplSeSvImcHpm(i1,i2,i3,iv1)
Dj_coup1 = dcplSeSvImcHpm(i1,i2,i3,iv2)
DDcoup1 = ddcplSeSvImcHpm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSe2(i1),MSvIm2(i2),MHpm2(i3),dMSe2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMHpm2(i3,iv1),dMSe2(i1,iv2),dMSvIm2(i2,iv2),dMHpm2(i3,iv2)           & 
& ,ddMSe2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMHpm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp
colorfactor = 1
results1(20)=results1(20) + coeff*colorfactor*temp
results1_ti(20)=results1_ti(20) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(20).eq.results1(20)))  write(*,*) 'NaN at SSS C[Se, SvIm, conj[Hpm]]' 
! ---- Se,SvRe,conj[Hpm] ----
Do i1=1,6
 Do i2=1,9
    Do i3=1,2
coup1 = cplSeSvRecHpm(i1,i2,i3)
coup2 = cplHpmSvRecSe(i3,i2,i1)
Di_coup1 = dcplSeSvRecHpm(i1,i2,i3,iv1)
Dj_coup1 = dcplSeSvRecHpm(i1,i2,i3,iv2)
DDcoup1 = ddcplSeSvRecHpm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSe2(i1),MSvRe2(i2),MHpm2(i3),dMSe2(i1,iv1)         & 
& ,dMSvRe2(i2,iv1),dMHpm2(i3,iv1),dMSe2(i1,iv2),dMSvRe2(i2,iv2),dMHpm2(i3,iv2)           & 
& ,ddMSe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),ddMHpm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp
colorfactor = 1
results1(21)=results1(21) + coeff*colorfactor*temp
results1_ti(21)=results1_ti(21) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(21).eq.results1(21)))  write(*,*) 'NaN at SSS C[Se, SvRe, conj[Hpm]]' 

! ----- diagrams of type FFS, 27 ------ 

! ---- Ah,Cha,bar[Cha] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChaAhL(i3,i2,i1)
coup1R = cplcChaChaAhR(i3,i2,i1)
coup2L = cplcChaChaAhL(i2,i3,i1)
coup2R = cplcChaChaAhR(i2,i3,i1)
Di_coup1L = dcplcChaChaAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcChaChaAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcChaChaAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcChaChaAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcChaChaAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcChaChaAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MCha2(i2),MAh2(i1),dMCha2(i3,iv1)         & 
& ,dMCha2(i2,iv1),dMAh2(i1,iv1),dMCha2(i3,iv2),dMCha2(i2,iv2),dMAh2(i1,iv2)              & 
& ,ddMCha2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MCha2(i2),MAh2(i1),dMCha2(i3,iv1)         & 
& ,dMCha2(i2,iv1),dMAh2(i1,iv1),dMCha2(i3,iv2),dMCha2(i2,iv2),dMAh2(i1,iv2)              & 
& ,ddMCha2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(22)=results1(22) + coeff*colorfactor*temp
results1_ti(22)=results1_ti(22) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(22)=results1(22) + coeffbar*colorfactor*tempbar
results1_ti(22)=results1_ti(22) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(22).eq.results1(22)))  write(*,*) 'NaN at FFS C[Ah, Cha, bar[Cha]]' 
! ---- Ah,Chi,Chi ----
Do i1=1,3
 Do i2=1,5
    Do i3=1,5
coup1L = cplChiChiAhL(i2,i3,i1)
coup1R = cplChiChiAhR(i2,i3,i1)
coup2L = cplChiChiAhL(i2,i3,i1)
coup2R = cplChiChiAhR(i2,i3,i1)
Di_coup1L = dcplChiChiAhL(i2,i3,i1,iv1)
Di_coup1R = dcplChiChiAhR(i2,i3,i1,iv1)
Dj_coup1L = dcplChiChiAhL(i2,i3,i1,iv2)
Dj_coup1R = dcplChiChiAhR(i2,i3,i1,iv2)
DDcoup1L = ddcplChiChiAhL(i2,i3,i1,iv1,iv2)
DDcoup1R = ddcplChiChiAhR(i2,i3,i1,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MChi2(i3),MChi2(i2),MAh2(i1),dMChi2(i3,iv1)         & 
& ,dMChi2(i2,iv1),dMAh2(i1,iv1),dMChi2(i3,iv2),dMChi2(i2,iv2),dMAh2(i1,iv2)              & 
& ,ddMChi2(i3,iv1,iv2),ddMChi2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MChi2(i3),MChi2(i2),MAh2(i1),dMChi2(i3,iv1)         & 
& ,dMChi2(i2,iv1),dMAh2(i1,iv1),dMChi2(i3,iv2),dMChi2(i2,iv2),dMAh2(i1,iv2)              & 
& ,ddMChi2(i3,iv1,iv2),ddMChi2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(23)=results1(23) + coeff*colorfactor*temp
results1_ti(23)=results1_ti(23) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(23)=results1(23) + coeffbar*colorfactor*tempbar
results1_ti(23)=results1_ti(23) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(23).eq.results1(23)))  write(*,*) 'NaN at FFS C[Ah, Chi, Chi]' 
! ---- Ah,Fd,bar[Fd] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdAhL(i3,i2,i1)
coup1R = cplcFdFdAhR(i3,i2,i1)
coup2L = cplcFdFdAhL(i2,i3,i1)
coup2R = cplcFdFdAhR(i2,i3,i1)
Di_coup1L = dcplcFdFdAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFdFdAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFdFdAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFdFdAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFdFdAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFdFdAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)            & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),dMFd2(i3,iv2),dMFd2(i2,iv2),dMAh2(i1,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)            & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),dMFd2(i3,iv2),dMFd2(i2,iv2),dMAh2(i1,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(24)=results1(24) + coeff*colorfactor*temp
results1_ti(24)=results1_ti(24) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(24)=results1(24) + coeffbar*colorfactor*tempbar
results1_ti(24)=results1_ti(24) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(24).eq.results1(24)))  write(*,*) 'NaN at FFS C[Ah, Fd, bar[Fd]]' 
! ---- Ah,Fe,bar[Fe] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFeAhL(i3,i2,i1)
coup1R = cplcFeFeAhR(i3,i2,i1)
coup2L = cplcFeFeAhL(i2,i3,i1)
coup2R = cplcFeFeAhR(i2,i3,i1)
Di_coup1L = dcplcFeFeAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFeFeAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFeFeAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFeFeAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFeFeAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFeFeAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)            & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),dMFe2(i3,iv2),dMFe2(i2,iv2),dMAh2(i1,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)            & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),dMFe2(i3,iv2),dMFe2(i2,iv2),dMAh2(i1,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(25)=results1(25) + coeff*colorfactor*temp
results1_ti(25)=results1_ti(25) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(25)=results1(25) + coeffbar*colorfactor*tempbar
results1_ti(25)=results1_ti(25) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(25).eq.results1(25)))  write(*,*) 'NaN at FFS C[Ah, Fe, bar[Fe]]' 
! ---- Ah,Fu,bar[Fu] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuAhL(i3,i2,i1)
coup1R = cplcFuFuAhR(i3,i2,i1)
coup2L = cplcFuFuAhL(i2,i3,i1)
coup2R = cplcFuFuAhR(i2,i3,i1)
Di_coup1L = dcplcFuFuAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFuFuAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFuFuAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFuFuAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFuFuAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFuFuAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)            & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),dMFu2(i3,iv2),dMFu2(i2,iv2),dMAh2(i1,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)            & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),dMFu2(i3,iv2),dMFu2(i2,iv2),dMAh2(i1,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(26)=results1(26) + coeff*colorfactor*temp
results1_ti(26)=results1_ti(26) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(26)=results1(26) + coeffbar*colorfactor*tempbar
results1_ti(26)=results1_ti(26) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(26).eq.results1(26)))  write(*,*) 'NaN at FFS C[Ah, Fu, bar[Fu]]' 
! ---- Ah,Fv,Fv ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1L = cplFvFvAhL(i2,i3,i1)
coup1R = cplFvFvAhR(i2,i3,i1)
coup2L = cplFvFvAhL(i2,i3,i1)
coup2R = cplFvFvAhR(i2,i3,i1)
Di_coup1L = dcplFvFvAhL(i2,i3,i1,iv1)
Di_coup1R = dcplFvFvAhR(i2,i3,i1,iv1)
Dj_coup1L = dcplFvFvAhL(i2,i3,i1,iv2)
Dj_coup1R = dcplFvFvAhR(i2,i3,i1,iv2)
DDcoup1L = ddcplFvFvAhL(i2,i3,i1,iv1,iv2)
DDcoup1R = ddcplFvFvAhR(i2,i3,i1,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)            & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),dMFv2(i3,iv2),dMFv2(i2,iv2),dMAh2(i1,iv2),ddMFv2(i3,iv1,iv2)& 
& ,ddMFv2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)            & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),dMFv2(i3,iv2),dMFv2(i2,iv2),dMAh2(i1,iv2),ddMFv2(i3,iv1,iv2)& 
& ,ddMFv2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(27)=results1(27) + coeff*colorfactor*temp
results1_ti(27)=results1_ti(27) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(27)=results1(27) + coeffbar*colorfactor*tempbar
results1_ti(27)=results1_ti(27) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(27).eq.results1(27)))  write(*,*) 'NaN at FFS C[Ah, Fv, Fv]' 
! ---- Cha,hh,bar[Cha] ----
Do i1=1,2
 Do i2=1,3
    Do i3=1,2
coup1L = cplcChaChahhL(i3,i1,i2)
coup1R = cplcChaChahhR(i3,i1,i2)
coup2L = cplcChaChahhL(i1,i3,i2)
coup2R = cplcChaChahhR(i1,i3,i2)
Di_coup1L = dcplcChaChahhL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaChahhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaChahhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaChahhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaChahhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaChahhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MCha2(i1),Mhh2(i2),dMCha2(i3,iv1)         & 
& ,dMCha2(i1,iv1),dMhh2(i2,iv1),dMCha2(i3,iv2),dMCha2(i1,iv2),dMhh2(i2,iv2)              & 
& ,ddMCha2(i3,iv1,iv2),ddMCha2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MCha2(i1),Mhh2(i2),dMCha2(i3,iv1)         & 
& ,dMCha2(i1,iv1),dMhh2(i2,iv1),dMCha2(i3,iv2),dMCha2(i1,iv2),dMhh2(i2,iv2)              & 
& ,ddMCha2(i3,iv1,iv2),ddMCha2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(28)=results1(28) + coeff*colorfactor*temp
results1_ti(28)=results1_ti(28) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(28)=results1(28) + coeffbar*colorfactor*tempbar
results1_ti(28)=results1_ti(28) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(28).eq.results1(28)))  write(*,*) 'NaN at FFS C[Cha, hh, bar[Cha]]' 
! ---- Chi,Chi,hh ----
Do i1=1,5
 Do i2=1,5
    Do i3=1,3
coup1L = cplChiChihhL(i1,i2,i3)
coup1R = cplChiChihhR(i1,i2,i3)
coup2L = cplChiChihhL(i1,i2,i3)
coup2R = cplChiChihhR(i1,i2,i3)
Di_coup1L = dcplChiChihhL(i1,i2,i3,iv1)
Di_coup1R = dcplChiChihhR(i1,i2,i3,iv1)
Dj_coup1L = dcplChiChihhL(i1,i2,i3,iv2)
Dj_coup1R = dcplChiChihhR(i1,i2,i3,iv2)
DDcoup1L = ddcplChiChihhL(i1,i2,i3,iv1,iv2)
DDcoup1R = ddcplChiChihhR(i1,i2,i3,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MChi2(i2),MChi2(i1),Mhh2(i3),dMChi2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMhh2(i3,iv1),dMChi2(i2,iv2),dMChi2(i1,iv2),dMhh2(i3,iv2)              & 
& ,ddMChi2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MChi2(i2),MChi2(i1),Mhh2(i3),dMChi2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMhh2(i3,iv1),dMChi2(i2,iv2),dMChi2(i1,iv2),dMhh2(i3,iv2)              & 
& ,ddMChi2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMhh2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(29)=results1(29) + coeff*colorfactor*temp
results1_ti(29)=results1_ti(29) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(29)=results1(29) + coeffbar*colorfactor*tempbar
results1_ti(29)=results1_ti(29) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(29).eq.results1(29)))  write(*,*) 'NaN at FFS C[Chi, Chi, hh]' 
! ---- Chi,Fv,SvIm ----
Do i1=1,5
 Do i2=1,9
    Do i3=1,9
coup1L = cplChiFvSvImL(i1,i2,i3)
coup1R = cplChiFvSvImR(i1,i2,i3)
coup2L = cplChiFvSvImL(i1,i2,i3)
coup2R = cplChiFvSvImR(i1,i2,i3)
Di_coup1L = dcplChiFvSvImL(i1,i2,i3,iv1)
Di_coup1R = dcplChiFvSvImR(i1,i2,i3,iv1)
Dj_coup1L = dcplChiFvSvImL(i1,i2,i3,iv2)
Dj_coup1R = dcplChiFvSvImR(i1,i2,i3,iv2)
DDcoup1L = ddcplChiFvSvImL(i1,i2,i3,iv1,iv2)
DDcoup1R = ddcplChiFvSvImR(i1,i2,i3,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvIm2(i3),dMFv2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMSvIm2(i3,iv1),dMFv2(i2,iv2),dMChi2(i1,iv2),dMSvIm2(i3,iv2)           & 
& ,ddMFv2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSvIm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvIm2(i3),dMFv2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMSvIm2(i3,iv1),dMFv2(i2,iv2),dMChi2(i1,iv2),dMSvIm2(i3,iv2)           & 
& ,ddMFv2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSvIm2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(30)=results1(30) + coeff*colorfactor*temp
results1_ti(30)=results1_ti(30) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(30)=results1(30) + coeffbar*colorfactor*tempbar
results1_ti(30)=results1_ti(30) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(30).eq.results1(30)))  write(*,*) 'NaN at FFS C[Chi, Fv, SvIm]' 
! ---- Chi,Fv,SvRe ----
Do i1=1,5
 Do i2=1,9
    Do i3=1,9
coup1L = cplChiFvSvReL(i1,i2,i3)
coup1R = cplChiFvSvReR(i1,i2,i3)
coup2L = cplChiFvSvReL(i1,i2,i3)
coup2R = cplChiFvSvReR(i1,i2,i3)
Di_coup1L = dcplChiFvSvReL(i1,i2,i3,iv1)
Di_coup1R = dcplChiFvSvReR(i1,i2,i3,iv1)
Dj_coup1L = dcplChiFvSvReL(i1,i2,i3,iv2)
Dj_coup1R = dcplChiFvSvReR(i1,i2,i3,iv2)
DDcoup1L = ddcplChiFvSvReL(i1,i2,i3,iv1,iv2)
DDcoup1R = ddcplChiFvSvReR(i1,i2,i3,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvRe2(i3),dMFv2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMSvRe2(i3,iv1),dMFv2(i2,iv2),dMChi2(i1,iv2),dMSvRe2(i3,iv2)           & 
& ,ddMFv2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvRe2(i3),dMFv2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMSvRe2(i3,iv1),dMFv2(i2,iv2),dMChi2(i1,iv2),dMSvRe2(i3,iv2)           & 
& ,ddMFv2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(31)=results1(31) + coeff*colorfactor*temp
results1_ti(31)=results1_ti(31) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(31)=results1(31) + coeffbar*colorfactor*tempbar
results1_ti(31)=results1_ti(31) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(31).eq.results1(31)))  write(*,*) 'NaN at FFS C[Chi, Fv, SvRe]' 
! ---- Chi,Hpm,bar[Cha] ----
Do i1=1,5
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChiHpmL(i3,i1,i2)
coup1R = cplcChaChiHpmR(i3,i1,i2)
coup2L = cplChiChacHpmL(i1,i3,i2)
coup2R = cplChiChacHpmR(i1,i3,i2)
Di_coup1L = dcplcChaChiHpmL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaChiHpmR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaChiHpmL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaChiHpmR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaChiHpmL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaChiHpmR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MChi2(i1),MHpm2(i2),dMCha2(i3,iv1)        & 
& ,dMChi2(i1,iv1),dMHpm2(i2,iv1),dMCha2(i3,iv2),dMChi2(i1,iv2),dMHpm2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MChi2(i1),MHpm2(i2),dMCha2(i3,iv1)        & 
& ,dMChi2(i1,iv1),dMHpm2(i2,iv1),dMCha2(i3,iv2),dMChi2(i1,iv2),dMHpm2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(32)=results1(32) + coeff*colorfactor*temp
results1_ti(32)=results1_ti(32) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(32)=results1(32) + coeffbar*colorfactor*tempbar
results1_ti(32)=results1_ti(32) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(32).eq.results1(32)))  write(*,*) 'NaN at FFS C[Chi, Hpm, bar[Cha]]' 
! ---- Chi,Sd,bar[Fd] ----
Do i1=1,5
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdChiSdL(i3,i1,i2)
coup1R = cplcFdChiSdR(i3,i1,i2)
coup2L = cplChiFdcSdL(i1,i3,i2)
coup2R = cplChiFdcSdR(i1,i3,i2)
Di_coup1L = dcplcFdChiSdL(i3,i1,i2,iv1)
Di_coup1R = dcplcFdChiSdR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFdChiSdL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFdChiSdR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFdChiSdL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFdChiSdR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMChi2(i1,iv2),dMSd2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMChi2(i1,iv2),dMSd2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(33)=results1(33) + coeff*colorfactor*temp
results1_ti(33)=results1_ti(33) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(33)=results1(33) + coeffbar*colorfactor*tempbar
results1_ti(33)=results1_ti(33) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(33).eq.results1(33)))  write(*,*) 'NaN at FFS C[Chi, Sd, bar[Fd]]' 
! ---- Chi,Se,bar[Fe] ----
Do i1=1,5
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeChiSeL(i3,i1,i2)
coup1R = cplcFeChiSeR(i3,i1,i2)
coup2L = cplChiFecSeL(i1,i3,i2)
coup2R = cplChiFecSeR(i1,i3,i2)
Di_coup1L = dcplcFeChiSeL(i3,i1,i2,iv1)
Di_coup1R = dcplcFeChiSeR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFeChiSeL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFeChiSeR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFeChiSeL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFeChiSeR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),dMFe2(i3,iv2),dMChi2(i1,iv2),dMSe2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),dMFe2(i3,iv2),dMChi2(i1,iv2),dMSe2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(34)=results1(34) + coeff*colorfactor*temp
results1_ti(34)=results1_ti(34) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(34)=results1(34) + coeffbar*colorfactor*tempbar
results1_ti(34)=results1_ti(34) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(34).eq.results1(34)))  write(*,*) 'NaN at FFS C[Chi, Se, bar[Fe]]' 
! ---- Chi,Su,bar[Fu] ----
Do i1=1,5
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuChiSuL(i3,i1,i2)
coup1R = cplcFuChiSuR(i3,i1,i2)
coup2L = cplChiFucSuL(i1,i3,i2)
coup2R = cplChiFucSuR(i1,i3,i2)
Di_coup1L = dcplcFuChiSuL(i3,i1,i2,iv1)
Di_coup1R = dcplcFuChiSuR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFuChiSuL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFuChiSuR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFuChiSuL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFuChiSuR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMChi2(i1,iv2),dMSu2(i2,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMChi2(i1,iv2),dMSu2(i2,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(35)=results1(35) + coeff*colorfactor*temp
results1_ti(35)=results1_ti(35) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(35)=results1(35) + coeffbar*colorfactor*tempbar
results1_ti(35)=results1_ti(35) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(35).eq.results1(35)))  write(*,*) 'NaN at FFS C[Chi, Su, bar[Fu]]' 
! ---- Fd,hh,bar[Fd] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdhhL(i3,i1,i2)
coup1R = cplcFdFdhhR(i3,i1,i2)
coup2L = cplcFdFdhhL(i1,i3,i2)
coup2R = cplcFdFdhhR(i1,i3,i2)
Di_coup1L = dcplcFdFdhhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFdFdhhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFdFdhhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFdFdhhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFdFdhhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFdFdhhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)            & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),dMFd2(i3,iv2),dMFd2(i1,iv2),dMhh2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)            & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),dMFd2(i3,iv2),dMFd2(i1,iv2),dMhh2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(36)=results1(36) + coeff*colorfactor*temp
results1_ti(36)=results1_ti(36) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(36)=results1(36) + coeffbar*colorfactor*tempbar
results1_ti(36)=results1_ti(36) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(36).eq.results1(36)))  write(*,*) 'NaN at FFS C[Fd, hh, bar[Fd]]' 
! ---- Fd,bar[Cha],conj[Su] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFdcSuL(i2,i1,i3)
coup1R = cplcChaFdcSuR(i2,i1,i3)
coup2L = cplcFdChaSuL(i1,i2,i3)
coup2R = cplcFdChaSuR(i1,i2,i3)
Di_coup1L = dcplcChaFdcSuL(i2,i1,i3,iv1)
Di_coup1R = dcplcChaFdcSuR(i2,i1,i3,iv1)
Dj_coup1L = dcplcChaFdcSuL(i2,i1,i3,iv2)
Dj_coup1R = dcplcChaFdcSuR(i2,i1,i3,iv2)
DDcoup1L = ddcplcChaFdcSuL(i2,i1,i3,iv1,iv2)
DDcoup1R = ddcplcChaFdcSuR(i2,i1,i3,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)          & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),dMCha2(i2,iv2),dMFd2(i1,iv2),dMSu2(i3,iv2),ddMCha2(i2,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)          & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),dMCha2(i2,iv2),dMFd2(i1,iv2),dMSu2(i3,iv2),ddMCha2(i2,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMSu2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(37)=results1(37) + coeff*colorfactor*temp
results1_ti(37)=results1_ti(37) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(37)=results1(37) + coeffbar*colorfactor*tempbar
results1_ti(37)=results1_ti(37) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(37).eq.results1(37)))  write(*,*) 'NaN at FFS C[Fd, bar[Cha], conj[Su]]' 
! ---- Fe,hh,bar[Fe] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFehhL(i3,i1,i2)
coup1R = cplcFeFehhR(i3,i1,i2)
coup2L = cplcFeFehhL(i1,i3,i2)
coup2R = cplcFeFehhR(i1,i3,i2)
Di_coup1L = dcplcFeFehhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFeFehhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFeFehhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFeFehhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFeFehhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFeFehhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)            & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),dMFe2(i3,iv2),dMFe2(i1,iv2),dMhh2(i2,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)            & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),dMFe2(i3,iv2),dMFe2(i1,iv2),dMhh2(i2,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(38)=results1(38) + coeff*colorfactor*temp
results1_ti(38)=results1_ti(38) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(38)=results1(38) + coeffbar*colorfactor*tempbar
results1_ti(38)=results1_ti(38) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(38).eq.results1(38)))  write(*,*) 'NaN at FFS C[Fe, hh, bar[Fe]]' 
! ---- Fe,SvIm,bar[Cha] ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,2
coup1L = cplcChaFeSvImL(i3,i1,i2)
coup1R = cplcChaFeSvImR(i3,i1,i2)
coup2L = cplcFeChaSvImL(i1,i3,i2)
coup2R = cplcFeChaSvImR(i1,i3,i2)
Di_coup1L = dcplcChaFeSvImL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaFeSvImR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaFeSvImL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaFeSvImR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaFeSvImL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaFeSvImR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvIm2(i2),dMCha2(i3,iv1)        & 
& ,dMFe2(i1,iv1),dMSvIm2(i2,iv1),dMCha2(i3,iv2),dMFe2(i1,iv2),dMSvIm2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMFe2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvIm2(i2),dMCha2(i3,iv1)        & 
& ,dMFe2(i1,iv1),dMSvIm2(i2,iv1),dMCha2(i3,iv2),dMFe2(i1,iv2),dMSvIm2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMFe2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(39)=results1(39) + coeff*colorfactor*temp
results1_ti(39)=results1_ti(39) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(39)=results1(39) + coeffbar*colorfactor*tempbar
results1_ti(39)=results1_ti(39) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(39).eq.results1(39)))  write(*,*) 'NaN at FFS C[Fe, SvIm, bar[Cha]]' 
! ---- Fe,SvRe,bar[Cha] ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,2
coup1L = cplcChaFeSvReL(i3,i1,i2)
coup1R = cplcChaFeSvReR(i3,i1,i2)
coup2L = cplcFeChaSvReL(i1,i3,i2)
coup2R = cplcFeChaSvReR(i1,i3,i2)
Di_coup1L = dcplcChaFeSvReL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaFeSvReR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaFeSvReL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaFeSvReR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaFeSvReL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaFeSvReR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvRe2(i2),dMCha2(i3,iv1)        & 
& ,dMFe2(i1,iv1),dMSvRe2(i2,iv1),dMCha2(i3,iv2),dMFe2(i1,iv2),dMSvRe2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMFe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvRe2(i2),dMCha2(i3,iv1)        & 
& ,dMFe2(i1,iv1),dMSvRe2(i2,iv1),dMCha2(i3,iv2),dMFe2(i1,iv2),dMSvRe2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMFe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(40)=results1(40) + coeff*colorfactor*temp
results1_ti(40)=results1_ti(40) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(40)=results1(40) + coeffbar*colorfactor*tempbar
results1_ti(40)=results1_ti(40) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(40).eq.results1(40)))  write(*,*) 'NaN at FFS C[Fe, SvRe, bar[Cha]]' 
! ---- Fu,hh,bar[Fu] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuhhL(i3,i1,i2)
coup1R = cplcFuFuhhR(i3,i1,i2)
coup2L = cplcFuFuhhL(i1,i3,i2)
coup2R = cplcFuFuhhR(i1,i3,i2)
Di_coup1L = dcplcFuFuhhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFuFuhhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFuFuhhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFuFuhhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFuFuhhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFuFuhhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),dMFu2(i3,iv2),dMFu2(i1,iv2),dMhh2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),dMFu2(i3,iv2),dMFu2(i1,iv2),dMhh2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(41)=results1(41) + coeff*colorfactor*temp
results1_ti(41)=results1_ti(41) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(41)=results1(41) + coeffbar*colorfactor*tempbar
results1_ti(41)=results1_ti(41) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(41).eq.results1(41)))  write(*,*) 'NaN at FFS C[Fu, hh, bar[Fu]]' 
! ---- Fu,Hpm,bar[Fd] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFdFuHpmL(i3,i1,i2)
coup1R = cplcFdFuHpmR(i3,i1,i2)
coup2L = cplcFuFdcHpmL(i1,i3,i2)
coup2R = cplcFuFdcHpmR(i1,i3,i2)
Di_coup1L = dcplcFdFuHpmL(i3,i1,i2,iv1)
Di_coup1R = dcplcFdFuHpmR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFdFuHpmL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFdFuHpmR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFdFuHpmL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFdFuHpmR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)           & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),dMFd2(i3,iv2),dMFu2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMFu2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)           & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),dMFd2(i3,iv2),dMFu2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMFu2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(42)=results1(42) + coeff*colorfactor*temp
results1_ti(42)=results1_ti(42) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(42)=results1(42) + coeffbar*colorfactor*tempbar
results1_ti(42)=results1_ti(42) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(42).eq.results1(42)))  write(*,*) 'NaN at FFS C[Fu, Hpm, bar[Fd]]' 
! ---- Fv,Fv,hh ----
Do i1=1,9
 Do i2=1,9
    Do i3=1,3
coup1L = cplFvFvhhL(i1,i2,i3)
coup1R = cplFvFvhhR(i1,i2,i3)
coup2L = cplFvFvhhL(i1,i2,i3)
coup2R = cplFvFvhhR(i1,i2,i3)
Di_coup1L = dcplFvFvhhL(i1,i2,i3,iv1)
Di_coup1R = dcplFvFvhhR(i1,i2,i3,iv1)
Dj_coup1L = dcplFvFvhhL(i1,i2,i3,iv2)
Dj_coup1R = dcplFvFvhhR(i1,i2,i3,iv2)
DDcoup1L = ddcplFvFvhhL(i1,i2,i3,iv1,iv2)
DDcoup1R = ddcplFvFvhhR(i1,i2,i3,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MFv2(i2),MFv2(i1),Mhh2(i3),dMFv2(i2,iv1)            & 
& ,dMFv2(i1,iv1),dMhh2(i3,iv1),dMFv2(i2,iv2),dMFv2(i1,iv2),dMhh2(i3,iv2),ddMFv2(i2,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i2),MFv2(i1),Mhh2(i3),dMFv2(i2,iv1)            & 
& ,dMFv2(i1,iv1),dMhh2(i3,iv1),dMFv2(i2,iv2),dMFv2(i1,iv2),dMhh2(i3,iv2),ddMFv2(i2,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMhh2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(43)=results1(43) + coeff*colorfactor*temp
results1_ti(43)=results1_ti(43) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(43)=results1(43) + coeffbar*colorfactor*tempbar
results1_ti(43)=results1_ti(43) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(43).eq.results1(43)))  write(*,*) 'NaN at FFS C[Fv, Fv, hh]' 
! ---- Fv,Hpm,bar[Fe] ----
Do i1=1,9
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFeFvHpmL(i3,i1,i2)
coup1R = cplcFeFvHpmR(i3,i1,i2)
coup2L = cplFvFecHpmL(i1,i3,i2)
coup2R = cplFvFecHpmR(i1,i3,i2)
Di_coup1L = dcplcFeFvHpmL(i3,i1,i2,iv1)
Di_coup1R = dcplcFeFvHpmR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFeFvHpmL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFeFvHpmR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFeFvHpmL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFeFvHpmR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),dMFe2(i3,iv2),dMFv2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMFv2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),dMFe2(i3,iv2),dMFv2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMFv2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(44)=results1(44) + coeff*colorfactor*temp
results1_ti(44)=results1_ti(44) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(44)=results1(44) + coeffbar*colorfactor*tempbar
results1_ti(44)=results1_ti(44) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(44).eq.results1(44)))  write(*,*) 'NaN at FFS C[Fv, Hpm, bar[Fe]]' 
! ---- Fv,Se,bar[Cha] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFvSeL(i3,i1,i2)
coup1R = cplcChaFvSeR(i3,i1,i2)
coup2L = cplFvChacSeL(i1,i3,i2)
coup2R = cplFvChacSeR(i1,i3,i2)
Di_coup1L = dcplcChaFvSeL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaFvSeR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaFvSeL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaFvSeR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaFvSeL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaFvSeR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFv2(i1),MSe2(i2),dMCha2(i3,iv1)          & 
& ,dMFv2(i1,iv1),dMSe2(i2,iv1),dMCha2(i3,iv2),dMFv2(i1,iv2),dMSe2(i2,iv2),ddMCha2(i3,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFv2(i1),MSe2(i2),dMCha2(i3,iv1)          & 
& ,dMFv2(i1,iv1),dMSe2(i2,iv1),dMCha2(i3,iv2),dMFv2(i1,iv2),dMSe2(i2,iv2),ddMCha2(i3,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(45)=results1(45) + coeff*colorfactor*temp
results1_ti(45)=results1_ti(45) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(45)=results1(45) + coeffbar*colorfactor*tempbar
results1_ti(45)=results1_ti(45) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(45).eq.results1(45)))  write(*,*) 'NaN at FFS C[Fv, Se, bar[Cha]]' 
! ---- Glu,Sd,bar[Fd] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdGluSdL(i3,i2)
coup1R = cplcFdGluSdR(i3,i2)
coup2L = cplGluFdcSdL(i3,i2)
coup2R = cplGluFdcSdR(i3,i2)
Di_coup1L = dcplcFdGluSdL(i3,i2,iv1)
Di_coup1R = dcplcFdGluSdR(i3,i2,iv1)
Dj_coup1L = dcplcFdGluSdL(i3,i2,iv2)
Dj_coup1R = dcplcFdGluSdR(i3,i2,iv2)
DDcoup1L = ddcplcFdGluSdL(i3,i2,iv1,iv2)
DDcoup1R = ddcplcFdGluSdR(i3,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMGlu2(1,iv2),dMSd2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMGlu2(1,iv2),dMSd2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 4
results1(46)=results1(46) + coeff*colorfactor*temp
results1_ti(46)=results1_ti(46) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(46)=results1(46) + coeffbar*colorfactor*tempbar
results1_ti(46)=results1_ti(46) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
if (.not.(results1(46).eq.results1(46)))  write(*,*) 'NaN at FFS C[Glu, Sd, bar[Fd]]' 
! ---- Glu,Su,bar[Fu] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuGluSuL(i3,i2)
coup1R = cplcFuGluSuR(i3,i2)
coup2L = cplGluFucSuL(i3,i2)
coup2R = cplGluFucSuR(i3,i2)
Di_coup1L = dcplcFuGluSuL(i3,i2,iv1)
Di_coup1R = dcplcFuGluSuR(i3,i2,iv1)
Dj_coup1L = dcplcFuGluSuL(i3,i2,iv2)
Dj_coup1R = dcplcFuGluSuR(i3,i2,iv2)
DDcoup1L = ddcplcFuGluSuL(i3,i2,iv1,iv2)
DDcoup1R = ddcplcFuGluSuR(i3,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMGlu2(1,iv2),dMSu2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMGlu2(1,iv2),dMSu2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 4
results1(47)=results1(47) + coeff*colorfactor*temp
results1_ti(47)=results1_ti(47) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(47)=results1(47) + coeffbar*colorfactor*tempbar
results1_ti(47)=results1_ti(47) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
if (.not.(results1(47).eq.results1(47)))  write(*,*) 'NaN at FFS C[Glu, Su, bar[Fu]]' 
! ---- Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFuSdL(i2,i3,i1)
coup1R = cplcChacFuSdR(i2,i3,i1)
coup2L = cplChaFucSdL(i2,i3,i1)
coup2R = cplChaFucSdR(i2,i3,i1)
Di_coup1L = dcplcChacFuSdL(i2,i3,i1,iv1)
Di_coup1R = dcplcChacFuSdR(i2,i3,i1,iv1)
Dj_coup1L = dcplcChacFuSdL(i2,i3,i1,iv2)
Dj_coup1R = dcplcChacFuSdR(i2,i3,i1,iv2)
DDcoup1L = ddcplcChacFuSdL(i2,i3,i1,iv1,iv2)
DDcoup1R = ddcplcChacFuSdR(i2,i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)           & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),dMFu2(i3,iv2),dMCha2(i2,iv2),dMSd2(i1,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMSd2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)           & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),dMFu2(i3,iv2),dMCha2(i2,iv2),dMSd2(i1,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMSd2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(48)=results1(48) + coeff*colorfactor*temp
results1_ti(48)=results1_ti(48) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(48)=results1(48) + coeffbar*colorfactor*tempbar
results1_ti(48)=results1_ti(48) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(48).eq.results1(48)))  write(*,*) 'NaN at FFS C[Sd, bar[Cha], bar[Fu]]' 

! ----- diagrams of type SSV, 2 ------ 

! ---- Sd,VG,conj[Sd] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSdcSdVG(i1,i3)
coup2 = cplSdcSdVG(i3,i1)
Di_coup1 = dcplSdcSdVG(i1,i3,iv1)
Dj_coup1 = dcplSdcSdVG(i1,i3,iv2)
DDcoup1 = ddcplSdcSdVG(i1,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSd2(i3),MSd2(i1),0._dp,dMSd2(i3,iv1)               & 
& ,dMSd2(i1,iv1),ZeroC,dMSd2(i3,iv2),dMSd2(i1,iv2),ZeroC,ddMSd2(i3,iv1,iv2)              & 
& ,ddMSd2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'SSV   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 4
results1(49)=results1(49) + coeff*colorfactor*temp
results1_ti(49)=results1_ti(49) + coeff*colorfactor*temp_ti
    End Do
End Do
if (.not.(results1(49).eq.results1(49)))  write(*,*) 'NaN at SSV C[Sd, VG, conj[Sd]]' 
! ---- Su,VG,conj[Su] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSucSuVG(i1,i3)
coup2 = cplSucSuVG(i3,i1)
Di_coup1 = dcplSucSuVG(i1,i3,iv1)
Dj_coup1 = dcplSucSuVG(i1,i3,iv2)
DDcoup1 = ddcplSucSuVG(i1,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSu2(i3),MSu2(i1),0._dp,dMSu2(i3,iv1)               & 
& ,dMSu2(i1,iv1),ZeroC,dMSu2(i3,iv2),dMSu2(i1,iv2),ZeroC,ddMSu2(i3,iv1,iv2)              & 
& ,ddMSu2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'SSV   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 4
results1(50)=results1(50) + coeff*colorfactor*temp
results1_ti(50)=results1_ti(50) + coeff*colorfactor*temp_ti
    End Do
End Do
if (.not.(results1(50).eq.results1(50)))  write(*,*) 'NaN at SSV C[Su, VG, conj[Su]]' 

! ----- diagrams of type FFV, 3 ------ 

! ---- Fd,VG,bar[Fd] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFdFdVGL(i3,i1)
coup1R = cplcFdFdVGR(i3,i1)
coup2L = cplcFdFdVGL(i1,i3)
coup2R = cplcFdFdVGR(i1,i3)
Di_coup1L = dcplcFdFdVGL(i3,i1,iv1)
Di_coup1R = dcplcFdFdVGR(i3,i1,iv1)
Dj_coup1L = dcplcFdFdVGL(i3,i1,iv2)
Dj_coup1R = dcplcFdFdVGR(i3,i1,iv2)
DDcoup1L = ddcplcFdFdVGL(i3,i1,iv1,iv2)
DDcoup1R = ddcplcFdFdVGR(i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1)               & 
& ,dMFd2(i1,iv1),ZeroC,dMFd2(i3,iv2),dMFd2(i1,iv2),ZeroC,ddMFd2(i3,iv1,iv2)              & 
& ,ddMFd2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'FFV   ',Q2,temp,temp_ti,temp_tj)
coupxbar = -2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = -2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = -2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = -2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1)               & 
& ,dMFd2(i1,iv1),ZeroC,dMFd2(i3,iv2),dMFd2(i1,iv2),ZeroC,ddMFd2(i3,iv1,iv2)              & 
& ,ddMFd2(i1,iv1,iv2),ZeroC,coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFVbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 4
results1(51)=results1(51) + coeff*colorfactor*temp
results1_ti(51)=results1_ti(51) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(51)=results1(51) + coeffbar*colorfactor*tempbar
results1_ti(51)=results1_ti(51) + coeffbar*colorfactor*tempbar_ti
    End Do
End Do
if (.not.(results1(51).eq.results1(51)))  write(*,*) 'NaN at FFV C[Fd, VG, bar[Fd]]' 
! ---- Fu,VG,bar[Fu] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFuFuVGL(i3,i1)
coup1R = cplcFuFuVGR(i3,i1)
coup2L = cplcFuFuVGL(i1,i3)
coup2R = cplcFuFuVGR(i1,i3)
Di_coup1L = dcplcFuFuVGL(i3,i1,iv1)
Di_coup1R = dcplcFuFuVGR(i3,i1,iv1)
Dj_coup1L = dcplcFuFuVGL(i3,i1,iv2)
Dj_coup1R = dcplcFuFuVGR(i3,i1,iv2)
DDcoup1L = ddcplcFuFuVGL(i3,i1,iv1,iv2)
DDcoup1R = ddcplcFuFuVGR(i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1)               & 
& ,dMFu2(i1,iv1),ZeroC,dMFu2(i3,iv2),dMFu2(i1,iv2),ZeroC,ddMFu2(i3,iv1,iv2)              & 
& ,ddMFu2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'FFV   ',Q2,temp,temp_ti,temp_tj)
coupxbar = -2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = -2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = -2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = -2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1)               & 
& ,dMFu2(i1,iv1),ZeroC,dMFu2(i3,iv2),dMFu2(i1,iv2),ZeroC,ddMFu2(i3,iv1,iv2)              & 
& ,ddMFu2(i1,iv1,iv2),ZeroC,coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFVbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 4
results1(52)=results1(52) + coeff*colorfactor*temp
results1_ti(52)=results1_ti(52) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(52)=results1(52) + coeffbar*colorfactor*tempbar
results1_ti(52)=results1_ti(52) + coeffbar*colorfactor*tempbar_ti
    End Do
End Do
if (.not.(results1(52).eq.results1(52)))  write(*,*) 'NaN at FFV C[Fu, VG, bar[Fu]]' 
! ---- Glu,Glu,VG ----
coup1L = cplGluGluVGL
coup1R = cplGluGluVGR
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
Di_coup1L = dcplGluGluVGL(iv1)
Di_coup1R = dcplGluGluVGR(iv1)
Dj_coup1L = dcplGluGluVGL(iv2)
Dj_coup1R = dcplGluGluVGR(iv2)
DDcoup1L = ddcplGluGluVGL(iv1,iv2)
DDcoup1R = ddcplGluGluVGR(iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)       & 
& ,ZeroC,dMGlu2(1,iv2),dMGlu2(1,iv2),ZeroC,ddMGlu2(1,iv1,iv2),ddMGlu2(1,iv1,iv2)         & 
& ,ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'FFV   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)       & 
& ,ZeroC,dMGlu2(1,iv2),dMGlu2(1,iv2),ZeroC,ddMGlu2(1,iv1,iv2),ddMGlu2(1,iv1,iv2)         & 
& ,ZeroC,coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFVbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 24
results1(53)=results1(53) + coeff*colorfactor*temp
results1_ti(53)=results1_ti(53) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(53)=results1(53) + coeffbar*colorfactor*tempbar
results1_ti(53)=results1_ti(53) + coeffbar*colorfactor*tempbar_ti
if (.not.(results1(53).eq.results1(53)))  write(*,*) 'NaN at FFV C[Glu, Glu, VG]' 

! ----- diagrams of type VVV, 1 ------ 

! ---- VG,VG,VG ----
coup1 = cplVGVGVG
coup2 = cplVGVGVG
Di_coup1 = dcplVGVGVG(iv1)
Dj_coup1 = dcplVGVGVG(iv2)
DDcoup1 = ddcplVGVGVG(iv1,iv2)
coeff = 0.000
colorfactor = 24
results1(54)=results1(54) + coeff*colorfactor*temp
results1_ti(54)=results1_ti(54) + coeff*colorfactor*temp_ti
if (.not.(results1(54).eq.results1(54)))  write(*,*) 'NaN at VVV C[VG, VG, VG]' 
! ----- Topology2: diagrams w. 2 Particles and 1 Vertex


! ----- diagrams of type SS, 33 ------ 

! ---- Ah,Ah ----
Do i1=1,3
 Do i2=1,3
coup1 = cplAhAhAhAh(i1,i1,i2,i2)
Di_coup1 = dcplAhAhAhAh(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhAhAh(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhAhAh(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MAh2(i2),dMAh2(i1,iv1),dMAh2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMAh2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMAh2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp/8._dp)
results2(1)=results2(1) + coeff*temp
results2_ti(1)=results2_ti(1) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(1).eq.results2(1)))  write(*,*) 'NaN at SS C[Ah, Ah, Ah, Ah]' 
! ---- Ah,hh ----
Do i1=1,3
 Do i2=1,3
coup1 = cplAhAhhhhh(i1,i1,i2,i2)
Di_coup1 = dcplAhAhhhhh(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhhhhh(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhhhhh(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),Mhh2(i2),dMAh2(i1,iv1),dMhh2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMhh2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(2)=results2(2) + coeff*temp
results2_ti(2)=results2_ti(2) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(2).eq.results2(2)))  write(*,*) 'NaN at SS C[Ah, Ah, hh, hh]' 
! ---- Ah,Hpm ----
Do i1=1,3
 Do i2=1,2
coup1 = cplAhAhHpmcHpm(i1,i1,i2,i2)
Di_coup1 = dcplAhAhHpmcHpm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhHpmcHpm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhHpmcHpm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MHpm2(i2),dMAh2(i1,iv1),dMHpm2(i2,iv1)       & 
& ,dMAh2(i1,iv2),dMHpm2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(3)=results2(3) + coeff*temp
results2_ti(3)=results2_ti(3) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(3).eq.results2(3)))  write(*,*) 'NaN at SS C[Ah, Ah, Hpm, conj[Hpm]]' 
! ---- Ah,Sd ----
Do i1=1,3
 Do i2=1,6
coup1 = cplAhAhSdcSd(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSdcSd(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSdcSd(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSdcSd(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSd2(i2),dMAh2(i1,iv1),dMSd2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSd2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(4)=results2(4) + coeff*temp
results2_ti(4)=results2_ti(4) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(4).eq.results2(4)))  write(*,*) 'NaN at SS C[Ah, Ah, Sd, conj[Sd]]' 
! ---- Ah,Se ----
Do i1=1,3
 Do i2=1,6
coup1 = cplAhAhSecSe(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSecSe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSecSe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSecSe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSe2(i2),dMAh2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSe2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(5)=results2(5) + coeff*temp
results2_ti(5)=results2_ti(5) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(5).eq.results2(5)))  write(*,*) 'NaN at SS C[Ah, Ah, Se, conj[Se]]' 
! ---- Ah,Su ----
Do i1=1,3
 Do i2=1,6
coup1 = cplAhAhSucSu(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSucSu(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSucSu(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSucSu(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSu2(i2),dMAh2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSu2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(6)=results2(6) + coeff*temp
results2_ti(6)=results2_ti(6) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(6).eq.results2(6)))  write(*,*) 'NaN at SS C[Ah, Ah, Su, conj[Su]]' 
! ---- Ah,SvIm ----
Do i1=1,3
 Do i2=1,9
coup1 = cplAhAhSvImSvIm(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSvImSvIm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSvImSvIm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSvImSvIm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSvIm2(i2),dMAh2(i1,iv1),dMSvIm2(i2,iv1)     & 
& ,dMAh2(i1,iv2),dMSvIm2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(7)=results2(7) + coeff*temp
results2_ti(7)=results2_ti(7) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(7).eq.results2(7)))  write(*,*) 'NaN at SS C[Ah, Ah, SvIm, SvIm]' 
! ---- Ah,SvRe ----
Do i1=1,3
 Do i2=1,9
coup1 = cplAhAhSvReSvRe(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSvReSvRe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSvReSvRe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSvReSvRe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSvRe2(i2),dMAh2(i1,iv1),dMSvRe2(i2,iv1)     & 
& ,dMAh2(i1,iv2),dMSvRe2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(8)=results2(8) + coeff*temp
results2_ti(8)=results2_ti(8) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(8).eq.results2(8)))  write(*,*) 'NaN at SS C[Ah, Ah, SvRe, SvRe]' 
! ---- hh,hh ----
Do i1=1,3
 Do i2=1,3
coup1 = cplhhhhhhhh(i1,i1,i2,i2)
Di_coup1 = dcplhhhhhhhh(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhhhhh(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhhhhh(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),Mhh2(i2),dMhh2(i1,iv1),dMhh2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMhh2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp/8._dp)
results2(9)=results2(9) + coeff*temp
results2_ti(9)=results2_ti(9) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(9).eq.results2(9)))  write(*,*) 'NaN at SS C[hh, hh, hh, hh]' 
! ---- hh,Hpm ----
Do i1=1,3
 Do i2=1,2
coup1 = cplhhhhHpmcHpm(i1,i1,i2,i2)
Di_coup1 = dcplhhhhHpmcHpm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhHpmcHpm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhHpmcHpm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MHpm2(i2),dMhh2(i1,iv1),dMHpm2(i2,iv1)       & 
& ,dMhh2(i1,iv2),dMHpm2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(10)=results2(10) + coeff*temp
results2_ti(10)=results2_ti(10) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(10).eq.results2(10)))  write(*,*) 'NaN at SS C[hh, hh, Hpm, conj[Hpm]]' 
! ---- hh,Sd ----
Do i1=1,3
 Do i2=1,6
coup1 = cplhhhhSdcSd(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSdcSd(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSdcSd(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSdcSd(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSd2(i2),dMhh2(i1,iv1),dMSd2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSd2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(11)=results2(11) + coeff*temp
results2_ti(11)=results2_ti(11) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(11).eq.results2(11)))  write(*,*) 'NaN at SS C[hh, hh, Sd, conj[Sd]]' 
! ---- hh,Se ----
Do i1=1,3
 Do i2=1,6
coup1 = cplhhhhSecSe(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSecSe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSecSe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSecSe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSe2(i2),dMhh2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSe2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(12)=results2(12) + coeff*temp
results2_ti(12)=results2_ti(12) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(12).eq.results2(12)))  write(*,*) 'NaN at SS C[hh, hh, Se, conj[Se]]' 
! ---- hh,Su ----
Do i1=1,3
 Do i2=1,6
coup1 = cplhhhhSucSu(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSucSu(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSucSu(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSucSu(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSu2(i2),dMhh2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSu2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(13)=results2(13) + coeff*temp
results2_ti(13)=results2_ti(13) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(13).eq.results2(13)))  write(*,*) 'NaN at SS C[hh, hh, Su, conj[Su]]' 
! ---- hh,SvIm ----
Do i1=1,3
 Do i2=1,9
coup1 = cplhhhhSvImSvIm(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSvImSvIm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSvImSvIm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSvImSvIm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSvIm2(i2),dMhh2(i1,iv1),dMSvIm2(i2,iv1)     & 
& ,dMhh2(i1,iv2),dMSvIm2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(14)=results2(14) + coeff*temp
results2_ti(14)=results2_ti(14) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(14).eq.results2(14)))  write(*,*) 'NaN at SS C[hh, hh, SvIm, SvIm]' 
! ---- hh,SvRe ----
Do i1=1,3
 Do i2=1,9
coup1 = cplhhhhSvReSvRe(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSvReSvRe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSvReSvRe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSvReSvRe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSvRe2(i2),dMhh2(i1,iv1),dMSvRe2(i2,iv1)     & 
& ,dMhh2(i1,iv2),dMSvRe2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(15)=results2(15) + coeff*temp
results2_ti(15)=results2_ti(15) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(15).eq.results2(15)))  write(*,*) 'NaN at SS C[hh, hh, SvRe, SvRe]' 
! ---- Hpm,Hpm ----
Do i1=1,2
 Do i2=1,2
coup1 = cplHpmHpmcHpmcHpm(i1,i2,i1,i2)
Di_coup1 = dcplHpmHpmcHpmcHpm(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmHpmcHpmcHpm(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmHpmcHpmcHpm(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MHpm2(i2),dMHpm2(i1,iv1),dMHpm2(i2,iv1)     & 
& ,dMHpm2(i1,iv2),dMHpm2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(16)=results2(16) + coeff*temp
results2_ti(16)=results2_ti(16) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(16).eq.results2(16)))  write(*,*) 'NaN at SS C[Hpm, Hpm, conj[Hpm], conj[Hpm]]' 
! ---- Hpm,Sd ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSdcHpmcSd(i1,i2,i1,i2)
Di_coup1 = dcplHpmSdcHpmcSd(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSdcHpmcSd(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSdcHpmcSd(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSd2(i2),dMHpm2(i1,iv1),dMSd2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSd2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(17)=results2(17) + coeff*temp
results2_ti(17)=results2_ti(17) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(17).eq.results2(17)))  write(*,*) 'NaN at SS C[Hpm, Sd, conj[Hpm], conj[Sd]]' 
! ---- Hpm,Se ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSecHpmcSe(i1,i2,i1,i2)
Di_coup1 = dcplHpmSecHpmcSe(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSecHpmcSe(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSecHpmcSe(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSe2(i2),dMHpm2(i1,iv1),dMSe2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSe2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(18)=results2(18) + coeff*temp
results2_ti(18)=results2_ti(18) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(18).eq.results2(18)))  write(*,*) 'NaN at SS C[Hpm, Se, conj[Hpm], conj[Se]]' 
! ---- Hpm,Su ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSucHpmcSu(i1,i2,i1,i2)
Di_coup1 = dcplHpmSucHpmcSu(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSucHpmcSu(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSucHpmcSu(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSu2(i2),dMHpm2(i1,iv1),dMSu2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSu2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(19)=results2(19) + coeff*temp
results2_ti(19)=results2_ti(19) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(19).eq.results2(19)))  write(*,*) 'NaN at SS C[Hpm, Su, conj[Hpm], conj[Su]]' 
! ---- Hpm,SvIm ----
Do i1=1,2
 Do i2=1,9
coup1 = cplHpmSvImSvImcHpm(i1,i2,i2,i1)
Di_coup1 = dcplHpmSvImSvImcHpm(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplHpmSvImSvImcHpm(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplHpmSvImSvImcHpm(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSvIm2(i2),dMHpm2(i1,iv1),dMSvIm2(i2,iv1)   & 
& ,dMHpm2(i1,iv2),dMSvIm2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2)               & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(20)=results2(20) + coeff*temp
results2_ti(20)=results2_ti(20) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(20).eq.results2(20)))  write(*,*) 'NaN at SS C[Hpm, SvIm, SvIm, conj[Hpm]]' 
! ---- Hpm,SvRe ----
Do i1=1,2
 Do i2=1,9
coup1 = cplHpmSvReSvRecHpm(i1,i2,i2,i1)
Di_coup1 = dcplHpmSvReSvRecHpm(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplHpmSvReSvRecHpm(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplHpmSvReSvRecHpm(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSvRe2(i2),dMHpm2(i1,iv1),dMSvRe2(i2,iv1)   & 
& ,dMHpm2(i1,iv2),dMSvRe2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2)               & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(21)=results2(21) + coeff*temp
results2_ti(21)=results2_ti(21) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(21).eq.results2(21)))  write(*,*) 'NaN at SS C[Hpm, SvRe, SvRe, conj[Hpm]]' 
! ---- Sd,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSdcSdcSd(i1,i2,i1,i2)
Di_coup1 = dcplSdSdcSdcSd(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSdSdcSdcSd(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSdSdcSdcSd(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSd2(i1),MSd2(i2),dMSd2(i1,iv1),dMSd2(i2,iv1)         & 
& ,dMSd2(i1,iv2),dMSd2(i2,iv2),ddMSd2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(22)=results2(22) + coeff*temp
results2_ti(22)=results2_ti(22) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(22).eq.results2(22)))  write(*,*) 'NaN at SS C[Sd, Sd, conj[Sd], conj[Sd]]' 
! ---- Sd,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSecSdcSe(i1,i2,i1,i2)
Di_coup1 = dcplSdSecSdcSe(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSdSecSdcSe(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSdSecSdcSe(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSd2(i1),MSe2(i2),dMSd2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMSd2(i1,iv2),dMSe2(i2,iv2),ddMSd2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(23)=results2(23) + coeff*temp
results2_ti(23)=results2_ti(23) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(23).eq.results2(23)))  write(*,*) 'NaN at SS C[Sd, Se, conj[Sd], conj[Se]]' 
! ---- Sd,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSucSdcSu(i1,i2,i1,i2)
Di_coup1 = dcplSdSucSdcSu(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSdSucSdcSu(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSdSucSdcSu(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSd2(i1),MSu2(i2),dMSd2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMSd2(i1,iv2),dMSu2(i2,iv2),ddMSd2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(24)=results2(24) + coeff*temp
results2_ti(24)=results2_ti(24) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(24).eq.results2(24)))  write(*,*) 'NaN at SS C[Sd, Su, conj[Sd], conj[Su]]' 
! ---- Se,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSecSecSe(i1,i2,i1,i2)
Di_coup1 = dcplSeSecSecSe(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSeSecSecSe(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSeSecSecSe(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSe2(i1),MSe2(i2),dMSe2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMSe2(i1,iv2),dMSe2(i2,iv2),ddMSe2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(25)=results2(25) + coeff*temp
results2_ti(25)=results2_ti(25) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(25).eq.results2(25)))  write(*,*) 'NaN at SS C[Se, Se, conj[Se], conj[Se]]' 
! ---- Se,SvIm ----
Do i1=1,6
 Do i2=1,9
coup1 = cplSeSvImSvImcSe(i1,i2,i2,i1)
Di_coup1 = dcplSeSvImSvImcSe(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplSeSvImSvImcSe(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplSeSvImSvImcSe(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MSe2(i1),MSvIm2(i2),dMSe2(i1,iv1),dMSvIm2(i2,iv1)     & 
& ,dMSe2(i1,iv2),dMSvIm2(i2,iv2),ddMSe2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(26)=results2(26) + coeff*temp
results2_ti(26)=results2_ti(26) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(26).eq.results2(26)))  write(*,*) 'NaN at SS C[Se, SvIm, SvIm, conj[Se]]' 
! ---- Se,SvRe ----
Do i1=1,6
 Do i2=1,9
coup1 = cplSeSvReSvRecSe(i1,i2,i2,i1)
Di_coup1 = dcplSeSvReSvRecSe(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplSeSvReSvRecSe(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplSeSvReSvRecSe(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MSe2(i1),MSvRe2(i2),dMSe2(i1,iv1),dMSvRe2(i2,iv1)     & 
& ,dMSe2(i1,iv2),dMSvRe2(i2,iv2),ddMSe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(27)=results2(27) + coeff*temp
results2_ti(27)=results2_ti(27) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(27).eq.results2(27)))  write(*,*) 'NaN at SS C[Se, SvRe, SvRe, conj[Se]]' 
! ---- Su,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSucSucSu(i1,i2,i1,i2)
Di_coup1 = dcplSuSucSucSu(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSuSucSucSu(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSuSucSucSu(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSu2(i1),MSu2(i2),dMSu2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMSu2(i1,iv2),dMSu2(i2,iv2),ddMSu2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(28)=results2(28) + coeff*temp
results2_ti(28)=results2_ti(28) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(28).eq.results2(28)))  write(*,*) 'NaN at SS C[Su, Su, conj[Su], conj[Su]]' 
! ---- Su,SvIm ----
Do i1=1,6
 Do i2=1,9
coup1 = cplSuSvImSvImcSu(i1,i2,i2,i1)
Di_coup1 = dcplSuSvImSvImcSu(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplSuSvImSvImcSu(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplSuSvImSvImcSu(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MSu2(i1),MSvIm2(i2),dMSu2(i1,iv1),dMSvIm2(i2,iv1)     & 
& ,dMSu2(i1,iv2),dMSvIm2(i2,iv2),ddMSu2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(29)=results2(29) + coeff*temp
results2_ti(29)=results2_ti(29) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(29).eq.results2(29)))  write(*,*) 'NaN at SS C[Su, SvIm, SvIm, conj[Su]]' 
! ---- Su,SvRe ----
Do i1=1,6
 Do i2=1,9
coup1 = cplSuSvReSvRecSu(i1,i2,i2,i1)
Di_coup1 = dcplSuSvReSvRecSu(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplSuSvReSvRecSu(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplSuSvReSvRecSu(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MSu2(i1),MSvRe2(i2),dMSu2(i1,iv1),dMSvRe2(i2,iv1)     & 
& ,dMSu2(i1,iv2),dMSvRe2(i2,iv2),ddMSu2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(30)=results2(30) + coeff*temp
results2_ti(30)=results2_ti(30) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(30).eq.results2(30)))  write(*,*) 'NaN at SS C[Su, SvRe, SvRe, conj[Su]]' 
! ---- SvIm,SvIm ----
Do i1=1,9
 Do i2=1,9
coup1 = cplSvImSvImSvImSvIm(i1,i1,i2,i2)
Di_coup1 = dcplSvImSvImSvImSvIm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplSvImSvImSvImSvIm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplSvImSvImSvImSvIm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSvIm2(i1),MSvIm2(i2),dMSvIm2(i1,iv1),dMSvIm2(i2,iv1) & 
& ,dMSvIm2(i1,iv2),dMSvIm2(i2,iv2),ddMSvIm2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2)             & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp/8._dp)
results2(31)=results2(31) + coeff*temp
results2_ti(31)=results2_ti(31) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(31).eq.results2(31)))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvIm, SvIm]' 
! ---- SvIm,SvRe ----
Do i1=1,9
 Do i2=1,9
coup1 = cplSvImSvImSvReSvRe(i1,i1,i2,i2)
Di_coup1 = dcplSvImSvImSvReSvRe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplSvImSvImSvReSvRe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplSvImSvImSvReSvRe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSvIm2(i1),MSvRe2(i2),dMSvIm2(i1,iv1),dMSvRe2(i2,iv1) & 
& ,dMSvIm2(i1,iv2),dMSvRe2(i2,iv2),ddMSvIm2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2)             & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(32)=results2(32) + coeff*temp
results2_ti(32)=results2_ti(32) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(32).eq.results2(32)))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvRe, SvRe]' 
! ---- SvRe,SvRe ----
Do i1=1,9
 Do i2=1,9
coup1 = cplSvReSvReSvReSvRe(i1,i1,i2,i2)
Di_coup1 = dcplSvReSvReSvReSvRe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplSvReSvReSvReSvRe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplSvReSvReSvReSvRe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSvRe2(i1),MSvRe2(i2),dMSvRe2(i1,iv1),dMSvRe2(i2,iv1) & 
& ,dMSvRe2(i1,iv2),dMSvRe2(i2,iv2),ddMSvRe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2)             & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp/8._dp)
results2(33)=results2(33) + coeff*temp
results2_ti(33)=results2_ti(33) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(33).eq.results2(33)))  write(*,*) 'NaN at SS C[SvRe, SvRe, SvRe, SvRe]' 

! ----- diagrams of type VS, 2 ------ 

! ---- Sd,VG ----
Do i1=1,6
coup1 = cplSdcSdVGVG(i1,i1)
Di_coup1 = dcplSdcSdVGVG(i1,i1,iv1)
Dj_coup1 = dcplSdcSdVGVG(i1,i1,iv2)
DDcoup1 = ddcplSdcSdVGVG(i1,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(0._dp,MSd2(i1),ZeroC,dMSd2(i1,iv1),ZeroC,dMSd2(i1,iv2)& 
& ,ZeroC,ddMSd2(i1,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'VS',Q2,temp,temp_ti,temp_tj)
coeff = 0._dp
results2(34)=results2(34) + coeff*temp
results2_ti(34)=results2_ti(34) + coeff*temp_ti
End Do
if (.not.(results2(34).eq.results2(34)))  write(*,*) 'NaN at VS C[Sd, VG, VG, conj[Sd]]' 
! ---- Su,VG ----
Do i1=1,6
coup1 = cplSucSuVGVG(i1,i1)
Di_coup1 = dcplSucSuVGVG(i1,i1,iv1)
Dj_coup1 = dcplSucSuVGVG(i1,i1,iv2)
DDcoup1 = ddcplSucSuVGVG(i1,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(0._dp,MSu2(i1),ZeroC,dMSu2(i1,iv1),ZeroC,dMSu2(i1,iv2)& 
& ,ZeroC,ddMSu2(i1,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'VS',Q2,temp,temp_ti,temp_tj)
coeff = 0._dp
results2(35)=results2(35) + coeff*temp
results2_ti(35)=results2_ti(35) + coeff*temp_ti
End Do
if (.not.(results2(35).eq.results2(35)))  write(*,*) 'NaN at VS C[Su, VG, VG, conj[Su]]' 

  result = sum(results1)+sum(results2) ! 2nd deriv. of V
  result_ti = sum(results1_ti)+sum(results2_ti) ! 1st deriv. of V
  pi2L(iv1,iv2) = oo16pi2**2 * Real(result,dp) 
  End Do 
  ti2L(iv1) = oo16pi2**2 * Real(result_ti,dp) 
End Do 
Do iv1=1,3
  Do iv2=1,iv1-1
  pi2L(iv1,iv2) = pi2L(iv2,iv1) 
  End Do 
End Do 
End Subroutine SecondDerivativeEffPot2Loop 





Subroutine FirstDerivativeEffPot2Loop(vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,           & 
& Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,mx2,M1,M2,M3,kont,ti2L)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Integer, Intent(inout):: kont
Real(dp), Intent(out) :: ti2L(3)
Integer :: i,i1,i2,i3,includeGhosts,NrContr 
Integer :: iv1, iv2 
Integer :: NrContr1,NrContr2 !nr of contributing diagrams
Real(dp) :: Q2,colorfactor,coeff,coeffbar
Complex(dp) :: result,temp,tempbar
Complex(dp) :: coup1,coup2,coup1L,coup1R,coup2L,coup2R,coupx,coupxbar
Complex(dp) :: dcoup1,dcoup2,dcoup1L,dcoup1R,dcoup2L,dcoup2R,dcoupx,dcoupxbar
Real(dp) :: gout(106350) 
Real(dp) :: results1(54),results2(35)
Complex(dp) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),            & 
& cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),            & 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),     & 
& cplHpmSvRecSe(2,9,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),    & 
& cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),           & 
& cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),cplAhAhSdcSd(3,3,6,6),& 
& cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,9,9),cplAhAhSvReSvRe(3,3,9,9),& 
& cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),& 
& cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,9,9),cplhhhhSvReSvRe(3,3,9,9),               & 
& cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),          & 
& cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,9,9,2),cplHpmSvReSvRecHpm(2,9,9,2),      & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvImSvImcSe(6,9,9,6),cplSeSvReSvRecSe(6,9,9,6),cplSuSucSucSu(6,6,6,6),            & 
& cplSuSvImSvImcSu(6,9,9,6),cplSuSvReSvRecSu(6,9,9,6),cplSvImSvImSvImSvIm(9,9,9,9),      & 
& cplSvImSvImSvReSvRe(9,9,9,9),cplSvReSvReSvReSvRe(9,9,9,9),cplSdcSdVGVG(6,6),           & 
& cplSucSuVGVG(6,6)

Complex(dp) :: dcplAhAhAh(3,3,3,3),dcplAhAhhh(3,3,3,3),dcplAhhhhh(3,3,3,3),dcplAhHpmcHpm(3,2,2,3),   & 
& dcplAhSdcSd(3,6,6,3),dcplAhSecSe(3,6,6,3),dcplAhSucSu(3,6,6,3),dcplAhSvImSvIm(3,9,9,3),& 
& dcplAhSvImSvRe(3,9,9,3),dcplAhSvReSvRe(3,9,9,3),dcplhhhhhh(3,3,3,3),dcplhhHpmcHpm(3,2,2,3),& 
& dcplhhSdcSd(3,6,6,3),dcplhhSecSe(3,6,6,3),dcplhhSucSu(3,6,6,3),dcplhhSvImSvIm(3,9,9,3),& 
& dcplhhSvImSvRe(3,9,9,3),dcplhhSvReSvRe(3,9,9,3),dcplHpmSucSd(2,6,6,3),dcplHpmSvImcSe(2,9,6,3),& 
& dcplHpmSvRecSe(2,9,6,3),dcplSdcHpmcSu(6,2,6,3),dcplSeSvImcHpm(6,9,2,3),dcplSeSvRecHpm(6,9,2,3),& 
& dcplSdcSdVG(6,6,3),dcplSucSuVG(6,6,3),dcplVGVGVG(3),dcplcChaChaAhL(2,2,3,3),           & 
& dcplcChaChaAhR(2,2,3,3),dcplChiChiAhL(5,5,3,3),dcplChiChiAhR(5,5,3,3),dcplcFdFdAhL(3,3,3,3),& 
& dcplcFdFdAhR(3,3,3,3),dcplcFeFeAhL(3,3,3,3),dcplcFeFeAhR(3,3,3,3),dcplcFuFuAhL(3,3,3,3),& 
& dcplcFuFuAhR(3,3,3,3),dcplFvFvAhL(9,9,3,3),dcplFvFvAhR(9,9,3,3),dcplChiChacHpmL(5,2,2,3),& 
& dcplChiChacHpmR(5,2,2,3),dcplChaFucSdL(2,3,6,3),dcplChaFucSdR(2,3,6,3),dcplFvChacSeL(9,2,6,3),& 
& dcplFvChacSeR(9,2,6,3),dcplcChaChahhL(2,2,3,3),dcplcChaChahhR(2,2,3,3),dcplcFdChaSuL(3,2,6,3),& 
& dcplcFdChaSuR(3,2,6,3),dcplcFeChaSvImL(3,2,9,3),dcplcFeChaSvImR(3,2,9,3),              & 
& dcplcFeChaSvReL(3,2,9,3),dcplcFeChaSvReR(3,2,9,3),dcplChiChihhL(5,5,3,3),              & 
& dcplChiChihhR(5,5,3,3),dcplChiFdcSdL(5,3,6,3),dcplChiFdcSdR(5,3,6,3),dcplChiFecSeL(5,3,6,3),& 
& dcplChiFecSeR(5,3,6,3),dcplChiFucSuL(5,3,6,3),dcplChiFucSuR(5,3,6,3),dcplChiFvSvImL(5,9,9,3),& 
& dcplChiFvSvImR(5,9,9,3),dcplChiFvSvReL(5,9,9,3),dcplChiFvSvReR(5,9,9,3),               & 
& dcplcChaChiHpmL(2,5,2,3),dcplcChaChiHpmR(2,5,2,3),dcplcFdChiSdL(3,5,6,3),              & 
& dcplcFdChiSdR(3,5,6,3),dcplcFeChiSeL(3,5,6,3),dcplcFeChiSeR(3,5,6,3),dcplcFuChiSuL(3,5,6,3),& 
& dcplcFuChiSuR(3,5,6,3),dcplGluFdcSdL(3,6,3),dcplGluFdcSdR(3,6,3),dcplcFdFdhhL(3,3,3,3),& 
& dcplcFdFdhhR(3,3,3,3),dcplcChaFdcSuL(2,3,6,3),dcplcChaFdcSuR(2,3,6,3),dcplcFuFdcHpmL(3,3,2,3),& 
& dcplcFuFdcHpmR(3,3,2,3),dcplFvFecHpmL(9,3,2,3),dcplFvFecHpmR(9,3,2,3),dcplcFeFehhL(3,3,3,3),& 
& dcplcFeFehhR(3,3,3,3),dcplcChaFeSvImL(2,3,9,3),dcplcChaFeSvImR(2,3,9,3),               & 
& dcplcChaFeSvReL(2,3,9,3),dcplcChaFeSvReR(2,3,9,3),dcplGluFucSuL(3,6,3),dcplGluFucSuR(3,6,3),& 
& dcplcFuFuhhL(3,3,3,3),dcplcFuFuhhR(3,3,3,3),dcplcFdFuHpmL(3,3,2,3),dcplcFdFuHpmR(3,3,2,3),& 
& dcplFvFvhhL(9,9,3,3),dcplFvFvhhR(9,9,3,3),dcplcFeFvHpmL(3,9,2,3),dcplcFeFvHpmR(3,9,2,3),& 
& dcplcChaFvSeL(2,9,6,3),dcplcChaFvSeR(2,9,6,3),dcplcFdGluSdL(3,6,3),dcplcFdGluSdR(3,6,3),& 
& dcplcFuGluSuL(3,6,3),dcplcFuGluSuR(3,6,3),dcplcChacFuSdL(2,3,6,3),dcplcChacFuSdR(2,3,6,3),& 
& dcplcFdFdVGL(3,3,3),dcplcFdFdVGR(3,3,3),dcplcFuFuVGL(3,3,3),dcplcFuFuVGR(3,3,3),       & 
& dcplGluGluVGL(3),dcplGluGluVGR(3)

Complex(dp) :: dcplAhAhAhAh(3,3,3,3,3),dcplAhAhhhhh(3,3,3,3,3),dcplAhAhHpmcHpm(3,3,2,2,3),           & 
& dcplAhAhSdcSd(3,3,6,6,3),dcplAhAhSecSe(3,3,6,6,3),dcplAhAhSucSu(3,3,6,6,3),            & 
& dcplAhAhSvImSvIm(3,3,9,9,3),dcplAhAhSvReSvRe(3,3,9,9,3),dcplhhhhhhhh(3,3,3,3,3),       & 
& dcplhhhhHpmcHpm(3,3,2,2,3),dcplhhhhSdcSd(3,3,6,6,3),dcplhhhhSecSe(3,3,6,6,3),          & 
& dcplhhhhSucSu(3,3,6,6,3),dcplhhhhSvImSvIm(3,3,9,9,3),dcplhhhhSvReSvRe(3,3,9,9,3),      & 
& dcplHpmHpmcHpmcHpm(2,2,2,2,3),dcplHpmSdcHpmcSd(2,6,2,6,3),dcplHpmSecHpmcSe(2,6,2,6,3), & 
& dcplHpmSucHpmcSu(2,6,2,6,3),dcplHpmSvImSvImcHpm(2,9,9,2,3),dcplHpmSvReSvRecHpm(2,9,9,2,3),& 
& dcplSdSdcSdcSd(6,6,6,6,3),dcplSdSecSdcSe(6,6,6,6,3),dcplSdSucSdcSu(6,6,6,6,3),         & 
& dcplSeSecSecSe(6,6,6,6,3),dcplSeSvImSvImcSe(6,9,9,6,3),dcplSeSvReSvRecSe(6,9,9,6,3),   & 
& dcplSuSucSucSu(6,6,6,6,3),dcplSuSvImSvImcSu(6,9,9,6,3),dcplSuSvReSvRecSu(6,9,9,6,3),   & 
& dcplSvImSvImSvImSvIm(9,9,9,9,3),dcplSvImSvImSvReSvRe(9,9,9,9,3),dcplSvReSvReSvReSvRe(9,9,9,9,3),& 
& dcplSdcSdVGVG(6,6,3),dcplSucSuVGVG(6,6,3)

Real(dp) :: MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MSu(6),MSu2(6),MSe(6),           & 
& MSe2(6),Mhh(3),Mhh2(3),MAh(3),MAh2(3),MHpm(2),MHpm2(2),MChi(5),MChi2(5),               & 
& MFv(9),MFv2(9),MCha(2),MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2

Complex(dp) :: dMSd(6,3),dMSd2(6,3),dMSvIm(9,3),dMSvIm2(9,3),dMSvRe(9,3),dMSvRe2(9,3),               & 
& dMSu(6,3),dMSu2(6,3),dMSe(6,3),dMSe2(6,3),dMhh(3,3),dMhh2(3,3),dMAh(3,3),              & 
& dMAh2(3,3),dMHpm(2,3),dMHpm2(2,3),dMChi(5,3),dMChi2(5,3),dMFv(9,3),dMFv2(9,3),         & 
& dMCha(2,3),dMCha2(2,3),dMFe(3,3),dMFe2(3,3),dMFd(3,3),dMFd2(3,3),dMFu(3,3),            & 
& dMFu2(3,3),dMGlu(1,3),dMGlu2(1,3),dMVZ(1,3),dMVZ2(1,3),dMVWm(1,3),dMVWm2(1,3)

!! ------------------------------------------------- 
!! Calculate masses, couplings and their derivatives 
!! ------------------------------------------------- 

Do i1=1,3
Call FirstDerivativeMassesCoups(i1,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,              & 
& Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,mx2,M1,M2,M3,gout)

Call GToMassesCoups(gout,MSd,MSd2,MSvIm,MSvIm2,MSvRe,MSvRe2,MSu,MSu2,MSe,             & 
& MSe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,             & 
& MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,        & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,   & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,      & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,              & 
& cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,      & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,         & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,             & 
& cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,            & 
& cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,         & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

dMSd(:,i1) = MSd
dMSd2(:,i1) = MSd2
dMSvIm(:,i1) = MSvIm
dMSvIm2(:,i1) = MSvIm2
dMSvRe(:,i1) = MSvRe
dMSvRe2(:,i1) = MSvRe2
dMSu(:,i1) = MSu
dMSu2(:,i1) = MSu2
dMSe(:,i1) = MSe
dMSe2(:,i1) = MSe2
dMhh(:,i1) = Mhh
dMhh2(:,i1) = Mhh2
dMAh(:,i1) = MAh
dMAh2(:,i1) = MAh2
dMHpm(:,i1) = MHpm
dMHpm2(:,i1) = MHpm2
dMChi(:,i1) = MChi
dMChi2(:,i1) = MChi2
dMFv(:,i1) = MFv
dMFv2(:,i1) = MFv2
dMCha(:,i1) = MCha
dMCha2(:,i1) = MCha2
dMFe(:,i1) = MFe
dMFe2(:,i1) = MFe2
dMFd(:,i1) = MFd
dMFd2(:,i1) = MFd2
dMFu(:,i1) = MFu
dMFu2(:,i1) = MFu2
dMGlu(:,i1) = MGlu
dMGlu2(:,i1) = MGlu2
dMVZ(:,i1) = MVZ
dMVZ2(:,i1) = MVZ2
dMVWm(:,i1) = MVWm
dMVWm2(:,i1) = MVWm2
dcplAhAhAh(:,:,:,i1) = cplAhAhAh
dcplAhAhhh(:,:,:,i1) = cplAhAhhh
dcplAhhhhh(:,:,:,i1) = cplAhhhhh
dcplAhHpmcHpm(:,:,:,i1) = cplAhHpmcHpm
dcplAhSdcSd(:,:,:,i1) = cplAhSdcSd
dcplAhSecSe(:,:,:,i1) = cplAhSecSe
dcplAhSucSu(:,:,:,i1) = cplAhSucSu
dcplAhSvImSvIm(:,:,:,i1) = cplAhSvImSvIm
dcplAhSvImSvRe(:,:,:,i1) = cplAhSvImSvRe
dcplAhSvReSvRe(:,:,:,i1) = cplAhSvReSvRe
dcplhhhhhh(:,:,:,i1) = cplhhhhhh
dcplhhHpmcHpm(:,:,:,i1) = cplhhHpmcHpm
dcplhhSdcSd(:,:,:,i1) = cplhhSdcSd
dcplhhSecSe(:,:,:,i1) = cplhhSecSe
dcplhhSucSu(:,:,:,i1) = cplhhSucSu
dcplhhSvImSvIm(:,:,:,i1) = cplhhSvImSvIm
dcplhhSvImSvRe(:,:,:,i1) = cplhhSvImSvRe
dcplhhSvReSvRe(:,:,:,i1) = cplhhSvReSvRe
dcplHpmSucSd(:,:,:,i1) = cplHpmSucSd
dcplHpmSvImcSe(:,:,:,i1) = cplHpmSvImcSe
dcplHpmSvRecSe(:,:,:,i1) = cplHpmSvRecSe
dcplSdcHpmcSu(:,:,:,i1) = cplSdcHpmcSu
dcplSeSvImcHpm(:,:,:,i1) = cplSeSvImcHpm
dcplSeSvRecHpm(:,:,:,i1) = cplSeSvRecHpm
dcplSdcSdVG(:,:,i1) = cplSdcSdVG
dcplSucSuVG(:,:,i1) = cplSucSuVG
dcplVGVGVG(i1) = cplVGVGVG
dcplcChaChaAhL(:,:,:,i1) = cplcChaChaAhL
dcplcChaChaAhR(:,:,:,i1) = cplcChaChaAhR
dcplChiChiAhL(:,:,:,i1) = cplChiChiAhL
dcplChiChiAhR(:,:,:,i1) = cplChiChiAhR
dcplcFdFdAhL(:,:,:,i1) = cplcFdFdAhL
dcplcFdFdAhR(:,:,:,i1) = cplcFdFdAhR
dcplcFeFeAhL(:,:,:,i1) = cplcFeFeAhL
dcplcFeFeAhR(:,:,:,i1) = cplcFeFeAhR
dcplcFuFuAhL(:,:,:,i1) = cplcFuFuAhL
dcplcFuFuAhR(:,:,:,i1) = cplcFuFuAhR
dcplFvFvAhL(:,:,:,i1) = cplFvFvAhL
dcplFvFvAhR(:,:,:,i1) = cplFvFvAhR
dcplChiChacHpmL(:,:,:,i1) = cplChiChacHpmL
dcplChiChacHpmR(:,:,:,i1) = cplChiChacHpmR
dcplChaFucSdL(:,:,:,i1) = cplChaFucSdL
dcplChaFucSdR(:,:,:,i1) = cplChaFucSdR
dcplFvChacSeL(:,:,:,i1) = cplFvChacSeL
dcplFvChacSeR(:,:,:,i1) = cplFvChacSeR
dcplcChaChahhL(:,:,:,i1) = cplcChaChahhL
dcplcChaChahhR(:,:,:,i1) = cplcChaChahhR
dcplcFdChaSuL(:,:,:,i1) = cplcFdChaSuL
dcplcFdChaSuR(:,:,:,i1) = cplcFdChaSuR
dcplcFeChaSvImL(:,:,:,i1) = cplcFeChaSvImL
dcplcFeChaSvImR(:,:,:,i1) = cplcFeChaSvImR
dcplcFeChaSvReL(:,:,:,i1) = cplcFeChaSvReL
dcplcFeChaSvReR(:,:,:,i1) = cplcFeChaSvReR
dcplChiChihhL(:,:,:,i1) = cplChiChihhL
dcplChiChihhR(:,:,:,i1) = cplChiChihhR
dcplChiFdcSdL(:,:,:,i1) = cplChiFdcSdL
dcplChiFdcSdR(:,:,:,i1) = cplChiFdcSdR
dcplChiFecSeL(:,:,:,i1) = cplChiFecSeL
dcplChiFecSeR(:,:,:,i1) = cplChiFecSeR
dcplChiFucSuL(:,:,:,i1) = cplChiFucSuL
dcplChiFucSuR(:,:,:,i1) = cplChiFucSuR
dcplChiFvSvImL(:,:,:,i1) = cplChiFvSvImL
dcplChiFvSvImR(:,:,:,i1) = cplChiFvSvImR
dcplChiFvSvReL(:,:,:,i1) = cplChiFvSvReL
dcplChiFvSvReR(:,:,:,i1) = cplChiFvSvReR
dcplcChaChiHpmL(:,:,:,i1) = cplcChaChiHpmL
dcplcChaChiHpmR(:,:,:,i1) = cplcChaChiHpmR
dcplcFdChiSdL(:,:,:,i1) = cplcFdChiSdL
dcplcFdChiSdR(:,:,:,i1) = cplcFdChiSdR
dcplcFeChiSeL(:,:,:,i1) = cplcFeChiSeL
dcplcFeChiSeR(:,:,:,i1) = cplcFeChiSeR
dcplcFuChiSuL(:,:,:,i1) = cplcFuChiSuL
dcplcFuChiSuR(:,:,:,i1) = cplcFuChiSuR
dcplGluFdcSdL(:,:,i1) = cplGluFdcSdL
dcplGluFdcSdR(:,:,i1) = cplGluFdcSdR
dcplcFdFdhhL(:,:,:,i1) = cplcFdFdhhL
dcplcFdFdhhR(:,:,:,i1) = cplcFdFdhhR
dcplcChaFdcSuL(:,:,:,i1) = cplcChaFdcSuL
dcplcChaFdcSuR(:,:,:,i1) = cplcChaFdcSuR
dcplcFuFdcHpmL(:,:,:,i1) = cplcFuFdcHpmL
dcplcFuFdcHpmR(:,:,:,i1) = cplcFuFdcHpmR
dcplFvFecHpmL(:,:,:,i1) = cplFvFecHpmL
dcplFvFecHpmR(:,:,:,i1) = cplFvFecHpmR
dcplcFeFehhL(:,:,:,i1) = cplcFeFehhL
dcplcFeFehhR(:,:,:,i1) = cplcFeFehhR
dcplcChaFeSvImL(:,:,:,i1) = cplcChaFeSvImL
dcplcChaFeSvImR(:,:,:,i1) = cplcChaFeSvImR
dcplcChaFeSvReL(:,:,:,i1) = cplcChaFeSvReL
dcplcChaFeSvReR(:,:,:,i1) = cplcChaFeSvReR
dcplGluFucSuL(:,:,i1) = cplGluFucSuL
dcplGluFucSuR(:,:,i1) = cplGluFucSuR
dcplcFuFuhhL(:,:,:,i1) = cplcFuFuhhL
dcplcFuFuhhR(:,:,:,i1) = cplcFuFuhhR
dcplcFdFuHpmL(:,:,:,i1) = cplcFdFuHpmL
dcplcFdFuHpmR(:,:,:,i1) = cplcFdFuHpmR
dcplFvFvhhL(:,:,:,i1) = cplFvFvhhL
dcplFvFvhhR(:,:,:,i1) = cplFvFvhhR
dcplcFeFvHpmL(:,:,:,i1) = cplcFeFvHpmL
dcplcFeFvHpmR(:,:,:,i1) = cplcFeFvHpmR
dcplcChaFvSeL(:,:,:,i1) = cplcChaFvSeL
dcplcChaFvSeR(:,:,:,i1) = cplcChaFvSeR
dcplcFdGluSdL(:,:,i1) = cplcFdGluSdL
dcplcFdGluSdR(:,:,i1) = cplcFdGluSdR
dcplcFuGluSuL(:,:,i1) = cplcFuGluSuL
dcplcFuGluSuR(:,:,i1) = cplcFuGluSuR
dcplcChacFuSdL(:,:,:,i1) = cplcChacFuSdL
dcplcChacFuSdR(:,:,:,i1) = cplcChacFuSdR
dcplcFdFdVGL(:,:,i1) = cplcFdFdVGL
dcplcFdFdVGR(:,:,i1) = cplcFdFdVGR
dcplcFuFuVGL(:,:,i1) = cplcFuFuVGL
dcplcFuFuVGR(:,:,i1) = cplcFuFuVGR
dcplGluGluVGL(i1) = cplGluGluVGL
dcplGluGluVGR(i1) = cplGluGluVGR
dcplAhAhAhAh(:,:,:,:,i1) = cplAhAhAhAh
dcplAhAhhhhh(:,:,:,:,i1) = cplAhAhhhhh
dcplAhAhHpmcHpm(:,:,:,:,i1) = cplAhAhHpmcHpm
dcplAhAhSdcSd(:,:,:,:,i1) = cplAhAhSdcSd
dcplAhAhSecSe(:,:,:,:,i1) = cplAhAhSecSe
dcplAhAhSucSu(:,:,:,:,i1) = cplAhAhSucSu
dcplAhAhSvImSvIm(:,:,:,:,i1) = cplAhAhSvImSvIm
dcplAhAhSvReSvRe(:,:,:,:,i1) = cplAhAhSvReSvRe
dcplhhhhhhhh(:,:,:,:,i1) = cplhhhhhhhh
dcplhhhhHpmcHpm(:,:,:,:,i1) = cplhhhhHpmcHpm
dcplhhhhSdcSd(:,:,:,:,i1) = cplhhhhSdcSd
dcplhhhhSecSe(:,:,:,:,i1) = cplhhhhSecSe
dcplhhhhSucSu(:,:,:,:,i1) = cplhhhhSucSu
dcplhhhhSvImSvIm(:,:,:,:,i1) = cplhhhhSvImSvIm
dcplhhhhSvReSvRe(:,:,:,:,i1) = cplhhhhSvReSvRe
dcplHpmHpmcHpmcHpm(:,:,:,:,i1) = cplHpmHpmcHpmcHpm
dcplHpmSdcHpmcSd(:,:,:,:,i1) = cplHpmSdcHpmcSd
dcplHpmSecHpmcSe(:,:,:,:,i1) = cplHpmSecHpmcSe
dcplHpmSucHpmcSu(:,:,:,:,i1) = cplHpmSucHpmcSu
dcplHpmSvImSvImcHpm(:,:,:,:,i1) = cplHpmSvImSvImcHpm
dcplHpmSvReSvRecHpm(:,:,:,:,i1) = cplHpmSvReSvRecHpm
dcplSdSdcSdcSd(:,:,:,:,i1) = cplSdSdcSdcSd
dcplSdSecSdcSe(:,:,:,:,i1) = cplSdSecSdcSe
dcplSdSucSdcSu(:,:,:,:,i1) = cplSdSucSdcSu
dcplSeSecSecSe(:,:,:,:,i1) = cplSeSecSecSe
dcplSeSvImSvImcSe(:,:,:,:,i1) = cplSeSvImSvImcSe
dcplSeSvReSvRecSe(:,:,:,:,i1) = cplSeSvReSvRecSe
dcplSuSucSucSu(:,:,:,:,i1) = cplSuSucSucSu
dcplSuSvImSvImcSu(:,:,:,:,i1) = cplSuSvImSvImcSu
dcplSuSvReSvRecSu(:,:,:,:,i1) = cplSuSvReSvRecSu
dcplSvImSvImSvImSvIm(:,:,:,:,i1) = cplSvImSvImSvImSvIm
dcplSvImSvImSvReSvRe(:,:,:,:,i1) = cplSvImSvImSvReSvRe
dcplSvReSvReSvReSvRe(:,:,:,:,i1) = cplSvReSvReSvReSvRe
dcplSdcSdVGVG(:,:,i1) = cplSdcSdVGVG
dcplSucSuVGVG(:,:,i1) = cplSucSuVGVG
End Do 
 
Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,              & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,.True.,kont)

Call CouplingsForEffPot3(lam,Tlam,kap,Tk,vd,vu,vS,ZA,ZH,ZP,Yd,Td,ZD,Ye,               & 
& Te,ZE,Yu,Tu,ZU,MUX,lamN,TLN,Yv,Tv,ZVI,ZVR,g3,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,ZUL,             & 
& ZUR,UV,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,            & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,      & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,              & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,          & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsForEffPot4(lam,kap,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,ZU,lamN,Yv,ZVI,              & 
& ZVR,g3,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,               & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)



!! ------------------------------------------------- 
!! Calculate derivative of effective potential      
!! ------------------------------------------------- 



Q2 = getRenormalizationScale()
ti2L = 0._dp
result = ZeroC
results1 = ZeroC
results2 = ZeroC
Do iv1=1,3
! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices

! ----- diagrams of type SSS, 21 ------ 
! ---- Ah,Ah,Ah ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplAhAhAh(i1,i2,i3)
coup2 = cplAhAhAh(i1,i2,i3)
dcoup1 = dcplAhAhAh(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MAh2(i2),MAh2(i3),dMAh2(i1,iv1)             & 
& ,dMAh2(i2,iv1),dMAh2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp/12._dp
colorfactor = 1
results1(1)=results1(1) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Ah, Ah]' 
    End Do
  End Do
End Do
! ---- Ah,Ah,hh ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplAhAhhh(i1,i2,i3)
coup2 = cplAhAhhh(i1,i2,i3)
dcoup1 = dcplAhAhhh(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MAh2(i2),Mhh2(i3),dMAh2(i1,iv1)             & 
& ,dMAh2(i2,iv1),dMhh2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(2)=results1(2) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Ah, hh]' 
    End Do
  End Do
End Do
! ---- Ah,hh,hh ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplAhhhhh(i1,i2,i3)
coup2 = cplAhhhhh(i1,i2,i3)
dcoup1 = dcplAhhhhh(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),Mhh2(i2),Mhh2(i3),dMAh2(i1,iv1)             & 
& ,dMhh2(i2,iv1),dMhh2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(3)=results1(3) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, hh, hh]' 
    End Do
  End Do
End Do
! ---- Ah,Hpm,conj[Hpm] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,2
coup1 = cplAhHpmcHpm(i1,i2,i3)
coup2 = cplAhHpmcHpm(i1,i3,i2)
dcoup1 = dcplAhHpmcHpm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MHpm2(i2),MHpm2(i3),dMAh2(i1,iv1)           & 
& ,dMHpm2(i2,iv1),dMHpm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(4)=results1(4) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Hpm, conj[Hpm]]' 
    End Do
  End Do
End Do
! ---- Ah,Sd,conj[Sd] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSdcSd(i1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
dcoup1 = dcplAhSdcSd(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSd2(i2),MSd2(i3),dMAh2(i1,iv1)             & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(5)=results1(5) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
! ---- Ah,Se,conj[Se] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSecSe(i1,i2,i3)
coup2 = cplAhSecSe(i1,i3,i2)
dcoup1 = dcplAhSecSe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSe2(i2),MSe2(i3),dMAh2(i1,iv1)             & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(6)=results1(6) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Se, conj[Se]]' 
    End Do
  End Do
End Do
! ---- Ah,Su,conj[Su] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSucSu(i1,i2,i3)
coup2 = cplAhSucSu(i1,i3,i2)
dcoup1 = dcplAhSucSu(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSu2(i2),MSu2(i3),dMAh2(i1,iv1)             & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(7)=results1(7) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Su, conj[Su]]' 
    End Do
  End Do
End Do
! ---- Ah,SvIm,SvIm ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplAhSvImSvIm(i1,i2,i3)
coup2 = cplAhSvImSvIm(i1,i2,i3)
dcoup1 = dcplAhSvImSvIm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSvIm2(i2),MSvIm2(i3),dMAh2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMSvIm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(8)=results1(8) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvIm]' 
    End Do
  End Do
End Do
! ---- Ah,SvIm,SvRe ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplAhSvImSvRe(i1,i2,i3)
coup2 = cplAhSvImSvRe(i1,i2,i3)
dcoup1 = dcplAhSvImSvRe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSvIm2(i2),MSvRe2(i3),dMAh2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(9)=results1(9) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvRe]' 
    End Do
  End Do
End Do
! ---- Ah,SvRe,SvRe ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplAhSvReSvRe(i1,i2,i3)
coup2 = cplAhSvReSvRe(i1,i2,i3)
dcoup1 = dcplAhSvReSvRe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSvRe2(i2),MSvRe2(i3),dMAh2(i1,iv1)         & 
& ,dMSvRe2(i2,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(10)=results1(10) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvRe, SvRe]' 
    End Do
  End Do
End Do
! ---- hh,hh,hh ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1 = cplhhhhhh(i1,i2,i3)
coup2 = cplhhhhhh(i1,i2,i3)
dcoup1 = dcplhhhhhh(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),Mhh2(i2),Mhh2(i3),dMhh2(i1,iv1)             & 
& ,dMhh2(i2,iv1),dMhh2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp/12._dp
colorfactor = 1
results1(11)=results1(11) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, hh, hh]' 
    End Do
  End Do
End Do
! ---- hh,Hpm,conj[Hpm] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,2
coup1 = cplhhHpmcHpm(i1,i2,i3)
coup2 = cplhhHpmcHpm(i1,i3,i2)
dcoup1 = dcplhhHpmcHpm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MHpm2(i2),MHpm2(i3),dMhh2(i1,iv1)           & 
& ,dMHpm2(i2,iv1),dMHpm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(12)=results1(12) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Hpm, conj[Hpm]]' 
    End Do
  End Do
End Do
! ---- hh,Sd,conj[Sd] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSdcSd(i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
dcoup1 = dcplhhSdcSd(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSd2(i2),MSd2(i3),dMhh2(i1,iv1)             & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(13)=results1(13) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
! ---- hh,Se,conj[Se] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSecSe(i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
dcoup1 = dcplhhSecSe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSe2(i2),MSe2(i3),dMhh2(i1,iv1)             & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(14)=results1(14) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Se, conj[Se]]' 
    End Do
  End Do
End Do
! ---- hh,Su,conj[Su] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSucSu(i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
dcoup1 = dcplhhSucSu(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSu2(i2),MSu2(i3),dMhh2(i1,iv1)             & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(15)=results1(15) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Su, conj[Su]]' 
    End Do
  End Do
End Do
! ---- hh,SvIm,SvIm ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplhhSvImSvIm(i1,i2,i3)
coup2 = cplhhSvImSvIm(i1,i2,i3)
dcoup1 = dcplhhSvImSvIm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSvIm2(i2),MSvIm2(i3),dMhh2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMSvIm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(16)=results1(16) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvIm, SvIm]' 
    End Do
  End Do
End Do
! ---- hh,SvIm,SvRe ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplhhSvImSvRe(i1,i2,i3)
coup2 = cplhhSvImSvRe(i1,i2,i3)
dcoup1 = dcplhhSvImSvRe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSvIm2(i2),MSvRe2(i3),dMhh2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(17)=results1(17) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvIm, SvRe]' 
    End Do
  End Do
End Do
! ---- hh,SvRe,SvRe ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1 = cplhhSvReSvRe(i1,i2,i3)
coup2 = cplhhSvReSvRe(i1,i2,i3)
dcoup1 = dcplhhSvReSvRe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSvRe2(i2),MSvRe2(i3),dMhh2(i1,iv1)         & 
& ,dMSvRe2(i2,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(18)=results1(18) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvRe, SvRe]' 
    End Do
  End Do
End Do
! ---- Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSdcHpmcSu(i1,i2,i3)
coup2 = cplHpmSucSd(i2,i3,i1)
dcoup1 = dcplSdcHpmcSu(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSd2(i1),MHpm2(i2),MSu2(i3),dMSd2(i1,iv1)            & 
& ,dMHpm2(i2,iv1),dMSu2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp
colorfactor = 3
results1(19)=results1(19) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Sd, conj[Hpm], conj[Su]]' 
    End Do
  End Do
End Do
! ---- Se,SvIm,conj[Hpm] ----
Do i1=1,6
 Do i2=1,9
    Do i3=1,2
coup1 = cplSeSvImcHpm(i1,i2,i3)
coup2 = cplHpmSvImcSe(i3,i2,i1)
dcoup1 = dcplSeSvImcHpm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSe2(i1),MSvIm2(i2),MHpm2(i3),dMSe2(i1,iv1)          & 
& ,dMSvIm2(i2,iv1),dMHpm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp
colorfactor = 1
results1(20)=results1(20) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, SvIm, conj[Hpm]]' 
    End Do
  End Do
End Do
! ---- Se,SvRe,conj[Hpm] ----
Do i1=1,6
 Do i2=1,9
    Do i3=1,2
coup1 = cplSeSvRecHpm(i1,i2,i3)
coup2 = cplHpmSvRecSe(i3,i2,i1)
dcoup1 = dcplSeSvRecHpm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSe2(i1),MSvRe2(i2),MHpm2(i3),dMSe2(i1,iv1)          & 
& ,dMSvRe2(i2,iv1),dMHpm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp
colorfactor = 1
results1(21)=results1(21) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, SvRe, conj[Hpm]]' 
    End Do
  End Do
End Do
! ----- diagrams of type FFS, 27 ------ 
! ---- Ah,Cha,bar[Cha] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChaAhL(i3,i2,i1)
coup1R = cplcChaChaAhR(i3,i2,i1)
coup2L = cplcChaChaAhL(i2,i3,i1)
coup2R = cplcChaChaAhR(i2,i3,i1)
dcoup1L = dcplcChaChaAhL(i3,i2,i1,iv1)
dcoup1R = dcplcChaChaAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MCha2(i2),MAh2(i1),dMCha2(i3,iv1)          & 
& ,dMCha2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MCha2(i2),MAh2(i1),dMCha2(i3,iv1)          & 
& ,dMCha2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(22)=results1(22) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Cha, bar[Cha]]' 
coeffbar = 0.5_dp
results1(22)=results1(22) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Chi,Chi ----
Do i1=1,3
 Do i2=1,5
    Do i3=1,5
coup1L = cplChiChiAhL(i2,i3,i1)
coup1R = cplChiChiAhR(i2,i3,i1)
coup2L = cplChiChiAhL(i2,i3,i1)
coup2R = cplChiChiAhR(i2,i3,i1)
dcoup1L = dcplChiChiAhL(i2,i3,i1,iv1)
dcoup1R = dcplChiChiAhR(i2,i3,i1,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MChi2(i3),MChi2(i2),MAh2(i1),dMChi2(i3,iv1)          & 
& ,dMChi2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MChi2(i3),MChi2(i2),MAh2(i1),dMChi2(i3,iv1)          & 
& ,dMChi2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(23)=results1(23) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Chi, Chi]' 
coeffbar = 0.5_dp
results1(23)=results1(23) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fd,bar[Fd] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdAhL(i3,i2,i1)
coup1R = cplcFdFdAhR(i3,i2,i1)
coup2L = cplcFdFdAhL(i2,i3,i1)
coup2R = cplcFdFdAhR(i2,i3,i1)
dcoup1L = dcplcFdFdAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFdFdAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)             & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)             & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(24)=results1(24) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fd, bar[Fd]]' 
coeffbar = 0.5_dp
results1(24)=results1(24) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fe,bar[Fe] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFeAhL(i3,i2,i1)
coup1R = cplcFeFeAhR(i3,i2,i1)
coup2L = cplcFeFeAhL(i2,i3,i1)
coup2R = cplcFeFeAhR(i2,i3,i1)
dcoup1L = dcplcFeFeAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFeFeAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)             & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)             & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(25)=results1(25) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fe, bar[Fe]]' 
coeffbar = 0.5_dp
results1(25)=results1(25) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fu,bar[Fu] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuAhL(i3,i2,i1)
coup1R = cplcFuFuAhR(i3,i2,i1)
coup2L = cplcFuFuAhL(i2,i3,i1)
coup2R = cplcFuFuAhR(i2,i3,i1)
dcoup1L = dcplcFuFuAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFuFuAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)             & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)             & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(26)=results1(26) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fu, bar[Fu]]' 
coeffbar = 0.5_dp
results1(26)=results1(26) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fv,Fv ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,9
coup1L = cplFvFvAhL(i2,i3,i1)
coup1R = cplFvFvAhR(i2,i3,i1)
coup2L = cplFvFvAhL(i2,i3,i1)
coup2R = cplFvFvAhR(i2,i3,i1)
dcoup1L = dcplFvFvAhL(i2,i3,i1,iv1)
dcoup1R = dcplFvFvAhR(i2,i3,i1,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)             & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)             & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(27)=results1(27) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fv, Fv]' 
coeffbar = 0.5_dp
results1(27)=results1(27) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Cha,hh,bar[Cha] ----
Do i1=1,2
 Do i2=1,3
    Do i3=1,2
coup1L = cplcChaChahhL(i3,i1,i2)
coup1R = cplcChaChahhR(i3,i1,i2)
coup2L = cplcChaChahhL(i1,i3,i2)
coup2R = cplcChaChahhR(i1,i3,i2)
dcoup1L = dcplcChaChahhL(i3,i1,i2,iv1)
dcoup1R = dcplcChaChahhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MCha2(i1),Mhh2(i2),dMCha2(i3,iv1)          & 
& ,dMCha2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MCha2(i1),Mhh2(i2),dMCha2(i3,iv1)          & 
& ,dMCha2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(28)=results1(28) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Cha, hh, bar[Cha]]' 
coeffbar = 0.5_dp
results1(28)=results1(28) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Chi,hh ----
Do i1=1,5
 Do i2=1,5
    Do i3=1,3
coup1L = cplChiChihhL(i1,i2,i3)
coup1R = cplChiChihhR(i1,i2,i3)
coup2L = cplChiChihhL(i1,i2,i3)
coup2R = cplChiChihhR(i1,i2,i3)
dcoup1L = dcplChiChihhL(i1,i2,i3,iv1)
dcoup1R = dcplChiChihhR(i1,i2,i3,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MChi2(i2),MChi2(i1),Mhh2(i3),dMChi2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMhh2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MChi2(i2),MChi2(i1),Mhh2(i3),dMChi2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMhh2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(29)=results1(29) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Chi, hh]' 
coeffbar = 0.5_dp
results1(29)=results1(29) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Fv,SvIm ----
Do i1=1,5
 Do i2=1,9
    Do i3=1,9
coup1L = cplChiFvSvImL(i1,i2,i3)
coup1R = cplChiFvSvImR(i1,i2,i3)
coup2L = cplChiFvSvImL(i1,i2,i3)
coup2R = cplChiFvSvImR(i1,i2,i3)
dcoup1L = dcplChiFvSvImL(i1,i2,i3,iv1)
dcoup1R = dcplChiFvSvImR(i1,i2,i3,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvIm2(i3),dMFv2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMSvIm2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvIm2(i3),dMFv2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMSvIm2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(30)=results1(30) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Fv, SvIm]' 
coeffbar = 1._dp
results1(30)=results1(30) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Fv,SvRe ----
Do i1=1,5
 Do i2=1,9
    Do i3=1,9
coup1L = cplChiFvSvReL(i1,i2,i3)
coup1R = cplChiFvSvReR(i1,i2,i3)
coup2L = cplChiFvSvReL(i1,i2,i3)
coup2R = cplChiFvSvReR(i1,i2,i3)
dcoup1L = dcplChiFvSvReL(i1,i2,i3,iv1)
dcoup1R = dcplChiFvSvReR(i1,i2,i3,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvRe2(i3),dMFv2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvRe2(i3),dMFv2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMSvRe2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(31)=results1(31) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Fv, SvRe]' 
coeffbar = 1._dp
results1(31)=results1(31) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Hpm,bar[Cha] ----
Do i1=1,5
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChiHpmL(i3,i1,i2)
coup1R = cplcChaChiHpmR(i3,i1,i2)
coup2L = cplChiChacHpmL(i1,i3,i2)
coup2R = cplChiChacHpmR(i1,i3,i2)
dcoup1L = dcplcChaChiHpmL(i3,i1,i2,iv1)
dcoup1R = dcplcChaChiHpmR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MChi2(i1),MHpm2(i2),dMCha2(i3,iv1)         & 
& ,dMChi2(i1,iv1),dMHpm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MChi2(i1),MHpm2(i2),dMCha2(i3,iv1)         & 
& ,dMChi2(i1,iv1),dMHpm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(32)=results1(32) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Hpm, bar[Cha]]' 
coeffbar = 1._dp
results1(32)=results1(32) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Sd,bar[Fd] ----
Do i1=1,5
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdChiSdL(i3,i1,i2)
coup1R = cplcFdChiSdR(i3,i1,i2)
coup2L = cplChiFdcSdL(i1,i3,i2)
coup2R = cplChiFdcSdR(i1,i3,i2)
dcoup1L = dcplcFdChiSdL(i3,i1,i2,iv1)
dcoup1R = dcplcFdChiSdR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(33)=results1(33) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Sd, bar[Fd]]' 
coeffbar = 1._dp
results1(33)=results1(33) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Se,bar[Fe] ----
Do i1=1,5
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeChiSeL(i3,i1,i2)
coup1R = cplcFeChiSeR(i3,i1,i2)
coup2L = cplChiFecSeL(i1,i3,i2)
coup2R = cplChiFecSeR(i1,i3,i2)
dcoup1L = dcplcFeChiSeL(i3,i1,i2,iv1)
dcoup1R = dcplcFeChiSeR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(34)=results1(34) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Se, bar[Fe]]' 
coeffbar = 1._dp
results1(34)=results1(34) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Su,bar[Fu] ----
Do i1=1,5
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuChiSuL(i3,i1,i2)
coup1R = cplcFuChiSuR(i3,i1,i2)
coup2L = cplChiFucSuL(i1,i3,i2)
coup2R = cplChiFucSuR(i1,i3,i2)
dcoup1L = dcplcFuChiSuL(i3,i1,i2,iv1)
dcoup1R = dcplcFuChiSuR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(35)=results1(35) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Su, bar[Fu]]' 
coeffbar = 1._dp
results1(35)=results1(35) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fd,hh,bar[Fd] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdhhL(i3,i1,i2)
coup1R = cplcFdFdhhR(i3,i1,i2)
coup2L = cplcFdFdhhL(i1,i3,i2)
coup2R = cplcFdFdhhR(i1,i3,i2)
dcoup1L = dcplcFdFdhhL(i3,i1,i2,iv1)
dcoup1R = dcplcFdFdhhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)             & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)             & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(36)=results1(36) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, hh, bar[Fd]]' 
coeffbar = 0.5_dp
results1(36)=results1(36) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fd,bar[Cha],conj[Su] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFdcSuL(i2,i1,i3)
coup1R = cplcChaFdcSuR(i2,i1,i3)
coup2L = cplcFdChaSuL(i1,i2,i3)
coup2R = cplcFdChaSuR(i1,i2,i3)
dcoup1L = dcplcChaFdcSuL(i2,i1,i3,iv1)
dcoup1R = dcplcChaFdcSuR(i2,i1,i3,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)           & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)           & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(37)=results1(37) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, bar[Cha], conj[Su]]' 
coeffbar = 1._dp
results1(37)=results1(37) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fe,hh,bar[Fe] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFehhL(i3,i1,i2)
coup1R = cplcFeFehhR(i3,i1,i2)
coup2L = cplcFeFehhL(i1,i3,i2)
coup2R = cplcFeFehhR(i1,i3,i2)
dcoup1L = dcplcFeFehhL(i3,i1,i2,iv1)
dcoup1R = dcplcFeFehhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)             & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)             & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(38)=results1(38) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, hh, bar[Fe]]' 
coeffbar = 0.5_dp
results1(38)=results1(38) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fe,SvIm,bar[Cha] ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,2
coup1L = cplcChaFeSvImL(i3,i1,i2)
coup1R = cplcChaFeSvImR(i3,i1,i2)
coup2L = cplcFeChaSvImL(i1,i3,i2)
coup2R = cplcFeChaSvImR(i1,i3,i2)
dcoup1L = dcplcChaFeSvImL(i3,i1,i2,iv1)
dcoup1R = dcplcChaFeSvImR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvIm2(i2),dMCha2(i3,iv1)         & 
& ,dMFe2(i1,iv1),dMSvIm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvIm2(i2),dMCha2(i3,iv1)         & 
& ,dMFe2(i1,iv1),dMSvIm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(39)=results1(39) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, SvIm, bar[Cha]]' 
coeffbar = 1._dp
results1(39)=results1(39) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fe,SvRe,bar[Cha] ----
Do i1=1,3
 Do i2=1,9
    Do i3=1,2
coup1L = cplcChaFeSvReL(i3,i1,i2)
coup1R = cplcChaFeSvReR(i3,i1,i2)
coup2L = cplcFeChaSvReL(i1,i3,i2)
coup2R = cplcFeChaSvReR(i1,i3,i2)
dcoup1L = dcplcChaFeSvReL(i3,i1,i2,iv1)
dcoup1R = dcplcChaFeSvReR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvRe2(i2),dMCha2(i3,iv1)         & 
& ,dMFe2(i1,iv1),dMSvRe2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvRe2(i2),dMCha2(i3,iv1)         & 
& ,dMFe2(i1,iv1),dMSvRe2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(40)=results1(40) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, SvRe, bar[Cha]]' 
coeffbar = 1._dp
results1(40)=results1(40) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fu,hh,bar[Fu] ----
Do i1=1,3
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuhhL(i3,i1,i2)
coup1R = cplcFuFuhhR(i3,i1,i2)
coup2L = cplcFuFuhhL(i1,i3,i2)
coup2R = cplcFuFuhhR(i1,i3,i2)
dcoup1L = dcplcFuFuhhL(i3,i1,i2,iv1)
dcoup1R = dcplcFuFuhhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)             & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)             & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(41)=results1(41) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, hh, bar[Fu]]' 
coeffbar = 0.5_dp
results1(41)=results1(41) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fu,Hpm,bar[Fd] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFdFuHpmL(i3,i1,i2)
coup1R = cplcFdFuHpmR(i3,i1,i2)
coup2L = cplcFuFdcHpmL(i1,i3,i2)
coup2R = cplcFuFdcHpmR(i1,i3,i2)
dcoup1L = dcplcFdFuHpmL(i3,i1,i2,iv1)
dcoup1R = dcplcFdFuHpmR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(42)=results1(42) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, Hpm, bar[Fd]]' 
coeffbar = 1._dp
results1(42)=results1(42) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fv,Fv,hh ----
Do i1=1,9
 Do i2=1,9
    Do i3=1,3
coup1L = cplFvFvhhL(i1,i2,i3)
coup1R = cplFvFvhhR(i1,i2,i3)
coup2L = cplFvFvhhL(i1,i2,i3)
coup2R = cplFvFvhhR(i1,i2,i3)
dcoup1L = dcplFvFvhhL(i1,i2,i3,iv1)
dcoup1R = dcplFvFvhhR(i1,i2,i3,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i2),MFv2(i1),Mhh2(i3),dMFv2(i2,iv1)             & 
& ,dMFv2(i1,iv1),dMhh2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i2),MFv2(i1),Mhh2(i3),dMFv2(i2,iv1)             & 
& ,dMFv2(i1,iv1),dMhh2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(43)=results1(43) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Fv, hh]' 
coeffbar = 0.5_dp
results1(43)=results1(43) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fv,Hpm,bar[Fe] ----
Do i1=1,9
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFeFvHpmL(i3,i1,i2)
coup1R = cplcFeFvHpmR(i3,i1,i2)
coup2L = cplFvFecHpmL(i1,i3,i2)
coup2R = cplFvFecHpmR(i1,i3,i2)
dcoup1L = dcplcFeFvHpmL(i3,i1,i2,iv1)
dcoup1R = dcplcFeFvHpmR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)            & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)            & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(44)=results1(44) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Hpm, bar[Fe]]' 
coeffbar = 1._dp
results1(44)=results1(44) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fv,Se,bar[Cha] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFvSeL(i3,i1,i2)
coup1R = cplcChaFvSeR(i3,i1,i2)
coup2L = cplFvChacSeL(i1,i3,i2)
coup2R = cplFvChacSeR(i1,i3,i2)
dcoup1L = dcplcChaFvSeL(i3,i1,i2,iv1)
dcoup1R = dcplcChaFvSeR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFv2(i1),MSe2(i2),dMCha2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMSe2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFv2(i1),MSe2(i2),dMCha2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMSe2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(45)=results1(45) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Se, bar[Cha]]' 
coeffbar = 1._dp
results1(45)=results1(45) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Glu,Sd,bar[Fd] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdGluSdL(i3,i2)
coup1R = cplcFdGluSdR(i3,i2)
coup2L = cplGluFdcSdL(i3,i2)
coup2R = cplGluFdcSdR(i3,i2)
dcoup1L = dcplcFdGluSdL(i3,i2,iv1)
dcoup1R = dcplcFdGluSdR(i3,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSd2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSd2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 4
results1(46)=results1(46) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Sd, bar[Fd]]' 
coeffbar = 1._dp
results1(46)=results1(46) + coeffbar*colorfactor*tempbar
    End Do
  End Do
! ---- Glu,Su,bar[Fu] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuGluSuL(i3,i2)
coup1R = cplcFuGluSuR(i3,i2)
coup2L = cplGluFucSuL(i3,i2)
coup2R = cplGluFucSuR(i3,i2)
dcoup1L = dcplcFuGluSuL(i3,i2,iv1)
dcoup1R = dcplcFuGluSuR(i3,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSu2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSu2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 4
results1(47)=results1(47) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Su, bar[Fu]]' 
coeffbar = 1._dp
results1(47)=results1(47) + coeffbar*colorfactor*tempbar
    End Do
  End Do
! ---- Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFuSdL(i2,i3,i1)
coup1R = cplcChacFuSdR(i2,i3,i1)
coup2L = cplChaFucSdL(i2,i3,i1)
coup2R = cplChaFucSdR(i2,i3,i1)
dcoup1L = dcplcChacFuSdL(i2,i3,i1,iv1)
dcoup1R = dcplcChacFuSdR(i2,i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)            & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)            & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(48)=results1(48) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Sd, bar[Cha], bar[Fu]]' 
coeffbar = 1._dp
results1(48)=results1(48) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ----- diagrams of type SSV, 2 ------ 
! ---- Sd,VG,conj[Sd] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSdcSdVG(i1,i3)
coup2 = cplSdcSdVG(i3,i1)
dcoup1 = dcplSdcSdVG(i1,i3,iv1)
coupx=abs(coup1)**2
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSd2(i3),MSd2(i1),0._dp,dMSd2(i3,iv1),dMSd2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'SSV   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(49)=results1(49) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Sd, VG, conj[Sd]]' 
    End Do
End Do
! ---- Su,VG,conj[Su] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSucSuVG(i1,i3)
coup2 = cplSucSuVG(i3,i1)
dcoup1 = dcplSucSuVG(i1,i3,iv1)
coupx=abs(coup1)**2
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSu2(i3),MSu2(i1),0._dp,dMSu2(i3,iv1),dMSu2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'SSV   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(50)=results1(50) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Su, VG, conj[Su]]' 
    End Do
End Do
! ----- diagrams of type FFV, 3 ------ 
! ---- Fd,VG,bar[Fd] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFdFdVGL(i3,i1)
coup1R = cplcFdFdVGR(i3,i1)
coup2L = cplcFdFdVGL(i1,i3)
coup2R = cplcFdFdVGR(i1,i3)
dcoup1L = dcplcFdFdVGL(i3,i1,iv1)
dcoup1R = dcplcFdFdVGR(i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=-2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=-2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1),dMFd2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'FFV   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1),dMFd2(i1,iv1)  & 
& ,ZeroC,coupxbar,dcoupxbar,'FFVbar',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(51)=results1(51) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fd, VG, bar[Fd]]' 
coeffbar = 0.5_dp
results1(51)=results1(51) + coeffbar*colorfactor*tempbar
    End Do
End Do
! ---- Fu,VG,bar[Fu] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFuFuVGL(i3,i1)
coup1R = cplcFuFuVGR(i3,i1)
coup2L = cplcFuFuVGL(i1,i3)
coup2R = cplcFuFuVGR(i1,i3)
dcoup1L = dcplcFuFuVGL(i3,i1,iv1)
dcoup1R = dcplcFuFuVGR(i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=-2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=-2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1),dMFu2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'FFV   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1),dMFu2(i1,iv1)  & 
& ,ZeroC,coupxbar,dcoupxbar,'FFVbar',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(52)=results1(52) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fu, VG, bar[Fu]]' 
coeffbar = 0.5_dp
results1(52)=results1(52) + coeffbar*colorfactor*tempbar
    End Do
End Do
! ---- Glu,Glu,VG ----
coup1L = cplGluGluVGL
coup1R = cplGluGluVGR
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
dcoup1L = dcplGluGluVGL(iv1)
dcoup1R = dcplGluGluVGR(iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)        & 
& ,ZeroC,coupx,dcoupx,'FFV   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)        & 
& ,ZeroC,coupxbar,dcoupxbar,'FFVbar',Q2,temp)
coeff = 0.5_dp
colorfactor = 24
results1(53)=results1(53) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Glu, Glu, VG]' 
coeffbar = 0.5_dp
results1(53)=results1(53) + coeffbar*colorfactor*tempbar
! ----- diagrams of type VVV, 1 ------ 
! ---- VG,VG,VG ----
coup1 = cplVGVGVG
coup2 = cplVGVGVG
dcoup1 = dcplVGVGVG(iv1)
coeff = 0.0000
colorfactor = 24
results1(54)=results1(54) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VVV C[VG, VG, VG]' 
! ----- Topology2: diagrams w. 2 Particles and 1 Vertex

! ----- diagrams of type SS, 33 ------ 
! ---- Ah,Ah ----
Do i1=1,3
 Do i2=1,3
coup1 = cplAhAhAhAh(i1,i1,i2,i2)
dcoup1 = dcplAhAhAhAh(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MAh2(i2),dMAh2(i1,iv1),dMAh2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp/8._dp)
results2(1)=results2(1) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Ah, Ah]' 
  End Do
End Do
! ---- Ah,hh ----
Do i1=1,3
 Do i2=1,3
coup1 = cplAhAhhhhh(i1,i1,i2,i2)
dcoup1 = dcplAhAhhhhh(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),Mhh2(i2),dMAh2(i1,iv1),dMhh2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(2)=results2(2) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, hh, hh]' 
  End Do
End Do
! ---- Ah,Hpm ----
Do i1=1,3
 Do i2=1,2
coup1 = cplAhAhHpmcHpm(i1,i1,i2,i2)
dcoup1 = dcplAhAhHpmcHpm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MHpm2(i2),dMAh2(i1,iv1),dMHpm2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(3)=results2(3) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Hpm, conj[Hpm]]' 
  End Do
End Do
! ---- Ah,Sd ----
Do i1=1,3
 Do i2=1,6
coup1 = cplAhAhSdcSd(i1,i1,i2,i2)
dcoup1 = dcplAhAhSdcSd(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSd2(i2),dMAh2(i1,iv1),dMSd2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(4)=results2(4) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Sd, conj[Sd]]' 
  End Do
End Do
! ---- Ah,Se ----
Do i1=1,3
 Do i2=1,6
coup1 = cplAhAhSecSe(i1,i1,i2,i2)
dcoup1 = dcplAhAhSecSe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSe2(i2),dMAh2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(5)=results2(5) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Se, conj[Se]]' 
  End Do
End Do
! ---- Ah,Su ----
Do i1=1,3
 Do i2=1,6
coup1 = cplAhAhSucSu(i1,i1,i2,i2)
dcoup1 = dcplAhAhSucSu(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSu2(i2),dMAh2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(6)=results2(6) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Su, conj[Su]]' 
  End Do
End Do
! ---- Ah,SvIm ----
Do i1=1,3
 Do i2=1,9
coup1 = cplAhAhSvImSvIm(i1,i1,i2,i2)
dcoup1 = dcplAhAhSvImSvIm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSvIm2(i2),dMAh2(i1,iv1),dMSvIm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(7)=results2(7) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, SvIm, SvIm]' 
  End Do
End Do
! ---- Ah,SvRe ----
Do i1=1,3
 Do i2=1,9
coup1 = cplAhAhSvReSvRe(i1,i1,i2,i2)
dcoup1 = dcplAhAhSvReSvRe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSvRe2(i2),dMAh2(i1,iv1),dMSvRe2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(8)=results2(8) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, SvRe, SvRe]' 
  End Do
End Do
! ---- hh,hh ----
Do i1=1,3
 Do i2=1,3
coup1 = cplhhhhhhhh(i1,i1,i2,i2)
dcoup1 = dcplhhhhhhhh(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),Mhh2(i2),dMhh2(i1,iv1),dMhh2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp/8._dp)
results2(9)=results2(9) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, hh, hh]' 
  End Do
End Do
! ---- hh,Hpm ----
Do i1=1,3
 Do i2=1,2
coup1 = cplhhhhHpmcHpm(i1,i1,i2,i2)
dcoup1 = dcplhhhhHpmcHpm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MHpm2(i2),dMhh2(i1,iv1),dMHpm2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(10)=results2(10) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Hpm, conj[Hpm]]' 
  End Do
End Do
! ---- hh,Sd ----
Do i1=1,3
 Do i2=1,6
coup1 = cplhhhhSdcSd(i1,i1,i2,i2)
dcoup1 = dcplhhhhSdcSd(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSd2(i2),dMhh2(i1,iv1),dMSd2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(11)=results2(11) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Sd, conj[Sd]]' 
  End Do
End Do
! ---- hh,Se ----
Do i1=1,3
 Do i2=1,6
coup1 = cplhhhhSecSe(i1,i1,i2,i2)
dcoup1 = dcplhhhhSecSe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSe2(i2),dMhh2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(12)=results2(12) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Se, conj[Se]]' 
  End Do
End Do
! ---- hh,Su ----
Do i1=1,3
 Do i2=1,6
coup1 = cplhhhhSucSu(i1,i1,i2,i2)
dcoup1 = dcplhhhhSucSu(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSu2(i2),dMhh2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(13)=results2(13) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Su, conj[Su]]' 
  End Do
End Do
! ---- hh,SvIm ----
Do i1=1,3
 Do i2=1,9
coup1 = cplhhhhSvImSvIm(i1,i1,i2,i2)
dcoup1 = dcplhhhhSvImSvIm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSvIm2(i2),dMhh2(i1,iv1),dMSvIm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(14)=results2(14) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, SvIm, SvIm]' 
  End Do
End Do
! ---- hh,SvRe ----
Do i1=1,3
 Do i2=1,9
coup1 = cplhhhhSvReSvRe(i1,i1,i2,i2)
dcoup1 = dcplhhhhSvReSvRe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSvRe2(i2),dMhh2(i1,iv1),dMSvRe2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(15)=results2(15) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, SvRe, SvRe]' 
  End Do
End Do
! ---- Hpm,Hpm ----
Do i1=1,2
 Do i2=1,2
coup1 = cplHpmHpmcHpmcHpm(i1,i2,i1,i2)
dcoup1 = dcplHpmHpmcHpmcHpm(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MHpm2(i2),dMHpm2(i1,iv1),dMHpm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(16)=results2(16) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Hpm, conj[Hpm], conj[Hpm]]' 
  End Do
End Do
! ---- Hpm,Sd ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSdcHpmcSd(i1,i2,i1,i2)
dcoup1 = dcplHpmSdcHpmcSd(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSd2(i2),dMHpm2(i1,iv1),dMSd2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(17)=results2(17) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Sd, conj[Hpm], conj[Sd]]' 
  End Do
End Do
! ---- Hpm,Se ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSecHpmcSe(i1,i2,i1,i2)
dcoup1 = dcplHpmSecHpmcSe(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSe2(i2),dMHpm2(i1,iv1),dMSe2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(18)=results2(18) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Se, conj[Hpm], conj[Se]]' 
  End Do
End Do
! ---- Hpm,Su ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSucHpmcSu(i1,i2,i1,i2)
dcoup1 = dcplHpmSucHpmcSu(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSu2(i2),dMHpm2(i1,iv1),dMSu2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(19)=results2(19) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Su, conj[Hpm], conj[Su]]' 
  End Do
End Do
! ---- Hpm,SvIm ----
Do i1=1,2
 Do i2=1,9
coup1 = cplHpmSvImSvImcHpm(i1,i2,i2,i1)
dcoup1 = dcplHpmSvImSvImcHpm(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSvIm2(i2),dMHpm2(i1,iv1),dMSvIm2(i2,iv1)    & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(20)=results2(20) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, SvIm, SvIm, conj[Hpm]]' 
  End Do
End Do
! ---- Hpm,SvRe ----
Do i1=1,2
 Do i2=1,9
coup1 = cplHpmSvReSvRecHpm(i1,i2,i2,i1)
dcoup1 = dcplHpmSvReSvRecHpm(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSvRe2(i2),dMHpm2(i1,iv1),dMSvRe2(i2,iv1)    & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(21)=results2(21) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, SvRe, SvRe, conj[Hpm]]' 
  End Do
End Do
! ---- Sd,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSdcSdcSd(i1,i2,i1,i2)
dcoup1 = dcplSdSdcSdcSd(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSd2(i1),MSd2(i2),dMSd2(i1,iv1),dMSd2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(22)=results2(22) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Sd, conj[Sd], conj[Sd]]' 
  End Do
End Do
! ---- Sd,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSecSdcSe(i1,i2,i1,i2)
dcoup1 = dcplSdSecSdcSe(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSd2(i1),MSe2(i2),dMSd2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(23)=results2(23) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Se, conj[Sd], conj[Se]]' 
  End Do
End Do
! ---- Sd,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSucSdcSu(i1,i2,i1,i2)
dcoup1 = dcplSdSucSdcSu(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSd2(i1),MSu2(i2),dMSd2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(24)=results2(24) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Su, conj[Sd], conj[Su]]' 
  End Do
End Do
! ---- Se,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSecSecSe(i1,i2,i1,i2)
dcoup1 = dcplSeSecSecSe(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSe2(i1),MSe2(i2),dMSe2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(25)=results2(25) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, Se, conj[Se], conj[Se]]' 
  End Do
End Do
! ---- Se,SvIm ----
Do i1=1,6
 Do i2=1,9
coup1 = cplSeSvImSvImcSe(i1,i2,i2,i1)
dcoup1 = dcplSeSvImSvImcSe(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MSe2(i1),MSvIm2(i2),dMSe2(i1,iv1),dMSvIm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(26)=results2(26) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, SvIm, SvIm, conj[Se]]' 
  End Do
End Do
! ---- Se,SvRe ----
Do i1=1,6
 Do i2=1,9
coup1 = cplSeSvReSvRecSe(i1,i2,i2,i1)
dcoup1 = dcplSeSvReSvRecSe(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MSe2(i1),MSvRe2(i2),dMSe2(i1,iv1),dMSvRe2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(27)=results2(27) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, SvRe, SvRe, conj[Se]]' 
  End Do
End Do
! ---- Su,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSucSucSu(i1,i2,i1,i2)
dcoup1 = dcplSuSucSucSu(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSu2(i1),MSu2(i2),dMSu2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(28)=results2(28) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, Su, conj[Su], conj[Su]]' 
  End Do
End Do
! ---- Su,SvIm ----
Do i1=1,6
 Do i2=1,9
coup1 = cplSuSvImSvImcSu(i1,i2,i2,i1)
dcoup1 = dcplSuSvImSvImcSu(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MSu2(i1),MSvIm2(i2),dMSu2(i1,iv1),dMSvIm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(29)=results2(29) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, SvIm, SvIm, conj[Su]]' 
  End Do
End Do
! ---- Su,SvRe ----
Do i1=1,6
 Do i2=1,9
coup1 = cplSuSvReSvRecSu(i1,i2,i2,i1)
dcoup1 = dcplSuSvReSvRecSu(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MSu2(i1),MSvRe2(i2),dMSu2(i1,iv1),dMSvRe2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(30)=results2(30) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, SvRe, SvRe, conj[Su]]' 
  End Do
End Do
! ---- SvIm,SvIm ----
Do i1=1,9
 Do i2=1,9
coup1 = cplSvImSvImSvImSvIm(i1,i1,i2,i2)
dcoup1 = dcplSvImSvImSvImSvIm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MSvIm2(i1),MSvIm2(i2),dMSvIm2(i1,iv1),dMSvIm2(i2,iv1)  & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp/8._dp)
results2(31)=results2(31) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvIm, SvIm]' 
  End Do
End Do
! ---- SvIm,SvRe ----
Do i1=1,9
 Do i2=1,9
coup1 = cplSvImSvImSvReSvRe(i1,i1,i2,i2)
dcoup1 = dcplSvImSvImSvReSvRe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MSvIm2(i1),MSvRe2(i2),dMSvIm2(i1,iv1),dMSvRe2(i2,iv1)  & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(32)=results2(32) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvRe, SvRe]' 
  End Do
End Do
! ---- SvRe,SvRe ----
Do i1=1,9
 Do i2=1,9
coup1 = cplSvReSvReSvReSvRe(i1,i1,i2,i2)
dcoup1 = dcplSvReSvReSvReSvRe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MSvRe2(i1),MSvRe2(i2),dMSvRe2(i1,iv1),dMSvRe2(i2,iv1)  & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp/8._dp)
results2(33)=results2(33) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvRe, SvRe, SvRe, SvRe]' 
  End Do
End Do
! ----- diagrams of type VS, 2 ------ 
! ---- Sd,VG ----
Do i1=1,6
coup1 = cplSdcSdVGVG(i1,i1)
dcoup1 = dcplSdcSdVGVG(i1,i1,iv1)
Call FirstDerivativeVeff_balls(0._dp,MSd2(i1),ZeroC,dMSd2(i1,iv1),coup1,dcoup1,'VS',Q2,temp)
coeff = 0._dp
results2(34)=results2(34) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Sd, VG, VG, conj[Sd]]' 
End Do
! ---- Su,VG ----
Do i1=1,6
coup1 = cplSucSuVGVG(i1,i1)
dcoup1 = dcplSucSuVGVG(i1,i1,iv1)
Call FirstDerivativeVeff_balls(0._dp,MSu2(i1),ZeroC,dMSu2(i1,iv1),coup1,dcoup1,'VS',Q2,temp)
coeff = 0._dp
results2(35)=results2(35) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Su, VG, VG, conj[Su]]' 
End Do
result = sum(results1)+sum(results2) 


 
ti2L(iv1) = oo16pi2**2 * Real(result,dp) 
End Do 
End Subroutine FirstDerivativeEffPot2Loop 


Subroutine SecondDerivativeMassesCoups(i1,i2,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,gout)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Real(dp), Intent(out) :: gout(:) 
Real(dp) :: err, vevs(3) 
Integer :: iout 
Integer, Intent(in) :: i1,i2 
vevs = (/vd,vu,vS/) 
gout = partialDiffXY_RiddersMulDim(AllMassesCouplings,106350,vevs,i1,i2,3,err) 
If (err.gt.err2L) err2L = err 
End Subroutine SecondDerivativeMassesCoups

Subroutine FirstDerivativeMassesCoups(i1,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,             & 
& lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,             & 
& mv2,ms2,mx2,M1,M2,M3,gout)

Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Real(dp), Intent(out) :: gout(:) 
Real(dp) :: err, vevs(3) 
Integer :: iout 
Integer, Intent(in) :: i1 
vevs = (/vd,vu,vS/) 
gout = partialDiff_RiddersMulDim(AllMassesCouplings,106350,vevs,i1,3,err) 
If (err.gt.err2L) err2L = err 
End Subroutine FirstDerivativeMassesCoups

Subroutine AllMassesCouplings(vevs,gout) 
Implicit None 
Real(dp), Intent(out) :: gout(106350) 
Real(dp), Intent(in) :: vevs(3) 
Integer :: kont 
Real(dp) :: vd,vu,vS

Complex(dp) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),            & 
& cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),            & 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),     & 
& cplHpmSvRecSe(2,9,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),    & 
& cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),           & 
& cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),cplAhAhSdcSd(3,3,6,6),& 
& cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,9,9),cplAhAhSvReSvRe(3,3,9,9),& 
& cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),& 
& cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,9,9),cplhhhhSvReSvRe(3,3,9,9),               & 
& cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),          & 
& cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,9,9,2),cplHpmSvReSvRecHpm(2,9,9,2),      & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvImSvImcSe(6,9,9,6),cplSeSvReSvRecSe(6,9,9,6),cplSuSucSucSu(6,6,6,6),            & 
& cplSuSvImSvImcSu(6,9,9,6),cplSuSvReSvRecSu(6,9,9,6),cplSvImSvImSvImSvIm(9,9,9,9),      & 
& cplSvImSvImSvReSvRe(9,9,9,9),cplSvReSvReSvReSvRe(9,9,9,9),cplSdcSdVGVG(6,6),           & 
& cplSucSuVGVG(6,6)

Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),              & 
& MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),ZVR(9,9),ZW(2,2)

vd=vevs(1) 
vu=vevs(2) 
vS=vevs(3) 
Call WrapperForDerivatives(vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,            & 
& Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,             & 
& M2,M3,gout)

End Subroutine 

Subroutine WrapperForDerivatives(vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,             & 
& Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,             & 
& mx2,M1,M2,M3,gout)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Real(dp), Intent(out) :: gout(:) 
Integer :: kont 
Real(dp) :: MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MSu(6),MSu2(6),MSe(6),           & 
& MSe2(6),Mhh(3),Mhh2(3),MAh(3),MAh2(3),MHpm(2),MHpm2(2),MChi(5),MChi2(5),               & 
& MFv(9),MFv2(9),MCha(2),MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2

Complex(dp) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),            & 
& cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),            & 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),     & 
& cplHpmSvRecSe(2,9,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),    & 
& cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),           & 
& cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),cplAhAhSdcSd(3,3,6,6),& 
& cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,9,9),cplAhAhSvReSvRe(3,3,9,9),& 
& cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),& 
& cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,9,9),cplhhhhSvReSvRe(3,3,9,9),               & 
& cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),          & 
& cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,9,9,2),cplHpmSvReSvRecHpm(2,9,9,2),      & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvImSvImcSe(6,9,9,6),cplSeSvReSvRecSe(6,9,9,6),cplSuSucSucSu(6,6,6,6),            & 
& cplSuSvImSvImcSu(6,9,9,6),cplSuSvReSvRecSu(6,9,9,6),cplSvImSvImSvImSvIm(9,9,9,9),      & 
& cplSvImSvImSvReSvRe(9,9,9,9),cplSvReSvReSvReSvRe(9,9,9,9),cplSdcSdVGVG(6,6),           & 
& cplSucSuVGVG(6,6)

Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,              & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,.True.,kont)

Call CouplingsForEffPot3(lam,Tlam,kap,Tk,vd,vu,vS,ZA,ZH,ZP,Yd,Td,ZD,Ye,               & 
& Te,ZE,Yu,Tu,ZU,MUX,lamN,TLN,Yv,Tv,ZVI,ZVR,g3,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,ZUL,             & 
& ZUR,UV,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,            & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,      & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,              & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,          & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsForEffPot4(lam,kap,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,ZU,lamN,Yv,ZVI,              & 
& ZVR,g3,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,               & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

Call MassesCoupsToG(MSd,MSd2,MSvIm,MSvIm2,MSvRe,MSvRe2,MSu,MSu2,MSe,MSe2,             & 
& Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MFd,              & 
& MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,            & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,   & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,      & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,              & 
& cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,      & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,         & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,             & 
& cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,            & 
& cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,         & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG,gout)

End Subroutine WrapperForDerivatives

Subroutine MassesCoupsToG(MSd,MSd2,MSvIm,MSvIm2,MSvRe,MSvRe2,MSu,MSu2,MSe,            & 
& MSe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,             & 
& MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,        & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,   & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,      & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,              & 
& cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,      & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,         & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,             & 
& cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,            & 
& cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,         & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG,g)

Implicit None 
Real(dp), Intent(out) :: g(:) 
Integer :: i1,i2,i3,i4, sumI
Real(dp),Intent(in) :: MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MSu(6),MSu2(6),MSe(6),           & 
& MSe2(6),Mhh(3),Mhh2(3),MAh(3),MAh2(3),MHpm(2),MHpm2(2),MChi(5),MChi2(5),               & 
& MFv(9),MFv2(9),MCha(2),MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),            & 
& cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),            & 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),     & 
& cplHpmSvRecSe(2,9,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),    & 
& cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),           & 
& cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp),Intent(in) :: cplAhAhAhAh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),cplAhAhSdcSd(3,3,6,6),& 
& cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,9,9),cplAhAhSvReSvRe(3,3,9,9),& 
& cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),& 
& cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,9,9),cplhhhhSvReSvRe(3,3,9,9),               & 
& cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),          & 
& cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,9,9,2),cplHpmSvReSvRecHpm(2,9,9,2),      & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvImSvImcSe(6,9,9,6),cplSeSvReSvRecSe(6,9,9,6),cplSuSucSucSu(6,6,6,6),            & 
& cplSuSvImSvImcSu(6,9,9,6),cplSuSvReSvRecSu(6,9,9,6),cplSvImSvImSvImSvIm(9,9,9,9),      & 
& cplSvImSvImSvReSvRe(9,9,9,9),cplSvReSvReSvReSvRe(9,9,9,9),cplSdcSdVGVG(6,6),           & 
& cplSucSuVGVG(6,6)

g(1:6) = MSd
g(7:12) = MSd2
g(13:21) = MSvIm
g(22:30) = MSvIm2
g(31:39) = MSvRe
g(40:48) = MSvRe2
g(49:54) = MSu
g(55:60) = MSu2
g(61:66) = MSe
g(67:72) = MSe2
g(73:75) = Mhh
g(76:78) = Mhh2
g(79:81) = MAh
g(82:84) = MAh2
g(85:86) = MHpm
g(87:88) = MHpm2
g(89:93) = MChi
g(94:98) = MChi2
g(99:107) = MFv
g(108:116) = MFv2
g(117:118) = MCha
g(119:120) = MCha2
g(121:123) = MFe
g(124:126) = MFe2
g(127:129) = MFd
g(130:132) = MFd2
g(133:135) = MFu
g(136:138) = MFu2
g(139) = MGlu
g(140) = MGlu2
g(141) = MVZ
g(142) = MVZ2
g(143) = MVWm
g(144) = MVWm2
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+145) = Real(cplAhAhAh(i1,i2,i3), dp) 
g(SumI+146) = Aimag(cplAhAhAh(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+199) = Real(cplAhAhhh(i1,i2,i3), dp) 
g(SumI+200) = Aimag(cplAhAhhh(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+253) = Real(cplAhhhhh(i1,i2,i3), dp) 
g(SumI+254) = Aimag(cplAhhhhh(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
g(SumI+307) = Real(cplAhHpmcHpm(i1,i2,i3), dp) 
g(SumI+308) = Aimag(cplAhHpmcHpm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+331) = Real(cplAhSdcSd(i1,i2,i3), dp) 
g(SumI+332) = Aimag(cplAhSdcSd(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+547) = Real(cplAhSecSe(i1,i2,i3), dp) 
g(SumI+548) = Aimag(cplAhSecSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+763) = Real(cplAhSucSu(i1,i2,i3), dp) 
g(SumI+764) = Aimag(cplAhSucSu(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+979) = Real(cplAhSvImSvIm(i1,i2,i3), dp) 
g(SumI+980) = Aimag(cplAhSvImSvIm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+1465) = Real(cplAhSvImSvRe(i1,i2,i3), dp) 
g(SumI+1466) = Aimag(cplAhSvImSvRe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+1951) = Real(cplAhSvReSvRe(i1,i2,i3), dp) 
g(SumI+1952) = Aimag(cplAhSvReSvRe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+2437) = Real(cplhhhhhh(i1,i2,i3), dp) 
g(SumI+2438) = Aimag(cplhhhhhh(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
g(SumI+2491) = Real(cplhhHpmcHpm(i1,i2,i3), dp) 
g(SumI+2492) = Aimag(cplhhHpmcHpm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+2515) = Real(cplhhSdcSd(i1,i2,i3), dp) 
g(SumI+2516) = Aimag(cplhhSdcSd(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+2731) = Real(cplhhSecSe(i1,i2,i3), dp) 
g(SumI+2732) = Aimag(cplhhSecSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+2947) = Real(cplhhSucSu(i1,i2,i3), dp) 
g(SumI+2948) = Aimag(cplhhSucSu(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+3163) = Real(cplhhSvImSvIm(i1,i2,i3), dp) 
g(SumI+3164) = Aimag(cplhhSvImSvIm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+3649) = Real(cplhhSvImSvRe(i1,i2,i3), dp) 
g(SumI+3650) = Aimag(cplhhSvImSvRe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+4135) = Real(cplhhSvReSvRe(i1,i2,i3), dp) 
g(SumI+4136) = Aimag(cplhhSvReSvRe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+4621) = Real(cplHpmSucSd(i1,i2,i3), dp) 
g(SumI+4622) = Aimag(cplHpmSucSd(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+4765) = Real(cplHpmSvImcSe(i1,i2,i3), dp) 
g(SumI+4766) = Aimag(cplHpmSvImcSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+4981) = Real(cplHpmSvRecSe(i1,i2,i3), dp) 
g(SumI+4982) = Aimag(cplHpmSvRecSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+5197) = Real(cplSdcHpmcSu(i1,i2,i3), dp) 
g(SumI+5198) = Aimag(cplSdcHpmcSu(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
g(SumI+5341) = Real(cplSeSvImcHpm(i1,i2,i3), dp) 
g(SumI+5342) = Aimag(cplSeSvImcHpm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
g(SumI+5557) = Real(cplSeSvRecHpm(i1,i2,i3), dp) 
g(SumI+5558) = Aimag(cplSeSvRecHpm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+5773) = Real(cplSdcSdVG(i1,i2), dp) 
g(SumI+5774) = Aimag(cplSdcSdVG(i1,i2)) 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+5845) = Real(cplSucSuVG(i1,i2), dp) 
g(SumI+5846) = Aimag(cplSucSuVG(i1,i2)) 
End Do 
End Do 

g(5917) = Real(cplVGVGVG,dp)  
g(5918) = Aimag(cplVGVGVG)  
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*6
SumI = SumI*2 
g(SumI+5919) = Real(cplcChaChaAhL(i1,i2,i3), dp) 
g(SumI+5920) = Aimag(cplcChaChaAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*6
SumI = SumI*2 
g(SumI+5943) = Real(cplcChaChaAhR(i1,i2,i3), dp) 
g(SumI+5944) = Aimag(cplcChaChaAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,5
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*15
SumI = SumI*2 
g(SumI+5967) = Real(cplChiChiAhL(i1,i2,i3), dp) 
g(SumI+5968) = Aimag(cplChiChiAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,5
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*15
SumI = SumI*2 
g(SumI+6117) = Real(cplChiChiAhR(i1,i2,i3), dp) 
g(SumI+6118) = Aimag(cplChiChiAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+6267) = Real(cplcFdFdAhL(i1,i2,i3), dp) 
g(SumI+6268) = Aimag(cplcFdFdAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+6321) = Real(cplcFdFdAhR(i1,i2,i3), dp) 
g(SumI+6322) = Aimag(cplcFdFdAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+6375) = Real(cplcFeFeAhL(i1,i2,i3), dp) 
g(SumI+6376) = Aimag(cplcFeFeAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+6429) = Real(cplcFeFeAhR(i1,i2,i3), dp) 
g(SumI+6430) = Aimag(cplcFeFeAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+6483) = Real(cplcFuFuAhL(i1,i2,i3), dp) 
g(SumI+6484) = Aimag(cplcFuFuAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+6537) = Real(cplcFuFuAhR(i1,i2,i3), dp) 
g(SumI+6538) = Aimag(cplcFuFuAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*27
SumI = SumI*2 
g(SumI+6591) = Real(cplFvFvAhL(i1,i2,i3), dp) 
g(SumI+6592) = Aimag(cplFvFvAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*27
SumI = SumI*2 
g(SumI+7077) = Real(cplFvFvAhR(i1,i2,i3), dp) 
g(SumI+7078) = Aimag(cplFvFvAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
g(SumI+7563) = Real(cplChiChacHpmL(i1,i2,i3), dp) 
g(SumI+7564) = Aimag(cplChiChacHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
g(SumI+7603) = Real(cplChiChacHpmR(i1,i2,i3), dp) 
g(SumI+7604) = Aimag(cplChiChacHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+7643) = Real(cplChaFucSdL(i1,i2,i3), dp) 
g(SumI+7644) = Aimag(cplChaFucSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+7715) = Real(cplChaFucSdR(i1,i2,i3), dp) 
g(SumI+7716) = Aimag(cplChaFucSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+7787) = Real(cplFvChacSeL(i1,i2,i3), dp) 
g(SumI+7788) = Aimag(cplFvChacSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+8003) = Real(cplFvChacSeR(i1,i2,i3), dp) 
g(SumI+8004) = Aimag(cplFvChacSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*6
SumI = SumI*2 
g(SumI+8219) = Real(cplcChaChahhL(i1,i2,i3), dp) 
g(SumI+8220) = Aimag(cplcChaChahhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*6
SumI = SumI*2 
g(SumI+8243) = Real(cplcChaChahhR(i1,i2,i3), dp) 
g(SumI+8244) = Aimag(cplcChaChahhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+8267) = Real(cplcFdChaSuL(i1,i2,i3), dp) 
g(SumI+8268) = Aimag(cplcFdChaSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+8339) = Real(cplcFdChaSuR(i1,i2,i3), dp) 
g(SumI+8340) = Aimag(cplcFdChaSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*18
SumI = SumI*2 
g(SumI+8411) = Real(cplcFeChaSvImL(i1,i2,i3), dp) 
g(SumI+8412) = Aimag(cplcFeChaSvImL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*18
SumI = SumI*2 
g(SumI+8519) = Real(cplcFeChaSvImR(i1,i2,i3), dp) 
g(SumI+8520) = Aimag(cplcFeChaSvImR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*18
SumI = SumI*2 
g(SumI+8627) = Real(cplcFeChaSvReL(i1,i2,i3), dp) 
g(SumI+8628) = Aimag(cplcFeChaSvReL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*18
SumI = SumI*2 
g(SumI+8735) = Real(cplcFeChaSvReR(i1,i2,i3), dp) 
g(SumI+8736) = Aimag(cplcFeChaSvReR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,5
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*15
SumI = SumI*2 
g(SumI+8843) = Real(cplChiChihhL(i1,i2,i3), dp) 
g(SumI+8844) = Aimag(cplChiChihhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,5
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*15
SumI = SumI*2 
g(SumI+8993) = Real(cplChiChihhR(i1,i2,i3), dp) 
g(SumI+8994) = Aimag(cplChiChihhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+9143) = Real(cplChiFdcSdL(i1,i2,i3), dp) 
g(SumI+9144) = Aimag(cplChiFdcSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+9323) = Real(cplChiFdcSdR(i1,i2,i3), dp) 
g(SumI+9324) = Aimag(cplChiFdcSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+9503) = Real(cplChiFecSeL(i1,i2,i3), dp) 
g(SumI+9504) = Aimag(cplChiFecSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+9683) = Real(cplChiFecSeR(i1,i2,i3), dp) 
g(SumI+9684) = Aimag(cplChiFecSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+9863) = Real(cplChiFucSuL(i1,i2,i3), dp) 
g(SumI+9864) = Aimag(cplChiFucSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+10043) = Real(cplChiFucSuR(i1,i2,i3), dp) 
g(SumI+10044) = Aimag(cplChiFucSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+10223) = Real(cplChiFvSvImL(i1,i2,i3), dp) 
g(SumI+10224) = Aimag(cplChiFvSvImL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+11033) = Real(cplChiFvSvImR(i1,i2,i3), dp) 
g(SumI+11034) = Aimag(cplChiFvSvImR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+11843) = Real(cplChiFvSvReL(i1,i2,i3), dp) 
g(SumI+11844) = Aimag(cplChiFvSvReL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,5
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
g(SumI+12653) = Real(cplChiFvSvReR(i1,i2,i3), dp) 
g(SumI+12654) = Aimag(cplChiFvSvReR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,5
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*10
SumI = SumI*2 
g(SumI+13463) = Real(cplcChaChiHpmL(i1,i2,i3), dp) 
g(SumI+13464) = Aimag(cplcChaChiHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,5
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*10
SumI = SumI*2 
g(SumI+13503) = Real(cplcChaChiHpmR(i1,i2,i3), dp) 
g(SumI+13504) = Aimag(cplcChaChiHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
g(SumI+13543) = Real(cplcFdChiSdL(i1,i2,i3), dp) 
g(SumI+13544) = Aimag(cplcFdChiSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
g(SumI+13723) = Real(cplcFdChiSdR(i1,i2,i3), dp) 
g(SumI+13724) = Aimag(cplcFdChiSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
g(SumI+13903) = Real(cplcFeChiSeL(i1,i2,i3), dp) 
g(SumI+13904) = Aimag(cplcFeChiSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
g(SumI+14083) = Real(cplcFeChiSeR(i1,i2,i3), dp) 
g(SumI+14084) = Aimag(cplcFeChiSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
g(SumI+14263) = Real(cplcFuChiSuL(i1,i2,i3), dp) 
g(SumI+14264) = Aimag(cplcFuChiSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
g(SumI+14443) = Real(cplcFuChiSuR(i1,i2,i3), dp) 
g(SumI+14444) = Aimag(cplcFuChiSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+14623) = Real(cplGluFdcSdL(i1,i2), dp) 
g(SumI+14624) = Aimag(cplGluFdcSdL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+14659) = Real(cplGluFdcSdR(i1,i2), dp) 
g(SumI+14660) = Aimag(cplGluFdcSdR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+14695) = Real(cplcFdFdhhL(i1,i2,i3), dp) 
g(SumI+14696) = Aimag(cplcFdFdhhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+14749) = Real(cplcFdFdhhR(i1,i2,i3), dp) 
g(SumI+14750) = Aimag(cplcFdFdhhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+14803) = Real(cplcChaFdcSuL(i1,i2,i3), dp) 
g(SumI+14804) = Aimag(cplcChaFdcSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+14875) = Real(cplcChaFdcSuR(i1,i2,i3), dp) 
g(SumI+14876) = Aimag(cplcChaFdcSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+14947) = Real(cplcFuFdcHpmL(i1,i2,i3), dp) 
g(SumI+14948) = Aimag(cplcFuFdcHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+14983) = Real(cplcFuFdcHpmR(i1,i2,i3), dp) 
g(SumI+14984) = Aimag(cplcFuFdcHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+15019) = Real(cplFvFecHpmL(i1,i2,i3), dp) 
g(SumI+15020) = Aimag(cplFvFecHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+15127) = Real(cplFvFecHpmR(i1,i2,i3), dp) 
g(SumI+15128) = Aimag(cplFvFecHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+15235) = Real(cplcFeFehhL(i1,i2,i3), dp) 
g(SumI+15236) = Aimag(cplcFeFehhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+15289) = Real(cplcFeFehhR(i1,i2,i3), dp) 
g(SumI+15290) = Aimag(cplcFeFehhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
g(SumI+15343) = Real(cplcChaFeSvImL(i1,i2,i3), dp) 
g(SumI+15344) = Aimag(cplcChaFeSvImL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
g(SumI+15451) = Real(cplcChaFeSvImR(i1,i2,i3), dp) 
g(SumI+15452) = Aimag(cplcChaFeSvImR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
g(SumI+15559) = Real(cplcChaFeSvReL(i1,i2,i3), dp) 
g(SumI+15560) = Aimag(cplcChaFeSvReL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
g(SumI+15667) = Real(cplcChaFeSvReR(i1,i2,i3), dp) 
g(SumI+15668) = Aimag(cplcChaFeSvReR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+15775) = Real(cplGluFucSuL(i1,i2), dp) 
g(SumI+15776) = Aimag(cplGluFucSuL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+15811) = Real(cplGluFucSuR(i1,i2), dp) 
g(SumI+15812) = Aimag(cplGluFucSuR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+15847) = Real(cplcFuFuhhL(i1,i2,i3), dp) 
g(SumI+15848) = Aimag(cplcFuFuhhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+15901) = Real(cplcFuFuhhR(i1,i2,i3), dp) 
g(SumI+15902) = Aimag(cplcFuFuhhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+15955) = Real(cplcFdFuHpmL(i1,i2,i3), dp) 
g(SumI+15956) = Aimag(cplcFdFuHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+15991) = Real(cplcFdFuHpmR(i1,i2,i3), dp) 
g(SumI+15992) = Aimag(cplcFdFuHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*27
SumI = SumI*2 
g(SumI+16027) = Real(cplFvFvhhL(i1,i2,i3), dp) 
g(SumI+16028) = Aimag(cplFvFvhhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*27
SumI = SumI*2 
g(SumI+16513) = Real(cplFvFvhhR(i1,i2,i3), dp) 
g(SumI+16514) = Aimag(cplFvFvhhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
g(SumI+16999) = Real(cplcFeFvHpmL(i1,i2,i3), dp) 
g(SumI+17000) = Aimag(cplcFeFvHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
g(SumI+17107) = Real(cplcFeFvHpmR(i1,i2,i3), dp) 
g(SumI+17108) = Aimag(cplcFeFvHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+17215) = Real(cplcChaFvSeL(i1,i2,i3), dp) 
g(SumI+17216) = Aimag(cplcChaFvSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+17431) = Real(cplcChaFvSeR(i1,i2,i3), dp) 
g(SumI+17432) = Aimag(cplcChaFvSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+17647) = Real(cplcFdGluSdL(i1,i2), dp) 
g(SumI+17648) = Aimag(cplcFdGluSdL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+17683) = Real(cplcFdGluSdR(i1,i2), dp) 
g(SumI+17684) = Aimag(cplcFdGluSdR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+17719) = Real(cplcFuGluSuL(i1,i2), dp) 
g(SumI+17720) = Aimag(cplcFuGluSuL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+17755) = Real(cplcFuGluSuR(i1,i2), dp) 
g(SumI+17756) = Aimag(cplcFuGluSuR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17791) = Real(cplcChacFuSdL(i1,i2,i3), dp) 
g(SumI+17792) = Aimag(cplcChacFuSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17863) = Real(cplcChacFuSdR(i1,i2,i3), dp) 
g(SumI+17864) = Aimag(cplcChacFuSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+17935) = Real(cplcFdFdVGL(i1,i2), dp) 
g(SumI+17936) = Aimag(cplcFdFdVGL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+17953) = Real(cplcFdFdVGR(i1,i2), dp) 
g(SumI+17954) = Aimag(cplcFdFdVGR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+17971) = Real(cplcFuFuVGL(i1,i2), dp) 
g(SumI+17972) = Aimag(cplcFuFuVGL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+17989) = Real(cplcFuFuVGR(i1,i2), dp) 
g(SumI+17990) = Aimag(cplcFuFuVGR(i1,i2)) 
End Do 
End Do 

g(18007) = Real(cplGluGluVGL,dp)  
g(18008) = Aimag(cplGluGluVGL)  
g(18009) = Real(cplGluGluVGR,dp)  
g(18010) = Aimag(cplGluGluVGR)  
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
Do i4 = 1,3
SumI = (i4-1) + (i3-1)*3 + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
g(SumI+18011) = Real(cplAhAhAhAh(i1,i2,i3,i4), dp) 
g(SumI+18012) = Aimag(cplAhAhAhAh(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
Do i4 = 1,3
SumI = (i4-1) + (i3-1)*3 + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
g(SumI+18173) = Real(cplAhAhhhhh(i1,i2,i3,i4), dp) 
g(SumI+18174) = Aimag(cplAhAhhhhh(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+18335) = Real(cplAhAhHpmcHpm(i1,i2,i3,i4), dp) 
g(SumI+18336) = Aimag(cplAhAhHpmcHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
g(SumI+18407) = Real(cplAhAhSdcSd(i1,i2,i3,i4), dp) 
g(SumI+18408) = Aimag(cplAhAhSdcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
g(SumI+19055) = Real(cplAhAhSecSe(i1,i2,i3,i4), dp) 
g(SumI+19056) = Aimag(cplAhAhSecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
g(SumI+19703) = Real(cplAhAhSucSu(i1,i2,i3,i4), dp) 
g(SumI+19704) = Aimag(cplAhAhSucSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*243
SumI = SumI*2 
g(SumI+20351) = Real(cplAhAhSvImSvIm(i1,i2,i3,i4), dp) 
g(SumI+20352) = Aimag(cplAhAhSvImSvIm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*243
SumI = SumI*2 
g(SumI+21809) = Real(cplAhAhSvReSvRe(i1,i2,i3,i4), dp) 
g(SumI+21810) = Aimag(cplAhAhSvReSvRe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
Do i4 = 1,3
SumI = (i4-1) + (i3-1)*3 + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
g(SumI+23267) = Real(cplhhhhhhhh(i1,i2,i3,i4), dp) 
g(SumI+23268) = Aimag(cplhhhhhhhh(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+23429) = Real(cplhhhhHpmcHpm(i1,i2,i3,i4), dp) 
g(SumI+23430) = Aimag(cplhhhhHpmcHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
g(SumI+23501) = Real(cplhhhhSdcSd(i1,i2,i3,i4), dp) 
g(SumI+23502) = Aimag(cplhhhhSdcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
g(SumI+24149) = Real(cplhhhhSecSe(i1,i2,i3,i4), dp) 
g(SumI+24150) = Aimag(cplhhhhSecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
g(SumI+24797) = Real(cplhhhhSucSu(i1,i2,i3,i4), dp) 
g(SumI+24798) = Aimag(cplhhhhSucSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*243
SumI = SumI*2 
g(SumI+25445) = Real(cplhhhhSvImSvIm(i1,i2,i3,i4), dp) 
g(SumI+25446) = Aimag(cplhhhhSvImSvIm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*243
SumI = SumI*2 
g(SumI+26903) = Real(cplhhhhSvReSvRe(i1,i2,i3,i4), dp) 
g(SumI+26904) = Aimag(cplhhhhSvReSvRe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*8
SumI = SumI*2 
g(SumI+28361) = Real(cplHpmHpmcHpmcHpm(i1,i2,i3,i4), dp) 
g(SumI+28362) = Aimag(cplHpmHpmcHpmcHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+28393) = Real(cplHpmSdcHpmcSd(i1,i2,i3,i4), dp) 
g(SumI+28394) = Aimag(cplHpmSdcHpmcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+28681) = Real(cplHpmSecHpmcSe(i1,i2,i3,i4), dp) 
g(SumI+28682) = Aimag(cplHpmSecHpmcSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+28969) = Real(cplHpmSucHpmcSu(i1,i2,i3,i4), dp) 
g(SumI+28970) = Aimag(cplHpmSucHpmcSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*18 + (i1-1)*162
SumI = SumI*2 
g(SumI+29257) = Real(cplHpmSvImSvImcHpm(i1,i2,i3,i4), dp) 
g(SumI+29258) = Aimag(cplHpmSvImSvImcHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*18 + (i1-1)*162
SumI = SumI*2 
g(SumI+29905) = Real(cplHpmSvReSvRecHpm(i1,i2,i3,i4), dp) 
g(SumI+29906) = Aimag(cplHpmSvReSvRecHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+30553) = Real(cplSdSdcSdcSd(i1,i2,i3,i4), dp) 
g(SumI+30554) = Aimag(cplSdSdcSdcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+33145) = Real(cplSdSecSdcSe(i1,i2,i3,i4), dp) 
g(SumI+33146) = Aimag(cplSdSecSdcSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+35737) = Real(cplSdSucSdcSu(i1,i2,i3,i4), dp) 
g(SumI+35738) = Aimag(cplSdSucSdcSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+38329) = Real(cplSeSecSecSe(i1,i2,i3,i4), dp) 
g(SumI+38330) = Aimag(cplSeSecSecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*54 + (i1-1)*486
SumI = SumI*2 
g(SumI+40921) = Real(cplSeSvImSvImcSe(i1,i2,i3,i4), dp) 
g(SumI+40922) = Aimag(cplSeSvImSvImcSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*54 + (i1-1)*486
SumI = SumI*2 
g(SumI+46753) = Real(cplSeSvReSvRecSe(i1,i2,i3,i4), dp) 
g(SumI+46754) = Aimag(cplSeSvReSvRecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+52585) = Real(cplSuSucSucSu(i1,i2,i3,i4), dp) 
g(SumI+52586) = Aimag(cplSuSucSucSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*54 + (i1-1)*486
SumI = SumI*2 
g(SumI+55177) = Real(cplSuSvImSvImcSu(i1,i2,i3,i4), dp) 
g(SumI+55178) = Aimag(cplSuSvImSvImcSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*54 + (i1-1)*486
SumI = SumI*2 
g(SumI+61009) = Real(cplSuSvReSvRecSu(i1,i2,i3,i4), dp) 
g(SumI+61010) = Aimag(cplSuSvReSvRecSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*729
SumI = SumI*2 
g(SumI+66841) = Real(cplSvImSvImSvImSvIm(i1,i2,i3,i4), dp) 
g(SumI+66842) = Aimag(cplSvImSvImSvImSvIm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*729
SumI = SumI*2 
g(SumI+79963) = Real(cplSvImSvImSvReSvRe(i1,i2,i3,i4), dp) 
g(SumI+79964) = Aimag(cplSvImSvImSvReSvRe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*729
SumI = SumI*2 
g(SumI+93085) = Real(cplSvReSvReSvReSvRe(i1,i2,i3,i4), dp) 
g(SumI+93086) = Aimag(cplSvReSvReSvReSvRe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+106207) = Real(cplSdcSdVGVG(i1,i2), dp) 
g(SumI+106208) = Aimag(cplSdcSdVGVG(i1,i2)) 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+106279) = Real(cplSucSuVGVG(i1,i2), dp) 
g(SumI+106280) = Aimag(cplSucSuVGVG(i1,i2)) 
End Do 
End Do 

End Subroutine MassesCoupsToG

Subroutine GToMassesCoups(g,MSd,MSd2,MSvIm,MSvIm2,MSvRe,MSvRe2,MSu,MSu2,              & 
& MSe,MSe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,              & 
& MFe2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,             & 
& cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,   & 
& cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,   & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,      & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,              & 
& cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,      & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,         & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,             & 
& cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,            & 
& cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,         & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhhhhh,cplhhhhHpmcHpm,               & 
& cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

Implicit None 
Real(dp), Intent(in) :: g(:) 
Integer :: i1,i2,i3,i4, sumI
Real(dp),Intent(inout) :: MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MSu(6),MSu2(6),MSe(6),           & 
& MSe2(6),Mhh(3),Mhh2(3),MAh(3),MAh2(3),MHpm(2),MHpm2(2),MChi(5),MChi2(5),               & 
& MFv(9),MFv2(9),MCha(2),MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2

Complex(dp),Intent(inout) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),            & 
& cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),            & 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),     & 
& cplHpmSvRecSe(2,9,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),    & 
& cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),           & 
& cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp),Intent(inout) :: cplAhAhAhAh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),cplAhAhSdcSd(3,3,6,6),& 
& cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,9,9),cplAhAhSvReSvRe(3,3,9,9),& 
& cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),& 
& cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,9,9),cplhhhhSvReSvRe(3,3,9,9),               & 
& cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),          & 
& cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,9,9,2),cplHpmSvReSvRecHpm(2,9,9,2),      & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvImSvImcSe(6,9,9,6),cplSeSvReSvRecSe(6,9,9,6),cplSuSucSucSu(6,6,6,6),            & 
& cplSuSvImSvImcSu(6,9,9,6),cplSuSvReSvRecSu(6,9,9,6),cplSvImSvImSvImSvIm(9,9,9,9),      & 
& cplSvImSvImSvReSvRe(9,9,9,9),cplSvReSvReSvReSvRe(9,9,9,9),cplSdcSdVGVG(6,6),           & 
& cplSucSuVGVG(6,6)

MSd=g(1:6) 
MSd2=g(7:12) 
MSvIm=g(13:21) 
MSvIm2=g(22:30) 
MSvRe=g(31:39) 
MSvRe2=g(40:48) 
MSu=g(49:54) 
MSu2=g(55:60) 
MSe=g(61:66) 
MSe2=g(67:72) 
Mhh=g(73:75) 
Mhh2=g(76:78) 
MAh=g(79:81) 
MAh2=g(82:84) 
MHpm=g(85:86) 
MHpm2=g(87:88) 
MChi=g(89:93) 
MChi2=g(94:98) 
MFv=g(99:107) 
MFv2=g(108:116) 
MCha=g(117:118) 
MCha2=g(119:120) 
MFe=g(121:123) 
MFe2=g(124:126) 
MFd=g(127:129) 
MFd2=g(130:132) 
MFu=g(133:135) 
MFu2=g(136:138) 
MGlu=g(139) 
MGlu2=g(140) 
MVZ=g(141) 
MVZ2=g(142) 
MVWm=g(143) 
MVWm2=g(144) 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplAhAhAh(i1,i2,i3) = Cmplx( g(SumI+145), g(SumI+146), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplAhAhhh(i1,i2,i3) = Cmplx( g(SumI+199), g(SumI+200), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplAhhhhh(i1,i2,i3) = Cmplx( g(SumI+253), g(SumI+254), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
cplAhHpmcHpm(i1,i2,i3) = Cmplx( g(SumI+307), g(SumI+308), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSdcSd(i1,i2,i3) = Cmplx( g(SumI+331), g(SumI+332), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSecSe(i1,i2,i3) = Cmplx( g(SumI+547), g(SumI+548), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSucSu(i1,i2,i3) = Cmplx( g(SumI+763), g(SumI+764), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplAhSvImSvIm(i1,i2,i3) = Cmplx( g(SumI+979), g(SumI+980), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplAhSvImSvRe(i1,i2,i3) = Cmplx( g(SumI+1465), g(SumI+1466), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplAhSvReSvRe(i1,i2,i3) = Cmplx( g(SumI+1951), g(SumI+1952), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplhhhhhh(i1,i2,i3) = Cmplx( g(SumI+2437), g(SumI+2438), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
cplhhHpmcHpm(i1,i2,i3) = Cmplx( g(SumI+2491), g(SumI+2492), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSdcSd(i1,i2,i3) = Cmplx( g(SumI+2515), g(SumI+2516), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSecSe(i1,i2,i3) = Cmplx( g(SumI+2731), g(SumI+2732), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSucSu(i1,i2,i3) = Cmplx( g(SumI+2947), g(SumI+2948), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplhhSvImSvIm(i1,i2,i3) = Cmplx( g(SumI+3163), g(SumI+3164), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplhhSvImSvRe(i1,i2,i3) = Cmplx( g(SumI+3649), g(SumI+3650), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplhhSvReSvRe(i1,i2,i3) = Cmplx( g(SumI+4135), g(SumI+4136), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplHpmSucSd(i1,i2,i3) = Cmplx( g(SumI+4621), g(SumI+4622), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplHpmSvImcSe(i1,i2,i3) = Cmplx( g(SumI+4765), g(SumI+4766), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplHpmSvRecSe(i1,i2,i3) = Cmplx( g(SumI+4981), g(SumI+4982), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplSdcHpmcSu(i1,i2,i3) = Cmplx( g(SumI+5197), g(SumI+5198), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
cplSeSvImcHpm(i1,i2,i3) = Cmplx( g(SumI+5341), g(SumI+5342), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
cplSeSvRecHpm(i1,i2,i3) = Cmplx( g(SumI+5557), g(SumI+5558), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSdcSdVG(i1,i2) = Cmplx( g(SumI+5773), g(SumI+5774), dp) 
End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSucSuVG(i1,i2) = Cmplx( g(SumI+5845), g(SumI+5846), dp) 
End Do 
 End Do 
 
cplVGVGVG= Cmplx(g(5917),g(5918),dp) 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*6
SumI = SumI*2 
cplcChaChaAhL(i1,i2,i3) = Cmplx( g(SumI+5919), g(SumI+5920), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*6
SumI = SumI*2 
cplcChaChaAhR(i1,i2,i3) = Cmplx( g(SumI+5943), g(SumI+5944), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,5
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*15
SumI = SumI*2 
cplChiChiAhL(i1,i2,i3) = Cmplx( g(SumI+5967), g(SumI+5968), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,5
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*15
SumI = SumI*2 
cplChiChiAhR(i1,i2,i3) = Cmplx( g(SumI+6117), g(SumI+6118), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFdFdAhL(i1,i2,i3) = Cmplx( g(SumI+6267), g(SumI+6268), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFdFdAhR(i1,i2,i3) = Cmplx( g(SumI+6321), g(SumI+6322), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFeFeAhL(i1,i2,i3) = Cmplx( g(SumI+6375), g(SumI+6376), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFeFeAhR(i1,i2,i3) = Cmplx( g(SumI+6429), g(SumI+6430), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFuFuAhL(i1,i2,i3) = Cmplx( g(SumI+6483), g(SumI+6484), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFuFuAhR(i1,i2,i3) = Cmplx( g(SumI+6537), g(SumI+6538), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*27
SumI = SumI*2 
cplFvFvAhL(i1,i2,i3) = Cmplx( g(SumI+6591), g(SumI+6592), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*27
SumI = SumI*2 
cplFvFvAhR(i1,i2,i3) = Cmplx( g(SumI+7077), g(SumI+7078), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
cplChiChacHpmL(i1,i2,i3) = Cmplx( g(SumI+7563), g(SumI+7564), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
cplChiChacHpmR(i1,i2,i3) = Cmplx( g(SumI+7603), g(SumI+7604), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChaFucSdL(i1,i2,i3) = Cmplx( g(SumI+7643), g(SumI+7644), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChaFucSdR(i1,i2,i3) = Cmplx( g(SumI+7715), g(SumI+7716), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplFvChacSeL(i1,i2,i3) = Cmplx( g(SumI+7787), g(SumI+7788), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplFvChacSeR(i1,i2,i3) = Cmplx( g(SumI+8003), g(SumI+8004), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*6
SumI = SumI*2 
cplcChaChahhL(i1,i2,i3) = Cmplx( g(SumI+8219), g(SumI+8220), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*6
SumI = SumI*2 
cplcChaChahhR(i1,i2,i3) = Cmplx( g(SumI+8243), g(SumI+8244), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFdChaSuL(i1,i2,i3) = Cmplx( g(SumI+8267), g(SumI+8268), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFdChaSuR(i1,i2,i3) = Cmplx( g(SumI+8339), g(SumI+8340), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*18
SumI = SumI*2 
cplcFeChaSvImL(i1,i2,i3) = Cmplx( g(SumI+8411), g(SumI+8412), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*18
SumI = SumI*2 
cplcFeChaSvImR(i1,i2,i3) = Cmplx( g(SumI+8519), g(SumI+8520), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*18
SumI = SumI*2 
cplcFeChaSvReL(i1,i2,i3) = Cmplx( g(SumI+8627), g(SumI+8628), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*18
SumI = SumI*2 
cplcFeChaSvReR(i1,i2,i3) = Cmplx( g(SumI+8735), g(SumI+8736), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,5
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*15
SumI = SumI*2 
cplChiChihhL(i1,i2,i3) = Cmplx( g(SumI+8843), g(SumI+8844), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,5
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*15
SumI = SumI*2 
cplChiChihhR(i1,i2,i3) = Cmplx( g(SumI+8993), g(SumI+8994), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFdcSdL(i1,i2,i3) = Cmplx( g(SumI+9143), g(SumI+9144), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFdcSdR(i1,i2,i3) = Cmplx( g(SumI+9323), g(SumI+9324), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFecSeL(i1,i2,i3) = Cmplx( g(SumI+9503), g(SumI+9504), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFecSeR(i1,i2,i3) = Cmplx( g(SumI+9683), g(SumI+9684), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFucSuL(i1,i2,i3) = Cmplx( g(SumI+9863), g(SumI+9864), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFucSuR(i1,i2,i3) = Cmplx( g(SumI+10043), g(SumI+10044), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplChiFvSvImL(i1,i2,i3) = Cmplx( g(SumI+10223), g(SumI+10224), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplChiFvSvImR(i1,i2,i3) = Cmplx( g(SumI+11033), g(SumI+11034), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplChiFvSvReL(i1,i2,i3) = Cmplx( g(SumI+11843), g(SumI+11844), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,5
Do i2 = 1,9
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*81
SumI = SumI*2 
cplChiFvSvReR(i1,i2,i3) = Cmplx( g(SumI+12653), g(SumI+12654), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,5
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*10
SumI = SumI*2 
cplcChaChiHpmL(i1,i2,i3) = Cmplx( g(SumI+13463), g(SumI+13464), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,5
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*10
SumI = SumI*2 
cplcChaChiHpmR(i1,i2,i3) = Cmplx( g(SumI+13503), g(SumI+13504), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
cplcFdChiSdL(i1,i2,i3) = Cmplx( g(SumI+13543), g(SumI+13544), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
cplcFdChiSdR(i1,i2,i3) = Cmplx( g(SumI+13723), g(SumI+13724), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
cplcFeChiSeL(i1,i2,i3) = Cmplx( g(SumI+13903), g(SumI+13904), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
cplcFeChiSeR(i1,i2,i3) = Cmplx( g(SumI+14083), g(SumI+14084), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
cplcFuChiSuL(i1,i2,i3) = Cmplx( g(SumI+14263), g(SumI+14264), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,5
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*30
SumI = SumI*2 
cplcFuChiSuR(i1,i2,i3) = Cmplx( g(SumI+14443), g(SumI+14444), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFdcSdL(i1,i2) = Cmplx( g(SumI+14623), g(SumI+14624), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFdcSdR(i1,i2) = Cmplx( g(SumI+14659), g(SumI+14660), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFdFdhhL(i1,i2,i3) = Cmplx( g(SumI+14695), g(SumI+14696), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFdFdhhR(i1,i2,i3) = Cmplx( g(SumI+14749), g(SumI+14750), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFdcSuL(i1,i2,i3) = Cmplx( g(SumI+14803), g(SumI+14804), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFdcSuR(i1,i2,i3) = Cmplx( g(SumI+14875), g(SumI+14876), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFuFdcHpmL(i1,i2,i3) = Cmplx( g(SumI+14947), g(SumI+14948), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFuFdcHpmR(i1,i2,i3) = Cmplx( g(SumI+14983), g(SumI+14984), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplFvFecHpmL(i1,i2,i3) = Cmplx( g(SumI+15019), g(SumI+15020), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplFvFecHpmR(i1,i2,i3) = Cmplx( g(SumI+15127), g(SumI+15128), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFeFehhL(i1,i2,i3) = Cmplx( g(SumI+15235), g(SumI+15236), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFeFehhR(i1,i2,i3) = Cmplx( g(SumI+15289), g(SumI+15290), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
cplcChaFeSvImL(i1,i2,i3) = Cmplx( g(SumI+15343), g(SumI+15344), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
cplcChaFeSvImR(i1,i2,i3) = Cmplx( g(SumI+15451), g(SumI+15452), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
cplcChaFeSvReL(i1,i2,i3) = Cmplx( g(SumI+15559), g(SumI+15560), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,9
SumI = (i3-1) + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
cplcChaFeSvReR(i1,i2,i3) = Cmplx( g(SumI+15667), g(SumI+15668), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFucSuL(i1,i2) = Cmplx( g(SumI+15775), g(SumI+15776), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFucSuR(i1,i2) = Cmplx( g(SumI+15811), g(SumI+15812), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFuFuhhL(i1,i2,i3) = Cmplx( g(SumI+15847), g(SumI+15848), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
cplcFuFuhhR(i1,i2,i3) = Cmplx( g(SumI+15901), g(SumI+15902), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFdFuHpmL(i1,i2,i3) = Cmplx( g(SumI+15955), g(SumI+15956), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFdFuHpmR(i1,i2,i3) = Cmplx( g(SumI+15991), g(SumI+15992), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*27
SumI = SumI*2 
cplFvFvhhL(i1,i2,i3) = Cmplx( g(SumI+16027), g(SumI+16028), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*27
SumI = SumI*2 
cplFvFvhhR(i1,i2,i3) = Cmplx( g(SumI+16513), g(SumI+16514), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
cplcFeFvHpmL(i1,i2,i3) = Cmplx( g(SumI+16999), g(SumI+17000), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
cplcFeFvHpmR(i1,i2,i3) = Cmplx( g(SumI+17107), g(SumI+17108), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcChaFvSeL(i1,i2,i3) = Cmplx( g(SumI+17215), g(SumI+17216), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcChaFvSeR(i1,i2,i3) = Cmplx( g(SumI+17431), g(SumI+17432), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFdGluSdL(i1,i2) = Cmplx( g(SumI+17647), g(SumI+17648), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFdGluSdR(i1,i2) = Cmplx( g(SumI+17683), g(SumI+17684), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFuGluSuL(i1,i2) = Cmplx( g(SumI+17719), g(SumI+17720), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFuGluSuR(i1,i2) = Cmplx( g(SumI+17755), g(SumI+17756), dp) 
End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChacFuSdL(i1,i2,i3) = Cmplx( g(SumI+17791), g(SumI+17792), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChacFuSdR(i1,i2,i3) = Cmplx( g(SumI+17863), g(SumI+17864), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFdFdVGL(i1,i2) = Cmplx( g(SumI+17935), g(SumI+17936), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFdFdVGR(i1,i2) = Cmplx( g(SumI+17953), g(SumI+17954), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFuFuVGL(i1,i2) = Cmplx( g(SumI+17971), g(SumI+17972), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFuFuVGR(i1,i2) = Cmplx( g(SumI+17989), g(SumI+17990), dp) 
End Do 
 End Do 
 
cplGluGluVGL= Cmplx(g(18007),g(18008),dp) 
cplGluGluVGR= Cmplx(g(18009),g(18010),dp) 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
Do i4 = 1,3
SumI = (i4-1) + (i3-1)*3 + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
cplAhAhAhAh(i1,i2,i3,i4) = Cmplx( g(SumI+18011), g(SumI+18012), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
Do i4 = 1,3
SumI = (i4-1) + (i3-1)*3 + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
cplAhAhhhhh(i1,i2,i3,i4) = Cmplx( g(SumI+18173), g(SumI+18174), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplAhAhHpmcHpm(i1,i2,i3,i4) = Cmplx( g(SumI+18335), g(SumI+18336), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
cplAhAhSdcSd(i1,i2,i3,i4) = Cmplx( g(SumI+18407), g(SumI+18408), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
cplAhAhSecSe(i1,i2,i3,i4) = Cmplx( g(SumI+19055), g(SumI+19056), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
cplAhAhSucSu(i1,i2,i3,i4) = Cmplx( g(SumI+19703), g(SumI+19704), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*243
SumI = SumI*2 
cplAhAhSvImSvIm(i1,i2,i3,i4) = Cmplx( g(SumI+20351), g(SumI+20352), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*243
SumI = SumI*2 
cplAhAhSvReSvRe(i1,i2,i3,i4) = Cmplx( g(SumI+21809), g(SumI+21810), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
Do i4 = 1,3
SumI = (i4-1) + (i3-1)*3 + (i2-1)*9 + (i1-1)*27
SumI = SumI*2 
cplhhhhhhhh(i1,i2,i3,i4) = Cmplx( g(SumI+23267), g(SumI+23268), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplhhhhHpmcHpm(i1,i2,i3,i4) = Cmplx( g(SumI+23429), g(SumI+23430), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
cplhhhhSdcSd(i1,i2,i3,i4) = Cmplx( g(SumI+23501), g(SumI+23502), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
cplhhhhSecSe(i1,i2,i3,i4) = Cmplx( g(SumI+24149), g(SumI+24150), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*108
SumI = SumI*2 
cplhhhhSucSu(i1,i2,i3,i4) = Cmplx( g(SumI+24797), g(SumI+24798), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*243
SumI = SumI*2 
cplhhhhSvImSvIm(i1,i2,i3,i4) = Cmplx( g(SumI+25445), g(SumI+25446), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*243
SumI = SumI*2 
cplhhhhSvReSvRe(i1,i2,i3,i4) = Cmplx( g(SumI+26903), g(SumI+26904), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*8
SumI = SumI*2 
cplHpmHpmcHpmcHpm(i1,i2,i3,i4) = Cmplx( g(SumI+28361), g(SumI+28362), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSdcHpmcSd(i1,i2,i3,i4) = Cmplx( g(SumI+28393), g(SumI+28394), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSecHpmcSe(i1,i2,i3,i4) = Cmplx( g(SumI+28681), g(SumI+28682), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSucHpmcSu(i1,i2,i3,i4) = Cmplx( g(SumI+28969), g(SumI+28970), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*18 + (i1-1)*162
SumI = SumI*2 
cplHpmSvImSvImcHpm(i1,i2,i3,i4) = Cmplx( g(SumI+29257), g(SumI+29258), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*18 + (i1-1)*162
SumI = SumI*2 
cplHpmSvReSvRecHpm(i1,i2,i3,i4) = Cmplx( g(SumI+29905), g(SumI+29906), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSdSdcSdcSd(i1,i2,i3,i4) = Cmplx( g(SumI+30553), g(SumI+30554), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSdSecSdcSe(i1,i2,i3,i4) = Cmplx( g(SumI+33145), g(SumI+33146), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSdSucSdcSu(i1,i2,i3,i4) = Cmplx( g(SumI+35737), g(SumI+35738), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSeSecSecSe(i1,i2,i3,i4) = Cmplx( g(SumI+38329), g(SumI+38330), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*54 + (i1-1)*486
SumI = SumI*2 
cplSeSvImSvImcSe(i1,i2,i3,i4) = Cmplx( g(SumI+40921), g(SumI+40922), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*54 + (i1-1)*486
SumI = SumI*2 
cplSeSvReSvRecSe(i1,i2,i3,i4) = Cmplx( g(SumI+46753), g(SumI+46754), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSuSucSucSu(i1,i2,i3,i4) = Cmplx( g(SumI+52585), g(SumI+52586), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*54 + (i1-1)*486
SumI = SumI*2 
cplSuSvImSvImcSu(i1,i2,i3,i4) = Cmplx( g(SumI+55177), g(SumI+55178), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*54 + (i1-1)*486
SumI = SumI*2 
cplSuSvReSvRecSu(i1,i2,i3,i4) = Cmplx( g(SumI+61009), g(SumI+61010), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*729
SumI = SumI*2 
cplSvImSvImSvImSvIm(i1,i2,i3,i4) = Cmplx( g(SumI+66841), g(SumI+66842), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*729
SumI = SumI*2 
cplSvImSvImSvReSvRe(i1,i2,i3,i4) = Cmplx( g(SumI+79963), g(SumI+79964), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,9
Do i4 = 1,9
SumI = (i4-1) + (i3-1)*9 + (i2-1)*81 + (i1-1)*729
SumI = SumI*2 
cplSvReSvReSvReSvRe(i1,i2,i3,i4) = Cmplx( g(SumI+93085), g(SumI+93086), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSdcSdVGVG(i1,i2) = Cmplx( g(SumI+106207), g(SumI+106208), dp) 
End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSucSuVGVG(i1,i2) = Cmplx( g(SumI+106279), g(SumI+106280), dp) 
End Do 
 End Do 
 
End Subroutine GToMassesCoups

End Module EffectivePotential_NInvSeesaw 
 
