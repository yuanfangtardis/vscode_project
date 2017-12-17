! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:28 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_hh_NInvSeesaw
Use Model_Data_NInvSeesaw 
Use Kinematics 
Use OneLoopDecay_hh_NInvSeesaw 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_hh(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,            & 
& MSuOS,MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,             & 
& MChi2OS,MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,            & 
& MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,            & 
& ZAOS,ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,            & 
& MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,              & 
& Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,             & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,              & 
& ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,BMUX,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,vd,               & 
& vu,vS,dg1,dg2,dg3,dMUX,dBMUX,dYd,dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,           & 
& dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dmx2,dM1,               & 
& dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,             & 
& dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,          & 
& ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,          & 
& ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhAhAh1,cplAhAhAhhh1,             & 
& cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,   & 
& cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhAhVZVZ1,        & 
& cplAhcHpmVPVWm1,cplAhcHpmVWm,cplAhcHpmVWmVZ1,cplAhhhhh,cplAhhhhhhh1,cplAhhhHpmcHpm1,   & 
& cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,         & 
& cplAhhhSvReSvRe1,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,  & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,   & 
& cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,          & 
& cplcFdGluSdR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuGluSuL,cplcFuGluSuR,cplcgAgWmcVWm,cplcgAgWpCVWm,cplcgWmgAHpm,cplcgWmgAVWm,       & 
& cplcgWmgWmAh,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgZHpm,cplcgWmgZVWm,         & 
& cplcgWpCgAcVWm,cplcgWpCgWpCAh,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,            & 
& cplcgWpCgZcHpm,cplcgWpCgZcVWm,cplcgZgAhh,cplcgZgWmcHpm,cplcgZgWmcVWm,cplcgZgWpCHpm,    & 
& cplcgZgWpCVWm,cplcgZgZhh,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,      & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q, & 
& cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,cplcVWmVPVWm,cplcVWmVPVWmVZ1Q,      & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmVWmVZ,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,      & 
& cplcVWmVWmVZVZ3Q,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,     & 
& cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,        & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplhhcHpmVPVWm1,cplhhcHpmVWm,      & 
& cplhhcHpmVWmVZ1,cplhhcVWmVWm,cplhhhhcVWmVWm1,cplhhhhhh,cplhhhhhhhh1,cplhhhhHpmcHpm1,   & 
& cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,         & 
& cplhhhhSvReSvRe1,cplhhhhVZVZ1,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmcVWmVP1,               & 
& cplhhHpmcVWmVZ1,cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSdcHpmcSuaa,    & 
& cplhhSdcSd,cplhhSecSe,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhSucSu,cplhhSvImSvIm,      & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVZVZ,cplHpmcHpmcVWmVWm1,cplHpmcHpmVP,cplHpmcHpmVPVP1, & 
& cplHpmcHpmVPVZ1,cplHpmcHpmVZ,cplHpmcHpmVZVZ1,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmHpmcHpmcHpm1,& 
& cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSucSd,cplHpmSvImcSe,        & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvRecSe,cplHpmSvReSvRecHpm1,             & 
& cplSdcHpmcSu,cplSdcSdcVWmVWmaa,cplSdcSdVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,   & 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSdcSdVP,cplSdcSdVPVPaa,cplSdcSdVPVZaa,    & 
& cplSdcSdVZ,cplSdcSdVZVZaa,cplSdcSucVWm,cplSdSdcSdcSdabab,cplSdSdcSdcSdabba,            & 
& cplSdSecSdcSeaa,cplSdSucSdcSuabab,cplSdSucSdcSuabba,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,& 
& cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVZ,cplSecSeVZVZ1,      & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvImSvImcSe1,          & 
& cplSeSvImSvRecSe1,cplSeSvRecHpm,cplSeSvRecVWm,cplSeSvReSvRecSe1,cplSucSdVWm,           & 
& cplSucSucVWmVWmaa,cplSucSuVG,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVP,cplSucSuVPVPaa,cplSucSuVPVZaa,cplSucSuVZ,cplSucSuVZVZaa,cplSuSucSucSuabab,  & 
& cplSuSucSucSuabba,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,            & 
& cplSvImcSeVWm,cplSvImSvImcVWmVWm1,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvImVZVZ1,cplSvImSvReSvReSvRe1,cplSvImSvReVZ,              & 
& cplSvRecSeVWm,cplSvReSvRecVWmVWm1,cplSvReSvReSvReSvRe1,cplSvReSvReVZVZ1,               & 
& ctcplAhAhhh,ctcplAhhhhh,ctcplAhhhVZ,ctcplcChaChahhL,ctcplcChaChahhR,ctcplcFdFdhhL,     & 
& ctcplcFdFdhhR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplChiChihhL,  & 
& ctcplChiChihhR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplhhcVWmVWm,ctcplhhhhhh,ctcplhhHpmcHpm,    & 
& ctcplhhHpmcVWm,ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,ctcplhhSvImSvRe, & 
& ctcplhhSvReSvRe,ctcplhhVZVZ,GcplcHpmVPVWm,GcplhhcHpmVWm,GcplhhHpmcHpm,GcplhhHpmcVWm,   & 
& GcplHpmcVWmVP,GosZcplcHpmVPVWm,GosZcplhhcHpmVWm,GosZcplhhHpmcHpm,GosZcplhhHpmcVWm,     & 
& GosZcplHpmcVWmVP,GZcplcHpmVPVWm,GZcplhhcHpmVWm,GZcplhhHpmcHpm,GZcplhhHpmcVWm,          & 
& GZcplHpmcVWmVP,ZcplAhAhhh,ZcplAhhhhh,ZcplAhhhVZ,ZcplcChaChahhL,ZcplcChaChahhR,         & 
& ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFuFuhhL,ZcplcFuFuhhR,         & 
& ZcplChiChihhL,ZcplChiChihhR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplhhcVWmVWm,Zcplhhhhhh,          & 
& ZcplhhHpmcHpm,ZcplhhHpmcVWm,ZcplhhSdcSd,ZcplhhSecSe,ZcplhhSucSu,ZcplhhSvImSvIm,        & 
& ZcplhhSvImSvRe,ZcplhhSvReSvRe,ZcplhhVZVZ,ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,              & 
& ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,          & 
& ZRUZUR,MLambda,em,gs,deltaM,kont,gP1Lhh)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Real(dp),Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),              & 
& MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),ZVR(9,9),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dmHd2,dmHu2,dms2,dvd,dvu,dvS,dZH(3,3),dZA(3,3),dZP(2,2),dSinTW,           & 
& dCosTW,dTanTW

Complex(dp),Intent(in) :: dMUX(3,3),dBMUX(3,3),dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dlam,dTlam,dkap,             & 
& dTk,dlamN(3,3),dTLN(3,3),dYu(3,3),dTu(3,3),dYv(3,3),dTv(3,3),dmq2(3,3),dml2(3,3),      & 
& dmd2(3,3),dmu2(3,3),dme2(3,3),dmv2(3,3),dmx2(3,3),dM1,dM2,dM3,dpG,dZD(6,6),            & 
& dZVI(9,9),dZVR(9,9),dZU(6,6),dZE(6,6),dZN(5,5),dUV(9,9),dUM(2,2),dUP(2,2),             & 
& dZEL(3,3),dZER(3,3),dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhAhAh1(3,3,3,3),cplAhAhAhhh1(3,3,3,3),cplAhAhcVWmVWm1(3,3),    & 
& cplAhAhhh(3,3,3),cplAhAhhhhh1(3,3,3,3),cplAhAhHpmcHpm1(3,3,2,2),cplAhAhSdcSdaa(3,3,6,6),& 
& cplAhAhSecSe1(3,3,6,6),cplAhAhSucSuaa(3,3,6,6),cplAhAhSvImSvIm1(3,3,9,9),              & 
& cplAhAhSvImSvRe1(3,3,9,9),cplAhAhSvReSvRe1(3,3,9,9),cplAhAhVZVZ1(3,3),cplAhcHpmVPVWm1(3,2),& 
& cplAhcHpmVWm(3,2),cplAhcHpmVWmVZ1(3,2),cplAhhhhh(3,3,3),cplAhhhhhhh1(3,3,3,3),         & 
& cplAhhhHpmcHpm1(3,3,2,2),cplAhhhSdcSdaa(3,3,6,6),cplAhhhSecSe1(3,3,6,6),               & 
& cplAhhhSucSuaa(3,3,6,6),cplAhhhSvImSvIm1(3,3,9,9),cplAhhhSvImSvRe1(3,3,9,9),           & 
& cplAhhhSvReSvRe1(3,3,9,9),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),        & 
& cplAhHpmcVWmVP1(3,2),cplAhHpmcVWmVZ1(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),         & 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),      & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),   & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),       & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),     & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcChaFeSvImL(2,3,9),cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),& 
& cplcChaFvSeL(2,9,6),cplcChaFvSeR(2,9,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),       & 
& cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),               & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),& 
& cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9),   & 
& cplcFeChaSvReR(3,2,9),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFeFeAhL(3,3,3),      & 
& cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),             & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),& 
& cplcFeFvVWmL(3,9),cplcFeFvVWmR(3,9),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),           & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplcgAgWmcVWm,cplcgAgWpCVWm,      & 
& cplcgWmgAHpm(2),cplcgWmgAVWm,cplcgWmgWmAh(3),cplcgWmgWmhh(3),cplcgWmgWmVP,             & 
& cplcgWmgWmVZ,cplcgWmgZHpm(2),cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh(3),            & 
& cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgZcHpm(2),cplcgWpCgZcVWm,      & 
& cplcgZgAhh(3),cplcgZgWmcHpm(2),cplcgZgWmcVWm,cplcgZgWpCHpm(2),cplcgZgWpCVWm,           & 
& cplcgZgZhh(3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),           & 
& cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),     & 
& cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),         & 
& cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6)

Complex(dp),Intent(in) :: cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,9,9),      & 
& cplChiFvSvImR(5,9,9),cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),cplcHpmVPVWm(2),        & 
& cplcHpmVWmVZ(2),cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,           & 
& cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,cplcVWmVPVWm,cplcVWmVPVWmVZ1Q,      & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmVWmVZ,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,      & 
& cplcVWmVWmVZVZ3Q,cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),cplFvFecHpmL(9,3,2),          & 
& cplFvFecHpmR(9,3,2),cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplFvFvAhL(9,9,3),             & 
& cplFvFvAhR(9,9,3),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9), & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),               & 
& cplhhcHpmVPVWm1(3,2),cplhhcHpmVWm(3,2),cplhhcHpmVWmVZ1(3,2),cplhhcVWmVWm(3),           & 
& cplhhhhcVWmVWm1(3,3),cplhhhhhh(3,3,3),cplhhhhhhhh1(3,3,3,3),cplhhhhHpmcHpm1(3,3,2,2),  & 
& cplhhhhSdcSdaa(3,3,6,6),cplhhhhSecSe1(3,3,6,6),cplhhhhSucSuaa(3,3,6,6),cplhhhhSvImSvIm1(3,3,9,9),& 
& cplhhhhSvImSvRe1(3,3,9,9),cplhhhhSvReSvRe1(3,3,9,9),cplhhhhVZVZ1(3,3),cplhhHpmcHpm(3,2,2),& 
& cplhhHpmcVWm(3,2),cplhhHpmcVWmVP1(3,2),cplhhHpmcVWmVZ1(3,2),cplhhHpmSucSdaa(3,2,6,6),  & 
& cplhhHpmSvImcSe1(3,2,9,6),cplhhHpmSvRecSe1(3,2,9,6),cplhhSdcHpmcSuaa(3,6,2,6),         & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSeSvImcHpm1(3,6,9,2),cplhhSeSvRecHpm1(3,6,9,2),& 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),      & 
& cplhhVZVZ(3),cplHpmcHpmcVWmVWm1(2,2),cplHpmcHpmVP(2,2),cplHpmcHpmVPVP1(2,2),           & 
& cplHpmcHpmVPVZ1(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZVZ1(2,2),cplHpmcVWmVP(2),           & 
& cplHpmcVWmVZ(2),cplHpmHpmcHpmcHpm1(2,2,2,2),cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),& 
& cplHpmSucHpmcSuaa(2,6,2,6),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),cplHpmSvImSvImcHpm1(2,9,9,2),& 
& cplHpmSvImSvRecHpm1(2,9,9,2),cplHpmSvRecSe(2,9,6),cplHpmSvReSvRecHpm1(2,9,9,2),        & 
& cplSdcHpmcSu(6,2,6),cplSdcSdcVWmVWmaa(6,6),cplSdcSdVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSdcSdVP(6,6),cplSdcSdVPVPaa(6,6),    & 
& cplSdcSdVPVZaa(6,6),cplSdcSdVZ(6,6),cplSdcSdVZVZaa(6,6),cplSdcSucVWm(6,6),             & 
& cplSdSdcSdcSdabab(6,6,6,6),cplSdSdcSdcSdabba(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),        & 
& cplSdSucSdcSuabab(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),cplSdSvImSvImcSdaa(6,9,9,6),     & 
& cplSdSvReSvRecSdaa(6,9,9,6),cplSecSecVWmVWm1(6,6),cplSecSeVP(6,6),cplSecSeVPVP1(6,6),  & 
& cplSecSeVPVZ1(6,6),cplSecSeVZ(6,6),cplSecSeVZVZ1(6,6),cplSeSecSecSe1(6,6,6,6),         & 
& cplSeSucSecSuaa(6,6,6,6),cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSeSvImSvImcSe1(6,9,9,6),& 
& cplSeSvImSvRecSe1(6,9,9,6),cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),cplSeSvReSvRecSe1(6,9,9,6),& 
& cplSucSdVWm(6,6),cplSucSucVWmVWmaa(6,6),cplSucSuVG(6,6),cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSucSuVP(6,6),cplSucSuVPVPaa(6,6),    & 
& cplSucSuVPVZaa(6,6),cplSucSuVZ(6,6),cplSucSuVZVZaa(6,6),cplSuSucSucSuabab(6,6,6,6),    & 
& cplSuSucSucSuabba(6,6,6,6),cplSuSvImSvImcSuaa(6,9,9,6),cplSuSvImSvRecSuaa(6,9,9,6),    & 
& cplSuSvReSvRecSuaa(6,9,9,6),cplSvImcSeVWm(9,6),cplSvImSvImcVWmVWm1(9,9),               & 
& cplSvImSvImSvImSvIm1(9,9,9,9),cplSvImSvImSvImSvRe1(9,9,9,9),cplSvImSvImSvReSvRe1(9,9,9,9)

Complex(dp),Intent(in) :: cplSvImSvImVZVZ1(9,9),cplSvImSvReSvReSvRe1(9,9,9,9),cplSvImSvReVZ(9,9),cplSvRecSeVWm(9,6),& 
& cplSvReSvRecVWmVWm1(9,9),cplSvReSvReSvReSvRe1(9,9,9,9),cplSvReSvReVZVZ1(9,9),          & 
& ctcplAhAhhh(3,3,3),ctcplAhhhhh(3,3,3),ctcplAhhhVZ(3,3),ctcplcChaChahhL(2,2,3),         & 
& ctcplcChaChahhR(2,2,3),ctcplcFdFdhhL(3,3,3),ctcplcFdFdhhR(3,3,3),ctcplcFeFehhL(3,3,3), & 
& ctcplcFeFehhR(3,3,3),ctcplcFuFuhhL(3,3,3),ctcplcFuFuhhR(3,3,3),ctcplChiChihhL(5,5,3),  & 
& ctcplChiChihhR(5,5,3),ctcplFvFvhhL(9,9,3),ctcplFvFvhhR(9,9,3),ctcplhhcVWmVWm(3),       & 
& ctcplhhhhhh(3,3,3),ctcplhhHpmcHpm(3,2,2),ctcplhhHpmcVWm(3,2),ctcplhhSdcSd(3,6,6),      & 
& ctcplhhSecSe(3,6,6),ctcplhhSucSu(3,6,6),ctcplhhSvImSvIm(3,9,9),ctcplhhSvImSvRe(3,9,9), & 
& ctcplhhSvReSvRe(3,9,9),ctcplhhVZVZ(3),GcplcHpmVPVWm(2),GcplhhcHpmVWm(3,2),             & 
& GcplhhHpmcHpm(3,2,2),GcplhhHpmcVWm(3,2),GcplHpmcVWmVP(2),GosZcplcHpmVPVWm(2),          & 
& GosZcplhhcHpmVWm(3,2),GosZcplhhHpmcHpm(3,2,2),GosZcplhhHpmcVWm(3,2),GosZcplHpmcVWmVP(2),& 
& GZcplcHpmVPVWm(2),GZcplhhcHpmVWm(3,2),GZcplhhHpmcHpm(3,2,2),GZcplhhHpmcVWm(3,2),       & 
& GZcplHpmcVWmVP(2),ZcplAhAhhh(3,3,3),ZcplAhhhhh(3,3,3),ZcplAhhhVZ(3,3),ZcplcChaChahhL(2,2,3),& 
& ZcplcChaChahhR(2,2,3),ZcplcFdFdhhL(3,3,3),ZcplcFdFdhhR(3,3,3),ZcplcFeFehhL(3,3,3),     & 
& ZcplcFeFehhR(3,3,3),ZcplcFuFuhhL(3,3,3),ZcplcFuFuhhR(3,3,3),ZcplChiChihhL(5,5,3),      & 
& ZcplChiChihhR(5,5,3),ZcplFvFvhhL(9,9,3),ZcplFvFvhhR(9,9,3),ZcplhhcVWmVWm(3),           & 
& Zcplhhhhhh(3,3,3),ZcplhhHpmcHpm(3,2,2),ZcplhhHpmcVWm(3,2),ZcplhhSdcSd(3,6,6),          & 
& ZcplhhSecSe(3,6,6),ZcplhhSucSu(3,6,6),ZcplhhSvImSvIm(3,9,9),ZcplhhSvImSvRe(3,9,9),     & 
& ZcplhhSvReSvRe(3,9,9),ZcplhhVZVZ(3)

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd(6,6),ZfSvIm(9,9),ZfSvRe(9,9),ZfSu(6,6),ZfSe(6,6),      & 
& Zfhh(3,3),ZfAh(3,3),ZfHpm(2,2),ZfL0(5,5),ZfFV(9,9),ZfLm(2,2),ZfLp(2,2),ZfFEL(3,3),     & 
& ZfFER(3,3),ZfFDL(3,3),ZfFDR(3,3),ZfFUL(3,3),ZfFUR(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MSdOS(6),MSd2OS(6),MSvImOS(9),MSvIm2OS(9),MSvReOS(9),MSvRe2OS(9),MSuOS(6),            & 
& MSu2OS(6),MSeOS(6),MSe2OS(6),MhhOS(3),Mhh2OS(3),MAhOS(3),MAh2OS(3),MHpmOS(2),          & 
& MHpm2OS(2),MChiOS(5),MChi2OS(5),MFvOS(9),MFv2OS(9),MChaOS(2),MCha2OS(2),               & 
& MFeOS(3),MFe2OS(3),MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MGluOS,MGlu2OS,               & 
& MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZHOS(3,3),ZAOS(3,3),ZPOS(2,2)

Complex(dp),Intent(in) :: ZDOS(6,6),ZVIOS(9,9),ZVROS(9,9),ZUOS(6,6),ZEOS(6,6),ZNOS(5,5),UVOS(9,9),              & 
& UMOS(2,2),UPOS(2,2),ZELOS(3,3),ZEROS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),            & 
& ZUROS(3,3)

Complex(dp),Intent(in) :: ZRUZD(6,6),ZRUZVI(9,9),ZRUZVR(9,9),ZRUZU(6,6),ZRUZE(6,6),ZRUZH(3,3),ZRUZA(3,3),       & 
& ZRUZP(2,2),ZRUZN(5,5),ZRUUV(9,9),ZRUUM(2,2),ZRUUP(2,2),ZRUZEL(3,3),ZRUZER(3,3),        & 
& ZRUZDL(3,3),ZRUZDR(3,3),ZRUZUL(3,3),ZRUZUR(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1Lhh(3,407) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUZDc(6, 6) 
Complex(dp) :: ZRUZVIc(9, 9) 
Complex(dp) :: ZRUZVRc(9, 9) 
Complex(dp) :: ZRUZUc(6, 6) 
Complex(dp) :: ZRUZEc(6, 6) 
Complex(dp) :: ZRUZHc(3, 3) 
Complex(dp) :: ZRUZAc(3, 3) 
Complex(dp) :: ZRUZPc(2, 2) 
Complex(dp) :: ZRUZNc(5, 5) 
Complex(dp) :: ZRUUVc(9, 9) 
Complex(dp) :: ZRUUMc(2, 2) 
Complex(dp) :: ZRUUPc(2, 2) 
Complex(dp) :: ZRUZELc(3, 3) 
Complex(dp) :: ZRUZERc(3, 3) 
Complex(dp) :: ZRUZDLc(3, 3) 
Complex(dp) :: ZRUZDRc(3, 3) 
Complex(dp) :: ZRUZULc(3, 3) 
Complex(dp) :: ZRUZURc(3, 3) 
Real(dp) :: MRPhhToAhAh(3,3,3),MRGhhToAhAh(3,3,3), MRPZhhToAhAh(3,3,3),MRGZhhToAhAh(3,3,3) 
Real(dp) :: MVPhhToAhAh(3,3,3) 
Real(dp) :: RMsqTreehhToAhAh(3,3,3),RMsqWavehhToAhAh(3,3,3),RMsqVertexhhToAhAh(3,3,3) 
Complex(dp) :: AmpTreehhToAhAh(3,3,3),AmpWavehhToAhAh(3,3,3)=(0._dp,0._dp),AmpVertexhhToAhAh(3,3,3)& 
 & ,AmpVertexIRoshhToAhAh(3,3,3),AmpVertexIRdrhhToAhAh(3,3,3), AmpSumhhToAhAh(3,3,3), AmpSum2hhToAhAh(3,3,3) 
Complex(dp) :: AmpTreeZhhToAhAh(3,3,3),AmpWaveZhhToAhAh(3,3,3),AmpVertexZhhToAhAh(3,3,3) 
Real(dp) :: AmpSqhhToAhAh(3,3,3),  AmpSqTreehhToAhAh(3,3,3) 
Real(dp) :: MRPhhTohhAh(3,3,3),MRGhhTohhAh(3,3,3), MRPZhhTohhAh(3,3,3),MRGZhhTohhAh(3,3,3) 
Real(dp) :: MVPhhTohhAh(3,3,3) 
Real(dp) :: RMsqTreehhTohhAh(3,3,3),RMsqWavehhTohhAh(3,3,3),RMsqVertexhhTohhAh(3,3,3) 
Complex(dp) :: AmpTreehhTohhAh(3,3,3),AmpWavehhTohhAh(3,3,3)=(0._dp,0._dp),AmpVertexhhTohhAh(3,3,3)& 
 & ,AmpVertexIRoshhTohhAh(3,3,3),AmpVertexIRdrhhTohhAh(3,3,3), AmpSumhhTohhAh(3,3,3), AmpSum2hhTohhAh(3,3,3) 
Complex(dp) :: AmpTreeZhhTohhAh(3,3,3),AmpWaveZhhTohhAh(3,3,3),AmpVertexZhhTohhAh(3,3,3) 
Real(dp) :: AmpSqhhTohhAh(3,3,3),  AmpSqTreehhTohhAh(3,3,3) 
Real(dp) :: MRPhhToAhVZ(3,3),MRGhhToAhVZ(3,3), MRPZhhToAhVZ(3,3),MRGZhhToAhVZ(3,3) 
Real(dp) :: MVPhhToAhVZ(3,3) 
Real(dp) :: RMsqTreehhToAhVZ(3,3),RMsqWavehhToAhVZ(3,3),RMsqVertexhhToAhVZ(3,3) 
Complex(dp) :: AmpTreehhToAhVZ(2,3,3),AmpWavehhToAhVZ(2,3,3)=(0._dp,0._dp),AmpVertexhhToAhVZ(2,3,3)& 
 & ,AmpVertexIRoshhToAhVZ(2,3,3),AmpVertexIRdrhhToAhVZ(2,3,3), AmpSumhhToAhVZ(2,3,3), AmpSum2hhToAhVZ(2,3,3) 
Complex(dp) :: AmpTreeZhhToAhVZ(2,3,3),AmpWaveZhhToAhVZ(2,3,3),AmpVertexZhhToAhVZ(2,3,3) 
Real(dp) :: AmpSqhhToAhVZ(3,3),  AmpSqTreehhToAhVZ(3,3) 
Real(dp) :: MRPhhTocChaCha(3,2,2),MRGhhTocChaCha(3,2,2), MRPZhhTocChaCha(3,2,2),MRGZhhTocChaCha(3,2,2) 
Real(dp) :: MVPhhTocChaCha(3,2,2) 
Real(dp) :: RMsqTreehhTocChaCha(3,2,2),RMsqWavehhTocChaCha(3,2,2),RMsqVertexhhTocChaCha(3,2,2) 
Complex(dp) :: AmpTreehhTocChaCha(2,3,2,2),AmpWavehhTocChaCha(2,3,2,2)=(0._dp,0._dp),AmpVertexhhTocChaCha(2,3,2,2)& 
 & ,AmpVertexIRoshhTocChaCha(2,3,2,2),AmpVertexIRdrhhTocChaCha(2,3,2,2), AmpSumhhTocChaCha(2,3,2,2), AmpSum2hhTocChaCha(2,3,2,2) 
Complex(dp) :: AmpTreeZhhTocChaCha(2,3,2,2),AmpWaveZhhTocChaCha(2,3,2,2),AmpVertexZhhTocChaCha(2,3,2,2) 
Real(dp) :: AmpSqhhTocChaCha(3,2,2),  AmpSqTreehhTocChaCha(3,2,2) 
Real(dp) :: MRPhhToChiChi(3,5,5),MRGhhToChiChi(3,5,5), MRPZhhToChiChi(3,5,5),MRGZhhToChiChi(3,5,5) 
Real(dp) :: MVPhhToChiChi(3,5,5) 
Real(dp) :: RMsqTreehhToChiChi(3,5,5),RMsqWavehhToChiChi(3,5,5),RMsqVertexhhToChiChi(3,5,5) 
Complex(dp) :: AmpTreehhToChiChi(2,3,5,5),AmpWavehhToChiChi(2,3,5,5)=(0._dp,0._dp),AmpVertexhhToChiChi(2,3,5,5)& 
 & ,AmpVertexIRoshhToChiChi(2,3,5,5),AmpVertexIRdrhhToChiChi(2,3,5,5), AmpSumhhToChiChi(2,3,5,5), AmpSum2hhToChiChi(2,3,5,5) 
Complex(dp) :: AmpTreeZhhToChiChi(2,3,5,5),AmpWaveZhhToChiChi(2,3,5,5),AmpVertexZhhToChiChi(2,3,5,5) 
Real(dp) :: AmpSqhhToChiChi(3,5,5),  AmpSqTreehhToChiChi(3,5,5) 
Real(dp) :: MRPhhTocFdFd(3,3,3),MRGhhTocFdFd(3,3,3), MRPZhhTocFdFd(3,3,3),MRGZhhTocFdFd(3,3,3) 
Real(dp) :: MVPhhTocFdFd(3,3,3) 
Real(dp) :: RMsqTreehhTocFdFd(3,3,3),RMsqWavehhTocFdFd(3,3,3),RMsqVertexhhTocFdFd(3,3,3) 
Complex(dp) :: AmpTreehhTocFdFd(2,3,3,3),AmpWavehhTocFdFd(2,3,3,3)=(0._dp,0._dp),AmpVertexhhTocFdFd(2,3,3,3)& 
 & ,AmpVertexIRoshhTocFdFd(2,3,3,3),AmpVertexIRdrhhTocFdFd(2,3,3,3), AmpSumhhTocFdFd(2,3,3,3), AmpSum2hhTocFdFd(2,3,3,3) 
Complex(dp) :: AmpTreeZhhTocFdFd(2,3,3,3),AmpWaveZhhTocFdFd(2,3,3,3),AmpVertexZhhTocFdFd(2,3,3,3) 
Real(dp) :: AmpSqhhTocFdFd(3,3,3),  AmpSqTreehhTocFdFd(3,3,3) 
Real(dp) :: MRPhhTocFeFe(3,3,3),MRGhhTocFeFe(3,3,3), MRPZhhTocFeFe(3,3,3),MRGZhhTocFeFe(3,3,3) 
Real(dp) :: MVPhhTocFeFe(3,3,3) 
Real(dp) :: RMsqTreehhTocFeFe(3,3,3),RMsqWavehhTocFeFe(3,3,3),RMsqVertexhhTocFeFe(3,3,3) 
Complex(dp) :: AmpTreehhTocFeFe(2,3,3,3),AmpWavehhTocFeFe(2,3,3,3)=(0._dp,0._dp),AmpVertexhhTocFeFe(2,3,3,3)& 
 & ,AmpVertexIRoshhTocFeFe(2,3,3,3),AmpVertexIRdrhhTocFeFe(2,3,3,3), AmpSumhhTocFeFe(2,3,3,3), AmpSum2hhTocFeFe(2,3,3,3) 
Complex(dp) :: AmpTreeZhhTocFeFe(2,3,3,3),AmpWaveZhhTocFeFe(2,3,3,3),AmpVertexZhhTocFeFe(2,3,3,3) 
Real(dp) :: AmpSqhhTocFeFe(3,3,3),  AmpSqTreehhTocFeFe(3,3,3) 
Real(dp) :: MRPhhTocFuFu(3,3,3),MRGhhTocFuFu(3,3,3), MRPZhhTocFuFu(3,3,3),MRGZhhTocFuFu(3,3,3) 
Real(dp) :: MVPhhTocFuFu(3,3,3) 
Real(dp) :: RMsqTreehhTocFuFu(3,3,3),RMsqWavehhTocFuFu(3,3,3),RMsqVertexhhTocFuFu(3,3,3) 
Complex(dp) :: AmpTreehhTocFuFu(2,3,3,3),AmpWavehhTocFuFu(2,3,3,3)=(0._dp,0._dp),AmpVertexhhTocFuFu(2,3,3,3)& 
 & ,AmpVertexIRoshhTocFuFu(2,3,3,3),AmpVertexIRdrhhTocFuFu(2,3,3,3), AmpSumhhTocFuFu(2,3,3,3), AmpSum2hhTocFuFu(2,3,3,3) 
Complex(dp) :: AmpTreeZhhTocFuFu(2,3,3,3),AmpWaveZhhTocFuFu(2,3,3,3),AmpVertexZhhTocFuFu(2,3,3,3) 
Real(dp) :: AmpSqhhTocFuFu(3,3,3),  AmpSqTreehhTocFuFu(3,3,3) 
Real(dp) :: MRPhhToFvFv(3,9,9),MRGhhToFvFv(3,9,9), MRPZhhToFvFv(3,9,9),MRGZhhToFvFv(3,9,9) 
Real(dp) :: MVPhhToFvFv(3,9,9) 
Real(dp) :: RMsqTreehhToFvFv(3,9,9),RMsqWavehhToFvFv(3,9,9),RMsqVertexhhToFvFv(3,9,9) 
Complex(dp) :: AmpTreehhToFvFv(2,3,9,9),AmpWavehhToFvFv(2,3,9,9)=(0._dp,0._dp),AmpVertexhhToFvFv(2,3,9,9)& 
 & ,AmpVertexIRoshhToFvFv(2,3,9,9),AmpVertexIRdrhhToFvFv(2,3,9,9), AmpSumhhToFvFv(2,3,9,9), AmpSum2hhToFvFv(2,3,9,9) 
Complex(dp) :: AmpTreeZhhToFvFv(2,3,9,9),AmpWaveZhhToFvFv(2,3,9,9),AmpVertexZhhToFvFv(2,3,9,9) 
Real(dp) :: AmpSqhhToFvFv(3,9,9),  AmpSqTreehhToFvFv(3,9,9) 
Real(dp) :: MRPhhTohhhh(3,3,3),MRGhhTohhhh(3,3,3), MRPZhhTohhhh(3,3,3),MRGZhhTohhhh(3,3,3) 
Real(dp) :: MVPhhTohhhh(3,3,3) 
Real(dp) :: RMsqTreehhTohhhh(3,3,3),RMsqWavehhTohhhh(3,3,3),RMsqVertexhhTohhhh(3,3,3) 
Complex(dp) :: AmpTreehhTohhhh(3,3,3),AmpWavehhTohhhh(3,3,3)=(0._dp,0._dp),AmpVertexhhTohhhh(3,3,3)& 
 & ,AmpVertexIRoshhTohhhh(3,3,3),AmpVertexIRdrhhTohhhh(3,3,3), AmpSumhhTohhhh(3,3,3), AmpSum2hhTohhhh(3,3,3) 
Complex(dp) :: AmpTreeZhhTohhhh(3,3,3),AmpWaveZhhTohhhh(3,3,3),AmpVertexZhhTohhhh(3,3,3) 
Real(dp) :: AmpSqhhTohhhh(3,3,3),  AmpSqTreehhTohhhh(3,3,3) 
Real(dp) :: MRPhhTocHpmHpm(3,2,2),MRGhhTocHpmHpm(3,2,2), MRPZhhTocHpmHpm(3,2,2),MRGZhhTocHpmHpm(3,2,2) 
Real(dp) :: MVPhhTocHpmHpm(3,2,2) 
Real(dp) :: RMsqTreehhTocHpmHpm(3,2,2),RMsqWavehhTocHpmHpm(3,2,2),RMsqVertexhhTocHpmHpm(3,2,2) 
Complex(dp) :: AmpTreehhTocHpmHpm(3,2,2),AmpWavehhTocHpmHpm(3,2,2)=(0._dp,0._dp),AmpVertexhhTocHpmHpm(3,2,2)& 
 & ,AmpVertexIRoshhTocHpmHpm(3,2,2),AmpVertexIRdrhhTocHpmHpm(3,2,2), AmpSumhhTocHpmHpm(3,2,2), AmpSum2hhTocHpmHpm(3,2,2) 
Complex(dp) :: AmpTreeZhhTocHpmHpm(3,2,2),AmpWaveZhhTocHpmHpm(3,2,2),AmpVertexZhhTocHpmHpm(3,2,2) 
Real(dp) :: AmpSqhhTocHpmHpm(3,2,2),  AmpSqTreehhTocHpmHpm(3,2,2) 
Real(dp) :: MRPhhToHpmcVWm(3,2),MRGhhToHpmcVWm(3,2), MRPZhhToHpmcVWm(3,2),MRGZhhToHpmcVWm(3,2) 
Real(dp) :: MVPhhToHpmcVWm(3,2) 
Real(dp) :: RMsqTreehhToHpmcVWm(3,2),RMsqWavehhToHpmcVWm(3,2),RMsqVertexhhToHpmcVWm(3,2) 
Complex(dp) :: AmpTreehhToHpmcVWm(2,3,2),AmpWavehhToHpmcVWm(2,3,2)=(0._dp,0._dp),AmpVertexhhToHpmcVWm(2,3,2)& 
 & ,AmpVertexIRoshhToHpmcVWm(2,3,2),AmpVertexIRdrhhToHpmcVWm(2,3,2), AmpSumhhToHpmcVWm(2,3,2), AmpSum2hhToHpmcVWm(2,3,2) 
Complex(dp) :: AmpTreeZhhToHpmcVWm(2,3,2),AmpWaveZhhToHpmcVWm(2,3,2),AmpVertexZhhToHpmcVWm(2,3,2) 
Real(dp) :: AmpSqhhToHpmcVWm(3,2),  AmpSqTreehhToHpmcVWm(3,2) 
Real(dp) :: MRPhhTocSdSd(3,6,6),MRGhhTocSdSd(3,6,6), MRPZhhTocSdSd(3,6,6),MRGZhhTocSdSd(3,6,6) 
Real(dp) :: MVPhhTocSdSd(3,6,6) 
Real(dp) :: RMsqTreehhTocSdSd(3,6,6),RMsqWavehhTocSdSd(3,6,6),RMsqVertexhhTocSdSd(3,6,6) 
Complex(dp) :: AmpTreehhTocSdSd(3,6,6),AmpWavehhTocSdSd(3,6,6)=(0._dp,0._dp),AmpVertexhhTocSdSd(3,6,6)& 
 & ,AmpVertexIRoshhTocSdSd(3,6,6),AmpVertexIRdrhhTocSdSd(3,6,6), AmpSumhhTocSdSd(3,6,6), AmpSum2hhTocSdSd(3,6,6) 
Complex(dp) :: AmpTreeZhhTocSdSd(3,6,6),AmpWaveZhhTocSdSd(3,6,6),AmpVertexZhhTocSdSd(3,6,6) 
Real(dp) :: AmpSqhhTocSdSd(3,6,6),  AmpSqTreehhTocSdSd(3,6,6) 
Real(dp) :: MRPhhTocSeSe(3,6,6),MRGhhTocSeSe(3,6,6), MRPZhhTocSeSe(3,6,6),MRGZhhTocSeSe(3,6,6) 
Real(dp) :: MVPhhTocSeSe(3,6,6) 
Real(dp) :: RMsqTreehhTocSeSe(3,6,6),RMsqWavehhTocSeSe(3,6,6),RMsqVertexhhTocSeSe(3,6,6) 
Complex(dp) :: AmpTreehhTocSeSe(3,6,6),AmpWavehhTocSeSe(3,6,6)=(0._dp,0._dp),AmpVertexhhTocSeSe(3,6,6)& 
 & ,AmpVertexIRoshhTocSeSe(3,6,6),AmpVertexIRdrhhTocSeSe(3,6,6), AmpSumhhTocSeSe(3,6,6), AmpSum2hhTocSeSe(3,6,6) 
Complex(dp) :: AmpTreeZhhTocSeSe(3,6,6),AmpWaveZhhTocSeSe(3,6,6),AmpVertexZhhTocSeSe(3,6,6) 
Real(dp) :: AmpSqhhTocSeSe(3,6,6),  AmpSqTreehhTocSeSe(3,6,6) 
Real(dp) :: MRPhhTocSuSu(3,6,6),MRGhhTocSuSu(3,6,6), MRPZhhTocSuSu(3,6,6),MRGZhhTocSuSu(3,6,6) 
Real(dp) :: MVPhhTocSuSu(3,6,6) 
Real(dp) :: RMsqTreehhTocSuSu(3,6,6),RMsqWavehhTocSuSu(3,6,6),RMsqVertexhhTocSuSu(3,6,6) 
Complex(dp) :: AmpTreehhTocSuSu(3,6,6),AmpWavehhTocSuSu(3,6,6)=(0._dp,0._dp),AmpVertexhhTocSuSu(3,6,6)& 
 & ,AmpVertexIRoshhTocSuSu(3,6,6),AmpVertexIRdrhhTocSuSu(3,6,6), AmpSumhhTocSuSu(3,6,6), AmpSum2hhTocSuSu(3,6,6) 
Complex(dp) :: AmpTreeZhhTocSuSu(3,6,6),AmpWaveZhhTocSuSu(3,6,6),AmpVertexZhhTocSuSu(3,6,6) 
Real(dp) :: AmpSqhhTocSuSu(3,6,6),  AmpSqTreehhTocSuSu(3,6,6) 
Real(dp) :: MRPhhToSvImSvIm(3,9,9),MRGhhToSvImSvIm(3,9,9), MRPZhhToSvImSvIm(3,9,9),MRGZhhToSvImSvIm(3,9,9) 
Real(dp) :: MVPhhToSvImSvIm(3,9,9) 
Real(dp) :: RMsqTreehhToSvImSvIm(3,9,9),RMsqWavehhToSvImSvIm(3,9,9),RMsqVertexhhToSvImSvIm(3,9,9) 
Complex(dp) :: AmpTreehhToSvImSvIm(3,9,9),AmpWavehhToSvImSvIm(3,9,9)=(0._dp,0._dp),AmpVertexhhToSvImSvIm(3,9,9)& 
 & ,AmpVertexIRoshhToSvImSvIm(3,9,9),AmpVertexIRdrhhToSvImSvIm(3,9,9), AmpSumhhToSvImSvIm(3,9,9), AmpSum2hhToSvImSvIm(3,9,9) 
Complex(dp) :: AmpTreeZhhToSvImSvIm(3,9,9),AmpWaveZhhToSvImSvIm(3,9,9),AmpVertexZhhToSvImSvIm(3,9,9) 
Real(dp) :: AmpSqhhToSvImSvIm(3,9,9),  AmpSqTreehhToSvImSvIm(3,9,9) 
Real(dp) :: MRPhhToSvReSvIm(3,9,9),MRGhhToSvReSvIm(3,9,9), MRPZhhToSvReSvIm(3,9,9),MRGZhhToSvReSvIm(3,9,9) 
Real(dp) :: MVPhhToSvReSvIm(3,9,9) 
Real(dp) :: RMsqTreehhToSvReSvIm(3,9,9),RMsqWavehhToSvReSvIm(3,9,9),RMsqVertexhhToSvReSvIm(3,9,9) 
Complex(dp) :: AmpTreehhToSvReSvIm(3,9,9),AmpWavehhToSvReSvIm(3,9,9)=(0._dp,0._dp),AmpVertexhhToSvReSvIm(3,9,9)& 
 & ,AmpVertexIRoshhToSvReSvIm(3,9,9),AmpVertexIRdrhhToSvReSvIm(3,9,9), AmpSumhhToSvReSvIm(3,9,9), AmpSum2hhToSvReSvIm(3,9,9) 
Complex(dp) :: AmpTreeZhhToSvReSvIm(3,9,9),AmpWaveZhhToSvReSvIm(3,9,9),AmpVertexZhhToSvReSvIm(3,9,9) 
Real(dp) :: AmpSqhhToSvReSvIm(3,9,9),  AmpSqTreehhToSvReSvIm(3,9,9) 
Real(dp) :: MRPhhToSvReSvRe(3,9,9),MRGhhToSvReSvRe(3,9,9), MRPZhhToSvReSvRe(3,9,9),MRGZhhToSvReSvRe(3,9,9) 
Real(dp) :: MVPhhToSvReSvRe(3,9,9) 
Real(dp) :: RMsqTreehhToSvReSvRe(3,9,9),RMsqWavehhToSvReSvRe(3,9,9),RMsqVertexhhToSvReSvRe(3,9,9) 
Complex(dp) :: AmpTreehhToSvReSvRe(3,9,9),AmpWavehhToSvReSvRe(3,9,9)=(0._dp,0._dp),AmpVertexhhToSvReSvRe(3,9,9)& 
 & ,AmpVertexIRoshhToSvReSvRe(3,9,9),AmpVertexIRdrhhToSvReSvRe(3,9,9), AmpSumhhToSvReSvRe(3,9,9), AmpSum2hhToSvReSvRe(3,9,9) 
Complex(dp) :: AmpTreeZhhToSvReSvRe(3,9,9),AmpWaveZhhToSvReSvRe(3,9,9),AmpVertexZhhToSvReSvRe(3,9,9) 
Real(dp) :: AmpSqhhToSvReSvRe(3,9,9),  AmpSqTreehhToSvReSvRe(3,9,9) 
Real(dp) :: MRPhhTocVWmVWm(3),MRGhhTocVWmVWm(3), MRPZhhTocVWmVWm(3),MRGZhhTocVWmVWm(3) 
Real(dp) :: MVPhhTocVWmVWm(3) 
Real(dp) :: RMsqTreehhTocVWmVWm(3),RMsqWavehhTocVWmVWm(3),RMsqVertexhhTocVWmVWm(3) 
Complex(dp) :: AmpTreehhTocVWmVWm(2,3),AmpWavehhTocVWmVWm(2,3)=(0._dp,0._dp),AmpVertexhhTocVWmVWm(2,3)& 
 & ,AmpVertexIRoshhTocVWmVWm(2,3),AmpVertexIRdrhhTocVWmVWm(2,3), AmpSumhhTocVWmVWm(2,3), AmpSum2hhTocVWmVWm(2,3) 
Complex(dp) :: AmpTreeZhhTocVWmVWm(2,3),AmpWaveZhhTocVWmVWm(2,3),AmpVertexZhhTocVWmVWm(2,3) 
Real(dp) :: AmpSqhhTocVWmVWm(3),  AmpSqTreehhTocVWmVWm(3) 
Real(dp) :: MRPhhToVZVZ(3),MRGhhToVZVZ(3), MRPZhhToVZVZ(3),MRGZhhToVZVZ(3) 
Real(dp) :: MVPhhToVZVZ(3) 
Real(dp) :: RMsqTreehhToVZVZ(3),RMsqWavehhToVZVZ(3),RMsqVertexhhToVZVZ(3) 
Complex(dp) :: AmpTreehhToVZVZ(2,3),AmpWavehhToVZVZ(2,3)=(0._dp,0._dp),AmpVertexhhToVZVZ(2,3)& 
 & ,AmpVertexIRoshhToVZVZ(2,3),AmpVertexIRdrhhToVZVZ(2,3), AmpSumhhToVZVZ(2,3), AmpSum2hhToVZVZ(2,3) 
Complex(dp) :: AmpTreeZhhToVZVZ(2,3),AmpWaveZhhToVZVZ(2,3),AmpVertexZhhToVZVZ(2,3) 
Real(dp) :: AmpSqhhToVZVZ(3),  AmpSqTreehhToVZVZ(3) 
Real(dp) :: MRPhhToAhVP(3,3),MRGhhToAhVP(3,3), MRPZhhToAhVP(3,3),MRGZhhToAhVP(3,3) 
Real(dp) :: MVPhhToAhVP(3,3) 
Real(dp) :: RMsqTreehhToAhVP(3,3),RMsqWavehhToAhVP(3,3),RMsqVertexhhToAhVP(3,3) 
Complex(dp) :: AmpTreehhToAhVP(2,3,3),AmpWavehhToAhVP(2,3,3)=(0._dp,0._dp),AmpVertexhhToAhVP(2,3,3)& 
 & ,AmpVertexIRoshhToAhVP(2,3,3),AmpVertexIRdrhhToAhVP(2,3,3), AmpSumhhToAhVP(2,3,3), AmpSum2hhToAhVP(2,3,3) 
Complex(dp) :: AmpTreeZhhToAhVP(2,3,3),AmpWaveZhhToAhVP(2,3,3),AmpVertexZhhToAhVP(2,3,3) 
Real(dp) :: AmpSqhhToAhVP(3,3),  AmpSqTreehhToAhVP(3,3) 
Real(dp) :: MRPhhToGluGlu(3),MRGhhToGluGlu(3), MRPZhhToGluGlu(3),MRGZhhToGluGlu(3) 
Real(dp) :: MVPhhToGluGlu(3) 
Real(dp) :: RMsqTreehhToGluGlu(3),RMsqWavehhToGluGlu(3),RMsqVertexhhToGluGlu(3) 
Complex(dp) :: AmpTreehhToGluGlu(2,3),AmpWavehhToGluGlu(2,3)=(0._dp,0._dp),AmpVertexhhToGluGlu(2,3)& 
 & ,AmpVertexIRoshhToGluGlu(2,3),AmpVertexIRdrhhToGluGlu(2,3), AmpSumhhToGluGlu(2,3), AmpSum2hhToGluGlu(2,3) 
Complex(dp) :: AmpTreeZhhToGluGlu(2,3),AmpWaveZhhToGluGlu(2,3),AmpVertexZhhToGluGlu(2,3) 
Real(dp) :: AmpSqhhToGluGlu(3),  AmpSqTreehhToGluGlu(3) 
Real(dp) :: MRPhhTohhVP(3,3),MRGhhTohhVP(3,3), MRPZhhTohhVP(3,3),MRGZhhTohhVP(3,3) 
Real(dp) :: MVPhhTohhVP(3,3) 
Real(dp) :: RMsqTreehhTohhVP(3,3),RMsqWavehhTohhVP(3,3),RMsqVertexhhTohhVP(3,3) 
Complex(dp) :: AmpTreehhTohhVP(2,3,3),AmpWavehhTohhVP(2,3,3)=(0._dp,0._dp),AmpVertexhhTohhVP(2,3,3)& 
 & ,AmpVertexIRoshhTohhVP(2,3,3),AmpVertexIRdrhhTohhVP(2,3,3), AmpSumhhTohhVP(2,3,3), AmpSum2hhTohhVP(2,3,3) 
Complex(dp) :: AmpTreeZhhTohhVP(2,3,3),AmpWaveZhhTohhVP(2,3,3),AmpVertexZhhTohhVP(2,3,3) 
Real(dp) :: AmpSqhhTohhVP(3,3),  AmpSqTreehhTohhVP(3,3) 
Real(dp) :: MRPhhTohhVZ(3,3),MRGhhTohhVZ(3,3), MRPZhhTohhVZ(3,3),MRGZhhTohhVZ(3,3) 
Real(dp) :: MVPhhTohhVZ(3,3) 
Real(dp) :: RMsqTreehhTohhVZ(3,3),RMsqWavehhTohhVZ(3,3),RMsqVertexhhTohhVZ(3,3) 
Complex(dp) :: AmpTreehhTohhVZ(2,3,3),AmpWavehhTohhVZ(2,3,3)=(0._dp,0._dp),AmpVertexhhTohhVZ(2,3,3)& 
 & ,AmpVertexIRoshhTohhVZ(2,3,3),AmpVertexIRdrhhTohhVZ(2,3,3), AmpSumhhTohhVZ(2,3,3), AmpSum2hhTohhVZ(2,3,3) 
Complex(dp) :: AmpTreeZhhTohhVZ(2,3,3),AmpWaveZhhTohhVZ(2,3,3),AmpVertexZhhTohhVZ(2,3,3) 
Real(dp) :: AmpSqhhTohhVZ(3,3),  AmpSqTreehhTohhVZ(3,3) 
Real(dp) :: MRPhhToVGVG(3),MRGhhToVGVG(3), MRPZhhToVGVG(3),MRGZhhToVGVG(3) 
Real(dp) :: MVPhhToVGVG(3) 
Real(dp) :: RMsqTreehhToVGVG(3),RMsqWavehhToVGVG(3),RMsqVertexhhToVGVG(3) 
Complex(dp) :: AmpTreehhToVGVG(2,3),AmpWavehhToVGVG(2,3)=(0._dp,0._dp),AmpVertexhhToVGVG(2,3)& 
 & ,AmpVertexIRoshhToVGVG(2,3),AmpVertexIRdrhhToVGVG(2,3), AmpSumhhToVGVG(2,3), AmpSum2hhToVGVG(2,3) 
Complex(dp) :: AmpTreeZhhToVGVG(2,3),AmpWaveZhhToVGVG(2,3),AmpVertexZhhToVGVG(2,3) 
Real(dp) :: AmpSqhhToVGVG(3),  AmpSqTreehhToVGVG(3) 
Real(dp) :: MRPhhToVPVP(3),MRGhhToVPVP(3), MRPZhhToVPVP(3),MRGZhhToVPVP(3) 
Real(dp) :: MVPhhToVPVP(3) 
Real(dp) :: RMsqTreehhToVPVP(3),RMsqWavehhToVPVP(3),RMsqVertexhhToVPVP(3) 
Complex(dp) :: AmpTreehhToVPVP(2,3),AmpWavehhToVPVP(2,3)=(0._dp,0._dp),AmpVertexhhToVPVP(2,3)& 
 & ,AmpVertexIRoshhToVPVP(2,3),AmpVertexIRdrhhToVPVP(2,3), AmpSumhhToVPVP(2,3), AmpSum2hhToVPVP(2,3) 
Complex(dp) :: AmpTreeZhhToVPVP(2,3),AmpWaveZhhToVPVP(2,3),AmpVertexZhhToVPVP(2,3) 
Real(dp) :: AmpSqhhToVPVP(3),  AmpSqTreehhToVPVP(3) 
Real(dp) :: MRPhhToVPVZ(3),MRGhhToVPVZ(3), MRPZhhToVPVZ(3),MRGZhhToVPVZ(3) 
Real(dp) :: MVPhhToVPVZ(3) 
Real(dp) :: RMsqTreehhToVPVZ(3),RMsqWavehhToVPVZ(3),RMsqVertexhhToVPVZ(3) 
Complex(dp) :: AmpTreehhToVPVZ(2,3),AmpWavehhToVPVZ(2,3)=(0._dp,0._dp),AmpVertexhhToVPVZ(2,3)& 
 & ,AmpVertexIRoshhToVPVZ(2,3),AmpVertexIRdrhhToVPVZ(2,3), AmpSumhhToVPVZ(2,3), AmpSum2hhToVPVZ(2,3) 
Complex(dp) :: AmpTreeZhhToVPVZ(2,3),AmpWaveZhhToVPVZ(2,3),AmpVertexZhhToVPVZ(2,3) 
Real(dp) :: AmpSqhhToVPVZ(3),  AmpSqTreehhToVPVZ(3) 
Write(*,*) "Calculating one-loop decays of hh " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

ZRUZDc = Conjg(ZRUZD)
ZRUZVIc = Conjg(ZRUZVI)
ZRUZVRc = Conjg(ZRUZVR)
ZRUZUc = Conjg(ZRUZU)
ZRUZEc = Conjg(ZRUZE)
ZRUZHc = Conjg(ZRUZH)
ZRUZAc = Conjg(ZRUZA)
ZRUZPc = Conjg(ZRUZP)
ZRUZNc = Conjg(ZRUZN)
ZRUUVc = Conjg(ZRUUV)
ZRUUMc = Conjg(ZRUUM)
ZRUUPc = Conjg(ZRUUP)
ZRUZELc = Conjg(ZRUZEL)
ZRUZERc = Conjg(ZRUZER)
ZRUZDLc = Conjg(ZRUZDL)
ZRUZDRc = Conjg(ZRUZDR)
ZRUZULc = Conjg(ZRUZUL)
ZRUZURc = Conjg(ZRUZUR)

 ! Counter 
isave = 5

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Ah Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhToAhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhToAhAh)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhToAhAh(ZcplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhToAhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAhOS,MhhOS,              & 
& MRPhhToAhAh,MRGhhToAhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToAhAh(MLambda,em,gs,ZcplAhAhhh,MAhOS,MhhOS,             & 
& MRPhhToAhAh,MRGhhToAhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAh,Mhh,MRPhhToAhAh,      & 
& MRGhhToAhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToAhAh(MLambda,em,gs,ZcplAhAhhh,MAh,Mhh,MRPhhToAhAh,     & 
& MRGhhToAhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToAhAh(cplAhAhhh,ctcplAhAhhh,MAh,MAh2,               & 
& Mhh,Mhh2,ZfAh,Zfhh,AmpWavehhToAhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,             & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,       & 
& cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,       & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,              & 
& cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,       & 
& AmpVertexhhToAhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,       & 
& cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,       & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,              & 
& cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,       & 
& AmpVertexIRdrhhToAhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,ZcplAhAhhh,            & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,       & 
& cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,       & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,              & 
& cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,       & 
& AmpVertexIRoshhToAhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,ZcplAhAhhh,     & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,       & 
& cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,       & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,              & 
& cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,       & 
& AmpVertexIRoshhToAhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,             & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,       & 
& cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,       & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,              & 
& cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,       & 
& AmpVertexIRoshhToAhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,       & 
& cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,       & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,              & 
& cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,       & 
& AmpVertexIRoshhToAhAh)

 End if 
 End if 
AmpVertexhhToAhAh = AmpVertexhhToAhAh -  AmpVertexIRdrhhToAhAh! +  AmpVertexIRoshhToAhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToAhAh=0._dp 
AmpVertexZhhToAhAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToAhAh(gt2,:,:) = AmpWaveZhhToAhAh(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToAhAh(gt1,:,:) 
AmpVertexZhhToAhAh(gt2,:,:)= AmpVertexZhhToAhAh(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToAhAh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhToAhAh=AmpWaveZhhToAhAh 
AmpVertexhhToAhAh= AmpVertexZhhToAhAh
! Final State 1 
AmpWaveZhhToAhAh=0._dp 
AmpVertexZhhToAhAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToAhAh(:,gt2,:) = AmpWaveZhhToAhAh(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWavehhToAhAh(:,gt1,:) 
AmpVertexZhhToAhAh(:,gt2,:)= AmpVertexZhhToAhAh(:,gt2,:)+ZRUZA(gt2,gt1)*AmpVertexhhToAhAh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToAhAh=AmpWaveZhhToAhAh 
AmpVertexhhToAhAh= AmpVertexZhhToAhAh
! Final State 2 
AmpWaveZhhToAhAh=0._dp 
AmpVertexZhhToAhAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToAhAh(:,:,gt2) = AmpWaveZhhToAhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhToAhAh(:,:,gt1) 
AmpVertexZhhToAhAh(:,:,gt2)= AmpVertexZhhToAhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhToAhAh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToAhAh=AmpWaveZhhToAhAh 
AmpVertexhhToAhAh= AmpVertexZhhToAhAh
End if
If (ShiftIRdiv) Then 
AmpVertexhhToAhAh = AmpVertexhhToAhAh  +  AmpVertexIRoshhToAhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToAhAh = AmpTreehhToAhAh 
 AmpSum2hhToAhAh = AmpTreehhToAhAh + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh  
Else 
 AmpSumhhToAhAh = AmpTreehhToAhAh + AmpWavehhToAhAh + AmpVertexhhToAhAh
 AmpSum2hhToAhAh = AmpTreehhToAhAh + AmpWavehhToAhAh + AmpVertexhhToAhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhAh = AmpTreehhToAhAh
 AmpSum2hhToAhAh = AmpTreehhToAhAh 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=2,3
    Do gt3=gt2,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MAhOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MAh(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToAhAh = AmpTreehhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToAhAh(gt1, gt2, gt3) 
  AmpSum2hhToAhAh = 2._dp*AmpWavehhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToAhAh(gt1, gt2, gt3) 
  AmpSum2hhToAhAh = 2._dp*AmpVertexhhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToAhAh(gt1, gt2, gt3) 
  AmpSum2hhToAhAh = AmpTreehhToAhAh + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToAhAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToAhAh = AmpTreehhToAhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqTreehhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3)  
  AmpSum2hhToAhAh = + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqhhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3) + AmpSqTreehhToAhAh(gt1, gt2, gt3)  
Else  
  AmpSum2hhToAhAh = AmpTreehhToAhAh
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqTreehhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3)  
  AmpSum2hhToAhAh = + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqhhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3) + AmpSqTreehhToAhAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToAhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToAhAh(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),helfactor*AmpSqhhToAhAh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MAh(gt2),MAh(gt3),helfactor*AmpSqhhToAhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToAhAh(gt1, gt2, gt3) + MRGhhToAhAh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToAhAh(gt1, gt2, gt3) + MRGhhToAhAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTohhAh(cplAhhhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhTohhAh)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTohhAh(ZcplAhhhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhTohhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTohhAh(MLambda,em,gs,cplAhhhhh,MAhOS,MhhOS,              & 
& MRPhhTohhAh,MRGhhTohhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTohhAh(MLambda,em,gs,ZcplAhhhhh,MAhOS,MhhOS,             & 
& MRPhhTohhAh,MRGhhTohhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTohhAh(MLambda,em,gs,cplAhhhhh,MAh,Mhh,MRPhhTohhAh,      & 
& MRGhhTohhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTohhAh(MLambda,em,gs,ZcplAhhhhh,MAh,Mhh,MRPhhTohhAh,     & 
& MRGhhTohhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTohhAh(cplAhhhhh,ctcplAhhhhh,MAh,MAh2,               & 
& Mhh,Mhh2,ZfAh,Zfhh,AmpWavehhTohhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,             & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplAhAhAhhh1,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhhhhh1,        & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,AmpVertexhhTohhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplAhAhAhhh1,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhhhhh1,        & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,AmpVertexIRdrhhTohhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,             & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,ZcplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,              & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplAhAhAhhh1,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhhhhh1,        & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,AmpVertexIRoshhTohhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,ZcplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,              & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplAhAhAhhh1,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhhhhh1,        & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,AmpVertexIRoshhTohhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,             & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplAhAhAhhh1,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhhhhh1,        & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,AmpVertexIRoshhTohhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,    & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplAhAhAhhh1,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhhhhh1,        & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,AmpVertexIRoshhTohhAh)

 End if 
 End if 
AmpVertexhhTohhAh = AmpVertexhhTohhAh -  AmpVertexIRdrhhTohhAh! +  AmpVertexIRoshhTohhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTohhAh=0._dp 
AmpVertexZhhTohhAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTohhAh(gt2,:,:) = AmpWaveZhhTohhAh(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhAh(gt1,:,:) 
AmpVertexZhhTohhAh(gt2,:,:)= AmpVertexZhhTohhAh(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTohhAh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTohhAh=AmpWaveZhhTohhAh 
AmpVertexhhTohhAh= AmpVertexZhhTohhAh
! Final State 1 
AmpWaveZhhTohhAh=0._dp 
AmpVertexZhhTohhAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTohhAh(:,gt2,:) = AmpWaveZhhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhAh(:,gt1,:) 
AmpVertexZhhTohhAh(:,gt2,:)= AmpVertexZhhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexhhTohhAh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTohhAh=AmpWaveZhhTohhAh 
AmpVertexhhTohhAh= AmpVertexZhhTohhAh
! Final State 2 
AmpWaveZhhTohhAh=0._dp 
AmpVertexZhhTohhAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTohhAh(:,:,gt2) = AmpWaveZhhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhTohhAh(:,:,gt1) 
AmpVertexZhhTohhAh(:,:,gt2)= AmpVertexZhhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhTohhAh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTohhAh=AmpWaveZhhTohhAh 
AmpVertexhhTohhAh= AmpVertexZhhTohhAh
End if
If (ShiftIRdiv) Then 
AmpVertexhhTohhAh = AmpVertexhhTohhAh  +  AmpVertexIRoshhTohhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTohhAh = AmpTreehhTohhAh 
 AmpSum2hhTohhAh = AmpTreehhTohhAh + 2._dp*AmpWavehhTohhAh + 2._dp*AmpVertexhhTohhAh  
Else 
 AmpSumhhTohhAh = AmpTreehhTohhAh + AmpWavehhTohhAh + AmpVertexhhTohhAh
 AmpSum2hhTohhAh = AmpTreehhTohhAh + AmpWavehhTohhAh + AmpVertexhhTohhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhAh = AmpTreehhTohhAh
 AmpSum2hhTohhAh = AmpTreehhTohhAh 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=2,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MhhOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(Mhh(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTohhAh = AmpTreehhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTohhAh(gt1, gt2, gt3) 
  AmpSum2hhTohhAh = 2._dp*AmpWavehhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTohhAh(gt1, gt2, gt3) 
  AmpSum2hhTohhAh = 2._dp*AmpVertexhhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTohhAh(gt1, gt2, gt3) 
  AmpSum2hhTohhAh = AmpTreehhTohhAh + 2._dp*AmpWavehhTohhAh + 2._dp*AmpVertexhhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTohhAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTohhAh = AmpTreehhTohhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhAh(gt1, gt2, gt3) = AmpSqhhTohhAh(gt1, gt2, gt3)  
  AmpSum2hhTohhAh = + 2._dp*AmpWavehhTohhAh + 2._dp*AmpVertexhhTohhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
  AmpSqhhTohhAh(gt1, gt2, gt3) = AmpSqhhTohhAh(gt1, gt2, gt3) + AmpSqTreehhTohhAh(gt1, gt2, gt3)  
Else  
  AmpSum2hhTohhAh = AmpTreehhTohhAh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhAh(gt1, gt2, gt3) = AmpSqhhTohhAh(gt1, gt2, gt3)  
  AmpSum2hhTohhAh = + 2._dp*AmpWavehhTohhAh + 2._dp*AmpVertexhhTohhAh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
  AmpSqhhTohhAh(gt1, gt2, gt3) = AmpSqhhTohhAh(gt1, gt2, gt3) + AmpSqTreehhTohhAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTohhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhAh(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),helfactor*AmpSqhhTohhAh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MAh(gt3),helfactor*AmpSqhhTohhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTohhAh(gt1, gt2, gt3) + MRGhhTohhAh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTohhAh(gt1, gt2, gt3) + MRGhhTohhAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Ah VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhToAhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,              & 
& MVZ2,AmpTreehhToAhVZ)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhToAhVZ(ZcplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,             & 
& MVZ2,AmpTreehhToAhVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAhOS,MhhOS,              & 
& MVZOS,MRPhhToAhVZ,MRGhhToAhVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToAhVZ(MLambda,em,gs,ZcplAhhhVZ,MAhOS,MhhOS,             & 
& MVZOS,MRPhhToAhVZ,MRGhhToAhVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAh,Mhh,MVZ,              & 
& MRPhhToAhVZ,MRGhhToAhVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToAhVZ(MLambda,em,gs,ZcplAhhhVZ,MAh,Mhh,MVZ,             & 
& MRPhhToAhVZ,MRGhhToAhVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToAhVZ(cplAhhhVZ,ctcplAhhhVZ,MAh,MAh2,               & 
& Mhh,Mhh2,MVZ,MVZ2,ZfAh,Zfhh,ZfVZ,AmpWavehhToAhVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,             & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,          & 
& AmpVertexhhToAhVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,          & 
& AmpVertexIRdrhhToAhVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,             & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,ZcplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,              & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,          & 
& AmpVertexIRoshhToAhVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,ZcplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,              & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,          & 
& AmpVertexIRoshhToAhVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,             & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,          & 
& AmpVertexIRoshhToAhVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,          & 
& AmpVertexIRoshhToAhVZ)

 End if 
 End if 
AmpVertexhhToAhVZ = AmpVertexhhToAhVZ -  AmpVertexIRdrhhToAhVZ! +  AmpVertexIRoshhToAhVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToAhVZ=0._dp 
AmpVertexZhhToAhVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToAhVZ(:,gt2,:) = AmpWaveZhhToAhVZ(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhToAhVZ(:,gt1,:) 
AmpVertexZhhToAhVZ(:,gt2,:)= AmpVertexZhhToAhVZ(:,gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhToAhVZ(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToAhVZ=AmpWaveZhhToAhVZ 
AmpVertexhhToAhVZ= AmpVertexZhhToAhVZ
! Final State 1 
AmpWaveZhhToAhVZ=0._dp 
AmpVertexZhhToAhVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToAhVZ(:,:,gt2) = AmpWaveZhhToAhVZ(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhToAhVZ(:,:,gt1) 
AmpVertexZhhToAhVZ(:,:,gt2)= AmpVertexZhhToAhVZ(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhToAhVZ(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToAhVZ=AmpWaveZhhToAhVZ 
AmpVertexhhToAhVZ= AmpVertexZhhToAhVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToAhVZ = AmpVertexhhToAhVZ  +  AmpVertexIRoshhToAhVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToAhVZ = AmpTreehhToAhVZ 
 AmpSum2hhToAhVZ = AmpTreehhToAhVZ + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ  
Else 
 AmpSumhhToAhVZ = AmpTreehhToAhVZ + AmpWavehhToAhVZ + AmpVertexhhToAhVZ
 AmpSum2hhToAhVZ = AmpTreehhToAhVZ + AmpWavehhToAhVZ + AmpVertexhhToAhVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhVZ = AmpTreehhToAhVZ
 AmpSum2hhToAhVZ = AmpTreehhToAhVZ 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=2,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MAhOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MAh(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToAhVZ(gt1, gt2) 
  AmpSum2hhToAhVZ = 2._dp*AmpWavehhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToAhVZ(gt1, gt2) 
  AmpSum2hhToAhVZ = 2._dp*AmpVertexhhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToAhVZ(gt1, gt2) 
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToAhVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqTreehhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2)  
  AmpSum2hhToAhVZ = + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqhhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2) + AmpSqTreehhToAhVZ(gt1, gt2)  
Else  
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqTreehhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2)  
  AmpSum2hhToAhVZ = + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqhhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2) + AmpSqTreehhToAhVZ(gt1, gt2)  
End if  
Else  
  AmpSqhhToAhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToAhVZ(gt1, gt2).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),MVZOS,helfactor*AmpSqhhToAhVZ(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MAh(gt2),MVZ,helfactor*AmpSqhhToAhVZ(gt1, gt2))
End if 
If ((Abs(MRPhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToAhVZ(gt1, gt2) + MRGhhToAhVZ(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToAhVZ(gt1, gt2) + MRGhhToAhVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Cha) Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTocChaCha(cplcChaChahhL,cplcChaChahhR,               & 
& MCha,Mhh,MCha2,Mhh2,AmpTreehhTocChaCha)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTocChaCha(ZcplcChaChahhL,ZcplcChaChahhR,             & 
& MCha,Mhh,MCha2,Mhh2,AmpTreehhTocChaCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocChaCha(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,     & 
& MChaOS,MhhOS,MRPhhTocChaCha,MRGhhTocChaCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocChaCha(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,   & 
& MChaOS,MhhOS,MRPhhTocChaCha,MRGhhTocChaCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTocChaCha(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,     & 
& MCha,Mhh,MRPhhTocChaCha,MRGhhTocChaCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocChaCha(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,   & 
& MCha,Mhh,MRPhhTocChaCha,MRGhhTocChaCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTocChaCha(cplcChaChahhL,cplcChaChahhR,               & 
& ctcplcChaChahhL,ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,AmpWavehhTocChaCha)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexhhTocChaCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexIRdrhhTocChaCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,    & 
& cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,        & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,ZcplcChaChahhL,     & 
& ZcplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,   & 
& cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,         & 
& AmpVertexIRoshhTocChaCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& ZcplcChaChahhL,ZcplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexIRoshhTocChaCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,    & 
& cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,        & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,   & 
& cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,         & 
& AmpVertexIRoshhTocChaCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexIRoshhTocChaCha)

 End if 
 End if 
AmpVertexhhTocChaCha = AmpVertexhhTocChaCha -  AmpVertexIRdrhhTocChaCha! +  AmpVertexIRoshhTocChaCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocChaCha=0._dp 
AmpVertexZhhTocChaCha=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocChaCha(:,gt2,:,:) = AmpWaveZhhTocChaCha(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocChaCha(:,gt1,:,:) 
AmpVertexZhhTocChaCha(:,gt2,:,:)= AmpVertexZhhTocChaCha(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocChaCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocChaCha=AmpWaveZhhTocChaCha 
AmpVertexhhTocChaCha= AmpVertexZhhTocChaCha
! Final State 1 
AmpWaveZhhTocChaCha=0._dp 
AmpVertexZhhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocChaCha(1,:,gt2,:) = AmpWaveZhhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpWavehhTocChaCha(1,:,gt1,:) 
AmpVertexZhhTocChaCha(1,:,gt2,:)= AmpVertexZhhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpVertexhhTocChaCha(1,:,gt1,:) 
AmpWaveZhhTocChaCha(2,:,gt2,:) = AmpWaveZhhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpWavehhTocChaCha(2,:,gt1,:) 
AmpVertexZhhTocChaCha(2,:,gt2,:)= AmpVertexZhhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpVertexhhTocChaCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocChaCha=AmpWaveZhhTocChaCha 
AmpVertexhhTocChaCha= AmpVertexZhhTocChaCha
! Final State 2 
AmpWaveZhhTocChaCha=0._dp 
AmpVertexZhhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocChaCha(1,:,:,gt2) = AmpWaveZhhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWavehhTocChaCha(1,:,:,gt1) 
AmpVertexZhhTocChaCha(1,:,:,gt2)= AmpVertexZhhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexhhTocChaCha(1,:,:,gt1) 
AmpWaveZhhTocChaCha(2,:,:,gt2) = AmpWaveZhhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWavehhTocChaCha(2,:,:,gt1) 
AmpVertexZhhTocChaCha(2,:,:,gt2)= AmpVertexZhhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexhhTocChaCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocChaCha=AmpWaveZhhTocChaCha 
AmpVertexhhTocChaCha= AmpVertexZhhTocChaCha
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocChaCha = AmpVertexhhTocChaCha  +  AmpVertexIRoshhTocChaCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Cha] Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocChaCha = AmpTreehhTocChaCha 
 AmpSum2hhTocChaCha = AmpTreehhTocChaCha + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha  
Else 
 AmpSumhhTocChaCha = AmpTreehhTocChaCha + AmpWavehhTocChaCha + AmpVertexhhTocChaCha
 AmpSum2hhTocChaCha = AmpTreehhTocChaCha + AmpWavehhTocChaCha + AmpVertexhhTocChaCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocChaCha = AmpTreehhTocChaCha
 AmpSum2hhTocChaCha = AmpTreehhTocChaCha 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,2
    Do gt3=1,2
If (((OSkinematics).and.(MhhOS(gt1).gt.(MChaOS(gt2)+MChaOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MCha(gt2)+MCha(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
  AmpSum2hhTocChaCha = 2._dp*AmpWavehhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
  AmpSum2hhTocChaCha = 2._dp*AmpVertexhhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreehhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3)  
  AmpSum2hhTocChaCha = + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqhhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3) + AmpSqTreehhTocChaCha(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreehhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3)  
  AmpSum2hhTocChaCha = + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqhhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3) + AmpSqTreehhTocChaCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocChaCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocChaCha(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),helfactor*AmpSqhhTocChaCha(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MCha(gt2),MCha(gt3),helfactor*AmpSqhhTocChaCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocChaCha(gt1, gt2, gt3) + MRGhhTocChaCha(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocChaCha(gt1, gt2, gt3) + MRGhhTocChaCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhToChiChi(cplChiChihhL,cplChiChihhR,MChi,             & 
& Mhh,MChi2,Mhh2,AmpTreehhToChiChi)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhToChiChi(ZcplChiChihhL,ZcplChiChihhR,MChi,           & 
& Mhh,MChi2,Mhh2,AmpTreehhToChiChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhToChiChi(MLambda,em,gs,cplChiChihhL,cplChiChihhR,        & 
& MChiOS,MhhOS,MRPhhToChiChi,MRGhhToChiChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToChiChi(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,      & 
& MChiOS,MhhOS,MRPhhToChiChi,MRGhhToChiChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhToChiChi(MLambda,em,gs,cplChiChihhL,cplChiChihhR,        & 
& MChi,Mhh,MRPhhToChiChi,MRGhhToChiChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToChiChi(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,      & 
& MChi,Mhh,MRPhhToChiChi,MRGhhToChiChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToChiChi(cplChiChihhL,cplChiChihhR,ctcplChiChihhL,   & 
& ctcplChiChihhR,MChi,MChi2,Mhh,Mhh2,Zfhh,ZfL0,AmpWavehhToChiChi)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,             & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplChiChiAhL,        & 
& cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,         & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexhhToChiChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplChiChiAhL,   & 
& cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,         & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRdrhhToChiChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplChiChiAhL,          & 
& cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,         & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,ZcplChiChihhL,ZcplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRoshhToChiChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplChiChiAhL,   & 
& cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,         & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,ZcplChiChihhL,ZcplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRoshhToChiChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplChiChiAhL,          & 
& cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,         & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRoshhToChiChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplChiChiAhL,   & 
& cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,         & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRoshhToChiChi)

 End if 
 End if 
AmpVertexhhToChiChi = AmpVertexhhToChiChi -  AmpVertexIRdrhhToChiChi! +  AmpVertexIRoshhToChiChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToChiChi=0._dp 
AmpVertexZhhToChiChi=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToChiChi(:,gt2,:,:) = AmpWaveZhhToChiChi(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToChiChi(:,gt1,:,:) 
AmpVertexZhhToChiChi(:,gt2,:,:)= AmpVertexZhhToChiChi(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToChiChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhToChiChi=AmpWaveZhhToChiChi 
AmpVertexhhToChiChi= AmpVertexZhhToChiChi
! Final State 1 
AmpWaveZhhToChiChi=0._dp 
AmpVertexZhhToChiChi=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZhhToChiChi(1,:,gt2,:) = AmpWaveZhhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWavehhToChiChi(1,:,gt1,:) 
AmpVertexZhhToChiChi(1,:,gt2,:)= AmpVertexZhhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexhhToChiChi(1,:,gt1,:) 
AmpWaveZhhToChiChi(2,:,gt2,:) = AmpWaveZhhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWavehhToChiChi(2,:,gt1,:) 
AmpVertexZhhToChiChi(2,:,gt2,:)= AmpVertexZhhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexhhToChiChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhToChiChi=AmpWaveZhhToChiChi 
AmpVertexhhToChiChi= AmpVertexZhhToChiChi
! Final State 2 
AmpWaveZhhToChiChi=0._dp 
AmpVertexZhhToChiChi=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZhhToChiChi(1,:,:,gt2) = AmpWaveZhhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWavehhToChiChi(1,:,:,gt1) 
AmpVertexZhhToChiChi(1,:,:,gt2)= AmpVertexZhhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexhhToChiChi(1,:,:,gt1) 
AmpWaveZhhToChiChi(2,:,:,gt2) = AmpWaveZhhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWavehhToChiChi(2,:,:,gt1) 
AmpVertexZhhToChiChi(2,:,:,gt2)= AmpVertexZhhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexhhToChiChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhToChiChi=AmpWaveZhhToChiChi 
AmpVertexhhToChiChi= AmpVertexZhhToChiChi
End if
If (ShiftIRdiv) Then 
AmpVertexhhToChiChi = AmpVertexhhToChiChi  +  AmpVertexIRoshhToChiChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Chi Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToChiChi = AmpTreehhToChiChi 
 AmpSum2hhToChiChi = AmpTreehhToChiChi + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi  
Else 
 AmpSumhhToChiChi = AmpTreehhToChiChi + AmpWavehhToChiChi + AmpVertexhhToChiChi
 AmpSum2hhToChiChi = AmpTreehhToChiChi + AmpWavehhToChiChi + AmpVertexhhToChiChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToChiChi = AmpTreehhToChiChi
 AmpSum2hhToChiChi = AmpTreehhToChiChi 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,5
    Do gt3=gt2,5
If (((OSkinematics).and.(MhhOS(gt1).gt.(MChiOS(gt2)+MChiOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MChi(gt2)+MChi(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToChiChi = AmpTreehhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToChiChi(gt1, gt2, gt3) 
  AmpSum2hhToChiChi = 2._dp*AmpWavehhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToChiChi(gt1, gt2, gt3) 
  AmpSum2hhToChiChi = 2._dp*AmpVertexhhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToChiChi(gt1, gt2, gt3) 
  AmpSum2hhToChiChi = AmpTreehhToChiChi + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToChiChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToChiChi = AmpTreehhToChiChi
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreehhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3)  
  AmpSum2hhToChiChi = + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqhhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3) + AmpSqTreehhToChiChi(gt1, gt2, gt3)  
Else  
  AmpSum2hhToChiChi = AmpTreehhToChiChi
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreehhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3)  
  AmpSum2hhToChiChi = + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqhhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3) + AmpSqTreehhToChiChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToChiChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToChiChi(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),helfactor*AmpSqhhToChiChi(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MChi(gt2),MChi(gt3),helfactor*AmpSqhhToChiChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToChiChi(gt1, gt2, gt3) + MRGhhToChiChi(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToChiChi(gt1, gt2, gt3) + MRGhhToChiChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fd) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,MFd,Mhh,             & 
& MFd2,Mhh2,AmpTreehhTocFdFd)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTocFdFd(ZcplcFdFdhhL,ZcplcFdFdhhR,MFd,               & 
& Mhh,MFd2,Mhh2,AmpTreehhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,           & 
& MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,         & 
& MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,           & 
& MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,         & 
& MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,       & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfFDL,ZfFDR,Zfhh,AmpWavehhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,            & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,        & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,            & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& cplhhVZVZ,AmpVertexhhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,      & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,        & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,            & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& cplhhVZVZ,AmpVertexIRdrhhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,            & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,ZcplcFdFdhhL,         & 
& ZcplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,      & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,            & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,        & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,            & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& cplhhVZVZ,AmpVertexIRoshhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,            & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,      & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,        & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,            & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& cplhhVZVZ,AmpVertexIRoshhTocFdFd)

 End if 
 End if 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd -  AmpVertexIRdrhhTocFdFd! +  AmpVertexIRoshhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(:,gt2,:,:) = AmpWaveZhhTocFdFd(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFdFd(:,gt1,:,:) 
AmpVertexZhhTocFdFd(:,gt2,:,:)= AmpVertexZhhTocFdFd(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFdFd(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 1 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,:,gt2,:) = AmpWaveZhhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpWavehhTocFdFd(1,:,gt1,:) 
AmpVertexZhhTocFdFd(1,:,gt2,:)= AmpVertexZhhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpVertexhhTocFdFd(1,:,gt1,:) 
AmpWaveZhhTocFdFd(2,:,gt2,:) = AmpWaveZhhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpWavehhTocFdFd(2,:,gt1,:) 
AmpVertexZhhTocFdFd(2,:,gt2,:)= AmpVertexZhhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpVertexhhTocFdFd(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 2 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,:,:,gt2) = AmpWaveZhhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpWavehhTocFdFd(1,:,:,gt1) 
AmpVertexZhhTocFdFd(1,:,:,gt2)= AmpVertexZhhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpVertexhhTocFdFd(1,:,:,gt1) 
AmpWaveZhhTocFdFd(2,:,:,gt2) = AmpWaveZhhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpWavehhTocFdFd(2,:,:,gt1) 
AmpVertexZhhTocFdFd(2,:,:,gt2)= AmpVertexZhhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpVertexhhTocFdFd(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd  +  AmpVertexIRoshhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd 
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd  
Else 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MFdOS(gt2)+MFdOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MFd(gt2)+MFd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpWavehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFdFd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFdFd(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFd(gt2),MFd(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fe) Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,             & 
& MFe2,Mhh2,AmpTreehhTocFeFe)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTocFeFe(ZcplcFeFehhL,ZcplcFeFehhR,MFe,               & 
& Mhh,MFe2,Mhh2,AmpTreehhTocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,           & 
& MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,         & 
& MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,           & 
& MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,         & 
& MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,       & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfFEL,ZfFER,Zfhh,AmpWavehhTocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,               & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,             & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,       & 
& cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,    & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,AmpVertexhhTocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,        & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,       & 
& cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,    & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,AmpVertexIRdrhhTocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,            & 
& cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,ZcplcFeFehhL,ZcplcFeFehhR,         & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,   & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,         & 
& AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,        & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,       & 
& cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,ZcplcFeFehhL,         & 
& ZcplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,              & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,    & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,AmpVertexIRoshhTocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,            & 
& cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,   & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,         & 
& AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,        & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,       & 
& cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,    & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,AmpVertexIRoshhTocFeFe)

 End if 
 End if 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe -  AmpVertexIRdrhhTocFeFe! +  AmpVertexIRoshhTocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(:,gt2,:,:) = AmpWaveZhhTocFeFe(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFeFe(:,gt1,:,:) 
AmpVertexZhhTocFeFe(:,gt2,:,:)= AmpVertexZhhTocFeFe(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFeFe(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 1 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,:,gt2,:) = AmpWaveZhhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpWavehhTocFeFe(1,:,gt1,:) 
AmpVertexZhhTocFeFe(1,:,gt2,:)= AmpVertexZhhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpVertexhhTocFeFe(1,:,gt1,:) 
AmpWaveZhhTocFeFe(2,:,gt2,:) = AmpWaveZhhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpWavehhTocFeFe(2,:,gt1,:) 
AmpVertexZhhTocFeFe(2,:,gt2,:)= AmpVertexZhhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpVertexhhTocFeFe(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 2 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,:,:,gt2) = AmpWaveZhhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpWavehhTocFeFe(1,:,:,gt1) 
AmpVertexZhhTocFeFe(1,:,:,gt2)= AmpVertexZhhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpVertexhhTocFeFe(1,:,:,gt1) 
AmpWaveZhhTocFeFe(2,:,:,gt2) = AmpWaveZhhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpWavehhTocFeFe(2,:,:,gt1) 
AmpVertexZhhTocFeFe(2,:,:,gt2)= AmpVertexZhhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpVertexhhTocFeFe(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe  +  AmpVertexIRoshhTocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe 
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe  
Else 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MFeOS(gt2)+MFeOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MFe(gt2)+MFe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpWavehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFeFe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFeFe(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MFe(gt2),MFe(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Fu
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,MFu,Mhh,             & 
& MFu2,Mhh2,AmpTreehhTocFuFu)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTocFuFu(ZcplcFuFuhhL,ZcplcFuFuhhR,MFu,               & 
& Mhh,MFu2,Mhh2,AmpTreehhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,           & 
& MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,         & 
& MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,           & 
& MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,         & 
& MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,ctcplcFuFuhhL,       & 
& ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,ZfFUL,ZfFUR,Zfhh,AmpWavehhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,            & 
& cplAhhhVZ,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,      & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,               & 
& cplcChacFuSdR,AmpVertexhhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,      & 
& cplAhhhVZ,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,      & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,               & 
& cplcChacFuSdR,AmpVertexIRdrhhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplChaFucSdL,             & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,          & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,ZcplcFuFuhhL,      & 
& ZcplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,      & 
& cplAhhhVZ,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,      & 
& cplGluFucSuR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,          & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,               & 
& cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplChaFucSdL,             & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,          & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,      & 
& cplAhhhVZ,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,          & 
& cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,      & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,               & 
& cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

 End if 
 End if 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu -  AmpVertexIRdrhhTocFuFu! +  AmpVertexIRoshhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(:,gt2,:,:) = AmpWaveZhhTocFuFu(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFuFu(:,gt1,:,:) 
AmpVertexZhhTocFuFu(:,gt2,:,:)= AmpVertexZhhTocFuFu(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFuFu(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 1 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,:,gt2,:) = AmpWaveZhhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWavehhTocFuFu(1,:,gt1,:) 
AmpVertexZhhTocFuFu(1,:,gt2,:)= AmpVertexZhhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexhhTocFuFu(1,:,gt1,:) 
AmpWaveZhhTocFuFu(2,:,gt2,:) = AmpWaveZhhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWavehhTocFuFu(2,:,gt1,:) 
AmpVertexZhhTocFuFu(2,:,gt2,:)= AmpVertexZhhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexhhTocFuFu(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 2 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,:,:,gt2) = AmpWaveZhhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpWavehhTocFuFu(1,:,:,gt1) 
AmpVertexZhhTocFuFu(1,:,:,gt2)= AmpVertexZhhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpVertexhhTocFuFu(1,:,:,gt1) 
AmpWaveZhhTocFuFu(2,:,:,gt2) = AmpWaveZhhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpWavehhTocFuFu(2,:,:,gt1) 
AmpVertexZhhTocFuFu(2,:,:,gt2)= AmpVertexZhhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpVertexhhTocFuFu(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu  +  AmpVertexIRoshhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu 
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu  
Else 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MFuOS(gt2)+MFuOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MFu(gt2)+MFu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpWavehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFuFu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFuFu(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFu(gt2),MFu(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Fv
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhToFvFv(cplFvFvhhL,cplFvFvhhR,MFv,Mhh,MFv2,           & 
& Mhh2,AmpTreehhToFvFv)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhToFvFv(ZcplFvFvhhL,ZcplFvFvhhR,MFv,Mhh,              & 
& MFv2,Mhh2,AmpTreehhToFvFv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhToFvFv(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,              & 
& MFvOS,MhhOS,MRPhhToFvFv,MRGhhToFvFv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToFvFv(MLambda,em,gs,ZcplFvFvhhL,ZcplFvFvhhR,            & 
& MFvOS,MhhOS,MRPhhToFvFv,MRGhhToFvFv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhToFvFv(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,              & 
& MFv,Mhh,MRPhhToFvFv,MRGhhToFvFv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToFvFv(MLambda,em,gs,ZcplFvFvhhL,ZcplFvFvhhR,            & 
& MFv,Mhh,MRPhhToFvFv,MRGhhToFvFv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToFvFv(cplFvFvhhL,cplFvFvhhR,ctcplFvFvhhL,           & 
& ctcplFvFvhhR,MFv,MFv2,Mhh,Mhh2,ZfFV,Zfhh,AmpWavehhToFvFv)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSvIm2,            & 
& MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplFvChacSeL,    & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,      & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexhhToFvFv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,          & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,         & 
& AmpVertexIRdrhhToFvFv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToFvFv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,        & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,     & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,ZcplFvFvhhL,ZcplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,   & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRoshhToFvFv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,          & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,ZcplFvFvhhL,ZcplFvFvhhR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,         & 
& AmpVertexIRoshhToFvFv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToFvFv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,        & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,     & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,     & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRoshhToFvFv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,          & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,         & 
& AmpVertexIRoshhToFvFv)

 End if 
 End if 
AmpVertexhhToFvFv = AmpVertexhhToFvFv -  AmpVertexIRdrhhToFvFv! +  AmpVertexIRoshhToFvFv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToFvFv=0._dp 
AmpVertexZhhToFvFv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToFvFv(:,gt2,:,:) = AmpWaveZhhToFvFv(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToFvFv(:,gt1,:,:) 
AmpVertexZhhToFvFv(:,gt2,:,:)= AmpVertexZhhToFvFv(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToFvFv(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhToFvFv=AmpWaveZhhToFvFv 
AmpVertexhhToFvFv= AmpVertexZhhToFvFv
! Final State 1 
AmpWaveZhhToFvFv=0._dp 
AmpVertexZhhToFvFv=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToFvFv(1,:,gt2,:) = AmpWaveZhhToFvFv(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWavehhToFvFv(1,:,gt1,:) 
AmpVertexZhhToFvFv(1,:,gt2,:)= AmpVertexZhhToFvFv(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexhhToFvFv(1,:,gt1,:) 
AmpWaveZhhToFvFv(2,:,gt2,:) = AmpWaveZhhToFvFv(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWavehhToFvFv(2,:,gt1,:) 
AmpVertexZhhToFvFv(2,:,gt2,:)= AmpVertexZhhToFvFv(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexhhToFvFv(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhToFvFv=AmpWaveZhhToFvFv 
AmpVertexhhToFvFv= AmpVertexZhhToFvFv
! Final State 2 
AmpWaveZhhToFvFv=0._dp 
AmpVertexZhhToFvFv=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToFvFv(1,:,:,gt2) = AmpWaveZhhToFvFv(1,:,:,gt2)+ZRUUV(gt2,gt1)*AmpWavehhToFvFv(1,:,:,gt1) 
AmpVertexZhhToFvFv(1,:,:,gt2)= AmpVertexZhhToFvFv(1,:,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexhhToFvFv(1,:,:,gt1) 
AmpWaveZhhToFvFv(2,:,:,gt2) = AmpWaveZhhToFvFv(2,:,:,gt2)+ZRUUV(gt2,gt1)*AmpWavehhToFvFv(2,:,:,gt1) 
AmpVertexZhhToFvFv(2,:,:,gt2)= AmpVertexZhhToFvFv(2,:,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexhhToFvFv(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhToFvFv=AmpWaveZhhToFvFv 
AmpVertexhhToFvFv= AmpVertexZhhToFvFv
End if
If (ShiftIRdiv) Then 
AmpVertexhhToFvFv = AmpVertexhhToFvFv  +  AmpVertexIRoshhToFvFv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Fv Fv -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToFvFv = AmpTreehhToFvFv 
 AmpSum2hhToFvFv = AmpTreehhToFvFv + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv  
Else 
 AmpSumhhToFvFv = AmpTreehhToFvFv + AmpWavehhToFvFv + AmpVertexhhToFvFv
 AmpSum2hhToFvFv = AmpTreehhToFvFv + AmpWavehhToFvFv + AmpVertexhhToFvFv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToFvFv = AmpTreehhToFvFv
 AmpSum2hhToFvFv = AmpTreehhToFvFv 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,9
    Do gt3=gt2,9
If (((OSkinematics).and.(MhhOS(gt1).gt.(MFvOS(gt2)+MFvOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MFv(gt2)+MFv(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToFvFv = AmpTreehhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToFvFv(gt1, gt2, gt3) 
  AmpSum2hhToFvFv = 2._dp*AmpWavehhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToFvFv(gt1, gt2, gt3) 
  AmpSum2hhToFvFv = 2._dp*AmpVertexhhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToFvFv(gt1, gt2, gt3) 
  AmpSum2hhToFvFv = AmpTreehhToFvFv + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToFvFv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToFvFv = AmpTreehhToFvFv
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqTreehhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3)  
  AmpSum2hhToFvFv = + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqhhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3) + AmpSqTreehhToFvFv(gt1, gt2, gt3)  
Else  
  AmpSum2hhToFvFv = AmpTreehhToFvFv
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqTreehhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3)  
  AmpSum2hhToFvFv = + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqhhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3) + AmpSqTreehhToFvFv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToFvFv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToFvFv(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),helfactor*AmpSqhhToFvFv(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MFv(gt2),MFv(gt3),helfactor*AmpSqhhToFvFv(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToFvFv(gt1, gt2, gt3) + MRGhhToFvFv(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToFvFv(gt1, gt2, gt3) + MRGhhToFvFv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTohhhh(cplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTohhhh(Zcplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTohhhh(MLambda,em,gs,cplhhhhhh,MhhOS,MRPhhTohhhh,        & 
& MRGhhTohhhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,MhhOS,MRPhhTohhhh,       & 
& MRGhhTohhhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,MRPhhTohhhh,          & 
& MRGhhTohhhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,Mhh,MRPhhTohhhh,         & 
& MRGhhTohhhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,Mhh2,               & 
& Zfhh,AmpWavehhTohhhh)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,             & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,cplhhhhhhhh1,            & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,AmpVertexhhTohhhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,      & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,cplhhhhhhhh1,            & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,AmpVertexIRdrhhTohhhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,             & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,Zcplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,cplhhhhhhhh1,            & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,      & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,Zcplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,cplhhhhhhhh1,            & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,             & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,cplhhhhhhhh1,            & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,      & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,cplhhhhhhhh1,            & 
& cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvImSvIm1,          & 
& cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

 End if 
 End if 
AmpVertexhhTohhhh = AmpVertexhhTohhhh -  AmpVertexIRdrhhTohhhh! +  AmpVertexIRoshhTohhhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTohhhh(gt2,:,:) = AmpWaveZhhTohhhh(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(gt1,:,:) 
AmpVertexZhhTohhhh(gt2,:,:)= AmpVertexZhhTohhhh(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 1 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTohhhh(:,gt2,:) = AmpWaveZhhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(:,gt1,:) 
AmpVertexZhhTohhhh(:,gt2,:)= AmpVertexZhhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 2 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTohhhh(:,:,gt2) = AmpWaveZhhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(:,:,gt1) 
AmpVertexZhhTohhhh(:,:,gt2)= AmpVertexZhhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
End if
If (ShiftIRdiv) Then 
AmpVertexhhTohhhh = AmpVertexhhTohhhh  +  AmpVertexIRoshhTohhhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh 
 AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh  
Else 
 AmpSumhhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=gt2,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MhhOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(Mhh(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpWavehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTohhhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
Else  
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTohhhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhTohhhh(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),Mhh(gt2),Mhh(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Hpm) Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTocHpmHpm(cplhhHpmcHpm,Mhh,MHpm,Mhh2,MHpm2,          & 
& AmpTreehhTocHpmHpm)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTocHpmHpm(ZcplhhHpmcHpm,Mhh,MHpm,Mhh2,               & 
& MHpm2,AmpTreehhTocHpmHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocHpmHpm(MLambda,em,gs,cplhhHpmcHpm,MhhOS,              & 
& MHpmOS,MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocHpmHpm(MLambda,em,gs,ZcplhhHpmcHpm,MhhOS,             & 
& MHpmOS,MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTocHpmHpm(MLambda,em,gs,cplhhHpmcHpm,Mhh,MHpm,           & 
& MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocHpmHpm(MLambda,em,gs,ZcplhhHpmcHpm,Mhh,               & 
& MHpm,MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTocHpmHpm(cplhhHpmcHpm,ctcplhhHpmcHpm,               & 
& Mhh,Mhh2,MHpm,MHpm2,Zfhh,ZfHpm,AmpWavehhTocHpmHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,             & 
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
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexhhTocHpmHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,             & 
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
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRdrhhTocHpmHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,        & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,        & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,cplcgZgWmcHpm,            & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhhhhh,         & 
& ZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,    & 
& cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,     & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,    & 
& cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1, & 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRoshhTocHpmHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,             & 
& cplcgZgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhhhhh,ZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,   & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,    & 
& cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,     & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,    & 
& cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1, & 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRoshhTocHpmHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,        & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,        & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,cplcgZgWmcHpm,            & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhhhhh,         & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,    & 
& cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,     & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,    & 
& cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1, & 
& cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,         & 
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRoshhTocHpmHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,             & 
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
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRoshhTocHpmHpm)

 End if 
 End if 
AmpVertexhhTocHpmHpm = AmpVertexhhTocHpmHpm -  AmpVertexIRdrhhTocHpmHpm! +  AmpVertexIRoshhTocHpmHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocHpmHpm=0._dp 
AmpVertexZhhTocHpmHpm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocHpmHpm(gt2,:,:) = AmpWaveZhhTocHpmHpm(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocHpmHpm(gt1,:,:) 
AmpVertexZhhTocHpmHpm(gt2,:,:)= AmpVertexZhhTocHpmHpm(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocHpmHpm(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocHpmHpm=AmpWaveZhhTocHpmHpm 
AmpVertexhhTocHpmHpm= AmpVertexZhhTocHpmHpm
! Final State 1 
AmpWaveZhhTocHpmHpm=0._dp 
AmpVertexZhhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocHpmHpm(:,gt2,:) = AmpWaveZhhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWavehhTocHpmHpm(:,gt1,:) 
AmpVertexZhhTocHpmHpm(:,gt2,:)= AmpVertexZhhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexhhTocHpmHpm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocHpmHpm=AmpWaveZhhTocHpmHpm 
AmpVertexhhTocHpmHpm= AmpVertexZhhTocHpmHpm
! Final State 2 
AmpWaveZhhTocHpmHpm=0._dp 
AmpVertexZhhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocHpmHpm(:,:,gt2) = AmpWaveZhhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWavehhTocHpmHpm(:,:,gt1) 
AmpVertexZhhTocHpmHpm(:,:,gt2)= AmpVertexZhhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexhhTocHpmHpm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocHpmHpm=AmpWaveZhhTocHpmHpm 
AmpVertexhhTocHpmHpm= AmpVertexZhhTocHpmHpm
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocHpmHpm = AmpVertexhhTocHpmHpm  +  AmpVertexIRoshhTocHpmHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Hpm] Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocHpmHpm = AmpTreehhTocHpmHpm 
 AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm  
Else 
 AmpSumhhTocHpmHpm = AmpTreehhTocHpmHpm + AmpWavehhTocHpmHpm + AmpVertexhhTocHpmHpm
 AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm + AmpWavehhTocHpmHpm + AmpVertexhhTocHpmHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocHpmHpm = AmpTreehhTocHpmHpm
 AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=2,2
    Do gt3=2,2
If (((OSkinematics).and.(MhhOS(gt1).gt.(MHpmOS(gt2)+MHpmOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MHpm(gt2)+MHpm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2hhTocHpmHpm = 2._dp*AmpWavehhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2hhTocHpmHpm = 2._dp*AmpVertexhhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreehhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2hhTocHpmHpm = + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqhhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreehhTocHpmHpm(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreehhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2hhTocHpmHpm = + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqhhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreehhTocHpmHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocHpmHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocHpmHpm(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),helfactor*AmpSqhhTocHpmHpm(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MHpm(gt2),MHpm(gt3),helfactor*AmpSqhhTocHpmHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocHpmHpm(gt1, gt2, gt3) + MRGhhTocHpmHpm(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocHpmHpm(gt1, gt2, gt3) + MRGhhTocHpmHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Hpm Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhToHpmcVWm(cplhhHpmcVWm,Mhh,MHpm,MVWm,Mhh2,           & 
& MHpm2,MVWm2,AmpTreehhToHpmcVWm)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhToHpmcVWm(ZcplhhHpmcVWm,Mhh,MHpm,MVWm,               & 
& Mhh2,MHpm2,MVWm2,AmpTreehhToHpmcVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhToHpmcVWm(MLambda,em,gs,cplhhHpmcVWm,MhhOS,              & 
& MHpmOS,MVWmOS,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToHpmcVWm(MLambda,em,gs,ZcplhhHpmcVWm,MhhOS,             & 
& MHpmOS,MVWmOS,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhToHpmcVWm(MLambda,em,gs,cplhhHpmcVWm,Mhh,MHpm,           & 
& MVWm,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToHpmcVWm(MLambda,em,gs,ZcplhhHpmcVWm,Mhh,               & 
& MHpm,MVWm,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToHpmcVWm(cplhhHpmcVWm,ctcplhhHpmcVWm,               & 
& Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,Zfhh,ZfHpm,ZfVWm,AmpWavehhToHpmcVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,           & 
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
& cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexhhToHpmcVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,           & 
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
& cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRdrhhToHpmcVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,        & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,       & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,cplcgWmgAHpm,cplcgWmgWmhh,             & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,      & 
& cplcgWpCgZcVWm,cplhhhhhh,GosZcplhhHpmcHpm,ZcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,         & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,GosZcplHpmcVWmVP,       & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,       & 
& cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,          & 
& cplHpmcHpmcVWmVWm1,AmpVertexIRoshhToHpmcVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,           & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,cplcgWmgAHpm,               & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,      & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhhhhh,GZcplhhHpmcHpm,ZcplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,           & 
& GZcplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,     & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,             & 
& cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRoshhToHpmcVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,        & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,       & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgAhh,cplcgWmgAHpm,cplcgWmgWmhh,             & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,      & 
& cplcgWpCgZcVWm,cplhhhhhh,GcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,GcplHpmcVWmVP,          & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,       & 
& cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,          & 
& cplHpmcHpmcVWmVWm1,AmpVertexIRoshhToHpmcVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,           & 
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
& cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRoshhToHpmcVWm)

 End if 
 End if 
AmpVertexhhToHpmcVWm = AmpVertexhhToHpmcVWm -  AmpVertexIRdrhhToHpmcVWm! +  AmpVertexIRoshhToHpmcVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToHpmcVWm=0._dp 
AmpVertexZhhToHpmcVWm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToHpmcVWm(:,gt2,:) = AmpWaveZhhToHpmcVWm(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhToHpmcVWm(:,gt1,:) 
AmpVertexZhhToHpmcVWm(:,gt2,:)= AmpVertexZhhToHpmcVWm(:,gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhToHpmcVWm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToHpmcVWm=AmpWaveZhhToHpmcVWm 
AmpVertexhhToHpmcVWm= AmpVertexZhhToHpmcVWm
! Final State 1 
AmpWaveZhhToHpmcVWm=0._dp 
AmpVertexZhhToHpmcVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToHpmcVWm(:,:,gt2) = AmpWaveZhhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWavehhToHpmcVWm(:,:,gt1) 
AmpVertexZhhToHpmcVWm(:,:,gt2)= AmpVertexZhhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexhhToHpmcVWm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToHpmcVWm=AmpWaveZhhToHpmcVWm 
AmpVertexhhToHpmcVWm= AmpVertexZhhToHpmcVWm
End if
If (ShiftIRdiv) Then 
AmpVertexhhToHpmcVWm = AmpVertexhhToHpmcVWm  +  AmpVertexIRoshhToHpmcVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Hpm conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToHpmcVWm = AmpTreehhToHpmcVWm 
 AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm  
Else 
 AmpSumhhToHpmcVWm = AmpTreehhToHpmcVWm + AmpWavehhToHpmcVWm + AmpVertexhhToHpmcVWm
 AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm + AmpWavehhToHpmcVWm + AmpVertexhhToHpmcVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToHpmcVWm = AmpTreehhToHpmcVWm
 AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=2,2
If (((OSkinematics).and.(MhhOS(gt1).gt.(MHpmOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MHpm(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToHpmcVWm(gt1, gt2) 
  AmpSum2hhToHpmcVWm = 2._dp*AmpWavehhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToHpmcVWm(gt1, gt2) 
  AmpSum2hhToHpmcVWm = 2._dp*AmpVertexhhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToHpmcVWm(gt1, gt2) 
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToHpmcVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqTreehhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2)  
  AmpSum2hhToHpmcVWm = + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqhhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2) + AmpSqTreehhToHpmcVWm(gt1, gt2)  
Else  
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqTreehhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2)  
  AmpSum2hhToHpmcVWm = + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqhhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2) + AmpSqTreehhToHpmcVWm(gt1, gt2)  
End if  
Else  
  AmpSqhhToHpmcVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToHpmcVWm(gt1, gt2).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MHpmOS(gt2),MVWmOS,helfactor*AmpSqhhToHpmcVWm(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MHpm(gt2),MVWm,helfactor*AmpSqhhToHpmcVWm(gt1, gt2))
End if 
If ((Abs(MRPhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhToHpmcVWm(gt1, gt2) + MRGhhToHpmcVWm(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhToHpmcVWm(gt1, gt2) + MRGhhToHpmcVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Sd) Sd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTocSdSd(cplhhSdcSd,Mhh,MSd,Mhh2,MSd2,AmpTreehhTocSdSd)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTocSdSd(ZcplhhSdcSd,Mhh,MSd,Mhh2,MSd2,               & 
& AmpTreehhTocSdSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocSdSd(MLambda,em,gs,cplhhSdcSd,MhhOS,MSdOS,            & 
& MRPhhTocSdSd,MRGhhTocSdSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocSdSd(MLambda,em,gs,ZcplhhSdcSd,MhhOS,MSdOS,           & 
& MRPhhTocSdSd,MRGhhTocSdSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTocSdSd(MLambda,em,gs,cplhhSdcSd,Mhh,MSd,MRPhhTocSdSd,   & 
& MRGhhTocSdSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocSdSd(MLambda,em,gs,ZcplhhSdcSd,Mhh,MSd,               & 
& MRPhhTocSdSd,MRGhhTocSdSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTocSdSd(cplhhSdcSd,ctcplhhSdcSd,Mhh,Mhh2,            & 
& MSd,MSd2,Zfhh,ZfSd,AmpWavehhTocSdSd)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,              & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,          & 
& cplAhhhhh,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,              & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,           & 
& cplhhVZVZ,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,    & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplhhhhSdcSdaa,    & 
& cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,& 
& cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,& 
& cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,AmpVertexhhTocSdSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,      & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,             & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,     & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,     & 
& cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,   & 
& cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,& 
& cplSdSvReSvRecSdaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,AmpVertexIRdrhhTocSdSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,            & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,          & 
& cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,ZcplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,           & 
& cplhhVZVZ,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,    & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplhhhhSdcSdaa,    & 
& cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,& 
& cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,& 
& cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,AmpVertexIRoshhTocSdSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,      & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& ZcplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,            & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,     & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,     & 
& cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,   & 
& cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,& 
& cplSdSvReSvRecSdaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,AmpVertexIRoshhTocSdSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,            & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,          & 
& cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,              & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,           & 
& cplhhVZVZ,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,    & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplhhhhSdcSdaa,    & 
& cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,& 
& cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,& 
& cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,AmpVertexIRoshhTocSdSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,      & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,             & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,     & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,     & 
& cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,   & 
& cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,& 
& cplSdSvReSvRecSdaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,AmpVertexIRoshhTocSdSd)

 End if 
 End if 
AmpVertexhhTocSdSd = AmpVertexhhTocSdSd -  AmpVertexIRdrhhTocSdSd! +  AmpVertexIRoshhTocSdSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSdSd=0._dp 
AmpVertexZhhTocSdSd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocSdSd(gt2,:,:) = AmpWaveZhhTocSdSd(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSdSd(gt1,:,:) 
AmpVertexZhhTocSdSd(gt2,:,:)= AmpVertexZhhTocSdSd(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSdSd(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSdSd=AmpWaveZhhTocSdSd 
AmpVertexhhTocSdSd= AmpVertexZhhTocSdSd
! Final State 1 
AmpWaveZhhTocSdSd=0._dp 
AmpVertexZhhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSdSd(:,gt2,:) = AmpWaveZhhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWavehhTocSdSd(:,gt1,:) 
AmpVertexZhhTocSdSd(:,gt2,:)= AmpVertexZhhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpVertexhhTocSdSd(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSdSd=AmpWaveZhhTocSdSd 
AmpVertexhhTocSdSd= AmpVertexZhhTocSdSd
! Final State 2 
AmpWaveZhhTocSdSd=0._dp 
AmpVertexZhhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSdSd(:,:,gt2) = AmpWaveZhhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpWavehhTocSdSd(:,:,gt1) 
AmpVertexZhhTocSdSd(:,:,gt2)= AmpVertexZhhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexhhTocSdSd(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSdSd=AmpWaveZhhTocSdSd 
AmpVertexhhTocSdSd= AmpVertexZhhTocSdSd
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSdSd = AmpVertexhhTocSdSd  +  AmpVertexIRoshhTocSdSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Sd] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSdSd = AmpTreehhTocSdSd 
 AmpSum2hhTocSdSd = AmpTreehhTocSdSd + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd  
Else 
 AmpSumhhTocSdSd = AmpTreehhTocSdSd + AmpWavehhTocSdSd + AmpVertexhhTocSdSd
 AmpSum2hhTocSdSd = AmpTreehhTocSdSd + AmpWavehhTocSdSd + AmpVertexhhTocSdSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSdSd = AmpTreehhTocSdSd
 AmpSum2hhTocSdSd = AmpTreehhTocSdSd 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MhhOS(gt1).gt.(MSdOS(gt2)+MSdOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MSd(gt2)+MSd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
  AmpSum2hhTocSdSd = 2._dp*AmpWavehhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
  AmpSum2hhTocSdSd = 2._dp*AmpVertexhhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreehhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3)  
  AmpSum2hhTocSdSd = + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqhhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3) + AmpSqTreehhTocSdSd(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreehhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3)  
  AmpSum2hhTocSdSd = + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqhhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3) + AmpSqTreehhTocSdSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSdSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSdSd(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),helfactor*AmpSqhhTocSdSd(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MSd(gt2),MSd(gt3),helfactor*AmpSqhhTocSdSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSdSd(gt1, gt2, gt3) + MRGhhTocSdSd(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSdSd(gt1, gt2, gt3) + MRGhhTocSdSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Se) Se
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTocSeSe(cplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreehhTocSeSe)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTocSeSe(ZcplhhSecSe,Mhh,MSe,Mhh2,MSe2,               & 
& AmpTreehhTocSeSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocSeSe(MLambda,em,gs,cplhhSecSe,MhhOS,MSeOS,            & 
& MRPhhTocSeSe,MRGhhTocSeSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocSeSe(MLambda,em,gs,ZcplhhSecSe,MhhOS,MSeOS,           & 
& MRPhhTocSeSe,MRGhhTocSeSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTocSeSe(MLambda,em,gs,cplhhSecSe,Mhh,MSe,MRPhhTocSeSe,   & 
& MRGhhTocSeSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocSeSe(MLambda,em,gs,ZcplhhSecSe,Mhh,MSe,               & 
& MRPhhTocSeSe,MRGhhTocSeSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTocSeSe(cplhhSecSe,ctcplhhSecSe,Mhh,Mhh2,            & 
& MSe,MSe2,Zfhh,ZfSe,AmpWavehhTocSeSe)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,            & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,            & 
& cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,          & 
& cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,& 
& cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,   & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,  & 
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexhhTocSeSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,      & 
& cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,          & 
& cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,& 
& cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,   & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,  & 
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRdrhhTocSeSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,    & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,       & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,             & 
& cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,ZcplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,           & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,         & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,         & 
& cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,              & 
& cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,   & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,  & 
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRoshhTocSeSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,      & 
& cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,          & 
& cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,ZcplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,& 
& cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,   & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,  & 
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRoshhTocSeSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,    & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,       & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,             & 
& cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,         & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,         & 
& cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,              & 
& cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,   & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,  & 
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRoshhTocSeSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,      & 
& cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,          & 
& cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,cplhhHpmSvImcSe1,& 
& cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,   & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,  & 
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRoshhTocSeSe)

 End if 
 End if 
AmpVertexhhTocSeSe = AmpVertexhhTocSeSe -  AmpVertexIRdrhhTocSeSe! +  AmpVertexIRoshhTocSeSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSeSe=0._dp 
AmpVertexZhhTocSeSe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocSeSe(gt2,:,:) = AmpWaveZhhTocSeSe(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSeSe(gt1,:,:) 
AmpVertexZhhTocSeSe(gt2,:,:)= AmpVertexZhhTocSeSe(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSeSe(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSeSe=AmpWaveZhhTocSeSe 
AmpVertexhhTocSeSe= AmpVertexZhhTocSeSe
! Final State 1 
AmpWaveZhhTocSeSe=0._dp 
AmpVertexZhhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSeSe(:,gt2,:) = AmpWaveZhhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWavehhTocSeSe(:,gt1,:) 
AmpVertexZhhTocSeSe(:,gt2,:)= AmpVertexZhhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpVertexhhTocSeSe(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSeSe=AmpWaveZhhTocSeSe 
AmpVertexhhTocSeSe= AmpVertexZhhTocSeSe
! Final State 2 
AmpWaveZhhTocSeSe=0._dp 
AmpVertexZhhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSeSe(:,:,gt2) = AmpWaveZhhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWavehhTocSeSe(:,:,gt1) 
AmpVertexZhhTocSeSe(:,:,gt2)= AmpVertexZhhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexhhTocSeSe(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSeSe=AmpWaveZhhTocSeSe 
AmpVertexhhTocSeSe= AmpVertexZhhTocSeSe
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSeSe = AmpVertexhhTocSeSe  +  AmpVertexIRoshhTocSeSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Se] Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSeSe = AmpTreehhTocSeSe 
 AmpSum2hhTocSeSe = AmpTreehhTocSeSe + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe  
Else 
 AmpSumhhTocSeSe = AmpTreehhTocSeSe + AmpWavehhTocSeSe + AmpVertexhhTocSeSe
 AmpSum2hhTocSeSe = AmpTreehhTocSeSe + AmpWavehhTocSeSe + AmpVertexhhTocSeSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSeSe = AmpTreehhTocSeSe
 AmpSum2hhTocSeSe = AmpTreehhTocSeSe 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MhhOS(gt1).gt.(MSeOS(gt2)+MSeOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MSe(gt2)+MSe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
  AmpSum2hhTocSeSe = 2._dp*AmpWavehhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
  AmpSum2hhTocSeSe = 2._dp*AmpVertexhhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreehhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3)  
  AmpSum2hhTocSeSe = + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqhhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3) + AmpSqTreehhTocSeSe(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreehhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3)  
  AmpSum2hhTocSeSe = + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqhhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3) + AmpSqTreehhTocSeSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSeSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSeSe(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),helfactor*AmpSqhhTocSeSe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MSe(gt2),MSe(gt3),helfactor*AmpSqhhTocSeSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSeSe(gt1, gt2, gt3) + MRGhhTocSeSe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSeSe(gt1, gt2, gt3) + MRGhhTocSeSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Su) Su
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTocSuSu(cplhhSucSu,Mhh,MSu,Mhh2,MSu2,AmpTreehhTocSuSu)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTocSuSu(ZcplhhSucSu,Mhh,MSu,Mhh2,MSu2,               & 
& AmpTreehhTocSuSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocSuSu(MLambda,em,gs,cplhhSucSu,MhhOS,MSuOS,            & 
& MRPhhTocSuSu,MRGhhTocSuSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocSuSu(MLambda,em,gs,ZcplhhSucSu,MhhOS,MSuOS,           & 
& MRPhhTocSuSu,MRGhhTocSuSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTocSuSu(MLambda,em,gs,cplhhSucSu,Mhh,MSu,MRPhhTocSuSu,   & 
& MRGhhTocSuSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocSuSu(MLambda,em,gs,ZcplhhSucSu,Mhh,MSu,               & 
& MRPhhTocSuSu,MRGhhTocSuSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTocSuSu(cplhhSucSu,ctcplhhSucSu,Mhh,Mhh2,            & 
& MSu,MSu2,Zfhh,ZfSu,AmpWavehhTocSuSu)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,              & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,          & 
& cplAhhhhh,cplAhhhVZ,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,               & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSucVWmVWmaa,            & 
& cplSucSuVZVZaa,AmpVertexhhTocSuSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSucVWmVWmaa,            & 
& cplSucSuVZVZaa,AmpVertexIRdrhhTocSuSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,            & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,          & 
& cplAhhhVZ,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,ZcplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa,              & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSucVWmVWmaa,            & 
& cplSucSuVZVZaa,AmpVertexIRoshhTocSuSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,ZcplhhSucSu,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSucVWmVWmaa,            & 
& cplSucSuVZVZaa,AmpVertexIRoshhTocSuSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,            & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,          & 
& cplAhhhVZ,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa,              & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSucVWmVWmaa,            & 
& cplSucSuVZVZaa,AmpVertexIRoshhTocSuSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSucSd,           & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSucVWmVWmaa,            & 
& cplSucSuVZVZaa,AmpVertexIRoshhTocSuSu)

 End if 
 End if 
AmpVertexhhTocSuSu = AmpVertexhhTocSuSu -  AmpVertexIRdrhhTocSuSu! +  AmpVertexIRoshhTocSuSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSuSu=0._dp 
AmpVertexZhhTocSuSu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocSuSu(gt2,:,:) = AmpWaveZhhTocSuSu(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSuSu(gt1,:,:) 
AmpVertexZhhTocSuSu(gt2,:,:)= AmpVertexZhhTocSuSu(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSuSu(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSuSu=AmpWaveZhhTocSuSu 
AmpVertexhhTocSuSu= AmpVertexZhhTocSuSu
! Final State 1 
AmpWaveZhhTocSuSu=0._dp 
AmpVertexZhhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSuSu(:,gt2,:) = AmpWaveZhhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpWavehhTocSuSu(:,gt1,:) 
AmpVertexZhhTocSuSu(:,gt2,:)= AmpVertexZhhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpVertexhhTocSuSu(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSuSu=AmpWaveZhhTocSuSu 
AmpVertexhhTocSuSu= AmpVertexZhhTocSuSu
! Final State 2 
AmpWaveZhhTocSuSu=0._dp 
AmpVertexZhhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSuSu(:,:,gt2) = AmpWaveZhhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpWavehhTocSuSu(:,:,gt1) 
AmpVertexZhhTocSuSu(:,:,gt2)= AmpVertexZhhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpVertexhhTocSuSu(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSuSu=AmpWaveZhhTocSuSu 
AmpVertexhhTocSuSu= AmpVertexZhhTocSuSu
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSuSu = AmpVertexhhTocSuSu  +  AmpVertexIRoshhTocSuSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Su] Su -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSuSu = AmpTreehhTocSuSu 
 AmpSum2hhTocSuSu = AmpTreehhTocSuSu + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu  
Else 
 AmpSumhhTocSuSu = AmpTreehhTocSuSu + AmpWavehhTocSuSu + AmpVertexhhTocSuSu
 AmpSum2hhTocSuSu = AmpTreehhTocSuSu + AmpWavehhTocSuSu + AmpVertexhhTocSuSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSuSu = AmpTreehhTocSuSu
 AmpSum2hhTocSuSu = AmpTreehhTocSuSu 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MhhOS(gt1).gt.(MSuOS(gt2)+MSuOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MSu(gt2)+MSu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
  AmpSum2hhTocSuSu = 2._dp*AmpWavehhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
  AmpSum2hhTocSuSu = 2._dp*AmpVertexhhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreehhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3)  
  AmpSum2hhTocSuSu = + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqhhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3) + AmpSqTreehhTocSuSu(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreehhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3)  
  AmpSum2hhTocSuSu = + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqhhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3) + AmpSqTreehhTocSuSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSuSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSuSu(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),helfactor*AmpSqhhTocSuSu(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MSu(gt2),MSu(gt3),helfactor*AmpSqhhTocSuSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSuSu(gt1, gt2, gt3) + MRGhhTocSuSu(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSuSu(gt1, gt2, gt3) + MRGhhTocSuSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvIm SvIm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhToSvImSvIm(cplhhSvImSvIm,Mhh,MSvIm,Mhh2,             & 
& MSvIm2,AmpTreehhToSvImSvIm)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhToSvImSvIm(ZcplhhSvImSvIm,Mhh,MSvIm,Mhh2,            & 
& MSvIm2,AmpTreehhToSvImSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhToSvImSvIm(MLambda,em,gs,cplhhSvImSvIm,MhhOS,            & 
& MSvImOS,MRPhhToSvImSvIm,MRGhhToSvImSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToSvImSvIm(MLambda,em,gs,ZcplhhSvImSvIm,MhhOS,           & 
& MSvImOS,MRPhhToSvImSvIm,MRGhhToSvImSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhToSvImSvIm(MLambda,em,gs,cplhhSvImSvIm,Mhh,              & 
& MSvIm,MRPhhToSvImSvIm,MRGhhToSvImSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToSvImSvIm(MLambda,em,gs,ZcplhhSvImSvIm,Mhh,             & 
& MSvIm,MRPhhToSvImSvIm,MRGhhToSvImSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToSvImSvIm(cplhhSvImSvIm,ctcplhhSvImSvIm,            & 
& Mhh,Mhh2,MSvIm,MSvIm2,Zfhh,ZfSvIm,AmpWavehhToSvImSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvIm,   & 
& cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,cplSeSvImcHpm,         & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhhhSvImSvIm1,           & 
& cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,cplhhSeSvImcHpm1,  & 
& cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,           & 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImcVWmVWm1,    & 
& cplSvImSvImVZVZ1,AmpVertexhhToSvImSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImVZVZ1,AmpVertexIRdrhhToSvImSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvImSvIm(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,       & 
& cplhhSucSu,ZcplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,       & 
& cplhhVZVZ,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,       & 
& cplAhAhSvImSvIm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhHpmSvImcSe1,cplhhSeSvImcHpm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,              & 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,AmpVertexIRoshhToSvImSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,           & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,ZcplhhSvImSvIm,cplhhSvImSvRe,            & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvImcSe,cplSeSvImcHpm,         & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhhhSvImSvIm1,           & 
& cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhHpmSvImcSe1,cplhhSeSvImcHpm1,  & 
& cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,           & 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImcVWmVWm1,    & 
& cplSvImSvImVZVZ1,AmpVertexIRoshhToSvImSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvImSvIm(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,       & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,       & 
& cplAhAhSvImSvIm1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhHpmSvImcSe1,cplhhSeSvImcHpm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,              & 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,AmpVertexIRoshhToSvImSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvImSvIm(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImVZVZ1,AmpVertexIRoshhToSvImSvIm)

 End if 
 End if 
AmpVertexhhToSvImSvIm = AmpVertexhhToSvImSvIm -  AmpVertexIRdrhhToSvImSvIm! +  AmpVertexIRoshhToSvImSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToSvImSvIm=0._dp 
AmpVertexZhhToSvImSvIm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToSvImSvIm(gt2,:,:) = AmpWaveZhhToSvImSvIm(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToSvImSvIm(gt1,:,:) 
AmpVertexZhhToSvImSvIm(gt2,:,:)= AmpVertexZhhToSvImSvIm(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToSvImSvIm(gt1,:,:) 
 End Do 
End Do 
AmpWavehhToSvImSvIm=AmpWaveZhhToSvImSvIm 
AmpVertexhhToSvImSvIm= AmpVertexZhhToSvImSvIm
! Final State 1 
AmpWaveZhhToSvImSvIm=0._dp 
AmpVertexZhhToSvImSvIm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToSvImSvIm(:,gt2,:) = AmpWaveZhhToSvImSvIm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWavehhToSvImSvIm(:,gt1,:) 
AmpVertexZhhToSvImSvIm(:,gt2,:)= AmpVertexZhhToSvImSvIm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexhhToSvImSvIm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToSvImSvIm=AmpWaveZhhToSvImSvIm 
AmpVertexhhToSvImSvIm= AmpVertexZhhToSvImSvIm
! Final State 2 
AmpWaveZhhToSvImSvIm=0._dp 
AmpVertexZhhToSvImSvIm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToSvImSvIm(:,:,gt2) = AmpWaveZhhToSvImSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWavehhToSvImSvIm(:,:,gt1) 
AmpVertexZhhToSvImSvIm(:,:,gt2)= AmpVertexZhhToSvImSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexhhToSvImSvIm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToSvImSvIm=AmpWaveZhhToSvImSvIm 
AmpVertexhhToSvImSvIm= AmpVertexZhhToSvImSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexhhToSvImSvIm = AmpVertexhhToSvImSvIm  +  AmpVertexIRoshhToSvImSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->SvIm SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToSvImSvIm = AmpTreehhToSvImSvIm 
 AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm + 2._dp*AmpWavehhToSvImSvIm + 2._dp*AmpVertexhhToSvImSvIm  
Else 
 AmpSumhhToSvImSvIm = AmpTreehhToSvImSvIm + AmpWavehhToSvImSvIm + AmpVertexhhToSvImSvIm
 AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm + AmpWavehhToSvImSvIm + AmpVertexhhToSvImSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToSvImSvIm = AmpTreehhToSvImSvIm
 AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,9
    Do gt3=gt2,9
If (((OSkinematics).and.(MhhOS(gt1).gt.(MSvImOS(gt2)+MSvImOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MSvIm(gt2)+MSvIm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToSvImSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvImSvIm = 2._dp*AmpWavehhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToSvImSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvImSvIm = 2._dp*AmpVertexhhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToSvImSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm + 2._dp*AmpWavehhToSvImSvIm + 2._dp*AmpVertexhhToSvImSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToSvImSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqTreehhToSvImSvIm(gt1, gt2, gt3) = AmpSqhhToSvImSvIm(gt1, gt2, gt3)  
  AmpSum2hhToSvImSvIm = + 2._dp*AmpWavehhToSvImSvIm + 2._dp*AmpVertexhhToSvImSvIm
  Call SquareAmp_StoSS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqhhToSvImSvIm(gt1, gt2, gt3) = AmpSqhhToSvImSvIm(gt1, gt2, gt3) + AmpSqTreehhToSvImSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2hhToSvImSvIm = AmpTreehhToSvImSvIm
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqTreehhToSvImSvIm(gt1, gt2, gt3) = AmpSqhhToSvImSvIm(gt1, gt2, gt3)  
  AmpSum2hhToSvImSvIm = + 2._dp*AmpWavehhToSvImSvIm + 2._dp*AmpVertexhhToSvImSvIm
  Call SquareAmp_StoSS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),AmpSumhhToSvImSvIm(gt1, gt2, gt3),AmpSum2hhToSvImSvIm(gt1, gt2, gt3),AmpSqhhToSvImSvIm(gt1, gt2, gt3)) 
  AmpSqhhToSvImSvIm(gt1, gt2, gt3) = AmpSqhhToSvImSvIm(gt1, gt2, gt3) + AmpSqTreehhToSvImSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToSvImSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToSvImSvIm(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MSvImOS(gt2),MSvImOS(gt3),helfactor*AmpSqhhToSvImSvIm(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MSvIm(gt2),MSvIm(gt3),helfactor*AmpSqhhToSvImSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvImSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToSvImSvIm(gt1, gt2, gt3) + MRGhhToSvImSvIm(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToSvImSvIm(gt1, gt2, gt3) + MRGhhToSvImSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe SvIm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhToSvReSvIm(cplhhSvImSvRe,Mhh,MSvIm,MSvRe,            & 
& Mhh2,MSvIm2,MSvRe2,AmpTreehhToSvReSvIm)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhToSvReSvIm(ZcplhhSvImSvRe,Mhh,MSvIm,MSvRe,           & 
& Mhh2,MSvIm2,MSvRe2,AmpTreehhToSvReSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhToSvReSvIm(MLambda,em,gs,cplhhSvImSvRe,MhhOS,            & 
& MSvImOS,MSvReOS,MRPhhToSvReSvIm,MRGhhToSvReSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToSvReSvIm(MLambda,em,gs,ZcplhhSvImSvRe,MhhOS,           & 
& MSvImOS,MSvReOS,MRPhhToSvReSvIm,MRGhhToSvReSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhToSvReSvIm(MLambda,em,gs,cplhhSvImSvRe,Mhh,              & 
& MSvIm,MSvRe,MRPhhToSvReSvIm,MRGhhToSvReSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToSvReSvIm(MLambda,em,gs,ZcplhhSvImSvRe,Mhh,             & 
& MSvIm,MSvRe,MRPhhToSvReSvIm,MRGhhToSvReSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToSvReSvIm(cplhhSvImSvRe,ctcplhhSvImSvRe,            & 
& Mhh,Mhh2,MSvIm,MSvIm2,MSvRe,MSvRe2,Zfhh,ZfSvIm,ZfSvRe,AmpWavehhToSvReSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexhhToSvReSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRdrhhToSvReSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvIm(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,          & 
& MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,              & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,    & 
& cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,    & 
& cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,ZcplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,    & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvRe1,              & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRoshhToSvReSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvIm,        & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,ZcplhhSvImSvRe,cplhhSvReSvRe,         & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvRe1,& 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRoshhToSvReSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvIm(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,          & 
& MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,        & 
& cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,              & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,    & 
& cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,    & 
& cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,              & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,    & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvRe1,              & 
& cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,  & 
& cplhhhhSvReSvRe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRoshhToSvReSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvIm(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRoshhToSvReSvIm)

 End if 
 End if 
AmpVertexhhToSvReSvIm = AmpVertexhhToSvReSvIm -  AmpVertexIRdrhhToSvReSvIm! +  AmpVertexIRoshhToSvReSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToSvReSvIm=0._dp 
AmpVertexZhhToSvReSvIm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToSvReSvIm(gt2,:,:) = AmpWaveZhhToSvReSvIm(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToSvReSvIm(gt1,:,:) 
AmpVertexZhhToSvReSvIm(gt2,:,:)= AmpVertexZhhToSvReSvIm(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToSvReSvIm(gt1,:,:) 
 End Do 
End Do 
AmpWavehhToSvReSvIm=AmpWaveZhhToSvReSvIm 
AmpVertexhhToSvReSvIm= AmpVertexZhhToSvReSvIm
! Final State 1 
AmpWaveZhhToSvReSvIm=0._dp 
AmpVertexZhhToSvReSvIm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToSvReSvIm(:,gt2,:) = AmpWaveZhhToSvReSvIm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWavehhToSvReSvIm(:,gt1,:) 
AmpVertexZhhToSvReSvIm(:,gt2,:)= AmpVertexZhhToSvReSvIm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexhhToSvReSvIm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToSvReSvIm=AmpWaveZhhToSvReSvIm 
AmpVertexhhToSvReSvIm= AmpVertexZhhToSvReSvIm
! Final State 2 
AmpWaveZhhToSvReSvIm=0._dp 
AmpVertexZhhToSvReSvIm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToSvReSvIm(:,:,gt2) = AmpWaveZhhToSvReSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWavehhToSvReSvIm(:,:,gt1) 
AmpVertexZhhToSvReSvIm(:,:,gt2)= AmpVertexZhhToSvReSvIm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexhhToSvReSvIm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToSvReSvIm=AmpWaveZhhToSvReSvIm 
AmpVertexhhToSvReSvIm= AmpVertexZhhToSvReSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexhhToSvReSvIm = AmpVertexhhToSvReSvIm  +  AmpVertexIRoshhToSvReSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->SvRe SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToSvReSvIm = AmpTreehhToSvReSvIm 
 AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm + 2._dp*AmpWavehhToSvReSvIm + 2._dp*AmpVertexhhToSvReSvIm  
Else 
 AmpSumhhToSvReSvIm = AmpTreehhToSvReSvIm + AmpWavehhToSvReSvIm + AmpVertexhhToSvReSvIm
 AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm + AmpWavehhToSvReSvIm + AmpVertexhhToSvReSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToSvReSvIm = AmpTreehhToSvReSvIm
 AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,9
    Do gt3=1,9
If (((OSkinematics).and.(MhhOS(gt1).gt.(MSvReOS(gt2)+MSvImOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MSvRe(gt2)+MSvIm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToSvReSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvIm = 2._dp*AmpWavehhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToSvReSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvIm = 2._dp*AmpVertexhhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToSvReSvIm(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm + 2._dp*AmpWavehhToSvReSvIm + 2._dp*AmpVertexhhToSvReSvIm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToSvReSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqTreehhToSvReSvIm(gt1, gt2, gt3) = AmpSqhhToSvReSvIm(gt1, gt2, gt3)  
  AmpSum2hhToSvReSvIm = + 2._dp*AmpWavehhToSvReSvIm + 2._dp*AmpVertexhhToSvReSvIm
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqhhToSvReSvIm(gt1, gt2, gt3) = AmpSqhhToSvReSvIm(gt1, gt2, gt3) + AmpSqTreehhToSvReSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2hhToSvReSvIm = AmpTreehhToSvReSvIm
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqTreehhToSvReSvIm(gt1, gt2, gt3) = AmpSqhhToSvReSvIm(gt1, gt2, gt3)  
  AmpSum2hhToSvReSvIm = + 2._dp*AmpWavehhToSvReSvIm + 2._dp*AmpVertexhhToSvReSvIm
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),AmpSumhhToSvReSvIm(gt1, gt2, gt3),AmpSum2hhToSvReSvIm(gt1, gt2, gt3),AmpSqhhToSvReSvIm(gt1, gt2, gt3)) 
  AmpSqhhToSvReSvIm(gt1, gt2, gt3) = AmpSqhhToSvReSvIm(gt1, gt2, gt3) + AmpSqTreehhToSvReSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToSvReSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToSvReSvIm(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MSvReOS(gt2),MSvImOS(gt3),helfactor*AmpSqhhToSvReSvIm(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MSvRe(gt2),MSvIm(gt3),helfactor*AmpSqhhToSvReSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvReSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhToSvReSvIm(gt1, gt2, gt3) + MRGhhToSvReSvIm(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhToSvReSvIm(gt1, gt2, gt3) + MRGhhToSvReSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe SvRe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhToSvReSvRe(cplhhSvReSvRe,Mhh,MSvRe,Mhh2,             & 
& MSvRe2,AmpTreehhToSvReSvRe)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhToSvReSvRe(ZcplhhSvReSvRe,Mhh,MSvRe,Mhh2,            & 
& MSvRe2,AmpTreehhToSvReSvRe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhToSvReSvRe(MLambda,em,gs,cplhhSvReSvRe,MhhOS,            & 
& MSvReOS,MRPhhToSvReSvRe,MRGhhToSvReSvRe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToSvReSvRe(MLambda,em,gs,ZcplhhSvReSvRe,MhhOS,           & 
& MSvReOS,MRPhhToSvReSvRe,MRGhhToSvReSvRe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhToSvReSvRe(MLambda,em,gs,cplhhSvReSvRe,Mhh,              & 
& MSvRe,MRPhhToSvReSvRe,MRGhhToSvReSvRe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToSvReSvRe(MLambda,em,gs,ZcplhhSvReSvRe,Mhh,             & 
& MSvRe,MRPhhToSvReSvRe,MRGhhToSvReSvRe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToSvReSvRe(cplhhSvReSvRe,ctcplhhSvReSvRe,            & 
& Mhh,Mhh2,MSvRe,MSvRe2,Zfhh,ZfSvRe,AmpWavehhToSvReSvRe)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvRe,   & 
& cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvRecSe,cplSeSvRecHpm,         & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,           & 
& cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,cplhhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,cplSvReSvRecVWmVWm1,    & 
& cplSvReSvReVZVZ1,AmpVertexhhToSvReSvRe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,           & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvRecSe,cplSeSvRecHpm,         & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,           & 
& cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,cplhhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,cplSvReSvRecVWmVWm1,    & 
& cplSvReSvReVZVZ1,AmpVertexIRdrhhToSvReSvRe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvRe(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvRe,cplAhSvReSvRe,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,cplcChaFeSvReR,     & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,       & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,ZcplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,       & 
& cplhhVZVZ,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,       & 
& cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,  & 
& cplhhHpmSvRecSe1,cplhhSeSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,              & 
& cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,        & 
& cplSvReSvReSvReSvRe1,cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,AmpVertexIRoshhToSvReSvRe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,           & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& ZcplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvRecSe,cplSeSvRecHpm,        & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,           & 
& cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,cplhhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,cplSvReSvRecVWmVWm1,    & 
& cplSvReSvReVZVZ1,AmpVertexIRoshhToSvReSvRe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvRe(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhSvImSvRe,cplAhSvReSvRe,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvReL,cplcChaFeSvReR,     & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,       & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,       & 
& cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,  & 
& cplhhHpmSvRecSe1,cplhhSeSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,              & 
& cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,        & 
& cplSvReSvReSvReSvRe1,cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,AmpVertexIRoshhToSvReSvRe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToSvReSvRe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,           & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvReL,cplChiFvSvReR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmSvRecSe,cplSeSvRecHpm,         & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,cplAhAhSvReSvRe1,cplAhhhSvImSvRe1,           & 
& cplAhhhSvReSvRe1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSvRecSe1,cplhhSeSvRecHpm1,  & 
& cplHpmSvReSvRecHpm1,cplSdSvReSvRecSdaa,cplSeSvReSvRecSe1,cplSuSvReSvRecSuaa,           & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,cplSvReSvReSvReSvRe1,cplSvReSvRecVWmVWm1,    & 
& cplSvReSvReVZVZ1,AmpVertexIRoshhToSvReSvRe)

 End if 
 End if 
AmpVertexhhToSvReSvRe = AmpVertexhhToSvReSvRe -  AmpVertexIRdrhhToSvReSvRe! +  AmpVertexIRoshhToSvReSvRe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToSvReSvRe=0._dp 
AmpVertexZhhToSvReSvRe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToSvReSvRe(gt2,:,:) = AmpWaveZhhToSvReSvRe(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToSvReSvRe(gt1,:,:) 
AmpVertexZhhToSvReSvRe(gt2,:,:)= AmpVertexZhhToSvReSvRe(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToSvReSvRe(gt1,:,:) 
 End Do 
End Do 
AmpWavehhToSvReSvRe=AmpWaveZhhToSvReSvRe 
AmpVertexhhToSvReSvRe= AmpVertexZhhToSvReSvRe
! Final State 1 
AmpWaveZhhToSvReSvRe=0._dp 
AmpVertexZhhToSvReSvRe=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToSvReSvRe(:,gt2,:) = AmpWaveZhhToSvReSvRe(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWavehhToSvReSvRe(:,gt1,:) 
AmpVertexZhhToSvReSvRe(:,gt2,:)= AmpVertexZhhToSvReSvRe(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexhhToSvReSvRe(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToSvReSvRe=AmpWaveZhhToSvReSvRe 
AmpVertexhhToSvReSvRe= AmpVertexZhhToSvReSvRe
! Final State 2 
AmpWaveZhhToSvReSvRe=0._dp 
AmpVertexZhhToSvReSvRe=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToSvReSvRe(:,:,gt2) = AmpWaveZhhToSvReSvRe(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWavehhToSvReSvRe(:,:,gt1) 
AmpVertexZhhToSvReSvRe(:,:,gt2)= AmpVertexZhhToSvReSvRe(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexhhToSvReSvRe(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToSvReSvRe=AmpWaveZhhToSvReSvRe 
AmpVertexhhToSvReSvRe= AmpVertexZhhToSvReSvRe
End if
If (ShiftIRdiv) Then 
AmpVertexhhToSvReSvRe = AmpVertexhhToSvReSvRe  +  AmpVertexIRoshhToSvReSvRe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->SvRe SvRe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToSvReSvRe = AmpTreehhToSvReSvRe 
 AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe + 2._dp*AmpWavehhToSvReSvRe + 2._dp*AmpVertexhhToSvReSvRe  
Else 
 AmpSumhhToSvReSvRe = AmpTreehhToSvReSvRe + AmpWavehhToSvReSvRe + AmpVertexhhToSvReSvRe
 AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe + AmpWavehhToSvReSvRe + AmpVertexhhToSvReSvRe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToSvReSvRe = AmpTreehhToSvReSvRe
 AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,9
    Do gt3=gt2,9
If (((OSkinematics).and.(MhhOS(gt1).gt.(MSvReOS(gt2)+MSvReOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MSvRe(gt2)+MSvRe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToSvReSvRe(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvRe = 2._dp*AmpWavehhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToSvReSvRe(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvRe = 2._dp*AmpVertexhhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToSvReSvRe(gt1, gt2, gt3) 
  AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe + 2._dp*AmpWavehhToSvReSvRe + 2._dp*AmpVertexhhToSvReSvRe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToSvReSvRe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqTreehhToSvReSvRe(gt1, gt2, gt3) = AmpSqhhToSvReSvRe(gt1, gt2, gt3)  
  AmpSum2hhToSvReSvRe = + 2._dp*AmpWavehhToSvReSvRe + 2._dp*AmpVertexhhToSvReSvRe
  Call SquareAmp_StoSS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqhhToSvReSvRe(gt1, gt2, gt3) = AmpSqhhToSvReSvRe(gt1, gt2, gt3) + AmpSqTreehhToSvReSvRe(gt1, gt2, gt3)  
Else  
  AmpSum2hhToSvReSvRe = AmpTreehhToSvReSvRe
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqTreehhToSvReSvRe(gt1, gt2, gt3) = AmpSqhhToSvReSvRe(gt1, gt2, gt3)  
  AmpSum2hhToSvReSvRe = + 2._dp*AmpWavehhToSvReSvRe + 2._dp*AmpVertexhhToSvReSvRe
  Call SquareAmp_StoSS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),AmpSumhhToSvReSvRe(gt1, gt2, gt3),AmpSum2hhToSvReSvRe(gt1, gt2, gt3),AmpSqhhToSvReSvRe(gt1, gt2, gt3)) 
  AmpSqhhToSvReSvRe(gt1, gt2, gt3) = AmpSqhhToSvReSvRe(gt1, gt2, gt3) + AmpSqTreehhToSvReSvRe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToSvReSvRe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToSvReSvRe(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MSvReOS(gt2),MSvReOS(gt3),helfactor*AmpSqhhToSvReSvRe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MSvRe(gt2),MSvRe(gt3),helfactor*AmpSqhhToSvReSvRe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToSvReSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToSvReSvRe(gt1, gt2, gt3) + MRGhhToSvReSvRe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToSvReSvRe(gt1, gt2, gt3) + MRGhhToSvReSvRe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(VWm) VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhTocVWmVWm(cplhhcVWmVWm,Mhh,MVWm,Mhh2,MVWm2,          & 
& AmpTreehhTocVWmVWm)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhTocVWmVWm(ZcplhhcVWmVWm,Mhh,MVWm,Mhh2,               & 
& MVWm2,AmpTreehhTocVWmVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocVWmVWm(MLambda,em,gs,cplhhcVWmVWm,MhhOS,              & 
& MVWmOS,MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocVWmVWm(MLambda,em,gs,ZcplhhcVWmVWm,MhhOS,             & 
& MVWmOS,MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhTocVWmVWm(MLambda,em,gs,cplhhcVWmVWm,Mhh,MVWm,           & 
& MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhTocVWmVWm(MLambda,em,gs,ZcplhhcVWmVWm,Mhh,               & 
& MVWm,MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhTocVWmVWm(cplhhcVWmVWm,ctcplhhcVWmVWm,               & 
& Mhh,Mhh2,MVWm,MVWm2,Zfhh,ZfVWm,AmpWavehhTocVWmVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,           & 
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
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,AmpVertexhhTocVWmVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,           & 
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
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,AmpVertexIRdrhhTocVWmVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocVWmVWm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,        & 
& cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,       & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,           & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,   & 
& cplcgZgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh,GosZcplhhHpmcHpm,GosZcplhhHpmcVWm,    & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& GosZcplhhcHpmVWm,ZcplhhcVWmVWm,cplhhVZVZ,GosZcplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,   & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,GosZcplcHpmVPVWm,  & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,& 
& cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,  & 
& cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,            & 
& cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,          & 
& cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,AmpVertexIRoshhTocVWmVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,           & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,  & 
& cplcgZgWpCVWm,cplcgZgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh,GZcplhhHpmcHpm,         & 
& GZcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,           & 
& cplhhSvReSvRe,GZcplhhcHpmVWm,ZcplhhcVWmVWm,cplhhVZVZ,GZcplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1, & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,    & 
& cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,              & 
& cplSvReSvRecVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,       & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,AmpVertexIRoshhTocVWmVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocVWmVWm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,        & 
& cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,       & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,           & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,   & 
& cplcgZgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& GcplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,           & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,      & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,& 
& cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,  & 
& cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvImSvImcVWmVWm1,cplSvReSvRecVWmVWm1,            & 
& cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,          & 
& cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,AmpVertexIRoshhTocVWmVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,           & 
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
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,AmpVertexIRoshhTocVWmVWm)

 End if 
 End if 
AmpVertexhhTocVWmVWm = AmpVertexhhTocVWmVWm -  AmpVertexIRdrhhTocVWmVWm! +  AmpVertexIRoshhTocVWmVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocVWmVWm=0._dp 
AmpVertexZhhTocVWmVWm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocVWmVWm(:,gt2) = AmpWaveZhhTocVWmVWm(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhTocVWmVWm(:,gt1) 
AmpVertexZhhTocVWmVWm(:,gt2)= AmpVertexZhhTocVWmVWm(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhTocVWmVWm(:,gt1) 
 End Do 
End Do 
AmpWavehhTocVWmVWm=AmpWaveZhhTocVWmVWm 
AmpVertexhhTocVWmVWm= AmpVertexZhhTocVWmVWm
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocVWmVWm = AmpVertexhhTocVWmVWm  +  AmpVertexIRoshhTocVWmVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[VWm] VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocVWmVWm = AmpTreehhTocVWmVWm 
 AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm  
Else 
 AmpSumhhTocVWmVWm = AmpTreehhTocVWmVWm + AmpWavehhTocVWmVWm + AmpVertexhhTocVWmVWm
 AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm + AmpWavehhTocVWmVWm + AmpVertexhhTocVWmVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocVWmVWm = AmpTreehhTocVWmVWm
 AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm 
End if 
Do gt1=1,3
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(MVWmOS+MVWmOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVWm+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocVWmVWm(gt1) 
  AmpSum2hhTocVWmVWm = 2._dp*AmpWavehhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocVWmVWm(gt1) 
  AmpSum2hhTocVWmVWm = 2._dp*AmpVertexhhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocVWmVWm(gt1) 
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocVWmVWm(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqTreehhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1)  
  AmpSum2hhTocVWmVWm = + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqhhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1) + AmpSqTreehhTocVWmVWm(gt1)  
Else  
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqTreehhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1)  
  AmpSum2hhTocVWmVWm = + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqhhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1) + AmpSqTreehhTocVWmVWm(gt1)  
End if  
Else  
  AmpSqhhTocVWmVWm(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocVWmVWm(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MVWmOS,MVWmOS,helfactor*AmpSqhhTocVWmVWm(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVWm,MVWm,helfactor*AmpSqhhTocVWmVWm(gt1))
End if 
If ((Abs(MRPhhTocVWmVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWmVWm(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocVWmVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWmVWm(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhTocVWmVWm(gt1) + MRGhhTocVWmVWm(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhTocVWmVWm(gt1) + MRGhhTocVWmVWm(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZ VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  Else 
Call Amplitude_Tree_NInvSeesaw_hhToVZVZ(ZcplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,MhhOS,MVZOS,              & 
& MRPhhToVZVZ,MRGhhToVZVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,MhhOS,MVZOS,             & 
& MRPhhToVZVZ,MRGhhToVZVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,      & 
& MRGhhToVZVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,     & 
& MRGhhToVZVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToVZVZ(cplhhVZVZ,ctcplhhVZVZ,Mhh,Mhh2,               & 
& MVZ,MVZ2,Zfhh,ZfVZ,AmpWavehhToVZVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,             & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhVZ,           & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,             & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,     & 
& cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,           & 
& cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,  & 
& AmpVertexhhToVZVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhVZ,      & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,             & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,     & 
& cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,           & 
& cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,  & 
& AmpVertexIRdrhhToVZVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhVZ,             & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,             & 
& cplhhcVWmVWm,ZcplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,               & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,          & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,          & 
& cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,    & 
& cplcVWmVWmVZVZ1Q,AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhVZ,      & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,             & 
& cplhhcVWmVWm,ZcplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,               & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,          & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,          & 
& cplSucSuVZVZaa,cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,    & 
& cplcVWmVWmVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhVZ,             & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,             & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,     & 
& cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,           & 
& cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,  & 
& AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhVZ,      & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhcHpmVWm,             & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,     & 
& cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,           & 
& cplSvImSvImVZVZ1,cplSvReSvReVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,  & 
& AmpVertexIRoshhToVZVZ)

 End if 
 End if 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ -  AmpVertexIRdrhhToVZVZ! +  AmpVertexIRoshhToVZVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZVZ=0._dp 
AmpVertexZhhToVZVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToVZVZ(:,gt2) = AmpWaveZhhToVZVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhToVZVZ(:,gt1) 
AmpVertexZhhToVZVZ(:,gt2)= AmpVertexZhhToVZVZ(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToVZVZ(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZVZ=AmpWaveZhhToVZVZ 
AmpVertexhhToVZVZ= AmpVertexZhhToVZVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ  +  AmpVertexIRoshhToVZVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZ VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ 
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ  
Else 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ 
End if 
Do gt1=1,3
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(MVZOS+MVZOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVZ+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpWavehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
Else  
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
End if  
Else  
  AmpSqhhToVZVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZVZ(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MVZOS,MVZOS,helfactor*AmpSqhhToVZVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVZ,MVZ,helfactor*AmpSqhhToVZVZ(gt1))
End if 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.3) isave = i4 
End do
End If 
!---------------- 
! Ah VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_NInvSeesaw_hhToAhVP(cplAhhhVZ,ctcplAhhhVZ,MAhOS,MAh2OS,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,ZfVZVP,AmpWavehhToAhVP)

 Else 
Call Amplitude_WAVE_NInvSeesaw_hhToAhVP(cplAhhhVZ,ctcplAhhhVZ,MAhOS,MAh2OS,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,ZfVZVP,AmpWavehhToAhVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_hhToAhVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,             & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,         & 
& Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,               & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhToAhVP)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_hhToAhVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,             & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,         & 
& Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,               & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhToAhVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_hhToAhVP(cplAhhhVZ,ctcplAhhhVZ,MAh,MAh2,               & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVP,ZfVZVP,AmpWavehhToAhVP)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToAhVP(MAh,MCha,MFd,MFe,MFu,Mhh,MHpm,              & 
& MSd,MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,              & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,             & 
& cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,  & 
& cplhhcHpmVPVWm1,AmpVertexhhToAhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhVP = 0._dp 
 AmpSum2hhToAhVP = 0._dp  
Else 
 AmpSumhhToAhVP = AmpVertexhhToAhVP + AmpWavehhToAhVP
 AmpSum2hhToAhVP = AmpVertexhhToAhVP + AmpWavehhToAhVP 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=2,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MAhOS(gt2)+0.))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MAh(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),0._dp,AmpSumhhToAhVP(:,gt1, gt2),AmpSum2hhToAhVP(:,gt1, gt2),AmpSqhhToAhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVP,AmpSumhhToAhVP(:,gt1, gt2),AmpSum2hhToAhVP(:,gt1, gt2),AmpSqhhToAhVP(gt1, gt2)) 
End if  
Else  
  AmpSqhhToAhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToAhVP(gt1, gt2).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),0._dp,helfactor*AmpSqhhToAhVP(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MAh(gt2),MVP,helfactor*AmpSqhhToAhVP(gt1, gt2))
End if 
If ((Abs(MRPhhToAhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
!---------------- 
! Glu Glu
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_hhToGluGlu(MFdOS,MFuOS,MGluOS,MhhOS,MSdOS,           & 
& MSuOS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MSd2OS,MSu2OS,cplGluFdcSdL,cplGluFdcSdR,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& AmpVertexhhToGluGlu)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_hhToGluGlu(MFdOS,MFuOS,MGluOS,MhhOS,MSdOS,           & 
& MSuOS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MSd2OS,MSu2OS,cplGluFdcSdL,cplGluFdcSdR,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& AmpVertexhhToGluGlu)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToGluGlu(MFd,MFu,MGlu,Mhh,MSd,MSu,MFd2,            & 
& MFu2,MGlu2,Mhh2,MSd2,MSu2,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,AmpVertexhhToGluGlu)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Glu Glu -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToGluGlu = 0._dp 
 AmpSum2hhToGluGlu = 0._dp  
Else 
 AmpSumhhToGluGlu = AmpVertexhhToGluGlu + AmpWavehhToGluGlu
 AmpSum2hhToGluGlu = AmpVertexhhToGluGlu + AmpWavehhToGluGlu 
End If 
Do gt1=1,3
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(MGluOS+MGluOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MGlu+MGlu)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MGluOS,MGluOS,AmpSumhhToGluGlu(:,gt1),AmpSum2hhToGluGlu(:,gt1),AmpSqhhToGluGlu(gt1)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MGlu,MGlu,AmpSumhhToGluGlu(:,gt1),AmpSum2hhToGluGlu(:,gt1),AmpSqhhToGluGlu(gt1)) 
End if  
Else  
  AmpSqhhToGluGlu(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhToGluGlu(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 4._dp*GammaTPS(MhhOS(gt1),MGluOS,MGluOS,helfactor*AmpSqhhToGluGlu(gt1))
Else 
  gP1Lhh(gt1,i4) = 4._dp*GammaTPS(Mhh(gt1),MGlu,MGlu,helfactor*AmpSqhhToGluGlu(gt1))
End if 
If ((Abs(MRPhhToGluGlu(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToGluGlu(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.3) isave = i4 
End do
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_hhTohhVP(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,               & 
& cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhTohhVP)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_hhTohhVP(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,               & 
& cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhTohhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTohhVP(MCha,MFd,MFe,MFu,Mhh,MHpm,MSd,              & 
& MSe,MSu,MVP,MVWm,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MVP2,MVWm2,            & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,         & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,             & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,       & 
& AmpVertexhhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVP = 0._dp 
 AmpSum2hhTohhVP = 0._dp  
Else 
 AmpSumhhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP
 AmpSum2hhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MhhOS(gt2)+0.))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(Mhh(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),0._dp,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVP,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVP(gt1, gt2).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),0._dp,helfactor*AmpSqhhTohhVP(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVP,helfactor*AmpSqhhTohhVP(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
!---------------- 
! hh VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_hhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,               & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVZ1,         & 
& cplhhcHpmVWmVZ1,AmpVertexhhTohhVZ)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_hhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,               & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,          & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVZ1,         & 
& cplhhcHpmVWmVZ1,AmpVertexhhTohhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,             & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,        & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,           & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexhhTohhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVZ = 0._dp 
 AmpSum2hhTohhVZ = 0._dp  
Else 
 AmpSumhhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ
 AmpSum2hhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MhhOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(Mhh(gt2)+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),MVZOS,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVZ,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVZ(gt1, gt2).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MVZOS,helfactor*AmpSqhhTohhVZ(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVZ,helfactor*AmpSqhhTohhVZ(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
!---------------- 
! VG VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_hhToVGVG(MFdOS,MFuOS,MhhOS,MSdOS,MSuOS,              & 
& MVG,MFd2OS,MFu2OS,Mhh2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,       & 
& cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexhhToVGVG)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_hhToVGVG(MFdOS,MFuOS,MhhOS,MSdOS,MSuOS,              & 
& MVG,MFd2OS,MFu2OS,Mhh2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,       & 
& cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexhhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToVGVG(MFd,MFu,Mhh,MSd,MSu,MVG,MFd2,               & 
& MFu2,Mhh2,MSd2,MSu2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,              & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,cplSdcSdVG,      & 
& cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexhhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVGVG = 0._dp 
 AmpSum2hhToVGVG = 0._dp  
Else 
 AmpSumhhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG
 AmpSum2hhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG 
End If 
Do gt1=1,3
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(0.+0.))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVG+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVG,MVG,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
End if  
Else  
  AmpSqhhToVGVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVGVG(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVGVG(gt1))
Else 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(Mhh(gt1),MVG,MVG,helfactor*AmpSqhhToVGVG(gt1))
End if 
If ((Abs(MRPhhToVGVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVGVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.3) isave = i4 
End do
!---------------- 
! VP VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_hhToVPVP(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,               & 
& cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,           & 
& cplSecSeVPVP1,cplSucSuVPVPaa,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,       & 
& AmpVertexhhToVPVP)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_hhToVPVP(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,               & 
& cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,           & 
& cplSecSeVPVP1,cplSucSuVPVPaa,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,       & 
& AmpVertexhhToVPVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToVPVP(MCha,MFd,MFe,MFu,Mhh,MHpm,MSd,              & 
& MSe,MSu,MVP,MVWm,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MVP2,MVWm2,            & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,         & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,             & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,       & 
& cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,cplcVWmVPVPVWm3Q,          & 
& cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,AmpVertexhhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVP = 0._dp 
 AmpSum2hhToVPVP = 0._dp  
Else 
 AmpSumhhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP
 AmpSum2hhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP 
End If 
Do gt1=1,3
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(0.+0.))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVP+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVP,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
End if  
Else  
  AmpSqhhToVPVP(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVP(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVPVP(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVP,MVP,helfactor*AmpSqhhToVPVP(gt1))
End if 
If ((Abs(MRPhhToVPVP(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVP(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.3) isave = i4 
End do
!---------------- 
! VP VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_hhToVPVZ(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,         & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,               & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,               & 
& cplcVWmVWmVZ,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,          & 
& cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,cplcVWmVPVWmVZ3Q,          & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexhhToVPVZ)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_hhToVPVZ(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,         & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,               & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,               & 
& cplcVWmVWmVZ,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,          & 
& cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,cplcVWmVPVWmVZ3Q,          & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexhhToVPVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_hhToVPVZ(MCha,MFd,MFe,MFu,Mhh,MHpm,MSd,              & 
& MSe,MSu,MVP,MVWm,MVZ,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MVP2,              & 
& MVWm2,MVZ2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,      & 
& cplcgWpCgWpCVZ,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,         & 
& cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,        & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,& 
& cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,           & 
& cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexhhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVZ = 0._dp 
 AmpSum2hhToVPVZ = 0._dp  
Else 
 AmpSumhhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ
 AmpSum2hhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ 
End If 
Do gt1=1,3
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(0.+MVZOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVP+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,MVZOS,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVZ,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
End if  
Else  
  AmpSqhhToVPVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVZ(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),0._dp,MVZOS,helfactor*AmpSqhhToVPVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVP,MVZ,helfactor*AmpSqhhToVPVZ(gt1))
End if 
If ((Abs(MRPhhToVPVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.3) isave = i4 
End do
End Subroutine OneLoopDecay_hh

End Module Wrapper_OneLoopDecay_hh_NInvSeesaw
