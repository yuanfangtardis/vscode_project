! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:24 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Ah3Decays_seesaw1nmssm 
 
Use Control 
Use Settings 
Use CouplingsForDecays_seesaw1nmssm 
Use ThreeBodyPhaseSpaceS 
 
Contains 
 
Subroutine AhThreeBodyDecay(n_in,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gAhAhChacCha,gAhAhChiChi,gAhAhFdcFd,gAhAhFecFe,          & 
& gAhAhFucFu,gAhAhFvFv,gAhcHpmChaChi,gAhcSdChaFu,gAhcSeChaFv,gAhhhChacCha,               & 
& gAhSuChacFd,gAhSvImChacFe,gAhSvReChacFe,gAhhhChiChi,gAhcSdChiFd,gAhcSeChiFe,           & 
& gAhcSuChiFu,gAhSvImChiFv,gAhSvReChiFv,gAhcSdFdGlu,gAhhhFdcFd,gAhcHpmFdcFu,             & 
& gAhcHpmFeFv,gAhhhFecFe,gAhcSuFuGlu,gAhhhFucFu,gAhhhFvFv,epsI,deltaM,CheckRealStates,   & 
& gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhcHpmVWm(3,2),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),  & 
& cplAhHpmcHpm(3,2,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),             & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplcChaChaAhL(2,2,3),   & 
& cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZR(2,2),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdFdAhL(3,3,3),         & 
& cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),    & 
& cplcFeChaSvReR(3,2,6),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),        & 
& cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFdcHpmL(3,3,2),             & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,3),         & 
& cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),        & 
& cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),     & 
& cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),         & 
& cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),         & 
& cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),      & 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),    & 
& cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),               & 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6), & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Real(dp),Intent(inout) :: gAhAhChacCha(3,3,2,2),gAhAhChiChi(3,3,5,5),gAhAhFdcFd(3,3,3,3),gAhAhFecFe(3,3,3,3),   & 
& gAhAhFucFu(3,3,3,3),gAhAhFvFv(3,3,6,6),gAhcHpmChaChi(3,2,2,5),gAhcSdChaFu(3,6,2,3),    & 
& gAhcSeChaFv(3,6,2,6),gAhhhChacCha(3,3,2,2),gAhSuChacFd(3,6,2,3),gAhSvImChacFe(3,6,2,3),& 
& gAhSvReChacFe(3,6,2,3),gAhhhChiChi(3,3,5,5),gAhcSdChiFd(3,6,5,3),gAhcSeChiFe(3,6,5,3), & 
& gAhcSuChiFu(3,6,5,3),gAhSvImChiFv(3,6,5,6),gAhSvReChiFv(3,6,5,6),gAhcSdFdGlu(3,6,3,1), & 
& gAhhhFdcFd(3,3,3,3),gAhcHpmFdcFu(3,2,3,3),gAhcHpmFeFv(3,2,3,6),gAhhhFecFe(3,3,3,3),    & 
& gAhcSuFuGlu(3,6,3,1),gAhhhFucFu(3,3,3,3),gAhhhFvFv(3,3,6,6)

Real(dp) :: gAhAhChacChai(3,2,2),gAhAhChiChii(3,5,5),gAhAhFdcFdi(3,3,3),gAhAhFecFei(3,3,3),       & 
& gAhAhFucFui(3,3,3),gAhAhFvFvi(3,6,6),gAhcHpmChaChii(2,2,5),gAhcSdChaFui(6,2,3),        & 
& gAhcSeChaFvi(6,2,6),gAhhhChacChai(3,2,2),gAhSuChacFdi(6,2,3),gAhSvImChacFei(6,2,3),    & 
& gAhSvReChacFei(6,2,3),gAhhhChiChii(3,5,5),gAhcSdChiFdi(6,5,3),gAhcSeChiFei(6,5,3),     & 
& gAhcSuChiFui(6,5,3),gAhSvImChiFvi(6,5,6),gAhSvReChiFvi(6,5,6),gAhcSdFdGlui(6,3,1),     & 
& gAhhhFdcFdi(3,3,3),gAhcHpmFdcFui(2,3,3),gAhcHpmFeFvi(2,3,6),gAhhhFecFei(3,3,3),        & 
& gAhcSuFuGlui(6,3,1),gAhhhFucFui(3,3,3),gAhhhFvFvi(3,6,6)

Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'AhThreeBodyDecay' 
 

 
If (CheckRealStates) Then 
Else 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 3 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 3) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,3) = ',n_in,3 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Ah_decays_3B(MAh(i_run),i_run,MAh,MAh2,MCha,MCha2,MChi,             & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,              & 
& pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,              & 
& ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,cplAhAhAh,cplAhAhhh,cplAhcHpmVWm,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,       & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeChaSvImL,cplcFeChaSvImR,         & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,    & 
& cplGluFucSuR,deltaM)


 
gAhAhChacChai = 0._dp 
Call AhToAhChacCha(i_run,MAh,MCha,Mhh,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,deltaM,epsI,check,gAhAhChacChai)

gAhAhChacCha(i_run,:,:,:) = gAhAhChacChai 
gT(i_run) = gT(i_run) + Sum(gAhAhChacChai) 
 
gAhAhChiChii = 0._dp 
Call AhToAhChiChi(i_run,MAh,MChi,Mhh,cplAhAhAh,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,   & 
& cplChiChihhL,cplChiChihhR,deltaM,epsI,check,gAhAhChiChii)

gAhAhChiChi(i_run,:,:,:) = gAhAhChiChii 
gT(i_run) = gT(i_run) + Sum(gAhAhChiChii) 
 
gAhAhFdcFdi = 0._dp 
Call AhToAhFdcFd(i_run,MAh,MFd,Mhh,cplAhAhAh,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFdFdhhL,cplcFdFdhhR,deltaM,epsI,check,gAhAhFdcFdi)

gAhAhFdcFd(i_run,:,:,:) = gAhAhFdcFdi 
gT(i_run) = gT(i_run) + Sum(gAhAhFdcFdi) 
 
gAhAhFecFei = 0._dp 
Call AhToAhFecFe(i_run,MAh,MFe,Mhh,cplAhAhAh,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplcFeFehhL,cplcFeFehhR,deltaM,epsI,check,gAhAhFecFei)

gAhAhFecFe(i_run,:,:,:) = gAhAhFecFei 
gT(i_run) = gT(i_run) + Sum(gAhAhFecFei) 
 
gAhAhFucFui = 0._dp 
Call AhToAhFucFu(i_run,MAh,MFu,Mhh,cplAhAhAh,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,deltaM,epsI,check,gAhAhFucFui)

gAhAhFucFu(i_run,:,:,:) = gAhAhFucFui 
gT(i_run) = gT(i_run) + Sum(gAhAhFucFui) 
 
gAhAhFvFvi = 0._dp 
Call AhToAhFvFv(i_run,MAh,MFv,Mhh,cplAhAhAh,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,          & 
& cplFvFvhhL,cplFvFvhhR,deltaM,epsI,check,gAhAhFvFvi)

gAhAhFvFv(i_run,:,:,:) = gAhAhFvFvi 
gT(i_run) = gT(i_run) + Sum(gAhAhFvFvi) 
 
gAhcHpmChaChii = 0._dp 
Call AhTocHpmChaChi(i_run,MHpm,MCha,MChi,MVWm,MAh,cplAhcHpmVWm,cplAhHpmcHpm,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,deltaM,epsI,check,gAhcHpmChaChii)

gAhcHpmChaChi(i_run,:,:,:) = gAhcHpmChaChii 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcHpmChaChii) 
 
gAhcSdChaFui = 0._dp 
Call AhTocSdChaFu(i_run,MSd,MCha,MFu,MAh,cplAhSdcSd,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplcFuFuAhL,cplcFuFuAhR,cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,gAhcSdChaFui)

gAhcSdChaFu(i_run,:,:,:) = gAhcSdChaFui 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcSdChaFui) 
 
gAhcSeChaFvi = 0._dp 
Call AhTocSeChaFv(i_run,MSe,MCha,MFv,MAh,cplAhSecSe,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplFvChacSeL,cplFvChacSeR,cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,gAhcSeChaFvi)

gAhcSeChaFv(i_run,:,:,:) = gAhcSeChaFvi 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcSeChaFvi) 
 
gAhhhChacChai = 0._dp 
Call AhTohhChacCha(i_run,Mhh,MCha,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,   & 
& deltaM,epsI,check,gAhhhChacChai)

gAhhhChacCha(i_run,:,:,:) = gAhhhChacChai 
gT(i_run) = gT(i_run) + Sum(gAhhhChacChai) 
 
gAhSuChacFdi = 0._dp 
Call AhToSuChacFd(i_run,MSu,MCha,MFd,MAh,cplAhSucSu,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,cplcFdFdAhR,deltaM,epsI,check,gAhSuChacFdi)

gAhSuChacFd(i_run,:,:,:) = gAhSuChacFdi 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhSuChacFdi) 
 
gAhSvImChacFei = 0._dp 
Call AhToSvImChacFe(i_run,MSvIm,MCha,MFe,MSvRe,MAh,cplAhSvImSvIm,cplAhSvImSvRe,       & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,              & 
& cplcFeChaSvReR,cplcFeFeAhL,cplcFeFeAhR,deltaM,epsI,check,gAhSvImChacFei)

gAhSvImChacFe(i_run,:,:,:) = gAhSvImChacFei 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhSvImChacFei) 
 
gAhSvReChacFei = 0._dp 
Call AhToSvReChacFe(i_run,MSvRe,MCha,MFe,MSvIm,MAh,cplAhSvImSvRe,cplAhSvReSvRe,       & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,              & 
& cplcFeChaSvReR,cplcFeFeAhL,cplcFeFeAhR,deltaM,epsI,check,gAhSvReChacFei)

gAhSvReChacFe(i_run,:,:,:) = gAhSvReChacFei 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhSvReChacFei) 
 
gAhhhChiChii = 0._dp 
Call AhTohhChiChi(i_run,Mhh,MChi,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,               & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& deltaM,epsI,check,gAhhhChiChii)

gAhhhChiChi(i_run,:,:,:) = gAhhhChiChii 
gT(i_run) = gT(i_run) + Sum(gAhhhChiChii) 
 
gAhcSdChiFdi = 0._dp 
Call AhTocSdChiFd(i_run,MSd,MChi,MFd,MAh,cplAhSdcSd,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplChiChiAhL,cplChiChiAhR,cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,gAhcSdChiFdi)

gAhcSdChiFd(i_run,:,:,:) = gAhcSdChiFdi 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcSdChiFdi) 
 
gAhcSeChiFei = 0._dp 
Call AhTocSeChiFe(i_run,MSe,MChi,MFe,MAh,cplAhSecSe,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplChiChiAhL,cplChiChiAhR,cplChiFecSeL,cplChiFecSeR,deltaM,epsI,check,gAhcSeChiFei)

gAhcSeChiFe(i_run,:,:,:) = gAhcSeChiFei 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcSeChiFei) 
 
gAhcSuChiFui = 0._dp 
Call AhTocSuChiFu(i_run,MSu,MChi,MFu,MAh,cplAhSucSu,cplcFuFuAhL,cplcFuFuAhR,          & 
& cplChiChiAhL,cplChiChiAhR,cplChiFucSuL,cplChiFucSuR,deltaM,epsI,check,gAhcSuChiFui)

gAhcSuChiFu(i_run,:,:,:) = gAhcSuChiFui 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcSuChiFui) 
 
gAhSvImChiFvi = 0._dp 
Call AhToSvImChiFv(i_run,MSvIm,MChi,MFv,MSvRe,MAh,cplAhSvImSvIm,cplAhSvImSvRe,        & 
& cplChiChiAhL,cplChiChiAhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,gAhSvImChiFvi)

gAhSvImChiFv(i_run,:,:,:) = gAhSvImChiFvi 
gT(i_run) = gT(i_run) + Sum(gAhSvImChiFvi) 
 
gAhSvReChiFvi = 0._dp 
Call AhToSvReChiFv(i_run,MSvRe,MChi,MFv,MSvIm,MAh,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplChiChiAhL,cplChiChiAhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,gAhSvReChiFvi)

gAhSvReChiFv(i_run,:,:,:) = gAhSvReChiFvi 
gT(i_run) = gT(i_run) + Sum(gAhSvReChiFvi) 
 
gAhcSdFdGlui = 0._dp 
Call AhTocSdFdGlu(i_run,MSd,MFd,MGlu,MAh,cplAhSdcSd,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplGluFdcSdL,cplGluFdcSdR,deltaM,epsI,check,gAhcSdFdGlui)

gAhcSdFdGlu(i_run,:,:,:) = gAhcSdFdGlui 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcSdFdGlui) 
 
gAhhhFdcFdi = 0._dp 
Call AhTohhFdcFd(i_run,Mhh,MFd,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,deltaM,epsI,               & 
& check,gAhhhFdcFdi)

gAhhhFdcFd(i_run,:,:,:) = gAhhhFdcFdi 
gT(i_run) = gT(i_run) + Sum(gAhhhFdcFdi) 
 
gAhcHpmFdcFui = 0._dp 
Call AhTocHpmFdcFu(i_run,MHpm,MFd,MFu,MVWm,MAh,cplAhcHpmVWm,cplAhHpmcHpm,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplcFuFuAhL,cplcFuFuAhR,deltaM,epsI,check,gAhcHpmFdcFui)

gAhcHpmFdcFu(i_run,:,:,:) = gAhcHpmFdcFui 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcHpmFdcFui) 
 
gAhcHpmFeFvi = 0._dp 
Call AhTocHpmFeFv(i_run,MHpm,MFe,MFv,MVWm,MAh,cplAhcHpmVWm,cplAhHpmcHpm,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,           & 
& cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,gAhcHpmFeFvi)

gAhcHpmFeFv(i_run,:,:,:) = gAhcHpmFeFvi 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcHpmFeFvi) 
 
gAhhhFecFei = 0._dp 
Call AhTohhFecFe(i_run,Mhh,MFe,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplcFeFeAhL,     & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,deltaM,epsI,               & 
& check,gAhhhFecFei)

gAhhhFecFe(i_run,:,:,:) = gAhhhFecFei 
gT(i_run) = gT(i_run) + Sum(gAhhhFecFei) 
 
gAhcSuFuGlui = 0._dp 
Call AhTocSuFuGlu(i_run,MSu,MFu,MGlu,MAh,cplAhSucSu,cplcFuFuAhL,cplcFuFuAhR,          & 
& cplGluFucSuL,cplGluFucSuR,deltaM,epsI,check,gAhcSuFuGlui)

gAhcSuFuGlu(i_run,:,:,:) = gAhcSuFuGlui 
gT(i_run) = gT(i_run) + 2._dp*Sum(gAhcSuFuGlui) 
 
gAhhhFucFui = 0._dp 
Call AhTohhFucFu(i_run,Mhh,MFu,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplcFuFuAhL,     & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM,epsI,               & 
& check,gAhhhFucFui)

gAhhhFucFu(i_run,:,:,:) = gAhhhFucFui 
gT(i_run) = gT(i_run) + Sum(gAhhhFucFui) 
 
gAhhhFvFvi = 0._dp 
Call AhTohhFvFv(i_run,Mhh,MFv,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplFvFvAhL,       & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,deltaM,epsI,check,              & 
& gAhhhFvFvi)

gAhhhFvFv(i_run,:,:,:) = gAhhhFvFvi 
gT(i_run) = gT(i_run) + Sum(gAhhhFvFvi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=2,3
  Do gt2=1,2
    Do gt3=1,2
gPartial(i1,n_length)= gAhAhChacCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,3
  Do gt2=1,5
    Do gt3=gt2,5
gPartial(i1,n_length)= gAhAhChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gAhAhFdcFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gAhAhFecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gAhAhFucFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,3
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= gAhAhFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,2
    Do gt3=1,5
gPartial(i1,n_length)= 2._dp*gAhcHpmChaChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gAhcSdChaFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
gPartial(i1,n_length)= 2._dp*gAhcSeChaFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
gPartial(i1,n_length)= gAhhhChacCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gAhSuChacFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gAhSvImChacFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gAhSvReChacFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,5
    Do gt3=gt2,5
gPartial(i1,n_length)= gAhhhChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gAhcSdChiFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gAhcSeChiFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gAhcSuChiFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
gPartial(i1,n_length)= gAhSvImChiFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,5
    Do gt3=1,6
gPartial(i1,n_length)= gAhSvReChiFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,1
gPartial(i1,n_length)= 2._dp*gAhcSdFdGlu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gAhhhFdcFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gAhcHpmFdcFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= 2._dp*gAhcHpmFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gAhhhFecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,1
gPartial(i1,n_length)= 2._dp*gAhcSuFuGlu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gAhhhFucFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= gAhhhFvFv(i1,gt1,gt2,gt3)
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
 
End Subroutine AhThreeBodyDecay
 
 
Subroutine AhToAhChacCha(iIN,MAh,MCha,Mhh,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MCha(2),Mhh(3)

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),          & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3)

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
mass(1) = MAh(iIN) 
 
Isum = 64 
Allocate( gSum(3,2,2, Isum) ) 
Allocate( Contribution(3,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,2
        Do gt3=1,2
Isum = 0 
 
rk2 = (MCha(gt2)/MAh(iIN))**2 
rm2 = (MCha(gt3)/MAh(iIN))**2 
rj2 = (MAh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MCha(gt3))+Abs(MCha(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhAh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->Ah Cha cCha Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,gt1,i1)) 
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
Write(*,*) "Ah->Ah Cha cCha Propagator: hh" 
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
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcChaChaAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaChaAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcChaChaAhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Cha cCha Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplAhAhAh(iIN,i2,gt1) 
coup(6) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Cha cCha Propagator: Ah,Ah" 
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Cha cCha Propagator: Ah,hh" 
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
!  Ah, bar[Cha] 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChaAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(gt3,i2,gt1))  
coup(5) = cplAhAhAh(iIN,i1,gt1) 
coup(7) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Cha cCha Propagator: Ah,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Cha]'
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
coup(1) = cplAhAhhh(iIN,gt1,i1) 
coup(3) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Cha cCha Propagator: hh,hh" 
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
!  hh, bar[Cha] 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChaAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(iIN,gt1,i1) 
coup(7) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Cha cCha Propagator: hh,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplcChaChaAhL(gt3,i1,gt1) 
coup(4) = cplcChaChaAhR(gt3,i1,gt1) 
coup(5) = cplcChaChaAhL(i2,gt2,iIN) 
coup(6) = cplcChaChaAhR(i2,gt2,iIN)  
coup(7) = cplcChaChaAhL(gt3,i2,gt1) 
coup(8) = cplcChaChaAhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Cha cCha Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToAhChacCha 
 
 
Subroutine AhToAhChiChi(iIN,MAh,MChi,Mhh,cplAhAhAh,cplAhAhhh,cplChiChiAhL,            & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MChi(5),Mhh(3)

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),            & 
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
mass(1) = MAh(iIN) 
 
Isum = 121 
Allocate( gSum(3,5,5, Isum) ) 
Allocate( Contribution(3,5,5, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,5
        Do gt3=gt2,5
Isum = 0 
 
rk2 = (MChi(gt2)/MAh(iIN))**2 
rm2 = (MChi(gt3)/MAh(iIN))**2 
rj2 = (MAh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhAh(iIN,i1,gt1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhAh(iIN,i1,gt1)) 
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplChiChiAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt3,gt2,i1))  
coup(4) = cplAhAhAh(iIN,i1,gt1) 
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
Write(*,*) "Ah->Ah Chi Chi Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,gt1,i1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,gt1,i1)) 
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
coup(1) = cplAhAhhh(iIN,gt1,i1) 
coup(3) = Conjg(cplChiChihhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChihhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i1) 
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
Write(*,*) "Ah->Ah Chi Chi Propagator: hh" 
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiChiAhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiChiAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1)  
mass(2) = MChi(i1)  
coup(1) = cplChiChiAhL(i1,gt3,iIN) 
coup(2) = cplChiChiAhR(i1,gt3,iIN) 
coup(3) = cplChiChiAhL(i1,gt2,gt1) 
coup(4) = cplChiChiAhR(i1,gt2,gt1) 
coup(5) = cplChiChiAhL(i1,gt2,iIN) 
coup(6) = cplChiChiAhR(i1,gt2,iIN)  
coup(7) = cplChiChiAhL(i1,gt3,gt1) 
coup(8) = cplChiChiAhR(i1,gt3,gt1) 
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
Write(*,*) "Ah->Ah Chi Chi Propagator: Chi" 
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
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplAhAhAh(iIN,i2,gt1) 
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
Write(*,*) "Ah->Ah Chi Chi Propagator: Ah,Ah" 
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
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
Write(*,*) "Ah->Ah Chi Chi Propagator: Ah,hh" 
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
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChiAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i2,gt3,gt1))  
coup(5) = cplAhAhAh(iIN,i1,gt1) 
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
mass(1) = MChi(i2)  
coup(1) = cplChiChiAhL(i2,gt3,iIN) 
coup(2) = cplChiChiAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChiAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i2,gt2,gt1))  
coup(5) = cplAhAhAh(iIN,i1,gt1) 
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
Write(*,*) "Ah->Ah Chi Chi Propagator: Ah,Chi" 
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
coup(1) = cplAhAhhh(iIN,gt1,i1) 
coup(3) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChihhR(gt2,gt3,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
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
Write(*,*) "Ah->Ah Chi Chi Propagator: hh,hh" 
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
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChiAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i2,gt3,gt1))  
coup(5) = cplAhAhhh(iIN,gt1,i1) 
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
mass(1) = MChi(i2)  
coup(1) = cplChiChiAhL(i2,gt3,iIN) 
coup(2) = cplChiChiAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChiAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i2,gt2,gt1))  
coup(5) = cplAhAhhh(iIN,gt1,i1) 
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
Write(*,*) "Ah->Ah Chi Chi Propagator: hh,Chi" 
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
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiChiAhL(i1,gt3,gt1) 
coup(4) = cplChiChiAhR(i1,gt3,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiChiAhL(i2,gt3,gt1) 
coup(8) = cplChiChiAhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChiAhL(i1,gt3,iIN) 
coup(2) = cplChiChiAhR(i1,gt3,iIN) 
coup(3) = cplChiChiAhL(i1,gt2,gt1) 
coup(4) = cplChiChiAhR(i1,gt2,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiChiAhL(i2,gt3,gt1) 
coup(8) = cplChiChiAhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChiAhL(i1,gt3,iIN) 
coup(2) = cplChiChiAhR(i1,gt3,iIN) 
coup(3) = cplChiChiAhL(i1,gt2,gt1) 
coup(4) = cplChiChiAhR(i1,gt2,gt1) 
coup(5) = cplChiChiAhL(i2,gt3,iIN) 
coup(6) = cplChiChiAhR(i2,gt3,iIN)  
coup(7) = cplChiChiAhL(i2,gt2,gt1) 
coup(8) = cplChiChiAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiChiAhL(i1,gt3,gt1) 
coup(4) = cplChiChiAhR(i1,gt3,gt1) 
coup(5) = cplChiChiAhL(i2,gt3,iIN) 
coup(6) = cplChiChiAhR(i2,gt3,iIN)  
coup(7) = cplChiChiAhL(i2,gt2,gt1) 
coup(8) = cplChiChiAhR(i2,gt2,gt1) 
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
Write(*,*) "Ah->Ah Chi Chi Propagator: Chi,Chi" 
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
      Do gt2=1,5
        Do gt3=gt2,5
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToAhChiChi 
 
 
Subroutine AhToAhFdcFd(iIN,MAh,MFd,Mhh,cplAhAhAh,cplAhAhhh,cplcFdFdAhL,               & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MFd(3),Mhh(3)

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),              & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3)

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
mass(1) = MAh(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MAh(iIN))**2 
rm2 = (MFd(gt3)/MAh(iIN))**2 
rj2 = (MAh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhAh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->Ah Fd cFd Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,gt1,i1)) 
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
Write(*,*) "Ah->Ah Fd cFd Propagator: hh" 
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
!  bar[Fd] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFdFdAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFdFdAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFdFdAhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fd cFd Propagator: bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd]'
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplAhAhAh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fd cFd Propagator: Ah,Ah" 
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fd cFd Propagator: Ah,hh" 
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
!  Ah, bar[Fd] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdAhL(i2,gt2,iIN) 
coup(2) = cplcFdFdAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFdAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(gt3,i2,gt1))  
coup(5) = cplAhAhAh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fd cFd Propagator: Ah,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Fd]'
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
coup(1) = cplAhAhhh(iIN,gt1,i1) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fd cFd Propagator: hh,hh" 
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
!  hh, bar[Fd] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdAhL(i2,gt2,iIN) 
coup(2) = cplcFdFdAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFdAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(iIN,gt1,i1) 
coup(7) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fd cFd Propagator: hh,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Fd]'
        End Do 
      End Do 



!-------------- 
!  bar[Fd], bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFdFdAhL(i1,gt2,iIN) 
coup(2) = cplcFdFdAhR(i1,gt2,iIN) 
coup(3) = cplcFdFdAhL(gt3,i1,gt1) 
coup(4) = cplcFdFdAhR(gt3,i1,gt1) 
coup(5) = cplcFdFdAhL(i2,gt2,iIN) 
coup(6) = cplcFdFdAhR(i2,gt2,iIN)  
coup(7) = cplcFdFdAhL(gt3,i2,gt1) 
coup(8) = cplcFdFdAhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fd cFd Propagator: bar[Fd],bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd],bar[Fd]'
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToAhFdcFd 
 
 
Subroutine AhToAhFecFe(iIN,MAh,MFe,Mhh,cplAhAhAh,cplAhAhhh,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MFe(3),Mhh(3)

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),              & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3)

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
mass(1) = MAh(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt2)/MAh(iIN))**2 
rm2 = (MFe(gt3)/MAh(iIN))**2 
rj2 = (MAh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhAh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->Ah Fe cFe Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,gt1,i1)) 
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
Write(*,*) "Ah->Ah Fe cFe Propagator: hh" 
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
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFeFeAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFeFeAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeFeAhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fe cFe Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe]'
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplAhAhAh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fe cFe Propagator: Ah,Ah" 
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fe cFe Propagator: Ah,hh" 
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
!  Ah, bar[Fe] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(i2,gt2,iIN) 
coup(2) = cplcFeFeAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFeAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(gt3,i2,gt1))  
coup(5) = cplAhAhAh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fe cFe Propagator: Ah,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Fe]'
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
coup(1) = cplAhAhhh(iIN,gt1,i1) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fe cFe Propagator: hh,hh" 
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
!  hh, bar[Fe] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(i2,gt2,iIN) 
coup(2) = cplcFeFeAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFeAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(iIN,gt1,i1) 
coup(7) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fe cFe Propagator: hh,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFeAhL(i1,gt2,iIN) 
coup(2) = cplcFeFeAhR(i1,gt2,iIN) 
coup(3) = cplcFeFeAhL(gt3,i1,gt1) 
coup(4) = cplcFeFeAhR(gt3,i1,gt1) 
coup(5) = cplcFeFeAhL(i2,gt2,iIN) 
coup(6) = cplcFeFeAhR(i2,gt2,iIN)  
coup(7) = cplcFeFeAhL(gt3,i2,gt1) 
coup(8) = cplcFeFeAhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fe cFe Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe],bar[Fe]'
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToAhFecFe 
 
 
Subroutine AhToAhFucFu(iIN,MAh,MFu,Mhh,cplAhAhAh,cplAhAhhh,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MFu(3),Mhh(3)

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),              & 
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
mass(1) = MAh(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/MAh(iIN))**2 
rm2 = (MFu(gt3)/MAh(iIN))**2 
rj2 = (MAh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhAh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->Ah Fu cFu Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,gt1,i1)) 
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
Write(*,*) "Ah->Ah Fu cFu Propagator: hh" 
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFuFuAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFuFuAhR(i1,gt2,iIN)) 
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
Write(*,*) "Ah->Ah Fu cFu Propagator: bar[Fu]" 
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
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplAhAhAh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fu cFu Propagator: Ah,Ah" 
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fu cFu Propagator: Ah,hh" 
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
coup(1) = cplcFuFuAhL(i2,gt2,iIN) 
coup(2) = cplcFuFuAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(gt3,i2,gt1))  
coup(5) = cplAhAhAh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fu cFu Propagator: Ah,bar[Fu]" 
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
coup(1) = cplAhAhhh(iIN,gt1,i1) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fu cFu Propagator: hh,hh" 
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
coup(1) = cplcFuFuAhL(i2,gt2,iIN) 
coup(2) = cplcFuFuAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(iIN,gt1,i1) 
coup(7) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fu cFu Propagator: hh,bar[Fu]" 
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
coup(1) = cplcFuFuAhL(i1,gt2,iIN) 
coup(2) = cplcFuFuAhR(i1,gt2,iIN) 
coup(3) = cplcFuFuAhL(gt3,i1,gt1) 
coup(4) = cplcFuFuAhR(gt3,i1,gt1) 
coup(5) = cplcFuFuAhL(i2,gt2,iIN) 
coup(6) = cplcFuFuAhR(i2,gt2,iIN)  
coup(7) = cplcFuFuAhL(gt3,i2,gt1) 
coup(8) = cplcFuFuAhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Ah Fu cFu Propagator: bar[Fu],bar[Fu]" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToAhFucFu 
 
 
Subroutine AhToAhFvFv(iIN,MAh,MFv,Mhh,cplAhAhAh,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,      & 
& cplFvFvhhL,cplFvFvhhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MFv(6),Mhh(3)

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),& 
& cplFvFvhhR(6,6,3)

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
mass(1) = MAh(iIN) 
 
Isum = 144 
Allocate( gSum(3,6,6, Isum) ) 
Allocate( Contribution(3,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
Isum = 0 
 
rk2 = (MFv(gt2)/MAh(iIN))**2 
rm2 = (MFv(gt3)/MAh(iIN))**2 
rj2 = (MAh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhAh(iIN,i1,gt1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhAh(iIN,i1,gt1)) 
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt3,gt2,i1))  
coup(4) = cplAhAhAh(iIN,i1,gt1) 
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
Write(*,*) "Ah->Ah Fv Fv Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,gt1,i1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,gt1,i1)) 
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
coup(1) = cplAhAhhh(iIN,gt1,i1) 
coup(3) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i1) 
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
Write(*,*) "Ah->Ah Fv Fv Propagator: hh" 
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
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplFvFvAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFvAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvFvAhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplFvFvAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFvAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplFvFvAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1)  
mass(2) = MFv(i1)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplFvFvAhL(i1,gt2,gt1) 
coup(4) = cplFvFvAhR(i1,gt2,gt1) 
coup(5) = cplFvFvAhL(i1,gt2,iIN) 
coup(6) = cplFvFvAhR(i1,gt2,iIN)  
coup(7) = cplFvFvAhL(i1,gt3,gt1) 
coup(8) = cplFvFvAhR(i1,gt3,gt1) 
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
Write(*,*) "Ah->Ah Fv Fv Propagator: Fv" 
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
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
coup(4) = cplAhAhAh(iIN,i2,gt1) 
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
Write(*,*) "Ah->Ah Fv Fv Propagator: Ah,Ah" 
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
coup(1) = cplAhAhAh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
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
Write(*,*) "Ah->Ah Fv Fv Propagator: Ah,hh" 
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
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt2,iIN) 
coup(2) = cplFvFvAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt3,gt1))  
coup(5) = cplAhAhAh(iIN,i1,gt1) 
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
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt2,gt1))  
coup(5) = cplAhAhAh(iIN,i1,gt1) 
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
Write(*,*) "Ah->Ah Fv Fv Propagator: Ah,Fv" 
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
coup(1) = cplAhAhhh(iIN,gt1,i1) 
coup(3) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
coup(4) = cplAhAhhh(iIN,gt1,i2) 
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
Write(*,*) "Ah->Ah Fv Fv Propagator: hh,hh" 
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
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt2,iIN) 
coup(2) = cplFvFvAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt3,gt1))  
coup(5) = cplAhAhhh(iIN,gt1,i1) 
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
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt2,gt1))  
coup(5) = cplAhAhhh(iIN,gt1,i1) 
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
Write(*,*) "Ah->Ah Fv Fv Propagator: hh,Fv" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt2,iIN) 
coup(2) = cplFvFvAhR(i1,gt2,iIN) 
coup(3) = cplFvFvAhL(i1,gt3,gt1) 
coup(4) = cplFvFvAhR(i1,gt3,gt1) 
coup(5) = cplFvFvAhL(i2,gt2,iIN) 
coup(6) = cplFvFvAhR(i2,gt2,iIN)  
coup(7) = cplFvFvAhL(i2,gt3,gt1) 
coup(8) = cplFvFvAhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplFvFvAhL(i1,gt2,gt1) 
coup(4) = cplFvFvAhR(i1,gt2,gt1) 
coup(5) = cplFvFvAhL(i2,gt2,iIN) 
coup(6) = cplFvFvAhR(i2,gt2,iIN)  
coup(7) = cplFvFvAhL(i2,gt3,gt1) 
coup(8) = cplFvFvAhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplFvFvAhL(i1,gt2,gt1) 
coup(4) = cplFvFvAhR(i1,gt2,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplFvFvAhL(i2,gt2,gt1) 
coup(8) = cplFvFvAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt2,iIN) 
coup(2) = cplFvFvAhR(i1,gt2,iIN) 
coup(3) = cplFvFvAhL(i1,gt3,gt1) 
coup(4) = cplFvFvAhR(i1,gt3,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplFvFvAhL(i2,gt2,gt1) 
coup(8) = cplFvFvAhR(i2,gt2,gt1) 
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
Write(*,*) "Ah->Ah Fv Fv Propagator: Fv,Fv" 
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
      Do gt2=1,6
        Do gt3=gt2,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:144))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToAhFvFv 
 
 
Subroutine AhTocHpmChaChi(iIN,MHpm,MCha,MChi,MVWm,MAh,cplAhcHpmVWm,cplAhHpmcHpm,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MCha(2),MChi(5),MVWm,MAh(3)

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
mass(1) = MAh(iIN) 
 
Isum = 100 
Allocate( gSum(2,2,5, Isum) ) 
Allocate( Contribution(2,2,5, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,2
      Do gt2=1,2
        Do gt3=1,5
Isum = 0 
 
rk2 = (MCha(gt2)/MAh(iIN))**2 
rm2 = (MChi(gt3)/MAh(iIN))**2 
rj2 = (MHpm(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MChi(gt3))+Abs(MCha(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhcHpmVWm(iIN,gt1)) 
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
Write(*,*) "Ah->cHpm Cha Chi Propagator: VWm" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(iIN,i1,gt1)) 
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
Write(*,*) "Ah->cHpm Cha Chi Propagator: Hpm" 
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
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcChaChaAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaChaAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiChacHpmL(gt3,i1,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiChacHpmL(i1,gt2,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: Chi" 
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
coup(1) = cplAhcHpmVWm(iIN,gt1) 
coup(2) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(3) = Conjg(cplChiChacVWmR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(iIN,i2,gt1) 
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
Write(*,*) "Ah->cHpm Cha Chi Propagator: VWm,Hpm" 
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
!  VWm, bar[Cha] 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MCha2(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChacHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(gt3,i2,gt1))  
coup(5) = cplAhcHpmVWm(iIN,gt1) 
coup(7) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(6) = Conjg(cplChiChacVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: VWm,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,bar[Cha]'
      End Do 



!-------------- 
!  VWm, Chi 
!-------------- 
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MChi2(i2)  
coup(1) = cplChiChiAhL(i2,gt3,iIN) 
coup(2) = cplChiChiAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChacHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(i2,gt2,gt1))  
coup(5) = cplAhcHpmVWm(iIN,gt1) 
coup(7) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(6) = Conjg(cplChiChacVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: VWm,Chi" 
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
coup(1) = cplAhHpmcHpm(iIN,i1,gt1) 
coup(3) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(iIN,i2,gt1) 
coup(6) = Conjg(cplChiChacHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplChiChacHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: Hpm,Hpm" 
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
!  Hpm, bar[Cha] 
!-------------- 
Do i1=1,2
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChacHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(gt3,i2,gt1))  
coup(5) = cplAhHpmcHpm(iIN,i1,gt1) 
coup(7) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: Hpm,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,bar[Cha]'
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
coup(1) = cplChiChiAhL(i2,gt3,iIN) 
coup(2) = cplChiChiAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChacHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(i2,gt2,gt1))  
coup(5) = cplAhHpmcHpm(iIN,i1,gt1) 
coup(7) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: Hpm,Chi" 
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
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplChiChacHpmL(gt3,i1,gt1) 
coup(4) = cplChiChacHpmR(gt3,i1,gt1) 
coup(5) = cplcChaChaAhL(i2,gt2,iIN) 
coup(6) = cplcChaChaAhR(i2,gt2,iIN)  
coup(7) = cplChiChacHpmL(gt3,i2,gt1) 
coup(8) = cplChiChacHpmR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], Chi 
!-------------- 
Do i1=1,2
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MChi(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplChiChacHpmL(gt3,i1,gt1) 
coup(4) = cplChiChacHpmR(gt3,i1,gt1) 
coup(5) = cplChiChiAhL(i2,gt3,iIN) 
coup(6) = cplChiChiAhR(i2,gt3,iIN)  
coup(7) = cplChiChacHpmL(i2,gt2,gt1) 
coup(8) = cplChiChacHpmR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: bar[Cha],Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],Chi'
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
coup(1) = cplChiChiAhL(i1,gt3,iIN) 
coup(2) = cplChiChiAhR(i1,gt3,iIN) 
coup(3) = cplChiChacHpmL(i1,gt2,gt1) 
coup(4) = cplChiChacHpmR(i1,gt2,gt1) 
coup(5) = cplChiChiAhL(i2,gt3,iIN) 
coup(6) = cplChiChiAhR(i2,gt3,iIN)  
coup(7) = cplChiChacHpmL(i2,gt2,gt1) 
coup(8) = cplChiChacHpmR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Cha Chi Propagator: Chi,Chi" 
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
    Do gt1=2,2
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
End Subroutine AhTocHpmChaChi 
 
 
Subroutine AhTocSdChaFu(iIN,MSd,MCha,MFu,MAh,cplAhSdcSd,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplcFuFuAhL,cplcFuFuAhR,cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MCha(2),MFu(3),MAh(3)

Complex(dp),Intent(in) :: cplAhSdcSd(3,6,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFuFuAhL(3,3,3),       & 
& cplcFuFuAhR(3,3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

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
mass(1) = MAh(iIN) 
 
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
 
rk2 = (MCha(gt2)/MAh(iIN))**2 
rm2 = (MFu(gt3)/MAh(iIN))**2 
rj2 = (MSd(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFu(gt3))+Abs(MCha(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSdcSd(iIN,i1,gt1)) 
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
Write(*,*) "Ah->cSd Cha Fu Propagator: Sd" 
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
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcChaChaAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaChaAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChaFucSdL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChaFucSdR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Cha Fu Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFuFuAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplcFuFuAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChaFucSdL(gt2,i1,gt1)) 
coup(3) = Conjg(cplChaFucSdR(gt2,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Cha Fu Propagator: bar[Fu]" 
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
coup(1) = cplAhSdcSd(iIN,i1,gt1) 
coup(3) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
coup(4) = cplAhSdcSd(iIN,i2,gt1) 
coup(6) = Conjg(cplChaFucSdL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChaFucSdR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Cha Fu Propagator: Sd,Sd" 
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
!  Sd, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChaFucSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChaFucSdR(i2,gt3,gt1))  
coup(5) = cplAhSdcSd(iIN,i1,gt1) 
coup(7) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Cha Fu Propagator: Sd,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,bar[Cha]'
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
coup(1) = cplcFuFuAhL(i2,gt3,iIN) 
coup(2) = cplcFuFuAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChaFucSdL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChaFucSdR(gt2,i2,gt1))  
coup(5) = cplAhSdcSd(iIN,i1,gt1) 
coup(7) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Cha Fu Propagator: Sd,bar[Fu]" 
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
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplChaFucSdL(i1,gt3,gt1) 
coup(4) = cplChaFucSdR(i1,gt3,gt1) 
coup(5) = cplcChaChaAhL(i2,gt2,iIN) 
coup(6) = cplcChaChaAhR(i2,gt2,iIN)  
coup(7) = cplChaFucSdL(i2,gt3,gt1) 
coup(8) = cplChaFucSdR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Cha Fu Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplChaFucSdL(i1,gt3,gt1) 
coup(4) = cplChaFucSdR(i1,gt3,gt1) 
coup(5) = cplcFuFuAhL(i2,gt3,iIN) 
coup(6) = cplcFuFuAhR(i2,gt3,iIN)  
coup(7) = cplChaFucSdL(gt2,i2,gt1) 
coup(8) = cplChaFucSdR(gt2,i2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Cha Fu Propagator: bar[Cha],bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Fu]'
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
coup(1) = cplcFuFuAhL(i1,gt3,iIN) 
coup(2) = cplcFuFuAhR(i1,gt3,iIN) 
coup(3) = cplChaFucSdL(gt2,i1,gt1) 
coup(4) = cplChaFucSdR(gt2,i1,gt1) 
coup(5) = cplcFuFuAhL(i2,gt3,iIN) 
coup(6) = cplcFuFuAhR(i2,gt3,iIN)  
coup(7) = cplChaFucSdL(gt2,i2,gt1) 
coup(8) = cplChaFucSdR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Cha Fu Propagator: bar[Fu],bar[Fu]" 
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
End Subroutine AhTocSdChaFu 
 
 
Subroutine AhTocSeChaFv(iIN,MSe,MCha,MFv,MAh,cplAhSecSe,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplFvChacSeL,cplFvChacSeR,cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSe(6),MCha(2),MFv(6),MAh(3)

Complex(dp),Intent(in) :: cplAhSecSe(3,6,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplFvChacSeL(6,2,6),      & 
& cplFvChacSeR(6,2,6),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

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
mass(1) = MAh(iIN) 
 
Isum = 196 
Allocate( gSum(6,2,6, Isum) ) 
Allocate( Contribution(6,2,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,6
Isum = 0 
 
rk2 = (MCha(gt2)/MAh(iIN))**2 
rm2 = (MFv(gt3)/MAh(iIN))**2 
rj2 = (MSe(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFv(gt3))+Abs(MCha(gt2))+Abs(MSe(gt1)))) Then 
!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSe(i1) 
mass(2) = MSe(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSecSe(iIN,i1,gt1)) 
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
Write(*,*) "Ah->cSe Cha Fv Propagator: Se" 
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
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcChaChaAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaChaAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvChacSeL(gt3,i1,gt1)) 
coup(3) = Conjg(cplFvChacSeR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Cha Fv Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplFvFvAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFvAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplFvChacSeL(i1,gt2,gt1)) 
coup(3) = Conjg(cplFvChacSeR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Cha Fv Propagator: Fv" 
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
coup(1) = cplAhSecSe(iIN,i1,gt1) 
coup(3) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvChacSeR(gt3,gt2,i1))  
coup(4) = cplAhSecSe(iIN,i2,gt1) 
coup(6) = Conjg(cplFvChacSeL(gt3,gt2,i2)) 
coup(5) = Conjg(cplFvChacSeR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Cha Fv Propagator: Se,Se" 
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
!  Se, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvChacSeL(gt3,i2,gt1)) 
coup(3) = Conjg(cplFvChacSeR(gt3,i2,gt1))  
coup(5) = cplAhSecSe(iIN,i1,gt1) 
coup(7) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvChacSeR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Cha Fv Propagator: Se,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  Se, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvChacSeL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvChacSeR(i2,gt2,gt1))  
coup(5) = cplAhSecSe(iIN,i1,gt1) 
coup(7) = Conjg(cplFvChacSeL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvChacSeR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Cha Fv Propagator: Se,Fv" 
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
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplFvChacSeL(gt3,i1,gt1) 
coup(4) = cplFvChacSeR(gt3,i1,gt1) 
coup(5) = cplcChaChaAhL(i2,gt2,iIN) 
coup(6) = cplcChaChaAhR(i2,gt2,iIN)  
coup(7) = cplFvChacSeL(gt3,i2,gt1) 
coup(8) = cplFvChacSeR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Cha Fv Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], Fv 
!-------------- 
Do i1=1,2
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFv(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplFvChacSeL(gt3,i1,gt1) 
coup(4) = cplFvChacSeR(gt3,i1,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplFvChacSeL(i2,gt2,gt1) 
coup(8) = cplFvChacSeR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Cha Fv Propagator: bar[Cha],Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplFvChacSeL(i1,gt2,gt1) 
coup(4) = cplFvChacSeR(i1,gt2,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplFvChacSeL(i2,gt2,gt1) 
coup(8) = cplFvChacSeR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Cha Fv Propagator: Fv,Fv" 
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
      Do gt2=1,2
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTocSeChaFv 
 
 
Subroutine AhTohhChacCha(iIN,Mhh,MCha,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,   & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(3),MCha(2),MVZ,MAh(3)

Complex(dp),Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),& 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2)

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
mass(1) = MAh(iIN) 
 
Isum = 81 
Allocate( gSum(3,2,2, Isum) ) 
Allocate( Contribution(3,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,2
Isum = 0 
 
rk2 = (MCha(gt2)/MAh(iIN))**2 
rm2 = (MCha(gt3)/MAh(iIN))**2 
rj2 = (Mhh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MCha(gt3))+Abs(MCha(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhVZ(iIN,gt1)) 
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
Write(*,*) "Ah->hh Cha cCha Propagator: VZ" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->hh Cha cCha Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhhh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->hh Cha cCha Propagator: hh" 
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
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcChaChaAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaChaAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcChaChahhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcChaChahhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Cha cCha Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Cha cCha Propagator: VZ,Ah" 
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
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Cha cCha Propagator: VZ,hh" 
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
!  VZ, bar[Cha] 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MCha2(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChahhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChahhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZ(iIN,gt1) 
coup(7) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChaVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Cha cCha Propagator: VZ,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,bar[Cha]'
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Cha cCha Propagator: Ah,Ah" 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Cha cCha Propagator: Ah,hh" 
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
!  Ah, bar[Cha] 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChahhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChahhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Cha cCha Propagator: Ah,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Cha]'
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
coup(1) = cplAhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Cha cCha Propagator: hh,hh" 
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
!  hh, bar[Cha] 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChahhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChahhR(gt3,i2,gt1))  
coup(5) = cplAhhhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Cha cCha Propagator: hh,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplcChaChahhL(gt3,i1,gt1) 
coup(4) = cplcChaChahhR(gt3,i1,gt1) 
coup(5) = cplcChaChaAhL(i2,gt2,iIN) 
coup(6) = cplcChaChaAhR(i2,gt2,iIN)  
coup(7) = cplcChaChahhL(gt3,i2,gt1) 
coup(8) = cplcChaChahhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Cha cCha Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
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
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTohhChacCha 
 
 
Subroutine AhToSuChacFd(iIN,MSu,MCha,MFd,MAh,cplAhSucSu,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,cplcFdFdAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSu(6),MCha(2),MFd(3),MAh(3)

Complex(dp),Intent(in) :: cplAhSucSu(3,6,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcFdChaSuL(3,2,6),      & 
& cplcFdChaSuR(3,2,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3)

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
mass(1) = MAh(iIN) 
 
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
 
rk2 = (MCha(gt2)/MAh(iIN))**2 
rm2 = (MFd(gt3)/MAh(iIN))**2 
rj2 = (MSu(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFd(gt3))+Abs(MCha(gt2))+Abs(MSu(gt1)))) Then 
!-------------- 
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSu(i1) 
mass(2) = MSu(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSucSu(iIN,gt1,i1)) 
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
Write(*,*) "Ah->Su Cha cFd Propagator: conj[Su]" 
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
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcChaChaAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaChaAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFdChaSuL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFdChaSuR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Su Cha cFd Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFdFdAhL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFdFdAhR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFdChaSuL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdChaSuR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Su Cha cFd Propagator: Fd" 
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
coup(1) = cplAhSucSu(iIN,gt1,i1) 
coup(3) = Conjg(cplcFdChaSuL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdChaSuR(gt3,gt2,i1))  
coup(4) = cplAhSucSu(iIN,gt1,i2) 
coup(6) = Conjg(cplcFdChaSuL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdChaSuR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Su Cha cFd Propagator: conj[Su],conj[Su]" 
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
!  conj[Su], bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdChaSuL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdChaSuR(gt3,i2,gt1))  
coup(5) = cplAhSucSu(iIN,gt1,i1) 
coup(7) = Conjg(cplcFdChaSuL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdChaSuR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Su Cha cFd Propagator: conj[Su],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],bar[Cha]'
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
coup(1) = cplcFdFdAhL(gt3,i2,iIN) 
coup(2) = cplcFdFdAhR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdChaSuL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdChaSuR(i2,gt2,gt1))  
coup(5) = cplAhSucSu(iIN,gt1,i1) 
coup(7) = Conjg(cplcFdChaSuL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdChaSuR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Su Cha cFd Propagator: conj[Su],Fd" 
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
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplcFdChaSuL(gt3,i1,gt1) 
coup(4) = cplcFdChaSuR(gt3,i1,gt1) 
coup(5) = cplcChaChaAhL(i2,gt2,iIN) 
coup(6) = cplcChaChaAhR(i2,gt2,iIN)  
coup(7) = cplcFdChaSuL(gt3,i2,gt1) 
coup(8) = cplcFdChaSuR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Su Cha cFd Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], Fd 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplcFdChaSuL(gt3,i1,gt1) 
coup(4) = cplcFdChaSuR(gt3,i1,gt1) 
coup(5) = cplcFdFdAhL(gt3,i2,iIN) 
coup(6) = cplcFdFdAhR(gt3,i2,iIN)  
coup(7) = cplcFdChaSuL(i2,gt2,gt1) 
coup(8) = cplcFdChaSuR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Su Cha cFd Propagator: bar[Cha],Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],Fd'
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
coup(1) = cplcFdFdAhL(gt3,i1,iIN) 
coup(2) = cplcFdFdAhR(gt3,i1,iIN) 
coup(3) = cplcFdChaSuL(i1,gt2,gt1) 
coup(4) = cplcFdChaSuR(i1,gt2,gt1) 
coup(5) = cplcFdFdAhL(gt3,i2,iIN) 
coup(6) = cplcFdFdAhR(gt3,i2,iIN)  
coup(7) = cplcFdChaSuL(i2,gt2,gt1) 
coup(8) = cplcFdChaSuR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->Su Cha cFd Propagator: Fd,Fd" 
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
End Subroutine AhToSuChacFd 
 
 
Subroutine AhToSvImChacFe(iIN,MSvIm,MCha,MFe,MSvRe,MAh,cplAhSvImSvIm,cplAhSvImSvRe,   & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,              & 
& cplcFeChaSvReR,cplcFeFeAhL,cplcFeFeAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSvIm(6),MCha(2),MFe(3),MSvRe(6),MAh(3)

Complex(dp),Intent(in) :: cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),  & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3)

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
mass(1) = MAh(iIN) 
 
Isum = 289 
Allocate( gSum(6,2,3, Isum) ) 
Allocate( Contribution(6,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
rk2 = (MCha(gt2)/MAh(iIN))**2 
rm2 = (MFe(gt3)/MAh(iIN))**2 
rj2 = (MSvIm(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFe(gt3))+Abs(MCha(gt2))+Abs(MSvIm(gt1)))) Then 
!-------------- 
!  SvIm 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvIm(i1) 
mass(2) = MSvIm(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSvImSvIm(iIN,i1,gt1)) 
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
Write(*,*) "Ah->SvIm Cha cFe Propagator: SvIm" 
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
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvRe(i1) 
mass(2) = MSvRe(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSvImSvRe(iIN,gt1,i1)) 
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
Write(*,*) "Ah->SvIm Cha cFe Propagator: SvRe" 
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
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcChaChaAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaChaAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeChaSvImL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeChaSvImR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFeFeAhL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFeFeAhR(gt3,i1,iIN)) 
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
Write(*,*) "Ah->SvIm Cha cFe Propagator: Fe" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvIm(i2)  
coup(1) = cplAhSvImSvIm(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
coup(4) = cplAhSvImSvIm(iIN,i2,gt1) 
coup(6) = Conjg(cplcFeChaSvImL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeChaSvImR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: SvIm,SvIm" 
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
Do i1=1,6
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplAhSvImSvIm(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
coup(4) = cplAhSvImSvRe(iIN,gt1,i2) 
coup(6) = Conjg(cplcFeChaSvReL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeChaSvReR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: SvIm,SvRe" 
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
!  SvIm, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChaSvImL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChaSvImR(gt3,i2,gt1))  
coup(5) = cplAhSvImSvIm(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: SvIm,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  SvIm, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(gt3,i2,iIN) 
coup(2) = cplcFeFeAhR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvImL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvImR(i2,gt2,gt1))  
coup(5) = cplAhSvImSvIm(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: SvIm,Fe" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvRe(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplAhSvImSvRe(iIN,gt1,i1) 
coup(3) = Conjg(cplcFeChaSvReL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvReR(gt3,gt2,i1))  
coup(4) = cplAhSvImSvRe(iIN,gt1,i2) 
coup(6) = Conjg(cplcFeChaSvReL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeChaSvReR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: SvRe,SvRe" 
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
!  SvRe, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChaSvImL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChaSvImR(gt3,i2,gt1))  
coup(5) = cplAhSvImSvRe(iIN,gt1,i1) 
coup(7) = Conjg(cplcFeChaSvReL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvReR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: SvRe,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  SvRe, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(gt3,i2,iIN) 
coup(2) = cplcFeFeAhR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvImL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvImR(i2,gt2,gt1))  
coup(5) = cplAhSvImSvRe(iIN,gt1,i1) 
coup(7) = Conjg(cplcFeChaSvReL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvReR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: SvRe,Fe" 
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
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplcFeChaSvImL(gt3,i1,gt1) 
coup(4) = cplcFeChaSvImR(gt3,i1,gt1) 
coup(5) = cplcChaChaAhL(i2,gt2,iIN) 
coup(6) = cplcChaChaAhR(i2,gt2,iIN)  
coup(7) = cplcFeChaSvImL(gt3,i2,gt1) 
coup(8) = cplcFeChaSvImR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], Fe 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplcFeChaSvImL(gt3,i1,gt1) 
coup(4) = cplcFeChaSvImR(gt3,i1,gt1) 
coup(5) = cplcFeFeAhL(gt3,i2,iIN) 
coup(6) = cplcFeFeAhR(gt3,i2,iIN)  
coup(7) = cplcFeChaSvImL(i2,gt2,gt1) 
coup(8) = cplcFeChaSvImR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: bar[Cha],Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],Fe'
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
coup(1) = cplcFeFeAhL(gt3,i1,iIN) 
coup(2) = cplcFeFeAhR(gt3,i1,iIN) 
coup(3) = cplcFeChaSvImL(i1,gt2,gt1) 
coup(4) = cplcFeChaSvImR(i1,gt2,gt1) 
coup(5) = cplcFeFeAhL(gt3,i2,iIN) 
coup(6) = cplcFeFeAhR(gt3,i2,iIN)  
coup(7) = cplcFeChaSvImL(i2,gt2,gt1) 
coup(8) = cplcFeChaSvImR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Cha cFe Propagator: Fe,Fe" 
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
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:289))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToSvImChacFe 
 
 
Subroutine AhToSvReChacFe(iIN,MSvRe,MCha,MFe,MSvIm,MAh,cplAhSvImSvRe,cplAhSvReSvRe,   & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,              & 
& cplcFeChaSvReR,cplcFeFeAhL,cplcFeFeAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSvRe(6),MCha(2),MFe(3),MSvIm(6),MAh(3)

Complex(dp),Intent(in) :: cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),  & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3)

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
mass(1) = MAh(iIN) 
 
Isum = 289 
Allocate( gSum(6,2,3, Isum) ) 
Allocate( Contribution(6,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
rk2 = (MCha(gt2)/MAh(iIN))**2 
rm2 = (MFe(gt3)/MAh(iIN))**2 
rj2 = (MSvRe(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFe(gt3))+Abs(MCha(gt2))+Abs(MSvRe(gt1)))) Then 
!-------------- 
!  SvIm 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvIm(i1) 
mass(2) = MSvIm(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSvImSvRe(iIN,i1,gt1)) 
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
Write(*,*) "Ah->SvRe Cha cFe Propagator: SvIm" 
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
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvRe(i1) 
mass(2) = MSvRe(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSvReSvRe(iIN,i1,gt1)) 
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
Write(*,*) "Ah->SvRe Cha cFe Propagator: SvRe" 
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
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcChaChaAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaChaAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeChaSvReL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeChaSvReR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFeFeAhL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFeFeAhR(gt3,i1,iIN)) 
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
Write(*,*) "Ah->SvRe Cha cFe Propagator: Fe" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvIm(i2)  
coup(1) = cplAhSvImSvRe(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
coup(4) = cplAhSvImSvRe(iIN,i2,gt1) 
coup(6) = Conjg(cplcFeChaSvImL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeChaSvImR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: SvIm,SvIm" 
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
Do i1=1,6
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplAhSvImSvRe(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
coup(4) = cplAhSvReSvRe(iIN,i2,gt1) 
coup(6) = Conjg(cplcFeChaSvReL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeChaSvReR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: SvIm,SvRe" 
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
!  SvIm, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChaSvReL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChaSvReR(gt3,i2,gt1))  
coup(5) = cplAhSvImSvRe(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: SvIm,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  SvIm, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(gt3,i2,iIN) 
coup(2) = cplcFeFeAhR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvReL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvReR(i2,gt2,gt1))  
coup(5) = cplAhSvImSvRe(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeChaSvImL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvImR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: SvIm,Fe" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvRe(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplAhSvReSvRe(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeChaSvReL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeChaSvReR(gt3,gt2,i1))  
coup(4) = cplAhSvReSvRe(iIN,i2,gt1) 
coup(6) = Conjg(cplcFeChaSvReL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeChaSvReR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: SvRe,SvRe" 
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
!  SvRe, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaChaAhL(i2,gt2,iIN) 
coup(2) = cplcChaChaAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChaSvReL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChaSvReR(gt3,i2,gt1))  
coup(5) = cplAhSvReSvRe(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeChaSvReL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvReR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: SvRe,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  SvRe, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(gt3,i2,iIN) 
coup(2) = cplcFeFeAhR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvReL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvReR(i2,gt2,gt1))  
coup(5) = cplAhSvReSvRe(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeChaSvReL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeChaSvReR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: SvRe,Fe" 
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
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplcFeChaSvReL(gt3,i1,gt1) 
coup(4) = cplcFeChaSvReR(gt3,i1,gt1) 
coup(5) = cplcChaChaAhL(i2,gt2,iIN) 
coup(6) = cplcChaChaAhR(i2,gt2,iIN)  
coup(7) = cplcFeChaSvReL(gt3,i2,gt1) 
coup(8) = cplcFeChaSvReR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], Fe 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcChaChaAhL(i1,gt2,iIN) 
coup(2) = cplcChaChaAhR(i1,gt2,iIN) 
coup(3) = cplcFeChaSvReL(gt3,i1,gt1) 
coup(4) = cplcFeChaSvReR(gt3,i1,gt1) 
coup(5) = cplcFeFeAhL(gt3,i2,iIN) 
coup(6) = cplcFeFeAhR(gt3,i2,iIN)  
coup(7) = cplcFeChaSvReL(i2,gt2,gt1) 
coup(8) = cplcFeChaSvReR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: bar[Cha],Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],Fe'
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
coup(1) = cplcFeFeAhL(gt3,i1,iIN) 
coup(2) = cplcFeFeAhR(gt3,i1,iIN) 
coup(3) = cplcFeChaSvReL(i1,gt2,gt1) 
coup(4) = cplcFeChaSvReR(i1,gt2,gt1) 
coup(5) = cplcFeFeAhL(gt3,i2,iIN) 
coup(6) = cplcFeFeAhR(gt3,i2,iIN)  
coup(7) = cplcFeChaSvReL(i2,gt2,gt1) 
coup(8) = cplcFeChaSvReR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Cha cFe Propagator: Fe,Fe" 
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
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:289))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToSvReChacFe 
 
 
Subroutine AhTohhChiChi(iIN,Mhh,MChi,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,           & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(3),MChi(5),MVZ,MAh(3)

Complex(dp),Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5)

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
mass(1) = MAh(iIN) 
 
Isum = 144 
Allocate( gSum(3,5,5, Isum) ) 
Allocate( Contribution(3,5,5, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,5
        Do gt3=gt2,5
Isum = 0 
 
rk2 = (MChi(gt2)/MAh(iIN))**2 
rm2 = (MChi(gt3)/MAh(iIN))**2 
rj2 = (Mhh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhVZ(iIN,gt1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhVZ(iIN,gt1)) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: VZ" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,i1,gt1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,i1,gt1)) 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplChiChiAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,i1,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhhh(iIN,i1,gt1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhhh(iIN,i1,gt1)) 
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
coup(1) = cplAhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplChiChihhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChihhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i1,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: hh" 
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiChihhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChiChihhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiChihhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplChiChihhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1)  
mass(2) = MChi(i1)  
coup(1) = cplChiChiAhL(i1,gt3,iIN) 
coup(2) = cplChiChiAhR(i1,gt3,iIN) 
coup(3) = cplChiChihhL(i1,gt2,gt1) 
coup(4) = cplChiChihhR(i1,gt2,gt1) 
coup(5) = cplChiChiAhL(i1,gt2,iIN) 
coup(6) = cplChiChiAhR(i1,gt2,iIN)  
coup(7) = cplChiChihhL(i1,gt3,gt1) 
coup(8) = cplChiChihhR(i1,gt3,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: Chi" 
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
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: VZ,Ah" 
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
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: VZ,hh" 
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
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt3,gt1))  
coup(5) = cplAhhhVZ(iIN,gt1) 
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
mass(1) = MChi2(i2)  
coup(1) = cplChiChiAhL(i2,gt3,iIN) 
coup(2) = cplChiChiAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt2,gt1))  
coup(5) = cplAhhhVZ(iIN,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: VZ,Chi" 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: Ah,Ah" 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: Ah,hh" 
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
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt3,gt1))  
coup(5) = cplAhAhhh(iIN,i1,gt1) 
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
mass(1) = MChi(i2)  
coup(1) = cplChiChiAhL(i2,gt3,iIN) 
coup(2) = cplChiChiAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt2,gt1))  
coup(5) = cplAhAhhh(iIN,i1,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: Ah,Chi" 
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
coup(1) = cplAhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChihhR(gt2,gt3,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: hh,hh" 
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
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt3,gt1))  
coup(5) = cplAhhhhh(iIN,i1,gt1) 
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
mass(1) = MChi(i2)  
coup(1) = cplChiChiAhL(i2,gt3,iIN) 
coup(2) = cplChiChiAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt2,gt1))  
coup(5) = cplAhhhhh(iIN,i1,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: hh,Chi" 
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
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiChihhL(i1,gt3,gt1) 
coup(4) = cplChiChihhR(i1,gt3,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiChihhL(i2,gt3,gt1) 
coup(8) = cplChiChihhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChiAhL(i1,gt3,iIN) 
coup(2) = cplChiChiAhR(i1,gt3,iIN) 
coup(3) = cplChiChihhL(i1,gt2,gt1) 
coup(4) = cplChiChihhR(i1,gt2,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiChihhL(i2,gt3,gt1) 
coup(8) = cplChiChihhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChiAhL(i1,gt3,iIN) 
coup(2) = cplChiChiAhR(i1,gt3,iIN) 
coup(3) = cplChiChihhL(i1,gt2,gt1) 
coup(4) = cplChiChihhR(i1,gt2,gt1) 
coup(5) = cplChiChiAhL(i2,gt3,iIN) 
coup(6) = cplChiChiAhR(i2,gt3,iIN)  
coup(7) = cplChiChihhL(i2,gt2,gt1) 
coup(8) = cplChiChihhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiChihhL(i1,gt3,gt1) 
coup(4) = cplChiChihhR(i1,gt3,gt1) 
coup(5) = cplChiChiAhL(i2,gt3,iIN) 
coup(6) = cplChiChiAhR(i2,gt3,iIN)  
coup(7) = cplChiChihhL(i2,gt2,gt1) 
coup(8) = cplChiChihhR(i2,gt2,gt1) 
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
Write(*,*) "Ah->hh Chi Chi Propagator: Chi,Chi" 
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
      Do gt2=1,5
        Do gt3=gt2,5
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:144))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTohhChiChi 
 
 
Subroutine AhTocSdChiFd(iIN,MSd,MChi,MFd,MAh,cplAhSdcSd,cplcFdFdAhL,cplcFdFdAhR,      & 
& cplChiChiAhL,cplChiChiAhR,cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MChi(5),MFd(3),MAh(3)

Complex(dp),Intent(in) :: cplAhSdcSd(3,6,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplChiChiAhL(5,5,3),          & 
& cplChiChiAhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6)

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
mass(1) = MAh(iIN) 
 
Isum = 196 
Allocate( gSum(6,5,3, Isum) ) 
Allocate( Contribution(6,5,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MAh(iIN))**2 
rm2 = (MFd(gt3)/MAh(iIN))**2 
rj2 = (MSd(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFd(gt3))+Abs(MChi(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSdcSd(iIN,i1,gt1)) 
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
Write(*,*) "Ah->cSd Chi Fd Propagator: Sd" 
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
!  bar[Fd] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFdFdAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplcFdFdAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiFdcSdL(gt2,i1,gt1)) 
coup(3) = Conjg(cplChiFdcSdR(gt2,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Chi Fd Propagator: bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd]'
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFdcSdL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChiFdcSdR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Chi Fd Propagator: Chi" 
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
coup(1) = cplAhSdcSd(iIN,i1,gt1) 
coup(3) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
coup(4) = cplAhSdcSd(iIN,i2,gt1) 
coup(6) = Conjg(cplChiFdcSdL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFdcSdR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Chi Fd Propagator: Sd,Sd" 
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
!  Sd, bar[Fd] 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdAhL(i2,gt3,iIN) 
coup(2) = cplcFdFdAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFdcSdL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFdcSdR(gt2,i2,gt1))  
coup(5) = cplAhSdcSd(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Chi Fd Propagator: Sd,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,bar[Fd]'
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
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFdcSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFdcSdR(i2,gt3,gt1))  
coup(5) = cplAhSdcSd(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Chi Fd Propagator: Sd,Chi" 
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
!  bar[Fd], bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFdFdAhL(i1,gt3,iIN) 
coup(2) = cplcFdFdAhR(i1,gt3,iIN) 
coup(3) = cplChiFdcSdL(gt2,i1,gt1) 
coup(4) = cplChiFdcSdR(gt2,i1,gt1) 
coup(5) = cplcFdFdAhL(i2,gt3,iIN) 
coup(6) = cplcFdFdAhR(i2,gt3,iIN)  
coup(7) = cplChiFdcSdL(gt2,i2,gt1) 
coup(8) = cplChiFdcSdR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Chi Fd Propagator: bar[Fd],bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd],bar[Fd]'
        End Do 
      End Do 



!-------------- 
!  bar[Fd], Chi 
!-------------- 
Do i1=1,3
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MChi(i2)  
coup(1) = cplcFdFdAhL(i1,gt3,iIN) 
coup(2) = cplcFdFdAhR(i1,gt3,iIN) 
coup(3) = cplChiFdcSdL(gt2,i1,gt1) 
coup(4) = cplChiFdcSdR(gt2,i1,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiFdcSdL(i2,gt3,gt1) 
coup(8) = cplChiFdcSdR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Chi Fd Propagator: bar[Fd],Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd],Chi'
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
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiFdcSdL(i1,gt3,gt1) 
coup(4) = cplChiFdcSdR(i1,gt3,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiFdcSdL(i2,gt3,gt1) 
coup(8) = cplChiFdcSdR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Chi Fd Propagator: Chi,Chi" 
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
      Do gt2=1,5
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTocSdChiFd 
 
 
Subroutine AhTocSeChiFe(iIN,MSe,MChi,MFe,MAh,cplAhSecSe,cplcFeFeAhL,cplcFeFeAhR,      & 
& cplChiChiAhL,cplChiChiAhR,cplChiFecSeL,cplChiFecSeR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSe(6),MChi(5),MFe(3),MAh(3)

Complex(dp),Intent(in) :: cplAhSecSe(3,6,6),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplChiChiAhL(5,5,3),          & 
& cplChiChiAhR(5,5,3),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6)

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
mass(1) = MAh(iIN) 
 
Isum = 196 
Allocate( gSum(6,5,3, Isum) ) 
Allocate( Contribution(6,5,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MAh(iIN))**2 
rm2 = (MFe(gt3)/MAh(iIN))**2 
rj2 = (MSe(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFe(gt3))+Abs(MChi(gt2))+Abs(MSe(gt1)))) Then 
!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSe(i1) 
mass(2) = MSe(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSecSe(iIN,i1,gt1)) 
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
Write(*,*) "Ah->cSe Chi Fe Propagator: Se" 
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
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFeFeAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplcFeFeAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiFecSeL(gt2,i1,gt1)) 
coup(3) = Conjg(cplChiFecSeR(gt2,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Chi Fe Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe]'
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFecSeL(i1,gt3,gt1)) 
coup(3) = Conjg(cplChiFecSeR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Chi Fe Propagator: Chi" 
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
coup(1) = cplAhSecSe(iIN,i1,gt1) 
coup(3) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
coup(4) = cplAhSecSe(iIN,i2,gt1) 
coup(6) = Conjg(cplChiFecSeL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFecSeR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Chi Fe Propagator: Se,Se" 
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
!  Se, bar[Fe] 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(i2,gt3,iIN) 
coup(2) = cplcFeFeAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFecSeL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFecSeR(gt2,i2,gt1))  
coup(5) = cplAhSecSe(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Chi Fe Propagator: Se,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,bar[Fe]'
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
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFecSeL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFecSeR(i2,gt3,gt1))  
coup(5) = cplAhSecSe(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Chi Fe Propagator: Se,Chi" 
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
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFeAhL(i1,gt3,iIN) 
coup(2) = cplcFeFeAhR(i1,gt3,iIN) 
coup(3) = cplChiFecSeL(gt2,i1,gt1) 
coup(4) = cplChiFecSeR(gt2,i1,gt1) 
coup(5) = cplcFeFeAhL(i2,gt3,iIN) 
coup(6) = cplcFeFeAhR(i2,gt3,iIN)  
coup(7) = cplChiFecSeL(gt2,i2,gt1) 
coup(8) = cplChiFecSeR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Chi Fe Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe],bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], Chi 
!-------------- 
Do i1=1,3
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MChi(i2)  
coup(1) = cplcFeFeAhL(i1,gt3,iIN) 
coup(2) = cplcFeFeAhR(i1,gt3,iIN) 
coup(3) = cplChiFecSeL(gt2,i1,gt1) 
coup(4) = cplChiFecSeR(gt2,i1,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiFecSeL(i2,gt3,gt1) 
coup(8) = cplChiFecSeR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Chi Fe Propagator: bar[Fe],Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe],Chi'
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
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiFecSeL(i1,gt3,gt1) 
coup(4) = cplChiFecSeR(i1,gt3,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiFecSeL(i2,gt3,gt1) 
coup(8) = cplChiFecSeR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSe Chi Fe Propagator: Chi,Chi" 
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
      Do gt2=1,5
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTocSeChiFe 
 
 
Subroutine AhTocSuChiFu(iIN,MSu,MChi,MFu,MAh,cplAhSucSu,cplcFuFuAhL,cplcFuFuAhR,      & 
& cplChiChiAhL,cplChiChiAhR,cplChiFucSuL,cplChiFucSuR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSu(6),MChi(5),MFu(3),MAh(3)

Complex(dp),Intent(in) :: cplAhSucSu(3,6,6),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplChiChiAhL(5,5,3),          & 
& cplChiChiAhR(5,5,3),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6)

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
mass(1) = MAh(iIN) 
 
Isum = 196 
Allocate( gSum(6,5,3, Isum) ) 
Allocate( Contribution(6,5,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MAh(iIN))**2 
rm2 = (MFu(gt3)/MAh(iIN))**2 
rj2 = (MSu(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFu(gt3))+Abs(MChi(gt2))+Abs(MSu(gt1)))) Then 
!-------------- 
!  Su 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSu(i1) 
mass(2) = MSu(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSucSu(iIN,i1,gt1)) 
coup(3) = Conjg(cplChiFucSuL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFucSuR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Chi Fu Propagator: Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Su'
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFuFuAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplcFuFuAhR(i1,gt3,iIN)) 
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
Write(*,*) "Ah->cSu Chi Fu Propagator: bar[Fu]" 
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt2,iIN)) 
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
Write(*,*) "Ah->cSu Chi Fu Propagator: Chi" 
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
!  Su, Su 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSu(i1)  
mass(2) = MSu(i2)  
coup(1) = cplAhSucSu(iIN,i1,gt1) 
coup(3) = Conjg(cplChiFucSuL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFucSuR(gt2,gt3,i1))  
coup(4) = cplAhSucSu(iIN,i2,gt1) 
coup(6) = Conjg(cplChiFucSuL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFucSuR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Chi Fu Propagator: Su,Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Su,Su'
        End Do 
      End Do 



!-------------- 
!  Su, bar[Fu] 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFuAhL(i2,gt3,iIN) 
coup(2) = cplcFuFuAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFucSuL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFucSuR(gt2,i2,gt1))  
coup(5) = cplAhSucSu(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFucSuL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFucSuR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Chi Fu Propagator: Su,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Su,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  Su, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFucSuL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFucSuR(i2,gt3,gt1))  
coup(5) = cplAhSucSu(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFucSuL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFucSuR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Chi Fu Propagator: Su,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Su,Chi'
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
coup(1) = cplcFuFuAhL(i1,gt3,iIN) 
coup(2) = cplcFuFuAhR(i1,gt3,iIN) 
coup(3) = cplChiFucSuL(gt2,i1,gt1) 
coup(4) = cplChiFucSuR(gt2,i1,gt1) 
coup(5) = cplcFuFuAhL(i2,gt3,iIN) 
coup(6) = cplcFuFuAhR(i2,gt3,iIN)  
coup(7) = cplChiFucSuL(gt2,i2,gt1) 
coup(8) = cplChiFucSuR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Chi Fu Propagator: bar[Fu],bar[Fu]" 
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
coup(1) = cplcFuFuAhL(i1,gt3,iIN) 
coup(2) = cplcFuFuAhR(i1,gt3,iIN) 
coup(3) = cplChiFucSuL(gt2,i1,gt1) 
coup(4) = cplChiFucSuR(gt2,i1,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiFucSuL(i2,gt3,gt1) 
coup(8) = cplChiFucSuR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Chi Fu Propagator: bar[Fu],Chi" 
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
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiFucSuL(i1,gt3,gt1) 
coup(4) = cplChiFucSuR(i1,gt3,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiFucSuL(i2,gt3,gt1) 
coup(8) = cplChiFucSuR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Chi Fu Propagator: Chi,Chi" 
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
      Do gt2=1,5
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTocSuChiFu 
 
 
Subroutine AhToSvImChiFv(iIN,MSvIm,MChi,MFv,MSvRe,MAh,cplAhSvImSvIm,cplAhSvImSvRe,    & 
& cplChiChiAhL,cplChiChiAhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSvIm(6),MChi(5),MFv(6),MSvRe(6),MAh(3)

Complex(dp),Intent(in) :: cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),    & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

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
mass(1) = MAh(iIN) 
 
Isum = 529 
Allocate( gSum(6,5,6, Isum) ) 
Allocate( Contribution(6,5,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,6
Isum = 0 
 
rk2 = (MChi(gt2)/MAh(iIN))**2 
rm2 = (MFv(gt3)/MAh(iIN))**2 
rj2 = (MSvIm(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFv(gt3))+Abs(MChi(gt2))+Abs(MSvIm(gt1)))) Then 
!-------------- 
!  SvIm 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvIm(i1) 
mass(2) = MSvIm(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSvImSvIm(iIN,i1,gt1)) 
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
Write(*,*) "Ah->SvIm Chi Fv Propagator: SvIm" 
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
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvRe(i1) 
mass(2) = MSvRe(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSvImSvRe(iIN,gt1,i1)) 
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
Write(*,*) "Ah->SvIm Chi Fv Propagator: SvRe" 
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt2,iIN)) 
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
Write(*,*) "Ah->SvIm Chi Fv Propagator: Chi" 
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
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplFvFvAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFvAhR(i1,gt3,iIN)) 
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
Write(*,*) "Ah->SvIm Chi Fv Propagator: Fv" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvIm(i2)  
coup(1) = cplAhSvImSvIm(iIN,i1,gt1) 
coup(3) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
coup(4) = cplAhSvImSvIm(iIN,i2,gt1) 
coup(6) = Conjg(cplChiFvSvImL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvSvImR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: SvIm,SvIm" 
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
Do i1=1,6
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplAhSvImSvIm(iIN,i1,gt1) 
coup(3) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
coup(4) = cplAhSvImSvRe(iIN,gt1,i2) 
coup(6) = Conjg(cplChiFvSvReL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvSvReR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: SvIm,SvRe" 
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
Do i1=1,6
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFvSvImL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFvSvImR(i2,gt3,gt1))  
coup(5) = cplAhSvImSvIm(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: SvIm,Chi" 
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
!  SvIm, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFvSvImL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFvSvImR(gt2,i2,gt1))  
coup(5) = cplAhSvImSvIm(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: SvIm,Fv" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvRe(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplAhSvImSvRe(iIN,gt1,i1) 
coup(3) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvReR(gt2,gt3,i1))  
coup(4) = cplAhSvImSvRe(iIN,gt1,i2) 
coup(6) = Conjg(cplChiFvSvReL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvSvReR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: SvRe,SvRe" 
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
Do i1=1,6
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFvSvImL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFvSvImR(i2,gt3,gt1))  
coup(5) = cplAhSvImSvRe(iIN,gt1,i1) 
coup(7) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvReR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: SvRe,Chi" 
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
!  SvRe, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFvSvImL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFvSvImR(gt2,i2,gt1))  
coup(5) = cplAhSvImSvRe(iIN,gt1,i1) 
coup(7) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvReR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: SvRe,Fv" 
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
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiFvSvImL(i1,gt3,gt1) 
coup(4) = cplChiFvSvImR(i1,gt3,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiFvSvImL(i2,gt3,gt1) 
coup(8) = cplChiFvSvImR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: Chi,Chi" 
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
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiFvSvImL(i1,gt3,gt1) 
coup(4) = cplChiFvSvImR(i1,gt3,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplChiFvSvImL(gt2,i2,gt1) 
coup(8) = cplChiFvSvImR(gt2,i2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: Chi,Fv" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplChiFvSvImL(gt2,i1,gt1) 
coup(4) = cplChiFvSvImR(gt2,i1,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplChiFvSvImL(gt2,i2,gt1) 
coup(8) = cplChiFvSvImR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvIm Chi Fv Propagator: Fv,Fv" 
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
      Do gt2=1,5
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:529))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToSvImChiFv 
 
 
Subroutine AhToSvReChiFv(iIN,MSvRe,MChi,MFv,MSvIm,MAh,cplAhSvImSvRe,cplAhSvReSvRe,    & 
& cplChiChiAhL,cplChiChiAhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSvRe(6),MChi(5),MFv(6),MSvIm(6),MAh(3)

Complex(dp),Intent(in) :: cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),    & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

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
mass(1) = MAh(iIN) 
 
Isum = 529 
Allocate( gSum(6,5,6, Isum) ) 
Allocate( Contribution(6,5,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,5
        Do gt3=1,6
Isum = 0 
 
rk2 = (MChi(gt2)/MAh(iIN))**2 
rm2 = (MFv(gt3)/MAh(iIN))**2 
rj2 = (MSvRe(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFv(gt3))+Abs(MChi(gt2))+Abs(MSvRe(gt1)))) Then 
!-------------- 
!  SvIm 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvIm(i1) 
mass(2) = MSvIm(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSvImSvRe(iIN,i1,gt1)) 
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
Write(*,*) "Ah->SvRe Chi Fv Propagator: SvIm" 
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
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSvRe(i1) 
mass(2) = MSvRe(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSvReSvRe(iIN,i1,gt1)) 
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
Write(*,*) "Ah->SvRe Chi Fv Propagator: SvRe" 
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplChiChiAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiChiAhR(i1,gt2,iIN)) 
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
Write(*,*) "Ah->SvRe Chi Fv Propagator: Chi" 
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
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplFvFvAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFvAhR(i1,gt3,iIN)) 
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
Write(*,*) "Ah->SvRe Chi Fv Propagator: Fv" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvIm(i2)  
coup(1) = cplAhSvImSvRe(iIN,i1,gt1) 
coup(3) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
coup(4) = cplAhSvImSvRe(iIN,i2,gt1) 
coup(6) = Conjg(cplChiFvSvImL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvSvImR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: SvIm,SvIm" 
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
Do i1=1,6
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvIm(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplAhSvImSvRe(iIN,i1,gt1) 
coup(3) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
coup(4) = cplAhSvReSvRe(iIN,i2,gt1) 
coup(6) = Conjg(cplChiFvSvReL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvSvReR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: SvIm,SvRe" 
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
Do i1=1,6
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFvSvReL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFvSvReR(i2,gt3,gt1))  
coup(5) = cplAhSvImSvRe(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: SvIm,Chi" 
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
!  SvIm, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvIm(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFvSvReL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFvSvReR(gt2,i2,gt1))  
coup(5) = cplAhSvImSvRe(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFvSvImL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvImR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: SvIm,Fv" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSvRe(i1)  
mass(2) = MSvRe(i2)  
coup(1) = cplAhSvReSvRe(iIN,i1,gt1) 
coup(3) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvSvReR(gt2,gt3,i1))  
coup(4) = cplAhSvReSvRe(iIN,i2,gt1) 
coup(6) = Conjg(cplChiFvSvReL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvSvReR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: SvRe,SvRe" 
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
Do i1=1,6
  Do i2=1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiChiAhL(i2,gt2,iIN) 
coup(2) = cplChiChiAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplChiFvSvReL(i2,gt3,gt1)) 
coup(3) = Conjg(cplChiFvSvReR(i2,gt3,gt1))  
coup(5) = cplAhSvReSvRe(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvReR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: SvRe,Chi" 
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
!  SvRe, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSvRe(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiFvSvReL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiFvSvReR(gt2,i2,gt1))  
coup(5) = cplAhSvReSvRe(iIN,i1,gt1) 
coup(7) = Conjg(cplChiFvSvReL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvSvReR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: SvRe,Fv" 
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
!  Chi, Chi 
!-------------- 
Do i1=1,4
  Do i2=i1+1,5
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiFvSvReL(i1,gt3,gt1) 
coup(4) = cplChiFvSvReR(i1,gt3,gt1) 
coup(5) = cplChiChiAhL(i2,gt2,iIN) 
coup(6) = cplChiChiAhR(i2,gt2,iIN)  
coup(7) = cplChiFvSvReL(i2,gt3,gt1) 
coup(8) = cplChiFvSvReR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: Chi,Chi" 
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
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiChiAhL(i1,gt2,iIN) 
coup(2) = cplChiChiAhR(i1,gt2,iIN) 
coup(3) = cplChiFvSvReL(i1,gt3,gt1) 
coup(4) = cplChiFvSvReR(i1,gt3,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplChiFvSvReL(gt2,i2,gt1) 
coup(8) = cplChiFvSvReR(gt2,i2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: Chi,Fv" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplChiFvSvReL(gt2,i1,gt1) 
coup(4) = cplChiFvSvReR(gt2,i1,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplChiFvSvReL(gt2,i2,gt1) 
coup(8) = cplChiFvSvReR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->SvRe Chi Fv Propagator: Fv,Fv" 
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
      Do gt2=1,5
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:529))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhToSvReChiFv 
 
 
Subroutine AhTocSdFdGlu(iIN,MSd,MFd,MGlu,MAh,cplAhSdcSd,cplcFdFdAhL,cplcFdFdAhR,      & 
& cplGluFdcSdL,cplGluFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MFd(3),MGlu,MAh(3)

Complex(dp),Intent(in) :: cplAhSdcSd(3,6,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplGluFdcSdL(3,6),            & 
& cplGluFdcSdR(3,6)

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
mass(1) = MAh(iIN) 
 
Isum = 81 
Allocate( gSum(6,3,1, Isum) ) 
Allocate( Contribution(6,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MAh(iIN))**2 
rm2 = (MGlu/MAh(iIN))**2 
rj2 = (MSd(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MGlu)+Abs(MFd(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSdcSd(iIN,i1,gt1)) 
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
Write(*,*) "Ah->cSd Fd Glu Propagator: Sd" 
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
!  bar[Fd] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFdFdAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFdFdAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplGluFdcSdL(i1,gt1)) 
coup(3) = Conjg(cplGluFdcSdR(i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Fd Glu Propagator: bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='bar[Fd]'
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
coup(1) = cplAhSdcSd(iIN,i1,gt1) 
coup(3) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(2) = Conjg(cplGluFdcSdR(gt2,i1))  
coup(4) = cplAhSdcSd(iIN,i2,gt1) 
coup(6) = Conjg(cplGluFdcSdL(gt2,i2)) 
coup(5) = Conjg(cplGluFdcSdR(gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Fd Glu Propagator: Sd,Sd" 
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
!  Sd, bar[Fd] 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdAhL(i2,gt2,iIN) 
coup(2) = cplcFdFdAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplGluFdcSdL(i2,gt1)) 
coup(3) = Conjg(cplGluFdcSdR(i2,gt1))  
coup(5) = cplAhSdcSd(iIN,i1,gt1) 
coup(7) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(6) = Conjg(cplGluFdcSdR(gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Fd Glu Propagator: Sd,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Sd,bar[Fd]'
        End Do 
      End Do 



!-------------- 
!  bar[Fd], bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFdFdAhL(i1,gt2,iIN) 
coup(2) = cplcFdFdAhR(i1,gt2,iIN) 
coup(3) = cplGluFdcSdL(i1,gt1) 
coup(4) = cplGluFdcSdR(i1,gt1) 
coup(5) = cplcFdFdAhL(i2,gt2,iIN) 
coup(6) = cplcFdFdAhR(i2,gt2,iIN)  
coup(7) = cplGluFdcSdL(i2,gt1) 
coup(8) = cplGluFdcSdR(i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSd Fd Glu Propagator: bar[Fd],bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='bar[Fd],bar[Fd]'
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
End Subroutine AhTocSdFdGlu 
 
 
Subroutine AhTohhFdcFd(iIN,Mhh,MFd,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(3),MFd(3),MVZ,MAh(3)

Complex(dp),Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),& 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3)

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
mass(1) = MAh(iIN) 
 
Isum = 100 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MAh(iIN))**2 
rm2 = (MFd(gt3)/MAh(iIN))**2 
rj2 = (Mhh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhVZ(iIN,gt1)) 
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
Write(*,*) "Ah->hh Fd cFd Propagator: VZ" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->hh Fd cFd Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhhh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->hh Fd cFd Propagator: hh" 
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
!  bar[Fd] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFdFdAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFdFdAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFdFdhhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fd cFd Propagator: bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd]'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fd cFd Propagator: VZ,Ah" 
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
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fd cFd Propagator: VZ,hh" 
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
!  VZ, bar[Fd] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFd2(i2)  
coup(1) = cplcFdFdAhL(i2,gt2,iIN) 
coup(2) = cplcFdFdAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFdhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZ(iIN,gt1) 
coup(7) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fd cFd Propagator: VZ,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,bar[Fd]'
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fd cFd Propagator: Ah,Ah" 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fd cFd Propagator: Ah,hh" 
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
!  Ah, bar[Fd] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdAhL(i2,gt2,iIN) 
coup(2) = cplcFdFdAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFdhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fd cFd Propagator: Ah,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Fd]'
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
coup(1) = cplAhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fd cFd Propagator: hh,hh" 
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
!  hh, bar[Fd] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdAhL(i2,gt2,iIN) 
coup(2) = cplcFdFdAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFdhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(gt3,i2,gt1))  
coup(5) = cplAhhhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fd cFd Propagator: hh,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Fd]'
        End Do 
      End Do 



!-------------- 
!  bar[Fd], bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFdFdAhL(i1,gt2,iIN) 
coup(2) = cplcFdFdAhR(i1,gt2,iIN) 
coup(3) = cplcFdFdhhL(gt3,i1,gt1) 
coup(4) = cplcFdFdhhR(gt3,i1,gt1) 
coup(5) = cplcFdFdAhL(i2,gt2,iIN) 
coup(6) = cplcFdFdAhR(i2,gt2,iIN)  
coup(7) = cplcFdFdhhL(gt3,i2,gt1) 
coup(8) = cplcFdFdhhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fd cFd Propagator: bar[Fd],bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd],bar[Fd]'
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTohhFdcFd 
 
 
Subroutine AhTocHpmFdcFu(iIN,MHpm,MFd,MFu,MVWm,MAh,cplAhcHpmVWm,cplAhHpmcHpm,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplcFuFuAhL,cplcFuFuAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MFd(3),MFu(3),MVWm,MAh(3)

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
mass(1) = MAh(iIN) 
 
Isum = 81 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,2
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MAh(iIN))**2 
rm2 = (MFu(gt3)/MAh(iIN))**2 
rj2 = (MHpm(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhcHpmVWm(iIN,gt1)) 
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
Write(*,*) "Ah->cHpm Fd cFu Propagator: VWm" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(iIN,i1,gt1)) 
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
Write(*,*) "Ah->cHpm Fd cFu Propagator: Hpm" 
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
!  bar[Fd] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFdFdAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFdFdAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFuFdcHpmL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFuFdcHpmR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd]'
      End Do 



!-------------- 
!  Fu 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFuFuAhL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFuFuAhR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFuFdcHpmL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFuFdcHpmR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplAhcHpmVWm(iIN,gt1) 
coup(2) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(iIN,i2,gt1) 
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
Write(*,*) "Ah->cHpm Fd cFu Propagator: VWm,Hpm" 
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
!  VWm, bar[Fd] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFd2(i2)  
coup(1) = cplcFdFdAhL(i2,gt2,iIN) 
coup(2) = cplcFdFdAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFdcHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFdcHpmR(gt3,i2,gt1))  
coup(5) = cplAhcHpmVWm(iIN,gt1) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: VWm,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,bar[Fd]'
      End Do 



!-------------- 
!  VWm, Fu 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFu2(i2)  
coup(1) = cplcFuFuAhL(gt3,i2,iIN) 
coup(2) = cplcFuFuAhR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFuFdcHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFuFdcHpmR(i2,gt2,gt1))  
coup(5) = cplAhcHpmVWm(iIN,gt1) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: VWm,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Fu'
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
coup(1) = cplAhHpmcHpm(iIN,i1,gt1) 
coup(3) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(iIN,i2,gt1) 
coup(6) = Conjg(cplcFuFdcHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFdcHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: Hpm,Hpm" 
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
!  Hpm, bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdAhL(i2,gt2,iIN) 
coup(2) = cplcFdFdAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFdcHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFdcHpmR(gt3,i2,gt1))  
coup(5) = cplAhHpmcHpm(iIN,i1,gt1) 
coup(7) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: Hpm,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,bar[Fd]'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fu 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFuAhL(gt3,i2,iIN) 
coup(2) = cplcFuFuAhR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFuFdcHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFuFdcHpmR(i2,gt2,gt1))  
coup(5) = cplAhHpmcHpm(iIN,i1,gt1) 
coup(7) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: Hpm,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Fu'
        End Do 
      End Do 



!-------------- 
!  bar[Fd], bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFdFdAhL(i1,gt2,iIN) 
coup(2) = cplcFdFdAhR(i1,gt2,iIN) 
coup(3) = cplcFuFdcHpmL(gt3,i1,gt1) 
coup(4) = cplcFuFdcHpmR(gt3,i1,gt1) 
coup(5) = cplcFdFdAhL(i2,gt2,iIN) 
coup(6) = cplcFdFdAhR(i2,gt2,iIN)  
coup(7) = cplcFuFdcHpmL(gt3,i2,gt1) 
coup(8) = cplcFuFdcHpmR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: bar[Fd],bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd],bar[Fd]'
        End Do 
      End Do 



!-------------- 
!  bar[Fd], Fu 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFdFdAhL(i1,gt2,iIN) 
coup(2) = cplcFdFdAhR(i1,gt2,iIN) 
coup(3) = cplcFuFdcHpmL(gt3,i1,gt1) 
coup(4) = cplcFuFdcHpmR(gt3,i1,gt1) 
coup(5) = cplcFuFuAhL(gt3,i2,iIN) 
coup(6) = cplcFuFuAhR(gt3,i2,iIN)  
coup(7) = cplcFuFdcHpmL(i2,gt2,gt1) 
coup(8) = cplcFuFdcHpmR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: bar[Fd],Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd],Fu'
        End Do 
      End Do 



!-------------- 
!  Fu, Fu 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFuAhL(gt3,i1,iIN) 
coup(2) = cplcFuFuAhR(gt3,i1,iIN) 
coup(3) = cplcFuFdcHpmL(i1,gt2,gt1) 
coup(4) = cplcFuFdcHpmR(i1,gt2,gt1) 
coup(5) = cplcFuFuAhL(gt3,i2,iIN) 
coup(6) = cplcFuFuAhR(gt3,i2,iIN)  
coup(7) = cplcFuFdcHpmL(i2,gt2,gt1) 
coup(8) = cplcFuFdcHpmR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fd cFu Propagator: Fu,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Fu'
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
    Do gt1=2,2
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
End Subroutine AhTocHpmFdcFu 
 
 
Subroutine AhTocHpmFeFv(iIN,MHpm,MFe,MFv,MVWm,MAh,cplAhcHpmVWm,cplAhHpmcHpm,          & 
& cplcFeFeAhL,cplcFeFeAhR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,           & 
& cplFvFvAhL,cplFvFvAhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MFe(3),MFv(6),MVWm,MAh(3)

Complex(dp),Intent(in) :: cplAhcHpmVWm(3,2),cplAhHpmcHpm(3,2,2),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),          & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3)

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
mass(1) = MAh(iIN) 
 
Isum = 144 
Allocate( gSum(2,3,6, Isum) ) 
Allocate( Contribution(2,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,2
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFe(gt2)/MAh(iIN))**2 
rm2 = (MFv(gt3)/MAh(iIN))**2 
rj2 = (MHpm(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhcHpmVWm(iIN,gt1)) 
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
Write(*,*) "Ah->cHpm Fe Fv Propagator: VWm" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhHpmcHpm(iIN,i1,gt1)) 
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
Write(*,*) "Ah->cHpm Fe Fv Propagator: Hpm" 
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
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFeFeAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFeFeAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvFecHpmL(gt3,i1,gt1)) 
coup(3) = Conjg(cplFvFecHpmR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe]'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplFvFvAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFvAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplFvFecHpmL(i1,gt2,gt1)) 
coup(3) = Conjg(cplFvFecHpmR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: Fv" 
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
coup(1) = cplAhcHpmVWm(iIN,gt1) 
coup(2) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(3) = Conjg(cplFvFecVWmR(gt3,gt2))  
coup(4) = cplAhHpmcHpm(iIN,i2,gt1) 
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
Write(*,*) "Ah->cHpm Fe Fv Propagator: VWm,Hpm" 
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
!  VWm, bar[Fe] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFe2(i2)  
coup(1) = cplcFeFeAhL(i2,gt2,iIN) 
coup(2) = cplcFeFeAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFecHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplFvFecHpmR(gt3,i2,gt1))  
coup(5) = cplAhcHpmVWm(iIN,gt1) 
coup(7) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: VWm,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,bar[Fe]'
      End Do 



!-------------- 
!  VWm, Fv 
!-------------- 
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFecHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFecHpmR(i2,gt2,gt1))  
coup(5) = cplAhcHpmVWm(iIN,gt1) 
coup(7) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: VWm,Fv" 
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
coup(1) = cplAhHpmcHpm(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
coup(4) = cplAhHpmcHpm(iIN,i2,gt1) 
coup(6) = Conjg(cplFvFecHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplFvFecHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: Hpm,Hpm" 
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
!  Hpm, bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(i2,gt2,iIN) 
coup(2) = cplcFeFeAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFecHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplFvFecHpmR(gt3,i2,gt1))  
coup(5) = cplAhHpmcHpm(iIN,i1,gt1) 
coup(7) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: Hpm,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fv 
!-------------- 
Do i1=1,2
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFecHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFecHpmR(i2,gt2,gt1))  
coup(5) = cplAhHpmcHpm(iIN,i1,gt1) 
coup(7) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: Hpm,Fv" 
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
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFeAhL(i1,gt2,iIN) 
coup(2) = cplcFeFeAhR(i1,gt2,iIN) 
coup(3) = cplFvFecHpmL(gt3,i1,gt1) 
coup(4) = cplFvFecHpmR(gt3,i1,gt1) 
coup(5) = cplcFeFeAhL(i2,gt2,iIN) 
coup(6) = cplcFeFeAhR(i2,gt2,iIN)  
coup(7) = cplFvFecHpmL(gt3,i2,gt1) 
coup(8) = cplFvFecHpmR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe],bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], Fv 
!-------------- 
Do i1=1,3
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFv(i2)  
coup(1) = cplcFeFeAhL(i1,gt2,iIN) 
coup(2) = cplcFeFeAhR(i1,gt2,iIN) 
coup(3) = cplFvFecHpmL(gt3,i1,gt1) 
coup(4) = cplFvFecHpmR(gt3,i1,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplFvFecHpmL(i2,gt2,gt1) 
coup(8) = cplFvFecHpmR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: bar[Fe],Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe],Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplFvFecHpmL(i1,gt2,gt1) 
coup(4) = cplFvFecHpmR(i1,gt2,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplFvFecHpmL(i2,gt2,gt1) 
coup(8) = cplFvFecHpmR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cHpm Fe Fv Propagator: Fv,Fv" 
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
    Do gt1=2,2
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:144))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTocHpmFeFv 
 
 
Subroutine AhTohhFecFe(iIN,Mhh,MFe,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(3),MFe(3),MVZ,MAh(3)

Complex(dp),Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),& 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

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
mass(1) = MAh(iIN) 
 
Isum = 100 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt2)/MAh(iIN))**2 
rm2 = (MFe(gt3)/MAh(iIN))**2 
rj2 = (Mhh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhVZ(iIN,gt1)) 
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
Write(*,*) "Ah->hh Fe cFe Propagator: VZ" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->hh Fe cFe Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhhh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->hh Fe cFe Propagator: hh" 
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
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFeFeAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFeFeAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeFehhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeFehhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fe cFe Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe]'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fe cFe Propagator: VZ,Ah" 
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
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fe cFe Propagator: VZ,hh" 
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
!  VZ, bar[Fe] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFe2(i2)  
coup(1) = cplcFeFeAhL(i2,gt2,iIN) 
coup(2) = cplcFeFeAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFehhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZ(iIN,gt1) 
coup(7) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFeVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fe cFe Propagator: VZ,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,bar[Fe]'
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fe cFe Propagator: Ah,Ah" 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fe cFe Propagator: Ah,hh" 
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
!  Ah, bar[Fe] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(i2,gt2,iIN) 
coup(2) = cplcFeFeAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFehhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fe cFe Propagator: Ah,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Fe]'
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
coup(1) = cplAhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fe cFe Propagator: hh,hh" 
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
!  hh, bar[Fe] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFeAhL(i2,gt2,iIN) 
coup(2) = cplcFeFeAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFehhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(gt3,i2,gt1))  
coup(5) = cplAhhhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fe cFe Propagator: hh,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFeAhL(i1,gt2,iIN) 
coup(2) = cplcFeFeAhR(i1,gt2,iIN) 
coup(3) = cplcFeFehhL(gt3,i1,gt1) 
coup(4) = cplcFeFehhR(gt3,i1,gt1) 
coup(5) = cplcFeFeAhL(i2,gt2,iIN) 
coup(6) = cplcFeFeAhR(i2,gt2,iIN)  
coup(7) = cplcFeFehhL(gt3,i2,gt1) 
coup(8) = cplcFeFehhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fe cFe Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe],bar[Fe]'
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTohhFecFe 
 
 
Subroutine AhTocSuFuGlu(iIN,MSu,MFu,MGlu,MAh,cplAhSucSu,cplcFuFuAhL,cplcFuFuAhR,      & 
& cplGluFucSuL,cplGluFucSuR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSu(6),MFu(3),MGlu,MAh(3)

Complex(dp),Intent(in) :: cplAhSucSu(3,6,6),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplGluFucSuL(3,6),            & 
& cplGluFucSuR(3,6)

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
mass(1) = MAh(iIN) 
 
Isum = 81 
Allocate( gSum(6,3,1, Isum) ) 
Allocate( Contribution(6,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/MAh(iIN))**2 
rm2 = (MGlu/MAh(iIN))**2 
rj2 = (MSu(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MGlu)+Abs(MFu(gt2))+Abs(MSu(gt1)))) Then 
!-------------- 
!  Su 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSu(i1) 
mass(2) = MSu(i1) 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhSucSu(iIN,i1,gt1)) 
coup(3) = Conjg(cplGluFucSuL(gt2,i1)) 
coup(2) = Conjg(cplGluFucSuR(gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Fu Glu Propagator: Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='Su'
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFuFuAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFuFuAhR(i1,gt2,iIN)) 
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
Write(*,*) "Ah->cSu Fu Glu Propagator: bar[Fu]" 
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
!  Su, Su 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSu(i1)  
mass(2) = MSu(i2)  
coup(1) = cplAhSucSu(iIN,i1,gt1) 
coup(3) = Conjg(cplGluFucSuL(gt2,i1)) 
coup(2) = Conjg(cplGluFucSuR(gt2,i1))  
coup(4) = cplAhSucSu(iIN,i2,gt1) 
coup(6) = Conjg(cplGluFucSuL(gt2,i2)) 
coup(5) = Conjg(cplGluFucSuR(gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Fu Glu Propagator: Su,Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Su,Su'
        End Do 
      End Do 



!-------------- 
!  Su, bar[Fu] 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFuAhL(i2,gt2,iIN) 
coup(2) = cplcFuFuAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplGluFucSuL(i2,gt1)) 
coup(3) = Conjg(cplGluFucSuR(i2,gt1))  
coup(5) = cplAhSucSu(iIN,i1,gt1) 
coup(7) = Conjg(cplGluFucSuL(gt2,i1)) 
coup(6) = Conjg(cplGluFucSuR(gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Fu Glu Propagator: Su,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Su,bar[Fu]'
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
coup(1) = cplcFuFuAhL(i1,gt2,iIN) 
coup(2) = cplcFuFuAhR(i1,gt2,iIN) 
coup(3) = cplGluFucSuL(i1,gt1) 
coup(4) = cplGluFucSuR(i1,gt1) 
coup(5) = cplcFuFuAhL(i2,gt2,iIN) 
coup(6) = cplcFuFuAhR(i2,gt2,iIN)  
coup(7) = cplGluFucSuL(i2,gt1) 
coup(8) = cplGluFucSuR(i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->cSu Fu Glu Propagator: bar[Fu],bar[Fu]" 
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
End Subroutine AhTocSuFuGlu 
 
 
Subroutine AhTohhFucFu(iIN,Mhh,MFu,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(3),MFu(3),MVZ,MAh(3)

Complex(dp),Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),& 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

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
mass(1) = MAh(iIN) 
 
Isum = 100 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/MAh(iIN))**2 
rm2 = (MFu(gt3)/MAh(iIN))**2 
rj2 = (Mhh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhVZ(iIN,gt1)) 
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
Write(*,*) "Ah->hh Fu cFu Propagator: VZ" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->hh Fu cFu Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhhh(iIN,i1,gt1)) 
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
Write(*,*) "Ah->hh Fu cFu Propagator: hh" 
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
m_in = MAh(iIN) 
coup(2) = Conjg(cplcFuFuAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFuFuAhR(i1,gt2,iIN)) 
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
Write(*,*) "Ah->hh Fu cFu Propagator: bar[Fu]" 
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
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fu cFu Propagator: VZ,Ah" 
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
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fu cFu Propagator: VZ,hh" 
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
coup(1) = cplcFuFuAhL(i2,gt2,iIN) 
coup(2) = cplcFuFuAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZ(iIN,gt1) 
coup(7) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFuVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fu cFu Propagator: VZ,bar[Fu]" 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fu cFu Propagator: Ah,Ah" 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fu cFu Propagator: Ah,hh" 
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
coup(1) = cplcFuFuAhL(i2,gt2,iIN) 
coup(2) = cplcFuFuAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fu cFu Propagator: Ah,bar[Fu]" 
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
coup(1) = cplAhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fu cFu Propagator: hh,hh" 
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
coup(1) = cplcFuFuAhL(i2,gt2,iIN) 
coup(2) = cplcFuFuAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(gt3,i2,gt1))  
coup(5) = cplAhhhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fu cFu Propagator: hh,bar[Fu]" 
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
coup(1) = cplcFuFuAhL(i1,gt2,iIN) 
coup(2) = cplcFuFuAhR(i1,gt2,iIN) 
coup(3) = cplcFuFuhhL(gt3,i1,gt1) 
coup(4) = cplcFuFuhhR(gt3,i1,gt1) 
coup(5) = cplcFuFuAhL(i2,gt2,iIN) 
coup(6) = cplcFuFuAhR(i2,gt2,iIN)  
coup(7) = cplcFuFuhhL(gt3,i2,gt1) 
coup(8) = cplcFuFuhhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ah->hh Fu cFu Propagator: bar[Fu],bar[Fu]" 
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
    Do gt1=1,3
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
End Subroutine AhTohhFucFu 
 
 
Subroutine AhTohhFvFv(iIN,Mhh,MFv,MVZ,MAh,cplAhAhhh,cplAhhhhh,cplAhhhVZ,              & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,deltaM,              & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(3),MFv(6),MVZ,MAh(3)

Complex(dp),Intent(in) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3), & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6)

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
mass(1) = MAh(iIN) 
 
Isum = 169 
Allocate( gSum(3,6,6, Isum) ) 
Allocate( Contribution(3,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=gt2,6
Isum = 0 
 
rk2 = (MFv(gt2)/MAh(iIN))**2 
rm2 = (MFv(gt3)/MAh(iIN))**2 
rj2 = (Mhh(gt1)/MAh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MAh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MAh(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhVZ(iIN,gt1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhVZ(iIN,gt1)) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: VZ" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,i1,gt1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhAhhh(iIN,i1,gt1)) 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(iIN,i1,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: Ah" 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhhh(iIN,i1,gt1)) 
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
m_in = MAh(iIN) 
coup(1) = Conjg(cplAhhhhh(iIN,i1,gt1)) 
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
coup(1) = cplAhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt3,gt2,i1))  
coup(4) = cplAhhhhh(iIN,i1,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: hh" 
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
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplFvFvAhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFvAhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvFvhhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MAh(iIN) 
coup(2) = Conjg(cplFvFvAhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFvAhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplFvFvhhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1)  
mass(2) = MFv(i1)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplFvFvhhL(i1,gt2,gt1) 
coup(4) = cplFvFvhhR(i1,gt2,gt1) 
coup(5) = cplFvFvAhL(i1,gt2,iIN) 
coup(6) = cplFvFvAhR(i1,gt2,iIN)  
coup(7) = cplFvFvhhL(i1,gt3,gt1) 
coup(8) = cplFvFvhhR(i1,gt3,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: Fv" 
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
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: VZ,Ah" 
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
coup(1) = cplAhhhVZ(iIN,gt1) 
coup(2) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: VZ,hh" 
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
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFvAhL(i2,gt2,iIN) 
coup(2) = cplFvFvAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt3,gt1))  
coup(5) = cplAhhhVZ(iIN,gt1) 
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
mass(1) = MFv2(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt2,gt1))  
coup(5) = cplAhhhVZ(iIN,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: VZ,Fv" 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
coup(4) = cplAhAhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: Ah,Ah" 
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
coup(1) = cplAhAhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: Ah,hh" 
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
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt2,iIN) 
coup(2) = cplFvFvAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt3,gt1))  
coup(5) = cplAhAhhh(iIN,i1,gt1) 
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
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt2,gt1))  
coup(5) = cplAhAhhh(iIN,i1,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: Ah,Fv" 
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
coup(1) = cplAhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
coup(4) = cplAhhhhh(iIN,i2,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: hh,hh" 
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
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt2,iIN) 
coup(2) = cplFvFvAhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt3,gt1))  
coup(5) = cplAhhhhh(iIN,i1,gt1) 
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
mass(1) = MFv(i2)  
coup(1) = cplFvFvAhL(i2,gt3,iIN) 
coup(2) = cplFvFvAhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt2,gt1))  
coup(5) = cplAhhhhh(iIN,i1,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: hh,Fv" 
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
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt2,iIN) 
coup(2) = cplFvFvAhR(i1,gt2,iIN) 
coup(3) = cplFvFvhhL(i1,gt3,gt1) 
coup(4) = cplFvFvhhR(i1,gt3,gt1) 
coup(5) = cplFvFvAhL(i2,gt2,iIN) 
coup(6) = cplFvFvAhR(i2,gt2,iIN)  
coup(7) = cplFvFvhhL(i2,gt3,gt1) 
coup(8) = cplFvFvhhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplFvFvhhL(i1,gt2,gt1) 
coup(4) = cplFvFvhhR(i1,gt2,gt1) 
coup(5) = cplFvFvAhL(i2,gt2,iIN) 
coup(6) = cplFvFvAhR(i2,gt2,iIN)  
coup(7) = cplFvFvhhL(i2,gt3,gt1) 
coup(8) = cplFvFvhhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt3,iIN) 
coup(2) = cplFvFvAhR(i1,gt3,iIN) 
coup(3) = cplFvFvhhL(i1,gt2,gt1) 
coup(4) = cplFvFvhhR(i1,gt2,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplFvFvhhL(i2,gt2,gt1) 
coup(8) = cplFvFvhhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvAhL(i1,gt2,iIN) 
coup(2) = cplFvFvAhR(i1,gt2,iIN) 
coup(3) = cplFvFvhhL(i1,gt3,gt1) 
coup(4) = cplFvFvhhR(i1,gt3,gt1) 
coup(5) = cplFvFvAhL(i2,gt3,iIN) 
coup(6) = cplFvFvAhR(i2,gt3,iIN)  
coup(7) = cplFvFvhhL(i2,gt2,gt1) 
coup(8) = cplFvFvhhR(i2,gt2,gt1) 
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
Write(*,*) "Ah->hh Fv Fv Propagator: Fv,Fv" 
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
      Do gt2=1,6
        Do gt3=gt2,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:169))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine AhTohhFvFv 
 
 
End Module Ah3Decays_seesaw1nmssm 
 
