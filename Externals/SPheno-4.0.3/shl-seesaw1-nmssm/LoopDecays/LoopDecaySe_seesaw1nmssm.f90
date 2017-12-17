! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:42 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Se_seesaw1nmssm
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

Subroutine Amplitude_Tree_seesaw1nmssm_SeToSeAh(cplAhSecSe,MAh,MSe,MAh2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MSe(6),MAh2(3),MSe2(6)

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6)

Complex(dp) :: Amp(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSecSe(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_SeToSeAh


Subroutine Gamma_Real_seesaw1nmssm_SeToSeAh(MLambda,em,gs,cplAhSecSe,MAh,             & 
& MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6)

Real(dp), Intent(in) :: MAh(3),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,3), GammarealGluon(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=2,3
Coup = cplAhSecSe(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MSe(i2)
Mex3 = MAh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_SeToSeAh


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSeAh(cplAhSecSe,ctcplAhSecSe,              & 
& MAh,MAh2,MSe,MSe2,ZfAh,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MAh2(3),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6)

Complex(dp), Intent(in) :: ctcplAhSecSe(3,6,6)

Complex(dp), Intent(in) :: ZfAh(3,3),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSecSe(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplAhSecSe(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplAhSecSe(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhSecSe(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSeAh


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSeAh(MAh,MCha,MChi,MFe,MFv,              & 
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

Complex(dp), Intent(out) :: Amp(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MAh(gt3) 


! {Ah, conj[Se], conj[Se]}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
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
End if 


! {Cha, Fv, Fv}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFvSeL(i1,i3,gt2)
coup2R = cplcChaFvSeR(i1,i3,gt2)
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


! {Chi, bar[Fe], bar[Fe]}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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
End if 


! {Fe, Chi, Chi}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,5
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,i3,gt2)
coup2R = cplcFeChiSeR(i1,i3,gt2)
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


! {Fv, bar[Cha], bar[Cha]}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplcChaFvSeL(i3,i1,gt2)
coup2R = cplcChaFvSeR(i3,i1,gt2)
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
End if 


! {hh, conj[Se], conj[Se]}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
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
End if 


! {Hpm, SvIm, SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplSeSvImcHpm(gt2,i3,i1)
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


! {Hpm, SvRe, SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplSeSvImcHpm(gt2,i3,i1)
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


! {Hpm, SvIm, SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplSeSvRecHpm(gt2,i3,i1)
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


! {Hpm, SvRe, SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplSeSvRecHpm(gt2,i3,i1)
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


! {Se, Ah, Ah}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, hh, Ah}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, Ah, hh}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, hh, hh}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, VZ, hh}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, hh, VZ}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = -cplSecSeVZ(gt2,i1)
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


! {SvIm, conj[Hpm], conj[Hpm]}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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
End if 


! {SvIm, conj[VWm], conj[Hpm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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


! {SvIm, conj[Hpm], conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = -cplSeSvImcVWm(gt2,i1)
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


! {SvRe, conj[Hpm], conj[Hpm]}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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
End if 


! {SvRe, conj[VWm], conj[Hpm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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


! {SvRe, conj[Hpm], conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = -cplSeSvRecVWm(gt2,i1)
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


! {VP, conj[Se], conj[Se]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = -cplSecSeVP(gt2,i3)
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
End if 


! {VWm, SvIm, SvIm}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplSvImcSeVWm(i2,gt1)
coup2 = -cplSeSvImcVWm(gt2,i3)
coup3 = cplAhSvImSvIm(gt3,i3,i2)
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


! {VWm, SvRe, SvIm}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplSvRecSeVWm(i2,gt1)
coup2 = -cplSeSvImcVWm(gt2,i3)
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
End if 


! {VWm, SvIm, SvRe}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplSvImcSeVWm(i2,gt1)
coup2 = -cplSeSvRecVWm(gt2,i3)
coup3 = cplAhSvImSvRe(gt3,i2,i3)
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


! {VWm, SvRe, SvRe}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplSvRecSeVWm(i2,gt1)
coup2 = -cplSeSvRecVWm(gt2,i3)
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
End if 


! {VZ, conj[Se], conj[Se]}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = -cplSecSeVZ(gt2,i3)
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
End if 


! {Ah, conj[Se]}
If ((Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhAhSecSe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplAhhhSecSe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplAhSeSvImcHpm1(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplAhSeSvRecHpm1(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplAhAhSecSe1(gt3,i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i2)
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


! {hh, conj[Se]}
If ((Include_in_loophh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhhhSecSe1(gt3,i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i2)
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


! {Hpm, SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplAhHpmSvImcSe1(gt3,i1,i2,gt1)
coup2 = cplSeSvImcHpm(gt2,i2,i1)
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


! {Hpm, SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplAhHpmSvRecSe1(gt3,i1,i2,gt1)
coup2 = cplSeSvRecHpm(gt2,i2,i1)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplAhhhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplhhhhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplHpmSecHpmcSe1(i1,gt2,i2,gt1)
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
coup1 = cplSdSecSdcSeaa(i1,gt2,i2,gt1)
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
coup1 = cplSeSecSecSe1(gt2,i1,gt1,i2)
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
coup1 = cplSeSucSecSuaa(gt2,i1,gt1,i2)
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
coup1 = cplSeSvImSvImcSe1(gt2,i1,i2,gt1)
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
coup1 = cplSeSvImSvRecSe1(gt2,i1,i2,gt1)
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
coup1 = cplSeSvReSvRecSe1(gt2,i1,i2,gt1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSeAh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSeAh(MAh,MCha,MChi,MFe,               & 
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

Complex(dp), Intent(out) :: Amp(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MAh(gt3) 


! {VP, conj[Se], conj[Se]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = -cplSecSeVP(gt2,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSeAh


Subroutine Amplitude_Tree_seesaw1nmssm_SeToFvCha(cplFvChacSeL,cplFvChacSeR,           & 
& MCha,MFv,MSe,MCha2,MFv2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFv(6),MSe(6),MCha2(2),MFv2(6),MSe2(6)

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Complex(dp) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MCha(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvChacSeL(gt2,gt3,gt1)
coupT1R = cplFvChacSeR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_SeToFvCha


Subroutine Gamma_Real_seesaw1nmssm_SeToFvCha(MLambda,em,gs,cplFvChacSeL,              & 
& cplFvChacSeR,MCha,MFv,MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Real(dp), Intent(in) :: MCha(2),MFv(6),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,2), GammarealGluon(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
CoupL = cplFvChacSeL(i2,i3,i1)
CoupR = cplFvChacSeR(i2,i3,i1)
Mex1 = MSe(i1)
Mex2 = MFv(i2)
Mex3 = MCha(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_SeToFvCha


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToFvCha(cplFvChacSeL,cplFvChacSeR,           & 
& ctcplFvChacSeL,ctcplFvChacSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFV,ZfLm,ZfLp,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFv(6),MFv2(6),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Complex(dp), Intent(in) :: ctcplFvChacSeL(6,2,6),ctcplFvChacSeR(6,2,6)

Complex(dp), Intent(in) :: ZfFV(6,6),ZfLm(2,2),ZfLp(2,2),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MCha(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvChacSeL(gt2,gt3,gt1) 
ZcoupT1R = ctcplFvChacSeR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplFvChacSeL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplFvChacSeR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplFvChacSeL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplFvChacSeR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt3)*cplFvChacSeL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt3))*cplFvChacSeR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToFvCha


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToFvCha(MAh,MCha,MChi,MFe,MFv,             & 
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

Complex(dp), Intent(out) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MCha(gt3) 


! {Ah, conj[Se], Fv}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Cha, Fv, Se}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
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


! {Chi, bar[Fe], SvIm}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopSvIm)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, bar[Fe], SvRe}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopSvRe)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Fe, Chi, Hpm}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
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


! {Fe, Chi, VWm}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopVWm)) Then 
Do i1=1,3
  Do i2=1,5
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MVWm 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
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


! {Fv, bar[Cha], Ah}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MAh(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, bar[Cha], hh}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, bar[Cha], VZ}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MVZ 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
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


! {hh, conj[Se], Fv}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, SvIm, Fe}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MFe(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
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


! {Hpm, SvRe, Fe}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MFe(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
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


! {Se, Ah, Cha}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MCha(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
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


! {Se, hh, Cha}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
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


! {Se, VP, Cha}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopCha)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MCha(i3) 
coup1 = -cplSecSeVP(i1,gt1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = cplcChaChaVPL(i3,gt3)
coup3R = cplcChaChaVPR(i3,gt3)
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


! {Se, VZ, Cha}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopCha)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MCha(i3) 
coup1 = -cplSecSeVZ(i1,gt1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
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


! {SvIm, conj[Hpm], Chi}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,5
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MChi(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvIm, conj[VWm], Chi}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopChi)) Then 
Do i1=1,6
    Do i3=1,5
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MChi(i3) 
coup1 = -cplSvImcSeVWm(i1,gt1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvRe, conj[Hpm], Chi}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MChi(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {SvRe, conj[VWm], Chi}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopChi)) Then 
Do i1=1,6
    Do i3=1,5
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MChi(i3) 
coup1 = -cplSvRecSeVWm(i1,gt1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {VWm, SvIm, Fe}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,3
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MFe(i3) 
coup1 = -cplSvImcSeVWm(i2,gt1)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeChaSvImL(i3,gt3,i2)
coup3R = cplcFeChaSvImR(i3,gt3,i2)
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


! {VWm, SvRe, Fe}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,3
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSvRecSeVWm(i2,gt1)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
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
End if 


! {VZ, conj[Se], Fv}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = -cplSecSeVZ(i2,gt1)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
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
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToFvCha


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToFvCha(MAh,MCha,MChi,MFe,              & 
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

Complex(dp), Intent(out) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MCha(gt3) 


! {Se, VP, Cha}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopCha)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MCha(i3) 
coup1 = -cplSecSeVP(i1,gt1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = cplcChaChaVPL(i3,gt3)
coup3R = cplcChaChaVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToFvCha


Subroutine Amplitude_Tree_seesaw1nmssm_SeToFeChi(cplChiFecSeL,cplChiFecSeR,           & 
& MChi,MFe,MSe,MChi2,MFe2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),MFe(3),MSe(6),MChi2(5),MFe2(3),MSe2(6)

Complex(dp), Intent(in) :: cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6)

Complex(dp) :: Amp(2,6,3,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,5
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MChi(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFecSeL(gt3,gt2,gt1)
coupT1R = cplChiFecSeR(gt3,gt2,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_SeToFeChi


Subroutine Gamma_Real_seesaw1nmssm_SeToFeChi(MLambda,em,gs,cplChiFecSeL,              & 
& cplChiFecSeR,MChi,MFe,MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6)

Real(dp), Intent(in) :: MChi(5),MFe(3),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3,5), GammarealGluon(6,3,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
    Do i3=1,5
CoupL = cplChiFecSeL(i3,i2,i1)
CoupR = cplChiFecSeR(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MFe(i2)
Mex3 = MChi(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_SeToFeChi


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToFeChi(cplChiFecSeL,cplChiFecSeR,           & 
& ctcplChiFecSeL,ctcplChiFecSeR,MChi,MChi2,MFe,MFe2,MSe,MSe2,ZfFEL,ZfFER,ZfL0,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(5),MChi2(5),MFe(3),MFe2(3),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6)

Complex(dp), Intent(in) :: ctcplChiFecSeL(5,3,6),ctcplChiFecSeR(5,3,6)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfL0(5,5),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,5
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MChi(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFecSeL(gt3,gt2,gt1) 
ZcoupT1R = ctcplChiFecSeR(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplChiFecSeL(gt3,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplChiFecSeR(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplChiFecSeL(gt3,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplChiFecSeR(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,5
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt3)*cplChiFecSeL(i1,gt2,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt3))*cplChiFecSeR(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToFeChi


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToFeChi(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),        & 
& cplAhSecSe(3,6,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),     & 
& cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFecSeL(5,3,6),           & 
& cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFeChiSeL(3,5,6),  & 
& cplcFeChiSeR(3,5,6),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplFvFecHpmL(6,3,2),       & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),            & 
& cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),              & 
& cplcFeFeVZR(3,3),cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),          & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,5
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MChi(gt3) 


! {Ah, conj[Se], bar[Fe]}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
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


! {Cha, Fv, SvIm}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
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


! {Cha, Fv, SvRe}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
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


! {Chi, bar[Fe], conj[Se]}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopSe)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
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


! {Fe, Chi, Ah}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
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


! {Fe, Chi, hh}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, Chi, VZ}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,5
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MVZ 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
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


! {Fv, bar[Cha], conj[Hpm]}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
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


! {Fv, bar[Cha], conj[VWm]}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MVWm 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
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


! {hh, conj[Se], bar[Fe]}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
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


! {Hpm, SvIm, Fv}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MFv(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2L = cplFvFecHpmL(i3,gt2,i1)
coup2R = cplFvFecHpmR(i3,gt2,i1)
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


! {Hpm, SvRe, Fv}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MFv(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2L = cplFvFecHpmL(i3,gt2,i1)
coup2R = cplFvFecHpmR(i3,gt2,i1)
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


! {Se, Ah, Chi}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,5
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
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


! {Se, hh, Chi}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,5
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
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


! {Se, VZ, Chi}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopChi)) Then 
Do i1=1,6
    Do i3=1,5
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MChi(i3) 
coup1 = -cplSecSeVZ(i1,gt1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
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


! {SvIm, conj[Hpm], bar[Cha]}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2L = cplcChaFeSvImL(i3,gt2,i1)
coup2R = cplcChaFeSvImR(i3,gt2,i1)
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


! {SvIm, conj[VWm], bar[Cha]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopCha)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = -cplSvImcSeVWm(i1,gt1)
coup2L = cplcChaFeSvImL(i3,gt2,i1)
coup2R = cplcChaFeSvImR(i3,gt2,i1)
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


! {SvRe, conj[Hpm], bar[Cha]}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i3,gt2,i1)
coup2R = cplcChaFeSvReR(i3,gt2,i1)
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


! {SvRe, conj[VWm], bar[Cha]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopCha)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = -cplSvRecSeVWm(i1,gt1)
coup2L = cplcChaFeSvReL(i3,gt2,i1)
coup2R = cplcChaFeSvReR(i3,gt2,i1)
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


! {VP, conj[Se], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSecSeVP(i2,gt1)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
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
End if 


! {VWm, SvIm, Fv}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MFv(i3) 
coup1 = -cplSvImcSeVWm(i2,gt1)
coup2L = -cplFvFecVWmR(i3,gt2)
coup2R = -cplFvFecVWmL(i3,gt2)
coup3L = cplChiFvSvImL(gt3,i3,i2)
coup3R = cplChiFvSvImR(gt3,i3,i2)
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


! {VWm, SvRe, Fv}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MFv(i3) 
coup1 = -cplSvRecSeVWm(i2,gt1)
coup2L = -cplFvFecVWmR(i3,gt2)
coup2R = -cplFvFecVWmL(i3,gt2)
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
End if 


! {VZ, conj[Se], bar[Fe]}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSecSeVZ(i2,gt1)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
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
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToFeChi


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToFeChi(MAh,MCha,MChi,MFe,              & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,        & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),        & 
& cplAhSecSe(3,6,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),     & 
& cplChiChacVWmR(5,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFecSeL(5,3,6),           & 
& cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFeChiSeL(3,5,6),  & 
& cplcFeChiSeR(3,5,6),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplFvFecHpmL(6,3,2),       & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,3),            & 
& cplcFeFehhR(3,3,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),              & 
& cplcFeFeVZR(3,3),cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),          & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,5) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,5
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MChi(gt3) 


! {VP, conj[Se], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSecSeVP(i2,gt1)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplChiFecSeL(gt3,i3,i2)
coup3R = cplChiFecSeR(gt3,i3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToFeChi


Subroutine Amplitude_Tree_seesaw1nmssm_SeToSehh(cplhhSecSe,Mhh,MSe,Mhh2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),MSe(6),Mhh2(3),MSe2(6)

Complex(dp), Intent(in) :: cplhhSecSe(3,6,6)

Complex(dp) :: Amp(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSecSe(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_SeToSehh


Subroutine Gamma_Real_seesaw1nmssm_SeToSehh(MLambda,em,gs,cplhhSecSe,Mhh,             & 
& MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSecSe(3,6,6)

Real(dp), Intent(in) :: Mhh(3),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,3), GammarealGluon(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
Coup = cplhhSecSe(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MSe(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_SeToSehh


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSehh(cplhhSecSe,ctcplhhSecSe,              & 
& Mhh,Mhh2,MSe,MSe2,Zfhh,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplhhSecSe(3,6,6)

Complex(dp), Intent(in) :: ctcplhhSecSe(3,6,6)

Complex(dp), Intent(in) :: Zfhh(3,3),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSecSe(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplhhSecSe(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplhhSecSe(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhSecSe(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSehh


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSehh(MAh,MCha,MChi,MFe,MFv,              & 
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

Complex(dp), Intent(out) :: Amp(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, conj[Se], conj[Se]}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
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
End if 


! {Cha, Fv, Fv}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFvSeL(i1,i3,gt2)
coup2R = cplcChaFvSeR(i1,i3,gt2)
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


! {Chi, bar[Fe], bar[Fe]}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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
End if 


! {Fe, Chi, Chi}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,5
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,i3,gt2)
coup2R = cplcFeChiSeR(i1,i3,gt2)
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


! {Fv, bar[Cha], bar[Cha]}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplcChaFvSeL(i3,i1,gt2)
coup2R = cplcChaFvSeR(i3,i1,gt2)
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
End if 


! {hh, conj[Se], conj[Se]}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
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
End if 


! {Hpm, SvIm, SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplSeSvImcHpm(gt2,i3,i1)
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


! {Hpm, SvRe, SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplSeSvImcHpm(gt2,i3,i1)
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


! {Hpm, SvIm, SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplSeSvRecHpm(gt2,i3,i1)
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


! {Hpm, SvRe, SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplSeSvRecHpm(gt2,i3,i1)
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


! {Se, Ah, Ah}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, hh, Ah}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, VZ, Ah}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, Ah, hh}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, hh, hh}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, Ah, VZ}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = -cplSecSeVZ(gt2,i1)
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


! {Se, VZ, VZ}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = -cplSecSeVZ(gt2,i1)
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


! {SvIm, conj[Hpm], conj[Hpm]}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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
End if 


! {SvIm, conj[VWm], conj[Hpm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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


! {SvIm, conj[Hpm], conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = -cplSeSvImcVWm(gt2,i1)
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


! {SvIm, conj[VWm], conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = -cplSeSvImcVWm(gt2,i1)
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


! {SvRe, conj[Hpm], conj[Hpm]}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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
End if 


! {SvRe, conj[VWm], conj[Hpm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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


! {SvRe, conj[Hpm], conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = -cplSeSvRecVWm(gt2,i1)
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


! {SvRe, conj[VWm], conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = -cplSeSvRecVWm(gt2,i1)
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


! {VP, conj[Se], conj[Se]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = -cplSecSeVP(gt2,i3)
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
End if 


! {VWm, SvIm, SvIm}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopSvIm)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1 = cplSvImcSeVWm(i2,gt1)
coup2 = -cplSeSvImcVWm(gt2,i3)
coup3 = cplhhSvImSvIm(gt3,i3,i2)
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


! {VWm, SvRe, SvIm}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplSvRecSeVWm(i2,gt1)
coup2 = -cplSeSvImcVWm(gt2,i3)
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
End if 


! {VWm, SvIm, SvRe}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplSvImcSeVWm(i2,gt1)
coup2 = -cplSeSvRecVWm(gt2,i3)
coup3 = cplhhSvImSvRe(gt3,i2,i3)
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


! {VWm, SvRe, SvRe}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopSvRe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplSvRecSeVWm(i2,gt1)
coup2 = -cplSeSvRecVWm(gt2,i3)
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
End if 


! {VZ, conj[Se], conj[Se]}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = -cplSecSeVZ(gt2,i3)
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
End if 


! {Ah, conj[Se]}
If ((Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhhhSecSe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhhhSecSe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplhhSeSvImcHpm1(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplhhSeSvRecHpm1(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplAhhhSecSe1(i1,gt3,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i2)
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


! {hh, conj[Se]}
If ((Include_in_loophh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
coup1 = cplhhhhSecSe1(gt3,i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i2)
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


! {Hpm, SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplhhHpmSvImcSe1(gt3,i1,i2,gt1)
coup2 = cplSeSvImcHpm(gt2,i2,i1)
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


! {Hpm, SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplhhHpmSvRecSe1(gt3,i1,i2,gt1)
coup2 = cplSeSvRecHpm(gt2,i2,i1)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplAhhhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplhhhhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplHpmSecHpmcSe1(i1,gt2,i2,gt1)
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
coup1 = cplSdSecSdcSeaa(i1,gt2,i2,gt1)
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
coup1 = cplSeSecSecSe1(gt2,i1,gt1,i2)
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
coup1 = cplSeSucSecSuaa(gt2,i1,gt1,i2)
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
coup1 = cplSeSvImSvImcSe1(gt2,i1,i2,gt1)
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
coup1 = cplSeSvImSvRecSe1(gt2,i1,i2,gt1)
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
coup1 = cplSeSvReSvRecSe1(gt2,i1,i2,gt1)
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
coup1 = cplSecSecVWmVWm1(gt2,gt1)
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
coup1 = cplSecSeVZVZ1(gt2,gt1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSehh


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSehh(MAh,MCha,MChi,MFe,               & 
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

Complex(dp), Intent(out) :: Amp(6,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = Mhh(gt3) 


! {VP, conj[Se], conj[Se]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = -cplSecSeVP(gt2,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSehh


Subroutine Amplitude_Tree_seesaw1nmssm_SeToSvImHpm(cplHpmSvImcSe,MHpm,MSe,            & 
& MSvIm,MHpm2,MSe2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSvIm(6),MHpm2(2),MSe2(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplHpmSvImcSe(2,6,6)

Complex(dp) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1 = cplHpmSvImcSe(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_SeToSvImHpm


Subroutine Gamma_Real_seesaw1nmssm_SeToSvImHpm(MLambda,em,gs,cplHpmSvImcSe,           & 
& MHpm,MSe,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplHpmSvImcSe(2,6,6)

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSvIm(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,2), GammarealGluon(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=2,2
Coup = cplHpmSvImcSe(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MSvIm(i2)
Mex3 = MHpm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_SeToSvImHpm


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSvImHpm(cplHpmSvImcSe,ctcplHpmSvImcSe,     & 
& MHpm,MHpm2,MSe,MSe2,MSvIm,MSvIm2,ZfHpm,ZfSe,ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MSe(6),MSe2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplHpmSvImcSe(2,6,6)

Complex(dp), Intent(in) :: ctcplHpmSvImcSe(2,6,6)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfSe(6,6),ZfSvIm(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplHpmSvImcSe(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplHpmSvImcSe(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt2)*cplHpmSvImcSe(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHpm(i1,gt3)*cplHpmSvImcSe(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSvImHpm


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSvImHpm(MAh,MCha,MChi,MFe,               & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,6,6),         & 
& cplAhSvImSvRe(3,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcFeChaSvImL(3,2,6),    & 
& cplcFeChaSvImR(3,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),    & 
& cplChiFvSvImR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaFeSvImL(2,3,6),& 
& cplcChaFeSvImR(2,3,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),& 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),& 
& cplAhHpmSvImcSe1(3,2,6,6),cplAhHpmSvRecSe1(3,2,6,6),cplhhHpmSvImcSe1(3,2,6,6),         & 
& cplhhHpmSvRecSe1(3,2,6,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSvImSvImcHpm1(2,6,6,2),      & 
& cplHpmSvImSvRecHpm1(2,6,6,2),cplSdSvImcSecSuaa(6,6,6,6),cplSeSvImSvImcSe1(6,6,6,6),    & 
& cplSeSvImSvRecSe1(6,6,6,6),cplSvImcSeVPVWm1(6,6),cplSvImcSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, conj[Se], SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvImSvIm(i1,gt2,i3)
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


! {Ah, conj[Se], SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
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


! {Cha, Fv, Fe}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFeSvImL(i1,i3,gt2)
coup2R = cplcChaFeSvImR(i1,i3,gt2)
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


! {Chi, bar[Fe], Fv}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i1,i3,gt2)
coup2R = cplChiFvSvImR(i1,i3,gt2)
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


! {Fe, Chi, Cha}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChaSvImL(i1,i3,gt2)
coup2R = cplcFeChaSvImR(i1,i3,gt2)
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


! {Fv, bar[Cha], Chi}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i3,i1,gt2)
coup2R = cplChiFvSvImR(i3,i1,gt2)
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


! {hh, conj[Se], SvIm}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvImSvIm(i1,gt2,i3)
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


! {hh, conj[Se], SvRe}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
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


! {Hpm, SvIm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
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


! {Hpm, SvRe, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
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


! {Se, Ah, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
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


! {Se, hh, Hpm}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
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


! {Se, VP, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i3)
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


! {Se, VZ, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
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


! {Se, Ah, VWm}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = -cplSvImcSeVWm(gt2,i1)
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


! {Se, hh, VWm}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = -cplSvImcSeVWm(gt2,i1)
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


! {Se, VP, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = -cplSvImcSeVWm(gt2,i1)
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


! {Se, VZ, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = -cplSvImcSeVWm(gt2,i1)
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


! {SvIm, conj[Hpm], Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
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


! {SvIm, conj[VWm], Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
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


! {SvIm, conj[Hpm], hh}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
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


! {SvIm, conj[VWm], hh}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
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


! {SvRe, conj[Hpm], Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
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


! {SvRe, conj[VWm], Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
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


! {SvRe, conj[Hpm], hh}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, conj[VWm], hh}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, conj[Hpm], VZ}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = -cplSvImSvReVZ(gt2,i1)
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


! {SvRe, conj[VWm], VZ}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = -cplSvImSvReVZ(gt2,i1)
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


! {VWm, SvIm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplSvImcSeVWm(i2,gt1)
coup2 = cplSeSvImcVWm(i3,gt2)
coup3 = cplHpmSvImcSe(gt3,i2,i3)
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


! {VWm, SvRe, Se}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplSvRecSeVWm(i2,gt1)
coup2 = cplSeSvImcVWm(i3,gt2)
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
End if 


! {VZ, conj[Se], SvRe}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = -cplSvImSvReVZ(gt2,i3)
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
End if 


! {Ah, conj[Se]}
If ((Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhHpmSvImcSe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhHpmSvImcSe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplHpmSvImSvImcHpm1(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplHpmSvImSvRecHpm1(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplAhHpmSvImcSe1(i1,gt3,i2,gt1)
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
coup1 = cplAhHpmSvRecSe1(i1,gt3,i2,gt1)
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
coup1 = cplhhHpmSvImcSe1(i1,gt3,i2,gt1)
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
coup1 = cplhhHpmSvRecSe1(i1,gt3,i2,gt1)
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


! {Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSecHpmcSe1(gt3,i1,i2,gt1)
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


! {Ah, conj[Hpm]}
If ((Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhHpmSvImcSe1(i1,i2,gt2,gt1)
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
coup1 = cplhhHpmSvImcSe1(i1,i2,gt2,gt1)
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
coup1 = cplSdSvImcSecSuaa(i1,gt2,gt1,i2)
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
coup1 = cplSeSvImSvImcSe1(i1,gt2,i2,gt1)
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
coup1 = cplSeSvImSvRecSe1(i1,gt2,i2,gt1)
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
coup1 = cplSvImcSeVPVWm1(gt2,gt1)
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
coup1 = cplSvImcSeVWmVZ1(gt2,gt1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSvImHpm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSvImHpm(MAh,MCha,MChi,MFe,            & 
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

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvIm(3,6,6),         & 
& cplAhSvImSvRe(3,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcFeChaSvImL(3,2,6),    & 
& cplcFeChaSvImR(3,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),    & 
& cplChiFvSvImR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaFeSvImL(2,3,6),& 
& cplcChaFeSvImR(2,3,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),& 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),& 
& cplAhHpmSvImcSe1(3,2,6,6),cplAhHpmSvRecSe1(3,2,6,6),cplhhHpmSvImcSe1(3,2,6,6),         & 
& cplhhHpmSvRecSe1(3,2,6,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSvImSvImcHpm1(2,6,6,2),      & 
& cplHpmSvImSvRecHpm1(2,6,6,2),cplSdSvImcSecSuaa(6,6,6,6),cplSeSvImSvImcSe1(6,6,6,6),    & 
& cplSeSvImSvRecSe1(6,6,6,6),cplSvImcSeVPVWm1(6,6),cplSvImcSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MHpm(gt3) 


! {Se, VP, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Se, VP, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = -cplSvImcSeVWm(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VP, conj[VWm]}
If ((Include_in_loopVP).and.(Include_in_loopVWm)) Then 
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSvImcSeVPVWm1(gt2,gt1)
coup2 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSvImHpm


Subroutine Amplitude_Tree_seesaw1nmssm_SeToSvReHpm(cplHpmSvRecSe,MHpm,MSe,            & 
& MSvRe,MHpm2,MSe2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSvRe(6),MHpm2(2),MSe2(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplHpmSvRecSe(2,6,6)

Complex(dp) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1 = cplHpmSvRecSe(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_SeToSvReHpm


Subroutine Gamma_Real_seesaw1nmssm_SeToSvReHpm(MLambda,em,gs,cplHpmSvRecSe,           & 
& MHpm,MSe,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplHpmSvRecSe(2,6,6)

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSvRe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,2), GammarealGluon(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=2,2
Coup = cplHpmSvRecSe(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MSvRe(i2)
Mex3 = MHpm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_SeToSvReHpm


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSvReHpm(cplHpmSvRecSe,ctcplHpmSvRecSe,     & 
& MHpm,MHpm2,MSe,MSe2,MSvRe,MSvRe2,ZfHpm,ZfSe,ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MSe(6),MSe2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplHpmSvRecSe(2,6,6)

Complex(dp), Intent(in) :: ctcplHpmSvRecSe(2,6,6)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfSe(6,6),ZfSvRe(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplHpmSvRecSe(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplHpmSvRecSe(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt2)*cplHpmSvRecSe(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHpm(i1,gt3)*cplHpmSvRecSe(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSvReHpm


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSvReHpm(MAh,MCha,MChi,MFe,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,               & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,             & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,         & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,         & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,        & 
& cplHpmcVWmVZ,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,        & 
& cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,             & 
& cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvRe(3,6,6),         & 
& cplAhSvReSvRe(3,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcFeChaSvReL(3,2,6),    & 
& cplcFeChaSvReR(3,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaFeSvReL(2,3,6),& 
& cplcChaFeSvReR(2,3,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),         & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),& 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),& 
& cplAhHpmSvImcSe1(3,2,6,6),cplAhHpmSvRecSe1(3,2,6,6),cplhhHpmSvImcSe1(3,2,6,6),         & 
& cplhhHpmSvRecSe1(3,2,6,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSvImSvRecHpm1(2,6,6,2),      & 
& cplHpmSvReSvRecHpm1(2,6,6,2),cplSdSvRecSecSuaa(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),    & 
& cplSeSvReSvRecSe1(6,6,6,6),cplSvRecSeVPVWm1(6,6),cplSvRecSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, conj[Se], SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
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


! {Ah, conj[Se], SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
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


! {Cha, Fv, Fe}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i1,i3,gt2)
coup2R = cplcChaFeSvReR(i1,i3,gt2)
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


! {Chi, bar[Fe], Fv}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,i3,gt2)
coup2R = cplChiFvSvReR(i1,i3,gt2)
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


! {Fe, Chi, Cha}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChaSvReL(i1,i3,gt2)
coup2R = cplcFeChaSvReR(i1,i3,gt2)
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


! {Fv, bar[Cha], Chi}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i3,i1,gt2)
coup2R = cplChiFvSvReR(i3,i1,gt2)
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


! {hh, conj[Se], SvIm}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
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


! {hh, conj[Se], SvRe}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
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


! {Hpm, SvIm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
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


! {Hpm, SvRe, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
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


! {Se, Ah, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
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


! {Se, hh, Hpm}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
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


! {Se, VP, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i3)
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


! {Se, VZ, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
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


! {Se, Ah, VWm}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = -cplSvRecSeVWm(gt2,i1)
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


! {Se, hh, VWm}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = -cplSvRecSeVWm(gt2,i1)
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


! {Se, VP, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = -cplSvRecSeVWm(gt2,i1)
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


! {Se, VZ, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = -cplSvRecSeVWm(gt2,i1)
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


! {SvIm, conj[Hpm], Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
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


! {SvIm, conj[VWm], Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
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


! {SvIm, conj[Hpm], hh}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
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


! {SvIm, conj[VWm], hh}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
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


! {SvIm, conj[Hpm], VZ}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplSvImSvReVZ(i1,gt2)
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


! {SvIm, conj[VWm], VZ}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplSvImSvReVZ(i1,gt2)
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


! {SvRe, conj[Hpm], Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
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


! {SvRe, conj[VWm], Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
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


! {SvRe, conj[Hpm], hh}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {SvRe, conj[VWm], hh}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {VWm, SvIm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplSvImcSeVWm(i2,gt1)
coup2 = cplSeSvRecVWm(i3,gt2)
coup3 = cplHpmSvImcSe(gt3,i2,i3)
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


! {VWm, SvRe, Se}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplSvRecSeVWm(i2,gt1)
coup2 = cplSeSvRecVWm(i3,gt2)
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
End if 


! {VZ, conj[Se], SvIm}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = cplSvImSvReVZ(i3,gt2)
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
End if 


! {Ah, conj[Se]}
If ((Include_in_loopAh).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhHpmSvRecSe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhHpmSvRecSe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplHpmSvImSvRecHpm1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplHpmSvReSvRecHpm1(gt3,gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplAhHpmSvImcSe1(i1,gt3,i2,gt1)
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
coup1 = cplAhHpmSvRecSe1(i1,gt3,i2,gt1)
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
coup1 = cplhhHpmSvImcSe1(i1,gt3,i2,gt1)
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
coup1 = cplhhHpmSvRecSe1(i1,gt3,i2,gt1)
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


! {Se, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSecHpmcSe1(gt3,i1,i2,gt1)
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


! {Ah, conj[Hpm]}
If ((Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,3
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhHpmSvRecSe1(i1,i2,gt2,gt1)
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
coup1 = cplhhHpmSvRecSe1(i1,i2,gt2,gt1)
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
coup1 = cplSdSvRecSecSuaa(i1,gt2,gt1,i2)
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
coup1 = cplSeSvImSvRecSe1(i1,i2,gt2,gt1)
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
coup1 = cplSeSvReSvRecSe1(i1,gt2,i2,gt1)
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
coup1 = cplSvRecSeVPVWm1(gt2,gt1)
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
coup1 = cplSvRecSeVWmVZ1(gt2,gt1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSvReHpm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSvReHpm(MAh,MCha,MChi,MFe,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,               & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,             & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,         & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,         & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,        & 
& cplHpmcVWmVZ,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,          & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,        & 
& cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,             & 
& cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),              & 
& Mhh2(3),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSecSe(3,6,6),cplAhSvImSvRe(3,6,6),         & 
& cplAhSvReSvRe(3,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcFeChaSvReL(3,2,6),    & 
& cplcFeChaSvReR(3,2,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaFeSvReL(2,3,6),& 
& cplcChaFeSvReR(2,3,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplhhHpmcHpm(3,2,2),     & 
& cplhhHpmcVWm(3,2),cplhhSecSe(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),         & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),& 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),& 
& cplAhHpmSvImcSe1(3,2,6,6),cplAhHpmSvRecSe1(3,2,6,6),cplhhHpmSvImcSe1(3,2,6,6),         & 
& cplhhHpmSvRecSe1(3,2,6,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSvImSvRecHpm1(2,6,6,2),      & 
& cplHpmSvReSvRecHpm1(2,6,6,2),cplSdSvRecSecSuaa(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),    & 
& cplSeSvReSvRecSe1(6,6,6,6),cplSvRecSeVPVWm1(6,6),cplSvRecSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MHpm(gt3) 


! {Se, VP, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Se, VP, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = -cplSvRecSeVWm(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VP, conj[VWm]}
If ((Include_in_loopVP).and.(Include_in_loopVWm)) Then 
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSvRecSeVPVWm1(gt2,gt1)
coup2 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSvReHpm


Subroutine Amplitude_Tree_seesaw1nmssm_SeToSeVZ(cplSecSeVZ,MSe,MVZ,MSe2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MVZ,MSe2(6),MVZ2

Complex(dp), Intent(in) :: cplSecSeVZ(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplSecSeVZ(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_SeToSeVZ


Subroutine Gamma_Real_seesaw1nmssm_SeToSeVZ(MLambda,em,gs,cplSecSeVZ,MSe,             & 
& MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSecSeVZ(6,6)

Real(dp), Intent(in) :: MSe(6),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSecSeVZ(i2,i1)
Mex1 = MSe(i1)
Mex2 = MSe(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,-1._dp,-1._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_SeToSeVZ


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSeVZ(cplSecSeVP,cplSecSeVZ,ctcplSecSeVP,   & 
& ctcplSecSeVZ,MSe,MSe2,MVP,MVP2,MVZ,MVZ2,ZfSe,ZfVPVZ,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplSecSeVP(6,6),cplSecSeVZ(6,6)

Complex(dp), Intent(in) :: ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6)

Complex(dp), Intent(in) :: ZfSe(6,6),ZfVPVZ,ZfVZ

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSecSeVZ(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplSecSeVZ(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplSecSeVZ(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZ*cplSecSeVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplSecSeVZ(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSeVZ


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,          & 
& cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSecSeVPVZ1,cplSecSeVZVZ1,            & 
& cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cplAhSecSe(3,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),cplChiChiVZR(5,5),             & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),       & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcChaFvSeL(2,6,6), & 
& cplcChaFvSeR(2,6,6),cplhhSecSe(3,6,6),cplhhVZVZ(3),cplHpmSvImcSe(2,6,6),               & 
& cplHpmSvRecSe(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,6,2),           & 
& cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),            & 
& cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),              & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSeSvImcVWmVZ1(6,6),cplSeSvRecVWmVZ1(6,6),              & 
& cplSecSeVPVZ1(6,6),cplSecSeVZVZ1(6,6),cplSvImcSeVWmVZ1(6,6),cplSvRecSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZ 


! {Ah, conj[Se], conj[Se]}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
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
End if 


! {Cha, Fv, Fv}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFvSeL(i1,i3,gt2)
coup2R = cplcChaFvSeR(i1,i3,gt2)
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


! {Chi, bar[Fe], bar[Fe]}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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
End if 


! {Fe, Chi, Chi}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopChi)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,5
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,i3,gt2)
coup2R = cplcFeChiSeR(i1,i3,gt2)
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


! {Fv, bar[Cha], bar[Cha]}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplcChaFvSeL(i3,i1,gt2)
coup2R = cplcChaFvSeR(i3,i1,gt2)
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
End if 


! {hh, conj[Se], conj[Se]}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
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
End if 


! {Hpm, SvRe, SvIm}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplSeSvImcHpm(gt2,i3,i1)
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


! {Hpm, SvIm, SvRe}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplSeSvRecHpm(gt2,i3,i1)
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


! {Se, hh, Ah}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, Ah, hh}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, VZ, hh}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, hh, VZ}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplSecSeVZ(gt2,i1)
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


! {SvIm, conj[Hpm], conj[Hpm]}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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
End if 


! {SvIm, conj[VWm], conj[Hpm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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


! {SvIm, conj[Hpm], conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplSeSvImcVWm(gt2,i1)
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


! {SvIm, conj[VWm], conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplSeSvImcVWm(gt2,i1)
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


! {SvRe, conj[Hpm], conj[Hpm]}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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
End if 


! {SvRe, conj[VWm], conj[Hpm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
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
End if 


! {SvRe, conj[Hpm], conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplSeSvRecVWm(gt2,i1)
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


! {SvRe, conj[VWm], conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplSeSvRecVWm(gt2,i1)
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


! {VP, conj[Se], conj[Se]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
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
End if 


! {VWm, SvRe, SvIm}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopSvIm)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplSvRecSeVWm(i2,gt1)
coup2 = cplSeSvImcVWm(gt2,i3)
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
End if 


! {VWm, SvIm, SvRe}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopSvRe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1 = cplSvImcSeVWm(i2,gt1)
coup2 = cplSeSvRecVWm(gt2,i3)
coup3 = -cplSvImSvReVZ(i2,i3)
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


! {VZ, conj[Se], conj[Se]}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = cplSecSeVZ(gt2,i3)
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
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VZ}
If ((Include_in_loopSe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = -cplSecSeVZ(i1,gt1)
coup2 = cplSecSeVZVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {SvIm, conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
coup1 = -cplSvImcSeVWm(i1,gt1)
coup2 = cplSeSvImcVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {SvRe, conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
coup1 = -cplSvRecSeVWm(i1,gt1)
coup2 = cplSeSvRecVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVZ1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Se, VZ}
If ((Include_in_loopSe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = cplSecSeVZVZ1(i1,gt1)
coup2 = cplSecSeVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {SvIm, conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
coup1 = cplSvImcSeVWmVZ1(i1,gt1)
coup2 = cplSeSvImcVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {SvRe, conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
coup1 = cplSvRecSeVWmVZ1(i1,gt1)
coup2 = cplSeSvRecVWm(gt2,i1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSeVZ


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSeVZ(MAh,MCha,MChi,MFe,               & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,            & 
& cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,       & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVZVZ,cplHpmSvImcSe,               & 
& cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSecSeVPVZ1,             & 
& cplSecSeVZVZ1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cplAhSecSe(3,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),cplChiChiVZR(5,5),             & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),       & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcChaFvSeL(2,6,6), & 
& cplcChaFvSeR(2,6,6),cplhhSecSe(3,6,6),cplhhVZVZ(3),cplHpmSvImcSe(2,6,6),               & 
& cplHpmSvRecSe(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSeSvImcHpm(6,6,2),           & 
& cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),            & 
& cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),              & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSeSvImcVWmVZ1(6,6),cplSeSvRecVWmVZ1(6,6),              & 
& cplSecSeVPVZ1(6,6),cplSecSeVZVZ1(6,6),cplSvImcSeVWmVZ1(6,6),cplSvRecSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZ 


! {VP, conj[Se], conj[Se]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
coup3 = cplSecSeVZ(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVZ1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSeVZ


Subroutine Amplitude_Tree_seesaw1nmssm_SeToSvImVWm(cplSvImcSeVWm,MSe,MSvIm,           & 
& MVWm,MSe2,MSvIm2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSvIm(6),MVWm,MSe2(6),MSvIm2(6),MVWm2

Complex(dp), Intent(in) :: cplSvImcSeVWm(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = -cplSvImcSeVWm(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_SeToSvImVWm


Subroutine Gamma_Real_seesaw1nmssm_SeToSvImVWm(MLambda,em,gs,cplSvImcSeVWm,           & 
& MSe,MSvIm,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSvImcSeVWm(6,6)

Real(dp), Intent(in) :: MSe(6),MSvIm(6),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSvImcSeVWm(i2,i1)
Mex1 = MSe(i1)
Mex2 = MSvIm(i2)
Mex3 = MVWm
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,-1._dp,0._dp,-1._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_SeToSvImVWm


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSvImVWm(cplSvImcSeVWm,ctcplSvImcSeVWm,     & 
& MSe,MSe2,MSvIm,MSvIm2,MVWm,MVWm2,ZfSe,ZfSvIm,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplSvImcSeVWm(6,6)

Complex(dp), Intent(in) :: ctcplSvImcSeVWm(6,6)

Complex(dp), Intent(in) :: ZfSe(6,6),ZfSvIm(6,6),ZfVWm

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSvImcSeVWm(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplSvImcSeVWm(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvIm(i1,gt2)*cplSvImcSeVWm(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplSvImcSeVWm(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSvImVWm


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSvImVWm(MAh,MCha,MChi,MFe,               & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,           & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhcHpmVWm(3,2),        & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),   & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),   & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhSecSe(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvImSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmSvImcSe(2,6,6),           & 
& cplHpmSvRecSe(2,6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSecSeVP(6,6),          & 
& cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),              & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSecSecVWmVWm1(6,6),       & 
& cplSvImSvImcVWmVWm1(6,6),cplSvImcSeVPVWm1(6,6),cplSvImcSeVWmVZ1(6,6),cplSvRecSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MVWm 


! {Ah, conj[Se], SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvImSvIm(i1,gt2,i3)
coup3 = cplSvImcSeVWm(i3,i2)
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


! {Ah, conj[Se], SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvImSvRe(i1,gt2,i3)
coup3 = cplSvRecSeVWm(i3,i2)
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


! {Cha, Fv, Fe}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFeSvImL(i1,i3,gt2)
coup2R = cplcChaFeSvImR(i1,i3,gt2)
coup3L = -cplcFeFvVWmR(i3,i2)
coup3R = -cplcFeFvVWmL(i3,i2)
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


! {Chi, bar[Fe], Fv}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i1,i3,gt2)
coup2R = cplChiFvSvImR(i1,i3,gt2)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
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


! {Fe, Chi, Cha}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChaSvImL(i1,i3,gt2)
coup2R = cplcFeChaSvImR(i1,i3,gt2)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
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


! {Fv, bar[Cha], Chi}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplChiFvSvImL(i3,i1,gt2)
coup2R = cplChiFvSvImR(i3,i1,gt2)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
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


! {hh, conj[Se], SvIm}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvImSvIm(i1,gt2,i3)
coup3 = cplSvImcSeVWm(i3,i2)
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


! {hh, conj[Se], SvRe}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvImSvRe(i1,gt2,i3)
coup3 = cplSvRecSeVWm(i3,i2)
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


! {Hpm, SvIm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
coup3 = -cplSvImcSeVWm(i2,i3)
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


! {Hpm, SvRe, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplSeSvImcHpm(i3,gt2,i1)
coup3 = -cplSvRecSeVWm(i2,i3)
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


! {Se, Ah, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = -cplAhcHpmVWm(i2,i3)
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


! {Se, hh, Hpm}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = -cplhhcHpmVWm(i2,i3)
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


! {Se, VP, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
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
End if 


! {Se, VZ, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSecSeVZ(i1,gt1)
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
End if 


! {Se, hh, VWm}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplSvImcSeVWm(gt2,i1)
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


! {Se, VP, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplSvImcSeVWm(gt2,i1)
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


! {Se, VZ, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplSvImcSeVWm(gt2,i1)
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


! {SvIm, conj[Hpm], Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplAhSvImSvIm(i3,gt2,i1)
coup3 = cplAhcHpmVWm(i3,i2)
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


! {SvIm, conj[Hpm], hh}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
coup3 = cplhhcHpmVWm(i3,i2)
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


! {SvIm, conj[VWm], hh}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplhhSvImSvIm(i3,gt2,i1)
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


! {SvRe, conj[Hpm], Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplAhSvImSvRe(i3,gt2,i1)
coup3 = cplAhcHpmVWm(i3,i2)
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


! {SvRe, conj[Hpm], hh}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
coup3 = cplhhcHpmVWm(i3,i2)
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


! {SvRe, conj[VWm], hh}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplhhSvImSvRe(i3,gt2,i1)
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


! {SvRe, conj[Hpm], VZ}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplSvImSvReVZ(gt2,i1)
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


! {SvRe, conj[VWm], VZ}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplSvImSvReVZ(gt2,i1)
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


! {VWm, SvIm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplSvImcSeVWm(i2,gt1)
coup2 = -cplSeSvImcVWm(i3,gt2)
coup3 = -cplSvImcSeVWm(i2,i3)
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


! {VWm, SvRe, Se}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplSvRecSeVWm(i2,gt1)
coup2 = -cplSeSvImcVWm(i3,gt2)
coup3 = -cplSvRecSeVWm(i2,i3)
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


! {VZ, conj[Se], SvRe}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = cplSvImSvReVZ(gt2,i3)
coup3 = cplSvRecSeVWm(i3,i2)
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


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSvImcSeVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VZ}
If ((Include_in_loopSe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = -cplSecSeVZ(i1,gt1)
coup2 = cplSvImcSeVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {SvIm, conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
coup1 = -cplSvImcSeVWm(i1,gt1)
coup2 = cplSvImSvImcVWmVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSecSecVWmVWm1(i1,gt1)
coup2 = cplSvImcSeVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {SvRe, VZ}
If ((Include_in_loopSvRe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVZ 
coup1 = cplSvRecSeVWmVZ1(i1,gt1)
coup2 = cplSvImSvReVZ(gt2,i1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSvImVWm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSvImVWm(MAh,MCha,MChi,MFe,            & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,           & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhcHpmVWm(3,2),        & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),   & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),   & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhSecSe(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvImSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmSvImcSe(2,6,6),           & 
& cplHpmSvRecSe(2,6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSecSeVP(6,6),          & 
& cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),              & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSecSecVWmVWm1(6,6),       & 
& cplSvImSvImcVWmVWm1(6,6),cplSvImcSeVPVWm1(6,6),cplSvImcSeVWmVZ1(6,6),cplSvRecSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvIm(gt2) 
Mex3 = MVWm 


! {Se, VP, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplHpmSvImcSe(i3,gt2,i1)
coup3 = cplcHpmVPVWm(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Se, VP, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplSvImcSeVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSvImcSeVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSvImVWm


Subroutine Amplitude_Tree_seesaw1nmssm_SeToSvReVWm(cplSvRecSeVWm,MSe,MSvRe,           & 
& MVWm,MSe2,MSvRe2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSvRe(6),MVWm,MSe2(6),MSvRe2(6),MVWm2

Complex(dp), Intent(in) :: cplSvRecSeVWm(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = -cplSvRecSeVWm(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_seesaw1nmssm_SeToSvReVWm


Subroutine Gamma_Real_seesaw1nmssm_SeToSvReVWm(MLambda,em,gs,cplSvRecSeVWm,           & 
& MSe,MSvRe,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSvRecSeVWm(6,6)

Real(dp), Intent(in) :: MSe(6),MSvRe(6),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSvRecSeVWm(i2,i1)
Mex1 = MSe(i1)
Mex2 = MSvRe(i2)
Mex3 = MVWm
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,-1._dp,0._dp,-1._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_seesaw1nmssm_SeToSvReVWm


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSvReVWm(cplSvRecSeVWm,ctcplSvRecSeVWm,     & 
& MSe,MSe2,MSvRe,MSvRe2,MVWm,MVWm2,ZfSe,ZfSvRe,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MSvRe(6),MSvRe2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplSvRecSeVWm(6,6)

Complex(dp), Intent(in) :: ctcplSvRecSeVWm(6,6)

Complex(dp), Intent(in) :: ZfSe(6,6),ZfSvRe(6,6),ZfVWm

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSvRecSeVWm(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplSvRecSeVWm(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSvRe(i1,gt2)*cplSvRecSeVWm(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplSvRecSeVWm(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSvReVWm


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSvReVWm(MAh,MCha,MChi,MFe,               & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImcSeVWmVZ1,              & 
& cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),        & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),   & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),     & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),   & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhSecSe(3,6,6),cplhhSvImSvRe(3,6,6),            & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmSvImcSe(2,6,6),           & 
& cplHpmSvRecSe(2,6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),          & 
& cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),              & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSecSecVWmVWm1(6,6),       & 
& cplSvImcSeVWmVZ1(6,6),cplSvReSvRecVWmVWm1(6,6),cplSvRecSeVPVWm1(6,6),cplSvRecSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVWm 


! {Ah, conj[Se], SvIm}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvImSvRe(i1,i3,gt2)
coup3 = cplSvImcSeVWm(i3,i2)
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


! {Ah, conj[Se], SvRe}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvReSvRe(i1,gt2,i3)
coup3 = cplSvRecSeVWm(i3,i2)
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


! {Cha, Fv, Fe}
If ((Include_in_loopCha).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvChacSeL(i2,i1,gt1)
coup1R = cplFvChacSeR(i2,i1,gt1)
coup2L = cplcChaFeSvReL(i1,i3,gt2)
coup2R = cplcChaFeSvReR(i1,i3,gt2)
coup3L = -cplcFeFvVWmR(i3,i2)
coup3R = -cplcFeFvVWmL(i3,i2)
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


! {Chi, bar[Fe], Fv}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i1,i3,gt2)
coup2R = cplChiFvSvReR(i1,i3,gt2)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
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


! {Fe, Chi, Cha}
If ((Include_in_loopFe).and.(Include_in_loopChi).and.(Include_in_loopCha)) Then 
Do i1=1,3
  Do i2=1,5
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChaSvReL(i1,i3,gt2)
coup2R = cplcFeChaSvReR(i1,i3,gt2)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
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


! {Fv, bar[Cha], Chi}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopChi)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,5
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplChiFvSvReL(i3,i1,gt2)
coup2R = cplChiFvSvReR(i3,i1,gt2)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
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


! {hh, conj[Se], SvIm}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvImSvRe(i1,i3,gt2)
coup3 = cplSvImcSeVWm(i3,i2)
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


! {hh, conj[Se], SvRe}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSvRe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvReSvRe(i1,gt2,i3)
coup3 = cplSvRecSeVWm(i3,i2)
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


! {Hpm, SvIm, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvImcSe(i1,i2,gt1)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = -cplSvImcSeVWm(i2,i3)
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


! {Hpm, SvRe, Se}
If ((Include_in_loopHpm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplHpmSvRecSe(i1,i2,gt1)
coup2 = cplSeSvRecHpm(i3,gt2,i1)
coup3 = -cplSvRecSeVWm(i2,i3)
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


! {Se, Ah, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopAh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = -cplAhcHpmVWm(i2,i3)
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


! {Se, hh, Hpm}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = -cplhhcHpmVWm(i2,i3)
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


! {Se, VP, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
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
End if 


! {Se, VZ, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSecSeVZ(i1,gt1)
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
End if 


! {Se, hh, VWm}
If ((Include_in_loopSe).and.(Include_in_loophh).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,3
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplSvRecSeVWm(gt2,i1)
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


! {Se, VP, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplSvRecSeVWm(gt2,i1)
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


! {Se, VZ, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVZ).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplSvRecSeVWm(gt2,i1)
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


! {SvIm, conj[Hpm], Ah}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplAhSvImSvRe(i3,i1,gt2)
coup3 = cplAhcHpmVWm(i3,i2)
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


! {SvIm, conj[Hpm], hh}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
coup3 = cplhhcHpmVWm(i3,i2)
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


! {SvIm, conj[VWm], hh}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplhhSvImSvRe(i3,i1,gt2)
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


! {SvIm, conj[Hpm], VZ}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = -cplSvImSvReVZ(i1,gt2)
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


! {SvIm, conj[VWm], VZ}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = -cplSvImSvReVZ(i1,gt2)
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


! {SvRe, conj[Hpm], Ah}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplAhSvReSvRe(i3,gt2,i1)
coup3 = cplAhcHpmVWm(i3,i2)
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


! {SvRe, conj[Hpm], hh}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
coup3 = cplhhcHpmVWm(i3,i2)
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


! {SvRe, conj[VWm], hh}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplhhSvReSvRe(i3,gt2,i1)
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


! {VWm, SvIm, Se}
If ((Include_in_loopVWm).and.(Include_in_loopSvIm).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1 = cplSvImcSeVWm(i2,gt1)
coup2 = -cplSeSvRecVWm(i3,gt2)
coup3 = -cplSvImcSeVWm(i2,i3)
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


! {VWm, SvRe, Se}
If ((Include_in_loopVWm).and.(Include_in_loopSvRe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1 = cplSvRecSeVWm(i2,gt1)
coup2 = -cplSeSvRecVWm(i3,gt2)
coup3 = -cplSvRecSeVWm(i2,i3)
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


! {VZ, conj[Se], SvIm}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopSvIm)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = -cplSvImSvReVZ(i3,gt2)
coup3 = cplSvImcSeVWm(i3,i2)
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


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSvRecSeVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VZ}
If ((Include_in_loopSe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = -cplSecSeVZ(i1,gt1)
coup2 = cplSvRecSeVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {SvRe, conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
coup1 = -cplSvRecSeVWm(i1,gt1)
coup2 = cplSvReSvRecVWmVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSecSecVWmVWm1(i1,gt1)
coup2 = cplSvRecSeVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {SvIm, VZ}
If ((Include_in_loopSvIm).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVZ 
coup1 = cplSvImcSeVWmVZ1(i1,gt1)
coup2 = -cplSvImSvReVZ(i1,gt2)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSvReVWm


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSvReVWm(MAh,MCha,MChi,MFe,            & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,       & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImcSeVWmVZ1,              & 
& cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplAhcHpmVWm(3,2),        & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),   & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),     & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),   & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhSecSe(3,6,6),cplhhSvImSvRe(3,6,6),            & 
& cplhhSvReSvRe(3,6,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplHpmSvImcSe(2,6,6),           & 
& cplHpmSvRecSe(2,6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),          & 
& cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),              & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSecSecVWmVWm1(6,6),       & 
& cplSvImcSeVWmVZ1(6,6),cplSvReSvRecVWmVWm1(6,6),cplSvRecSeVPVWm1(6,6),cplSvRecSeVWmVZ1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSvRe(gt2) 
Mex3 = MVWm 


! {Se, VP, Hpm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplHpmSvRecSe(i3,gt2,i1)
coup3 = cplcHpmVPVWm(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Se, VP, VWm}
If ((Include_in_loopSe).and.(Include_in_loopVP).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplSvRecSeVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSvRecSeVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSvReVWm


Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSeVP(cplSecSeVP,cplSecSeVZ,ctcplSecSeVP,   & 
& ctcplSecSeVZ,MSe,MSe2,MVP,MVP2,ZfSe,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MVP,MVP2

Complex(dp), Intent(in) :: cplSecSeVP(6,6),cplSecSeVZ(6,6)

Complex(dp), Intent(in) :: ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6)

Complex(dp), Intent(in) :: ZfSe(6,6),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplSecSeVP(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplSecSeVP(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplSecSeVZ(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_seesaw1nmssm_SeToSeVP


Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSeVP(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,            & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSecSeVPVP1,cplSecSeVPVZ1,            & 
& cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChaVPL(2,2),         & 
& cplcChaChaVPR(2,2),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplcFeChiSeL(3,5,6),        & 
& cplcFeChiSeR(3,5,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcChaFvSeL(2,6,6),             & 
& cplcChaFvSeR(2,6,6),cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),       & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),             & 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),               & 
& cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplSeSvImcVWmVP1(6,6),& 
& cplSeSvRecVWmVP1(6,6),cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),cplSvImcSeVPVWm1(6,6),     & 
& cplSvRecSeVPVWm1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVP 


! {Ah, conj[Se], conj[Se]}
If ((Include_in_loopAh).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
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
End if 


! {Chi, bar[Fe], bar[Fe]}
If ((Include_in_loopChi).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,5
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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
End if 


! {Fv, bar[Cha], bar[Cha]}
If ((Include_in_loopFv).and.(Include_in_loopCha).and.(Include_in_loopCha)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(i1,i2,gt1)
coup1R = cplFvChacSeR(i1,i2,gt1)
coup2L = cplcChaFvSeL(i3,i1,gt2)
coup2R = cplcChaFvSeR(i3,i1,gt2)
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
End if 


! {hh, conj[Se], conj[Se]}
If ((Include_in_loophh).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
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
End if 


! {SvIm, conj[Hpm], conj[Hpm]}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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
End if 


! {SvIm, conj[VWm], conj[Hpm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplSeSvImcHpm(gt2,i1,i3)
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


! {SvIm, conj[Hpm], conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvIm(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvImcSe(i2,i1,gt1)
coup2 = cplSeSvImcVWm(gt2,i1)
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


! {SvIm, conj[VWm], conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvImcSeVWm(i1,gt1)
coup2 = cplSeSvImcVWm(gt2,i1)
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


! {SvRe, conj[Hpm], conj[Hpm]}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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
End if 


! {SvRe, conj[VWm], conj[Hpm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopHpm)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplSeSvRecHpm(gt2,i1,i3)
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


! {SvRe, conj[Hpm], conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopHpm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MSvRe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvRecSe(i2,i1,gt1)
coup2 = cplSeSvRecVWm(gt2,i1)
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


! {SvRe, conj[VWm], conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvRecSeVWm(i1,gt1)
coup2 = cplSeSvRecVWm(gt2,i1)
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


! {VP, conj[Se], conj[Se]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
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
End if 


! {VZ, conj[Se], conj[Se]}
If ((Include_in_loopVZ).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = cplSecSeVZ(gt2,i3)
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
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VZ}
If ((Include_in_loopSe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = -cplSecSeVZ(i1,gt1)
coup2 = cplSecSeVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {SvIm, conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
coup1 = -cplSvImcSeVWm(i1,gt1)
coup2 = cplSeSvImcVWmVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {SvRe, conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
coup1 = -cplSvRecSeVWm(i1,gt1)
coup2 = cplSeSvRecVWmVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVP1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Se, VZ}
If ((Include_in_loopSe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = cplSecSeVPVZ1(i1,gt1)
coup2 = cplSecSeVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {SvIm, conj[VWm]}
If ((Include_in_loopSvIm).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvIm(i1) 
ML2 = MVWm 
coup1 = cplSvImcSeVPVWm1(i1,gt1)
coup2 = cplSeSvImcVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {SvRe, conj[VWm]}
If ((Include_in_loopSvRe).and.(Include_in_loopVWm)) Then 
Do i1=1,6
ML1 = MSvRe(i1) 
ML2 = MVWm 
coup1 = cplSvRecSeVPVWm1(i1,gt1)
coup2 = cplSeSvRecVWm(gt2,i1)
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
End Subroutine Amplitude_VERTEX_seesaw1nmssm_SeToSeVP


Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSeVP(MAh,MCha,MChi,MFe,               & 
& MFv,Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,         & 
& cplcChaChaVPL,cplcChaChaVPR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,            & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSecSeVPVP1,cplSecSeVPVZ1,            & 
& cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(3),MCha(2),MChi(5),MFe(3),MFv(6),Mhh(3),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MAh2(3),MCha2(2),MChi2(5),MFe2(3),MFv2(6),Mhh2(3),MHpm2(2),               & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhSecSe(3,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChaVPL(2,2),         & 
& cplcChaChaVPR(2,2),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplcFeChiSeL(3,5,6),        & 
& cplcFeChiSeR(3,5,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcChaFvSeL(2,6,6),             & 
& cplcChaFvSeR(2,6,6),cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),       & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),             & 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),               & 
& cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplSeSvImcVWmVP1(6,6),& 
& cplSeSvRecVWmVP1(6,6),cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),cplSvImcSeVPVWm1(6,6),     & 
& cplSvRecSeVPVWm1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVP 


! {VP, conj[Se], conj[Se]}
If ((Include_in_loopVP).and.(Include_in_loopSe).and.(Include_in_loopSe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
coup3 = cplSecSeVP(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Se, VP}
If ((Include_in_loopSe).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVP1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_seesaw1nmssm_SeToSeVP



End Module OneLoopDecay_Se_seesaw1nmssm
