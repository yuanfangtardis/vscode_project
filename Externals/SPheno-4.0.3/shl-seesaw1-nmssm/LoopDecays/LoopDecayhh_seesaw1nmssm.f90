! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:29 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_hh_seesaw1nmssm
Use Control 
Use Settings 
Use LoopFunctions 
Use AddLoopFunctions 
Use Model_Data_seesaw1nmssm 
Use DecayFFS 
Use DecayFFV 
Use DecaySSS 
Use DecaySFF 
Use DecaySSV 
Use DecaySVV 
Use Bremsstrahlung 

Contains 

Subroutine Amplitude_Tree_seesaw1nmssm_hhToAhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),Mhh(3),MAh2(3),Mhh2(3)

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3)

Complex(dp) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhAhhh(gt2,gt3,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhToAhAh


Subroutine Gamma_Real_seesaw1nmssm_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAh,              & 
& Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3)

Real(dp), Intent(in) :: MAh(3),Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=2,3
    Do i3=2,3
Coup = cplAhAhhh(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MAh(i2)
Mex3 = MAh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhToAhAh


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToAhAh(cplAhAhhh,ctcplAhAhhh,MAh,            & 
& MAh2,Mhh,Mhh2,ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3)

Complex(dp), Intent(in) :: ctcplAhAhhh(3,3,3)

Complex(dp), Intent(in) :: ZfAh(3,3),Zfhh(3,3)

Complex(dp), Intent(out) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhAhhh(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhAhhh(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt2)*cplAhAhhh(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhAhhh(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToAhAh


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToAhAh(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,         & 
& cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,         & 
& cplAhAhSvReSvRe1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhHpmcHpm1,            & 
& cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,         & 
& cplAhhhSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFeFehhL(3,3,3),          & 
& cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplFvFvhhL(6,6,3),            & 
& cplFvFvhhR(6,6,3),cplcgWmgWmhh(3),cplcgWpCgWpChh(3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),& 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplAhAhAhAh1(3,3,3,3),cplAhAhAhhh1(3,3,3,3),              & 
& cplAhAhhhhh1(3,3,3,3),cplAhAhHpmcHpm1(3,3,2,2),cplAhAhSdcSdaa(3,3,6,6),cplAhAhSecSe1(3,3,6,6),& 
& cplAhAhSucSuaa(3,3,6,6),cplAhAhSvImSvIm1(3,3,6,6),cplAhAhSvImSvRe1(3,3,6,6),           & 
& cplAhAhSvReSvRe1(3,3,6,6),cplAhAhcVWmVWm1(3,3),cplAhAhVZVZ1(3,3),cplAhhhhhhh1(3,3,3,3),& 
& cplAhhhHpmcHpm1(3,3,2,2),cplAhhhSdcSdaa(3,3,6,6),cplAhhhSecSe1(3,3,6,6),               & 
& cplAhhhSucSuaa(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),           & 
& cplAhhhSvReSvRe1(3,3,6,6)

Complex(dp), Intent(out) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 


! {Ah, Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhAh(gt2,i1,i3)
coup3 = cplAhAhAh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Ah}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhAhAh(gt2,i1,i3)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, hh}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplAhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplAhhhVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaChaAhL(i1,i3,gt2)
coup2R = cplcChaChaAhR(i1,i3,gt2)
coup3L = cplcChaChaAhL(i3,i2,gt3)
coup3R = cplcChaChaAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Chi}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,5
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiChiAhL(i1,i3,gt2)
coup2R = cplChiChiAhR(i1,i3,gt2)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3,gt2)
coup2R = cplcFdFdAhR(i1,i3,gt2)
coup3L = cplcFdFdAhL(i3,i2,gt3)
coup3R = cplcFdFdAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3,gt2)
coup2R = cplcFeFeAhR(i1,i3,gt2)
coup3L = cplcFeFeAhL(i3,i2,gt3)
coup3R = cplcFeFeAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3,gt2)
coup2R = cplcFuFuAhR(i1,i3,gt2)
coup3L = cplcFuFuAhL(i3,i2,gt3)
coup3R = cplcFuFuAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvAhL(i1,i3,gt2)
coup2R = cplFvFvAhR(i1,i3,gt2)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmAh(gt2)
coup3 = cplcgWmgWmAh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCAh(gt2)
coup3 = cplcgWpCgWpCAh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {hh, Ah, Ah}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplAhAhhh(gt2,i3,i1)
coup3 = cplAhAhAh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(gt2,i3,i1)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, hh}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplAhhhhh(gt2,i1,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(gt2,i1,i3)
coup3 = cplAhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZ(gt2,i1)
coup3 = cplAhhhVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplAhHpmcHpm(gt2,i3,i1)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplAhHpmcHpm(gt2,i3,i1)
coup3 = cplAhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = -cplAhcHpmVWm(gt2,i1)
coup3 = cplAhHpmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplAhSdcSd(gt2,i3,i1)
coup3 = cplAhSdcSd(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplAhSecSe(gt2,i3,i1)
coup3 = cplAhSecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplAhSucSu(gt2,i3,i1)
coup3 = cplAhSucSu(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplAhSvImSvIm(gt2,i1,i3)
coup3 = cplAhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplAhSvImSvIm(gt2,i1,i3)
coup3 = cplAhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplAhSvImSvRe(gt2,i1,i3)
coup3 = cplAhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplAhSvImSvRe(gt2,i1,i3)
coup3 = cplAhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, SvIm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplAhSvImSvRe(gt2,i3,i1)
coup3 = cplAhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, SvIm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplAhSvImSvRe(gt2,i3,i1)
coup3 = cplAhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplAhSvReSvRe(gt2,i1,i3)
coup3 = cplAhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplAhSvReSvRe(gt2,i1,i3)
coup3 = cplAhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = -cplAhHpmcVWm(gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplAhHpmcVWm(gt2,i3)
coup3 = cplAhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = -cplAhhhVZ(gt2,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = -cplAhhhVZ(gt2,i3)
coup3 = cplAhhhVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplAhHpmcHpm(gt2,i1,i3)
coup3 = cplAhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = -cplAhHpmcVWm(gt2,i1)
coup3 = cplAhcHpmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = -cplAhcHpmVWm(gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplAhcHpmVWm(gt2,i3)
coup3 = cplAhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhAhAh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhAhAhhh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhhhh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplAhAhHpmcHpm1(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplAhAhSdcSdaa(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplAhAhSecSe1(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplAhAhSucSuaa(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplAhAhSvImSvIm1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplAhAhSvImSvRe1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplAhAhSvReSvRe1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhAhcVWmVWm1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhAhVZVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAhhh1(gt3,i1,i2,gt1)
coup2 = cplAhAhAh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt3,i1,gt1,i2)
coup2 = cplAhAhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt3,gt1,i1,i2)
coup2 = cplAhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhhhHpmcHpm1(gt3,gt1,i1,i2)
coup2 = cplAhHpmcHpm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplAhhhSdcSdaa(gt3,gt1,i1,i2)
coup2 = cplAhSdcSd(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplAhhhSecSe1(gt3,gt1,i1,i2)
coup2 = cplAhSecSe(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplAhhhSucSuaa(gt3,gt1,i1,i2)
coup2 = cplAhSucSu(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(gt3,gt1,i1,i2)
coup2 = cplAhSvImSvIm(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(gt3,gt1,i1,i2)
coup2 = cplAhSvImSvRe(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvReSvRe1(gt3,gt1,i1,i2)
coup2 = cplAhSvReSvRe(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAhhh1(gt2,i1,i2,gt1)
coup2 = cplAhAhAh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt2,i1,gt1,i2)
coup2 = cplAhAhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt2,gt1,i1,i2)
coup2 = cplAhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhhhHpmcHpm1(gt2,gt1,i1,i2)
coup2 = cplAhHpmcHpm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplAhhhSdcSdaa(gt2,gt1,i1,i2)
coup2 = cplAhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplAhhhSecSe1(gt2,gt1,i1,i2)
coup2 = cplAhSecSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplAhhhSucSuaa(gt2,gt1,i1,i2)
coup2 = cplAhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(gt2,gt1,i1,i2)
coup2 = cplAhSvImSvIm(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(gt2,gt1,i1,i2)
coup2 = cplAhSvImSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvReSvRe1(gt2,gt1,i1,i2)
coup2 = cplAhSvReSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToAhAh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToAhAh(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,         & 
& cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,         & 
& cplAhAhSvReSvRe1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhHpmcHpm1,            & 
& cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,         & 
& cplAhhhSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFeFehhL(3,3,3),          & 
& cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplFvFvhhL(6,6,3),            & 
& cplFvFvhhR(6,6,3),cplcgWmgWmhh(3),cplcgWpCgWpChh(3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),& 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplAhAhAhAh1(3,3,3,3),cplAhAhAhhh1(3,3,3,3),              & 
& cplAhAhhhhh1(3,3,3,3),cplAhAhHpmcHpm1(3,3,2,2),cplAhAhSdcSdaa(3,3,6,6),cplAhAhSecSe1(3,3,6,6),& 
& cplAhAhSucSuaa(3,3,6,6),cplAhAhSvImSvIm1(3,3,6,6),cplAhAhSvImSvRe1(3,3,6,6),           & 
& cplAhAhSvReSvRe1(3,3,6,6),cplAhAhcVWmVWm1(3,3),cplAhAhVZVZ1(3,3),cplAhhhhhhh1(3,3,3,3),& 
& cplAhhhHpmcHpm1(3,3,2,2),cplAhhhSdcSdaa(3,3,6,6),cplAhhhSecSe1(3,3,6,6),               & 
& cplAhhhSucSuaa(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),           & 
& cplAhhhSvReSvRe1(3,3,6,6)

Complex(dp), Intent(out) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToAhAh


Subroutine Amplitude_Tree_seesaw1nmssm_hhTohhAh(cplAhhhhh,MAh,Mhh,MAh2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),Mhh(3),MAh2(3),Mhh2(3)

Complex(dp), Intent(in) :: cplAhhhhh(3,3,3)

Complex(dp) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhhhhh(gt3,gt1,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTohhAh


Subroutine Gamma_Real_seesaw1nmssm_hhTohhAh(MLambda,em,gs,cplAhhhhh,MAh,              & 
& Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhhh(3,3,3)

Real(dp), Intent(in) :: MAh(3),Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=1,3
    Do i3=2,3
Coup = cplAhhhhh(i3,i1,i2)
Mex1 = Mhh(i1)
Mex2 = Mhh(i2)
Mex3 = MAh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTohhAh


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTohhAh(cplAhhhhh,ctcplAhhhhh,MAh,            & 
& MAh2,Mhh,Mhh2,ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplAhhhhh(3,3,3)

Complex(dp), Intent(in) :: ctcplAhhhhh(3,3,3)

Complex(dp), Intent(in) :: ZfAh(3,3),Zfhh(3,3)

Complex(dp), Intent(out) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhhh(gt3,gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhhh(gt3,i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplAhhhhh(gt3,gt1,i1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhhhhh(i1,gt1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTohhAh


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTohhAh(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplAhAhAhhh1,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,    & 
& cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,       & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFeFehhL(3,3,3),          & 
& cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplFvFvhhL(6,6,3),            & 
& cplFvFvhhR(6,6,3),cplcgWmgWmhh(3),cplcgWpCgWpChh(3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),& 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplAhAhAhhh1(3,3,3,3),cplAhAhhhhh1(3,3,3,3),cplAhhhhhhh1(3,3,3,3),     & 
& cplAhhhHpmcHpm1(3,3,2,2),cplAhhhSdcSdaa(3,3,6,6),cplAhhhSecSe1(3,3,6,6),               & 
& cplAhhhSucSuaa(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),           & 
& cplAhhhSvReSvRe1(3,3,6,6),cplhhhhhhhh1(3,3,3,3),cplhhhhHpmcHpm1(3,3,2,2),              & 
& cplhhhhSdcSdaa(3,3,6,6),cplhhhhSecSe1(3,3,6,6),cplhhhhSucSuaa(3,3,6,6),cplhhhhSvImSvIm1(3,3,6,6),& 
& cplhhhhSvImSvRe1(3,3,6,6),cplhhhhSvReSvRe1(3,3,6,6)

Complex(dp), Intent(out) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh(gt3) 


! {Ah, Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = cplAhAhAh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Ah}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhhh(i1,gt2,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, hh}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhhh(i1,gt2,i3)
coup3 = cplAhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhhhhh(i1,gt2,i3)
coup3 = cplAhhhVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, hh, VZ}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhVZ(i1,gt2)
coup3 = cplAhhhVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaChahhL(i1,i3,gt2)
coup2R = cplcChaChahhR(i1,i3,gt2)
coup3L = cplcChaChaAhL(i3,i2,gt3)
coup3R = cplcChaChaAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Chi}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,5
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiChihhL(i1,i3,gt2)
coup2R = cplChiChihhR(i1,i3,gt2)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = cplcFdFdAhL(i3,i2,gt3)
coup3R = cplcFdFdAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = cplcFeFeAhL(i3,i2,gt3)
coup3R = cplcFeFeAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = cplcFuFuAhL(i3,i2,gt3)
coup3R = cplcFuFuAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvhhL(i1,i3,gt2)
coup2R = cplFvFvhhR(i1,i3,gt2)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmhh(gt2)
coup3 = cplcgWmgWmAh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpChh(gt2)
coup3 = cplcgWpCgWpCAh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {hh, Ah, Ah}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplAhhhhh(i3,gt2,i1)
coup3 = cplAhAhAh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(i3,gt2,i1)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, hh}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplhhHpmcHpm(gt2,i3,i1)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplhhHpmcHpm(gt2,i3,i1)
coup3 = cplAhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = -cplhhcHpmVWm(gt2,i1)
coup3 = cplAhHpmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplhhSdcSd(gt2,i3,i1)
coup3 = cplAhSdcSd(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplhhSecSe(gt2,i3,i1)
coup3 = cplAhSecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplhhSucSu(gt2,i3,i1)
coup3 = cplAhSucSu(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplhhSvImSvIm(gt2,i1,i3)
coup3 = cplAhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvIm(gt2,i1,i3)
coup3 = cplAhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i1,i3)
coup3 = cplAhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i1,i3)
coup3 = cplAhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, SvIm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplhhSvImSvRe(gt2,i3,i1)
coup3 = cplAhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, SvIm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i3,i1)
coup3 = cplAhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplhhSvReSvRe(gt2,i1,i3)
coup3 = cplAhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplhhSvReSvRe(gt2,i1,i3)
coup3 = cplAhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = -cplhhHpmcVWm(gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhHpmcVWm(gt2,i3)
coup3 = cplAhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplAhHpmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, Ah, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = cplAhAhAh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplhhHpmcHpm(gt2,i1,i3)
coup3 = cplAhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = -cplhhHpmcVWm(gt2,i1)
coup3 = cplAhcHpmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = -cplhhcHpmVWm(gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhcHpmVWm(gt2,i3)
coup3 = cplAhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplAhcHpmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhAhhh1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhAhhhhh1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhhhh1(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplAhhhHpmcHpm1(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplAhhhSdcSdaa(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplAhhhSecSe1(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplAhhhSucSuaa(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplAhhhSvImSvIm1(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplAhhhSvImSvRe1(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplAhhhSvReSvRe1(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAhhh1(gt3,i1,i2,gt1)
coup2 = cplAhAhhh(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt3,i1,gt1,i2)
coup2 = cplAhhhhh(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt3,gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhhhHpmcHpm1(gt3,gt1,i1,i2)
coup2 = cplhhHpmcHpm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplAhhhSdcSdaa(gt3,gt1,i1,i2)
coup2 = cplhhSdcSd(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplAhhhSecSe1(gt3,gt1,i1,i2)
coup2 = cplhhSecSe(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplAhhhSucSuaa(gt3,gt1,i1,i2)
coup2 = cplhhSucSu(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(gt3,gt1,i1,i2)
coup2 = cplhhSvImSvIm(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(gt3,gt1,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvReSvRe1(gt3,gt1,i1,i2)
coup2 = cplhhSvReSvRe(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhhhh1(i1,i2,gt1,gt2)
coup2 = cplAhAhAh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(i1,gt1,gt2,i2)
coup2 = cplAhAhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhhh1(gt1,gt2,i1,i2)
coup2 = cplAhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhhhHpmcHpm1(gt1,gt2,i1,i2)
coup2 = cplAhHpmcHpm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhhhSdcSdaa(gt1,gt2,i1,i2)
coup2 = cplAhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhhhSecSe1(gt1,gt2,i1,i2)
coup2 = cplAhSecSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhhhSucSuaa(gt1,gt2,i1,i2)
coup2 = cplAhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvIm1(gt1,gt2,i1,i2)
coup2 = cplAhSvImSvIm(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvImSvRe1(gt1,gt2,i1,i2)
coup2 = cplAhSvImSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvReSvRe1(gt1,gt2,i1,i2)
coup2 = cplAhSvReSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTohhAh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTohhAh(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplAhAhAhhh1,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,    & 
& cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,       & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFeFehhL(3,3,3),          & 
& cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplFvFvhhL(6,6,3),            & 
& cplFvFvhhR(6,6,3),cplcgWmgWmhh(3),cplcgWpCgWpChh(3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),& 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplAhAhAhhh1(3,3,3,3),cplAhAhhhhh1(3,3,3,3),cplAhhhhhhh1(3,3,3,3),     & 
& cplAhhhHpmcHpm1(3,3,2,2),cplAhhhSdcSdaa(3,3,6,6),cplAhhhSecSe1(3,3,6,6),               & 
& cplAhhhSucSuaa(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),           & 
& cplAhhhSvReSvRe1(3,3,6,6),cplhhhhhhhh1(3,3,3,3),cplhhhhHpmcHpm1(3,3,2,2),              & 
& cplhhhhSdcSdaa(3,3,6,6),cplhhhhSecSe1(3,3,6,6),cplhhhhSucSuaa(3,3,6,6),cplhhhhSvImSvIm1(3,3,6,6),& 
& cplhhhhSvImSvRe1(3,3,6,6),cplhhhhSvReSvRe1(3,3,6,6)

Complex(dp), Intent(out) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTohhAh


Subroutine Amplitude_Tree_seesaw1nmssm_hhToAhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,           & 
& Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),Mhh(3),MVZ,MAh2(3),Mhh2(3),MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplAhhhVZ(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhToAhVZ


Subroutine Gamma_Real_seesaw1nmssm_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAh,              & 
& Mhh,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhVZ(3,3)

Real(dp), Intent(in) :: MAh(3),Mhh(3),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=2,3
Coup = cplAhhhVZ(i2,i1)
Mex1 = Mhh(i1)
Mex2 = MAh(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2) = 0._dp 
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhToAhVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToAhVZ(cplAhhhVZ,ctcplAhhhVZ,MAh,            & 
& MAh2,Mhh,Mhh2,MVZ,MVZ2,ZfAh,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3)

Complex(dp), Intent(in) :: ctcplAhhhVZ(3,3)

Complex(dp), Intent(in) :: ZfAh(3,3),Zfhh(3,3),ZfVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhVZ(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhVZ(gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt2)*cplAhhhVZ(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplAhhhVZ(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToAhVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,     & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,           & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,             & 
& cplhhcHpmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),          & 
& cplChiChiVZR(5,5),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),              & 
& cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),               & 
& cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),               & 
& cplcFuFuVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),  & 
& cplcgWmgWmhh(3),cplcgWmgWmVZ,cplcgWpCgWpChh(3),cplcgWpCgWpCVZ,cplhhhhhh(3,3,3),        & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),      & 
& cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),    & 
& cplcVWmVWmVZ,cplAhAhVZVZ1(3,3),cplAhHpmcVWmVZ1(3,2),cplAhcHpmVWmVZ1(3,2),              & 
& cplhhhhVZVZ1(3,3),cplhhHpmcVWmVZ1(3,2),cplhhcHpmVWmVZ1(3,2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZ 


! {Ah, hh, Ah}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhAhAh(gt2,i1,i3)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaChaAhL(i1,i3,gt2)
coup2R = cplcChaChaAhR(i1,i3,gt2)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Chi}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,5
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiChiAhL(i1,i3,gt2)
coup2R = cplChiChiAhR(i1,i3,gt2)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3,gt2)
coup2R = cplcFdFdAhR(i1,i3,gt2)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3,gt2)
coup2R = cplcFeFeAhR(i1,i3,gt2)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3,gt2)
coup2R = cplcFuFuAhR(i1,i3,gt2)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvAhL(i1,i3,gt2)
coup2R = cplFvFvAhR(i1,i3,gt2)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmAh(gt2)
coup3 = cplcgWmgWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCAh(gt2)
coup3 = cplcgWpCgWpCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(gt2,i3,i1)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, hh}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplAhhhhh(gt2,i1,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVZ(gt2,i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplAhHpmcHpm(gt2,i3,i1)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplAhHpmcHpm(gt2,i3,i1)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplAhcHpmVWm(gt2,i1)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplAhcHpmVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplAhSdcSd(gt2,i3,i1)
coup3 = -cplSdcSdVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplAhSecSe(gt2,i3,i1)
coup3 = -cplSecSeVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplAhSucSu(gt2,i3,i1)
coup3 = -cplSucSuVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplAhSvImSvIm(gt2,i1,i3)
coup3 = cplSvImSvReVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplAhSvImSvRe(gt2,i1,i3)
coup3 = -cplSvImSvReVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, SvIm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplAhSvImSvRe(gt2,i3,i1)
coup3 = cplSvImSvReVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplAhSvReSvRe(gt2,i1,i3)
coup3 = -cplSvImSvReVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplAhHpmcVWm(gt2,i3)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhHpmcVWm(gt2,i3)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplAhHpmcHpm(gt2,i1,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplAhHpmcVWm(gt2,i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplAhHpmcVWm(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplAhcHpmVWm(gt2,i3)
coup3 = cplHpmcHpmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhcHpmVWm(gt2,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhAhVZVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = cplAhcHpmVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = cplAhHpmcVWmVZ1(gt2,i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplAhhhVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVZ1(gt1,i1)
coup2 = cplAhcHpmVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWmVZ1(gt1,i2)
coup2 = cplAhHpmcVWm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToAhVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToAhVZ(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,     & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,           & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,             & 
& cplhhcHpmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),          & 
& cplChiChiVZR(5,5),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),              & 
& cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),               & 
& cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),               & 
& cplcFuFuVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),  & 
& cplcgWmgWmhh(3),cplcgWmgWmVZ,cplcgWpCgWpChh(3),cplcgWpCgWpCVZ,cplhhhhhh(3,3,3),        & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),      & 
& cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),    & 
& cplcVWmVWmVZ,cplAhAhVZVZ1(3,3),cplAhHpmcVWmVZ1(3,2),cplAhcHpmVWmVZ1(3,2),              & 
& cplhhhhVZVZ1(3,3),cplhhHpmcVWmVZ1(3,2),cplhhcHpmVWmVZ1(3,2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToAhVZ


Subroutine Amplitude_Tree_seesaw1nmssm_hhTocChaCha(cplcChaChahhL,cplcChaChahhR,       & 
& MCha,Mhh,MCha2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),Mhh(3),MCha2(2),Mhh2(3)

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3)

Complex(dp) :: Amp(2,3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MCha(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaChahhL(gt2,gt3,gt1)
coupT1R = cplcChaChahhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTocChaCha


Subroutine Gamma_Real_seesaw1nmssm_hhTocChaCha(MLambda,em,gs,cplcChaChahhL,           & 
& cplcChaChahhR,MCha,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3)

Real(dp), Intent(in) :: MCha(2),Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,2,2), GammarealGluon(3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
CoupL = cplcChaChahhL(i2,i3,i1)
CoupR = cplcChaChahhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MCha(i2)
Mex3 = MCha(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTocChaCha


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocChaCha(cplcChaChahhL,cplcChaChahhR,       & 
& ctcplcChaChahhL,ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3)

Complex(dp), Intent(in) :: ctcplcChaChahhL(2,2,3),ctcplcChaChahhR(2,2,3)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfLm(2,2),ZfLp(2,2)

Complex(dp), Intent(out) :: Amp(2,3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MCha(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChahhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcChaChahhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcChaChahhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcChaChahhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt2)*cplcChaChahhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt2))*cplcChaChahhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt3)*cplcChaChahhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt3))*cplcChaChahhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocChaCha


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocChaCha(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,              & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,         & 
& cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplAhhhhh(3,3,3),          & 
& cplAhhhVZ(3,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),        & 
& cplChiChacVWmR(5,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),       & 
& cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),     & 
& cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6), & 
& cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcChaChiHpmL(2,5,2),      & 
& cplcChaChiHpmR(2,5,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcFdFdhhL(3,3,3),      & 
& cplcFdFdhhR(3,3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFeFehhL(3,3,3),       & 
& cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplFvFvhhL(6,6,3),         & 
& cplFvFvhhR(6,6,3),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhhhhh(3,3,3),            & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MCha(gt3) 


! {Ah, Ah, Cha}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MCha(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplcChaChaAhL(gt2,i3,i1)
coup2R = cplcChaChaAhR(gt2,i3,i1)
coup3L = cplcChaChaAhL(i3,gt3,i2)
coup3R = cplcChaChaAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Cha}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MCha(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2L = cplcChaChaAhL(gt2,i3,i1)
coup2R = cplcChaChaAhR(gt2,i3,i1)
coup3L = cplcChaChahhL(i3,gt3,i2)
coup3R = cplcChaChahhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Cha}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopCha)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MCha(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplcChaChaAhL(gt2,i3,i1)
coup2R = cplcChaChaAhR(gt2,i3,i1)
coup3L = cplcChaChaVZL(i3,gt3)
coup3R = cplcChaChaVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Chi, Chi, Hpm}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopHpm)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplcChaChiHpmL(gt2,i1,i3)
coup2R = cplcChaChiHpmR(gt2,i1,i3)
coup3L = cplChiChacHpmL(i2,gt3,i3)
coup3R = cplChiChacHpmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, VWm}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopVWm)) Then 
Do i1=1,5
  Do i2=1,5
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MVWm 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplcChaChiVWmL(gt2,i1)
coup2R = cplcChaChiVWmR(gt2,i1)
coup3L = cplChiChacVWmL(i2,gt3)
coup3R = cplChiChacVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fu, Fu, Sd}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MSd(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcChacFuSdL(gt2,i1,i3)
coup2R = cplcChacFuSdR(gt2,i1,i3)
coup3L = cplChaFucSdL(gt3,i2,i3)
coup3R = cplChaFucSdR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Se}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MSe(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplcChaFvSeL(gt2,i1,i3)
coup2R = cplcChaFvSeR(gt2,i1,i3)
coup3L = cplFvChacSeL(i2,gt3,i3)
coup3R = cplFvChacSeR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, Cha}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MCha(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2L = cplcChaChahhL(gt2,i3,i1)
coup2R = cplcChaChahhR(gt2,i3,i1)
coup3L = cplcChaChaAhL(i3,gt3,i2)
coup3R = cplcChaChaAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Cha}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MCha(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcChaChahhL(gt2,i3,i1)
coup2R = cplcChaChahhR(gt2,i3,i1)
coup3L = cplcChaChahhL(i3,gt3,i2)
coup3R = cplcChaChahhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Fd}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MFd(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2L = cplcChaFdcSuL(gt2,i3,i1)
coup2R = cplcChaFdcSuR(gt2,i3,i1)
coup3L = cplcFdChaSuL(i3,gt3,i2)
coup3R = cplcFdChaSuR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, Fe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2L = cplcChaFeSvImL(gt2,i3,i1)
coup2R = cplcChaFeSvImR(gt2,i3,i1)
coup3L = cplcFeChaSvImL(i3,gt3,i2)
coup3R = cplcFeChaSvImR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Fe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2L = cplcChaFeSvImL(gt2,i3,i1)
coup2R = cplcChaFeSvImR(gt2,i3,i1)
coup3L = cplcFeChaSvReL(i3,gt3,i2)
coup3R = cplcFeChaSvReR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, Fe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2L = cplcChaFeSvReL(gt2,i3,i1)
coup2R = cplcChaFeSvReR(gt2,i3,i1)
coup3L = cplcFeChaSvImL(i3,gt3,i2)
coup3R = cplcFeChaSvImR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Fe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2L = cplcChaFeSvReL(gt2,i3,i1)
coup2R = cplcChaFeSvReR(gt2,i3,i1)
coup3L = cplcFeChaSvReL(i3,gt3,i2)
coup3R = cplcFeChaSvReR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VZ, Ah, Cha}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopCha)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MCha(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplcChaChaVZL(gt2,i3)
coup2R = cplcChaChaVZR(gt2,i3)
coup3L = cplcChaChaAhL(i3,gt3,i2)
coup3R = cplcChaChaAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Cha}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopCha)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = MCha(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcChaChaVZL(gt2,i3)
coup2R = cplcChaChaVZR(gt2,i3)
coup3L = cplcChaChaVZL(i3,gt3)
coup3R = cplcChaChaVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Cha], bar[Cha], Ah}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcChaChaAhL(gt2,i1,i3)
coup2R = cplcChaChaAhR(gt2,i1,i3)
coup3L = cplcChaChaAhL(i2,gt3,i3)
coup3R = cplcChaChaAhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Cha], bar[Cha], hh}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcChaChahhL(gt2,i1,i3)
coup2R = cplcChaChahhR(gt2,i1,i3)
coup3L = cplcChaChahhL(i2,gt3,i3)
coup3R = cplcChaChahhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Cha], bar[Cha], VP}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MVP 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcChaChaVPL(gt2,i1)
coup2R = cplcChaChaVPR(gt2,i1)
coup3L = cplcChaChaVPL(i2,gt3)
coup3R = cplcChaChaVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Cha], bar[Cha], VZ}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MVZ 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcChaChaVZL(gt2,i1)
coup2R = cplcChaChaVZR(gt2,i1)
coup3L = cplcChaChaVZL(i2,gt3)
coup3R = cplcChaChaVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], conj[Su]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MSu(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcChaFdcSuL(gt2,i1,i3)
coup2R = cplcChaFdcSuR(gt2,i1,i3)
coup3L = cplcFdChaSuL(i2,gt3,i3)
coup3R = cplcFdChaSuR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], SvIm}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcChaFeSvImL(gt2,i1,i3)
coup2R = cplcChaFeSvImR(gt2,i1,i3)
coup3L = cplcFeChaSvImL(i2,gt3,i3)
coup3R = cplcFeChaSvImR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], SvRe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcChaFeSvReL(gt2,i1,i3)
coup2R = cplcChaFeSvReR(gt2,i1,i3)
coup3L = cplcFeChaSvReL(i2,gt3,i3)
coup3R = cplcFeChaSvReR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], Chi}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopChi)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,5
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MChi(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2L = cplcChaChiHpmL(gt2,i3,i1)
coup2R = cplcChaChiHpmR(gt2,i3,i1)
coup3L = cplChiChacHpmL(i3,gt3,i2)
coup3R = cplChiChacHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], Chi}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopChi)) Then 
Do i1=1,2
    Do i3=1,5
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MChi(i3) 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2L = cplcChaChiHpmL(gt2,i3,i1)
coup2R = cplcChaChiHpmR(gt2,i3,i1)
coup3L = cplChiChacVWmL(i3,gt3)
coup3R = cplChiChacVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Sd], conj[Sd], bar[Fu]}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MFu(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2L = cplcChacFuSdL(gt2,i3,i1)
coup2R = cplcChacFuSdR(gt2,i3,i1)
coup3L = cplChaFucSdL(gt3,i3,i2)
coup3R = cplChaFucSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], Fv}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2L = cplcChaFvSeL(gt2,i3,i1)
coup2R = cplcChaFvSeR(gt2,i3,i1)
coup3L = cplFvChacSeL(i3,gt3,i2)
coup3R = cplFvChacSeR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], Chi}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopChi)) Then 
  Do i2=1,2
    Do i3=1,5
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MChi(i3) 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2L = cplcChaChiVWmL(gt2,i3)
coup2R = cplcChaChiVWmR(gt2,i3)
coup3L = cplChiChacHpmL(i3,gt3,i2)
coup3R = cplChiChacHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], Chi}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopChi)) Then 
    Do i3=1,5
ML1 = MVWm 
ML2 = MVWm 
ML3 = MChi(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = cplcChaChiVWmL(gt2,i3)
coup2R = cplcChaChiVWmR(gt2,i3)
coup3L = cplChiChacVWmL(i3,gt3)
coup3R = cplChiChacVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocChaCha


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocChaCha(MAh,MCha,MChi,MFd,            & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,              & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,         & 
& cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplAhhhhh(3,3,3),          & 
& cplAhhhVZ(3,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),        & 
& cplChiChacVWmR(5,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),       & 
& cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),     & 
& cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6), & 
& cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcChaChiHpmL(2,5,2),      & 
& cplcChaChiHpmR(2,5,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcFdFdhhL(3,3,3),      & 
& cplcFdFdhhR(3,3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFeFehhL(3,3,3),       & 
& cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplFvFvhhL(6,6,3),         & 
& cplFvFvhhR(6,6,3),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhhhhh(3,3,3),            & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MCha(gt3) 


! {bar[Cha], bar[Cha], VP}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MVP 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcChaChaVPL(gt2,i1)
coup2R = cplcChaChaVPR(gt2,i1)
coup3L = cplcChaChaVPL(i2,gt3)
coup3R = cplcChaChaVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocChaCha


Subroutine Amplitude_Tree_seesaw1nmssm_hhToChiChi(cplChiChihhL,cplChiChihhR,          & 
& MChi,Mhh,MChi2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),Mhh(3),MChi2(5),Mhh2(3)

Complex(dp), Intent(in) :: cplChiChihhL(5,5,3),cplChiChihhR(5,5,3)

Complex(dp) :: Amp(2,3,5,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,5
    Do gt3=1,5
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MChi(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiChihhL(gt2,gt3,gt1)
coupT1R = cplChiChihhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhToChiChi


Subroutine Gamma_Real_seesaw1nmssm_hhToChiChi(MLambda,em,gs,cplChiChihhL,             & 
& cplChiChihhR,MChi,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiChihhL(5,5,3),cplChiChihhR(5,5,3)

Real(dp), Intent(in) :: MChi(5),Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,5,5), GammarealGluon(3,5,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,5
    Do i3=1,5
CoupL = cplChiChihhL(i2,i3,i1)
CoupR = cplChiChihhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MChi(i2)
Mex3 = MChi(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhToChiChi


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToChiChi(cplChiChihhL,cplChiChihhR,          & 
& ctcplChiChihhL,ctcplChiChihhR,MChi,MChi2,Mhh,Mhh2,Zfhh,ZfL0,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),MChi2(5),Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplChiChihhL(5,5,3),cplChiChihhR(5,5,3)

Complex(dp), Intent(in) :: ctcplChiChihhL(5,5,3),ctcplChiChihhR(5,5,3)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfL0(5,5)

Complex(dp), Intent(out) :: Amp(2,3,5,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,5
    Do gt3=1,5
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MChi(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiChihhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplChiChihhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplChiChihhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplChiChihhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,5
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiChihhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiChihhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,5
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt3)*cplChiChihhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt3))*cplChiChihhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToChiChi


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToChiChi(MAh,MCha,MChi,MFd,MFe,            & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplChiChiAhL,cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplAhhhhh(3,3,3),            & 
& cplAhhhVZ(3,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),        & 
& cplChiChacVWmR(5,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),     & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),           & 
& cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),       & 
& cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),  & 
& cplcFdChiSdR(3,5,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),       & 
& cplcFuChiSuR(3,5,6),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcFdFdhhL(3,3,3),        & 
& cplcFdFdhhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),           & 
& cplcFuFuhhR(3,3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),               & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,5,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,5
    Do gt3=1,5
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MChi(gt3) 


! {Ah, Ah, Chi}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,5
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
coup3L = cplChiChiAhL(gt3,i3,i2)
coup3R = cplChiChiAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Chi}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,5
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
coup3L = cplChiChihhL(gt3,i3,i2)
coup3R = cplChiChihhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Chi}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopChi)) Then 
Do i1=1,3
    Do i3=1,5
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MChi(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
coup3L = -cplChiChiVZR(gt3,i3)
coup3R = -cplChiChiVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Cha, Cha, Hpm}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3L = cplChiChacHpmL(gt3,i2,i3)
coup3R = cplChiChacHpmR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Cha, VWm}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MVWm 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3L = -cplChiChacVWmR(gt3,i2)
coup3R = -cplChiChacVWmL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Chi, Chi, Ah}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopAh)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MAh(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3L = cplChiChiAhL(gt3,i2,i3)
coup3R = cplChiChiAhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, hh}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loophh)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3L = cplChiChihhL(gt3,i2,i3)
coup3R = cplChiChihhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, VZ}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopVZ)) Then 
Do i1=1,5
  Do i2=1,5
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MVZ 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3L = -cplChiChiVZR(gt3,i2)
coup3R = -cplChiChiVZL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fd, Fd, Sd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3L = cplChiFdcSdL(gt3,i2,i3)
coup3R = cplChiFdcSdR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Se}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3L = cplChiFecSeL(gt3,i2,i3)
coup3R = cplChiFecSeR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Su}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuChiSuL(i1,gt2,i3)
coup2R = cplcFuChiSuR(i1,gt2,i3)
coup3L = cplChiFucSuL(gt3,i2,i3)
coup3R = cplChiFucSuR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, SvIm}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
coup3L = cplChiFvSvImL(gt3,i2,i3)
coup3R = cplChiFvSvImR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, SvRe}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
coup3L = cplChiFvSvReL(gt3,i2,i3)
coup3R = cplChiFvSvReR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, Chi}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,5
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
coup3L = cplChiChiAhL(gt3,i3,i2)
coup3R = cplChiChiAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Chi}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,5
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
coup3L = cplChiChihhL(gt3,i3,i2)
coup3R = cplChiChihhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Cha}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = cplcChaChiHpmL(i3,gt3,i2)
coup3R = cplcChaChiHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Cha}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopCha)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = cplcChaChiVWmL(i3,gt3)
coup3R = cplcChaChiVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Sd, Sd, Fd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = cplcFdChiSdL(i3,gt3,i2)
coup3R = cplcFdChiSdR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Fe}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
coup3L = cplcFeChiSeL(i3,gt3,i2)
coup3R = cplcFeChiSeR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Fu}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2L = cplChiFucSuL(gt2,i3,i1)
coup2R = cplChiFucSuR(gt2,i3,i1)
coup3L = cplcFuChiSuL(i3,gt3,i2)
coup3R = cplcFuChiSuR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, Fv}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
coup3L = cplChiFvSvImL(gt3,i3,i2)
coup3R = cplChiFvSvImR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Fv}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
coup3L = cplChiFvSvReL(gt3,i3,i2)
coup3R = cplChiFvSvReR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, Fv}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
coup3L = cplChiFvSvImL(gt3,i3,i2)
coup3R = cplChiFvSvImR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Fv}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
coup3L = cplChiFvSvReL(gt3,i3,i2)
coup3R = cplChiFvSvReR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Cha}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopCha)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaChiHpmL(i3,gt3,i2)
coup3R = cplcChaChiHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Cha}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopCha)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaChiVWmL(i3,gt3)
coup3R = cplcChaChiVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Chi}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopChi)) Then 
  Do i2=1,3
    Do i3=1,5
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
coup3L = cplChiChiAhL(gt3,i3,i2)
coup3R = cplChiChiAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Chi}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopChi)) Then 
    Do i3=1,5
ML1 = MVZ 
ML2 = MVZ 
ML3 = MChi(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
coup3L = -cplChiChiVZR(gt3,i3)
coup3R = -cplChiChiVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Cha], bar[Cha], conj[Hpm]}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
coup3L = cplcChaChiHpmL(i2,gt3,i3)
coup3R = cplcChaChiHpmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Cha], bar[Cha], conj[VWm]}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MVWm 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplChiChacVWmL(gt2,i1)
coup2R = cplChiChacVWmR(gt2,i1)
coup3L = cplcChaChiVWmL(i2,gt3)
coup3R = cplcChaChiVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], conj[Sd]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplChiFdcSdL(gt2,i1,i3)
coup2R = cplChiFdcSdR(gt2,i1,i3)
coup3L = cplcFdChiSdL(i2,gt3,i3)
coup3R = cplcFdChiSdR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], conj[Se]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
coup3L = cplcFeChiSeL(i2,gt3,i3)
coup3R = cplcFeChiSeR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], conj[Su]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3L = cplcFuChiSuL(i2,gt3,i3)
coup3R = cplcFuChiSuR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], bar[Cha]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
coup3L = cplChiChacHpmL(gt3,i3,i2)
coup3R = cplChiChacHpmR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], bar[Cha]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopCha)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
coup3L = -cplChiChacVWmR(gt3,i3)
coup3R = -cplChiChacVWmL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Sd], conj[Sd], bar[Fd]}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2L = cplcFdChiSdL(i3,gt2,i1)
coup2R = cplcFdChiSdR(i3,gt2,i1)
coup3L = cplChiFdcSdL(gt3,i3,i2)
coup3R = cplChiFdcSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], bar[Fe]}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
coup3L = cplChiFecSeL(gt3,i3,i2)
coup3R = cplChiFecSeR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Su], conj[Su], bar[Fu]}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplChiFucSuL(gt3,i3,i2)
coup3R = cplChiFucSuR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], bar[Cha]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopCha)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2L = -cplcChaChiVWmR(i3,gt2)
coup2R = -cplcChaChiVWmL(i3,gt2)
coup3L = cplChiChacHpmL(gt3,i3,i2)
coup3R = cplChiChacHpmR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], bar[Cha]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopCha)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = -cplcChaChiVWmR(i3,gt2)
coup2R = -cplcChaChiVWmL(i3,gt2)
coup3L = -cplChiChacVWmR(gt3,i3)
coup3R = -cplChiChacVWmL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToChiChi


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToChiChi(MAh,MCha,MChi,MFd,             & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplChiChiAhL,cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplAhhhhh(3,3,3),            & 
& cplAhhhVZ(3,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),        & 
& cplChiChacVWmR(5,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),     & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),           & 
& cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),       & 
& cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),  & 
& cplcFdChiSdR(3,5,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),       & 
& cplcFuChiSuR(3,5,6),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcFdFdhhL(3,3,3),        & 
& cplcFdFdhhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),           & 
& cplcFuFuhhR(3,3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),               & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,5,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,5
    Do gt3=1,5
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MChi(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToChiChi


Subroutine Amplitude_Tree_seesaw1nmssm_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,             & 
& MFd,Mhh,MFd2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),Mhh(3),MFd2(3),Mhh2(3)

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdhhL(gt2,gt3,gt1)
coupT1R = cplcFdFdhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTocFdFd


Subroutine Gamma_Real_seesaw1nmssm_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,               & 
& cplcFdFdhhR,MFd,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3)

Real(dp), Intent(in) :: MFd(3),Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFdFdhhL(i2,i3,i1)
CoupR = cplcFdFdhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFd(i2)
Mex3 = MFd(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp/3._dp,-1._dp/3._dp,1._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTocFdFd


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,             & 
& ctcplcFdFdhhL,ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfFDL,ZfFDR,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3)

Complex(dp), Intent(in) :: ctcplcFdFdhhL(3,3,3),ctcplcFdFdhhR(3,3,3)

Complex(dp), Intent(in) :: ZfFDL(3,3),ZfFDR(3,3),Zfhh(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFdFdhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFdFdhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFdFdhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDR(i1,gt2)*cplcFdFdhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDL(i1,gt2))*cplcFdFdhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDL(i1,gt3)*cplcFdFdhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDR(i1,gt3))*cplcFdFdhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocFdFd


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,             & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,             & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),MFu2(3),MGlu2,Mhh2(3),              & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplAhhhhh(3,3,3),              & 
& cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),          & 
& cplcFdChaSuR(3,2,6),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),       & 
& cplChiFdcSdR(5,3,6),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVGL(3,3),              & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),           & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSucSu(3,6,6),cplhhcHpmVWm(3,2),               & 
& cplhhcVWmVWm(3),cplhhVZVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {Ah, Ah, Fd}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplcFdFdAhL(gt2,i3,i1)
coup2R = cplcFdFdAhR(gt2,i3,i1)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Fd}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2L = cplcFdFdAhL(gt2,i3,i1)
coup2R = cplcFdFdAhR(gt2,i3,i1)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Fd}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i3,i1)
coup2R = cplcFdFdAhR(gt2,i3,i1)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Chi, Chi, Sd}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopSd)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MSd(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplcFdChiSdL(gt2,i1,i3)
coup2R = cplcFdChiSdR(gt2,i1,i3)
coup3L = cplChiFdcSdL(i2,gt3,i3)
coup3R = cplChiFdcSdR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, Fd}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Fd}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VZ, Ah, Fd}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Fd}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Cha], bar[Cha], Su}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSu)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcFdChaSuL(gt2,i1,i3)
coup2R = cplcFdChaSuR(gt2,i1,i3)
coup3L = cplcChaFdcSuL(i2,gt3,i3)
coup3R = cplcChaFdcSuR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], Ah}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MAh(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdAhL(gt2,i1,i3)
coup2R = cplcFdFdAhR(gt2,i1,i3)
coup3L = cplcFdFdAhL(i2,gt3,i3)
coup3R = cplcFdFdAhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], hh}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdhhL(gt2,i1,i3)
coup2R = cplcFdFdhhR(gt2,i1,i3)
coup3L = cplcFdFdhhL(i2,gt3,i3)
coup3R = cplcFdFdhhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VG}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VP}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VZ}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdVZL(i2,gt3)
coup3R = cplcFdFdVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], Hpm}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFuHpmL(gt2,i1,i3)
coup2R = cplcFdFuHpmR(gt2,i1,i3)
coup3L = cplcFuFdcHpmL(i2,gt3,i3)
coup3R = cplcFuFdcHpmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VWm}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVWm 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFuVWmL(gt2,i1)
coup2R = cplcFdFuVWmR(gt2,i1)
coup3L = cplcFuFdcVWmL(i2,gt3)
coup3R = cplcFuFdcVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], Fu}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopFu)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MFu(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2L = cplcFdFuHpmL(gt2,i3,i1)
coup2R = cplcFdFuHpmR(gt2,i3,i1)
coup3L = cplcFuFdcHpmL(i3,gt3,i2)
coup3R = cplcFuFdcHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], Fu}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopFu)) Then 
Do i1=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MFu(i3) 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2L = cplcFdFuHpmL(gt2,i3,i1)
coup2R = cplcFdFuHpmR(gt2,i3,i1)
coup3L = cplcFuFdcVWmL(i3,gt3)
coup3R = cplcFuFdcVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Sd], conj[Sd], Chi}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2L = cplcFdChiSdL(gt2,i3,i1)
coup2R = cplcFdChiSdR(gt2,i3,i1)
coup3L = cplChiFdcSdL(i3,gt3,i2)
coup3R = cplChiFdcSdR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], Glu}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopGlu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MGlu 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2L = cplcFdGluSdL(gt2,i1)
coup2R = cplcFdGluSdR(gt2,i1)
coup3L = cplGluFdcSdL(gt3,i2)
coup3R = cplGluFdcSdR(gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {conj[Su], conj[Su], Cha}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2L = cplcFdChaSuL(gt2,i3,i1)
coup2R = cplcFdChaSuR(gt2,i3,i1)
coup3L = cplcChaFdcSuL(i3,gt3,i2)
coup3R = cplcChaFdcSuR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], Fu}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopFu)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MFu(i3) 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2L = cplcFdFuVWmL(gt2,i3)
coup2R = cplcFdFuVWmR(gt2,i3)
coup3L = cplcFuFdcHpmL(i3,gt3,i2)
coup3R = cplcFuFdcHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], Fu}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = MFu(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = cplcFdFuVWmL(gt2,i3)
coup2R = cplcFdFuVWmR(gt2,i3)
coup3L = cplcFuFdcVWmL(i3,gt3)
coup3R = cplcFuFdcVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocFdFd


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocFdFd(MAh,MCha,MChi,MFd,              & 
& MFu,MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,           & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,             & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),MFu2(3),MGlu2,Mhh2(3),              & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplAhhhhh(3,3,3),              & 
& cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),          & 
& cplcFdChaSuR(3,2,6),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),       & 
& cplChiFdcSdR(5,3,6),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVGL(3,3),              & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),           & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSucSu(3,6,6),cplhhcHpmVWm(3,2),               & 
& cplhhcVWmVWm(3),cplhhVZVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {bar[Fd], bar[Fd], VG}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VP}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocFdFd


Subroutine Amplitude_Tree_seesaw1nmssm_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,             & 
& MFe,Mhh,MFe2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh(3),MFe2(3),Mhh2(3)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFehhL(gt2,gt3,gt1)
coupT1R = cplcFeFehhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTocFeFe


Subroutine Gamma_Real_seesaw1nmssm_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,               & 
& cplcFeFehhR,MFe,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3)

Real(dp), Intent(in) :: MFe(3),Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFeFehhL(i2,i3,i1)
CoupR = cplcFeFehhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFe(i2)
Mex3 = MFe(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTocFeFe


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,             & 
& ctcplcFeFehhL,ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfFEL,ZfFER,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3)

Complex(dp), Intent(in) :: ctcplcFeFehhL(3,3,3),ctcplcFeFehhR(3,3,3)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),Zfhh(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFehhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFeFehhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFeFehhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFeFehhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFER(i1,gt2)*cplcFeFehhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFEL(i1,gt2))*cplcFeFehhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt3)*cplcFeFehhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt3))*cplcFeFehhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocFeFe


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,        & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,       & 
& cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,    & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplAhhhhh(3,3,3),              & 
& cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,6),        & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiChihhL(5,5,3), & 
& cplChiChihhR(5,5,3),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplcFeChiSeL(3,5,6),       & 
& cplcFeChiSeR(3,5,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),         & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),    & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),& 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),              & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {Ah, Ah, Fe}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MFe(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Fe}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Fe}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Chi, Chi, Se}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopSe)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MSe(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplcFeChiSeL(gt2,i1,i3)
coup2R = cplcFeChiSeR(gt2,i1,i3)
coup3L = cplChiFecSeL(i2,gt3,i3)
coup3R = cplChiFecSeR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Hpm}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplcFeFvHpmL(gt2,i1,i3)
coup2R = cplcFeFvHpmR(gt2,i1,i3)
coup3L = cplFvFecHpmL(i2,gt3,i3)
coup3R = cplFvFecHpmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, VWm}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MVWm 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplcFeFvVWmL(gt2,i1)
coup2R = cplcFeFvVWmR(gt2,i1)
coup3L = cplFvFecVWmL(i2,gt3)
coup3R = cplFvFecVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, Ah, Fe}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MFe(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Fe}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, Cha}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2L = cplcFeChaSvImL(gt2,i3,i1)
coup2R = cplcFeChaSvImR(gt2,i3,i1)
coup3L = cplcChaFeSvImL(i3,gt3,i2)
coup3R = cplcChaFeSvImR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Cha}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2L = cplcFeChaSvImL(gt2,i3,i1)
coup2R = cplcFeChaSvImR(gt2,i3,i1)
coup3L = cplcChaFeSvReL(i3,gt3,i2)
coup3R = cplcChaFeSvReR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, Cha}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2L = cplcFeChaSvReL(gt2,i3,i1)
coup2R = cplcFeChaSvReR(gt2,i3,i1)
coup3L = cplcChaFeSvImL(i3,gt3,i2)
coup3R = cplcChaFeSvImR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Cha}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2L = cplcFeChaSvReL(gt2,i3,i1)
coup2R = cplcFeChaSvReR(gt2,i3,i1)
coup3L = cplcChaFeSvReL(i3,gt3,i2)
coup3R = cplcChaFeSvReR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VZ, Ah, Fe}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Fe}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Cha], bar[Cha], SvIm}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcFeChaSvImL(gt2,i1,i3)
coup2R = cplcFeChaSvImR(gt2,i1,i3)
coup3L = cplcChaFeSvImL(i2,gt3,i3)
coup3R = cplcChaFeSvImR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Cha], bar[Cha], SvRe}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcFeChaSvReL(gt2,i1,i3)
coup2R = cplcFeChaSvReR(gt2,i1,i3)
coup3L = cplcChaFeSvReL(i2,gt3,i3)
coup3R = cplcChaFeSvReR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], Ah}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MAh(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeAhL(gt2,i1,i3)
coup2R = cplcFeFeAhR(gt2,i1,i3)
coup3L = cplcFeFeAhL(i2,gt3,i3)
coup3R = cplcFeFeAhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], hh}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3L = cplcFeFehhL(i2,gt3,i3)
coup3R = cplcFeFehhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], VP}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], VZ}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVZL(gt2,i1)
coup2R = cplcFeFeVZR(gt2,i1)
coup3L = cplcFeFeVZL(i2,gt3)
coup3R = cplcFeFeVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], Fv}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MFv(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2L = cplcFeFvHpmL(gt2,i3,i1)
coup2R = cplcFeFvHpmR(gt2,i3,i1)
coup3L = cplFvFecHpmL(i3,gt3,i2)
coup3R = cplFvFecHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], Fv}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopFv)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MFv(i3) 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2L = cplcFeFvHpmL(gt2,i3,i1)
coup2R = cplcFeFvHpmR(gt2,i3,i1)
coup3L = cplFvFecVWmL(i3,gt3)
coup3R = cplFvFecVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Se], conj[Se], Chi}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2L = cplcFeChiSeL(gt2,i3,i1)
coup2R = cplcFeChiSeR(gt2,i3,i1)
coup3L = cplChiFecSeL(i3,gt3,i2)
coup3R = cplChiFecSeR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], Fv}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopFv)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MFv(i3) 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2L = cplcFeFvVWmL(gt2,i3)
coup2R = cplcFeFvVWmR(gt2,i3)
coup3L = cplFvFecHpmL(i3,gt3,i2)
coup3R = cplFvFecHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], Fv}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopFv)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MFv(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = cplcFeFvVWmL(gt2,i3)
coup2R = cplcFeFvVWmR(gt2,i3)
coup3L = cplFvFecVWmL(i3,gt3)
coup3R = cplFvFecVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocFeFe


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocFeFe(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,            & 
& cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,         & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,    & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplAhhhhh(3,3,3),              & 
& cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,6),        & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiChihhL(5,5,3), & 
& cplChiChihhR(5,5,3),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplcFeChiSeL(3,5,6),       & 
& cplcFeChiSeR(3,5,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),         & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),    & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),& 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),              & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {bar[Fe], bar[Fe], VP}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocFeFe


Subroutine Amplitude_Tree_seesaw1nmssm_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,             & 
& MFu,Mhh,MFu2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),Mhh(3),MFu2(3),Mhh2(3)

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFuFuhhL(gt2,gt3,gt1)
coupT1R = cplcFuFuhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTocFuFu


Subroutine Gamma_Real_seesaw1nmssm_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,               & 
& cplcFuFuhhR,MFu,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3)

Real(dp), Intent(in) :: MFu(3),Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFuFuhhL(i2,i3,i1)
CoupR = cplcFuFuhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFu(i2)
Mex3 = MFu(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,4._dp/3._dp,-4._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTocFuFu


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,             & 
& ctcplcFuFuhhL,ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,ZfFUL,ZfFUR,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MFu2(3),Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3)

Complex(dp), Intent(in) :: ctcplcFuFuhhL(3,3,3),ctcplcFuFuhhR(3,3,3)

Complex(dp), Intent(in) :: ZfFUL(3,3),ZfFUR(3,3),Zfhh(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFuFuhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFuFuhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFuFuhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUR(i1,gt2)*cplcFuFuhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUL(i1,gt2))*cplcFuFuhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUL(i1,gt3)*cplcFuFuhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUR(i1,gt3))*cplcFuFuhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocFuFu


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,             & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,           & 
& cplAhhhhh,cplAhhhVZ,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,             & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,  & 
& cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),MFu2(3),MGlu2,Mhh2(3),              & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),              & 
& cplAhhhVZ(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplcChaChahhL(2,2,3),           & 
& cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFucSuL(5,3,6),      & 
& cplChiFucSuR(5,3,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFdFdhhL(3,3,3),        & 
& cplcFdFdhhR(3,3,3),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),       & 
& cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),             & 
& cplcFuFuhhR(3,3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFuFuVGL(3,3),           & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhhhhh(3,3,3),& 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSucSu(3,6,6),             & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {Ah, Ah, Fu}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MFu(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcFuFuAhL(i3,gt3,i2)
coup3R = cplcFuFuAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Fu}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Fu}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Cha, Cha, Sd}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3L = cplChaFucSdL(i2,gt3,i3)
coup3R = cplChaFucSdR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Su}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopSu)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MSu(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplcFuChiSuL(gt2,i1,i3)
coup2R = cplcFuChiSuR(gt2,i1,i3)
coup3L = cplChiFucSuL(i2,gt3,i3)
coup3R = cplChiFucSuR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, Fu}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MFu(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
coup3L = cplcFuFuAhL(i3,gt3,i2)
coup3R = cplcFuFuAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Fu}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Fd}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MFd(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2L = cplcFuFdcHpmL(gt2,i3,i1)
coup2R = cplcFuFdcHpmR(gt2,i3,i1)
coup3L = cplcFdFuHpmL(i3,gt3,i2)
coup3R = cplcFdFuHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Fd}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopFd)) Then 
Do i1=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MFd(i3) 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2L = cplcFuFdcHpmL(gt2,i3,i1)
coup2R = cplcFuFdcHpmR(gt2,i3,i1)
coup3L = cplcFdFuVWmL(i3,gt3)
coup3R = cplcFdFuVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {VWm, Hpm, Fd}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopFd)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MFd(i3) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2L = cplcFuFdcVWmL(gt2,i3)
coup2R = cplcFuFdcVWmR(gt2,i3)
coup3L = cplcFdFuHpmL(i3,gt3,i2)
coup3R = cplcFdFuHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Fd}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = MFd(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = cplcFuFdcVWmL(gt2,i3)
coup2R = cplcFuFdcVWmR(gt2,i3)
coup3L = cplcFdFuVWmL(i3,gt3)
coup3R = cplcFdFuVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Fu}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuAhL(i3,gt3,i2)
coup3R = cplcFuFuAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Fu}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fd], bar[Fd], conj[Hpm]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcHpmL(gt2,i1,i3)
coup2R = cplcFuFdcHpmR(gt2,i1,i3)
coup3L = cplcFdFuHpmL(i2,gt3,i3)
coup3R = cplcFdFuHpmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], conj[VWm]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVWm 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcVWmL(gt2,i1)
coup2R = cplcFuFdcVWmR(gt2,i1)
coup3L = cplcFdFuVWmL(i2,gt3)
coup3R = cplcFdFuVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], Ah}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MAh(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuAhL(gt2,i1,i3)
coup2R = cplcFuFuAhR(gt2,i1,i3)
coup3L = cplcFuFuAhL(i2,gt3,i3)
coup3R = cplcFuFuAhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], hh}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuhhL(gt2,i1,i3)
coup2R = cplcFuFuhhR(gt2,i1,i3)
coup3L = cplcFuFuhhL(i2,gt3,i3)
coup3R = cplcFuFuhhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VG}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VP}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VZ}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVZ 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVZL(gt2,i1)
coup2R = cplcFuFuVZR(gt2,i1)
coup3L = cplcFuFuVZL(i2,gt3)
coup3R = cplcFuFuVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], bar[Cha]}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2L = cplcChacFuSdL(i3,gt2,i1)
coup2R = cplcChacFuSdR(i3,gt2,i1)
coup3L = cplChaFucSdL(i3,gt3,i2)
coup3R = cplChaFucSdR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Su], conj[Su], Chi}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2L = cplcFuChiSuL(gt2,i3,i1)
coup2R = cplcFuChiSuR(gt2,i3,i1)
coup3L = cplChiFucSuL(i3,gt3,i2)
coup3R = cplChiFucSuR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Su], conj[Su], Glu}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopGlu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MGlu 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2L = cplcFuGluSuL(gt2,i1)
coup2R = cplcFuGluSuR(gt2,i1)
coup3L = cplGluFucSuL(gt3,i2)
coup3R = cplGluFucSuR(gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocFuFu


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocFuFu(MAh,MCha,MChi,MFd,              & 
& MFu,MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,           & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,           & 
& cplAhhhhh,cplAhhhVZ,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,             & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,  & 
& cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),MFu2(3),MGlu2,Mhh2(3),              & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),              & 
& cplAhhhVZ(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplcChaChahhL(2,2,3),           & 
& cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFucSuL(5,3,6),      & 
& cplChiFucSuR(5,3,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFdFdhhL(3,3,3),        & 
& cplcFdFdhhR(3,3,3),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),       & 
& cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),             & 
& cplcFuFuhhR(3,3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFuFuVGL(3,3),           & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhhhhh(3,3,3),& 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSucSu(3,6,6),             & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {bar[Fu], bar[Fu], VG}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VP}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocFuFu


Subroutine Amplitude_Tree_seesaw1nmssm_hhToFvFv(cplFvFvhhL,cplFvFvhhR,MFv,            & 
& Mhh,MFv2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),Mhh(3),MFv2(6),Mhh2(3)

Complex(dp), Intent(in) :: cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3)

Complex(dp) :: Amp(2,3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFvhhL(gt2,gt3,gt1)
coupT1R = cplFvFvhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhToFvFv


Subroutine Gamma_Real_seesaw1nmssm_hhToFvFv(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,      & 
& MFv,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3)

Real(dp), Intent(in) :: MFv(6),Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
CoupL = cplFvFvhhL(i2,i3,i1)
CoupR = cplFvFvhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFv(i2)
Mex3 = MFv(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhToFvFv


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToFvFv(cplFvFvhhL,cplFvFvhhR,ctcplFvFvhhL,   & 
& ctcplFvFvhhR,MFv,MFv2,Mhh,Mhh2,ZfFV,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MFv2(6),Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3)

Complex(dp), Intent(in) :: ctcplFvFvhhL(6,6,3),ctcplFvFvhhR(6,6,3)

Complex(dp), Intent(in) :: ZfFV(6,6),Zfhh(3,3)

Complex(dp), Intent(out) :: Amp(2,3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplFvFvhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplFvFvhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplFvFvhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplFvFvhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplFvFvhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt3)*cplFvFvhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt3))*cplFvFvhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToFvFv


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToFvFv(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,               & 
& cplAhhhVZ,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,             & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3), & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),     & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),     & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),             & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),              & 
& cplhhSecSe(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 


! {Ah, Ah, Fv}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MFv(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = cplFvFvAhL(gt3,i3,i2)
coup3R = cplFvFvAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Fv}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MFv(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = cplFvFvhhL(gt3,i3,i2)
coup3R = cplFvFvhhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Fv}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFv)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = -cplFvFvVZR(gt3,i3)
coup3R = -cplFvFvVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Cha, Cha, Se}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3L = cplFvChacSeL(gt3,i2,i3)
coup3R = cplFvChacSeR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, SvIm}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopSvIm)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
coup3L = cplChiFvSvImL(i2,gt3,i3)
coup3R = cplChiFvSvImR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, SvRe}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopSvRe)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
coup3L = cplChiFvSvReL(i2,gt3,i3)
coup3R = cplChiFvSvReR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3L = cplFvFecHpmL(gt3,i2,i3)
coup3R = cplFvFecHpmR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, VWm}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWm 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3L = -cplFvFecVWmR(gt3,i2)
coup3R = -cplFvFecVWmL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, Fv, Ah}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3L = cplFvFvAhL(gt3,i2,i3)
coup3R = cplFvFvAhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, hh}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3L = cplFvFvhhL(gt3,i2,i3)
coup3R = cplFvFvhhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, VZ}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MVZ 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3L = -cplFvFvVZR(gt3,i2)
coup3R = -cplFvFvVZL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, Ah, Fv}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MFv(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
coup3L = cplFvFvAhL(gt3,i3,i2)
coup3R = cplFvFvAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Fv}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFv(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
coup3L = cplFvFvhhL(gt3,i3,i2)
coup3R = cplFvFvhhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Fe}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = cplcFeFvHpmL(i3,gt3,i2)
coup3R = cplcFeFvHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Fe}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopFe)) Then 
Do i1=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MFe(i3) 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = cplcFeFvVWmL(i3,gt3)
coup3R = cplcFeFvVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Se, Se, Cha}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = cplcChaFvSeL(i3,gt3,i2)
coup3R = cplcChaFvSeR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, Chi}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
coup3L = cplChiFvSvImL(i3,gt3,i2)
coup3R = cplChiFvSvImR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Chi}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
coup3L = cplChiFvSvReL(i3,gt3,i2)
coup3R = cplChiFvSvReR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, Chi}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
coup3L = cplChiFvSvImL(i3,gt3,i2)
coup3R = cplChiFvSvImR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Chi}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
coup3L = cplChiFvSvReL(i3,gt3,i2)
coup3R = cplChiFvSvReR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Fe}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopFe)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeFvHpmL(i3,gt3,i2)
coup3R = cplcFeFvHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Fe}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = MFe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeFvVWmL(i3,gt3)
coup3R = cplcFeFvVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFv)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MFv(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplFvFvAhL(gt3,i3,i2)
coup3R = cplFvFvAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFv)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = -cplFvFvVZR(gt3,i3)
coup3R = -cplFvFvVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Cha], bar[Cha], conj[Se]}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
coup3L = cplcChaFvSeL(i2,gt3,i3)
coup3R = cplcChaFvSeR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], conj[Hpm]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
coup3L = cplcFeFvHpmL(i2,gt3,i3)
coup3R = cplcFeFvHpmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], conj[VWm]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWm 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
coup3L = cplcFeFvVWmL(i2,gt3)
coup3R = cplcFeFvVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], bar[Fe]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
coup3L = cplFvFecHpmL(gt3,i3,i2)
coup3R = cplFvFecHpmR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], bar[Fe]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopFe)) Then 
Do i1=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MFe(i3) 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
coup3L = -cplFvFecVWmR(gt3,i3)
coup3R = -cplFvFecVWmL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Se], conj[Se], bar[Cha]}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
coup3L = cplFvChacSeL(gt3,i3,i2)
coup3R = cplFvChacSeR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], bar[Fe]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopFe)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = cplFvFecHpmL(gt3,i3,i2)
coup3R = cplFvFecHpmR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], bar[Fe]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = MFe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = -cplFvFecVWmR(gt3,i3)
coup3R = -cplFvFecVWmL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToFvFv


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToFvFv(MAh,MCha,MChi,MFe,               & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,               & 
& cplAhhhVZ,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,             & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3), & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),     & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),     & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),             & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),              & 
& cplhhSecSe(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToFvFv


Subroutine Amplitude_Tree_seesaw1nmssm_hhTohhhh(cplhhhhhh,Mhh,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplhhhhhh(3,3,3)

Complex(dp) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhhhhh(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTohhhh


Subroutine Gamma_Real_seesaw1nmssm_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,              & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhhhhh(3,3,3)

Real(dp), Intent(in) :: Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
Coup = cplhhhhhh(i1,i2,i3)
Mex1 = Mhh(i1)
Mex2 = Mhh(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTohhhh


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,            & 
& Mhh2,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplhhhhhh(3,3,3)

Complex(dp), Intent(in) :: ctcplhhhhhh(3,3,3)

Complex(dp), Intent(in) :: Zfhh(3,3)

Complex(dp), Intent(out) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhhhhh(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhhhhh(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplhhhhhh(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhhhhh(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTohhhh


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTohhhh(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,           & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),         & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplcgWmgWmhh(3),cplcgWpCgWpChh(3),cplcgZgZhh(3),   & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplAhAhhhhh1(3,3,3,3),& 
& cplAhhhhhhh1(3,3,3,3),cplhhhhhhhh1(3,3,3,3),cplhhhhHpmcHpm1(3,3,2,2),cplhhhhSdcSdaa(3,3,6,6),& 
& cplhhhhSecSe1(3,3,6,6),cplhhhhSucSuaa(3,3,6,6),cplhhhhSvImSvIm1(3,3,6,6),              & 
& cplhhhhSvImSvRe1(3,3,6,6),cplhhhhSvReSvRe1(3,3,6,6),cplhhhhcVWmVWm1(3,3),              & 
& cplhhhhVZVZ1(3,3)

Complex(dp), Intent(out) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Ah}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = cplAhhhhh(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Ah}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = -cplAhhhVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhhh(i1,gt2,i3)
coup3 = cplAhhhhh(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, hh}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhhh(i1,gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVZ(i1,gt2)
coup3 = -cplAhhhVZ(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, VZ, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVZ(i1,gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaChahhL(i1,i3,gt2)
coup2R = cplcChaChahhR(i1,i3,gt2)
coup3L = cplcChaChahhL(i3,i2,gt3)
coup3R = cplcChaChahhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Chi}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,5
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiChihhL(i1,i3,gt2)
coup2R = cplChiChihhR(i1,i3,gt2)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = cplcFdFdhhL(i3,i2,gt3)
coup3R = cplcFdFdhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = cplcFuFuhhL(i3,i2,gt3)
coup3R = cplcFuFuhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvhhL(i1,i3,gt2)
coup2R = cplFvFvhhR(i1,i3,gt2)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmhh(gt2)
coup3 = cplcgWmgWmhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpChh(gt2)
coup3 = cplcgWpCgWpChh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {gZ, gZ, gZ}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgZhh(gt2)
coup3 = cplcgZgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {hh, Ah, Ah}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplAhhhhh(i3,gt2,i1)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(i3,gt2,i1)
coup3 = cplAhhhhh(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, hh}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhhhhh(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplhhHpmcHpm(gt2,i3,i1)
coup3 = cplhhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplhhHpmcHpm(gt2,i3,i1)
coup3 = cplhhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = -cplhhcHpmVWm(gt2,i1)
coup3 = cplhhHpmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = -cplhhcHpmVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplhhSdcSd(gt2,i3,i1)
coup3 = cplhhSdcSd(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplhhSecSe(gt2,i3,i1)
coup3 = cplhhSecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplhhSucSu(gt2,i3,i1)
coup3 = cplhhSucSu(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplhhSvImSvIm(gt2,i1,i3)
coup3 = cplhhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvIm(gt2,i1,i3)
coup3 = cplhhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i1,i3)
coup3 = cplhhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i1,i3)
coup3 = cplhhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, SvIm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplhhSvImSvRe(gt2,i3,i1)
coup3 = cplhhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, SvIm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i3,i1)
coup3 = cplhhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplhhSvReSvRe(gt2,i1,i3)
coup3 = cplhhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplhhSvReSvRe(gt2,i1,i3)
coup3 = cplhhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = -cplhhHpmcVWm(gt2,i3)
coup3 = cplhhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhHpmcVWm(gt2,i3)
coup3 = cplhhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplhhHpmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VWm, VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = -cplAhhhVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
  Do i2=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = -cplAhhhVZ(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplhhHpmcHpm(gt2,i1,i3)
coup3 = cplhhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = -cplhhHpmcVWm(gt2,i1)
coup3 = cplhhcHpmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = -cplhhHpmcVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = -cplhhcHpmVWm(gt2,i3)
coup3 = cplhhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhcHpmVWm(gt2,i3)
coup3 = cplhhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplhhcHpmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhhhh1(i1,i2,gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhhhhh1(i1,gt2,gt3,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhhhh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplhhhhHpmcHpm1(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplhhhhSdcSdaa(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplhhhhSecSe1(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplhhhhSucSuaa(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplhhhhSvImSvIm1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplhhhhSvImSvRe1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplhhhhSvReSvRe1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhhhcVWmVWm1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhhhVZVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhhhh1(i1,i2,gt1,gt3)
coup2 = cplAhAhhh(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(i1,gt1,gt3,i2)
coup2 = cplAhhhhh(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhhh1(gt1,gt3,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhhhHpmcHpm1(gt1,gt3,i1,i2)
coup2 = cplhhHpmcHpm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhhhSdcSdaa(gt1,gt3,i1,i2)
coup2 = cplhhSdcSd(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhhhSecSe1(gt1,gt3,i1,i2)
coup2 = cplhhSecSe(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhhhSucSuaa(gt1,gt3,i1,i2)
coup2 = cplhhSucSu(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvIm1(gt1,gt3,i1,i2)
coup2 = cplhhSvImSvIm(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvImSvRe1(gt1,gt3,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvReSvRe1(gt1,gt3,i1,i2)
coup2 = cplhhSvReSvRe(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,gt3)
coup2 = cplhhcVWmVWm(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,gt3)
coup2 = cplhhVZVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhhhh1(i1,i2,gt1,gt2)
coup2 = cplAhAhhh(i1,i2,gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(i1,gt1,gt2,i2)
coup2 = cplAhhhhh(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhhh1(gt1,gt2,i1,i2)
coup2 = cplhhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhhhHpmcHpm1(gt1,gt2,i1,i2)
coup2 = cplhhHpmcHpm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhhhSdcSdaa(gt1,gt2,i1,i2)
coup2 = cplhhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhhhSecSe1(gt1,gt2,i1,i2)
coup2 = cplhhSecSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhhhSucSuaa(gt1,gt2,i1,i2)
coup2 = cplhhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvIm1(gt1,gt2,i1,i2)
coup2 = cplhhSvImSvIm(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvImSvRe1(gt1,gt2,i1,i2)
coup2 = cplhhSvImSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvReSvRe1(gt1,gt2,i1,i2)
coup2 = cplhhSvReSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,gt2)
coup2 = cplhhcVWmVWm(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,gt2)
coup2 = cplhhVZVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTohhhh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTohhhh(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,           & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),         & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplcgWmgWmhh(3),cplcgWpCgWpChh(3),cplcgZgZhh(3),   & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplAhAhhhhh1(3,3,3,3),& 
& cplAhhhhhhh1(3,3,3,3),cplhhhhhhhh1(3,3,3,3),cplhhhhHpmcHpm1(3,3,2,2),cplhhhhSdcSdaa(3,3,6,6),& 
& cplhhhhSecSe1(3,3,6,6),cplhhhhSucSuaa(3,3,6,6),cplhhhhSvImSvIm1(3,3,6,6),              & 
& cplhhhhSvImSvRe1(3,3,6,6),cplhhhhSvReSvRe1(3,3,6,6),cplhhhhcVWmVWm1(3,3),              & 
& cplhhhhVZVZ1(3,3)

Complex(dp), Intent(out) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTohhhh


Subroutine Amplitude_Tree_seesaw1nmssm_hhTocHpmHpm(cplhhHpmcHpm,Mhh,MHpm,             & 
& Mhh2,MHpm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MHpm(2),Mhh2(3),MHpm2(2)

Complex(dp), Intent(in) :: cplhhHpmcHpm(3,2,2)

Complex(dp) :: Amp(3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhHpmcHpm(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTocHpmHpm


Subroutine Gamma_Real_seesaw1nmssm_hhTocHpmHpm(MLambda,em,gs,cplhhHpmcHpm,            & 
& Mhh,MHpm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHpmcHpm(3,2,2)

Real(dp), Intent(in) :: Mhh(3),MHpm(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,2,2), GammarealGluon(3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=2,2
    Do i3=2,2
Coup = cplhhHpmcHpm(i1,i3,i2)
Mex1 = Mhh(i1)
Mex2 = MHpm(i2)
Mex3 = MHpm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTocHpmHpm


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocHpmHpm(cplhhHpmcHpm,ctcplhhHpmcHpm,       & 
& Mhh,Mhh2,MHpm,MHpm2,Zfhh,ZfHpm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MHpm(2),MHpm2(2)

Complex(dp), Intent(in) :: cplhhHpmcHpm(3,2,2)

Complex(dp), Intent(in) :: ctcplhhHpmcHpm(3,2,2)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfHpm(2,2)

Complex(dp), Intent(out) :: Amp(3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHpmcHpm(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhHpmcHpm(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHpm(i1,gt2))*cplhhHpmcHpm(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHpm(i1,gt3)*cplhhHpmcHpm(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocHpmHpm


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocHpmHpm(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,   & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,             & 
& cplcgZgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,    & 
& cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,     & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,    & 
& cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1, & 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),& 
& cplAhcHpmVWm(3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplcChaChahhL(2,2,3),    & 
& cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcChaChiHpmL(2,5,2),    & 
& cplcChaChiHpmR(2,5,2),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFuFdcHpmL(3,3,2),      & 
& cplcFuFdcHpmR(3,3,2),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplcFeFehhL(3,3,3),       & 
& cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdFuHpmL(3,3,2),          & 
& cplcFdFuHpmR(3,3,2),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplcFeFvHpmL(3,6,2),           & 
& cplcFeFvHpmR(3,6,2),cplcgWmgWmhh(3),cplcgZgWmcHpm(2),cplcgWpCgWpChh(3),cplcgZgWpCHpm(2),& 
& cplcgZgZhh(3),cplcgWmgZHpm(2),cplcgWpCgZcHpm(2),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),  & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),& 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcHpmcSu(6,2,6),& 
& cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),             & 
& cplAhAhHpmcHpm1(3,3,2,2),cplAhhhHpmcHpm1(3,3,2,2),cplhhhhHpmcHpm1(3,3,2,2),            & 
& cplhhHpmSucSdaa(3,2,6,6),cplhhHpmSvImcSe1(3,2,6,6),cplhhHpmSvRecSe1(3,2,6,6),          & 
& cplhhHpmcVWmVP1(3,2),cplhhHpmcVWmVZ1(3,2),cplhhSdcHpmcSuaa(3,6,2,6),cplhhSeSvImcHpm1(3,6,6,2),& 
& cplhhSeSvRecHpm1(3,6,6,2),cplhhcHpmVPVWm1(3,2),cplhhcHpmVWmVZ1(3,2),cplHpmHpmcHpmcHpm1(2,2,2,2),& 
& cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),       & 
& cplHpmSvImSvImcHpm1(2,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),cplHpmSvReSvRecHpm1(2,6,6,2),& 
& cplHpmcHpmcVWmVWm1(2,2),cplHpmcHpmVZVZ1(2,2)

Complex(dp), Intent(out) :: Amp(3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, Ah, Hpm}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhHpmcHpm(i1,i3,gt2)
coup3 = cplAhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Hpm}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhHpmcHpm(i1,i3,gt2)
coup3 = cplhhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Hpm}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhHpmcHpm(i1,i3,gt2)
coup3 = cplHpmcHpmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, Ah, VWm}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhcHpmVWm(i1,gt2)
coup3 = -cplAhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, hh, VWm}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhcHpmVWm(i1,gt2)
coup3 = -cplhhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, VZ, VWm}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhcHpmVWm(i1,gt2)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Chi, Chi, Cha}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiChacHpmL(i1,i3,gt2)
coup2R = cplChiChacHpmR(i1,i3,gt2)
coup3L = cplcChaChiHpmL(i3,i2,gt3)
coup3R = cplcChaChiHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fd}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFdcHpmL(i1,i3,gt2)
coup2R = cplcFuFdcHpmR(i1,i3,gt2)
coup3L = cplcFdFuHpmL(i3,i2,gt3)
coup3R = cplcFdFuHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fe}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFecHpmL(i1,i3,gt2)
coup2R = cplFvFecHpmR(i1,i3,gt2)
coup3L = cplcFeFvHpmL(i3,i2,gt3)
coup3R = cplcFeFvHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWmC, gWmC, gZ}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgZcHpm(gt2)
coup3 = cplcgZgWpCHpm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gWm}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWm)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWmcHpm(gt2)
coup3 = cplcgWmgZHpm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {hh, Ah, Hpm}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhHpmcHpm(i1,i3,gt2)
coup3 = cplAhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Hpm}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHpmcHpm(i1,i3,gt2)
coup3 = cplhhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, VWm}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhcHpmVWm(i1,gt2)
coup3 = -cplAhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VWm}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhcHpmVWm(i1,gt2)
coup3 = -cplhhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su, Sd}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSdcHpmcSu(i3,gt2,i1)
coup3 = cplHpmSucSd(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, Se}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSeSvImcHpm(i3,i1,gt2)
coup3 = cplHpmSvImcSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Se}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplSeSvImcHpm(i3,i1,gt2)
coup3 = cplHpmSvRecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, Se}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplSeSvRecHpm(i3,i1,gt2)
coup3 = cplHpmSvImcSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Se}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSeSvRecHpm(i3,i1,gt2)
coup3 = cplHpmSvRecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VZ, Ah, Hpm}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplHpmcHpmVZ(i3,gt2)
coup3 = cplAhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Hpm}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpmcHpmVZ(i3,gt2)
coup3 = cplHpmcHpmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, VWm}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopVWm)) Then 
  Do i2=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplcHpmVWmVZ(gt2)
coup3 = -cplAhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, VZ, VWm}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcHpmVWmVZ(gt2)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {bar[Cha], bar[Cha], Chi}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,5
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplChiChacHpmL(i3,i1,gt2)
coup2R = cplChiChacHpmR(i3,i1,gt2)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], bar[Fu]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcHpmL(i3,i1,gt2)
coup2R = cplcFuFdcHpmR(i3,i1,gt2)
coup3L = cplcFdFuHpmL(i2,i3,gt3)
coup3R = cplcFdFuHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], Fv}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFecHpmL(i3,i1,gt2)
coup2R = cplFvFecHpmR(i3,i1,gt2)
coup3L = cplcFeFvHpmL(i2,i3,gt3)
coup3R = cplcFeFvHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[gWm], bar[gWm], bar[gZ]}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgZgWmcHpm(gt2)
coup3 = cplcgWmgZHpm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gWmC]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWpC)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWpCgZcHpm(gt2)
coup3 = cplcgZgWpCHpm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hpm], conj[Hpm], Ah}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplAhHpmcHpm(i3,i1,gt2)
coup3 = cplAhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], Ah}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopAh)) Then 
Do i1=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplAhHpmcHpm(i3,i1,gt2)
coup3 = -cplAhHpmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], hh}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplhhHpmcHpm(i3,i1,gt2)
coup3 = cplhhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], hh}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplhhHpmcHpm(i3,i1,gt2)
coup3 = -cplhhHpmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmcHpmVP(i1,gt2)
coup3 = cplHpmcHpmVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], VP}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcHpmVP(i1,gt2)
coup3 = cplHpmcVWmVP(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[Hpm], conj[Hpm], VZ}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmcHpmVZ(i1,gt2)
coup3 = cplHpmcHpmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], VZ}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcHpmVZ(i1,gt2)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[Sd], conj[Sd], conj[Su]}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplSdcHpmcSu(i1,gt2,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], SvIm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvImcHpm(i1,i3,gt2)
coup3 = cplHpmSvImcSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], SvRe}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvRecHpm(i1,i3,gt2)
coup3 = cplHpmSvRecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], Ah}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplAhcHpmVWm(i3,gt2)
coup3 = cplAhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], Ah}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopAh)) Then 
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhcHpmVWm(i3,gt2)
coup3 = -cplAhHpmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], hh}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplhhcHpmVWm(i3,gt2)
coup3 = cplhhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], hh}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcHpmVWm(i3,gt2)
coup3 = -cplhhHpmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplHpmcHpmVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {conj[VWm], conj[VWm], VP}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplHpmcVWmVP(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWm], conj[Hpm], VZ}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplcHpmVWmVZ(gt2)
coup3 = cplHpmcHpmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {conj[VWm], conj[VWm], VZ}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHpmVWmVZ(gt2)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhHpmcHpm1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhHpmcHpm1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhHpmcHpm1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmHpmcHpmcHpm1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplHpmSdcHpmcSdaa(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplHpmSecHpmcSe1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplHpmSucHpmcSuaa(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplHpmSvImSvImcHpm1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplHpmSvImSvRecHpm1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplHpmSvReSvRecHpm1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHpmcHpmcVWmVWm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpmcHpmVZVZ1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, Hpm}
If ((Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhhhHpmcHpm1(i1,gt1,gt3,i2)
coup2 = cplAhHpmcHpm(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, Hpm}
If ((Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhhhHpmcHpm1(gt1,i1,gt3,i2)
coup2 = cplhhHpmcHpm(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Su, Sd}
If ((Include_in_loopSu).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSd(i2) 
coup1 = cplhhHpmSucSdaa(gt1,gt3,i1,i2)
coup2 = cplSdcHpmcSu(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {SvIm, Se}
If ((Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvImcSe1(gt1,gt3,i1,i2)
coup2 = cplSeSvImcHpm(i2,i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {SvRe, Se}
If ((Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvRecSe1(gt1,gt3,i1,i2)
coup2 = cplSeSvRecHpm(i2,i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {VP, VWm}
If ((Include_in_loopVP).and.(Include_in_loopVWm)) Then 
ML1 = MVP 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVP1(gt1,gt3)
coup2 = cplcHpmVPVWm(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VZ, VWm}
If ((Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
ML1 = MVZ 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVZ1(gt1,gt3)
coup2 = cplcHpmVWmVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {Ah, conj[Hpm]}
If ((Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhhhHpmcHpm1(i1,gt1,i2,gt2)
coup2 = cplAhHpmcHpm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, conj[Hpm]}
If ((Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhhhHpmcHpm1(gt1,i1,i2,gt2)
coup2 = cplhhHpmcHpm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Sd, Su}
If ((Include_in_loopSd).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSdcHpmcSuaa(gt1,i1,gt2,i2)
coup2 = cplHpmSucSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do
End if 


! {Se, SvIm}
If ((Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSeSvImcHpm1(gt1,i1,i2,gt2)
coup2 = cplHpmSvImcSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Se, SvRe}
If ((Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSeSvRecHpm1(gt1,i1,i2,gt2)
coup2 = cplHpmSvRecSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {VP, conj[VWm]}
If ((Include_in_loopVP).and.(Include_in_loopVWm)) Then 
ML1 = MVP 
ML2 = MVWm 
coup1 = cplhhcHpmVPVWm1(gt1,gt2)
coup2 = cplHpmcVWmVP(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VWm, VZ}
If ((Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
ML1 = MVWm 
ML2 = MVZ 
coup1 = cplhhcHpmVWmVZ1(gt1,gt2)
coup2 = cplHpmcVWmVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocHpmHpm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocHpmHpm(MAh,MCha,MChi,MFd,            & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,   & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,             & 
& cplcgZgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,    & 
& cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,     & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,    & 
& cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1, & 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),& 
& cplAhcHpmVWm(3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplcChaChahhL(2,2,3),    & 
& cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcChaChiHpmL(2,5,2),    & 
& cplcChaChiHpmR(2,5,2),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFuFdcHpmL(3,3,2),      & 
& cplcFuFdcHpmR(3,3,2),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplcFeFehhL(3,3,3),       & 
& cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdFuHpmL(3,3,2),          & 
& cplcFdFuHpmR(3,3,2),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplcFeFvHpmL(3,6,2),           & 
& cplcFeFvHpmR(3,6,2),cplcgWmgWmhh(3),cplcgZgWmcHpm(2),cplcgWpCgWpChh(3),cplcgZgWpCHpm(2),& 
& cplcgZgZhh(3),cplcgWmgZHpm(2),cplcgWpCgZcHpm(2),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),  & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),& 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcHpmcSu(6,2,6),& 
& cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),             & 
& cplAhAhHpmcHpm1(3,3,2,2),cplAhhhHpmcHpm1(3,3,2,2),cplhhhhHpmcHpm1(3,3,2,2),            & 
& cplhhHpmSucSdaa(3,2,6,6),cplhhHpmSvImcSe1(3,2,6,6),cplhhHpmSvRecSe1(3,2,6,6),          & 
& cplhhHpmcVWmVP1(3,2),cplhhHpmcVWmVZ1(3,2),cplhhSdcHpmcSuaa(3,6,2,6),cplhhSeSvImcHpm1(3,6,6,2),& 
& cplhhSeSvRecHpm1(3,6,6,2),cplhhcHpmVPVWm1(3,2),cplhhcHpmVWmVZ1(3,2),cplHpmHpmcHpmcHpm1(2,2,2,2),& 
& cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),       & 
& cplHpmSvImSvImcHpm1(2,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),cplHpmSvReSvRecHpm1(2,6,6,2),& 
& cplHpmcHpmcVWmVWm1(2,2),cplHpmcHpmVZVZ1(2,2)

Complex(dp), Intent(out) :: Amp(3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MHpm(gt3) 


! {conj[Hpm], conj[Hpm], VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmcHpmVP(i1,gt2)
coup3 = cplHpmcHpmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], VP}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcHpmVP(i1,gt2)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplHpmcHpmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {conj[VWm], conj[VWm], VP}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VWm}
If ((Include_in_loopVP).and.(Include_in_loopVWm)) Then 
ML1 = MVP 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVP1(gt1,gt3)
coup2 = cplcHpmVPVWm(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VP, conj[VWm]}
If ((Include_in_loopVP).and.(Include_in_loopVWm)) Then 
ML1 = MVP 
ML2 = MVWm 
coup1 = cplhhcHpmVPVWm1(gt1,gt2)
coup2 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocHpmHpm


Subroutine Amplitude_Tree_seesaw1nmssm_hhToHpmcVWm(cplhhHpmcVWm,Mhh,MHpm,             & 
& MVWm,Mhh2,MHpm2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MHpm(2),MVWm,Mhh2(3),MHpm2(2),MVWm2

Complex(dp), Intent(in) :: cplhhHpmcVWm(3,2)

Complex(dp) :: Amp(2,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = cplhhHpmcVWm(gt1,gt2)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhToHpmcVWm


Subroutine Gamma_Real_seesaw1nmssm_hhToHpmcVWm(MLambda,em,gs,cplhhHpmcVWm,            & 
& Mhh,MHpm,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHpmcVWm(3,2)

Real(dp), Intent(in) :: Mhh(3),MHpm(2),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,2), GammarealGluon(3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=2,2
Coup = cplhhHpmcVWm(i1,i2)
Mex1 = Mhh(i1)
Mex2 = MHpm(i2)
Mex3 = MVWm
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,0._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhToHpmcVWm


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToHpmcVWm(cplhhHpmcVWm,ctcplhhHpmcVWm,       & 
& Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,Zfhh,ZfHpm,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MVWm,MVWm2

Complex(dp), Intent(in) :: cplhhHpmcVWm(3,2)

Complex(dp), Intent(in) :: ctcplhhHpmcVWm(3,2)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfHpm(2,2),ZfVWm

Complex(dp), Intent(out) :: Amp(2,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHpmcVWm(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhHpmcVWm(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHpm(i1,gt2)*cplhhHpmcVWm(gt1,i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplhhHpmcVWm(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToHpmcVWm


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToHpmcVWm(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR, & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,cplcgWmgAHpm,               & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,      & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,           & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,             & 
& cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),& 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),     & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),   & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),           & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),             & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),         & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),           & 
& cplcgZgAhh(3),cplcgWmgAHpm(2),cplcgWmgWmhh(3),cplcgAgWmcVWm,cplcgZgWmcVWm,             & 
& cplcgWpCgWpChh(3),cplcgZgWpCHpm(2),cplcgZgZhh(3),cplcgWmgZHpm(2),cplcgWpCgZcVWm,       & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSucSd(2,6,6),& 
& cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),& 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplAhHpmcVWmVZ1(3,2),cplhhhhcVWmVWm1(3,3),cplhhHpmcVWmVP1(3,2),& 
& cplhhHpmcVWmVZ1(3,2),cplHpmcHpmcVWmVWm1(2,2)

Complex(dp), Intent(out) :: Amp(2,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MVWm 


! {Ah, Ah, conj[Hpm]}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhHpmcHpm(i1,gt2,i3)
coup3 = -cplAhHpmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, conj[Hpm]}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhHpmcHpm(i1,gt2,i3)
coup3 = -cplhhHpmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, conj[Hpm]}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhHpmcHpm(i1,gt2,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, hh, conj[VWm]}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = -cplAhHpmcVWm(i1,gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, VZ, conj[VWm]}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = -cplAhHpmcVWm(i1,gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Cha, Cha, Chi}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,5
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaChiHpmL(i1,i3,gt2)
coup2R = cplcChaChiHpmR(i1,i3,gt2)
coup3L = -cplChiChacVWmR(i3,i2)
coup3R = -cplChiChacVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, bar[Cha]}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplcChaChiHpmL(i3,i1,gt2)
coup2R = cplcChaChiHpmR(i3,i1,gt2)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fu}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFuHpmL(i1,i3,gt2)
coup2R = cplcFdFuHpmR(i1,i3,gt2)
coup3L = -cplcFuFdcVWmR(i3,i2)
coup3R = -cplcFuFdcVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fv}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFvHpmL(i1,i3,gt2)
coup2R = cplcFeFvHpmR(i1,i3,gt2)
coup3L = -cplFvFecVWmR(i3,i2)
coup3R = -cplFvFecVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, bar[Fe]}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplcFeFvHpmL(i3,i1,gt2)
coup2R = cplcFeFvHpmR(i3,i1,gt2)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gP}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgA)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgAHpm(gt2)
coup3 = cplcgAgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {gWm, gWm, gZ}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgZHpm(gt2)
coup3 = cplcgZgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gWmC}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWpC)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWpCHpm(gt2)
coup3 = cplcgWpCgZcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {hh, Ah, conj[Hpm]}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhHpmcHpm(i1,gt2,i3)
coup3 = -cplAhHpmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, conj[Hpm]}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHpmcHpm(i1,gt2,i3)
coup3 = -cplhhHpmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, conj[VWm]}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplhhHpmcVWm(i1,gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm, Ah}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplAhHpmcHpm(i3,gt2,i1)
coup3 = cplAhHpmcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, hh}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplhhHpmcHpm(i3,gt2,i1)
coup3 = cplhhHpmcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, hh}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplhhHpmcHpm(i3,gt2,i1)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmcHpmVP(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplHpmcHpmVP(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hpm, Hpm, VZ}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmcHpmVZ(gt2,i1)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VZ}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplHpmcHpmVZ(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Sd, Sd, Su}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplHpmSucSd(gt2,i3,i1)
coup3 = -cplSdcSucVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, SvIm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplHpmSvImcSe(gt2,i3,i1)
coup3 = -cplSeSvImcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, SvRe}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplHpmSvRecSe(gt2,i3,i1)
coup3 = -cplSeSvRecVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, conj[Se]}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplHpmSvImcSe(gt2,i1,i3)
coup3 = cplSeSvImcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, conj[Se]}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplHpmSvImcSe(gt2,i1,i3)
coup3 = cplSeSvRecVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, conj[Se]}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplHpmSvRecSe(gt2,i1,i3)
coup3 = cplSeSvImcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, conj[Se]}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplHpmSvRecSe(gt2,i1,i3)
coup3 = cplSeSvRecVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Ah}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = -cplAhHpmcVWm(i3,gt2)
coup3 = cplAhHpmcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, Hpm, hh}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = -cplhhHpmcVWm(i3,gt2)
coup3 = cplhhHpmcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, hh}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhHpmcVWm(i3,gt2)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWm, Hpm, VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplHpmcVWmVP(gt2)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VWm, VWm, VP}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHpmcVWmVP(gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWm, Hpm, VZ}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplHpmcVWmVZ(gt2)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VWm, VWm, VZ}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHpmcVWmVZ(gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, conj[Hpm]}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplHpmcHpmVZ(gt2,i3)
coup3 = -cplAhHpmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, conj[Hpm]}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpmcHpmVZ(gt2,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, conj[VWm]}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpmcVWmVZ(gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {bar[Fu], bar[Fu], bar[Fd]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFuHpmL(i3,i1,gt2)
coup2R = cplcFdFuHpmR(i3,i1,gt2)
coup3L = cplcFuFdcVWmL(i2,i3)
coup3R = cplcFuFdcVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[gWmC], bar[gWmC], bar[gZ]}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgZgWpCHpm(gt2)
coup3 = cplcgWpCgZcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gP], bar[gWm]}
If ((Include_in_loopgZ).and.(Include_in_loopgA).and.(Include_in_loopgWm)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgWmgZHpm(gt2)
coup3 = cplcgAgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gWm]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWm)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWmgZHpm(gt2)
coup3 = cplcgZgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Su], conj[Su], conj[Sd]}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplHpmSucSd(gt2,i1,i3)
coup3 = cplSdcSucVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhHpmcVWmVZ1(i1,gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = cplHpmcHpmcVWmVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, conj[VWm]}
If ((Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,i1)
coup2 = -cplhhHpmcVWm(i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVP 
coup1 = cplhhHpmcVWmVP1(gt1,i1)
coup2 = cplHpmcHpmVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hpm, VZ}
If ((Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVZ 
coup1 = cplhhHpmcVWmVZ1(gt1,i1)
coup2 = cplHpmcHpmVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToHpmcVWm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToHpmcVWm(MAh,MCha,MChi,MFd,            & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR, & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,cplcgWmgAHpm,               & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,      & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,           & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,             & 
& cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),& 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),     & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),   & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),           & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),             & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),         & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),           & 
& cplcgZgAhh(3),cplcgWmgAHpm(2),cplcgWmgWmhh(3),cplcgAgWmcVWm,cplcgZgWmcVWm,             & 
& cplcgWpCgWpChh(3),cplcgZgWpCHpm(2),cplcgZgZhh(3),cplcgWmgZHpm(2),cplcgWpCgZcVWm,       & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSucSd(2,6,6),& 
& cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),& 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplAhHpmcVWmVZ1(3,2),cplhhhhcVWmVWm1(3,3),cplhhHpmcVWmVP1(3,2),& 
& cplhhHpmcVWmVZ1(3,2),cplHpmcHpmcVWmVWm1(2,2)

Complex(dp), Intent(out) :: Amp(2,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MVWm 


! {Hpm, Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmcHpmVP(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplHpmcHpmVP(gt2,i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VWm, Hpm, VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplHpmcVWmVP(gt2)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VWm, VWm, VP}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHpmcVWmVP(gt2)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVP 
coup1 = cplhhHpmcVWmVP1(gt1,i1)
coup2 = cplHpmcHpmVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToHpmcVWm


Subroutine Amplitude_Tree_seesaw1nmssm_hhTocSdSd(cplhhSdcSd,Mhh,MSd,Mhh2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MSd(6),Mhh2(3),MSd2(6)

Complex(dp), Intent(in) :: cplhhSdcSd(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MSd(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSdcSd(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTocSdSd


Subroutine Gamma_Real_seesaw1nmssm_hhTocSdSd(MLambda,em,gs,cplhhSdcSd,Mhh,            & 
& MSd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSdcSd(3,6,6)

Real(dp), Intent(in) :: Mhh(3),MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
Coup = cplhhSdcSd(i1,i3,i2)
Mex1 = Mhh(i1)
Mex2 = MSd(i2)
Mex3 = MSd(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp/3._dp,-1._dp/3._dp,1._dp/3._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,Coup,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTocSdSd


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocSdSd(cplhhSdcSd,ctcplhhSdcSd,             & 
& Mhh,Mhh2,MSd,MSd2,Zfhh,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplhhSdcSd(3,6,6)

Complex(dp), Intent(in) :: ctcplhhSdcSd(3,6,6)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfSd(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MSd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSdcSd(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhSdcSd(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt2))*cplhhSdcSd(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt3)*cplhhSdcSd(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocSdSd


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,             & 
& MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,               & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,      & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,      & 
& cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),           & 
& MFu2(3),MGlu2,Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),            & 
& MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSdcSd(3,6,6),cplChaFucSdL(2,3,6),& 
& cplChaFucSdR(2,3,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),     & 
& cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplcFdChiSdL(3,5,6),       & 
& cplcFdChiSdR(3,5,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),            & 
& cplcFdFdhhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdGluSdL(3,6),            & 
& cplcFdGluSdR(3,6),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),              & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSucSd(2,6,6),& 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSdVWm(6,6),cplAhAhSdcSdaa(3,3,6,6),        & 
& cplAhhhSdcSdaa(3,3,6,6),cplhhhhSdcSdaa(3,3,6,6),cplhhHpmSucSdaa(3,2,6,6),              & 
& cplhhSdcHpmcSuaa(3,6,2,6),cplHpmSdcHpmcSdaa(2,6,2,6),cplSdSdcSdcSdabba(6,6,6,6),       & 
& cplSdSdcSdcSdabab(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),        & 
& cplSdSucSdcSuabab(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6),    & 
& cplSdcSdcVWmVWmaa(6,6),cplSdcSdVZVZaa(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MSd(gt3) 


! {Ah, Ah, Sd}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSd(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhSdcSd(i1,i3,gt2)
coup3 = cplAhSdcSd(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Sd}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MSd(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhSdcSd(i1,i3,gt2)
coup3 = cplhhSdcSd(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Sd}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopSd)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MSd(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhSdcSd(i1,i3,gt2)
coup3 = cplSdcSdVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Chi, Chi, Fd}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopFd)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiFdcSdL(i1,i3,gt2)
coup2R = cplChiFdcSdR(i1,i3,gt2)
coup3L = cplcFdChiSdL(i3,i2,gt3)
coup3R = cplcFdChiSdR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, Sd}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSd(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhSdcSd(i1,i3,gt2)
coup3 = cplAhSdcSd(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Sd}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MSd(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhSdcSd(i1,i3,gt2)
coup3 = cplhhSdcSd(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VZ, Ah, Sd}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopSd)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MSd(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplSdcSdVZ(i3,gt2)
coup3 = cplAhSdcSd(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Sd}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopSd)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZ 
ML3 = MSd(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplSdcSdVZ(i3,gt2)
coup3 = cplSdcSdVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Cha], bar[Cha], Fu}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFu)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplChaFucSdL(i1,i3,gt2)
coup2R = cplChaFucSdR(i1,i3,gt2)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], Chi}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,5
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MChi(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplChiFdcSdL(i3,i1,gt2)
coup2R = cplChiFdcSdR(i3,i1,gt2)
coup3L = cplcFdChiSdL(i2,i3,gt3)
coup3R = cplcFdChiSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], Glu}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopGlu)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MGlu 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplGluFdcSdL(i1,gt2)
coup2R = cplGluFdcSdR(i1,gt2)
coup3L = cplcFdGluSdL(i2,gt3)
coup3R = cplcFdGluSdR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], Cha}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MCha(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplChaFucSdL(i3,i1,gt2)
coup2R = cplChaFucSdR(i3,i1,gt2)
coup3L = cplcChacFuSdL(i3,i2,gt3)
coup3R = cplcChacFuSdR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], Su}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSu)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSu(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmSucSd(i1,i3,gt2)
coup3 = cplSdcHpmcSu(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], Su}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSu)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSu(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmSucSd(i1,i3,gt2)
coup3 = cplSdcSucVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Sd], conj[Sd], Ah}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplAhSdcSd(i3,i1,gt2)
coup3 = cplAhSdcSd(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], hh}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplhhSdcSd(i3,i1,gt2)
coup3 = cplhhSdcSd(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], VG}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MVG 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplSdcSdVG(i1,gt2)
coup3 = cplSdcSdVG(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], VP}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplSdcSdVP(i1,gt2)
coup3 = cplSdcSdVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], VZ}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MVZ 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplSdcSdVZ(i1,gt2)
coup3 = cplSdcSdVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Su], conj[Su], Hpm}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplHpmSucSd(i3,i1,gt2)
coup3 = cplSdcHpmcSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Su], conj[Su], VWm}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MVWm 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplSucSdVWm(i1,gt2)
coup3 = cplSdcSucVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], Su}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSu)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSu(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplSucSdVWm(i3,gt2)
coup3 = cplSdcHpmcSu(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], Su}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSu)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSu(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSucSdVWm(i3,gt2)
coup3 = cplSdcSucVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhSdcSdaa(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhSdcSdaa(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhSdcSdaa(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmSdcHpmcSdaa(i2,gt3,i1,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdSdcSdcSdabba(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
coup2 = cplSdSdcSdcSdabab(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSdSecSdcSeaa(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSdSucSdcSuabba(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
coup2 = cplSdSucSdcSuabab(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSdSvImSvImcSdaa(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSdSvReSvRecSdaa(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSdcSdcVWmVWmaa(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplSdcSdVZVZaa(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, Sd}
If ((Include_in_loopAh).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
coup1 = cplAhhhSdcSdaa(i1,gt1,gt3,i2)
coup2 = cplAhSdcSd(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, Sd}
If ((Include_in_loophh).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
coup1 = cplhhhhSdcSdaa(gt1,i1,gt3,i2)
coup2 = cplhhSdcSd(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {conj[Hpm], Su}
If ((Include_in_loopHpm).and.(Include_in_loopSu)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSdcHpmcSuaa(gt1,gt3,i1,i2)
coup2 = cplHpmSucSd(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, conj[Sd]}
If ((Include_in_loopAh).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
coup1 = cplAhhhSdcSdaa(i1,gt1,i2,gt2)
coup2 = cplAhSdcSd(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, conj[Sd]}
If ((Include_in_loophh).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
coup1 = cplhhhhSdcSdaa(gt1,i1,i2,gt2)
coup2 = cplhhSdcSd(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, conj[Su]}
If ((Include_in_loopHpm).and.(Include_in_loopSu)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
coup1 = cplhhHpmSucSdaa(gt1,i1,i2,gt2)
coup2 = cplSdcHpmcSu(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocSdSd


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocSdSd(MAh,MCha,MChi,MFd,              & 
& MFu,MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,           & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,               & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,      & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,      & 
& cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),           & 
& MFu2(3),MGlu2,Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),            & 
& MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSdcSd(3,6,6),cplChaFucSdL(2,3,6),& 
& cplChaFucSdR(2,3,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),     & 
& cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplcFdChiSdL(3,5,6),       & 
& cplcFdChiSdR(3,5,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),            & 
& cplcFdFdhhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdGluSdL(3,6),            & 
& cplcFdGluSdR(3,6),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),              & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSucSd(2,6,6),& 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSdVWm(6,6),cplAhAhSdcSdaa(3,3,6,6),        & 
& cplAhhhSdcSdaa(3,3,6,6),cplhhhhSdcSdaa(3,3,6,6),cplhhHpmSucSdaa(3,2,6,6),              & 
& cplhhSdcHpmcSuaa(3,6,2,6),cplHpmSdcHpmcSdaa(2,6,2,6),cplSdSdcSdcSdabba(6,6,6,6),       & 
& cplSdSdcSdcSdabab(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),        & 
& cplSdSucSdcSuabab(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6),    & 
& cplSdcSdcVWmVWmaa(6,6),cplSdcSdVZVZaa(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MSd(gt3) 


! {conj[Sd], conj[Sd], VG}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MVG 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplSdcSdVG(i1,gt2)
coup3 = cplSdcSdVG(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], VP}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplSdcSdVP(i1,gt2)
coup3 = cplSdcSdVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocSdSd


Subroutine Amplitude_Tree_seesaw1nmssm_hhTocSeSe(cplhhSecSe,Mhh,MSe,Mhh2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MSe(6),Mhh2(3),MSe2(6)

Complex(dp), Intent(in) :: cplhhSecSe(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MSe(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSecSe(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTocSeSe


Subroutine Gamma_Real_seesaw1nmssm_hhTocSeSe(MLambda,em,gs,cplhhSecSe,Mhh,            & 
& MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSecSe(3,6,6)

Real(dp), Intent(in) :: Mhh(3),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
Coup = cplhhSecSe(i1,i3,i2)
Mex1 = Mhh(i1)
Mex2 = MSe(i2)
Mex3 = MSe(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTocSeSe


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocSeSe(cplhhSecSe,ctcplhhSecSe,             & 
& Mhh,Mhh2,MSe,MSe2,Zfhh,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplhhSecSe(3,6,6)

Complex(dp), Intent(in) :: ctcplhhSecSe(3,6,6)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MSe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSecSe(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhSecSe(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt2))*cplhhSecSe(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt3)*cplhhSecSe(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocSeSe


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,      & 
& cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,    & 
& cplSeSvReSvRecSe1,cplSecSecVWmVWm1,cplSecSeVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSecSe(3,6,6),cplFvChacSeL(6,2,6),& 
& cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),     & 
& cplChiChihhR(5,5,3),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplcFeChiSeL(3,5,6),       & 
& cplcFeChiSeR(3,5,6),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplFvFvhhL(6,6,3),           & 
& cplFvFvhhR(6,6,3),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhhhhh(3,3,3),            & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),& 
& cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),       & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplAhAhSecSe1(3,3,6,6),& 
& cplAhhhSecSe1(3,3,6,6),cplhhhhSecSe1(3,3,6,6),cplhhHpmSvImcSe1(3,2,6,6),               & 
& cplhhHpmSvRecSe1(3,2,6,6),cplhhSeSvImcHpm1(3,6,6,2),cplhhSeSvRecHpm1(3,6,6,2),         & 
& cplHpmSecHpmcSe1(2,6,2,6),cplSdSecSdcSeaa(6,6,6,6),cplSeSecSecSe1(6,6,6,6),            & 
& cplSeSucSecSuaa(6,6,6,6),cplSeSvImSvImcSe1(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),        & 
& cplSeSvReSvRecSe1(6,6,6,6),cplSecSecVWmVWm1(6,6),cplSecSeVZVZ1(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MSe(gt3) 


! {Ah, Ah, Se}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSe(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhSecSe(i1,i3,gt2)
coup3 = cplAhSecSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Se}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MSe(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhSecSe(i1,i3,gt2)
coup3 = cplhhSecSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Se}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopSe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MSe(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhSecSe(i1,i3,gt2)
coup3 = cplSecSeVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Chi, Chi, Fe}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopFe)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiFecSeL(i1,i3,gt2)
coup2R = cplChiFecSeR(i1,i3,gt2)
coup3L = cplcFeChiSeL(i3,i2,gt3)
coup3R = cplcFeChiSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Cha}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvChacSeL(i1,i3,gt2)
coup2R = cplFvChacSeR(i1,i3,gt2)
coup3L = cplcChaFvSeL(i3,i2,gt3)
coup3R = cplcChaFvSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, Se}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSe(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhSecSe(i1,i3,gt2)
coup3 = cplAhSecSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Se}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MSe(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhSecSe(i1,i3,gt2)
coup3 = cplhhSecSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, Hpm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplHpmSvImcSe(i3,i1,gt2)
coup3 = cplSeSvImcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Hpm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplHpmSvImcSe(i3,i1,gt2)
coup3 = cplSeSvRecHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, VWm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MVWm 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSvImcSeVWm(i1,gt2)
coup3 = cplSeSvImcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe, VWm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MVWm 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplSvImcSeVWm(i1,gt2)
coup3 = cplSeSvRecVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvIm, Hpm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplHpmSvRecSe(i3,i1,gt2)
coup3 = cplSeSvImcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Hpm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplHpmSvRecSe(i3,i1,gt2)
coup3 = cplSeSvRecHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, VWm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MVWm 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplSvRecSeVWm(i1,gt2)
coup3 = cplSeSvImcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe, VWm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MVWm 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSvRecSeVWm(i1,gt2)
coup3 = cplSeSvRecVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VZ, Ah, Se}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopSe)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MSe(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplSecSeVZ(i3,gt2)
coup3 = cplAhSecSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Se}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopSe)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZ 
ML3 = MSe(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplSecSeVZ(i3,gt2)
coup3 = cplSecSeVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Cha], bar[Cha], Fv}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplFvChacSeL(i3,i1,gt2)
coup2R = cplFvChacSeR(i3,i1,gt2)
coup3L = cplcChaFvSeL(i2,i3,gt3)
coup3R = cplcChaFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], Chi}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,5
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplChiFecSeL(i3,i1,gt2)
coup2R = cplChiFecSeR(i3,i1,gt2)
coup3L = cplcFeChiSeL(i2,i3,gt3)
coup3R = cplcFeChiSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmSvImcSe(i1,i3,gt2)
coup3 = cplSeSvImcHpm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSvIm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmSvImcSe(i1,i3,gt2)
coup3 = cplSeSvImcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmSvRecSe(i1,i3,gt2)
coup3 = cplSeSvRecHpm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSvRe(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmSvRecSe(i1,i3,gt2)
coup3 = cplSeSvRecVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Se], conj[Se], Ah}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplAhSecSe(i3,i1,gt2)
coup3 = cplAhSecSe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], hh}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplhhSecSe(i3,i1,gt2)
coup3 = cplhhSecSe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], VP}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSecSeVP(i1,gt2)
coup3 = cplSecSeVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Se], conj[Se], VZ}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVZ 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSecSeVZ(i1,gt2)
coup3 = cplSecSeVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], SvIm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSvIm)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSvIm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplSvImcSeVWm(i3,gt2)
coup3 = cplSeSvImcHpm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], SvIm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSvIm)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSvIm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSvImcSeVWm(i3,gt2)
coup3 = cplSeSvImcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], SvRe}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSvRe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSvRe(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplSvRecSeVWm(i3,gt2)
coup3 = cplSeSvRecHpm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], SvRe}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSvRe)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSvRe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSvRecSeVWm(i3,gt2)
coup3 = cplSeSvRecVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhSecSe1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhSecSe1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhSecSe1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmSecHpmcSe1(i2,gt3,i1,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdSecSdcSeaa(i2,gt3,i1,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSeSecSecSe1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSeSucSecSuaa(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSeSvImSvImcSe1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplSeSvImSvRecSe1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSeSvReSvRecSe1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSecSecVWmVWm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplSecSeVZVZ1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, Se}
If ((Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhhhSecSe1(i1,gt1,gt3,i2)
coup2 = cplAhSecSe(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, Se}
If ((Include_in_loophh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
coup1 = cplhhhhSecSe1(gt1,i1,gt3,i2)
coup2 = cplhhSecSe(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {SvIm, Hpm}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvImcHpm1(gt1,gt3,i1,i2)
coup2 = cplHpmSvImcSe(i2,i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {SvRe, Hpm}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvRecHpm1(gt1,gt3,i1,i2)
coup2 = cplHpmSvRecSe(i2,i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, conj[Se]}
If ((Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhhhSecSe1(i1,gt1,i2,gt2)
coup2 = cplAhSecSe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, conj[Se]}
If ((Include_in_loophh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
coup1 = cplhhhhSecSe1(gt1,i1,i2,gt2)
coup2 = cplhhSecSe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhHpmSvImcSe1(gt1,i1,i2,gt2)
coup2 = cplSeSvImcHpm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhHpmSvRecSe1(gt1,i1,i2,gt2)
coup2 = cplSeSvRecHpm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocSeSe


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocSeSe(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,               & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,      & 
& cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,      & 
& cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,    & 
& cplSeSvReSvRecSe1,cplSecSecVWmVWm1,cplSecSeVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSecSe(3,6,6),cplFvChacSeL(6,2,6),& 
& cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplChiChihhL(5,5,3),     & 
& cplChiChihhR(5,5,3),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplcFeChiSeL(3,5,6),       & 
& cplcFeChiSeR(3,5,6),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplFvFvhhL(6,6,3),           & 
& cplFvFvhhR(6,6,3),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhhhhh(3,3,3),            & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),& 
& cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),       & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplAhAhSecSe1(3,3,6,6),& 
& cplAhhhSecSe1(3,3,6,6),cplhhhhSecSe1(3,3,6,6),cplhhHpmSvImcSe1(3,2,6,6),               & 
& cplhhHpmSvRecSe1(3,2,6,6),cplhhSeSvImcHpm1(3,6,6,2),cplhhSeSvRecHpm1(3,6,6,2),         & 
& cplHpmSecHpmcSe1(2,6,2,6),cplSdSecSdcSeaa(6,6,6,6),cplSeSecSecSe1(6,6,6,6),            & 
& cplSeSucSecSuaa(6,6,6,6),cplSeSvImSvImcSe1(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),        & 
& cplSeSvReSvRecSe1(6,6,6,6),cplSecSecVWmVWm1(6,6),cplSecSeVZVZ1(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MSe(gt3) 


! {conj[Se], conj[Se], VP}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSecSeVP(i1,gt2)
coup3 = cplSecSeVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocSeSe


Subroutine Amplitude_Tree_seesaw1nmssm_hhTocSuSu(cplhhSucSu,Mhh,MSu,Mhh2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MSu(6),Mhh2(3),MSu2(6)

Complex(dp), Intent(in) :: cplhhSucSu(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MSu(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSucSu(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTocSuSu


Subroutine Gamma_Real_seesaw1nmssm_hhTocSuSu(MLambda,em,gs,cplhhSucSu,Mhh,            & 
& MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSucSu(3,6,6)

Real(dp), Intent(in) :: Mhh(3),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
Coup = cplhhSucSu(i1,i3,i2)
Mex1 = Mhh(i1)
Mex2 = MSu(i2)
Mex3 = MSu(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,4._dp/3._dp,-4._dp/3._dp,4._dp/3._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,Coup,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTocSuSu


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocSuSu(cplhhSucSu,ctcplhhSucSu,             & 
& Mhh,Mhh2,MSu,MSu2,Zfhh,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplhhSucSu(3,6,6)

Complex(dp), Intent(in) :: ctcplhhSucSu(3,6,6)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfSu(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MSu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSucSu(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhSucSu(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt2))*cplhhSucSu(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt3)*cplhhSucSu(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocSuSu


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,             & 
& MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,             & 
& cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSucVWmVWmaa,            & 
& cplSucSuVZVZaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),           & 
& MFu2(3),MGlu2,Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),            & 
& MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSucSu(3,6,6),cplcChaChahhL(2,2,3),& 
& cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiChihhL(5,5,3),      & 
& cplChiChihhR(5,5,3),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplcFuChiSuL(3,5,6),       & 
& cplcFuChiSuR(3,5,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcChaFdcSuL(2,3,6),        & 
& cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),           & 
& cplcFuFuhhR(3,3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhhhhh(3,3,3),               & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSucSd(2,6,6),cplSdcHpmcSu(6,2,6), & 
& cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),    & 
& cplAhAhSucSuaa(3,3,6,6),cplAhhhSucSuaa(3,3,6,6),cplhhhhSucSuaa(3,3,6,6),               & 
& cplhhHpmSucSdaa(3,2,6,6),cplhhSdcHpmcSuaa(3,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),         & 
& cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),        & 
& cplSuSucSucSuabba(6,6,6,6),cplSuSucSucSuabab(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),     & 
& cplSuSvImSvRecSuaa(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6),cplSucSucVWmVWmaa(6,6),        & 
& cplSucSuVZVZaa(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MSu(gt3) 


! {Ah, Ah, Su}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSu(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhSucSu(i1,i3,gt2)
coup3 = cplAhSucSu(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Su}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MSu(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhSucSu(i1,i3,gt2)
coup3 = cplhhSucSu(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Su}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopSu)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MSu(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhSucSu(i1,i3,gt2)
coup3 = cplSucSuVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Cha, Cha, Fd}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaFdcSuL(i1,i3,gt2)
coup2R = cplcChaFdcSuR(i1,i3,gt2)
coup3L = cplcFdChaSuL(i3,i2,gt3)
coup3R = cplcFdChaSuR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Fu}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopFu)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiFucSuL(i1,i3,gt2)
coup2R = cplChiFucSuR(i1,i3,gt2)
coup3L = cplcFuChiSuL(i3,i2,gt3)
coup3R = cplcFuChiSuR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, Su}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSu(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhSucSu(i1,i3,gt2)
coup3 = cplAhSucSu(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Su}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MSu(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhSucSu(i1,i3,gt2)
coup3 = cplhhSucSu(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Sd}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSd(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplSdcHpmcSu(i3,i1,gt2)
coup3 = cplHpmSucSd(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Sd}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSd)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSd(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplSdcHpmcSu(i3,i1,gt2)
coup3 = cplSucSdVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {VWm, Hpm, Sd}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSd)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSd(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplSdcSucVWm(i3,gt2)
coup3 = cplHpmSucSd(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Sd}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSd)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSd(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSdcSucVWm(i3,gt2)
coup3 = cplSucSdVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Su}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopSu)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MSu(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplSucSuVZ(i3,gt2)
coup3 = cplAhSucSu(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Su}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopSu)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZ 
ML3 = MSu(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplSucSuVZ(i3,gt2)
coup3 = cplSucSuVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fd], bar[Fd], bar[Cha]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MCha(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcChaFdcSuL(i3,i1,gt2)
coup2R = cplcChaFdcSuR(i3,i1,gt2)
coup3L = cplcFdChaSuL(i2,i3,gt3)
coup3R = cplcFdChaSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], Chi}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,5
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MChi(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplChiFucSuL(i3,i1,gt2)
coup2R = cplChiFucSuR(i3,i1,gt2)
coup3L = cplcFuChiSuL(i2,i3,gt3)
coup3R = cplcFuChiSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], Glu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopGlu)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MGlu 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplGluFucSuL(i1,gt2)
coup2R = cplGluFucSuR(i1,gt2)
coup3L = cplcFuGluSuL(i2,gt3)
coup3R = cplcFuGluSuR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], conj[Hpm]}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplSdcHpmcSu(i1,i3,gt2)
coup3 = cplHpmSucSd(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], conj[VWm]}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MVWm 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplSdcSucVWm(i1,gt2)
coup3 = cplSucSdVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Su], conj[Su], Ah}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplAhSucSu(i3,i1,gt2)
coup3 = cplAhSucSu(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Su], conj[Su], hh}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplhhSucSu(i3,i1,gt2)
coup3 = cplhhSucSu(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Su], conj[Su], VG}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MVG 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplSucSuVG(i1,gt2)
coup3 = cplSucSuVG(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {conj[Su], conj[Su], VP}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MVP 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplSucSuVP(i1,gt2)
coup3 = cplSucSuVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Su], conj[Su], VZ}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MVZ 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplSucSuVZ(i1,gt2)
coup3 = cplSucSuVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhSucSuaa(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhSucSuaa(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhSucSuaa(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmSucHpmcSuaa(i2,gt3,i1,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdSucSdcSuabba(i2,gt3,i1,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
coup2 = cplSdSucSdcSuabab(i2,gt3,i1,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSeSucSecSuaa(i2,gt3,i1,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSuSucSucSuabba(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
coup2 = cplSuSucSucSuabab(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSuSvImSvImcSuaa(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplSuSvImSvRecSuaa(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSuSvReSvRecSuaa(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSucSucVWmVWmaa(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplSucSuVZVZaa(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, Su}
If ((Include_in_loopAh).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
coup1 = cplAhhhSucSuaa(i1,gt1,gt3,i2)
coup2 = cplAhSucSu(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, Su}
If ((Include_in_loophh).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
coup1 = cplhhhhSucSuaa(gt1,i1,gt3,i2)
coup2 = cplhhSucSu(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, Sd}
If ((Include_in_loopHpm).and.(Include_in_loopSd)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
coup1 = cplhhHpmSucSdaa(gt1,i1,gt3,i2)
coup2 = cplSdcHpmcSu(i2,i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, conj[Su]}
If ((Include_in_loopAh).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
coup1 = cplAhhhSucSuaa(i1,gt1,i2,gt2)
coup2 = cplAhSucSu(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, conj[Su]}
If ((Include_in_loophh).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
coup1 = cplhhhhSucSuaa(gt1,i1,i2,gt2)
coup2 = cplhhSucSu(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Sd, Hpm}
If ((Include_in_loopSd).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSdcHpmcSuaa(gt1,i1,i2,gt2)
coup2 = cplHpmSucSd(i2,gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocSuSu


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocSuSu(MAh,MCha,MChi,MFd,              & 
& MFu,MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,           & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,             & 
& cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSucVWmVWmaa,            & 
& cplSucSuVZVZaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),           & 
& MFu2(3),MGlu2,Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),            & 
& MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSucSu(3,6,6),cplcChaChahhL(2,2,3),& 
& cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiChihhL(5,5,3),      & 
& cplChiChihhR(5,5,3),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplcFuChiSuL(3,5,6),       & 
& cplcFuChiSuR(3,5,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcChaFdcSuL(2,3,6),        & 
& cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),           & 
& cplcFuFuhhR(3,3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhhhhh(3,3,3),               & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),             & 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),      & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSucSd(2,6,6),cplSdcHpmcSu(6,2,6), & 
& cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),    & 
& cplAhAhSucSuaa(3,3,6,6),cplAhhhSucSuaa(3,3,6,6),cplhhhhSucSuaa(3,3,6,6),               & 
& cplhhHpmSucSdaa(3,2,6,6),cplhhSdcHpmcSuaa(3,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),         & 
& cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),        & 
& cplSuSucSucSuabba(6,6,6,6),cplSuSucSucSuabab(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),     & 
& cplSuSvImSvRecSuaa(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6),cplSucSucVWmVWmaa(6,6),        & 
& cplSucSuVZVZaa(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MSu(gt3) 


! {conj[Su], conj[Su], VG}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MVG 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplSucSuVG(i1,gt2)
coup3 = cplSucSuVG(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {conj[Su], conj[Su], VP}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MVP 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2 = cplSucSuVP(i1,gt2)
coup3 = cplSucSuVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocSuSu


Subroutine Amplitude_Tree_seesaw1nmssm_hhToSvImSvIm(cplhhSvImSvIm,Mhh,MSvIm,          & 
& Mhh2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MSvIm(6),Mhh2(3),MSvIm2(6)

Complex(dp), Intent(in) :: cplhhSvImSvIm(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MSvIm(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSvImSvIm(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhToSvImSvIm


Subroutine Gamma_Real_seesaw1nmssm_hhToSvImSvIm(MLambda,em,gs,cplhhSvImSvIm,          & 
& Mhh,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSvImSvIm(3,6,6)

Real(dp), Intent(in) :: Mhh(3),MSvIm(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
Coup = cplhhSvImSvIm(i1,i2,i3)
Mex1 = Mhh(i1)
Mex2 = MSvIm(i2)
Mex3 = MSvIm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhToSvImSvIm


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToSvImSvIm(cplhhSvImSvIm,ctcplhhSvImSvIm,    & 
& Mhh,Mhh2,MSvIm,MSvIm2,Zfhh,ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplhhSvImSvIm(3,6,6)

Complex(dp), Intent(in) :: ctcplhhSvImSvIm(3,6,6)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfSvIm(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MSvIm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSvImSvIm(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhSvImSvIm(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt2)*cplhhSvImSvIm(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt3)*cplhhSvImSvIm(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToSvImSvIm


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToSvImSvIm(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,      & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,cplSeSvImcHpm,         & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhhhSvImSvIm1,           & 
& cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,cplhhSeSvImcHpm1,  & 
& cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,           & 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImcVWmVWm1,    & 
& cplSvImSvImVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),& 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6), & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSvImcSe(2,6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),& 
& cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplAhAhSvImSvIm1(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),& 
& cplAhhhSvImSvRe1(3,3,6,6),cplhhhhSvImSvIm1(3,3,6,6),cplhhhhSvImSvRe1(3,3,6,6),         & 
& cplhhHpmSvImcSe1(3,2,6,6),cplhhSeSvImcHpm1(3,6,6,2),cplHpmSvImSvImcHpm1(2,6,6,2),      & 
& cplSdSvImSvImcSdaa(6,6,6,6),cplSeSvImSvImcSe1(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),    & 
& cplSvImSvImSvImSvIm1(6,6,6,6),cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),& 
& cplSvImSvImcVWmVWm1(6,6),cplSvImSvImVZVZ1(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MSvIm(gt3) 


! {Ah, Ah, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhSvImSvIm(i1,gt2,i3)
coup3 = cplAhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, SvIm}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhSvImSvIm(i1,gt2,i3)
coup3 = cplhhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
coup3 = cplAhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, SvRe}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
coup3 = cplhhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MSvRe(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
coup3 = cplSvImSvReVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Cha, Cha, Fe}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaFeSvImL(i1,i3,gt2)
coup2R = cplcChaFeSvImR(i1,i3,gt2)
coup3L = cplcFeChaSvImL(i3,i2,gt3)
coup3R = cplcFeChaSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Fv}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopFv)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i1,i3,gt2)
coup2R = cplChiFvSvImR(i1,i3,gt2)
coup3L = cplChiFvSvImL(i2,i3,gt3)
coup3R = cplChiFvSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Cha}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeChaSvImL(i1,i3,gt2)
coup2R = cplcFeChaSvImR(i1,i3,gt2)
coup3L = cplcChaFeSvImL(i3,i2,gt3)
coup3R = cplcChaFeSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Chi}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i3,i1,gt2)
coup2R = cplChiFvSvImR(i3,i1,gt2)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, SvIm}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhSvImSvIm(i1,gt2,i3)
coup3 = cplAhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, SvIm}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhSvImSvIm(i1,gt2,i3)
coup3 = cplhhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, SvRe}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
coup3 = cplAhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, SvRe}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
coup3 = cplhhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
coup3 = cplHpmSvImcSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
coup3 = cplSvImcSeVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Se, Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = cplSeSvImcHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, VWm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = -cplSvImcSeVWm(gt2,i1)
coup3 = -cplSeSvImcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm, Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
coup3 = cplAhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
coup3 = cplAhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, hh}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
coup3 = cplhhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, hh}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
coup3 = cplhhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
coup3 = cplAhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
coup3 = cplAhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, hh}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
coup3 = cplhhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, hh}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
coup3 = cplhhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, VZ}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MVZ 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = -cplSvImSvReVZ(gt2,i1)
coup3 = cplSvImSvReVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VWm, Hpm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplSeSvImcVWm(i3,gt2)
coup3 = cplHpmSvImcSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSeSvImcVWm(i3,gt2)
coup3 = cplSvImcSeVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, SvRe}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = -cplSvImSvReVZ(gt2,i3)
coup3 = cplAhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, SvRe}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopSvRe)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZ 
ML3 = MSvRe(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = -cplSvImSvReVZ(gt2,i3)
coup3 = cplSvImSvReVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Cha], bar[Cha], bar[Fe]}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcFeChaSvImL(i3,i1,gt2)
coup2R = cplcFeChaSvImR(i3,i1,gt2)
coup3L = cplcChaFeSvImL(i2,i3,gt3)
coup3R = cplcChaFeSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], bar[Cha]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcChaFeSvImL(i3,i1,gt2)
coup2R = cplcChaFeSvImR(i3,i1,gt2)
coup3L = cplcFeChaSvImL(i2,i3,gt3)
coup3R = cplcFeChaSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[Se]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmSvImcSe(i1,gt2,i3)
coup3 = cplSeSvImcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[Se]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmSvImcSe(i1,gt2,i3)
coup3 = -cplSeSvImcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Se], conj[Se], conj[Hpm]}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvImcHpm(i1,gt2,i3)
coup3 = cplHpmSvImcSe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], conj[VWm]}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvImcVWm(i1,gt2)
coup3 = cplSvImcSeVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Se]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = -cplSvImcSeVWm(gt2,i3)
coup3 = cplSeSvImcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Se]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplSvImcSeVWm(gt2,i3)
coup3 = -cplSeSvImcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhSvImSvIm1(i1,i2,gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhSvImSvIm1(i1,i2,gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhSvImSvIm1(i1,i2,gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmSvImSvImcHpm1(i2,gt2,gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdSvImSvImcSdaa(i2,gt2,gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSeSvImSvImcSe1(i2,gt2,gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSuSvImSvImcSuaa(i2,gt2,gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSvImSvImSvImSvIm1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplSvImSvImSvImSvRe1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSvImSvImSvReSvRe1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSvImSvImcVWmVWm1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplSvImSvImVZVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(i1,gt1,gt3,i2)
coup2 = cplAhSvImSvIm(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(i1,gt1,gt3,i2)
coup2 = cplAhSvImSvRe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvIm}
If ((Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvIm1(gt1,i1,gt3,i2)
coup2 = cplhhSvImSvIm(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvRe}
If ((Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvImSvRe1(gt1,i1,gt3,i2)
coup2 = cplhhSvImSvRe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvImcSe1(gt1,i1,gt3,i2)
coup2 = cplSeSvImcHpm(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvImcHpm1(gt1,i1,gt3,i2)
coup2 = cplHpmSvImcSe(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(i1,gt1,gt2,i2)
coup2 = cplAhSvImSvIm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(i1,gt1,gt2,i2)
coup2 = cplAhSvImSvRe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvIm}
If ((Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvIm1(gt1,i1,gt2,i2)
coup2 = cplhhSvImSvIm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvRe}
If ((Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvImSvRe1(gt1,i1,gt2,i2)
coup2 = cplhhSvImSvRe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvImcSe1(gt1,i1,gt2,i2)
coup2 = cplSeSvImcHpm(i2,gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvImcHpm1(gt1,i1,gt2,i2)
coup2 = cplHpmSvImcSe(i2,gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToSvImSvIm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToSvImSvIm(MAh,MCha,MChi,               & 
& MFe,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,               & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,      & 
& cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplcFeFehhL,      & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplAhAhSvImSvIm1,              & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,  & 
& cplhhSeSvImcHpm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,             & 
& cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,     & 
& cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),& 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6), & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSvImcSe(2,6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),& 
& cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplAhAhSvImSvIm1(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),& 
& cplAhhhSvImSvRe1(3,3,6,6),cplhhhhSvImSvIm1(3,3,6,6),cplhhhhSvImSvRe1(3,3,6,6),         & 
& cplhhHpmSvImcSe1(3,2,6,6),cplhhSeSvImcHpm1(3,6,6,2),cplHpmSvImSvImcHpm1(2,6,6,2),      & 
& cplSdSvImSvImcSdaa(6,6,6,6),cplSeSvImSvImcSe1(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),    & 
& cplSvImSvImSvImSvIm1(6,6,6,6),cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),& 
& cplSvImSvImcVWmVWm1(6,6),cplSvImSvImVZVZ1(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MSvIm(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToSvImSvIm


Subroutine Amplitude_Tree_seesaw1nmssm_hhToSvReSvIm(cplhhSvImSvRe,Mhh,MSvIm,          & 
& MSvRe,Mhh2,MSvIm2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MSvIm(6),MSvRe(6),Mhh2(3),MSvIm2(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplhhSvImSvRe(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvIm(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSvImSvRe(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhToSvReSvIm


Subroutine Gamma_Real_seesaw1nmssm_hhToSvReSvIm(MLambda,em,gs,cplhhSvImSvRe,          & 
& Mhh,MSvIm,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSvImSvRe(3,6,6)

Real(dp), Intent(in) :: Mhh(3),MSvIm(6),MSvRe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
Coup = cplhhSvImSvRe(i1,i3,i2)
Mex1 = Mhh(i1)
Mex2 = MSvRe(i2)
Mex3 = MSvIm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhToSvReSvIm


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToSvReSvIm(cplhhSvImSvRe,ctcplhhSvImSvRe,    & 
& Mhh,Mhh2,MSvIm,MSvIm2,MSvRe,MSvRe2,Zfhh,ZfSvIm,ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplhhSvImSvRe(3,6,6)

Complex(dp), Intent(in) :: ctcplhhSvImSvRe(3,6,6)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfSvIm(6,6),ZfSvRe(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvIm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSvImSvRe(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhSvImSvRe(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt2)*cplhhSvImSvRe(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt3)*cplhhSvImSvRe(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToSvReSvIm


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToSvReSvIm(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvIm,  & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,          & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvRe1,& 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSu(6),MSvIm(6),           & 
& MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),          & 
& MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),& 
& cplAhSvReSvRe(3,6,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,6),  & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiChihhL(5,5,3), & 
& cplChiChihhR(5,5,3),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),      & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplFvFvhhL(6,6,3),   & 
& cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmSvImcSe(2,6,6),           & 
& cplHpmSvRecSe(2,6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),     & 
& cplSeSvRecVWm(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),           & 
& cplAhAhSvImSvRe1(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),         & 
& cplAhhhSvReSvRe1(3,3,6,6),cplhhhhSvImSvIm1(3,3,6,6),cplhhhhSvImSvRe1(3,3,6,6),         & 
& cplhhhhSvReSvRe1(3,3,6,6),cplhhHpmSvImcSe1(3,2,6,6),cplhhHpmSvRecSe1(3,2,6,6),         & 
& cplhhSeSvImcHpm1(3,6,6,2),cplhhSeSvRecHpm1(3,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),      & 
& cplSeSvImSvRecSe1(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),cplSvImSvImSvImSvRe1(6,6,6,6),  & 
& cplSvImSvImSvReSvRe1(6,6,6,6),cplSvImSvReSvReSvRe1(6,6,6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvIm(gt3) 


! {Ah, Ah, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
coup3 = cplAhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, SvIm}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
coup3 = cplhhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
coup3 = cplAhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, SvRe}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
coup3 = cplhhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MSvRe(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
coup3 = cplSvImSvReVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Cha, Cha, Fe}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i1,i3,gt2)
coup2R = cplcChaFeSvReR(i1,i3,gt2)
coup3L = cplcFeChaSvImL(i3,i2,gt3)
coup3R = cplcFeChaSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Fv}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopFv)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,i3,gt2)
coup2R = cplChiFvSvReR(i1,i3,gt2)
coup3L = cplChiFvSvImL(i2,i3,gt3)
coup3R = cplChiFvSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Cha}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeChaSvReL(i1,i3,gt2)
coup2R = cplcFeChaSvReR(i1,i3,gt2)
coup3L = cplcChaFeSvImL(i3,i2,gt3)
coup3R = cplcChaFeSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Chi}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i3,i1,gt2)
coup2R = cplChiFvSvReR(i3,i1,gt2)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, SvIm}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
coup3 = cplAhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, SvIm}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
coup3 = cplhhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, SvRe}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
coup3 = cplAhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, SvRe}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
coup3 = cplhhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = cplHpmSvImcSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = cplSvImcSeVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Se, Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = cplSeSvImcHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, VWm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = -cplSvRecSeVWm(gt2,i1)
coup3 = -cplSeSvImcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm, Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
coup3 = cplAhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
coup3 = cplAhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, hh}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
coup3 = cplhhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, hh}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
coup3 = cplhhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, VZ}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MVZ 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplSvImSvReVZ(i1,gt2)
coup3 = cplSvImSvReVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvIm, Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
coup3 = cplAhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
coup3 = cplAhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, hh}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
coup3 = cplhhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, hh}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
coup3 = cplhhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplSeSvRecVWm(i3,gt2)
coup3 = cplHpmSvImcSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSeSvRecVWm(i3,gt2)
coup3 = cplSvImcSeVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, SvIm}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplSvImSvReVZ(i3,gt2)
coup3 = cplAhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {bar[Cha], bar[Cha], bar[Fe]}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcFeChaSvReL(i3,i1,gt2)
coup2R = cplcFeChaSvReR(i3,i1,gt2)
coup3L = cplcChaFeSvImL(i2,i3,gt3)
coup3R = cplcChaFeSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], bar[Cha]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcChaFeSvReL(i3,i1,gt2)
coup2R = cplcChaFeSvReR(i3,i1,gt2)
coup3L = cplcFeChaSvImL(i2,i3,gt3)
coup3R = cplcFeChaSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[Se]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmSvRecSe(i1,gt2,i3)
coup3 = cplSeSvImcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[Se]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmSvRecSe(i1,gt2,i3)
coup3 = -cplSeSvImcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Se], conj[Se], conj[Hpm]}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
coup3 = cplHpmSvImcSe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], conj[VWm]}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvRecVWm(i1,gt2)
coup3 = cplSvImcSeVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Se]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = -cplSvRecSeVWm(gt2,i3)
coup3 = cplSeSvImcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Se]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplSvRecSeVWm(gt2,i3)
coup3 = -cplSeSvImcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhSvImSvRe1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhSvImSvRe1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhSvImSvRe1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmSvImSvRecHpm1(i2,gt3,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSeSvImSvRecSe1(i2,gt3,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSuSvImSvRecSuaa(i2,gt3,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSvImSvImSvImSvRe1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplSvImSvImSvReSvRe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSvImSvReSvReSvRe1(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(i1,gt1,gt3,i2)
coup2 = cplAhSvImSvRe(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(i1,gt1,gt3,i2)
coup2 = cplAhSvReSvRe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvIm}
If ((Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvIm1(gt1,i1,gt3,i2)
coup2 = cplhhSvImSvRe(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvRe}
If ((Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvImSvRe1(gt1,i1,gt3,i2)
coup2 = cplhhSvReSvRe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvImcSe1(gt1,i1,gt3,i2)
coup2 = cplSeSvRecHpm(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvImcHpm1(gt1,i1,gt3,i2)
coup2 = cplHpmSvRecSe(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvRe1(i1,gt1,i2,gt2)
coup2 = cplAhSvImSvIm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvReSvRe1(i1,gt1,gt2,i2)
coup2 = cplAhSvImSvRe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvIm}
If ((Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvRe1(gt1,i1,i2,gt2)
coup2 = cplhhSvImSvIm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvRe}
If ((Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvReSvRe1(gt1,i1,gt2,i2)
coup2 = cplhhSvImSvRe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvRecSe1(gt1,i1,gt2,i2)
coup2 = cplSeSvImcHpm(i2,gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvRecHpm1(gt1,i1,gt2,i2)
coup2 = cplHpmSvImcSe(i2,gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToSvReSvIm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToSvReSvIm(MAh,MCha,MChi,               & 
& MFe,MFv,Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,           & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,  & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,  & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,      & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,           & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,   & 
& cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvIm1,  & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,  & 
& cplhhSeSvRecHpm1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,             & 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSu(6),MSvIm(6),           & 
& MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),          & 
& MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),& 
& cplAhSvReSvRe(3,6,6),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,6),  & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiChihhL(5,5,3), & 
& cplChiChihhR(5,5,3),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),      & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplFvFvhhL(6,6,3),   & 
& cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmSvImcSe(2,6,6),           & 
& cplHpmSvRecSe(2,6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),     & 
& cplSeSvRecVWm(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),           & 
& cplAhAhSvImSvRe1(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),         & 
& cplAhhhSvReSvRe1(3,3,6,6),cplhhhhSvImSvIm1(3,3,6,6),cplhhhhSvImSvRe1(3,3,6,6),         & 
& cplhhhhSvReSvRe1(3,3,6,6),cplhhHpmSvImcSe1(3,2,6,6),cplhhHpmSvRecSe1(3,2,6,6),         & 
& cplhhSeSvImcHpm1(3,6,6,2),cplhhSeSvRecHpm1(3,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),      & 
& cplSeSvImSvRecSe1(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),cplSvImSvImSvImSvRe1(6,6,6,6),  & 
& cplSvImSvImSvReSvRe1(6,6,6,6),cplSvImSvReSvReSvRe1(6,6,6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvIm(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToSvReSvIm


Subroutine Amplitude_Tree_seesaw1nmssm_hhToSvReSvRe(cplhhSvReSvRe,Mhh,MSvRe,          & 
& Mhh2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MSvRe(6),Mhh2(3),MSvRe2(6)

Complex(dp), Intent(in) :: cplhhSvReSvRe(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvRe(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSvReSvRe(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhToSvReSvRe


Subroutine Gamma_Real_seesaw1nmssm_hhToSvReSvRe(MLambda,em,gs,cplhhSvReSvRe,          & 
& Mhh,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSvReSvRe(3,6,6)

Real(dp), Intent(in) :: Mhh(3),MSvRe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
Coup = cplhhSvReSvRe(i1,i2,i3)
Mex1 = Mhh(i1)
Mex2 = MSvRe(i2)
Mex3 = MSvRe(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhToSvReSvRe


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToSvReSvRe(cplhhSvReSvRe,ctcplhhSvReSvRe,    & 
& Mhh,Mhh2,MSvRe,MSvRe2,Zfhh,ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplhhSvReSvRe(3,6,6)

Complex(dp), Intent(in) :: ctcplhhSvReSvRe(3,6,6)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfSvRe(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvRe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSvReSvRe(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhSvReSvRe(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt2)*cplhhSvReSvRe(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt3)*cplhhSvReSvRe(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToSvReSvRe


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToSvReSvRe(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,      & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvRecSe,cplSeSvRecHpm,         & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,           & 
& cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,cplhhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,cplSvReSvRecVWmVWm1,    & 
& cplSvReSvReVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),& 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6), & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),     & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),     & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSvRecSe(2,6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),& 
& cplSvImSvReVZ(6,6),cplSvRecSeVWm(6,6),cplAhAhSvReSvRe1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),& 
& cplAhhhSvReSvRe1(3,3,6,6),cplhhhhSvImSvRe1(3,3,6,6),cplhhhhSvReSvRe1(3,3,6,6),         & 
& cplhhHpmSvRecSe1(3,2,6,6),cplhhSeSvRecHpm1(3,6,6,2),cplHpmSvReSvRecHpm1(2,6,6,2),      & 
& cplSdSvReSvRecSdaa(6,6,6,6),cplSeSvReSvRecSe1(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6),    & 
& cplSvImSvImSvReSvRe1(6,6,6,6),cplSvImSvReSvReSvRe1(6,6,6,6),cplSvReSvReSvReSvRe1(6,6,6,6),& 
& cplSvReSvRecVWmVWm1(6,6),cplSvReSvReVZVZ1(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvRe(gt3) 


! {Ah, Ah, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
coup3 = cplAhSvImSvRe(i2,i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, SvIm}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
coup3 = cplhhSvImSvRe(i2,i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MSvIm(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
coup3 = -cplSvImSvReVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
coup3 = cplAhSvReSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, SvRe}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
coup3 = cplhhSvReSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Cha, Fe}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i1,i3,gt2)
coup2R = cplcChaFeSvReR(i1,i3,gt2)
coup3L = cplcFeChaSvReL(i3,i2,gt3)
coup3R = cplcFeChaSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Fv}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopFv)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,i3,gt2)
coup2R = cplChiFvSvReR(i1,i3,gt2)
coup3L = cplChiFvSvReL(i2,i3,gt3)
coup3R = cplChiFvSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Cha}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeChaSvReL(i1,i3,gt2)
coup2R = cplcFeChaSvReR(i1,i3,gt2)
coup3L = cplcChaFeSvReL(i3,i2,gt3)
coup3R = cplcChaFeSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Chi}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i3,i1,gt2)
coup2R = cplChiFvSvReR(i3,i1,gt2)
coup3L = cplChiFvSvReL(i3,i2,gt3)
coup3R = cplChiFvSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, SvIm}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
coup3 = cplAhSvImSvRe(i2,i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, SvIm}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
coup3 = cplhhSvImSvRe(i2,i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, SvRe}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
coup3 = cplAhSvReSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, SvRe}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
coup3 = cplhhSvReSvRe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = cplHpmSvRecSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = cplSvRecSeVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Se, Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = cplSeSvRecHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, VWm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = -cplSvRecSeVWm(gt2,i1)
coup3 = -cplSeSvRecVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm, Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
coup3 = cplAhSvImSvRe(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
coup3 = cplAhSvReSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, hh}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
coup3 = cplhhSvImSvRe(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, hh}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
coup3 = cplhhSvReSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, VZ}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MVZ 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSvImSvReVZ(i1,gt2)
coup3 = -cplSvImSvReVZ(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvIm, Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
coup3 = cplAhSvImSvRe(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
coup3 = cplAhSvReSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, hh}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
coup3 = cplhhSvImSvRe(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, hh}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
coup3 = cplhhSvReSvRe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplSeSvRecVWm(i3,gt2)
coup3 = cplHpmSvRecSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSeSvRecVWm(i3,gt2)
coup3 = cplSvRecSeVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, SvIm}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplSvImSvReVZ(i3,gt2)
coup3 = cplAhSvImSvRe(i2,i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, SvIm}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopSvIm)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZ 
ML3 = MSvIm(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplSvImSvReVZ(i3,gt2)
coup3 = -cplSvImSvReVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Cha], bar[Cha], bar[Fe]}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplcFeChaSvReL(i3,i1,gt2)
coup2R = cplcFeChaSvReR(i3,i1,gt2)
coup3L = cplcChaFeSvReL(i2,i3,gt3)
coup3R = cplcChaFeSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], bar[Cha]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcChaFeSvReL(i3,i1,gt2)
coup2R = cplcChaFeSvReR(i3,i1,gt2)
coup3L = cplcFeChaSvReL(i2,i3,gt3)
coup3R = cplcFeChaSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[Se]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmSvRecSe(i1,gt2,i3)
coup3 = cplSeSvRecHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[Se]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmSvRecSe(i1,gt2,i3)
coup3 = -cplSeSvRecVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Se], conj[Se], conj[Hpm]}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
coup3 = cplHpmSvRecSe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], conj[VWm]}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvRecVWm(i1,gt2)
coup3 = cplSvRecSeVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Se]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = -cplSvRecSeVWm(gt2,i3)
coup3 = cplSeSvRecHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Se]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
    Do i3=1,6
ML1 = MVWm 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplSvRecSeVWm(gt2,i3)
coup3 = -cplSeSvRecVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhSvReSvRe1(i1,i2,gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhhhSvReSvRe1(i1,i2,gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhSvReSvRe1(i1,i2,gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmSvReSvRecHpm1(i2,gt2,gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdSvReSvRecSdaa(i2,gt2,gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSeSvReSvRecSe1(i2,gt2,gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSuSvReSvRecSuaa(i2,gt2,gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSvImSvImSvReSvRe1(i1,i2,gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplSvImSvReSvReSvRe1(i1,gt2,gt3,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSvReSvReSvReSvRe1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplSvReSvRecVWmVWm1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplSvReSvReVZVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvRe1(i1,gt1,i2,gt3)
coup2 = cplAhSvImSvRe(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvReSvRe1(i1,gt1,gt3,i2)
coup2 = cplAhSvReSvRe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvIm}
If ((Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvRe1(gt1,i1,i2,gt3)
coup2 = cplhhSvImSvRe(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvRe}
If ((Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvReSvRe1(gt1,i1,gt3,i2)
coup2 = cplhhSvReSvRe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvRecSe1(gt1,i1,gt3,i2)
coup2 = cplSeSvRecHpm(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvRecHpm1(gt1,i1,gt3,i2)
coup2 = cplHpmSvRecSe(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvRe1(i1,gt1,i2,gt2)
coup2 = cplAhSvImSvRe(i1,i2,gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvReSvRe1(i1,gt1,gt2,i2)
coup2 = cplAhSvReSvRe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvIm}
If ((Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvRe1(gt1,i1,i2,gt2)
coup2 = cplhhSvImSvRe(i1,i2,gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {hh, SvRe}
If ((Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvReSvRe1(gt1,i1,gt2,i2)
coup2 = cplhhSvReSvRe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvRecSe1(gt1,i1,gt2,i2)
coup2 = cplSeSvRecHpm(i2,gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvRecHpm1(gt1,i1,gt2,i2)
coup2 = cplHpmSvRecSe(i2,gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToSvReSvRe


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToSvReSvRe(MAh,MCha,MChi,               & 
& MFe,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,               & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,      & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,      & 
& cplcFeFehhR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvRecSe,         & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,cplAhAhSvReSvRe1,              & 
& cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,  & 
& cplhhSeSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,             & 
& cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,     & 
& cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),& 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6), & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),     & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),     & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSvRecSe(2,6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),& 
& cplSvImSvReVZ(6,6),cplSvRecSeVWm(6,6),cplAhAhSvReSvRe1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),& 
& cplAhhhSvReSvRe1(3,3,6,6),cplhhhhSvImSvRe1(3,3,6,6),cplhhhhSvReSvRe1(3,3,6,6),         & 
& cplhhHpmSvRecSe1(3,2,6,6),cplhhSeSvRecHpm1(3,6,6,2),cplHpmSvReSvRecHpm1(2,6,6,2),      & 
& cplSdSvReSvRecSdaa(6,6,6,6),cplSeSvReSvRecSe1(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6),    & 
& cplSvImSvImSvReSvRe1(6,6,6,6),cplSvImSvReSvReSvRe1(6,6,6,6),cplSvReSvReSvReSvRe1(6,6,6,6),& 
& cplSvReSvRecVWmVWm1(6,6),cplSvReSvReVZVZ1(6,6)

Complex(dp), Intent(out) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvRe(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToSvReSvRe


Subroutine Amplitude_Tree_seesaw1nmssm_hhTocVWmVWm(cplhhcVWmVWm,Mhh,MVWm,             & 
& Mhh2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MVWm,Mhh2(3),MVWm2

Complex(dp), Intent(in) :: cplhhcVWmVWm(3)

Complex(dp) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = cplhhcVWmVWm(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhTocVWmVWm


Subroutine Gamma_Real_seesaw1nmssm_hhTocVWmVWm(MLambda,em,gs,cplhhcVWmVWm,            & 
& Mhh,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhcVWmVWm(3)

Real(dp), Intent(in) :: Mhh(3),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3), GammarealGluon(3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
Coup = cplhhcVWmVWm(i1)
Mex1 = Mhh(i1)
Mex2 = MVWm
Mex3 = MVWm
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealGluon(i1) = 0._dp 
 Call hardphotonSVV(Mex1,Mex2,Mex3,MLambda,em,0._dp,1._dp,-1._dp,Coup,Gammarealphoton(i1),kont)
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhTocVWmVWm


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocVWmVWm(cplhhcVWmVWm,ctcplhhcVWmVWm,       & 
& Mhh,Mhh2,MVWm,MVWm2,Zfhh,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MVWm,MVWm2

Complex(dp), Intent(in) :: cplhhcVWmVWm(3)

Complex(dp), Intent(in) :: ctcplhhcVWmVWm(3)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfVWm

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhcVWmVWm(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhcVWmVWm(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfVWm)*cplhhcVWmVWm(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplhhcVWmVWm(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTocVWmVWm


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocVWmVWm(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR, & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,  & 
& cplcgZgWpCVWm,cplcgZgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh,cplhhHpmcHpm,           & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcVWmVP,cplHpmcVWmVZ,           & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,   & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,    & 
& cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,              & 
& cplSvReSvRecVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,       & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcVWm(3,2),cplAhcHpmVWm(3,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),     & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),       & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),           & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),             & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),             & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),               & 
& cplcgZgAhh(3),cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh(3),cplcgAgWmcVWm,               & 
& cplcgZgWmcVWm,cplcgWpCgWpChh(3),cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh(3),             & 
& cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),    & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),           & 
& cplhhVZVZ(3),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),     & 
& cplSeSvRecVWm(6,6),cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),             & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplAhAhcVWmVWm1(3,3),        & 
& cplhhhhcVWmVWm1(3,3),cplhhHpmcVWmVP1(3,2),cplhhHpmcVWmVZ1(3,2),cplhhcHpmVPVWm1(3,2),   & 
& cplhhcHpmVWmVZ1(3,2),cplHpmcHpmcVWmVWm1(2,2),cplSdcSdcVWmVWmaa(6,6),cplSecSecVWmVWm1(6,6),& 
& cplSucSucVWmVWmaa(6,6),cplSvImSvImcVWmVWm1(6,6),cplSvReSvRecVWmVWm1(6,6),              & 
& cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,          & 
& cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 


! {Ah, Ah, Hpm}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhHpmcVWm(i1,i3)
coup3 = -cplAhcHpmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, hh, Hpm}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhHpmcVWm(i1,i3)
coup3 = -cplhhcHpmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, Hpm}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhHpmcVWm(i1,i3)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Chi, Chi, Cha}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = -cplChiChacVWmR(i1,i3)
coup2R = -cplChiChacVWmL(i1,i3)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fd}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFdcVWmR(i1,i3)
coup2R = -cplcFuFdcVWmL(i1,i3)
coup3L = -cplcFdFuVWmR(i3,i2)
coup3R = -cplcFdFuVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fe}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = -cplFvFecVWmR(i1,i3)
coup2R = -cplFvFecVWmL(i1,i3)
coup3L = -cplcFeFvVWmR(i3,i2)
coup3R = -cplcFeFvVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gP, gZ, gWm}
If ((Include_in_loopgA).and.(Include_in_loopgZ).and.(Include_in_loopgWm)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgAgWmcVWm
coup3 = cplcgWmgZVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gWmC, gWmC, gP}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgA)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgAcVWm
coup3 = cplcgAgWpCVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gWmC, gWmC, gZ}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgZcVWm
coup3 = cplcgZgWpCVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gWm}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWm)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWmcVWm
coup3 = cplcgWmgZVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, Ah, Hpm}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhHpmcVWm(i1,i3)
coup3 = -cplAhcHpmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, Hpm}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHpmcVWm(i1,i3)
coup3 = -cplhhcHpmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VWm}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhcVWmVWm(i1)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su, Sd}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = -cplSdcSucVWm(i3,i1)
coup3 = -cplSucSdVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, Se}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = -cplSeSvImcVWm(i3,i1)
coup3 = -cplSvImcSeVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, Se}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = -cplSeSvImcVWm(i3,i1)
coup3 = -cplSvRecSeVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, Se}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = -cplSeSvRecVWm(i3,i1)
coup3 = -cplSvImcSeVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, Se}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = -cplSeSvRecVWm(i3,i1)
coup3 = -cplSvRecSeVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VZ, Ah, Hpm}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2 = cplHpmcVWmVZ(i3)
coup3 = -cplAhcHpmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, Hpm}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpmcVWmVZ(i3)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, VWm}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcVWmVWmVZ
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[Cha], bar[Cha], Chi}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,5
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChahhL(i1,i2,gt1)
coup1R = cplcChaChahhR(i1,i2,gt1)
coup2L = cplChiChacVWmL(i3,i1)
coup2R = cplChiChacVWmR(i3,i1)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], bar[Fu]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcVWmL(i3,i1)
coup2R = cplcFuFdcVWmR(i3,i1)
coup3L = cplcFdFuVWmL(i2,i3)
coup3R = cplcFdFuVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], Fv}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFecVWmL(i3,i1)
coup2R = cplFvFecVWmR(i3,i1)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[gWm], bar[gWm], bar[gP]}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgA)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgAgWmcVWm
coup3 = cplcgWmgAVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gWm], bar[gWm], bar[gZ]}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgZgWmcVWm
coup3 = cplcgWmgZVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gP], bar[gWmC]}
If ((Include_in_loopgZ).and.(Include_in_loopgA).and.(Include_in_loopgWpC)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgWpCgZcVWm
coup3 = cplcgAgWpCVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gWmC]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWpC)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWpCgZcVWm
coup3 = cplcgZgWpCVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hpm], conj[Hpm], Ah}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = -cplAhHpmcVWm(i3,i1)
coup3 = cplAhcHpmVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], hh}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = -cplhhHpmcVWm(i3,i1)
coup3 = cplhhcHpmVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], hh}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = -cplhhHpmcVWm(i3,i1)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmcVWmVP(i1)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], VP}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcVWmVP(i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[Hpm], conj[Hpm], VZ}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmcVWmVZ(i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], VZ}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcVWmVZ(i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[Sd], conj[Sd], conj[Su]}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2 = cplSdcSucVWm(i1,i3)
coup3 = cplSucSdVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], SvIm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvImcVWm(i1,i3)
coup3 = cplSvImcSeVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], conj[Se], SvRe}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSecSe(gt1,i2,i1)
coup2 = cplSeSvRecVWm(i1,i3)
coup3 = cplSvRecSeVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], conj[Hpm], hh}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(i3)
coup3 = cplhhcHpmVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], hh}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcVWmVWm(i3)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = cplcVWmVPVWm
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {conj[VWm], conj[VWm], VP}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWm
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWm], conj[Hpm], VZ}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = -cplcVWmVWmVZ
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {conj[VWm], conj[VWm], VZ}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplcVWmVWmVZ
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhcVWmVWm1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhcVWmVWm1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmcHpmcVWmVWm1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdcSdcVWmVWmaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSecSecVWmVWm1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSucSucVWmVWmaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSvImSvImcVWmVWm1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSvReSvRecVWmVWm1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmcVWmVWmVWm1Q
coup2b = coup2 
coup2 = cplcVWmcVWmVWmVWm2Q
coup2a = coup2 
coup2 = cplcVWmcVWmVWmVWm3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcVWmVWmVZVZ1Q
coup2a = coup2 
coup2 = cplcVWmVWmVZVZ2Q
coup2b = coup2 
coup2 = cplcVWmVWmVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, VWm}
If ((Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,i1)
coup2 = cplhhcVWmVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VP, Hpm}
If ((Include_in_loopVP).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVPVWm1(gt1,i2)
coup2 = cplHpmcVWmVP(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 


! {VZ, Hpm}
If ((Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVZ 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWmVZ1(gt1,i2)
coup2 = cplHpmcVWmVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 


! {hh, conj[VWm]}
If ((Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,i1)
coup2 = cplhhcVWmVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVP 
coup1 = cplhhHpmcVWmVP1(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hpm, VZ}
If ((Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVZ 
coup1 = cplhhHpmcVWmVZ1(gt1,i1)
coup2 = cplcHpmVWmVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTocVWmVWm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocVWmVWm(MAh,MCha,MChi,MFd,            & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR, & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,  & 
& cplcgZgWpCVWm,cplcgZgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh,cplhhHpmcHpm,           & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcVWmVP,cplHpmcVWmVZ,           & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,   & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,    & 
& cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,              & 
& cplSvReSvRecVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,       & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcVWm(3,2),cplAhcHpmVWm(3,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),     & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),       & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),           & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),             & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),             & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),               & 
& cplcgZgAhh(3),cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh(3),cplcgAgWmcVWm,               & 
& cplcgZgWmcVWm,cplcgWpCgWpChh(3),cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh(3),             & 
& cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),    & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),           & 
& cplhhVZVZ(3),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),     & 
& cplSeSvRecVWm(6,6),cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),             & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplAhAhcVWmVWm1(3,3),        & 
& cplhhhhcVWmVWm1(3,3),cplhhHpmcVWmVP1(3,2),cplhhHpmcVWmVZ1(3,2),cplhhcHpmVPVWm1(3,2),   & 
& cplhhcHpmVWmVZ1(3,2),cplHpmcHpmcVWmVWm1(2,2),cplSdcSdcVWmVWmaa(6,6),cplSecSecVWmVWm1(6,6),& 
& cplSucSucVWmVWmaa(6,6),cplSvImSvImcVWmVWm1(6,6),cplSvReSvRecVWmVWm1(6,6),              & 
& cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,          & 
& cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 


! {conj[Hpm], conj[Hpm], VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmcVWmVP(i1)
coup3 = cplcHpmVPVWm(i2)
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], VP}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcVWmVP(i1)
coup3 = cplcVWmVPVWm
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = cplcVWmVPVWm
coup3 = cplcHpmVPVWm(i2)
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {conj[VWm], conj[VWm], VP}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWm
coup3 = cplcVWmVPVWm
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, Hpm}
If ((Include_in_loopVP).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVPVWm1(gt1,i2)
coup2 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 


! {Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVP 
coup1 = cplhhHpmcVWmVP1(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTocVWmVWm


Subroutine Amplitude_Tree_seesaw1nmssm_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MVZ,Mhh2(3),MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(3)

Complex(dp) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplhhVZVZ(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_hhToVZVZ


Subroutine Gamma_Real_seesaw1nmssm_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,              & 
& MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhVZVZ(3)

Real(dp), Intent(in) :: Mhh(3),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3), GammarealGluon(3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,3
Coup = cplhhVZVZ(i1)
Mex1 = Mhh(i1)
Mex2 = MVZ
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealGluon(i1) = 0._dp 
 Gammarealphoton(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_seesaw1nmssm_hhToVZVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToVZVZ(cplhhVZVZ,ctcplhhVZVZ,Mhh,            & 
& Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(3)

Complex(dp), Intent(in) :: ctcplhhVZVZ(3)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfVZ

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhVZVZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhVZVZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToVZVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,        & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,            & 
& cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,           & 
& cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,       & 
& cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),            & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),         & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6), & 
& cplFvFvVZR(6,6),cplcgWmgWmhh(3),cplcgWmgWmVZ,cplcgWpCgWpChh(3),cplcgWpCgWpCVZ,         & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvReSvRe(3,6,6),         & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),      & 
& cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),    & 
& cplcVWmVWmVZ,cplAhAhVZVZ1(3,3),cplhhhhVZVZ1(3,3),cplhhHpmcVWmVZ1(3,2),cplhhcHpmVWmVZ1(3,2),& 
& cplHpmcHpmVZVZ1(2,2),cplSdcSdVZVZaa(6,6),cplSecSeVZVZ1(6,6),cplSucSuVZVZaa(6,6),       & 
& cplSvImSvImVZVZ1(6,6),cplSvReSvReVZVZ1(6,6),cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,         & 
& cplcVWmVWmVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVZ(i1,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVZ(i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = -cplcChaChaVZR(i1,i3)
coup2R = -cplcChaChaVZL(i1,i3)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Chi}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,5
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = -cplChiChiVZR(i1,i3)
coup2R = -cplChiChiVZL(i1,i3)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVZR(i1,i3)
coup2R = -cplcFdFdVZL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVZR(i1,i3)
coup2R = -cplcFeFeVZL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVZR(i1,i3)
coup2R = -cplcFuFuVZL(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = -cplFvFvVZR(i1,i3)
coup2R = -cplFvFvVZL(i1,i3)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmVZ
coup3 = cplcgWmgWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCVZ
coup3 = cplcgWpCgWpCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZ(i3,i1)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVZVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = -cplHpmcHpmVZ(i3,i1)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = -cplHpmcHpmVZ(i3,i1)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplcHpmVWmVZ(i1)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = cplcHpmVWmVZ(i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = -cplSdcSdVZ(i3,i1)
coup3 = -cplSdcSdVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = -cplSecSeVZ(i3,i1)
coup3 = -cplSecSeVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = -cplSucSuVZ(i3,i1)
coup3 = -cplSucSuVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSvImSvReVZ(i1,i3)
coup3 = -cplSvImSvReVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, SvIm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = -cplSvImSvReVZ(i3,i1)
coup3 = cplSvImSvReVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = cplHpmcVWmVZ(i3)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHpmcVWmVZ(i3)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = -cplcVWmVWmVZ
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VWm, VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplcVWmVWmVZ
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2 = cplhhVZVZ(i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcHpmVZ(i1,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmcVWmVZ(i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcVWmVZ(i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = cplcHpmVWmVZ(i3)
coup3 = cplHpmcHpmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHpmVWmVZ(i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = cplcVWmVWmVZ
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmcHpmVZVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdcSdVZVZaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSecSeVZVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSucSuVZVZaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {SvIm, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplSvImSvImVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {SvRe, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplSvReSvReVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVWmVZVZ1Q
coup2a = coup2 
coup2 = cplcVWmVWmVZVZ2Q
coup2b = coup2 
coup2 = cplcVWmVWmVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVZ1(gt1,i1)
coup2 = cplcHpmVWmVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWmVZ1(gt1,i2)
coup2 = cplHpmcVWmVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVZ1(gt1,i1)
coup2 = cplcHpmVWmVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWmVZ1(gt1,i2)
coup2 = cplHpmcVWmVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToVZVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToVZVZ(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,        & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,            & 
& cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,           & 
& cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,       & 
& cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),            & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),         & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6), & 
& cplFvFvVZR(6,6),cplcgWmgWmhh(3),cplcgWmgWmVZ,cplcgWpCgWpChh(3),cplcgWpCgWpCVZ,         & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvReSvRe(3,6,6),         & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),      & 
& cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),    & 
& cplcVWmVWmVZ,cplAhAhVZVZ1(3,3),cplhhhhVZVZ1(3,3),cplhhHpmcVWmVZ1(3,2),cplhhcHpmVWmVZ1(3,2),& 
& cplHpmcHpmVZVZ1(2,2),cplSdcSdVZVZaa(6,6),cplSecSeVZVZ1(6,6),cplSucSuVZVZaa(6,6),       & 
& cplSvImSvImVZVZ1(6,6),cplSvReSvReVZVZ1(6,6),cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,         & 
& cplcVWmVWmVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToVZVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToAhVP(cplAhhhVZ,ctcplAhhhVZ,MAh,            & 
& MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3)

Complex(dp), Intent(in) :: ctcplAhhhVZ(3,3)

Complex(dp), Intent(in) :: ZfAh(3,3),Zfhh(3,3),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplAhhhVZ(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToAhVP


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToAhVP(MAh,MCha,MFd,MFe,MFu,               & 
& Mhh,MHpm,MSd,MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,               & 
& MSe2,MSu2,MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,               & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,         & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,             & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,       & 
& cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MFd(3),MFe(3),MFu(3),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),              & 
& MVP,MVWm,MAh2(3),MCha2(2),MFd2(3),MFe2(3),MFu2(3),Mhh2(3),MHpm2(2),MSd2(6),            & 
& MSe2(6),MSu2(6),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),      & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),       & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(3),cplcgWmgWmVP,cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),   & 
& cplSecSeVP(6,6),cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplAhHpmcVWmVP1(3,2),     & 
& cplAhcHpmVPVWm1(3,2),cplhhHpmcVWmVP1(3,2),cplhhcHpmVPVWm1(3,2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVP 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaChaAhL(i1,i3,gt2)
coup2R = cplcChaChaAhR(i1,i3,gt2)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3,gt2)
coup2R = cplcFdFdAhR(i1,i3,gt2)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3,gt2)
coup2R = cplcFeFeAhR(i1,i3,gt2)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3,gt2)
coup2R = cplcFuFuAhR(i1,i3,gt2)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmAh(gt2)
coup3 = cplcgWmgWmVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCAh(gt2)
coup3 = cplcgWpCgWpCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplAhHpmcHpm(gt2,i3,i1)
coup3 = -cplHpmcHpmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplAhHpmcHpm(gt2,i3,i1)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplAhcHpmVWm(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplAhcHpmVWm(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplAhSdcSd(gt2,i3,i1)
coup3 = -cplSdcSdVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplAhSecSe(gt2,i3,i1)
coup3 = -cplSecSeVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplAhSucSu(gt2,i3,i1)
coup3 = -cplSucSuVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplAhHpmcVWm(gt2,i3)
coup3 = -cplHpmcHpmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhHpmcVWm(gt2,i3)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplAhHpmcHpm(gt2,i1,i3)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplAhHpmcVWm(gt2,i1)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplAhHpmcVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplAhcHpmVWm(gt2,i3)
coup3 = cplHpmcHpmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhcHpmVWm(gt2,i3)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = cplAhcHpmVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = cplAhHpmcVWmVP1(gt2,i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVP1(gt1,i1)
coup2 = cplAhcHpmVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVPVWm1(gt1,i2)
coup2 = cplAhHpmcVWm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToAhVP


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToAhVP(MAh,MCha,MFd,MFe,MFu,            & 
& Mhh,MHpm,MSd,MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,               & 
& MSe2,MSu2,MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,               & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,         & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,             & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,       & 
& cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MFd(3),MFe(3),MFu(3),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),              & 
& MVP,MVWm,MAh2(3),MCha2(2),MFd2(3),MFe2(3),MFu2(3),Mhh2(3),MHpm2(2),MSd2(6),            & 
& MSe2(6),MSu2(6),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),      & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),       & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(3),cplcgWmgWmVP,cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),   & 
& cplSecSeVP(6,6),cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplAhHpmcVWmVP1(3,2),     & 
& cplAhcHpmVPVWm1(3,2),cplhhHpmcVWmVP1(3,2),cplhhcHpmVPVWm1(3,2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToAhVP


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToGluGlu(MGlu,MGlu2,Mhh,Mhh2,ZffG,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MGlu,MGlu2,Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: ZffG,Zfhh(3,3)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MGlu 
Mex3 = MGlu 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
! Vanishing 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToGluGlu


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToGluGlu(MFd,MFu,MGlu,Mhh,MSd,             & 
& MSu,MFd2,MFu2,MGlu2,Mhh2,MSd2,MSu2,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,              & 
& cplcFdFdhhR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,            & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),MGlu,Mhh(3),MSd(6),MSu(6),MFd2(3),MFu2(3),MGlu2,Mhh2(3),MSd2(6),MSu2(6)

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),            & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplhhSdcSd(3,6,6),cplhhSucSu(3,6,6)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MGlu 
Mex3 = MGlu 


! {Fd, Fd, Sd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdGluSdL(i1,i3)
coup2R = cplcFdGluSdR(i1,i3)
coup3L = cplGluFdcSdL(i2,i3)
coup3R = cplGluFdcSdR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Su}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuGluSuL(i1,i3)
coup2R = cplcFuGluSuR(i1,i3)
coup3L = cplGluFucSuL(i2,i3)
coup3R = cplGluFucSuR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do
End if 


! {Sd, Sd, Fd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Fu}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], conj[Sd]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplGluFdcSdL(i1,i3)
coup2R = cplGluFdcSdR(i1,i3)
coup3L = cplcFdGluSdL(i2,i3)
coup3R = cplcFdGluSdR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], conj[Su]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplGluFucSuL(i1,i3)
coup2R = cplGluFucSuR(i1,i3)
coup3L = cplcFuGluSuL(i2,i3)
coup3R = cplcFuGluSuR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Sd], conj[Sd], bar[Fd]}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = cplhhSdcSd(gt1,i2,i1)
coup2L = cplcFdGluSdL(i3,i1)
coup2R = cplcFdGluSdR(i3,i1)
coup3L = cplGluFdcSdL(i3,i2)
coup3R = cplGluFdcSdR(i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Su], conj[Su], bar[Fu]}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = cplhhSucSu(gt1,i2,i1)
coup2L = cplcFuGluSuL(i3,i1)
coup2R = cplcFuGluSuR(i3,i1)
coup3L = cplGluFucSuL(i3,i2)
coup3R = cplGluFucSuR(i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do
End if 
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToGluGlu


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToGluGlu(MFd,MFu,MGlu,Mhh,              & 
& MSd,MSu,MFd2,MFu2,MGlu2,Mhh2,MSd2,MSu2,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,            & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),MGlu,Mhh(3),MSd(6),MSu(6),MFd2(3),MFu2(3),MGlu2,Mhh2(3),MSd2(6),MSu2(6)

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),            & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplhhSdcSd(3,6,6),cplhhSucSu(3,6,6)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MGlu 
Mex3 = MGlu 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToGluGlu


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTohhVP(Mhh,Mhh2,MVP,MVP2,Zfhh,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MVP,MVP2

Complex(dp), Intent(in) :: Zfhh(3,3),ZfVP

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTohhVP


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTohhVP(MCha,MFd,MFe,MFu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,              & 
& cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,       & 
& cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,             & 
& cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,            & 
& cplhhcHpmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MCha2(2),MFd2(3),MFe2(3),MFu2(3),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),             & 
& MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),      & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(3),cplcgWmgWmVP,cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),   & 
& cplSecSeVP(6,6),cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplhhHpmcVWmVP1(3,2),     & 
& cplhhcHpmVPVWm1(3,2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaChahhL(i1,i3,gt2)
coup2R = cplcChaChahhR(i1,i3,gt2)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmhh(gt2)
coup3 = cplcgWmgWmVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpChh(gt2)
coup3 = cplcgWpCgWpCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplhhHpmcHpm(gt2,i3,i1)
coup3 = -cplHpmcHpmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplhhHpmcHpm(gt2,i3,i1)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplhhcHpmVWm(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplhhcHpmVWm(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplhhSdcSd(gt2,i3,i1)
coup3 = -cplSdcSdVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplhhSecSe(gt2,i3,i1)
coup3 = -cplSecSeVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplhhSucSu(gt2,i3,i1)
coup3 = -cplSucSuVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplhhHpmcVWm(gt2,i3)
coup3 = -cplHpmcHpmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhHpmcVWm(gt2,i3)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VWm, VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplhhHpmcHpm(gt2,i1,i3)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplhhHpmcVWm(gt2,i1)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplhhHpmcVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplhhcHpmVWm(gt2,i3)
coup3 = cplHpmcHpmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcHpmVWm(gt2,i3)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = cplhhcHpmVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = cplhhHpmcVWmVP1(gt2,i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVP1(gt1,i1)
coup2 = cplhhcHpmVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVPVWm1(gt1,i2)
coup2 = cplhhHpmcVWm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTohhVP


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTohhVP(MCha,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,              & 
& cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,       & 
& cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,             & 
& cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,            & 
& cplhhcHpmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MCha2(2),MFd2(3),MFe2(3),MFu2(3),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),             & 
& MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),      & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(3),cplcgWmgWmVP,cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),   & 
& cplSecSeVP(6,6),cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplhhHpmcVWmVP1(3,2),     & 
& cplhhcHpmVPVWm1(3,2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTohhVP


Subroutine Amplitude_WAVE_seesaw1nmssm_hhTohhVZ(Mhh,Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: Zfhh(3,3),ZfVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhTohhVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTohhVZ(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,           & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,          & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,              & 
& cplcVWmVWmVZ,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),& 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),         & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6), & 
& cplFvFvVZR(6,6),cplcgWmgWmhh(3),cplcgWmgWmVZ,cplcgWpCgWpChh(3),cplcgWpCgWpCVZ,         & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmcHpmVZ(2,2), & 
& cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),    & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplhhHpmcVWmVZ1(3,2),cplhhcHpmVWmVZ1(3,2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 


! {Ah, hh, Ah}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhhh(i1,gt2,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhhhhh(i1,gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, hh, VZ}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhhhhh(i1,gt1,i2)
coup2 = -cplAhhhVZ(i1,gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = cplcChaChahhL(i1,i3,gt2)
coup2R = cplcChaChahhR(i1,i3,gt2)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, Chi, Chi}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,5
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(i1,i2,gt1)
coup1R = cplChiChihhR(i1,i2,gt1)
coup2L = cplChiChihhL(i1,i3,gt2)
coup2R = cplChiChihhR(i1,i3,gt2)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvhhL(i1,i3,gt2)
coup2R = cplFvFvhhR(i1,i3,gt2)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmhh(gt2)
coup3 = cplcgWmgWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpChh(gt2)
coup3 = cplcgWpCgWpCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(i3,gt2,i1)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Ah, hh}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(i2,gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplhhHpmcHpm(gt2,i3,i1)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplhhHpmcHpm(gt2,i3,i1)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplhhcHpmVWm(gt2,i1)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHpmcVWm(gt1,i1)
coup2 = cplhhcHpmVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplhhSdcSd(gt2,i3,i1)
coup3 = -cplSdcSdVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplhhSecSe(gt2,i3,i1)
coup3 = -cplSecSeVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplhhSucSu(gt2,i3,i1)
coup3 = -cplSucSuVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvRe, SvIm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvIm(gt2,i1,i3)
coup3 = cplSvImSvReVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, SvIm, SvRe}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(gt1,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i1,i3)
coup3 = -cplSvImSvReVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvRe, SvIm}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvReSvRe(gt1,i1,i2)
coup2 = cplhhSvImSvRe(gt2,i3,i1)
coup3 = cplSvImSvReVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, SvIm, SvRe}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(gt1,i2,i1)
coup2 = cplhhSvReSvRe(gt2,i1,i3)
coup3 = -cplSvImSvReVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplhhHpmcVWm(gt2,i3)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhHpmcVWm(gt2,i3)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplhhcHpmVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VWm, VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcVWmVWm(gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplhhHpmcHpm(gt2,i1,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplhhHpmcVWm(gt2,i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHpmVWm(gt1,i1)
coup2 = cplhhHpmcVWm(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplhhcHpmVWm(gt2,i3)
coup3 = cplHpmcHpmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcHpmVWm(gt2,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplhhHpmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = cplhhcHpmVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = cplhhHpmcVWmVZ1(gt2,i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVZ1(gt1,i1)
coup2 = cplhhcHpmVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWmVZ1(gt1,i2)
coup2 = cplhhHpmcVWm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhTohhVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTohhVZ(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,           & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,          & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,              & 
& cplcVWmVWmVZ,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),& 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),         & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6), & 
& cplFvFvVZR(6,6),cplcgWmgWmhh(3),cplcgWmgWmVZ,cplcgWpCgWpChh(3),cplcgWpCgWpCVZ,         & 
& cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmcHpmVZ(2,2), & 
& cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),    & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplhhHpmcVWmVZ1(3,2),cplhhcHpmVWmVZ1(3,2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhTohhVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToVGVG(Mhh,Mhh2,MVG,MVG2,Zfhh,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MVG,MVG2

Complex(dp), Intent(in) :: Zfhh(3,3),ZfVG

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToVGVG


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToVGVG(MFd,MFu,Mhh,MSd,MSu,MVG,            & 
& MFd2,MFu2,Mhh2,MSd2,MSu2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,cplSdcSdVG,      & 
& cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),Mhh(3),MSd(6),MSu(6),MVG,MFd2(3),MFu2(3),Mhh2(3),MSd2(6),               & 
& MSu2(6),MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),              & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplhhSdcSd(3,6,6),cplhhSucSu(3,6,6),cplSdcSdVG(6,6),cplSucSuVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVGR(i1,i3)
coup2R = -cplcFdFdVGL(i1,i3)
coup3L = -cplcFdFdVGR(i3,i2)
coup3R = -cplcFdFdVGL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVGR(i1,i3)
coup2R = -cplcFuFuVGL(i1,i3)
coup3L = -cplcFuFuVGR(i3,i2)
coup3R = -cplcFuFuVGL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = -cplSdcSdVG(i3,i1)
coup3 = -cplSdcSdVG(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = -cplSucSuVG(i3,i1)
coup3 = -cplSucSuVG(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
coup2 = cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
coup2 = cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToVGVG


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToVGVG(MFd,MFu,Mhh,MSd,MSu,             & 
& MVG,MFd2,MFu2,Mhh2,MSd2,MSu2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,cplSdcSdVG,      & 
& cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),Mhh(3),MSd(6),MSu(6),MVG,MFd2(3),MFu2(3),Mhh2(3),MSd2(6),               & 
& MSu2(6),MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),              & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplhhSdcSd(3,6,6),cplhhSucSu(3,6,6),cplSdcSdVG(6,6),cplSucSuVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToVGVG


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToVPVP(cplhhVZVZ,ctcplhhVZVZ,Mhh,            & 
& Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(3)

Complex(dp), Intent(in) :: ctcplhhVZVZ(3)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfVP,ZfVPVZ,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToVPVP


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToVPVP(MCha,MFd,MFe,MFu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,              & 
& cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,       & 
& cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,             & 
& cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,            & 
& cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,           & 
& cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MCha2(2),MFd2(3),MFe2(3),MFu2(3),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),             & 
& MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),      & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(3),cplcgWmgWmVP,cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),   & 
& cplSecSeVP(6,6),cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplhhHpmcVWmVP1(3,2),     & 
& cplhhcHpmVPVWm1(3,2),cplHpmcHpmVPVP1(2,2),cplSdcSdVPVPaa(6,6),cplSecSeVPVP1(6,6),      & 
& cplSucSuVPVPaa(6,6),cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = -cplcChaChaVPR(i1,i3)
coup2R = -cplcChaChaVPL(i1,i3)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,i3)
coup2R = -cplcFdFdVPL(i1,i3)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVPR(i1,i3)
coup2R = -cplcFeFeVPL(i1,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,i3)
coup2R = -cplcFuFuVPL(i1,i3)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmVP
coup3 = cplcgWmgWmVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCVP
coup3 = cplcgWpCgWpCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = -cplHpmcHpmVP(i3,i1)
coup3 = -cplHpmcHpmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = -cplHpmcHpmVP(i3,i1)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplcHpmVPVWm(i1)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = -cplSdcSdVP(i3,i1)
coup3 = -cplSdcSdVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = -cplSecSeVP(i3,i1)
coup3 = -cplSecSeVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = -cplSucSuVP(i3,i1)
coup3 = -cplSucSuVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = cplHpmcVWmVP(i3)
coup3 = -cplHpmcHpmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHpmcVWmVP(i3)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = cplcVWmVPVWm
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VWm, VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWm
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcHpmVP(i1,i3)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmcVWmVP(i1)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcVWmVP(i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = cplcHpmVPVWm(i3)
coup3 = cplHpmcHpmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHpmVPVWm(i3)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = -cplcVWmVPVWm
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmcHpmVPVP1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdcSdVPVPaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSecSeVPVP1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSucSuVPVPaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVPVWm1Q
coup2b = coup2 
coup2 = cplcVWmVPVPVWm2Q
coup2c = coup2 
coup2 = cplcVWmVPVPVWm3Q
coup2a = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVP1(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVPVWm1(gt1,i2)
coup2 = cplHpmcVWmVP(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVP1(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVPVWm1(gt1,i2)
coup2 = cplHpmcVWmVP(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToVPVP


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToVPVP(MCha,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,              & 
& cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,       & 
& cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,             & 
& cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,            & 
& cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,           & 
& cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MCha2(2),MFd2(3),MFe2(3),MFu2(3),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),             & 
& MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),      & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(3),cplcgWmgWmVP,cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),   & 
& cplSecSeVP(6,6),cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplhhHpmcVWmVP1(3,2),     & 
& cplhhcHpmVPVWm1(3,2),cplHpmcHpmVPVP1(2,2),cplSdcSdVPVPaa(6,6),cplSecSeVPVP1(6,6),      & 
& cplSucSuVPVPaa(6,6),cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToVPVP


Subroutine Amplitude_WAVE_seesaw1nmssm_hhToVPVZ(cplhhVZVZ,ctcplhhVZVZ,Mhh,            & 
& Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(3)

Complex(dp), Intent(in) :: ctcplhhVZVZ(3)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfVP,ZfVZ

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_hhToVPVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToVPVZ(MCha,MFd,MFe,MFu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MVZ,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,               & 
& MSu2,MVP2,MVWm2,MVZ2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,          & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpChh,         & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,         & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,cplSucSuVZ,        & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,   & 
& cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,          & 
& cplSucSuVPVZaa,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MVZ,MCha2(2),MFd2(3),MFe2(3),MFu2(3),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),         & 
& MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),      & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),& 
& cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(3),cplcgWmgWmVP,cplcgWmgWmVZ,           & 
& cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2), & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhcHpmVWm(3,2),               & 
& cplhhcVWmVWm(3),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),   & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSucSuVP(6,6),       & 
& cplSucSuVZ(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,             & 
& cplhhHpmcVWmVP1(3,2),cplhhHpmcVWmVZ1(3,2),cplhhcHpmVPVWm1(3,2),cplhhcHpmVWmVZ1(3,2),   & 
& cplHpmcHpmVPVZ1(2,2),cplSdcSdVPVZaa(6,6),cplSecSeVPVZ1(6,6),cplSucSuVPVZaa(6,6),       & 
& cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(i2,i1,gt1)
coup1R = cplcChaChahhR(i2,i1,gt1)
coup2L = -cplcChaChaVPR(i1,i3)
coup2R = -cplcChaChaVPL(i1,i3)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,i3)
coup2R = -cplcFdFdVPL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVPR(i1,i3)
coup2R = -cplcFeFeVPL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,i3)
coup2R = -cplcFuFuVPL(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWm, gWm, gWm}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmVP
coup3 = cplcgWmgWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {gWmC, gWmC, gWmC}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgWpC)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCVP
coup3 = cplcgWpCgWpCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = -cplHpmcHpmVP(i3,i1)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, VWm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = -cplHpmcHpmVP(i3,i1)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Hpm, Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplcHpmVPVWm(i1)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Sd, Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = -cplSdcSdVP(i3,i1)
coup3 = -cplSdcSdVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = -cplSecSeVP(i3,i1)
coup3 = -cplSecSeVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Su, Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = -cplSucSuVP(i3,i1)
coup3 = -cplSucSuVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Hpm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = cplHpmcVWmVP(i3)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VWm, VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHpmcVWmVP(i3)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhcHpmVWm(gt1,i2)
coup2 = cplcVWmVPVWm
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VWm, VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWm
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcHpmVP(i1,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], conj[Hpm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcHpm(gt1,i2,i1)
coup2 = cplHpmcVWmVP(i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], conj[VWm], conj[VWm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcHpmVWm(gt1,i1)
coup2 = cplHpmcVWmVP(i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[VWm], conj[Hpm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = cplcHpmVPVWm(i3)
coup3 = cplHpmcHpmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWm], conj[VWm], conj[Hpm]}
If ((Include_in_loopVWm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHpmVPVWm(i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplhhHpmcVWm(gt1,i2)
coup2 = -cplcVWmVPVWm
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmcHpm(gt1,i1,i2)
coup2 = cplHpmcHpmVPVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Sd, Sd}
If ((Include_in_loopSd).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(gt1,i1,i2)
coup2 = cplSdcSdVPVZaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Se, Se}
If ((Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(gt1,i1,i2)
coup2 = cplSecSeVPVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Su, Su}
If ((Include_in_loopSu).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(gt1,i1,i2)
coup2 = cplSucSuVPVZaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {VWm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWmVZ1Q
coup2b = coup2 
coup2 = cplcVWmVPVWmVZ2Q
coup2a = coup2 
coup2 = cplcVWmVPVWmVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVZ1(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVWmVZ1(gt1,i2)
coup2 = cplHpmcVWmVP(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplhhHpmcVWmVP1(gt1,i1)
coup2 = cplcHpmVWmVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VWm, Hpm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
coup1 = cplhhcHpmVPVWm1(gt1,i2)
coup2 = cplHpmcVWmVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_hhToVPVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToVPVZ(MCha,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MVZ,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,               & 
& MSu2,MVP2,MVWm2,MVZ2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,          & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpChh,         & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,         & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,cplSucSuVZ,        & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,   & 
& cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,          & 
& cplSucSuVPVZaa,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MVZ,MCha2(2),MFd2(3),MFe2(3),MFu2(3),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),         & 
& MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),      & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),& 
& cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(3),cplcgWmgWmVP,cplcgWmgWmVZ,           & 
& cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2), & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhcHpmVWm(3,2),               & 
& cplhhcVWmVWm(3),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),   & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSucSuVP(6,6),       & 
& cplSucSuVZ(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,             & 
& cplhhHpmcVWmVP1(3,2),cplhhHpmcVWmVZ1(3,2),cplhhcHpmVPVWm1(3,2),cplhhcHpmVWmVZ1(3,2),   & 
& cplHpmcHpmVPVZ1(2,2),cplSdcSdVPVZaa(6,6),cplSecSeVPVZ1(6,6),cplSucSuVPVZaa(6,6),       & 
& cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_hhToVPVZ



End Module OneLoopDecay_hh_seesaw1nmssm
