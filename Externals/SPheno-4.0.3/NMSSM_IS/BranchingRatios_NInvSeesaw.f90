! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:29 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_NInvSeesaw 
 
Use Control 
Use Settings 
Use Couplings_NInvSeesaw 
Use Model_Data_NInvSeesaw 
Use LoopCouplings_NInvSeesaw 
Use hh3Decays_NInvSeesaw 
Use Ah3Decays_NInvSeesaw 
Use Hpm3Decays_NInvSeesaw 
Use Sd3Decays_NInvSeesaw 
Use Su3Decays_NInvSeesaw 
Use Se3Decays_NInvSeesaw 
Use SvIm3Decays_NInvSeesaw 
Use SvRe3Decays_NInvSeesaw 
Use Chi3Decays_NInvSeesaw 
Use Cha3Decays_NInvSeesaw 
Use Glu3Decays_NInvSeesaw 
Use Fv3Decays_NInvSeesaw 
Use TreeLevelDecays_NInvSeesaw 
Use OneLoopDecays_NInvSeesaw


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MCha,MCha2,MChi,           & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,              & 
& pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,              & 
& ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,             & 
& Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,gPhh,gThh,               & 
& BRhh,gPAh,gTAh,BRAh,gPHpm,gTHpm,BRHpm,gPSd,gTSd,BRSd,gPSu,gTSu,BRSu,gPSe,              & 
& gTSe,BRSe,gPSvIm,gTSvIm,BRSvIm,gPSvRe,gTSvRe,BRSvRe,gPChi,gTChi,BRChi,gPCha,           & 
& gTCha,BRCha,gPGlu,gTGlu,BRGlu,gPFv,gTFv,BRFv)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(inout) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),              & 
& MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),ZVR(9,9),ZW(2,2)

Real(dp),Intent(inout) :: vd,vu,vS

Real(dp),Intent(inout) :: gPhh(3,2725),gThh(3),BRhh(3,2725),gPAh(3,2723),gTAh(3),BRAh(3,2723),gPHpm(2,2112),    & 
& gTHpm(2),BRHpm(2,2112),gPSd(6,2460),gTSd(6),BRSd(6,2460),gPSu(6,2460),gTSu(6),         & 
& BRSu(6,2460),gPSe(6,2703),gTSe(6),BRSe(6,2703),gPSvIm(9,3735),gTSvIm(9),               & 
& BRSvIm(9,3735),gPSvRe(9,3735),gTSvRe(9),BRSvRe(9,3735),gPChi(5,1031),gTChi(5),         & 
& BRChi(5,1031),gPCha(2,649),gTCha(2),BRCha(2,649),gPGlu(1,157),gTGlu,BRGlu(1,157),      & 
& gPFv(9,1461),gTFv(9),BRFv(9,1461)

Complex(dp) :: cplHiggsPP(3),cplHiggsGG(3),cplPseudoHiggsPP(3),cplPseudoHiggsGG(3),cplHiggsZZvirt(3),& 
& cplHiggsWWvirt(3)

Real(dp) :: ghhAhChacCha(3,3,2,2),ghhAhChiChi(3,3,5,5),ghhAhFdcFd(3,3,3,3),ghhAhFecFe(3,3,3,3),   & 
& ghhAhFucFu(3,3,3,3),ghhAhFvFv(3,3,9,9),ghhcHpmChaChi(3,2,2,5),ghhcSdChaFu(3,6,2,3),    & 
& ghhcSeChaFv(3,6,2,9),ghhhhChacCha(3,3,2,2),ghhSuChacFd(3,6,2,3),ghhSvImChacFe(3,9,2,3),& 
& ghhSvReChacFe(3,9,2,3),ghhhhChiChi(3,3,5,5),ghhcSdChiFd(3,6,5,3),ghhcSeChiFe(3,6,5,3), & 
& ghhcSuChiFu(3,6,5,3),ghhSvImChiFv(3,9,5,9),ghhSvReChiFv(3,9,5,9),ghhcSdFdGlu(3,6,3,1), & 
& ghhhhFdcFd(3,3,3,3),ghhcHpmFdcFu(3,2,3,3),ghhcHpmFeFv(3,2,3,9),ghhhhFecFe(3,3,3,3),    & 
& ghhcSuFuGlu(3,6,3,1),ghhhhFucFu(3,3,3,3),ghhhhFvFv(3,3,9,9),gAhAhChacCha(3,3,2,2),     & 
& gAhAhChiChi(3,3,5,5),gAhAhFdcFd(3,3,3,3),gAhAhFecFe(3,3,3,3),gAhAhFucFu(3,3,3,3),      & 
& gAhAhFvFv(3,3,9,9),gAhcHpmChaChi(3,2,2,5),gAhcSdChaFu(3,6,2,3),gAhcSeChaFv(3,6,2,9),   & 
& gAhhhChacCha(3,3,2,2),gAhSuChacFd(3,6,2,3),gAhSvImChacFe(3,9,2,3),gAhSvReChacFe(3,9,2,3),& 
& gAhhhChiChi(3,3,5,5),gAhcSdChiFd(3,6,5,3),gAhcSeChiFe(3,6,5,3),gAhcSuChiFu(3,6,5,3),   & 
& gAhSvImChiFv(3,9,5,9),gAhSvReChiFv(3,9,5,9),gAhcSdFdGlu(3,6,3,1),gAhhhFdcFd(3,3,3,3),  & 
& gAhcHpmFdcFu(3,2,3,3),gAhcHpmFeFv(3,2,3,9),gAhhhFecFe(3,3,3,3),gAhcSuFuGlu(3,6,3,1),   & 
& gAhhhFucFu(3,3,3,3),gAhhhFvFv(3,3,9,9),gHpmAhChaChi(2,3,2,5),gHpmAhFdcFu(2,3,3,3),     & 
& gHpmAhFeFv(2,3,3,9),gHpmChaChacHpm(2,2,2,2),gHpmhhChaChi(2,3,2,5),gHpmFdChacSd(2,3,2,6),& 
& gHpmChaFecSe(2,2,3,6),gHpmcSuChaFu(2,6,2,3),gHpmSvImChaFv(2,9,2,9),gHpmSvReChaFv(2,9,2,9),& 
& gHpmHpmChacCha(2,2,2,2),gHpmSdChacFd(2,6,2,3),gHpmSeChacFe(2,6,2,3),gHpmcFuChaSu(2,3,2,6),& 
& gHpmHpmChiChi(2,2,5,5),gHpmcSuChiFd(2,6,5,3),gHpmSvImChiFe(2,9,5,3),gHpmSvReChiFe(2,9,5,3),& 
& gHpmSeChiFv(2,6,5,9),gHpmSdChicFu(2,6,5,3),gHpmcSuFdGlu(2,6,3,1),gHpmhhFdcFu(2,3,3,3), & 
& gHpmHpmFdcFd(2,2,3,3),gHpmFeFecHpm(2,3,3,2),gHpmhhFeFv(2,3,3,9),gHpmHpmFecFe(2,2,3,3), & 
& gHpmSeFecCha(2,6,3,2),gHpmHpmFvFv(2,2,9,9),gHpmHpmFucFu(2,2,3,3),gHpmSdGlucFu(2,6,1,3),& 
& gSdAhChaFu(6,3,2,3),gSdAhChiFd(6,3,5,3),gSdAhFdGlu(6,3,3,1),gSdSuChaChi(6,6,2,5),      & 
& gSdChaFdcHpm(6,2,3,2),gSdhhChaFu(6,3,2,3),gSdChaGluSu(6,2,1,6),gSdSdChacCha(6,6,2,2),  & 
& gSdSdChiChi(6,6,5,5),gSdhhChiFd(6,3,5,3),gSdHpmChiFu(6,2,5,3),gSdChiGluSd(6,5,1,6),    & 
& gSdFdFdcSd(6,3,3,6),gSdFdFecSe(6,3,3,6),gSdFuFdcSu(6,3,3,6),gSdFdFvSvIm(6,3,9,9),      & 
& gSdFdFvSvRe(6,3,9,9),gSdHpmFdcCha(6,2,3,2),gSdSdFdcFd(6,6,3,3),gSdFdSecFe(6,3,6,3),    & 
& gSdSuFdcFu(6,6,3,3),gSdFuFeSvIm(6,3,3,9),gSdFuFeSvRe(6,3,3,9),gSdFuFvSe(6,3,9,6),      & 
& gSdSdFucFu(6,6,3,3),gSdhhFdGlu(6,3,3,1),gSdHpmFuGlu(6,2,3,1),gSdGluGluSd(6,1,1,6),     & 
& gSdSdFecFe(6,6,3,3),gSdSdFvFv(6,6,9,9),gSdSuFeFv(6,6,3,9),gSuAhChiFu(6,3,5,3),         & 
& gSuAhFdcCha(6,3,3,2),gSuAhFuGlu(6,3,3,1),gSuSuChiChi(6,6,5,5),gSucHpmChiFd(6,2,5,3),   & 
& gSuhhChiFu(6,3,5,3),gSuChiGluSu(6,5,1,6),gSuSdChicCha(6,6,5,2),gSuFdFucSd(6,3,3,6),    & 
& gSuFdFvcSe(6,3,9,6),gSuhhFdcCha(6,3,3,2),gSuSuFdcFd(6,6,3,3),gSuFdSvImcFe(6,3,9,3),    & 
& gSuFdSvRecFe(6,3,9,3),gSucHpmChaFu(6,2,2,3),gSuFuFecSe(6,3,3,6),gSuFuFucSu(6,3,3,6),   & 
& gSuFuFvSvIm(6,3,9,9),gSuFuFvSvRe(6,3,9,9),gSucChaFuHpm(6,2,3,2),gSuSdFucFd(6,6,3,3),   & 
& gSuFuSecFe(6,3,6,3),gSuSuFucFu(6,6,3,3),gSucHpmFdGlu(6,2,3,1),gSuhhFuGlu(6,3,3,1),     & 
& gSuGluGluSu(6,1,1,6),gSuGluSdcCha(6,1,6,2),gSuSdFvcFe(6,6,9,3),gSuSuChacCha(6,6,2,2),  & 
& gSuSuFecFe(6,6,3,3),gSuSuFvFv(6,6,9,9),gSeAhChaFv(6,3,2,9),gSeAhChiFe(6,3,5,3)

Real(dp) :: gSeChaChacSe(6,2,2,6),gSeSvImChaChi(6,9,2,5),gSeSvReChaChi(6,9,2,5),gSeChaFecHpm(6,2,3,2),& 
& gSehhChaFv(6,3,2,9),gSeHpmChacFe(6,2,2,3),gSeSeChacCha(6,6,2,2),gSeSeChiChi(6,6,5,5),  & 
& gSehhChiFe(6,3,5,3),gSeHpmChiFv(6,2,5,9),gSeFeFdcSd(6,3,3,6),gSeFeFecSe(6,3,3,6),      & 
& gSeFeFucSu(6,3,3,6),gSeSvImFeFv(6,9,3,9),gSeSvReFeFv(6,9,3,9),gSeHpmFecCha(6,2,3,2),   & 
& gSeFeSdcFd(6,3,6,3),gSeSeFecFe(6,6,3,3),gSeFeSucFu(6,3,6,3),gSeFvFdcSu(6,9,3,6),       & 
& gSeSeFvFv(6,6,9,9),gSeFvSdcFu(6,9,6,3),gSeSeFdcFd(6,6,3,3),gSeSeFucFu(6,6,3,3),        & 
& gSeSvImFdcFu(6,9,3,3),gSeSvReFdcFu(6,9,3,3),gSvImAhChacFe(9,3,2,3),gSvImAhChiFv(9,3,5,9),& 
& gSvImcSeChaChi(9,6,2,5),gSvImcHpmChaFv(9,2,2,9),gSvImhhChacFe(9,3,2,3),gSvImSvImChacCha(9,9,2,2),& 
& gSvImSvReChacCha(9,9,2,2),gSvImSvImChiChi(9,9,5,5),gSvImSvReChiChi(9,9,5,5),           & 
& gSvImcHpmChiFe(9,2,5,3),gSvImhhChiFv(9,3,5,9),gSvImFeFucSd(9,3,3,6),gSvImcSeFeFv(9,6,3,9),& 
& gSvImFeSucFd(9,3,6,3),gSvImSvImFecFe(9,9,3,3),gSvImSvReFecFe(9,9,3,3),gSvImFvFdcSd(9,9,3,6),& 
& gSvImFvFucSu(9,9,3,6),gSvImSvImFvFv(9,9,9,9),gSvImSvReFvFv(9,9,9,9),gSvImSeFucFd(9,6,3,3),& 
& gSvImSvImFdcFd(9,9,3,3),gSvImSvImFucFu(9,9,3,3),gSvImSvReFdcFd(9,9,3,3),               & 
& gSvImSvReFucFu(9,9,3,3),gSvReAhChacFe(9,3,2,3),gSvReAhChiFv(9,3,5,9),gSvRecSeChaChi(9,6,2,5),& 
& gSvRecHpmChaFv(9,2,2,9),gSvRehhChacFe(9,3,2,3),gSvReSvImChacCha(9,9,2,2),              & 
& gSvReSvReChacCha(9,9,2,2),gSvReSvImChiChi(9,9,5,5),gSvReSvReChiChi(9,9,5,5),           & 
& gSvRecHpmChiFe(9,2,5,3),gSvRehhChiFv(9,3,5,9),gSvReFeFucSd(9,3,3,6),gSvRecSeFeFv(9,6,3,9),& 
& gSvReFeSucFd(9,3,6,3),gSvReSvImFecFe(9,9,3,3),gSvReSvReFecFe(9,9,3,3),gSvReFvFdcSd(9,9,3,6),& 
& gSvReFvFucSu(9,9,3,6),gSvReSvImFvFv(9,9,9,9),gSvReSvReFvFv(9,9,9,9),gSvReSeFucFd(9,6,3,3),& 
& gSvReSvImFdcFd(9,9,3,3),gSvReSvImFucFu(9,9,3,3),gSvReSvReFdcFd(9,9,3,3),               & 
& gSvReSvReFucFu(9,9,3,3),gChiChicChaCha(5,5,2,2),gChiChiChiChi(5,5,5,5),gChiChicFdFd(5,5,3,3),& 
& gChiChicFeFe(5,5,3,3),gChiChicFuFu(5,5,3,3),gChiChiFvFv(5,5,9,9),gChiChacFdFu(5,2,3,3),& 
& gChiChacFeFv(5,2,3,9),gChiFdcFdGlu(5,3,3,1),gChiFucFuGlu(5,3,3,1),gChaChacChaCha(2,2,2,2),& 
& gChaChaChiChi(2,2,5,5),gChaChacFdFd(2,2,3,3),gChaChacFeFe(2,2,3,3),gChaChacFuFu(2,2,3,3),& 
& gChaChaFvFv(2,2,9,9),gChaChicFuFd(2,5,3,3),gChaChiFvFe(2,5,9,3),gChaFdcFuGlu(2,3,3,1), & 
& gChaFecChaFe(2,3,2,3),gGluFdcFdChi(1,3,3,5),gGluFdcFucCha(1,3,3,2),gGluFucFuChi(1,3,3,5),& 
& gFvFvcChaCha(9,9,2,2),gFvFvChiChi(9,9,5,5),gFvFvcFdFd(9,9,3,3),gFvFvcFeFe(9,9,3,3),    & 
& gFvFvcFuFu(9,9,3,3),gFvFvFvFv(9,9,9,9),gFvcFeChiCha(9,3,5,2),gFvFecFdFu(9,3,3,3)

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
Call CalculateOneLoopDecays(gP1Lhh,gP1LAh,gP1LHpm,gP1LSd,gP1LSu,gP1LSe,               & 
& gP1LSvIm,gP1LSvRe,gP1LChi,gP1LCha,gP1LGlu,gP1LFv,MSd,MSd2,MSvIm,MSvIm2,MSvRe,          & 
& MSvRe2,MSu,MSu2,MSe,MSe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,             & 
& MCha,MCha2,MFe,MFe2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2,ZD,               & 
& ZVI,ZVR,ZU,ZE,ZH,ZA,ZP,ZN,UV,UM,UP,ZEL,ZER,ZDL,ZDR,ZUL,ZUR,vd,vu,vS,g1,g2,             & 
& g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,             & 
& mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,epsI,deltaM,kont)

End if 


gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPhh(:,1:407),gThh,BRhh(:,1:407))

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
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPAh(:,1:405),gTAh,BRAh(:,1:405))

Do i1=1,3
gTAh(i1) =Sum(gPAh(i1,:)) 
If (gTAh(i1).Gt.0._dp) BRAh(i1,: ) =gPAh(i1,:)/gTAh(i1) 
If (OneLoopDecays) Then 
gT1LAh(i1) =Sum(gP1LAh(i1,:)) 
If (gT1LAh(i1).Gt.0._dp) BR1LAh(i1,: ) =gP1LAh(i1,:)/gT1LAh(i1) 
End if
End Do 
 

gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
Call HpmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPHpm(:,1:204),gTHpm,BRHpm(:,1:204))

Do i1=1,2
gTHpm(i1) =Sum(gPHpm(i1,:)) 
If (gTHpm(i1).Gt.0._dp) BRHpm(i1,: ) =gPHpm(i1,:)/gTHpm(i1) 
If (OneLoopDecays) Then 
gT1LHpm(i1) =Sum(gP1LHpm(i1,:)) 
If (gT1LHpm(i1).Gt.0._dp) BR1LHpm(i1,: ) =gP1LHpm(i1,:)/gT1LHpm(i1) 
End if
End Do 
 

gPSd = 0._dp 
gTSd = 0._dp 
BRSd = 0._dp 
Call SdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPSd(:,1:84),gTSd,BRSd(:,1:84))

Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
If (OneLoopDecays) Then 
gT1LSd(i1) =Sum(gP1LSd(i1,:)) 
If (gT1LSd(i1).Gt.0._dp) BR1LSd(i1,: ) =gP1LSd(i1,:)/gT1LSd(i1) 
End if
End Do 
 

gPSu = 0._dp 
gTSu = 0._dp 
BRSu = 0._dp 
Call SuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPSu(:,1:84),gTSu,BRSu(:,1:84))

Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
If (OneLoopDecays) Then 
gT1LSu(i1) =Sum(gP1LSu(i1,:)) 
If (gT1LSu(i1).Gt.0._dp) BR1LSu(i1,: ) =gP1LSu(i1,:)/gT1LSu(i1) 
End if
End Do 
 

gPSe = 0._dp 
gTSe = 0._dp 
BRSe = 0._dp 
Call SeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPSe(:,1:111),gTSe,BRSe(:,1:111))

Do i1=1,6
gTSe(i1) =Sum(gPSe(i1,:)) 
If (gTSe(i1).Gt.0._dp) BRSe(i1,: ) =gPSe(i1,:)/gTSe(i1) 
If (OneLoopDecays) Then 
gT1LSe(i1) =Sum(gP1LSe(i1,:)) 
If (gT1LSe(i1).Gt.0._dp) BR1LSe(i1,: ) =gP1LSe(i1,:)/gT1LSe(i1) 
End if
End Do 
 

gPSvIm = 0._dp 
gTSvIm = 0._dp 
BRSvIm = 0._dp 
Call SvImTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPSvIm(:,1:189),gTSvIm,BRSvIm(:,1:189))

Do i1=1,9
gTSvIm(i1) =Sum(gPSvIm(i1,:)) 
If (gTSvIm(i1).Gt.0._dp) BRSvIm(i1,: ) =gPSvIm(i1,:)/gTSvIm(i1) 
If (OneLoopDecays) Then 
gT1LSvIm(i1) =Sum(gP1LSvIm(i1,:)) 
If (gT1LSvIm(i1).Gt.0._dp) BR1LSvIm(i1,: ) =gP1LSvIm(i1,:)/gT1LSvIm(i1) 
End if
End Do 
 

gPSvRe = 0._dp 
gTSvRe = 0._dp 
BRSvRe = 0._dp 
Call SvReTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPSvRe(:,1:189),gTSvRe,BRSvRe(:,1:189))

Do i1=1,9
gTSvRe(i1) =Sum(gPSvRe(i1,:)) 
If (gTSvRe(i1).Gt.0._dp) BRSvRe(i1,: ) =gPSvRe(i1,:)/gTSvRe(i1) 
If (OneLoopDecays) Then 
gT1LSvRe(i1) =Sum(gP1LSvRe(i1,:)) 
If (gT1LSvRe(i1).Gt.0._dp) BR1LSvRe(i1,: ) =gP1LSvRe(i1,:)/gT1LSvRe(i1) 
End if
End Do 
 

gPChi = 0._dp 
gTChi = 0._dp 
BRChi = 0._dp 
Call ChiTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPChi(:,1:256),gTChi,BRChi(:,1:256))

Do i1=1,5
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
If (OneLoopDecays) Then 
gT1LChi(i1) =Sum(gP1LChi(i1,:)) 
If (gT1LChi(i1).Gt.0._dp) BR1LChi(i1,: ) =gP1LChi(i1,:)/gT1LChi(i1) 
End if
End Do 
 

gPCha = 0._dp 
gTCha = 0._dp 
BRCha = 0._dp 
Call ChaTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPCha(:,1:168),gTCha,BRCha(:,1:168))

Do i1=1,2
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
If (OneLoopDecays) Then 
gT1LCha(i1) =Sum(gP1LCha(i1,:)) 
If (gT1LCha(i1).Gt.0._dp) BR1LCha(i1,: ) =gP1LCha(i1,:)/gT1LCha(i1) 
End if
End Do 
 

gPGlu = 0._dp 
gTGlu = 0._dp 
BRGlu = 0._dp 
Call GluTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPGlu(:,1:49),gTGlu,BRGlu(:,1:49))

Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
If (OneLoopDecays) Then 
gT1LGlu =Sum(gP1LGlu(i1,:)) 
If (gT1LGlu.Gt.0._dp) BR1LGlu(i1,: ) =gP1LGlu(i1,:)/gT1LGlu 
End if
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gPFv(:,1:171),gTFv,BRFv(:,1:171))

Do i1=1,9
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
If (OneLoopDecays) Then 
gT1LFv(i1) =Sum(gP1LFv(i1,:)) 
If (gT1LFv(i1).Gt.0._dp) BR1LFv(i1,: ) =gP1LFv(i1,:)/gT1LFv(i1) 
End if
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_hh)) Then 
If (MaxVal(gThh).Lt.MaxVal(fac3*Abs(Mhh))) Then 
Call hhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,ghhAhChacCha,ghhAhChiChi,ghhAhFdcFd,ghhAhFecFe,      & 
& ghhAhFucFu,ghhAhFvFv,ghhcHpmChaChi,ghhcSdChaFu,ghhcSeChaFv,ghhhhChacCha,               & 
& ghhSuChacFd,ghhSvImChacFe,ghhSvReChacFe,ghhhhChiChi,ghhcSdChiFd,ghhcSeChiFe,           & 
& ghhcSuChiFu,ghhSvImChiFv,ghhSvReChiFv,ghhcSdFdGlu,ghhhhFdcFd,ghhcHpmFdcFu,             & 
& ghhcHpmFeFv,ghhhhFecFe,ghhcSuFuGlu,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,.False.,           & 
& gThh,gPhh(:,408:2725),BRhh(:,408:2725))

Else 
Call hhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,ghhAhChacCha,ghhAhChiChi,ghhAhFdcFd,ghhAhFecFe,      & 
& ghhAhFucFu,ghhAhFvFv,ghhcHpmChaChi,ghhcSdChaFu,ghhcSeChaFv,ghhhhChacCha,               & 
& ghhSuChacFd,ghhSvImChacFe,ghhSvReChacFe,ghhhhChiChi,ghhcSdChiFd,ghhcSeChiFe,           & 
& ghhcSuChiFu,ghhSvImChiFv,ghhSvReChiFv,ghhcSdFdGlu,ghhhhFdcFd,ghhcHpmFdcFu,             & 
& ghhcHpmFeFv,ghhhhFecFe,ghhcSuFuGlu,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,.True.,            & 
& gThh,gPhh(:,408:2725),BRhh(:,408:2725))

End If 
 
End If 
Else 
Call hhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,ghhAhChacCha,ghhAhChiChi,ghhAhFdcFd,ghhAhFecFe,      & 
& ghhAhFucFu,ghhAhFvFv,ghhcHpmChaChi,ghhcSdChaFu,ghhcSeChaFv,ghhhhChacCha,               & 
& ghhSuChacFd,ghhSvImChacFe,ghhSvReChacFe,ghhhhChiChi,ghhcSdChiFd,ghhcSeChiFe,           & 
& ghhcSuChiFu,ghhSvImChiFv,ghhSvReChiFv,ghhcSdFdGlu,ghhhhFdcFd,ghhcHpmFdcFu,             & 
& ghhcHpmFeFv,ghhhhFecFe,ghhcSuFuGlu,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,.False.,           & 
& gThh,gPhh(:,408:2725),BRhh(:,408:2725))

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
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gAhAhChacCha,gAhAhChiChi,gAhAhFdcFd,gAhAhFecFe,      & 
& gAhAhFucFu,gAhAhFvFv,gAhcHpmChaChi,gAhcSdChaFu,gAhcSeChaFv,gAhhhChacCha,               & 
& gAhSuChacFd,gAhSvImChacFe,gAhSvReChacFe,gAhhhChiChi,gAhcSdChiFd,gAhcSeChiFe,           & 
& gAhcSuChiFu,gAhSvImChiFv,gAhSvReChiFv,gAhcSdFdGlu,gAhhhFdcFd,gAhcHpmFdcFu,             & 
& gAhcHpmFeFv,gAhhhFecFe,gAhcSuFuGlu,gAhhhFucFu,gAhhhFvFv,epsI,deltaM,.False.,           & 
& gTAh,gPAh(:,406:2723),BRAh(:,406:2723))

Else 
Call AhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gAhAhChacCha,gAhAhChiChi,gAhAhFdcFd,gAhAhFecFe,      & 
& gAhAhFucFu,gAhAhFvFv,gAhcHpmChaChi,gAhcSdChaFu,gAhcSeChaFv,gAhhhChacCha,               & 
& gAhSuChacFd,gAhSvImChacFe,gAhSvReChacFe,gAhhhChiChi,gAhcSdChiFd,gAhcSeChiFe,           & 
& gAhcSuChiFu,gAhSvImChiFv,gAhSvReChiFv,gAhcSdFdGlu,gAhhhFdcFd,gAhcHpmFdcFu,             & 
& gAhcHpmFeFv,gAhhhFecFe,gAhcSuFuGlu,gAhhhFucFu,gAhhhFvFv,epsI,deltaM,.True.,            & 
& gTAh,gPAh(:,406:2723),BRAh(:,406:2723))

End If 
 
End If 
Else 
Call AhThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gAhAhChacCha,gAhAhChiChi,gAhAhFdcFd,gAhAhFecFe,      & 
& gAhAhFucFu,gAhAhFvFv,gAhcHpmChaChi,gAhcSdChaFu,gAhcSeChaFv,gAhhhChacCha,               & 
& gAhSuChacFd,gAhSvImChacFe,gAhSvReChacFe,gAhhhChiChi,gAhcSdChiFd,gAhcSeChiFe,           & 
& gAhcSuChiFu,gAhSvImChiFv,gAhSvReChiFv,gAhcSdFdGlu,gAhhhFdcFd,gAhcHpmFdcFu,             & 
& gAhcHpmFeFv,gAhhhFecFe,gAhcSuFuGlu,gAhhhFucFu,gAhhhFvFv,epsI,deltaM,.False.,           & 
& gTAh,gPAh(:,406:2723),BRAh(:,406:2723))

End If 
Do i1=1,3
gTAh(i1) =Sum(gPAh(i1,:)) 
If (gTAh(i1).Gt.0._dp) BRAh(i1,: ) =gPAh(i1,:)/gTAh(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Hpm)) Then 
If (MaxVal(gTHpm).Lt.MaxVal(fac3*Abs(MHpm))) Then 
Call HpmThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gHpmAhChaChi,gHpmAhFdcFu,gHpmAhFeFv,gHpmChaChacHpm,  & 
& gHpmhhChaChi,gHpmFdChacSd,gHpmChaFecSe,gHpmcSuChaFu,gHpmSvImChaFv,gHpmSvReChaFv,       & 
& gHpmHpmChacCha,gHpmSdChacFd,gHpmSeChacFe,gHpmcFuChaSu,gHpmHpmChiChi,gHpmcSuChiFd,      & 
& gHpmSvImChiFe,gHpmSvReChiFe,gHpmSeChiFv,gHpmSdChicFu,gHpmcSuFdGlu,gHpmhhFdcFu,         & 
& gHpmHpmFdcFd,gHpmFeFecHpm,gHpmhhFeFv,gHpmHpmFecFe,gHpmSeFecCha,gHpmHpmFvFv,            & 
& gHpmHpmFucFu,gHpmSdGlucFu,epsI,deltaM,.False.,gTHpm,gPHpm(:,205:2112),BRHpm(:,205:2112))

Else 
Call HpmThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gHpmAhChaChi,gHpmAhFdcFu,gHpmAhFeFv,gHpmChaChacHpm,  & 
& gHpmhhChaChi,gHpmFdChacSd,gHpmChaFecSe,gHpmcSuChaFu,gHpmSvImChaFv,gHpmSvReChaFv,       & 
& gHpmHpmChacCha,gHpmSdChacFd,gHpmSeChacFe,gHpmcFuChaSu,gHpmHpmChiChi,gHpmcSuChiFd,      & 
& gHpmSvImChiFe,gHpmSvReChiFe,gHpmSeChiFv,gHpmSdChicFu,gHpmcSuFdGlu,gHpmhhFdcFu,         & 
& gHpmHpmFdcFd,gHpmFeFecHpm,gHpmhhFeFv,gHpmHpmFecFe,gHpmSeFecCha,gHpmHpmFvFv,            & 
& gHpmHpmFucFu,gHpmSdGlucFu,epsI,deltaM,.True.,gTHpm,gPHpm(:,205:2112),BRHpm(:,205:2112))

End If 
 
End If 
Else 
Call HpmThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gHpmAhChaChi,gHpmAhFdcFu,gHpmAhFeFv,gHpmChaChacHpm,  & 
& gHpmhhChaChi,gHpmFdChacSd,gHpmChaFecSe,gHpmcSuChaFu,gHpmSvImChaFv,gHpmSvReChaFv,       & 
& gHpmHpmChacCha,gHpmSdChacFd,gHpmSeChacFe,gHpmcFuChaSu,gHpmHpmChiChi,gHpmcSuChiFd,      & 
& gHpmSvImChiFe,gHpmSvReChiFe,gHpmSeChiFv,gHpmSdChicFu,gHpmcSuFdGlu,gHpmhhFdcFu,         & 
& gHpmHpmFdcFd,gHpmFeFecHpm,gHpmhhFeFv,gHpmHpmFecFe,gHpmSeFecCha,gHpmHpmFvFv,            & 
& gHpmHpmFucFu,gHpmSdGlucFu,epsI,deltaM,.False.,gTHpm,gPHpm(:,205:2112),BRHpm(:,205:2112))

End If 
Do i1=1,2
gTHpm(i1) =Sum(gPHpm(i1,:)) 
If (gTHpm(i1).Gt.0._dp) BRHpm(i1,: ) =gPHpm(i1,:)/gTHpm(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Sd)) Then 
If (MaxVal(gTSd).Lt.MaxVal(fac3*Abs(MSd))) Then 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,        & 
& gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,               & 
& gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,gSdFdFvSvIm,gSdFdFvSvRe,      & 
& gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,gSdFuFeSvIm,gSdFuFeSvRe,gSdFuFvSe,       & 
& gSdSdFucFu,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,gSdSdFvFv,gSdSuFeFv,          & 
& epsI,deltaM,.False.,gTSd,gPSd(:,85:2460),BRSd(:,85:2460))

Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,        & 
& gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,               & 
& gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,gSdFdFvSvIm,gSdFdFvSvRe,      & 
& gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,gSdFuFeSvIm,gSdFuFeSvRe,gSdFuFvSe,       & 
& gSdSdFucFu,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,gSdSdFvFv,gSdSuFeFv,          & 
& epsI,deltaM,.True.,gTSd,gPSd(:,85:2460),BRSd(:,85:2460))

End If 
 
End If 
Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,        & 
& gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,               & 
& gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,gSdFdFvSvIm,gSdFdFvSvRe,      & 
& gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,gSdFuFeSvIm,gSdFuFeSvRe,gSdFuFvSe,       & 
& gSdSdFucFu,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,gSdSdFvFv,gSdSuFeFv,          & 
& epsI,deltaM,.False.,gTSd,gPSd(:,85:2460),BRSd(:,85:2460))

End If 
Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Su)) Then 
If (MaxVal(gTSu).Lt.MaxVal(fac3*Abs(MSu))) Then 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,       & 
& gSucHpmChiFd,gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,gSuFdFvcSe,gSuhhFdcCha,    & 
& gSuSuFdcFd,gSuFdSvImcFe,gSuFdSvRecFe,gSucHpmChaFu,gSuFuFecSe,gSuFuFucSu,               & 
& gSuFuFvSvIm,gSuFuFvSvRe,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,gSuSuFucFu,gSucHpmFdGlu,    & 
& gSuhhFuGlu,gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,gSuSuFecFe,gSuSuFvFv,      & 
& epsI,deltaM,.False.,gTSu,gPSu(:,85:2460),BRSu(:,85:2460))

Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,       & 
& gSucHpmChiFd,gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,gSuFdFvcSe,gSuhhFdcCha,    & 
& gSuSuFdcFd,gSuFdSvImcFe,gSuFdSvRecFe,gSucHpmChaFu,gSuFuFecSe,gSuFuFucSu,               & 
& gSuFuFvSvIm,gSuFuFvSvRe,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,gSuSuFucFu,gSucHpmFdGlu,    & 
& gSuhhFuGlu,gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,gSuSuFecFe,gSuSuFvFv,      & 
& epsI,deltaM,.True.,gTSu,gPSu(:,85:2460),BRSu(:,85:2460))

End If 
 
End If 
Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,       & 
& gSucHpmChiFd,gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,gSuFdFvcSe,gSuhhFdcCha,    & 
& gSuSuFdcFd,gSuFdSvImcFe,gSuFdSvRecFe,gSucHpmChaFu,gSuFuFecSe,gSuFuFucSu,               & 
& gSuFuFvSvIm,gSuFuFvSvRe,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,gSuSuFucFu,gSucHpmFdGlu,    & 
& gSuhhFuGlu,gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,gSuSuFecFe,gSuSuFvFv,      & 
& epsI,deltaM,.False.,gTSu,gPSu(:,85:2460),BRSu(:,85:2460))

End If 
Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Se)) Then 
If (MaxVal(gTSe).Lt.MaxVal(fac3*Abs(MSe))) Then 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSeAhChaFv,gSeAhChiFe,gSeChaChacSe,gSeSvImChaChi,    & 
& gSeSvReChaChi,gSeChaFecHpm,gSehhChaFv,gSeHpmChacFe,gSeSeChacCha,gSeSeChiChi,           & 
& gSehhChiFe,gSeHpmChiFv,gSeFeFdcSd,gSeFeFecSe,gSeFeFucSu,gSeSvImFeFv,gSeSvReFeFv,       & 
& gSeHpmFecCha,gSeFeSdcFd,gSeSeFecFe,gSeFeSucFu,gSeFvFdcSu,gSeSeFvFv,gSeFvSdcFu,         & 
& gSeSeFdcFd,gSeSeFucFu,gSeSvImFdcFu,gSeSvReFdcFu,epsI,deltaM,.False.,gTSe,              & 
& gPSe(:,112:2703),BRSe(:,112:2703))

Else 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSeAhChaFv,gSeAhChiFe,gSeChaChacSe,gSeSvImChaChi,    & 
& gSeSvReChaChi,gSeChaFecHpm,gSehhChaFv,gSeHpmChacFe,gSeSeChacCha,gSeSeChiChi,           & 
& gSehhChiFe,gSeHpmChiFv,gSeFeFdcSd,gSeFeFecSe,gSeFeFucSu,gSeSvImFeFv,gSeSvReFeFv,       & 
& gSeHpmFecCha,gSeFeSdcFd,gSeSeFecFe,gSeFeSucFu,gSeFvFdcSu,gSeSeFvFv,gSeFvSdcFu,         & 
& gSeSeFdcFd,gSeSeFucFu,gSeSvImFdcFu,gSeSvReFdcFu,epsI,deltaM,.True.,gTSe,               & 
& gPSe(:,112:2703),BRSe(:,112:2703))

End If 
 
End If 
Else 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSeAhChaFv,gSeAhChiFe,gSeChaChacSe,gSeSvImChaChi,    & 
& gSeSvReChaChi,gSeChaFecHpm,gSehhChaFv,gSeHpmChacFe,gSeSeChacCha,gSeSeChiChi,           & 
& gSehhChiFe,gSeHpmChiFv,gSeFeFdcSd,gSeFeFecSe,gSeFeFucSu,gSeSvImFeFv,gSeSvReFeFv,       & 
& gSeHpmFecCha,gSeFeSdcFd,gSeSeFecFe,gSeFeSucFu,gSeFvFdcSu,gSeSeFvFv,gSeFvSdcFu,         & 
& gSeSeFdcFd,gSeSeFucFu,gSeSvImFdcFu,gSeSvReFdcFu,epsI,deltaM,.False.,gTSe,              & 
& gPSe(:,112:2703),BRSe(:,112:2703))

End If 
Do i1=1,6
gTSe(i1) =Sum(gPSe(i1,:)) 
If (gTSe(i1).Gt.0._dp) BRSe(i1,: ) =gPSe(i1,:)/gTSe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_SvIm)) Then 
If (MaxVal(gTSvIm).Lt.MaxVal(fac3*Abs(MSvIm))) Then 
Call SvImThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSvImAhChacFe,gSvImAhChiFv,gSvImcSeChaChi,   & 
& gSvImcHpmChaFv,gSvImhhChacFe,gSvImSvImChacCha,gSvImSvReChacCha,gSvImSvImChiChi,        & 
& gSvImSvReChiChi,gSvImcHpmChiFe,gSvImhhChiFv,gSvImFeFucSd,gSvImcSeFeFv,gSvImFeSucFd,    & 
& gSvImSvImFecFe,gSvImSvReFecFe,gSvImFvFdcSd,gSvImFvFucSu,gSvImSvImFvFv,gSvImSvReFvFv,   & 
& gSvImSeFucFd,gSvImSvImFdcFd,gSvImSvImFucFu,gSvImSvReFdcFd,gSvImSvReFucFu,              & 
& epsI,deltaM,.False.,gTSvIm,gPSvIm(:,190:3735),BRSvIm(:,190:3735))

Else 
Call SvImThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSvImAhChacFe,gSvImAhChiFv,gSvImcSeChaChi,   & 
& gSvImcHpmChaFv,gSvImhhChacFe,gSvImSvImChacCha,gSvImSvReChacCha,gSvImSvImChiChi,        & 
& gSvImSvReChiChi,gSvImcHpmChiFe,gSvImhhChiFv,gSvImFeFucSd,gSvImcSeFeFv,gSvImFeSucFd,    & 
& gSvImSvImFecFe,gSvImSvReFecFe,gSvImFvFdcSd,gSvImFvFucSu,gSvImSvImFvFv,gSvImSvReFvFv,   & 
& gSvImSeFucFd,gSvImSvImFdcFd,gSvImSvImFucFu,gSvImSvReFdcFd,gSvImSvReFucFu,              & 
& epsI,deltaM,.True.,gTSvIm,gPSvIm(:,190:3735),BRSvIm(:,190:3735))

End If 
 
End If 
Else 
Call SvImThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSvImAhChacFe,gSvImAhChiFv,gSvImcSeChaChi,   & 
& gSvImcHpmChaFv,gSvImhhChacFe,gSvImSvImChacCha,gSvImSvReChacCha,gSvImSvImChiChi,        & 
& gSvImSvReChiChi,gSvImcHpmChiFe,gSvImhhChiFv,gSvImFeFucSd,gSvImcSeFeFv,gSvImFeSucFd,    & 
& gSvImSvImFecFe,gSvImSvReFecFe,gSvImFvFdcSd,gSvImFvFucSu,gSvImSvImFvFv,gSvImSvReFvFv,   & 
& gSvImSeFucFd,gSvImSvImFdcFd,gSvImSvImFucFu,gSvImSvReFdcFd,gSvImSvReFucFu,              & 
& epsI,deltaM,.False.,gTSvIm,gPSvIm(:,190:3735),BRSvIm(:,190:3735))

End If 
Do i1=1,9
gTSvIm(i1) =Sum(gPSvIm(i1,:)) 
If (gTSvIm(i1).Gt.0._dp) BRSvIm(i1,: ) =gPSvIm(i1,:)/gTSvIm(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_SvRe)) Then 
If (MaxVal(gTSvRe).Lt.MaxVal(fac3*Abs(MSvRe))) Then 
Call SvReThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSvReAhChacFe,gSvReAhChiFv,gSvRecSeChaChi,   & 
& gSvRecHpmChaFv,gSvRehhChacFe,gSvReSvImChacCha,gSvReSvReChacCha,gSvReSvImChiChi,        & 
& gSvReSvReChiChi,gSvRecHpmChiFe,gSvRehhChiFv,gSvReFeFucSd,gSvRecSeFeFv,gSvReFeSucFd,    & 
& gSvReSvImFecFe,gSvReSvReFecFe,gSvReFvFdcSd,gSvReFvFucSu,gSvReSvImFvFv,gSvReSvReFvFv,   & 
& gSvReSeFucFd,gSvReSvImFdcFd,gSvReSvImFucFu,gSvReSvReFdcFd,gSvReSvReFucFu,              & 
& epsI,deltaM,.False.,gTSvRe,gPSvRe(:,190:3735),BRSvRe(:,190:3735))

Else 
Call SvReThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSvReAhChacFe,gSvReAhChiFv,gSvRecSeChaChi,   & 
& gSvRecHpmChaFv,gSvRehhChacFe,gSvReSvImChacCha,gSvReSvReChacCha,gSvReSvImChiChi,        & 
& gSvReSvReChiChi,gSvRecHpmChiFe,gSvRehhChiFv,gSvReFeFucSd,gSvRecSeFeFv,gSvReFeSucFd,    & 
& gSvReSvImFecFe,gSvReSvReFecFe,gSvReFvFdcSd,gSvReFvFucSu,gSvReSvImFvFv,gSvReSvReFvFv,   & 
& gSvReSeFucFd,gSvReSvImFdcFd,gSvReSvImFucFu,gSvReSvReFdcFd,gSvReSvReFucFu,              & 
& epsI,deltaM,.True.,gTSvRe,gPSvRe(:,190:3735),BRSvRe(:,190:3735))

End If 
 
End If 
Else 
Call SvReThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,             & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gSvReAhChacFe,gSvReAhChiFv,gSvRecSeChaChi,   & 
& gSvRecHpmChaFv,gSvRehhChacFe,gSvReSvImChacCha,gSvReSvReChacCha,gSvReSvImChiChi,        & 
& gSvReSvReChiChi,gSvRecHpmChiFe,gSvRehhChiFv,gSvReFeFucSd,gSvRecSeFeFv,gSvReFeSucFd,    & 
& gSvReSvImFecFe,gSvReSvReFecFe,gSvReFvFdcSd,gSvReFvFucSu,gSvReSvImFvFv,gSvReSvReFvFv,   & 
& gSvReSeFucFd,gSvReSvImFdcFd,gSvReSvImFucFu,gSvReSvReFdcFd,gSvReSvReFucFu,              & 
& epsI,deltaM,.False.,gTSvRe,gPSvRe(:,190:3735),BRSvRe(:,190:3735))

End If 
Do i1=1,9
gTSvRe(i1) =Sum(gPSvRe(i1,:)) 
If (gTSvRe(i1).Gt.0._dp) BRSvRe(i1,: ) =gPSvRe(i1,:)/gTSvRe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Chi)) Then 
If (MaxVal(gTChi).Lt.MaxVal(fac3*Abs(MChi))) Then 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,               & 
& gTSvRe,gTVWm,gTVZ,gChiChicChaCha,gChiChiChiChi,gChiChicFdFd,gChiChicFeFe,              & 
& gChiChicFuFu,gChiChiFvFv,gChiChacFdFu,gChiChacFeFv,gChiFdcFdGlu,gChiFucFuGlu,          & 
& epsI,deltaM,.False.,gTChi,gPChi(:,257:1031),BRChi(:,257:1031))

Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,               & 
& gTSvRe,gTVWm,gTVZ,gChiChicChaCha,gChiChiChiChi,gChiChicFdFd,gChiChicFeFe,              & 
& gChiChicFuFu,gChiChiFvFv,gChiChacFdFu,gChiChacFeFv,gChiFdcFdGlu,gChiFucFuGlu,          & 
& epsI,deltaM,.True.,gTChi,gPChi(:,257:1031),BRChi(:,257:1031))

End If 
 
End If 
Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,               & 
& gTSvRe,gTVWm,gTVZ,gChiChicChaCha,gChiChiChiChi,gChiChicFdFd,gChiChicFeFe,              & 
& gChiChicFuFu,gChiChiFvFv,gChiChacFdFu,gChiChacFeFv,gChiFdcFdGlu,gChiFucFuGlu,          & 
& epsI,deltaM,.False.,gTChi,gPChi(:,257:1031),BRChi(:,257:1031))

End If 
Do i1=1,5
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Cha)) Then 
If (MaxVal(gTCha).Lt.MaxVal(fac3*Abs(MCha))) Then 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,               & 
& gTSvRe,gTVWm,gTVZ,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,              & 
& gChaChacFuFu,gChaChaFvFv,gChaChicFuFd,gChaChiFvFe,gChaFdcFuGlu,gChaFecChaFe,           & 
& epsI,deltaM,.False.,gTCha,gPCha(:,169:649),BRCha(:,169:649))

Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,               & 
& gTSvRe,gTVWm,gTVZ,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,              & 
& gChaChacFuFu,gChaChaFvFv,gChaChicFuFd,gChaChiFvFe,gChaFdcFuGlu,gChaFecChaFe,           & 
& epsI,deltaM,.True.,gTCha,gPCha(:,169:649),BRCha(:,169:649))

End If 
 
End If 
Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,               & 
& gTSvRe,gTVWm,gTVZ,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,              & 
& gChaChacFuFu,gChaChaFvFv,gChaChicFuFd,gChaChiFvFe,gChaFdcFuGlu,gChaFecChaFe,           & 
& epsI,deltaM,.False.,gTCha,gPCha(:,169:649),BRCha(:,169:649))

End If 
Do i1=1,2
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Glu)) Then 
If (gTGlu.Lt.fac3*Abs(MGlu)) Then 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,   & 
& epsI,deltaM,.False.,gTGlu,gPGlu(:,50:157),BRGlu(:,50:157))

Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,   & 
& epsI,deltaM,.True.,gTGlu,gPGlu(:,50:157),BRGlu(:,50:157))

End If 
 
End If 
Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,   & 
& epsI,deltaM,.False.,gTGlu,gPGlu(:,50:157),BRGlu(:,50:157))

End If 
Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fv)) Then 
If (MaxVal(gTFv).Lt.MaxVal(fac3*Abs(MFv))) Then 
Call FvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,            & 
& gTVZ,gFvFvcChaCha,gFvFvChiChi,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,              & 
& gFvcFeChiCha,gFvFecFdFu,epsI,deltaM,.False.,gTFv,gPFv(:,172:1461),BRFv(:,172:1461))

Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,            & 
& gTVZ,gFvFvcChaCha,gFvFvChiChi,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,              & 
& gFvcFeChiCha,gFvFecFdFu,epsI,deltaM,.True.,gTFv,gPFv(:,172:1461),BRFv(:,172:1461))

End If 
 
End If 
Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,             & 
& kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,             & 
& me2,mv2,ms2,mx2,M1,M2,M3,vd,vu,vS,gTAh,gThh,gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,            & 
& gTVZ,gFvFvcChaCha,gFvFvChiChi,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,              & 
& gFvcFeChiCha,gFvFecFdFu,epsI,deltaM,.False.,gTFv,gPFv(:,172:1461),BRFv(:,172:1461))

End If 
Do i1=1,9
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_NInvSeesaw 
 