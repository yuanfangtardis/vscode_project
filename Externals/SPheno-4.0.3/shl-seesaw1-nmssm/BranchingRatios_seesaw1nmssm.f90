! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:50 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_seesaw1nmssm 
 
Use Control 
Use Settings 
Use Couplings_seesaw1nmssm 
Use Model_Data_seesaw1nmssm 
Use LoopCouplings_seesaw1nmssm 
Use SvRe3Decays_seesaw1nmssm 
Use SvIm3Decays_seesaw1nmssm 
Use Hpm3Decays_seesaw1nmssm 
Use hh3Decays_seesaw1nmssm 
Use Ah3Decays_seesaw1nmssm 
Use Su3Decays_seesaw1nmssm 
Use Sd3Decays_seesaw1nmssm 
Use Se3Decays_seesaw1nmssm 
Use Glu3Decays_seesaw1nmssm 
Use Cha3Decays_seesaw1nmssm 
Use Chi3Decays_seesaw1nmssm 
Use Fv3Decays_seesaw1nmssm 
Use TreeLevelDecays_seesaw1nmssm 
Use OneLoopDecays_seesaw1nmssm


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MCha,MCha2,MChi,           & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,              & 
& pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,              & 
& ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,              & 
& Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,gPSvRe,gTSvRe,BRSvRe,gPSvIm,         & 
& gTSvIm,BRSvIm,gPHpm,gTHpm,BRHpm,gPhh,gThh,BRhh,gPAh,gTAh,BRAh,gPSu,gTSu,               & 
& BRSu,gPSd,gTSd,BRSd,gPSe,gTSe,BRSe,gPGlu,gTGlu,BRGlu,gPCha,gTCha,BRCha,gPChi,          & 
& gTChi,BRChi,gPFv,gTFv,BRFv)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(inout) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Real(dp),Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp),Intent(inout) :: vd,vu,vS

Real(dp),Intent(inout) :: gPSvRe(6,2052),gTSvRe(6),BRSvRe(6,2052),gPSvIm(6,2052),gTSvIm(6),BRSvIm(6,2052),      & 
& gPHpm(2,1563),gTHpm(2),BRHpm(2,1563),gPhh(3,1798),gThh(3),BRhh(3,1798),gPAh(3,1796),   & 
& gTAh(3),BRAh(3,1796),gPSu(6,1758),gTSu(6),BRSu(6,1758),gPSd(6,1758),gTSd(6),           & 
& BRSd(6,1758),gPSe(6,1857),gTSe(6),BRSe(6,1857),gPGlu(1,157),gTGlu,BRGlu(1,157),        & 
& gPCha(2,478),gTCha(2),BRCha(2,478),gPChi(5,698),gTChi(5),BRChi(5,698),gPFv(6,729),     & 
& gTFv(6),BRFv(6,729)

Complex(dp) :: cplHiggsPP(3),cplHiggsGG(3),cplPseudoHiggsPP(3),cplPseudoHiggsGG(3),cplHiggsZZvirt(3),& 
& cplHiggsWWvirt(3)

Real(dp) :: gSvReAhChacFe(6,3,2,3),gSvReAhChiFv(6,3,5,6),gSvRecSeChaChi(6,6,2,5),gSvRecHpmChaFv(6,2,2,6),& 
& gSvRehhChacFe(6,3,2,3),gSvReSvImChacCha(6,6,2,2),gSvReSvReChacCha(6,6,2,2),            & 
& gSvReSvImChiChi(6,6,5,5),gSvReSvReChiChi(6,6,5,5),gSvRecHpmChiFe(6,2,5,3),             & 
& gSvRehhChiFv(6,3,5,6),gSvReFeFucSd(6,3,3,6),gSvRecSeFeFv(6,6,3,6),gSvReFeSucFd(6,3,6,3),& 
& gSvReSvImFecFe(6,6,3,3),gSvReSvReFecFe(6,6,3,3),gSvReFvFdcSd(6,6,3,6),gSvReFvFucSu(6,6,3,6),& 
& gSvReSvImFvFv(6,6,6,6),gSvReSvReFvFv(6,6,6,6),gSvReSeFucFd(6,6,3,3),gSvReSvImFdcFd(6,6,3,3),& 
& gSvReSvImFucFu(6,6,3,3),gSvReSvReFdcFd(6,6,3,3),gSvReSvReFucFu(6,6,3,3),               & 
& gSvImAhChacFe(6,3,2,3),gSvImAhChiFv(6,3,5,6),gSvImcSeChaChi(6,6,2,5),gSvImcHpmChaFv(6,2,2,6),& 
& gSvImhhChacFe(6,3,2,3),gSvImSvImChacCha(6,6,2,2),gSvImSvReChacCha(6,6,2,2),            & 
& gSvImSvImChiChi(6,6,5,5),gSvImSvReChiChi(6,6,5,5),gSvImcHpmChiFe(6,2,5,3),             & 
& gSvImhhChiFv(6,3,5,6),gSvImFeFucSd(6,3,3,6),gSvImcSeFeFv(6,6,3,6),gSvImFeSucFd(6,3,6,3),& 
& gSvImSvImFecFe(6,6,3,3),gSvImSvReFecFe(6,6,3,3),gSvImFvFdcSd(6,6,3,6),gSvImFvFucSu(6,6,3,6),& 
& gSvImSvImFvFv(6,6,6,6),gSvImSvReFvFv(6,6,6,6),gSvImSeFucFd(6,6,3,3),gSvImSvImFdcFd(6,6,3,3),& 
& gSvImSvImFucFu(6,6,3,3),gSvImSvReFdcFd(6,6,3,3),gSvImSvReFucFu(6,6,3,3),               & 
& gHpmAhChaChi(2,3,2,5),gHpmAhFdcFu(2,3,3,3),gHpmAhFeFv(2,3,3,6),gHpmChaChacHpm(2,2,2,2),& 
& gHpmhhChaChi(2,3,2,5),gHpmFdChacSd(2,3,2,6),gHpmChaFecSe(2,2,3,6),gHpmcSuChaFu(2,6,2,3),& 
& gHpmSvImChaFv(2,6,2,6),gHpmSvReChaFv(2,6,2,6),gHpmHpmChacCha(2,2,2,2),gHpmSdChacFd(2,6,2,3),& 
& gHpmSeChacFe(2,6,2,3),gHpmcFuChaSu(2,3,2,6),gHpmHpmChiChi(2,2,5,5),gHpmcSuChiFd(2,6,5,3),& 
& gHpmSvImChiFe(2,6,5,3),gHpmSvReChiFe(2,6,5,3),gHpmSeChiFv(2,6,5,6),gHpmSdChicFu(2,6,5,3),& 
& gHpmcSuFdGlu(2,6,3,1),gHpmhhFdcFu(2,3,3,3),gHpmHpmFdcFd(2,2,3,3),gHpmFeFecHpm(2,3,3,2),& 
& gHpmhhFeFv(2,3,3,6),gHpmHpmFecFe(2,2,3,3),gHpmSeFecCha(2,6,3,2),gHpmHpmFvFv(2,2,6,6),  & 
& gHpmHpmFucFu(2,2,3,3),gHpmSdGlucFu(2,6,1,3),ghhAhChacCha(3,3,2,2),ghhAhChiChi(3,3,5,5),& 
& ghhAhFdcFd(3,3,3,3),ghhAhFecFe(3,3,3,3),ghhAhFucFu(3,3,3,3),ghhAhFvFv(3,3,6,6),        & 
& ghhcHpmChaChi(3,2,2,5),ghhcSdChaFu(3,6,2,3),ghhcSeChaFv(3,6,2,6),ghhhhChacCha(3,3,2,2),& 
& ghhSuChacFd(3,6,2,3),ghhSvImChacFe(3,6,2,3),ghhSvReChacFe(3,6,2,3),ghhhhChiChi(3,3,5,5),& 
& ghhcSdChiFd(3,6,5,3),ghhcSeChiFe(3,6,5,3),ghhcSuChiFu(3,6,5,3),ghhSvImChiFv(3,6,5,6),  & 
& ghhSvReChiFv(3,6,5,6),ghhcSdFdGlu(3,6,3,1),ghhhhFdcFd(3,3,3,3),ghhcHpmFdcFu(3,2,3,3),  & 
& ghhcHpmFeFv(3,2,3,6),ghhhhFecFe(3,3,3,3),ghhcSuFuGlu(3,6,3,1),ghhhhFucFu(3,3,3,3),     & 
& ghhhhFvFv(3,3,6,6),gAhAhChacCha(3,3,2,2),gAhAhChiChi(3,3,5,5),gAhAhFdcFd(3,3,3,3),     & 
& gAhAhFecFe(3,3,3,3),gAhAhFucFu(3,3,3,3),gAhAhFvFv(3,3,6,6),gAhcHpmChaChi(3,2,2,5),     & 
& gAhcSdChaFu(3,6,2,3),gAhcSeChaFv(3,6,2,6),gAhhhChacCha(3,3,2,2),gAhSuChacFd(3,6,2,3),  & 
& gAhSvImChacFe(3,6,2,3),gAhSvReChacFe(3,6,2,3),gAhhhChiChi(3,3,5,5),gAhcSdChiFd(3,6,5,3),& 
& gAhcSeChiFe(3,6,5,3),gAhcSuChiFu(3,6,5,3),gAhSvImChiFv(3,6,5,6),gAhSvReChiFv(3,6,5,6), & 
& gAhcSdFdGlu(3,6,3,1),gAhhhFdcFd(3,3,3,3),gAhcHpmFdcFu(3,2,3,3),gAhcHpmFeFv(3,2,3,6),   & 
& gAhhhFecFe(3,3,3,3),gAhcSuFuGlu(3,6,3,1),gAhhhFucFu(3,3,3,3),gAhhhFvFv(3,3,6,6),       & 
& gSuAhChiFu(6,3,5,3),gSuAhFdcCha(6,3,3,2),gSuAhFuGlu(6,3,3,1),gSuSuChiChi(6,6,5,5),     & 
& gSucHpmChiFd(6,2,5,3),gSuhhChiFu(6,3,5,3),gSuChiGluSu(6,5,1,6),gSuSdChicCha(6,6,5,2)

Real(dp) :: gSuFdFucSd(6,3,3,6),gSuFdFvcSe(6,3,6,6),gSuhhFdcCha(6,3,3,2),gSuSuFdcFd(6,6,3,3),      & 
& gSuFdSvImcFe(6,3,6,3),gSuFdSvRecFe(6,3,6,3),gSucHpmChaFu(6,2,2,3),gSuFuFecSe(6,3,3,6), & 
& gSuFuFucSu(6,3,3,6),gSuFuFvSvIm(6,3,6,6),gSuFuFvSvRe(6,3,6,6),gSucChaFuHpm(6,2,3,2),   & 
& gSuSdFucFd(6,6,3,3),gSuFuSecFe(6,3,6,3),gSuSuFucFu(6,6,3,3),gSucHpmFdGlu(6,2,3,1),     & 
& gSuhhFuGlu(6,3,3,1),gSuGluGluSu(6,1,1,6),gSuGluSdcCha(6,1,6,2),gSuSdFvcFe(6,6,6,3),    & 
& gSuSuChacCha(6,6,2,2),gSuSuFecFe(6,6,3,3),gSuSuFvFv(6,6,6,6),gSdAhChaFu(6,3,2,3),      & 
& gSdAhChiFd(6,3,5,3),gSdAhFdGlu(6,3,3,1),gSdSuChaChi(6,6,2,5),gSdChaFdcHpm(6,2,3,2),    & 
& gSdhhChaFu(6,3,2,3),gSdChaGluSu(6,2,1,6),gSdSdChacCha(6,6,2,2),gSdSdChiChi(6,6,5,5),   & 
& gSdhhChiFd(6,3,5,3),gSdHpmChiFu(6,2,5,3),gSdChiGluSd(6,5,1,6),gSdFdFdcSd(6,3,3,6),     & 
& gSdFdFecSe(6,3,3,6),gSdFuFdcSu(6,3,3,6),gSdFdFvSvIm(6,3,6,6),gSdFdFvSvRe(6,3,6,6),     & 
& gSdHpmFdcCha(6,2,3,2),gSdSdFdcFd(6,6,3,3),gSdFdSecFe(6,3,6,3),gSdSuFdcFu(6,6,3,3),     & 
& gSdFuFeSvIm(6,3,3,6),gSdFuFeSvRe(6,3,3,6),gSdFuFvSe(6,3,6,6),gSdSdFucFu(6,6,3,3),      & 
& gSdhhFdGlu(6,3,3,1),gSdHpmFuGlu(6,2,3,1),gSdGluGluSd(6,1,1,6),gSdSdFecFe(6,6,3,3),     & 
& gSdSdFvFv(6,6,6,6),gSdSuFeFv(6,6,3,6),gSeAhChaFv(6,3,2,6),gSeAhChiFe(6,3,5,3),         & 
& gSeChaChacSe(6,2,2,6),gSeSvImChaChi(6,6,2,5),gSeSvReChaChi(6,6,2,5),gSeChaFecHpm(6,2,3,2),& 
& gSehhChaFv(6,3,2,6),gSeHpmChacFe(6,2,2,3),gSeSeChacCha(6,6,2,2),gSeSeChiChi(6,6,5,5),  & 
& gSehhChiFe(6,3,5,3),gSeHpmChiFv(6,2,5,6),gSeFeFdcSd(6,3,3,6),gSeFeFecSe(6,3,3,6),      & 
& gSeFeFucSu(6,3,3,6),gSeSvImFeFv(6,6,3,6),gSeSvReFeFv(6,6,3,6),gSeHpmFecCha(6,2,3,2),   & 
& gSeFeSdcFd(6,3,6,3),gSeSeFecFe(6,6,3,3),gSeFeSucFu(6,3,6,3),gSeFvFdcSu(6,6,3,6),       & 
& gSeSeFvFv(6,6,6,6),gSeFvSdcFu(6,6,6,3),gSeSeFdcFd(6,6,3,3),gSeSeFucFu(6,6,3,3),        & 
& gSeSvImFdcFu(6,6,3,3),gSeSvReFdcFu(6,6,3,3),gGluFdcFdChi(1,3,3,5),gGluFdcFucCha(1,3,3,2),& 
& gGluFucFuChi(1,3,3,5),gChaChacChaCha(2,2,2,2),gChaChaChiChi(2,2,5,5),gChaChacFdFd(2,2,3,3),& 
& gChaChacFeFe(2,2,3,3),gChaChacFuFu(2,2,3,3),gChaChaFvFv(2,2,6,6),gChaChicFuFd(2,5,3,3),& 
& gChaChiFvFe(2,5,6,3),gChaFdcFuGlu(2,3,3,1),gChaFecChaFe(2,3,2,3),gChiChicChaCha(5,5,2,2),& 
& gChiChiChiChi(5,5,5,5),gChiChicFdFd(5,5,3,3),gChiChicFeFe(5,5,3,3),gChiChicFuFu(5,5,3,3),& 
& gChiChiFvFv(5,5,6,6),gChiChacFdFu(5,2,3,3),gChiChacFeFv(5,2,3,6),gChiFdcFdGlu(5,3,3,1),& 
& gChiFucFuGlu(5,3,3,1),gFvFvcChaCha(6,6,2,2),gFvFvChiChi(6,6,5,5),gFvFvcFdFd(6,6,3,3),  & 
& gFvFvcFeFe(6,6,3,3),gFvFvcFuFu(6,6,3,3),gFvFvFvFv(6,6,6,6),gFvcFeChiCha(6,3,5,2),      & 
& gFvFecFdFu(6,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWm

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWm = gamW 
gTVZ = gamZ 
! One-Loop Decays 
If (OneLoopDecays) Then 
Call CalculateOneLoopDecays(gP1LSvRe,gP1LSvIm,gP1LHpm,gP1Lhh,gP1LAh,gP1LSu,           & 
& gP1LSd,gP1LSe,gP1LGlu,gP1LCha,gP1LChi,gP1LFv,MSd,MSd2,MSvIm,MSvIm2,MSvRe,              & 
& MSvRe2,MSu,MSu2,MSe,MSe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,             & 
& MCha,MCha2,MFe,MFe2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2,ZD,               & 
& ZVI,ZVR,ZU,ZE,ZH,ZA,ZP,ZN,UV,UM,UP,ZEL,ZER,ZDL,ZDR,ZUL,ZUR,vd,vu,vS,g1,g2,             & 
& g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,mv2,ms2,M1,M2,M3,epsI,deltaM,kont)

End if 


gPSvRe = 0._dp 
gTSvRe = 0._dp 
BRSvRe = 0._dp 
Call SvReTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPSvRe(:,1:132),gTSvRe,BRSvRe(:,1:132))

Do i1=1,6
gTSvRe(i1) =Sum(gPSvRe(i1,:)) 
If (gTSvRe(i1).Gt.0._dp) BRSvRe(i1,: ) =gPSvRe(i1,:)/gTSvRe(i1) 
If (OneLoopDecays) Then 
gT1LSvRe(i1) =Sum(gP1LSvRe(i1,:)) 
If (gT1LSvRe(i1).Gt.0._dp) BR1LSvRe(i1,: ) =gP1LSvRe(i1,:)/gT1LSvRe(i1) 
End if
End Do 
 

gPSvIm = 0._dp 
gTSvIm = 0._dp 
BRSvIm = 0._dp 
Call SvImTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPSvIm(:,1:132),gTSvIm,BRSvIm(:,1:132))

Do i1=1,6
gTSvIm(i1) =Sum(gPSvIm(i1,:)) 
If (gTSvIm(i1).Gt.0._dp) BRSvIm(i1,: ) =gPSvIm(i1,:)/gTSvIm(i1) 
If (OneLoopDecays) Then 
gT1LSvIm(i1) =Sum(gP1LSvIm(i1,:)) 
If (gT1LSvIm(i1).Gt.0._dp) BR1LSvIm(i1,: ) =gP1LSvIm(i1,:)/gT1LSvIm(i1) 
End if
End Do 
 

gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
Call HpmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPHpm(:,1:159),gTHpm,BRHpm(:,1:159))

Do i1=1,2
gTHpm(i1) =Sum(gPHpm(i1,:)) 
If (gTHpm(i1).Gt.0._dp) BRHpm(i1,: ) =gPHpm(i1,:)/gTHpm(i1) 
If (OneLoopDecays) Then 
gT1LHpm(i1) =Sum(gP1LHpm(i1,:)) 
If (gT1LHpm(i1).Gt.0._dp) BR1LHpm(i1,: ) =gP1LHpm(i1,:)/gT1LHpm(i1) 
End if
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPhh(:,1:290),gThh,BRhh(:,1:290))

Do i1=1,3
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
If (OneLoopDecays) Then 
gT1Lhh(i1) =Sum(gP1Lhh(i1,:)) 
If (gT1Lhh(i1).Gt.0._dp) BR1Lhh(i1,: ) =gP1Lhh(i1,:)/gT1Lhh(i1) 
End if
End Do 
 

gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPAh(:,1:288),gTAh,BRAh(:,1:288))

Do i1=1,3
gTAh(i1) =Sum(gPAh(i1,:)) 
If (gTAh(i1).Gt.0._dp) BRAh(i1,: ) =gPAh(i1,:)/gTAh(i1) 
If (OneLoopDecays) Then 
gT1LAh(i1) =Sum(gP1LAh(i1,:)) 
If (gT1LAh(i1).Gt.0._dp) BR1LAh(i1,: ) =gP1LAh(i1,:)/gT1LAh(i1) 
End if
End Do 
 

gPSu = 0._dp 
gTSu = 0._dp 
BRSu = 0._dp 
Call SuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPSu(:,1:84),gTSu,BRSu(:,1:84))

Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
If (OneLoopDecays) Then 
gT1LSu(i1) =Sum(gP1LSu(i1,:)) 
If (gT1LSu(i1).Gt.0._dp) BR1LSu(i1,: ) =gP1LSu(i1,:)/gT1LSu(i1) 
End if
End Do 
 

gPSd = 0._dp 
gTSd = 0._dp 
BRSd = 0._dp 
Call SdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPSd(:,1:84),gTSd,BRSd(:,1:84))

Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
If (OneLoopDecays) Then 
gT1LSd(i1) =Sum(gP1LSd(i1,:)) 
If (gT1LSd(i1).Gt.0._dp) BR1LSd(i1,: ) =gP1LSd(i1,:)/gT1LSd(i1) 
End if
End Do 
 

gPSe = 0._dp 
gTSe = 0._dp 
BRSe = 0._dp 
Call SeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPSe(:,1:93),gTSe,BRSe(:,1:93))

Do i1=1,6
gTSe(i1) =Sum(gPSe(i1,:)) 
If (gTSe(i1).Gt.0._dp) BRSe(i1,: ) =gPSe(i1,:)/gTSe(i1) 
If (OneLoopDecays) Then 
gT1LSe(i1) =Sum(gP1LSe(i1,:)) 
If (gT1LSe(i1).Gt.0._dp) BR1LSe(i1,: ) =gP1LSe(i1,:)/gT1LSe(i1) 
End if
End Do 
 

gPGlu = 0._dp 
gTGlu = 0._dp 
BRGlu = 0._dp 
Call GluTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPGlu(:,1:49),gTGlu,BRGlu(:,1:49))

Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
If (OneLoopDecays) Then 
gT1LGlu =Sum(gP1LGlu(i1,:)) 
If (gT1LGlu.Gt.0._dp) BR1LGlu(i1,: ) =gP1LGlu(i1,:)/gT1LGlu 
End if
End Do 
 

gPCha = 0._dp 
gTCha = 0._dp 
BRCha = 0._dp 
Call ChaTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPCha(:,1:132),gTCha,BRCha(:,1:132))

Do i1=1,2
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
If (OneLoopDecays) Then 
gT1LCha(i1) =Sum(gP1LCha(i1,:)) 
If (gT1LCha(i1).Gt.0._dp) BR1LCha(i1,: ) =gP1LCha(i1,:)/gT1LCha(i1) 
End if
End Do 
 

gPChi = 0._dp 
gTChi = 0._dp 
BRChi = 0._dp 
Call ChiTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPChi(:,1:166),gTChi,BRChi(:,1:166))

Do i1=1,5
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
If (OneLoopDecays) Then 
gT1LChi(i1) =Sum(gP1LChi(i1,:)) 
If (gT1LChi(i1).Gt.0._dp) BR1LChi(i1,: ) =gP1LChi(i1,:)/gT1LChi(i1) 
End if
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gPFv(:,1:120),gTFv,BRFv(:,1:120))

Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
If (OneLoopDecays) Then 
gT1LFv(i1) =Sum(gP1LFv(i1,:)) 
If (gT1LFv(i1).Gt.0._dp) BR1LFv(i1,: ) =gP1LFv(i1,:)/gT1LFv(i1) 
End if
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_SvRe)) Then 
If (MaxVal(gTSvRe).Lt.MaxVal(fac3*Abs(MSvRe))) Then 
Call SvReThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gSvReAhChacFe,gSvReAhChiFv,gSvRecSeChaChi,               & 
& gSvRecHpmChaFv,gSvRehhChacFe,gSvReSvImChacCha,gSvReSvReChacCha,gSvReSvImChiChi,        & 
& gSvReSvReChiChi,gSvRecHpmChiFe,gSvRehhChiFv,gSvReFeFucSd,gSvRecSeFeFv,gSvReFeSucFd,    & 
& gSvReSvImFecFe,gSvReSvReFecFe,gSvReFvFdcSd,gSvReFvFucSu,gSvReSvImFvFv,gSvReSvReFvFv,   & 
& gSvReSeFucFd,gSvReSvImFdcFd,gSvReSvImFucFu,gSvReSvReFdcFd,gSvReSvReFucFu,              & 
& epsI,deltaM,.False.,gTSvRe,gPSvRe(:,133:2052),BRSvRe(:,133:2052))

Else 
Call SvReThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gSvReAhChacFe,gSvReAhChiFv,gSvRecSeChaChi,               & 
& gSvRecHpmChaFv,gSvRehhChacFe,gSvReSvImChacCha,gSvReSvReChacCha,gSvReSvImChiChi,        & 
& gSvReSvReChiChi,gSvRecHpmChiFe,gSvRehhChiFv,gSvReFeFucSd,gSvRecSeFeFv,gSvReFeSucFd,    & 
& gSvReSvImFecFe,gSvReSvReFecFe,gSvReFvFdcSd,gSvReFvFucSu,gSvReSvImFvFv,gSvReSvReFvFv,   & 
& gSvReSeFucFd,gSvReSvImFdcFd,gSvReSvImFucFu,gSvReSvReFdcFd,gSvReSvReFucFu,              & 
& epsI,deltaM,.True.,gTSvRe,gPSvRe(:,133:2052),BRSvRe(:,133:2052))

End If 
 
End If 
Else 
Call SvReThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gSvReAhChacFe,gSvReAhChiFv,gSvRecSeChaChi,               & 
& gSvRecHpmChaFv,gSvRehhChacFe,gSvReSvImChacCha,gSvReSvReChacCha,gSvReSvImChiChi,        & 
& gSvReSvReChiChi,gSvRecHpmChiFe,gSvRehhChiFv,gSvReFeFucSd,gSvRecSeFeFv,gSvReFeSucFd,    & 
& gSvReSvImFecFe,gSvReSvReFecFe,gSvReFvFdcSd,gSvReFvFucSu,gSvReSvImFvFv,gSvReSvReFvFv,   & 
& gSvReSeFucFd,gSvReSvImFdcFd,gSvReSvImFucFu,gSvReSvReFdcFd,gSvReSvReFucFu,              & 
& epsI,deltaM,.False.,gTSvRe,gPSvRe(:,133:2052),BRSvRe(:,133:2052))

End If 
Do i1=1,6
gTSvRe(i1) =Sum(gPSvRe(i1,:)) 
If (gTSvRe(i1).Gt.0._dp) BRSvRe(i1,: ) =gPSvRe(i1,:)/gTSvRe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_SvIm)) Then 
If (MaxVal(gTSvIm).Lt.MaxVal(fac3*Abs(MSvIm))) Then 
Call SvImThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gSvImAhChacFe,gSvImAhChiFv,gSvImcSeChaChi,               & 
& gSvImcHpmChaFv,gSvImhhChacFe,gSvImSvImChacCha,gSvImSvReChacCha,gSvImSvImChiChi,        & 
& gSvImSvReChiChi,gSvImcHpmChiFe,gSvImhhChiFv,gSvImFeFucSd,gSvImcSeFeFv,gSvImFeSucFd,    & 
& gSvImSvImFecFe,gSvImSvReFecFe,gSvImFvFdcSd,gSvImFvFucSu,gSvImSvImFvFv,gSvImSvReFvFv,   & 
& gSvImSeFucFd,gSvImSvImFdcFd,gSvImSvImFucFu,gSvImSvReFdcFd,gSvImSvReFucFu,              & 
& epsI,deltaM,.False.,gTSvIm,gPSvIm(:,133:2052),BRSvIm(:,133:2052))

Else 
Call SvImThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gSvImAhChacFe,gSvImAhChiFv,gSvImcSeChaChi,               & 
& gSvImcHpmChaFv,gSvImhhChacFe,gSvImSvImChacCha,gSvImSvReChacCha,gSvImSvImChiChi,        & 
& gSvImSvReChiChi,gSvImcHpmChiFe,gSvImhhChiFv,gSvImFeFucSd,gSvImcSeFeFv,gSvImFeSucFd,    & 
& gSvImSvImFecFe,gSvImSvReFecFe,gSvImFvFdcSd,gSvImFvFucSu,gSvImSvImFvFv,gSvImSvReFvFv,   & 
& gSvImSeFucFd,gSvImSvImFdcFd,gSvImSvImFucFu,gSvImSvReFdcFd,gSvImSvReFucFu,              & 
& epsI,deltaM,.True.,gTSvIm,gPSvIm(:,133:2052),BRSvIm(:,133:2052))

End If 
 
End If 
Else 
Call SvImThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,mv2,ms2,M1,M2,M3,vd,vu,vS,gSvImAhChacFe,gSvImAhChiFv,gSvImcSeChaChi,               & 
& gSvImcHpmChaFv,gSvImhhChacFe,gSvImSvImChacCha,gSvImSvReChacCha,gSvImSvImChiChi,        & 
& gSvImSvReChiChi,gSvImcHpmChiFe,gSvImhhChiFv,gSvImFeFucSd,gSvImcSeFeFv,gSvImFeSucFd,    & 
& gSvImSvImFecFe,gSvImSvReFecFe,gSvImFvFdcSd,gSvImFvFucSu,gSvImSvImFvFv,gSvImSvReFvFv,   & 
& gSvImSeFucFd,gSvImSvImFdcFd,gSvImSvImFucFu,gSvImSvReFdcFd,gSvImSvReFucFu,              & 
& epsI,deltaM,.False.,gTSvIm,gPSvIm(:,133:2052),BRSvIm(:,133:2052))

End If 
Do i1=1,6
gTSvIm(i1) =Sum(gPSvIm(i1,:)) 
If (gTSvIm(i1).Gt.0._dp) BRSvIm(i1,: ) =gPSvIm(i1,:)/gTSvIm(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Hpm)) Then 
If (MaxVal(gTHpm).Lt.MaxVal(fac3*Abs(MHpm))) Then 
Call HpmThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gHpmAhChaChi,gHpmAhFdcFu,gHpmAhFeFv,gHpmChaChacHpm,              & 
& gHpmhhChaChi,gHpmFdChacSd,gHpmChaFecSe,gHpmcSuChaFu,gHpmSvImChaFv,gHpmSvReChaFv,       & 
& gHpmHpmChacCha,gHpmSdChacFd,gHpmSeChacFe,gHpmcFuChaSu,gHpmHpmChiChi,gHpmcSuChiFd,      & 
& gHpmSvImChiFe,gHpmSvReChiFe,gHpmSeChiFv,gHpmSdChicFu,gHpmcSuFdGlu,gHpmhhFdcFu,         & 
& gHpmHpmFdcFd,gHpmFeFecHpm,gHpmhhFeFv,gHpmHpmFecFe,gHpmSeFecCha,gHpmHpmFvFv,            & 
& gHpmHpmFucFu,gHpmSdGlucFu,epsI,deltaM,.False.,gTHpm,gPHpm(:,160:1563),BRHpm(:,160:1563))

Else 
Call HpmThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gHpmAhChaChi,gHpmAhFdcFu,gHpmAhFeFv,gHpmChaChacHpm,              & 
& gHpmhhChaChi,gHpmFdChacSd,gHpmChaFecSe,gHpmcSuChaFu,gHpmSvImChaFv,gHpmSvReChaFv,       & 
& gHpmHpmChacCha,gHpmSdChacFd,gHpmSeChacFe,gHpmcFuChaSu,gHpmHpmChiChi,gHpmcSuChiFd,      & 
& gHpmSvImChiFe,gHpmSvReChiFe,gHpmSeChiFv,gHpmSdChicFu,gHpmcSuFdGlu,gHpmhhFdcFu,         & 
& gHpmHpmFdcFd,gHpmFeFecHpm,gHpmhhFeFv,gHpmHpmFecFe,gHpmSeFecCha,gHpmHpmFvFv,            & 
& gHpmHpmFucFu,gHpmSdGlucFu,epsI,deltaM,.True.,gTHpm,gPHpm(:,160:1563),BRHpm(:,160:1563))

End If 
 
End If 
Else 
Call HpmThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gHpmAhChaChi,gHpmAhFdcFu,gHpmAhFeFv,gHpmChaChacHpm,              & 
& gHpmhhChaChi,gHpmFdChacSd,gHpmChaFecSe,gHpmcSuChaFu,gHpmSvImChaFv,gHpmSvReChaFv,       & 
& gHpmHpmChacCha,gHpmSdChacFd,gHpmSeChacFe,gHpmcFuChaSu,gHpmHpmChiChi,gHpmcSuChiFd,      & 
& gHpmSvImChiFe,gHpmSvReChiFe,gHpmSeChiFv,gHpmSdChicFu,gHpmcSuFdGlu,gHpmhhFdcFu,         & 
& gHpmHpmFdcFd,gHpmFeFecHpm,gHpmhhFeFv,gHpmHpmFecFe,gHpmSeFecCha,gHpmHpmFvFv,            & 
& gHpmHpmFucFu,gHpmSdGlucFu,epsI,deltaM,.False.,gTHpm,gPHpm(:,160:1563),BRHpm(:,160:1563))

End If 
Do i1=1,2
gTHpm(i1) =Sum(gPHpm(i1,:)) 
If (gTHpm(i1).Gt.0._dp) BRHpm(i1,: ) =gPHpm(i1,:)/gTHpm(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_hh)) Then 
If (MaxVal(gThh).Lt.MaxVal(fac3*Abs(Mhh))) Then 
Call hhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,ghhAhChacCha,ghhAhChiChi,ghhAhFdcFd,ghhAhFecFe,ghhAhFucFu,       & 
& ghhAhFvFv,ghhcHpmChaChi,ghhcSdChaFu,ghhcSeChaFv,ghhhhChacCha,ghhSuChacFd,              & 
& ghhSvImChacFe,ghhSvReChacFe,ghhhhChiChi,ghhcSdChiFd,ghhcSeChiFe,ghhcSuChiFu,           & 
& ghhSvImChiFv,ghhSvReChiFv,ghhcSdFdGlu,ghhhhFdcFd,ghhcHpmFdcFu,ghhcHpmFeFv,             & 
& ghhhhFecFe,ghhcSuFuGlu,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,.False.,gThh,gPhh(:,291:1798)  & 
& ,BRhh(:,291:1798))

Else 
Call hhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,ghhAhChacCha,ghhAhChiChi,ghhAhFdcFd,ghhAhFecFe,ghhAhFucFu,       & 
& ghhAhFvFv,ghhcHpmChaChi,ghhcSdChaFu,ghhcSeChaFv,ghhhhChacCha,ghhSuChacFd,              & 
& ghhSvImChacFe,ghhSvReChacFe,ghhhhChiChi,ghhcSdChiFd,ghhcSeChiFe,ghhcSuChiFu,           & 
& ghhSvImChiFv,ghhSvReChiFv,ghhcSdFdGlu,ghhhhFdcFd,ghhcHpmFdcFu,ghhcHpmFeFv,             & 
& ghhhhFecFe,ghhcSuFuGlu,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,.True.,gThh,gPhh(:,291:1798)   & 
& ,BRhh(:,291:1798))

End If 
 
End If 
Else 
Call hhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,ghhAhChacCha,ghhAhChiChi,ghhAhFdcFd,ghhAhFecFe,ghhAhFucFu,       & 
& ghhAhFvFv,ghhcHpmChaChi,ghhcSdChaFu,ghhcSeChaFv,ghhhhChacCha,ghhSuChacFd,              & 
& ghhSvImChacFe,ghhSvReChacFe,ghhhhChiChi,ghhcSdChiFd,ghhcSeChiFe,ghhcSuChiFu,           & 
& ghhSvImChiFv,ghhSvReChiFv,ghhcSdFdGlu,ghhhhFdcFd,ghhcHpmFdcFu,ghhcHpmFeFv,             & 
& ghhhhFecFe,ghhcSuFuGlu,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,.False.,gThh,gPhh(:,291:1798)  & 
& ,BRhh(:,291:1798))

End If 
Do i1=1,3
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Ah)) Then 
If (MaxVal(gTAh).Lt.MaxVal(fac3*Abs(MAh))) Then 
Call AhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gAhAhChacCha,gAhAhChiChi,gAhAhFdcFd,gAhAhFecFe,gAhAhFucFu,       & 
& gAhAhFvFv,gAhcHpmChaChi,gAhcSdChaFu,gAhcSeChaFv,gAhhhChacCha,gAhSuChacFd,              & 
& gAhSvImChacFe,gAhSvReChacFe,gAhhhChiChi,gAhcSdChiFd,gAhcSeChiFe,gAhcSuChiFu,           & 
& gAhSvImChiFv,gAhSvReChiFv,gAhcSdFdGlu,gAhhhFdcFd,gAhcHpmFdcFu,gAhcHpmFeFv,             & 
& gAhhhFecFe,gAhcSuFuGlu,gAhhhFucFu,gAhhhFvFv,epsI,deltaM,.False.,gTAh,gPAh(:,289:1796)  & 
& ,BRAh(:,289:1796))

Else 
Call AhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gAhAhChacCha,gAhAhChiChi,gAhAhFdcFd,gAhAhFecFe,gAhAhFucFu,       & 
& gAhAhFvFv,gAhcHpmChaChi,gAhcSdChaFu,gAhcSeChaFv,gAhhhChacCha,gAhSuChacFd,              & 
& gAhSvImChacFe,gAhSvReChacFe,gAhhhChiChi,gAhcSdChiFd,gAhcSeChiFe,gAhcSuChiFu,           & 
& gAhSvImChiFv,gAhSvReChiFv,gAhcSdFdGlu,gAhhhFdcFd,gAhcHpmFdcFu,gAhcHpmFeFv,             & 
& gAhhhFecFe,gAhcSuFuGlu,gAhhhFucFu,gAhhhFvFv,epsI,deltaM,.True.,gTAh,gPAh(:,289:1796)   & 
& ,BRAh(:,289:1796))

End If 
 
End If 
Else 
Call AhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gAhAhChacCha,gAhAhChiChi,gAhAhFdcFd,gAhAhFecFe,gAhAhFucFu,       & 
& gAhAhFvFv,gAhcHpmChaChi,gAhcSdChaFu,gAhcSeChaFv,gAhhhChacCha,gAhSuChacFd,              & 
& gAhSvImChacFe,gAhSvReChacFe,gAhhhChiChi,gAhcSdChiFd,gAhcSeChiFe,gAhcSuChiFu,           & 
& gAhSvImChiFv,gAhSvReChiFv,gAhcSdFdGlu,gAhhhFdcFd,gAhcHpmFdcFu,gAhcHpmFeFv,             & 
& gAhhhFecFe,gAhcSuFuGlu,gAhhhFucFu,gAhhhFvFv,epsI,deltaM,.False.,gTAh,gPAh(:,289:1796)  & 
& ,BRAh(:,289:1796))

End If 
Do i1=1,3
gTAh(i1) =Sum(gPAh(i1,:)) 
If (gTAh(i1).Gt.0._dp) BRAh(i1,: ) =gPAh(i1,:)/gTAh(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Su)) Then 
If (MaxVal(gTSu).Lt.MaxVal(fac3*Abs(MSu))) Then 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,gSucHpmChiFd,      & 
& gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,gSuFdFvcSe,gSuhhFdcCha,gSuSuFdcFd,      & 
& gSuFdSvImcFe,gSuFdSvRecFe,gSucHpmChaFu,gSuFuFecSe,gSuFuFucSu,gSuFuFvSvIm,              & 
& gSuFuFvSvRe,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,gSuSuFucFu,gSucHpmFdGlu,gSuhhFuGlu,     & 
& gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,gSuSuFecFe,gSuSuFvFv,epsI,            & 
& deltaM,.False.,gTSu,gPSu(:,85:1758),BRSu(:,85:1758))

Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,gSucHpmChiFd,      & 
& gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,gSuFdFvcSe,gSuhhFdcCha,gSuSuFdcFd,      & 
& gSuFdSvImcFe,gSuFdSvRecFe,gSucHpmChaFu,gSuFuFecSe,gSuFuFucSu,gSuFuFvSvIm,              & 
& gSuFuFvSvRe,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,gSuSuFucFu,gSucHpmFdGlu,gSuhhFuGlu,     & 
& gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,gSuSuFecFe,gSuSuFvFv,epsI,            & 
& deltaM,.True.,gTSu,gPSu(:,85:1758),BRSu(:,85:1758))

End If 
 
End If 
Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,gSucHpmChiFd,      & 
& gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,gSuFdFvcSe,gSuhhFdcCha,gSuSuFdcFd,      & 
& gSuFdSvImcFe,gSuFdSvRecFe,gSucHpmChaFu,gSuFuFecSe,gSuFuFucSu,gSuFuFvSvIm,              & 
& gSuFuFvSvRe,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,gSuSuFucFu,gSucHpmFdGlu,gSuhhFuGlu,     & 
& gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,gSuSuFecFe,gSuSuFvFv,epsI,            & 
& deltaM,.False.,gTSu,gPSu(:,85:1758),BRSu(:,85:1758))

End If 
Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Sd)) Then 
If (MaxVal(gTSd).Lt.MaxVal(fac3*Abs(MSd))) Then 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,       & 
& gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,    & 
& gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,gSdFdFvSvIm,gSdFdFvSvRe,gSdHpmFdcCha,gSdSdFdcFd,      & 
& gSdFdSecFe,gSdSuFdcFu,gSdFuFeSvIm,gSdFuFeSvRe,gSdFuFvSe,gSdSdFucFu,gSdhhFdGlu,         & 
& gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,gSdSdFvFv,gSdSuFeFv,epsI,deltaM,.False.,            & 
& gTSd,gPSd(:,85:1758),BRSd(:,85:1758))

Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,       & 
& gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,    & 
& gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,gSdFdFvSvIm,gSdFdFvSvRe,gSdHpmFdcCha,gSdSdFdcFd,      & 
& gSdFdSecFe,gSdSuFdcFu,gSdFuFeSvIm,gSdFuFeSvRe,gSdFuFvSe,gSdSdFucFu,gSdhhFdGlu,         & 
& gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,gSdSdFvFv,gSdSuFeFv,epsI,deltaM,.True.,             & 
& gTSd,gPSd(:,85:1758),BRSd(:,85:1758))

End If 
 
End If 
Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,       & 
& gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,    & 
& gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,gSdFdFvSvIm,gSdFdFvSvRe,gSdHpmFdcCha,gSdSdFdcFd,      & 
& gSdFdSecFe,gSdSuFdcFu,gSdFuFeSvIm,gSdFuFeSvRe,gSdFuFvSe,gSdSdFucFu,gSdhhFdGlu,         & 
& gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,gSdSdFvFv,gSdSuFeFv,epsI,deltaM,.False.,            & 
& gTSd,gPSd(:,85:1758),BRSd(:,85:1758))

End If 
Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Se)) Then 
If (MaxVal(gTSe).Lt.MaxVal(fac3*Abs(MSe))) Then 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gSeAhChaFv,gSeAhChiFe,gSeChaChacSe,gSeSvImChaChi,gSeSvReChaChi,  & 
& gSeChaFecHpm,gSehhChaFv,gSeHpmChacFe,gSeSeChacCha,gSeSeChiChi,gSehhChiFe,              & 
& gSeHpmChiFv,gSeFeFdcSd,gSeFeFecSe,gSeFeFucSu,gSeSvImFeFv,gSeSvReFeFv,gSeHpmFecCha,     & 
& gSeFeSdcFd,gSeSeFecFe,gSeFeSucFu,gSeFvFdcSu,gSeSeFvFv,gSeFvSdcFu,gSeSeFdcFd,           & 
& gSeSeFucFu,gSeSvImFdcFu,gSeSvReFdcFu,epsI,deltaM,.False.,gTSe,gPSe(:,94:1857)          & 
& ,BRSe(:,94:1857))

Else 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gSeAhChaFv,gSeAhChiFe,gSeChaChacSe,gSeSvImChaChi,gSeSvReChaChi,  & 
& gSeChaFecHpm,gSehhChaFv,gSeHpmChacFe,gSeSeChacCha,gSeSeChiChi,gSehhChiFe,              & 
& gSeHpmChiFv,gSeFeFdcSd,gSeFeFecSe,gSeFeFucSu,gSeSvImFeFv,gSeSvReFeFv,gSeHpmFecCha,     & 
& gSeFeSdcFd,gSeSeFecFe,gSeFeSucFu,gSeFvFdcSu,gSeSeFvFv,gSeFvSdcFu,gSeSeFdcFd,           & 
& gSeSeFucFu,gSeSvImFdcFu,gSeSvReFdcFu,epsI,deltaM,.True.,gTSe,gPSe(:,94:1857)           & 
& ,BRSe(:,94:1857))

End If 
 
End If 
Else 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gSeAhChaFv,gSeAhChiFe,gSeChaChacSe,gSeSvImChaChi,gSeSvReChaChi,  & 
& gSeChaFecHpm,gSehhChaFv,gSeHpmChacFe,gSeSeChacCha,gSeSeChiChi,gSehhChiFe,              & 
& gSeHpmChiFv,gSeFeFdcSd,gSeFeFecSe,gSeFeFucSu,gSeSvImFeFv,gSeSvReFeFv,gSeHpmFecCha,     & 
& gSeFeSdcFd,gSeSeFecFe,gSeFeSucFu,gSeFvFdcSu,gSeSeFvFv,gSeFvSdcFu,gSeSeFdcFd,           & 
& gSeSeFucFu,gSeSvImFdcFu,gSeSvReFdcFu,epsI,deltaM,.False.,gTSe,gPSe(:,94:1857)          & 
& ,BRSe(:,94:1857))

End If 
Do i1=1,6
gTSe(i1) =Sum(gPSe(i1,:)) 
If (gTSe(i1).Gt.0._dp) BRSe(i1,: ) =gPSe(i1,:)/gTSe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Glu)) Then 
If (gTGlu.Lt.fac3*Abs(MGlu)) Then 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,               & 
& epsI,deltaM,.False.,gTGlu,gPGlu(:,50:157),BRGlu(:,50:157))

Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,               & 
& epsI,deltaM,.True.,gTGlu,gPGlu(:,50:157),BRGlu(:,50:157))

End If 
 
End If 
Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,               & 
& epsI,deltaM,.False.,gTGlu,gPGlu(:,50:157),BRGlu(:,50:157))

End If 
Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Cha)) Then 
If (MaxVal(gTCha).Lt.MaxVal(fac3*Abs(MCha))) Then 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,              & 
& gTVZ,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,gChaChacFuFu,              & 
& gChaChaFvFv,gChaChicFuFd,gChaChiFvFe,gChaFdcFuGlu,gChaFecChaFe,epsI,deltaM,            & 
& .False.,gTCha,gPCha(:,133:478),BRCha(:,133:478))

Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,              & 
& gTVZ,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,gChaChacFuFu,              & 
& gChaChaFvFv,gChaChicFuFd,gChaChiFvFe,gChaFdcFuGlu,gChaFecChaFe,epsI,deltaM,            & 
& .True.,gTCha,gPCha(:,133:478),BRCha(:,133:478))

End If 
 
End If 
Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,              & 
& gTVZ,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,gChaChacFuFu,              & 
& gChaChaFvFv,gChaChicFuFd,gChaChiFvFe,gChaFdcFuGlu,gChaFecChaFe,epsI,deltaM,            & 
& .False.,gTCha,gPCha(:,133:478),BRCha(:,133:478))

End If 
Do i1=1,2
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Chi)) Then 
If (MaxVal(gTChi).Lt.MaxVal(fac3*Abs(MChi))) Then 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,              & 
& gTVZ,gChiChicChaCha,gChiChiChiChi,gChiChicFdFd,gChiChicFeFe,gChiChicFuFu,              & 
& gChiChiFvFv,gChiChacFdFu,gChiChacFeFv,gChiFdcFdGlu,gChiFucFuGlu,epsI,deltaM,           & 
& .False.,gTChi,gPChi(:,167:698),BRChi(:,167:698))

Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,              & 
& gTVZ,gChiChicChaCha,gChiChiChiChi,gChiChicFdFd,gChiChicFeFe,gChiChicFuFu,              & 
& gChiChiFvFv,gChiChacFdFu,gChiChacFeFv,gChiFdcFdGlu,gChiFucFuGlu,epsI,deltaM,           & 
& .True.,gTChi,gPChi(:,167:698),BRChi(:,167:698))

End If 
 
End If 
Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,              & 
& gTVZ,gChiChicChaCha,gChiChiChiChi,gChiChicFdFd,gChiChicFeFe,gChiChicFuFu,              & 
& gChiChiFvFv,gChiChacFdFu,gChiChacFeFv,gChiFdcFdGlu,gChiFucFuGlu,epsI,deltaM,           & 
& .False.,gTChi,gPChi(:,167:698),BRChi(:,167:698))

End If 
Do i1=1,5
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fv)) Then 
If (MaxVal(gTFv).Lt.MaxVal(fac3*Abs(MFv))) Then 
Call FvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,gTVZ,gFvFvcChaCha,      & 
& gFvFvChiChi,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvcFeChiCha,gFvFecFdFu,        & 
& epsI,deltaM,.False.,gTFv,gPFv(:,121:729),BRFv(:,121:729))

Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,gTVZ,gFvFvcChaCha,      & 
& gFvFvChiChi,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvcFeChiCha,gFvFecFdFu,        & 
& epsI,deltaM,.True.,gTFv,gPFv(:,121:729),BRFv(:,121:729))

End If 
 
End If 
Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,              & 
& ms2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,gTVZ,gFvFvcChaCha,      & 
& gFvFvChiChi,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvcFeChiCha,gFvFecFdFu,        & 
& epsI,deltaM,.False.,gTFv,gPFv(:,121:729),BRFv(:,121:729))

End If 
Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_seesaw1nmssm 
 