! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:34 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Ah_seesaw1nmssm
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

Subroutine Amplitude_Tree_seesaw1nmssm_AhToAhAh(cplAhAhAh,MAh,MAh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3)

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3)

Complex(dp) :: Amp(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhAhAh(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhToAhAh


Subroutine Gamma_Real_seesaw1nmssm_AhToAhAh(MLambda,em,gs,cplAhAhAh,MAh,              & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3)

Real(dp), Intent(in) :: MAh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=2,3
    Do i3=2,3
Coup = cplAhAhAh(i1,i2,i3)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhToAhAh


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToAhAh(cplAhAhAh,ctcplAhAhAh,MAh,            & 
& MAh2,ZfAh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3)

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3)

Complex(dp), Intent(in) :: ctcplAhAhAh(3,3,3)

Complex(dp), Intent(in) :: ZfAh(3,3)

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
Mex1 = MAh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhAhAh(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhAhAh(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt2)*cplAhAhAh(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhAhAh(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToAhAh


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToAhAh(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,    & 
& cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,Amp)

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
& cplAhcHpmVWm(3,2),cplAhAhAhAh1(3,3,3,3),cplAhAhAhhh1(3,3,3,3),cplAhAhhhhh1(3,3,3,3),   & 
& cplAhAhHpmcHpm1(3,3,2,2),cplAhAhSdcSdaa(3,3,6,6),cplAhAhSecSe1(3,3,6,6),               & 
& cplAhAhSucSuaa(3,3,6,6),cplAhAhSvImSvIm1(3,3,6,6),cplAhAhSvImSvRe1(3,3,6,6),           & 
& cplAhAhSvReSvRe1(3,3,6,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, hh}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplAhhhhh(gt2,i1,i3)
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


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, hh}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = -cplAhhhVZ(gt2,i3)
coup3 = cplAhhhhh(gt3,i3,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplAhAhSvReSvRe1(gt2,gt3,i1,i2)
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
coup1 = cplAhAhAhAh1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhAhhh1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhhhhh1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhHpmcHpm1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSdcSdaa(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSecSe1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSucSuaa(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSvImSvIm1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSvImSvRe1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSvReSvRe1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhAhAh1(gt1,gt2,i1,i2)
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
coup1 = cplAhAhAhhh1(gt1,gt2,i1,i2)
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
coup1 = cplAhAhhhhh1(gt1,gt2,i1,i2)
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
coup1 = cplAhAhHpmcHpm1(gt1,gt2,i1,i2)
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
coup1 = cplAhAhSdcSdaa(gt1,gt2,i1,i2)
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
coup1 = cplAhAhSecSe1(gt1,gt2,i1,i2)
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
coup1 = cplAhAhSucSuaa(gt1,gt2,i1,i2)
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
coup1 = cplAhAhSvImSvIm1(gt1,gt2,i1,i2)
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
coup1 = cplAhAhSvImSvRe1(gt1,gt2,i1,i2)
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
coup1 = cplAhAhSvReSvRe1(gt1,gt2,i1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToAhAh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToAhAh(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,    & 
& cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,Amp)

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
& cplAhcHpmVWm(3,2),cplAhAhAhAh1(3,3,3,3),cplAhAhAhhh1(3,3,3,3),cplAhAhhhhh1(3,3,3,3),   & 
& cplAhAhHpmcHpm1(3,3,2,2),cplAhAhSdcSdaa(3,3,6,6),cplAhAhSecSe1(3,3,6,6),               & 
& cplAhAhSucSuaa(3,3,6,6),cplAhAhSvImSvIm1(3,3,6,6),cplAhAhSvImSvRe1(3,3,6,6),           & 
& cplAhAhSvReSvRe1(3,3,6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToAhAh


Subroutine Amplitude_Tree_seesaw1nmssm_AhTohhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,Amp)

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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhAhhh(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTohhAh


Subroutine Gamma_Real_seesaw1nmssm_AhTohhAh(MLambda,em,gs,cplAhAhhh,MAh,              & 
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
 
Do i1=2,3
  Do i2=1,3
    Do i3=2,3
Coup = cplAhAhhh(i1,i3,i2)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTohhAh


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTohhAh(cplAhAhhh,ctcplAhAhhh,MAh,            & 
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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhAhhh(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhAhhh(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplAhAhhh(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhAhhh(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTohhAh


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTohhAh(MAh,MCha,MChi,MFd,MFe,              & 
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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Ah, hh, VZ}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, hh}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, Ah}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = cplAhAhhh(gt3,i3,i2)
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


! {VZ, hh, VZ}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
  Do i2=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplhhVZVZ(gt2)
coup3 = cplAhhhVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplAhHpmcVWm(gt1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhAhAhAh1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhAhhh1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhhhhh1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhHpmcHpm1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSdcSdaa(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSecSe1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSucSuaa(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSvImSvIm1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSvImSvRe1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSvReSvRe1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhcVWmVWm1(gt1,gt3)
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
coup1 = cplAhAhVZVZ1(gt1,gt3)
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
coup1 = cplAhAhAhhh1(gt1,i1,i2,gt2)
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
coup1 = cplAhAhhhhh1(gt1,i1,gt2,i2)
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
coup1 = cplAhhhhhhh1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhHpmcHpm1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSdcSdaa(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSecSe1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSucSuaa(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSvImSvIm1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSvImSvRe1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSvReSvRe1(gt1,gt2,i1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTohhAh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTohhAh(MAh,MCha,MChi,MFd,               & 
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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTohhAh


Subroutine Amplitude_Tree_seesaw1nmssm_AhTocChaCha(cplcChaChaAhL,cplcChaChaAhR,       & 
& MAh,MCha,MAh2,MCha2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MAh2(3),MCha2(2)

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3)

Complex(dp) :: Amp(2,3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MCha(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaChaAhL(gt2,gt3,gt1)
coupT1R = cplcChaChaAhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTocChaCha


Subroutine Gamma_Real_seesaw1nmssm_AhTocChaCha(MLambda,em,gs,cplcChaChaAhL,           & 
& cplcChaChaAhR,MAh,MCha,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3)

Real(dp), Intent(in) :: MAh(3),MCha(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,2,2), GammarealGluon(3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=2,3
  Do i2=1,2
    Do i3=1,2
CoupL = cplcChaChaAhL(i2,i3,i1)
CoupR = cplcChaChaAhR(i2,i3,i1)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTocChaCha


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocChaCha(cplcChaChaAhL,cplcChaChaAhR,       & 
& ctcplcChaChaAhL,ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2)

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3)

Complex(dp), Intent(in) :: ctcplcChaChaAhL(2,2,3),ctcplcChaChaAhR(2,2,3)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfLm(2,2),ZfLp(2,2)

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
Mex1 = MAh(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MCha(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChaAhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcChaChaAhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt1)*cplcChaChaAhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt1)*cplcChaChaAhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt2)*cplcChaChaAhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt2))*cplcChaChaAhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt3)*cplcChaChaAhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt3))*cplcChaChaAhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocChaCha


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocChaCha(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,  & 
& cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),   & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),   & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6), & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),   & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Chi, Chi, Hpm}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopHpm)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Cha}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopCha)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MCha(i3) 
coup1 = cplAhhhVZ(gt1,i1)
coup2L = cplcChaChahhL(gt2,i3,i1)
coup2R = cplcChaChahhR(gt2,i3,i1)
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


! {Su, Su, Fd}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MFd(i3) 
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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


! {VZ, hh, Cha}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopCha)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MCha(i3) 
coup1 = cplAhhhVZ(gt1,i2)
coup2L = cplcChaChaVZL(gt2,i3)
coup2R = cplcChaChaVZR(gt2,i3)
coup3L = cplcChaChahhL(i3,gt3,i2)
coup3R = cplcChaChahhR(i3,gt3,i2)
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


! {bar[Cha], bar[Cha], Ah}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhHpmcVWm(gt1,i2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocChaCha


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocChaCha(MAh,MCha,MChi,MFd,            & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,  & 
& cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),   & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),   & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6), & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),   & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

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
Mex1 = MAh(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MCha(gt3) 


! {bar[Cha], bar[Cha], VP}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MVP 
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocChaCha


Subroutine Amplitude_Tree_seesaw1nmssm_AhToChiChi(cplChiChiAhL,cplChiChiAhR,          & 
& MAh,MChi,MAh2,MChi2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MChi(5),MAh2(3),MChi2(5)

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3)

Complex(dp) :: Amp(2,3,5,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,5
    Do gt3=1,5
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MChi(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiChiAhL(gt2,gt3,gt1)
coupT1R = cplChiChiAhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhToChiChi


Subroutine Gamma_Real_seesaw1nmssm_AhToChiChi(MLambda,em,gs,cplChiChiAhL,             & 
& cplChiChiAhR,MAh,MChi,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3)

Real(dp), Intent(in) :: MAh(3),MChi(5)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,5,5), GammarealGluon(3,5,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=2,3
  Do i2=1,5
    Do i3=1,5
CoupL = cplChiChiAhL(i2,i3,i1)
CoupR = cplChiChiAhR(i2,i3,i1)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhToChiChi


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToChiChi(cplChiChiAhL,cplChiChiAhR,          & 
& ctcplChiChiAhL,ctcplChiChiAhR,MAh,MAh2,MChi,MChi2,ZfAh,ZfL0,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MChi(5),MChi2(5)

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3)

Complex(dp), Intent(in) :: ctcplChiChiAhL(5,5,3),ctcplChiChiAhR(5,5,3)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfL0(5,5)

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
Mex1 = MAh(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MChi(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiChiAhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplChiChiAhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt1)*cplChiChiAhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt1)*cplChiChiAhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,5
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiChiAhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiChiAhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,5
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt3)*cplChiChiAhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt3))*cplChiChiAhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToChiChi


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToChiChi(MAh,MCha,MChi,MFd,MFe,            & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,     & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),   & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),           & 
& cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),       & 
& cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2), & 
& cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),       & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Cha, Cha, Hpm}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Chi}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopChi)) Then 
Do i1=1,3
    Do i3=1,5
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MChi(i3) 
coup1 = cplAhhhVZ(gt1,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
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


! {Hpm, Hpm, Cha}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, Chi}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopChi)) Then 
  Do i2=1,3
    Do i3=1,5
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhhhVZ(gt1,i2)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
coup3L = cplChiChihhL(gt3,i3,i2)
coup3R = cplChiChihhR(gt3,i3,i2)
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


! {bar[Cha], bar[Cha], conj[Hpm]}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhHpmcVWm(gt1,i2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToChiChi


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToChiChi(MAh,MCha,MChi,MFd,             & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,     & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),   & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),           & 
& cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),       & 
& cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2), & 
& cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),       & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5)

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
Mex1 = MAh(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MChi(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToChiChi


Subroutine Amplitude_Tree_seesaw1nmssm_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,             & 
& MAh,MFd,MAh2,MFd2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MFd(3),MAh2(3),MFd2(3)

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdAhL(gt2,gt3,gt1)
coupT1R = cplcFdFdAhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTocFdFd


Subroutine Gamma_Real_seesaw1nmssm_AhTocFdFd(MLambda,em,gs,cplcFdFdAhL,               & 
& cplcFdFdAhR,MAh,MFd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3)

Real(dp), Intent(in) :: MAh(3),MFd(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=2,3
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFdFdAhL(i2,i3,i1)
CoupR = cplcFdFdAhR(i2,i3,i1)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTocFdFd


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,             & 
& ctcplcFdFdAhL,ctcplcFdFdAhR,MAh,MAh2,MFd,MFd2,ZfAh,ZfFDL,ZfFDR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MFd(3),MFd2(3)

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3)

Complex(dp), Intent(in) :: ctcplcFdFdAhL(3,3,3),ctcplcFdFdAhR(3,3,3)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfFDL(3,3),ZfFDR(3,3)

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
Mex1 = MAh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdAhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFdFdAhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt1)*cplcFdFdAhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt1)*cplcFdFdAhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDR(i1,gt2)*cplcFdFdAhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDL(i1,gt2))*cplcFdFdAhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDL(i1,gt3)*cplcFdFdAhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDR(i1,gt3))*cplcFdFdAhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocFdFd


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,             & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,       & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,    & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),MFu2(3),MGlu2,Mhh2(3),              & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),           & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),               & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcChaFdcSuL(2,3,6),& 
& cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),     & 
& cplcFuFdcVWmR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),          & 
& cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Chi, Chi, Sd}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopSd)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MSd(i3) 
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Fd}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplAhhhVZ(gt1,i1)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
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


! {VZ, hh, Fd}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopFd)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhhhVZ(gt1,i2)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
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


! {bar[Cha], bar[Cha], Su}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSu)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhHpmcVWm(gt1,i2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocFdFd


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocFdFd(MAh,MCha,MChi,MFd,              & 
& MFu,MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,           & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,       & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,    & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),MFu2(3),MGlu2,Mhh2(3),              & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),           & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),               & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcChaFdcSuL(2,3,6),& 
& cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),     & 
& cplcFuFdcVWmR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),          & 
& cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6)

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
Mex1 = MAh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {bar[Fd], bar[Fd], VG}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocFdFd


Subroutine Amplitude_Tree_seesaw1nmssm_AhTocFeFe(cplcFeFeAhL,cplcFeFeAhR,             & 
& MAh,MFe,MAh2,MFe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MFe(3),MAh2(3),MFe2(3)

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFeAhL(gt2,gt3,gt1)
coupT1R = cplcFeFeAhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTocFeFe


Subroutine Gamma_Real_seesaw1nmssm_AhTocFeFe(MLambda,em,gs,cplcFeFeAhL,               & 
& cplcFeFeAhR,MAh,MFe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3)

Real(dp), Intent(in) :: MAh(3),MFe(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=2,3
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFeFeAhL(i2,i3,i1)
CoupR = cplcFeFeAhR(i2,i3,i1)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTocFeFe


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocFeFe(cplcFeFeAhL,cplcFeFeAhR,             & 
& ctcplcFeFeAhL,ctcplcFeFeAhR,MAh,MAh2,MFe,MFe2,ZfAh,ZfFEL,ZfFER,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MFe(3),MFe2(3)

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3)

Complex(dp), Intent(in) :: ctcplcFeFeAhL(3,3,3),ctcplcFeFeAhR(3,3,3)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfFEL(3,3),ZfFER(3,3)

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
Mex1 = MAh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeAhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFeFeAhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt1)*cplcFeFeAhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt1)*cplcFeFeAhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFER(i1,gt2)*cplcFeFeAhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFEL(i1,gt2))*cplcFeFeAhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt3)*cplcFeFeAhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt3))*cplcFeFeAhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocFeFe


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocFeFe(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,  & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,               & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),         & 
& cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),    & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),             & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Chi, Chi, Se}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopSe)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MSe(i3) 
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Fe}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplAhhhVZ(gt1,i1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
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


! {SvIm, SvIm, Cha}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MCha(i3) 
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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


! {VZ, hh, Fe}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplAhhhVZ(gt1,i2)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
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


! {bar[Cha], bar[Cha], SvIm}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhHpmcVWm(gt1,i2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocFeFe


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocFeFe(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,            & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),         & 
& cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),    & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),             & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6)

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
Mex1 = MAh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {bar[Fe], bar[Fe], VP}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocFeFe


Subroutine Amplitude_Tree_seesaw1nmssm_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,             & 
& MAh,MFu,MAh2,MFu2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MFu(3),MAh2(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFuFuAhL(gt2,gt3,gt1)
coupT1R = cplcFuFuAhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTocFuFu


Subroutine Gamma_Real_seesaw1nmssm_AhTocFuFu(MLambda,em,gs,cplcFuFuAhL,               & 
& cplcFuFuAhR,MAh,MFu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3)

Real(dp), Intent(in) :: MAh(3),MFu(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=2,3
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFuFuAhL(i2,i3,i1)
CoupR = cplcFuFuAhR(i2,i3,i1)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTocFuFu


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,             & 
& ctcplcFuFuAhL,ctcplcFuFuAhR,MAh,MAh2,MFu,MFu2,ZfAh,ZfFUL,ZfFUR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3)

Complex(dp), Intent(in) :: ctcplcFuFuAhL(3,3,3),ctcplcFuFuAhR(3,3,3)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfFUL(3,3),ZfFUR(3,3)

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
Mex1 = MAh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuAhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFuFuAhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt1)*cplcFuFuAhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt1)*cplcFuFuAhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUR(i1,gt2)*cplcFuFuAhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUL(i1,gt2))*cplcFuFuAhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUL(i1,gt3)*cplcFuFuAhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUR(i1,gt3))*cplcFuFuAhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocFuFu


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,             & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,       & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),MFu2(3),MGlu2,Mhh2(3),              & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),     & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),             & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),         & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3), & 
& cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),& 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Cha, Cha, Sd}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Fu}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplAhhhVZ(gt1,i1)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
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


! {Hpm, Hpm, Fd}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MFd(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, Fu}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopFu)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplAhhhVZ(gt1,i2)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
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


! {bar[Fd], bar[Fd], conj[Hpm]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocFuFu


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocFuFu(MAh,MCha,MChi,MFd,              & 
& MFu,MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,           & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,       & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),MFu2(3),MGlu2,Mhh2(3),              & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),     & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),             & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),         & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3), & 
& cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),& 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

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
Mex1 = MAh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {bar[Fu], bar[Fu], VG}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocFuFu


Subroutine Amplitude_Tree_seesaw1nmssm_AhToFvFv(cplFvFvAhL,cplFvFvAhR,MAh,            & 
& MFv,MAh2,MFv2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MFv(6),MAh2(3),MFv2(6)

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

Complex(dp) :: Amp(2,3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFvAhL(gt2,gt3,gt1)
coupT1R = cplFvFvAhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhToFvFv


Subroutine Gamma_Real_seesaw1nmssm_AhToFvFv(MLambda,em,gs,cplFvFvAhL,cplFvFvAhR,      & 
& MAh,MFv,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

Real(dp), Intent(in) :: MAh(3),MFv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=2,3
  Do i2=1,6
    Do i3=1,6
CoupL = cplFvFvAhL(i2,i3,i1)
CoupR = cplFvFvAhR(i2,i3,i1)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhToFvFv


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToFvFv(cplFvFvAhL,cplFvFvAhR,ctcplFvFvAhL,   & 
& ctcplFvFvAhR,MAh,MAh2,MFv,MFv2,ZfAh,ZfFV,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MFv(6),MFv2(6)

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

Complex(dp), Intent(in) :: ctcplFvFvAhL(6,6,3),ctcplFvFvAhR(6,6,3)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfFV(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvAhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplFvFvAhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt1)*cplFvFvAhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt1)*cplFvFvAhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplFvFvAhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplFvFvAhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt3)*cplFvFvAhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt3))*cplFvFvAhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToFvFv


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToFvFv(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,         & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,  & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,      & 
& cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),         & 
& cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),        & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Cha, Cha, Se}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Fv}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopFv)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = cplAhhhVZ(gt1,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, Hpm, Fe}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MFe(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, Fv}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopFv)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MFv(i3) 
coup1 = cplAhhhVZ(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplFvFvhhL(gt3,i3,i2)
coup3R = cplFvFvhhR(gt3,i3,i2)
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


! {bar[Cha], bar[Cha], conj[Se]}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhHpmcVWm(gt1,i2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToFvFv


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToFvFv(MAh,MCha,MChi,MFe,               & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,         & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,  & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,      & 
& cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),         & 
& cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),        & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6)

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
Mex1 = MAh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToFvFv


Subroutine Amplitude_Tree_seesaw1nmssm_AhTohhhh(cplAhhhhh,MAh,Mhh,MAh2,Mhh2,Amp)

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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhhhhh(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTohhhh


Subroutine Gamma_Real_seesaw1nmssm_AhTohhhh(MLambda,em,gs,cplAhhhhh,MAh,              & 
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
 
Do i1=2,3
  Do i2=1,3
    Do i3=1,3
Coup = cplAhhhhh(i1,i2,i3)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTohhhh


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTohhhh(cplAhhhhh,ctcplAhhhhh,MAh,            & 
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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhhh(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhhhhh(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplAhhhhh(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplAhhhhh(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTohhhh


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTohhhh(MAh,MCha,MChi,MFd,MFe,              & 
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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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


! {hh, Ah, Ah}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Ah}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplAhhhhh(i3,gt2,i1)
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


! {hh, Ah, hh}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, Ah}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = cplAhhhhh(i3,gt3,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplAhHpmcVWm(gt1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplhhhhSvReSvRe1(gt2,gt3,i1,i2)
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
coup1 = cplAhAhAhhh1(gt1,i1,i2,gt3)
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
coup1 = cplAhAhhhhh1(gt1,i1,gt3,i2)
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
coup1 = cplAhhhhhhh1(gt1,gt3,i1,i2)
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
coup1 = cplAhhhHpmcHpm1(gt1,gt3,i1,i2)
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
coup1 = cplAhhhSdcSdaa(gt1,gt3,i1,i2)
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
coup1 = cplAhhhSecSe1(gt1,gt3,i1,i2)
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
coup1 = cplAhhhSucSuaa(gt1,gt3,i1,i2)
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
coup1 = cplAhhhSvImSvIm1(gt1,gt3,i1,i2)
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
coup1 = cplAhhhSvImSvRe1(gt1,gt3,i1,i2)
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
coup1 = cplAhhhSvReSvRe1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhAhhh1(gt1,i1,i2,gt2)
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
coup1 = cplAhAhhhhh1(gt1,i1,gt2,i2)
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
coup1 = cplAhhhhhhh1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhHpmcHpm1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSdcSdaa(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSecSe1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSucSuaa(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSvImSvIm1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSvImSvRe1(gt1,gt2,i1,i2)
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
coup1 = cplAhhhSvReSvRe1(gt1,gt2,i1,i2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTohhhh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTohhhh(MAh,MCha,MChi,MFd,               & 
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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTohhhh


Subroutine Amplitude_Tree_seesaw1nmssm_AhTohhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,           & 
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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplAhhhVZ(gt1,gt2)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTohhVZ


Subroutine Gamma_Real_seesaw1nmssm_AhTohhVZ(MLambda,em,gs,cplAhhhVZ,MAh,              & 
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
 
Do i1=2,3
  Do i2=1,3
Coup = cplAhhhVZ(i1,i2)
Mex1 = MAh(i1)
Mex2 = Mhh(i2)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTohhVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTohhVZ(cplAhhhVZ,ctcplAhhhVZ,MAh,            & 
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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhVZ(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhhhVZ(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplAhhhVZ(gt1,i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplAhhhVZ(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTohhVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTohhVZ(MAh,MCha,MChi,MFd,MFe,              & 
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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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


! {Ah, hh, VZ}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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


! {hh, VZ, hh}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {Hpm, Hpm, Hpm}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, Ah}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = -cplAhhhVZ(i3,gt2)
coup3 = cplAhhhVZ(i3,i2)
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


! {VZ, hh, VZ}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
  Do i2=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplAhhhVZ(gt1,i1)
coup2 = cplhhhhVZVZ1(gt2,i1)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhcHpmVWm(gt1,i2)
coup2 = cplhhHpmcVWmVZ1(gt2,i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = MAh(i1) 
ML2 = MVZ 
coup1 = cplAhAhVZVZ1(gt1,i1)
coup2 = -cplAhhhVZ(i1,gt2)
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
coup1 = cplAhHpmcVWmVZ1(gt1,i1)
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
coup1 = cplAhcHpmVWmVZ1(gt1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTohhVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTohhVZ(MAh,MCha,MChi,MFd,               & 
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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTohhVZ


Subroutine Amplitude_Tree_seesaw1nmssm_AhTocHpmHpm(cplAhHpmcHpm,MAh,MHpm,             & 
& MAh2,MHpm2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MHpm(2),MAh2(3),MHpm2(2)

Complex(dp), Intent(in) :: cplAhHpmcHpm(3,2,2)

Complex(dp) :: Amp(3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhHpmcHpm(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTocHpmHpm


Subroutine Gamma_Real_seesaw1nmssm_AhTocHpmHpm(MLambda,em,gs,cplAhHpmcHpm,            & 
& MAh,MHpm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhHpmcHpm(3,2,2)

Real(dp), Intent(in) :: MAh(3),MHpm(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,2,2), GammarealGluon(3,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=2,2
    Do i3=2,2
Coup = cplAhHpmcHpm(i1,i3,i2)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTocHpmHpm


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocHpmHpm(cplAhHpmcHpm,ctcplAhHpmcHpm,       & 
& MAh,MAh2,MHpm,MHpm2,ZfAh,ZfHpm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MHpm(2),MHpm2(2)

Complex(dp), Intent(in) :: cplAhHpmcHpm(3,2,2)

Complex(dp), Intent(in) :: ctcplAhHpmcHpm(3,2,2)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfHpm(2,2)

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
Mex1 = MAh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhHpmcHpm(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhHpmcHpm(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHpm(i1,gt2))*cplAhHpmcHpm(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHpm(i1,gt3)*cplAhHpmcHpm(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocHpmHpm


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocHpmHpm(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,       & 
& cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,       & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,        & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1, & 
& cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,     & 
& cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,    & 
& cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,& 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplcChaChiHpmL(2,5,2),   & 
& cplcChaChiHpmR(2,5,2),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplFvFecHpmL(6,3,2),   & 
& cplFvFecHpmR(6,3,2),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFeFvHpmL(3,6,2),       & 
& cplcFeFvHpmR(3,6,2),cplcgZgWmcHpm(2),cplcgZgWpCHpm(2),cplcgWmgZHpm(2),cplcgWpCgZcHpm(2),& 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhcHpmVWm(3,2),cplHpmSucSd(2,6,6),            & 
& cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),            & 
& cplSeSvRecHpm(6,6,2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplAhAhHpmcHpm1(3,3,2,2),         & 
& cplAhhhHpmcHpm1(3,3,2,2),cplAhHpmSucSdaa(3,2,6,6),cplAhHpmSvImcSe1(3,2,6,6),           & 
& cplAhHpmSvRecSe1(3,2,6,6),cplAhHpmcVWmVP1(3,2),cplAhHpmcVWmVZ1(3,2),cplAhSdcHpmcSuaa(3,6,2,6),& 
& cplAhSeSvImcHpm1(3,6,6,2),cplAhSeSvRecHpm1(3,6,6,2),cplAhcHpmVPVWm1(3,2),              & 
& cplAhcHpmVWmVZ1(3,2),cplhhhhHpmcHpm1(3,3,2,2),cplHpmHpmcHpmcHpm1(2,2,2,2),             & 
& cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),       & 
& cplHpmSvImSvImcHpm1(2,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),cplHpmSvReSvRecHpm1(2,6,6,2)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Ah, Ah, VWm}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Chi, Chi, Cha}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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


! {hh, Ah, Hpm}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Hpm}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhHpmcHpm(i1,i3,gt2)
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


! {hh, Ah, VWm}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, VWm}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhcHpmVWm(i1,gt2)
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


! {Su, Su, Sd}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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


! {VZ, hh, Hpm}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplHpmcHpmVZ(i3,gt2)
coup3 = cplhhHpmcHpm(i2,gt3,i3)
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


! {VZ, hh, VWm}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
  Do i2=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplcHpmVWmVZ(gt2)
coup3 = -cplhhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {bar[Cha], bar[Cha], Chi}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,5
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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


! {conj[Hpm], conj[Hpm], Ah}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], hh}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], VZ}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplHpmSvReSvRecHpm1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, Hpm}
If ((Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhAhHpmcHpm1(gt1,i1,gt3,i2)
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
coup1 = cplAhhhHpmcHpm1(gt1,i1,gt3,i2)
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
coup1 = cplAhHpmSucSdaa(gt1,gt3,i1,i2)
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
coup1 = cplAhHpmSvImcSe1(gt1,gt3,i1,i2)
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
coup1 = cplAhHpmSvRecSe1(gt1,gt3,i1,i2)
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
coup1 = cplAhHpmcVWmVP1(gt1,gt3)
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
coup1 = cplAhHpmcVWmVZ1(gt1,gt3)
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
coup1 = cplAhAhHpmcHpm1(gt1,i1,i2,gt2)
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
coup1 = cplAhhhHpmcHpm1(gt1,i1,i2,gt2)
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
coup1 = cplAhSdcHpmcSuaa(gt1,i1,gt2,i2)
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
coup1 = cplAhSeSvImcHpm1(gt1,i1,i2,gt2)
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
coup1 = cplAhSeSvRecHpm1(gt1,i1,i2,gt2)
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
coup1 = cplAhcHpmVPVWm1(gt1,gt2)
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
coup1 = cplAhcHpmVWmVZ1(gt1,gt2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocHpmHpm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocHpmHpm(MAh,MCha,MChi,MFd,            & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,       & 
& cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,       & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,        & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1, & 
& cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,     & 
& cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,    & 
& cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,& 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplcChaChiHpmL(2,5,2),   & 
& cplcChaChiHpmR(2,5,2),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplFvFecHpmL(6,3,2),   & 
& cplFvFecHpmR(6,3,2),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFeFvHpmL(3,6,2),       & 
& cplcFeFvHpmR(3,6,2),cplcgZgWmcHpm(2),cplcgZgWpCHpm(2),cplcgWmgZHpm(2),cplcgWpCgZcHpm(2),& 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhcHpmVWm(3,2),cplHpmSucSd(2,6,6),            & 
& cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),            & 
& cplSeSvRecHpm(6,6,2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplAhAhHpmcHpm1(3,3,2,2),         & 
& cplAhhhHpmcHpm1(3,3,2,2),cplAhHpmSucSdaa(3,2,6,6),cplAhHpmSvImcSe1(3,2,6,6),           & 
& cplAhHpmSvRecSe1(3,2,6,6),cplAhHpmcVWmVP1(3,2),cplAhHpmcVWmVZ1(3,2),cplAhSdcHpmcSuaa(3,6,2,6),& 
& cplAhSeSvImcHpm1(3,6,6,2),cplAhSeSvRecHpm1(3,6,6,2),cplAhcHpmVPVWm1(3,2),              & 
& cplAhcHpmVWmVZ1(3,2),cplhhhhHpmcHpm1(3,3,2,2),cplHpmHpmcHpmcHpm1(2,2,2,2),             & 
& cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),       & 
& cplHpmSvImSvImcHpm1(2,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),cplHpmSvReSvRecHpm1(2,6,6,2)

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
Mex1 = MAh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MHpm(gt3) 


! {conj[Hpm], conj[Hpm], VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplHpmcHpmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VWm}
If ((Include_in_loopVP).and.(Include_in_loopVWm)) Then 
ML1 = MVP 
ML2 = MVWm 
coup1 = cplAhHpmcVWmVP1(gt1,gt3)
coup2 = cplcHpmVPVWm(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VP, conj[VWm]}
If ((Include_in_loopVP).and.(Include_in_loopVWm)) Then 
ML1 = MVP 
ML2 = MVWm 
coup1 = cplAhcHpmVPVWm1(gt1,gt2)
coup2 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocHpmHpm


Subroutine Amplitude_Tree_seesaw1nmssm_AhToHpmcVWm(cplAhHpmcVWm,MAh,MHpm,             & 
& MVWm,MAh2,MHpm2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MHpm(2),MVWm,MAh2(3),MHpm2(2),MVWm2

Complex(dp), Intent(in) :: cplAhHpmcVWm(3,2)

Complex(dp) :: Amp(2,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,2
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = cplAhHpmcVWm(gt1,gt2)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhToHpmcVWm


Subroutine Gamma_Real_seesaw1nmssm_AhToHpmcVWm(MLambda,em,gs,cplAhHpmcVWm,            & 
& MAh,MHpm,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhHpmcVWm(3,2)

Real(dp), Intent(in) :: MAh(3),MHpm(2),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,2), GammarealGluon(3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=2,2
Coup = cplAhHpmcVWm(i1,i2)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhToHpmcVWm


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToHpmcVWm(cplAhHpmcVWm,ctcplAhHpmcVWm,       & 
& MAh,MAh2,MHpm,MHpm2,MVWm,MVWm2,ZfAh,ZfHpm,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MHpm(2),MHpm2(2),MVWm,MVWm2

Complex(dp), Intent(in) :: cplAhHpmcVWm(3,2)

Complex(dp), Intent(in) :: ctcplAhHpmcVWm(3,2)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfHpm(2,2),ZfVWm

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
Mex1 = MAh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhHpmcVWm(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhHpmcVWm(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHpm(i1,gt2)*cplAhHpmcVWm(gt1,i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplAhHpmcVWm(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToHpmcVWm


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToHpmcVWm(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,       & 
& cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,      & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,        & 
& cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,       & 
& cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcChaChiHpmL(2,5,2),       & 
& cplcChaChiHpmR(2,5,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFeFvHpmL(3,6,2),         & 
& cplcFeFvHpmR(3,6,2),cplcgWmgAHpm(2),cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHpm(2),      & 
& cplcgWmgZHpm(2),cplcgWpCgZcVWm,cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhcVWmVWm(3),  & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),& 
& cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm1(3,3),cplAhHpmcVWmVP1(3,2),& 
& cplAhHpmcVWmVZ1(3,2),cplhhHpmcVWmVZ1(3,2),cplHpmcHpmcVWmVWm1(2,2)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Ah, hh, conj[VWm]}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Cha, Cha, Chi}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,5
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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


! {hh, Ah, conj[Hpm]}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, conj[Hpm]}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhHpmcHpm(i1,gt2,i3)
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


! {hh, hh, conj[VWm]}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, conj[VWm]}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = -cplhhHpmcVWm(i1,gt2)
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


! {Hpm, Hpm, Ah}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VWm, Hpm, VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VWm, Hpm, VZ}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, conj[Hpm]}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplHpmcHpmVZ(gt2,i3)
coup3 = -cplhhHpmcVWm(i2,i3)
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


! {VZ, hh, conj[VWm]}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
  Do i2=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplHpmcVWmVZ(gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {bar[Fu], bar[Fu], bar[Fd]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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


! {conj[Su], conj[Su], conj[Sd]}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSucSu(gt1,i2,i1)
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


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplAhhhVZ(gt1,i1)
coup2 = cplhhHpmcVWmVZ1(i1,gt2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
coup2 = cplHpmcHpmcVWmVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, conj[VWm]}
If ((Include_in_loopAh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = MAh(i1) 
ML2 = MVWm 
coup1 = cplAhAhcVWmVWm1(gt1,i1)
coup2 = -cplAhHpmcVWm(i1,gt2)
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
coup1 = cplAhHpmcVWmVP1(gt1,i1)
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
coup1 = cplAhHpmcVWmVZ1(gt1,i1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToHpmcVWm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToHpmcVWm(MAh,MCha,MChi,MFd,            & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuHpmL,     & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,       & 
& cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,      & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,        & 
& cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,       & 
& cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcChaChiHpmL(2,5,2),       & 
& cplcChaChiHpmR(2,5,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFeFvHpmL(3,6,2),         & 
& cplcFeFvHpmR(3,6,2),cplcgWmgAHpm(2),cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHpm(2),      & 
& cplcgWmgZHpm(2),cplcgWpCgZcVWm,cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhcVWmVWm(3),  & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),& 
& cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm1(3,3),cplAhHpmcVWmVP1(3,2),& 
& cplAhHpmcVWmVZ1(3,2),cplhhHpmcVWmVZ1(3,2),cplHpmcHpmcVWmVWm1(2,2)

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
Mex1 = MAh(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MVWm 


! {Hpm, Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
coup2 = cplHpmcVWmVP(gt2)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVP 
coup1 = cplAhHpmcVWmVP1(gt1,i1)
coup2 = cplHpmcHpmVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToHpmcVWm


Subroutine Amplitude_Tree_seesaw1nmssm_AhTocSdSd(cplAhSdcSd,MAh,MSd,MAh2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MSd(6),MAh2(3),MSd2(6)

Complex(dp), Intent(in) :: cplAhSdcSd(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MSd(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSdcSd(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTocSdSd


Subroutine Gamma_Real_seesaw1nmssm_AhTocSdSd(MLambda,em,gs,cplAhSdcSd,MAh,            & 
& MSd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSdcSd(3,6,6)

Real(dp), Intent(in) :: MAh(3),MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=1,6
    Do i3=1,6
Coup = cplAhSdcSd(i1,i3,i2)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTocSdSd


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocSdSd(cplAhSdcSd,ctcplAhSdcSd,             & 
& MAh,MAh2,MSd,MSd2,ZfAh,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplAhSdcSd(3,6,6)

Complex(dp), Intent(in) :: ctcplAhSdcSd(3,6,6)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfSd(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MSd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSdcSd(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhSdcSd(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt2))*cplAhSdcSd(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt3)*cplAhSdcSd(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocSdSd


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,             & 
& MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,      & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplAhHpmSucSdaa,   & 
& cplAhSdcHpmcSuaa,cplhhhhSdcSdaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab, & 
& cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),           & 
& MFu2(3),MGlu2,Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),            & 
& MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),cplChaFucSdL(2,3,6),       & 
& cplChaFucSdR(2,3,6),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplcFdChiSdL(3,5,6),       & 
& cplcFdChiSdR(3,5,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplhhSdcSd(3,6,6),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),& 
& cplSdcSdVZ(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),         & 
& cplSdcSucVWm(6,6),cplSucSdVWm(6,6),cplAhAhSdcSdaa(3,3,6,6),cplAhhhSdcSdaa(3,3,6,6),    & 
& cplAhHpmSucSdaa(3,2,6,6),cplAhSdcHpmcSuaa(3,6,2,6),cplhhhhSdcSdaa(3,3,6,6),            & 
& cplHpmSdcHpmcSdaa(2,6,2,6),cplSdSdcSdcSdabba(6,6,6,6),cplSdSdcSdcSdabab(6,6,6,6),      & 
& cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),        & 
& cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Chi, Chi, Fd}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopFd)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Sd}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopSd)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MSd(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhSdcSd(i1,i3,gt2)
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


! {VZ, hh, Sd}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopSd)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MSd(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplSdcSdVZ(i3,gt2)
coup3 = cplhhSdcSd(i2,gt3,i3)
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


! {bar[Cha], bar[Cha], Fu}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFu)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplSdSvReSvRecSdaa(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, Sd}
If ((Include_in_loopAh).and.(Include_in_loopSd)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
coup1 = cplAhAhSdcSdaa(gt1,i1,gt3,i2)
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
coup1 = cplAhhhSdcSdaa(gt1,i1,gt3,i2)
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
coup1 = cplAhSdcHpmcSuaa(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSdcSdaa(gt1,i1,i2,gt2)
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
coup1 = cplAhhhSdcSdaa(gt1,i1,i2,gt2)
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
coup1 = cplAhHpmSucSdaa(gt1,i1,i2,gt2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocSdSd


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocSdSd(MAh,MCha,MChi,MFd,              & 
& MFu,MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,           & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,      & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplAhHpmSucSdaa,   & 
& cplAhSdcHpmcSuaa,cplhhhhSdcSdaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab, & 
& cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),           & 
& MFu2(3),MGlu2,Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),            & 
& MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),cplChaFucSdL(2,3,6),       & 
& cplChaFucSdR(2,3,6),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplcFdChiSdL(3,5,6),       & 
& cplcFdChiSdR(3,5,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplhhSdcSd(3,6,6),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),& 
& cplSdcSdVZ(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),         & 
& cplSdcSucVWm(6,6),cplSucSdVWm(6,6),cplAhAhSdcSdaa(3,3,6,6),cplAhhhSdcSdaa(3,3,6,6),    & 
& cplAhHpmSucSdaa(3,2,6,6),cplAhSdcHpmcSuaa(3,6,2,6),cplhhhhSdcSdaa(3,3,6,6),            & 
& cplHpmSdcHpmcSdaa(2,6,2,6),cplSdSdcSdcSdabba(6,6,6,6),cplSdSdcSdcSdabab(6,6,6,6),      & 
& cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),        & 
& cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MSd(gt3) 


! {conj[Sd], conj[Sd], VG}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MVG 
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocSdSd


Subroutine Amplitude_Tree_seesaw1nmssm_AhTocSeSe(cplAhSecSe,MAh,MSe,MAh2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MSe(6),MAh2(3),MSe2(6)

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MSe(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSecSe(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTocSeSe


Subroutine Gamma_Real_seesaw1nmssm_AhTocSeSe(MLambda,em,gs,cplAhSecSe,MAh,            & 
& MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6)

Real(dp), Intent(in) :: MAh(3),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=1,6
    Do i3=1,6
Coup = cplAhSecSe(i1,i3,i2)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTocSeSe


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocSeSe(cplAhSecSe,ctcplAhSecSe,             & 
& MAh,MAh2,MSe,MSe2,ZfAh,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6)

Complex(dp), Intent(in) :: ctcplAhSecSe(3,6,6)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfSe(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MSe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSecSe(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhSecSe(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt2))*cplAhSecSe(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt3)*cplAhSecSe(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocSeSe


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocSeSe(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,        & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,         & 
& cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,      & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),       & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSeSvImcHpm(6,6,2),      & 
& cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),            & 
& cplSecSeVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplAhAhSecSe1(3,3,6,6),          & 
& cplAhhhSecSe1(3,3,6,6),cplAhHpmSvImcSe1(3,2,6,6),cplAhHpmSvRecSe1(3,2,6,6),            & 
& cplAhSeSvImcHpm1(3,6,6,2),cplAhSeSvRecHpm1(3,6,6,2),cplhhhhSecSe1(3,3,6,6),            & 
& cplHpmSecHpmcSe1(2,6,2,6),cplSdSecSdcSeaa(6,6,6,6),cplSeSecSecSe1(6,6,6,6),            & 
& cplSeSucSecSuaa(6,6,6,6),cplSeSvImSvImcSe1(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),        & 
& cplSeSvReSvRecSe1(6,6,6,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Chi, Chi, Fe}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopFe)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Se}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopSe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MSe(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhSecSe(i1,i3,gt2)
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


! {SvIm, SvIm, Hpm}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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


! {VZ, hh, Se}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopSe)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MSe(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplSecSeVZ(i3,gt2)
coup3 = cplhhSecSe(i2,gt3,i3)
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


! {bar[Cha], bar[Cha], Fv}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], SvRe}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopSvRe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MSvRe(i3) 
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplSeSvReSvRecSe1(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, Se}
If ((Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhAhSecSe1(gt1,i1,gt3,i2)
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
coup1 = cplAhhhSecSe1(gt1,i1,gt3,i2)
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
coup1 = cplAhSeSvImcHpm1(gt1,gt3,i1,i2)
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
coup1 = cplAhSeSvRecHpm1(gt1,gt3,i1,i2)
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
coup1 = cplAhAhSecSe1(gt1,i1,i2,gt2)
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
coup1 = cplAhhhSecSe1(gt1,i1,i2,gt2)
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
coup1 = cplAhHpmSvImcSe1(gt1,i1,i2,gt2)
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
coup1 = cplAhHpmSvRecSe1(gt1,i1,i2,gt2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocSeSe


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocSeSe(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,               & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,        & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,         & 
& cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,      & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),       & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSeSvImcHpm(6,6,2),      & 
& cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),            & 
& cplSecSeVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplAhAhSecSe1(3,3,6,6),          & 
& cplAhhhSecSe1(3,3,6,6),cplAhHpmSvImcSe1(3,2,6,6),cplAhHpmSvRecSe1(3,2,6,6),            & 
& cplAhSeSvImcHpm1(3,6,6,2),cplAhSeSvRecHpm1(3,6,6,2),cplhhhhSecSe1(3,3,6,6),            & 
& cplHpmSecHpmcSe1(2,6,2,6),cplSdSecSdcSeaa(6,6,6,6),cplSeSecSecSe1(6,6,6,6),            & 
& cplSeSucSecSuaa(6,6,6,6),cplSeSvImSvImcSe1(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),        & 
& cplSeSvReSvRecSe1(6,6,6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MSe(gt3) 


! {conj[Se], conj[Se], VP}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1 = cplAhSecSe(gt1,i2,i1)
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
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocSeSe


Subroutine Amplitude_Tree_seesaw1nmssm_AhTocSuSu(cplAhSucSu,MAh,MSu,MAh2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MSu(6),MAh2(3),MSu2(6)

Complex(dp), Intent(in) :: cplAhSucSu(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MSu(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSucSu(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhTocSuSu


Subroutine Gamma_Real_seesaw1nmssm_AhTocSuSu(MLambda,em,gs,cplAhSucSu,MAh,            & 
& MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSucSu(3,6,6)

Real(dp), Intent(in) :: MAh(3),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=1,6
    Do i3=1,6
Coup = cplAhSucSu(i1,i3,i2)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhTocSuSu


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocSuSu(cplAhSucSu,ctcplAhSucSu,             & 
& MAh,MAh2,MSu,MSu2,ZfAh,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSucSu(3,6,6)

Complex(dp), Intent(in) :: ctcplAhSucSu(3,6,6)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfSu(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MSu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSucSu(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhSucSu(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt2))*cplAhSucSu(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt3)*cplAhSucSu(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTocSuSu


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,             & 
& MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,      & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,        & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,       & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa,cplAhhhSucSuaa,            & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplhhhhSucSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,   & 
& cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,& 
& cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),           & 
& MFu2(3),MGlu2,Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),            & 
& MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplhhSucSu(3,6,6),cplHpmSucSd(2,6,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),            & 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplAhAhSucSuaa(3,3,6,6),& 
& cplAhhhSucSuaa(3,3,6,6),cplAhHpmSucSdaa(3,2,6,6),cplAhSdcHpmcSuaa(3,6,2,6),            & 
& cplhhhhSucSuaa(3,3,6,6),cplHpmSucHpmcSuaa(2,6,2,6),cplSdSucSdcSuabba(6,6,6,6),         & 
& cplSdSucSdcSuabab(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSuSucSucSuabba(6,6,6,6),        & 
& cplSuSucSucSuabab(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),    & 
& cplSuSvReSvRecSuaa(6,6,6,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Cha, Cha, Fd}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, Su}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopSu)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MSu(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhSucSu(i1,i3,gt2)
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


! {Hpm, Hpm, Sd}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSd(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, Su}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopSu)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MSu(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplSucSuVZ(i3,gt2)
coup3 = cplhhSucSu(i2,gt3,i3)
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


! {bar[Fd], bar[Fd], bar[Cha]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MCha(i3) 
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplSuSvReSvRecSuaa(gt3,i1,i2,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Ah, Su}
If ((Include_in_loopAh).and.(Include_in_loopSu)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
coup1 = cplAhAhSucSuaa(gt1,i1,gt3,i2)
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
coup1 = cplAhhhSucSuaa(gt1,i1,gt3,i2)
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
coup1 = cplAhHpmSucSdaa(gt1,i1,gt3,i2)
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
coup1 = cplAhAhSucSuaa(gt1,i1,i2,gt2)
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
coup1 = cplAhhhSucSuaa(gt1,i1,i2,gt2)
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
coup1 = cplAhSdcHpmcSuaa(gt1,i1,i2,gt2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTocSuSu


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocSuSu(MAh,MCha,MChi,MFd,              & 
& MFu,MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,           & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,      & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,        & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,       & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa,cplAhhhSucSuaa,            & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplhhhhSucSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,   & 
& cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,& 
& cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFu(3),MGlu,Mhh(3),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),           & 
& MFu2(3),MGlu2,Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),            & 
& MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplhhSucSu(3,6,6),cplHpmSucSd(2,6,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),            & 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplAhAhSucSuaa(3,3,6,6),& 
& cplAhhhSucSuaa(3,3,6,6),cplAhHpmSucSdaa(3,2,6,6),cplAhSdcHpmcSuaa(3,6,2,6),            & 
& cplhhhhSucSuaa(3,3,6,6),cplHpmSucHpmcSuaa(2,6,2,6),cplSdSucSdcSuabba(6,6,6,6),         & 
& cplSdSucSdcSuabab(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSuSucSucSuabba(6,6,6,6),        & 
& cplSuSucSucSuabab(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),    & 
& cplSuSvReSvRecSuaa(6,6,6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MSu(gt3) 


! {conj[Su], conj[Su], VG}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MVG 
coup1 = cplAhSucSu(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTocSuSu


Subroutine Amplitude_Tree_seesaw1nmssm_AhToSvImSvIm(cplAhSvImSvIm,MAh,MSvIm,          & 
& MAh2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MSvIm(6),MAh2(3),MSvIm2(6)

Complex(dp), Intent(in) :: cplAhSvImSvIm(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MSvIm(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSvImSvIm(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhToSvImSvIm


Subroutine Gamma_Real_seesaw1nmssm_AhToSvImSvIm(MLambda,em,gs,cplAhSvImSvIm,          & 
& MAh,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSvImSvIm(3,6,6)

Real(dp), Intent(in) :: MAh(3),MSvIm(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=1,6
    Do i3=1,6
Coup = cplAhSvImSvIm(i1,i2,i3)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhToSvImSvIm


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToSvImSvIm(cplAhSvImSvIm,ctcplAhSvImSvIm,    & 
& MAh,MAh2,MSvIm,MSvIm2,ZfAh,ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplAhSvImSvIm(3,6,6)

Complex(dp), Intent(in) :: ctcplAhSvImSvIm(3,6,6)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfSvIm(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MSvIm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSvImSvIm(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhSvImSvIm(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt2)*cplAhSvImSvIm(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt3)*cplAhSvImSvIm(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToSvImSvIm


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToSvImSvIm(MAh,MCha,MChi,MFe,              & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6), & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6), & 
& cplHpmSvImcSe(2,6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSvImSvReVZ(6,6),       & 
& cplSvImcSeVWm(6,6),cplAhAhSvImSvIm1(3,3,6,6),cplAhAhSvImSvRe1(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),& 
& cplAhhhSvImSvRe1(3,3,6,6),cplAhHpmSvImcSe1(3,2,6,6),cplAhSeSvImcHpm1(3,6,6,2),         & 
& cplhhhhSvImSvIm1(3,3,6,6),cplHpmSvImSvImcHpm1(2,6,6,2),cplSdSvImSvImcSdaa(6,6,6,6),    & 
& cplSeSvImSvImcSe1(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),cplSvImSvImSvImSvIm1(6,6,6,6),  & 
& cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Cha, Cha, Fe}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, SvRe}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MSvRe(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
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


! {Hpm, Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, SvRe}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopSvRe)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = -cplSvImSvReVZ(gt2,i3)
coup3 = cplhhSvImSvRe(i2,gt3,i3)
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
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplSvImSvImSvReSvRe1(gt2,gt3,i1,i2)
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
coup1 = cplAhAhSvImSvIm1(gt1,i1,gt3,i2)
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
coup1 = cplAhAhSvImSvRe1(gt1,i1,gt3,i2)
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
coup1 = cplAhhhSvImSvIm1(gt1,i1,gt3,i2)
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
coup1 = cplAhhhSvImSvRe1(gt1,i1,gt3,i2)
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
coup1 = cplAhHpmSvImcSe1(gt1,i1,gt3,i2)
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
coup1 = cplAhSeSvImcHpm1(gt1,i1,gt3,i2)
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
coup1 = cplAhAhSvImSvIm1(gt1,i1,gt2,i2)
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
coup1 = cplAhAhSvImSvRe1(gt1,i1,gt2,i2)
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
coup1 = cplAhhhSvImSvIm1(gt1,i1,gt2,i2)
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
coup1 = cplAhhhSvImSvRe1(gt1,i1,gt2,i2)
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
coup1 = cplAhHpmSvImcSe1(gt1,i1,gt2,i2)
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
coup1 = cplAhSeSvImcHpm1(gt1,i1,gt2,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToSvImSvIm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToSvImSvIm(MAh,MCha,MChi,               & 
& MFe,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,               & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,  & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,        & 
& cplAhhhSvImSvRe1,cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,cplhhhhSvImSvIm1,cplHpmSvImSvImcHpm1,& 
& cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,          & 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6), & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6), & 
& cplHpmSvImcSe(2,6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSvImSvReVZ(6,6),       & 
& cplSvImcSeVWm(6,6),cplAhAhSvImSvIm1(3,3,6,6),cplAhAhSvImSvRe1(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),& 
& cplAhhhSvImSvRe1(3,3,6,6),cplAhHpmSvImcSe1(3,2,6,6),cplAhSeSvImcHpm1(3,6,6,2),         & 
& cplhhhhSvImSvIm1(3,3,6,6),cplHpmSvImSvImcHpm1(2,6,6,2),cplSdSvImSvImcSdaa(6,6,6,6),    & 
& cplSeSvImSvImcSe1(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),cplSvImSvImSvImSvIm1(6,6,6,6),  & 
& cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MSvIm(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToSvImSvIm


Subroutine Amplitude_Tree_seesaw1nmssm_AhToSvReSvIm(cplAhSvImSvRe,MAh,MSvIm,          & 
& MSvRe,MAh2,MSvIm2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MSvIm(6),MSvRe(6),MAh2(3),MSvIm2(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhSvImSvRe(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvIm(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSvImSvRe(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhToSvReSvIm


Subroutine Gamma_Real_seesaw1nmssm_AhToSvReSvIm(MLambda,em,gs,cplAhSvImSvRe,          & 
& MAh,MSvIm,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSvImSvRe(3,6,6)

Real(dp), Intent(in) :: MAh(3),MSvIm(6),MSvRe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=1,6
    Do i3=1,6
Coup = cplAhSvImSvRe(i1,i3,i2)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhToSvReSvIm


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToSvReSvIm(cplAhSvImSvRe,ctcplAhSvImSvRe,    & 
& MAh,MAh2,MSvIm,MSvIm2,MSvRe,MSvRe2,ZfAh,ZfSvIm,ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MSvIm(6),MSvIm2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhSvImSvRe(3,6,6)

Complex(dp), Intent(in) :: ctcplAhSvImSvRe(3,6,6)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfSvIm(6,6),ZfSvRe(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvIm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSvImSvRe(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhSvImSvRe(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt2)*cplAhSvImSvRe(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt3)*cplAhSvImSvRe(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToSvReSvIm


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToSvReSvIm(MAh,MCha,MChi,MFe,              & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSu(6),MSvIm(6),           & 
& MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),          & 
& MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),            & 
& cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),cplcFeChaSvImL(3,2,6),     & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiFvSvImL(5,6,6),& 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplcChaFeSvImL(2,3,6),  & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplhhSvImSvIm(3,6,6),& 
& cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),   & 
& cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),       & 
& cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplAhAhSvImSvIm1(3,3,6,6),    & 
& cplAhAhSvImSvRe1(3,3,6,6),cplAhAhSvReSvRe1(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),         & 
& cplAhhhSvImSvRe1(3,3,6,6),cplAhhhSvReSvRe1(3,3,6,6),cplAhHpmSvImcSe1(3,2,6,6),         & 
& cplAhHpmSvRecSe1(3,2,6,6),cplAhSeSvImcHpm1(3,6,6,2),cplAhSeSvRecHpm1(3,6,6,2),         & 
& cplhhhhSvImSvRe1(3,3,6,6),cplHpmSvImSvRecHpm1(2,6,6,2),cplSeSvImSvRecSe1(6,6,6,6),     & 
& cplSuSvImSvRecSuaa(6,6,6,6),cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),& 
& cplSvImSvReSvReSvRe1(6,6,6,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Cha, Cha, Fe}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, SvRe}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MSvRe(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
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


! {Hpm, Hpm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, SvIm}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplSvImSvReVZ(i3,gt2)
coup3 = cplhhSvImSvIm(i2,gt3,i3)
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
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhAhSvImSvIm1(gt1,i1,gt3,i2)
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
coup1 = cplAhAhSvImSvRe1(gt1,i1,gt3,i2)
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
coup1 = cplAhhhSvImSvIm1(gt1,i1,gt3,i2)
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
coup1 = cplAhhhSvImSvRe1(gt1,i1,gt3,i2)
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
coup1 = cplAhHpmSvImcSe1(gt1,i1,gt3,i2)
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
coup1 = cplAhSeSvImcHpm1(gt1,i1,gt3,i2)
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
coup1 = cplAhAhSvImSvRe1(gt1,i1,i2,gt2)
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
coup1 = cplAhAhSvReSvRe1(gt1,i1,gt2,i2)
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
coup1 = cplAhhhSvImSvRe1(gt1,i1,i2,gt2)
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
coup1 = cplAhhhSvReSvRe1(gt1,i1,gt2,i2)
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
coup1 = cplAhHpmSvRecSe1(gt1,i1,gt2,i2)
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
coup1 = cplAhSeSvRecHpm1(gt1,i1,gt2,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToSvReSvIm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToSvReSvIm(MAh,MCha,MChi,               & 
& MFe,MFv,Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,       & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSu(6),MSvIm(6),           & 
& MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),          & 
& MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),            & 
& cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),cplcFeChaSvImL(3,2,6),     & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiFvSvImL(5,6,6),& 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplcChaFeSvImL(2,3,6),  & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplhhSvImSvIm(3,6,6),& 
& cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),   & 
& cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),       & 
& cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplAhAhSvImSvIm1(3,3,6,6),    & 
& cplAhAhSvImSvRe1(3,3,6,6),cplAhAhSvReSvRe1(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),         & 
& cplAhhhSvImSvRe1(3,3,6,6),cplAhhhSvReSvRe1(3,3,6,6),cplAhHpmSvImcSe1(3,2,6,6),         & 
& cplAhHpmSvRecSe1(3,2,6,6),cplAhSeSvImcHpm1(3,6,6,2),cplAhSeSvRecHpm1(3,6,6,2),         & 
& cplhhhhSvImSvRe1(3,3,6,6),cplHpmSvImSvRecHpm1(2,6,6,2),cplSeSvImSvRecSe1(6,6,6,6),     & 
& cplSuSvImSvRecSuaa(6,6,6,6),cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),& 
& cplSvImSvReSvReSvRe1(6,6,6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvIm(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToSvReSvIm


Subroutine Amplitude_Tree_seesaw1nmssm_AhToSvReSvRe(cplAhSvReSvRe,MAh,MSvRe,          & 
& MAh2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MSvRe(6),MAh2(3),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhSvReSvRe(3,6,6)

Complex(dp) :: Amp(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvRe(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSvReSvRe(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_AhToSvReSvRe


Subroutine Gamma_Real_seesaw1nmssm_AhToSvReSvRe(MLambda,em,gs,cplAhSvReSvRe,          & 
& MAh,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSvReSvRe(3,6,6)

Real(dp), Intent(in) :: MAh(3),MSvRe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,6,6), GammarealGluon(3,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=1,6
    Do i3=1,6
Coup = cplAhSvReSvRe(i1,i2,i3)
Mex1 = MAh(i1)
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
End Subroutine Gamma_Real_seesaw1nmssm_AhToSvReSvRe


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToSvReSvRe(cplAhSvReSvRe,ctcplAhSvReSvRe,    & 
& MAh,MAh2,MSvRe,MSvRe2,ZfAh,ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplAhSvReSvRe(3,6,6)

Complex(dp), Intent(in) :: ctcplAhSvReSvRe(3,6,6)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfSvRe(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvRe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSvReSvRe(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt1)*cplAhSvReSvRe(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt2)*cplAhSvReSvRe(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt3)*cplAhSvReSvRe(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToSvReSvRe


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToSvReSvRe(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvReL,      & 
& cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,cplcChaFeSvReR,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,   & 
& cplSvRecSeVWm,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,     & 
& cplAhHpmSvRecSe1,cplAhSeSvRecHpm1,cplhhhhSvReSvRe1,cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,& 
& cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,        & 
& cplSvReSvReSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6), & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6), & 
& cplHpmSvRecSe(2,6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSvImSvReVZ(6,6),       & 
& cplSvRecSeVWm(6,6),cplAhAhSvImSvRe1(3,3,6,6),cplAhAhSvReSvRe1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),& 
& cplAhhhSvReSvRe1(3,3,6,6),cplAhHpmSvRecSe1(3,2,6,6),cplAhSeSvRecHpm1(3,6,6,2),         & 
& cplhhhhSvReSvRe1(3,3,6,6),cplHpmSvReSvRecHpm1(2,6,6,2),cplSdSvReSvRecSdaa(6,6,6,6),    & 
& cplSeSvReSvRecSe1(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),  & 
& cplSvImSvReSvReSvRe1(6,6,6,6),cplSvReSvReSvReSvRe1(6,6,6,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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


! {Ah, Ah, SvRe}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, SvIm}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MSvIm(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
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


! {hh, Ah, SvRe}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhAhhh(gt1,i2,i1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VZ, hh, SvIm}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1 = -cplAhhhVZ(gt1,i2)
coup2 = cplSvImSvReVZ(i3,gt2)
coup3 = cplhhSvImSvRe(i2,i3,gt3)
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
coup1L = cplcChaChaAhL(i1,i2,gt1)
coup1R = cplcChaChaAhR(i1,i2,gt1)
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
coup1L = cplcFeFeAhL(i1,i2,gt1)
coup1R = cplcFeFeAhR(i1,i2,gt1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = cplAhSecSe(gt1,i2,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplSvReSvReSvReSvRe1(gt2,gt3,i1,i2)
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
coup1 = cplAhAhSvImSvRe1(gt1,i1,i2,gt3)
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
coup1 = cplAhAhSvReSvRe1(gt1,i1,gt3,i2)
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
coup1 = cplAhhhSvImSvRe1(gt1,i1,i2,gt3)
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
coup1 = cplAhhhSvReSvRe1(gt1,i1,gt3,i2)
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
coup1 = cplAhHpmSvRecSe1(gt1,i1,gt3,i2)
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
coup1 = cplAhSeSvRecHpm1(gt1,i1,gt3,i2)
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
coup1 = cplAhAhSvImSvRe1(gt1,i1,i2,gt2)
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
coup1 = cplAhAhSvReSvRe1(gt1,i1,gt2,i2)
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
coup1 = cplAhhhSvImSvRe1(gt1,i1,i2,gt2)
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
coup1 = cplAhhhSvReSvRe1(gt1,i1,gt2,i2)
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
coup1 = cplAhHpmSvRecSe1(gt1,i1,gt2,i2)
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
coup1 = cplAhSeSvRecHpm1(gt1,i1,gt2,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToSvReSvRe


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToSvReSvRe(MAh,MCha,MChi,               & 
& MFe,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,               & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,        & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,  & 
& cplSvImSvReVZ,cplSvRecSeVWm,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,        & 
& cplAhhhSvReSvRe1,cplAhHpmSvRecSe1,cplAhSeSvRecHpm1,cplhhhhSvReSvRe1,cplHpmSvReSvRecHpm1,& 
& cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,          & 
& cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),          & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),         & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),               & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),      & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6), & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6), & 
& cplHpmSvRecSe(2,6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSvImSvReVZ(6,6),       & 
& cplSvRecSeVWm(6,6),cplAhAhSvImSvRe1(3,3,6,6),cplAhAhSvReSvRe1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),& 
& cplAhhhSvReSvRe1(3,3,6,6),cplAhHpmSvRecSe1(3,2,6,6),cplAhSeSvRecHpm1(3,6,6,2),         & 
& cplhhhhSvReSvRe1(3,3,6,6),cplHpmSvReSvRecHpm1(2,6,6,2),cplSdSvReSvRecSdaa(6,6,6,6),    & 
& cplSeSvReSvRecSe1(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),  & 
& cplSvImSvReSvReSvRe1(6,6,6,6),cplSvReSvReSvReSvRe1(6,6,6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MSvRe(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToSvReSvRe


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToAhVP(MAh,MAh2,MVP,MVP2,ZfAh,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MVP,MVP2

Complex(dp), Intent(in) :: ZfAh(3,3),ZfVP

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
Mex1 = MAh(gt1) 
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
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToAhVP


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToAhVP(MAh,MCha,MFd,MFe,MFu,               & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,              & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MAh2(3),MCha2(2),MFd2(3),MFe2(3),MFu2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),             & 
& MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),      & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmVP,      & 
& cplcgWpCgWpCVP,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),      & 
& cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplAhHpmcVWmVP1(3,2),cplAhcHpmVPVWm1(3,2)

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
Mex1 = MAh(gt1) 
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
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhcHpmVWm(gt1,i2)
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
coup1 = cplAhHpmcVWmVP1(gt1,i1)
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
coup1 = cplAhcHpmVPVWm1(gt1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToAhVP


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToAhVP(MAh,MCha,MFd,MFe,MFu,            & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,              & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MAh2(3),MCha2(2),MFd2(3),MFe2(3),MFu2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),             & 
& MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),      & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmVP,      & 
& cplcgWpCgWpCVP,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),      & 
& cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplAhHpmcVWmVP1(3,2),cplAhcHpmVPVWm1(3,2)

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
Mex1 = MAh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToAhVP


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToAhVZ(MAh,MAh2,MVZ,MVZ2,ZfAh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: ZfAh(3,3),ZfVZ

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
Mex1 = MAh(gt1) 
Mex2 = MAh(gt2) 
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
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToAhVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToAhVZ(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,            & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,         & 
& cplAhcHpmVWmVZ1,Amp)

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
& cplAhcHpmVWm(3,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),             & 
& cplChiChiVZR(5,5),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),         & 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,       & 
& cplAhHpmcVWmVZ1(3,2),cplAhcHpmVWmVZ1(3,2)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhhh(gt1,i1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhAhhh(gt1,i2,i1)
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


! {hh, VZ, hh}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(gt1,i1)
coup2 = cplAhhhhh(gt2,i1,i3)
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


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhSvImSvRe(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhcHpmVWm(gt1,i2)
coup2 = cplAhHpmcVWmVZ1(gt2,i2)
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
coup1 = cplAhHpmcVWmVZ1(gt1,i1)
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
coup1 = cplAhcHpmVWmVZ1(gt1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToAhVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToAhVZ(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,            & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,         & 
& cplAhcHpmVWmVZ1,Amp)

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
& cplAhcHpmVWm(3,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),             & 
& cplChiChiVZR(5,5),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),         & 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,       & 
& cplAhHpmcVWmVZ1(3,2),cplAhcHpmVWmVZ1(3,2)

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
Mex1 = MAh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToAhVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToGluGlu(MAh,MAh2,MGlu,MGlu2,ZfAh,ZffG,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MGlu,MGlu2

Complex(dp), Intent(in) :: ZfAh(3,3),ZffG

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = MAh(gt1) 
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
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToGluGlu


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToGluGlu(MAh,MFd,MFu,MGlu,MSd,             & 
& MSu,MAh2,MFd2,MFu2,MGlu2,MSd2,MSu2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplAhSdcSd,cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MFd(3),MFu(3),MGlu,MSd(6),MSu(6),MAh2(3),MFd2(3),MFu2(3),MGlu2,MSd2(6),MSu2(6)

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),          & 
& cplAhSdcSd(3,6,6),cplAhSucSu(3,6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),               & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),               & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6)

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
Mex1 = MAh(gt1) 
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1L = cplcFdFdAhL(i1,i2,gt1)
coup1R = cplcFdFdAhR(i1,i2,gt1)
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
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
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
coup1 = cplAhSdcSd(gt1,i2,i1)
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
coup1 = cplAhSucSu(gt1,i2,i1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToGluGlu


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToGluGlu(MAh,MFd,MFu,MGlu,              & 
& MSd,MSu,MAh2,MFd2,MFu2,MGlu2,MSd2,MSu2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,            & 
& cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,              & 
& cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MFd(3),MFu(3),MGlu,MSd(6),MSu(6),MAh2(3),MFd2(3),MFu2(3),MGlu2,MSd2(6),MSu2(6)

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),          & 
& cplAhSdcSd(3,6,6),cplAhSucSu(3,6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),               & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),               & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6)

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
Mex1 = MAh(gt1) 
Mex2 = MGlu 
Mex3 = MGlu 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToGluGlu


Subroutine Amplitude_WAVE_seesaw1nmssm_AhTohhVP(cplAhhhVZ,ctcplAhhhVZ,MAh,            & 
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
Mex1 = MAh(gt1) 
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
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplAhhhVZ(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhTohhVP


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTohhVP(MAh,MCha,MFd,MFe,MFu,               & 
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
Mex1 = MAh(gt1) 
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
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = -cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplAhcHpmVWm(gt1,i2)
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


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = -cplAhcHpmVWm(gt1,i1)
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
coup1 = -cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = -cplAhHpmcVWm(gt1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhcHpmVWm(gt1,i2)
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
coup1 = cplAhHpmcVWmVP1(gt1,i1)
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
coup1 = cplAhcHpmVPVWm1(gt1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhTohhVP


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTohhVP(MAh,MCha,MFd,MFe,MFu,            & 
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
Mex1 = MAh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhTohhVP


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVGVG(MAh,MAh2,MVG,MVG2,ZfAh,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MVG,MVG2

Complex(dp), Intent(in) :: ZfAh(3,3),ZfVG

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = MAh(gt1) 
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
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVGVG


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVGVG(MAh,MFd,MFu,MSd,MSu,MVG,            & 
& MAh2,MFd2,MFu2,MSd2,MSu2,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,         & 
& cplAhSdcSd,cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplSdcSdVG,      & 
& cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MFd(3),MFu(3),MSd(6),MSu(6),MVG,MAh2(3),MFd2(3),MFu2(3),MSd2(6),               & 
& MSu2(6),MVG2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),          & 
& cplAhSdcSd(3,6,6),cplAhSucSu(3,6,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),& 
& cplcFuFuVGR(3,3),cplSdcSdVG(6,6),cplSucSuVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
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
Mex1 = MAh(gt1) 
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVGVG


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVGVG(MAh,MFd,MFu,MSd,MSu,             & 
& MVG,MAh2,MFd2,MFu2,MSd2,MSu2,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplAhSdcSd,cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplSdcSdVG,      & 
& cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MFd(3),MFu(3),MSd(6),MSu(6),MVG,MAh2(3),MFd2(3),MFu2(3),MSd2(6),               & 
& MSu2(6),MVG2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),          & 
& cplAhSdcSd(3,6,6),cplAhSucSu(3,6,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),& 
& cplcFuFuVGR(3,3),cplSdcSdVG(6,6),cplSucSuVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
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
Mex1 = MAh(gt1) 
Mex2 = MVG 
Mex3 = MVG 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVGVG


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVPVP(MAh,MAh2,MVP,MVP2,ZfAh,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MVP,MVP2

Complex(dp), Intent(in) :: ZfAh(3,3),ZfVP

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = MAh(gt1) 
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
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVPVP


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVPVP(MAh,MCha,MFd,MFe,MFu,               & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,              & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,       & 
& cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MAh2(3),MCha2(2),MFd2(3),MFe2(3),MFu2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),             & 
& MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),      & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmVP,      & 
& cplcgWpCgWpCVP,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),      & 
& cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplAhHpmcVWmVP1(3,2),cplAhcHpmVPVWm1(3,2),& 
& cplHpmcHpmVPVP1(2,2),cplSdcSdVPVPaa(6,6),cplSecSeVPVP1(6,6),cplSucSuVPVPaa(6,6)

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
Mex1 = MAh(gt1) 
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
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhcHpmVWm(gt1,i2)
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


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplAhcHpmVWm(gt1,i2)
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


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplAhHpmcVWm(gt1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
coup2 = cplSucSuVPVPaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplAhHpmcVWmVP1(gt1,i1)
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
coup1 = cplAhcHpmVPVWm1(gt1,i2)
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
coup1 = cplAhHpmcVWmVP1(gt1,i1)
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
coup1 = cplAhcHpmVPVWm1(gt1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVPVP


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVPVP(MAh,MCha,MFd,MFe,MFu,            & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,              & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,       & 
& cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MAh2(3),MCha2(2),MFd2(3),MFe2(3),MFu2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),             & 
& MVP2,MVWm2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),      & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmVP,      & 
& cplcgWpCgWpCVP,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),      & 
& cplSucSuVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplAhHpmcVWmVP1(3,2),cplAhcHpmVPVWm1(3,2),& 
& cplHpmcHpmVPVP1(2,2),cplSdcSdVPVPaa(6,6),cplSecSeVPVP1(6,6),cplSucSuVPVPaa(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MVP 
Mex3 = MVP 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVPVP


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVPVZ(MAh,MAh2,MVP,MVP2,MVZ,MVZ2,           & 
& ZfAh,ZfVP,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: ZfAh(3,3),ZfVP,ZfVZ

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = MAh(gt1) 
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
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVPVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVPVZ(MAh,MCha,MFd,MFe,MFu,               & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,               & 
& MSu2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,        & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,& 
& cplAhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MVZ,MAh2(3),MCha2(2),MFd2(3),MFe2(3),MFu2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),         & 
& MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),      & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,            & 
& cplcgWpCgWpCVZ,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),    & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSucSuVP(6,6),       & 
& cplSucSuVZ(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,             & 
& cplAhHpmcVWmVP1(3,2),cplAhHpmcVWmVZ1(3,2),cplAhcHpmVPVWm1(3,2),cplAhcHpmVWmVZ1(3,2),   & 
& cplHpmcHpmVPVZ1(2,2),cplSdcSdVPVZaa(6,6),cplSecSeVPVZ1(6,6),cplSucSuVPVZaa(6,6)

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
Mex1 = MAh(gt1) 
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
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhcHpmVWm(gt1,i2)
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


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplAhcHpmVWm(gt1,i2)
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


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplAhHpmcVWm(gt1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
coup2 = cplSucSuVPVZaa(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplAhHpmcVWmVZ1(gt1,i1)
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
coup1 = cplAhcHpmVWmVZ1(gt1,i2)
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
coup1 = cplAhHpmcVWmVP1(gt1,i1)
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
coup1 = cplAhcHpmVPVWm1(gt1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVPVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVPVZ(MAh,MCha,MFd,MFe,MFu,            & 
& MHpm,MSd,MSe,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,               & 
& MSu2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,        & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,& 
& cplAhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVP,MVWm,            & 
& MVZ,MAh2(3),MCha2(2),MFd2(3),MFe2(3),MFu2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),         & 
& MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),      & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhcHpmVWm(3,2),               & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,            & 
& cplcgWpCgWpCVZ,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),    & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSucSuVP(6,6),       & 
& cplSucSuVZ(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,             & 
& cplAhHpmcVWmVP1(3,2),cplAhHpmcVWmVZ1(3,2),cplAhcHpmVPVWm1(3,2),cplAhcHpmVWmVZ1(3,2),   & 
& cplHpmcHpmVPVZ1(2,2),cplSdcSdVPVZaa(6,6),cplSecSeVPVZ1(6,6),cplSucSuVPVZaa(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVPVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVWmcVWm(MAh,MAh2,MVWm,MVWm2,               & 
& ZfAh,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MVWm,MVWm2

Complex(dp), Intent(in) :: ZfAh(3,3),ZfVWm

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 
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
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVWmcVWm


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVWmcVWm(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiVWmL,               & 
& cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuVWmL,     & 
& cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,      & 
& cplcgZgWmcVWm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,    & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,        & 
& cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,             & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhhhcVWmVWm1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,  & 
& cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcChaChiVWmL(2,5),         & 
& cplcChaChiVWmR(2,5),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),           & 
& cplFvFecVWmR(6,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,6),               & 
& cplcFeFvVWmR(3,6),cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,             & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhHpmcVWm(3,2),             & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),   & 
& cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),             & 
& cplSvRecSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,          & 
& cplAhAhcVWmVWm1(3,3),cplAhHpmcVWmVP1(3,2),cplAhHpmcVWmVZ1(3,2),cplAhcHpmVPVWm1(3,2),   & 
& cplAhcHpmVWmVZ1(3,2),cplhhhhcVWmVWm1(3,3),cplHpmcHpmcVWmVWm1(2,2),cplSdcSdcVWmVWmaa(6,6),& 
& cplSecSecVWmVWm1(6,6),cplSucSucVWmVWmaa(6,6),cplSvImSvImcVWmVWm1(6,6),cplSvReSvRecVWmVWm1(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 


! {Ah, Ah, conj[Hpm]}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhAhAh(gt1,i1,i2)
coup2 = cplAhcHpmVWm(i1,i3)
coup3 = -cplAhHpmcVWm(i2,i3)
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


! {Ah, hh, conj[Hpm]}
If ((Include_in_loopAh).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhAhhh(gt1,i1,i2)
coup2 = cplAhcHpmVWm(i1,i3)
coup3 = -cplhhHpmcVWm(i2,i3)
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


! {Cha, Cha, Chi}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,5
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
coup2L = -cplcChaChiVWmR(i1,i3)
coup2R = -cplcChaChiVWmL(i1,i3)
coup3L = -cplChiChacVWmR(i3,i2)
coup3R = -cplChiChacVWmL(i3,i2)
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


! {Chi, Chi, bar[Cha]}
If ((Include_in_loopChi).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,5
  Do i2=1,5
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
coup2L = cplcChaChiVWmL(i3,i1)
coup2R = cplcChaChiVWmR(i3,i1)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
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


! {Fd, Fd, Fu}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
coup2L = -cplcFdFuVWmR(i1,i3)
coup2R = -cplcFdFuVWmL(i1,i3)
coup3L = -cplcFuFdcVWmR(i3,i2)
coup3R = -cplcFuFdcVWmL(i3,i2)
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


! {Fe, Fe, Fv}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
coup2L = -cplcFeFvVWmR(i1,i3)
coup2R = -cplcFeFvVWmL(i1,i3)
coup3L = -cplFvFecVWmR(i3,i2)
coup3R = -cplFvFecVWmL(i3,i2)
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


! {Fv, Fv, bar[Fe]}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
coup2L = cplcFeFvVWmL(i3,i1)
coup2R = cplcFeFvVWmR(i3,i1)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
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


! {gWm, gWm, gP}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgA)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplcgWmgWmAh(gt1)
coup2 = cplcgWmgAVWm
coup3 = cplcgAgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gWm, gWm, gZ}
If ((Include_in_loopgWm).and.(Include_in_loopgWm).and.(Include_in_loopgZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWmgWmAh(gt1)
coup2 = cplcgWmgZVWm
coup3 = cplcgZgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, Ah, conj[Hpm]}
If ((Include_in_loophh).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhAhhh(gt1,i2,i1)
coup2 = cplhhcHpmVWm(i1,i3)
coup3 = -cplAhHpmcVWm(i2,i3)
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


! {hh, hh, conj[Hpm]}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhhh(gt1,i1,i2)
coup2 = cplhhcHpmVWm(i1,i3)
coup3 = -cplhhHpmcVWm(i2,i3)
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


! {hh, VZ, conj[Hpm]}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplAhhhVZ(gt1,i1)
coup2 = cplhhcHpmVWm(i1,i3)
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


! {hh, hh, conj[VWm]}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplAhhhhh(gt1,i1,i2)
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


! {hh, VZ, conj[VWm]}
If ((Include_in_loophh).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplAhhhVZ(gt1,i1)
coup2 = cplhhcVWmVWm(i1)
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


! {Hpm, Hpm, Ah}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
coup2 = -cplAhcHpmVWm(i3,i1)
coup3 = cplAhHpmcVWm(i3,i2)
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


! {Hpm, Hpm, hh}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
coup2 = -cplhhcHpmVWm(i3,i1)
coup3 = cplhhHpmcVWm(i3,i2)
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


! {Hpm, VWm, hh}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplAhHpmcVWm(gt1,i1)
coup2 = -cplhhcHpmVWm(i3,i1)
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


! {Hpm, Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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


! {Hpm, VWm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplAhHpmcVWm(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
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


! {Hpm, Hpm, VZ}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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


! {Hpm, VWm, VZ}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplAhHpmcVWm(gt1,i1)
coup2 = cplcHpmVWmVZ(i1)
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


! {Sd, Sd, Su}
If ((Include_in_loopSd).and.(Include_in_loopSd).and.(Include_in_loopSu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplAhSdcSd(gt1,i1,i2)
coup2 = -cplSucSdVWm(i3,i1)
coup3 = -cplSdcSucVWm(i2,i3)
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


! {Se, Se, SvIm}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSecSe(gt1,i1,i2)
coup2 = -cplSvImcSeVWm(i3,i1)
coup3 = -cplSeSvImcVWm(i2,i3)
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


! {Se, Se, SvRe}
If ((Include_in_loopSe).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSecSe(gt1,i1,i2)
coup2 = -cplSvRecSeVWm(i3,i1)
coup3 = -cplSeSvRecVWm(i2,i3)
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


! {SvIm, SvIm, conj[Se]}
If ((Include_in_loopSvIm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvImSvIm(gt1,i1,i2)
coup2 = cplSvImcSeVWm(i1,i3)
coup3 = cplSeSvImcVWm(i3,i2)
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


! {SvIm, SvRe, conj[Se]}
If ((Include_in_loopSvIm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvImSvRe(gt1,i1,i2)
coup2 = cplSvImcSeVWm(i1,i3)
coup3 = cplSeSvRecVWm(i3,i2)
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


! {SvRe, SvIm, conj[Se]}
If ((Include_in_loopSvRe).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvImSvRe(gt1,i2,i1)
coup2 = cplSvRecSeVWm(i1,i3)
coup3 = cplSeSvImcVWm(i3,i2)
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


! {SvRe, SvRe, conj[Se]}
If ((Include_in_loopSvRe).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplSvRecSeVWm(i1,i3)
coup3 = cplSeSvRecVWm(i3,i2)
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


! {VWm, Hpm, hh}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhcHpmVWm(gt1,i2)
coup2 = cplhhcVWmVWm(i3)
coup3 = cplhhHpmcVWm(i3,i2)
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


! {VWm, Hpm, VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplAhcHpmVWm(gt1,i2)
coup2 = -cplcVWmVPVWm
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


! {VWm, Hpm, VZ}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplAhcHpmVWm(gt1,i2)
coup2 = cplcVWmVWmVZ
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


! {VZ, hh, conj[Hpm]}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhhhVZ(gt1,i2)
coup2 = cplcHpmVWmVZ(i3)
coup3 = -cplhhHpmcVWm(i2,i3)
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


! {VZ, hh, conj[VWm]}
If ((Include_in_loopVZ).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
  Do i2=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplAhhhVZ(gt1,i2)
coup2 = -cplcVWmVWmVZ
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {bar[Fu], bar[Fu], bar[Fd]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuAhL(i1,i2,gt1)
coup1R = cplcFuFuAhR(i1,i2,gt1)
coup2L = cplcFdFuVWmL(i3,i1)
coup2R = cplcFdFuVWmR(i3,i1)
coup3L = cplcFuFdcVWmL(i2,i3)
coup3R = cplcFuFdcVWmR(i2,i3)
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


! {bar[gWmC], bar[gWmC], bar[gP]}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgA)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplcgWpCgWpCAh(gt1)
coup2 = cplcgAgWpCVWm
coup3 = cplcgWpCgAcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gWmC], bar[gWmC], bar[gZ]}
If ((Include_in_loopgWpC).and.(Include_in_loopgWpC).and.(Include_in_loopgZ)) Then 
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWpCgWpCAh(gt1)
coup2 = cplcgZgWpCVWm
coup3 = cplcgWpCgZcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Su], conj[Su], conj[Sd]}
If ((Include_in_loopSu).and.(Include_in_loopSu).and.(Include_in_loopSd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSucSu(gt1,i2,i1)
coup2 = cplSucSdVWm(i1,i3)
coup3 = cplSdcSucVWm(i3,i2)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplSvReSvRecVWmVWm1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVP 
coup1 = cplAhHpmcVWmVP1(gt1,i1)
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


! {Hpm, VZ}
If ((Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVZ 
coup1 = cplAhHpmcVWmVZ1(gt1,i1)
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


! {VP, Hpm}
If ((Include_in_loopVP).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MHpm(i2) 
coup1 = cplAhcHpmVPVWm1(gt1,i2)
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


! {VZ, Hpm}
If ((Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVZ 
ML2 = MHpm(i2) 
coup1 = cplAhcHpmVWmVZ1(gt1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVWmcVWm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVWmcVWm(MAh,MCha,MChi,MFd,            & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,            & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiVWmL,               & 
& cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFdFuVWmL,     & 
& cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,      & 
& cplcgZgWmcVWm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,    & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,        & 
& cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,             & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhhhcVWmVWm1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,  & 
& cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),        & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),& 
& cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
& cplAhcHpmVWm(3,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcChaChiVWmL(2,5),         & 
& cplcChaChiVWmR(2,5),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),           & 
& cplFvFecVWmR(6,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,6),               & 
& cplcFeFvVWmR(3,6),cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,             & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhHpmcVWm(3,2),             & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),   & 
& cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),             & 
& cplSvRecSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,          & 
& cplAhAhcVWmVWm1(3,3),cplAhHpmcVWmVP1(3,2),cplAhHpmcVWmVZ1(3,2),cplAhcHpmVPVWm1(3,2),   & 
& cplAhcHpmVWmVZ1(3,2),cplhhhhcVWmVWm1(3,3),cplHpmcHpmcVWmVWm1(2,2),cplSdcSdcVWmVWmaa(6,6),& 
& cplSecSecVWmVWm1(6,6),cplSucSucVWmVWmaa(6,6),cplSvImSvImcVWmVWm1(6,6),cplSvReSvRecVWmVWm1(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 


! {Hpm, Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplAhHpmcHpm(gt1,i1,i2)
coup2 = cplcHpmVPVWm(i1)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplAhHpmcVWm(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VWm, Hpm, VP}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplAhcHpmVWm(gt1,i2)
coup2 = -cplcVWmVPVWm
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {Hpm, VP}
If ((Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVP 
coup1 = cplAhHpmcVWmVP1(gt1,i1)
coup2 = cplcHpmVPVWm(i1)
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VP, Hpm}
If ((Include_in_loopVP).and.(Include_in_loopHpm)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MHpm(i2) 
coup1 = cplAhcHpmVPVWm1(gt1,i2)
coup2 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVWmcVWm


Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVZVZ(MAh,MAh2,MVZ,MVZ2,ZfAh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: ZfAh(3,3),ZfVZ

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = MAh(gt1) 
Mex2 = MVZ 
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
End Subroutine Amplitude_WAVE_seesaw1nmssm_AhToVZVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVZVZ(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChaVZL,          & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ, & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,   & 
& cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvImSvImVZVZ1,          & 
& cplSvReSvReVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplChiChiAhL(5,5,3),       & 
& cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFeFeAhL(3,3,3),          & 
& cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplFvFvAhL(6,6,3),            & 
& cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),   & 
& cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),             & 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),         & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),cplChiChiVZR(5,5),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,cplcgWpCgWpCVZ,          & 
& cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),        & 
& cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplAhAhVZVZ1(3,3),     & 
& cplAhHpmcVWmVZ1(3,2),cplAhcHpmVWmVZ1(3,2),cplhhhhVZVZ1(3,3),cplHpmcHpmVZVZ1(2,2),      & 
& cplSdcSdVZVZaa(6,6),cplSecSeVZVZ1(6,6),cplSucSuVZVZaa(6,6),cplSvImSvImVZVZ1(6,6),      & 
& cplSvReSvReVZVZ1(6,6)

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
Mex1 = MAh(gt1) 
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
coup1 = cplAhAhAh(gt1,i1,i2)
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


! {Cha, Cha, Cha}
If ((Include_in_loopCha).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(i2,i1,gt1)
coup1R = cplcChaChaAhR(i2,i1,gt1)
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
coup1L = cplChiChiAhL(i1,i2,gt1)
coup1R = cplChiChiAhR(i1,i2,gt1)
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
coup1L = cplcFdFdAhL(i2,i1,gt1)
coup1R = cplcFdFdAhR(i2,i1,gt1)
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
coup1L = cplcFeFeAhL(i2,i1,gt1)
coup1R = cplcFeFeAhR(i2,i1,gt1)
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
coup1L = cplcFuFuAhL(i2,i1,gt1)
coup1R = cplcFuFuAhR(i2,i1,gt1)
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
coup1L = cplFvFvAhL(i1,i2,gt1)
coup1R = cplFvFvAhR(i1,i2,gt1)
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
coup1 = cplcgWmgWmAh(gt1)
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
coup1 = cplcgWpCgWpCAh(gt1)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhHpmcVWm(gt1,i1)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
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
coup1 = cplAhcHpmVWm(gt1,i2)
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


! {VWm, Hpm, VWm}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplAhcHpmVWm(gt1,i2)
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


! {conj[Hpm], conj[VWm], conj[Hpm]}
If ((Include_in_loopHpm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcHpm(gt1,i2,i1)
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
coup1 = cplAhcHpmVWm(gt1,i1)
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
coup1 = cplAhHpmcVWm(gt1,i2)
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


! {conj[VWm], conj[Hpm], conj[VWm]}
If ((Include_in_loopVWm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
  Do i2=1,2
ML1 = MVWm 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplAhHpmcVWm(gt1,i2)
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
coup1 = cplAhAhAh(gt1,i1,i2)
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
coup1 = cplAhhhhh(gt1,i1,i2)
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
coup1 = cplAhHpmcHpm(gt1,i1,i2)
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
coup1 = cplAhSdcSd(gt1,i1,i2)
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
coup1 = cplAhSecSe(gt1,i1,i2)
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
coup1 = cplAhSucSu(gt1,i1,i2)
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
coup1 = cplAhSvImSvIm(gt1,i1,i2)
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
coup1 = cplAhSvReSvRe(gt1,i1,i2)
coup2 = cplSvReSvReVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplAhHpmcVWmVZ1(gt1,i1)
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
coup1 = cplAhcHpmVWmVZ1(gt1,i2)
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


! {Hpm, VWm}
If ((Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,2
ML1 = MHpm(i1) 
ML2 = MVWm 
coup1 = cplAhHpmcVWmVZ1(gt1,i1)
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
coup1 = cplAhcHpmVWmVZ1(gt1,i2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_AhToVZVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVZVZ(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplAhcHpmVWm,cplcChaChaVZL,          & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ, & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,   & 
& cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvImSvImVZVZ1,          & 
& cplSvReSvReVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(3),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFd2(3),            & 
& MFe2(3),MFu2(3),MFv2(6),Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),            & 
& MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplChiChiAhL(5,5,3),       & 
& cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFeFeAhL(3,3,3),          & 
& cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplFvFvAhL(6,6,3),            & 
& cplFvFvAhR(6,6,3),cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),   & 
& cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),             & 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),         & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),cplChiChiVZR(5,5),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,cplcgWpCgWpCVZ,          & 
& cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),        & 
& cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplAhAhVZVZ1(3,3),     & 
& cplAhHpmcVWmVZ1(3,2),cplAhcHpmVWmVZ1(3,2),cplhhhhVZVZ1(3,3),cplHpmcHpmVZVZ1(2,2),      & 
& cplSdcSdVZVZaa(6,6),cplSecSeVZVZ1(6,6),cplSucSuVZVZaa(6,6),cplSvImSvImVZVZ1(6,6),      & 
& cplSvReSvReVZVZ1(6,6)

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
Mex1 = MAh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_AhToVZVZ



End Module OneLoopDecay_Ah_seesaw1nmssm
