! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:20 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_NInvSeesaw 
 
Use Control 
Use Settings 
Use Couplings_NInvSeesaw 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_NInvSeesaw 
Use StandardModel 
Use Tadpoles_NInvSeesaw 
 Use EffectivePotential_NInvSeesaw 
 Use Pole2L_NInvSeesaw 
 Use TreeLevelMasses_NInvSeesaw 
 
Real(dp), Private :: MSd_1L(6), MSd2_1L(6)  
Complex(dp), Private :: ZD_1L(6,6)  
Real(dp), Private :: MSvIm_1L(9), MSvIm2_1L(9)  
Complex(dp), Private :: ZVI_1L(9,9)  
Real(dp), Private :: MSvRe_1L(9), MSvRe2_1L(9)  
Complex(dp), Private :: ZVR_1L(9,9)  
Real(dp), Private :: MSu_1L(6), MSu2_1L(6)  
Complex(dp), Private :: ZU_1L(6,6)  
Real(dp), Private :: MSe_1L(6), MSe2_1L(6)  
Complex(dp), Private :: ZE_1L(6,6)  
Real(dp), Private :: Mhh_1L(3), Mhh2_1L(3)  
Complex(dp), Private :: ZH_1L(3,3)  
Real(dp), Private :: MAh_1L(3), MAh2_1L(3)  
Complex(dp), Private :: ZA_1L(3,3)  
Real(dp), Private :: MHpm_1L(2), MHpm2_1L(2)  
Complex(dp), Private :: ZP_1L(2,2)  
Real(dp), Private :: MChi_1L(5), MChi2_1L(5)  
Complex(dp), Private :: ZN_1L(5,5)  
Real(dp), Private :: MFv_1L(9), MFv2_1L(9)  
Complex(dp), Private :: UV_1L(9,9)  
Real(dp), Private :: MCha_1L(2), MCha2_1L(2)  
Complex(dp), Private :: UM_1L(2,2),UP_1L(2,2)
Real(dp), Private :: MFe_1L(3), MFe2_1L(3)  
Complex(dp), Private :: ZEL_1L(3,3),ZER_1L(3,3)
Real(dp), Private :: MFd_1L(3), MFd2_1L(3)  
Complex(dp), Private :: ZDL_1L(3,3),ZDR_1L(3,3)
Real(dp), Private :: MFu_1L(3), MFu2_1L(3)  
Complex(dp), Private :: ZUL_1L(3,3),ZUR_1L(3,3)
Real(dp), Private :: MGlu_1L, MGlu2_1L  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVWm_1L, MVWm2_1L  
Real(dp) :: pi2A0  
Real(dp) :: ti_ep2L(3)  
Real(dp) :: pi_ep2L(3,3)
Real(dp) :: Pi2S_EffPot(3,3)
Real(dp) :: PiP2S_EffPot(3,3)
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,              & 
& Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(inout) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),              & 
& MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(inout) :: pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),ZVR(9,9),ZW(2,2)

Real(dp),Intent(inout) :: vd,vu,vS

Complex(dp) :: cplAhAhcVWmVWm(3,3),cplAhAhUhh(3,3,3),cplAhAhUhhUhh(3,3,3,3),cplAhAhUHpmcUHpm(3,3,2,2),& 
& cplAhAhUSdcUSd(3,3,6,6),cplAhAhUSecUSe(3,3,6,6),cplAhAhUSucUSu(3,3,6,6),               & 
& cplAhAhUSvImUSvIm(3,3,9,9),cplAhAhUSvReUSvRe(3,3,9,9),cplAhAhVZVZ(3,3),cplAhcUHpmVWm(3,2),& 
& cplAhhhVZ(3,3),cplAhHpmcUHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcUSd(3,6,6),              & 
& cplAhSecUSe(3,6,6),cplAhSucUSu(3,6,6),cplAhSvImUSvRe(3,9,9),cplAhUhhhh(3,3,3),         & 
& cplAhUhhVZ(3,3),cplAhUSvImSvIm(3,9,9),cplAhUSvImSvRe(3,9,9),cplAhUSvReSvRe(3,9,9),     & 
& cplcChaChaUAhL(2,2,3),cplcChaChaUAhR(2,2,3),cplcChaChaUhhL(2,2,3),cplcChaChaUhhR(2,2,3),& 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6),cplcChaFdcUSuL(2,3,6),cplcChaFdcUSuR(2,3,6),& 
& cplcChaUChiHpmL(2,5,2),cplcChaUChiHpmR(2,5,2),cplcChaUChiVWmL(2,5),cplcChaUChiVWmR(2,5),& 
& cplcChaUFvSeL(2,9,6),cplcChaUFvSeR(2,9,6),cplcFdFdUAhL(3,3,3),cplcFdFdUAhR(3,3,3),     & 
& cplcFdFdUhhL(3,3,3),cplcFdFdUhhR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),             & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdGluSdL(3,6), & 
& cplcFdGluSdR(3,6),cplcFdUChiSdL(3,5,6),cplcFdUChiSdR(3,5,6),cplcFeChaUSvImL(3,2,9),    & 
& cplcFeChaUSvImR(3,2,9),cplcFeChaUSvReL(3,2,9),cplcFeChaUSvReR(3,2,9),cplcFeFeUAhL(3,3,3),& 
& cplcFeFeUAhR(3,3,3),cplcFeFeUhhL(3,3,3),cplcFeFeUhhR(3,3,3),cplcFeFeVPL(3,3),          & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeUChiSeL(3,5,6),               & 
& cplcFeUChiSeR(3,5,6),cplcFeUFvHpmL(3,9,2),cplcFeUFvHpmR(3,9,2),cplcFeUFvVWmL(3,9),     & 
& cplcFeUFvVWmR(3,9),cplcFuFdcUHpmL(3,3,2),cplcFuFdcUHpmR(3,3,2),cplcFuFdcVWmL(3,3),     & 
& cplcFuFdcVWmR(3,3),cplcFuFuUAhL(3,3,3),cplcFuFuUAhR(3,3,3),cplcFuFuUhhL(3,3,3),        & 
& cplcFuFuUhhR(3,3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplcFuUChiSuL(3,5,6),& 
& cplcFuUChiSuR(3,5,6),cplcgAgWmcVWm,cplcgGgGVG,cplcgWmgWmUAh(3),cplcgWmgWmUhh(3),       & 
& cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgZUHpm(2),cplcgWpCgAcVWm,cplcgWpCgWpCUAh(3),          & 
& cplcgWpCgWpCUhh(3),cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgZcUHpm(2),cplcgWpCgZcVWm,    & 
& cplcgZgWmcUHpm(2),cplcgZgWmcVWm,cplcgZgWpCUHpm(2),cplcgZgZUhh(3),cplChaFucUSdL(2,3,6), & 
& cplChaFucUSdR(2,3,6),cplChiChacUHpmL(5,2,2),cplChiChacUHpmR(5,2,2),cplChiChacVWmL(5,2),& 
& cplChiChacVWmR(5,2),cplChiChiUAhL(5,5,3),cplChiChiUAhR(5,5,3),cplChiChiUhhL(5,5,3),    & 
& cplChiChiUhhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcUSdL(5,3,6),         & 
& cplChiFdcUSdR(5,3,6),cplChiFecUSeL(5,3,6),cplChiFecUSeR(5,3,6),cplChiFucUSuL(5,3,6),   & 
& cplChiFucUSuR(5,3,6),cplChiFvUSvImL(5,9,9),cplChiFvUSvImR(5,9,9),cplChiFvUSvReL(5,9,9),& 
& cplChiFvUSvReR(5,9,9),cplChiUFvSvImL(5,9,9),cplChiUFvSvImR(5,9,9),cplChiUFvSvReL(5,9,9),& 
& cplChiUFvSvReR(5,9,9),cplcUChacFuSdL(2,3,6),cplcUChacFuSdR(2,3,6),cplcUChaChaAhL(2,2,3),& 
& cplcUChaChaAhR(2,2,3),cplcUChaChahhL(2,2,3),cplcUChaChahhR(2,2,3),cplcUChaChaVPL(2,2), & 
& cplcUChaChaVPR(2,2),cplcUChaChaVZL(2,2),cplcUChaChaVZR(2,2),cplcUChaChiHpmL(2,5,2),    & 
& cplcUChaChiHpmR(2,5,2),cplcUChaChiVWmL(2,5),cplcUChaChiVWmR(2,5),cplcUChaFdcSuL(2,3,6),& 
& cplcUChaFdcSuR(2,3,6),cplcUChaFeSvImL(2,3,9),cplcUChaFeSvImR(2,3,9),cplcUChaFeSvReL(2,3,9)

Complex(dp) :: cplcUChaFeSvReR(2,3,9),cplcUChaFvSeL(2,9,6),cplcUChaFvSeR(2,9,6),cplcUFdChaSuL(3,2,6), & 
& cplcUFdChaSuR(3,2,6),cplcUFdChiSdL(3,5,6),cplcUFdChiSdR(3,5,6),cplcUFdFdAhL(3,3,3),    & 
& cplcUFdFdAhR(3,3,3),cplcUFdFdhhL(3,3,3),cplcUFdFdhhR(3,3,3),cplcUFdFdVGL(3,3),         & 
& cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),               & 
& cplcUFdFdVZR(3,3),cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),cplcUFdFuVWmL(3,3),        & 
& cplcUFdFuVWmR(3,3),cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6),cplcUFeChaSvImL(3,2,9),       & 
& cplcUFeChaSvImR(3,2,9),cplcUFeChaSvReL(3,2,9),cplcUFeChaSvReR(3,2,9),cplcUFeChiSeL(3,5,6),& 
& cplcUFeChiSeR(3,5,6),cplcUFeFeAhL(3,3,3),cplcUFeFeAhR(3,3,3),cplcUFeFehhL(3,3,3),      & 
& cplcUFeFehhR(3,3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),             & 
& cplcUFeFeVZR(3,3),cplcUFeFvHpmL(3,9,2),cplcUFeFvHpmR(3,9,2),cplcUFeFvVWmL(3,9),        & 
& cplcUFeFvVWmR(3,9),cplcUFuChiSuL(3,5,6),cplcUFuChiSuR(3,5,6),cplcUFuFdcHpmL(3,3,2),    & 
& cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFuAhL(3,3,3),     & 
& cplcUFuFuAhR(3,3,3),cplcUFuFuhhL(3,3,3),cplcUFuFuhhR(3,3,3),cplcUFuFuVGL(3,3),         & 
& cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),               & 
& cplcUFuFuVZR(3,3),cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),cplcUHpmVPVWm(2),              & 
& cplcUHpmVWmVZ(2),cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,             & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWm,cplcVWmVPVWmVZ1,          & 
& cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVWmVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,cplFvChacUSeL(9,2,6),cplFvChacUSeR(9,2,6),cplFvFecUHpmL(9,3,2),        & 
& cplFvFecUHpmR(9,3,2),cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplFvFvUAhL(9,9,3),           & 
& cplFvFvUAhR(9,9,3),cplFvFvUhhL(9,9,3),cplFvFvUhhR(9,9,3),cplFvFvVZL(9,9),              & 
& cplFvFvVZR(9,9),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFdcUSdL(3,6),cplGluFdcUSdR(3,6),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplGluFucUSuL(3,6),cplGluFucUSuR(3,6),             & 
& cplGluGluVGL,cplGluGluVGR,cplhhcUHpmVWm(3,2),cplhhcVWmVWm(3),cplhhhhcVWmVWm(3,3),      & 
& cplhhhhUHpmcUHpm(3,3,2,2),cplhhhhUSdcUSd(3,3,6,6),cplhhhhUSecUSe(3,3,6,6),             & 
& cplhhhhUSucUSu(3,3,6,6),cplhhhhUSvImUSvIm(3,3,9,9),cplhhhhUSvReUSvRe(3,3,9,9),         & 
& cplhhhhVZVZ(3,3),cplhhHpmcUHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcUSd(3,6,6),            & 
& cplhhSecUSe(3,6,6),cplhhSucUSu(3,6,6),cplhhSvImUSvRe(3,9,9),cplhhUSvImSvIm(3,9,9),     & 
& cplhhUSvImSvRe(3,9,9),cplhhUSvReSvRe(3,9,9),cplhhVZVZ(3),cplHpmcHpmcVWmVWm(2,2),       & 
& cplHpmcHpmVP(2,2),cplHpmcHpmVPVP(2,2),cplHpmcHpmVPVZ(2,2),cplHpmcHpmVZ(2,2),           & 
& cplHpmcHpmVZVZ(2,2),cplHpmcUHpmVP(2,2),cplHpmcUHpmVZ(2,2),cplHpmcVWmVP(2),             & 
& cplHpmcVWmVZ(2),cplHpmSucUSd(2,6,6),cplHpmSvImcUSe(2,9,6),cplHpmSvRecUSe(2,9,6),       & 
& cplHpmUSdcHpmcUSd(2,6,2,6),cplHpmUSecHpmcUSe(2,6,2,6),cplHpmUSucHpmcUSu(2,6,2,6),      & 
& cplHpmUSvImcSe(2,9,6),cplHpmUSvImUSvImcHpm(2,9,9,2),cplHpmUSvRecSe(2,9,6),             & 
& cplHpmUSvReUSvRecHpm(2,9,9,2),cplSdcHpmcUSu(6,2,6),cplSdcSdcVWmVWm(6,6),               & 
& cplSdcSdVG(6,6),cplSdcSdVGVG(6,6),cplSdcSdVP(6,6),cplSdcSdVPVP(6,6),cplSdcSdVPVZ(6,6), & 
& cplSdcSdVZ(6,6),cplSdcSdVZVZ(6,6),cplSdcSucVWm(6,6),cplSdcUHpmcSu(6,2,6)

Complex(dp) :: cplSdcUSdVG(6,6),cplSdcUSdVP(6,6),cplSdcUSdVZ(6,6),cplSdcUSucVWm(6,6),cplSdUSecSdcUSe(6,6,6,6),& 
& cplSdUSucSdcUSu(6,6,6,6),cplSdUSvImUSvImcSd(6,9,9,6),cplSdUSvReUSvRecSd(6,9,9,6),      & 
& cplSecSecVWmVWm(6,6),cplSecSeVP(6,6),cplSecSeVPVP(6,6),cplSecSeVPVZ(6,6),              & 
& cplSecSeVZ(6,6),cplSecSeVZVZ(6,6),cplSecUSeVP(6,6),cplSecUSeVZ(6,6),cplSeSvImcUHpm(6,9,2),& 
& cplSeSvImcVWm(6,9),cplSeSvRecUHpm(6,9,2),cplSeSvRecVWm(6,9),cplSeUSucSecUSu(6,6,6,6),  & 
& cplSeUSvImcVWm(6,9),cplSeUSvImUSvImcSe(6,9,9,6),cplSeUSvRecVWm(6,9),cplSeUSvReUSvRecSe(6,9,9,6),& 
& cplSucSucVWmVWm(6,6),cplSucSuVG(6,6),cplSucSuVGVG(6,6),cplSucSuVP(6,6),cplSucSuVPVP(6,6),& 
& cplSucSuVPVZ(6,6),cplSucSuVZ(6,6),cplSucSuVZVZ(6,6),cplSucUSdVWm(6,6),cplSucUSuVG(6,6),& 
& cplSucUSuVP(6,6),cplSucUSuVZ(6,6),cplSuUSvImUSvImcSu(6,9,9,6),cplSuUSvReUSvRecSu(6,9,9,6),& 
& cplSvImcUSeVWm(9,6),cplSvImSvImcVWmVWm(9,9),cplSvImSvImUSvReUSvRe(9,9,9,9),            & 
& cplSvImSvImVZVZ(9,9),cplSvImSvReVZ(9,9),cplSvImUSvReVZ(9,9),cplSvRecUSeVWm(9,6),       & 
& cplSvReSvRecVWmVWm(9,9),cplSvReSvReVZVZ(9,9),cplUAhAhAh(3,3,3),cplUAhAhhh(3,3,3),      & 
& cplUAhhhhh(3,3,3),cplUAhhhVZ(3,3),cplUAhHpmcHpm(3,2,2),cplUAhHpmcVWm(3,2),             & 
& cplUAhSdcSd(3,6,6),cplUAhSecSe(3,6,6),cplUAhSucSu(3,6,6),cplUAhSvImSvIm(3,9,9),        & 
& cplUAhSvImSvRe(3,9,9),cplUAhSvReSvRe(3,9,9),cplUAhUAhAhAh(3,3,3,3),cplUAhUAhcVWmVWm(3,3),& 
& cplUAhUAhhhhh(3,3,3,3),cplUAhUAhHpmcHpm(3,3,2,2),cplUAhUAhSdcSd(3,3,6,6),              & 
& cplUAhUAhSecSe(3,3,6,6),cplUAhUAhSucSu(3,3,6,6),cplUAhUAhSvImSvIm(3,3,9,9),            & 
& cplUAhUAhSvReSvRe(3,3,9,9),cplUAhUAhVZVZ(3,3),cplUChiChacHpmL(5,2,2),cplUChiChacHpmR(5,2,2),& 
& cplUChiChacVWmL(5,2),cplUChiChacVWmR(5,2),cplUChiChiAhL(5,5,3),cplUChiChiAhR(5,5,3),   & 
& cplUChiChihhL(5,5,3),cplUChiChihhR(5,5,3),cplUChiChiVZL(5,5),cplUChiChiVZR(5,5),       & 
& cplUChiFdcSdL(5,3,6),cplUChiFdcSdR(5,3,6),cplUChiFecSeL(5,3,6),cplUChiFecSeR(5,3,6),   & 
& cplUChiFucSuL(5,3,6),cplUChiFucSuR(5,3,6),cplUChiFvSvImL(5,9,9),cplUChiFvSvImR(5,9,9), & 
& cplUChiFvSvReL(5,9,9),cplUChiFvSvReR(5,9,9),cplUFvChacSeL(9,2,6),cplUFvChacSeR(9,2,6), & 
& cplUFvFecHpmL(9,3,2),cplUFvFecHpmR(9,3,2),cplUFvFecVWmL(9,3),cplUFvFecVWmR(9,3),       & 
& cplUFvFvAhL(9,9,3),cplUFvFvAhR(9,9,3),cplUFvFvhhL(9,9,3),cplUFvFvhhR(9,9,3),           & 
& cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),cplUhhcVWmVWm(3),cplUhhhhhh(3,3,3),cplUhhHpmcHpm(3,2,2),& 
& cplUhhHpmcVWm(3,2),cplUhhSdcSd(3,6,6),cplUhhSecSe(3,6,6),cplUhhSucSu(3,6,6),           & 
& cplUhhSvImSvIm(3,9,9),cplUhhSvImSvRe(3,9,9),cplUhhSvReSvRe(3,9,9),cplUhhUhhcVWmVWm(3,3),& 
& cplUhhUhhhhhh(3,3,3,3),cplUhhUhhHpmcHpm(3,3,2,2),cplUhhUhhSdcSd(3,3,6,6),              & 
& cplUhhUhhSecSe(3,3,6,6),cplUhhUhhSucSu(3,3,6,6),cplUhhUhhSvImSvIm(3,3,9,9),            & 
& cplUhhUhhSvReSvRe(3,3,9,9),cplUhhUhhVZVZ(3,3),cplUhhVZVZ(3),cplUHpmcUHpmcVWmVWm(2,2),  & 
& cplUHpmcUHpmVPVP(2,2),cplUHpmcUHpmVZVZ(2,2),cplUHpmHpmcUHpmcHpm(2,2,2,2),              & 
& cplUHpmSdcUHpmcSd(2,6,2,6),cplUHpmSecUHpmcSe(2,6,2,6),cplUHpmSucUHpmcSu(2,6,2,6),      & 
& cplUHpmSvImSvImcUHpm(2,9,9,2),cplUHpmSvReSvRecUHpm(2,9,9,2),cplUSdcUSdcVWmVWm(6,6),    & 
& cplUSdcUSdVGVG(6,6),cplUSdcUSdVPVP(6,6),cplUSdcUSdVZVZ(6,6),cplUSdSdcUSdcSd(6,6,6,6),  & 
& cplUSdSecUSdcSe(6,6,6,6),cplUSdSucUSdcSu(6,6,6,6),cplUSdSvImSvImcUSd(6,9,9,6),         & 
& cplUSdSvReSvRecUSd(6,9,9,6),cplUSecUSecVWmVWm(6,6),cplUSecUSeVPVP(6,6),cplUSecUSeVZVZ(6,6)

Complex(dp) :: cplUSeSecUSecSe(6,6,6,6),cplUSeSucUSecSu(6,6,6,6),cplUSeSvImSvImcUSe(6,9,9,6),         & 
& cplUSeSvReSvRecUSe(6,9,9,6),cplUSucUSucVWmVWm(6,6),cplUSucUSuVGVG(6,6),cplUSucUSuVPVP(6,6),& 
& cplUSucUSuVZVZ(6,6),cplUSuSucUSucSu(6,6,6,6),cplUSuSvImSvImcUSu(6,9,9,6),              & 
& cplUSuSvReSvRecUSu(6,9,9,6),cplUSvImSvReVZ(9,9),cplUSvImUSvImcVWmVWm(9,9),             & 
& cplUSvImUSvImSvImSvIm(9,9,9,9),cplUSvImUSvImSvReSvRe(9,9,9,9),cplUSvImUSvImVZVZ(9,9),  & 
& cplUSvReUSvRecVWmVWm(9,9),cplUSvReUSvReSvReSvRe(9,9,9,9),cplUSvReUSvReVZVZ(9,9),       & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Integer :: i2L, iFin 
Logical :: Convergence2L 
Real(dp) :: Pi2S_EffPot_save(3,3), diff(3,3)
Complex(dp) :: Tad1Loop(12), dmz2  
Real(dp) :: comp(3), tanbQ, vev2, vSM
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
! Set Gauge fixing parameters 
RXi= RXiNew 
RXiG = RXi 
RXiP = RXi 
RXiWm = RXi 
RXiZ = RXi 

 ! Running angles 
TanBetaQ = vu/vd

 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,mv2,ms2,mx2,M1,M2,M3,GenerationMixing,kont)

mHd2Tree  = mHd2
mHu2Tree  = mHu2
ms2Tree  = ms2

 
 If (CalculateOneLoopMasses) Then 
 
If ((DecoupleAtRenScale).and.(Abs(1._dp-RXiNew).lt.0.01_dp)) Then 
vSM=vSM_Q 
vd=vSM/Sqrt(1 + TanBetaQ**2) 
vu=TanBetaQ*vd 
Else 
Call CouplingsForVectorBosons(g1,g2,vd,vu,ZP,TW,ZH,ZA,UM,UP,ZN,UV,ZD,ZE,              & 
& ZU,ZVI,ZVR,ZDL,ZUL,ZEL,cplHpmcVWmVP,cplcVWmVPVWm,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,      & 
& cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,              & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,         & 
& cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,       & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,   & 
& cplhhcVWmVWm,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,   & 
& cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvImSvImcVWmVWm,  & 
& cplSvReSvRecVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,           & 
& cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2, & 
& cplcVWmVPVWmVZ3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,kont,dmZ2)

vev2=4._dp*Real(mZ2+dmz2,dp)/(g1**2+g2**2) -0 
vSM=sqrt(vev2) 
vd=vSM/Sqrt(1 + TanBetaQ**2) 
vu=TanBetaQ*vd 
End if 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,               & 
& Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,             & 
& vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,mv2,ms2,mx2,M1,M2,M3,GenerationMixing,kont)

Call CouplingsForLoopMasses(Yd,Td,lam,vu,vS,ZD,ZA,g2,Yu,UM,UP,ZUL,ZUR,g1,             & 
& ZN,ZDL,ZDR,g3,pG,vd,ZH,Tu,ZU,ZP,TW,Ye,ZE,ZVI,ZVR,MUX,kap,lamN,TLN,Yv,Tv,               & 
& ZEL,ZER,UV,Te,Tlam,Tk,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,           & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,  & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd, & 
& cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,cplAhUSvImSvIm,         & 
& cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,cplChiFvUSvImL,cplChiFvUSvImR,          & 
& cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,cplSeUSvImcVWm,cplUSvImSvReVZ,            & 
& cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,cplSdUSvImUSvImcSd,           & 
& cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,cplUSvImUSvImSvReSvRe,     & 
& cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,  & 
& cplcFeChaUSvReR,cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,           & 
& cplHpmUSvRecSe,cplSeUSvRecVWm,cplSvImUSvReVZ,cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,      & 
& cplHpmUSvReUSvRecHpm,cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,         & 
& cplSvImSvImUSvReUSvRe,cplUSvReUSvReSvReSvRe,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,    & 
& cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,   & 
& cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,         & 
& cplSucUSuVZ,cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,           & 
& cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu,cplUSucUSuVGVG,  & 
& cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,cplAhSecUSe,cplFvChacUSeL,             & 
& cplFvChacUSeR,cplChiFecUSeL,cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,   & 
& cplSecUSeVP,cplSecUSeVZ,cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,   & 
& cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,  & 
& cplUSeSvReSvRecUSe,cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplAhAhUhh,         & 
& cplAhUhhhh,cplAhUhhVZ,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,       & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,          & 
& cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,        & 
& cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,    & 
& cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvImSvIm,       & 
& cplUhhUhhSvReSvRe,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplUAhAhAh,cplUAhAhhh,cplcChaChaUAhL, & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhhh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,         & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,cplAhHpmcUHpm,      & 
& cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,           & 
& cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgWpCgZcUHpm,              & 
& cplcgZgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplSdcUHpmcSu,  & 
& cplSeSvImcUHpm,cplSeSvRecUHpm,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,            & 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,          & 
& cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,      & 
& cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,           & 
& cplUChiChiVZL,cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,   & 
& cplUChiFucSuL,cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,              & 
& cplUChiFvSvReR,cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,            & 
& cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,               & 
& cplcChaUChiVWmR,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,    & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVZL,cplUFvFvVZR,           & 
& cplcFeUFvHpmL,cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,   & 
& cplcUChaChaAhL,cplcUChaChaAhR,cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,            & 
& cplcUChaChaVPR,cplcUChaChaVZL,cplcUChaChaVZR,cplcUChaChiHpmL,cplcUChaChiHpmR,          & 
& cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,         & 
& cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,               & 
& cplcUFeChaSvImR,cplcUFeChaSvReL,cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,           & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,     & 
& cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,     & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,   & 
& cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,   & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,       & 
& cplcChacUFuSdL,cplcChacUFuSdR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,     & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplSdcSdVG,cplSucSuVG,      & 
& cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,            & 
& cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,         & 
& cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,             & 
& cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,             & 
& cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,            & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,              & 
& cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ, & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplAhHpmcVWm,cplChiChacVWmL,           & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,     & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,           & 
& cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm, & 
& cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplHpmcHpmVPVZ,               & 
& cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)

Call OneLoopTadpoleshh(vd,vS,vu,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhUhh,cplcChaChaUhhL,               & 
& cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,     & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhSdcSd,cplUhhSecSe,          & 
& cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvReSvRe,cplUhhcVWmVWm,cplUhhVZVZ,Tad1Loop(1:3))

mHd2Tree  = mHd2
mHu2Tree  = mHu2
ms2Tree  = ms2
If (CalculateTwoLoopHiggsMasses) Then 
    If(GaugelessLimit) Then 
  vdFix = 0._dp 
  vuFix = 0._dp 
  vSFix = 0._dp 
   g1_saveEP =g1
   g1 = 0._dp 
   g2_saveEP =g2
   g2 = 0._dp 
     Else 
  vdFix = vd 
  vuFix = vu 
  vSFix = vS 
     End if 

SELECT CASE (TwoLoopMethod) 
CASE ( 1 , 2 ) 
  ! Make sure that there are no exactly degenerated masses! 
   Yd_saveEP =Yd
   where (aint(Abs(Yd)).eq.Yd) Yd=Yd*(1 + 1*1.0E-12_dp)
   Ye_saveEP =Ye
   where (aint(Abs(Ye)).eq.Ye) Ye=Ye*(1 + 2*1.0E-12_dp)
   lamN_saveEP =lamN
   where (aint(Abs(lamN)).eq.lamN) lamN=lamN*(1 + 3*1.0E-12_dp)
   Yu_saveEP =Yu
   where (aint(Abs(Yu)).eq.Yu) Yu=Yu*(1 + 4*1.0E-12_dp)
   Yv_saveEP =Yv
   where (aint(Abs(Yv)).eq.Yv) Yv=Yv*(1 + 5*1.0E-12_dp)
   MUX_saveEP =MUX
   where (aint(Abs(MUX)).eq.MUX) MUX=MUX*(1 + 6*1.0E-12_dp)
   Td_saveEP =Td
   where (aint(Abs(Td)).eq.Td) Td=Td*(1 + 7*1.0E-12_dp)
   Te_saveEP =Te
   where (aint(Abs(Te)).eq.Te) Te=Te*(1 + 8*1.0E-12_dp)
   TLN_saveEP =TLN
   where (aint(Abs(TLN)).eq.TLN) TLN=TLN*(1 + 9*1.0E-12_dp)
   Tu_saveEP =Tu
   where (aint(Abs(Tu)).eq.Tu) Tu=Tu*(1 + 10*1.0E-12_dp)
   Tv_saveEP =Tv
   where (aint(Abs(Tv)).eq.Tv) Tv=Tv*(1 + 11*1.0E-12_dp)
   BMUX_saveEP =BMUX
   where (aint(Abs(BMUX)).eq.BMUX) BMUX=BMUX*(1 + 12*1.0E-12_dp)
   mq2_saveEP =mq2
   where (aint(Abs(mq2)).eq.mq2) mq2=mq2*(1 + 13*1.0E-12_dp)
   ml2_saveEP =ml2
   where (aint(Abs(ml2)).eq.ml2) ml2=ml2*(1 + 14*1.0E-12_dp)
   md2_saveEP =md2
   where (aint(Abs(md2)).eq.md2) md2=md2*(1 + 15*1.0E-12_dp)
   mu2_saveEP =mu2
   where (aint(Abs(mu2)).eq.mu2) mu2=mu2*(1 + 16*1.0E-12_dp)
   me2_saveEP =me2
   where (aint(Abs(me2)).eq.me2) me2=me2*(1 + 17*1.0E-12_dp)
   mv2_saveEP =mv2
   where (aint(Abs(mv2)).eq.mv2) mv2=mv2*(1 + 18*1.0E-12_dp)
   mx2_saveEP =mx2
   where (aint(Abs(mx2)).eq.mx2) mx2=mx2*(1 + 19*1.0E-12_dp)

If (TwoLoopSafeMode) Then 
  iFin = 12 
  Convergence2L = .false. 
  hstep_pn = 2.0_dp 
  hstep_sa = 2.0_dp 
Else 
  iFin = 1 
  Convergence2L = .true. 
End if 

Pi2S_EffPot_save = 0._dp 
Pi2S_EffPot = 0._dp 

Do i2L = 1, iFin 
Call CalculateCorrectionsEffPot(ti_ep2L,pi_ep2L,vd,vu,vS,g1,g2,g3,Yd,Ye,              & 
& lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,mv2,ms2,mx2,M1,M2,M3,kont)

Pi2S_EffPot(1,1) = pi_ep2L(1,1)!-ti_ep2L(1)/vd
Pi2S_EffPot(1,2) = pi_ep2L(1,2)
Pi2S_EffPot(1,3) = pi_ep2L(1,3)
Pi2S_EffPot(2,1) = pi_ep2L(2,1)
Pi2S_EffPot(2,2) = pi_ep2L(2,2)!-ti_ep2L(2)/vu
Pi2S_EffPot(2,3) = pi_ep2L(2,3)
Pi2S_EffPot(3,1) = pi_ep2L(3,1)
Pi2S_EffPot(3,2) = pi_ep2L(3,2)
Pi2S_EffPot(3,3) = pi_ep2L(3,3)!-ti_ep2L(3)/vS
 diff=(Pi2S_EffPot-Pi2S_EffPot_save)/MaxVal(Abs(Pi2S_EffPot)) 
  If (MaxVal(Abs(diff)).lt.1.0E-4_dp) Then 
    Convergence2L = .True. 
    Exit 
  Else 
    Pi2S_EffPot_save = Pi2S_EffPot 
  hstep_pn = hstep_pn/2._dp 
  hstep_sa = hstep_sa/2._dp 
  End If 
End do 
If (.not.Convergence2L) Then 
 Write(*,*) "WARNING: Two-Loop corrections are numerically unstable! "  
 Call TerminateProgram 
End If  
 Pi2A0 = 0._dp 
   Yd =Yd_saveEP 
   Ye =Ye_saveEP 
   lamN =lamN_saveEP 
   Yu =Yu_saveEP 
   Yv =Yv_saveEP 
   MUX =MUX_saveEP 
   Td =Td_saveEP 
   Te =Te_saveEP 
   TLN =TLN_saveEP 
   Tu =Tu_saveEP 
   Tv =Tv_saveEP 
   BMUX =BMUX_saveEP 
   mq2 =mq2_saveEP 
   ml2 =ml2_saveEP 
   md2 =md2_saveEP 
   mu2 =mu2_saveEP 
   me2 =me2_saveEP 
   mv2 =mv2_saveEP 
   mx2 =mx2_saveEP 


 CASE ( 3 ) ! Diagrammatic method 
  ! Make sure that there are no exactly degenerated masses! 
   Yd_saveEP =Yd
   where (aint(Abs(Yd)).eq.Yd) Yd=Yd*(1 + 1*1.0E-12_dp)
   Ye_saveEP =Ye
   where (aint(Abs(Ye)).eq.Ye) Ye=Ye*(1 + 2*1.0E-12_dp)
   lamN_saveEP =lamN
   where (aint(Abs(lamN)).eq.lamN) lamN=lamN*(1 + 3*1.0E-12_dp)
   Yu_saveEP =Yu
   where (aint(Abs(Yu)).eq.Yu) Yu=Yu*(1 + 4*1.0E-12_dp)
   Yv_saveEP =Yv
   where (aint(Abs(Yv)).eq.Yv) Yv=Yv*(1 + 5*1.0E-12_dp)
   MUX_saveEP =MUX
   where (aint(Abs(MUX)).eq.MUX) MUX=MUX*(1 + 6*1.0E-12_dp)
   Td_saveEP =Td
   where (aint(Abs(Td)).eq.Td) Td=Td*(1 + 7*1.0E-12_dp)
   Te_saveEP =Te
   where (aint(Abs(Te)).eq.Te) Te=Te*(1 + 8*1.0E-12_dp)
   TLN_saveEP =TLN
   where (aint(Abs(TLN)).eq.TLN) TLN=TLN*(1 + 9*1.0E-12_dp)
   Tu_saveEP =Tu
   where (aint(Abs(Tu)).eq.Tu) Tu=Tu*(1 + 10*1.0E-12_dp)
   Tv_saveEP =Tv
   where (aint(Abs(Tv)).eq.Tv) Tv=Tv*(1 + 11*1.0E-12_dp)
   BMUX_saveEP =BMUX
   where (aint(Abs(BMUX)).eq.BMUX) BMUX=BMUX*(1 + 12*1.0E-12_dp)
   mq2_saveEP =mq2
   where (aint(Abs(mq2)).eq.mq2) mq2=mq2*(1 + 13*1.0E-12_dp)
   ml2_saveEP =ml2
   where (aint(Abs(ml2)).eq.ml2) ml2=ml2*(1 + 14*1.0E-12_dp)
   md2_saveEP =md2
   where (aint(Abs(md2)).eq.md2) md2=md2*(1 + 15*1.0E-12_dp)
   mu2_saveEP =mu2
   where (aint(Abs(mu2)).eq.mu2) mu2=mu2*(1 + 16*1.0E-12_dp)
   me2_saveEP =me2
   where (aint(Abs(me2)).eq.me2) me2=me2*(1 + 17*1.0E-12_dp)
   mv2_saveEP =mv2
   where (aint(Abs(mv2)).eq.mv2) mv2=mv2*(1 + 18*1.0E-12_dp)
   mx2_saveEP =mx2
   where (aint(Abs(mx2)).eq.mx2) mx2=mx2*(1 + 19*1.0E-12_dp)

If (NewGBC) Then 
Call CalculatePi2S(125._dp**2,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,             & 
& MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,            & 
& M1,M2,M3,kont,ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

Else 
Call CalculatePi2S(0._dp,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,              & 
& Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,             & 
& M2,M3,kont,ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

End if 
   Yd =Yd_saveEP 
   Ye =Ye_saveEP 
   lamN =lamN_saveEP 
   Yu =Yu_saveEP 
   Yv =Yv_saveEP 
   MUX =MUX_saveEP 
   Td =Td_saveEP 
   Te =Te_saveEP 
   TLN =TLN_saveEP 
   Tu =Tu_saveEP 
   Tv =Tv_saveEP 
   BMUX =BMUX_saveEP 
   mq2 =mq2_saveEP 
   ml2 =ml2_saveEP 
   md2 =md2_saveEP 
   mu2 =mu2_saveEP 
   me2 =me2_saveEP 
   mv2 =mv2_saveEP 
   mx2 =mx2_saveEP 


 CASE ( 8 , 9 ) ! Hard-coded routines 
  
 END SELECT
 
   If(GaugelessLimit) Then 
   g1 =g1_saveEP 
   g2 =g2_saveEP 
   End if 

Else ! Two loop turned off 
Pi2S_EffPot = 0._dp 

Pi2A0 = 0._dp 

ti_ep2L = 0._dp 

End if 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,               & 
& Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,             & 
& vd,vu,vS,Tad1Loop)

mHd21L = mHd2
mHu21L = mHu2
ms21L = ms2
Tad1Loop(1:3) = Tad1Loop(1:3) - ti_ep2L 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,               & 
& Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,             & 
& vd,vu,vS,Tad1Loop)

mHd22L = mHd2
mHu22L = mHu2
ms22L = ms2
Call OneLoopSd(g1,g2,Yd,Td,lam,mq2,md2,vd,vu,vS,MSd,MSd2,MAh,MAh2,MFu,MFu2,           & 
& MCha,MCha2,MFd,MFd2,MChi,MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,            & 
& MVZ2,MVWm,MVWm2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,          & 
& cplChaFucUSdR,cplChiFdcUSdL,cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,     & 
& cplHpmSucUSd,cplSdcUSdVG,cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplAhAhUSdcUSd,          & 
& cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,      & 
& cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd,cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm, & 
& cplUSdcUSdVZVZ,0.1_dp*delta_mass,MSd_1L,MSd2_1L,ZD_1L,kont)

Call OneLoopSvIm(g1,g2,MUX,BMUX,lam,kap,lamN,TLN,Yv,Tv,ml2,mv2,mx2,vd,vu,             & 
& vS,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,MFv,MFv2,MChi,               & 
& MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,MSd2,MSu,MSu2,              & 
& cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,cplChiFvUSvImL,          & 
& cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,cplSeUSvImcVWm,            & 
& cplUSvImSvReVZ,cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,               & 
& cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,        & 
& cplUSvImUSvImSvReSvRe,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,0.1_dp*delta_mass,        & 
& MSvIm_1L,MSvIm2_1L,ZVI_1L,kont)

Call OneLoopSvRe(g1,g2,MUX,BMUX,lam,kap,lamN,TLN,Yv,Tv,ml2,mv2,mx2,vd,vu,             & 
& vS,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,MFv,MFv2,MChi,               & 
& MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,MSd2,MSu,MSu2,              & 
& cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,cplChiFvUSvReL,          & 
& cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,cplSeUSvRecVWm,            & 
& cplSvImUSvReVZ,cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,               & 
& cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,        & 
& cplUSvReUSvReSvReSvRe,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,0.1_dp*delta_mass,        & 
& MSvRe_1L,MSvRe2_1L,ZVR_1L,kont)

Call OneLoopSu(g1,g2,lam,Yu,Tu,mq2,mu2,vd,vu,vS,MSu,MSu2,MAh,MAh2,MFu,MFu2,           & 
& MChi,MChi2,MCha,MCha2,MFd,MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,           & 
& MVWm2,MVZ,MVZ2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,           & 
& cplChiFucUSuR,cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,               & 
& cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,           & 
& cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,       & 
& cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu,cplUSucUSuVGVG,cplUSucUSuVPVP,   & 
& cplUSucUSucVWmVWm,cplUSucUSuVZVZ,0.1_dp*delta_mass,MSu_1L,MSu2_1L,ZU_1L,kont)

Call OneLoopSe(g1,g2,Ye,Te,lam,ml2,me2,vd,vu,vS,MSe,MSe2,MAh,MAh2,MFv,MFv2,           & 
& MCha,MCha2,MFe,MFe2,MChi,MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,          & 
& MVZ,MVZ2,MVWm,MVWm2,MSd,MSd2,MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,         & 
& cplChiFecUSeL,cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,     & 
& cplSecUSeVZ,cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,               & 
& cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,  & 
& cplUSeSvReSvRecUSe,cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,0.1_dp*delta_mass,  & 
& MSe_1L,MSe2_1L,ZE_1L,kont)

Call OneLoophh(g1,g2,lam,Tlam,kap,Tk,mHd22L,mHu22L,ms22L,vd,vu,vS,MAh,MAh2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,            & 
& cplAhAhUhh,cplAhUhhhh,cplAhUhhVZ,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,          & 
& cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,        & 
& cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,        & 
& cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,cplUhhSucSu,            & 
& cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,   & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,           & 
& cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,0.1_dp*delta_mass,  & 
& Mhh_1L,Mhh2_1L,ZH_1L,kont)

If (TwoLoopMethod.gt.2) Then 
Call OneLoopAh(g1,g2,lam,Tlam,kap,Tk,mHd22L,mHu22L,ms22L,vd,vu,vS,TW,MAh,             & 
& MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,          & 
& MSvRe2,cplUAhAhAh,cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,cplChiChiUAhL,              & 
& cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,        & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,cplUAhhhhh,         & 
& cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,cplUAhSecSe,cplUAhSucSu,            & 
& cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,cplUAhUAhhhhh,              & 
& cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,cplUAhUAhSvImSvIm,       & 
& cplUAhUAhSvReSvRe,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,0.1_dp*delta_mass,MAh_1L,             & 
& MAh2_1L,ZA_1L,kont)

Else 
Call OneLoopAh(g1,g2,lam,Tlam,kap,Tk,mHd21L,mHu21L,ms21L,vd,vu,vS,TW,MAh,             & 
& MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,          & 
& MSvRe2,cplUAhAhAh,cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,cplChiChiUAhL,              & 
& cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,        & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,cplUAhhhhh,         & 
& cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,cplUAhSecSe,cplUAhSucSu,            & 
& cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,cplUAhUAhhhhh,              & 
& cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,cplUAhUAhSvImSvIm,       & 
& cplUAhUAhSvReSvRe,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,0.1_dp*delta_mass,MAh_1L,             & 
& MAh2_1L,ZA_1L,kont)

End if 
Call OneLoopHpm(g1,g2,lam,Tlam,kap,mHd21L,mHu21L,vd,vu,vS,MHpm,MHpm2,MAh,             & 
& MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,             & 
& Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,  & 
& cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,           & 
& cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgWpCgZcUHpm,              & 
& cplcgZgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplSdcUHpmcSu,  & 
& cplSeSvImcUHpm,cplSeSvRecUHpm,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,            & 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,          & 
& cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,0.1_dp*delta_mass,MHpm_1L,MHpm2_1L,               & 
& ZP_1L,kont)

Call OneLoopChi(g1,g2,lam,kap,M1,M2,vd,vu,vS,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,          & 
& MCha,MCha2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,           & 
& MSu,MSu2,MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,      & 
& cplUChiChacHpmL,cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,         & 
& cplUChiChihhR,cplUChiChiVZL,cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,   & 
& cplUChiFecSeR,cplUChiFucSuL,cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,               & 
& cplUChiFvSvReL,cplUChiFvSvReR,cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,           & 
& cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL, & 
& cplcChaUChiVWmR,0.1_dp*delta_mass,MChi_1L,MChi2_1L,ZN_1L,kont)

Call OneLoopFv(MUX,lamN,Yv,vu,vS,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,               & 
& MSvIm,MSvIm2,MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,               & 
& Mhh2,MVZ,MVZ2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,      & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVZL,cplUFvFvVZR,           & 
& cplcFeUFvHpmL,cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,   & 
& 0.1_dp*delta_mass,MFv_1L,MFv2_1L,UV_1L,kont)

Call OneLoopCha(g2,lam,M2,vd,vu,vS,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,             & 
& MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,              & 
& MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,        & 
& cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,            & 
& cplcUChaChaVZR,cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,        & 
& cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,         & 
& cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,             & 
& 0.1_dp*delta_mass,MCha_1L,MCha2_1L,UM_1L,UP_1L,kont)

Call OneLoopFe(Ye,vd,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,     & 
& cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,cplcUFeChaSvReR,          & 
& cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,       & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,     & 
& 0.1_dp*delta_mass,MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,kont)

Call OneLoopFd(Yd,vd,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,cplcUFdFdAhL,        & 
& cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,     & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,    & 
& cplcUFdGluSdR,0.1_dp*delta_mass,MFd_1L,MFd2_1L,ZDL_1L,ZDR_1L,kont)

Call OneLoopFu(Yu,vu,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,cplcUFuFuAhL,         & 
& cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL, & 
& cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,       & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,     & 
& cplcChacUFuSdR,0.1_dp*delta_mass,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,kont)

Call OneLoopGlu(M3,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,cplGluFdcSdL,       & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,0.1_dp*delta_mass,MGlu_1L,MGlu2_1L,kont)

MSd = MSd_1L 
MSd2 = MSd2_1L 
ZD = ZD_1L 
MSvIm = MSvIm_1L 
MSvIm2 = MSvIm2_1L 
ZVI = ZVI_1L 
MSvRe = MSvRe_1L 
MSvRe2 = MSvRe2_1L 
ZVR = ZVR_1L 
MSu = MSu_1L 
MSu2 = MSu2_1L 
ZU = ZU_1L 
MSe = MSe_1L 
MSe2 = MSe2_1L 
ZE = ZE_1L 
Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
ZH = ZH_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
ZA = ZA_1L 
MHpm = MHpm_1L 
MHpm2 = MHpm2_1L 
ZP = ZP_1L 
MChi = MChi_1L 
MChi2 = MChi2_1L 
ZN = ZN_1L 
MFv = MFv_1L 
MFv2 = MFv2_1L 
UV = UV_1L 
MCha = MCha_1L 
MCha2 = MCha2_1L 
UM = UM_1L 
UP = UP_1L 
MGlu = MGlu_1L 
MGlu2 = MGlu2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,              & 
& ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,kont)

! Set pole masses 
MVWm = mW 
MVWm2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
! Shift Everything to t'Hooft Gauge
RXi=  1._dp 
RXiG = 1._dp 
RXiP = 1._dp 
RXiWm = 1._dp 
RXiZ = 1._dp 
MAh(1)=MVZ
MAh2(1)=MVZ2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
mHd2  = mHd2Tree 
mHu2  = mHu2Tree 
ms2  = ms2Tree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(vd,vS,vu,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,             & 
& MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhUhh,cplcChaChaUhhL,          & 
& cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,     & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhSdcSd,cplUhhSecSe,          & 
& cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvReSvRe,cplUhhcVWmVWm,cplUhhVZVZ,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),           & 
& MVWm,MVWm2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhAhUhh(3,3,3),cplcChaChaUhhL(2,2,3),cplcChaChaUhhR(2,2,3),cplChiChiUhhL(5,5,3),   & 
& cplChiChiUhhR(5,5,3),cplcFdFdUhhL(3,3,3),cplcFdFdUhhR(3,3,3),cplcFeFeUhhL(3,3,3),      & 
& cplcFeFeUhhR(3,3,3),cplcFuFuUhhL(3,3,3),cplcFuFuUhhR(3,3,3),cplFvFvUhhL(9,9,3),        & 
& cplFvFvUhhR(9,9,3),cplcgWmgWmUhh(3),cplcgWpCgWpCUhh(3),cplcgZgZUhh(3),cplUhhhhhh(3,3,3),& 
& cplUhhHpmcHpm(3,2,2),cplUhhSdcSd(3,6,6),cplUhhSecSe(3,6,6),cplUhhSucSu(3,6,6),         & 
& cplUhhSvImSvIm(3,9,9),cplUhhSvReSvRe(3,9,9),cplUhhcVWmVWm(3),cplUhhVZVZ(3)

Real(dp), Intent(in) :: vd,vS,vu

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(3)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(3) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
Do i1 = 1, 3
 A0m = SA_A0(MAh2(i1)) 
  Do gO1 = 1, 3
   coup = cplAhAhUhh(i1,i1,gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[Cha] 
!------------------------ 
Do i1 = 1, 2
 A0m = 2._dp*MCha(i1)*SA_A0(MCha2(i1)) 
  Do gO1 = 1, 3
   coupL = cplcChaChaUhhL(i1,i1,gO1)
   coupR = cplcChaChaUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! Chi 
!------------------------ 
Do i1 = 1, 5
 A0m = 2._dp*MChi(i1)*SA_A0(MChi2(i1)) 
  Do gO1 = 1, 3
   coupL = cplChiChiUhhL(i1,i1,gO1)
   coupR = cplChiChiUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*SA_A0(MFd2(i1)) 
  Do gO1 = 1, 3
   coupL = cplcFdFdUhhL(i1,i1,gO1)
   coupR = cplcFdFdUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*SA_A0(MFe2(i1)) 
  Do gO1 = 1, 3
   coupL = cplcFeFeUhhL(i1,i1,gO1)
   coupR = cplcFeFeUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*SA_A0(MFu2(i1)) 
  Do gO1 = 1, 3
   coupL = cplcFuFuUhhL(i1,i1,gO1)
   coupR = cplcFuFuUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! Fv 
!------------------------ 
Do i1 = 1, 9
 A0m = 2._dp*MFv(i1)*SA_A0(MFv2(i1)) 
  Do gO1 = 1, 3
   coupL = cplFvFvUhhL(i1,i1,gO1)
   coupR = cplFvFvUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[gWm] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWm2*RXi) 
  Do gO1 = 1, 3
    coup = cplcgWmgWmUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWmC] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWm2*RXi) 
  Do gO1 = 1, 3
    coup = cplcgWpCgWpCUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*SA_A0(MVZ2*RXi) 
  Do gO1 = 1, 3
    coup = cplcgZgZUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
Do i1 = 1, 3
 A0m = SA_A0(Mhh2(i1)) 
  Do gO1 = 1, 3
   coup = cplUhhhhhh(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
Do i1 = 1, 2
 A0m = SA_A0(MHpm2(i1)) 
  Do gO1 = 1, 3
   coup = cplUhhHpmcHpm(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
Do i1 = 1, 6
 A0m = SA_A0(MSd2(i1)) 
  Do gO1 = 1, 3
   coup = cplUhhSdcSd(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
Do i1 = 1, 6
 A0m = SA_A0(MSe2(i1)) 
  Do gO1 = 1, 3
   coup = cplUhhSecSe(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
Do i1 = 1, 6
 A0m = SA_A0(MSu2(i1)) 
  Do gO1 = 1, 3
   coup = cplUhhSucSu(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! SvIm 
!------------------------ 
Do i1 = 1, 9
 A0m = SA_A0(MSvIm2(i1)) 
  Do gO1 = 1, 3
   coup = cplUhhSvImSvIm(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! SvRe 
!------------------------ 
Do i1 = 1, 9
 A0m = SA_A0(MSvRe2(i1)) 
  Do gO1 = 1, 3
   coup = cplUhhSvReSvRe(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
A0m = 3._dp*SA_A0(MVWm2)+RXi*SA_A0(MVWm2*RXi) - 2._dp*MVWm2*rMS 
  Do gO1 = 1, 3
    coup = cplUhhcVWmVWm(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 3._dp*SA_A0(MVZ2)+RXi*SA_A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 3
    coup = cplUhhVZVZ(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoopSd(g1,g2,Yd,Td,lam,mq2,md2,vd,vu,vS,MSd,MSd2,MAh,MAh2,              & 
& MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,             & 
& MHpm2,MVZ,MVZ2,MVWm,MVWm2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,              & 
& cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,   & 
& cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,             & 
& cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,cplUSdSdcUSdcSd,cplUSdSecUSdcSe,       & 
& cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd,cplUSdcUSdVGVG,cplUSdcUSdVPVP,   & 
& cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MAh(3),MAh2(3),MFu(3),MFu2(3),MCha(2),MCha2(2),MFd(3),MFd2(3),         & 
& MChi(5),MChi2(5),MGlu,MGlu2,Mhh(3),Mhh2(3),MSu(6),MSu2(6),MHpm(2),MHpm2(2),            & 
& MVZ,MVZ2,MVWm,MVWm2,MSe(6),MSe2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9)

Real(dp), Intent(in) :: g1,g2,vd,vu,vS

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,mq2(3,3),md2(3,3)

Complex(dp), Intent(in) :: cplAhSdcUSd(3,6,6),cplChaFucUSdL(2,3,6),cplChaFucUSdR(2,3,6),cplChiFdcUSdL(5,3,6),    & 
& cplChiFdcUSdR(5,3,6),cplGluFdcUSdL(3,6),cplGluFdcUSdR(3,6),cplhhSdcUSd(3,6,6),         & 
& cplHpmSucUSd(2,6,6),cplSdcUSdVG(6,6),cplSdcUSdVP(6,6),cplSdcUSdVZ(6,6),cplSucUSdVWm(6,6),& 
& cplAhAhUSdcUSd(3,3,6,6),cplhhhhUSdcUSd(3,3,6,6),cplHpmUSdcHpmcUSd(2,6,2,6),            & 
& cplUSdSdcUSdcSd(6,6,6,6),cplUSdSecUSdcSe(6,6,6,6),cplUSdSucUSdcSu(6,6,6,6),            & 
& cplUSdSvImSvImcUSd(6,9,9,6),cplUSdSvReSvRecUSd(6,9,9,6),cplUSdcUSdVGVG(6,6),           & 
& cplUSdcUSdVPVP(6,6),cplUSdcUSdcVWmVWm(6,6),cplUSdcUSdVZVZ(6,6)

Complex(dp) :: mat2a(6,6), mat2(6,6),  PiSf(6,6,6)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2, test(6) 
Real(dp), Intent(out) :: mass(6), mass2(6) 
Complex(dp), Intent(out) ::  RS(6,6) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSd'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-(g1**2*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+mq2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+mq2(1,2)
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,2))/2._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+mq2(1,3)
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,3))/2._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-(vS*vu*lam*Conjg(Yd(1,1)))/2._dp
mat2a(1,4) = mat2a(1,4)+(vd*Conjg(Td(1,1)))/sqrt(2._dp)
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-(vS*vu*lam*Conjg(Yd(2,1)))/2._dp
mat2a(1,5) = mat2a(1,5)+(vd*Conjg(Td(2,1)))/sqrt(2._dp)
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-(vS*vu*lam*Conjg(Yd(3,1)))/2._dp
mat2a(1,6) = mat2a(1,6)+(vd*Conjg(Td(3,1)))/sqrt(2._dp)
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+mq2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+mq2(2,3)
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,3))/2._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-(vS*vu*lam*Conjg(Yd(1,2)))/2._dp
mat2a(2,4) = mat2a(2,4)+(vd*Conjg(Td(1,2)))/sqrt(2._dp)
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-(vS*vu*lam*Conjg(Yd(2,2)))/2._dp
mat2a(2,5) = mat2a(2,5)+(vd*Conjg(Td(2,2)))/sqrt(2._dp)
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-(vS*vu*lam*Conjg(Yd(3,2)))/2._dp
mat2a(2,6) = mat2a(2,6)+(vd*Conjg(Td(3,2)))/sqrt(2._dp)
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-(g1**2*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g1**2*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+mq2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vd**2*Conjg(Yd(j1,3))*Yd(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(vS*vu*lam*Conjg(Yd(1,3)))/2._dp
mat2a(3,4) = mat2a(3,4)+(vd*Conjg(Td(1,3)))/sqrt(2._dp)
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-(vS*vu*lam*Conjg(Yd(2,3)))/2._dp
mat2a(3,5) = mat2a(3,5)+(vd*Conjg(Td(2,3)))/sqrt(2._dp)
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-(vS*vu*lam*Conjg(Yd(3,3)))/2._dp
mat2a(3,6) = mat2a(3,6)+(vd*Conjg(Td(3,3)))/sqrt(2._dp)
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-(g1**2*vd**2)/12._dp
mat2a(4,4) = mat2a(4,4)+(g1**2*vu**2)/12._dp
mat2a(4,4) = mat2a(4,4)+md2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vd**2*Conjg(Yd(1,j1))*Yd(1,j1))/2._dp
End Do 
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)+md2(1,2)
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vd**2*Conjg(Yd(2,j1))*Yd(1,j1))/2._dp
End Do 
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)+md2(1,3)
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vd**2*Conjg(Yd(3,j1))*Yd(1,j1))/2._dp
End Do 
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)-(g1**2*vd**2)/12._dp
mat2a(5,5) = mat2a(5,5)+(g1**2*vu**2)/12._dp
mat2a(5,5) = mat2a(5,5)+md2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vd**2*Conjg(Yd(2,j1))*Yd(2,j1))/2._dp
End Do 
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)+md2(2,3)
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vd**2*Conjg(Yd(3,j1))*Yd(2,j1))/2._dp
End Do 
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)-(g1**2*vd**2)/12._dp
mat2a(6,6) = mat2a(6,6)+(g1**2*vu**2)/12._dp
mat2a(6,6) = mat2a(6,6)+md2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vd**2*Conjg(Yd(3,j1))*Yd(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,          & 
& MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVWm,MVWm2,MSe,MSe2,MSvIm,            & 
& MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,             & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,  & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd, & 
& cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZDOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 = MSd2(i1)
Call Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,          & 
& MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVWm,MVWm2,MSe,MSe2,MSvIm,            & 
& MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,             & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,  & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd, & 
& cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,6
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,          & 
& MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVWm,MVWm2,MSe,MSe2,MSvIm,            & 
& MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,             & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,  & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd, & 
& cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZDOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,6
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSd
 
 
Subroutine Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,               & 
& MChi,MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVWm,MVWm2,MSe,            & 
& MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,  & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,  & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd, & 
& cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MAh(3),MAh2(3),MFu(3),MFu2(3),MCha(2),MCha2(2),MFd(3),MFd2(3),         & 
& MChi(5),MChi2(5),MGlu,MGlu2,Mhh(3),Mhh2(3),MSu(6),MSu2(6),MHpm(2),MHpm2(2),            & 
& MVZ,MVZ2,MVWm,MVWm2,MSe(6),MSe2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhSdcUSd(3,6,6),cplChaFucUSdL(2,3,6),cplChaFucUSdR(2,3,6),cplChiFdcUSdL(5,3,6),    & 
& cplChiFdcUSdR(5,3,6),cplGluFdcUSdL(3,6),cplGluFdcUSdR(3,6),cplhhSdcUSd(3,6,6),         & 
& cplHpmSucUSd(2,6,6),cplSdcUSdVG(6,6),cplSdcUSdVP(6,6),cplSdcUSdVZ(6,6),cplSucUSdVWm(6,6),& 
& cplAhAhUSdcUSd(3,3,6,6),cplhhhhUSdcUSd(3,3,6,6),cplHpmUSdcHpmcUSd(2,6,2,6),            & 
& cplUSdSdcUSdcSd(6,6,6,6),cplUSdSecUSdcSe(6,6,6,6),cplUSdSucUSdcSu(6,6,6,6),            & 
& cplUSdSvImSvImcUSd(6,9,9,6),cplUSdSvReSvRecUSd(6,9,9,6),cplUSdcUSdVGVG(6,6),           & 
& cplUSdcUSdVPVP(6,6),cplUSdcUSdcVWmVWm(6,6),cplUSdcUSdVZVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Sd, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSd2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSdcUSd(i2,i1,gO1)
coup2 = Conjg(cplAhSdcUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fu, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MCha(i2)*Real(SA_B0(p2,MFu2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChaFucUSdL(i2,i1,gO1)
coupR1 = cplChaFucUSdR(i2,i1,gO1)
coupL2 =  Conjg(cplChaFucUSdL(i2,i1,gO2))
coupR2 =  Conjg(cplChaFucUSdR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fd, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 5
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MChi(i2)*Real(SA_B0(p2,MFd2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFdcUSdL(i2,i1,gO1)
coupR1 = cplChiFdcUSdR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFdcUSdL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFdcUSdR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Glu, Fd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MGlu2,MFd2(i2)),dp) 
B0m2 = -2._dp*MGlu*MFd(i2)*Real(SA_B0(p2,MGlu2,MFd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplGluFdcUSdL(i2,gO1)
coupR1 = cplGluFdcUSdR(i2,gO1)
coupL2 =  Conjg(cplGluFdcUSdL(i2,gO2))
coupR2 =  Conjg(cplGluFdcUSdR(i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! Sd, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSd2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSdcUSd(i2,i1,gO1)
coup2 = Conjg(cplhhSdcUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Su, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSu2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSucUSd(i2,i1,gO1)
coup2 = Conjg(cplHpmSucUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VG, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSd2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVG(i2,gO1)
coup2 =  Conjg(cplSdcUSdVG(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! VP, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSd2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVP(i2,gO1)
coup2 =  Conjg(cplSdcUSdVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSd2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVZ(i2,gO1)
coup2 =  Conjg(cplSdcUSdVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSu2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSdVWm(i2,gO1)
coup2 =  Conjg(cplSucUSdVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSdcUSd(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSdcUSd(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSdcHpmcUSd(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSdcUSdcSd(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSecUSdcSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSucUSdcSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSvImSvImcUSd(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSvReSvRecUSd(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdcVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSd 
 
Subroutine DerPi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,            & 
& MChi,MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVWm,MVWm2,MSe,            & 
& MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcUSd,cplChaFucUSdL,cplChaFucUSdR,cplChiFdcUSdL,  & 
& cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,cplHpmSucUSd,cplSdcUSdVG,        & 
& cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,  & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvImSvImcUSd,cplUSdSvReSvRecUSd, & 
& cplUSdcUSdVGVG,cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MAh(3),MAh2(3),MFu(3),MFu2(3),MCha(2),MCha2(2),MFd(3),MFd2(3),         & 
& MChi(5),MChi2(5),MGlu,MGlu2,Mhh(3),Mhh2(3),MSu(6),MSu2(6),MHpm(2),MHpm2(2),            & 
& MVZ,MVZ2,MVWm,MVWm2,MSe(6),MSe2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhSdcUSd(3,6,6),cplChaFucUSdL(2,3,6),cplChaFucUSdR(2,3,6),cplChiFdcUSdL(5,3,6),    & 
& cplChiFdcUSdR(5,3,6),cplGluFdcUSdL(3,6),cplGluFdcUSdR(3,6),cplhhSdcUSd(3,6,6),         & 
& cplHpmSucUSd(2,6,6),cplSdcUSdVG(6,6),cplSdcUSdVP(6,6),cplSdcUSdVZ(6,6),cplSucUSdVWm(6,6),& 
& cplAhAhUSdcUSd(3,3,6,6),cplhhhhUSdcUSd(3,3,6,6),cplHpmUSdcHpmcUSd(2,6,2,6),            & 
& cplUSdSdcUSdcSd(6,6,6,6),cplUSdSecUSdcSe(6,6,6,6),cplUSdSucUSdcSu(6,6,6,6),            & 
& cplUSdSvImSvImcUSd(6,9,9,6),cplUSdSvReSvRecUSd(6,9,9,6),cplUSdcUSdVGVG(6,6),           & 
& cplUSdcUSdVPVP(6,6),cplUSdcUSdcVWmVWm(6,6),cplUSdcUSdVZVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Sd, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSd2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSdcUSd(i2,i1,gO1)
coup2 = Conjg(cplAhSdcUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fu, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MCha(i2)*Real(SA_DerB0(p2,MFu2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChaFucUSdL(i2,i1,gO1)
coupR1 = cplChaFucUSdR(i2,i1,gO1)
coupL2 =  Conjg(cplChaFucUSdL(i2,i1,gO2))
coupR2 =  Conjg(cplChaFucUSdR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fd, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 5
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MChi(i2)*Real(SA_DerB0(p2,MFd2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFdcUSdL(i2,i1,gO1)
coupR1 = cplChiFdcUSdR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFdcUSdL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFdcUSdR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Glu, Fd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MGlu2,MFd2(i2)),dp) 
B0m2 = -2._dp*MGlu*MFd(i2)*Real(SA_DerB0(p2,MGlu2,MFd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplGluFdcUSdL(i2,gO1)
coupR1 = cplGluFdcUSdR(i2,gO1)
coupL2 =  Conjg(cplGluFdcUSdL(i2,gO2))
coupR2 =  Conjg(cplGluFdcUSdR(i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! Sd, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSd2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSdcUSd(i2,i1,gO1)
coup2 = Conjg(cplhhSdcUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Su, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSucUSd(i2,i1,gO1)
coup2 = Conjg(cplHpmSucUSd(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VG, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSd2(i2),MVG2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVG(i2,gO1)
coup2 =  Conjg(cplSdcUSdVG(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! VP, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSd2(i2),MVP2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVP(i2,gO1)
coup2 =  Conjg(cplSdcUSdVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSd2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSdVZ(i2,gO1)
coup2 =  Conjg(cplSdcUSdVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSu2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSdVWm(i2,gO1)
coup2 =  Conjg(cplSucUSdVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSdcUSd(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSdcUSd(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSdcHpmcUSd(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSdcUSdcSd(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSecUSdcSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSucUSdcSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSvImSvImcUSd(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdSvReSvRecUSd(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVG2) + 0.25_dp*RXi*SA_DerA0(MVG2*RXi) - 0.5_dp*MVG2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVGVG(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVPVP(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdcVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSdcUSdVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSd 
 
Subroutine OneLoopSvIm(g1,g2,MUX,BMUX,lam,kap,lamN,TLN,Yv,Tv,ml2,mv2,mx2,             & 
& vd,vu,vS,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,MFv,MFv2,              & 
& MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,MSd2,MSu,              & 
& MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,cplChiFvUSvImL,     & 
& cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,cplSeUSvImcVWm,            & 
& cplUSvImSvReVZ,cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,               & 
& cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,        & 
& cplUSvImUSvImSvReSvRe,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,delta,mass,               & 
& mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MAh(3),MAh2(3),MSvRe(9),MSvRe2(9),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(9),MFv2(9),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Real(dp), Intent(in) :: g1,g2,vd,vu,vS

Complex(dp), Intent(in) :: MUX(3,3),BMUX(3,3),lam,kap,lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ml2(3,3),               & 
& mv2(3,3),mx2(3,3)

Complex(dp), Intent(in) :: cplAhUSvImSvIm(3,9,9),cplAhUSvImSvRe(3,9,9),cplcFeChaUSvImL(3,2,9),cplcFeChaUSvImR(3,2,9),& 
& cplChiFvUSvImL(5,9,9),cplChiFvUSvImR(5,9,9),cplhhUSvImSvIm(3,9,9),cplhhUSvImSvRe(3,9,9),& 
& cplHpmUSvImcSe(2,9,6),cplSeUSvImcVWm(6,9),cplUSvImSvReVZ(9,9),cplAhAhUSvImUSvIm(3,3,9,9),& 
& cplhhhhUSvImUSvIm(3,3,9,9),cplHpmUSvImUSvImcHpm(2,9,9,2),cplSdUSvImUSvImcSd(6,9,9,6),  & 
& cplSeUSvImUSvImcSe(6,9,9,6),cplSuUSvImUSvImcSu(6,9,9,6),cplUSvImUSvImSvImSvIm(9,9,9,9),& 
& cplUSvImUSvImSvReSvRe(9,9,9,9),cplUSvImUSvImcVWmVWm(9,9),cplUSvImUSvImVZVZ(9,9)

Complex(dp) :: mat2a(9,9), mat2(9,9),  PiSf(9,9,9)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(9), test_m2(9),p2, test(9) 
Real(dp), Intent(out) :: mass(9), mass2(9) 
Complex(dp), Intent(out) ::  RS(9,9) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSvIm'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+ml2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+ml2(1,2)/2._dp
mat2a(1,2) = mat2a(1,2)+ml2(2,1)/2._dp
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,2))/4._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+ml2(1,3)/2._dp
mat2a(1,3) = mat2a(1,3)+ml2(3,1)/2._dp
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,3))/4._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-(vd*vS*lam*Conjg(Yv(1,1)))/4._dp
mat2a(1,4) = mat2a(1,4)+(vu*Conjg(Tv(1,1)))/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)-(vd*vS*Conjg(lam)*Yv(1,1))/4._dp
mat2a(1,4) = mat2a(1,4)+(vu*Tv(1,1))/(2._dp*sqrt(2._dp))
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-(vd*vS*lam*Conjg(Yv(2,1)))/4._dp
mat2a(1,5) = mat2a(1,5)+(vu*Conjg(Tv(2,1)))/(2._dp*sqrt(2._dp))
mat2a(1,5) = mat2a(1,5)-(vd*vS*Conjg(lam)*Yv(2,1))/4._dp
mat2a(1,5) = mat2a(1,5)+(vu*Tv(2,1))/(2._dp*sqrt(2._dp))
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-(vd*vS*lam*Conjg(Yv(3,1)))/4._dp
mat2a(1,6) = mat2a(1,6)+(vu*Conjg(Tv(3,1)))/(2._dp*sqrt(2._dp))
mat2a(1,6) = mat2a(1,6)-(vd*vS*Conjg(lam)*Yv(3,1))/4._dp
mat2a(1,6) = mat2a(1,6)+(vu*Tv(3,1))/(2._dp*sqrt(2._dp))
mat2a(1,7) = 0._dp 
Do j1 = 1,3
mat2a(1,7) = mat2a(1,7)+(vS*vu*Conjg(lamN(j1,1))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,7) = mat2a(1,7)+(vS*vu*Conjg(Yv(j1,1))*lamN(j1,1))/4._dp
End Do 
mat2a(1,8) = 0._dp 
Do j1 = 1,3
mat2a(1,8) = mat2a(1,8)+(vS*vu*Conjg(lamN(j1,2))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,8) = mat2a(1,8)+(vS*vu*Conjg(Yv(j1,1))*lamN(j1,2))/4._dp
End Do 
mat2a(1,9) = 0._dp 
Do j1 = 1,3
mat2a(1,9) = mat2a(1,9)+(vS*vu*Conjg(lamN(j1,3))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,9) = mat2a(1,9)+(vS*vu*Conjg(Yv(j1,1))*lamN(j1,3))/4._dp
End Do 
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+ml2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+ml2(2,3)/2._dp
mat2a(2,3) = mat2a(2,3)+ml2(3,2)/2._dp
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,3))/4._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-(vd*vS*lam*Conjg(Yv(1,2)))/4._dp
mat2a(2,4) = mat2a(2,4)+(vu*Conjg(Tv(1,2)))/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)-(vd*vS*Conjg(lam)*Yv(1,2))/4._dp
mat2a(2,4) = mat2a(2,4)+(vu*Tv(1,2))/(2._dp*sqrt(2._dp))
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-(vd*vS*lam*Conjg(Yv(2,2)))/4._dp
mat2a(2,5) = mat2a(2,5)+(vu*Conjg(Tv(2,2)))/(2._dp*sqrt(2._dp))
mat2a(2,5) = mat2a(2,5)-(vd*vS*Conjg(lam)*Yv(2,2))/4._dp
mat2a(2,5) = mat2a(2,5)+(vu*Tv(2,2))/(2._dp*sqrt(2._dp))
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-(vd*vS*lam*Conjg(Yv(3,2)))/4._dp
mat2a(2,6) = mat2a(2,6)+(vu*Conjg(Tv(3,2)))/(2._dp*sqrt(2._dp))
mat2a(2,6) = mat2a(2,6)-(vd*vS*Conjg(lam)*Yv(3,2))/4._dp
mat2a(2,6) = mat2a(2,6)+(vu*Tv(3,2))/(2._dp*sqrt(2._dp))
mat2a(2,7) = 0._dp 
Do j1 = 1,3
mat2a(2,7) = mat2a(2,7)+(vS*vu*Conjg(lamN(j1,1))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,7) = mat2a(2,7)+(vS*vu*Conjg(Yv(j1,2))*lamN(j1,1))/4._dp
End Do 
mat2a(2,8) = 0._dp 
Do j1 = 1,3
mat2a(2,8) = mat2a(2,8)+(vS*vu*Conjg(lamN(j1,2))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,8) = mat2a(2,8)+(vS*vu*Conjg(Yv(j1,2))*lamN(j1,2))/4._dp
End Do 
mat2a(2,9) = 0._dp 
Do j1 = 1,3
mat2a(2,9) = mat2a(2,9)+(vS*vu*Conjg(lamN(j1,3))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,9) = mat2a(2,9)+(vS*vu*Conjg(Yv(j1,2))*lamN(j1,3))/4._dp
End Do 
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+(g1**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g1**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+ml2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(vd*vS*lam*Conjg(Yv(1,3)))/4._dp
mat2a(3,4) = mat2a(3,4)+(vu*Conjg(Tv(1,3)))/(2._dp*sqrt(2._dp))
mat2a(3,4) = mat2a(3,4)-(vd*vS*Conjg(lam)*Yv(1,3))/4._dp
mat2a(3,4) = mat2a(3,4)+(vu*Tv(1,3))/(2._dp*sqrt(2._dp))
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-(vd*vS*lam*Conjg(Yv(2,3)))/4._dp
mat2a(3,5) = mat2a(3,5)+(vu*Conjg(Tv(2,3)))/(2._dp*sqrt(2._dp))
mat2a(3,5) = mat2a(3,5)-(vd*vS*Conjg(lam)*Yv(2,3))/4._dp
mat2a(3,5) = mat2a(3,5)+(vu*Tv(2,3))/(2._dp*sqrt(2._dp))
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-(vd*vS*lam*Conjg(Yv(3,3)))/4._dp
mat2a(3,6) = mat2a(3,6)+(vu*Conjg(Tv(3,3)))/(2._dp*sqrt(2._dp))
mat2a(3,6) = mat2a(3,6)-(vd*vS*Conjg(lam)*Yv(3,3))/4._dp
mat2a(3,6) = mat2a(3,6)+(vu*Tv(3,3))/(2._dp*sqrt(2._dp))
mat2a(3,7) = 0._dp 
Do j1 = 1,3
mat2a(3,7) = mat2a(3,7)+(vS*vu*Conjg(lamN(j1,1))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,7) = mat2a(3,7)+(vS*vu*Conjg(Yv(j1,3))*lamN(j1,1))/4._dp
End Do 
mat2a(3,8) = 0._dp 
Do j1 = 1,3
mat2a(3,8) = mat2a(3,8)+(vS*vu*Conjg(lamN(j1,2))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,8) = mat2a(3,8)+(vS*vu*Conjg(Yv(j1,3))*lamN(j1,2))/4._dp
End Do 
mat2a(3,9) = 0._dp 
Do j1 = 1,3
mat2a(3,9) = mat2a(3,9)+(vS*vu*Conjg(lamN(j1,3))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,9) = mat2a(3,9)+(vS*vu*Conjg(Yv(j1,3))*lamN(j1,3))/4._dp
End Do 
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)+mv2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vu**2*Conjg(Yv(1,j1))*Yv(1,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vS**2*Conjg(lamN(1,j1))*lamN(1,j1))/2._dp
End Do 
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)+mv2(1,2)/2._dp
mat2a(4,5) = mat2a(4,5)+mv2(2,1)/2._dp
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yv(2,j1))*Yv(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yv(1,j1))*Yv(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vS**2*Conjg(lamN(2,j1))*lamN(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vS**2*Conjg(lamN(1,j1))*lamN(2,j1))/4._dp
End Do 
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)+mv2(1,3)/2._dp
mat2a(4,6) = mat2a(4,6)+mv2(3,1)/2._dp
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yv(3,j1))*Yv(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yv(1,j1))*Yv(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vS**2*Conjg(lamN(3,j1))*lamN(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vS**2*Conjg(lamN(1,j1))*lamN(3,j1))/4._dp
End Do 
mat2a(4,7) = 0._dp 
mat2a(4,7) = mat2a(4,7)+(vS**2*kap*Conjg(lamN(1,1)))/4._dp
mat2a(4,7) = mat2a(4,7)-(vd*vu*lam*Conjg(lamN(1,1)))/4._dp
mat2a(4,7) = mat2a(4,7)+(vS*Conjg(TLN(1,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(4,7) = mat2a(4,7)-(vS*Conjg(lamN(1,j1))*MUX(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,7) = mat2a(4,7)-(vS*Conjg(lamN(1,j1))*MUX(j1,1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,7) = mat2a(4,7)-(vS*Conjg(MUX(1,j1))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,7) = mat2a(4,7)-(vS*Conjg(MUX(j1,1))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(4,7) = mat2a(4,7)+(vS**2*Conjg(kap)*lamN(1,1))/4._dp
mat2a(4,7) = mat2a(4,7)-(vd*vu*Conjg(lam)*lamN(1,1))/4._dp
mat2a(4,7) = mat2a(4,7)+(vS*TLN(1,1))/(2._dp*sqrt(2._dp))
mat2a(4,8) = 0._dp 
mat2a(4,8) = mat2a(4,8)+(vS**2*kap*Conjg(lamN(1,2)))/4._dp
mat2a(4,8) = mat2a(4,8)-(vd*vu*lam*Conjg(lamN(1,2)))/4._dp
mat2a(4,8) = mat2a(4,8)+(vS*Conjg(TLN(1,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(4,8) = mat2a(4,8)-(vS*Conjg(lamN(1,j1))*MUX(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,8) = mat2a(4,8)-(vS*Conjg(lamN(1,j1))*MUX(j1,2))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,8) = mat2a(4,8)-(vS*Conjg(MUX(2,j1))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,8) = mat2a(4,8)-(vS*Conjg(MUX(j1,2))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(4,8) = mat2a(4,8)+(vS**2*Conjg(kap)*lamN(1,2))/4._dp
mat2a(4,8) = mat2a(4,8)-(vd*vu*Conjg(lam)*lamN(1,2))/4._dp
mat2a(4,8) = mat2a(4,8)+(vS*TLN(1,2))/(2._dp*sqrt(2._dp))
mat2a(4,9) = 0._dp 
mat2a(4,9) = mat2a(4,9)+(vS**2*kap*Conjg(lamN(1,3)))/4._dp
mat2a(4,9) = mat2a(4,9)-(vd*vu*lam*Conjg(lamN(1,3)))/4._dp
mat2a(4,9) = mat2a(4,9)+(vS*Conjg(TLN(1,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(4,9) = mat2a(4,9)-(vS*Conjg(lamN(1,j1))*MUX(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,9) = mat2a(4,9)-(vS*Conjg(lamN(1,j1))*MUX(j1,3))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,9) = mat2a(4,9)-(vS*Conjg(MUX(3,j1))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,9) = mat2a(4,9)-(vS*Conjg(MUX(j1,3))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(4,9) = mat2a(4,9)+(vS**2*Conjg(kap)*lamN(1,3))/4._dp
mat2a(4,9) = mat2a(4,9)-(vd*vu*Conjg(lam)*lamN(1,3))/4._dp
mat2a(4,9) = mat2a(4,9)+(vS*TLN(1,3))/(2._dp*sqrt(2._dp))
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)+mv2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vu**2*Conjg(Yv(2,j1))*Yv(2,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vS**2*Conjg(lamN(2,j1))*lamN(2,j1))/2._dp
End Do 
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)+mv2(2,3)/2._dp
mat2a(5,6) = mat2a(5,6)+mv2(3,2)/2._dp
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yv(3,j1))*Yv(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yv(2,j1))*Yv(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vS**2*Conjg(lamN(3,j1))*lamN(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vS**2*Conjg(lamN(2,j1))*lamN(3,j1))/4._dp
End Do 
mat2a(5,7) = 0._dp 
mat2a(5,7) = mat2a(5,7)+(vS**2*kap*Conjg(lamN(2,1)))/4._dp
mat2a(5,7) = mat2a(5,7)-(vd*vu*lam*Conjg(lamN(2,1)))/4._dp
mat2a(5,7) = mat2a(5,7)+(vS*Conjg(TLN(2,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(5,7) = mat2a(5,7)-(vS*Conjg(lamN(2,j1))*MUX(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,7) = mat2a(5,7)-(vS*Conjg(lamN(2,j1))*MUX(j1,1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,7) = mat2a(5,7)-(vS*Conjg(MUX(1,j1))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,7) = mat2a(5,7)-(vS*Conjg(MUX(j1,1))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(5,7) = mat2a(5,7)+(vS**2*Conjg(kap)*lamN(2,1))/4._dp
mat2a(5,7) = mat2a(5,7)-(vd*vu*Conjg(lam)*lamN(2,1))/4._dp
mat2a(5,7) = mat2a(5,7)+(vS*TLN(2,1))/(2._dp*sqrt(2._dp))
mat2a(5,8) = 0._dp 
mat2a(5,8) = mat2a(5,8)+(vS**2*kap*Conjg(lamN(2,2)))/4._dp
mat2a(5,8) = mat2a(5,8)-(vd*vu*lam*Conjg(lamN(2,2)))/4._dp
mat2a(5,8) = mat2a(5,8)+(vS*Conjg(TLN(2,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(5,8) = mat2a(5,8)-(vS*Conjg(lamN(2,j1))*MUX(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,8) = mat2a(5,8)-(vS*Conjg(lamN(2,j1))*MUX(j1,2))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,8) = mat2a(5,8)-(vS*Conjg(MUX(2,j1))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,8) = mat2a(5,8)-(vS*Conjg(MUX(j1,2))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(5,8) = mat2a(5,8)+(vS**2*Conjg(kap)*lamN(2,2))/4._dp
mat2a(5,8) = mat2a(5,8)-(vd*vu*Conjg(lam)*lamN(2,2))/4._dp
mat2a(5,8) = mat2a(5,8)+(vS*TLN(2,2))/(2._dp*sqrt(2._dp))
mat2a(5,9) = 0._dp 
mat2a(5,9) = mat2a(5,9)+(vS**2*kap*Conjg(lamN(2,3)))/4._dp
mat2a(5,9) = mat2a(5,9)-(vd*vu*lam*Conjg(lamN(2,3)))/4._dp
mat2a(5,9) = mat2a(5,9)+(vS*Conjg(TLN(2,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(5,9) = mat2a(5,9)-(vS*Conjg(lamN(2,j1))*MUX(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,9) = mat2a(5,9)-(vS*Conjg(lamN(2,j1))*MUX(j1,3))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,9) = mat2a(5,9)-(vS*Conjg(MUX(3,j1))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,9) = mat2a(5,9)-(vS*Conjg(MUX(j1,3))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(5,9) = mat2a(5,9)+(vS**2*Conjg(kap)*lamN(2,3))/4._dp
mat2a(5,9) = mat2a(5,9)-(vd*vu*Conjg(lam)*lamN(2,3))/4._dp
mat2a(5,9) = mat2a(5,9)+(vS*TLN(2,3))/(2._dp*sqrt(2._dp))
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)+mv2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vu**2*Conjg(Yv(3,j1))*Yv(3,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vS**2*Conjg(lamN(3,j1))*lamN(3,j1))/2._dp
End Do 
mat2a(6,7) = 0._dp 
mat2a(6,7) = mat2a(6,7)+(vS**2*kap*Conjg(lamN(3,1)))/4._dp
mat2a(6,7) = mat2a(6,7)-(vd*vu*lam*Conjg(lamN(3,1)))/4._dp
mat2a(6,7) = mat2a(6,7)+(vS*Conjg(TLN(3,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(6,7) = mat2a(6,7)-(vS*Conjg(lamN(3,j1))*MUX(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,7) = mat2a(6,7)-(vS*Conjg(lamN(3,j1))*MUX(j1,1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,7) = mat2a(6,7)-(vS*Conjg(MUX(1,j1))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,7) = mat2a(6,7)-(vS*Conjg(MUX(j1,1))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(6,7) = mat2a(6,7)+(vS**2*Conjg(kap)*lamN(3,1))/4._dp
mat2a(6,7) = mat2a(6,7)-(vd*vu*Conjg(lam)*lamN(3,1))/4._dp
mat2a(6,7) = mat2a(6,7)+(vS*TLN(3,1))/(2._dp*sqrt(2._dp))
mat2a(6,8) = 0._dp 
mat2a(6,8) = mat2a(6,8)+(vS**2*kap*Conjg(lamN(3,2)))/4._dp
mat2a(6,8) = mat2a(6,8)-(vd*vu*lam*Conjg(lamN(3,2)))/4._dp
mat2a(6,8) = mat2a(6,8)+(vS*Conjg(TLN(3,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(6,8) = mat2a(6,8)-(vS*Conjg(lamN(3,j1))*MUX(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,8) = mat2a(6,8)-(vS*Conjg(lamN(3,j1))*MUX(j1,2))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,8) = mat2a(6,8)-(vS*Conjg(MUX(2,j1))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,8) = mat2a(6,8)-(vS*Conjg(MUX(j1,2))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(6,8) = mat2a(6,8)+(vS**2*Conjg(kap)*lamN(3,2))/4._dp
mat2a(6,8) = mat2a(6,8)-(vd*vu*Conjg(lam)*lamN(3,2))/4._dp
mat2a(6,8) = mat2a(6,8)+(vS*TLN(3,2))/(2._dp*sqrt(2._dp))
mat2a(6,9) = 0._dp 
mat2a(6,9) = mat2a(6,9)+(vS**2*kap*Conjg(lamN(3,3)))/4._dp
mat2a(6,9) = mat2a(6,9)-(vd*vu*lam*Conjg(lamN(3,3)))/4._dp
mat2a(6,9) = mat2a(6,9)+(vS*Conjg(TLN(3,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(6,9) = mat2a(6,9)-(vS*Conjg(lamN(3,j1))*MUX(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,9) = mat2a(6,9)-(vS*Conjg(lamN(3,j1))*MUX(j1,3))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,9) = mat2a(6,9)-(vS*Conjg(MUX(3,j1))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,9) = mat2a(6,9)-(vS*Conjg(MUX(j1,3))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(6,9) = mat2a(6,9)+(vS**2*Conjg(kap)*lamN(3,3))/4._dp
mat2a(6,9) = mat2a(6,9)-(vd*vu*Conjg(lam)*lamN(3,3))/4._dp
mat2a(6,9) = mat2a(6,9)+(vS*TLN(3,3))/(2._dp*sqrt(2._dp))
mat2a(7,7) = 0._dp 
mat2a(7,7) = mat2a(7,7)-Conjg(BMUX(1,1))/2._dp
mat2a(7,7) = mat2a(7,7)+mx2(1,1)
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(Conjg(MUX(1,j1))*MUX(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(Conjg(MUX(j1,1))*MUX(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(Conjg(MUX(1,j1))*MUX(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(Conjg(MUX(j1,1))*MUX(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(vS**2*Conjg(lamN(j1,1))*lamN(j1,1))/2._dp
End Do 
mat2a(7,7) = mat2a(7,7)-BMUX(1,1)/2._dp
mat2a(7,8) = 0._dp 
mat2a(7,8) = mat2a(7,8)-Conjg(BMUX(1,2))/4._dp
mat2a(7,8) = mat2a(7,8)-Conjg(BMUX(2,1))/4._dp
mat2a(7,8) = mat2a(7,8)+mx2(1,2)/2._dp
mat2a(7,8) = mat2a(7,8)+mx2(2,1)/2._dp
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(2,j1))*MUX(1,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(j1,2))*MUX(1,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(1,j1))*MUX(2,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(j1,1))*MUX(2,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(2,j1))*MUX(j1,1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(j1,2))*MUX(j1,1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(1,j1))*MUX(j1,2))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(j1,1))*MUX(j1,2))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(vS**2*Conjg(lamN(j1,2))*lamN(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(vS**2*Conjg(lamN(j1,1))*lamN(j1,2))/4._dp
End Do 
mat2a(7,8) = mat2a(7,8)-BMUX(1,2)/4._dp
mat2a(7,8) = mat2a(7,8)-BMUX(2,1)/4._dp
mat2a(7,9) = 0._dp 
mat2a(7,9) = mat2a(7,9)-Conjg(BMUX(1,3))/4._dp
mat2a(7,9) = mat2a(7,9)-Conjg(BMUX(3,1))/4._dp
mat2a(7,9) = mat2a(7,9)+mx2(1,3)/2._dp
mat2a(7,9) = mat2a(7,9)+mx2(3,1)/2._dp
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(3,j1))*MUX(1,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(j1,3))*MUX(1,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(1,j1))*MUX(3,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(j1,1))*MUX(3,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(3,j1))*MUX(j1,1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(j1,3))*MUX(j1,1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(1,j1))*MUX(j1,3))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(j1,1))*MUX(j1,3))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(vS**2*Conjg(lamN(j1,3))*lamN(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(vS**2*Conjg(lamN(j1,1))*lamN(j1,3))/4._dp
End Do 
mat2a(7,9) = mat2a(7,9)-BMUX(1,3)/4._dp
mat2a(7,9) = mat2a(7,9)-BMUX(3,1)/4._dp
mat2a(8,8) = 0._dp 
mat2a(8,8) = mat2a(8,8)-Conjg(BMUX(2,2))/2._dp
mat2a(8,8) = mat2a(8,8)+mx2(2,2)
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(Conjg(MUX(2,j1))*MUX(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(Conjg(MUX(j1,2))*MUX(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(Conjg(MUX(2,j1))*MUX(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(Conjg(MUX(j1,2))*MUX(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(vS**2*Conjg(lamN(j1,2))*lamN(j1,2))/2._dp
End Do 
mat2a(8,8) = mat2a(8,8)-BMUX(2,2)/2._dp
mat2a(8,9) = 0._dp 
mat2a(8,9) = mat2a(8,9)-Conjg(BMUX(2,3))/4._dp
mat2a(8,9) = mat2a(8,9)-Conjg(BMUX(3,2))/4._dp
mat2a(8,9) = mat2a(8,9)+mx2(2,3)/2._dp
mat2a(8,9) = mat2a(8,9)+mx2(3,2)/2._dp
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(3,j1))*MUX(2,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(j1,3))*MUX(2,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(2,j1))*MUX(3,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(j1,2))*MUX(3,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(3,j1))*MUX(j1,2))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(j1,3))*MUX(j1,2))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(2,j1))*MUX(j1,3))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(j1,2))*MUX(j1,3))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(vS**2*Conjg(lamN(j1,3))*lamN(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(vS**2*Conjg(lamN(j1,2))*lamN(j1,3))/4._dp
End Do 
mat2a(8,9) = mat2a(8,9)-BMUX(2,3)/4._dp
mat2a(8,9) = mat2a(8,9)-BMUX(3,2)/4._dp
mat2a(9,9) = 0._dp 
mat2a(9,9) = mat2a(9,9)-Conjg(BMUX(3,3))/2._dp
mat2a(9,9) = mat2a(9,9)+mx2(3,3)
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(Conjg(MUX(3,j1))*MUX(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(Conjg(MUX(j1,3))*MUX(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(Conjg(MUX(3,j1))*MUX(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(Conjg(MUX(j1,3))*MUX(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(vS**2*Conjg(lamN(j1,3))*lamN(j1,3))/2._dp
End Do 
mat2a(9,9) = mat2a(9,9)-BMUX(3,3)/2._dp

 
 Do i1=2,9
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,              & 
& MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,           & 
& cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,            & 
& cplSeUSvImcVWm,cplUSvImSvReVZ,cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,& 
& cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,        & 
& cplUSvImUSvImSvReSvRe,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZVIOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,9
PiSf(i1,:,:) = ZeroC 
p2 = MSvIm2(i1)
Call Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,              & 
& MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,           & 
& cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,            & 
& cplSeUSvImcVWm,cplUSvImSvReVZ,cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,& 
& cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,        & 
& cplUSvImUSvImSvReSvRe,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=9,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,9
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,9
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,              & 
& MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,           & 
& cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,            & 
& cplSeUSvImcVWm,cplUSvImSvReVZ,cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,& 
& cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,        & 
& cplUSvImUSvImSvReSvRe,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=9,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZVIOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,9
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSvIm
 
 
Subroutine Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,           & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MSd,MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,       & 
& cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,            & 
& cplSeUSvImcVWm,cplUSvImSvReVZ,cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,& 
& cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,        & 
& cplUSvImUSvImSvReSvRe,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MAh(3),MAh2(3),MSvRe(9),MSvRe2(9),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(9),MFv2(9),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhUSvImSvIm(3,9,9),cplAhUSvImSvRe(3,9,9),cplcFeChaUSvImL(3,2,9),cplcFeChaUSvImR(3,2,9),& 
& cplChiFvUSvImL(5,9,9),cplChiFvUSvImR(5,9,9),cplhhUSvImSvIm(3,9,9),cplhhUSvImSvRe(3,9,9),& 
& cplHpmUSvImcSe(2,9,6),cplSeUSvImcVWm(6,9),cplUSvImSvReVZ(9,9),cplAhAhUSvImUSvIm(3,3,9,9),& 
& cplhhhhUSvImUSvIm(3,3,9,9),cplHpmUSvImUSvImcHpm(2,9,9,2),cplSdUSvImUSvImcSd(6,9,9,6),  & 
& cplSeUSvImUSvImcSe(6,9,9,6),cplSuUSvImUSvImcSu(6,9,9,6),cplUSvImUSvImSvImSvIm(9,9,9,9),& 
& cplUSvImUSvImSvReSvRe(9,9,9,9),cplUSvImUSvImcVWmVWm(9,9),cplUSvImUSvImVZVZ(9,9)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(9,9) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(9,9) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! SvIm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhUSvImSvIm(i2,gO1,i1)
coup2 = Conjg(cplAhUSvImSvIm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhUSvImSvRe(i2,gO1,i1)
coup2 = Conjg(cplAhUSvImSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MCha(i2)*Real(SA_B0(p2,MFe2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coupL1 = cplcFeChaUSvImL(i1,i2,gO1)
coupR1 = cplcFeChaUSvImR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeChaUSvImL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeChaUSvImR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 5
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*Real(SA_B0(p2,MFv2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coupL1 = cplChiFvUSvImL(i2,i1,gO1)
coupR1 = cplChiFvUSvImR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFvUSvImL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFvUSvImR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhUSvImSvIm(i2,gO1,i1)
coup2 = Conjg(cplhhUSvImSvIm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhUSvImSvRe(i2,gO1,i1)
coup2 = Conjg(cplhhUSvImSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplHpmUSvImcSe(i2,gO1,i1)
coup2 = Conjg(cplHpmUSvImcSe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSe2(i2),MVWm2) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSeUSvImcVWm(i2,gO1)
coup2 =  Conjg(cplSeUSvImcVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VZ, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 9
 F0m2 = FloopRXi(p2,MSvRe2(i2),MVZ2) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImSvReVZ(gO1,i2)
coup2 =  Conjg(cplUSvImSvReVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhAhUSvImUSvIm(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhhhUSvImUSvIm(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplHpmUSvImUSvImcHpm(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSdUSvImUSvImcSd(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSeUSvImUSvImcSe(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSuUSvImUSvImcSu(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImUSvImSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImUSvImSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImUSvImcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImUSvImVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 9
  Do gO1 = gO2+1, 9
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSvIm 
 
Subroutine DerPi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,             & 
& MCha,MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,            & 
& MVZ2,MSd,MSd2,MSu,MSu2,cplAhUSvImSvIm,cplAhUSvImSvRe,cplcFeChaUSvImL,cplcFeChaUSvImR,  & 
& cplChiFvUSvImL,cplChiFvUSvImR,cplhhUSvImSvIm,cplhhUSvImSvRe,cplHpmUSvImcSe,            & 
& cplSeUSvImcVWm,cplUSvImSvReVZ,cplAhAhUSvImUSvIm,cplhhhhUSvImUSvIm,cplHpmUSvImUSvImcHpm,& 
& cplSdUSvImUSvImcSd,cplSeUSvImUSvImcSe,cplSuUSvImUSvImcSu,cplUSvImUSvImSvImSvIm,        & 
& cplUSvImUSvImSvReSvRe,cplUSvImUSvImcVWmVWm,cplUSvImUSvImVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MAh(3),MAh2(3),MSvRe(9),MSvRe2(9),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(9),MFv2(9),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhUSvImSvIm(3,9,9),cplAhUSvImSvRe(3,9,9),cplcFeChaUSvImL(3,2,9),cplcFeChaUSvImR(3,2,9),& 
& cplChiFvUSvImL(5,9,9),cplChiFvUSvImR(5,9,9),cplhhUSvImSvIm(3,9,9),cplhhUSvImSvRe(3,9,9),& 
& cplHpmUSvImcSe(2,9,6),cplSeUSvImcVWm(6,9),cplUSvImSvReVZ(9,9),cplAhAhUSvImUSvIm(3,3,9,9),& 
& cplhhhhUSvImUSvIm(3,3,9,9),cplHpmUSvImUSvImcHpm(2,9,9,2),cplSdUSvImUSvImcSd(6,9,9,6),  & 
& cplSeUSvImUSvImcSe(6,9,9,6),cplSuUSvImUSvImcSu(6,9,9,6),cplUSvImUSvImSvImSvIm(9,9,9,9),& 
& cplUSvImUSvImSvReSvRe(9,9,9,9),cplUSvImUSvImcVWmVWm(9,9),cplUSvImUSvImVZVZ(9,9)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(9,9) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(9,9) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! SvIm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhUSvImSvIm(i2,gO1,i1)
coup2 = Conjg(cplAhUSvImSvIm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhUSvImSvRe(i2,gO1,i1)
coup2 = Conjg(cplAhUSvImSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MCha(i2)*Real(SA_DerB0(p2,MFe2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coupL1 = cplcFeChaUSvImL(i1,i2,gO1)
coupR1 = cplcFeChaUSvImR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeChaUSvImL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeChaUSvImR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 5
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*Real(SA_DerB0(p2,MFv2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coupL1 = cplChiFvUSvImL(i2,i1,gO1)
coupR1 = cplChiFvUSvImR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFvUSvImL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFvUSvImR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhUSvImSvIm(i2,gO1,i1)
coup2 = Conjg(cplhhUSvImSvIm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhUSvImSvRe(i2,gO1,i1)
coup2 = Conjg(cplhhUSvImSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplHpmUSvImcSe(i2,gO1,i1)
coup2 = Conjg(cplHpmUSvImcSe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSe2(i2),MVWm2) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSeUSvImcVWm(i2,gO1)
coup2 =  Conjg(cplSeUSvImcVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VZ, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 9
 F0m2 = DerFloopRXi(p2,MSvRe2(i2),MVZ2) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImSvReVZ(gO1,i2)
coup2 =  Conjg(cplUSvImSvReVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhAhUSvImUSvIm(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhhhUSvImUSvIm(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplHpmUSvImUSvImcHpm(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSdUSvImUSvImcSd(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSeUSvImUSvImcSe(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSuUSvImUSvImcSu(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImUSvImSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImUSvImSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImUSvImcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvImUSvImVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 9
  Do gO1 = gO2+1, 9
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSvIm 
 
Subroutine OneLoopSvRe(g1,g2,MUX,BMUX,lam,kap,lamN,TLN,Yv,Tv,ml2,mv2,mx2,             & 
& vd,vu,vS,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,MFv,MFv2,              & 
& MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,MSd2,MSu,              & 
& MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,cplChiFvUSvReL,     & 
& cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,cplSeUSvRecVWm,            & 
& cplSvImUSvReVZ,cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,               & 
& cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,        & 
& cplUSvReUSvReSvReSvRe,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,delta,mass,               & 
& mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MAh(3),MAh2(3),MSvRe(9),MSvRe2(9),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(9),MFv2(9),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Real(dp), Intent(in) :: g1,g2,vd,vu,vS

Complex(dp), Intent(in) :: MUX(3,3),BMUX(3,3),lam,kap,lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ml2(3,3),               & 
& mv2(3,3),mx2(3,3)

Complex(dp), Intent(in) :: cplAhSvImUSvRe(3,9,9),cplAhUSvReSvRe(3,9,9),cplcFeChaUSvReL(3,2,9),cplcFeChaUSvReR(3,2,9),& 
& cplChiFvUSvReL(5,9,9),cplChiFvUSvReR(5,9,9),cplhhSvImUSvRe(3,9,9),cplhhUSvReSvRe(3,9,9),& 
& cplHpmUSvRecSe(2,9,6),cplSeUSvRecVWm(6,9),cplSvImUSvReVZ(9,9),cplAhAhUSvReUSvRe(3,3,9,9),& 
& cplhhhhUSvReUSvRe(3,3,9,9),cplHpmUSvReUSvRecHpm(2,9,9,2),cplSdUSvReUSvRecSd(6,9,9,6),  & 
& cplSeUSvReUSvRecSe(6,9,9,6),cplSuUSvReUSvRecSu(6,9,9,6),cplSvImSvImUSvReUSvRe(9,9,9,9),& 
& cplUSvReUSvReSvReSvRe(9,9,9,9),cplUSvReUSvRecVWmVWm(9,9),cplUSvReUSvReVZVZ(9,9)

Complex(dp) :: mat2a(9,9), mat2(9,9),  PiSf(9,9,9)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(9), test_m2(9),p2, test(9) 
Real(dp), Intent(out) :: mass(9), mass2(9) 
Complex(dp), Intent(out) ::  RS(9,9) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSvRe'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+ml2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+ml2(1,2)/2._dp
mat2a(1,2) = mat2a(1,2)+ml2(2,1)/2._dp
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,2))/4._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+ml2(1,3)/2._dp
mat2a(1,3) = mat2a(1,3)+ml2(3,1)/2._dp
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,3))/4._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-(vd*vS*lam*Conjg(Yv(1,1)))/4._dp
mat2a(1,4) = mat2a(1,4)+(vu*Conjg(Tv(1,1)))/(2._dp*sqrt(2._dp))
mat2a(1,4) = mat2a(1,4)-(vd*vS*Conjg(lam)*Yv(1,1))/4._dp
mat2a(1,4) = mat2a(1,4)+(vu*Tv(1,1))/(2._dp*sqrt(2._dp))
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-(vd*vS*lam*Conjg(Yv(2,1)))/4._dp
mat2a(1,5) = mat2a(1,5)+(vu*Conjg(Tv(2,1)))/(2._dp*sqrt(2._dp))
mat2a(1,5) = mat2a(1,5)-(vd*vS*Conjg(lam)*Yv(2,1))/4._dp
mat2a(1,5) = mat2a(1,5)+(vu*Tv(2,1))/(2._dp*sqrt(2._dp))
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-(vd*vS*lam*Conjg(Yv(3,1)))/4._dp
mat2a(1,6) = mat2a(1,6)+(vu*Conjg(Tv(3,1)))/(2._dp*sqrt(2._dp))
mat2a(1,6) = mat2a(1,6)-(vd*vS*Conjg(lam)*Yv(3,1))/4._dp
mat2a(1,6) = mat2a(1,6)+(vu*Tv(3,1))/(2._dp*sqrt(2._dp))
mat2a(1,7) = 0._dp 
Do j1 = 1,3
mat2a(1,7) = mat2a(1,7)+(vS*vu*Conjg(lamN(j1,1))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,7) = mat2a(1,7)+(vS*vu*Conjg(Yv(j1,1))*lamN(j1,1))/4._dp
End Do 
mat2a(1,8) = 0._dp 
Do j1 = 1,3
mat2a(1,8) = mat2a(1,8)+(vS*vu*Conjg(lamN(j1,2))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,8) = mat2a(1,8)+(vS*vu*Conjg(Yv(j1,1))*lamN(j1,2))/4._dp
End Do 
mat2a(1,9) = 0._dp 
Do j1 = 1,3
mat2a(1,9) = mat2a(1,9)+(vS*vu*Conjg(lamN(j1,3))*Yv(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(1,9) = mat2a(1,9)+(vS*vu*Conjg(Yv(j1,1))*lamN(j1,3))/4._dp
End Do 
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+ml2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+ml2(2,3)/2._dp
mat2a(2,3) = mat2a(2,3)+ml2(3,2)/2._dp
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,3))/4._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-(vd*vS*lam*Conjg(Yv(1,2)))/4._dp
mat2a(2,4) = mat2a(2,4)+(vu*Conjg(Tv(1,2)))/(2._dp*sqrt(2._dp))
mat2a(2,4) = mat2a(2,4)-(vd*vS*Conjg(lam)*Yv(1,2))/4._dp
mat2a(2,4) = mat2a(2,4)+(vu*Tv(1,2))/(2._dp*sqrt(2._dp))
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-(vd*vS*lam*Conjg(Yv(2,2)))/4._dp
mat2a(2,5) = mat2a(2,5)+(vu*Conjg(Tv(2,2)))/(2._dp*sqrt(2._dp))
mat2a(2,5) = mat2a(2,5)-(vd*vS*Conjg(lam)*Yv(2,2))/4._dp
mat2a(2,5) = mat2a(2,5)+(vu*Tv(2,2))/(2._dp*sqrt(2._dp))
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-(vd*vS*lam*Conjg(Yv(3,2)))/4._dp
mat2a(2,6) = mat2a(2,6)+(vu*Conjg(Tv(3,2)))/(2._dp*sqrt(2._dp))
mat2a(2,6) = mat2a(2,6)-(vd*vS*Conjg(lam)*Yv(3,2))/4._dp
mat2a(2,6) = mat2a(2,6)+(vu*Tv(3,2))/(2._dp*sqrt(2._dp))
mat2a(2,7) = 0._dp 
Do j1 = 1,3
mat2a(2,7) = mat2a(2,7)+(vS*vu*Conjg(lamN(j1,1))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,7) = mat2a(2,7)+(vS*vu*Conjg(Yv(j1,2))*lamN(j1,1))/4._dp
End Do 
mat2a(2,8) = 0._dp 
Do j1 = 1,3
mat2a(2,8) = mat2a(2,8)+(vS*vu*Conjg(lamN(j1,2))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,8) = mat2a(2,8)+(vS*vu*Conjg(Yv(j1,2))*lamN(j1,2))/4._dp
End Do 
mat2a(2,9) = 0._dp 
Do j1 = 1,3
mat2a(2,9) = mat2a(2,9)+(vS*vu*Conjg(lamN(j1,3))*Yv(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(2,9) = mat2a(2,9)+(vS*vu*Conjg(Yv(j1,2))*lamN(j1,3))/4._dp
End Do 
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+(g1**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g1**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+ml2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(vd*vS*lam*Conjg(Yv(1,3)))/4._dp
mat2a(3,4) = mat2a(3,4)+(vu*Conjg(Tv(1,3)))/(2._dp*sqrt(2._dp))
mat2a(3,4) = mat2a(3,4)-(vd*vS*Conjg(lam)*Yv(1,3))/4._dp
mat2a(3,4) = mat2a(3,4)+(vu*Tv(1,3))/(2._dp*sqrt(2._dp))
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-(vd*vS*lam*Conjg(Yv(2,3)))/4._dp
mat2a(3,5) = mat2a(3,5)+(vu*Conjg(Tv(2,3)))/(2._dp*sqrt(2._dp))
mat2a(3,5) = mat2a(3,5)-(vd*vS*Conjg(lam)*Yv(2,3))/4._dp
mat2a(3,5) = mat2a(3,5)+(vu*Tv(2,3))/(2._dp*sqrt(2._dp))
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-(vd*vS*lam*Conjg(Yv(3,3)))/4._dp
mat2a(3,6) = mat2a(3,6)+(vu*Conjg(Tv(3,3)))/(2._dp*sqrt(2._dp))
mat2a(3,6) = mat2a(3,6)-(vd*vS*Conjg(lam)*Yv(3,3))/4._dp
mat2a(3,6) = mat2a(3,6)+(vu*Tv(3,3))/(2._dp*sqrt(2._dp))
mat2a(3,7) = 0._dp 
Do j1 = 1,3
mat2a(3,7) = mat2a(3,7)+(vS*vu*Conjg(lamN(j1,1))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,7) = mat2a(3,7)+(vS*vu*Conjg(Yv(j1,3))*lamN(j1,1))/4._dp
End Do 
mat2a(3,8) = 0._dp 
Do j1 = 1,3
mat2a(3,8) = mat2a(3,8)+(vS*vu*Conjg(lamN(j1,2))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,8) = mat2a(3,8)+(vS*vu*Conjg(Yv(j1,3))*lamN(j1,2))/4._dp
End Do 
mat2a(3,9) = 0._dp 
Do j1 = 1,3
mat2a(3,9) = mat2a(3,9)+(vS*vu*Conjg(lamN(j1,3))*Yv(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(3,9) = mat2a(3,9)+(vS*vu*Conjg(Yv(j1,3))*lamN(j1,3))/4._dp
End Do 
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)+mv2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vu**2*Conjg(Yv(1,j1))*Yv(1,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vS**2*Conjg(lamN(1,j1))*lamN(1,j1))/2._dp
End Do 
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)+mv2(1,2)/2._dp
mat2a(4,5) = mat2a(4,5)+mv2(2,1)/2._dp
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yv(2,j1))*Yv(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yv(1,j1))*Yv(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vS**2*Conjg(lamN(2,j1))*lamN(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vS**2*Conjg(lamN(1,j1))*lamN(2,j1))/4._dp
End Do 
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)+mv2(1,3)/2._dp
mat2a(4,6) = mat2a(4,6)+mv2(3,1)/2._dp
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yv(3,j1))*Yv(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yv(1,j1))*Yv(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vS**2*Conjg(lamN(3,j1))*lamN(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vS**2*Conjg(lamN(1,j1))*lamN(3,j1))/4._dp
End Do 
mat2a(4,7) = 0._dp 
mat2a(4,7) = mat2a(4,7)+(vS**2*kap*Conjg(lamN(1,1)))/4._dp
mat2a(4,7) = mat2a(4,7)-(vd*vu*lam*Conjg(lamN(1,1)))/4._dp
mat2a(4,7) = mat2a(4,7)+(vS*Conjg(TLN(1,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(4,7) = mat2a(4,7)+(vS*Conjg(lamN(1,j1))*MUX(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,7) = mat2a(4,7)+(vS*Conjg(lamN(1,j1))*MUX(j1,1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,7) = mat2a(4,7)+(vS*Conjg(MUX(1,j1))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,7) = mat2a(4,7)+(vS*Conjg(MUX(j1,1))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(4,7) = mat2a(4,7)+(vS**2*Conjg(kap)*lamN(1,1))/4._dp
mat2a(4,7) = mat2a(4,7)-(vd*vu*Conjg(lam)*lamN(1,1))/4._dp
mat2a(4,7) = mat2a(4,7)+(vS*TLN(1,1))/(2._dp*sqrt(2._dp))
mat2a(4,8) = 0._dp 
mat2a(4,8) = mat2a(4,8)+(vS**2*kap*Conjg(lamN(1,2)))/4._dp
mat2a(4,8) = mat2a(4,8)-(vd*vu*lam*Conjg(lamN(1,2)))/4._dp
mat2a(4,8) = mat2a(4,8)+(vS*Conjg(TLN(1,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(4,8) = mat2a(4,8)+(vS*Conjg(lamN(1,j1))*MUX(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,8) = mat2a(4,8)+(vS*Conjg(lamN(1,j1))*MUX(j1,2))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,8) = mat2a(4,8)+(vS*Conjg(MUX(2,j1))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,8) = mat2a(4,8)+(vS*Conjg(MUX(j1,2))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(4,8) = mat2a(4,8)+(vS**2*Conjg(kap)*lamN(1,2))/4._dp
mat2a(4,8) = mat2a(4,8)-(vd*vu*Conjg(lam)*lamN(1,2))/4._dp
mat2a(4,8) = mat2a(4,8)+(vS*TLN(1,2))/(2._dp*sqrt(2._dp))
mat2a(4,9) = 0._dp 
mat2a(4,9) = mat2a(4,9)+(vS**2*kap*Conjg(lamN(1,3)))/4._dp
mat2a(4,9) = mat2a(4,9)-(vd*vu*lam*Conjg(lamN(1,3)))/4._dp
mat2a(4,9) = mat2a(4,9)+(vS*Conjg(TLN(1,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(4,9) = mat2a(4,9)+(vS*Conjg(lamN(1,j1))*MUX(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,9) = mat2a(4,9)+(vS*Conjg(lamN(1,j1))*MUX(j1,3))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,9) = mat2a(4,9)+(vS*Conjg(MUX(3,j1))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(4,9) = mat2a(4,9)+(vS*Conjg(MUX(j1,3))*lamN(1,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(4,9) = mat2a(4,9)+(vS**2*Conjg(kap)*lamN(1,3))/4._dp
mat2a(4,9) = mat2a(4,9)-(vd*vu*Conjg(lam)*lamN(1,3))/4._dp
mat2a(4,9) = mat2a(4,9)+(vS*TLN(1,3))/(2._dp*sqrt(2._dp))
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)+mv2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vu**2*Conjg(Yv(2,j1))*Yv(2,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vS**2*Conjg(lamN(2,j1))*lamN(2,j1))/2._dp
End Do 
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)+mv2(2,3)/2._dp
mat2a(5,6) = mat2a(5,6)+mv2(3,2)/2._dp
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yv(3,j1))*Yv(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yv(2,j1))*Yv(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vS**2*Conjg(lamN(3,j1))*lamN(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vS**2*Conjg(lamN(2,j1))*lamN(3,j1))/4._dp
End Do 
mat2a(5,7) = 0._dp 
mat2a(5,7) = mat2a(5,7)+(vS**2*kap*Conjg(lamN(2,1)))/4._dp
mat2a(5,7) = mat2a(5,7)-(vd*vu*lam*Conjg(lamN(2,1)))/4._dp
mat2a(5,7) = mat2a(5,7)+(vS*Conjg(TLN(2,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(5,7) = mat2a(5,7)+(vS*Conjg(lamN(2,j1))*MUX(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,7) = mat2a(5,7)+(vS*Conjg(lamN(2,j1))*MUX(j1,1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,7) = mat2a(5,7)+(vS*Conjg(MUX(1,j1))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,7) = mat2a(5,7)+(vS*Conjg(MUX(j1,1))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(5,7) = mat2a(5,7)+(vS**2*Conjg(kap)*lamN(2,1))/4._dp
mat2a(5,7) = mat2a(5,7)-(vd*vu*Conjg(lam)*lamN(2,1))/4._dp
mat2a(5,7) = mat2a(5,7)+(vS*TLN(2,1))/(2._dp*sqrt(2._dp))
mat2a(5,8) = 0._dp 
mat2a(5,8) = mat2a(5,8)+(vS**2*kap*Conjg(lamN(2,2)))/4._dp
mat2a(5,8) = mat2a(5,8)-(vd*vu*lam*Conjg(lamN(2,2)))/4._dp
mat2a(5,8) = mat2a(5,8)+(vS*Conjg(TLN(2,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(5,8) = mat2a(5,8)+(vS*Conjg(lamN(2,j1))*MUX(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,8) = mat2a(5,8)+(vS*Conjg(lamN(2,j1))*MUX(j1,2))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,8) = mat2a(5,8)+(vS*Conjg(MUX(2,j1))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,8) = mat2a(5,8)+(vS*Conjg(MUX(j1,2))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(5,8) = mat2a(5,8)+(vS**2*Conjg(kap)*lamN(2,2))/4._dp
mat2a(5,8) = mat2a(5,8)-(vd*vu*Conjg(lam)*lamN(2,2))/4._dp
mat2a(5,8) = mat2a(5,8)+(vS*TLN(2,2))/(2._dp*sqrt(2._dp))
mat2a(5,9) = 0._dp 
mat2a(5,9) = mat2a(5,9)+(vS**2*kap*Conjg(lamN(2,3)))/4._dp
mat2a(5,9) = mat2a(5,9)-(vd*vu*lam*Conjg(lamN(2,3)))/4._dp
mat2a(5,9) = mat2a(5,9)+(vS*Conjg(TLN(2,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(5,9) = mat2a(5,9)+(vS*Conjg(lamN(2,j1))*MUX(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,9) = mat2a(5,9)+(vS*Conjg(lamN(2,j1))*MUX(j1,3))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,9) = mat2a(5,9)+(vS*Conjg(MUX(3,j1))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(5,9) = mat2a(5,9)+(vS*Conjg(MUX(j1,3))*lamN(2,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(5,9) = mat2a(5,9)+(vS**2*Conjg(kap)*lamN(2,3))/4._dp
mat2a(5,9) = mat2a(5,9)-(vd*vu*Conjg(lam)*lamN(2,3))/4._dp
mat2a(5,9) = mat2a(5,9)+(vS*TLN(2,3))/(2._dp*sqrt(2._dp))
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)+mv2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vu**2*Conjg(Yv(3,j1))*Yv(3,j1))/2._dp
End Do 
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vS**2*Conjg(lamN(3,j1))*lamN(3,j1))/2._dp
End Do 
mat2a(6,7) = 0._dp 
mat2a(6,7) = mat2a(6,7)+(vS**2*kap*Conjg(lamN(3,1)))/4._dp
mat2a(6,7) = mat2a(6,7)-(vd*vu*lam*Conjg(lamN(3,1)))/4._dp
mat2a(6,7) = mat2a(6,7)+(vS*Conjg(TLN(3,1)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(6,7) = mat2a(6,7)+(vS*Conjg(lamN(3,j1))*MUX(1,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,7) = mat2a(6,7)+(vS*Conjg(lamN(3,j1))*MUX(j1,1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,7) = mat2a(6,7)+(vS*Conjg(MUX(1,j1))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,7) = mat2a(6,7)+(vS*Conjg(MUX(j1,1))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(6,7) = mat2a(6,7)+(vS**2*Conjg(kap)*lamN(3,1))/4._dp
mat2a(6,7) = mat2a(6,7)-(vd*vu*Conjg(lam)*lamN(3,1))/4._dp
mat2a(6,7) = mat2a(6,7)+(vS*TLN(3,1))/(2._dp*sqrt(2._dp))
mat2a(6,8) = 0._dp 
mat2a(6,8) = mat2a(6,8)+(vS**2*kap*Conjg(lamN(3,2)))/4._dp
mat2a(6,8) = mat2a(6,8)-(vd*vu*lam*Conjg(lamN(3,2)))/4._dp
mat2a(6,8) = mat2a(6,8)+(vS*Conjg(TLN(3,2)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(6,8) = mat2a(6,8)+(vS*Conjg(lamN(3,j1))*MUX(2,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,8) = mat2a(6,8)+(vS*Conjg(lamN(3,j1))*MUX(j1,2))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,8) = mat2a(6,8)+(vS*Conjg(MUX(2,j1))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,8) = mat2a(6,8)+(vS*Conjg(MUX(j1,2))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(6,8) = mat2a(6,8)+(vS**2*Conjg(kap)*lamN(3,2))/4._dp
mat2a(6,8) = mat2a(6,8)-(vd*vu*Conjg(lam)*lamN(3,2))/4._dp
mat2a(6,8) = mat2a(6,8)+(vS*TLN(3,2))/(2._dp*sqrt(2._dp))
mat2a(6,9) = 0._dp 
mat2a(6,9) = mat2a(6,9)+(vS**2*kap*Conjg(lamN(3,3)))/4._dp
mat2a(6,9) = mat2a(6,9)-(vd*vu*lam*Conjg(lamN(3,3)))/4._dp
mat2a(6,9) = mat2a(6,9)+(vS*Conjg(TLN(3,3)))/(2._dp*sqrt(2._dp))
Do j1 = 1,3
mat2a(6,9) = mat2a(6,9)+(vS*Conjg(lamN(3,j1))*MUX(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,9) = mat2a(6,9)+(vS*Conjg(lamN(3,j1))*MUX(j1,3))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,9) = mat2a(6,9)+(vS*Conjg(MUX(3,j1))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat2a(6,9) = mat2a(6,9)+(vS*Conjg(MUX(j1,3))*lamN(3,j1))/(4._dp*sqrt(2._dp))
End Do 
mat2a(6,9) = mat2a(6,9)+(vS**2*Conjg(kap)*lamN(3,3))/4._dp
mat2a(6,9) = mat2a(6,9)-(vd*vu*Conjg(lam)*lamN(3,3))/4._dp
mat2a(6,9) = mat2a(6,9)+(vS*TLN(3,3))/(2._dp*sqrt(2._dp))
mat2a(7,7) = 0._dp 
mat2a(7,7) = mat2a(7,7)+Conjg(BMUX(1,1))/2._dp
mat2a(7,7) = mat2a(7,7)+mx2(1,1)
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(Conjg(MUX(1,j1))*MUX(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(Conjg(MUX(j1,1))*MUX(1,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(Conjg(MUX(1,j1))*MUX(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(Conjg(MUX(j1,1))*MUX(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,7) = mat2a(7,7)+(vS**2*Conjg(lamN(j1,1))*lamN(j1,1))/2._dp
End Do 
mat2a(7,7) = mat2a(7,7)+BMUX(1,1)/2._dp
mat2a(7,8) = 0._dp 
mat2a(7,8) = mat2a(7,8)+Conjg(BMUX(1,2))/4._dp
mat2a(7,8) = mat2a(7,8)+Conjg(BMUX(2,1))/4._dp
mat2a(7,8) = mat2a(7,8)+mx2(1,2)/2._dp
mat2a(7,8) = mat2a(7,8)+mx2(2,1)/2._dp
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(2,j1))*MUX(1,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(j1,2))*MUX(1,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(1,j1))*MUX(2,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(j1,1))*MUX(2,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(2,j1))*MUX(j1,1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(j1,2))*MUX(j1,1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(1,j1))*MUX(j1,2))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(Conjg(MUX(j1,1))*MUX(j1,2))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(vS**2*Conjg(lamN(j1,2))*lamN(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,8) = mat2a(7,8)+(vS**2*Conjg(lamN(j1,1))*lamN(j1,2))/4._dp
End Do 
mat2a(7,8) = mat2a(7,8)+BMUX(1,2)/4._dp
mat2a(7,8) = mat2a(7,8)+BMUX(2,1)/4._dp
mat2a(7,9) = 0._dp 
mat2a(7,9) = mat2a(7,9)+Conjg(BMUX(1,3))/4._dp
mat2a(7,9) = mat2a(7,9)+Conjg(BMUX(3,1))/4._dp
mat2a(7,9) = mat2a(7,9)+mx2(1,3)/2._dp
mat2a(7,9) = mat2a(7,9)+mx2(3,1)/2._dp
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(3,j1))*MUX(1,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(j1,3))*MUX(1,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(1,j1))*MUX(3,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(j1,1))*MUX(3,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(3,j1))*MUX(j1,1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(j1,3))*MUX(j1,1))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(1,j1))*MUX(j1,3))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(Conjg(MUX(j1,1))*MUX(j1,3))/8._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(vS**2*Conjg(lamN(j1,3))*lamN(j1,1))/4._dp
End Do 
Do j1 = 1,3
mat2a(7,9) = mat2a(7,9)+(vS**2*Conjg(lamN(j1,1))*lamN(j1,3))/4._dp
End Do 
mat2a(7,9) = mat2a(7,9)+BMUX(1,3)/4._dp
mat2a(7,9) = mat2a(7,9)+BMUX(3,1)/4._dp
mat2a(8,8) = 0._dp 
mat2a(8,8) = mat2a(8,8)+Conjg(BMUX(2,2))/2._dp
mat2a(8,8) = mat2a(8,8)+mx2(2,2)
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(Conjg(MUX(2,j1))*MUX(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(Conjg(MUX(j1,2))*MUX(2,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(Conjg(MUX(2,j1))*MUX(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(Conjg(MUX(j1,2))*MUX(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,8) = mat2a(8,8)+(vS**2*Conjg(lamN(j1,2))*lamN(j1,2))/2._dp
End Do 
mat2a(8,8) = mat2a(8,8)+BMUX(2,2)/2._dp
mat2a(8,9) = 0._dp 
mat2a(8,9) = mat2a(8,9)+Conjg(BMUX(2,3))/4._dp
mat2a(8,9) = mat2a(8,9)+Conjg(BMUX(3,2))/4._dp
mat2a(8,9) = mat2a(8,9)+mx2(2,3)/2._dp
mat2a(8,9) = mat2a(8,9)+mx2(3,2)/2._dp
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(3,j1))*MUX(2,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(j1,3))*MUX(2,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(2,j1))*MUX(3,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(j1,2))*MUX(3,j1))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(3,j1))*MUX(j1,2))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(j1,3))*MUX(j1,2))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(2,j1))*MUX(j1,3))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(Conjg(MUX(j1,2))*MUX(j1,3))/8._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(vS**2*Conjg(lamN(j1,3))*lamN(j1,2))/4._dp
End Do 
Do j1 = 1,3
mat2a(8,9) = mat2a(8,9)+(vS**2*Conjg(lamN(j1,2))*lamN(j1,3))/4._dp
End Do 
mat2a(8,9) = mat2a(8,9)+BMUX(2,3)/4._dp
mat2a(8,9) = mat2a(8,9)+BMUX(3,2)/4._dp
mat2a(9,9) = 0._dp 
mat2a(9,9) = mat2a(9,9)+Conjg(BMUX(3,3))/2._dp
mat2a(9,9) = mat2a(9,9)+mx2(3,3)
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(Conjg(MUX(3,j1))*MUX(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(Conjg(MUX(j1,3))*MUX(3,j1))/4._dp
End Do 
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(Conjg(MUX(3,j1))*MUX(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(Conjg(MUX(j1,3))*MUX(j1,3))/4._dp
End Do 
Do j1 = 1,3
mat2a(9,9) = mat2a(9,9)+(vS**2*Conjg(lamN(j1,3))*lamN(j1,3))/2._dp
End Do 
mat2a(9,9) = mat2a(9,9)+BMUX(3,3)/2._dp

 
 Do i1=2,9
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,              & 
& MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,           & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVZ,cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,& 
& cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,        & 
& cplUSvReUSvReSvReSvRe,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZVROS_0 = RS 
 
 
! Now with momenta 
Do i1=1,9
PiSf(i1,:,:) = ZeroC 
p2 = MSvRe2(i1)
Call Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,              & 
& MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,           & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVZ,cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,& 
& cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,        & 
& cplUSvReUSvReSvReSvRe,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=9,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,9
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,9
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,              & 
& MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,           & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVZ,cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,& 
& cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,        & 
& cplUSvReUSvReSvReSvRe,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=9,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZVROS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,9
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSvRe
 
 
Subroutine Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,           & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MSd,MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,       & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVZ,cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,& 
& cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,        & 
& cplUSvReUSvReSvReSvRe,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MAh(3),MAh2(3),MSvRe(9),MSvRe2(9),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(9),MFv2(9),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSvImUSvRe(3,9,9),cplAhUSvReSvRe(3,9,9),cplcFeChaUSvReL(3,2,9),cplcFeChaUSvReR(3,2,9),& 
& cplChiFvUSvReL(5,9,9),cplChiFvUSvReR(5,9,9),cplhhSvImUSvRe(3,9,9),cplhhUSvReSvRe(3,9,9),& 
& cplHpmUSvRecSe(2,9,6),cplSeUSvRecVWm(6,9),cplSvImUSvReVZ(9,9),cplAhAhUSvReUSvRe(3,3,9,9),& 
& cplhhhhUSvReUSvRe(3,3,9,9),cplHpmUSvReUSvRecHpm(2,9,9,2),cplSdUSvReUSvRecSd(6,9,9,6),  & 
& cplSeUSvReUSvRecSe(6,9,9,6),cplSuUSvReUSvRecSu(6,9,9,6),cplSvImSvImUSvReUSvRe(9,9,9,9),& 
& cplUSvReUSvReSvReSvRe(9,9,9,9),cplUSvReUSvRecVWmVWm(9,9),cplUSvReUSvReVZVZ(9,9)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(9,9) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(9,9) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! SvIm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhSvImUSvRe(i2,i1,gO1)
coup2 = Conjg(cplAhSvImUSvRe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhUSvReSvRe(i2,gO1,i1)
coup2 = Conjg(cplAhUSvReSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MCha(i2)*Real(SA_B0(p2,MFe2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coupL1 = cplcFeChaUSvReL(i1,i2,gO1)
coupR1 = cplcFeChaUSvReR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeChaUSvReL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeChaUSvReR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 5
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*Real(SA_B0(p2,MFv2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coupL1 = cplChiFvUSvReL(i2,i1,gO1)
coupR1 = cplChiFvUSvReR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFvUSvReL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFvUSvReR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhSvImUSvRe(i2,i1,gO1)
coup2 = Conjg(cplhhSvImUSvRe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhUSvReSvRe(i2,gO1,i1)
coup2 = Conjg(cplhhUSvReSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplHpmUSvRecSe(i2,gO1,i1)
coup2 = Conjg(cplHpmUSvRecSe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSe2(i2),MVWm2) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSeUSvRecVWm(i2,gO1)
coup2 =  Conjg(cplSeUSvRecVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VZ, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 9
 F0m2 = FloopRXi(p2,MSvIm2(i2),MVZ2) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSvImUSvReVZ(i2,gO1)
coup2 =  Conjg(cplSvImUSvReVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhAhUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhhhUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplHpmUSvReUSvRecHpm(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSdUSvReUSvRecSd(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSeUSvReUSvRecSe(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSuUSvReUSvRecSu(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSvImSvImUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvReUSvReSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvReUSvRecVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvReUSvReVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 9
  Do gO1 = gO2+1, 9
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSvRe 
 
Subroutine DerPi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,             & 
& MCha,MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,            & 
& MVZ2,MSd,MSd2,MSu,MSu2,cplAhSvImUSvRe,cplAhUSvReSvRe,cplcFeChaUSvReL,cplcFeChaUSvReR,  & 
& cplChiFvUSvReL,cplChiFvUSvReR,cplhhSvImUSvRe,cplhhUSvReSvRe,cplHpmUSvRecSe,            & 
& cplSeUSvRecVWm,cplSvImUSvReVZ,cplAhAhUSvReUSvRe,cplhhhhUSvReUSvRe,cplHpmUSvReUSvRecHpm,& 
& cplSdUSvReUSvRecSd,cplSeUSvReUSvRecSe,cplSuUSvReUSvRecSu,cplSvImSvImUSvReUSvRe,        & 
& cplUSvReUSvReSvReSvRe,cplUSvReUSvRecVWmVWm,cplUSvReUSvReVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSvIm(9),MSvIm2(9),MAh(3),MAh2(3),MSvRe(9),MSvRe2(9),MFe(3),MFe2(3),MCha(2),          & 
& MCha2(2),MFv(9),MFv2(9),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MSe(6),MSe2(6),MHpm(2),        & 
& MHpm2(2),MVWm,MVWm2,MVZ,MVZ2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSvImUSvRe(3,9,9),cplAhUSvReSvRe(3,9,9),cplcFeChaUSvReL(3,2,9),cplcFeChaUSvReR(3,2,9),& 
& cplChiFvUSvReL(5,9,9),cplChiFvUSvReR(5,9,9),cplhhSvImUSvRe(3,9,9),cplhhUSvReSvRe(3,9,9),& 
& cplHpmUSvRecSe(2,9,6),cplSeUSvRecVWm(6,9),cplSvImUSvReVZ(9,9),cplAhAhUSvReUSvRe(3,3,9,9),& 
& cplhhhhUSvReUSvRe(3,3,9,9),cplHpmUSvReUSvRecHpm(2,9,9,2),cplSdUSvReUSvRecSd(6,9,9,6),  & 
& cplSeUSvReUSvRecSe(6,9,9,6),cplSuUSvReUSvRecSu(6,9,9,6),cplSvImSvImUSvReUSvRe(9,9,9,9),& 
& cplUSvReUSvReSvReSvRe(9,9,9,9),cplUSvReUSvRecVWmVWm(9,9),cplUSvReUSvReVZVZ(9,9)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(9,9) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(9,9) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! SvIm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhSvImUSvRe(i2,i1,gO1)
coup2 = Conjg(cplAhSvImUSvRe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhUSvReSvRe(i2,gO1,i1)
coup2 = Conjg(cplAhUSvReSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MCha(i2)*Real(SA_DerB0(p2,MFe2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coupL1 = cplcFeChaUSvReL(i1,i2,gO1)
coupR1 = cplcFeChaUSvReR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeChaUSvReL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeChaUSvReR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 5
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*Real(SA_DerB0(p2,MFv2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coupL1 = cplChiFvUSvReL(i2,i1,gO1)
coupR1 = cplChiFvUSvReR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFvUSvReL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFvUSvReR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhSvImUSvRe(i2,i1,gO1)
coup2 = Conjg(cplhhSvImUSvRe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhUSvReSvRe(i2,gO1,i1)
coup2 = Conjg(cplhhUSvReSvRe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplHpmUSvRecSe(i2,gO1,i1)
coup2 = Conjg(cplHpmUSvRecSe(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSe2(i2),MVWm2) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSeUSvRecVWm(i2,gO1)
coup2 =  Conjg(cplSeUSvRecVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VZ, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 9
 F0m2 = DerFloopRXi(p2,MSvIm2(i2),MVZ2) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSvImUSvReVZ(i2,gO1)
coup2 =  Conjg(cplSvImUSvReVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplAhAhUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplhhhhUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplHpmUSvReUSvRecHpm(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSdUSvReUSvRecSd(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSeUSvReUSvRecSe(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSuUSvReUSvRecSu(i1,gO1,gO2,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplSvImSvImUSvReUSvRe(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvReUSvReSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvReUSvRecVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 9
  Do gO2 = gO1, 9
coup1 = cplUSvReUSvReVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 9
  Do gO1 = gO2+1, 9
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSvRe 
 
Subroutine OneLoopSu(g1,g2,lam,Yu,Tu,mq2,mu2,vd,vu,vS,MSu,MSu2,MAh,MAh2,              & 
& MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,            & 
& MSd2,MVWm,MVWm2,MVZ,MVZ2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,               & 
& cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,               & 
& cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,         & 
& cplSucUSuVZ,cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,           & 
& cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu,cplUSucUSuVGVG,  & 
& cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSu(6),MSu2(6),MAh(3),MAh2(3),MFu(3),MFu2(3),MChi(5),MChi2(5),MCha(2),MCha2(2),       & 
& MFd(3),MFd2(3),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),              & 
& MVWm,MVWm2,MVZ,MVZ2,MSe(6),MSe2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9)

Real(dp), Intent(in) :: g1,g2,vd,vu,vS

Complex(dp), Intent(in) :: lam,Yu(3,3),Tu(3,3),mq2(3,3),mu2(3,3)

Complex(dp), Intent(in) :: cplAhSucUSu(3,6,6),cplChiFucUSuL(5,3,6),cplChiFucUSuR(5,3,6),cplcChaFdcUSuL(2,3,6),   & 
& cplcChaFdcUSuR(2,3,6),cplGluFucUSuL(3,6),cplGluFucUSuR(3,6),cplhhSucUSu(3,6,6),        & 
& cplSdcHpmcUSu(6,2,6),cplSdcUSucVWm(6,6),cplSucUSuVG(6,6),cplSucUSuVP(6,6),             & 
& cplSucUSuVZ(6,6),cplAhAhUSucUSu(3,3,6,6),cplhhhhUSucUSu(3,3,6,6),cplHpmUSucHpmcUSu(2,6,2,6),& 
& cplSdUSucSdcUSu(6,6,6,6),cplSeUSucSecUSu(6,6,6,6),cplUSuSucUSucSu(6,6,6,6),            & 
& cplUSuSvImSvImcUSu(6,9,9,6),cplUSuSvReSvRecUSu(6,9,9,6),cplUSucUSuVGVG(6,6),           & 
& cplUSucUSuVPVP(6,6),cplUSucUSucVWmVWm(6,6),cplUSucUSuVZVZ(6,6)

Complex(dp) :: mat2a(6,6), mat2(6,6),  PiSf(6,6,6)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2, test(6) 
Real(dp), Intent(out) :: mass(6), mass2(6) 
Complex(dp), Intent(out) ::  RS(6,6) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSu'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-(g1**2*vd**2)/24._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*vu**2)/24._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+mq2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+mq2(1,2)
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,2))/2._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+mq2(1,3)
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,3))/2._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-(vd*vS*lam*Conjg(Yu(1,1)))/2._dp
mat2a(1,4) = mat2a(1,4)+(vu*Conjg(Tu(1,1)))/sqrt(2._dp)
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-(vd*vS*lam*Conjg(Yu(2,1)))/2._dp
mat2a(1,5) = mat2a(1,5)+(vu*Conjg(Tu(2,1)))/sqrt(2._dp)
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-(vd*vS*lam*Conjg(Yu(3,1)))/2._dp
mat2a(1,6) = mat2a(1,6)+(vu*Conjg(Tu(3,1)))/sqrt(2._dp)
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/24._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2)/24._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+mq2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+mq2(2,3)
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,3))/2._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-(vd*vS*lam*Conjg(Yu(1,2)))/2._dp
mat2a(2,4) = mat2a(2,4)+(vu*Conjg(Tu(1,2)))/sqrt(2._dp)
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-(vd*vS*lam*Conjg(Yu(2,2)))/2._dp
mat2a(2,5) = mat2a(2,5)+(vu*Conjg(Tu(2,2)))/sqrt(2._dp)
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-(vd*vS*lam*Conjg(Yu(3,2)))/2._dp
mat2a(2,6) = mat2a(2,6)+(vu*Conjg(Tu(3,2)))/sqrt(2._dp)
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-(g1**2*vd**2)/24._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g1**2*vu**2)/24._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+mq2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vu**2*Conjg(Yu(j1,3))*Yu(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(vd*vS*lam*Conjg(Yu(1,3)))/2._dp
mat2a(3,4) = mat2a(3,4)+(vu*Conjg(Tu(1,3)))/sqrt(2._dp)
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-(vd*vS*lam*Conjg(Yu(2,3)))/2._dp
mat2a(3,5) = mat2a(3,5)+(vu*Conjg(Tu(2,3)))/sqrt(2._dp)
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-(vd*vS*lam*Conjg(Yu(3,3)))/2._dp
mat2a(3,6) = mat2a(3,6)+(vu*Conjg(Tu(3,3)))/sqrt(2._dp)
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)+(g1**2*vd**2)/6._dp
mat2a(4,4) = mat2a(4,4)-(g1**2*vu**2)/6._dp
mat2a(4,4) = mat2a(4,4)+mu2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vu**2*Conjg(Yu(1,j1))*Yu(1,j1))/2._dp
End Do 
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)+mu2(1,2)
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vu**2*Conjg(Yu(2,j1))*Yu(1,j1))/2._dp
End Do 
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)+mu2(1,3)
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vu**2*Conjg(Yu(3,j1))*Yu(1,j1))/2._dp
End Do 
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)+(g1**2*vd**2)/6._dp
mat2a(5,5) = mat2a(5,5)-(g1**2*vu**2)/6._dp
mat2a(5,5) = mat2a(5,5)+mu2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vu**2*Conjg(Yu(2,j1))*Yu(2,j1))/2._dp
End Do 
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)+mu2(2,3)
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vu**2*Conjg(Yu(3,j1))*Yu(2,j1))/2._dp
End Do 
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)+(g1**2*vd**2)/6._dp
mat2a(6,6) = mat2a(6,6)-(g1**2*vu**2)/6._dp
mat2a(6,6) = mat2a(6,6)+mu2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vu**2*Conjg(Yu(3,j1))*Yu(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,               & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MSe,MSe2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,      & 
& cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,    & 
& cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,   & 
& cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu, & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZUOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 = MSu2(i1)
Call Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,               & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MSe,MSe2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,      & 
& cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,    & 
& cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,   & 
& cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu, & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,6
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,               & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MSe,MSe2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,      & 
& cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,    & 
& cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,   & 
& cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu, & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZUOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,6
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSu
 
 
Subroutine Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,             & 
& MFd,MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MSe,              & 
& MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL, & 
& cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,    & 
& cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,   & 
& cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu, & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSu(6),MSu2(6),MAh(3),MAh2(3),MFu(3),MFu2(3),MChi(5),MChi2(5),MCha(2),MCha2(2),       & 
& MFd(3),MFd2(3),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),              & 
& MVWm,MVWm2,MVZ,MVZ2,MSe(6),MSe2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhSucUSu(3,6,6),cplChiFucUSuL(5,3,6),cplChiFucUSuR(5,3,6),cplcChaFdcUSuL(2,3,6),   & 
& cplcChaFdcUSuR(2,3,6),cplGluFucUSuL(3,6),cplGluFucUSuR(3,6),cplhhSucUSu(3,6,6),        & 
& cplSdcHpmcUSu(6,2,6),cplSdcUSucVWm(6,6),cplSucUSuVG(6,6),cplSucUSuVP(6,6),             & 
& cplSucUSuVZ(6,6),cplAhAhUSucUSu(3,3,6,6),cplhhhhUSucUSu(3,3,6,6),cplHpmUSucHpmcUSu(2,6,2,6),& 
& cplSdUSucSdcUSu(6,6,6,6),cplSeUSucSecUSu(6,6,6,6),cplUSuSucUSucSu(6,6,6,6),            & 
& cplUSuSvImSvImcUSu(6,9,9,6),cplUSuSvReSvRecUSu(6,9,9,6),cplUSucUSuVGVG(6,6),           & 
& cplUSucUSuVPVP(6,6),cplUSucUSucVWmVWm(6,6),cplUSucUSuVZVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Su, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSu2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSucUSu(i2,i1,gO1)
coup2 = Conjg(cplAhSucUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fu, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 5
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MChi(i2)*Real(SA_B0(p2,MFu2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFucUSuL(i2,i1,gO1)
coupR1 = cplChiFucUSuR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFucUSuL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFucUSuR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MCha2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MFd(i2)*Real(SA_B0(p2,MCha2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplcChaFdcUSuL(i1,i2,gO1)
coupR1 = cplcChaFdcUSuR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaFdcUSuL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaFdcUSuR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Glu, Fu 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MGlu2,MFu2(i2)),dp) 
B0m2 = -2._dp*MGlu*MFu(i2)*Real(SA_B0(p2,MGlu2,MFu2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplGluFucUSuL(i2,gO1)
coupR1 = cplGluFucUSuR(i2,gO1)
coupL2 =  Conjg(cplGluFucUSuL(i2,gO2))
coupR2 =  Conjg(cplGluFucUSuR(i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! Su, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSu2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSucUSu(i2,i1,gO1)
coup2 = Conjg(cplhhSucUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcHpmcUSu(i2,i1,gO1)
coup2 = Conjg(cplSdcHpmcUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSd2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSucVWm(i2,gO1)
coup2 =  Conjg(cplSdcUSucVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VG, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSu2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVG(i2,gO1)
coup2 =  Conjg(cplSucUSuVG(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! VP, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSu2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVP(i2,gO1)
coup2 =  Conjg(cplSucUSuVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSu2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVZ(i2,gO1)
coup2 =  Conjg(cplSucUSuVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSucUSu(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSucUSu(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSucHpmcUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSucSdcUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSucSecUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSucUSucSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSvImSvImcUSu(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSvReSvRecUSu(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSucVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSu 
 
Subroutine DerPi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,          & 
& MFd,MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MSe,              & 
& MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucUSu,cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL, & 
& cplcChaFdcUSuR,cplGluFucUSuL,cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,    & 
& cplSucUSuVG,cplSucUSuVP,cplSucUSuVZ,cplAhAhUSucUSu,cplhhhhUSucUSu,cplHpmUSucHpmcUSu,   & 
& cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvImSvImcUSu,cplUSuSvReSvRecUSu, & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSu(6),MSu2(6),MAh(3),MAh2(3),MFu(3),MFu2(3),MChi(5),MChi2(5),MCha(2),MCha2(2),       & 
& MFd(3),MFd2(3),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),MSd2(6),              & 
& MVWm,MVWm2,MVZ,MVZ2,MSe(6),MSe2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhSucUSu(3,6,6),cplChiFucUSuL(5,3,6),cplChiFucUSuR(5,3,6),cplcChaFdcUSuL(2,3,6),   & 
& cplcChaFdcUSuR(2,3,6),cplGluFucUSuL(3,6),cplGluFucUSuR(3,6),cplhhSucUSu(3,6,6),        & 
& cplSdcHpmcUSu(6,2,6),cplSdcUSucVWm(6,6),cplSucUSuVG(6,6),cplSucUSuVP(6,6),             & 
& cplSucUSuVZ(6,6),cplAhAhUSucUSu(3,3,6,6),cplhhhhUSucUSu(3,3,6,6),cplHpmUSucHpmcUSu(2,6,2,6),& 
& cplSdUSucSdcUSu(6,6,6,6),cplSeUSucSecUSu(6,6,6,6),cplUSuSucUSucSu(6,6,6,6),            & 
& cplUSuSvImSvImcUSu(6,9,9,6),cplUSuSvReSvRecUSu(6,9,9,6),cplUSucUSuVGVG(6,6),           & 
& cplUSucUSuVPVP(6,6),cplUSucUSucVWmVWm(6,6),cplUSucUSuVZVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Su, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSucUSu(i2,i1,gO1)
coup2 = Conjg(cplAhSucUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fu, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 5
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MChi(i2)*Real(SA_DerB0(p2,MFu2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFucUSuL(i2,i1,gO1)
coupR1 = cplChiFucUSuR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFucUSuL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFucUSuR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MCha2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MFd(i2)*Real(SA_DerB0(p2,MCha2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplcChaFdcUSuL(i1,i2,gO1)
coupR1 = cplcChaFdcUSuR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaFdcUSuL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaFdcUSuR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Glu, Fu 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MGlu2,MFu2(i2)),dp) 
B0m2 = -2._dp*MGlu*MFu(i2)*Real(SA_DerB0(p2,MGlu2,MFu2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplGluFucUSuL(i2,gO1)
coupR1 = cplGluFucUSuR(i2,gO1)
coupL2 =  Conjg(cplGluFucUSuL(i2,gO2))
coupR2 =  Conjg(cplGluFucUSuR(i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! Su, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSucUSu(i2,i1,gO1)
coup2 = Conjg(cplhhSucUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcHpmcUSu(i2,i1,gO1)
coup2 = Conjg(cplSdcHpmcUSu(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Sd 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSd2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdcUSucVWm(i2,gO1)
coup2 =  Conjg(cplSdcUSucVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VG, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSu2(i2),MVG2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVG(i2,gO1)
coup2 =  Conjg(cplSucUSuVG(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +4._dp/3._dp* SumI  
    End Do 
 !------------------------ 
! VP, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSu2(i2),MVP2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVP(i2,gO1)
coup2 =  Conjg(cplSucUSuVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Su 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSu2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSucUSuVZ(i2,gO1)
coup2 =  Conjg(cplSucUSuVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSucUSu(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSucUSu(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSucHpmcUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSucSdcUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSeUSucSecUSu(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSucUSucSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSvImSvImcUSu(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSuSvReSvRecUSu(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVG2) + 0.25_dp*RXi*SA_DerA0(MVG2*RXi) - 0.5_dp*MVG2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVGVG(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVPVP(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSucVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSucUSuVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSu 
 
Subroutine OneLoopSe(g1,g2,Ye,Te,lam,ml2,me2,vd,vu,vS,MSe,MSe2,MAh,MAh2,              & 
& MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,              & 
& MSvRe,MSvRe2,MVZ,MVZ2,MVWm,MVWm2,MSd,MSd2,MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,          & 
& cplFvChacUSeR,cplChiFecUSeL,cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,   & 
& cplSecUSeVP,cplSecUSeVZ,cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,   & 
& cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,  & 
& cplUSeSvReSvRecUSe,cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,delta,              & 
& mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MSe(6),MSe2(6),MAh(3),MAh2(3),MFv(9),MFv2(9),MCha(2),MCha2(2),MFe(3),MFe2(3),         & 
& MChi(5),MChi2(5),Mhh(3),Mhh2(3),MSvIm(9),MSvIm2(9),MHpm(2),MHpm2(2),MSvRe(9),          & 
& MSvRe2(9),MVZ,MVZ2,MVWm,MVWm2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Real(dp), Intent(in) :: g1,g2,vd,vu,vS

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,ml2(3,3),me2(3,3)

Complex(dp), Intent(in) :: cplAhSecUSe(3,6,6),cplFvChacUSeL(9,2,6),cplFvChacUSeR(9,2,6),cplChiFecUSeL(5,3,6),    & 
& cplChiFecUSeR(5,3,6),cplhhSecUSe(3,6,6),cplHpmSvImcUSe(2,9,6),cplHpmSvRecUSe(2,9,6),   & 
& cplSecUSeVP(6,6),cplSecUSeVZ(6,6),cplSvImcUSeVWm(9,6),cplSvRecUSeVWm(9,6),             & 
& cplAhAhUSecUSe(3,3,6,6),cplhhhhUSecUSe(3,3,6,6),cplHpmUSecHpmcUSe(2,6,2,6),            & 
& cplSdUSecSdcUSe(6,6,6,6),cplUSeSecUSecSe(6,6,6,6),cplUSeSucUSecSu(6,6,6,6),            & 
& cplUSeSvImSvImcUSe(6,9,9,6),cplUSeSvReSvRecUSe(6,9,9,6),cplUSecUSeVPVP(6,6),           & 
& cplUSecUSecVWmVWm(6,6),cplUSecUSeVZVZ(6,6)

Complex(dp) :: mat2a(6,6), mat2(6,6),  PiSf(6,6,6)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2, test(6) 
Real(dp), Intent(out) :: mass(6), mass2(6) 
Complex(dp), Intent(out) ::  RS(6,6) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopSe'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+ml2(1,1)
Do j1 = 1,3
mat2a(1,1) = mat2a(1,1)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,1))/2._dp
End Do 
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+ml2(1,2)
Do j1 = 1,3
mat2a(1,2) = mat2a(1,2)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,2))/2._dp
End Do 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+ml2(1,3)
Do j1 = 1,3
mat2a(1,3) = mat2a(1,3)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,3))/2._dp
End Do 
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-(vS*vu*lam*Conjg(Ye(1,1)))/2._dp
mat2a(1,4) = mat2a(1,4)+(vd*Conjg(Te(1,1)))/sqrt(2._dp)
mat2a(1,5) = 0._dp 
mat2a(1,5) = mat2a(1,5)-(vS*vu*lam*Conjg(Ye(2,1)))/2._dp
mat2a(1,5) = mat2a(1,5)+(vd*Conjg(Te(2,1)))/sqrt(2._dp)
mat2a(1,6) = 0._dp 
mat2a(1,6) = mat2a(1,6)-(vS*vu*lam*Conjg(Ye(3,1)))/2._dp
mat2a(1,6) = mat2a(1,6)+(vd*Conjg(Te(3,1)))/sqrt(2._dp)
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+ml2(2,2)
Do j1 = 1,3
mat2a(2,2) = mat2a(2,2)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,2))/2._dp
End Do 
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+ml2(2,3)
Do j1 = 1,3
mat2a(2,3) = mat2a(2,3)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,3))/2._dp
End Do 
mat2a(2,4) = 0._dp 
mat2a(2,4) = mat2a(2,4)-(vS*vu*lam*Conjg(Ye(1,2)))/2._dp
mat2a(2,4) = mat2a(2,4)+(vd*Conjg(Te(1,2)))/sqrt(2._dp)
mat2a(2,5) = 0._dp 
mat2a(2,5) = mat2a(2,5)-(vS*vu*lam*Conjg(Ye(2,2)))/2._dp
mat2a(2,5) = mat2a(2,5)+(vd*Conjg(Te(2,2)))/sqrt(2._dp)
mat2a(2,6) = 0._dp 
mat2a(2,6) = mat2a(2,6)-(vS*vu*lam*Conjg(Ye(3,2)))/2._dp
mat2a(2,6) = mat2a(2,6)+(vd*Conjg(Te(3,2)))/sqrt(2._dp)
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+(g1**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g2**2*vd**2)/8._dp
mat2a(3,3) = mat2a(3,3)-(g1**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vu**2)/8._dp
mat2a(3,3) = mat2a(3,3)+ml2(3,3)
Do j1 = 1,3
mat2a(3,3) = mat2a(3,3)+(vd**2*Conjg(Ye(j1,3))*Ye(j1,3))/2._dp
End Do 
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(vS*vu*lam*Conjg(Ye(1,3)))/2._dp
mat2a(3,4) = mat2a(3,4)+(vd*Conjg(Te(1,3)))/sqrt(2._dp)
mat2a(3,5) = 0._dp 
mat2a(3,5) = mat2a(3,5)-(vS*vu*lam*Conjg(Ye(2,3)))/2._dp
mat2a(3,5) = mat2a(3,5)+(vd*Conjg(Te(2,3)))/sqrt(2._dp)
mat2a(3,6) = 0._dp 
mat2a(3,6) = mat2a(3,6)-(vS*vu*lam*Conjg(Ye(3,3)))/2._dp
mat2a(3,6) = mat2a(3,6)+(vd*Conjg(Te(3,3)))/sqrt(2._dp)
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-(g1**2*vd**2)/4._dp
mat2a(4,4) = mat2a(4,4)+(g1**2*vu**2)/4._dp
mat2a(4,4) = mat2a(4,4)+me2(1,1)
Do j1 = 1,3
mat2a(4,4) = mat2a(4,4)+(vd**2*Conjg(Ye(1,j1))*Ye(1,j1))/2._dp
End Do 
mat2a(4,5) = 0._dp 
mat2a(4,5) = mat2a(4,5)+me2(1,2)
Do j1 = 1,3
mat2a(4,5) = mat2a(4,5)+(vd**2*Conjg(Ye(2,j1))*Ye(1,j1))/2._dp
End Do 
mat2a(4,6) = 0._dp 
mat2a(4,6) = mat2a(4,6)+me2(1,3)
Do j1 = 1,3
mat2a(4,6) = mat2a(4,6)+(vd**2*Conjg(Ye(3,j1))*Ye(1,j1))/2._dp
End Do 
mat2a(5,5) = 0._dp 
mat2a(5,5) = mat2a(5,5)-(g1**2*vd**2)/4._dp
mat2a(5,5) = mat2a(5,5)+(g1**2*vu**2)/4._dp
mat2a(5,5) = mat2a(5,5)+me2(2,2)
Do j1 = 1,3
mat2a(5,5) = mat2a(5,5)+(vd**2*Conjg(Ye(2,j1))*Ye(2,j1))/2._dp
End Do 
mat2a(5,6) = 0._dp 
mat2a(5,6) = mat2a(5,6)+me2(2,3)
Do j1 = 1,3
mat2a(5,6) = mat2a(5,6)+(vd**2*Conjg(Ye(3,j1))*Ye(2,j1))/2._dp
End Do 
mat2a(6,6) = 0._dp 
mat2a(6,6) = mat2a(6,6)-(g1**2*vd**2)/4._dp
mat2a(6,6) = mat2a(6,6)+(g1**2*vu**2)/4._dp
mat2a(6,6) = mat2a(6,6)+me2(3,3)
Do j1 = 1,3
mat2a(6,6) = mat2a(6,6)+(vd**2*Conjg(Ye(3,j1))*Ye(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,          & 
& Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVWm,MVWm2,MSd,MSd2,            & 
& MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,cplChiFecUSeR,          & 
& cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,cplSvImcUSeVWm,      & 
& cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,        & 
& cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,cplUSeSvReSvRecUSe,cplUSecUSeVPVP,  & 
& cplUSecUSecVWmVWm,cplUSecUSeVZVZ,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZEOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 = MSe2(i1)
Call Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,          & 
& Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVWm,MVWm2,MSd,MSd2,            & 
& MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,cplChiFecUSeR,          & 
& cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,cplSvImcUSeVWm,      & 
& cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,        & 
& cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,cplUSeSvReSvRecUSe,cplUSecUSeVPVP,  & 
& cplUSecUSecVWmVWm,cplUSecUSeVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,6
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,6
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,          & 
& Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVWm,MVWm2,MSd,MSd2,            & 
& MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,cplChiFecUSeR,          & 
& cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,cplSvImcUSeVWm,      & 
& cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,cplSdUSecSdcUSe,        & 
& cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,cplUSeSvReSvRecUSe,cplUSecUSeVPVP,  & 
& cplUSecUSecVWmVWm,cplUSecUSeVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=6,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZEOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,6
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopSe
 
 
Subroutine Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,               & 
& MChi,MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVWm,MVWm2,          & 
& MSd,MSd2,MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,               & 
& cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,       & 
& cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,         & 
& cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,cplUSeSvReSvRecUSe, & 
& cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSe(6),MSe2(6),MAh(3),MAh2(3),MFv(9),MFv2(9),MCha(2),MCha2(2),MFe(3),MFe2(3),         & 
& MChi(5),MChi2(5),Mhh(3),Mhh2(3),MSvIm(9),MSvIm2(9),MHpm(2),MHpm2(2),MSvRe(9),          & 
& MSvRe2(9),MVZ,MVZ2,MVWm,MVWm2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSecUSe(3,6,6),cplFvChacUSeL(9,2,6),cplFvChacUSeR(9,2,6),cplChiFecUSeL(5,3,6),    & 
& cplChiFecUSeR(5,3,6),cplhhSecUSe(3,6,6),cplHpmSvImcUSe(2,9,6),cplHpmSvRecUSe(2,9,6),   & 
& cplSecUSeVP(6,6),cplSecUSeVZ(6,6),cplSvImcUSeVWm(9,6),cplSvRecUSeVWm(9,6),             & 
& cplAhAhUSecUSe(3,3,6,6),cplhhhhUSecUSe(3,3,6,6),cplHpmUSecHpmcUSe(2,6,2,6),            & 
& cplSdUSecSdcUSe(6,6,6,6),cplUSeSecUSecSe(6,6,6,6),cplUSeSucUSecSu(6,6,6,6),            & 
& cplUSeSvImSvImcUSe(6,9,9,6),cplUSeSvReSvRecUSe(6,9,9,6),cplUSecUSeVPVP(6,6),           & 
& cplUSecUSecVWmVWm(6,6),cplUSecUSeVZVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Se, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSecUSe(i2,i1,gO1)
coup2 = Conjg(cplAhSecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MCha(i2)*Real(SA_B0(p2,MFv2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplFvChacUSeL(i1,i2,gO1)
coupR1 = cplFvChacUSeR(i1,i2,gO1)
coupL2 =  Conjg(cplFvChacUSeL(i1,i2,gO2))
coupR2 =  Conjg(cplFvChacUSeR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fe, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 5
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MChi(i2)*Real(SA_B0(p2,MFe2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFecUSeL(i2,i1,gO1)
coupR1 = cplChiFecUSeR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFecUSeL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFecUSeR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Se, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MSe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSecUSe(i2,i1,gO1)
coup2 = Conjg(cplhhSecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSvImcUSe(i2,i1,gO1)
coup2 = Conjg(cplHpmSvImcUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSvRecUSe(i2,i1,gO1)
coup2 = Conjg(cplHpmSvRecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSe2(i2),0._dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVP(i2,gO1)
coup2 =  Conjg(cplSecUSeVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = FloopRXi(p2,MSe2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVZ(i2,gO1)
coup2 =  Conjg(cplSecUSeVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 9
 F0m2 = FloopRXi(p2,MSvIm2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImcUSeVWm(i2,gO1)
coup2 =  Conjg(cplSvImcUSeVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 9
 F0m2 = FloopRXi(p2,MSvRe2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvRecUSeVWm(i2,gO1)
coup2 =  Conjg(cplSvRecUSeVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSecUSe(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSecUSe(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSecHpmcUSe(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSecSdcUSe(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSecUSecSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSucUSecSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSvImSvImcUSe(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSvReSvRecUSe(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSecVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSeVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopSe 
 
Subroutine DerPi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,            & 
& MChi,MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVWm,MVWm2,          & 
& MSd,MSd2,MSu,MSu2,cplAhSecUSe,cplFvChacUSeL,cplFvChacUSeR,cplChiFecUSeL,               & 
& cplChiFecUSeR,cplhhSecUSe,cplHpmSvImcUSe,cplHpmSvRecUSe,cplSecUSeVP,cplSecUSeVZ,       & 
& cplSvImcUSeVWm,cplSvRecUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,         & 
& cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvImSvImcUSe,cplUSeSvReSvRecUSe, & 
& cplUSecUSeVPVP,cplUSecUSecVWmVWm,cplUSecUSeVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MSe(6),MSe2(6),MAh(3),MAh2(3),MFv(9),MFv2(9),MCha(2),MCha2(2),MFe(3),MFe2(3),         & 
& MChi(5),MChi2(5),Mhh(3),Mhh2(3),MSvIm(9),MSvIm2(9),MHpm(2),MHpm2(2),MSvRe(9),          & 
& MSvRe2(9),MVZ,MVZ2,MVWm,MVWm2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSecUSe(3,6,6),cplFvChacUSeL(9,2,6),cplFvChacUSeR(9,2,6),cplChiFecUSeL(5,3,6),    & 
& cplChiFecUSeR(5,3,6),cplhhSecUSe(3,6,6),cplHpmSvImcUSe(2,9,6),cplHpmSvRecUSe(2,9,6),   & 
& cplSecUSeVP(6,6),cplSecUSeVZ(6,6),cplSvImcUSeVWm(9,6),cplSvRecUSeVWm(9,6),             & 
& cplAhAhUSecUSe(3,3,6,6),cplhhhhUSecUSe(3,3,6,6),cplHpmUSecHpmcUSe(2,6,2,6),            & 
& cplSdUSecSdcUSe(6,6,6,6),cplUSeSecUSecSe(6,6,6,6),cplUSeSucUSecSu(6,6,6,6),            & 
& cplUSeSvImSvImcUSe(6,9,9,6),cplUSeSvReSvRecUSe(6,9,9,6),cplUSecUSeVPVP(6,6),           & 
& cplUSecUSecVWmVWm(6,6),cplUSecUSeVZVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(6,6) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Se, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhSecUSe(i2,i1,gO1)
coup2 = Conjg(cplAhSecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MCha(i2)*Real(SA_DerB0(p2,MFv2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplFvChacUSeL(i1,i2,gO1)
coupR1 = cplFvChacUSeR(i1,i2,gO1)
coupL2 =  Conjg(cplFvChacUSeL(i1,i2,gO2))
coupR2 =  Conjg(cplFvChacUSeR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fe, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 5
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MChi(i2)*Real(SA_DerB0(p2,MFe2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coupL1 = cplChiFecUSeL(i2,i1,gO1)
coupR1 = cplChiFecUSeR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFecUSeL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFecUSeR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Se, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhSecUSe(i2,i1,gO1)
coup2 = Conjg(cplhhSecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSvImcUSe(i2,i1,gO1)
coup2 = Conjg(cplHpmSvImcUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmSvRecUSe(i2,i1,gO1)
coup2 = Conjg(cplHpmSvRecUSe(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSe2(i2),MVP2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVP(i2,gO1)
coup2 =  Conjg(cplSecUSeVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Se 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 6
 F0m2 = DerFloopRXi(p2,MSe2(i2),MVZ2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSecUSeVZ(i2,gO1)
coup2 =  Conjg(cplSecUSeVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, SvIm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 9
 F0m2 = DerFloopRXi(p2,MSvIm2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvImcUSeVWm(i2,gO1)
coup2 =  Conjg(cplSvImcUSeVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, SvRe 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 9
 F0m2 = DerFloopRXi(p2,MSvRe2(i2),MVWm2) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSvRecUSeVWm(i2,gO1)
coup2 =  Conjg(cplSvRecUSeVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplAhAhUSecUSe(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplhhhhUSecUSe(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplHpmUSecHpmcUSe(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplSdUSecSdcUSe(i1,gO2,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSecUSecSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSucUSecSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSvImSvImcUSe(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSeSvReSvRecUSe(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSeVPVP(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSecVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 6
  Do gO2 = gO1, 6
coup1 = cplUSecUSeVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 6
  Do gO1 = gO2+1, 6
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopSe 
 
Subroutine OneLoophh(g1,g2,lam,Tlam,kap,Tk,mHd2,mHu2,ms2,vd,vu,vS,MAh,MAh2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,            & 
& cplAhAhUhh,cplAhUhhhh,cplAhUhhVZ,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,          & 
& cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,        & 
& cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,        & 
& cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,cplUhhSucSu,            & 
& cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,   & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe,cplUhhUhhSucSu,           & 
& cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,delta,              & 
& mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVZ,MVZ2,MCha(2),MCha2(2),MChi(5),MChi2(5),             & 
& MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MHpm(2),MHpm2(2),          & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),            & 
& MSvRe(9),MSvRe2(9)

Real(dp), Intent(in) :: g1,g2,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk

Complex(dp), Intent(in) :: cplAhAhUhh(3,3,3),cplAhUhhhh(3,3,3),cplAhUhhVZ(3,3),cplcChaChaUhhL(2,2,3),            & 
& cplcChaChaUhhR(2,2,3),cplChiChiUhhL(5,5,3),cplChiChiUhhR(5,5,3),cplcFdFdUhhL(3,3,3),   & 
& cplcFdFdUhhR(3,3,3),cplcFeFeUhhL(3,3,3),cplcFeFeUhhR(3,3,3),cplcFuFuUhhL(3,3,3),       & 
& cplcFuFuUhhR(3,3,3),cplFvFvUhhL(9,9,3),cplFvFvUhhR(9,9,3),cplcgWmgWmUhh(3),            & 
& cplcgWpCgWpCUhh(3),cplcgZgZUhh(3),cplUhhhhhh(3,3,3),cplUhhHpmcHpm(3,2,2),              & 
& cplUhhHpmcVWm(3,2),cplUhhSdcSd(3,6,6),cplUhhSecSe(3,6,6),cplUhhSucSu(3,6,6),           & 
& cplUhhSvImSvIm(3,9,9),cplUhhSvImSvRe(3,9,9),cplUhhSvReSvRe(3,9,9),cplUhhcVWmVWm(3),    & 
& cplUhhVZVZ(3),cplAhAhUhhUhh(3,3,3,3),cplUhhUhhhhhh(3,3,3,3),cplUhhUhhHpmcHpm(3,3,2,2), & 
& cplUhhUhhSdcSd(3,3,6,6),cplUhhUhhSecSe(3,3,6,6),cplUhhUhhSucSu(3,3,6,6),               & 
& cplUhhUhhSvImSvIm(3,3,9,9),cplUhhUhhSvReSvRe(3,3,9,9),cplUhhUhhcVWmVWm(3,3),           & 
& cplUhhUhhVZVZ(3,3)

Complex(dp) :: mat2a(3,3), mat2(3,3),  PiSf(3,3,3)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2, test(3) 
Real(dp), Intent(out) :: mass(3), mass2(3) 
Complex(dp), Intent(out) ::  RS(3,3) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mHd2
mat2a(1,1) = mat2a(1,1)+(3*g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(3*g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(vS**2*lam*Conjg(lam))/2._dp
mat2a(1,1) = mat2a(1,1)+(vu**2*lam*Conjg(lam))/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-(g1**2*vd*vu)/4._dp
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu)/4._dp
mat2a(1,2) = mat2a(1,2)-(vS**2*lam*Conjg(kap))/4._dp
mat2a(1,2) = mat2a(1,2)-(vS**2*kap*Conjg(lam))/4._dp
mat2a(1,2) = mat2a(1,2)+vd*vu*lam*Conjg(lam)
mat2a(1,2) = mat2a(1,2)-(vS*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat2a(1,2) = mat2a(1,2)-(vS*Tlam)/(2._dp*sqrt(2._dp))
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)-(vS*vu*lam*Conjg(kap))/2._dp
mat2a(1,3) = mat2a(1,3)-(vS*vu*kap*Conjg(lam))/2._dp
mat2a(1,3) = mat2a(1,3)+vd*vS*lam*Conjg(lam)
mat2a(1,3) = mat2a(1,3)-(vu*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)-(vu*Tlam)/(2._dp*sqrt(2._dp))
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mHu2
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(3*g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(3*g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(vd**2*lam*Conjg(lam))/2._dp
mat2a(2,2) = mat2a(2,2)+(vS**2*lam*Conjg(lam))/2._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)-(vd*vS*lam*Conjg(kap))/2._dp
mat2a(2,3) = mat2a(2,3)-(vd*vS*kap*Conjg(lam))/2._dp
mat2a(2,3) = mat2a(2,3)+vS*vu*lam*Conjg(lam)
mat2a(2,3) = mat2a(2,3)-(vd*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)-(vd*Tlam)/(2._dp*sqrt(2._dp))
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+ms2
mat2a(3,3) = mat2a(3,3)+3*vS**2*kap*Conjg(kap)
mat2a(3,3) = mat2a(3,3)-(vd*vu*lam*Conjg(kap))/2._dp
mat2a(3,3) = mat2a(3,3)-(vd*vu*kap*Conjg(lam))/2._dp
mat2a(3,3) = mat2a(3,3)+(vd**2*lam*Conjg(lam))/2._dp
mat2a(3,3) = mat2a(3,3)+(vu**2*lam*Conjg(lam))/2._dp
mat2a(3,3) = mat2a(3,3)+(vS*Conjg(Tk))/sqrt(2._dp)
mat2a(3,3) = mat2a(3,3)+(vS*Tk)/sqrt(2._dp)

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1Loophh(p2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhhh,cplAhUhhVZ,cplcChaChaUhhL,    & 
& cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,     & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhcVWmVWm,    & 
& cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe, & 
& cplUhhUhhSucSu,cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,     & 
& kont,PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhhh,cplAhUhhVZ,cplcChaChaUhhL,    & 
& cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,     & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhcVWmVWm,    & 
& cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe, & 
& cplUhhUhhSucSu,cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,     & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,3
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1Loophh(p2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhhh,cplAhUhhVZ,cplcChaChaUhhL,    & 
& cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,     & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhcVWmVWm,    & 
& cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe, & 
& cplUhhUhhSucSu,cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,     & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,3
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhhh,cplAhUhhVZ,cplcChaChaUhhL,    & 
& cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,     & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhcVWmVWm,    & 
& cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe, & 
& cplUhhUhhSucSu,cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVZ,MVZ2,MCha(2),MCha2(2),MChi(5),MChi2(5),             & 
& MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MHpm(2),MHpm2(2),          & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),            & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhAhUhh(3,3,3),cplAhUhhhh(3,3,3),cplAhUhhVZ(3,3),cplcChaChaUhhL(2,2,3),            & 
& cplcChaChaUhhR(2,2,3),cplChiChiUhhL(5,5,3),cplChiChiUhhR(5,5,3),cplcFdFdUhhL(3,3,3),   & 
& cplcFdFdUhhR(3,3,3),cplcFeFeUhhL(3,3,3),cplcFeFeUhhR(3,3,3),cplcFuFuUhhL(3,3,3),       & 
& cplcFuFuUhhR(3,3,3),cplFvFvUhhL(9,9,3),cplFvFvUhhR(9,9,3),cplcgWmgWmUhh(3),            & 
& cplcgWpCgWpCUhh(3),cplcgZgZUhh(3),cplUhhhhhh(3,3,3),cplUhhHpmcHpm(3,2,2),              & 
& cplUhhHpmcVWm(3,2),cplUhhSdcSd(3,6,6),cplUhhSecSe(3,6,6),cplUhhSucSu(3,6,6),           & 
& cplUhhSvImSvIm(3,9,9),cplUhhSvImSvRe(3,9,9),cplUhhSvReSvRe(3,9,9),cplUhhcVWmVWm(3),    & 
& cplUhhVZVZ(3),cplAhAhUhhUhh(3,3,3,3),cplUhhUhhhhhh(3,3,3,3),cplUhhUhhHpmcHpm(3,3,2,2), & 
& cplUhhUhhSdcSd(3,3,6,6),cplUhhUhhSecSe(3,3,6,6),cplUhhUhhSucSu(3,3,6,6),               & 
& cplUhhUhhSvImSvIm(3,3,9,9),cplUhhUhhSvReSvRe(3,3,9,9),cplUhhUhhcVWmVWm(3,3),           & 
& cplUhhUhhVZVZ(3,3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(3,3) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhUhhhh(i2,gO1,i1)
coup2 = Conjg(cplAhUhhhh(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcChaChaUhhL(i1,i2,gO1)
coupR1 = cplcChaChaUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaChaUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaChaUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 G0m2 = Real(SA_Gloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplChiChiUhhL(i1,i2,gO1)
coupR1 = cplChiChiUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChiUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChiUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWmgWmUhh(gO1)
coup2 =  cplcgWmgWmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWpCgWpCUhh(gO1)
coup2 =  cplcgWpCgWpCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUhhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhHpmcVWm(gO1,i2)
coup2 =  Conjg(cplUhhHpmcVWm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSd2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSdcSd(gO1,i2,i1)
coup2 = Conjg(cplUhhSdcSd(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSecSe(gO1,i2,i1)
coup2 = Conjg(cplUhhSecSe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSu2(i1),MSu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSucSu(gO1,i2,i1)
coup2 = Conjg(cplUhhSucSu(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSvImSvIm(gO1,i1,i2)
coup2 = Conjg(cplUhhSvImSvIm(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSvImSvRe(gO1,i2,i1)
coup2 = Conjg(cplUhhSvImSvRe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSvRe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSvReSvRe(gO1,i1,i2)
coup2 = Conjg(cplUhhSvReSvRe(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWm2,MVWm2),dp)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhcVWmVWm(gO1)
coup2 =  Conjg(cplUhhcVWmVWm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSdcSd(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSecSe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSucSu(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 3
  Do gO1 = gO2+1, 3
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine DerPi1Loophh(p2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,          & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhUhh,cplAhUhhhh,cplAhUhhVZ,cplcChaChaUhhL,    & 
& cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,     & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvImSvIm,cplUhhSvImSvRe,cplUhhSvReSvRe,cplUhhcVWmVWm,    & 
& cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,cplUhhUhhSecSe, & 
& cplUhhUhhSucSu,cplUhhUhhSvImSvIm,cplUhhUhhSvReSvRe,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVZ,MVZ2,MCha(2),MCha2(2),MChi(5),MChi2(5),             & 
& MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MHpm(2),MHpm2(2),          & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),            & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhAhUhh(3,3,3),cplAhUhhhh(3,3,3),cplAhUhhVZ(3,3),cplcChaChaUhhL(2,2,3),            & 
& cplcChaChaUhhR(2,2,3),cplChiChiUhhL(5,5,3),cplChiChiUhhR(5,5,3),cplcFdFdUhhL(3,3,3),   & 
& cplcFdFdUhhR(3,3,3),cplcFeFeUhhL(3,3,3),cplcFeFeUhhR(3,3,3),cplcFuFuUhhL(3,3,3),       & 
& cplcFuFuUhhR(3,3,3),cplFvFvUhhL(9,9,3),cplFvFvUhhR(9,9,3),cplcgWmgWmUhh(3),            & 
& cplcgWpCgWpCUhh(3),cplcgZgZUhh(3),cplUhhhhhh(3,3,3),cplUhhHpmcHpm(3,2,2),              & 
& cplUhhHpmcVWm(3,2),cplUhhSdcSd(3,6,6),cplUhhSecSe(3,6,6),cplUhhSucSu(3,6,6),           & 
& cplUhhSvImSvIm(3,9,9),cplUhhSvImSvRe(3,9,9),cplUhhSvReSvRe(3,9,9),cplUhhcVWmVWm(3),    & 
& cplUhhVZVZ(3),cplAhAhUhhUhh(3,3,3,3),cplUhhUhhhhhh(3,3,3,3),cplUhhUhhHpmcHpm(3,3,2,2), & 
& cplUhhUhhSdcSd(3,3,6,6),cplUhhUhhSecSe(3,3,6,6),cplUhhUhhSucSu(3,3,6,6),               & 
& cplUhhUhhSvImSvIm(3,3,9,9),cplUhhUhhSvReSvRe(3,3,9,9),cplUhhUhhcVWmVWm(3,3),           & 
& cplUhhUhhVZVZ(3,3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(3,3) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhUhhhh(i2,gO1,i1)
coup2 = Conjg(cplAhUhhhh(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = DerFloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcChaChaUhhL(i1,i2,gO1)
coupR1 = cplcChaChaUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaChaUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaChaUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 G0m2 = Real(SA_DerGloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplChiChiUhhL(i1,i2,gO1)
coupR1 = cplChiChiUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChiUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChiUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWmgWmUhh(gO1)
coup2 =  cplcgWmgWmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWpCgWpCUhh(gO1)
coup2 =  cplcgWpCgWpCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUhhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MHpm2(i2),MVWm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhHpmcVWm(gO1,i2)
coup2 =  Conjg(cplUhhHpmcVWm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSd2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSdcSd(gO1,i2,i1)
coup2 = Conjg(cplUhhSdcSd(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSecSe(gO1,i2,i1)
coup2 = Conjg(cplUhhSecSe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MSu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSucSu(gO1,i2,i1)
coup2 = Conjg(cplUhhSucSu(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSvImSvIm(gO1,i1,i2)
coup2 = Conjg(cplUhhSvImSvIm(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSvImSvRe(gO1,i2,i1)
coup2 = Conjg(cplUhhSvImSvRe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSvRe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhSvReSvRe(gO1,i1,i2)
coup2 = Conjg(cplUhhSvReSvRe(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVWm2,MVWm2),dp)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhcVWmVWm(gO1)
coup2 =  Conjg(cplUhhcVWmVWm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSdcSd(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSecSe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSucSu(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 3
  Do gO1 = gO2+1, 3
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1Loophh 
 
Subroutine OneLoopAh(g1,g2,lam,Tlam,kap,Tk,mHd2,mHu2,ms2,vd,vu,vS,TW,MAh,             & 
& MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,          & 
& MSvRe2,cplUAhAhAh,cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,cplChiChiUAhL,              & 
& cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,        & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,cplUAhhhhh,         & 
& cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,cplUAhSecSe,cplUAhSucSu,            & 
& cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,cplUAhUAhhhhh,              & 
& cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,cplUAhUAhSvImSvIm,       & 
& cplUAhUAhSvReSvRe,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MVZ,MVZ2,MHpm(2),MHpm2(2),        & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),            & 
& MSvRe(9),MSvRe2(9)

Real(dp), Intent(in) :: g1,g2,mHd2,mHu2,ms2,vd,vu,vS,TW

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk

Complex(dp), Intent(in) :: cplUAhAhAh(3,3,3),cplUAhAhhh(3,3,3),cplcChaChaUAhL(2,2,3),cplcChaChaUAhR(2,2,3),      & 
& cplChiChiUAhL(5,5,3),cplChiChiUAhR(5,5,3),cplcFdFdUAhL(3,3,3),cplcFdFdUAhR(3,3,3),     & 
& cplcFeFeUAhL(3,3,3),cplcFeFeUAhR(3,3,3),cplcFuFuUAhL(3,3,3),cplcFuFuUAhR(3,3,3),       & 
& cplFvFvUAhL(9,9,3),cplFvFvUAhR(9,9,3),cplcgWmgWmUAh(3),cplcgWpCgWpCUAh(3),             & 
& cplUAhhhhh(3,3,3),cplUAhhhVZ(3,3),cplUAhHpmcHpm(3,2,2),cplUAhHpmcVWm(3,2),             & 
& cplUAhSdcSd(3,6,6),cplUAhSecSe(3,6,6),cplUAhSucSu(3,6,6),cplUAhSvImSvIm(3,9,9),        & 
& cplUAhSvImSvRe(3,9,9),cplUAhSvReSvRe(3,9,9),cplUAhUAhAhAh(3,3,3,3),cplUAhUAhhhhh(3,3,3,3),& 
& cplUAhUAhHpmcHpm(3,3,2,2),cplUAhUAhSdcSd(3,3,6,6),cplUAhUAhSecSe(3,3,6,6),             & 
& cplUAhUAhSucSu(3,3,6,6),cplUAhUAhSvImSvIm(3,3,9,9),cplUAhUAhSvReSvRe(3,3,9,9),         & 
& cplUAhUAhcVWmVWm(3,3),cplUAhUAhVZVZ(3,3)

Complex(dp) :: mat2a(3,3), mat2(3,3),  PiSf(3,3,3)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2, test(3) 
Real(dp), Intent(out) :: mass(3), mass2(3) 
Complex(dp), Intent(out) ::  RS(3,3) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mHd2
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(vS**2*lam*Conjg(lam))/2._dp
mat2a(1,1) = mat2a(1,1)+(vu**2*lam*Conjg(lam))/2._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2*Cos(TW)**2*RXiZ)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*g2*vd**2*Cos(TW)*RXiZ*Sin(TW))/2._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2*RXiZ*Sin(TW)**2)/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+(vS**2*lam*Conjg(kap))/4._dp
mat2a(1,2) = mat2a(1,2)+(vS**2*kap*Conjg(lam))/4._dp
mat2a(1,2) = mat2a(1,2)+(vS*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu*Cos(TW)**2*RXiZ)/4._dp
mat2a(1,2) = mat2a(1,2)-(g1*g2*vd*vu*Cos(TW)*RXiZ*Sin(TW))/2._dp
mat2a(1,2) = mat2a(1,2)-(g1**2*vd*vu*RXiZ*Sin(TW)**2)/4._dp
mat2a(1,2) = mat2a(1,2)+(vS*Tlam)/(2._dp*sqrt(2._dp))
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)-(vS*vu*lam*Conjg(kap))/2._dp
mat2a(1,3) = mat2a(1,3)-(vS*vu*kap*Conjg(lam))/2._dp
mat2a(1,3) = mat2a(1,3)+(vu*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)+(vu*Tlam)/(2._dp*sqrt(2._dp))
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mHu2
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)-(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(vd**2*lam*Conjg(lam))/2._dp
mat2a(2,2) = mat2a(2,2)+(vS**2*lam*Conjg(lam))/2._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2*Cos(TW)**2*RXiZ)/4._dp
mat2a(2,2) = mat2a(2,2)+(g1*g2*vu**2*Cos(TW)*RXiZ*Sin(TW))/2._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2*RXiZ*Sin(TW)**2)/4._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)-(vd*vS*lam*Conjg(kap))/2._dp
mat2a(2,3) = mat2a(2,3)-(vd*vS*kap*Conjg(lam))/2._dp
mat2a(2,3) = mat2a(2,3)+(vd*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)+(vd*Tlam)/(2._dp*sqrt(2._dp))
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+ms2
mat2a(3,3) = mat2a(3,3)+vS**2*kap*Conjg(kap)
mat2a(3,3) = mat2a(3,3)+(vd*vu*lam*Conjg(kap))/2._dp
mat2a(3,3) = mat2a(3,3)+(vd*vu*kap*Conjg(lam))/2._dp
mat2a(3,3) = mat2a(3,3)+(vd**2*lam*Conjg(lam))/2._dp
mat2a(3,3) = mat2a(3,3)+(vu**2*lam*Conjg(lam))/2._dp
mat2a(3,3) = mat2a(3,3)-((vS*Conjg(Tk))/sqrt(2._dp))
mat2a(3,3) = mat2a(3,3)-((vS*Tk)/sqrt(2._dp))

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopAh(p2,MAh,MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhAh,cplUAhAhhh,cplcChaChaUAhL,               & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhhh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,         & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,kont,               & 
& PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZAOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 = MAh2(i1)
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopAh(p2,MAh,MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhAh,cplUAhAhhh,cplcChaChaUAhL,               & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhhh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,         & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,kont,               & 
& PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,3
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopAh(p2,MAh,MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhAh,cplUAhAhhh,cplcChaChaUAhL,               & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhhh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,         & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,kont,               & 
& PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZAOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,3
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,MAh,MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhAh,cplUAhAhhh,cplcChaChaUAhL,               & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhhh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,         & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MVZ,MVZ2,MHpm(2),MHpm2(2),        & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),            & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplUAhAhAh(3,3,3),cplUAhAhhh(3,3,3),cplcChaChaUAhL(2,2,3),cplcChaChaUAhR(2,2,3),      & 
& cplChiChiUAhL(5,5,3),cplChiChiUAhR(5,5,3),cplcFdFdUAhL(3,3,3),cplcFdFdUAhR(3,3,3),     & 
& cplcFeFeUAhL(3,3,3),cplcFeFeUAhR(3,3,3),cplcFuFuUAhL(3,3,3),cplcFuFuUAhR(3,3,3),       & 
& cplFvFvUAhL(9,9,3),cplFvFvUAhR(9,9,3),cplcgWmgWmUAh(3),cplcgWpCgWpCUAh(3),             & 
& cplUAhhhhh(3,3,3),cplUAhhhVZ(3,3),cplUAhHpmcHpm(3,2,2),cplUAhHpmcVWm(3,2),             & 
& cplUAhSdcSd(3,6,6),cplUAhSecSe(3,6,6),cplUAhSucSu(3,6,6),cplUAhSvImSvIm(3,9,9),        & 
& cplUAhSvImSvRe(3,9,9),cplUAhSvReSvRe(3,9,9),cplUAhUAhAhAh(3,3,3,3),cplUAhUAhhhhh(3,3,3,3),& 
& cplUAhUAhHpmcHpm(3,3,2,2),cplUAhUAhSdcSd(3,3,6,6),cplUAhUAhSecSe(3,3,6,6),             & 
& cplUAhUAhSucSu(3,3,6,6),cplUAhUAhSvImSvIm(3,3,9,9),cplUAhUAhSvReSvRe(3,3,9,9),         & 
& cplUAhUAhcVWmVWm(3,3),cplUAhUAhVZVZ(3,3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(3,3) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhAhAh(gO1,i1,i2)
coup2 = Conjg(cplUAhAhAh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcChaChaUAhL(i1,i2,gO1)
coupR1 = cplcChaChaUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaChaUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaChaUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 G0m2 = Real(SA_Gloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplChiChiUAhL(i1,i2,gO1)
coupR1 = cplChiChiUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChiUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChiUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWmgWmUAh(gO1)
coup2 =  cplcgWmgWmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWpCgWpCUAh(gO1)
coup2 =  cplcgWpCgWpCUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUAhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUAhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhHpmcVWm(gO1,i2)
coup2 =  Conjg(cplUAhHpmcVWm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSd2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSdcSd(gO1,i2,i1)
coup2 = Conjg(cplUAhSdcSd(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSecSe(gO1,i2,i1)
coup2 = Conjg(cplUAhSecSe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSu2(i1),MSu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSucSu(gO1,i2,i1)
coup2 = Conjg(cplUAhSucSu(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSvImSvIm(gO1,i1,i2)
coup2 = Conjg(cplUAhSvImSvIm(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSvImSvRe(gO1,i2,i1)
coup2 = Conjg(cplUAhSvImSvRe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSvRe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSvReSvRe(gO1,i1,i2)
coup2 = Conjg(cplUAhSvReSvRe(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSdcSd(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSecSe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSucSu(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 3
  Do gO1 = gO2+1, 3
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine DerPi1LoopAh(p2,MAh,MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplUAhAhAh,cplUAhAhhh,cplcChaChaUAhL,      & 
& cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,     & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhhh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,         & 
& cplUAhSecSe,cplUAhSucSu,cplUAhSvImSvIm,cplUAhSvImSvRe,cplUAhSvReSvRe,cplUAhUAhAhAh,    & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,cplUAhUAhSecSe,cplUAhUAhSucSu,           & 
& cplUAhUAhSvImSvIm,cplUAhUAhSvReSvRe,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),Mhh(3),Mhh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MVZ,MVZ2,MHpm(2),MHpm2(2),        & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),            & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplUAhAhAh(3,3,3),cplUAhAhhh(3,3,3),cplcChaChaUAhL(2,2,3),cplcChaChaUAhR(2,2,3),      & 
& cplChiChiUAhL(5,5,3),cplChiChiUAhR(5,5,3),cplcFdFdUAhL(3,3,3),cplcFdFdUAhR(3,3,3),     & 
& cplcFeFeUAhL(3,3,3),cplcFeFeUAhR(3,3,3),cplcFuFuUAhL(3,3,3),cplcFuFuUAhR(3,3,3),       & 
& cplFvFvUAhL(9,9,3),cplFvFvUAhR(9,9,3),cplcgWmgWmUAh(3),cplcgWpCgWpCUAh(3),             & 
& cplUAhhhhh(3,3,3),cplUAhhhVZ(3,3),cplUAhHpmcHpm(3,2,2),cplUAhHpmcVWm(3,2),             & 
& cplUAhSdcSd(3,6,6),cplUAhSecSe(3,6,6),cplUAhSucSu(3,6,6),cplUAhSvImSvIm(3,9,9),        & 
& cplUAhSvImSvRe(3,9,9),cplUAhSvReSvRe(3,9,9),cplUAhUAhAhAh(3,3,3,3),cplUAhUAhhhhh(3,3,3,3),& 
& cplUAhUAhHpmcHpm(3,3,2,2),cplUAhUAhSdcSd(3,3,6,6),cplUAhUAhSecSe(3,3,6,6),             & 
& cplUAhUAhSucSu(3,3,6,6),cplUAhUAhSvImSvIm(3,3,9,9),cplUAhUAhSvReSvRe(3,3,9,9),         & 
& cplUAhUAhcVWmVWm(3,3),cplUAhUAhVZVZ(3,3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(3,3) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhAhAh(gO1,i1,i2)
coup2 = Conjg(cplUAhAhAh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcChaChaUAhL(i1,i2,gO1)
coupR1 = cplcChaChaUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcChaChaUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcChaChaUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 G0m2 = Real(SA_DerGloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplChiChiUAhL(i1,i2,gO1)
coupR1 = cplChiChiUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChiUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChiUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWmgWmUAh(gO1)
coup2 =  cplcgWmgWmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWpCgWpCUAh(gO1)
coup2 =  cplcgWpCgWpCUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUAhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUAhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MHpm2(i2),MVWm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhHpmcVWm(gO1,i2)
coup2 =  Conjg(cplUAhHpmcVWm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSd2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSdcSd(gO1,i2,i1)
coup2 = Conjg(cplUAhSdcSd(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSecSe(gO1,i2,i1)
coup2 = Conjg(cplUAhSecSe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MSu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSucSu(gO1,i2,i1)
coup2 = Conjg(cplUAhSucSu(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSvImSvIm(gO1,i1,i2)
coup2 = Conjg(cplUAhSvImSvIm(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSvIm2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSvImSvRe(gO1,i2,i1)
coup2 = Conjg(cplUAhSvImSvRe(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSvRe2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhSvReSvRe(gO1,i1,i2)
coup2 = Conjg(cplUAhSvReSvRe(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSdcSd(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSecSe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSucSu(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSvImSvIm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhSvReSvRe(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 3
  Do gO1 = gO2+1, 3
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopAh 
 
Subroutine OneLoopHpm(g1,g2,lam,Tlam,kap,mHd2,mHu2,vd,vu,vS,MHpm,MHpm2,               & 
& MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,              & 
& MFe2,Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,           & 
& cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,            & 
& cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,               & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,              & 
& cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSeSvImcUHpm,cplSeSvRecUHpm,cplcUHpmVPVWm,               & 
& cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd, & 
& cplUHpmSecUHpmcSe,cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,cplUHpmSvReSvRecUHpm,         & 
& cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(3),MAh2(3),MVWm,MVWm2,MChi(5),MChi2(5),MCha(2),MCha2(2),         & 
& MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(3),Mhh2(3),            & 
& MVZ,MVZ2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSe(6),MSe2(6),              & 
& MSvRe(9),MSvRe2(9)

Real(dp), Intent(in) :: g1,g2,mHd2,mHu2,vd,vu,vS

Complex(dp), Intent(in) :: lam,Tlam,kap

Complex(dp), Intent(in) :: cplAhHpmcUHpm(3,2,2),cplAhcUHpmVWm(3,2),cplChiChacUHpmL(5,2,2),cplChiChacUHpmR(5,2,2),& 
& cplcFuFdcUHpmL(3,3,2),cplcFuFdcUHpmR(3,3,2),cplFvFecUHpmL(9,3,2),cplFvFecUHpmR(9,3,2), & 
& cplcgZgWmcUHpm(2),cplcgWmgZUHpm(2),cplcgWpCgZcUHpm(2),cplcgZgWpCUHpm(2),               & 
& cplhhHpmcUHpm(3,2,2),cplhhcUHpmVWm(3,2),cplHpmcUHpmVP(2,2),cplHpmcUHpmVZ(2,2),         & 
& cplSdcUHpmcSu(6,2,6),cplSeSvImcUHpm(6,9,2),cplSeSvRecUHpm(6,9,2),cplcUHpmVPVWm(2),     & 
& cplcUHpmVWmVZ(2),cplAhAhUHpmcUHpm(3,3,2,2),cplhhhhUHpmcUHpm(3,3,2,2),cplUHpmHpmcUHpmcHpm(2,2,2,2),& 
& cplUHpmSdcUHpmcSd(2,6,2,6),cplUHpmSecUHpmcSe(2,6,2,6),cplUHpmSucUHpmcSu(2,6,2,6),      & 
& cplUHpmSvImSvImcUHpm(2,9,9,2),cplUHpmSvReSvRecUHpm(2,9,9,2),cplUHpmcUHpmVPVP(2,2),     & 
& cplUHpmcUHpmcVWmVWm(2,2),cplUHpmcUHpmVZVZ(2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHpm'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mHd2
mat2a(1,1) = mat2a(1,1)+(g1**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2)/8._dp
mat2a(1,1) = mat2a(1,1)-(g1**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vu**2)/8._dp
mat2a(1,1) = mat2a(1,1)+(vS**2*lam*Conjg(lam))/2._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2*RXiWm)/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+(g2**2*vd*vu)/4._dp
mat2a(1,2) = mat2a(1,2)+(vS**2*kap*Conjg(lam))/2._dp
mat2a(1,2) = mat2a(1,2)-(vd*vu*lam*Conjg(lam))/2._dp
mat2a(1,2) = mat2a(1,2)+(vS*Conjg(Tlam))/sqrt(2._dp)
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu*RXiWm)/4._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mHu2
mat2a(2,2) = mat2a(2,2)-(g1**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vd**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g1**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2)/8._dp
mat2a(2,2) = mat2a(2,2)+(vS**2*lam*Conjg(lam))/2._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2*RXiWm)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,              & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,               & 
& MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,        & 
& cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,             & 
& cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,             & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSeSvImcUHpm,cplSeSvRecUHpm, & 
& cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,     & 
& cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,            & 
& cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,            & 
& kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZPOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = MHpm2(i1)
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,              & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,               & 
& MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,        & 
& cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,             & 
& cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,             & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSeSvImcUHpm,cplSeSvRecUHpm, & 
& cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,     & 
& cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,            & 
& cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,            & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,2
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,              & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,               & 
& MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,        & 
& cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,             & 
& cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,             & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSeSvImcUHpm,cplSeSvRecUHpm, & 
& cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,     & 
& cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,            & 
& cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,            & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZPOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,2
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHpm
 
 
Subroutine Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,              & 
& MCha2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,              & 
& MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,   & 
& cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,             & 
& cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,             & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSeSvImcUHpm,cplSeSvRecUHpm, & 
& cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,     & 
& cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,            & 
& cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(3),MAh2(3),MVWm,MVWm2,MChi(5),MChi2(5),MCha(2),MCha2(2),         & 
& MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(3),Mhh2(3),            & 
& MVZ,MVZ2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSe(6),MSe2(6),              & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhHpmcUHpm(3,2,2),cplAhcUHpmVWm(3,2),cplChiChacUHpmL(5,2,2),cplChiChacUHpmR(5,2,2),& 
& cplcFuFdcUHpmL(3,3,2),cplcFuFdcUHpmR(3,3,2),cplFvFecUHpmL(9,3,2),cplFvFecUHpmR(9,3,2), & 
& cplcgZgWmcUHpm(2),cplcgWmgZUHpm(2),cplcgWpCgZcUHpm(2),cplcgZgWpCUHpm(2),               & 
& cplhhHpmcUHpm(3,2,2),cplhhcUHpmVWm(3,2),cplHpmcUHpmVP(2,2),cplHpmcUHpmVZ(2,2),         & 
& cplSdcUHpmcSu(6,2,6),cplSeSvImcUHpm(6,9,2),cplSeSvRecUHpm(6,9,2),cplcUHpmVPVWm(2),     & 
& cplcUHpmVWmVZ(2),cplAhAhUHpmcUHpm(3,3,2,2),cplhhhhUHpmcUHpm(3,3,2,2),cplUHpmHpmcUHpmcHpm(2,2,2,2),& 
& cplUHpmSdcUHpmcSd(2,6,2,6),cplUHpmSecUHpmcSe(2,6,2,6),cplUHpmSucUHpmcSu(2,6,2,6),      & 
& cplUHpmSvImSvImcUHpm(2,9,9,2),cplUHpmSvReSvRecUHpm(2,9,9,2),cplUHpmcUHpmVPVP(2,2),     & 
& cplUHpmcUHpmcVWmVWm(2,2),cplUHpmcUHpmVZVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplAhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MAh2(i2),MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhcUHpmVWm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Chi, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 2
 G0m2 = Real(SA_Gloop(p2,MChi2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MCha(i2)*Real(SA_B0(p2,MChi2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplChiChacUHpmL(i1,i2,gO1)
coupR1 = cplChiChacUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChacUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChacUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFdcUHpmL(i1,i2,gO1)
coupR1 = cplcFuFdcUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFdcUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFdcUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFecUHpmL(i1,i2,gO1)
coupR1 = cplFvFecUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFecUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFecUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgWmcUHpm(gO1)
coup2 =  cplcgWmgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpCgZcUHpm(gO1)
coup2 =  cplcgZgWpCUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MHpm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplhhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhcUHpmVWm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHpm2(i2),0._dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVP(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MHpm2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVZ(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Su], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSu2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSdcUHpmcSu(i2,gO1,i1)
coup2 = Conjg(cplSdcUHpmcSu(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvIm2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSeSvImcUHpm(i2,i1,gO1)
coup2 = Conjg(cplSeSvImcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 B0m2 = Real(SA_B0(p2,MSvRe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSeSvRecUHpm(i2,i1,gO1)
coup2 = Conjg(cplSeSvRecUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVWm2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVPVWm(gO1)
coup2 =  Conjg(cplcUHpmVPVWm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWm2,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVWmVZ(gO1)
coup2 =  Conjg(cplcUHpmVWmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhhhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmHpmcUHpmcHpm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSd2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSdcUHpmcSd(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSe2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSecUHpmcSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_A0(MSu2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSucUHpmcSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvIm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSvImSvImcUHpm(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_A0(MSvRe2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSvReSvRecUHpm(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWm2) + 0.25_dp*RXi*SA_A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmcVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopHpm 
 
Subroutine DerPi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,           & 
& MCha2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,              & 
& MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,   & 
& cplChiChacUHpmR,cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplFvFecUHpmL,cplFvFecUHpmR,             & 
& cplcgZgWmcUHpm,cplcgWmgZUHpm,cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,             & 
& cplhhcUHpmVWm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSeSvImcUHpm,cplSeSvRecUHpm, & 
& cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,     & 
& cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,cplUHpmSucUHpmcSu,cplUHpmSvImSvImcUHpm,            & 
& cplUHpmSvReSvRecUHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,cplUHpmcUHpmVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(3),MAh2(3),MVWm,MVWm2,MChi(5),MChi2(5),MCha(2),MCha2(2),         & 
& MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(3),Mhh2(3),            & 
& MVZ,MVZ2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSe(6),MSe2(6),              & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhHpmcUHpm(3,2,2),cplAhcUHpmVWm(3,2),cplChiChacUHpmL(5,2,2),cplChiChacUHpmR(5,2,2),& 
& cplcFuFdcUHpmL(3,3,2),cplcFuFdcUHpmR(3,3,2),cplFvFecUHpmL(9,3,2),cplFvFecUHpmR(9,3,2), & 
& cplcgZgWmcUHpm(2),cplcgWmgZUHpm(2),cplcgWpCgZcUHpm(2),cplcgZgWpCUHpm(2),               & 
& cplhhHpmcUHpm(3,2,2),cplhhcUHpmVWm(3,2),cplHpmcUHpmVP(2,2),cplHpmcUHpmVZ(2,2),         & 
& cplSdcUHpmcSu(6,2,6),cplSeSvImcUHpm(6,9,2),cplSeSvRecUHpm(6,9,2),cplcUHpmVPVWm(2),     & 
& cplcUHpmVWmVZ(2),cplAhAhUHpmcUHpm(3,3,2,2),cplhhhhUHpmcUHpm(3,3,2,2),cplUHpmHpmcUHpmcHpm(2,2,2,2),& 
& cplUHpmSdcUHpmcSd(2,6,2,6),cplUHpmSecUHpmcSe(2,6,2,6),cplUHpmSucUHpmcSu(2,6,2,6),      & 
& cplUHpmSvImSvImcUHpm(2,9,9,2),cplUHpmSvReSvRecUHpm(2,9,9,2),cplUHpmcUHpmVPVP(2,2),     & 
& cplUHpmcUHpmcVWmVWm(2,2),cplUHpmcUHpmVZVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplAhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = DerFloopRXi(p2,MAh2(i2),MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhcUHpmVWm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Chi, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 2
 G0m2 = Real(SA_DerGloop(p2,MChi2(i1),MCha2(i2)),dp) 
B0m2 = -2._dp*MChi(i1)*MCha(i2)*Real(SA_DerB0(p2,MChi2(i1),MCha2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplChiChacUHpmL(i1,i2,gO1)
coupR1 = cplChiChacUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplChiChacUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplChiChacUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFd(i2)*Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFdcUHpmL(i1,i2,gO1)
coupR1 = cplcFuFdcUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFdcUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFdcUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFe(i2)*Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFecUHpmL(i1,i2,gO1)
coupR1 = cplFvFecUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFecUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFecUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgWmcUHpm(gO1)
coup2 =  cplcgWmgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVZ2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpCgZcUHpm(gO1)
coup2 =  cplcgZgWpCUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MHpm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplhhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhcUHpmVWm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmVWm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MHpm2(i2),MVP2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVP(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MHpm2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpmcUHpmVZ(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Su], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSu2(i1),MSd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSdcUHpmcSu(i2,gO1,i1)
coup2 = Conjg(cplSdcUHpmcSu(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvIm2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSeSvImcUHpm(i2,i1,gO1)
coup2 = Conjg(cplSeSvImcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 B0m2 = Real(SA_DerB0(p2,MSvRe2(i1),MSe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplSeSvRecUHpm(i2,i1,gO1)
coup2 = Conjg(cplSeSvRecUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVP2,MVWm2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVPVWm(gO1)
coup2 =  Conjg(cplcUHpmVPVWm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVWm2,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcUHpmVWmVZ(gO1)
coup2 =  Conjg(cplcUHpmVWmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhhhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MHpm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmHpmcUHpmcHpm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSd2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSdcUHpmcSd(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSe2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSecUHpmcSe(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
 A0m2 = SA_DerA0(MSu2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSucUHpmcSu(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! SvIm, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvIm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSvImSvImcUHpm(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe, SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
 A0m2 = SA_DerA0(MSvRe2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmSvReSvRecUHpm(gO2,i1,i1,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmVPVP(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWm2) + 0.25_dp*RXi*SA_DerA0(MVWm2*RXi) - 0.5_dp*MVWm2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmcVWmVWm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUHpmcUHpmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopHpm 
 
Subroutine OneLoopChi(g1,g2,lam,kap,M1,M2,vd,vu,vS,MChi,MChi2,MAh,MAh2,               & 
& MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,              & 
& MSe2,MFe,MFe2,MSu,MSu2,MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,      & 
& cplUChiChiAhR,cplUChiChacHpmL,cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,         & 
& cplUChiChihhL,cplUChiChihhR,cplUChiChiVZL,cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,   & 
& cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR, & 
& cplUChiFvSvReL,cplUChiFvSvReR,cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,           & 
& cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL, & 
& cplcChaUChiVWmR,delta,MChi_1L,MChi2_1L,ZN_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MChi(5),MChi2(5),MAh(3),MAh2(3),MHpm(2),MHpm2(2),MCha(2),MCha2(2),MVWm,               & 
& MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MSd(6),MSd2(6),MFd(3),MFd2(3),MSe(6),MSe2(6),            & 
& MFe(3),MFe2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MSvIm(9),MSvIm2(9),MFv(9),MFv2(9),        & 
& MSvRe(9),MSvRe2(9)

Real(dp), Intent(in) :: g1,g2,vd,vu,vS

Complex(dp), Intent(in) :: lam,kap,M1,M2

Complex(dp), Intent(in) :: cplUChiChiAhL(5,5,3),cplUChiChiAhR(5,5,3),cplUChiChacHpmL(5,2,2),cplUChiChacHpmR(5,2,2),& 
& cplUChiChacVWmL(5,2),cplUChiChacVWmR(5,2),cplUChiChihhL(5,5,3),cplUChiChihhR(5,5,3),   & 
& cplUChiChiVZL(5,5),cplUChiChiVZR(5,5),cplUChiFdcSdL(5,3,6),cplUChiFdcSdR(5,3,6),       & 
& cplUChiFecSeL(5,3,6),cplUChiFecSeR(5,3,6),cplUChiFucSuL(5,3,6),cplUChiFucSuR(5,3,6),   & 
& cplUChiFvSvImL(5,9,9),cplUChiFvSvImR(5,9,9),cplUChiFvSvReL(5,9,9),cplUChiFvSvReR(5,9,9),& 
& cplcChaUChiHpmL(2,5,2),cplcChaUChiHpmR(2,5,2),cplcFdUChiSdL(3,5,6),cplcFdUChiSdR(3,5,6),& 
& cplcFeUChiSeL(3,5,6),cplcFeUChiSeR(3,5,6),cplcFuUChiSuL(3,5,6),cplcFuUChiSuR(3,5,6),   & 
& cplcChaUChiVWmL(2,5),cplcChaUChiVWmR(2,5)

Complex(dp) :: mat1a(5,5), mat1(5,5), mat2(5,5) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(5), test_m2(5),p2 
Real(dp), Intent(out) :: MChi_1L(5),MChi2_1L(5) 
Complex(dp), Intent(out) ::  ZN_1L(5,5) 
Real(dp) :: MChi_t(5),MChi2_t(5) 
Complex(dp) ::  ZN_t(5,5) 
Complex(dp) ::  phaseM, E5(5), sigL(5,5), sigR(5,5), sigSL(5,5), sigSR(5,5) 
Real(dp) :: ZNa(5,5), test(2), eig(5) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMChi'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+M1
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-(g1*vd)/2._dp
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(g1*vu)/2._dp
mat1a(1,5) = 0._dp 
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+M2
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(g2*vd)/2._dp
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)-(g2*vu)/2._dp
mat1a(2,5) = 0._dp 
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-(g1*vd)/2._dp
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(g2*vd)/2._dp
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)-((vS*lam)/sqrt(2._dp))
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)-((vu*lam)/sqrt(2._dp))
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(g1*vu)/2._dp
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)-(g2*vu)/2._dp
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)-((vS*lam)/sqrt(2._dp))
mat1a(4,4) = 0._dp 
mat1a(4,5) = 0._dp 
mat1a(4,5) = mat1a(4,5)-((vd*lam)/sqrt(2._dp))
mat1a(5,1) = 0._dp 
mat1a(5,2) = 0._dp 
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)-((vu*lam)/sqrt(2._dp))
mat1a(5,4) = 0._dp 
mat1a(5,4) = mat1a(5,4)-((vd*lam)/sqrt(2._dp))
mat1a(5,5) = 0._dp 
mat1a(5,5) = mat1a(5,5)+sqrt(2._dp)*vS*kap

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,MFu,MFu2,               & 
& MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,        & 
& cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,           & 
& cplUChiChiVZL,cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,   & 
& cplUChiFucSuL,cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,              & 
& cplUChiFvSvReR,cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,            & 
& cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,               & 
& cplcChaUChiVWmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZNa,ierr,test) 
 
   Do i1=1,5
   If (Eig(i1).Lt.0._dp) Then 
    MChi_t(i1) = - Eig(i1) 
    ZN_1L(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi_t(i1) = Eig(i1) 
    ZN_1L(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
Do i1=1,4
  Do i2=i1+1,5
    If (Abs(MChi_t(i1)).Gt.Abs(MChi_t(i2))) Then 
      Eig(1) = MChi_t(i1) 
      MChi_t(i1) = MChi_t(i2) 
      MChi_t(i2) = Eig(1) 
      E5 = ZN_1L(i1,:) 
      ZN_1L(i1,:) = ZN_1L(i2,:) 
      ZN_1L(i2,:) = E5
    End If 
   End Do 
End Do 
 
ZNOS_0 = ZN_1L 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZN_1L, ierr, test) 
mat2 = Matmul( Conjg(ZN_1L), Matmul( mat1, Transpose( Conjg(ZN_1L)))) 
Do i1=1,5
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZN_1L(i1,:)= phaseM * ZN_1L(i1,:) 
End if 
ZNOS_0 = ZN_1L 
 End Do 
End If 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=5,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MChi2(il)
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,MFu,MFu2,               & 
& MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,        & 
& cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,           & 
& cplUChiChiVZL,cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,   & 
& cplUChiFucSuL,cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,              & 
& cplUChiFvSvReR,cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,            & 
& cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,               & 
& cplcChaUChiVWmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZNa,ierr,test) 
 
   Do i1=1,5
   If (Eig(i1).Lt.0._dp) Then 
    MChi_t(i1) = - Eig(i1) 
    ZN_1L(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi_t(i1) = Eig(i1) 
    ZN_1L(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
Do i1=1,4
  Do i2=i1+1,5
    If (Abs(MChi_t(i1)).Gt.Abs(MChi_t(i2))) Then 
      Eig(1) = MChi_t(i1) 
      MChi_t(i1) = MChi_t(i2) 
      MChi_t(i2) = Eig(1) 
      E5 = ZN_1L(i1,:) 
      ZN_1L(i1,:) = ZN_1L(i2,:) 
      ZN_1L(i2,:) = E5
    End If 
   End Do 
End Do 
 
MChi_1L(iL) = MChi_t(iL) 
MChi2_1L(iL) = MChi_t(iL)**2 
ZNOS_p2(il,:) = ZN_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZN_1L, ierr, test) 
mat2 = Matmul( Conjg(ZN_1L), Matmul( mat1, Transpose( Conjg(ZN_1L)))) 
Do i1=1,5
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZN_1L(i1,:)= phaseM * ZN_1L(i1,:) 
End if 
ZNOS_p2(il,:) = ZN_1L(il,:) 
   If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MChi_1L = Sqrt( Eig ) 
 
MChi2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MChi2_1L(iL)
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,MFu,MFu2,               & 
& MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,        & 
& cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,           & 
& cplUChiChiVZL,cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,   & 
& cplUChiFucSuL,cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,              & 
& cplUChiFvSvReR,cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,            & 
& cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,               & 
& cplcChaUChiVWmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZNa,ierr,test) 
 
   Do i1=1,5
   If (Eig(i1).Lt.0._dp) Then 
    MChi_t(i1) = - Eig(i1) 
    ZN_1L(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi_t(i1) = Eig(i1) 
    ZN_1L(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
Do i1=1,4
  Do i2=i1+1,5
    If (Abs(MChi_t(i1)).Gt.Abs(MChi_t(i2))) Then 
      Eig(1) = MChi_t(i1) 
      MChi_t(i1) = MChi_t(i2) 
      MChi_t(i2) = Eig(1) 
      E5 = ZN_1L(i1,:) 
      ZN_1L(i1,:) = ZN_1L(i2,:) 
      ZN_1L(i2,:) = E5
    End If 
   End Do 
End Do 
 
MChi_1L(iL) = MChi_t(iL) 
MChi2_1L(iL) = MChi_t(iL)**2 
ZNOS_p2(il,:) = ZN_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZN_1L, ierr, test) 
mat2 = Matmul( Conjg(ZN_1L), Matmul( mat1, Transpose( Conjg(ZN_1L)))) 
Do i1=1,5
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZN_1L(i1,:)= phaseM * ZN_1L(i1,:) 
End if 
ZNOS_p2(il,:) = ZN_1L(il,:) 
   If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MChi_1L = Sqrt( Eig ) 
 
MChi2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MChi2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MChi2_1L(il))
End If 
If (Abs(MChi2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopChi
 
 
Subroutine Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,           & 
& MVWm2,Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,MFu,              & 
& MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,   & 
& cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,           & 
& cplUChiChiVZL,cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,   & 
& cplUChiFucSuL,cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,cplUChiFvSvReL,              & 
& cplUChiFvSvReR,cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,cplcFdUChiSdR,            & 
& cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL,               & 
& cplcChaUChiVWmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MChi(5),MChi2(5),MAh(3),MAh2(3),MHpm(2),MHpm2(2),MCha(2),MCha2(2),MVWm,               & 
& MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MSd(6),MSd2(6),MFd(3),MFd2(3),MSe(6),MSe2(6),            & 
& MFe(3),MFe2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MSvIm(9),MSvIm2(9),MFv(9),MFv2(9),        & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplUChiChiAhL(5,5,3),cplUChiChiAhR(5,5,3),cplUChiChacHpmL(5,2,2),cplUChiChacHpmR(5,2,2),& 
& cplUChiChacVWmL(5,2),cplUChiChacVWmR(5,2),cplUChiChihhL(5,5,3),cplUChiChihhR(5,5,3),   & 
& cplUChiChiVZL(5,5),cplUChiChiVZR(5,5),cplUChiFdcSdL(5,3,6),cplUChiFdcSdR(5,3,6),       & 
& cplUChiFecSeL(5,3,6),cplUChiFecSeR(5,3,6),cplUChiFucSuL(5,3,6),cplUChiFucSuR(5,3,6),   & 
& cplUChiFvSvImL(5,9,9),cplUChiFvSvImR(5,9,9),cplUChiFvSvReL(5,9,9),cplUChiFvSvReR(5,9,9),& 
& cplcChaUChiHpmL(2,5,2),cplcChaUChiHpmR(2,5,2),cplcFdUChiSdL(3,5,6),cplcFdUChiSdR(3,5,6),& 
& cplcFeUChiSeL(3,5,6),cplcFeUChiSeR(3,5,6),cplcFuUChiSuL(3,5,6),cplcFuUChiSuR(3,5,6),   & 
& cplcChaUChiVWmL(2,5),cplcChaUChiVWmR(2,5)

Complex(dp), Intent(out) :: SigL(5,5),SigR(5,5), SigSL(5,5), SigSR(5,5) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(5,5), sumR(5,5), sumSL(5,5), sumSR(5,5) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Chi, Ah 
!------------------------ 
    Do i1 = 1, 5
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MChi(i1)*Real(SA_B0(p2,MChi2(i1),MAh2(i2)),dp) 
coupL1 = cplUChiChiAhL(gO1,i1,i2)
coupR1 = cplUChiChiAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUChiChiAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUChiChiAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Cha 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MCha(i2)*Real(SA_B0(p2,MCha2(i2),MHpm2(i1)),dp) 
coupL1 = cplUChiChacHpmL(gO1,i2,i1)
coupR1 = cplUChiChacHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiChacHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiChacHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -4._dp*(Real(SA_B1(p2,MCha2(i2),MVWm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MCha(i2)*(Real(SA_B0(p2,MCha2(i2),MVWm2),dp) - 0.5_dp*rMS) 
coupL1 = cplUChiChacVWmL(gO1,i2)
coupR1 = cplUChiChacVWmR(gO1,i2)
coupL2 =  Conjg(cplUChiChacVWmL(gO2,i2))
coupR2 =  Conjg(cplUChiChacVWmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Chi 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_B0(p2,MChi2(i2),Mhh2(i1)),dp) 
coupL1 = cplUChiChihhL(gO1,i2,i1)
coupR1 = cplUChiChihhR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiChihhL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiChihhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Chi 
!------------------------ 
      Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -4._dp*(Real(SA_B1(p2,MChi2(i2),MVZ2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MChi(i2)*(Real(SA_B0(p2,MChi2(i2),MVZ2),dp) - 0.5_dp*rMS) 
coupL1 = cplUChiChiVZL(gO1,i2)
coupR1 = cplUChiChiVZR(gO1,i2)
coupL2 =  Conjg(cplUChiChiVZL(gO2,i2))
coupR2 =  Conjg(cplUChiChiVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Sd], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MSd2(i1)),dp) 
B0m2 = 2._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MSd2(i1)),dp) 
coupL1 = cplUChiFdcSdL(gO1,i2,i1)
coupR1 = cplUChiFdcSdR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFdcSdL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFdcSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Fe 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MSe2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MSe2(i1)),dp) 
coupL1 = cplUChiFecSeL(gO1,i2,i1)
coupR1 = cplUChiFecSeR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFecSeL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFecSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Fu 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MSu2(i1)),dp) 
B0m2 = 2._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MSu2(i1)),dp) 
coupL1 = cplUChiFucSuL(gO1,i2,i1)
coupR1 = cplUChiFucSuR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFucSuL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFucSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Fv 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MSvIm2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MSvIm2(i1)),dp) 
coupL1 = cplUChiFvSvImL(gO1,i2,i1)
coupR1 = cplUChiFvSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFvSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFvSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Fv 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MSvRe2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MSvRe2(i1)),dp) 
coupL1 = cplUChiFvSvReL(gO1,i2,i1)
coupR1 = cplUChiFvSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFvSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFvSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Hpm 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i1),MHpm2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*Real(SA_B0(p2,MCha2(i1),MHpm2(i2)),dp) 
coupL1 = cplcChaUChiHpmL(i1,gO1,i2)
coupR1 = cplcChaUChiHpmR(i1,gO1,i2)
coupL2 =  Conjg(cplcChaUChiHpmL(i1,gO2,i2))
coupR2 =  Conjg(cplcChaUChiHpmR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i1),MSd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*Real(SA_B0(p2,MFd2(i1),MSd2(i2)),dp) 
coupL1 = cplcFdUChiSdL(i1,gO1,i2)
coupR1 = cplcFdUChiSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcFdUChiSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcFdUChiSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Se 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i1),MSe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*Real(SA_B0(p2,MFe2(i1),MSe2(i2)),dp) 
coupL1 = cplcFeUChiSeL(i1,gO1,i2)
coupR1 = cplcFeUChiSeR(i1,gO1,i2)
coupL2 =  Conjg(cplcFeUChiSeL(i1,gO2,i2))
coupR2 =  Conjg(cplcFeUChiSeR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Su 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i1),MSu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*Real(SA_B0(p2,MFu2(i1),MSu2(i2)),dp) 
coupL1 = cplcFuUChiSuL(i1,gO1,i2)
coupR1 = cplcFuUChiSuR(i1,gO1,i2)
coupL2 =  Conjg(cplcFuUChiSuL(i1,gO2,i2))
coupR2 =  Conjg(cplcFuUChiSuR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], VWm 
!------------------------ 
    Do i1 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -4._dp*(Real(SA_B1(p2,MCha2(i1),MVWm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MCha(i1)*(Real(SA_B0(p2,MCha2(i1),MVWm2),dp) - 0.5_dp*rMS) 
coupL1 = cplcChaUChiVWmL(i1,gO1)
coupR1 = cplcChaUChiVWmR(i1,gO1)
coupL2 =  Conjg(cplcChaUChiVWmL(i1,gO2))
coupR2 =  Conjg(cplcChaUChiVWmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopChi 
 
Subroutine DerSigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,             & 
& MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,             & 
& MFu,MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplUChiChiAhL,cplUChiChiAhR,               & 
& cplUChiChacHpmL,cplUChiChacHpmR,cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,         & 
& cplUChiChihhR,cplUChiChiVZL,cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,   & 
& cplUChiFecSeR,cplUChiFucSuL,cplUChiFucSuR,cplUChiFvSvImL,cplUChiFvSvImR,               & 
& cplUChiFvSvReL,cplUChiFvSvReR,cplcChaUChiHpmL,cplcChaUChiHpmR,cplcFdUChiSdL,           & 
& cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,cplcChaUChiVWmL, & 
& cplcChaUChiVWmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MChi(5),MChi2(5),MAh(3),MAh2(3),MHpm(2),MHpm2(2),MCha(2),MCha2(2),MVWm,               & 
& MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MSd(6),MSd2(6),MFd(3),MFd2(3),MSe(6),MSe2(6),            & 
& MFe(3),MFe2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MSvIm(9),MSvIm2(9),MFv(9),MFv2(9),        & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplUChiChiAhL(5,5,3),cplUChiChiAhR(5,5,3),cplUChiChacHpmL(5,2,2),cplUChiChacHpmR(5,2,2),& 
& cplUChiChacVWmL(5,2),cplUChiChacVWmR(5,2),cplUChiChihhL(5,5,3),cplUChiChihhR(5,5,3),   & 
& cplUChiChiVZL(5,5),cplUChiChiVZR(5,5),cplUChiFdcSdL(5,3,6),cplUChiFdcSdR(5,3,6),       & 
& cplUChiFecSeL(5,3,6),cplUChiFecSeR(5,3,6),cplUChiFucSuL(5,3,6),cplUChiFucSuR(5,3,6),   & 
& cplUChiFvSvImL(5,9,9),cplUChiFvSvImR(5,9,9),cplUChiFvSvReL(5,9,9),cplUChiFvSvReR(5,9,9),& 
& cplcChaUChiHpmL(2,5,2),cplcChaUChiHpmR(2,5,2),cplcFdUChiSdL(3,5,6),cplcFdUChiSdR(3,5,6),& 
& cplcFeUChiSeL(3,5,6),cplcFeUChiSeR(3,5,6),cplcFuUChiSuL(3,5,6),cplcFuUChiSuR(3,5,6),   & 
& cplcChaUChiVWmL(2,5),cplcChaUChiVWmR(2,5)

Complex(dp), Intent(out) :: SigL(5,5),SigR(5,5), SigSL(5,5), SigSR(5,5) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(5,5), sumR(5,5), sumSL(5,5), sumSR(5,5) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Chi, Ah 
!------------------------ 
    Do i1 = 1, 5
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MChi(i1)*Real(SA_DerB0(p2,MChi2(i1),MAh2(i2)),dp) 
coupL1 = cplUChiChiAhL(gO1,i1,i2)
coupR1 = cplUChiChiAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUChiChiAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUChiChiAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Cha 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MHpm2(i1)),dp) 
coupL1 = cplUChiChacHpmL(gO1,i2,i1)
coupR1 = cplUChiChacHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiChacHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiChacHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -4._dp*(Real(SA_DerB1(p2,MCha2(i2),MVWm2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MCha(i2)*(Real(SA_DerB0(p2,MCha2(i2),MVWm2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUChiChacVWmL(gO1,i2)
coupR1 = cplUChiChacVWmR(gO1,i2)
coupL2 =  Conjg(cplUChiChacVWmL(gO2,i2))
coupR2 =  Conjg(cplUChiChacVWmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Chi 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),Mhh2(i1)),dp) 
coupL1 = cplUChiChihhL(gO1,i2,i1)
coupR1 = cplUChiChihhR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiChihhL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiChihhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Chi 
!------------------------ 
      Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -4._dp*(Real(SA_DerB1(p2,MChi2(i2),MVZ2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MChi(i2)*(Real(SA_DerB0(p2,MChi2(i2),MVZ2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUChiChiVZL(gO1,i2)
coupR1 = cplUChiChiVZR(gO1,i2)
coupL2 =  Conjg(cplUChiChiVZL(gO2,i2))
coupR2 =  Conjg(cplUChiChiVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Sd], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MSd2(i1)),dp) 
B0m2 = 2._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MSd2(i1)),dp) 
coupL1 = cplUChiFdcSdL(gO1,i2,i1)
coupR1 = cplUChiFdcSdR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFdcSdL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFdcSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Fe 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MSe2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MSe2(i1)),dp) 
coupL1 = cplUChiFecSeL(gO1,i2,i1)
coupR1 = cplUChiFecSeR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFecSeL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFecSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Fu 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MSu2(i1)),dp) 
B0m2 = 2._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MSu2(i1)),dp) 
coupL1 = cplUChiFucSuL(gO1,i2,i1)
coupR1 = cplUChiFucSuR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFucSuL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFucSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Fv 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),MSvIm2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MSvIm2(i1)),dp) 
coupL1 = cplUChiFvSvImL(gO1,i2,i1)
coupR1 = cplUChiFvSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFvSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFvSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Fv 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),MSvRe2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MSvRe2(i1)),dp) 
coupL1 = cplUChiFvSvReL(gO1,i2,i1)
coupR1 = cplUChiFvSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplUChiFvSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplUChiFvSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Hpm 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i1),MHpm2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*Real(SA_DerB0(p2,MCha2(i1),MHpm2(i2)),dp) 
coupL1 = cplcChaUChiHpmL(i1,gO1,i2)
coupR1 = cplcChaUChiHpmR(i1,gO1,i2)
coupL2 =  Conjg(cplcChaUChiHpmL(i1,gO2,i2))
coupR2 =  Conjg(cplcChaUChiHpmR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i1),MSd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*Real(SA_DerB0(p2,MFd2(i1),MSd2(i2)),dp) 
coupL1 = cplcFdUChiSdL(i1,gO1,i2)
coupR1 = cplcFdUChiSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcFdUChiSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcFdUChiSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Se 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i1),MSe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*Real(SA_DerB0(p2,MFe2(i1),MSe2(i2)),dp) 
coupL1 = cplcFeUChiSeL(i1,gO1,i2)
coupR1 = cplcFeUChiSeR(i1,gO1,i2)
coupL2 =  Conjg(cplcFeUChiSeL(i1,gO2,i2))
coupR2 =  Conjg(cplcFeUChiSeR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Su 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i1),MSu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MSu2(i2)),dp) 
coupL1 = cplcFuUChiSuL(i1,gO1,i2)
coupR1 = cplcFuUChiSuR(i1,gO1,i2)
coupL2 =  Conjg(cplcFuUChiSuL(i1,gO2,i2))
coupR2 =  Conjg(cplcFuUChiSuR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp/2._dp* sumL
SigR = SigR +3._dp/2._dp* sumR 
SigSL = SigSL +3._dp/2._dp* sumSL 
SigSR = SigSR +3._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], VWm 
!------------------------ 
    Do i1 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 5
  Do gO2 = 1, 5
B1m2 = -4._dp*(Real(SA_DerB1(p2,MCha2(i1),MVWm2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MCha(i1)*(Real(SA_DerB0(p2,MCha2(i1),MVWm2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplcChaUChiVWmL(i1,gO1)
coupR1 = cplcChaUChiVWmR(i1,gO1)
coupL2 =  Conjg(cplcChaUChiVWmL(i1,gO2))
coupR2 =  Conjg(cplcChaUChiVWmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopChi 
 
Subroutine OneLoopFv(MUX,lamN,Yv,vu,vS,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,               & 
& MCha2,MSvIm,MSvIm2,MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,             & 
& Mhh,Mhh2,MVZ,MVZ2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,  & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVZL,cplUFvFvVZR,           & 
& cplcFeUFvHpmL,cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,   & 
& delta,MFv_1L,MFv2_1L,UV_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFv(9),MFv2(9),MAh(3),MAh2(3),MSe(6),MSe2(6),MCha(2),MCha2(2),MSvIm(9),               & 
& MSvIm2(9),MChi(5),MChi2(5),MSvRe(9),MSvRe2(9),MHpm(2),MHpm2(2),MFe(3),MFe2(3),         & 
& MVWm,MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2

Real(dp), Intent(in) :: vu,vS

Complex(dp), Intent(in) :: MUX(3,3),lamN(3,3),Yv(3,3)

Complex(dp), Intent(in) :: cplUFvFvAhL(9,9,3),cplUFvFvAhR(9,9,3),cplUFvChacSeL(9,2,6),cplUFvChacSeR(9,2,6),      & 
& cplChiUFvSvImL(5,9,9),cplChiUFvSvImR(5,9,9),cplChiUFvSvReL(5,9,9),cplChiUFvSvReR(5,9,9),& 
& cplUFvFecHpmL(9,3,2),cplUFvFecHpmR(9,3,2),cplUFvFecVWmL(9,3),cplUFvFecVWmR(9,3),       & 
& cplUFvFvhhL(9,9,3),cplUFvFvhhR(9,9,3),cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),               & 
& cplcFeUFvHpmL(3,9,2),cplcFeUFvHpmR(3,9,2),cplcChaUFvSeL(2,9,6),cplcChaUFvSeR(2,9,6),   & 
& cplcFeUFvVWmL(3,9),cplcFeUFvVWmR(3,9)

Complex(dp) :: mat1a(9,9), mat1(9,9), mat2(9,9) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(9), test_m2(9),p2 
Real(dp), Intent(out) :: MFv_1L(9),MFv2_1L(9) 
Complex(dp), Intent(out) ::  UV_1L(9,9) 
Real(dp) :: MFv_t(9),MFv2_t(9) 
Complex(dp) ::  UV_t(9,9) 
Complex(dp) ::  phaseM, E9(9), sigL(9,9), sigR(9,9), sigSL(9,9), sigSR(9,9) 
Real(dp) :: UVa(9,9), test(2), eig(9) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(vu*Yv(1,1))/sqrt(2._dp)
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+(vu*Yv(2,1))/sqrt(2._dp)
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)+(vu*Yv(3,1))/sqrt(2._dp)
mat1a(1,7) = 0._dp 
mat1a(1,8) = 0._dp 
mat1a(1,9) = 0._dp 
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)+(vu*Yv(1,2))/sqrt(2._dp)
mat1a(2,5) = 0._dp 
mat1a(2,5) = mat1a(2,5)+(vu*Yv(2,2))/sqrt(2._dp)
mat1a(2,6) = 0._dp 
mat1a(2,6) = mat1a(2,6)+(vu*Yv(3,2))/sqrt(2._dp)
mat1a(2,7) = 0._dp 
mat1a(2,8) = 0._dp 
mat1a(2,9) = 0._dp 
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)+(vu*Yv(1,3))/sqrt(2._dp)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)+(vu*Yv(2,3))/sqrt(2._dp)
mat1a(3,6) = 0._dp 
mat1a(3,6) = mat1a(3,6)+(vu*Yv(3,3))/sqrt(2._dp)
mat1a(3,7) = 0._dp 
mat1a(3,8) = 0._dp 
mat1a(3,9) = 0._dp 
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(vu*Yv(1,1))/sqrt(2._dp)
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)+(vu*Yv(1,2))/sqrt(2._dp)
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)+(vu*Yv(1,3))/sqrt(2._dp)
mat1a(4,4) = 0._dp 
mat1a(4,5) = 0._dp 
mat1a(4,6) = 0._dp 
mat1a(4,7) = 0._dp 
mat1a(4,7) = mat1a(4,7)+(vS*lamN(1,1))/sqrt(2._dp)
mat1a(4,8) = 0._dp 
mat1a(4,8) = mat1a(4,8)+(vS*lamN(1,2))/sqrt(2._dp)
mat1a(4,9) = 0._dp 
mat1a(4,9) = mat1a(4,9)+(vS*lamN(1,3))/sqrt(2._dp)
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+(vu*Yv(2,1))/sqrt(2._dp)
mat1a(5,2) = 0._dp 
mat1a(5,2) = mat1a(5,2)+(vu*Yv(2,2))/sqrt(2._dp)
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)+(vu*Yv(2,3))/sqrt(2._dp)
mat1a(5,4) = 0._dp 
mat1a(5,5) = 0._dp 
mat1a(5,6) = 0._dp 
mat1a(5,7) = 0._dp 
mat1a(5,7) = mat1a(5,7)+(vS*lamN(2,1))/sqrt(2._dp)
mat1a(5,8) = 0._dp 
mat1a(5,8) = mat1a(5,8)+(vS*lamN(2,2))/sqrt(2._dp)
mat1a(5,9) = 0._dp 
mat1a(5,9) = mat1a(5,9)+(vS*lamN(2,3))/sqrt(2._dp)
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)+(vu*Yv(3,1))/sqrt(2._dp)
mat1a(6,2) = 0._dp 
mat1a(6,2) = mat1a(6,2)+(vu*Yv(3,2))/sqrt(2._dp)
mat1a(6,3) = 0._dp 
mat1a(6,3) = mat1a(6,3)+(vu*Yv(3,3))/sqrt(2._dp)
mat1a(6,4) = 0._dp 
mat1a(6,5) = 0._dp 
mat1a(6,6) = 0._dp 
mat1a(6,7) = 0._dp 
mat1a(6,7) = mat1a(6,7)+(vS*lamN(3,1))/sqrt(2._dp)
mat1a(6,8) = 0._dp 
mat1a(6,8) = mat1a(6,8)+(vS*lamN(3,2))/sqrt(2._dp)
mat1a(6,9) = 0._dp 
mat1a(6,9) = mat1a(6,9)+(vS*lamN(3,3))/sqrt(2._dp)
mat1a(7,1) = 0._dp 
mat1a(7,2) = 0._dp 
mat1a(7,3) = 0._dp 
mat1a(7,4) = 0._dp 
mat1a(7,4) = mat1a(7,4)+(vS*lamN(1,1))/sqrt(2._dp)
mat1a(7,5) = 0._dp 
mat1a(7,5) = mat1a(7,5)+(vS*lamN(2,1))/sqrt(2._dp)
mat1a(7,6) = 0._dp 
mat1a(7,6) = mat1a(7,6)+(vS*lamN(3,1))/sqrt(2._dp)
mat1a(7,7) = 0._dp 
mat1a(7,7) = mat1a(7,7)+MUX(1,1)
mat1a(7,8) = 0._dp 
mat1a(7,8) = mat1a(7,8)+MUX(1,2)/2._dp
mat1a(7,8) = mat1a(7,8)+MUX(2,1)/2._dp
mat1a(7,9) = 0._dp 
mat1a(7,9) = mat1a(7,9)+MUX(1,3)/2._dp
mat1a(7,9) = mat1a(7,9)+MUX(3,1)/2._dp
mat1a(8,1) = 0._dp 
mat1a(8,2) = 0._dp 
mat1a(8,3) = 0._dp 
mat1a(8,4) = 0._dp 
mat1a(8,4) = mat1a(8,4)+(vS*lamN(1,2))/sqrt(2._dp)
mat1a(8,5) = 0._dp 
mat1a(8,5) = mat1a(8,5)+(vS*lamN(2,2))/sqrt(2._dp)
mat1a(8,6) = 0._dp 
mat1a(8,6) = mat1a(8,6)+(vS*lamN(3,2))/sqrt(2._dp)
mat1a(8,7) = 0._dp 
mat1a(8,7) = mat1a(8,7)+MUX(1,2)/2._dp
mat1a(8,7) = mat1a(8,7)+MUX(2,1)/2._dp
mat1a(8,8) = 0._dp 
mat1a(8,8) = mat1a(8,8)+MUX(2,2)
mat1a(8,9) = 0._dp 
mat1a(8,9) = mat1a(8,9)+MUX(2,3)/2._dp
mat1a(8,9) = mat1a(8,9)+MUX(3,2)/2._dp
mat1a(9,1) = 0._dp 
mat1a(9,2) = 0._dp 
mat1a(9,3) = 0._dp 
mat1a(9,4) = 0._dp 
mat1a(9,4) = mat1a(9,4)+(vS*lamN(1,3))/sqrt(2._dp)
mat1a(9,5) = 0._dp 
mat1a(9,5) = mat1a(9,5)+(vS*lamN(2,3))/sqrt(2._dp)
mat1a(9,6) = 0._dp 
mat1a(9,6) = mat1a(9,6)+(vS*lamN(3,3))/sqrt(2._dp)
mat1a(9,7) = 0._dp 
mat1a(9,7) = mat1a(9,7)+MUX(1,3)/2._dp
mat1a(9,7) = mat1a(9,7)+MUX(3,1)/2._dp
mat1a(9,8) = 0._dp 
mat1a(9,8) = mat1a(9,8)+MUX(2,3)/2._dp
mat1a(9,8) = mat1a(9,8)+MUX(3,2)/2._dp
mat1a(9,9) = 0._dp 
mat1a(9,9) = mat1a(9,9)+MUX(3,3)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,              & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,cplChiUFvSvImR,     & 
& cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,cplUFvFecVWmL,               & 
& cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVZL,cplUFvFvVZR,cplcFeUFvHpmL,           & 
& cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,sigL,            & 
& sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,9
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E9 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E9
    End If 
   End Do 
End Do 
 
UVOS_0 = UV_1L 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call EigensystemQP(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,9
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_0 = UV_1L 
 End Do 
End If 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=9,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,              & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,cplChiUFvSvImR,     & 
& cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,cplUFvFecVWmL,               & 
& cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVZL,cplUFvFvVZR,cplcFeUFvHpmL,           & 
& cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,sigL,            & 
& sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,9
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E9 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E9
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call EigensystemQP(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,9
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,              & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,cplChiUFvSvImR,     & 
& cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,cplUFvFecVWmL,               & 
& cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVZL,cplUFvFvVZR,cplcFeUFvHpmL,           & 
& cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,sigL,            & 
& sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,9
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E9 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E9
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call EigensystemQP(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,9
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,               & 
& MSvIm2,MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,            & 
& MVZ2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,               & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVZL,cplUFvFvVZR,           & 
& cplcFeUFvHpmL,cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,   & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFv(9),MFv2(9),MAh(3),MAh2(3),MSe(6),MSe2(6),MCha(2),MCha2(2),MSvIm(9),               & 
& MSvIm2(9),MChi(5),MChi2(5),MSvRe(9),MSvRe2(9),MHpm(2),MHpm2(2),MFe(3),MFe2(3),         & 
& MVWm,MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: cplUFvFvAhL(9,9,3),cplUFvFvAhR(9,9,3),cplUFvChacSeL(9,2,6),cplUFvChacSeR(9,2,6),      & 
& cplChiUFvSvImL(5,9,9),cplChiUFvSvImR(5,9,9),cplChiUFvSvReL(5,9,9),cplChiUFvSvReR(5,9,9),& 
& cplUFvFecHpmL(9,3,2),cplUFvFecHpmR(9,3,2),cplUFvFecVWmL(9,3),cplUFvFecVWmR(9,3),       & 
& cplUFvFvhhL(9,9,3),cplUFvFvhhR(9,9,3),cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),               & 
& cplcFeUFvHpmL(3,9,2),cplcFeUFvHpmR(3,9,2),cplcChaUFvSeL(2,9,6),cplcChaUFvSeR(2,9,6),   & 
& cplcFeUFvVWmL(3,9),cplcFeUFvVWmR(3,9)

Complex(dp), Intent(out) :: SigL(9,9),SigR(9,9), SigSL(9,9), SigSR(9,9) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(9,9), sumR(9,9), sumSL(9,9), sumSR(9,9) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*Real(SA_B0(p2,MFv2(i1),MAh2(i2)),dp) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i2),MSe2(i1)),dp) 
B0m2 = 2._dp*MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSe2(i1)),dp) 
coupL1 = cplUFvChacSeL(gO1,i2,i1)
coupR1 = cplUFvChacSeR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvChacSeL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvChacSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Chi 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i2),MSvIm2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSvIm2(i1)),dp) 
coupL1 = cplChiUFvSvImL(i2,gO1,i1)
coupR1 = cplChiUFvSvImR(i2,gO1,i1)
coupL2 =  Conjg(cplChiUFvSvImL(i2,gO2,i1))
coupR2 =  Conjg(cplChiUFvSvImR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Chi 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i2),MSvRe2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSvRe2(i1)),dp) 
coupL1 = cplChiUFvSvReL(i2,gO1,i1)
coupR1 = cplChiUFvSvReR(i2,gO1,i1)
coupL2 =  Conjg(cplChiUFvSvReL(i2,gO2,i1))
coupR2 =  Conjg(cplChiUFvSvReR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MHpm2(i1)),dp) 
coupL1 = cplUFvFecHpmL(gO1,i2,i1)
coupR1 = cplUFvFecHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFecHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFecHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i2),MVWm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_B0(p2,MFe2(i2),MVWm2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFecVWmL(gO1,i2)
coupR1 = cplUFvFecVWmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fv 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),Mhh2(i1)),dp) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], Hpm 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i1),MHpm2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*Real(SA_B0(p2,MFe2(i1),MHpm2(i2)),dp) 
coupL1 = cplcFeUFvHpmL(i1,gO1,i2)
coupR1 = cplcFeUFvHpmR(i1,gO1,i2)
coupL2 =  Conjg(cplcFeUFvHpmL(i1,gO2,i2))
coupR2 =  Conjg(cplcFeUFvHpmR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Se 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i1),MSe2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*Real(SA_B0(p2,MCha2(i1),MSe2(i2)),dp) 
coupL1 = cplcChaUFvSeL(i1,gO1,i2)
coupR1 = cplcChaUFvSeR(i1,gO1,i2)
coupL2 =  Conjg(cplcChaUFvSeL(i1,gO2,i2))
coupR2 =  Conjg(cplcChaUFvSeR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], VWm 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i1),MVWm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_B0(p2,MFe2(i1),MVWm2),dp) - 0.5_dp*rMS) 
coupL1 = cplcFeUFvVWmL(i1,gO1)
coupR1 = cplcFeUFvVWmR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWmL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFv 
 
Subroutine DerSigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,            & 
& MSvIm2,MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,            & 
& MVZ2,cplUFvFvAhL,cplUFvFvAhR,cplUFvChacSeL,cplUFvChacSeR,cplChiUFvSvImL,               & 
& cplChiUFvSvImR,cplChiUFvSvReL,cplChiUFvSvReR,cplUFvFecHpmL,cplUFvFecHpmR,              & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVZL,cplUFvFvVZR,           & 
& cplcFeUFvHpmL,cplcFeUFvHpmR,cplcChaUFvSeL,cplcChaUFvSeR,cplcFeUFvVWmL,cplcFeUFvVWmR,   & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFv(9),MFv2(9),MAh(3),MAh2(3),MSe(6),MSe2(6),MCha(2),MCha2(2),MSvIm(9),               & 
& MSvIm2(9),MChi(5),MChi2(5),MSvRe(9),MSvRe2(9),MHpm(2),MHpm2(2),MFe(3),MFe2(3),         & 
& MVWm,MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: cplUFvFvAhL(9,9,3),cplUFvFvAhR(9,9,3),cplUFvChacSeL(9,2,6),cplUFvChacSeR(9,2,6),      & 
& cplChiUFvSvImL(5,9,9),cplChiUFvSvImR(5,9,9),cplChiUFvSvReL(5,9,9),cplChiUFvSvReR(5,9,9),& 
& cplUFvFecHpmL(9,3,2),cplUFvFecHpmR(9,3,2),cplUFvFecVWmL(9,3),cplUFvFecVWmR(9,3),       & 
& cplUFvFvhhL(9,9,3),cplUFvFvhhR(9,9,3),cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),               & 
& cplcFeUFvHpmL(3,9,2),cplcFeUFvHpmR(3,9,2),cplcChaUFvSeL(2,9,6),cplcChaUFvSeR(2,9,6),   & 
& cplcFeUFvVWmL(3,9),cplcFeUFvVWmR(3,9)

Complex(dp), Intent(out) :: SigL(9,9),SigR(9,9), SigSL(9,9), SigSR(9,9) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(9,9), sumR(9,9), sumSL(9,9), sumSR(9,9) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*Real(SA_DerB0(p2,MFv2(i1),MAh2(i2)),dp) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i2),MSe2(i1)),dp) 
B0m2 = 2._dp*MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MSe2(i1)),dp) 
coupL1 = cplUFvChacSeL(gO1,i2,i1)
coupR1 = cplUFvChacSeR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvChacSeL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvChacSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Chi 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i2),MSvIm2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSvIm2(i1)),dp) 
coupL1 = cplChiUFvSvImL(i2,gO1,i1)
coupR1 = cplChiUFvSvImR(i2,gO1,i1)
coupL2 =  Conjg(cplChiUFvSvImL(i2,gO2,i1))
coupR2 =  Conjg(cplChiUFvSvImR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Chi 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i2),MSvRe2(i1)),dp) 
B0m2 = 2._dp*MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSvRe2(i1)),dp) 
coupL1 = cplChiUFvSvReL(i2,gO1,i1)
coupR1 = cplChiUFvSvReR(i2,gO1,i1)
coupL2 =  Conjg(cplChiUFvSvReL(i2,gO2,i1))
coupR2 =  Conjg(cplChiUFvSvReR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MHpm2(i1)),dp) 
coupL1 = cplUFvFecHpmL(gO1,i2,i1)
coupR1 = cplUFvFecHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFecHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFecHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFe2(i2),MVWm2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_DerB0(p2,MFe2(i2),MVWm2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFecVWmL(gO1,i2)
coupR1 = cplUFvFecVWmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fv 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),Mhh2(i1)),dp) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_DerB0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], Hpm 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i1),MHpm2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*Real(SA_DerB0(p2,MFe2(i1),MHpm2(i2)),dp) 
coupL1 = cplcFeUFvHpmL(i1,gO1,i2)
coupR1 = cplcFeUFvHpmR(i1,gO1,i2)
coupL2 =  Conjg(cplcFeUFvHpmL(i1,gO2,i2))
coupR2 =  Conjg(cplcFeUFvHpmR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Se 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i1),MSe2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*Real(SA_DerB0(p2,MCha2(i1),MSe2(i2)),dp) 
coupL1 = cplcChaUFvSeL(i1,gO1,i2)
coupR1 = cplcChaUFvSeR(i1,gO1,i2)
coupL2 =  Conjg(cplcChaUFvSeL(i1,gO2,i2))
coupR2 =  Conjg(cplcChaUFvSeR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], VWm 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFe2(i1),MVWm2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_DerB0(p2,MFe2(i1),MVWm2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplcFeUFvVWmL(i1,gO1)
coupR1 = cplcFeUFvVWmR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWmL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFv 
 
Subroutine OneLoopCha(g2,lam,M2,vd,vu,vS,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MHpm,MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,              & 
& MFe2,MSvRe,MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,   & 
& cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,            & 
& cplcUChaChaVZR,cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,        & 
& cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,         & 
& cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,             & 
& delta,MCha_1L,MCha2_1L,UM_1L,UP_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),MHpm2(2),             & 
& MChi(5),MChi2(5),MVWm,MVWm2,MSu(6),MSu2(6),MFd(3),MFd2(3),MSvIm(9),MSvIm2(9),          & 
& MFe(3),MFe2(3),MSvRe(9),MSvRe2(9),MSe(6),MSe2(6),MFv(9),MFv2(9),MFu(3),MFu2(3),        & 
& MSd(6),MSd2(6)

Real(dp), Intent(in) :: g2,vd,vu,vS

Complex(dp), Intent(in) :: lam,M2

Complex(dp), Intent(in) :: cplcUChaChaAhL(2,2,3),cplcUChaChaAhR(2,2,3),cplcUChaChahhL(2,2,3),cplcUChaChahhR(2,2,3),& 
& cplcUChaChaVPL(2,2),cplcUChaChaVPR(2,2),cplcUChaChaVZL(2,2),cplcUChaChaVZR(2,2),       & 
& cplcUChaChiHpmL(2,5,2),cplcUChaChiHpmR(2,5,2),cplcUChaChiVWmL(2,5),cplcUChaChiVWmR(2,5),& 
& cplcUChaFdcSuL(2,3,6),cplcUChaFdcSuR(2,3,6),cplcUChaFeSvImL(2,3,9),cplcUChaFeSvImR(2,3,9),& 
& cplcUChaFeSvReL(2,3,9),cplcUChaFeSvReR(2,3,9),cplcUChaFvSeL(2,9,6),cplcUChaFvSeR(2,9,6),& 
& cplcUChacFuSdL(2,3,6),cplcUChacFuSdR(2,3,6)

Complex(dp) :: mat1a(2,2), mat1(2,2) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2), p2 
Real(dp), Intent(out) :: MCha_1L(2),MCha2_1L(2) 
 Complex(dp), Intent(out) :: UM_1L(2,2), UP_1L(2,2) 
 
 Real(dp) :: MCha_t(2),MCha2_t(2) 
 Complex(dp) :: UM_t(2,2), UP_t(2,2), sigL(2,2), sigR(2,2), sigSL(2,2), sigSR(2,2) 
 
 Complex(dp) :: mat(2,2)=0._dp, mat2(2,2)=0._dp, phaseM 

Complex(dp) :: UM2(2,2), UP2(2,2) 
 
 Real(dp) :: UM1(2,2), UP1(2,2), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMCha'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+M2
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(g2*vu)/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(g2*vd)/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vS*lam)/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,               & 
& MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,MSvRe,MSvRe2,            & 
& MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,cplcUChaChahhL,      & 
& cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,cplcUChaChaVZR,            & 
& cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,        & 
& cplcUChaFdcSuR,cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,        & 
& cplcUChaFvSeL,cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UP1,ierr,test) 
UP2 = UP1 
Else 
Call EigenSystem(mat2,MCha2_t,UP2,ierr,test) 
 End If 
 
UPOS_0 = UP2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UM1,ierr,test) 
 
 
UM2 = UM1 
Else 
Call EigenSystem(mat2,MCha2_t,UM2,ierr,test) 
 
 
End If 
UM2 = Conjg(UM2) 
UMOS_0 = UM2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=2,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MCha2(il) 
Call Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,               & 
& MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,MSvRe,MSvRe2,            & 
& MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,cplcUChaChahhL,      & 
& cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,cplcUChaChaVZR,            & 
& cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,        & 
& cplcUChaFdcSuR,cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,        & 
& cplcUChaFvSeL,cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UP1,ierr,test) 
UP2 = UP1 
Else 
Call EigenSystem(mat2,MCha2_t,UP2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MCha2_t(iL)
Call Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,               & 
& MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,MSvRe,MSvRe2,            & 
& MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,cplcUChaChahhL,      & 
& cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,cplcUChaChaVZR,            & 
& cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,cplcUChaFdcSuL,        & 
& cplcUChaFdcSuR,cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,cplcUChaFeSvReR,        & 
& cplcUChaFvSeL,cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UP1,ierr,test) 
UP2 = UP1 
Else 
Call EigenSystem(mat2,MCha2_t,UP2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MCha2_1L(il) = MCha2_t(il) 
MCha_1L(il) = Sqrt(MCha2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MCha2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MCha2_1L(il))
End If 
If (Abs(MCha2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2_t,UM1,ierr,test) 
 
 
UM2 = UM1 
Else 
Call EigenSystem(mat2,MCha2_t,UM2,ierr,test) 
 
 
End If 
UM2 = Conjg(UM2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(UM2),mat1),Transpose( Conjg(UP2))) 
Do i1=1,2
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
UP2(i1,:) = phaseM *UP2(i1,:) 
 End if 
End Do 
 
UMOS_p2(il,:) = UM2(il,:) 
 UPOS_p2(il,:) = UP2(il,:) 
 UM_1L = UM2 
 UP_1L = UP2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopCha
 
 
Subroutine Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHpm,               & 
& MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,MSvRe,             & 
& MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,              & 
& cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,            & 
& cplcUChaChaVZR,cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,        & 
& cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,         & 
& cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,             & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),MHpm2(2),             & 
& MChi(5),MChi2(5),MVWm,MVWm2,MSu(6),MSu2(6),MFd(3),MFd2(3),MSvIm(9),MSvIm2(9),          & 
& MFe(3),MFe2(3),MSvRe(9),MSvRe2(9),MSe(6),MSe2(6),MFv(9),MFv2(9),MFu(3),MFu2(3),        & 
& MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUChaChaAhL(2,2,3),cplcUChaChaAhR(2,2,3),cplcUChaChahhL(2,2,3),cplcUChaChahhR(2,2,3),& 
& cplcUChaChaVPL(2,2),cplcUChaChaVPR(2,2),cplcUChaChaVZL(2,2),cplcUChaChaVZR(2,2),       & 
& cplcUChaChiHpmL(2,5,2),cplcUChaChiHpmR(2,5,2),cplcUChaChiVWmL(2,5),cplcUChaChiVWmR(2,5),& 
& cplcUChaFdcSuL(2,3,6),cplcUChaFdcSuR(2,3,6),cplcUChaFeSvImL(2,3,9),cplcUChaFeSvImR(2,3,9),& 
& cplcUChaFeSvReL(2,3,9),cplcUChaFeSvReR(2,3,9),cplcUChaFvSeL(2,9,6),cplcUChaFvSeR(2,9,6),& 
& cplcUChacFuSdL(2,3,6),cplcUChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(2,2),SigR(2,2), SigSL(2,2), SigSR(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(2,2), sumR(2,2), sumSL(2,2), sumSR(2,2) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Cha, Ah 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MCha2(i1),MAh2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_B0(p2,MCha2(i1),MAh2(i2)),dp) 
coupL1 = cplcUChaChaAhL(gO1,i1,i2)
coupR1 = cplcUChaChaAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUChaChaAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUChaChaAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Cha 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MCha2(i2),Mhh2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUChaChahhL(gO1,i2,i1)
coupR1 = cplcUChaChahhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaChahhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaChahhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_B0(p2,MCha2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUChaChaVPL(gO1,i2)
coupR1 = cplcUChaChaVPR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVPL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_B1(p2,MCha2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_B0(p2,MCha2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUChaChaVZL(gO1,i2)
coupR1 = cplcUChaChaVZR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVZL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Chi 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MChi2(i2),MHpm2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUChaChiHpmL(gO1,i2,i1)
coupR1 = cplcUChaChiHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaChiHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaChiHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Chi 
!------------------------ 
      Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_B1(p2,MChi2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MChi(i2)*Real(SA_B0(p2,MChi2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUChaChiVWmL(gO1,i2)
coupR1 = cplcUChaChiVWmR(gO1,i2)
coupL2 =  Conjg(cplcUChaChiVWmL(gO2,i2))
coupR2 =  Conjg(cplcUChaChiVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Su], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFd2(i2),MSu2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MSu2(i1)),dp) 
coupL1 = cplcUChaFdcSuL(gO1,i2,i1)
coupR1 = cplcUChaFdcSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFdcSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFdcSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp* sumL
SigR = SigR +3._dp* sumR 
SigSL = SigSL +3._dp* sumSL 
SigSR = SigSR +3._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Fe 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFe2(i2),MSvIm2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),MSvIm2(i1)),dp) 
coupL1 = cplcUChaFeSvImL(gO1,i2,i1)
coupR1 = cplcUChaFeSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFeSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFeSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Fe 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFe2(i2),MSvRe2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),MSvRe2(i1)),dp) 
coupL1 = cplcUChaFeSvReL(gO1,i2,i1)
coupR1 = cplcUChaFeSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFeSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFeSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Fv 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFv2(i2),MSe2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MSe2(i1)),dp) 
coupL1 = cplcUChaFvSeL(gO1,i2,i1)
coupR1 = cplcUChaFvSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFvSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFvSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_B1(p2,MFu2(i1),MSd2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MSd2(i2)),dp) 
coupL1 = cplcUChacFuSdL(gO1,i1,i2)
coupR1 = cplcUChacFuSdR(gO1,i1,i2)
coupL2 =  Conjg(cplcUChacFuSdL(gO2,i1,i2))
coupR2 =  Conjg(cplcUChacFuSdR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp* sumL
SigR = SigR +3._dp* sumR 
SigSL = SigSL +3._dp* sumSL 
SigSR = SigSR +3._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopCha 
 
Subroutine DerSigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHpm,            & 
& MHpm2,MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,MSvRe,             & 
& MSvRe2,MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcUChaChaAhL,cplcUChaChaAhR,              & 
& cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,cplcUChaChaVZL,            & 
& cplcUChaChaVZR,cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,cplcUChaChiVWmR,        & 
& cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFeSvImL,cplcUChaFeSvImR,cplcUChaFeSvReL,         & 
& cplcUChaFeSvReR,cplcUChaFvSeL,cplcUChaFvSeR,cplcUChacFuSdL,cplcUChacFuSdR,             & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),MHpm2(2),             & 
& MChi(5),MChi2(5),MVWm,MVWm2,MSu(6),MSu2(6),MFd(3),MFd2(3),MSvIm(9),MSvIm2(9),          & 
& MFe(3),MFe2(3),MSvRe(9),MSvRe2(9),MSe(6),MSe2(6),MFv(9),MFv2(9),MFu(3),MFu2(3),        & 
& MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUChaChaAhL(2,2,3),cplcUChaChaAhR(2,2,3),cplcUChaChahhL(2,2,3),cplcUChaChahhR(2,2,3),& 
& cplcUChaChaVPL(2,2),cplcUChaChaVPR(2,2),cplcUChaChaVZL(2,2),cplcUChaChaVZR(2,2),       & 
& cplcUChaChiHpmL(2,5,2),cplcUChaChiHpmR(2,5,2),cplcUChaChiVWmL(2,5),cplcUChaChiVWmR(2,5),& 
& cplcUChaFdcSuL(2,3,6),cplcUChaFdcSuR(2,3,6),cplcUChaFeSvImL(2,3,9),cplcUChaFeSvImR(2,3,9),& 
& cplcUChaFeSvReL(2,3,9),cplcUChaFeSvReR(2,3,9),cplcUChaFvSeL(2,9,6),cplcUChaFvSeR(2,9,6),& 
& cplcUChacFuSdL(2,3,6),cplcUChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(2,2),SigR(2,2), SigSL(2,2), SigSR(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(2,2), sumR(2,2), sumSL(2,2), sumSR(2,2) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Cha, Ah 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MCha2(i1),MAh2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_DerB0(p2,MCha2(i1),MAh2(i2)),dp) 
coupL1 = cplcUChaChaAhL(gO1,i1,i2)
coupR1 = cplcUChaChaAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUChaChaAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUChaChaAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Cha 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MCha2(i2),Mhh2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUChaChahhL(gO1,i2,i1)
coupR1 = cplcUChaChahhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaChahhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaChahhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUChaChaVPL(gO1,i2)
coupR1 = cplcUChaChaVPR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVPL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Cha 
!------------------------ 
      Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_DerB1(p2,MCha2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUChaChaVZL(gO1,i2)
coupR1 = cplcUChaChaVZR(gO1,i2)
coupL2 =  Conjg(cplcUChaChaVZL(gO2,i2))
coupR2 =  Conjg(cplcUChaChaVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Chi 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MChi2(i2),MHpm2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUChaChiHpmL(gO1,i2,i1)
coupR1 = cplcUChaChiHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaChiHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaChiHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Chi 
!------------------------ 
      Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -2._dp*Real(SA_DerB1(p2,MChi2(i2),MVWm2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MVWm2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUChaChiVWmL(gO1,i2)
coupR1 = cplcUChaChiVWmR(gO1,i2)
coupL2 =  Conjg(cplcUChaChiVWmL(gO2,i2))
coupR2 =  Conjg(cplcUChaChiVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Su], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),MSu2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MSu2(i1)),dp) 
coupL1 = cplcUChaFdcSuL(gO1,i2,i1)
coupR1 = cplcUChaFdcSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFdcSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFdcSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp* sumL
SigR = SigR +3._dp* sumR 
SigSL = SigSL +3._dp* sumSL 
SigSR = SigSR +3._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Fe 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFe2(i2),MSvIm2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MSvIm2(i1)),dp) 
coupL1 = cplcUChaFeSvImL(gO1,i2,i1)
coupR1 = cplcUChaFeSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFeSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFeSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Fe 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFe2(i2),MSvRe2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MSvRe2(i1)),dp) 
coupL1 = cplcUChaFeSvReL(gO1,i2,i1)
coupR1 = cplcUChaFeSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFeSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFeSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Fv 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFv2(i2),MSe2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MSe2(i1)),dp) 
coupL1 = cplcUChaFvSeL(gO1,i2,i1)
coupR1 = cplcUChaFvSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChaFvSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChaFvSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -Real(SA_DerB1(p2,MFu2(i1),MSd2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MSd2(i2)),dp) 
coupL1 = cplcUChacFuSdL(gO1,i1,i2)
coupR1 = cplcUChacFuSdR(gO1,i1,i2)
coupL2 =  Conjg(cplcUChacFuSdL(gO2,i1,i2))
coupR2 =  Conjg(cplcUChacFuSdR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +3._dp* sumL
SigR = SigR +3._dp* sumR 
SigSL = SigSL +3._dp* sumSL 
SigSR = SigSR +3._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopCha 
 
Subroutine OneLoopFe(Ye,vd,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,           & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,           & 
& cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,             & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,      & 
& cplcUFeFvVWmR,delta,MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(3),MAh2(3),MSvIm(9),MSvIm2(9),MCha(2),MCha2(2),MSvRe(9),           & 
& MSvRe2(9),MSe(6),MSe2(6),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),             & 
& MHpm2(2),MFv(9),MFv2(9),MVWm,MVWm2

Real(dp), Intent(in) :: vd

Complex(dp), Intent(in) :: Ye(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,3),cplcUFeFeAhR(3,3,3),cplcUFeChaSvImL(3,2,9),cplcUFeChaSvImR(3,2,9),& 
& cplcUFeChaSvReL(3,2,9),cplcUFeChaSvReR(3,2,9),cplcUFeChiSeL(3,5,6),cplcUFeChiSeR(3,5,6),& 
& cplcUFeFehhL(3,3,3),cplcUFeFehhR(3,3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvHpmL(3,9,2),cplcUFeFvHpmR(3,9,2),         & 
& cplcUFeFvVWmL(3,9),cplcUFeFvVWmR(3,9)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFe_1L(3),MFe2_1L(3) 
 Complex(dp), Intent(out) :: ZEL_1L(3,3), ZER_1L(3,3) 
 
 Real(dp) :: MFe_t(3),MFe2_t(3) 
 Complex(dp) :: ZEL_t(3,3), ZER_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vd*Ye(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vd*Ye(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vd*Ye(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vd*Ye(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vd*Ye(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vd*Ye(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vd*Ye(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vd*Ye(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vd*Ye(3,3))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,     & 
& cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,cplcUFeChaSvReR,          & 
& cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,       & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,     & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
ZEROS_0 = ZER2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
ZELOS_0 = ZEL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,     & 
& cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,cplcUFeChaSvReR,          & 
& cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,       & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,     & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,     & 
& cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,cplcUFeChaSvReR,          & 
& cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,       & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,     & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZELOS_p2(il,:) = ZEL2(il,:) 
 ZEROS_p2(il,:) = ZER2(il,:) 
 ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,           & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,           & 
& cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,             & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,      & 
& cplcUFeFvVWmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(3),MAh2(3),MSvIm(9),MSvIm2(9),MCha(2),MCha2(2),MSvRe(9),           & 
& MSvRe2(9),MSe(6),MSe2(6),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),             & 
& MHpm2(2),MFv(9),MFv2(9),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,3),cplcUFeFeAhR(3,3,3),cplcUFeChaSvImL(3,2,9),cplcUFeChaSvImR(3,2,9),& 
& cplcUFeChaSvReL(3,2,9),cplcUFeChaSvReR(3,2,9),cplcUFeChiSeL(3,5,6),cplcUFeChiSeR(3,5,6),& 
& cplcUFeFehhL(3,3,3),cplcUFeFehhR(3,3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvHpmL(3,9,2),cplcUFeFvHpmR(3,9,2),         & 
& cplcUFeFvVWmL(3,9),cplcUFeFvVWmR(3,9)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Cha 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSvIm2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSvIm2(i1)),dp) 
coupL1 = cplcUFeChaSvImL(gO1,i2,i1)
coupR1 = cplcUFeChaSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Cha 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSvRe2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSvRe2(i1)),dp) 
coupL1 = cplcUFeChaSvReL(gO1,i2,i1)
coupR1 = cplcUFeChaSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSe2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSe2(i1)),dp) 
coupL1 = cplcUFeChiSeL(gO1,i2,i1)
coupR1 = cplcUFeChiSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChiSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChiSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFeFvHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvVWmL(gO1,i2)
coupR1 = cplcUFeFvVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFe 
 
Subroutine DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,              & 
& MSvRe,MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,           & 
& MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,       & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,      & 
& cplcUFeFvVWmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(3),MAh2(3),MSvIm(9),MSvIm2(9),MCha(2),MCha2(2),MSvRe(9),           & 
& MSvRe2(9),MSe(6),MSe2(6),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),             & 
& MHpm2(2),MFv(9),MFv2(9),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,3),cplcUFeFeAhR(3,3,3),cplcUFeChaSvImL(3,2,9),cplcUFeChaSvImR(3,2,9),& 
& cplcUFeChaSvReL(3,2,9),cplcUFeChaSvReR(3,2,9),cplcUFeChiSeL(3,5,6),cplcUFeChiSeR(3,5,6),& 
& cplcUFeFehhL(3,3,3),cplcUFeFehhR(3,3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvHpmL(3,9,2),cplcUFeFvHpmR(3,9,2),         & 
& cplcUFeFvVWmL(3,9),cplcUFeFvVWmR(3,9)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_DerB0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Cha 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MCha2(i2),MSvIm2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MSvIm2(i1)),dp) 
coupL1 = cplcUFeChaSvImL(gO1,i2,i1)
coupR1 = cplcUFeChaSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Cha 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MCha2(i2),MSvRe2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MSvRe2(i1)),dp) 
coupL1 = cplcUFeChaSvReL(gO1,i2,i1)
coupR1 = cplcUFeChaSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MChi2(i2),MSe2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSe2(i1)),dp) 
coupL1 = cplcUFeChiSeL(gO1,i2,i1)
coupR1 = cplcUFeChiSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChiSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChiSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFeFvHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),MVWm2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MVWm2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFvVWmL(gO1,i2)
coupR1 = cplcUFeFvVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFe 
 
Subroutine OneLoopFd(Yd,vd,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,            & 
& MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,cplcUFdFdAhL,   & 
& cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,     & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,    & 
& cplcUFdGluSdR,delta,MFd_1L,MFd2_1L,ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(3),MAh2(3),MSu(6),MSu2(6),MCha(2),MCha2(2),MSd(6),MSd2(6),         & 
& MChi(5),MChi2(5),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),MHpm2(2),MFu(3),MFu2(3),              & 
& MVWm,MVWm2,MGlu,MGlu2

Real(dp), Intent(in) :: vd

Complex(dp), Intent(in) :: Yd(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,3),cplcUFdFdAhR(3,3,3),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),    & 
& cplcUFdChiSdL(3,5,6),cplcUFdChiSdR(3,5,6),cplcUFdFdhhL(3,3,3),cplcUFdFdhhR(3,3,3),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),         & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFd_1L(3),MFd2_1L(3) 
 Complex(dp), Intent(out) :: ZDL_1L(3,3), ZDR_1L(3,3) 
 
 Real(dp) :: MFd_t(3),MFd2_t(3) 
 Complex(dp) :: ZDL_t(3,3), ZDR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vd*Yd(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vd*Yd(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vd*Yd(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vd*Yd(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vd*Yd(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vd*Yd(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vd*Yd(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vd*Yd(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vd*Yd(3,3))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,cplcUFdFdAhL,        & 
& cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,     & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,    & 
& cplcUFdGluSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
ZDROS_0 = ZDR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
ZDLOS_0 = ZDL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,cplcUFdFdAhL,        & 
& cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,     & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,    & 
& cplcUFdGluSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,cplcUFdFdAhL,        & 
& cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,     & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,    & 
& cplcUFdGluSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDLOS_p2(il,:) = ZDL2(il,:) 
 ZDROS_p2(il,:) = ZDR2(il,:) 
 ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,            & 
& MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,cplcUFdFdAhL,   & 
& cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,     & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,    & 
& cplcUFdGluSdR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(3),MAh2(3),MSu(6),MSu2(6),MCha(2),MCha2(2),MSd(6),MSd2(6),         & 
& MChi(5),MChi2(5),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),MHpm2(2),MFu(3),MFu2(3),              & 
& MVWm,MVWm2,MGlu,MGlu2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,3),cplcUFdFdAhR(3,3,3),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),    & 
& cplcUFdChiSdL(3,5,6),cplcUFdChiSdR(3,5,6),cplcUFdFdhhL(3,3,3),cplcUFdFdhhR(3,3,3),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),         & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSu2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSu2(i1)),dp) 
coupL1 = cplcUFdChaSuL(gO1,i2,i1)
coupR1 = cplcUFdChaSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChaSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChaSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Sd, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSd2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSd2(i1)),dp) 
coupL1 = cplcUFdChiSdL(gO1,i2,i1)
coupR1 = cplcUFdChiSdR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChiSdL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChiSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFdFuHpmL(gO1,i2,i1)
coupR1 = cplcUFdFuHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFuHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFuHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWmL(gO1,i2)
coupR1 = cplcUFdFuVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Sd, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MGlu2,MSd2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(p2,MGlu2,MSd2(i1)),dp) 
coupL1 = cplcUFdGluSdL(gO1,i1)
coupR1 = cplcUFdGluSdR(gO1,i1)
coupL2 =  Conjg(cplcUFdGluSdL(gO2,i1))
coupR2 =  Conjg(cplcUFdGluSdR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFd 
 
Subroutine DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,              & 
& MSd2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,           & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,     & 
& cplcUFdGluSdL,cplcUFdGluSdR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(3),MAh2(3),MSu(6),MSu2(6),MCha(2),MCha2(2),MSd(6),MSd2(6),         & 
& MChi(5),MChi2(5),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),MHpm2(2),MFu(3),MFu2(3),              & 
& MVWm,MVWm2,MGlu,MGlu2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,3),cplcUFdFdAhR(3,3,3),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),    & 
& cplcUFdChiSdL(3,5,6),cplcUFdChiSdR(3,5,6),cplcUFdFdhhL(3,3,3),cplcUFdFdhhR(3,3,3),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),         & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_DerB0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MCha2(i2),MSu2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_DerB0(p2,MCha2(i2),MSu2(i1)),dp) 
coupL1 = cplcUFdChaSuL(gO1,i2,i1)
coupR1 = cplcUFdChaSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChaSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChaSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Sd, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MChi2(i2),MSd2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSd2(i1)),dp) 
coupL1 = cplcUFdChiSdL(gO1,i2,i1)
coupR1 = cplcUFdChiSdR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChiSdL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChiSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVG2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVG2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFdFuHpmL(gO1,i2,i1)
coupR1 = cplcUFdFuHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFuHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFuHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVWm2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVWm2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFuVWmL(gO1,i2)
coupR1 = cplcUFdFuVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Sd, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MGlu2,MSd2(i1)),dp) 
B0m2 = MGlu*Real(SA_DerB0(p2,MGlu2,MSd2(i1)),dp) 
coupL1 = cplcUFdGluSdL(gO1,i1)
coupR1 = cplcUFdGluSdR(gO1,i1)
coupL2 =  Conjg(cplcUFdGluSdL(gO2,i1))
coupR2 =  Conjg(cplcUFdGluSdR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFd 
 
Subroutine OneLoopFu(Yu,vu,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,          & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,cplcUFuFuAhL,     & 
& cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL, & 
& cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,       & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,     & 
& cplcChacUFuSdR,delta,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(3),MAh2(3),MSu(6),MSu2(6),MChi(5),MChi2(5),MHpm(2),MHpm2(2),       & 
& MFd(3),MFd2(3),MVWm,MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MGlu,MGlu2,MCha(2),MCha2(2),         & 
& MSd(6),MSd2(6)

Real(dp), Intent(in) :: vu

Complex(dp), Intent(in) :: Yu(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,3),cplcUFuFuAhR(3,3,3),cplcUFuChiSuL(3,5,6),cplcUFuChiSuR(3,5,6),    & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,3),cplcUFuFuhhR(3,3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFu_1L(3),MFu2_1L(3) 
 Complex(dp), Intent(out) :: ZUL_1L(3,3), ZUR_1L(3,3) 
 
 Real(dp) :: MFu_t(3),MFu2_t(3) 
 Complex(dp) :: ZUL_t(3,3), ZUR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vu*Yu(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vu*Yu(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vu*Yu(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vu*Yu(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vu*Yu(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vu*Yu(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vu*Yu(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vu*Yu(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vu*Yu(3,3))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,cplcUFuFuAhL,         & 
& cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL, & 
& cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,       & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,     & 
& cplcChacUFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
ZUROS_0 = ZUR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
ZULOS_0 = ZUL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,cplcUFuFuAhL,         & 
& cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL, & 
& cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,       & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,     & 
& cplcChacUFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,cplcUFuFuAhL,         & 
& cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL, & 
& cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,       & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,     & 
& cplcChacUFuSdR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZULOS_p2(il,:) = ZUL2(il,:) 
 ZUROS_p2(il,:) = ZUR2(il,:) 
 ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,          & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,cplcUFuFuAhL,     & 
& cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL, & 
& cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,       & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,     & 
& cplcChacUFuSdR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(3),MAh2(3),MSu(6),MSu2(6),MChi(5),MChi2(5),MHpm(2),MHpm2(2),       & 
& MFd(3),MFd2(3),MVWm,MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MGlu,MGlu2,MCha(2),MCha2(2),         & 
& MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,3),cplcUFuFuAhR(3,3,3),cplcUFuChiSuL(3,5,6),cplcUFuChiSuR(3,5,6),    & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,3),cplcUFuFuhhR(3,3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSu2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSu2(i1)),dp) 
coupL1 = cplcUFuChiSuL(gO1,i2,i1)
coupR1 = cplcUFuChiSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuChiSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuChiSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFuFdcHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWmL(gO1,i2)
coupR1 = cplcUFuFdcVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Su, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MGlu2,MSu2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(p2,MGlu2,MSu2(i1)),dp) 
coupL1 = cplcUFuGluSuL(gO1,i1)
coupR1 = cplcUFuGluSuR(gO1,i1)
coupL2 =  Conjg(cplcUFuGluSuL(gO2,i1))
coupR2 =  Conjg(cplcUFuGluSuR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 !------------------------ 
! bar[Cha], Sd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MCha2(i1),MSd2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_B0(p2,MCha2(i1),MSd2(i2)),dp) 
coupL1 = cplcChacUFuSdL(i1,gO1,i2)
coupR1 = cplcChacUFuSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcChacUFuSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcChacUFuSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFu 
 
Subroutine DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,             & 
& MHpm2,MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,            & 
& cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,   & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,       & 
& cplcChacUFuSdL,cplcChacUFuSdR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(3),MAh2(3),MSu(6),MSu2(6),MChi(5),MChi2(5),MHpm(2),MHpm2(2),       & 
& MFd(3),MFd2(3),MVWm,MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MGlu,MGlu2,MCha(2),MCha2(2),         & 
& MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,3),cplcUFuFuAhR(3,3,3),cplcUFuChiSuL(3,5,6),cplcUFuChiSuR(3,5,6),    & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,3),cplcUFuFuhhR(3,3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MChi2(i2),MSu2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_DerB0(p2,MChi2(i2),MSu2(i1)),dp) 
coupL1 = cplcUFuChiSuL(gO1,i2,i1)
coupR1 = cplcUFuChiSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuChiSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuChiSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFuFdcHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVWm2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVWm2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFdcVWmL(gO1,i2)
coupR1 = cplcUFuFdcVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVG2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVG2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Su, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MGlu2,MSu2(i1)),dp) 
B0m2 = MGlu*Real(SA_DerB0(p2,MGlu2,MSu2(i1)),dp) 
coupL1 = cplcUFuGluSuL(gO1,i1)
coupR1 = cplcUFuGluSuR(gO1,i1)
coupL2 =  Conjg(cplcUFuGluSuL(gO2,i1))
coupR2 =  Conjg(cplcUFuGluSuR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 !------------------------ 
! bar[Cha], Sd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MCha2(i1),MSd2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_DerB0(p2,MCha2(i1),MSd2(i2)),dp) 
coupL1 = cplcChacUFuSdL(i1,gO1,i2)
coupR1 = cplcChacUFuSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcChacUFuSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcChacUFuSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFu 
 
Subroutine OneLoopGlu(M3,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,              & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MSd(6),MSd2(6),MFd(3),MFd2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MGlu,MGlu2

Complex(dp), Intent(in) :: M3

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),              & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),       & 
& cplcFuGluSuR(3,6)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopGlu'
 
mi = MGlu 

 
p2 = MGlu2
sigL = ZeroC 
sigR = ZeroC 
sigSL = ZeroC 
sigSR = ZeroC 
Call Sigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,cplGluFdcSdL,    & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,sigL,sigR,sigSL,sigSR)

mass = mi - 0.5_dp*(sigSL + sigSR)- 0.5_dp*MGlu*(SigR+SigL) 
mass2= mass**2 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
sig = ZeroC 
Call Sigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,cplGluFdcSdL,    & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,sigL,sigR,sigSL,sigSR)

mass = mi - SigSR - 0.5_dp*MGlu*(SigR+SigL) 
mass2= mass**2 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopGlu
 
 
Subroutine Sigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,           & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,SigL,SigR,SigSL,SigSR)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MFd(3),MFd2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MGlu,MGlu2

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),              & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),       & 
& cplcFuGluSuR(3,6)

Complex(dp), Intent(out) :: SigL, SigR, SigSL, SigSR 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumSL, sumSR, sumR,sumL 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! conj[Sd], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MSd2(i1)),dp) 
B0m2 = -2._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MSd2(i1)),dp) 
coupL1 = cplGluFdcSdL(i2,i1)
coupR1 = cplGluFdcSdR(i2,i1)
coupL2 =  Conjg(cplGluFdcSdL(i2,i1))
coupR2 =  Conjg(cplGluFdcSdR(i2,i1))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Fu 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MSu2(i1)),dp) 
B0m2 = -2._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MSu2(i1)),dp) 
coupL1 = cplGluFucSuL(i2,i1)
coupR1 = cplGluFucSuR(i2,i1)
coupL2 =  Conjg(cplGluFucSuL(i2,i1))
coupR2 =  Conjg(cplGluFucSuR(i2,i1))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! VG, Glu 
!------------------------ 
SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -4._dp*(Real(SA_B1(p2,MGlu2,0._dp),dp)+ 0.5_dp*rMS) 
B0m2 = -8._dp*MGlu*(Real(SA_B0(p2,MGlu2,0._dp),dp) - 0.5_dp*rMS) 
coupL1 = cplGluGluVGL
coupR1 = cplGluGluVGR
coupL2 =  Conjg(cplGluGluVGL)
coupR2 =  Conjg(cplGluGluVGR)
SumSL = coupL1*coupR2*B0m2 
SumSR = coupR1*coupL2*B0m2 
sumR = coupL1*coupL2*B1m2 
sumL = coupR1*coupR2*B1m2 
SigL = SigL +3._dp/2._dp*sumL
SigR = SigR +3._dp/2._dp*sumR
SigSL = SigSL +3._dp/2._dp*sumSL
SigSR = SigSR +3._dp/2._dp*sumSR
!------------------------ 
! bar[Fd], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i1),MSd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*Real(SA_B0(p2,MFd2(i1),MSd2(i2)),dp) 
coupL1 = cplcFdGluSdL(i1,i2)
coupR1 = cplcFdGluSdR(i1,i2)
coupL2 =  Conjg(cplcFdGluSdL(i1,i2))
coupR2 =  Conjg(cplcFdGluSdR(i1,i2))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Su 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i1),MSu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*Real(SA_B0(p2,MFu2(i1),MSu2(i2)),dp) 
coupL1 = cplcFuGluSuL(i1,i2)
coupR1 = cplcFuGluSuR(i1,i2)
coupL2 =  Conjg(cplcFuGluSuL(i1,i2))
coupR2 =  Conjg(cplcFuGluSuR(i1,i2))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 

SigL = oo16pi2*SigL 
 SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
 SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopGlu 
 
Subroutine DerSigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,              & 
& MGlu2,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,   & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,SigL,SigR,SigSL,SigSR)

Implicit None 
Real(dp), Intent(in) :: MSd(6),MSd2(6),MFd(3),MFd2(3),MSu(6),MSu2(6),MFu(3),MFu2(3),MGlu,MGlu2

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),              & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),       & 
& cplcFuGluSuR(3,6)

Complex(dp), Intent(out) :: SigL, SigR, SigSL, SigSR 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumSL, sumSR, sumR,sumL 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! conj[Sd], Fd 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MSd2(i1)),dp) 
B0m2 = -2._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MSd2(i1)),dp) 
coupL1 = cplGluFdcSdL(i2,i1)
coupR1 = cplGluFdcSdR(i2,i1)
coupL2 =  Conjg(cplGluFdcSdL(i2,i1))
coupR2 =  Conjg(cplGluFdcSdR(i2,i1))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Fu 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MSu2(i1)),dp) 
B0m2 = -2._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MSu2(i1)),dp) 
coupL1 = cplGluFucSuL(i2,i1)
coupR1 = cplGluFucSuR(i2,i1)
coupL2 =  Conjg(cplGluFucSuL(i2,i1))
coupR2 =  Conjg(cplGluFucSuR(i2,i1))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! VG, Glu 
!------------------------ 
SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -4._dp*(Real(SA_DerB1(p2,MGlu2,MVG2),dp)+ 0.5_dp*DerrMS) 
B0m2 = -8._dp*MGlu*(Real(SA_DerB0(p2,MGlu2,MVG2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplGluGluVGL
coupR1 = cplGluGluVGR
coupL2 =  Conjg(cplGluGluVGL)
coupR2 =  Conjg(cplGluGluVGR)
SumSL = coupL1*coupR2*B0m2 
SumSR = coupR1*coupL2*B0m2 
sumR = coupL1*coupL2*B1m2 
sumL = coupR1*coupR2*B1m2 
SigL = SigL +3._dp/2._dp*sumL
SigR = SigR +3._dp/2._dp*sumR
SigSL = SigSL +3._dp/2._dp*sumSL
SigSR = SigSR +3._dp/2._dp*sumSR
!------------------------ 
! bar[Fd], Sd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i1),MSd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*Real(SA_DerB0(p2,MFd2(i1),MSd2(i2)),dp) 
coupL1 = cplcFdGluSdL(i1,i2)
coupR1 = cplcFdGluSdR(i1,i2)
coupL2 =  Conjg(cplcFdGluSdL(i1,i2))
coupR2 =  Conjg(cplcFdGluSdR(i1,i2))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Su 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumR = 0._dp 
SumL = 0._dp 
SumSL = 0._dp 
SumSR = 0._dp 
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i1),MSu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MSu2(i2)),dp) 
coupL1 = cplcFuGluSuL(i1,i2)
coupR1 = cplcFuGluSuR(i1,i2)
coupL2 =  Conjg(cplcFuGluSuL(i1,i2))
coupR2 =  Conjg(cplcFuGluSuR(i1,i2))
SumSR = coupL1*coupR2*B0m2 
SumSL = coupR1*coupL2*B0m2 
sumR = coupR1*coupR2*B1m2 
sumL = coupL1*coupL2*B1m2 
SigL = SigL +1._dp/4._dp*sumL
SigR = SigR +1._dp/4._dp*sumR
SigSL = SigSL +1._dp/4._dp*sumSL
SigSR = SigSR +1._dp/4._dp*sumSR
      End Do 
     End Do 
 

SigL = oo16pi2*SigL 
 SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
 SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopGlu 
 
Subroutine Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,               & 
& cplGluGluVGR,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,   & 
& cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3),MGlu,MGlu2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplGluGluVGL,cplGluGluVGR,cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplSdcSdVGVG(6,6), & 
& cplSucSuVGVG(6,6),cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,0._dp),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! Glu, Glu 
!------------------------ 
sumI = 0._dp 
 
H0m2 = Real(SA_Hloop(p2,MGlu2,MGlu2),dp) 
B0m2 = 4._dp*MGlu*MGlu*Real(SA_B0(p2,MGlu2,MGlu2),dp) 
coupL1 = cplGluGluVGL
coupR1 = cplGluGluVGR
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1.5_dp* SumI  
!------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVG(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVG(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,0._dp,0._dp)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVGVG(i1,i1)
 SumI = coup1*A0m2 
res = res +999* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVGVG(i1,i1)
 SumI = coup1*A0m2 
res = res +999* SumI  
      End Do 
 !------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVG 
 
Subroutine DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,            & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,               & 
& cplGluGluVGR,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,   & 
& cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3),MGlu,MGlu2,MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplGluGluVGL,cplGluGluVGR,cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplSdcSdVGVG(6,6), & 
& cplSucSuVGVG(6,6),cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVG2,MVG2),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! Glu, Glu 
!------------------------ 
sumI = 0._dp 
 
H0m2 = Real(SA_DerHloop(p2,MGlu2,MGlu2),dp) 
B0m2 = 4._dp*MGlu*MGlu*Real(SA_DerB0(p2,MGlu2,MGlu2),dp) 
coupL1 = cplGluGluVGL
coupR1 = cplGluGluVGR
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1.5_dp* SumI  
!------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVG(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVG(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVG2,MVG2)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVGVG(i1,i1)
 SumI = coup1*A0m2 
res = res +999* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVGVG(i1,i1)
 SumI = coup1*A0m2 
res = res +999* SumI  
      End Do 
 !------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVG2) +RXi/4._dp*SA_DerA0(MVG2*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVG2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVG 
 
Subroutine Pi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,             & 
& MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,res)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MHpm(2),MHpm2(2),       & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmVP,      & 
& cplcgWpCgWpCVP,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),      & 
& cplSucSuVP(6,6),cplcVWmVPVWm,cplHpmcHpmVPVP(2,2),cplSdcSdVPVP(6,6),cplSecSeVPVP(6,6),  & 
& cplSucSuVPVP(6,6),cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MCha2(i1).gt.50._dp**2).and.(MCha2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MCha2(i1).lt.50._dp**2).and.(MCha2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i2).gt.50._dp**2).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i2).lt.50._dp**2).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSd2(i2).gt.50._dp**2).and.(MSd2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSd2(i2).lt.50._dp**2).and.(MSd2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSe2(i2).gt.50._dp**2).and.(MSe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSe2(i2).lt.50._dp**2).and.(MSe2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSu2(i2).gt.50._dp**2).and.(MSu2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSu2(i2).lt.50._dp**2).and.(MSu2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWmVPVWm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSd2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSd2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSe2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSeVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSu2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSu2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmVPVPVWm3
coup2 = cplcVWmVPVPVWm1
coup3 = cplcVWmVPVPVWm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVP 
 
Subroutine DerPi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,          & 
& MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,res)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MHpm(2),MHpm2(2),       & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmVP,      & 
& cplcgWpCgWpCVP,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),      & 
& cplSucSuVP(6,6),cplcVWmVPVWm,cplHpmcHpmVPVP(2,2),cplSdcSdVPVP(6,6),cplSecSeVPVP(6,6),  & 
& cplSucSuVPVP(6,6),cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MCha2(i1).gt.50._dp**2).and.(MCha2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MCha2(i1).lt.50._dp**2).and.(MCha2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i2).gt.50._dp**2).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i2).lt.50._dp**2).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSd2(i2).gt.50._dp**2).and.(MSd2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSd2(i2).lt.50._dp**2).and.(MSd2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSe2(i2).gt.50._dp**2).and.(MSe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSe2(i2).lt.50._dp**2).and.(MSe2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSu2(i2).gt.50._dp**2).and.(MSu2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSu2(i2).lt.50._dp**2).and.(MSu2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2).and.(MVWm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWmVPVWm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSd2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSd2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSe2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSe2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSeVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MSu2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MSu2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmVPVPVWm3
coup2 = cplcVWmVPVPVWm1
coup3 = cplcVWmVPVPVWm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVP 
 
Subroutine OneLoopVZ(g1,g2,vd,vu,TW,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,          & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,           & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MVZ,MVZ2,MHpm(2),MHpm2(2),        & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvRe(9),MSvRe2(9),            & 
& MSvIm(9),MSvIm2(9)

Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),               & 
& cplChiChiVZR(5,5),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),         & 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(9,9),cplcVWmVWmVZ,cplAhAhVZVZ(3,3),      & 
& cplhhhhVZVZ(3,3),cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),cplSecSeVZVZ(6,6),              & 
& cplSucSuVZVZ(6,6),cplSvImSvImVZVZ(9,9),cplSvReSvReVZVZ(9,9),cplcVWmVWmVZVZ1,           & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MVZ,MVZ2,MHpm(2),MHpm2(2),        & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvRe(9),MSvRe2(9),            & 
& MSvIm(9),MSvIm2(9)

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),               & 
& cplChiChiVZR(5,5),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),         & 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(9,9),cplcVWmVWmVZ,cplAhAhVZVZ(3,3),      & 
& cplhhhhVZVZ(3,3),cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),cplSecSeVZVZ(6,6),              & 
& cplSucSuVZVZ(6,6),cplSvImSvImVZVZ(9,9),cplSvReSvReVZVZ(9,9),cplcVWmVWmVZVZ1,           & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_Hloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 H0m2 = Real(SA_Hloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B22m2 = Real(VSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp)  
coup1 = cplSvImSvReVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSeVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 9
 SumI = 0._dp 
 A0m2 = SA_A0(MSvIm2(i1))
 coup1 = cplSvImSvImVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 9
 SumI = 0._dp 
 A0m2 = SA_A0(MSvRe2(i1))
 coup1 = cplSvReSvReVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,               & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),               & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MVZ,MVZ2,MHpm(2),MHpm2(2),        & 
& MVWm,MVWm2,MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvRe(9),MSvRe2(9),            & 
& MSvIm(9),MSvIm2(9)

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(5,5),               & 
& cplChiChiVZR(5,5),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVZVZ(3),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),         & 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(9,9),cplcVWmVWmVZ,cplAhAhVZVZ(3,3),      & 
& cplhhhhVZVZ(3,3),cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),cplSecSeVZVZ(6,6),              & 
& cplSucSuVZVZ(6,6),cplSvImSvImVZVZ(9,9),cplSvReSvReVZVZ(9,9),cplcVWmVWmVZVZ1,           & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_DerHloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 H0m2 = Real(SA_DerHloop(p2,MChi2(i1),MChi2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp)  
coup1 = cplSdcSdVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSe2(i1)),dp)  
coup1 = cplSecSeVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp)  
coup1 = cplSucSuVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 B22m2 = Real(DerVSSloop(p2,MSvIm2(i2),MSvRe2(i1)),dp)  
coup1 = cplSvImSvReVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSeVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 9
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvIm2(i1))
 coup1 = cplSvImSvImVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 9
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvRe2(i1))
 coup1 = cplSvReSvReVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZ 
 
Subroutine OneLoopVWm(g2,vd,vu,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,             & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MSu,MSu2,             & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,     & 
& cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,       & 
& cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,       & 
& cplSucSucVWmVWm,cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1, & 
& cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,              & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(3),MAh2(3),MChi(5),MChi2(5),MCha(2),MCha2(2),MFu(3),             & 
& MFu2(3),MFd(3),MFd2(3),MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(3),Mhh2(3),MVWm,              & 
& MVWm2,MVZ,MVZ2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSe(6),MSe2(6),        & 
& MSvRe(9),MSvRe2(9)

Real(dp), Intent(in) :: g2,vd,vu

Complex(dp), Intent(in) :: cplAhHpmcVWm(3,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcFuFdcVWmL(3,3),         & 
& cplcFuFdcVWmR(3,3),cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,   & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm(3,2),cplhhcVWmVWm(3),cplHpmcVWmVP(2),        & 
& cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,9),cplSeSvRecVWm(6,9),               & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm(3,3),cplhhhhcVWmVWm(3,3),cplHpmcHpmcVWmVWm(2,2),& 
& cplSdcSdcVWmVWm(6,6),cplSecSecVWmVWm(6,6),cplSucSucVWmVWm(6,6),cplSvImSvImcVWmVWm(9,9),& 
& cplSvReSvRecVWmVWm(9,9),cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,               & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWm'
 
mi2 = MVWm2 

 
p2 = MVWm2
PiSf = ZeroC 
Call Pi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,MFd,            & 
& MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,MSvIm,           & 
& MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,               & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,    & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,MFd,            & 
& MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,MSvIm,           & 
& MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,               & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,    & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWm
 
 
Subroutine Pi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,               & 
& MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MSu,MSu2,MSd,             & 
& MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,    & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(3),MAh2(3),MChi(5),MChi2(5),MCha(2),MCha2(2),MFu(3),             & 
& MFu2(3),MFd(3),MFd2(3),MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(3),Mhh2(3),MVWm,              & 
& MVWm2,MVZ,MVZ2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSe(6),MSe2(6),        & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhHpmcVWm(3,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcFuFdcVWmL(3,3),         & 
& cplcFuFdcVWmR(3,3),cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,   & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm(3,2),cplhhcVWmVWm(3),cplHpmcVWmVP(2),        & 
& cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,9),cplSeSvRecVWm(6,9),               & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm(3,3),cplhhhhcVWmVWm(3,3),cplHpmcHpmcVWmVWm(2,2),& 
& cplSdcSdcVWmVWm(6,6),cplSecSecVWmVWm(6,6),cplSucSucVWmVWm(6,6),cplSvImSvImcVWmVWm(9,9),& 
& cplSvReSvRecVWmVWm(9,9),cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,               & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 B22m2 = Real(VSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhHpmcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 2
 H0m2 = Real(SA_Hloop(p2,MChi2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MCha(i2)*Real(SA_B0(p2,MChi2(i1),MCha2(i2)),dp) 
coupL1 = cplChiChacVWmL(i1,i2)
coupR1 = cplChiChacVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWmL(i1,i2)
coupR1 = cplcFuFdcVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWmL(i1,i2)
coupR1 = cplFvFecVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWm2),dp)
coup1 = cplcgWpCgAcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,0._dp),dp)
coup1 = cplcgAgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWm2,MVZ2),dp)
coup1 = cplcgZgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWm2),dp)
coup1 = cplcgWpCgZcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhHpmcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(VVSloop(p2,MVWm2,Mhh2(i2)),dp)
coup1 = cplhhcVWmVWm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,0._dp,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZ2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Su], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSu2(i1)),dp)  
coup1 = cplSdcSucVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSvIm2(i1)),dp)  
coup1 = cplSeSvImcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSvRe2(i1)),dp)  
coup1 = cplSeSvRecVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVPVWm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSecVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSucVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 9
 SumI = 0._dp 
 A0m2 = SA_A0(MSvIm2(i1))
 coup1 = cplSvImSvImcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 9
 SumI = 0._dp 
 A0m2 = SA_A0(MSvRe2(i1))
 coup1 = cplSvReSvRecVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWmVPVPVWm3
coup2 = cplcVWmVPVPVWm1
coup3 = cplcVWmVPVPVWm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmcVWmVWmVWm2
coup2 = cplcVWmcVWmVWmVWm3
coup3 = cplcVWmcVWmVWmVWm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWm 
 
Subroutine DerPi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,            & 
& MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MSu,MSu2,MSd,             & 
& MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,    & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MAh(3),MAh2(3),MChi(5),MChi2(5),MCha(2),MCha2(2),MFu(3),             & 
& MFu2(3),MFd(3),MFd2(3),MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(3),Mhh2(3),MVWm,              & 
& MVWm2,MVZ,MVZ2,MSu(6),MSu2(6),MSd(6),MSd2(6),MSvIm(9),MSvIm2(9),MSe(6),MSe2(6),        & 
& MSvRe(9),MSvRe2(9)

Complex(dp), Intent(in) :: cplAhHpmcVWm(3,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcFuFdcVWmL(3,3),         & 
& cplcFuFdcVWmR(3,3),cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,   & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm(3,2),cplhhcVWmVWm(3),cplHpmcVWmVP(2),        & 
& cplHpmcVWmVZ(2),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,9),cplSeSvRecVWm(6,9),               & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm(3,3),cplhhhhcVWmVWm(3,3),cplHpmcHpmcVWmVWm(2,2),& 
& cplSdcSdcVWmVWm(6,6),cplSecSecVWmVWm(6,6),cplSucSucVWmVWm(6,6),cplSvImSvImcVWmVWm(9,9),& 
& cplSvReSvRecVWmVWm(9,9),cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,               & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhHpmcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 2
 H0m2 = Real(SA_DerHloop(p2,MChi2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MChi(i1)*MCha(i2)*Real(SA_DerB0(p2,MChi2(i1),MCha2(i2)),dp) 
coupL1 = cplChiChacVWmL(i1,i2)
coupR1 = cplChiChacVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWmL(i1,i2)
coupR1 = cplcFuFdcVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWmL(i1,i2)
coupR1 = cplFvFecVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWm2),dp)
coup1 = cplcgWpCgAcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVP2),dp)
coup1 = cplcgAgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVZ2),dp)
coup1 = cplcgZgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWm2),dp)
coup1 = cplcgWpCgZcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhHpmcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(DerVVSloop(p2,MVWm2,Mhh2(i2)),dp)
coup1 = cplhhcVWmVWm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVP2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZ2,MHpm2(i2)),dp)
coup1 = cplHpmcVWmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Su], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSu2(i1)),dp)  
coup1 = cplSdcSucVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvIm, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSvIm2(i1)),dp)  
coup1 = cplSeSvImcVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSvRe2(i1)),dp)  
coup1 = cplSeSvRecVWm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVPVWm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSecVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSucVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! SvIm 
!------------------------ 
    Do i1 = 1, 9
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvIm2(i1))
 coup1 = cplSvImSvImcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! SvRe 
!------------------------ 
    Do i1 = 1, 9
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSvRe2(i1))
 coup1 = cplSvReSvRecVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWmVPVPVWm3
coup2 = cplcVWmVPVPVWm1
coup3 = cplcVWmVPVPVWm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmcVWmVWmVWm2
coup2 = cplcVWmcVWmVWmVWm3
coup3 = cplcVWmcVWmVWmVWm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWm 
 
Subroutine Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,               & 
& MSvRe,MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,           & 
& MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,       & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,      & 
& cplcUFeFvVWmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(3),MAh2(3),MSvIm(9),MSvIm2(9),MCha(2),MCha2(2),MSvRe(9),           & 
& MSvRe2(9),MSe(6),MSe2(6),MChi(5),MChi2(5),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),             & 
& MHpm2(2),MFv(9),MFv2(9),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,3),cplcUFeFeAhR(3,3,3),cplcUFeChaSvImL(3,2,9),cplcUFeChaSvImR(3,2,9),& 
& cplcUFeChaSvReL(3,2,9),cplcUFeChaSvReR(3,2,9),cplcUFeChiSeL(3,5,6),cplcUFeChiSeR(3,5,6),& 
& cplcUFeFehhL(3,3,3),cplcUFeFehhR(3,3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvHpmL(3,9,2),cplcUFeFvHpmR(3,9,2),         & 
& cplcUFeFvVWmL(3,9),cplcUFeFvVWmR(3,9)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvIm, Cha 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MCha2(i2),MSvIm2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(MFe2(gO1),MCha2(i2),MSvIm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSvIm2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSvIm2(i1)),dp) 
End If 
coupL1 = cplcUFeChaSvImL(gO1,i2,i1)
coupR1 = cplcUFeChaSvImR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvImL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvImR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! SvRe, Cha 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MCha2(i2),MSvRe2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(MFe2(gO1),MCha2(i2),MSvRe2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSvRe2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSvRe2(i1)),dp) 
End If 
coupL1 = cplcUFeChaSvReL(gO1,i2,i1)
coupR1 = cplcUFeChaSvReR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChaSvReL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChaSvReR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Se, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MChi2(i2),MSe2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(MFe2(gO1),MChi2(i2),MSe2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSe2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSe2(i1)),dp) 
End If 
coupL1 = cplcUFeChiSeL(gO1,i2,i1)
coupR1 = cplcUFeChiSeR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeChiSeL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeChiSeR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFeFvHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFv2(i2),MVWm2),dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MVWm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFvVWmL(gO1,i2)
coupR1 = cplcUFeFvVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFeMZ 
 
Subroutine Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,               & 
& MSd2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,           & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,     & 
& cplcUFdGluSdL,cplcUFdGluSdR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(3),MAh2(3),MSu(6),MSu2(6),MCha(2),MCha2(2),MSd(6),MSd2(6),         & 
& MChi(5),MChi2(5),Mhh(3),Mhh2(3),MVZ,MVZ2,MHpm(2),MHpm2(2),MFu(3),MFu2(3),              & 
& MVWm,MVWm2,MGlu,MGlu2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,3),cplcUFdFdAhR(3,3,3),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),    & 
& cplcUFdChiSdL(3,5,6),cplcUFdChiSdR(3,5,6),cplcUFdFdhhL(3,3,3),cplcUFdFdhhR(3,3,3),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),         & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Cha 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MCha2(i2),MSu2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(MFd2(gO1),MCha2(i2),MSu2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MCha2(i2),MSu2(i1)),dp) 
B0m2 = MCha(i2)*Real(SA_B0(p2,MCha2(i2),MSu2(i1)),dp) 
End If 
coupL1 = cplcUFdChaSuL(gO1,i2,i1)
coupR1 = cplcUFdChaSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChaSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChaSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Sd, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MChi2(i2),MSd2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(MFd2(gO1),MChi2(i2),MSd2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSd2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSd2(i1)),dp) 
End If 
coupL1 = cplcUFdChiSdL(gO1,i2,i1)
coupR1 = cplcUFdChiSdR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdChiSdL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdChiSdR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFdFuHpmL(gO1,i2,i1)
coupR1 = cplcUFdFuHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFuHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFuHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFu2(i2),MVWm2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MVWm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFuVWmL(gO1,i2)
coupR1 = cplcUFdFuVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Sd, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MGlu2,MSd2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(MFd2(gO1),MGlu2,MSd2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MGlu2,MSd2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(p2,MGlu2,MSd2(i1)),dp) 
End If 
coupL1 = cplcUFdGluSdL(gO1,i1)
coupR1 = cplcUFdGluSdR(gO1,i1)
coupL2 =  Conjg(cplcUFdGluSdL(gO2,i1))
coupR2 =  Conjg(cplcUFdGluSdR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFdMZ 
 
Subroutine Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,              & 
& MHpm2,MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,            & 
& cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,   & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,       & 
& cplcChacUFuSdL,cplcChacUFuSdR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(3),MAh2(3),MSu(6),MSu2(6),MChi(5),MChi2(5),MHpm(2),MHpm2(2),       & 
& MFd(3),MFd2(3),MVWm,MVWm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MGlu,MGlu2,MCha(2),MCha2(2),         & 
& MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,3),cplcUFuFuAhR(3,3,3),cplcUFuChiSuL(3,5,6),cplcUFuChiSuR(3,5,6),    & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,3),cplcUFuFuhhR(3,3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! Su, Chi 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 5
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MChi2(i2),MSu2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(MFu2(gO1),MChi2(i2),MSu2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MChi2(i2),MSu2(i1)),dp) 
B0m2 = MChi(i2)*Real(SA_B0(p2,MChi2(i2),MSu2(i1)),dp) 
End If 
coupL1 = cplcUFuChiSuL(gO1,i2,i1)
coupR1 = cplcUFuChiSuR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuChiSuL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuChiSuR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFuFdcHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFd2(i2),MVWm2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MVWm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFdcVWmL(gO1,i2)
coupR1 = cplcUFuFdcVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Su, Glu 
!------------------------ 
    Do i1 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MGlu2,MSu2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(MFu2(gO1),MGlu2,MSu2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MGlu2,MSu2(i1)),dp) 
B0m2 = MGlu*Real(SA_B0(p2,MGlu2,MSu2(i1)),dp) 
End If 
coupL1 = cplcUFuGluSuL(gO1,i1)
coupR1 = cplcUFuGluSuR(gO1,i1)
coupL2 =  Conjg(cplcUFuGluSuL(gO2,i1))
coupR2 =  Conjg(cplcUFuGluSuR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
      End Do 
 !------------------------ 
! bar[Cha], Sd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MCha2(i1),MSd2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_B0(MFu2(gO1),MCha2(i1),MSd2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MCha2(i1),MSd2(i2)),dp) 
B0m2 = MCha(i1)*Real(SA_B0(p2,MCha2(i1),MSd2(i2)),dp) 
End If 
coupL1 = cplcChacUFuSdL(i1,gO1,i2)
coupR1 = cplcChacUFuSdR(i1,gO1,i2)
coupL2 =  Conjg(cplcChacUFuSdL(i1,gO2,i2))
coupR2 =  Conjg(cplcChacUFuSdR(i1,gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFuMZ 
 
Subroutine Pi1LoopVPVZ(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,           & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MVWm,MVWm2,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,       & 
& cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcHpmVPVWm,      & 
& cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,             & 
& cplcVWmVWmVZ,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVPVZ,cplSucSuVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MHpm(2),MHpm2(2),       & 
& MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),          & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,            & 
& cplcgWpCgWpCVZ,cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcVWmVPVWm,cplcVWmVPVWmVZ1,           & 
& cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVWmVZ,cplHpmcHpmVP(2,2),cplHpmcHpmVPVZ(2,2),    & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSdcSdVP(6,6),cplSdcSdVPVZ(6,6),   & 
& cplSdcSdVZ(6,6),cplSecSeVP(6,6),cplSecSeVPVZ(6,6),cplSecSeVZ(6,6),cplSucSuVP(6,6),     & 
& cplSucSuVPVZ(6,6),cplSucSuVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_Hloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 4._dp*MCha(i1)*MCha(i2)*Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
coupL2 = cplcChaChaVZL(i2,i1)
coupR2 = cplcChaChaVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = cplcgWmgWmVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = cplcgWpCgWpCVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVP(i2)
coup2 = cplcHpmVWmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVP(i2,i1)
coup2 = cplSdcSdVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVP(i2,i1)
coup2 = cplSecSeVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(VSSloop(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVP(i2,i1)
coup2 = cplSucSuVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcVWmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcVWmVWmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSd2(i1))
 coup1 = cplSdcSdVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSe2(i1))
 coup1 = cplSecSeVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_A0(MSu2(i1))
 coup1 = cplSucSuVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWm2) +RXi/4._dp*SA_A0(MVWm2*RXi) 
coup1 = cplcVWmVPVWmVZ2
coup2 = cplcVWmVPVWmVZ1
coup3 = cplcVWmVPVWmVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVPVZ 
 
Subroutine DerPi1LoopVPVZ(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,              & 
& MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MVWm,MVWm2,cplcChaChaVPL,cplcChaChaVPR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,& 
& cplcVWmVWmVZ,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVPVZ,cplSucSuVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MCha(2),MCha2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MHpm(2),MHpm2(2),       & 
& MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),          & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,            & 
& cplcgWpCgWpCVZ,cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcVWmVPVWm,cplcVWmVPVWmVZ1,           & 
& cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVWmVZ,cplHpmcHpmVP(2,2),cplHpmcHpmVPVZ(2,2),    & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplSdcSdVP(6,6),cplSdcSdVPVZ(6,6),   & 
& cplSdcSdVZ(6,6),cplSecSeVP(6,6),cplSecSeVPVZ(6,6),cplSecSeVZ(6,6),cplSucSuVP(6,6),     & 
& cplSucSuVPVZ(6,6),cplSucSuVZ(6,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Real(SA_DerHloop(p2,MCha2(i1),MCha2(i2)),dp) 
B0m2 = 2._dp*MCha(i1)*MCha(i2)*Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVPL(i1,i2)
coupR1 = cplcChaChaVPR(i1,i2)
coupL2 = cplcChaChaVZL(i2,i1)
coupR2 = cplcChaChaVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWmgWmVP
coup2 = cplcgWmgWmVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWm2,MVWm2),dp)
coup1 = cplcgWpCgWpCVP
coup2 = cplcgWpCgWpCVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVP(i2,i1)
coup2 = cplHpmcHpmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVP(i2)
coup2 = cplcHpmVWmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVP(i2,i1)
coup2 = cplSdcSdVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVP(i2,i1)
coup2 = cplSecSeVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 B22m2 = Real(DerVSSloop(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVP(i2,i1)
coup2 = cplSucSuVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcVWmVZ(i1)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcVWmVWmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Sd] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSd2(i1))
 coup1 = cplSdcSdVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[Se] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSe2(i1))
 coup1 = cplSecSeVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[Su] 
!------------------------ 
    Do i1 = 1, 6
 SumI = 0._dp 
 A0m2 = SA_DerA0(MSu2(i1))
 coup1 = cplSucSuVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +3* SumI  
      End Do 
 !------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWm2) +RXi/4._dp*SA_DerA0(MVWm2*RXi) 
coup1 = cplcVWmVPVWmVZ2
coup2 = cplcVWmVPVWmVZ1
coup3 = cplcVWmVPVWmVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVPVZ 
 
Subroutine Pi1LoopVZhh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),           & 
& MVWm,MVWm2

Complex(dp), Intent(in) :: cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),            & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(3),cplcgWmgWmVZ,cplcgWpCgWpChh(3),      & 
& cplcgWpCgWpCVZ,cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),              & 
& cplChiChiVZR(5,5),cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),    & 
& cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhHpmcHpm(3,2,2), & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvRe(3,9,9),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),& 
& cplSucSuVZ(6,6),cplSvImSvReVZ(9,9)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhhh(i2,gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChahhL(i2,i1,gO2)
coupR2 = cplcChaChahhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChihhL(i1,i2,gO2)
coupR2 = cplChiChihhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplhhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplhhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplhhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplhhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplhhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplhhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp)
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplhhcVWmVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZhh 
 
Subroutine DerPi1LoopVZhh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),           & 
& MVWm,MVWm2

Complex(dp), Intent(in) :: cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),            & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(3),cplcgWmgWmVZ,cplcgWpCgWpChh(3),      & 
& cplcgWpCgWpCVZ,cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),              & 
& cplChiChiVZR(5,5),cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),    & 
& cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhHpmcHpm(3,2,2), & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvRe(3,9,9),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),& 
& cplSucSuVZ(6,6),cplSvImSvReVZ(9,9)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhhh(i2,gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChahhL(i2,i1,gO2)
coupR2 = cplcChaChahhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChihhL(i1,i2,gO2)
coupR2 = cplChiChihhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplhhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplhhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplhhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplhhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplhhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplhhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplhhcVWmVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZhh 
 
Subroutine Pi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVZ,cplAhHpmcHpm,        & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,          & 
& cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,       & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),           & 
& MVWm,MVWm2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhcHpmVWm(3,2),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),& 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvRe(3,9,9),            & 
& cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),       & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWmgWmAh(3),cplcgWmgWmVZ,cplcgWpCgWpCAh(3),cplcgWpCgWpCVZ,cplChiChiAhL(5,5,3),     & 
& cplChiChiAhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplcHpmVWmVZ(2),               & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhVZVZ(3),      & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),     & 
& cplSvImSvReVZ(9,9)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChaAhL(i2,i1,gO2)
coupR2 = cplcChaChaAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChiAhL(i1,i2,gO2)
coupR2 = cplChiChiAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplAhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplAhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplAhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplAhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplAhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_B0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplAhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZAh 
 
Subroutine DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVZ,              & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,             & 
& cplcgWpCgWpCAh,cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcHpmVWmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,       & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),           & 
& MVWm,MVWm2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(3,3,3),cplAhcHpmVWm(3,2),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),& 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvRe(3,9,9),            & 
& cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),       & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWmgWmAh(3),cplcgWmgWmVZ,cplcgWpCgWpCAh(3),cplcgWpCgWpCVZ,cplChiChiAhL(5,5,3),     & 
& cplChiChiAhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplcHpmVWmVZ(2),               & 
& cplFvFvAhL(9,9,3),cplFvFvAhR(9,9,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhVZVZ(3),      & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),cplSucSuVZ(6,6),     & 
& cplSvImSvReVZ(9,9)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Cha 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MCha2(i1),MCha2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MCha2(i1),MCha2(i2)),dp) 
coupL1 = cplcChaChaVZL(i1,i2)
coupR1 = cplcChaChaVZR(i1,i2)
coupL2 = cplcChaChaAhL(i2,i1,gO2)
coupR2 = cplcChaChaAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MCha(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Chi, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 5
       Do i2 = 1, 5
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MChi2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MChi2(i1),MChi2(i2)),dp) 
coupL1 = cplChiChiVZL(i1,i2)
coupR1 = cplChiChiVZR(i1,i2)
coupL2 = cplChiChiAhL(i1,i2,gO2)
coupR2 = cplChiChiAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MChi(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWmgWmVZ
coup2 = cplcgWmgWmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVWm2),dp) 
coup1 = cplcgWpCgWpCVZ
coup2 = cplcgWpCgWpCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i2)),dp) 
coup1 = cplHpmcVWmVZ(i2)
coup2 = cplAhcHpmVWm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Sd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MSd2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSd2(i2),MSd2(i1)),dp) 
coup1 = cplSdcSdVZ(i2,i1)
coup2 = cplAhSdcSd(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], Se 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MSe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSe2(i2),MSe2(i1)),dp) 
coup1 = cplSecSeVZ(i2,i1)
coup2 = cplAhSecSe(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Su], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MSu2(i2),MSu2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSu2(i2),MSu2(i1)),dp) 
coup1 = cplSucSuVZ(i2,i1)
coup2 = cplAhSucSu(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! SvRe, SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvIm2(i2),MSvRe2(i1)),dp) 
coup1 = cplSvImSvReVZ(i2,i1)
coup2 = cplAhSvImSvRe(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VWm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,3 
B0m2 = Real(SA_DerB0(p2,MVWm2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplAhHpmcVWm(gO2,i1)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZAh 
 
Subroutine Pi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,           & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,      & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,cplcgZgWmcHpm,  & 
& cplcgZgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,         & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,        & 
& cplSvImcSeVWm,cplSvRecSeVWm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),           & 
& MVWm,MVWm2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhcHpmVWm(3,2),cplAhHpmcHpm(3,2,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),        & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,9),cplcFeFvVWmR(3,9),               & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm(2),& 
& cplcgWpCgZcHpm(2),cplcgZgWmcHpm(2),cplcgZgWpCVWm,cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),& 
& cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcVWmVPVWm,cplcVWmVWmVZ,cplFvFecHpmL(9,3,2),         & 
& cplFvFecHpmR(9,3,2),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhHpmcHpm(3,2,2),             & 
& cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),          & 
& cplSeSvRecHpm(6,9,2),cplSucSdVWm(6,6),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWm(i2,i1)
coup2 = cplAhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 5
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MCha2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MCha2(i1),MChi2(i2)),dp) 
coupL1 = cplcChaChiVWmL(i1,i2)
coupR1 = cplcChaChiVWmR(i1,i2)
coupL2 = cplChiChacHpmL(i2,i1,gO2)
coupR2 = cplChiChacHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWmL(i1,i2)
coupR1 = cplcFdFuVWmR(i1,i2)
coupL2 = cplcFuFdcHpmL(i2,i1,gO2)
coupR2 = cplcFuFdcHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWmL(i1,i2)
coupR1 = cplcFeFvVWmR(i1,i2)
coupL2 = cplFvFecHpmL(i2,i1,gO2)
coupR2 = cplFvFecHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gP], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,0._dp),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,0._dp),dp) 
coup1 = cplcgAgWpCVWm
coup2 = cplcgWpCgAcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,MVZ2),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,MVZ2),dp) 
coup1 = cplcgZgWpCVWm
coup2 = cplcgWpCgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZ2,MVWm2),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MVWm2),dp) 
coup1 = cplcgWmgZVWm
coup2 = cplcgZgWmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWm(i2,i1)
coup2 = cplhhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWmVWm(i2)
coup2 = cplhhcHpmVWm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MSu2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSu2(i2),MSd2(i1)),dp) 
coup1 = cplSucSdVWm(i2,i1)
coup2 = cplSdcHpmcSu(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MSvIm2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvIm2(i2),MSe2(i1)),dp) 
coup1 = cplSvImcSeVWm(i2,i1)
coup2 = cplSeSvImcHpm(i1,i2,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MSvRe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MSvRe2(i2),MSe2(i1)),dp) 
coup1 = cplSvRecSeVWm(i2,i1)
coup2 = cplSeSvRecHpm(i1,i2,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,0._dp,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcHpmVP(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,0._dp),dp)
B1m2 = Real(SA_B1(p2,MVWm2,0._dp),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcHpmVPVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZ2,MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplHpmcHpmVZ(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWm2,MVZ2),dp)
B1m2 = Real(SA_B1(p2,MVWm2,MVZ2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplcHpmVWmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWmHpm 
 
Subroutine DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhcHpmVWm,cplAhHpmcHpm,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,     & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,  & 
& cplcgZgWmcHpm,cplcgZgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,   & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,         & 
& cplhhHpmcHpm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),Mhh(3),Mhh2(3),MHpm(2),MHpm2(2),MSd(6),          & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),MSvRe(9),MSvRe2(9),           & 
& MVWm,MVWm2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhcHpmVWm(3,2),cplAhHpmcHpm(3,2,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),        & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,9),cplcFeFvVWmR(3,9),               & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm(2),& 
& cplcgWpCgZcHpm(2),cplcgZgWmcHpm(2),cplcgZgWpCVWm,cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),& 
& cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcVWmVPVWm,cplcVWmVWmVZ,cplFvFecHpmL(9,3,2),         & 
& cplFvFecHpmR(9,3,2),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhHpmcHpm(3,2,2),             & 
& cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,9,2),          & 
& cplSeSvRecHpm(6,9,2),cplSucSdVWm(6,6),cplSvImcSeVWm(9,6),cplSvRecSeVWm(9,6)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhcHpmVWm(i2,i1)
coup2 = cplAhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Cha], Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 5
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MCha2(i1),MChi2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MCha2(i1),MChi2(i2)),dp) 
coupL1 = cplcChaChiVWmL(i1,i2)
coupR1 = cplcChaChiVWmR(i1,i2)
coupL2 = cplChiChacHpmL(i2,i1,gO2)
coupR2 = cplChiChacHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MCha(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MChi(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWmL(i1,i2)
coupR1 = cplcFdFuVWmR(i1,i2)
coupL2 = cplcFuFdcHpmL(i2,i1,gO2)
coupR2 = cplcFuFdcHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWmL(i1,i2)
coupR1 = cplcFeFvVWmR(i1,i2)
coupL2 = cplFvFecHpmL(i2,i1,gO2)
coupR2 = cplFvFecHpmR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gP], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVP2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVP2),dp) 
coup1 = cplcgAgWpCVWm
coup2 = cplcgWpCgAcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVZ2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,MVZ2),dp) 
coup1 = cplcgZgWpCVWm
coup2 = cplcgWpCgZcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWm], gZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZ2,MVWm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MVWm2),dp) 
coup1 = cplcgWmgZVWm
coup2 = cplcgZgWmcHpm(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhcHpmVWm(i2,i1)
coup2 = cplhhHpmcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWmVWm(i2)
coup2 = cplhhcHpmVWm(i2,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Sd], Su 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MSu2(i2),MSd2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSu2(i2),MSd2(i1)),dp) 
coup1 = cplSucSdVWm(i2,i1)
coup2 = cplSdcHpmcSu(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], SvIm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MSvIm2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvIm2(i2),MSe2(i1)),dp) 
coup1 = cplSvImcSeVWm(i2,i1)
coup2 = cplSeSvImcHpm(i1,i2,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Se], SvRe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MSvRe2(i2),MSe2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MSvRe2(i2),MSe2(i1)),dp) 
coup1 = cplSvRecSeVWm(i2,i1)
coup2 = cplSeSvRecHpm(i1,i2,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVP2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,MHpm2(i1)),dp) 
coup1 = cplcHpmVPVWm(i1)
coup2 = cplHpmcHpmVP(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VP 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVP2),dp)
B1m2 = Real(SA_DerB1(p2,MVWm2,MVP2),dp) 
coup1 = cplcVWmVPVWm
coup2 = cplcHpmVPVWm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZ2,MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MHpm2(i1)),dp) 
coup1 = cplcHpmVWmVZ(i1)
coup2 = cplHpmcHpmVZ(i1,gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWm], VZ 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWm2,MVZ2),dp)
B1m2 = Real(SA_DerB1(p2,MVWm2,MVZ2),dp) 
coup1 = cplcVWmVWmVZ
coup2 = cplcHpmVWmVZ(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWmHpm 
 
End Module LoopMasses_NInvSeesaw 
