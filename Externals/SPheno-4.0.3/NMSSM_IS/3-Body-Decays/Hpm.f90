! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:21 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module Hpm3Decays_NInvSeesaw 
 
Use Control 
Use Settings 
Use CouplingsForDecays_NInvSeesaw 
Use ThreeBodyPhaseSpaceS 
 
Contains 
 
Subroutine HpmThreeBodyDecay(n_in,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,            & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gHpmAhChaChi,gHpmAhFdcFu,gHpmAhFeFv,         & 
& gHpmChaChacHpm,gHpmhhChaChi,gHpmFdChacSd,gHpmChaFecSe,gHpmcSuChaFu,gHpmSvImChaFv,      & 
& gHpmSvReChaFv,gHpmHpmChacCha,gHpmSdChacFd,gHpmSeChacFe,gHpmcFuChaSu,gHpmHpmChiChi,     & 
& gHpmcSuChiFd,gHpmSvImChiFe,gHpmSvReChiFe,gHpmSeChiFv,gHpmSdChicFu,gHpmcSuFdGlu,        & 
& gHpmhhFdcFu,gHpmHpmFdcFd,gHpmFeFecHpm,gHpmhhFeFv,gHpmHpmFecFe,gHpmSeFecCha,            & 
& gHpmHpmFvFv,gHpmHpmFucFu,gHpmSdGlucFu,epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),              & 
& MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),ZVR(9,9),ZW(2,2)

Complex(dp) :: cplAhcHpmVWm(3,2),cplAhHpmcHpm(3,2,2),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),      & 
& cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),   & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),     & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9), & 
& cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),   & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),       & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),             & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),       & 
& cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),             & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),     & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),           & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),       & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),           & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),       & 
& cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),               & 
& cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplGluFdcSdL(3,6), & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVWm(3,2),               & 
& cplhhHpmcHpm(3,2,2),cplHpmcHpmVZ(2,2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),        & 
& cplSeSvRecHpm(6,9,2)

Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(inout) :: gHpmAhChaChi(2,3,2,5),gHpmAhFdcFu(2,3,3,3),gHpmAhFeFv(2,3,3,9),gHpmChaChacHpm(2,2,2,2),& 
& gHpmhhChaChi(2,3,2,5),gHpmFdChacSd(2,3,2,6),gHpmChaFecSe(2,2,3,6),gHpmcSuChaFu(2,6,2,3),& 
& gHpmSvImChaFv(2,9,2,9),gHpmSvReChaFv(2,9,2,9),gHpmHpmChacCha(2,2,2,2),gHpmSdChacFd(2,6,2,3),& 
& gHpmSeChacFe(2,6,2,3),gHpmcFuChaSu(2,3,2,6),gHpmHpmChiChi(2,2,5,5),gHpmcSuChiFd(2,6,5,3),& 
& gHpmSvImChiFe(2,9,5,3),gHpmSvReChiFe(2,9,5,3),gHpmSeChiFv(2,6,5,9),gHpmSdChicFu(2,6,5,3),& 
& gHpmcSuFdGlu(2,6,3,1),gHpmhhFdcFu(2,3,3,3),gHpmHpmFdcFd(2,2,3,3),gHpmFeFecHpm(2,3,3,2),& 
& gHpmhhFeFv(2,3,3,9),gHpmHpmFecFe(2,2,3,3),gHpmSeFecCha(2,6,3,2),gHpmHpmFvFv(2,2,9,9),  & 
& gHpmHpmFucFu(2,2,3,3),gHpmSdGlucFu(2,6,1,3)

Real(dp) :: gHpmAhChaChii(3,2,5),gHpmAhFdcFui(3,3,3),gHpmAhFeFvi(3,3,9),gHpmChaChacHpmi(2,2,2),   & 
& gHpmhhChaChii(3,2,5),gHpmFdChacSdi(3,2,6),gHpmChaFecSei(2,3,6),gHpmcSuChaFui(6,2,3),   & 
& gHpmSvImChaFvi(9,2,9),gHpmSvReChaFvi(9,2,9),gHpmHpmChacChai(2,2,2),gHpmSdChacFdi(6,2,3),& 
& gHpmSeChacFei(6,2,3),gHpmcFuChaSui(3,2,6),gHpmHpmChiChii(2,5,5),gHpmcSuChiFdi(6,5,3),  & 
& gHpmSvImChiFei(9,5,3),gHpmSvReChiFei(9,5,3),gHpmSeChiFvi(6,5,9),gHpmSdChicFui(6,5,3),  & 
& gHpmcSuFdGlui(6,3,1),gHpmhhFdcFui(3,3,3),gHpmHpmFdcFdi(2,3,3),gHpmFeFecHpmi(3,3,2),    & 
& gHpmhhFeFvi(3,3,9),gHpmHpmFecFei(2,3,3),gHpmSeFecChai(6,3,2),gHpmHpmFvFvi(2,9,9),      & 
& gHpmHpmFucFui(2,3,3),gHpmSdGlucFui(6,1,3)

Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'HpmThreeBodyDecay' 
 

 
If (CheckRealStates) Then 
Else 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 2 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 2) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,2) = ',n_in,2 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Hpm_decays_3B(MHpm(i_run),i_run,MAh,MAh2,MCha,MCha2,MChi,           & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,              & 
& pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,              & 
& ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,           & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,cplAhcHpmVWm,              & 
& cplAhHpmcHpm,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,    & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,       & 
& cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvImL,        & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,      & 
& cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,        & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,         & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,        & 
& cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,        & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplhhcHpmVWm,cplhhHpmcHpm,         & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,deltaM)


 
gHpmAhChaChii = 0._dp 
Call HpmToAhChaChi(i_run,MAh,MCha,MChi,MVWm,MHpm,cplAhcHpmVWm,cplAhHpmcHpm,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,deltaM,epsI,check,gHpmAhChaChii)

gHpmAhChaChi(i_run,:,:,:) = gHpmAhChaChii 
gT(i_run) = gT(i_run) + Sum(gHpmAhChaChii) 
 
gHpmAhFdcFui = 0._dp 
Call HpmToAhFdcFu(i_run,MAh,MFd,MFu,MVWm,MHpm,cplAhcHpmVWm,cplAhHpmcHpm,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplcFuFuAhL,cplcFuFuAhR,deltaM,epsI,check,gHpmAhFdcFui)

gHpmAhFdcFu(i_run,:,:,:) = gHpmAhFdcFui 
gT(i_run) = gT(i_run) + Sum(gHpmAhFdcFui) 
 
gHpmAhFeFvi = 0._dp 
Call HpmToAhFeFv(i_run,MAh,MFe,MFv,MVWm,MHpm,cplAhcHpmVWm,cplAhHpmcHpm,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,           & 
& cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,gHpmAhFeFvi)

gHpmAhFeFv(i_run,:,:,:) = gHpmAhFeFvi 
gT(i_run) = gT(i_run) + Sum(gHpmAhFeFvi) 
 
gHpmChaChacHpmi = 0._dp 
Call HpmToChaChacHpm(i_run,MCha,MHpm,MChi,cplChiChacHpmL,cplChiChacHpmR,              & 
& deltaM,epsI,check,gHpmChaChacHpmi)

gHpmChaChacHpm(i_run,:,:,:) = gHpmChaChacHpmi 
gT(i_run) = gT(i_run) + Sum(gHpmChaChacHpmi) 
 
gHpmhhChaChii = 0._dp 
Call HpmTohhChaChi(i_run,Mhh,MCha,MChi,MVWm,MHpm,cplhhcHpmVWm,cplhhHpmcHpm,           & 
& cplcChaChahhL,cplcChaChahhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,deltaM,epsI,check,gHpmhhChaChii)

gHpmhhChaChi(i_run,:,:,:) = gHpmhhChaChii 
gT(i_run) = gT(i_run) + Sum(gHpmhhChaChii) 
 
gHpmFdChacSdi = 0._dp 
Call HpmToFdChacSd(i_run,MFd,MCha,MSd,MFu,MChi,MHpm,cplcFuFdcHpmL,cplcFuFdcHpmR,      & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,cplChiFdcSdR,     & 
& deltaM,epsI,check,gHpmFdChacSdi)

gHpmFdChacSd(i_run,:,:,:) = gHpmFdChacSdi 
gT(i_run) = gT(i_run) + Sum(gHpmFdChacSdi) 
 
gHpmChaFecSei = 0._dp 
Call HpmToChaFecSe(i_run,MCha,MFe,MSe,MChi,MFv,MHpm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiFecSeL,cplChiFecSeR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,         & 
& deltaM,epsI,check,gHpmChaFecSei)

gHpmChaFecSe(i_run,:,:,:) = gHpmChaFecSei 
gT(i_run) = gT(i_run) + Sum(gHpmChaFecSei) 
 
gHpmcSuChaFui = 0._dp 
Call HpmTocSuChaFu(i_run,MSu,MCha,MFu,MSd,MChi,MHpm,cplSdcHpmcSu,cplChaFucSdL,        & 
& cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiFucSuL,cplChiFucSuR,deltaM,           & 
& epsI,check,gHpmcSuChaFui)

gHpmcSuChaFu(i_run,:,:,:) = gHpmcSuChaFui 
gT(i_run) = gT(i_run) + Sum(gHpmcSuChaFui) 
 
gHpmSvImChaFvi = 0._dp 
Call HpmToSvImChaFv(i_run,MSvIm,MCha,MFv,MSe,MFe,MChi,MHpm,cplSeSvImcHpm,             & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiChacHpmL,cplChiChacHpmR,cplChiFvSvImL,             & 
& cplChiFvSvImR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,deltaM,              & 
& epsI,check,gHpmSvImChaFvi)

gHpmSvImChaFv(i_run,:,:,:) = gHpmSvImChaFvi 
gT(i_run) = gT(i_run) + Sum(gHpmSvImChaFvi) 
 
gHpmSvReChaFvi = 0._dp 
Call HpmToSvReChaFv(i_run,MSvRe,MCha,MFv,MSe,MFe,MChi,MHpm,cplSeSvRecHpm,             & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChacHpmL,cplChiChacHpmR,cplChiFvSvReL,             & 
& cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,deltaM,              & 
& epsI,check,gHpmSvReChaFvi)

gHpmSvReChaFv(i_run,:,:,:) = gHpmSvReChaFvi 
gT(i_run) = gT(i_run) + Sum(gHpmSvReChaFvi) 
 
gHpmHpmChacChai = 0._dp 
Call HpmToHpmChacCha(i_run,MHpm,MCha,MVZ,MAh,Mhh,MChi,cplAhHpmcHpm,cplhhHpmcHpm,      & 
& cplHpmcHpmVZ,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplChiChacHpmL,cplChiChacHpmR,             & 
& deltaM,epsI,check,gHpmHpmChacChai)

gHpmHpmChacCha(i_run,:,:,:) = gHpmHpmChacChai 
gT(i_run) = gT(i_run) + Sum(gHpmHpmChacChai) 
 
gHpmSdChacFdi = 0._dp 
Call HpmToSdChacFd(i_run,MSd,MCha,MFd,MSu,MChi,MHpm,cplSdcHpmcSu,cplcFdChaSuL,        & 
& cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplChiChacHpmL,cplChiChacHpmR,deltaM,           & 
& epsI,check,gHpmSdChacFdi)

gHpmSdChacFd(i_run,:,:,:) = gHpmSdChacFdi 
gT(i_run) = gT(i_run) + Sum(gHpmSdChacFdi) 
 
gHpmSeChacFei = 0._dp 
Call HpmToSeChacFe(i_run,MSe,MCha,MFe,MSvIm,MSvRe,MChi,MHpm,cplSeSvImcHpm,            & 
& cplSeSvRecHpm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcFeChiSeL,cplcFeChiSeR,cplChiChacHpmL,cplChiChacHpmR,deltaM,epsI,check,             & 
& gHpmSeChacFei)

gHpmSeChacFe(i_run,:,:,:) = gHpmSeChacFei 
gT(i_run) = gT(i_run) + Sum(gHpmSeChacFei) 
 
gHpmcFuChaSui = 0._dp 
Call HpmTocFuChaSu(i_run,MFu,MCha,MSu,MFd,MChi,MHpm,cplcFdChaSuL,cplcFdChaSuR,        & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplChiChacHpmL,cplChiChacHpmR,   & 
& deltaM,epsI,check,gHpmcFuChaSui)

gHpmcFuChaSu(i_run,:,:,:) = gHpmcFuChaSui 
gT(i_run) = gT(i_run) + Sum(gHpmcFuChaSui) 
 
gHpmHpmChiChii = 0._dp 
Call HpmToHpmChiChi(i_run,MHpm,MChi,MVZ,MAh,Mhh,MCha,cplAhHpmcHpm,cplhhHpmcHpm,       & 
& cplHpmcHpmVZ,cplcChaChiHpmL,cplcChaChiHpmR,cplChiChacHpmL,cplChiChacHpmR,              & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& deltaM,epsI,check,gHpmHpmChiChii)

gHpmHpmChiChi(i_run,:,:,:) = gHpmHpmChiChii 
gT(i_run) = gT(i_run) + Sum(gHpmHpmChiChii) 
 
gHpmcSuChiFdi = 0._dp 
Call HpmTocSuChiFd(i_run,MSu,MChi,MFd,MSd,MCha,MFu,MHpm,cplSdcHpmcSu,cplcChaFdcSuL,   & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,deltaM,epsI,check,gHpmcSuChiFdi)

gHpmcSuChiFd(i_run,:,:,:) = gHpmcSuChiFdi 
gT(i_run) = gT(i_run) + Sum(gHpmcSuChiFdi) 
 
gHpmSvImChiFei = 0._dp 
Call HpmToSvImChiFe(i_run,MSvIm,MChi,MFe,MSe,MCha,MFv,MHpm,cplSeSvImcHpm,             & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplChiChacHpmL,cplChiChacHpmR,cplChiFecSeL,              & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplFvFecHpmL,cplFvFecHpmR,deltaM,             & 
& epsI,check,gHpmSvImChiFei)

gHpmSvImChiFe(i_run,:,:,:) = gHpmSvImChiFei 
gT(i_run) = gT(i_run) + Sum(gHpmSvImChiFei) 
 
gHpmSvReChiFei = 0._dp 
Call HpmToSvReChiFe(i_run,MSvRe,MChi,MFe,MSe,MCha,MFv,MHpm,cplSeSvRecHpm,             & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplChiChacHpmL,cplChiChacHpmR,cplChiFecSeL,              & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,deltaM,             & 
& epsI,check,gHpmSvReChiFei)

gHpmSvReChiFe(i_run,:,:,:) = gHpmSvReChiFei 
gT(i_run) = gT(i_run) + Sum(gHpmSvReChiFei) 
 
gHpmSeChiFvi = 0._dp 
Call HpmToSeChiFv(i_run,MSe,MChi,MFv,MSvIm,MSvRe,MCha,MFe,MHpm,cplSeSvImcHpm,         & 
& cplSeSvRecHpm,cplcChaFvSeL,cplcChaFvSeR,cplcFeChiSeL,cplcFeChiSeR,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,   & 
& cplFvFecHpmR,deltaM,epsI,check,gHpmSeChiFvi)

gHpmSeChiFv(i_run,:,:,:) = gHpmSeChiFvi 
gT(i_run) = gT(i_run) + Sum(gHpmSeChiFvi) 
 
gHpmSdChicFui = 0._dp 
Call HpmToSdChicFu(i_run,MSd,MChi,MFu,MSu,MCha,MFd,MHpm,cplSdcHpmcSu,cplcChacFuSdL,   & 
& cplcChacFuSdR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,       & 
& cplcFuFdcHpmR,cplChiChacHpmL,cplChiChacHpmR,deltaM,epsI,check,gHpmSdChicFui)

gHpmSdChicFu(i_run,:,:,:) = gHpmSdChicFui 
gT(i_run) = gT(i_run) + Sum(gHpmSdChicFui) 
 
gHpmcSuFdGlui = 0._dp 
Call HpmTocSuFdGlu(i_run,MSu,MFd,MGlu,MSd,MFu,MHpm,cplSdcHpmcSu,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM,              & 
& epsI,check,gHpmcSuFdGlui)

gHpmcSuFdGlu(i_run,:,:,:) = gHpmcSuFdGlui 
gT(i_run) = gT(i_run) + Sum(gHpmcSuFdGlui) 
 
gHpmhhFdcFui = 0._dp 
Call HpmTohhFdcFu(i_run,Mhh,MFd,MFu,MVWm,MHpm,cplhhcHpmVWm,cplhhHpmcHpm,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplcFuFuhhL,cplcFuFuhhR,deltaM,epsI,check,gHpmhhFdcFui)

gHpmhhFdcFu(i_run,:,:,:) = gHpmhhFdcFui 
gT(i_run) = gT(i_run) + Sum(gHpmhhFdcFui) 
 
gHpmHpmFdcFdi = 0._dp 
Call HpmToHpmFdcFd(i_run,MHpm,MFd,MVZ,MAh,Mhh,MFu,cplAhHpmcHpm,cplhhHpmcHpm,          & 
& cplHpmcHpmVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,deltaM,              & 
& epsI,check,gHpmHpmFdcFdi)

gHpmHpmFdcFd(i_run,:,:,:) = gHpmHpmFdcFdi 
gT(i_run) = gT(i_run) + Sum(gHpmHpmFdcFdi) 
 
gHpmFeFecHpmi = 0._dp 
Call HpmToFeFecHpm(i_run,MFe,MHpm,MFv,cplFvFecHpmL,cplFvFecHpmR,deltaM,               & 
& epsI,check,gHpmFeFecHpmi)

gHpmFeFecHpm(i_run,:,:,:) = gHpmFeFecHpmi 
gT(i_run) = gT(i_run) + Sum(gHpmFeFecHpmi) 
 
gHpmhhFeFvi = 0._dp 
Call HpmTohhFeFv(i_run,Mhh,MFe,MFv,MVWm,MHpm,cplhhcHpmVWm,cplhhHpmcHpm,               & 
& cplcFeFehhL,cplcFeFehhR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,           & 
& cplFvFvhhL,cplFvFvhhR,deltaM,epsI,check,gHpmhhFeFvi)

gHpmhhFeFv(i_run,:,:,:) = gHpmhhFeFvi 
gT(i_run) = gT(i_run) + Sum(gHpmhhFeFvi) 
 
gHpmHpmFecFei = 0._dp 
Call HpmToHpmFecFe(i_run,MHpm,MFe,MVZ,MAh,Mhh,MFv,cplAhHpmcHpm,cplhhHpmcHpm,          & 
& cplHpmcHpmVZ,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplFvFecHpmL,cplFvFecHpmR,deltaM,epsI,           & 
& check,gHpmHpmFecFei)

gHpmHpmFecFe(i_run,:,:,:) = gHpmHpmFecFei 
gT(i_run) = gT(i_run) + Sum(gHpmHpmFecFei) 
 
gHpmSeFecChai = 0._dp 
Call HpmToSeFecCha(i_run,MSe,MFe,MCha,MSvIm,MSvRe,MFv,MHpm,cplSeSvImcHpm,             & 
& cplSeSvRecHpm,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplFvFecHpmL,cplFvFecHpmR,deltaM,epsI,check,gHpmSeFecChai)

gHpmSeFecCha(i_run,:,:,:) = gHpmSeFecChai 
gT(i_run) = gT(i_run) + Sum(gHpmSeFecChai) 
 
gHpmHpmFvFvi = 0._dp 
Call HpmToHpmFvFv(i_run,MHpm,MFv,MVZ,MAh,Mhh,MFe,cplAhHpmcHpm,cplhhHpmcHpm,           & 
& cplHpmcHpmVZ,cplcFeFvHpmL,cplcFeFvHpmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFvAhL,           & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,deltaM,epsI,check,              & 
& gHpmHpmFvFvi)

gHpmHpmFvFv(i_run,:,:,:) = gHpmHpmFvFvi 
gT(i_run) = gT(i_run) + Sum(gHpmHpmFvFvi) 
 
gHpmHpmFucFui = 0._dp 
Call HpmToHpmFucFu(i_run,MHpm,MFu,MVZ,MAh,Mhh,MFd,cplAhHpmcHpm,cplhhHpmcHpm,          & 
& cplHpmcHpmVZ,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFuAhL,        & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM,epsI,               & 
& check,gHpmHpmFucFui)

gHpmHpmFucFu(i_run,:,:,:) = gHpmHpmFucFui 
gT(i_run) = gT(i_run) + Sum(gHpmHpmFucFui) 
 
gHpmSdGlucFui = 0._dp 
Call HpmToSdGlucFu(i_run,MSd,MGlu,MFu,MSu,MFd,MHpm,cplSdcHpmcSu,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuGluSuL,cplcFuGluSuR,deltaM,             & 
& epsI,check,gHpmSdGlucFui)

gHpmSdGlucFu(i_run,:,:,:) = gHpmSdGlucFui 
gT(i_run) = gT(i_run) + Sum(gHpmSdGlucFui) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=2,3
  Do gt2=1,2
    Do gt3=1,5
gPartial(i1,n_length)= gHpmAhChaChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gHpmAhFdcFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,3
  Do gt2=1,3
    Do gt3=1,9
gPartial(i1,n_length)= gHpmAhFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=gt1,2
    Do gt3=2,2
gPartial(i1,n_length)= gHpmChaChacHpm(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,5
gPartial(i1,n_length)= gHpmhhChaChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,6
gPartial(i1,n_length)= gHpmFdChacSd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gHpmChaFecSe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= gHpmcSuChaFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,9
  Do gt2=1,2
    Do gt3=1,9
gPartial(i1,n_length)= gHpmSvImChaFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,9
  Do gt2=1,2
    Do gt3=1,9
gPartial(i1,n_length)= gHpmSvReChaFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,2
    Do gt3=1,2
gPartial(i1,n_length)= gHpmHpmChacCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= gHpmSdChacFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= gHpmSeChacFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,6
gPartial(i1,n_length)= gHpmcFuChaSu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,5
    Do gt3=gt2,5
gPartial(i1,n_length)= gHpmHpmChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,3
gPartial(i1,n_length)= gHpmcSuChiFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,9
  Do gt2=1,5
    Do gt3=1,3
gPartial(i1,n_length)= gHpmSvImChiFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,9
  Do gt2=1,5
    Do gt3=1,3
gPartial(i1,n_length)= gHpmSvReChiFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,9
gPartial(i1,n_length)= gHpmSeChiFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,3
gPartial(i1,n_length)= gHpmSdChicFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,1
gPartial(i1,n_length)= gHpmcSuFdGlu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gHpmhhFdcFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gHpmHpmFdcFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=gt1,3
    Do gt3=2,2
gPartial(i1,n_length)= gHpmFeFecHpm(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,9
gPartial(i1,n_length)= gHpmhhFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gHpmHpmFecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
gPartial(i1,n_length)= gHpmSeFecCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,9
    Do gt3=gt2,9
gPartial(i1,n_length)= gHpmHpmFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gHpmHpmFucFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,1
    Do gt3=1,3
gPartial(i1,n_length)= gHpmSdGlucFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Iname = Iname - 1 
 
End Subroutine HpmThreeBodyDecay
 
 
Subroutine HpmToAhChaChi(iIN,MAh,MCha,MChi,MVWm,MHpm,cplAhcHpmVWm,cplAhHpmcHpm,       & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MCha(2),MChi(5),MVWm,MHpm(2)

Complex(dp),Intent(in) :: cplAhcHpmVWm(3,2),cplAhHpmcHpm(3,2,2),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),      & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 100 
Allocate( gSum(3,2,5, Isum) ) 
Allocate( Contribution(3,2,5, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,3
      Do gt2=1,2
        Do gt3=1,5
Isum = 0 
 
rk2 = (MCha(gt2)/MHpm(iIN))**2 
rm2 = (MChi(gt3)/MHpm(iIN))**2 
rj2 = (MAh(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MChi(gt3))+Abs(MCha(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhcHpmVWm(gt1,iIN)) 
coup(3) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(2) = Conjg(cplChiChacVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChacHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcChaChaAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiChiAhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplAhcHpmVWm(gt1,iIN) 
coup(2) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(3) = Conjg(cplChiChacVWmR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(gt1,i2,iIN) 
coup(5) = Conjg(cplChiChacHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, Cha 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MCha2(i2)  
coup(1) = cplChiChacHpmL(gt3,i2,iIN) 
coup(2) = cplChiChacHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcChaChaAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(i2,gt2,gt1))  
coup(5) = cplAhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(6) = Conjg(cplChiChacVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: VWm,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Cha'
      End Do 



!-------------- 
!  VWm, Chi 
!-------------- 
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MChi2(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChiAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i2,gt3,gt1))  
coup(5) = cplAhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(6) = Conjg(cplChiChacVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: VWm,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Chi'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplAhHpmcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplChiChacHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplChiChacHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, Cha 
!-------------- 
Do i1=1,2
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt3,i2,iIN) 
coup(2) = cplChiChacHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcChaChaAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(i2,gt2,gt1))  
coup(5) = cplAhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: Hpm,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Cha'
        End Do 
      End Do 



!-------------- 
!  Hpm, Chi 
!-------------- 
Do i1=1,2
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChiAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i2,gt3,gt1))  
coup(5) = cplAhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: Hpm,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Chi'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt3,i1,iIN) 
coup(2) = cplChiChacHpmR(gt3,i1,iIN) 
coup(3) = cplcChaChaAhL(i1,gt2,gt1) 
coup(4) = cplcChaChaAhR(i1,gt2,gt1) 
coup(5) = cplChiChacHpmL(gt3,i2,iIN) 
coup(6) = cplChiChacHpmR(gt3,i2,iIN)  
coup(7) = cplcChaChaAhL(i2,gt2,gt1) 
coup(8) = cplcChaChaAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Chi 
!-------------- 
Do i1=1,2
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(gt3,i1,iIN) 
coup(2) = cplChiChacHpmR(gt3,i1,iIN) 
coup(3) = cplcChaChaAhL(i1,gt2,gt1) 
coup(4) = cplcChaChaAhR(i1,gt2,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiChiAhL(i2,gt3,gt1) 
coup(8) = cplChiChiAhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: Cha,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplChiChiAhL(i1,gt3,gt1) 
coup(4) = cplChiChiAhR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiChiAhL(i2,gt3,gt1) 
coup(8) = cplChiChiAhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Cha Chi Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2,3
      Do gt2=1,2
        Do gt3=1,5
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToAhChaChi 
 
 
Subroutine HpmToAhFdcFu(iIN,MAh,MFd,MFu,MVWm,MHpm,cplAhcHpmVWm,cplAhHpmcHpm,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplcFuFuAhL,cplcFuFuAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MFd(3),MFu(3),MVWm,MHpm(2)

Complex(dp),Intent(in) :: cplAhcHpmVWm(3,2),cplAhHpmcHpm(3,2,2),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),          & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MHpm(iIN))**2 
rm2 = (MFu(gt3)/MHpm(iIN))**2 
rj2 = (MAh(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhcHpmVWm(gt1,iIN)) 
coup(3) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFdcVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  bar[Fu] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFuFuAhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu]'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFdFdAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplAhcHpmVWm(gt1,iIN) 
coup(2) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(gt1,i2,iIN) 
coup(5) = Conjg(cplcFuFdcHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, bar[Fu] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFu2(i2)  
coup(1) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(gt3,i2,gt1))  
coup(5) = cplAhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: VWm,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,bar[Fu]'
      End Do 



!-------------- 
!  VWm, Fd 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFd2(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdFdAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(i2,gt2,gt1))  
coup(5) = cplAhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: VWm,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Fd'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplAhHpmcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplcFuFdcHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFdcHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(gt3,i2,gt1))  
coup(5) = cplAhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: Hpm,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fd 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdFdAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(i2,gt2,gt1))  
coup(5) = cplAhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: Hpm,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Fd'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i1,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i1,gt2,iIN) 
coup(3) = cplcFuFuAhL(gt3,i1,gt1) 
coup(4) = cplcFuFuAhR(gt3,i1,gt1) 
coup(5) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(6) = cplcFuFdcHpmR(i2,gt2,iIN)  
coup(7) = cplcFuFuAhL(gt3,i2,gt1) 
coup(8) = cplcFuFuAhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: bar[Fu],bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], Fd 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(i1,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i1,gt2,iIN) 
coup(3) = cplcFuFuAhL(gt3,i1,gt1) 
coup(4) = cplcFuFuAhR(gt3,i1,gt1) 
coup(5) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(6) = cplcFuFdcHpmR(gt3,i2,iIN)  
coup(7) = cplcFdFdAhL(i2,gt2,gt1) 
coup(8) = cplcFdFdAhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: bar[Fu],Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i1,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i1,iIN) 
coup(3) = cplcFdFdAhL(i1,gt2,gt1) 
coup(4) = cplcFdFdAhR(i1,gt2,gt1) 
coup(5) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(6) = cplcFuFdcHpmR(gt3,i2,iIN)  
coup(7) = cplcFdFdAhL(i2,gt2,gt1) 
coup(8) = cplcFdFdAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fd cFu Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2,3
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToAhFdcFu 
 
 
Subroutine HpmToAhFeFv(iIN,MAh,MFe,MFv,MVWm,MHpm,cplAhcHpmVWm,cplAhHpmcHpm,           & 
& cplcFeFeAhL,cplcFeFeAhR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,           & 
& cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MFe(3),MFv(9),MVWm,MHpm(2)

Complex(dp),Intent(in) :: cplAhcHpmVWm(3,2),cplAhHpmcHpm(3,2,2),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),          & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),           & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 225 
Allocate( gSum(3,3,9, Isum) ) 
Allocate( Contribution(3,3,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,3
      Do gt2=1,3
        Do gt3=1,9
Isum = 0 
 
rk2 = (MFe(gt2)/MHpm(iIN))**2 
rm2 = (MFv(gt3)/MHpm(iIN))**2 
rj2 = (MAh(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhcHpmVWm(gt1,iIN)) 
coup(3) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(2) = Conjg(cplFvFecVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFecHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeFeAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvFvAhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplAhcHpmVWm(gt1,iIN) 
coup(2) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(3) = Conjg(cplFvFecVWmR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(gt1,i2,iIN) 
coup(5) = Conjg(cplFvFecHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplFvFecHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, Fe 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFe2(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeFeAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(i2,gt2,gt1))  
coup(5) = cplAhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: VWm,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Fe'
      End Do 



!-------------- 
!  VWm, Fv 
!-------------- 
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFecHpmL(i2,gt2,iIN) 
coup(2) = cplFvFecHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt3,gt1))  
coup(5) = cplAhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: VWm,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Fv'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplAhHpmcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplFvFecHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplFvFecHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fe 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeFeAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(i2,gt2,gt1))  
coup(5) = cplAhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: Hpm,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Fe'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fv 
!-------------- 
Do i1=1,2
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFecHpmL(i2,gt2,iIN) 
coup(2) = cplFvFecHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt3,gt1))  
coup(5) = cplAhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: Hpm,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Fv'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeFeAhL(i1,gt2,gt1) 
coup(4) = cplcFeFeAhR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(gt3,i2,iIN) 
coup(6) = cplFvFecHpmR(gt3,i2,iIN)  
coup(7) = cplcFeFeAhL(i2,gt2,gt1) 
coup(8) = cplcFeFeAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Fv 
!-------------- 
Do i1=1,3
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeFeAhL(i1,gt2,gt1) 
coup(4) = cplcFeFeAhR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplFvFvAhL(i2,gt3,gt1) 
coup(8) = cplFvFvAhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: Fe,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt2,iIN) 
coup(2) = cplFvFecHpmR(i1,gt2,iIN) 
coup(3) = cplFvFvAhL(i1,gt3,gt1) 
coup(4) = cplFvFvAhR(i1,gt3,gt1) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplFvFvAhL(i2,gt3,gt1) 
coup(8) = cplFvFvAhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Ah Fe Fv Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2,3
      Do gt2=1,3
        Do gt3=1,9
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:225))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToAhFeFv 
 
 
Subroutine HpmToChaChacHpm(iIN,MCha,MHpm,MChi,cplChiChacHpmL,cplChiChacHpmR,          & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MHpm(2),MChi(5)

Complex(dp),Intent(in) :: cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 25 
Allocate( gSum(2,2,2, Isum) ) 
Allocate( Contribution(2,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,2
      Do gt2=gt1,2
        Do gt3=2,2
Isum = 0 
 
rk2 = (MCha(gt1)/MHpm(iIN))**2 
rm2 = (MCha(gt2)/MHpm(iIN))**2 
rj2 = (MHpm(gt3)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MHpm(gt3))+Abs(MCha(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChiChacHpmL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChiChacHpmR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiChacHpmL(i1,gt1,gt3)) 
coup(3) = Conjg(cplChiChacHpmR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1)  
mass(2) = MChi(i1)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplChiChacHpmL(i1,gt1,gt3) 
coup(4) = cplChiChacHpmR(i1,gt1,gt3) 
coup(5) = cplChiChacHpmL(i1,gt1,iIN) 
coup(6) = cplChiChacHpmR(i1,gt1,iIN)  
coup(7) = cplChiChacHpmL(i1,gt2,gt3) 
coup(8) = cplChiChacHpmR(i1,gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Cha Cha cHpm Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt1,iIN) 
coup(2) = cplChiChacHpmR(i1,gt1,iIN) 
coup(3) = cplChiChacHpmL(i1,gt2,gt3) 
coup(4) = cplChiChacHpmR(i1,gt2,gt3) 
coup(5) = cplChiChacHpmL(i2,gt1,iIN) 
coup(6) = cplChiChacHpmR(i2,gt1,iIN)  
coup(7) = cplChiChacHpmL(i2,gt2,gt3) 
coup(8) = cplChiChacHpmR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplChiChacHpmL(i1,gt1,gt3) 
coup(4) = cplChiChacHpmR(i1,gt1,gt3) 
coup(5) = cplChiChacHpmL(i2,gt1,iIN) 
coup(6) = cplChiChacHpmR(i2,gt1,iIN)  
coup(7) = cplChiChacHpmL(i2,gt2,gt3) 
coup(8) = cplChiChacHpmR(i2,gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplChiChacHpmL(i1,gt1,gt3) 
coup(4) = cplChiChacHpmR(i1,gt1,gt3) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiChacHpmL(i2,gt1,gt3) 
coup(8) = cplChiChacHpmR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt1,iIN) 
coup(2) = cplChiChacHpmR(i1,gt1,iIN) 
coup(3) = cplChiChacHpmL(i1,gt2,gt3) 
coup(4) = cplChiChacHpmR(i1,gt2,gt3) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiChacHpmL(i2,gt1,gt3) 
coup(8) = cplChiChacHpmR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Cha Cha cHpm Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,2
      Do gt2=gt1,2
        Do gt3=2,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToChaChacHpm 
 
 
Subroutine HpmTohhChaChi(iIN,Mhh,MCha,MChi,MVWm,MHpm,cplhhcHpmVWm,cplhhHpmcHpm,       & 
& cplcChaChahhL,cplcChaChahhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(3),MCha(2),MChi(5),MVWm,MHpm(2)

Complex(dp),Intent(in) :: cplhhcHpmVWm(3,2),cplhhHpmcHpm(3,2,2),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),      & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),   & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 100 
Allocate( gSum(3,2,5, Isum) ) 
Allocate( Contribution(3,2,5, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,5
Isum = 0 
 
rk2 = (MCha(gt2)/MHpm(iIN))**2 
rm2 = (MChi(gt3)/MHpm(iIN))**2 
rj2 = (Mhh(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MChi(gt3))+Abs(MCha(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhcHpmVWm(gt1,iIN)) 
coup(3) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(2) = Conjg(cplChiChacVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChacHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcChaChahhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcChaChahhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiChihhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChiChihhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplhhcHpmVWm(gt1,iIN) 
coup(2) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(3) = Conjg(cplChiChacVWmR(gt3,gt2))  
coup(4) = cplhhHpmcHpm(gt1,i2,iIN) 
coup(5) = Conjg(cplChiChacHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, Cha 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MCha2(i2)  
coup(1) = cplChiChacHpmL(gt3,i2,iIN) 
coup(2) = cplChiChacHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcChaChahhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChahhR(i2,gt2,gt1))  
coup(5) = cplhhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(6) = Conjg(cplChiChacVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: VWm,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Cha'
      End Do 



!-------------- 
!  VWm, Chi 
!-------------- 
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MChi2(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt3,gt1))  
coup(5) = cplhhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(6) = Conjg(cplChiChacVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: VWm,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Chi'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplhhHpmcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplChiChacHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplChiChacHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, Cha 
!-------------- 
Do i1=1,2
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt3,i2,iIN) 
coup(2) = cplChiChacHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcChaChahhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChahhR(i2,gt2,gt1))  
coup(5) = cplhhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: Hpm,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Cha'
        End Do 
      End Do 



!-------------- 
!  Hpm, Chi 
!-------------- 
Do i1=1,2
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt3,gt1))  
coup(5) = cplhhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: Hpm,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Chi'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt3,i1,iIN) 
coup(2) = cplChiChacHpmR(gt3,i1,iIN) 
coup(3) = cplcChaChahhL(i1,gt2,gt1) 
coup(4) = cplcChaChahhR(i1,gt2,gt1) 
coup(5) = cplChiChacHpmL(gt3,i2,iIN) 
coup(6) = cplChiChacHpmR(gt3,i2,iIN)  
coup(7) = cplcChaChahhL(i2,gt2,gt1) 
coup(8) = cplcChaChahhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Chi 
!-------------- 
Do i1=1,2
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(gt3,i1,iIN) 
coup(2) = cplChiChacHpmR(gt3,i1,iIN) 
coup(3) = cplcChaChahhL(i1,gt2,gt1) 
coup(4) = cplcChaChahhR(i1,gt2,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiChihhL(i2,gt3,gt1) 
coup(8) = cplChiChihhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: Cha,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplChiChihhL(i1,gt3,gt1) 
coup(4) = cplChiChihhR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiChihhL(i2,gt3,gt1) 
coup(8) = cplChiChihhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Cha Chi Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,5
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmTohhChaChi 
 
 
Subroutine HpmToFdChacSd(iIN,MFd,MCha,MSd,MFu,MChi,MHpm,cplcFuFdcHpmL,cplcFuFdcHpmR,  & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,cplChiFdcSdR,     & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MCha(2),MSd(6),MFu(3),MChi(5),MHpm(2)

Complex(dp),Intent(in) :: cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),    & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 64 
Allocate( gSum(3,2,6, Isum) ) 
Allocate( Contribution(3,2,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFd(gt1)/MHpm(iIN))**2 
rm2 = (MCha(gt2)/MHpm(iIN))**2 
rj2 = (MSd(gt3)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MSd(gt3))+Abs(MCha(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  bar[Fu] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(i1,gt1,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChaFucSdL(gt2,i1,gt3)) 
coup(3) = Conjg(cplChaFucSdR(gt2,i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Fd Cha cSd Propagator: bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu]'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFdcSdL(i1,gt1,gt3)) 
coup(3) = Conjg(cplChiFdcSdR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Fd Cha cSd Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  bar[Fu], bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i1,gt1,iIN) 
coup(2) = cplcFuFdcHpmR(i1,gt1,iIN) 
coup(3) = cplChaFucSdL(gt2,i1,gt3) 
coup(4) = cplChaFucSdR(gt2,i1,gt3) 
coup(5) = cplcFuFdcHpmL(i2,gt1,iIN) 
coup(6) = cplcFuFdcHpmR(i2,gt1,iIN)  
coup(7) = cplChaFucSdL(gt2,i2,gt3) 
coup(8) = cplChaFucSdR(gt2,i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Fd Cha cSd Propagator: bar[Fu],bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], Chi 
!-------------- 
Do i1=1,3
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MChi(i2)  
coup(1) = cplcFuFdcHpmL(i1,gt1,iIN) 
coup(2) = cplcFuFdcHpmR(i1,gt1,iIN) 
coup(3) = cplChaFucSdL(gt2,i1,gt3) 
coup(4) = cplChaFucSdR(gt2,i1,gt3) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiFdcSdL(i2,gt1,gt3) 
coup(8) = cplChiFdcSdR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Fd Cha cSd Propagator: bar[Fu],Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplChiFdcSdL(i1,gt1,gt3) 
coup(4) = cplChiFdcSdR(i1,gt1,gt3) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiFdcSdL(i2,gt1,gt3) 
coup(8) = cplChiFdcSdR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Fd Cha cSd Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToFdChacSd 
 
 
Subroutine HpmToChaFecSe(iIN,MCha,MFe,MSe,MChi,MFv,MHpm,cplChiChacHpmL,               & 
& cplChiChacHpmR,cplChiFecSeL,cplChiFecSeR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,       & 
& cplFvFecHpmR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFe(3),MSe(6),MChi(5),MFv(9),MHpm(2)

Complex(dp),Intent(in) :: cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),  & 
& cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 196 
Allocate( gSum(2,3,6, Isum) ) 
Allocate( Contribution(2,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,2
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MCha(gt1)/MHpm(iIN))**2 
rm2 = (MFe(gt2)/MHpm(iIN))**2 
rj2 = (MSe(gt3)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MSe(gt3))+Abs(MFe(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChiFecSeL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChiFecSeR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Cha Fe cSe Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvChacSeL(i1,gt1,gt3)) 
coup(3) = Conjg(cplFvChacSeR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Cha Fe cSe Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt1,iIN) 
coup(2) = cplChiChacHpmR(i1,gt1,iIN) 
coup(3) = cplChiFecSeL(i1,gt2,gt3) 
coup(4) = cplChiFecSeR(i1,gt2,gt3) 
coup(5) = cplChiChacHpmL(i2,gt1,iIN) 
coup(6) = cplChiChacHpmR(i2,gt1,iIN)  
coup(7) = cplChiFecSeL(i2,gt2,gt3) 
coup(8) = cplChiFecSeR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Cha Fe cSe Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Fv 
!-------------- 
Do i1=1,5
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiChacHpmL(i1,gt1,iIN) 
coup(2) = cplChiChacHpmR(i1,gt1,iIN) 
coup(3) = cplChiFecSeL(i1,gt2,gt3) 
coup(4) = cplChiFecSeR(i1,gt2,gt3) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplFvChacSeL(i2,gt1,gt3) 
coup(8) = cplFvChacSeR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Cha Fe cSe Propagator: Chi,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt2,iIN) 
coup(2) = cplFvFecHpmR(i1,gt2,iIN) 
coup(3) = cplFvChacSeL(i1,gt1,gt3) 
coup(4) = cplFvChacSeR(i1,gt1,gt3) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplFvChacSeL(i2,gt1,gt3) 
coup(8) = cplFvChacSeR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Cha Fe cSe Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,2
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToChaFecSe 
 
 
Subroutine HpmTocSuChaFu(iIN,MSu,MCha,MFu,MSd,MChi,MHpm,cplSdcHpmcSu,cplChaFucSdL,    & 
& cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiFucSuL,cplChiFucSuR,deltaM,           & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSu(6),MCha(2),MFu(3),MSd(6),MChi(5),MHpm(2)

Complex(dp),Intent(in) :: cplSdcHpmcSu(6,2,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),    & 
& cplChiChacHpmR(5,2,2),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 121 
Allocate( gSum(6,2,3, Isum) ) 
Allocate( Contribution(6,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
rk2 = (MCha(gt2)/MHpm(iIN))**2 
rm2 = (MFu(gt3)/MHpm(iIN))**2 
rj2 = (MSu(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFu(gt3))+Abs(MCha(gt2))+Abs(MSu(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSdcHpmcSu(i1,iIN,gt1)) 
coup(3) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChaFucSdR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Cha Fu Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFucSuL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChiFucSuR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Cha Fu Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSd(i1)  
mass(2) = MSd(i2)  
coup(1) = cplSdcHpmcSu(i1,iIN,gt1) 
coup(3) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
coup(4) = cplSdcHpmcSu(i2,iIN,gt1) 
coup(6) = Conjg(cplChaFucSdL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChaFucSdR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Cha Fu Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFucSuL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFucSuR(i2,gt3,gt1))  
coup(5) = cplSdcHpmcSu(i1,iIN,gt1) 
coup(7) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Cha Fu Propagator: Sd,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplChiFucSuL(i1,gt3,gt1) 
coup(4) = cplChiFucSuR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiFucSuL(i2,gt3,gt1) 
coup(8) = cplChiFucSuR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Cha Fu Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmTocSuChaFu 
 
 
Subroutine HpmToSvImChaFv(iIN,MSvIm,MCha,MFv,MSe,MFe,MChi,MHpm,cplSeSvImcHpm,         & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplChiChacHpmL,cplChiChacHpmR,cplChiFvSvImL,             & 
& cplChiFvSvImR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,deltaM,              & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSvIm(9),MCha(2),MFv(9),MSe(6),MFe(3),MChi(5),MHpm(2)

Complex(dp),Intent(in) :: cplSeSvImcHpm(6,9,2),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplChiChacHpmL(5,2,2),& 
& cplChiChacHpmR(5,2,2),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplFvChacSeL(9,2,6),   & 
& cplFvChacSeR(9,2,6),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 196 
Allocate( gSum(9,2,9, Isum) ) 
Allocate( Contribution(9,2,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,9
      Do gt2=1,2
        Do gt3=1,9
Isum = 0 
 
rk2 = (MCha(gt2)/MHpm(iIN))**2 
rm2 = (MFv(gt3)/MHpm(iIN))**2 
rj2 = (MSvIm(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFv(gt3))+Abs(MCha(gt2))+Abs(MSvIm(gt1)))) Then 
!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSe(i1) 
mass(2) = MSe(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvImcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvChacSeR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Cha Fv Propagator: Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Se'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeChaSvImL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvImR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Cha Fv Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFvSvImL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChiFvSvImR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Cha Fv Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSe(i1)  
mass(2) = MSe(i2)  
coup(1) = cplSeSvImcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvChacSeR(gt3,gt2,i1))  
coup(4) = cplSeSvImcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplFvChacSeL(gt3,gt2,i2)) 
coup(5) = Conjg(cplFvChacSeR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Cha Fv Propagator: Se,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Se'
        End Do 
      End Do 



!-------------- 
!  Se, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvImL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvImR(i2,gt2,gt1))  
coup(5) = cplSeSvImcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvChacSeR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Cha Fv Propagator: Se,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Fe'
        End Do 
      End Do 



!-------------- 
!  Se, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFvSvImL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFvSvImR(i2,gt3,gt1))  
coup(5) = cplSeSvImcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvChacSeR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Cha Fv Propagator: Se,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Chi'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeChaSvImL(i1,gt2,gt1) 
coup(4) = cplcFeChaSvImR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(gt3,i2,iIN) 
coup(6) = cplFvFecHpmR(gt3,i2,iIN)  
coup(7) = cplcFeChaSvImL(i2,gt2,gt1) 
coup(8) = cplcFeChaSvImR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Cha Fv Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MChi(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeChaSvImL(i1,gt2,gt1) 
coup(4) = cplcFeChaSvImR(i1,gt2,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiFvSvImL(i2,gt3,gt1) 
coup(8) = cplChiFvSvImR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Cha Fv Propagator: Fe,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplChiFvSvImL(i1,gt3,gt1) 
coup(4) = cplChiFvSvImR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiFvSvImL(i2,gt3,gt1) 
coup(8) = cplChiFvSvImR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Cha Fv Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,9
      Do gt2=1,2
        Do gt3=1,9
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToSvImChaFv 
 
 
Subroutine HpmToSvReChaFv(iIN,MSvRe,MCha,MFv,MSe,MFe,MChi,MHpm,cplSeSvRecHpm,         & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChacHpmL,cplChiChacHpmR,cplChiFvSvReL,             & 
& cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,deltaM,              & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSvRe(9),MCha(2),MFv(9),MSe(6),MFe(3),MChi(5),MHpm(2)

Complex(dp),Intent(in) :: cplSeSvRecHpm(6,9,2),cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),cplChiChacHpmL(5,2,2),& 
& cplChiChacHpmR(5,2,2),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),cplFvChacSeL(9,2,6),   & 
& cplFvChacSeR(9,2,6),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 196 
Allocate( gSum(9,2,9, Isum) ) 
Allocate( Contribution(9,2,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,9
      Do gt2=1,2
        Do gt3=1,9
Isum = 0 
 
rk2 = (MCha(gt2)/MHpm(iIN))**2 
rm2 = (MFv(gt3)/MHpm(iIN))**2 
rj2 = (MSvRe(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFv(gt3))+Abs(MCha(gt2))+Abs(MSvRe(gt1)))) Then 
!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSe(i1) 
mass(2) = MSe(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvRecHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvChacSeR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Cha Fv Propagator: Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Se'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeChaSvReL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvReR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Cha Fv Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFvSvReL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChiFvSvReR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Cha Fv Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSe(i1)  
mass(2) = MSe(i2)  
coup(1) = cplSeSvRecHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvChacSeR(gt3,gt2,i1))  
coup(4) = cplSeSvRecHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplFvChacSeL(gt3,gt2,i2)) 
coup(5) = Conjg(cplFvChacSeR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Cha Fv Propagator: Se,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Se'
        End Do 
      End Do 



!-------------- 
!  Se, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvReL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvReR(i2,gt2,gt1))  
coup(5) = cplSeSvRecHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvChacSeR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Cha Fv Propagator: Se,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Fe'
        End Do 
      End Do 



!-------------- 
!  Se, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFvSvReL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFvSvReR(i2,gt3,gt1))  
coup(5) = cplSeSvRecHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvChacSeR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Cha Fv Propagator: Se,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Chi'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeChaSvReL(i1,gt2,gt1) 
coup(4) = cplcFeChaSvReR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(gt3,i2,iIN) 
coup(6) = cplFvFecHpmR(gt3,i2,iIN)  
coup(7) = cplcFeChaSvReL(i2,gt2,gt1) 
coup(8) = cplcFeChaSvReR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Cha Fv Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MChi(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeChaSvReL(i1,gt2,gt1) 
coup(4) = cplcFeChaSvReR(i1,gt2,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiFvSvReL(i2,gt3,gt1) 
coup(8) = cplChiFvSvReR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Cha Fv Propagator: Fe,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplChiFvSvReL(i1,gt3,gt1) 
coup(4) = cplChiFvSvReR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplChiFvSvReL(i2,gt3,gt1) 
coup(8) = cplChiFvSvReR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Cha Fv Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,9
      Do gt2=1,2
        Do gt3=1,9
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToSvReChaFv 
 
 
Subroutine HpmToHpmChacCha(iIN,MHpm,MCha,MVZ,MAh,Mhh,MChi,cplAhHpmcHpm,               & 
& cplhhHpmcHpm,cplHpmcHpmVZ,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,     & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplChiChacHpmL,              & 
& cplChiChacHpmR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MCha(2),MVZ,MAh(3),Mhh(3),MChi(5)

Complex(dp),Intent(in) :: cplAhHpmcHpm(3,2,2),cplhhHpmcHpm(3,2,2),cplHpmcHpmVZ(2,2),cplcChaChaAhL(2,2,3),       & 
& cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplChiChacHpmL(5,2,2),  & 
& cplChiChacHpmR(5,2,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 144 
Allocate( gSum(2,2,2, Isum) ) 
Allocate( Contribution(2,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,2
        Do gt3=1,2
Isum = 0 
 
rk2 = (MCha(gt2)/MHpm(iIN))**2 
rm2 = (MCha(gt3)/MHpm(iIN))**2 
rj2 = (MHpm(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MCha(gt3))+Abs(MCha(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplHpmcHpmVZ(gt1,iIN)) 
coup(3) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(2) = Conjg(cplcChaChaVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChahhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcChaChiHpmL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, Chi 
!-------------- 
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MChi2(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(gt3,i2,gt1))  
coup(5) = cplHpmcHpmVZ(gt1,iIN) 
coup(7) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChaVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: VZ,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Chi'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(gt3,i2,gt1))  
coup(5) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: Ah,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Chi'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(gt3,i2,gt1))  
coup(5) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: hh,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplcChaChiHpmL(gt3,i1,gt1) 
coup(4) = cplcChaChiHpmR(gt3,i1,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplcChaChiHpmL(gt3,i2,gt1) 
coup(8) = cplcChaChiHpmR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Cha cCha Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2, iIN-1
      Do gt2=1,2
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:144))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToHpmChacCha 
 
 
Subroutine HpmToSdChacFd(iIN,MSd,MCha,MFd,MSu,MChi,MHpm,cplSdcHpmcSu,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplChiChacHpmL,cplChiChacHpmR,deltaM,           & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MCha(2),MFd(3),MSu(6),MChi(5),MHpm(2)

Complex(dp),Intent(in) :: cplSdcHpmcSu(6,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,5,6),      & 
& cplcFdChiSdR(3,5,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 121 
Allocate( gSum(6,2,3, Isum) ) 
Allocate( Contribution(6,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
rk2 = (MCha(gt2)/MHpm(iIN))**2 
rm2 = (MFd(gt3)/MHpm(iIN))**2 
rj2 = (MSd(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFd(gt3))+Abs(MCha(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSu(i1) 
mass(2) = MSu(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSdcHpmcSu(gt1,iIN,i1)) 
coup(3) = Conjg(cplcFdChaSuL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdChaSuR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Cha cFd Propagator: conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su]'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFdChiSdL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Cha cFd Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  conj[Su], conj[Su] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSu(i1)  
mass(2) = MSu(i2)  
coup(1) = cplSdcHpmcSu(gt1,iIN,i1) 
coup(3) = Conjg(cplcFdChaSuL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdChaSuR(gt3,gt2,i1))  
coup(4) = cplSdcHpmcSu(gt1,iIN,i2) 
coup(6) = Conjg(cplcFdChaSuL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdChaSuR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Cha cFd Propagator: conj[Su],conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],conj[Su]'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Chi 
!-------------- 
Do i1=1,6
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(gt3,i2,gt1))  
coup(5) = cplSdcHpmcSu(gt1,iIN,i1) 
coup(7) = Conjg(cplcFdChaSuL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdChaSuR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Cha cFd Propagator: conj[Su],Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplcFdChiSdL(gt3,i1,gt1) 
coup(4) = cplcFdChiSdR(gt3,i1,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplcFdChiSdL(gt3,i2,gt1) 
coup(8) = cplcFdChiSdR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Cha cFd Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToSdChacFd 
 
 
Subroutine HpmToSeChacFe(iIN,MSe,MCha,MFe,MSvIm,MSvRe,MChi,MHpm,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcFeChiSeL,cplcFeChiSeR,cplChiChacHpmL,cplChiChacHpmR,deltaM,epsI,check,             & 
& g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSe(6),MCha(2),MFe(3),MSvIm(9),MSvRe(9),MChi(5),MHpm(2)

Complex(dp),Intent(in) :: cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),& 
& cplcFeChaSvReL(3,2,9),cplcFeChaSvReR(3,2,9),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 529 
Allocate( gSum(6,2,3, Isum) ) 
Allocate( Contribution(6,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
rk2 = (MCha(gt2)/MHpm(iIN))**2 
rm2 = (MFe(gt3)/MHpm(iIN))**2 
rj2 = (MSe(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFe(gt3))+Abs(MCha(gt2))+Abs(MSe(gt1)))) Then 
!-------------- 
!  SvIm 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvIm(i1) 
mass(2) = MSvIm(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvImcHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Cha cFe Propagator: SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm'
      End Do 



!-------------- 
!  SvRe 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvRe(i1) 
mass(2) = MSvRe(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvRecHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplcFeChaSvReL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvReR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Cha cFe Propagator: SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeChiSeL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Cha cFe Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  SvIm, SvIm 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvIm(i2)  
coup(1) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
coup(4) = cplSeSvImcHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplcFeChaSvImL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeChaSvImR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Cha cFe Propagator: SvIm,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvIm'
        End Do 
      End Do 



!-------------- 
!  SvIm, SvRe 
!-------------- 
Do i1=1,9
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
coup(4) = cplSeSvRecHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplcFeChaSvReL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeChaSvReR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Cha cFe Propagator: SvIm,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvIm, Chi 
!-------------- 
Do i1=1,9
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChiSeL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(gt3,i2,gt1))  
coup(5) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Cha cFe Propagator: SvIm,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,Chi'
        End Do 
      End Do 



!-------------- 
!  SvRe, SvRe 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvRe(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplSeSvRecHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplcFeChaSvReL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvReR(gt3,gt2,i1))  
coup(4) = cplSeSvRecHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplcFeChaSvReL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeChaSvReR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Cha cFe Propagator: SvRe,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvRe, Chi 
!-------------- 
Do i1=1,9
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChacHpmL(i2,gt2,iIN) 
coup(2) = cplChiChacHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChiSeL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(gt3,i2,gt1))  
coup(5) = cplSeSvRecHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplcFeChaSvReL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvReR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Cha cFe Propagator: SvRe,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplcFeChiSeL(gt3,i1,gt1) 
coup(4) = cplcFeChiSeR(gt3,i1,gt1) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplcFeChiSeL(gt3,i2,gt1) 
coup(8) = cplcFeChiSeR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Cha cFe Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:529))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToSeChacFe 
 
 
Subroutine HpmTocFuChaSu(iIN,MFu,MCha,MSu,MFd,MChi,MHpm,cplcFdChaSuL,cplcFdChaSuR,    & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplChiChacHpmL,cplChiChacHpmR,   & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MCha(2),MSu(6),MFd(3),MChi(5),MHpm(2)

Complex(dp),Intent(in) :: cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),      & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 64 
Allocate( gSum(3,2,6, Isum) ) 
Allocate( Contribution(3,2,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFu(gt1)/MHpm(iIN))**2 
rm2 = (MCha(gt2)/MHpm(iIN))**2 
rj2 = (MSu(gt3)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MSu(gt3))+Abs(MCha(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(gt1,i1,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(gt1,i1,iIN)) 
coup(4) = Conjg(cplcFdChaSuL(i1,gt2,gt3)) 
coup(3) = Conjg(cplcFdChaSuR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cFu Cha Su Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,5
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFuChiSuL(gt1,i1,gt3)) 
coup(3) = Conjg(cplcFuChiSuR(gt1,i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cFu Cha Su Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt1,i1,iIN) 
coup(2) = cplcFuFdcHpmR(gt1,i1,iIN) 
coup(3) = cplcFdChaSuL(i1,gt2,gt3) 
coup(4) = cplcFdChaSuR(i1,gt2,gt3) 
coup(5) = cplcFuFdcHpmL(gt1,i2,iIN) 
coup(6) = cplcFuFdcHpmR(gt1,i2,iIN)  
coup(7) = cplcFdChaSuL(i2,gt2,gt3) 
coup(8) = cplcFdChaSuR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cFu Cha Su Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MChi(i2)  
coup(1) = cplcFuFdcHpmL(gt1,i1,iIN) 
coup(2) = cplcFuFdcHpmR(gt1,i1,iIN) 
coup(3) = cplcFdChaSuL(i1,gt2,gt3) 
coup(4) = cplcFdChaSuR(i1,gt2,gt3) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplcFuChiSuL(gt1,i2,gt3) 
coup(8) = cplcFuChiSuR(gt1,i2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cFu Cha Su Propagator: Fd,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChacHpmL(i1,gt2,iIN) 
coup(2) = cplChiChacHpmR(i1,gt2,iIN) 
coup(3) = cplcFuChiSuL(gt1,i1,gt3) 
coup(4) = cplcFuChiSuR(gt1,i1,gt3) 
coup(5) = cplChiChacHpmL(i2,gt2,iIN) 
coup(6) = cplChiChacHpmR(i2,gt2,iIN)  
coup(7) = cplcFuChiSuL(gt1,i2,gt3) 
coup(8) = cplcFuChiSuR(gt1,i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cFu Cha Su Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmTocFuChaSu 
 
 
Subroutine HpmToHpmChiChi(iIN,MHpm,MChi,MVZ,MAh,Mhh,MCha,cplAhHpmcHpm,cplhhHpmcHpm,   & 
& cplHpmcHpmVZ,cplcChaChiHpmL,cplcChaChiHpmR,cplChiChacHpmL,cplChiChacHpmR,              & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MChi(5),MVZ,MAh(3),Mhh(3),MCha(2)

Complex(dp),Intent(in) :: cplAhHpmcHpm(3,2,2),cplhhHpmcHpm(3,2,2),cplHpmcHpmVZ(2,2),cplcChaChiHpmL(2,5,2),      & 
& cplcChaChiHpmR(2,5,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChiAhL(5,5,3), & 
& cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),         & 
& cplChiChiVZR(5,5)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 81 
Allocate( gSum(2,5,5, Isum) ) 
Allocate( Contribution(2,5,5, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,5
        Do gt3=gt2,5
Isum = 0 
 
rk2 = (MChi(gt2)/MHpm(iIN))**2 
rm2 = (MChi(gt3)/MHpm(iIN))**2 
rj2 = (MHpm(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplHpmcHpmVZ(gt1,iIN)) 
coup(3) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(2) = Conjg(cplChiChiVZR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MVZ 
mass(2) = MVZ 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplHpmcHpmVZ(gt1,iIN)) 
coup(3) = Conjg(cplChiChiVZL(gt3,gt2)) 
coup(2) = Conjg(cplChiChiVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiChiAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MAh(i1)  
mass(2) = MAh(i1)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChiAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(6) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChihhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiChihhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChihhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh(i1)  
mass(2) = Mhh(i1)  
coup(1) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChihhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChihhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(6) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplChiChihhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcChaChiHpmL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcChaChiHpmL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MCha(i1)  
mass(2) = MCha(i1)  
coup(1) = cplChiChacHpmL(gt3,i1,iIN) 
coup(2) = cplChiChacHpmR(gt3,i1,iIN) 
coup(3) = cplcChaChiHpmL(i1,gt2,gt1) 
coup(4) = cplcChaChiHpmR(i1,gt2,gt1) 
coup(5) = cplChiChacHpmL(gt2,i1,iIN) 
coup(6) = cplChiChacHpmR(gt2,i1,iIN)  
coup(7) = cplcChaChiHpmL(i1,gt3,gt1) 
coup(8) = cplcChaChiHpmR(i1,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, Cha 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MCha2(i2)  
coup(1) = cplChiChacHpmL(gt2,i2,iIN) 
coup(2) = cplChiChacHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i2,gt3,gt1))  
coup(5) = cplHpmcHpmVZ(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MVZ2  
mass(1) = MCha2(i2)  
coup(1) = cplChiChacHpmL(gt3,i2,iIN) 
coup(2) = cplChiChacHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i2,gt2,gt1))  
coup(5) = cplHpmcHpmVZ(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: VZ,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Cha'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiChiAhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiChihhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Cha 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i2,iIN) 
coup(2) = cplChiChacHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i2,gt3,gt1))  
coup(5) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MAh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt3,i2,iIN) 
coup(2) = cplChiChacHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i2,gt2,gt1))  
coup(5) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: Ah,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Cha'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChihhR(gt2,gt3,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiChihhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Cha 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i2,iIN) 
coup(2) = cplChiChacHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i2,gt3,gt1))  
coup(5) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = Mhh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt3,i2,iIN) 
coup(2) = cplChiChacHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i2,gt2,gt1))  
coup(5) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: hh,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaChiHpmL(i1,gt3,gt1) 
coup(4) = cplcChaChiHpmR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(gt2,i2,iIN) 
coup(6) = cplChiChacHpmR(gt2,i2,iIN)  
coup(7) = cplcChaChiHpmL(i2,gt3,gt1) 
coup(8) = cplcChaChiHpmR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt3,i1,iIN) 
coup(2) = cplChiChacHpmR(gt3,i1,iIN) 
coup(3) = cplcChaChiHpmL(i1,gt2,gt1) 
coup(4) = cplcChaChiHpmR(i1,gt2,gt1) 
coup(5) = cplChiChacHpmL(gt2,i2,iIN) 
coup(6) = cplChiChacHpmR(gt2,i2,iIN)  
coup(7) = cplcChaChiHpmL(i2,gt3,gt1) 
coup(8) = cplcChaChiHpmR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt3,i1,iIN) 
coup(2) = cplChiChacHpmR(gt3,i1,iIN) 
coup(3) = cplcChaChiHpmL(i1,gt2,gt1) 
coup(4) = cplcChaChiHpmR(i1,gt2,gt1) 
coup(5) = cplChiChacHpmL(gt3,i2,iIN) 
coup(6) = cplChiChacHpmR(gt3,i2,iIN)  
coup(7) = cplcChaChiHpmL(i2,gt2,gt1) 
coup(8) = cplcChaChiHpmR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaChiHpmL(i1,gt3,gt1) 
coup(4) = cplcChaChiHpmR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(gt3,i2,iIN) 
coup(6) = cplChiChacHpmR(gt3,i2,iIN)  
coup(7) = cplcChaChiHpmL(i2,gt2,gt1) 
coup(8) = cplcChaChiHpmR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Chi Chi Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2, iIN-1
      Do gt2=1,5
        Do gt3=gt2,5
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToHpmChiChi 
 
 
Subroutine HpmTocSuChiFd(iIN,MSu,MChi,MFd,MSd,MCha,MFu,MHpm,cplSdcHpmcSu,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplChiChacHpmL,cplChiChacHpmR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSu(6),MChi(5),MFd(3),MSd(6),MCha(2),MFu(3),MHpm(2)

Complex(dp),Intent(in) :: cplSdcHpmcSu(6,2,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),   & 
& cplcFuFdcHpmR(3,3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiFdcSdL(5,3,6),  & 
& cplChiFdcSdR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 121 
Allocate( gSum(6,5,3, Isum) ) 
Allocate( Contribution(6,5,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MHpm(iIN))**2 
rm2 = (MFd(gt3)/MHpm(iIN))**2 
rj2 = (MSu(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFd(gt3))+Abs(MChi(gt2))+Abs(MSu(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSdcHpmcSu(i1,iIN,gt1)) 
coup(3) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFdcSdR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Chi Fd Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcChaFdcSuL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcChaFdcSuR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Chi Fd Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  bar[Fu] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(i1,gt3,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiFucSuL(gt2,i1,gt1)) 
coup(3) = Conjg(cplChiFucSuR(gt2,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Chi Fd Propagator: bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu]'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSd(i1)  
mass(2) = MSd(i2)  
coup(1) = cplSdcHpmcSu(i1,iIN,gt1) 
coup(3) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
coup(4) = cplSdcHpmcSu(i2,iIN,gt1) 
coup(6) = Conjg(cplChiFdcSdL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFdcSdR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Chi Fd Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Cha 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i2,iIN) 
coup(2) = cplChiChacHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChaFdcSuL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChaFdcSuR(i2,gt3,gt1))  
coup(5) = cplSdcHpmcSu(i1,iIN,gt1) 
coup(7) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Chi Fd Propagator: Sd,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Cha'
        End Do 
      End Do 



!-------------- 
!  Sd, bar[Fu] 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i2,gt3,iIN) 
coup(2) = cplcFuFdcHpmR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFucSuL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFucSuR(gt2,i2,gt1))  
coup(5) = cplSdcHpmcSu(i1,iIN,gt1) 
coup(7) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Chi Fd Propagator: Sd,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaFdcSuL(i1,gt3,gt1) 
coup(4) = cplcChaFdcSuR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(gt2,i2,iIN) 
coup(6) = cplChiChacHpmR(gt2,i2,iIN)  
coup(7) = cplcChaFdcSuL(i2,gt3,gt1) 
coup(8) = cplcChaFdcSuR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Chi Fd Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFu(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaFdcSuL(i1,gt3,gt1) 
coup(4) = cplcChaFdcSuR(i1,gt3,gt1) 
coup(5) = cplcFuFdcHpmL(i2,gt3,iIN) 
coup(6) = cplcFuFdcHpmR(i2,gt3,iIN)  
coup(7) = cplChiFucSuL(gt2,i2,gt1) 
coup(8) = cplChiFucSuR(gt2,i2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Chi Fd Propagator: Cha,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i1,gt3,iIN) 
coup(2) = cplcFuFdcHpmR(i1,gt3,iIN) 
coup(3) = cplChiFucSuL(gt2,i1,gt1) 
coup(4) = cplChiFucSuR(gt2,i1,gt1) 
coup(5) = cplcFuFdcHpmL(i2,gt3,iIN) 
coup(6) = cplcFuFdcHpmR(i2,gt3,iIN)  
coup(7) = cplChiFucSuL(gt2,i2,gt1) 
coup(8) = cplChiFucSuR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Chi Fd Propagator: bar[Fu],bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],bar[Fu]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmTocSuChiFd 
 
 
Subroutine HpmToSvImChiFe(iIN,MSvIm,MChi,MFe,MSe,MCha,MFv,MHpm,cplSeSvImcHpm,         & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplChiChacHpmL,cplChiChacHpmR,cplChiFecSeL,              & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplFvFecHpmL,cplFvFecHpmR,deltaM,             & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSvIm(9),MChi(5),MFe(3),MSe(6),MCha(2),MFv(9),MHpm(2)

Complex(dp),Intent(in) :: cplSeSvImcHpm(6,9,2),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplChiChacHpmL(5,2,2),& 
& cplChiChacHpmR(5,2,2),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,9,9),    & 
& cplChiFvSvImR(5,9,9),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 289 
Allocate( gSum(9,5,3, Isum) ) 
Allocate( Contribution(9,5,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,9
      Do gt2=1,5
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MHpm(iIN))**2 
rm2 = (MFe(gt3)/MHpm(iIN))**2 
rj2 = (MSvIm(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFe(gt3))+Abs(MChi(gt2))+Abs(MSvIm(gt1)))) Then 
!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSe(i1) 
mass(2) = MSe(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvImcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFecSeR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Chi Fe Propagator: Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Se'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcChaFeSvImL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcChaFeSvImR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Chi Fe Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiFvSvImL(gt2,i1,gt1)) 
coup(3) = Conjg(cplChiFvSvImR(gt2,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Chi Fe Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSe(i1)  
mass(2) = MSe(i2)  
coup(1) = cplSeSvImcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
coup(4) = cplSeSvImcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplChiFecSeL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFecSeR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Chi Fe Propagator: Se,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Se'
        End Do 
      End Do 



!-------------- 
!  Se, Cha 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i2,iIN) 
coup(2) = cplChiChacHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChaFeSvImL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChaFeSvImR(i2,gt3,gt1))  
coup(5) = cplSeSvImcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Chi Fe Propagator: Se,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Cha'
        End Do 
      End Do 



!-------------- 
!  Se, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFecHpmL(i2,gt3,iIN) 
coup(2) = cplFvFecHpmR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFvSvImL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFvSvImR(gt2,i2,gt1))  
coup(5) = cplSeSvImcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Chi Fe Propagator: Se,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Fv'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaFeSvImL(i1,gt3,gt1) 
coup(4) = cplcChaFeSvImR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(gt2,i2,iIN) 
coup(6) = cplChiChacHpmR(gt2,i2,iIN)  
coup(7) = cplcChaFeSvImL(i2,gt3,gt1) 
coup(8) = cplcChaFeSvImR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Chi Fe Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Fv 
!-------------- 
Do i1=1,2
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaFeSvImL(i1,gt3,gt1) 
coup(4) = cplcChaFeSvImR(i1,gt3,gt1) 
coup(5) = cplFvFecHpmL(i2,gt3,iIN) 
coup(6) = cplFvFecHpmR(i2,gt3,iIN)  
coup(7) = cplChiFvSvImL(gt2,i2,gt1) 
coup(8) = cplChiFvSvImR(gt2,i2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Chi Fe Propagator: Cha,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt3,iIN) 
coup(2) = cplFvFecHpmR(i1,gt3,iIN) 
coup(3) = cplChiFvSvImL(gt2,i1,gt1) 
coup(4) = cplChiFvSvImR(gt2,i1,gt1) 
coup(5) = cplFvFecHpmL(i2,gt3,iIN) 
coup(6) = cplFvFecHpmR(i2,gt3,iIN)  
coup(7) = cplChiFvSvImL(gt2,i2,gt1) 
coup(8) = cplChiFvSvImR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvIm Chi Fe Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,9
      Do gt2=1,5
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:289))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToSvImChiFe 
 
 
Subroutine HpmToSvReChiFe(iIN,MSvRe,MChi,MFe,MSe,MCha,MFv,MHpm,cplSeSvRecHpm,         & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplChiChacHpmL,cplChiChacHpmR,cplChiFecSeL,              & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,deltaM,             & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSvRe(9),MChi(5),MFe(3),MSe(6),MCha(2),MFv(9),MHpm(2)

Complex(dp),Intent(in) :: cplSeSvRecHpm(6,9,2),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplChiChacHpmL(5,2,2),& 
& cplChiChacHpmR(5,2,2),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvReL(5,9,9),    & 
& cplChiFvSvReR(5,9,9),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 289 
Allocate( gSum(9,5,3, Isum) ) 
Allocate( Contribution(9,5,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,9
      Do gt2=1,5
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MHpm(iIN))**2 
rm2 = (MFe(gt3)/MHpm(iIN))**2 
rj2 = (MSvRe(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFe(gt3))+Abs(MChi(gt2))+Abs(MSvRe(gt1)))) Then 
!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSe(i1) 
mass(2) = MSe(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvRecHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFecSeR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Chi Fe Propagator: Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Se'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcChaFeSvReL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcChaFeSvReR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Chi Fe Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiFvSvReL(gt2,i1,gt1)) 
coup(3) = Conjg(cplChiFvSvReR(gt2,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Chi Fe Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSe(i1)  
mass(2) = MSe(i2)  
coup(1) = cplSeSvRecHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
coup(4) = cplSeSvRecHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplChiFecSeL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFecSeR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Chi Fe Propagator: Se,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Se'
        End Do 
      End Do 



!-------------- 
!  Se, Cha 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i2,iIN) 
coup(2) = cplChiChacHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChaFeSvReL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChaFeSvReR(i2,gt3,gt1))  
coup(5) = cplSeSvRecHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Chi Fe Propagator: Se,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Cha'
        End Do 
      End Do 



!-------------- 
!  Se, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFecHpmL(i2,gt3,iIN) 
coup(2) = cplFvFecHpmR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFvSvReL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFvSvReR(gt2,i2,gt1))  
coup(5) = cplSeSvRecHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Chi Fe Propagator: Se,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Fv'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaFeSvReL(i1,gt3,gt1) 
coup(4) = cplcChaFeSvReR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(gt2,i2,iIN) 
coup(6) = cplChiChacHpmR(gt2,i2,iIN)  
coup(7) = cplcChaFeSvReL(i2,gt3,gt1) 
coup(8) = cplcChaFeSvReR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Chi Fe Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Fv 
!-------------- 
Do i1=1,2
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaFeSvReL(i1,gt3,gt1) 
coup(4) = cplcChaFeSvReR(i1,gt3,gt1) 
coup(5) = cplFvFecHpmL(i2,gt3,iIN) 
coup(6) = cplFvFecHpmR(i2,gt3,iIN)  
coup(7) = cplChiFvSvReL(gt2,i2,gt1) 
coup(8) = cplChiFvSvReR(gt2,i2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Chi Fe Propagator: Cha,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt3,iIN) 
coup(2) = cplFvFecHpmR(i1,gt3,iIN) 
coup(3) = cplChiFvSvReL(gt2,i1,gt1) 
coup(4) = cplChiFvSvReR(gt2,i1,gt1) 
coup(5) = cplFvFecHpmL(i2,gt3,iIN) 
coup(6) = cplFvFecHpmR(i2,gt3,iIN)  
coup(7) = cplChiFvSvReL(gt2,i2,gt1) 
coup(8) = cplChiFvSvReR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->SvRe Chi Fe Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,9
      Do gt2=1,5
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:289))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToSvReChiFe 
 
 
Subroutine HpmToSeChiFv(iIN,MSe,MChi,MFv,MSvIm,MSvRe,MCha,MFe,MHpm,cplSeSvImcHpm,     & 
& cplSeSvRecHpm,cplcChaFvSeL,cplcChaFvSeR,cplcFeChiSeL,cplcFeChiSeR,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,   & 
& cplFvFecHpmR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSe(6),MChi(5),MFv(9),MSvIm(9),MSvRe(9),MCha(2),MFe(3),MHpm(2)

Complex(dp),Intent(in) :: cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),    & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),   & 
& cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 529 
Allocate( gSum(6,5,9, Isum) ) 
Allocate( Contribution(6,5,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,9
Isum = 0 
 
rk2 = (MChi(gt2)/MHpm(iIN))**2 
rm2 = (MFv(gt3)/MHpm(iIN))**2 
rj2 = (MSe(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFv(gt3))+Abs(MChi(gt2))+Abs(MSe(gt1)))) Then 
!-------------- 
!  SvIm 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvIm(i1) 
mass(2) = MSvIm(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvImcHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvImR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm'
      End Do 



!-------------- 
!  SvRe 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvRe(i1) 
mass(2) = MSvRe(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvRecHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvReR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcChaFvSeL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcChaFvSeR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeChiSeL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  SvIm, SvIm 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvIm(i2)  
coup(1) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
coup(4) = cplSeSvImcHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplChiFvSvImL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvSvImR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: SvIm,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvIm'
        End Do 
      End Do 



!-------------- 
!  SvIm, SvRe 
!-------------- 
Do i1=1,9
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
coup(4) = cplSeSvRecHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplChiFvSvReL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvSvReR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: SvIm,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvIm, Cha 
!-------------- 
Do i1=1,9
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i2,iIN) 
coup(2) = cplChiChacHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChaFvSeL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChaFvSeR(i2,gt3,gt1))  
coup(5) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: SvIm,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,Cha'
        End Do 
      End Do 



!-------------- 
!  SvIm, Fe 
!-------------- 
Do i1=1,9
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChiSeL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(i2,gt2,gt1))  
coup(5) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: SvIm,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,Fe'
        End Do 
      End Do 



!-------------- 
!  SvRe, SvRe 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvRe(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplSeSvRecHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvReR(gt2,gt3,i1))  
coup(4) = cplSeSvRecHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplChiFvSvReL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvSvReR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: SvRe,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvRe, Cha 
!-------------- 
Do i1=1,9
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i2,iIN) 
coup(2) = cplChiChacHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChaFvSeL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChaFvSeR(i2,gt3,gt1))  
coup(5) = cplSeSvRecHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvReR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: SvRe,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,Cha'
        End Do 
      End Do 



!-------------- 
!  SvRe, Fe 
!-------------- 
Do i1=1,9
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChiSeL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(i2,gt2,gt1))  
coup(5) = cplSeSvRecHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvReR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: SvRe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,Fe'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaFvSeL(i1,gt3,gt1) 
coup(4) = cplcChaFvSeR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(gt2,i2,iIN) 
coup(6) = cplChiChacHpmR(gt2,i2,iIN)  
coup(7) = cplcChaFvSeL(i2,gt3,gt1) 
coup(8) = cplcChaFvSeR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Fe 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFe(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChaFvSeL(i1,gt3,gt1) 
coup(4) = cplcChaFvSeR(i1,gt3,gt1) 
coup(5) = cplFvFecHpmL(gt3,i2,iIN) 
coup(6) = cplFvFecHpmR(gt3,i2,iIN)  
coup(7) = cplcFeChiSeL(i2,gt2,gt1) 
coup(8) = cplcFeChiSeR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: Cha,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeChiSeL(i1,gt2,gt1) 
coup(4) = cplcFeChiSeR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(gt3,i2,iIN) 
coup(6) = cplFvFecHpmR(gt3,i2,iIN)  
coup(7) = cplcFeChiSeL(i2,gt2,gt1) 
coup(8) = cplcFeChiSeR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Chi Fv Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,9
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:529))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToSeChiFv 
 
 
Subroutine HpmToSdChicFu(iIN,MSd,MChi,MFu,MSu,MCha,MFd,MHpm,cplSdcHpmcSu,             & 
& cplcChacFuSdL,cplcChacFuSdR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplChiChacHpmL,cplChiChacHpmR,deltaM,epsI,check,           & 
& g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MChi(5),MFu(3),MSu(6),MCha(2),MFd(3),MHpm(2)

Complex(dp),Intent(in) :: cplSdcHpmcSu(6,2,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcFdChiSdL(3,5,6),    & 
& cplcFdChiSdR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFuFdcHpmL(3,3,2),      & 
& cplcFuFdcHpmR(3,3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 121 
Allocate( gSum(6,5,3, Isum) ) 
Allocate( Contribution(6,5,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MHpm(iIN))**2 
rm2 = (MFu(gt3)/MHpm(iIN))**2 
rj2 = (MSd(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFu(gt3))+Abs(MChi(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSu(i1) 
mass(2) = MSu(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSdcHpmcSu(gt1,iIN,i1)) 
coup(3) = Conjg(cplcFuChiSuL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuChiSuR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Chi cFu Propagator: conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su]'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplChiChacHpmL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiChacHpmR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcChacFuSdL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Chi cFu Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFdChiSdL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Chi cFu Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  conj[Su], conj[Su] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSu(i1)  
mass(2) = MSu(i2)  
coup(1) = cplSdcHpmcSu(gt1,iIN,i1) 
coup(3) = Conjg(cplcFuChiSuL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuChiSuR(gt3,gt2,i1))  
coup(4) = cplSdcHpmcSu(gt1,iIN,i2) 
coup(6) = Conjg(cplcFuChiSuL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuChiSuR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Chi cFu Propagator: conj[Su],conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],conj[Su]'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Cha 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i2,iIN) 
coup(2) = cplChiChacHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChacFuSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(i2,gt3,gt1))  
coup(5) = cplSdcHpmcSu(gt1,iIN,i1) 
coup(7) = Conjg(cplcFuChiSuL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuChiSuR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Chi cFu Propagator: conj[Su],Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],Cha'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Fd 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i2,gt2,gt1))  
coup(5) = cplSdcHpmcSu(gt1,iIN,i1) 
coup(7) = Conjg(cplcFuChiSuL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuChiSuR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Chi cFu Propagator: conj[Su],Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],Fd'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChacFuSdL(i1,gt3,gt1) 
coup(4) = cplcChacFuSdR(i1,gt3,gt1) 
coup(5) = cplChiChacHpmL(gt2,i2,iIN) 
coup(6) = cplChiChacHpmR(gt2,i2,iIN)  
coup(7) = cplcChacFuSdL(i2,gt3,gt1) 
coup(8) = cplcChacFuSdR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Chi cFu Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Fd 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiChacHpmL(gt2,i1,iIN) 
coup(2) = cplChiChacHpmR(gt2,i1,iIN) 
coup(3) = cplcChacFuSdL(i1,gt3,gt1) 
coup(4) = cplcChacFuSdR(i1,gt3,gt1) 
coup(5) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(6) = cplcFuFdcHpmR(gt3,i2,iIN)  
coup(7) = cplcFdChiSdL(i2,gt2,gt1) 
coup(8) = cplcFdChiSdR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Chi cFu Propagator: Cha,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i1,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i1,iIN) 
coup(3) = cplcFdChiSdL(i1,gt2,gt1) 
coup(4) = cplcFdChiSdR(i1,gt2,gt1) 
coup(5) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(6) = cplcFuFdcHpmR(gt3,i2,iIN)  
coup(7) = cplcFdChiSdL(i2,gt2,gt1) 
coup(8) = cplcFdChiSdR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Chi cFu Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToSdChicFu 
 
 
Subroutine HpmTocSuFdGlu(iIN,MSu,MFd,MGlu,MSd,MFu,MHpm,cplSdcHpmcSu,cplcFuFdcHpmL,    & 
& cplcFuFdcHpmR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM,              & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSu(6),MFd(3),MGlu,MSd(6),MFu(3),MHpm(2)

Complex(dp),Intent(in) :: cplSdcHpmcSu(6,2,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplGluFdcSdL(3,6),      & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 81 
Allocate( gSum(6,3,1, Isum) ) 
Allocate( Contribution(6,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MHpm(iIN))**2 
rm2 = (MGlu/MHpm(iIN))**2 
rj2 = (MSu(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MGlu)+Abs(MFd(gt2))+Abs(MSu(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSdcHpmcSu(i1,iIN,gt1)) 
coup(3) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(2) = Conjg(cplGluFdcSdR(gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Fd Glu Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='Sd'
      End Do 



!-------------- 
!  bar[Fu] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplGluFucSuL(i1,gt1)) 
coup(3) = Conjg(cplGluFucSuR(i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Fd Glu Propagator: bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='bar[Fu]'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSd(i1)  
mass(2) = MSd(i2)  
coup(1) = cplSdcHpmcSu(i1,iIN,gt1) 
coup(3) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(2) = Conjg(cplGluFdcSdR(gt2,i1))  
coup(4) = cplSdcHpmcSu(i2,iIN,gt1) 
coup(6) = Conjg(cplGluFdcSdL(gt2,i2)) 
coup(5) = Conjg(cplGluFdcSdR(gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Fd Glu Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, bar[Fu] 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplGluFucSuL(i2,gt1)) 
coup(3) = Conjg(cplGluFucSuR(i2,gt1))  
coup(5) = cplSdcHpmcSu(i1,iIN,gt1) 
coup(7) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(6) = Conjg(cplGluFdcSdR(gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Fd Glu Propagator: Sd,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Sd,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i1,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i1,gt2,iIN) 
coup(3) = cplGluFucSuL(i1,gt1) 
coup(4) = cplGluFucSuR(i1,gt1) 
coup(5) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(6) = cplcFuFdcHpmR(i2,gt2,iIN)  
coup(7) = cplGluFucSuL(i2,gt1) 
coup(8) = cplGluFucSuR(i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->cSu Fd Glu Propagator: bar[Fu],bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='bar[Fu],bar[Fu]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,1,:)= 0._dp  
End If 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,3
g(gt1,gt2,1)=Sum(gSum(gt1,gt2,1,1:81))
If (g(gt1,gt2,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,1)=0._dp
End If
     End Do 
   End Do 
End Subroutine HpmTocSuFdGlu 
 
 
Subroutine HpmTohhFdcFu(iIN,Mhh,MFd,MFu,MVWm,MHpm,cplhhcHpmVWm,cplhhHpmcHpm,          & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplcFuFuhhL,cplcFuFuhhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(3),MFd(3),MFu(3),MVWm,MHpm(2)

Complex(dp),Intent(in) :: cplhhcHpmVWm(3,2),cplhhHpmcHpm(3,2,2),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),          & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MHpm(iIN))**2 
rm2 = (MFu(gt3)/MHpm(iIN))**2 
rj2 = (Mhh(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhcHpmVWm(gt1,iIN)) 
coup(3) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFdcVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  bar[Fu] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFuFuhhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu]'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFdFdhhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplhhcHpmVWm(gt1,iIN) 
coup(2) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
coup(4) = cplhhHpmcHpm(gt1,i2,iIN) 
coup(5) = Conjg(cplcFuFdcHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, bar[Fu] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFu2(i2)  
coup(1) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(gt3,i2,gt1))  
coup(5) = cplhhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: VWm,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,bar[Fu]'
      End Do 



!-------------- 
!  VWm, Fd 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFd2(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdFdhhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(i2,gt2,gt1))  
coup(5) = cplhhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: VWm,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Fd'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplhhHpmcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplcFuFdcHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFdcHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(gt3,i2,gt1))  
coup(5) = cplhhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: Hpm,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fd 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdFdhhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(i2,gt2,gt1))  
coup(5) = cplhhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: Hpm,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Fd'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i1,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i1,gt2,iIN) 
coup(3) = cplcFuFuhhL(gt3,i1,gt1) 
coup(4) = cplcFuFuhhR(gt3,i1,gt1) 
coup(5) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(6) = cplcFuFdcHpmR(i2,gt2,iIN)  
coup(7) = cplcFuFuhhL(gt3,i2,gt1) 
coup(8) = cplcFuFuhhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: bar[Fu],bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], Fd 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(i1,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i1,gt2,iIN) 
coup(3) = cplcFuFuhhL(gt3,i1,gt1) 
coup(4) = cplcFuFuhhR(gt3,i1,gt1) 
coup(5) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(6) = cplcFuFdcHpmR(gt3,i2,iIN)  
coup(7) = cplcFdFdhhL(i2,gt2,gt1) 
coup(8) = cplcFdFdhhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: bar[Fu],Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i1,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i1,iIN) 
coup(3) = cplcFdFdhhL(i1,gt2,gt1) 
coup(4) = cplcFdFdhhR(i1,gt2,gt1) 
coup(5) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(6) = cplcFuFdcHpmR(gt3,i2,iIN)  
coup(7) = cplcFdFdhhL(i2,gt2,gt1) 
coup(8) = cplcFdFdhhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fd cFu Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmTohhFdcFu 
 
 
Subroutine HpmToHpmFdcFd(iIN,MHpm,MFd,MVZ,MAh,Mhh,MFu,cplAhHpmcHpm,cplhhHpmcHpm,      & 
& cplHpmcHpmVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,deltaM,              & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MFd(3),MVZ,MAh(3),Mhh(3),MFu(3)

Complex(dp),Intent(in) :: cplAhHpmcHpm(3,2,2),cplhhHpmcHpm(3,2,2),cplHpmcHpmVZ(2,2),cplcFdFdAhL(3,3,3),         & 
& cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFuFdcHpmL(3,3,2),         & 
& cplcFuFdcHpmR(3,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 100 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MHpm(iIN))**2 
rm2 = (MFd(gt3)/MHpm(iIN))**2 
rj2 = (MHpm(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplHpmcHpmVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  bar[Fu] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFdFuHpmL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu]'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, bar[Fu] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFu2(i2)  
coup(1) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFuHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(gt3,i2,gt1))  
coup(5) = cplHpmcHpmVZ(gt1,iIN) 
coup(7) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: VZ,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,bar[Fu]'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, bar[Fu] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFuHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(gt3,i2,gt1))  
coup(5) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: Ah,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, bar[Fu] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFuHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(gt3,i2,gt1))  
coup(5) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: hh,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFdcHpmL(i1,gt2,iIN) 
coup(2) = cplcFuFdcHpmR(i1,gt2,iIN) 
coup(3) = cplcFdFuHpmL(gt3,i1,gt1) 
coup(4) = cplcFdFuHpmR(gt3,i1,gt1) 
coup(5) = cplcFuFdcHpmL(i2,gt2,iIN) 
coup(6) = cplcFuFdcHpmR(i2,gt2,iIN)  
coup(7) = cplcFdFuHpmL(gt3,i2,gt1) 
coup(8) = cplcFdFuHpmR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fd cFd Propagator: bar[Fu],bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],bar[Fu]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToHpmFdcFd 
 
 
Subroutine HpmToFeFecHpm(iIN,MFe,MHpm,MFv,cplFvFecHpmL,cplFvFecHpmR,deltaM,           & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MHpm(2),MFv(9)

Complex(dp),Intent(in) :: cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,2, Isum) ) 
Allocate( Contribution(3,3,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=gt1,3
        Do gt3=2,2
Isum = 0 
 
rk2 = (MFe(gt1)/MHpm(iIN))**2 
rm2 = (MFe(gt2)/MHpm(iIN))**2 
rj2 = (MHpm(gt3)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MHpm(gt3))+Abs(MFe(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  Fv 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(i1,gt1,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(i1,gt1,iIN)) 
coup(4) = Conjg(cplFvFecHpmL(i1,gt2,gt3)) 
coup(3) = Conjg(cplFvFecHpmR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvFecHpmL(i1,gt1,gt3)) 
coup(3) = Conjg(cplFvFecHpmR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1)  
mass(2) = MFv(i1)  
coup(1) = cplFvFecHpmL(i1,gt2,iIN) 
coup(2) = cplFvFecHpmR(i1,gt2,iIN) 
coup(3) = cplFvFecHpmL(i1,gt1,gt3) 
coup(4) = cplFvFecHpmR(i1,gt1,gt3) 
coup(5) = cplFvFecHpmL(i1,gt1,iIN) 
coup(6) = cplFvFecHpmR(i1,gt1,iIN)  
coup(7) = cplFvFecHpmL(i1,gt2,gt3) 
coup(8) = cplFvFecHpmR(i1,gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Fe Fe cHpm Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt1,iIN) 
coup(2) = cplFvFecHpmR(i1,gt1,iIN) 
coup(3) = cplFvFecHpmL(i1,gt2,gt3) 
coup(4) = cplFvFecHpmR(i1,gt2,gt3) 
coup(5) = cplFvFecHpmL(i2,gt1,iIN) 
coup(6) = cplFvFecHpmR(i2,gt1,iIN)  
coup(7) = cplFvFecHpmL(i2,gt2,gt3) 
coup(8) = cplFvFecHpmR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt2,iIN) 
coup(2) = cplFvFecHpmR(i1,gt2,iIN) 
coup(3) = cplFvFecHpmL(i1,gt1,gt3) 
coup(4) = cplFvFecHpmR(i1,gt1,gt3) 
coup(5) = cplFvFecHpmL(i2,gt1,iIN) 
coup(6) = cplFvFecHpmR(i2,gt1,iIN)  
coup(7) = cplFvFecHpmL(i2,gt2,gt3) 
coup(8) = cplFvFecHpmR(i2,gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt2,iIN) 
coup(2) = cplFvFecHpmR(i1,gt2,iIN) 
coup(3) = cplFvFecHpmL(i1,gt1,gt3) 
coup(4) = cplFvFecHpmR(i1,gt1,gt3) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplFvFecHpmL(i2,gt1,gt3) 
coup(8) = cplFvFecHpmR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt1,iIN) 
coup(2) = cplFvFecHpmR(i1,gt1,iIN) 
coup(3) = cplFvFecHpmL(i1,gt2,gt3) 
coup(4) = cplFvFecHpmR(i1,gt2,gt3) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplFvFecHpmL(i2,gt1,gt3) 
coup(8) = cplFvFecHpmR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Fe Fe cHpm Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=gt1,3
        Do gt3=2,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToFeFecHpm 
 
 
Subroutine HpmTohhFeFv(iIN,Mhh,MFe,MFv,MVWm,MHpm,cplhhcHpmVWm,cplhhHpmcHpm,           & 
& cplcFeFehhL,cplcFeFehhR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,           & 
& cplFvFvhhL,cplFvFvhhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(3),MFe(3),MFv(9),MVWm,MHpm(2)

Complex(dp),Intent(in) :: cplhhcHpmVWm(3,2),cplhhHpmcHpm(3,2,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),          & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),           & 
& cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 225 
Allocate( gSum(3,3,9, Isum) ) 
Allocate( Contribution(3,3,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,9
Isum = 0 
 
rk2 = (MFe(gt2)/MHpm(iIN))**2 
rm2 = (MFv(gt3)/MHpm(iIN))**2 
rj2 = (Mhh(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhcHpmVWm(gt1,iIN)) 
coup(3) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(2) = Conjg(cplFvFecVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFecHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeFehhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvFvhhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplhhcHpmVWm(gt1,iIN) 
coup(2) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(3) = Conjg(cplFvFecVWmR(gt3,gt2))  
coup(4) = cplhhHpmcHpm(gt1,i2,iIN) 
coup(5) = Conjg(cplFvFecHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplFvFecHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, Fe 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFe2(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeFehhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(i2,gt2,gt1))  
coup(5) = cplhhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: VWm,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Fe'
      End Do 



!-------------- 
!  VWm, Fv 
!-------------- 
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFecHpmL(i2,gt2,iIN) 
coup(2) = cplFvFecHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt3,gt1))  
coup(5) = cplhhcHpmVWm(gt1,iIN) 
coup(7) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: VWm,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Fv'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplhhHpmcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplFvFecHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplFvFecHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fe 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeFehhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(i2,gt2,gt1))  
coup(5) = cplhhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: Hpm,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Fe'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fv 
!-------------- 
Do i1=1,2
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFecHpmL(i2,gt2,iIN) 
coup(2) = cplFvFecHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt3,gt1))  
coup(5) = cplhhHpmcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: Hpm,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Fv'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeFehhL(i1,gt2,gt1) 
coup(4) = cplcFeFehhR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(gt3,i2,iIN) 
coup(6) = cplFvFecHpmR(gt3,i2,iIN)  
coup(7) = cplcFeFehhL(i2,gt2,gt1) 
coup(8) = cplcFeFehhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Fv 
!-------------- 
Do i1=1,3
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeFehhL(i1,gt2,gt1) 
coup(4) = cplcFeFehhR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplFvFvhhL(i2,gt3,gt1) 
coup(8) = cplFvFvhhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: Fe,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt2,iIN) 
coup(2) = cplFvFecHpmR(i1,gt2,iIN) 
coup(3) = cplFvFvhhL(i1,gt3,gt1) 
coup(4) = cplFvFvhhR(i1,gt3,gt1) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplFvFvhhL(i2,gt3,gt1) 
coup(8) = cplFvFvhhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->hh Fe Fv Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,9
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:225))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmTohhFeFv 
 
 
Subroutine HpmToHpmFecFe(iIN,MHpm,MFe,MVZ,MAh,Mhh,MFv,cplAhHpmcHpm,cplhhHpmcHpm,      & 
& cplHpmcHpmVZ,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplFvFecHpmL,cplFvFecHpmR,deltaM,epsI,           & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MFe(3),MVZ,MAh(3),Mhh(3),MFv(9)

Complex(dp),Intent(in) :: cplAhHpmcHpm(3,2,2),cplhhHpmcHpm(3,2,2),cplHpmcHpmVZ(2,2),cplcFeFeAhL(3,3,3),         & 
& cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZR(3,3),cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),cplFvFecHpmL(9,3,2),          & 
& cplFvFecHpmR(9,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 256 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt2)/MHpm(iIN))**2 
rm2 = (MFe(gt3)/MHpm(iIN))**2 
rj2 = (MHpm(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplHpmcHpmVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeFvHpmL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, Fv 
!-------------- 
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFecHpmL(i2,gt2,iIN) 
coup(2) = cplFvFecHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFvHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(gt3,i2,gt1))  
coup(5) = cplHpmcHpmVZ(gt1,iIN) 
coup(7) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFeVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: VZ,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Fv'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Fv 
!-------------- 
Do i1=1,3
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFecHpmL(i2,gt2,iIN) 
coup(2) = cplFvFecHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFvHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(gt3,i2,gt1))  
coup(5) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: Ah,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Fv'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Fv 
!-------------- 
Do i1=1,3
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFecHpmL(i2,gt2,iIN) 
coup(2) = cplFvFecHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFvHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(gt3,i2,gt1))  
coup(5) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: hh,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt2,iIN) 
coup(2) = cplFvFecHpmR(i1,gt2,iIN) 
coup(3) = cplcFeFvHpmL(gt3,i1,gt1) 
coup(4) = cplcFeFvHpmR(gt3,i1,gt1) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplcFeFvHpmL(gt3,i2,gt1) 
coup(8) = cplcFeFvHpmR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fe cFe Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:256))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToHpmFecFe 
 
 
Subroutine HpmToSeFecCha(iIN,MSe,MFe,MCha,MSvIm,MSvRe,MFv,MHpm,cplSeSvImcHpm,         & 
& cplSeSvRecHpm,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplFvFecHpmL,cplFvFecHpmR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSe(6),MFe(3),MCha(2),MSvIm(9),MSvRe(9),MFv(9),MHpm(2)

Complex(dp),Intent(in) :: cplSeSvImcHpm(6,9,2),cplSeSvRecHpm(6,9,2),cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),& 
& cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),   & 
& cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 729 
Allocate( gSum(6,3,2, Isum) ) 
Allocate( Contribution(6,3,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,2
Isum = 0 
 
rk2 = (MFe(gt2)/MHpm(iIN))**2 
rm2 = (MCha(gt3)/MHpm(iIN))**2 
rj2 = (MSe(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MCha(gt3))+Abs(MFe(gt2))+Abs(MSe(gt1)))) Then 
!-------------- 
!  SvIm 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvIm(i1) 
mass(2) = MSvIm(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvImcHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplcChaFeSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFeSvImR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Fe cCha Propagator: SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm'
      End Do 



!-------------- 
!  SvRe 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvRe(i1) 
mass(2) = MSvRe(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSeSvRecHpm(gt1,i1,iIN)) 
coup(3) = Conjg(cplcChaFeSvReL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFeSvReR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Fe cCha Propagator: SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcChaFvSeL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcChaFvSeR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Fe cCha Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  SvIm, SvIm 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvIm(i2)  
coup(1) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplcChaFeSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFeSvImR(gt3,gt2,i1))  
coup(4) = cplSeSvImcHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplcChaFeSvImL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaFeSvImR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Fe cCha Propagator: SvIm,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvIm'
        End Do 
      End Do 



!-------------- 
!  SvIm, SvRe 
!-------------- 
Do i1=1,9
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplcChaFeSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFeSvImR(gt3,gt2,i1))  
coup(4) = cplSeSvRecHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplcChaFeSvReL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaFeSvReR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Fe cCha Propagator: SvIm,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvIm, Fv 
!-------------- 
Do i1=1,9
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFecHpmL(i2,gt2,iIN) 
coup(2) = cplFvFecHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaFvSeL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaFvSeR(gt3,i2,gt1))  
coup(5) = cplSeSvImcHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplcChaFeSvImL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaFeSvImR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Fe cCha Propagator: SvIm,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,Fv'
        End Do 
      End Do 



!-------------- 
!  SvRe, SvRe 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvRe(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplSeSvRecHpm(gt1,i1,iIN) 
coup(3) = Conjg(cplcChaFeSvReL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFeSvReR(gt3,gt2,i1))  
coup(4) = cplSeSvRecHpm(gt1,i2,iIN) 
coup(6) = Conjg(cplcChaFeSvReL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaFeSvReR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Fe cCha Propagator: SvRe,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvRe, Fv 
!-------------- 
Do i1=1,9
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFecHpmL(i2,gt2,iIN) 
coup(2) = cplFvFecHpmR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaFvSeL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaFvSeR(gt3,i2,gt1))  
coup(5) = cplSeSvRecHpm(gt1,i1,iIN) 
coup(7) = Conjg(cplcChaFeSvReL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaFeSvReR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Fe cCha Propagator: SvRe,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFecHpmL(i1,gt2,iIN) 
coup(2) = cplFvFecHpmR(i1,gt2,iIN) 
coup(3) = cplcChaFvSeL(gt3,i1,gt1) 
coup(4) = cplcChaFvSeR(gt3,i1,gt1) 
coup(5) = cplFvFecHpmL(i2,gt2,iIN) 
coup(6) = cplFvFecHpmR(i2,gt2,iIN)  
coup(7) = cplcChaFvSeL(gt3,i2,gt1) 
coup(8) = cplcChaFvSeR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Se Fe cCha Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:729))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToSeFecCha 
 
 
Subroutine HpmToHpmFvFv(iIN,MHpm,MFv,MVZ,MAh,Mhh,MFe,cplAhHpmcHpm,cplhhHpmcHpm,       & 
& cplHpmcHpmVZ,cplcFeFvHpmL,cplcFeFvHpmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFvAhL,           & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,deltaM,epsI,check,              & 
& g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MFv(9),MVZ,MAh(3),Mhh(3),MFe(3)

Complex(dp),Intent(in) :: cplAhHpmcHpm(3,2,2),cplhhHpmcHpm(3,2,2),cplHpmcHpmVZ(2,2),cplcFeFvHpmL(3,9,2),        & 
& cplcFeFvHpmR(3,9,2),cplFvFecHpmL(9,3,2),cplFvFecHpmR(9,3,2),cplFvFvAhL(9,9,3),         & 
& cplFvFvAhR(9,9,3),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 100 
Allocate( gSum(2,9,9, Isum) ) 
Allocate( Contribution(2,9,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,9
        Do gt3=gt2,9
Isum = 0 
 
rk2 = (MFv(gt2)/MHpm(iIN))**2 
rm2 = (MFv(gt3)/MHpm(iIN))**2 
rj2 = (MHpm(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplHpmcHpmVZ(gt1,iIN)) 
coup(3) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(2) = Conjg(cplFvFvVZR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MVZ 
mass(2) = MVZ 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplHpmcHpmVZ(gt1,iIN)) 
coup(3) = Conjg(cplFvFvVZL(gt3,gt2)) 
coup(2) = Conjg(cplFvFvVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MAh(i1)  
mass(2) = MAh(i1)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(6) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh(i1)  
mass(2) = Mhh(i1)  
coup(1) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(6) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(gt2,i1,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFeFvHpmL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplFvFecHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplFvFecHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeFvHpmL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFe(i1)  
mass(2) = MFe(i1)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeFvHpmL(i1,gt2,gt1) 
coup(4) = cplcFeFvHpmR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(gt2,i1,iIN) 
coup(6) = cplFvFecHpmR(gt2,i1,iIN)  
coup(7) = cplcFeFvHpmL(i1,gt3,gt1) 
coup(8) = cplcFeFvHpmR(i1,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplFvFvAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplFvFvhhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, Fe 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFe2(i2)  
coup(1) = cplFvFecHpmL(gt2,i2,iIN) 
coup(2) = cplFvFecHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFeFvHpmL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(i2,gt3,gt1))  
coup(5) = cplHpmcHpmVZ(gt1,iIN) 
coup(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(6) = Conjg(cplFvFvVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MVZ2  
mass(1) = MFe2(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeFvHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(i2,gt2,gt1))  
coup(5) = cplHpmcHpmVZ(gt1,iIN) 
coup(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(6) = Conjg(cplFvFvVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: VZ,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Fe'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplFvFvAhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplFvFvhhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Fe 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt2,i2,iIN) 
coup(2) = cplFvFecHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFeFvHpmL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(i2,gt3,gt1))  
coup(5) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MAh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeFvHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(i2,gt2,gt1))  
coup(5) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: Ah,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Fe'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplFvFvhhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Fe 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt2,i2,iIN) 
coup(2) = cplFvFecHpmR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFeFvHpmL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(i2,gt3,gt1))  
coup(5) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = Mhh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i2,iIN) 
coup(2) = cplFvFecHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeFvHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeFvHpmR(i2,gt2,gt1))  
coup(5) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: hh,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt2,i1,iIN) 
coup(2) = cplFvFecHpmR(gt2,i1,iIN) 
coup(3) = cplcFeFvHpmL(i1,gt3,gt1) 
coup(4) = cplcFeFvHpmR(i1,gt3,gt1) 
coup(5) = cplFvFecHpmL(gt2,i2,iIN) 
coup(6) = cplFvFecHpmR(gt2,i2,iIN)  
coup(7) = cplcFeFvHpmL(i2,gt3,gt1) 
coup(8) = cplcFeFvHpmR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeFvHpmL(i1,gt2,gt1) 
coup(4) = cplcFeFvHpmR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(gt2,i2,iIN) 
coup(6) = cplFvFecHpmR(gt2,i2,iIN)  
coup(7) = cplcFeFvHpmL(i2,gt3,gt1) 
coup(8) = cplcFeFvHpmR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt3,i1,iIN) 
coup(2) = cplFvFecHpmR(gt3,i1,iIN) 
coup(3) = cplcFeFvHpmL(i1,gt2,gt1) 
coup(4) = cplcFeFvHpmR(i1,gt2,gt1) 
coup(5) = cplFvFecHpmL(gt3,i2,iIN) 
coup(6) = cplFvFecHpmR(gt3,i2,iIN)  
coup(7) = cplcFeFvHpmL(i2,gt2,gt1) 
coup(8) = cplcFeFvHpmR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplFvFecHpmL(gt2,i1,iIN) 
coup(2) = cplFvFecHpmR(gt2,i1,iIN) 
coup(3) = cplcFeFvHpmL(i1,gt3,gt1) 
coup(4) = cplcFeFvHpmR(i1,gt3,gt1) 
coup(5) = cplFvFecHpmL(gt3,i2,iIN) 
coup(6) = cplFvFecHpmR(gt3,i2,iIN)  
coup(7) = cplcFeFvHpmL(i2,gt2,gt1) 
coup(8) = cplcFeFvHpmR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fv Fv Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2, iIN-1
      Do gt2=1,9
        Do gt3=gt2,9
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToHpmFvFv 
 
 
Subroutine HpmToHpmFucFu(iIN,MHpm,MFu,MVZ,MAh,Mhh,MFd,cplAhHpmcHpm,cplhhHpmcHpm,      & 
& cplHpmcHpmVZ,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFuAhL,        & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM,epsI,               & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MFu(3),MVZ,MAh(3),Mhh(3),MFd(3)

Complex(dp),Intent(in) :: cplAhHpmcHpm(3,2,2),cplhhHpmcHpm(3,2,2),cplHpmcHpmVZ(2,2),cplcFdFuHpmL(3,3,2),        & 
& cplcFdFuHpmR(3,3,2),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFuAhL(3,3,3),      & 
& cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 100 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/MHpm(iIN))**2 
rm2 = (MFu(gt3)/MHpm(iIN))**2 
rj2 = (MHpm(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplHpmcHpmVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplhhHpmcHpm(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFdFuHpmL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplHpmcHpmVZ(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, Fd 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFd2(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdFuHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(i2,gt2,gt1))  
coup(5) = cplHpmcHpmVZ(gt1,iIN) 
coup(7) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFuVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: VZ,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Fd'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Fd 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdFuHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(i2,gt2,gt1))  
coup(5) = cplAhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: Ah,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Fd'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
coup(4) = cplhhHpmcHpm(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Fd 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdFuHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(i2,gt2,gt1))  
coup(5) = cplhhHpmcHpm(i1,gt1,iIN) 
coup(7) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: hh,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i1,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i1,iIN) 
coup(3) = cplcFdFuHpmL(i1,gt2,gt1) 
coup(4) = cplcFdFuHpmR(i1,gt2,gt1) 
coup(5) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(6) = cplcFuFdcHpmR(gt3,i2,iIN)  
coup(7) = cplcFdFuHpmL(i2,gt2,gt1) 
coup(8) = cplcFdFuHpmR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Hpm Fu cFu Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine HpmToHpmFucFu 
 
 
Subroutine HpmToSdGlucFu(iIN,MSd,MGlu,MFu,MSu,MFd,MHpm,cplSdcHpmcSu,cplcFdGluSdL,     & 
& cplcFdGluSdR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuGluSuL,cplcFuGluSuR,deltaM,             & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MGlu,MFu(3),MSu(6),MFd(3),MHpm(2)

Complex(dp),Intent(in) :: cplSdcHpmcSu(6,2,6),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuFdcHpmL(3,3,2),         & 
& cplcFuFdcHpmR(3,3,2),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MHpm(iIN) 
 
Isum = 81 
Allocate( gSum(6,1,3, Isum) ) 
Allocate( Contribution(6,1,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
        Do gt3=1,3
Isum = 0 
 
rk2 = (MGlu/MHpm(iIN))**2 
rm2 = (MFu(gt3)/MHpm(iIN))**2 
rj2 = (MSd(gt1)/MHpm(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MHpm(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MHpm(iIN)).gt.(Abs(MFu(gt3))+Abs(MGlu)+Abs(MSd(gt1)))) Then 
!-------------- 
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSu(i1) 
mass(2) = MSu(i1) 
m_in = MHpm(iIN) 
coup(1) = Conjg(cplSdcHpmcSu(gt1,iIN,i1)) 
coup(3) = Conjg(cplcFuGluSuL(gt3,i1)) 
coup(2) = Conjg(cplcFuGluSuR(gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Glu cFu Propagator: conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='conj[Su]'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MHpm(iIN) 
coup(2) = Conjg(cplcFuFdcHpmL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFuFdcHpmR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFdGluSdL(i1,gt1)) 
coup(3) = Conjg(cplcFdGluSdR(i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Glu cFu Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  conj[Su], conj[Su] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSu(i1)  
mass(2) = MSu(i2)  
coup(1) = cplSdcHpmcSu(gt1,iIN,i1) 
coup(3) = Conjg(cplcFuGluSuL(gt3,i1)) 
coup(2) = Conjg(cplcFuGluSuR(gt3,i1))  
coup(4) = cplSdcHpmcSu(gt1,iIN,i2) 
coup(6) = Conjg(cplcFuGluSuL(gt3,i2)) 
coup(5) = Conjg(cplcFuGluSuR(gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Glu cFu Propagator: conj[Su],conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='conj[Su],conj[Su]'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Fd 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdGluSdL(i2,gt1)) 
coup(3) = Conjg(cplcFdGluSdR(i2,gt1))  
coup(5) = cplSdcHpmcSu(gt1,iIN,i1) 
coup(7) = Conjg(cplcFuGluSuL(gt3,i1)) 
coup(6) = Conjg(cplcFuGluSuR(gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Glu cFu Propagator: conj[Su],Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='conj[Su],Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFuFdcHpmL(gt3,i1,iIN) 
coup(2) = cplcFuFdcHpmR(gt3,i1,iIN) 
coup(3) = cplcFdGluSdL(i1,gt1) 
coup(4) = cplcFdGluSdR(i1,gt1) 
coup(5) = cplcFuFdcHpmL(gt3,i2,iIN) 
coup(6) = cplcFuFdcHpmR(gt3,i2,iIN)  
coup(7) = cplcFdGluSdL(i2,gt1) 
coup(8) = cplcFdGluSdR(i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Hpm->Sd Glu cFu Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,1,gt3,:)= 0._dp  
End If 
       End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
        Do gt3=1,3
g(gt1,1,gt3)=Sum(gSum(gt1,1,gt3,1:81))
If (g(gt1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,gt3)=0._dp
End If
       End Do 
   End Do 
End Subroutine HpmToSdGlucFu 
 
 
End Module Hpm3Decays_NInvSeesaw 
 
