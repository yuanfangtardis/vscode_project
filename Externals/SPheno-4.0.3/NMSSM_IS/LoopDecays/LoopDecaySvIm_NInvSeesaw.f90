! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:27 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_SvIm_NInvSeesaw
Use Control 
Use Settings 
Use LoopFunctions 
Use AddLoopFunctions 
Use Model_Data_NInvSeesaw 
Use DecayFFS 
Use DecayFFV 
Use DecaySSS 
Use DecaySFF 
Use DecaySSV 
Use DecaySVV 
Use Bremsstrahlung 

Contains 

Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvImAh(cplAhSvImSvIm,MAh,MSvIm,            & 
& MAh2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MSvIm(9),MAh2(3),MSvIm2(9)

Complex(dp), Intent(in) :: cplAhSvImSvIm(3,9,9)

Complex(dp) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSvImSvIm(gt3,gt1,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvImAh


Subroutine Gamma_Real_NInvSeesaw_SvImToSvImAh(MLambda,em,gs,cplAhSvImSvIm,            & 
& MAh,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSvImSvIm(3,9,9)

Real(dp), Intent(in) :: MAh(3),MSvIm(9)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(9,9,3), GammarealGluon(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,9
  Do i2=1,9
    Do i3=2,3
Coup = cplAhSvImSvIm(i3,i1,i2)
Mex1 = MSvIm(i1)
Mex2 = MSvIm(i2)
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
End Subroutine Gamma_Real_NInvSeesaw_SvImToSvImAh


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvImAh(cplAhSvImSvIm,ctcplAhSvImSvIm,      & 
& MAh,MAh2,MSvIm,MSvIm2,ZfAh,ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MSvIm(9),MSvIm2(9)

Complex(dp), Intent(in) :: cplAhSvImSvIm(3,9,9)

Complex(dp), Intent(in) :: ctcplAhSvImSvIm(3,9,9)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfSvIm(9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSvImSvIm(gt3,gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt1)*cplAhSvImSvIm(gt3,i1,gt2)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt2)*cplAhSvImSvIm(gt3,gt1,i1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhSvImSvIm(i1,gt1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvImAh


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvImAh(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,      & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,     & 
& cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,cplhhhhSvImSvIm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,& 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(9),MSvRe(9),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplAhcHpmVWm(3,2),      & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9), & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9), & 
& cplHpmSvImcSe(2,9,6),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSvImSvReVZ(9,9),       & 
& cplSvImcSeVWm(9,6),cplAhAhSvImSvIm1(3,3,9,9),cplAhAhSvImSvRe1(3,3,9,9),cplAhhhSvImSvIm1(3,3,9,9),& 
& cplAhhhSvImSvRe1(3,3,9,9),cplAhHpmSvImcSe1(3,2,9,6),cplAhSeSvImcHpm1(3,6,9,2),         & 
& cplhhhhSvImSvIm1(3,3,9,9),cplHpmSvImSvImcHpm1(2,9,9,2),cplSdSvImSvImcSdaa(6,9,9,6),    & 
& cplSeSvImSvImcSe1(6,9,9,6),cplSuSvImSvImcSuaa(6,9,9,6),cplSvImSvImSvImSvIm1(9,9,9,9),  & 
& cplSvImSvImSvImSvRe1(9,9,9,9),cplSvImSvImSvReSvRe1(9,9,9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MAh(gt3) 


! {Ah, SvIm, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvImSvIm(i1,gt2,i3)
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


! {Ah, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvImSvIm(i1,gt2,i3)
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


! {Ah, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
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


! {Ah, SvRe, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
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


! {Cha, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFeSvImL(i1,i3,gt2)
coup2R = cplcChaFeSvImR(i1,i3,gt2)
coup3L = cplcFeFeAhL(i3,i2,gt3)
coup3R = cplcFeFeAhR(i3,i2,gt3)
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


! {Chi, Fv, Fv}
Do i1=1,5
  Do i2=1,9
    Do i3=1,9
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i1,i3,gt2)
coup2R = cplChiFvSvImR(i1,i3,gt2)
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


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeChaSvImL(i1,i3,gt2)
coup2R = cplcFeChaSvImR(i1,i3,gt2)
coup3L = cplcChaChaAhL(i3,i2,gt3)
coup3R = cplcChaChaAhR(i3,i2,gt3)
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


! {Fv, Chi, Chi}
Do i1=1,9
  Do i2=1,5
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplChiFvSvImL(i3,i1,gt2)
coup2R = cplChiFvSvImR(i3,i1,gt2)
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


! {hh, SvIm, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvImSvIm(i1,gt2,i3)
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


! {hh, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvImSvIm(i1,gt2,i3)
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


! {hh, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
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


! {hh, SvRe, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
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


! {Hpm, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
coup3 = cplAhSecSe(gt3,i2,i3)
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


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
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


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
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


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = -cplSvImcSeVWm(gt2,i1)
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


! {SvIm, Ah, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
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


! {SvIm, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
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


! {SvIm, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
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


! {SvIm, hh, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
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


! {SvRe, Ah, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
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


! {SvRe, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
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


! {SvRe, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, hh, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, VZ, hh}
Do i1=1,9
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, hh, VZ}
Do i1=1,9
  Do i2=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = -cplSvImSvReVZ(gt2,i1)
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


! {VWm, Se, Se}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvImcVWm(i3,gt2)
coup3 = cplAhSecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, SvRe, SvRe}
  Do i2=1,9
    Do i3=1,9
ML1 = MVZ 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = -cplSvImSvReVZ(gt1,i2)
coup2 = -cplSvImSvReVZ(gt2,i3)
coup3 = cplAhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvImL(i3,i1,gt2)
coup2R = cplcFeChaSvImR(i3,i1,gt2)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
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


! {bar[Fe], bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcChaFeSvImL(i3,i1,gt2)
coup2R = cplcChaFeSvImR(i3,i1,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
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


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvImcSe(i1,gt2,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
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


! {conj[Se], conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvImcHpm(i1,gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i3,i2)
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


! {conj[Se], conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvImcHpm(i1,gt2,i3)
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


! {conj[Se], conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvImcVWm(i1,gt2)
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


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = -cplSvImcSeVWm(gt2,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhAhSvImSvIm1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhAhSvImSvRe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplAhhhSvImSvIm1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplAhhhSvImSvRe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, Se}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplAhSeSvImcHpm1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplAhHpmSvImcSe1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhAhSvImSvIm1(gt3,i1,gt1,i2)
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


! {Ah, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhAhSvImSvRe1(gt3,i1,gt1,i2)
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


! {hh, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(gt3,i1,gt1,i2)
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


! {hh, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(gt3,i1,gt1,i2)
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


! {Hpm, Se}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplAhHpmSvImcSe1(gt3,i1,gt1,i2)
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


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhSeSvImcHpm1(gt3,i1,gt1,i2)
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


! {Ah, Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSvImSvIm1(i1,i2,gt1,gt2)
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


! {Ah, hh}
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhSvImSvIm1(i1,i2,gt1,gt2)
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


! {hh, hh}
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhSvImSvIm1(i1,i2,gt1,gt2)
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


! {Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSvImSvImcHpm1(i1,gt1,gt2,i2)
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


! {Sd, Sd}
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplSdSvImSvImcSdaa(i1,gt1,gt2,i2)
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


! {Se, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplSeSvImSvImcSe1(i1,gt1,gt2,i2)
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


! {Su, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplSuSvImSvImcSuaa(i1,gt1,gt2,i2)
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


! {SvIm, SvIm}
Do i1=1,9
  Do i2=1,9
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplSvImSvImSvImSvIm1(gt1,gt2,i1,i2)
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


! {SvIm, SvRe}
Do i1=1,9
  Do i2=1,9
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSvImSvImSvImSvRe1(gt1,gt2,i1,i2)
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


! {SvRe, SvRe}
Do i1=1,9
  Do i2=1,9
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSvImSvImSvReSvRe1(gt1,gt2,i1,i2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvImAh


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImAh(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,      & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,     & 
& cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,cplhhhhSvImSvIm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,& 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(9),MSvRe(9),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplAhcHpmVWm(3,2),      & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9), & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9), & 
& cplHpmSvImcSe(2,9,6),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSvImSvReVZ(9,9),       & 
& cplSvImcSeVWm(9,6),cplAhAhSvImSvIm1(3,3,9,9),cplAhAhSvImSvRe1(3,3,9,9),cplAhhhSvImSvIm1(3,3,9,9),& 
& cplAhhhSvImSvRe1(3,3,9,9),cplAhHpmSvImcSe1(3,2,9,6),cplAhSeSvImcHpm1(3,6,9,2),         & 
& cplhhhhSvImSvIm1(3,3,9,9),cplHpmSvImSvImcHpm1(2,9,9,2),cplSdSvImSvImcSdaa(6,9,9,6),    & 
& cplSeSvImSvImcSe1(6,9,9,6),cplSuSvImSvImcSuaa(6,9,9,6),cplSvImSvImSvImSvIm1(9,9,9,9),  & 
& cplSvImSvImSvImSvRe1(9,9,9,9),cplSvImSvImSvReSvRe1(9,9,9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MAh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImAh


Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvReAh(cplAhSvImSvRe,MAh,MSvIm,            & 
& MSvRe,MAh2,MSvIm2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MSvIm(9),MSvRe(9),MAh2(3),MSvIm2(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhSvImSvRe(3,9,9)

Complex(dp) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSvImSvRe(gt3,gt1,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvReAh


Subroutine Gamma_Real_NInvSeesaw_SvImToSvReAh(MLambda,em,gs,cplAhSvImSvRe,            & 
& MAh,MSvIm,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSvImSvRe(3,9,9)

Real(dp), Intent(in) :: MAh(3),MSvIm(9),MSvRe(9)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(9,9,3), GammarealGluon(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,9
  Do i2=1,9
    Do i3=2,3
Coup = cplAhSvImSvRe(i3,i1,i2)
Mex1 = MSvIm(i1)
Mex2 = MSvRe(i2)
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
End Subroutine Gamma_Real_NInvSeesaw_SvImToSvReAh


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvReAh(cplAhSvImSvRe,ctcplAhSvImSvRe,      & 
& MAh,MAh2,MSvIm,MSvIm2,MSvRe,MSvRe2,ZfAh,ZfSvIm,ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhSvImSvRe(3,9,9)

Complex(dp), Intent(in) :: ctcplAhSvImSvRe(3,9,9)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfSvIm(9,9),ZfSvRe(9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSvImSvRe(gt3,gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt1)*cplAhSvImSvRe(gt3,i1,gt2)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt2)*cplAhSvImSvRe(gt3,gt1,i1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhSvImSvRe(i1,gt1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvReAh


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvReAh(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplhhSvImSvIm,cplhhSvImSvRe,              & 
& cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,              & 
& cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,  & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhhhSvImSvRe1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSu(6),MSvIm(9),           & 
& MSvRe(9),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),          & 
& MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),            & 
& cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplAhcHpmVWm(3,2),cplcFeChaSvImL(3,2,9),     & 
& cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),cplChiFvSvImL(5,9,9),& 
& cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),cplcChaFeSvImL(2,3,9),  & 
& cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplhhSvImSvIm(3,9,9),& 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplHpmSvImcSe(2,9,6),cplHpmSvRecSe(2,9,6),   & 
& cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),       & 
& cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),cplAhAhSvImSvIm1(3,3,9,9),    & 
& cplAhAhSvImSvRe1(3,3,9,9),cplAhAhSvReSvRe1(3,3,9,9),cplAhhhSvImSvIm1(3,3,9,9),         & 
& cplAhhhSvImSvRe1(3,3,9,9),cplAhhhSvReSvRe1(3,3,9,9),cplAhHpmSvImcSe1(3,2,9,6),         & 
& cplAhHpmSvRecSe1(3,2,9,6),cplAhSeSvImcHpm1(3,6,9,2),cplAhSeSvRecHpm1(3,6,9,2),         & 
& cplhhhhSvImSvRe1(3,3,9,9),cplHpmSvImSvRecHpm1(2,9,9,2),cplSeSvImSvRecSe1(6,9,9,6),     & 
& cplSuSvImSvRecSuaa(6,9,9,6),cplSvImSvImSvImSvRe1(9,9,9,9),cplSvImSvImSvReSvRe1(9,9,9,9),& 
& cplSvImSvReSvReSvRe1(9,9,9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MAh(gt3) 


! {Ah, SvIm, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
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


! {Ah, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
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


! {Ah, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
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


! {Ah, SvRe, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
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


! {Cha, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i1,i3,gt2)
coup2R = cplcChaFeSvReR(i1,i3,gt2)
coup3L = cplcFeFeAhL(i3,i2,gt3)
coup3R = cplcFeFeAhR(i3,i2,gt3)
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


! {Chi, Fv, Fv}
Do i1=1,5
  Do i2=1,9
    Do i3=1,9
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,i3,gt2)
coup2R = cplChiFvSvReR(i1,i3,gt2)
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


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeChaSvReL(i1,i3,gt2)
coup2R = cplcFeChaSvReR(i1,i3,gt2)
coup3L = cplcChaChaAhL(i3,i2,gt3)
coup3R = cplcChaChaAhR(i3,i2,gt3)
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


! {Fv, Chi, Chi}
Do i1=1,9
  Do i2=1,5
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplChiFvSvReL(i3,i1,gt2)
coup2R = cplChiFvSvReR(i3,i1,gt2)
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


! {hh, SvIm, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
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


! {hh, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
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


! {hh, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
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


! {hh, SvRe, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
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


! {Hpm, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = cplAhSecSe(gt3,i2,i3)
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


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
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


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
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


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = -cplSvRecSeVWm(gt2,i1)
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


! {SvIm, Ah, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
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


! {SvIm, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
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


! {SvIm, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
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


! {SvIm, hh, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
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


! {SvIm, hh, VZ}
Do i1=1,9
  Do i2=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplSvImSvReVZ(i1,gt2)
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


! {SvRe, Ah, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
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


! {SvRe, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
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


! {SvRe, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {SvRe, hh, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {SvRe, VZ, hh}
Do i1=1,9
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {VWm, Se, Se}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvRecVWm(i3,gt2)
coup3 = cplAhSecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, SvRe, SvIm}
  Do i2=1,9
    Do i3=1,9
ML1 = MVZ 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = -cplSvImSvReVZ(gt1,i2)
coup2 = cplSvImSvReVZ(i3,gt2)
coup3 = cplAhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvReL(i3,i1,gt2)
coup2R = cplcFeChaSvReR(i3,i1,gt2)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
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


! {bar[Fe], bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcChaFeSvReL(i3,i1,gt2)
coup2R = cplcChaFeSvReR(i3,i1,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
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


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvRecSe(i1,gt2,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
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


! {conj[Se], conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i3,i2)
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


! {conj[Se], conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
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


! {conj[Se], conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvRecVWm(i1,gt2)
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


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = -cplSvRecSeVWm(gt2,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhAhSvImSvRe1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhAhSvReSvRe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplAhhhSvImSvRe1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplAhhhSvReSvRe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, Se}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplAhSeSvRecHpm1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplAhHpmSvRecSe1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhAhSvImSvIm1(gt3,i1,gt1,i2)
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


! {Ah, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhAhSvImSvRe1(gt3,i1,gt1,i2)
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


! {hh, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(gt3,i1,gt1,i2)
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


! {hh, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(gt3,i1,gt1,i2)
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


! {Hpm, Se}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplAhHpmSvImcSe1(gt3,i1,gt1,i2)
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


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhSeSvImcHpm1(gt3,i1,gt1,i2)
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


! {Ah, Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSvImSvRe1(i1,i2,gt1,gt2)
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


! {Ah, hh}
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhSvImSvRe1(i1,i2,gt1,gt2)
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


! {hh, hh}
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhSvImSvRe1(i1,i2,gt1,gt2)
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


! {Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSvImSvRecHpm1(i1,gt1,gt2,i2)
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


! {Se, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplSeSvImSvRecSe1(i1,gt1,gt2,i2)
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


! {Su, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplSuSvImSvRecSuaa(i1,gt1,gt2,i2)
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


! {SvIm, SvIm}
Do i1=1,9
  Do i2=1,9
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplSvImSvImSvImSvRe1(gt1,i1,i2,gt2)
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


! {SvIm, SvRe}
Do i1=1,9
  Do i2=1,9
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSvImSvImSvReSvRe1(gt1,i1,gt2,i2)
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


! {SvRe, SvRe}
Do i1=1,9
  Do i2=1,9
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSvImSvReSvReSvRe1(gt1,gt2,i1,i2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvReAh


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReAh(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,            & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,  & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,   & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,   & 
& cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,  & 
& cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,  & 
& cplhhhhSvImSvRe1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,             & 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSu(6),MSvIm(9),           & 
& MSvRe(9),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),          & 
& MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),            & 
& cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplAhcHpmVWm(3,2),cplcFeChaSvImL(3,2,9),     & 
& cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),cplChiFvSvImL(5,9,9),& 
& cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),cplcChaFeSvImL(2,3,9),  & 
& cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplhhSvImSvIm(3,9,9),& 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplHpmSvImcSe(2,9,6),cplHpmSvRecSe(2,9,6),   & 
& cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),       & 
& cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),cplAhAhSvImSvIm1(3,3,9,9),    & 
& cplAhAhSvImSvRe1(3,3,9,9),cplAhAhSvReSvRe1(3,3,9,9),cplAhhhSvImSvIm1(3,3,9,9),         & 
& cplAhhhSvImSvRe1(3,3,9,9),cplAhhhSvReSvRe1(3,3,9,9),cplAhHpmSvImcSe1(3,2,9,6),         & 
& cplAhHpmSvRecSe1(3,2,9,6),cplAhSeSvImcHpm1(3,6,9,2),cplAhSeSvRecHpm1(3,6,9,2),         & 
& cplhhhhSvImSvRe1(3,3,9,9),cplHpmSvImSvRecHpm1(2,9,9,2),cplSeSvImSvRecSe1(6,9,9,6),     & 
& cplSuSvImSvRecSuaa(6,9,9,6),cplSvImSvImSvImSvRe1(9,9,9,9),cplSvImSvImSvReSvRe1(9,9,9,9),& 
& cplSvImSvReSvReSvRe1(9,9,9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MAh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReAh


Subroutine Amplitude_Tree_NInvSeesaw_SvImTocFeCha(cplcFeChaSvImL,cplcFeChaSvImR,      & 
& MCha,MFe,MSvIm,MCha2,MFe2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MSvIm(9),MCha2(2),MFe2(3),MSvIm2(9)

Complex(dp), Intent(in) :: cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9)

Complex(dp) :: Amp(2,9,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,9
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MCha(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeChaSvImL(gt2,gt3,gt1)
coupT1R = cplcFeChaSvImR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_NInvSeesaw_SvImTocFeCha


Subroutine Gamma_Real_NInvSeesaw_SvImTocFeCha(MLambda,em,gs,cplcFeChaSvImL,           & 
& cplcFeChaSvImR,MCha,MFe,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9)

Real(dp), Intent(in) :: MCha(2),MFe(3),MSvIm(9)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(9,3,2), GammarealGluon(9,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
CoupL = cplcFeChaSvImL(i2,i3,i1)
CoupR = cplcFeChaSvImR(i2,i3,i1)
Mex1 = MSvIm(i1)
Mex2 = MFe(i2)
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
End Subroutine Gamma_Real_NInvSeesaw_SvImTocFeCha


Subroutine Amplitude_WAVE_NInvSeesaw_SvImTocFeCha(cplcFeChaSvImL,cplcFeChaSvImR,      & 
& ctcplcFeChaSvImL,ctcplcFeChaSvImR,MCha,MCha2,MFe,MFe2,MSvIm,MSvIm2,ZfFEL,              & 
& ZfFER,ZfLm,ZfLp,ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFe(3),MFe2(3),MSvIm(9),MSvIm2(9)

Complex(dp), Intent(in) :: cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9)

Complex(dp), Intent(in) :: ctcplcFeChaSvImL(3,2,9),ctcplcFeChaSvImR(3,2,9)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfLm(2,2),ZfLp(2,2),ZfSvIm(9,9)

Complex(dp), Intent(out) :: Amp(2,9,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MCha(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeChaSvImL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFeChaSvImR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvIm(i1,gt1)*cplcFeChaSvImL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvIm(i1,gt1)*cplcFeChaSvImR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFER(i1,gt2)*cplcFeChaSvImL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFEL(i1,gt2))*cplcFeChaSvImR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt3)*cplcFeChaSvImL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt3))*cplcFeChaSvImR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImTocFeCha


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImTocFeCha(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(9),MSvRe2(9),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),      & 
& cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9), & 
& cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),       & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),             & 
& cplcFeFvVWmL(3,9),cplcFeFvVWmR(3,9),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),         & 
& cplHpmSvImcSe(2,9,6),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSvImSvReVZ(9,9),       & 
& cplSvImcSeVWm(9,6)

Complex(dp), Intent(out) :: Amp(2,9,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MCha(gt3) 


! {Ah, SvIm, Fe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MFe(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
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


! {Ah, SvRe, Fe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MFe(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
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


! {Chi, Fv, Se}
Do i1=1,5
  Do i2=1,9
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplcFeChiSeL(gt2,i1,i3)
coup2R = cplcFeChiSeR(gt2,i1,i3)
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


! {Fv, Chi, Hpm}
Do i1=1,9
  Do i2=1,5
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplcFeFvHpmL(gt2,i1,i3)
coup2R = cplcFeFvHpmR(gt2,i1,i3)
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


! {Fv, Chi, VWm}
Do i1=1,9
  Do i2=1,5
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MVWm 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplcFeFvVWmL(gt2,i1)
coup2R = cplcFeFvVWmR(gt2,i1)
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


! {hh, SvIm, Fe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
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


! {hh, SvRe, Fe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
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


! {SvIm, Ah, Cha}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MCha(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2L = cplcFeChaSvImL(gt2,i3,i1)
coup2R = cplcFeChaSvImR(gt2,i3,i1)
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


! {SvIm, hh, Cha}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2L = cplcFeChaSvImL(gt2,i3,i1)
coup2R = cplcFeChaSvImR(gt2,i3,i1)
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


! {SvRe, Ah, Cha}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MCha(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2L = cplcFeChaSvReL(gt2,i3,i1)
coup2R = cplcFeChaSvReR(gt2,i3,i1)
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


! {SvRe, hh, Cha}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2L = cplcFeChaSvReL(gt2,i3,i1)
coup2R = cplcFeChaSvReR(gt2,i3,i1)
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


! {SvRe, VZ, Cha}
Do i1=1,9
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = MCha(i3) 
coup1 = cplSvImSvReVZ(gt1,i1)
coup2L = cplcFeChaSvReL(gt2,i3,i1)
coup2R = cplcFeChaSvReR(gt2,i3,i1)
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


! {VZ, SvRe, Fe}
  Do i2=1,9
    Do i3=1,3
ML1 = MVZ 
ML2 = MSvRe(i2) 
ML3 = MFe(i3) 
coup1 = cplSvImSvReVZ(gt1,i2)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeChaSvReL(i3,gt3,i2)
coup3R = cplcFeChaSvReR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], SvIm}
Do i1=1,2
  Do i2=1,3
    Do i3=1,9
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvImL(gt2,i1,i3)
coup2R = cplcFeChaSvImR(gt2,i1,i3)
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


! {bar[Cha], bar[Fe], SvRe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,9
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvReL(gt2,i1,i3)
coup2R = cplcFeChaSvReR(gt2,i1,i3)
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


! {bar[Fe], bar[Cha], Ah}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MAh(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcFeFeAhL(gt2,i1,i3)
coup2R = cplcFeFeAhR(gt2,i1,i3)
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


! {bar[Fe], bar[Cha], hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
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


! {bar[Fe], bar[Cha], VP}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MVP 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
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


! {bar[Fe], bar[Cha], VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MVZ 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcFeFeVZL(gt2,i1)
coup2R = cplcFeFeVZR(gt2,i1)
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


! {conj[Hpm], conj[Se], Fv}
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2L = cplcFeFvHpmL(gt2,i3,i1)
coup2R = cplcFeFvHpmR(gt2,i3,i1)
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


! {conj[Se], conj[Hpm], Chi}
Do i1=1,6
  Do i2=1,2
    Do i3=1,5
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MChi(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2L = cplcFeChiSeL(gt2,i3,i1)
coup2R = cplcFeChiSeR(gt2,i3,i1)
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


! {conj[Se], conj[VWm], Chi}
Do i1=1,6
    Do i3=1,5
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MChi(i3) 
coup1 = cplSvImcSeVWm(gt1,i1)
coup2L = cplcFeChiSeL(gt2,i3,i1)
coup2R = cplcFeChiSeR(gt2,i3,i1)
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


! {conj[VWm], conj[Se], Fv}
  Do i2=1,6
    Do i3=1,9
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = -cplSeSvImcVWm(i2,gt1)
coup2L = cplcFeFvVWmL(gt2,i3)
coup2R = cplcFeFvVWmR(gt2,i3)
coup3L = cplFvChacSeL(i3,gt3,i2)
coup3R = cplFvChacSeR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImTocFeCha


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImTocFeCha(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(9),MSvRe2(9),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),      & 
& cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9), & 
& cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),       & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),             & 
& cplcFeFvVWmL(3,9),cplcFeFvVWmR(3,9),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),         & 
& cplHpmSvImcSe(2,9,6),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSvImSvReVZ(9,9),       & 
& cplSvImcSeVWm(9,6)

Complex(dp), Intent(out) :: Amp(2,9,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MCha(gt3) 


! {bar[Fe], bar[Cha], VP}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MVP 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcChaChaVPL(i2,gt3)
coup3R = cplcChaChaVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImTocFeCha


Subroutine Amplitude_Tree_NInvSeesaw_SvImToFvChi(cplChiFvSvImL,cplChiFvSvImR,         & 
& MChi,MFv,MSvIm,MChi2,MFv2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),MFv(9),MSvIm(9),MChi2(5),MFv2(9),MSvIm2(9)

Complex(dp), Intent(in) :: cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9)

Complex(dp) :: Amp(2,9,9,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,5
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MChi(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFvSvImL(gt3,gt2,gt1)
coupT1R = cplChiFvSvImR(gt3,gt2,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_NInvSeesaw_SvImToFvChi


Subroutine Gamma_Real_NInvSeesaw_SvImToFvChi(MLambda,em,gs,cplChiFvSvImL,             & 
& cplChiFvSvImR,MChi,MFv,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9)

Real(dp), Intent(in) :: MChi(5),MFv(9),MSvIm(9)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(9,9,5), GammarealGluon(9,9,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,9
  Do i2=1,9
    Do i3=1,5
CoupL = cplChiFvSvImL(i3,i2,i1)
CoupR = cplChiFvSvImR(i3,i2,i1)
Mex1 = MSvIm(i1)
Mex2 = MFv(i2)
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
End Subroutine Gamma_Real_NInvSeesaw_SvImToFvChi


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToFvChi(cplChiFvSvImL,cplChiFvSvImR,         & 
& ctcplChiFvSvImL,ctcplChiFvSvImR,MChi,MChi2,MFv,MFv2,MSvIm,MSvIm2,ZfFV,ZfL0,            & 
& ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),MChi2(5),MFv(9),MFv2(9),MSvIm(9),MSvIm2(9)

Complex(dp), Intent(in) :: cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9)

Complex(dp), Intent(in) :: ctcplChiFvSvImL(5,9,9),ctcplChiFvSvImR(5,9,9)

Complex(dp), Intent(in) :: ZfFV(9,9),ZfL0(5,5),ZfSvIm(9,9)

Complex(dp), Intent(out) :: Amp(2,9,9,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,5
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MChi(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFvSvImL(gt3,gt2,gt1) 
ZcoupT1R = ctcplChiFvSvImR(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvIm(i1,gt1)*cplChiFvSvImL(gt3,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvIm(i1,gt1)*cplChiFvSvImR(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplChiFvSvImL(gt3,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplChiFvSvImR(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,5
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt3)*cplChiFvSvImL(i1,gt2,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt3))*cplChiFvSvImR(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToFvChi


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToFvChi(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),          & 
& cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),   & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),           & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),       & 
& cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),       & 
& cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcFeFvHpmL(3,9,2),& 
& cplcFeFvHpmR(3,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),cplcFeFvVWmL(3,9),         & 
& cplcFeFvVWmR(3,9),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplHpmSvImcSe(2,9,6),      & 
& cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,5
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MChi(gt3) 


! {Ah, SvIm, Fv}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MFv(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Ah, SvRe, Fv}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MFv(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Cha, Fe, Se}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
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


! {Chi, Fv, SvIm}
Do i1=1,5
  Do i2=1,9
    Do i3=1,9
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, Fv, SvRe}
Do i1=1,5
  Do i2=1,9
    Do i3=1,9
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Fe, Cha, Hpm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
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


! {Fe, Cha, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MVWm 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
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


! {Fv, Chi, Ah}
Do i1=1,9
  Do i2=1,5
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, Chi, hh}
Do i1=1,9
  Do i2=1,5
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, Chi, VZ}
Do i1=1,9
  Do i2=1,5
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MVZ 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
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


! {hh, SvIm, Fv}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {hh, SvRe, Fv}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, Se, Fe}
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
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


! {Se, Hpm, Cha}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
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


! {Se, VWm, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = -cplSeSvImcVWm(i1,gt1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
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


! {SvIm, Ah, Chi}
Do i1=1,9
  Do i2=1,3
    Do i3=1,5
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvIm, hh, Chi}
Do i1=1,9
  Do i2=1,3
    Do i3=1,5
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvRe, Ah, Chi}
Do i1=1,9
  Do i2=1,3
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {SvRe, hh, Chi}
Do i1=1,9
  Do i2=1,3
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {SvRe, VZ, Chi}
Do i1=1,9
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = MChi(i3) 
coup1 = cplSvImSvReVZ(gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {VWm, Se, Fe}
  Do i2=1,6
    Do i3=1,3
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplSvImcSeVWm(gt1,i2)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeChiSeL(i3,gt3,i2)
coup3R = cplcFeChiSeR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, SvRe, Fv}
  Do i2=1,9
    Do i3=1,9
ML1 = MVZ 
ML2 = MSvRe(i2) 
ML3 = MFv(i3) 
coup1 = cplSvImSvReVZ(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplChiFvSvReL(gt3,i3,i2)
coup3R = cplChiFvSvReR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], conj[Se]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Fe], bar[Cha], conj[Hpm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], bar[Cha], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MVWm 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
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


! {conj[Hpm], conj[Se], bar[Fe]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
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


! {conj[Se], conj[Hpm], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
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


! {conj[Se], conj[VWm], bar[Cha]}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = cplSvImcSeVWm(gt1,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
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


! {conj[VWm], conj[Se], bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSeSvImcVWm(i2,gt1)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = cplChiFecSeL(gt3,i3,i2)
coup3R = cplChiFecSeR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToFvChi


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToFvChi(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),          & 
& cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),       & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),   & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),           & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),       & 
& cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),       & 
& cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcFeFvHpmL(3,9,2),& 
& cplcFeFvHpmR(3,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),cplcFeFvVWmL(3,9),         & 
& cplcFeFvVWmR(3,9),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplHpmSvImcSe(2,9,6),      & 
& cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,5
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MChi(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToFvChi


Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvImhh(cplhhSvImSvIm,Mhh,MSvIm,            & 
& Mhh2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MSvIm(9),Mhh2(3),MSvIm2(9)

Complex(dp), Intent(in) :: cplhhSvImSvIm(3,9,9)

Complex(dp) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSvImSvIm(gt3,gt1,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvImhh


Subroutine Gamma_Real_NInvSeesaw_SvImToSvImhh(MLambda,em,gs,cplhhSvImSvIm,            & 
& Mhh,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSvImSvIm(3,9,9)

Real(dp), Intent(in) :: Mhh(3),MSvIm(9)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(9,9,3), GammarealGluon(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,9
  Do i2=1,9
    Do i3=1,3
Coup = cplhhSvImSvIm(i3,i1,i2)
Mex1 = MSvIm(i1)
Mex2 = MSvIm(i2)
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
End Subroutine Gamma_Real_NInvSeesaw_SvImToSvImhh


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvImhh(cplhhSvImSvIm,ctcplhhSvImSvIm,      & 
& Mhh,Mhh2,MSvIm,MSvIm2,Zfhh,ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MSvIm(9),MSvIm2(9)

Complex(dp), Intent(in) :: cplhhSvImSvIm(3,9,9)

Complex(dp), Intent(in) :: ctcplhhSvImSvIm(3,9,9)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfSvIm(9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSvImSvIm(gt3,gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt1)*cplhhSvImSvIm(gt3,i1,gt2)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt2)*cplhhSvImSvIm(gt3,gt1,i1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhSvImSvIm(i1,gt1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvImhh


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvImhh(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,           & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(9),MSvRe(9),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),& 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9), & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),     & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),     & 
& cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSvImcSe(2,9,6),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),& 
& cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplAhAhSvImSvIm1(3,3,9,9),cplAhhhSvImSvIm1(3,3,9,9),& 
& cplAhhhSvImSvRe1(3,3,9,9),cplhhhhSvImSvIm1(3,3,9,9),cplhhhhSvImSvRe1(3,3,9,9),         & 
& cplhhHpmSvImcSe1(3,2,9,6),cplhhSeSvImcHpm1(3,6,9,2),cplHpmSvImSvImcHpm1(2,9,9,2),      & 
& cplSdSvImSvImcSdaa(6,9,9,6),cplSeSvImSvImcSe1(6,9,9,6),cplSuSvImSvImcSuaa(6,9,9,6),    & 
& cplSvImSvImSvImSvIm1(9,9,9,9),cplSvImSvImSvImSvRe1(9,9,9,9),cplSvImSvImSvReSvRe1(9,9,9,9),& 
& cplSvImSvImcVWmVWm1(9,9),cplSvImSvImVZVZ1(9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, SvIm, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvImSvIm(i1,gt2,i3)
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


! {Ah, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvImSvIm(i1,gt2,i3)
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


! {Ah, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
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


! {Ah, SvRe, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
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


! {Cha, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFeSvImL(i1,i3,gt2)
coup2R = cplcChaFeSvImR(i1,i3,gt2)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
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


! {Chi, Fv, Fv}
Do i1=1,5
  Do i2=1,9
    Do i3=1,9
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i1,i3,gt2)
coup2R = cplChiFvSvImR(i1,i3,gt2)
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


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeChaSvImL(i1,i3,gt2)
coup2R = cplcFeChaSvImR(i1,i3,gt2)
coup3L = cplcChaChahhL(i3,i2,gt3)
coup3R = cplcChaChahhR(i3,i2,gt3)
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


! {Fv, Chi, Chi}
Do i1=1,9
  Do i2=1,5
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplChiFvSvImL(i3,i1,gt2)
coup2R = cplChiFvSvImR(i3,i1,gt2)
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


! {hh, SvIm, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvImSvIm(i1,gt2,i3)
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


! {hh, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvImSvIm(i1,gt2,i3)
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


! {hh, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
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


! {hh, SvRe, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
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


! {Hpm, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
coup3 = cplhhSecSe(gt3,i2,i3)
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


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = cplhhHpmcHpm(gt3,i2,i3)
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


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
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


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = -cplSvImcSeVWm(gt2,i1)
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


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = -cplSvImcSeVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {SvIm, Ah, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
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


! {SvIm, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
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


! {SvIm, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
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


! {SvIm, hh, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
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


! {SvRe, Ah, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
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


! {SvRe, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
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


! {SvRe, VZ, Ah}
Do i1=1,9
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
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


! {SvRe, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, hh, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, Ah, VZ}
Do i1=1,9
  Do i2=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = -cplSvImSvReVZ(gt2,i1)
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


! {SvRe, VZ, VZ}
Do i1=1,9
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = -cplSvImSvReVZ(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Se, Se}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvImcVWm(i3,gt2)
coup3 = cplhhSecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, SvRe, SvRe}
  Do i2=1,9
    Do i3=1,9
ML1 = MVZ 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = -cplSvImSvReVZ(gt1,i2)
coup2 = -cplSvImSvReVZ(gt2,i3)
coup3 = cplhhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvImL(i3,i1,gt2)
coup2R = cplcFeChaSvImR(i3,i1,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
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


! {bar[Fe], bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcChaFeSvImL(i3,i1,gt2)
coup2R = cplcChaFeSvImR(i3,i1,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
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


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvImcSe(i1,gt2,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
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


! {conj[Se], conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvImcHpm(i1,gt2,i3)
coup3 = cplhhHpmcHpm(gt3,i3,i2)
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


! {conj[Se], conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvImcHpm(i1,gt2,i3)
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


! {conj[Se], conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvImcVWm(i1,gt2)
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


! {conj[Se], conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvImcVWm(i1,gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = -cplSvImcSeVWm(gt2,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhhhSvImSvIm1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhhhSvImSvRe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhhhSvImSvIm1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhhhSvImSvRe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, Se}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplhhSeSvImcHpm1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplhhHpmSvImcSe1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(i1,gt3,gt1,i2)
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


! {Ah, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(i1,gt3,gt1,i2)
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


! {hh, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvIm1(gt3,i1,gt1,i2)
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


! {hh, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvImSvRe1(gt3,i1,gt1,i2)
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


! {Hpm, Se}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvImcSe1(gt3,i1,gt1,i2)
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


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvImcHpm1(gt3,i1,gt1,i2)
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


! {Ah, Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSvImSvIm1(i1,i2,gt1,gt2)
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


! {Ah, hh}
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhSvImSvIm1(i1,i2,gt1,gt2)
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


! {hh, hh}
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhSvImSvIm1(i1,i2,gt1,gt2)
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


! {Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSvImSvImcHpm1(i1,gt1,gt2,i2)
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


! {Sd, Sd}
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplSdSvImSvImcSdaa(i1,gt1,gt2,i2)
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


! {Se, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplSeSvImSvImcSe1(i1,gt1,gt2,i2)
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


! {Su, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplSuSvImSvImcSuaa(i1,gt1,gt2,i2)
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


! {SvIm, SvIm}
Do i1=1,9
  Do i2=1,9
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplSvImSvImSvImSvIm1(gt1,gt2,i1,i2)
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


! {SvIm, SvRe}
Do i1=1,9
  Do i2=1,9
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSvImSvImSvImSvRe1(gt1,gt2,i1,i2)
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


! {SvRe, SvRe}
Do i1=1,9
  Do i2=1,9
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSvImSvImSvReSvRe1(gt1,gt2,i1,i2)
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


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplSvImSvImcVWmVWm1(gt1,gt2)
coup2 = cplhhcVWmVWm(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplSvImSvImVZVZ1(gt1,gt2)
coup2 = cplhhVZVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvImhh


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImhh(MAh,MCha,MChi,MFe,             & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(9),MSvRe(9),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),& 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9), & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),     & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),     & 
& cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplhhcHpmVWm(3,2),      & 
& cplhhcVWmVWm(3),cplhhVZVZ(3),cplHpmSvImcSe(2,9,6),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),& 
& cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplAhAhSvImSvIm1(3,3,9,9),cplAhhhSvImSvIm1(3,3,9,9),& 
& cplAhhhSvImSvRe1(3,3,9,9),cplhhhhSvImSvIm1(3,3,9,9),cplhhhhSvImSvRe1(3,3,9,9),         & 
& cplhhHpmSvImcSe1(3,2,9,6),cplhhSeSvImcHpm1(3,6,9,2),cplHpmSvImSvImcHpm1(2,9,9,2),      & 
& cplSdSvImSvImcSdaa(6,9,9,6),cplSeSvImSvImcSe1(6,9,9,6),cplSuSvImSvImcSuaa(6,9,9,6),    & 
& cplSvImSvImSvImSvIm1(9,9,9,9),cplSvImSvImSvImSvRe1(9,9,9,9),cplSvImSvImSvReSvRe1(9,9,9,9),& 
& cplSvImSvImcVWmVWm1(9,9),cplSvImSvImVZVZ1(9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImhh


Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvRehh(cplhhSvImSvRe,Mhh,MSvIm,            & 
& MSvRe,Mhh2,MSvIm2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MSvIm(9),MSvRe(9),Mhh2(3),MSvIm2(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplhhSvImSvRe(3,9,9)

Complex(dp) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSvImSvRe(gt3,gt1,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvRehh


Subroutine Gamma_Real_NInvSeesaw_SvImToSvRehh(MLambda,em,gs,cplhhSvImSvRe,            & 
& Mhh,MSvIm,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSvImSvRe(3,9,9)

Real(dp), Intent(in) :: Mhh(3),MSvIm(9),MSvRe(9)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(9,9,3), GammarealGluon(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,9
  Do i2=1,9
    Do i3=1,3
Coup = cplhhSvImSvRe(i3,i1,i2)
Mex1 = MSvIm(i1)
Mex2 = MSvRe(i2)
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
End Subroutine Gamma_Real_NInvSeesaw_SvImToSvRehh


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvRehh(cplhhSvImSvRe,ctcplhhSvImSvRe,      & 
& Mhh,Mhh2,MSvIm,MSvIm2,MSvRe,MSvRe2,Zfhh,ZfSvIm,ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplhhSvImSvRe(3,9,9)

Complex(dp), Intent(in) :: ctcplhhSvImSvRe(3,9,9)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfSvIm(9,9),ZfSvRe(9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSvImSvRe(gt3,gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt1)*cplhhSvImSvRe(gt3,i1,gt2)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt2)*cplhhSvImSvRe(gt3,gt1,i1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhSvImSvRe(i1,gt1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvRehh


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvRehh(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvIm,        & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSu(6),MSvIm(9),           & 
& MSvRe(9),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),          & 
& MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),& 
& cplAhSvReSvRe(3,9,9),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,9),  & 
& cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),cplChiChihhL(5,5,3), & 
& cplChiChihhR(5,5,3),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),    & 
& cplChiFvSvReR(5,9,9),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,9),      & 
& cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplFvFvhhL(9,9,3),   & 
& cplFvFvhhR(9,9,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),         & 
& cplhhSvReSvRe(3,9,9),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmSvImcSe(2,9,6),           & 
& cplHpmSvRecSe(2,9,6),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSeSvRecHpm(6,9,2),     & 
& cplSeSvRecVWm(6,9),cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),           & 
& cplAhAhSvImSvRe1(3,3,9,9),cplAhhhSvImSvIm1(3,3,9,9),cplAhhhSvImSvRe1(3,3,9,9),         & 
& cplAhhhSvReSvRe1(3,3,9,9),cplhhhhSvImSvIm1(3,3,9,9),cplhhhhSvImSvRe1(3,3,9,9),         & 
& cplhhhhSvReSvRe1(3,3,9,9),cplhhHpmSvImcSe1(3,2,9,6),cplhhHpmSvRecSe1(3,2,9,6),         & 
& cplhhSeSvImcHpm1(3,6,9,2),cplhhSeSvRecHpm1(3,6,9,2),cplHpmSvImSvRecHpm1(2,9,9,2),      & 
& cplSeSvImSvRecSe1(6,9,9,6),cplSuSvImSvRecSuaa(6,9,9,6),cplSvImSvImSvImSvRe1(9,9,9,9),  & 
& cplSvImSvImSvReSvRe1(9,9,9,9),cplSvImSvReSvReSvRe1(9,9,9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, SvIm, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
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


! {Ah, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
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


! {Ah, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
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


! {Ah, SvRe, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
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


! {Cha, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i1,i3,gt2)
coup2R = cplcChaFeSvReR(i1,i3,gt2)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
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


! {Chi, Fv, Fv}
Do i1=1,5
  Do i2=1,9
    Do i3=1,9
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,i3,gt2)
coup2R = cplChiFvSvReR(i1,i3,gt2)
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


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeChaSvReL(i1,i3,gt2)
coup2R = cplcFeChaSvReR(i1,i3,gt2)
coup3L = cplcChaChahhL(i3,i2,gt3)
coup3R = cplcChaChahhR(i3,i2,gt3)
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


! {Fv, Chi, Chi}
Do i1=1,9
  Do i2=1,5
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplChiFvSvReL(i3,i1,gt2)
coup2R = cplChiFvSvReR(i3,i1,gt2)
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


! {hh, SvIm, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
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


! {hh, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
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


! {hh, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
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


! {hh, SvRe, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
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


! {Hpm, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = cplhhSecSe(gt3,i2,i3)
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


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = cplhhHpmcHpm(gt3,i2,i3)
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


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
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


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = -cplSvRecSeVWm(gt2,i1)
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


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = -cplSvRecSeVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {SvIm, Ah, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
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


! {SvIm, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
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


! {SvIm, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
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


! {SvIm, hh, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
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


! {SvIm, Ah, VZ}
Do i1=1,9
  Do i2=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplSvImSvReVZ(i1,gt2)
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


! {SvRe, Ah, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
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


! {SvRe, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
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


! {SvRe, VZ, Ah}
Do i1=1,9
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
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


! {SvRe, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {SvRe, hh, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {VWm, Se, Se}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvRecVWm(i3,gt2)
coup3 = cplhhSecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, SvRe, SvIm}
  Do i2=1,9
    Do i3=1,9
ML1 = MVZ 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = -cplSvImSvReVZ(gt1,i2)
coup2 = cplSvImSvReVZ(i3,gt2)
coup3 = cplhhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvReL(i3,i1,gt2)
coup2R = cplcFeChaSvReR(i3,i1,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
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


! {bar[Fe], bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcChaFeSvReL(i3,i1,gt2)
coup2R = cplcChaFeSvReR(i3,i1,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
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


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvRecSe(i1,gt2,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
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


! {conj[Se], conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
coup3 = cplhhHpmcHpm(gt3,i3,i2)
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


! {conj[Se], conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
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


! {conj[Se], conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvRecVWm(i1,gt2)
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


! {conj[Se], conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvRecVWm(i1,gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = -cplSvRecSeVWm(gt2,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhhhSvImSvRe1(i1,gt3,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhhhSvReSvRe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhhhSvImSvRe1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhhhSvReSvRe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, Se}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplhhSeSvRecHpm1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplhhHpmSvRecSe1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhhhSvImSvIm1(i1,gt3,gt1,i2)
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


! {Ah, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhhhSvImSvRe1(i1,gt3,gt1,i2)
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


! {hh, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhhhSvImSvIm1(gt3,i1,gt1,i2)
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


! {hh, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhhhSvImSvRe1(gt3,i1,gt1,i2)
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


! {Hpm, Se}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvImcSe1(gt3,i1,gt1,i2)
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


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSeSvImcHpm1(gt3,i1,gt1,i2)
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


! {Ah, Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSvImSvRe1(i1,i2,gt1,gt2)
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


! {Ah, hh}
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhSvImSvRe1(i1,i2,gt1,gt2)
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


! {hh, hh}
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhSvImSvRe1(i1,i2,gt1,gt2)
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


! {Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSvImSvRecHpm1(i1,gt1,gt2,i2)
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


! {Se, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplSeSvImSvRecSe1(i1,gt1,gt2,i2)
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


! {Su, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplSuSvImSvRecSuaa(i1,gt1,gt2,i2)
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


! {SvIm, SvIm}
Do i1=1,9
  Do i2=1,9
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplSvImSvImSvImSvRe1(gt1,i1,i2,gt2)
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


! {SvIm, SvRe}
Do i1=1,9
  Do i2=1,9
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSvImSvImSvReSvRe1(gt1,i1,gt2,i2)
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


! {SvRe, SvRe}
Do i1=1,9
  Do i2=1,9
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSvImSvReSvReSvRe1(gt1,gt2,i1,i2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvRehh


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvRehh(MAh,MCha,MChi,MFe,             & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSu(6),MSvIm(9),           & 
& MSvRe(9),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),          & 
& MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),& 
& cplAhSvReSvRe(3,9,9),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,9),  & 
& cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),cplChiChihhL(5,5,3), & 
& cplChiChihhR(5,5,3),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),    & 
& cplChiFvSvReR(5,9,9),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,9),      & 
& cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplFvFvhhL(9,9,3),   & 
& cplFvFvhhR(9,9,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),              & 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),         & 
& cplhhSvReSvRe(3,9,9),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmSvImcSe(2,9,6),           & 
& cplHpmSvRecSe(2,9,6),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSeSvRecHpm(6,9,2),     & 
& cplSeSvRecVWm(6,9),cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),           & 
& cplAhAhSvImSvRe1(3,3,9,9),cplAhhhSvImSvIm1(3,3,9,9),cplAhhhSvImSvRe1(3,3,9,9),         & 
& cplAhhhSvReSvRe1(3,3,9,9),cplhhhhSvImSvIm1(3,3,9,9),cplhhhhSvImSvRe1(3,3,9,9),         & 
& cplhhhhSvReSvRe1(3,3,9,9),cplhhHpmSvImcSe1(3,2,9,6),cplhhHpmSvRecSe1(3,2,9,6),         & 
& cplhhSeSvImcHpm1(3,6,9,2),cplhhSeSvRecHpm1(3,6,9,2),cplHpmSvImSvRecHpm1(2,9,9,2),      & 
& cplSeSvImSvRecSe1(6,9,9,6),cplSuSvImSvRecSuaa(6,9,9,6),cplSvImSvImSvImSvRe1(9,9,9,9),  & 
& cplSvImSvImSvReSvRe1(9,9,9,9),cplSvImSvReSvReSvRe1(9,9,9,9)

Complex(dp), Intent(out) :: Amp(9,9,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvRehh


Subroutine Amplitude_Tree_NInvSeesaw_SvImTocSeHpm(cplHpmSvImcSe,MHpm,MSe,             & 
& MSvIm,MHpm2,MSe2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSvIm(9),MHpm2(2),MSe2(6),MSvIm2(9)

Complex(dp), Intent(in) :: cplHpmSvImcSe(2,9,6)

Complex(dp) :: Amp(9,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,9
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1 = cplHpmSvImcSe(gt3,gt1,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_NInvSeesaw_SvImTocSeHpm


Subroutine Gamma_Real_NInvSeesaw_SvImTocSeHpm(MLambda,em,gs,cplHpmSvImcSe,            & 
& MHpm,MSe,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplHpmSvImcSe(2,9,6)

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSvIm(9)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(9,6,2), GammarealGluon(9,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,9
  Do i2=1,6
    Do i3=2,2
Coup = cplHpmSvImcSe(i3,i1,i2)
Mex1 = MSvIm(i1)
Mex2 = MSe(i2)
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
End Subroutine Gamma_Real_NInvSeesaw_SvImTocSeHpm


Subroutine Amplitude_WAVE_NInvSeesaw_SvImTocSeHpm(cplHpmSvImcSe,ctcplHpmSvImcSe,      & 
& MHpm,MHpm2,MSe,MSe2,MSvIm,MSvIm2,ZfHpm,ZfSe,ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MSe(6),MSe2(6),MSvIm(9),MSvIm2(9)

Complex(dp), Intent(in) :: cplHpmSvImcSe(2,9,6)

Complex(dp), Intent(in) :: ctcplHpmSvImcSe(2,9,6)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfSe(6,6),ZfSvIm(9,9)

Complex(dp), Intent(out) :: Amp(9,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplHpmSvImcSe(gt3,gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt1)*cplHpmSvImcSe(gt3,i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt2))*cplHpmSvImcSe(gt3,gt1,i1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHpm(i1,gt3)*cplHpmSvImcSe(i1,gt1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImTocSeHpm


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImTocSeHpm(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,     & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,       & 
& cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,           & 
& cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(9),MSvRe(9),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,9,9),         & 
& cplAhSvImSvRe(3,9,9),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),cplcFeChaSvImL(3,2,9),    & 
& cplcFeChaSvImR(3,2,9),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,9,9),    & 
& cplChiFvSvImR(5,9,9),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaFeSvImL(2,3,9),& 
& cplcChaFeSvImR(2,3,9),cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),         & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),cplHpmSvRecSe(2,9,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),& 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),& 
& cplAhHpmSvImcSe1(3,2,9,6),cplAhHpmSvRecSe1(3,2,9,6),cplhhHpmSvImcSe1(3,2,9,6),         & 
& cplhhHpmSvRecSe1(3,2,9,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSvImSvImcHpm1(2,9,9,2),      & 
& cplHpmSvImSvRecHpm1(2,9,9,2),cplSdSvImcSecSuaa(6,9,6,6),cplSeSvImSvImcSe1(6,9,9,6),    & 
& cplSeSvImSvRecSe1(6,9,9,6),cplSvImcSeVPVWm1(9,6),cplSvImcSeVWmVZ1(9,6)

Complex(dp), Intent(out) :: Amp(9,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, SvIm, Se}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSecSe(i1,i3,gt2)
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


! {Ah, SvRe, Se}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSecSe(i1,i3,gt2)
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


! {Chi, Fv, Fe}
Do i1=1,5
  Do i2=1,9
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplChiFecSeL(i1,i3,gt2)
coup2R = cplChiFecSeR(i1,i3,gt2)
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


! {Fv, Chi, Cha}
Do i1=1,9
  Do i2=1,5
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplFvChacSeL(i1,i3,gt2)
coup2R = cplFvChacSeR(i1,i3,gt2)
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


! {hh, SvIm, Se}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSecSe(i1,i3,gt2)
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


! {hh, SvRe, Se}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSecSe(i1,i3,gt2)
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


! {SvIm, Ah, Hpm}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplHpmSvImcSe(i3,i1,gt2)
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


! {SvIm, hh, Hpm}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplHpmSvImcSe(i3,i1,gt2)
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


! {SvIm, Ah, VWm}
Do i1=1,9
  Do i2=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplSvImcSeVWm(i1,gt2)
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


! {SvIm, hh, VWm}
Do i1=1,9
  Do i2=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplSvImcSeVWm(i1,gt2)
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


! {SvRe, Ah, Hpm}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplHpmSvRecSe(i3,i1,gt2)
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


! {SvRe, hh, Hpm}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplHpmSvRecSe(i3,i1,gt2)
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


! {SvRe, VZ, Hpm}
Do i1=1,9
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplHpmSvRecSe(i3,i1,gt2)
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


! {SvRe, Ah, VWm}
Do i1=1,9
  Do i2=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplSvRecSeVWm(i1,gt2)
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


! {SvRe, hh, VWm}
Do i1=1,9
  Do i2=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplSvRecSeVWm(i1,gt2)
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


! {SvRe, VZ, VWm}
Do i1=1,9
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplSvRecSeVWm(i1,gt2)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VZ, SvRe, Se}
  Do i2=1,9
    Do i3=1,6
ML1 = MVZ 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImSvReVZ(gt1,i2)
coup2 = cplSecSeVZ(i3,gt2)
coup3 = cplHpmSvRecSe(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], Fv}
Do i1=1,2
  Do i2=1,3
    Do i3=1,9
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplFvChacSeL(i3,i1,gt2)
coup2R = cplFvChacSeR(i3,i1,gt2)
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


! {bar[Fe], bar[Cha], Chi}
Do i1=1,3
  Do i2=1,2
    Do i3=1,5
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplChiFecSeL(i3,i1,gt2)
coup2R = cplChiFecSeR(i3,i1,gt2)
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


! {conj[Hpm], conj[Se], SvIm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvImcSe(i1,i3,gt2)
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


! {conj[Hpm], conj[Se], SvRe}
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvRecSe(i1,i3,gt2)
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


! {conj[Se], conj[Hpm], Ah}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplAhSecSe(i3,i1,gt2)
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


! {conj[Se], conj[VWm], Ah}
Do i1=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplAhSecSe(i3,i1,gt2)
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


! {conj[Se], conj[Hpm], hh}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplhhSecSe(i3,i1,gt2)
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


! {conj[Se], conj[VWm], hh}
Do i1=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplhhSecSe(i3,i1,gt2)
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


! {conj[Se], conj[Hpm], VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSecSeVP(i1,gt2)
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


! {conj[Se], conj[VWm], VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSecSeVP(i1,gt2)
coup3 = cplHpmcVWmVP(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Se], conj[Hpm], VZ}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSecSeVZ(i1,gt2)
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


! {conj[Se], conj[VWm], VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSecSeVZ(i1,gt2)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Se], SvIm}
  Do i2=1,6
    Do i3=1,9
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = cplSvImcSeVWm(i3,gt2)
coup3 = cplHpmSvImcSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[Se], SvRe}
  Do i2=1,6
    Do i3=1,9
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = cplSvRecSeVWm(i3,gt2)
coup3 = cplHpmSvRecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhHpmSvImcSe1(i1,gt3,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhHpmSvRecSe1(i1,gt3,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvIm}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhHpmSvImcSe1(i1,gt3,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, SvRe}
Do i1=1,3
  Do i2=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhHpmSvRecSe1(i1,gt3,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, Se}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplHpmSecHpmcSe1(gt3,i2,i1,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Se}
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhHpmSvImcSe1(i1,gt3,gt1,i2)
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


! {hh, Se}
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
coup1 = cplhhHpmSvImcSe1(i1,gt3,gt1,i2)
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


! {SvIm, Hpm}
Do i1=1,9
  Do i2=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSvImSvImcHpm1(gt3,gt1,i1,i2)
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


! {SvRe, Hpm}
Do i1=1,9
  Do i2=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSvImSvRecHpm1(gt3,gt1,i1,i2)
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


! {Ah, conj[Hpm]}
Do i1=1,3
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhHpmSvImcSe1(i1,i2,gt1,gt2)
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


! {hh, conj[Hpm]}
Do i1=1,3
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmSvImcSe1(i1,i2,gt1,gt2)
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


! {Sd, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSu(i2) 
coup1 = cplSdSvImcSecSuaa(i1,gt1,gt2,i2)
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


! {Se, SvIm}
Do i1=1,6
  Do i2=1,9
ML1 = MSe(i1) 
ML2 = MSvIm(i2) 
coup1 = cplSeSvImSvImcSe1(i1,gt1,i2,gt2)
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


! {Se, SvRe}
Do i1=1,6
  Do i2=1,9
ML1 = MSe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSeSvImSvRecSe1(i1,gt1,i2,gt2)
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


! {VP, conj[VWm]}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSvImcSeVPVWm1(gt1,gt2)
coup2 = cplHpmcVWmVP(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VWm, VZ}
ML1 = MVWm 
ML2 = MVZ 
coup1 = cplSvImcSeVWmVZ1(gt1,gt2)
coup2 = cplHpmcVWmVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImTocSeHpm


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImTocSeHpm(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,               & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,             & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,         & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,         & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,        & 
& cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,        & 
& cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,             & 
& cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(9),MSvRe(9),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(9),MSvRe2(9),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,9,9),         & 
& cplAhSvImSvRe(3,9,9),cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),cplcFeChaSvImL(3,2,9),    & 
& cplcFeChaSvImR(3,2,9),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,9,9),    & 
& cplChiFvSvImR(5,9,9),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaFeSvImL(2,3,9),& 
& cplcChaFeSvImR(2,3,9),cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),         & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),cplHpmSvRecSe(2,9,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),& 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),& 
& cplAhHpmSvImcSe1(3,2,9,6),cplAhHpmSvRecSe1(3,2,9,6),cplhhHpmSvImcSe1(3,2,9,6),         & 
& cplhhHpmSvRecSe1(3,2,9,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSvImSvImcHpm1(2,9,9,2),      & 
& cplHpmSvImSvRecHpm1(2,9,9,2),cplSdSvImcSecSuaa(6,9,6,6),cplSeSvImSvImcSe1(6,9,9,6),    & 
& cplSeSvImSvRecSe1(6,9,9,6),cplSvImcSeVPVWm1(9,6),cplSvImcSeVWmVZ1(9,6)

Complex(dp), Intent(out) :: Amp(9,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MHpm(gt3) 


! {conj[Se], conj[Hpm], VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSecSeVP(i1,gt2)
coup3 = cplHpmcHpmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Se], conj[VWm], VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSecSeVP(i1,gt2)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, conj[VWm]}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSvImcSeVPVWm1(gt1,gt2)
coup2 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImTocSeHpm


Subroutine Amplitude_Tree_NInvSeesaw_SvImToSecVWm(cplSeSvImcVWm,MSe,MSvIm,            & 
& MVWm,MSe2,MSvIm2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSvIm(9),MVWm,MSe2(6),MSvIm2(9),MVWm2

Complex(dp), Intent(in) :: cplSeSvImcVWm(6,9)

Complex(dp) :: Amp(2,9,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,9
  Do gt2=1,6
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = -cplSeSvImcVWm(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_NInvSeesaw_SvImToSecVWm


Subroutine Gamma_Real_NInvSeesaw_SvImToSecVWm(MLambda,em,gs,cplSeSvImcVWm,            & 
& MSe,MSvIm,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSeSvImcVWm(6,9)

Real(dp), Intent(in) :: MSe(6),MSvIm(9),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(9,6), GammarealGluon(9,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,9
  Do i2=1,6
Coup = cplSeSvImcVWm(i2,i1)
Mex1 = MSvIm(i1)
Mex2 = MSe(i2)
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
End Subroutine Gamma_Real_NInvSeesaw_SvImToSecVWm


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSecVWm(cplSeSvImcVWm,ctcplSeSvImcVWm,      & 
& MSe,MSe2,MSvIm,MSvIm2,MVWm,MVWm2,ZfSe,ZfSvIm,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MSvIm(9),MSvIm2(9),MVWm,MVWm2

Complex(dp), Intent(in) :: cplSeSvImcVWm(6,9)

Complex(dp), Intent(in) :: ctcplSeSvImcVWm(6,9)

Complex(dp), Intent(in) :: ZfSe(6,6),ZfSvIm(9,9),ZfVWm

Complex(dp), Intent(out) :: Amp(2,9,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,6
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSeSvImcVWm(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt1)*cplSeSvImcVWm(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplSeSvImcVWm(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplSeSvImcVWm(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSecVWm


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSecVWm(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,& 
& cplSeSvRecVWmVZ1,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(9),MSvRe2(9),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),        & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),   & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),     & 
& cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),       & 
& cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),           & 
& cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhcVWmVWm(3),cplHpmSvImcSe(2,9,6),        & 
& cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),               & 
& cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),cplSecSeVP(6,6),cplSecSeVZ(6,6),               & 
& cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1(6,9), & 
& cplSeSvImcVWmVZ1(6,9),cplSeSvRecVWmVZ1(6,9),cplSecSecVWmVWm1(6,6),cplSvImSvImcVWmVWm1(9,9)

Complex(dp), Intent(out) :: Amp(2,9,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVWm 


! {Ah, SvIm, conj[Se]}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSecSe(i1,gt2,i3)
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


! {Ah, SvRe, conj[Se]}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSecSe(i1,gt2,i3)
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


! {Cha, Fe, Fv}
Do i1=1,2
  Do i2=1,3
    Do i3=1,9
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFvSeL(i1,i3,gt2)
coup2R = cplcChaFvSeR(i1,i3,gt2)
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


! {Chi, Fv, bar[Fe]}
Do i1=1,5
  Do i2=1,9
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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


! {Fe, Cha, Chi}
Do i1=1,3
  Do i2=1,2
    Do i3=1,5
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,i3,gt2)
coup2R = cplcFeChiSeR(i1,i3,gt2)
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


! {Fv, Chi, bar[Cha]}
Do i1=1,9
  Do i2=1,5
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplcChaFvSeL(i3,i1,gt2)
coup2R = cplcChaFvSeR(i3,i1,gt2)
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


! {hh, SvIm, conj[Se]}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSecSe(i1,gt2,i3)
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


! {hh, SvRe, conj[Se]}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSecSe(i1,gt2,i3)
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


! {Hpm, Se, SvIm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvImcHpm(gt2,i3,i1)
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


! {Hpm, Se, SvRe}
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvRecHpm(gt2,i3,i1)
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


! {Se, Hpm, Ah}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, Hpm, hh}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, VWm, hh}
Do i1=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, Hpm, VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplSecSeVP(gt2,i1)
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


! {Se, VWm, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, Hpm, VZ}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplSecSeVZ(gt2,i1)
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


! {Se, VWm, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplSecSeVZ(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {SvIm, Ah, conj[Hpm]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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


! {SvIm, hh, conj[Hpm]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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


! {SvIm, hh, conj[VWm]}
Do i1=1,9
  Do i2=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplSeSvImcVWm(gt2,i1)
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


! {SvRe, Ah, conj[Hpm]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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


! {SvRe, hh, conj[Hpm]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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


! {SvRe, VZ, conj[Hpm]}
Do i1=1,9
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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


! {SvRe, hh, conj[VWm]}
Do i1=1,9
  Do i2=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplSeSvRecVWm(gt2,i1)
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


! {SvRe, VZ, conj[VWm]}
Do i1=1,9
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplSeSvRecVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Se, SvIm}
  Do i2=1,6
    Do i3=1,9
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvImcVWm(gt2,i3)
coup3 = -cplSeSvImcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Se, SvRe}
  Do i2=1,6
    Do i3=1,9
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvRecVWm(gt2,i3)
coup3 = -cplSeSvRecVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, SvRe, conj[Se]}
  Do i2=1,9
    Do i3=1,6
ML1 = MVZ 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImSvReVZ(gt1,i2)
coup2 = cplSecSeVZ(gt2,i3)
coup3 = cplSeSvRecVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = -cplSeSvImcVWm(i1,gt1)
coup2 = cplSecSecVWmVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {SvRe, VZ}
Do i1=1,9
ML1 = MSvRe(i1) 
ML2 = MVZ 
coup1 = cplSvImSvReVZ(gt1,i1)
coup2 = cplSeSvRecVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSeSvImcVWmVP1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Se, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = cplSeSvImcVWmVZ1(i1,gt1)
coup2 = cplSecSeVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {SvIm, conj[VWm]}
Do i1=1,9
ML1 = MSvIm(i1) 
ML2 = MVWm 
coup1 = cplSvImSvImcVWmVWm1(gt1,i1)
coup2 = cplSeSvImcVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSecVWm


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSecVWm(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,        & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,& 
& cplSeSvRecVWmVZ1,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(9),MSvRe2(9),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),        & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),   & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),     & 
& cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),       & 
& cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),           & 
& cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhcVWmVWm(3),cplHpmSvImcSe(2,9,6),        & 
& cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),               & 
& cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),cplSecSeVP(6,6),cplSecSeVZ(6,6),               & 
& cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1(6,9), & 
& cplSeSvImcVWmVZ1(6,9),cplSeSvRecVWmVZ1(6,9),cplSecSecVWmVWm1(6,6),cplSvImSvImcVWmVWm1(9,9)

Complex(dp), Intent(out) :: Amp(2,9,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVWm 


! {Se, Hpm, VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplSecSeVP(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VWm, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSeSvImcVWmVP1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSecVWm


Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvReVZ(cplSvImSvReVZ,MSvIm,MSvRe,          & 
& MVZ,MSvIm2,MSvRe2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MSvIm(9),MSvRe(9),MVZ,MSvIm2(9),MSvRe2(9),MVZ2

Complex(dp), Intent(in) :: cplSvImSvReVZ(9,9)

Complex(dp) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,9
  Do gt2=1,9
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplSvImSvReVZ(gt1,gt2)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_NInvSeesaw_SvImToSvReVZ


Subroutine Gamma_Real_NInvSeesaw_SvImToSvReVZ(MLambda,em,gs,cplSvImSvReVZ,            & 
& MSvIm,MSvRe,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSvImSvReVZ(9,9)

Real(dp), Intent(in) :: MSvIm(9),MSvRe(9),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(9,9), GammarealGluon(9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,9
  Do i2=1,9
Coup = cplSvImSvReVZ(i1,i2)
Mex1 = MSvIm(i1)
Mex2 = MSvRe(i2)
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
End Subroutine Gamma_Real_NInvSeesaw_SvImToSvReVZ


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvReVZ(cplSvImSvReVZ,ctcplSvImSvReVZ,      & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVZ,MVZ2,ZfSvIm,ZfSvRe,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVZ,MVZ2

Complex(dp), Intent(in) :: cplSvImSvReVZ(9,9)

Complex(dp), Intent(in) :: ctcplSvImSvReVZ(9,9)

Complex(dp), Intent(in) :: ZfSvIm(9,9),ZfSvRe(9,9),ZfVZ

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,9
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSvImSvReVZ(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt1)*cplSvImSvReVZ(i1,gt2)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt2)*cplSvImSvReVZ(gt1,i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplSvImSvReVZ(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvReVZ


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvReVZ(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,     & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,             & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVZ,      & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,& 
& cplSvImSvImVZVZ1,cplSvImcSeVWmVZ1,cplSvReSvReVZVZ1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),        & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),cplChiChiVZR(5,5),             & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhSvImSvIm(3,9,9),& 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplhhVZVZ(3),cplHpmSvImcSe(2,9,6),           & 
& cplHpmSvRecSe(2,9,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,9,2),           & 
& cplSeSvImcVWm(6,9),cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),cplSecSeVZ(6,6),            & 
& cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),cplcHpmVWmVZ(2),              & 
& cplcVWmVWmVZ,cplSeSvImcVWmVZ1(6,9),cplSeSvRecVWmVZ1(6,9),cplSvImSvImVZVZ1(9,9),        & 
& cplSvImcSeVWmVZ1(9,6),cplSvReSvReVZVZ1(9,9),cplSvRecSeVWmVZ1(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVZ 


! {Ah, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
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


! {Ah, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
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


! {Cha, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i1,i3,gt2)
coup2R = cplcChaFeSvReR(i1,i3,gt2)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
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


! {Chi, Fv, Fv}
Do i1=1,5
  Do i2=1,9
    Do i3=1,9
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,i3,gt2)
coup2R = cplChiFvSvReR(i1,i3,gt2)
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


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeChaSvReL(i1,i3,gt2)
coup2R = cplcFeChaSvReR(i1,i3,gt2)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
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


! {Fv, Chi, Chi}
Do i1=1,9
  Do i2=1,5
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplChiFvSvReL(i3,i1,gt2)
coup2R = cplChiFvSvReR(i3,i1,gt2)
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


! {hh, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
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


! {hh, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
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


! {Hpm, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = -cplSecSeVZ(i2,i3)
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


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = -cplHpmcHpmVZ(i2,i3)
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


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
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


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplSvRecSeVWm(gt2,i1)
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


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplSvRecSeVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {SvIm, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
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


! {SvIm, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
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


! {SvIm, hh, VZ}
Do i1=1,9
  Do i2=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = -cplSvImSvReVZ(i1,gt2)
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


! {SvRe, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
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


! {SvRe, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {SvRe, VZ, hh}
Do i1=1,9
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {VWm, Se, Se}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = -cplSeSvRecVWm(i3,gt2)
coup3 = -cplSecSeVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, SvRe, SvIm}
  Do i2=1,9
    Do i3=1,9
ML1 = MVZ 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = -cplSvImSvReVZ(gt1,i2)
coup2 = -cplSvImSvReVZ(i3,gt2)
coup3 = cplSvImSvReVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvReL(i3,i1,gt2)
coup2R = cplcFeChaSvReR(i3,i1,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
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


! {bar[Fe], bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcChaFeSvReL(i3,i1,gt2)
coup2R = cplcChaFeSvReR(i3,i1,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
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


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvRecSe(i1,gt2,i3)
coup3 = cplSecSeVZ(i3,i2)
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


! {conj[Se], conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
coup3 = cplHpmcHpmVZ(i3,i2)
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


! {conj[Se], conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
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


! {conj[Se], conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = -cplSeSvRecVWm(i1,gt2)
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


! {conj[Se], conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = -cplSeSvRecVWm(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = cplSvRecSeVWm(gt2,i3)
coup3 = cplSecSeVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = -cplSeSvImcVWm(i1,gt1)
coup2 = cplSvRecSeVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {SvRe, VZ}
Do i1=1,9
ML1 = MSvRe(i1) 
ML2 = MVZ 
coup1 = cplSvImSvReVZ(gt1,i1)
coup2 = cplSvReSvReVZVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Se}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
coup1 = cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvRecVWmVZ1(i2,gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSeSvImcVWmVZ1(i1,gt1)
coup2 = cplSvRecSeVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {SvIm, VZ}
Do i1=1,9
ML1 = MSvIm(i1) 
ML2 = MVZ 
coup1 = cplSvImSvImVZVZ1(gt1,i1)
coup2 = -cplSvImSvReVZ(i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Se}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
coup1 = cplSvImcSeVWmVZ1(gt1,i2)
coup2 = -cplSeSvRecVWm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvReVZ


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReVZ(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,     & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,             & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVZ,      & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,& 
& cplSvImSvImVZVZ1,cplSvImcSeVWmVZ1,cplSvReSvReVZVZ1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),        & 
& cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),cplChiChiVZR(5,5),             & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhSvImSvIm(3,9,9),& 
& cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplhhVZVZ(3),cplHpmSvImcSe(2,9,6),           & 
& cplHpmSvRecSe(2,9,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,9,2),           & 
& cplSeSvImcVWm(6,9),cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),cplSecSeVZ(6,6),            & 
& cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),cplcHpmVWmVZ(2),              & 
& cplcVWmVWmVZ,cplSeSvImcVWmVZ1(6,9),cplSeSvRecVWmVZ1(6,9),cplSvImSvImVZVZ1(9,9),        & 
& cplSvImcSeVWmVZ1(9,6),cplSvReSvReVZVZ1(9,9),cplSvRecSeVWmVZ1(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReVZ


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvImVP(MSvIm,MSvIm2,MVP,MVP2,              & 
& ZfSvIm,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MVP,MVP2

Complex(dp), Intent(in) :: ZfSvIm(9,9),ZfVP

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,9
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
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
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvImVP


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvImVP(MCha,MFe,MHpm,MSe,MSvIm,          & 
& MVP,MVWm,MCha2,MFe2,MHpm2,MSe2,MSvIm2,MVP2,MVWm2,cplcFeChaSvImL,cplcFeChaSvImR,        & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,     & 
& cplHpmSvImcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,        & 
& cplSvImcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSvImcSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MHpm(2),MSe(6),MSvIm(9),MVP,MVWm,MCha2(2),MFe2(3),MHpm2(2),            & 
& MSe2(6),MSvIm2(9),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),    & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplHpmSvImcSe(2,9,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSeSvImcHpm(6,9,2),           & 
& cplSeSvImcVWm(6,9),cplSecSeVP(6,6),cplSvImcSeVWm(9,6),cplcHpmVPVWm(2),cplcVWmVPVWm,    & 
& cplSeSvImcVWmVP1(6,9),cplSvImcSeVPVWm1(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MVP 


! {Cha, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFeSvImL(i1,i3,gt2)
coup2R = cplcChaFeSvImR(i1,i3,gt2)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
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


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeChaSvImL(i1,i3,gt2)
coup2R = cplcFeChaSvImR(i1,i3,gt2)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
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


! {Hpm, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
coup3 = -cplSecSeVP(i2,i3)
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


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = -cplHpmcHpmVP(i2,i3)
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


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
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


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplSvImcSeVWm(gt2,i1)
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


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplSvImcSeVWm(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Se, Se}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = -cplSeSvImcVWm(i3,gt2)
coup3 = -cplSecSeVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvImL(i3,i1,gt2)
coup2R = cplcFeChaSvImR(i3,i1,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
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


! {bar[Fe], bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcChaFeSvImL(i3,i1,gt2)
coup2R = cplcChaFeSvImR(i3,i1,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
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


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvImcSe(i1,gt2,i3)
coup3 = cplSecSeVP(i3,i2)
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


! {conj[Se], conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvImcHpm(i1,gt2,i3)
coup3 = cplHpmcHpmVP(i3,i2)
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


! {conj[Se], conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvImcHpm(i1,gt2,i3)
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


! {conj[Se], conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = -cplSeSvImcVWm(i1,gt2)
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


! {conj[Se], conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = -cplSeSvImcVWm(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = cplSvImcSeVWm(gt2,i3)
coup3 = cplSecSeVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = -cplSeSvImcVWm(i1,gt1)
coup2 = cplSvImcSeVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Se}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
coup1 = cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvImcVWmVP1(i2,gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSeSvImcVWmVP1(i1,gt1)
coup2 = cplSvImcSeVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Se}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
coup1 = cplSvImcSeVPVWm1(gt1,i2)
coup2 = -cplSeSvImcVWm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvImVP


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImVP(MCha,MFe,MHpm,MSe,             & 
& MSvIm,MVP,MVWm,MCha2,MFe2,MHpm2,MSe2,MSvIm2,MVP2,MVWm2,cplcFeChaSvImL,cplcFeChaSvImR,  & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,     & 
& cplHpmSvImcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,        & 
& cplSvImcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSvImcSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MHpm(2),MSe(6),MSvIm(9),MVP,MVWm,MCha2(2),MFe2(3),MHpm2(2),            & 
& MSe2(6),MSvIm2(9),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),    & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplHpmSvImcSe(2,9,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSeSvImcHpm(6,9,2),           & 
& cplSeSvImcVWm(6,9),cplSecSeVP(6,6),cplSvImcSeVWm(9,6),cplcHpmVPVWm(2),cplcVWmVPVWm,    & 
& cplSeSvImcVWmVP1(6,9),cplSvImcSeVPVWm1(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImVP


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvImVZ(MSvIm,MSvIm2,MVZ,MVZ2,              & 
& ZfSvIm,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MVZ,MVZ2

Complex(dp), Intent(in) :: ZfSvIm(9,9),ZfVZ

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,9
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
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
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvImVZ


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvImVZ(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,    & 
& cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,        & 
& cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSvImcSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplcFeChaSvImL(3,2,9),       & 
& cplcFeChaSvImR(3,2,9),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),         & 
& cplChiChiVZR(5,5),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplcChaFeSvImL(2,3,9),     & 
& cplcChaFeSvImR(2,3,9),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(9,9),               & 
& cplFvFvVZR(9,9),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhVZVZ(3),cplHpmSvImcSe(2,9,6),& 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),             & 
& cplSecSeVZ(6,6),cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,    & 
& cplSeSvImcVWmVZ1(6,9),cplSvImcSeVWmVZ1(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MVZ 


! {Ah, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSvImSvRe(i1,gt1,i2)
coup2 = cplAhSvImSvIm(i1,gt2,i3)
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


! {Ah, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSvImSvIm(i1,gt1,i2)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
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


! {Cha, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFeSvImL(i1,i3,gt2)
coup2R = cplcChaFeSvImR(i1,i3,gt2)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
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


! {Chi, Fv, Fv}
Do i1=1,5
  Do i2=1,9
    Do i3=1,9
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i1,i2,gt1)
coup1R = cplChiFvSvImR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i1,i3,gt2)
coup2R = cplChiFvSvImR(i1,i3,gt2)
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


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeChaSvImL(i1,i3,gt2)
coup2R = cplcFeChaSvImR(i1,i3,gt2)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
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


! {Fv, Chi, Chi}
Do i1=1,9
  Do i2=1,5
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,i1,gt1)
coup1R = cplChiFvSvImR(i2,i1,gt1)
coup2L = cplChiFvSvImL(i3,i1,gt2)
coup2R = cplChiFvSvImR(i3,i1,gt2)
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


! {hh, SvRe, SvIm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSvImSvRe(i1,gt1,i2)
coup2 = cplhhSvImSvIm(i1,gt2,i3)
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


! {hh, SvIm, SvRe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSvImSvIm(i1,gt1,i2)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
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


! {Hpm, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
coup3 = -cplSecSeVZ(i2,i3)
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


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = -cplHpmcHpmVZ(i2,i3)
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


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
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


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplSvImcSeVWm(gt2,i1)
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


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplSvImcSeVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {SvIm, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvIm(i2,gt1,i1)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
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


! {SvIm, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvIm(i2,gt1,i1)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
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


! {SvRe, hh, Ah}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
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


! {SvRe, Ah, hh}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvImSvRe(i2,gt1,i1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, VZ, hh}
Do i1=1,9
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplSvImSvReVZ(gt1,i1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, hh, VZ}
Do i1=1,9
  Do i2=1,3
ML1 = MSvRe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSvImSvRe(i2,gt1,i1)
coup2 = cplSvImSvReVZ(gt2,i1)
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


! {VWm, Se, Se}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = -cplSeSvImcVWm(i3,gt2)
coup3 = -cplSecSeVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvImL(i3,i1,gt2)
coup2R = cplcFeChaSvImR(i3,i1,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
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


! {bar[Fe], bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcChaFeSvImL(i3,i1,gt2)
coup2R = cplcChaFeSvImR(i3,i1,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
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


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvImcSe(i1,gt2,i3)
coup3 = cplSecSeVZ(i3,i2)
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


! {conj[Se], conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvImcHpm(i1,gt2,i3)
coup3 = cplHpmcHpmVZ(i3,i2)
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


! {conj[Se], conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvImcHpm(i1,gt2,i3)
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


! {conj[Se], conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = -cplSeSvImcVWm(i1,gt2)
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


! {conj[Se], conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = -cplSeSvImcVWm(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = cplSvImcSeVWm(gt2,i3)
coup3 = cplSecSeVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = -cplSeSvImcVWm(i1,gt1)
coup2 = cplSvImcSeVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Se}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
coup1 = cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvImcVWmVZ1(i2,gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSeSvImcVWmVZ1(i1,gt1)
coup2 = cplSvImcSeVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Se}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
coup1 = cplSvImcSeVWmVZ1(gt1,i2)
coup2 = -cplSeSvImcVWm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvImVZ


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImVZ(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,    & 
& cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,        & 
& cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSvImcSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(9),Mhh(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(9),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(9),MSvRe2(9),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplcFeChaSvImL(3,2,9),       & 
& cplcFeChaSvImR(3,2,9),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),         & 
& cplChiChiVZR(5,5),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplcChaFeSvImL(2,3,9),     & 
& cplcChaFeSvImR(2,3,9),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(9,9),               & 
& cplFvFvVZR(9,9),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhVZVZ(3),cplHpmSvImcSe(2,9,6),& 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),             & 
& cplSecSeVZ(6,6),cplSvImSvReVZ(9,9),cplSvImcSeVWm(9,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,    & 
& cplSeSvImcVWmVZ1(6,9),cplSvImcSeVWmVZ1(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImVZ


Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvReVP(cplSvImSvReVZ,ctcplSvImSvReVZ,      & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVP,MVP2,MVZ,MVZ2,ZfSvIm,ZfSvRe,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplSvImSvReVZ(9,9)

Complex(dp), Intent(in) :: ctcplSvImSvReVZ(9,9)

Complex(dp), Intent(in) :: ZfSvIm(9,9),ZfSvRe(9,9),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,9
  Do gt2=1,9
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
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
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplSvImSvReVZ(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_NInvSeesaw_SvImToSvReVP


Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvReVP(MCha,MFe,MHpm,MSe,MSvIm,          & 
& MSvRe,MVP,MVWm,MCha2,MFe2,MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,cplcFeChaSvImL,          & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,       & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSvImcSeVPVWm1,          & 
& cplSvRecSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),MVP,MVWm,MCha2(2),MFe2(3),            & 
& MHpm2(2),MSe2(6),MSvIm2(9),MSvRe2(9),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),     & 
& cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplHpmSvImcSe(2,9,6),cplHpmSvRecSe(2,9,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),       & 
& cplSecSeVP(6,6),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),cplcHpmVPVWm(2),cplcVWmVPVWm,    & 
& cplSeSvImcVWmVP1(6,9),cplSeSvRecVWmVP1(6,9),cplSvImcSeVPVWm1(9,6),cplSvRecSeVPVWm1(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVP 


! {Cha, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChaSvImL(i2,i1,gt1)
coup1R = cplcFeChaSvImR(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i1,i3,gt2)
coup2R = cplcChaFeSvReR(i1,i3,gt2)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
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


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(i2,i1,gt1)
coup1R = cplcChaFeSvImR(i2,i1,gt1)
coup2L = cplcFeChaSvReL(i1,i3,gt2)
coup2R = cplcFeChaSvReR(i1,i3,gt2)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
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


! {Hpm, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,gt1,i2)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = -cplSecSeVP(i2,i3)
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


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = -cplHpmcHpmVP(i2,i3)
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


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
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


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSeSvImcHpm(i1,gt1,i2)
coup2 = cplSvRecSeVWm(gt2,i1)
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


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSeSvImcVWm(i1,gt1)
coup2 = cplSvRecSeVWm(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Se, Se}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = -cplSvImcSeVWm(gt1,i2)
coup2 = -cplSeSvRecVWm(i3,gt2)
coup3 = -cplSecSeVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(i1,i2,gt1)
coup1R = cplcChaFeSvImR(i1,i2,gt1)
coup2L = cplcFeChaSvReL(i3,i1,gt2)
coup2R = cplcFeChaSvReR(i3,i1,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
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


! {bar[Fe], bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChaSvImL(i1,i2,gt1)
coup1R = cplcFeChaSvImR(i1,i2,gt1)
coup2L = cplcChaFeSvReL(i3,i1,gt2)
coup2R = cplcChaFeSvReR(i3,i1,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
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


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcHpm(i2,gt1,i1)
coup2 = cplHpmSvRecSe(i1,gt2,i3)
coup3 = cplSecSeVP(i3,i2)
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


! {conj[Se], conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
coup3 = cplHpmcHpmVP(i3,i2)
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


! {conj[Se], conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = cplSeSvRecHpm(i1,gt2,i3)
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


! {conj[Se], conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,gt1,i1)
coup2 = -cplSeSvRecVWm(i1,gt2)
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


! {conj[Se], conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplSvImcSeVWm(gt1,i1)
coup2 = -cplSeSvRecVWm(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSeSvImcVWm(i2,gt1)
coup2 = cplSvRecSeVWm(gt2,i3)
coup3 = cplSecSeVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = -cplSeSvImcVWm(i1,gt1)
coup2 = cplSvRecSeVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Se}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
coup1 = cplSvImcSeVWm(gt1,i2)
coup2 = cplSeSvRecVWmVP1(i2,gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSeSvImcVWmVP1(i1,gt1)
coup2 = cplSvRecSeVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Se}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
coup1 = cplSvImcSeVPVWm1(gt1,i2)
coup2 = -cplSeSvRecVWm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_NInvSeesaw_SvImToSvReVP


Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReVP(MCha,MFe,MHpm,MSe,             & 
& MSvIm,MSvRe,MVP,MVWm,MCha2,MFe2,MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,       & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSvImcSeVPVWm1,          & 
& cplSvRecSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MHpm(2),MSe(6),MSvIm(9),MSvRe(9),MVP,MVWm,MCha2(2),MFe2(3),            & 
& MHpm2(2),MSe2(6),MSvIm2(9),MSvRe2(9),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),& 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),     & 
& cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplHpmSvImcSe(2,9,6),cplHpmSvRecSe(2,9,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),       & 
& cplSecSeVP(6,6),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6),cplcHpmVPVWm(2),cplcVWmVPVWm,    & 
& cplSeSvImcVWmVP1(6,9),cplSeSvRecVWmVP1(6,9),cplSvImcSeVPVWm1(9,6),cplSvRecSeVPVWm1(9,6)

Complex(dp), Intent(out) :: Amp(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,9
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSvIm(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReVP



End Module OneLoopDecay_SvIm_NInvSeesaw