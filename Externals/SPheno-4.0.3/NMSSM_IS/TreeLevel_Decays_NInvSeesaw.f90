! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:20 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelDecays_NInvSeesaw
 
Use Control 
Use DecayFunctions 
Use Settings 
Use LoopCouplings_NInvSeesaw 
Use CouplingsForDecays_NInvSeesaw 
Use Model_Data_NInvSeesaw 
Use Mathematics, Only: Li2 
 
 Contains 
 
  
Subroutine hhTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplHiggsPP(3),cplHiggsGG(3),cplHiggsZZvirt(3),cplHiggsWWvirt(3),cplAhAhhh(3,3,3),     & 
& cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),             & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),         & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplhhcVWmVWm(3),        & 
& cplhhVZVZ(3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Real(dp) :: alpha3 
Iname = Iname + 1 
NameOfUnit(Iname) = 'hhTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = Mhh(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_hh_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplHiggsPP,cplHiggsGG,             & 
& cplHiggsZZvirt,cplHiggsWWvirt,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,             & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcVWmVWm,cplhhVZVZ,deltaM)

!alpha3 = AlphaSDR(m_in,MSd,MSu,MGlu,MFd,MFu) 
alpha3 = g3running**2/(4._dp*Pi) 
i_count = 1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo128pi3 * Abs(cplHiggsPP(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo36pi3 * Abs(cplHiggsGG(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsZZvirt(i1)
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWm, VWm
! ----------------------------------------------

 
m1out = MVWm
m2out = MVWm
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsWWvirt(i1)
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Ah, Ah
! ----------------------------------------------

 
Do gt1= 2, 3
  Do gt2= gt1, 3
m1out = MAh(gt1)
m2out = MAh(gt2)
coup = cplAhAhhh(gt1,gt2,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.gt2) Then 
  BRHAA(i1,gt1) = gPartial(i1,i_count) 
End if 
  BRHAAijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, Ah
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=2, 3
m1out = Mhh(gt1)
m2out = MAh(gt2)
coup = cplAhhhhh(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRHHAijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VZ
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MAh(gt1)
m2out = MVZ
coup = cplAhhhVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRHAZ(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Cha], Cha
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 2
m1out = MCha(gt1)
m2out = MCha(gt2)
coupL = cplcChaChahhL(gt1,gt2,i1)
coupR = cplcChaChahhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Chi, Chi
! ----------------------------------------------

 
Do gt1= 1, 5
  Do gt2= gt1, 5
m1out = MChi(gt1)
m2out = MChi(gt2)
coupL = cplChiChihhL(gt1,gt2,i1)
coupR = cplChiChihhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdhhL(gt1,gt2,i1)
coupR = cplcFdFdhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFehhL(gt1,gt2,i1)
coupR = cplcFeFehhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuhhL(gt1,gt2,i1)
coupR = cplcFuFuhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvhhL(gt1,gt2,i1)
coupR = cplFvFvhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = Mhh(gt1)
m2out = Mhh(gt2)
coup = cplhhhhhh(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.gt2) Then 
  BRHHH(i1,gt1) = gPartial(i1,i_count) 
End if 
  BRHHHijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 2, 2
  Do gt2=2, 2
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplhhHpmcHpm(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWm]
! ----------------------------------------------

 
Do gt1= 2, 2
m1out = MHpm(gt1)
m2out = MVWm
coup = cplhhHpmcVWm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRHHpW(i1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Sd], Sd
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MSd(gt1)
m2out = MSd(gt2)
coup = cplhhSdcSd(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Se], Se
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MSe(gt1)
m2out = MSe(gt2)
coup = cplhhSecSe(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Su], Su
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MSu(gt1)
m2out = MSu(gt2)
coup = cplhhSucSu(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvIm, SvIm
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MSvIm(gt1)
m2out = MSvIm(gt2)
coup = cplhhSvImSvIm(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, SvIm
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 9
m1out = MSvRe(gt1)
m2out = MSvIm(gt2)
coup = cplhhSvImSvRe(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, SvRe
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MSvRe(gt1)
m2out = MSvRe(gt2)
coup = cplhhSvReSvRe(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWm, conj[VWm]
! ----------------------------------------------

 
m1out = MVWm
m2out = MVWm
coup = cplhhcVWmVWm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
coup = cplhhVZVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Ah, VP
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MAh(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Glu, Glu
! ----------------------------------------------

 
m1out = MGlu
m2out = MGlu
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! hh, VP
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = Mhh(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = Mhh(gt1)
m2out = MVZ
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRHHZ(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VP
! ----------------------------------------------

 
m1out = MVZ
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
Contains 
 
  Real(dp) Function FFqcd(mf, mA, alpha_s)
  Implicit None
   Real(dp) , Intent(in) :: mf, mA, alpha_s
   Real(dp) :: fac, beta, beta2, ratio, R_beta_1, Ln_R_beta_1, Ln_beta

   FFqcd = 0._dp
   ratio = mf / mA
   If (ratio.Ge.0.5_dp) Return ! decay is kinematically forbitten

   If (ratio.Ge.0.495_dp) Return ! Coloumb singularity

    beta2 = 1._dp - 4._dp * ratio**2
    beta = Sqrt(beta2)
    
    R_beta_1 = (1. - beta) / (1._dp + beta)
    Ln_beta = Log(beta)
    Ln_R_beta_1 = Log(R_beta_1)

    fac = (3._dp + 34._dp * beta2 - 13._dp * beta**4) / (16._dp * beta**3)  &
      &     * (-Ln_R_beta_1)                                                &
      & + 0.375_dp * (7._dp - beta2) - 3._dp * Log(4._dp/(1._dp - beta**2)) &
      & - 4._dp * Ln_beta                                                   &
      & + (1._dp + beta**2)                                                 &
      &       * ( 4._dp * Li2(R_beta_1) + 2._dp * Li2(- R_beta_1)           &
      &         + Ln_R_beta_1 * ( 3._dp * Log(2._dp/(1._dp + beta))         &
      &                         + 2._dp * Ln_beta )  ) / beta

    fac = fac - 3._dp * Log(ratio)  ! absorb large logarithms in mass

    FFqcd = 1._dp + 5._dp * alpha_s * fac * oo3pi 

  End  Function FFqcd
End Subroutine hhTwoBodyDecay
 
 
Subroutine AhTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplPseudoHiggsPP(3),cplPseudoHiggsGG(3),cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),            & 
& cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),     & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),           & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),             & 
& cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),& 
& cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),         & 
& cplAhSvReSvRe(3,9,9)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Real(dp) :: alpha3 
Iname = Iname + 1 
NameOfUnit(Iname) = 'AhTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 2 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MAh(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Ah_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplPseudoHiggsPP,cplPseudoHiggsGG, & 
& cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,deltaM)

!alpha3 = AlphaSDR(m_in,MSd,MSu,MGlu,MFd,MFu) 
alpha3 = g3running**2/(4._dp*Pi) 
i_count = 1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo128pi3 * Abs(cplPseudoHiggsPP(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo36pi3 * Abs(cplPseudoHiggsGG(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Ah, Ah
! ----------------------------------------------

 
Do gt1= 2, 3
  Do gt2= gt1, 3
m1out = MAh(gt1)
m2out = MAh(gt2)
coup = cplAhAhAh(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.gt2) Then 
  BRAAA(i1,gt1) = gPartial(i1,i_count) 
End if 
  BRAAAijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, Ah
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=2, 3
m1out = Mhh(gt1)
m2out = MAh(gt2)
coup = cplAhAhhh(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRAHAijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Cha], Cha
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 2
m1out = MCha(gt1)
m2out = MCha(gt2)
coupL = cplcChaChaAhL(gt1,gt2,i1)
coupR = cplcChaChaAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Chi, Chi
! ----------------------------------------------

 
Do gt1= 1, 5
  Do gt2= gt1, 5
m1out = MChi(gt1)
m2out = MChi(gt2)
coupL = cplChiChiAhL(gt1,gt2,i1)
coupR = cplChiChiAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdAhL(gt1,gt2,i1)
coupR = cplcFdFdAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFeAhL(gt1,gt2,i1)
coupR = cplcFeFeAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuAhL(gt1,gt2,i1)
coupR = cplcFuFuAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvAhL(gt1,gt2,i1)
coupR = cplFvFvAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = Mhh(gt1)
m2out = Mhh(gt2)
coup = cplAhhhhh(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.gt2) Then 
  BRAHH(i1,gt1) = gPartial(i1,i_count) 
End if 
  BRAHHijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = Mhh(gt1)
m2out = MVZ
coup = cplAhhhVZ(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRAHZ(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 2, 2
  Do gt2=2, 2
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplAhHpmcHpm(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWm]
! ----------------------------------------------

 
Do gt1= 2, 2
m1out = MHpm(gt1)
m2out = MVWm
coup = cplAhHpmcVWm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRAHpW(i1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Sd], Sd
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MSd(gt1)
m2out = MSd(gt2)
coup = cplAhSdcSd(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Se], Se
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MSe(gt1)
m2out = MSe(gt2)
coup = cplAhSecSe(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Su], Su
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MSu(gt1)
m2out = MSu(gt2)
coup = cplAhSucSu(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvIm, SvIm
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MSvIm(gt1)
m2out = MSvIm(gt2)
coup = cplAhSvImSvIm(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, SvIm
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 9
m1out = MSvRe(gt1)
m2out = MSvIm(gt2)
coup = cplAhSvImSvRe(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, SvRe
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MSvRe(gt1)
m2out = MSvRe(gt2)
coup = cplAhSvReSvRe(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VP
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MAh(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Ah, VZ
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MAh(gt1)
m2out = MVZ
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRAAZ(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Glu, Glu
! ----------------------------------------------

 
m1out = MGlu
m2out = MGlu
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! hh, VP
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = Mhh(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VP
! ----------------------------------------------

 
m1out = MVZ
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! conj[VWm], VWm
! ----------------------------------------------

 
m1out = MVWm
m2out = MVWm
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
Contains 
 
 Real(dp) Function FFqcd(mf, mA, alpha_s)
  implicit none
   Real(dp) , Intent(in) :: mf, mA, alpha_s
   Real(dp) :: fac, beta, beta2, ratio, R_beta_1, Ln_R_beta_1, Ln_beta

   FFqcd = 0._dp
   ratio = mf / mA
   if (ratio.ge.0.5_dp) return ! decay is kinematically forbitten

   if (ratio.ge.0.495_dp) return ! Coloumb singularity

    beta2 = 1._dp - 4._dp * ratio**2
    beta = Sqrt(beta2)
    
    R_beta_1 = (1. - beta) / (1._dp + beta)
    Ln_beta = Log(beta)
    Ln_R_beta_1 = Log(R_beta_1)

    fac = (19._dp + 2._dp * beta2 + 3._dp * beta**4) / (16._dp * beta)      &
      &     * (-Ln_R_beta_1)                                                &
      & + 0.375_dp * (7._dp - beta2) - 3._dp * Log(4._dp/(1._dp - beta**2)) &
      & - 4._dp * Ln_beta                                                   &
      & + (1._dp + beta**2)                                                 &
      &       * ( 4._dp * Li2(R_beta_1) + 2._dp * Li2(- R_beta_1)           &
      &         + Ln_R_beta_1 * ( 3._dp * Log(2._dp/(1._dp + beta))         &
      &                         + 2._dp * Ln_beta )  ) / beta
    fac =  fac - 3._dp * Log(ratio)  ! absorb large logarithms in mass

    FFqcd = 1._dp + 5._dp * alpha_s * fac * oo3pi 

  end  Function FFqcd
End Subroutine AhTwoBodyDecay
 
 
Subroutine HpmTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplAhHpmcHpm(3,2,2),cplAhcHpmVWm(3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),    & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),     & 
& cplhhHpmcHpm(3,2,2),cplhhcHpmVWm(3,2),cplHpmcHpmVZ(2,2),cplSdcHpmcSu(6,2,6),           & 
& cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),cplcHpmVWmVZ(2)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'HpmTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 2 
  i_end = 2
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.2) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,2

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,2

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MHpm(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Hpm_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplAhHpmcHpm,cplAhcHpmVWm,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,   & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplcHpmVWmVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Hpm, Ah
! ----------------------------------------------

 
Do gt1= 2, 2
  Do gt2=2, 3
m1out = MHpm(gt1)
m2out = MAh(gt2)
coup = cplAhHpmcHpm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VWm
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MAh(gt1)
m2out = MVWm
coup = cplAhcHpmVWm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BR_HpAW(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Chi, Cha
! ----------------------------------------------

 
Do gt1= 1, 5
  Do gt2=1, 2
m1out = MChi(gt1)
m2out = MCha(gt2)
coupL = cplChiChacHpmL(gt1,gt2,i1)
coupR = cplChiChacHpmR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFd(gt2)
coupL = cplcFuFdcHpmL(gt1,gt2,i1)
coupR = cplcFuFdcHpmR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If ((gt1.eq.2).and.(gt2.eq.3)) Then 
  BR_Hcb(i1) = gPartial(i1,i_count) 
End if 
If ((gt1.eq.2).and.(gt2.eq.2)) Then 
  BR_Hcs(i1) = gPartial(i1,i_count) 
End if 
If ((gt1.eq.3).and.(gt2.eq.3)) Then 
  BR_HpTB(i1) = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fe
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 3
m1out = MFv(gt1)
m2out = MFe(gt2)
coupL = cplFvFecHpmL(gt1,gt2,i1)
coupR = cplFvFecHpmR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If ((gt1.eq.gt2).and.(gt1.eq.3)) Then 
  BR_Htaunu(i1) = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, hh
! ----------------------------------------------

 
Do gt1= 2, 2
  Do gt2=1, 3
m1out = MHpm(gt1)
m2out = Mhh(gt2)
coup = cplhhHpmcHpm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VWm
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = Mhh(gt1)
m2out = MVWm
coup = cplhhcHpmVWm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BR_HpHW(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZ
! ----------------------------------------------

 
Do gt1= 2, 2
m1out = MHpm(gt1)
m2out = MVZ
coup = cplHpmcHpmVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Su], Sd
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MSu(gt1)
m2out = MSd(gt2)
coup = cplSdcHpmcSu(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvIm, Se
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 6
m1out = MSvIm(gt1)
m2out = MSe(gt2)
coup = cplSeSvImcHpm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, Se
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 6
m1out = MSvRe(gt1)
m2out = MSe(gt2)
coup = cplSeSvRecHpm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWm, VZ
! ----------------------------------------------

 
m1out = MVWm
m2out = MVZ
coup = cplcHpmVWmVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BR_HpWZ(i1) = gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Hpm, VP
! ----------------------------------------------

 
Do gt1= 2, 2
m1out = MHpm(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWm, VP
! ----------------------------------------------

 
m1out = MVWm
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine HpmTwoBodyDecay
 
 
Subroutine SdTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplAhSdcSd(3,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiFdcSdL(5,3,6),        & 
& cplChiFdcSdR(5,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplhhSdcSd(3,6,6),             & 
& cplHpmSucSd(2,6,6),cplSdcSdVZ(6,6),cplSucSdVWm(6,6)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'SdTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 6
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.6) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MSd(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Sd_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplAhSdcSd,cplChaFucSdL,           & 
& cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,           & 
& cplHpmSucSd,cplSdcSdVZ,cplSucSdVWm,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Sd, Ah
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=2, 3
m1out = MSd(gt1)
m2out = MAh(gt2)
coup = cplAhSdcSd(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fu, Cha
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 2
m1out = MFu(gt1)
m2out = MCha(gt2)
coupL = cplChaFucSdL(gt2,gt1,i1)
coupR = cplChaFucSdR(gt2,gt1,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, Chi
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 5
m1out = MFd(gt1)
m2out = MChi(gt2)
coupL = cplChiFdcSdL(gt2,gt1,i1)
coupR = cplChiFdcSdR(gt2,gt1,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Glu, Fd
! ----------------------------------------------

 
  Do gt2=1, 3
m1out = MGlu
m2out = MFd(gt2)
coupL = cplGluFdcSdL(gt2,i1)
coupR = cplGluFdcSdR(gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 4._dp/3._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
End Do 
 

 
! ----------------------------------------------
! Sd, hh
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 3
m1out = MSd(gt1)
m2out = Mhh(gt2)
coup = cplhhSdcSd(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Su, Hpm
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=2, 2
m1out = MSu(gt1)
m2out = MHpm(gt2)
coup = cplHpmSucSd(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Sd, VZ
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSd(gt1)
m2out = MVZ
coup = cplSdcSdVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Su, VWm
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSu(gt1)
m2out = MVWm
coup = cplSucSdVWm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Sd, VG
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSd(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Sd, VP
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSd(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine SdTwoBodyDecay
 
 
Subroutine SuTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplAhSucSu(3,6,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplcChaFdcSuL(2,3,6),       & 
& cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSucSu(3,6,6),            & 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVZ(6,6)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'SuTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 6
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.6) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MSu(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Su_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplAhSucSu,cplChiFucSuL,           & 
& cplChiFucSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,         & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Su, Ah
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=2, 3
m1out = MSu(gt1)
m2out = MAh(gt2)
coup = cplAhSucSu(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fu, Chi
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 5
m1out = MFu(gt1)
m2out = MChi(gt2)
coupL = cplChiFucSuL(gt2,gt1,i1)
coupR = cplChiFucSuR(gt2,gt1,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Cha], Fd
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 3
m1out = MCha(gt1)
m2out = MFd(gt2)
coupL = cplcChaFdcSuL(gt1,gt2,i1)
coupR = cplcChaFdcSuR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Glu, Fu
! ----------------------------------------------

 
  Do gt2=1, 3
m1out = MGlu
m2out = MFu(gt2)
coupL = cplGluFucSuL(gt2,i1)
coupR = cplGluFucSuR(gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 4._dp/3._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
End Do 
 

 
! ----------------------------------------------
! Su, hh
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 3
m1out = MSu(gt1)
m2out = Mhh(gt2)
coup = cplhhSucSu(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Hpm], Sd
! ----------------------------------------------

 
Do gt1= 2, 2
  Do gt2=1, 6
m1out = MHpm(gt1)
m2out = MSd(gt2)
coup = cplSdcHpmcSu(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Sd, conj[VWm]
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSd(gt1)
m2out = MVWm
coup = cplSdcSucVWm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Su, VZ
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSu(gt1)
m2out = MVZ
coup = cplSucSuVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Su, VG
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSu(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Su, VP
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSu(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine SuTwoBodyDecay
 
 
Subroutine SeTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplAhSecSe(3,6,6),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),cplChiFecSeL(5,3,6),        & 
& cplChiFecSeR(5,3,6),cplhhSecSe(3,6,6),cplHpmSvImcSe(2,9,6),cplHpmSvRecSe(2,9,6),       & 
& cplSecSeVZ(6,6),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'SeTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 6
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.6) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MSe(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Se_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplAhSecSe,cplFvChacSeL,           & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Se, Ah
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=2, 3
m1out = MSe(gt1)
m2out = MAh(gt2)
coup = cplAhSecSe(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Cha
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 2
m1out = MFv(gt1)
m2out = MCha(gt2)
coupL = cplFvChacSeL(gt1,gt2,i1)
coupR = cplFvChacSeR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, Chi
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 5
m1out = MFe(gt1)
m2out = MChi(gt2)
coupL = cplChiFecSeL(gt2,gt1,i1)
coupR = cplChiFecSeR(gt2,gt1,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Se, hh
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 3
m1out = MSe(gt1)
m2out = Mhh(gt2)
coup = cplhhSecSe(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvIm, Hpm
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=2, 2
m1out = MSvIm(gt1)
m2out = MHpm(gt2)
coup = cplHpmSvImcSe(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, Hpm
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=2, 2
m1out = MSvRe(gt1)
m2out = MHpm(gt2)
coup = cplHpmSvRecSe(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Se, VZ
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSe(gt1)
m2out = MVZ
coup = cplSecSeVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvIm, VWm
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvIm(gt1)
m2out = MVWm
coup = cplSvImcSeVWm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvRe, VWm
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvRe(gt1)
m2out = MVWm
coup = cplSvRecSeVWm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Se, VP
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSe(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine SeTwoBodyDecay
 
 
Subroutine SvImTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),& 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),   & 
& cplHpmSvImcSe(2,9,6),cplSeSvImcVWm(6,9),cplSvImSvReVZ(9,9)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'SvImTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 9
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.9) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,9

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,9

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MSvIm(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_SvIm_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplhhSvImSvIm,               & 
& cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcVWm,cplSvImSvReVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! SvIm, Ah
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=2, 3
m1out = MSvIm(gt1)
m2out = MAh(gt2)
coup = cplAhSvImSvIm(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, Ah
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=2, 3
m1out = MSvRe(gt1)
m2out = MAh(gt2)
coup = cplAhSvImSvRe(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Cha
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 2
m1out = MFe(gt1)
m2out = MCha(gt2)
coupL = cplcFeChaSvImL(gt1,gt2,i1)
coupR = cplcFeChaSvImR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Chi
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 5
m1out = MFv(gt1)
m2out = MChi(gt2)
coupL = cplChiFvSvImL(gt2,gt1,i1)
coupR = cplChiFvSvImR(gt2,gt1,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvIm, hh
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 3
m1out = MSvIm(gt1)
m2out = Mhh(gt2)
coup = cplhhSvImSvIm(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, hh
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 3
m1out = MSvRe(gt1)
m2out = Mhh(gt2)
coup = cplhhSvImSvRe(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Se], Hpm
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=2, 2
m1out = MSe(gt1)
m2out = MHpm(gt2)
coup = cplHpmSvImcSe(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Se, conj[VWm]
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSe(gt1)
m2out = MVWm
coup = cplSeSvImcVWm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvRe, VZ
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvRe(gt1)
m2out = MVZ
coup = cplSvImSvReVZ(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvIm, VP
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvIm(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvIm, VZ
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvIm(gt1)
m2out = MVZ
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvRe, VP
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvRe(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine SvImTwoBodyDecay
 
 
Subroutine SvReTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),   & 
& cplHpmSvRecSe(2,9,6),cplSeSvRecVWm(6,9),cplSvImSvReVZ(9,9)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'SvReTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 9
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.9) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,9

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,9

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MSvRe(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_SvRe_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplAhSvImSvRe,cplAhSvReSvRe,       & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplhhSvImSvRe,               & 
& cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecVWm,cplSvImSvReVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! SvIm, Ah
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=2, 3
m1out = MSvIm(gt1)
m2out = MAh(gt2)
coup = cplAhSvImSvRe(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, Ah
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=2, 3
m1out = MSvRe(gt1)
m2out = MAh(gt2)
coup = cplAhSvReSvRe(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Cha
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 2
m1out = MFe(gt1)
m2out = MCha(gt2)
coupL = cplcFeChaSvReL(gt1,gt2,i1)
coupR = cplcFeChaSvReR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Chi
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 5
m1out = MFv(gt1)
m2out = MChi(gt2)
coupL = cplChiFvSvReL(gt2,gt1,i1)
coupR = cplChiFvSvReR(gt2,gt1,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvIm, hh
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 3
m1out = MSvIm(gt1)
m2out = Mhh(gt2)
coup = cplhhSvImSvRe(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! SvRe, hh
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 3
m1out = MSvRe(gt1)
m2out = Mhh(gt2)
coup = cplhhSvReSvRe(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Se], Hpm
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=2, 2
m1out = MSe(gt1)
m2out = MHpm(gt2)
coup = cplHpmSvRecSe(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Se, conj[VWm]
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MSe(gt1)
m2out = MVWm
coup = cplSeSvRecVWm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvIm, VZ
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvIm(gt1)
m2out = MVZ
coup = cplSvImSvReVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvIm, VP
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvIm(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvRe, VP
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvRe(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! SvRe, VZ
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MSvRe(gt1)
m2out = MVZ
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine SvReTwoBodyDecay
 
 
Subroutine ChiTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),  & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),       & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),           & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'ChiTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 5
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.5) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,5

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,5

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MChi(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Chi_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplChiChiAhL,cplChiChiAhR,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,              & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,         & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Chi, Ah
! ----------------------------------------------

 
Do gt1= 1, 5
  Do gt2=2, 3
m1out = MChi(gt1)
m2out = MAh(gt2)
coupL = cplChiChiAhL(i1,gt1,gt2)
coupR = cplChiChiAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Cha, conj[Hpm]
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=2, 2
m1out = MCha(gt1)
m2out = MHpm(gt2)
coupL = cplChiChacHpmL(i1,gt1,gt2)
coupR = cplChiChacHpmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Cha, conj[VWm]
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MCha(gt1)
m2out = MVWm
coupL = cplChiChacVWmL(i1,gt1)
coupR = cplChiChacVWmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Chi, hh
! ----------------------------------------------

 
Do gt1= 1, 5
  Do gt2=1, 3
m1out = MChi(gt1)
m2out = Mhh(gt2)
coupL = cplChiChihhL(i1,gt1,gt2)
coupR = cplChiChihhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Chi, VZ
! ----------------------------------------------

 
Do gt1= 1, 5
m1out = MChi(gt1)
m2out = MVZ
coupL = cplChiChiVZL(i1,gt1)
coupR = cplChiChiVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, conj[Sd]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFd(gt1)
m2out = MSd(gt2)
coupL = cplChiFdcSdL(i1,gt1,gt2)
coupR = cplChiFdcSdR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 6*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, conj[Se]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFe(gt1)
m2out = MSe(gt2)
coupL = cplChiFecSeL(i1,gt1,gt2)
coupR = cplChiFecSeR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fu, conj[Su]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFu(gt1)
m2out = MSu(gt2)
coupL = cplChiFucSuL(i1,gt1,gt2)
coupR = cplChiFucSuR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 6*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, SvIm
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 9
m1out = MFv(gt1)
m2out = MSvIm(gt2)
coupL = cplChiFvSvImL(i1,gt1,gt2)
coupR = cplChiFvSvImR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, SvRe
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 9
m1out = MFv(gt1)
m2out = MSvRe(gt2)
coupL = cplChiFvSvReL(i1,gt1,gt2)
coupR = cplChiFvSvReR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Chi, VP
! ----------------------------------------------

 
Do gt1= 1, 5
m1out = MChi(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Glu, VG
! ----------------------------------------------

 
m1out = MGlu
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine ChiTwoBodyDecay
 
 
Subroutine ChaTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),     & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'ChaTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 2
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.2) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,2

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,2

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MCha(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Cha_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,  & 
& cplcChacFuSdR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Cha, Ah
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=2, 3
m1out = MCha(gt1)
m2out = MAh(gt2)
coupL = cplcChaChaAhL(i1,gt1,gt2)
coupR = cplcChaChaAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Cha, hh
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 3
m1out = MCha(gt1)
m2out = Mhh(gt2)
coupL = cplcChaChahhL(i1,gt1,gt2)
coupR = cplcChaChahhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Cha, VZ
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MCha(gt1)
m2out = MVZ
coupL = cplcChaChaVZL(i1,gt1)
coupR = cplcChaChaVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Chi, Hpm
! ----------------------------------------------

 
Do gt1= 1, 5
  Do gt2=2, 2
m1out = MChi(gt1)
m2out = MHpm(gt2)
coupL = cplcChaChiHpmL(i1,gt1,gt2)
coupR = cplcChaChiHpmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Chi, VWm
! ----------------------------------------------

 
Do gt1= 1, 5
m1out = MChi(gt1)
m2out = MVWm
coupL = cplcChaChiVWmL(i1,gt1)
coupR = cplcChaChiVWmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, conj[Su]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFd(gt1)
m2out = MSu(gt2)
coupL = cplcChaFdcSuL(i1,gt1,gt2)
coupR = cplcChaFdcSuR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, SvIm
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 9
m1out = MFe(gt1)
m2out = MSvIm(gt2)
coupL = cplcChaFeSvImL(i1,gt1,gt2)
coupR = cplcChaFeSvImR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, SvRe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 9
m1out = MFe(gt1)
m2out = MSvRe(gt2)
coupL = cplcChaFeSvReL(i1,gt1,gt2)
coupR = cplcChaFeSvReR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Se
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 6
m1out = MFv(gt1)
m2out = MSe(gt2)
coupL = cplcChaFvSeL(i1,gt1,gt2)
coupR = cplcChaFvSeR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Sd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFu(gt1)
m2out = MSd(gt2)
coupL = cplcChacFuSdL(i1,gt1,gt2)
coupR = cplcChacFuSdR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Cha, VP
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MCha(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine ChaTwoBodyDecay
 
 
Subroutine GluTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'GluTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MGlu 
Call CouplingsFor_Glu_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fd, conj[Sd]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFd(gt1)
m2out = MSd(gt2)
coupL = cplGluFdcSdL(gt1,gt2)
coupR = cplGluFdcSdR(gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fu, conj[Su]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFu(gt1)
m2out = MSu(gt2)
coupL = cplGluFucSuL(gt1,gt2)
coupR = cplGluFucSuR(gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Chi, VG
! ----------------------------------------------

 
Do gt1= 1, 5
m1out = MChi(gt1)
m2out = 0.
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Glu, Ah
! ----------------------------------------------

 
  Do gt2=2, 3
m1out = MGlu
m2out = MAh(gt2)
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
End Do 
 

 
! ----------------------------------------------
! Glu, hh
! ----------------------------------------------

 
  Do gt2=1, 3
m1out = MGlu
m2out = Mhh(gt2)
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
End Do 
 

 
! ----------------------------------------------
! Glu, VG
! ----------------------------------------------

 
m1out = MGlu
m2out = 0.
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Glu, VP
! ----------------------------------------------

 
m1out = MGlu
m2out = 0.
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Glu, VZ
! ----------------------------------------------

 
m1out = MGlu
m2out = MVZ
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine GluTwoBodyDecay
 
 
Subroutine FvTwoBodyDecay(i_in,deltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS,MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),              & 
& MChi2(5),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,             & 
& MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),            & 
& MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),        & 
& ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3,pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),       & 
& ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),         & 
& ZVR(9,9),ZW(2,2)

Complex(dp) :: cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),          & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),           & 
& cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FvTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 9
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.9) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,9

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,9

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFv(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fv_decays_2B(m_in,i1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,              & 
& UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,              & 
& g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,             & 
& cplFvFvVZL,cplFvFvVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fv, Ah
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=2, 3
m1out = MFv(gt1)
m2out = MAh(gt2)
coupL = cplFvFvAhL(i1,gt1,gt2)
coupR = cplFvFvAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Cha, conj[Se]
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 6
m1out = MCha(gt1)
m2out = MSe(gt2)
coupL = cplFvChacSeL(i1,gt1,gt2)
coupR = cplFvChacSeR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Chi, SvIm
! ----------------------------------------------

 
Do gt1= 1, 5
  Do gt2=1, 9
m1out = MChi(gt1)
m2out = MSvIm(gt2)
coupL = cplChiFvSvImL(gt1,i1,gt2)
coupR = cplChiFvSvImR(gt1,i1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Chi, SvRe
! ----------------------------------------------

 
Do gt1= 1, 5
  Do gt2=1, 9
m1out = MChi(gt1)
m2out = MSvRe(gt2)
coupL = cplChiFvSvReL(gt1,i1,gt2)
coupR = cplChiFvSvReR(gt1,i1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, conj[Hpm]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=2, 2
m1out = MFe(gt1)
m2out = MHpm(gt2)
coupL = cplFvFecHpmL(i1,gt1,gt2)
coupR = cplFvFecHpmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, conj[VWm]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVWm
coupL = cplFvFecVWmL(i1,gt1)
coupR = cplFvFecVWmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, hh
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 3
m1out = MFv(gt1)
m2out = Mhh(gt2)
coupL = cplFvFvhhL(i1,gt1,gt2)
coupR = cplFvFvhhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, VZ
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MFv(gt1)
m2out = MVZ
coupL = cplFvFvVZL(i1,gt1)
coupR = cplFvFvVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, VP
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MFv(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FvTwoBodyDecay
 
 
Subroutine ScalarToTwoVectorbosonsNew(mS,mV1,mV2,coup,width)
  implicit none
   real(dp), intent(in) :: mS,mV1,mV2
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coup

   real(dp) :: mSsq,mV1sq, mV2sq,kappa

   if ( abs(mS).le.( abs(mV1)+abs(mV2) ) ) then
    width = 0._dp

   elseif (mV1.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V1 = 0, setting width to 0'
    width = 0._dp

   elseif (mV2.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V2 = 0, setting width to 0'
    width = 0._dp


   elseif (Abs(coup).eq.0._dp) then
    width = 0._dp

   else
    mSsq = mS * mS
    mV1sq = mV1**2
    mV2sq = mV2**2
    kappa = Sqrt( (mSsq-mV1sq-mV2sq)**2 - 4._dp * mV1sq*mV2sq )/(mS**3)
    width = coup**2/(4._dp*mV1sq*mV2sq)*(mV1sq**2 + 10._dp*mV1sq*mV2sq - &
             & 2._dp*(mV1sq+mV2sq)*mSsq + mV2sq**2 +mSsq**2)
    width = oo16Pi*width*kappa

   endif

  End Subroutine ScalarToTwoVectorbosonsNew

Subroutine FermionToFermionVectorBosonMassless(mFin,mFout,mV,coupL,coupR,width)
  implicit none
   real(dp), intent(in) :: mFin,mFout,mV
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coupL, coupR


   if ( abs(mFin).le.( abs(mFout)+abs(mV) ) ) then
    width = 0._dp

   else

    width = 0.5_dp*oo16Pi*(Abs(coupL)**2 + Abs(coupR)**2)*mFin**3


   endif

  End Subroutine FermionToFermionVectorBosonMassless

End Module TreeLevelDecays_NInvSeesaw 
 
