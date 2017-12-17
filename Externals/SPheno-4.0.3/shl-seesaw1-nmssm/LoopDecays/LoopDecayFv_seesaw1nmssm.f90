! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:46 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fv_seesaw1nmssm
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

Subroutine Amplitude_Tree_seesaw1nmssm_FvToFvAh(cplFvFvAhL,cplFvFvAhR,MAh,            & 
& MFv,MAh2,MFv2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MFv(6),MAh2(3),MFv2(6)

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

Complex(dp) :: Amp(2,6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFvAhL(gt1,gt2,gt3)
coupT1R = cplFvFvAhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_FvToFvAh


Subroutine Gamma_Real_seesaw1nmssm_FvToFvAh(MLambda,em,gs,cplFvFvAhL,cplFvFvAhR,      & 
& MAh,MFv,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

Real(dp), Intent(in) :: MAh(3),MFv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,3), GammarealGluon(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
    Do i3=2,3
CoupL = cplFvFvAhL(i1,i2,i3)
CoupR = cplFvFvAhR(i1,i2,i3)
Mex1 = MFv(i1)
Mex2 = MFv(i2)
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
End Subroutine Gamma_Real_seesaw1nmssm_FvToFvAh


Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFvAh(cplFvFvAhL,cplFvFvAhR,ctcplFvFvAhL,   & 
& ctcplFvFvAhR,MAh,MAh2,MFv,MFv2,ZfAh,ZfFV,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MFv(6),MFv2(6)

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

Complex(dp), Intent(in) :: ctcplFvFvAhL(6,6,3),ctcplFvFvAhR(6,6,3)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfFV(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvAhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplFvFvAhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt1)*cplFvFvAhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt1))*cplFvFvAhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplFvFvAhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplFvFvAhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt3)*cplFvFvAhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt3)*cplFvFvAhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFvAh


Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFvAh(MAh,MCha,MChi,MFe,MFv,              & 
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

Complex(dp), Intent(out) :: Amp(2,6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh(gt3) 


! {Ah, Fv, Fv}
If ((Include_in_loopAh).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, Se}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = cplAhSecSe(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, SvIm}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
coup3 = cplAhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, SvIm}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
coup3 = cplAhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, SvRe}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
coup3 = cplAhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, SvRe}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
coup3 = cplAhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Hpm, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = -cplAhcHpmVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Hpm, VWm}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = -cplAhHpmcVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, Ah, Ah}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhAhAh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, Ah}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Ah, hh}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, hh}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplAhhhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, VZ, hh}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = -cplAhhhVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, hh, VZ}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = -cplAhhhVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, Fv, Fv}
If ((Include_in_loophh).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Fe, Fe}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = cplcFeFeAhL(i3,i2,gt3)
coup3R = cplcFeFeAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Cha, Cha}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = cplcChaChaAhL(i3,i2,gt3)
coup3R = cplcChaChaAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, Chi, Chi}
If ((Include_in_loopSvIm).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,5
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, Chi, Chi}
If ((Include_in_loopSvRe).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Fe, Fe}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeFeAhL(i3,i2,gt3)
coup3R = cplcFeFeAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, Fv, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {bar[Cha], conj[Se], conj[Se]}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[Hpm]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
coup3 = cplAhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[VWm], conj[Hpm]}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
coup3 = -cplAhHpmcVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[VWm]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
coup3 = -cplAhcHpmVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hpm], bar[Fe], bar[Fe]}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], bar[Cha], bar[Cha]}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], bar[Fe], bar[Fe]}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFecVWmR(gt1,i2)
coup1R = -cplFvFecVWmL(gt1,i2)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFvAh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFvAh(MAh,MCha,MChi,MFe,               & 
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

Complex(dp), Intent(out) :: Amp(2,6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFvAh


Subroutine Amplitude_Tree_seesaw1nmssm_FvToChacSe(cplFvChacSeL,cplFvChacSeR,          & 
& MCha,MFv,MSe,MCha2,MFv2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFv(6),MSe(6),MCha2(2),MFv2(6),MSe2(6)

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Complex(dp) :: Amp(2,6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MSe(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvChacSeL(gt1,gt2,gt3)
coupT1R = cplFvChacSeR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_FvToChacSe


Subroutine Gamma_Real_seesaw1nmssm_FvToChacSe(MLambda,em,gs,cplFvChacSeL,             & 
& cplFvChacSeR,MCha,MFv,MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Real(dp), Intent(in) :: MCha(2),MFv(6),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,2,6), GammarealGluon(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
CoupL = cplFvChacSeL(i1,i2,i3)
CoupR = cplFvChacSeR(i1,i2,i3)
Mex1 = MFv(i1)
Mex2 = MCha(i2)
Mex3 = MSe(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_FvToChacSe


Subroutine Amplitude_WAVE_seesaw1nmssm_FvToChacSe(cplFvChacSeL,cplFvChacSeR,          & 
& ctcplFvChacSeL,ctcplFvChacSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFV,ZfLm,ZfLp,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFv(6),MFv2(6),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Complex(dp), Intent(in) :: ctcplFvChacSeL(6,2,6),ctcplFvChacSeR(6,2,6)

Complex(dp), Intent(in) :: ZfFV(6,6),ZfLm(2,2),ZfLp(2,2),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MSe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvChacSeL(gt1,gt2,gt3) 
ZcoupT1R = ctcplFvChacSeR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt1)*cplFvChacSeL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt1))*cplFvChacSeR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplFvChacSeL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplFvChacSeR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSe(i1,gt3))*cplFvChacSeL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSe(i1,gt3))*cplFvChacSeR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_FvToChacSe


Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToChacSe(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,             & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),        & 
& cplAhSecSe(3,6,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),     & 
& cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,3),      & 
& cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),& 
& cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),       & 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvFecHpmL(6,3,2),    & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvhhL(6,6,3),             & 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSecSeVP(6,6),           & 
& cplSecSeVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MSe(gt3) 


! {Ah, Fv, bar[Cha]}
If ((Include_in_loopAh).and.(Include_in_loopFv).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplFvChacSeL(i2,i3,gt3)
coup3R = cplFvChacSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, Ah}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MAh(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhSecSe(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, hh}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhSecSe(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, VP}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplSecSeVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Cha, Se, VZ}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVZ 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplSecSeVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Chi, SvIm, conj[Hpm]}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopHpm)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmSvImcSe(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, conj[Hpm]}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopHpm)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmSvRecSe(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, conj[VWm]}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopVWm)) Then 
Do i1=1,5
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MVWm 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplSvImcSeVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Chi, SvRe, conj[VWm]}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopVWm)) Then 
Do i1=1,5
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MVWm 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplSvRecSeVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, Hpm, SvIm}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplHpmSvImcSe(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, SvIm}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSvIm(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplSvImcSeVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Hpm, SvRe}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = cplHpmSvRecSe(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, SvRe}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSvRe(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = cplSvRecSeVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Ah, conj[Se]}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSe(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplAhSecSe(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, conj[Se]}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopSe)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSe(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplhhSecSe(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, VZ, conj[Se]}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loopSe)) Then 
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MSe(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplSecSeVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, Fv, bar[Cha]}
If ((Include_in_loophh).and.(Include_in_loopFv).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplFvChacSeL(i2,i3,gt3)
coup3R = cplFvChacSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Fe, Chi}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopChi)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,5
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = cplChiFecSeL(i3,i2,gt3)
coup3R = cplChiFecSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Cha, Fv}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(i3,gt2,i1)
coup2R = cplFvChacSeR(i3,gt2,i1)
coup3L = cplFvChacSeL(i3,i2,gt3)
coup3R = cplFvChacSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, Chi, bar[Fe]}
If ((Include_in_loopSvIm).and.(Include_in_loopChi).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplcFeChaSvImL(i3,gt2,i1)
coup2R = cplcFeChaSvImR(i3,gt2,i1)
coup3L = cplChiFecSeL(i2,i3,gt3)
coup3R = cplChiFecSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, Chi, bar[Fe]}
If ((Include_in_loopSvRe).and.(Include_in_loopChi).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplcFeChaSvReL(i3,gt2,i1)
coup2R = cplcFeChaSvReR(i3,gt2,i1)
coup3L = cplChiFecSeL(i2,i3,gt3)
coup3R = cplChiFecSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Fe, Chi}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopChi)) Then 
  Do i2=1,3
    Do i3=1,5
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = -cplChiChacVWmR(i3,gt2)
coup2R = -cplChiChacVWmL(i3,gt2)
coup3L = cplChiFecSeL(i3,i2,gt3)
coup3R = cplChiFecSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, Fv, bar[Cha]}
If ((Include_in_loopVZ).and.(Include_in_loopFv).and.(Include_in_loopCha)) Then 
  Do i2=1,6
    Do i3=1,2
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = -cplcChaChaVZR(i3,gt2)
coup2R = -cplcChaChaVZL(i3,gt2)
coup3L = cplFvChacSeL(i2,i3,gt3)
coup3R = cplFvChacSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToChacSe


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToChacSe(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),        & 
& cplAhSecSe(3,6,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),     & 
& cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,3),      & 
& cplcChaChahhR(2,2,3),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),& 
& cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),       & 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvFecHpmL(6,3,2),    & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvhhL(6,6,3),             & 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSecSeVP(6,6),           & 
& cplSecSeVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MSe(gt3) 


! {Cha, Se, VP}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplSecSeVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToChacSe


Subroutine Amplitude_Tree_seesaw1nmssm_FvToChiSvIm(cplChiFvSvImL,cplChiFvSvImR,       & 
& MChi,MFv,MSvIm,MChi2,MFv2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),MFv(6),MSvIm(6),MChi2(5),MFv2(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6)

Complex(dp) :: Amp(2,6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvIm(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFvSvImL(gt2,gt1,gt3)
coupT1R = cplChiFvSvImR(gt2,gt1,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_FvToChiSvIm


Subroutine Gamma_Real_seesaw1nmssm_FvToChiSvIm(MLambda,em,gs,cplChiFvSvImL,           & 
& cplChiFvSvImR,MChi,MFv,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6)

Real(dp), Intent(in) :: MChi(5),MFv(6),MSvIm(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,5,6), GammarealGluon(6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,5
    Do i3=1,6
CoupL = cplChiFvSvImL(i2,i1,i3)
CoupR = cplChiFvSvImR(i2,i1,i3)
Mex1 = MFv(i1)
Mex2 = MChi(i2)
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
End Subroutine Gamma_Real_seesaw1nmssm_FvToChiSvIm


Subroutine Amplitude_WAVE_seesaw1nmssm_FvToChiSvIm(cplChiFvSvImL,cplChiFvSvImR,       & 
& ctcplChiFvSvImL,ctcplChiFvSvImR,MChi,MChi2,MFv,MFv2,MSvIm,MSvIm2,ZfFV,ZfL0,            & 
& ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),MChi2(5),MFv(6),MFv2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6)

Complex(dp), Intent(in) :: ctcplChiFvSvImL(5,6,6),ctcplChiFvSvImR(5,6,6)

Complex(dp), Intent(in) :: ZfFV(6,6),ZfL0(5,5),ZfSvIm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvIm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFvSvImL(gt2,gt1,gt3) 
ZcoupT1R = ctcplChiFvSvImR(gt2,gt1,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt1)*cplChiFvSvImL(gt2,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt1))*cplChiFvSvImR(gt2,i1,gt3)
End Do


! External Field 2 
Do i1=1,5
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiFvSvImL(i1,gt1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiFvSvImR(i1,gt1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvIm(i1,gt3)*cplChiFvSvImL(gt2,gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvIm(i1,gt3)*cplChiFvSvImR(gt2,gt1,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_FvToChiSvIm


Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToChiSvIm(MAh,MCha,MChi,MFe,               & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),          & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),   & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),           & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),       & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplHpmSvImcSe(2,6,6),      & 
& cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvIm(gt3) 


! {Ah, Fv, Chi}
If ((Include_in_loopAh).and.(Include_in_loopFv).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,5
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, Hpm}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplSeSvImcHpm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, VWm}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplSeSvImcVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Chi, SvIm, Ah}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopAh)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, Ah}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopAh)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, hh}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loophh)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, hh}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loophh)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, VZ}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopVZ)) Then 
Do i1=1,5
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MVZ 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = -cplSvImSvReVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, Hpm, Se}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = cplHpmSvImcSe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, Se}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = -cplSvImcSeVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Ah, SvIm}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
coup3 = cplAhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, SvIm}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
coup3 = cplhhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Ah, SvRe}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
coup3 = cplAhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, SvRe}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
coup3 = cplhhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, VZ, SvRe}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MSvRe(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
coup3 = -cplSvImSvReVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, Fv, Chi}
If ((Include_in_loophh).and.(Include_in_loopFv).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,5
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Fe, Cha}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = cplcChaFeSvImL(i3,i2,gt3)
coup3R = cplcChaFeSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Cha, Fe}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
coup3L = cplcFeChaSvImL(i3,i2,gt3)
coup3R = cplcFeChaSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, Chi, Fv}
If ((Include_in_loopSvIm).and.(Include_in_loopChi).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
coup3L = cplChiFvSvImL(i2,i3,gt3)
coup3R = cplChiFvSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, Chi, Fv}
If ((Include_in_loopSvRe).and.(Include_in_loopChi).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
coup3L = cplChiFvSvImL(i2,i3,gt3)
coup3R = cplChiFvSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Fe, Cha}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaFeSvImL(i3,i2,gt3)
coup3R = cplcChaFeSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, Fv, Chi}
If ((Include_in_loopVZ).and.(Include_in_loopFv).and.(Include_in_loopChi)) Then 
  Do i2=1,6
    Do i3=1,5
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {bar[Cha], conj[Se], conj[Hpm]}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
coup3 = cplHpmSvImcSe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Cha], conj[Se], conj[VWm]}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplChiChacVWmL(gt2,i1)
coup2R = cplChiChacVWmR(gt2,i1)
coup3 = -cplSvImcSeVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[Se]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
coup3 = cplSeSvImcHpm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[VWm], conj[Se]}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
coup3 = cplSeSvImcVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], bar[Fe], bar[Cha]}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
coup3L = cplcFeChaSvImL(i2,i3,gt3)
coup3R = cplcFeChaSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], bar[Cha], bar[Fe]}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
coup3L = cplcChaFeSvImL(i2,i3,gt3)
coup3R = cplcChaFeSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], bar[Fe], bar[Cha]}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = -cplFvFecVWmR(gt1,i2)
coup1R = -cplFvFecVWmL(gt1,i2)
coup2L = -cplcChaChiVWmR(i3,gt2)
coup2R = -cplcChaChiVWmL(i3,gt2)
coup3L = cplcFeChaSvImL(i2,i3,gt3)
coup3R = cplcFeChaSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToChiSvIm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToChiSvIm(MAh,MCha,MChi,MFe,            & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),          & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),   & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),           & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),       & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplHpmSvImcSe(2,6,6),      & 
& cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvIm(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToChiSvIm


Subroutine Amplitude_Tree_seesaw1nmssm_FvToChiSvRe(cplChiFvSvReL,cplChiFvSvReR,       & 
& MChi,MFv,MSvRe,MChi2,MFv2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),MFv(6),MSvRe(6),MChi2(5),MFv2(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6)

Complex(dp) :: Amp(2,6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvRe(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFvSvReL(gt2,gt1,gt3)
coupT1R = cplChiFvSvReR(gt2,gt1,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_FvToChiSvRe


Subroutine Gamma_Real_seesaw1nmssm_FvToChiSvRe(MLambda,em,gs,cplChiFvSvReL,           & 
& cplChiFvSvReR,MChi,MFv,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6)

Real(dp), Intent(in) :: MChi(5),MFv(6),MSvRe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,5,6), GammarealGluon(6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,5
    Do i3=1,6
CoupL = cplChiFvSvReL(i2,i1,i3)
CoupR = cplChiFvSvReR(i2,i1,i3)
Mex1 = MFv(i1)
Mex2 = MChi(i2)
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
End Subroutine Gamma_Real_seesaw1nmssm_FvToChiSvRe


Subroutine Amplitude_WAVE_seesaw1nmssm_FvToChiSvRe(cplChiFvSvReL,cplChiFvSvReR,       & 
& ctcplChiFvSvReL,ctcplChiFvSvReR,MChi,MChi2,MFv,MFv2,MSvRe,MSvRe2,ZfFV,ZfL0,            & 
& ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),MChi2(5),MFv(6),MFv2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6)

Complex(dp), Intent(in) :: ctcplChiFvSvReL(5,6,6),ctcplChiFvSvReR(5,6,6)

Complex(dp), Intent(in) :: ZfFV(6,6),ZfL0(5,5),ZfSvRe(6,6)

Complex(dp), Intent(out) :: Amp(2,6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvRe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFvSvReL(gt2,gt1,gt3) 
ZcoupT1R = ctcplChiFvSvReR(gt2,gt1,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt1)*cplChiFvSvReL(gt2,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt1))*cplChiFvSvReR(gt2,i1,gt3)
End Do


! External Field 2 
Do i1=1,5
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiFvSvReL(i1,gt1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiFvSvReR(i1,gt1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvRe(i1,gt3)*cplChiFvSvReL(gt2,gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvRe(i1,gt3)*cplChiFvSvReR(gt2,gt1,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_FvToChiSvRe


Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToChiSvRe(MAh,MCha,MChi,MFe,               & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),          & 
& cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),   & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),           & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),       & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplHpmSvRecSe(2,6,6),      & 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSvImSvReVZ(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvRe(gt3) 


! {Ah, Fv, Chi}
If ((Include_in_loopAh).and.(Include_in_loopFv).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,5
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
coup3L = cplChiFvSvReL(i3,i2,gt3)
coup3R = cplChiFvSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, Hpm}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplSeSvRecHpm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, VWm}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplSeSvRecVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Chi, SvIm, Ah}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopAh)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhSvImSvRe(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, Ah}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopAh)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhSvReSvRe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, hh}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loophh)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhSvImSvRe(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, hh}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loophh)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhSvReSvRe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, VZ}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopVZ)) Then 
Do i1=1,5
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MVZ 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = cplSvImSvReVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, Hpm, Se}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = cplHpmSvRecSe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, Se}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = -cplSvRecSeVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Ah, SvIm}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
coup3 = cplAhSvImSvRe(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, SvIm}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
coup3 = cplhhSvImSvRe(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, VZ, SvIm}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loopSvIm)) Then 
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MSvIm(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
coup3 = cplSvImSvReVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Ah, SvRe}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
coup3 = cplAhSvReSvRe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, SvRe}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopSvRe)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
coup3 = cplhhSvReSvRe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, Fv, Chi}
If ((Include_in_loophh).and.(Include_in_loopFv).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,5
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
coup3L = cplChiFvSvReL(i3,i2,gt3)
coup3R = cplChiFvSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Fe, Cha}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = cplcChaFeSvReL(i3,i2,gt3)
coup3R = cplcChaFeSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Cha, Fe}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
coup3L = cplcFeChaSvReL(i3,i2,gt3)
coup3R = cplcFeChaSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, Chi, Fv}
If ((Include_in_loopSvIm).and.(Include_in_loopChi).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
coup3L = cplChiFvSvReL(i2,i3,gt3)
coup3R = cplChiFvSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, Chi, Fv}
If ((Include_in_loopSvRe).and.(Include_in_loopChi).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
coup3L = cplChiFvSvReL(i2,i3,gt3)
coup3R = cplChiFvSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Fe, Cha}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaFeSvReL(i3,i2,gt3)
coup3R = cplcChaFeSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, Fv, Chi}
If ((Include_in_loopVZ).and.(Include_in_loopFv).and.(Include_in_loopChi)) Then 
  Do i2=1,6
    Do i3=1,5
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
coup3L = cplChiFvSvReL(i3,i2,gt3)
coup3R = cplChiFvSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {bar[Cha], conj[Se], conj[Hpm]}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
coup3 = cplHpmSvRecSe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Cha], conj[Se], conj[VWm]}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplChiChacVWmL(gt2,i1)
coup2R = cplChiChacVWmR(gt2,i1)
coup3 = -cplSvRecSeVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[Se]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
coup3 = cplSeSvRecHpm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[VWm], conj[Se]}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopSe)) Then 
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
coup3 = cplSeSvRecVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {conj[Hpm], bar[Fe], bar[Cha]}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
coup3L = cplcFeChaSvReL(i2,i3,gt3)
coup3R = cplcFeChaSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], bar[Cha], bar[Fe]}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
coup3L = cplcChaFeSvReL(i2,i3,gt3)
coup3R = cplcChaFeSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], bar[Fe], bar[Cha]}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopCha)) Then 
  Do i2=1,3
    Do i3=1,2
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = -cplFvFecVWmR(gt1,i2)
coup1R = -cplFvFecVWmL(gt1,i2)
coup2L = -cplcChaChiVWmR(i3,gt2)
coup2R = -cplcChaChiVWmL(i3,gt2)
coup3L = cplcFeChaSvReL(i2,i3,gt3)
coup3R = cplcFeChaSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToChiSvRe


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToChiSvRe(MAh,MCha,MChi,MFe,            & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),          & 
& cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2), & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),   & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),           & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),       & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplHpmSvRecSe(2,6,6),      & 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSvImSvReVZ(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,5,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvRe(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToChiSvRe


Subroutine Amplitude_Tree_seesaw1nmssm_FvToFecHpm(cplFvFecHpmL,cplFvFecHpmR,          & 
& MFe,MFv,MHpm,MFe2,MFv2,MHpm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(6),MHpm(2),MFe2(3),MFv2(6),MHpm2(2)

Complex(dp), Intent(in) :: cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2)

Complex(dp) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFecHpmL(gt1,gt2,gt3)
coupT1R = cplFvFecHpmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_FvToFecHpm


Subroutine Gamma_Real_seesaw1nmssm_FvToFecHpm(MLambda,em,gs,cplFvFecHpmL,             & 
& cplFvFecHpmR,MFe,MFv,MHpm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2)

Real(dp), Intent(in) :: MFe(3),MFv(6),MHpm(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3,2), GammarealGluon(6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
    Do i3=2,2
CoupL = cplFvFecHpmL(i1,i2,i3)
CoupR = cplFvFecHpmR(i1,i2,i3)
Mex1 = MFv(i1)
Mex2 = MFe(i2)
Mex3 = MHpm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_FvToFecHpm


Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFecHpm(cplFvFecHpmL,cplFvFecHpmR,          & 
& ctcplFvFecHpmL,ctcplFvFecHpmR,MFe,MFe2,MFv,MFv2,MHpm,MHpm2,ZfFEL,ZfFER,ZfFV,           & 
& ZfHpm,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MFv(6),MFv2(6),MHpm(2),MHpm2(2)

Complex(dp), Intent(in) :: cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2)

Complex(dp), Intent(in) :: ctcplFvFecHpmL(6,3,2),ctcplFvFecHpmR(6,3,2)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfFV(6,6),ZfHpm(2,2)

Complex(dp), Intent(out) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFecHpmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplFvFecHpmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt1)*cplFvFecHpmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt1))*cplFvFecHpmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplFvFecHpmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplFvFecHpmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfHpm(i1,gt3))*cplFvFecHpmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfHpm(i1,gt3))*cplFvFecHpmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFecHpm


Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFecHpm(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,     & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),            & 
& cplAhHpmcHpm(3,2,2),cplAhcHpmVWm(3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),     & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),       & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6), & 
& cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),           & 
& cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhHpmcHpm(3,2,2),           & 
& cplhhcHpmVWm(3,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplSeSvImcHpm(6,6,2),            & 
& cplSeSvRecHpm(6,6,2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2)

Complex(dp), Intent(out) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, Fv, bar[Fe]}
If ((Include_in_loopAh).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplFvFecHpmL(i2,i3,gt3)
coup3R = cplFvFecHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, SvIm}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplSeSvImcHpm(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, SvRe}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = cplSeSvRecHpm(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, conj[Se]}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvImcHpm(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, conj[Se]}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvRecHpm(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Hpm, Ah}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, Ah}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopAh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhcHpmVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Hpm, hh}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, hh}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhcHpmVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Hpm, VP}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplHpmcHpmVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VWm, VP}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, Hpm, VZ}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplHpmcHpmVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VWm, VZ}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplcHpmVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Ah, conj[Hpm]}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, conj[Hpm]}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, VZ, conj[Hpm]}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Ah, conj[VWm]}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = cplAhcHpmVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, hh, conj[VWm]}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = cplhhcHpmVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, VZ, conj[VWm]}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = cplcHpmVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, Fv, bar[Fe]}
If ((Include_in_loophh).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplFvFecHpmL(i2,i3,gt3)
coup3R = cplFvFecHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Fe, Fv}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(i3,gt2,i1)
coup2R = cplFvFecHpmR(i3,gt2,i1)
coup3L = cplFvFecHpmL(i3,i2,gt3)
coup3R = cplFvFecHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Cha, Chi}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,5
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
coup3L = cplChiChacHpmL(i3,i2,gt3)
coup3R = cplChiChacHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, Chi, bar[Cha]}
If ((Include_in_loopSvIm).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplcChaFeSvImL(i3,gt2,i1)
coup2R = cplcChaFeSvImR(i3,gt2,i1)
coup3L = cplChiChacHpmL(i2,i3,gt3)
coup3R = cplChiChacHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, Chi, bar[Cha]}
If ((Include_in_loopSvRe).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplcChaFeSvReL(i3,gt2,i1)
coup2R = cplcChaFeSvReR(i3,gt2,i1)
coup3L = cplChiChacHpmL(i2,i3,gt3)
coup3R = cplChiChacHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Fe, Fv}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = -cplFvFecVWmR(i3,gt2)
coup2R = -cplFvFecVWmL(i3,gt2)
coup3L = cplFvFecHpmL(i3,i2,gt3)
coup3R = cplFvFecHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, Fv, bar[Fe]}
If ((Include_in_loopVZ).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplFvFecHpmL(i2,i3,gt3)
coup3R = cplFvFecHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFecHpm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFecHpm(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,       & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,           & 
& cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),            & 
& cplAhHpmcHpm(3,2,2),cplAhcHpmVWm(3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),     & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),       & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6), & 
& cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),           & 
& cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhHpmcHpm(3,2,2),           & 
& cplhhcHpmVWm(3,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplSeSvImcHpm(6,6,2),            & 
& cplSeSvRecHpm(6,6,2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2)

Complex(dp), Intent(out) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHpm(gt3) 


! {Fe, Hpm, VP}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplHpmcHpmVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VWm, VP}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFecHpm


Subroutine Amplitude_Tree_seesaw1nmssm_FvToFecVWm(cplFvFecVWmL,cplFvFecVWmR,          & 
& MFe,MFv,MVWm,MFe2,MFv2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(6),MVWm,MFe2(3),MFv2(6),MVWm2

Complex(dp), Intent(in) :: cplFvFecVWmL(6,3),cplFvFecVWmR(6,3)

Complex(dp) :: Amp(4,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1L = cplFvFecVWmL(gt1,gt2)
coupT1R = cplFvFecVWmR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_FvToFecVWm


Subroutine Gamma_Real_seesaw1nmssm_FvToFecVWm(MLambda,em,gs,cplFvFecVWmL,             & 
& cplFvFecVWmR,MFe,MFv,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFecVWmL(6,3),cplFvFecVWmR(6,3)

Real(dp), Intent(in) :: MFe(3),MFv(6),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3), GammarealGluon(6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
CoupL = cplFvFecVWmL(i1,i2)
CoupR = cplFvFecVWmR(i1,i2)
Mex1 = MFv(i1)
Mex2 = MFe(i2)
Mex3 = MVWm
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,0._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_FvToFecVWm


Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFecVWm(cplFvFecVWmL,cplFvFecVWmR,          & 
& ctcplFvFecVWmL,ctcplFvFecVWmR,MFe,MFe2,MFv,MFv2,MVWm,MVWm2,ZfFEL,ZfFER,ZfFV,           & 
& ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MFv(6),MFv2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplFvFecVWmL(6,3),cplFvFecVWmR(6,3)

Complex(dp), Intent(in) :: ctcplFvFecVWmL(6,3),ctcplFvFecVWmR(6,3)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfFV(6,6),ZfVWm

Complex(dp), Intent(out) :: Amp(4,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFecVWmL(gt1,gt2) 
ZcoupT1R = ctcplFvFecVWmR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfFV(i1,gt1))*cplFvFecVWmL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfFV(i1,gt1)*cplFvFecVWmR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplFvFecVWmL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplFvFecVWmR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWm*cplFvFecVWmL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWm*cplFvFecVWmR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFecVWm


Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFecVWm(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,      & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,     & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhHpmcVWm,cplhhcVWmVWm,         & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),            & 
& cplAhHpmcVWm(3,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),         & 
& cplFvChacSeR(6,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),      & 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvFecHpmL(6,3,2),    & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),            & 
& cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),              & 
& cplcFeFeVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),  & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhHpmcVWm(3,2),cplhhcVWmVWm(3),cplHpmcVWmVP(2), & 
& cplHpmcVWmVZ(2),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWm 


! {Ah, Fv, bar[Fe]}
If ((Include_in_loopAh).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, SvIm}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = -cplSeSvImcVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, SvRe}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = -cplSeSvRecVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, conj[Se]}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvImcVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, conj[Se]}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvRecVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Hpm, Ah}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhHpmcVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Hpm, hh}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhHpmcVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, hh}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Hpm, VP}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VWm, VP}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, Hpm, VZ}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VWm, VZ}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Ah, conj[Hpm]}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = -cplAhHpmcVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, conj[Hpm]}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = -cplhhHpmcVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, VZ, conj[Hpm]}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, hh, conj[VWm]}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFecVWmL(i1,gt2)
coup2R = cplFvFecVWmR(i1,gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, VZ, conj[VWm]}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
coup2L = cplFvFecVWmL(i1,gt2)
coup2R = cplFvFecVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, Fv, bar[Fe]}
If ((Include_in_loophh).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Fe, Fv}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(i3,gt2,i1)
coup2R = cplFvFecHpmR(i3,gt2,i1)
coup3L = -cplFvFecVWmR(i3,i2)
coup3R = -cplFvFecVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Cha, Chi}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,5
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
coup3L = -cplChiChacVWmR(i3,i2)
coup3R = -cplChiChacVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, Chi, bar[Cha]}
If ((Include_in_loopSvIm).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplcChaFeSvImL(i3,gt2,i1)
coup2R = cplcChaFeSvImR(i3,gt2,i1)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, Chi, bar[Cha]}
If ((Include_in_loopSvRe).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplcChaFeSvReL(i3,gt2,i1)
coup2R = cplcChaFeSvReR(i3,gt2,i1)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Fe, Fv}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,3
    Do i3=1,6
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFvVWmR(i2,gt1)
coup1R = -cplcFeFvVWmL(i2,gt1)
coup2L = cplFvFecVWmL(i3,gt2)
coup2R = cplFvFecVWmR(i3,gt2)
coup3L = -cplFvFecVWmR(i3,i2)
coup3R = -cplFvFecVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, Fv, bar[Fe]}
If ((Include_in_loopVZ).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvVZL(gt1,i2)
coup1R = cplFvFvVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFecVWm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFecVWm(MAh,MCha,MChi,MFe,             & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSeSvImcVWm,cplSeSvRecVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),            & 
& cplAhHpmcVWm(3,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),         & 
& cplFvChacSeR(6,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),      & 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvFecHpmL(6,3,2),    & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),            & 
& cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),              & 
& cplcFeFeVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),  & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhHpmcVWm(3,2),cplhhcVWmVWm(3),cplHpmcVWmVP(2), & 
& cplHpmcVWmVZ(2),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWm 


! {Fe, Hpm, VP}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VWm, VP}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVP)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFecVWm


Subroutine Amplitude_Tree_seesaw1nmssm_FvToFvhh(cplFvFvhhL,cplFvFvhhR,MFv,            & 
& Mhh,MFv2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),Mhh(3),MFv2(6),Mhh2(3)

Complex(dp), Intent(in) :: cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3)

Complex(dp) :: Amp(2,6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFvhhL(gt1,gt2,gt3)
coupT1R = cplFvFvhhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_FvToFvhh


Subroutine Gamma_Real_seesaw1nmssm_FvToFvhh(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,      & 
& MFv,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3)

Real(dp), Intent(in) :: MFv(6),Mhh(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,3), GammarealGluon(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
CoupL = cplFvFvhhL(i1,i2,i3)
CoupR = cplFvFvhhR(i1,i2,i3)
Mex1 = MFv(i1)
Mex2 = MFv(i2)
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
End Subroutine Gamma_Real_seesaw1nmssm_FvToFvhh


Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFvhh(cplFvFvhhL,cplFvFvhhR,ctcplFvFvhhL,   & 
& ctcplFvFvhhR,MFv,MFv2,Mhh,Mhh2,ZfFV,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MFv2(6),Mhh(3),Mhh2(3)

Complex(dp), Intent(in) :: cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3)

Complex(dp), Intent(in) :: ctcplFvFvhhL(6,6,3),ctcplFvFvhhR(6,6,3)

Complex(dp), Intent(in) :: ZfFV(6,6),Zfhh(3,3)

Complex(dp), Intent(out) :: Amp(2,6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvhhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplFvFvhhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt1)*cplFvFvhhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt1))*cplFvFvhhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplFvFvhhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplFvFvhhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplFvFvhhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplFvFvhhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFvhh


Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFvhh(MAh,MCha,MChi,MFe,MFv,              & 
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

Complex(dp), Intent(out) :: Amp(2,6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, Fv, Fv}
If ((Include_in_loopAh).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, Se}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = cplhhSecSe(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, SvIm}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
coup3 = cplhhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, SvIm}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
coup3 = cplhhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, SvRe}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
coup3 = cplhhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, SvRe}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
coup3 = cplhhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Hpm, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = -cplhhcHpmVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Hpm, VWm}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = -cplhhHpmcVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VWm, VWm}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Ah, Ah}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, Ah}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhhhhh(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, VZ, Ah}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhhhVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Ah, hh}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplAhhhhh(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, hh, hh}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Ah, VZ}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplAhhhVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, VZ, VZ}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, Fv, Fv}
If ((Include_in_loophh).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Fe, Fe}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Cha, Cha}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = cplcChaChahhL(i3,i2,gt3)
coup3R = cplcChaChahhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, Chi, Chi}
If ((Include_in_loopSvIm).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,5
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, Chi, Chi}
If ((Include_in_loopSvRe).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Fe, Fe}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, Fv, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {bar[Cha], conj[Se], conj[Se]}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[Hpm]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
coup3 = cplhhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[VWm], conj[Hpm]}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
coup3 = -cplhhHpmcVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[VWm]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
coup3 = -cplhhcHpmVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], conj[VWm], conj[VWm]}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[Hpm], bar[Fe], bar[Fe]}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], bar[Cha], bar[Cha]}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], bar[Fe], bar[Fe]}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFecVWmR(gt1,i2)
coup1R = -cplFvFecVWmL(gt1,i2)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFvhh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFvhh(MAh,MCha,MChi,MFe,               & 
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

Complex(dp), Intent(out) :: Amp(2,6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFvhh


Subroutine Amplitude_Tree_seesaw1nmssm_FvToFvVZ(cplFvFvVZL,cplFvFvVZR,MFv,            & 
& MVZ,MFv2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MVZ,MFv2(6),MVZ2

Complex(dp), Intent(in) :: cplFvFvVZL(6,6),cplFvFvVZR(6,6)

Complex(dp) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplFvFvVZL(gt1,gt2)
coupT1R = cplFvFvVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_FvToFvVZ


Subroutine Gamma_Real_seesaw1nmssm_FvToFvVZ(MLambda,em,gs,cplFvFvVZL,cplFvFvVZR,      & 
& MFv,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvVZL(6,6),cplFvFvVZR(6,6)

Real(dp), Intent(in) :: MFv(6),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
CoupL = cplFvFvVZL(i1,i2)
CoupR = cplFvFvVZR(i1,i2)
Mex1 = MFv(i1)
Mex2 = MFv(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealPhoton(i1,i2) = 0._dp 

  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_FvToFvVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFvVZ(cplFvFvVZL,cplFvFvVZR,ctcplFvFvVZL,   & 
& ctcplFvFvVZR,MFv,MFv2,MVZ,MVZ2,ZfFV,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MFv2(6),MVZ,MVZ2

Complex(dp), Intent(in) :: cplFvFvVZL(6,6),cplFvFvVZR(6,6)

Complex(dp), Intent(in) :: ctcplFvFvVZL(6,6),ctcplFvFvVZR(6,6)

Complex(dp), Intent(in) :: ZfFV(6,6),ZfVZ

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvVZL(gt1,gt2) 
ZcoupT1R = ctcplFvFvVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfFV(i1,gt1))*cplFvFvVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfFV(i1,gt1)*cplFvFvVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplFvFvVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplFvFvVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplFvFvVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplFvFvVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFvVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFvVZ(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,cplFvChacSeL,            & 
& cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,      & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhVZ(3,3),cplFvChacSeL(6,2,6),               & 
& cplFvChacSeR(6,2,6),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),           & 
& cplChiChiVZR(5,5),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),      & 
& cplChiFvSvReR(5,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),& 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),               & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),     & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 


! {Ah, Fv, Fv}
If ((Include_in_loopAh).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Cha, Se, Se}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvRe, SvIm}
If ((Include_in_loopChi).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
coup3 = cplSvImSvReVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Chi, SvIm, SvRe}
If ((Include_in_loopChi).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,5
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
coup3 = -cplSvImSvReVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Hpm, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Hpm, VWm}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VWm, VWm}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, hh, Ah}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Ah, hh}
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, VZ, hh}
If ((Include_in_loopFv).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, hh, VZ}
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVZR(gt2,i1)
coup2R = -cplFvFvVZL(gt2,i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, Fv, Fv}
If ((Include_in_loophh).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hpm, Fe, Fe}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Cha, Cha}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvIm, Chi, Chi}
If ((Include_in_loopSvIm).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,5
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {SvRe, Chi, Chi}
If ((Include_in_loopSvRe).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,5
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Fe, Fe}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFvVWmR(i2,gt1)
coup1R = -cplcFeFvVWmL(i2,gt1)
coup2L = -cplFvFecVWmR(gt2,i3)
coup2R = -cplFvFecVWmL(gt2,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, Fv, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVZL(gt1,i2)
coup1R = cplFvFvVZR(gt1,i2)
coup2L = -cplFvFvVZR(gt2,i3)
coup2R = -cplFvFvVZL(gt2,i3)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {bar[Cha], conj[Se], conj[Se]}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
coup3 = cplSecSeVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[Hpm]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
coup3 = cplHpmcHpmVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[VWm], conj[Hpm]}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[VWm]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], conj[VWm], conj[VWm]}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[Hpm], bar[Fe], bar[Fe]}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], bar[Cha], bar[Cha]}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], bar[Fe], bar[Fe]}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecVWmL(gt1,i2)
coup1R = cplFvFecVWmR(gt1,i2)
coup2L = cplcFeFvVWmL(i3,gt2)
coup2R = cplcFeFvVWmR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFvVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFvVZ(MAh,MCha,MChi,MFe,               & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,cplFvChacSeL,            & 
& cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,      & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),MSe2(6),           & 
& MSvIm2(6),MSvRe2(6),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhVZ(3,3),cplFvChacSeL(6,2,6),               & 
& cplFvChacSeR(6,2,6),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),           & 
& cplChiChiVZR(5,5),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),      & 
& cplChiFvSvReR(5,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),& 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),               & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),     & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFvVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFvVP(cplFvFvVZL,cplFvFvVZR,ctcplFvFvVZL,   & 
& ctcplFvFvVZR,MFv,MFv2,MVP,MVP2,MVZ,MVZ2,ZfFV,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MFv2(6),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplFvFvVZL(6,6),cplFvFvVZR(6,6)

Complex(dp), Intent(in) :: ctcplFvFvVZL(6,6),ctcplFvFvVZR(6,6)

Complex(dp), Intent(in) :: ZfFV(6,6),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVP 
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
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplFvFvVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplFvFvVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_FvToFvVP


Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFvVP(MCha,MFe,MFv,MHpm,MSe,              & 
& MVP,MVWm,MCha2,MFe2,MFv2,MHpm2,MSe2,MVP2,MVWm2,cplFvChacSeL,cplFvChacSeR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplcHpmVPVWm,           & 
& cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MFv(6),MHpm(2),MSe(6),MVP,MVWm,MCha2(2),MFe2(3),MFv2(6),               & 
& MHpm2(2),MSe2(6),MVP2,MVWm2

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),        & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),             & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSecSeVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVP 


! {Cha, Se, Se}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVP(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Hpm, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVP(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VWm, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Hpm, VWm}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VWm, VWm}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hpm, Fe, Fe}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Se, Cha, Cha}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VWm, Fe, Fe}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFvVWmR(i2,gt1)
coup1R = -cplcFeFvVWmL(i2,gt1)
coup2L = -cplFvFecVWmR(gt2,i3)
coup2R = -cplFvFecVWmL(gt2,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {bar[Cha], conj[Se], conj[Se]}
If ((Include_in_loopCha).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
coup3 = cplSecSeVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[Hpm]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
coup3 = cplHpmcHpmVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], conj[VWm], conj[Hpm]}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {bar[Fe], conj[Hpm], conj[VWm]}
If ((Include_in_loopFe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], conj[VWm], conj[VWm]}
If ((Include_in_loopFe).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {conj[Hpm], bar[Fe], bar[Fe]}
If ((Include_in_loopHpm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[Se], bar[Cha], bar[Cha]}
If ((Include_in_loopSe).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {conj[VWm], bar[Fe], bar[Fe]}
If ((Include_in_loopVWm).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecVWmL(gt1,i2)
coup1R = cplFvFecVWmR(gt1,i2)
coup2L = cplcFeFvVWmL(i3,gt2)
coup2R = cplcFeFvVWmR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_FvToFvVP


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFvVP(MCha,MFe,MFv,MHpm,               & 
& MSe,MVP,MVWm,MCha2,MFe2,MFv2,MHpm2,MSe2,MVP2,MVWm2,cplFvChacSeL,cplFvChacSeR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplcHpmVPVWm,           & 
& cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MFv(6),MHpm(2),MSe(6),MVP,MVWm,MCha2(2),MFe2(3),MFv2(6),               & 
& MHpm2(2),MSe2(6),MVP2,MVWm2

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),        & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),             & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSecSeVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_FvToFvVP



End Module OneLoopDecay_Fv_seesaw1nmssm
