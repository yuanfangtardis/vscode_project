! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:48 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Hpm_seesaw1nmssm
Use Model_Data_seesaw1nmssm 
Use Kinematics 
Use OneLoopDecay_Hpm_seesaw1nmssm 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Hpm(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,           & 
& MSuOS,MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,             & 
& MChi2OS,MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,            & 
& MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,            & 
& ZAOS,ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,            & 
& MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,              & 
& Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,             & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,              & 
& ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,               & 
& TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,             & 
& dg3,dYd,dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,               & 
& dml2,dmHd2,dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,             & 
& dZVI,dZVR,dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,           & 
& dSinTW,dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,           & 
& Zfhh,ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,               & 
& ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhHpmcHpm1,cplAhcHpmVPVWm1,     & 
& cplAhcHpmVWm,cplAhcHpmVWmVZ1,cplAhhhhh,cplAhhhHpmcHpm1,cplAhhhVZ,cplAhHpmcHpm,         & 
& cplAhHpmcVWm,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmSucSdaa,cplAhHpmSvImcSe1,         & 
& cplAhHpmSvRecSe1,cplAhSdcHpmcSuaa,cplAhSdcSd,cplAhSecSe,cplAhSeSvImcHpm1,              & 
& cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChacFuSdL,   & 
& cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
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
& cplcFuGluSuL,cplcFuGluSuR,cplcgAgWpCVWm,cplcgWmgWmAh,cplcgWmgWmhh,cplcgWmgWmVP,        & 
& cplcgWmgWmVZ,cplcgWmgZHpm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgWpCAh,cplcgWpCgWpChh,   & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgZcHpm,cplcgZgAhh,cplcgZgWmcHpm,cplcgZgWpCHpm,   & 
& cplcgZgWpCVWm,cplcgZgZhh,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,      & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,          & 
& cplcVWmVPVWm,cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmVWmVZ,          & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplFvChacSeL,cplFvChacSeR,          & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,    & 
& cplGluFucSuR,cplhhcHpmVPVWm1,cplhhcHpmVWm,cplhhcHpmVWmVZ1,cplhhcVWmVWm,cplhhhhcVWmVWm1,& 
& cplhhhhhh,cplhhhhHpmcHpm1,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,   & 
& cplhhHpmSucSdaa,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSdcHpmcSuaa,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,   & 
& cplhhSvReSvRe,cplhhVZVZ,cplHpmcHpmcVWmVWm1,cplHpmcHpmVP,cplHpmcHpmVPVP1,               & 
& cplHpmcHpmVPVZ1,cplHpmcHpmVZ,cplHpmcHpmVZVZ1,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmHpmcHpmcHpm1,& 
& cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSucSd,cplHpmSvImcSe,        & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvRecSe,cplHpmSvReSvRecHpm1,             & 
& cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSucVWm,cplSdcSucVWmVPaa,           & 
& cplSdcSucVWmVZaa,cplSdSucSdcSuabab,cplSdSucSdcSuabba,cplSdSvImcSecSuaa,cplSdSvRecSecSuaa,& 
& cplSecSeVP,cplSecSeVZ,cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvReSvRecSe1,cplSucSdVPVWmaa,     & 
& cplSucSdVWm,cplSucSdVWmVZaa,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSvImcSeVPVWm1,         & 
& cplSvImcSeVWm,cplSvImcSeVWmVZ1,cplSvImSvReVZ,cplSvRecSeVPVWm1,cplSvRecSeVWm,           & 
& cplSvRecSeVWmVZ1,ctcplAhcHpmVWm,ctcplAhHpmcHpm,ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,        & 
& ctcplChiChacHpmL,ctcplChiChacHpmR,ctcplcHpmVPVWm,ctcplcHpmVWmVZ,ctcplFvFecHpmL,        & 
& ctcplFvFecHpmR,ctcplhhcHpmVWm,ctcplhhHpmcHpm,ctcplHpmcHpmVP,ctcplHpmcHpmVZ,            & 
& ctcplSdcHpmcSu,ctcplSeSvImcHpm,ctcplSeSvRecHpm,GcplAhHpmcHpm,GcplcHpmVPVWm,            & 
& GcplhhHpmcHpm,GcplHpmcHpmVZ,GcplHpmcVWmVP,GosZcplAhHpmcHpm,GosZcplcHpmVPVWm,           & 
& GosZcplhhHpmcHpm,GosZcplHpmcHpmVZ,GosZcplHpmcVWmVP,GZcplAhHpmcHpm,GZcplcHpmVPVWm,      & 
& GZcplhhHpmcHpm,GZcplHpmcHpmVZ,GZcplHpmcVWmVP,ZcplAhcHpmVWm,ZcplAhHpmcHpm,              & 
& ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplcHpmVWmVZ,           & 
& ZcplFvFecHpmL,ZcplFvFecHpmR,ZcplhhcHpmVWm,ZcplhhHpmcHpm,ZcplHpmcHpmVZ,ZcplSdcHpmcSu,   & 
& ZcplSeSvImcHpm,ZcplSeSvRecHpm,ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,             & 
& ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,               & 
& MLambda,em,gs,deltaM,kont,gP1LHpm)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vS

Real(dp),Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dmHd2,dmHu2,dms2,dvd,dvu,dvS,dZH(3,3),dZA(3,3),dZP(2,2),dSinTW,           & 
& dCosTW,dTanTW

Complex(dp),Intent(in) :: dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dlam,dTlam,dkap,dTk,dlamN(3,3),dTLN(3,3),         & 
& dYu(3,3),dTu(3,3),dYv(3,3),dTv(3,3),dmq2(3,3),dml2(3,3),dmd2(3,3),dmu2(3,3),           & 
& dme2(3,3),dmv2(3,3),dM1,dM2,dM3,dpG,dZD(6,6),dZVI(6,6),dZVR(6,6),dZU(6,6),             & 
& dZE(6,6),dZN(5,5),dUV(6,6),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3),dZDL(3,3),            & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhcVWmVWm1(3,3),cplAhAhhh(3,3,3),cplAhAhHpmcHpm1(3,3,2,2),      & 
& cplAhcHpmVPVWm1(3,2),cplAhcHpmVWm(3,2),cplAhcHpmVWmVZ1(3,2),cplAhhhhh(3,3,3),          & 
& cplAhhhHpmcHpm1(3,3,2,2),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),         & 
& cplAhHpmcVWmVP1(3,2),cplAhHpmcVWmVZ1(3,2),cplAhHpmSucSdaa(3,2,6,6),cplAhHpmSvImcSe1(3,2,6,6),& 
& cplAhHpmSvRecSe1(3,2,6,6),cplAhSdcHpmcSuaa(3,6,2,6),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),& 
& cplAhSeSvImcHpm1(3,6,6,2),cplAhSeSvRecHpm1(3,6,6,2),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),& 
& cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),   & 
& cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),   & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),   & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6), & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),   & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),       & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),            & 
& cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFeChaSvImL(3,2,6),           & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,5,6), & 
& cplcFeChiSeR(3,5,6),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),          & 
& cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),     & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6), & 
& cplcFuGluSuR(3,6),cplcgAgWpCVWm,cplcgWmgWmAh(3),cplcgWmgWmhh(3),cplcgWmgWmVP,          & 
& cplcgWmgWmVZ,cplcgWmgZHpm(2),cplcgWmgZVWm,cplcgWpCgAcHpm(2),cplcgWpCgWpCAh(3),         & 
& cplcgWpCgWpChh(3),cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgZcHpm(2),cplcgZgAhh(3),       & 
& cplcgZgWmcHpm(2),cplcgZgWpCHpm(2),cplcgZgWpCVWm,cplcgZgZhh(3),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),   & 
& cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),           & 
& cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),       & 
& cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,& 
& cplcVWmVPVPVWm3Q,cplcVWmVPVWm,cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,      & 
& cplcVWmVWmVZ,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplFvChacSeL(6,2,6)

Complex(dp),Intent(in) :: cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),               & 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6), & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVPVWm1(3,2),cplhhcHpmVWm(3,2),            & 
& cplhhcHpmVWmVZ1(3,2),cplhhcVWmVWm(3),cplhhhhcVWmVWm1(3,3),cplhhhhhh(3,3,3),            & 
& cplhhhhHpmcHpm1(3,3,2,2),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhHpmcVWmVP1(3,2),   & 
& cplhhHpmcVWmVZ1(3,2),cplhhHpmSucSdaa(3,2,6,6),cplhhHpmSvImcSe1(3,2,6,6),               & 
& cplhhHpmSvRecSe1(3,2,6,6),cplhhSdcHpmcSuaa(3,6,2,6),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),& 
& cplhhSeSvImcHpm1(3,6,6,2),cplhhSeSvRecHpm1(3,6,6,2),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),& 
& cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhVZVZ(3),cplHpmcHpmcVWmVWm1(2,2),        & 
& cplHpmcHpmVP(2,2),cplHpmcHpmVPVP1(2,2),cplHpmcHpmVPVZ1(2,2),cplHpmcHpmVZ(2,2),         & 
& cplHpmcHpmVZVZ1(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmHpmcHpmcHpm1(2,2,2,2),      & 
& cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),       & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvImSvImcHpm1(2,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),& 
& cplHpmSvRecSe(2,6,6),cplHpmSvReSvRecHpm1(2,6,6,2),cplSdcHpmcSu(6,2,6),cplSdcSdVG(6,6), & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSucVWm(6,6),cplSdcSucVWmVPaa(6,6),               & 
& cplSdcSucVWmVZaa(6,6),cplSdSucSdcSuabab(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),           & 
& cplSdSvImcSecSuaa(6,6,6,6),cplSdSvRecSecSuaa(6,6,6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6), & 
& cplSeSuSvImcSdaa(6,6,6,6),cplSeSuSvRecSdaa(6,6,6,6),cplSeSvImcHpm(6,6,2),              & 
& cplSeSvImcVWm(6,6),cplSeSvImcVWmVP1(6,6),cplSeSvImcVWmVZ1(6,6),cplSeSvImSvImcSe1(6,6,6,6),& 
& cplSeSvImSvRecSe1(6,6,6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSeSvRecVWmVP1(6,6),& 
& cplSeSvRecVWmVZ1(6,6),cplSeSvReSvRecSe1(6,6,6,6),cplSucSdVPVWmaa(6,6),cplSucSdVWm(6,6),& 
& cplSucSdVWmVZaa(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSvImcSeVPVWm1(6,6),& 
& cplSvImcSeVWm(6,6),cplSvImcSeVWmVZ1(6,6),cplSvImSvReVZ(6,6),cplSvRecSeVPVWm1(6,6),     & 
& cplSvRecSeVWm(6,6),cplSvRecSeVWmVZ1(6,6),ctcplAhcHpmVWm(3,2),ctcplAhHpmcHpm(3,2,2),    & 
& ctcplcFuFdcHpmL(3,3,2),ctcplcFuFdcHpmR(3,3,2),ctcplChiChacHpmL(5,2,2),ctcplChiChacHpmR(5,2,2),& 
& ctcplcHpmVPVWm(2),ctcplcHpmVWmVZ(2),ctcplFvFecHpmL(6,3,2),ctcplFvFecHpmR(6,3,2),       & 
& ctcplhhcHpmVWm(3,2),ctcplhhHpmcHpm(3,2,2),ctcplHpmcHpmVP(2,2),ctcplHpmcHpmVZ(2,2),     & 
& ctcplSdcHpmcSu(6,2,6),ctcplSeSvImcHpm(6,6,2),ctcplSeSvRecHpm(6,6,2),GcplAhHpmcHpm(3,2,2),& 
& GcplcHpmVPVWm(2),GcplhhHpmcHpm(3,2,2),GcplHpmcHpmVZ(2,2),GcplHpmcVWmVP(2),             & 
& GosZcplAhHpmcHpm(3,2,2),GosZcplcHpmVPVWm(2),GosZcplhhHpmcHpm(3,2,2),GosZcplHpmcHpmVZ(2,2),& 
& GosZcplHpmcVWmVP(2),GZcplAhHpmcHpm(3,2,2),GZcplcHpmVPVWm(2),GZcplhhHpmcHpm(3,2,2),     & 
& GZcplHpmcHpmVZ(2,2),GZcplHpmcVWmVP(2),ZcplAhcHpmVWm(3,2),ZcplAhHpmcHpm(3,2,2),         & 
& ZcplcFuFdcHpmL(3,3,2),ZcplcFuFdcHpmR(3,3,2),ZcplChiChacHpmL(5,2,2),ZcplChiChacHpmR(5,2,2),& 
& ZcplcHpmVWmVZ(2),ZcplFvFecHpmL(6,3,2),ZcplFvFecHpmR(6,3,2),ZcplhhcHpmVWm(3,2),         & 
& ZcplhhHpmcHpm(3,2,2),ZcplHpmcHpmVZ(2,2),ZcplSdcHpmcSu(6,2,6),ZcplSeSvImcHpm(6,6,2),    & 
& ZcplSeSvRecHpm(6,6,2)

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd(6,6),ZfSvIm(6,6),ZfSvRe(6,6),ZfSu(6,6),ZfSe(6,6),      & 
& Zfhh(3,3),ZfAh(3,3),ZfHpm(2,2),ZfL0(5,5),ZfFV(6,6),ZfLm(2,2),ZfLp(2,2),ZfFEL(3,3),     & 
& ZfFER(3,3),ZfFDL(3,3),ZfFDR(3,3),ZfFUL(3,3),ZfFUR(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MSdOS(6),MSd2OS(6),MSvImOS(6),MSvIm2OS(6),MSvReOS(6),MSvRe2OS(6),MSuOS(6),            & 
& MSu2OS(6),MSeOS(6),MSe2OS(6),MhhOS(3),Mhh2OS(3),MAhOS(3),MAh2OS(3),MHpmOS(2),          & 
& MHpm2OS(2),MChiOS(5),MChi2OS(5),MFvOS(6),MFv2OS(6),MChaOS(2),MCha2OS(2),               & 
& MFeOS(3),MFe2OS(3),MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MGluOS,MGlu2OS,               & 
& MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZHOS(3,3),ZAOS(3,3),ZPOS(2,2)

Complex(dp),Intent(in) :: ZDOS(6,6),ZVIOS(6,6),ZVROS(6,6),ZUOS(6,6),ZEOS(6,6),ZNOS(5,5),UVOS(6,6),              & 
& UMOS(2,2),UPOS(2,2),ZELOS(3,3),ZEROS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),            & 
& ZUROS(3,3)

Complex(dp),Intent(in) :: ZRUZD(6,6),ZRUZVI(6,6),ZRUZVR(6,6),ZRUZU(6,6),ZRUZE(6,6),ZRUZH(3,3),ZRUZA(3,3),       & 
& ZRUZP(2,2),ZRUZN(5,5),ZRUUV(6,6),ZRUUM(2,2),ZRUUP(2,2),ZRUZEL(3,3),ZRUZER(3,3),        & 
& ZRUZDL(3,3),ZRUZDR(3,3),ZRUZUL(3,3),ZRUZUR(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LHpm(2,159) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUZDc(6, 6) 
Complex(dp) :: ZRUZVIc(6, 6) 
Complex(dp) :: ZRUZVRc(6, 6) 
Complex(dp) :: ZRUZUc(6, 6) 
Complex(dp) :: ZRUZEc(6, 6) 
Complex(dp) :: ZRUZHc(3, 3) 
Complex(dp) :: ZRUZAc(3, 3) 
Complex(dp) :: ZRUZPc(2, 2) 
Complex(dp) :: ZRUZNc(5, 5) 
Complex(dp) :: ZRUUVc(6, 6) 
Complex(dp) :: ZRUUMc(2, 2) 
Complex(dp) :: ZRUUPc(2, 2) 
Complex(dp) :: ZRUZELc(3, 3) 
Complex(dp) :: ZRUZERc(3, 3) 
Complex(dp) :: ZRUZDLc(3, 3) 
Complex(dp) :: ZRUZDRc(3, 3) 
Complex(dp) :: ZRUZULc(3, 3) 
Complex(dp) :: ZRUZURc(3, 3) 
Real(dp) :: MRPHpmToHpmAh(2,2,3),MRGHpmToHpmAh(2,2,3), MRPZHpmToHpmAh(2,2,3),MRGZHpmToHpmAh(2,2,3) 
Real(dp) :: MVPHpmToHpmAh(2,2,3) 
Real(dp) :: RMsqTreeHpmToHpmAh(2,2,3),RMsqWaveHpmToHpmAh(2,2,3),RMsqVertexHpmToHpmAh(2,2,3) 
Complex(dp) :: AmpTreeHpmToHpmAh(2,2,3),AmpWaveHpmToHpmAh(2,2,3)=(0._dp,0._dp),AmpVertexHpmToHpmAh(2,2,3)& 
 & ,AmpVertexIRosHpmToHpmAh(2,2,3),AmpVertexIRdrHpmToHpmAh(2,2,3), AmpSumHpmToHpmAh(2,2,3), AmpSum2HpmToHpmAh(2,2,3) 
Complex(dp) :: AmpTreeZHpmToHpmAh(2,2,3),AmpWaveZHpmToHpmAh(2,2,3),AmpVertexZHpmToHpmAh(2,2,3) 
Real(dp) :: AmpSqHpmToHpmAh(2,2,3),  AmpSqTreeHpmToHpmAh(2,2,3) 
Real(dp) :: MRPHpmToAhVWm(2,3),MRGHpmToAhVWm(2,3), MRPZHpmToAhVWm(2,3),MRGZHpmToAhVWm(2,3) 
Real(dp) :: MVPHpmToAhVWm(2,3) 
Real(dp) :: RMsqTreeHpmToAhVWm(2,3),RMsqWaveHpmToAhVWm(2,3),RMsqVertexHpmToAhVWm(2,3) 
Complex(dp) :: AmpTreeHpmToAhVWm(2,2,3),AmpWaveHpmToAhVWm(2,2,3)=(0._dp,0._dp),AmpVertexHpmToAhVWm(2,2,3)& 
 & ,AmpVertexIRosHpmToAhVWm(2,2,3),AmpVertexIRdrHpmToAhVWm(2,2,3), AmpSumHpmToAhVWm(2,2,3), AmpSum2HpmToAhVWm(2,2,3) 
Complex(dp) :: AmpTreeZHpmToAhVWm(2,2,3),AmpWaveZHpmToAhVWm(2,2,3),AmpVertexZHpmToAhVWm(2,2,3) 
Real(dp) :: AmpSqHpmToAhVWm(2,3),  AmpSqTreeHpmToAhVWm(2,3) 
Real(dp) :: MRPHpmToChiCha(2,5,2),MRGHpmToChiCha(2,5,2), MRPZHpmToChiCha(2,5,2),MRGZHpmToChiCha(2,5,2) 
Real(dp) :: MVPHpmToChiCha(2,5,2) 
Real(dp) :: RMsqTreeHpmToChiCha(2,5,2),RMsqWaveHpmToChiCha(2,5,2),RMsqVertexHpmToChiCha(2,5,2) 
Complex(dp) :: AmpTreeHpmToChiCha(2,2,5,2),AmpWaveHpmToChiCha(2,2,5,2)=(0._dp,0._dp),AmpVertexHpmToChiCha(2,2,5,2)& 
 & ,AmpVertexIRosHpmToChiCha(2,2,5,2),AmpVertexIRdrHpmToChiCha(2,2,5,2), AmpSumHpmToChiCha(2,2,5,2), AmpSum2HpmToChiCha(2,2,5,2) 
Complex(dp) :: AmpTreeZHpmToChiCha(2,2,5,2),AmpWaveZHpmToChiCha(2,2,5,2),AmpVertexZHpmToChiCha(2,2,5,2) 
Real(dp) :: AmpSqHpmToChiCha(2,5,2),  AmpSqTreeHpmToChiCha(2,5,2) 
Real(dp) :: MRPHpmTocFuFd(2,3,3),MRGHpmTocFuFd(2,3,3), MRPZHpmTocFuFd(2,3,3),MRGZHpmTocFuFd(2,3,3) 
Real(dp) :: MVPHpmTocFuFd(2,3,3) 
Real(dp) :: RMsqTreeHpmTocFuFd(2,3,3),RMsqWaveHpmTocFuFd(2,3,3),RMsqVertexHpmTocFuFd(2,3,3) 
Complex(dp) :: AmpTreeHpmTocFuFd(2,2,3,3),AmpWaveHpmTocFuFd(2,2,3,3)=(0._dp,0._dp),AmpVertexHpmTocFuFd(2,2,3,3)& 
 & ,AmpVertexIRosHpmTocFuFd(2,2,3,3),AmpVertexIRdrHpmTocFuFd(2,2,3,3), AmpSumHpmTocFuFd(2,2,3,3), AmpSum2HpmTocFuFd(2,2,3,3) 
Complex(dp) :: AmpTreeZHpmTocFuFd(2,2,3,3),AmpWaveZHpmTocFuFd(2,2,3,3),AmpVertexZHpmTocFuFd(2,2,3,3) 
Real(dp) :: AmpSqHpmTocFuFd(2,3,3),  AmpSqTreeHpmTocFuFd(2,3,3) 
Real(dp) :: MRPHpmToFvFe(2,6,3),MRGHpmToFvFe(2,6,3), MRPZHpmToFvFe(2,6,3),MRGZHpmToFvFe(2,6,3) 
Real(dp) :: MVPHpmToFvFe(2,6,3) 
Real(dp) :: RMsqTreeHpmToFvFe(2,6,3),RMsqWaveHpmToFvFe(2,6,3),RMsqVertexHpmToFvFe(2,6,3) 
Complex(dp) :: AmpTreeHpmToFvFe(2,2,6,3),AmpWaveHpmToFvFe(2,2,6,3)=(0._dp,0._dp),AmpVertexHpmToFvFe(2,2,6,3)& 
 & ,AmpVertexIRosHpmToFvFe(2,2,6,3),AmpVertexIRdrHpmToFvFe(2,2,6,3), AmpSumHpmToFvFe(2,2,6,3), AmpSum2HpmToFvFe(2,2,6,3) 
Complex(dp) :: AmpTreeZHpmToFvFe(2,2,6,3),AmpWaveZHpmToFvFe(2,2,6,3),AmpVertexZHpmToFvFe(2,2,6,3) 
Real(dp) :: AmpSqHpmToFvFe(2,6,3),  AmpSqTreeHpmToFvFe(2,6,3) 
Real(dp) :: MRPHpmToHpmhh(2,2,3),MRGHpmToHpmhh(2,2,3), MRPZHpmToHpmhh(2,2,3),MRGZHpmToHpmhh(2,2,3) 
Real(dp) :: MVPHpmToHpmhh(2,2,3) 
Real(dp) :: RMsqTreeHpmToHpmhh(2,2,3),RMsqWaveHpmToHpmhh(2,2,3),RMsqVertexHpmToHpmhh(2,2,3) 
Complex(dp) :: AmpTreeHpmToHpmhh(2,2,3),AmpWaveHpmToHpmhh(2,2,3)=(0._dp,0._dp),AmpVertexHpmToHpmhh(2,2,3)& 
 & ,AmpVertexIRosHpmToHpmhh(2,2,3),AmpVertexIRdrHpmToHpmhh(2,2,3), AmpSumHpmToHpmhh(2,2,3), AmpSum2HpmToHpmhh(2,2,3) 
Complex(dp) :: AmpTreeZHpmToHpmhh(2,2,3),AmpWaveZHpmToHpmhh(2,2,3),AmpVertexZHpmToHpmhh(2,2,3) 
Real(dp) :: AmpSqHpmToHpmhh(2,2,3),  AmpSqTreeHpmToHpmhh(2,2,3) 
Real(dp) :: MRPHpmTohhVWm(2,3),MRGHpmTohhVWm(2,3), MRPZHpmTohhVWm(2,3),MRGZHpmTohhVWm(2,3) 
Real(dp) :: MVPHpmTohhVWm(2,3) 
Real(dp) :: RMsqTreeHpmTohhVWm(2,3),RMsqWaveHpmTohhVWm(2,3),RMsqVertexHpmTohhVWm(2,3) 
Complex(dp) :: AmpTreeHpmTohhVWm(2,2,3),AmpWaveHpmTohhVWm(2,2,3)=(0._dp,0._dp),AmpVertexHpmTohhVWm(2,2,3)& 
 & ,AmpVertexIRosHpmTohhVWm(2,2,3),AmpVertexIRdrHpmTohhVWm(2,2,3), AmpSumHpmTohhVWm(2,2,3), AmpSum2HpmTohhVWm(2,2,3) 
Complex(dp) :: AmpTreeZHpmTohhVWm(2,2,3),AmpWaveZHpmTohhVWm(2,2,3),AmpVertexZHpmTohhVWm(2,2,3) 
Real(dp) :: AmpSqHpmTohhVWm(2,3),  AmpSqTreeHpmTohhVWm(2,3) 
Real(dp) :: MRPHpmToHpmVZ(2,2),MRGHpmToHpmVZ(2,2), MRPZHpmToHpmVZ(2,2),MRGZHpmToHpmVZ(2,2) 
Real(dp) :: MVPHpmToHpmVZ(2,2) 
Real(dp) :: RMsqTreeHpmToHpmVZ(2,2),RMsqWaveHpmToHpmVZ(2,2),RMsqVertexHpmToHpmVZ(2,2) 
Complex(dp) :: AmpTreeHpmToHpmVZ(2,2,2),AmpWaveHpmToHpmVZ(2,2,2)=(0._dp,0._dp),AmpVertexHpmToHpmVZ(2,2,2)& 
 & ,AmpVertexIRosHpmToHpmVZ(2,2,2),AmpVertexIRdrHpmToHpmVZ(2,2,2), AmpSumHpmToHpmVZ(2,2,2), AmpSum2HpmToHpmVZ(2,2,2) 
Complex(dp) :: AmpTreeZHpmToHpmVZ(2,2,2),AmpWaveZHpmToHpmVZ(2,2,2),AmpVertexZHpmToHpmVZ(2,2,2) 
Real(dp) :: AmpSqHpmToHpmVZ(2,2),  AmpSqTreeHpmToHpmVZ(2,2) 
Real(dp) :: MRPHpmTocSuSd(2,6,6),MRGHpmTocSuSd(2,6,6), MRPZHpmTocSuSd(2,6,6),MRGZHpmTocSuSd(2,6,6) 
Real(dp) :: MVPHpmTocSuSd(2,6,6) 
Real(dp) :: RMsqTreeHpmTocSuSd(2,6,6),RMsqWaveHpmTocSuSd(2,6,6),RMsqVertexHpmTocSuSd(2,6,6) 
Complex(dp) :: AmpTreeHpmTocSuSd(2,6,6),AmpWaveHpmTocSuSd(2,6,6)=(0._dp,0._dp),AmpVertexHpmTocSuSd(2,6,6)& 
 & ,AmpVertexIRosHpmTocSuSd(2,6,6),AmpVertexIRdrHpmTocSuSd(2,6,6), AmpSumHpmTocSuSd(2,6,6), AmpSum2HpmTocSuSd(2,6,6) 
Complex(dp) :: AmpTreeZHpmTocSuSd(2,6,6),AmpWaveZHpmTocSuSd(2,6,6),AmpVertexZHpmTocSuSd(2,6,6) 
Real(dp) :: AmpSqHpmTocSuSd(2,6,6),  AmpSqTreeHpmTocSuSd(2,6,6) 
Real(dp) :: MRPHpmToSvImSe(2,6,6),MRGHpmToSvImSe(2,6,6), MRPZHpmToSvImSe(2,6,6),MRGZHpmToSvImSe(2,6,6) 
Real(dp) :: MVPHpmToSvImSe(2,6,6) 
Real(dp) :: RMsqTreeHpmToSvImSe(2,6,6),RMsqWaveHpmToSvImSe(2,6,6),RMsqVertexHpmToSvImSe(2,6,6) 
Complex(dp) :: AmpTreeHpmToSvImSe(2,6,6),AmpWaveHpmToSvImSe(2,6,6)=(0._dp,0._dp),AmpVertexHpmToSvImSe(2,6,6)& 
 & ,AmpVertexIRosHpmToSvImSe(2,6,6),AmpVertexIRdrHpmToSvImSe(2,6,6), AmpSumHpmToSvImSe(2,6,6), AmpSum2HpmToSvImSe(2,6,6) 
Complex(dp) :: AmpTreeZHpmToSvImSe(2,6,6),AmpWaveZHpmToSvImSe(2,6,6),AmpVertexZHpmToSvImSe(2,6,6) 
Real(dp) :: AmpSqHpmToSvImSe(2,6,6),  AmpSqTreeHpmToSvImSe(2,6,6) 
Real(dp) :: MRPHpmToSvReSe(2,6,6),MRGHpmToSvReSe(2,6,6), MRPZHpmToSvReSe(2,6,6),MRGZHpmToSvReSe(2,6,6) 
Real(dp) :: MVPHpmToSvReSe(2,6,6) 
Real(dp) :: RMsqTreeHpmToSvReSe(2,6,6),RMsqWaveHpmToSvReSe(2,6,6),RMsqVertexHpmToSvReSe(2,6,6) 
Complex(dp) :: AmpTreeHpmToSvReSe(2,6,6),AmpWaveHpmToSvReSe(2,6,6)=(0._dp,0._dp),AmpVertexHpmToSvReSe(2,6,6)& 
 & ,AmpVertexIRosHpmToSvReSe(2,6,6),AmpVertexIRdrHpmToSvReSe(2,6,6), AmpSumHpmToSvReSe(2,6,6), AmpSum2HpmToSvReSe(2,6,6) 
Complex(dp) :: AmpTreeZHpmToSvReSe(2,6,6),AmpWaveZHpmToSvReSe(2,6,6),AmpVertexZHpmToSvReSe(2,6,6) 
Real(dp) :: AmpSqHpmToSvReSe(2,6,6),  AmpSqTreeHpmToSvReSe(2,6,6) 
Real(dp) :: MRPHpmToVZVWm(2),MRGHpmToVZVWm(2), MRPZHpmToVZVWm(2),MRGZHpmToVZVWm(2) 
Real(dp) :: MVPHpmToVZVWm(2) 
Real(dp) :: RMsqTreeHpmToVZVWm(2),RMsqWaveHpmToVZVWm(2),RMsqVertexHpmToVZVWm(2) 
Complex(dp) :: AmpTreeHpmToVZVWm(2,2),AmpWaveHpmToVZVWm(2,2)=(0._dp,0._dp),AmpVertexHpmToVZVWm(2,2)& 
 & ,AmpVertexIRosHpmToVZVWm(2,2),AmpVertexIRdrHpmToVZVWm(2,2), AmpSumHpmToVZVWm(2,2), AmpSum2HpmToVZVWm(2,2) 
Complex(dp) :: AmpTreeZHpmToVZVWm(2,2),AmpWaveZHpmToVZVWm(2,2),AmpVertexZHpmToVZVWm(2,2) 
Real(dp) :: AmpSqHpmToVZVWm(2),  AmpSqTreeHpmToVZVWm(2) 
Real(dp) :: MRPHpmToHpmVP(2,2),MRGHpmToHpmVP(2,2), MRPZHpmToHpmVP(2,2),MRGZHpmToHpmVP(2,2) 
Real(dp) :: MVPHpmToHpmVP(2,2) 
Real(dp) :: RMsqTreeHpmToHpmVP(2,2),RMsqWaveHpmToHpmVP(2,2),RMsqVertexHpmToHpmVP(2,2) 
Complex(dp) :: AmpTreeHpmToHpmVP(2,2,2),AmpWaveHpmToHpmVP(2,2,2)=(0._dp,0._dp),AmpVertexHpmToHpmVP(2,2,2)& 
 & ,AmpVertexIRosHpmToHpmVP(2,2,2),AmpVertexIRdrHpmToHpmVP(2,2,2), AmpSumHpmToHpmVP(2,2,2), AmpSum2HpmToHpmVP(2,2,2) 
Complex(dp) :: AmpTreeZHpmToHpmVP(2,2,2),AmpWaveZHpmToHpmVP(2,2,2),AmpVertexZHpmToHpmVP(2,2,2) 
Real(dp) :: AmpSqHpmToHpmVP(2,2),  AmpSqTreeHpmToHpmVP(2,2) 
Real(dp) :: MRPHpmToVPVWm(2),MRGHpmToVPVWm(2), MRPZHpmToVPVWm(2),MRGZHpmToVPVWm(2) 
Real(dp) :: MVPHpmToVPVWm(2) 
Real(dp) :: RMsqTreeHpmToVPVWm(2),RMsqWaveHpmToVPVWm(2),RMsqVertexHpmToVPVWm(2) 
Complex(dp) :: AmpTreeHpmToVPVWm(2,2),AmpWaveHpmToVPVWm(2,2)=(0._dp,0._dp),AmpVertexHpmToVPVWm(2,2)& 
 & ,AmpVertexIRosHpmToVPVWm(2,2),AmpVertexIRdrHpmToVPVWm(2,2), AmpSumHpmToVPVWm(2,2), AmpSum2HpmToVPVWm(2,2) 
Complex(dp) :: AmpTreeZHpmToVPVWm(2,2),AmpWaveZHpmToVPVWm(2,2),AmpVertexZHpmToVPVWm(2,2) 
Real(dp) :: AmpSqHpmToVPVWm(2),  AmpSqTreeHpmToVPVWm(2) 
Write(*,*) "Calculating one-loop decays of Hpm " 
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
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Hpm Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmToHpmAh(cplAhHpmcHpm,MAh,MHpm,MAh2,               & 
& MHpm2,AmpTreeHpmToHpmAh)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmToHpmAh(ZcplAhHpmcHpm,MAh,MHpm,MAh2,              & 
& MHpm2,AmpTreeHpmToHpmAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToHpmAh(MLambda,em,gs,cplAhHpmcHpm,MAhOS,             & 
& MHpmOS,MRPHpmToHpmAh,MRGHpmToHpmAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToHpmAh(MLambda,em,gs,ZcplAhHpmcHpm,MAhOS,            & 
& MHpmOS,MRPHpmToHpmAh,MRGHpmToHpmAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmToHpmAh(MLambda,em,gs,cplAhHpmcHpm,MAh,               & 
& MHpm,MRPHpmToHpmAh,MRGHpmToHpmAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToHpmAh(MLambda,em,gs,ZcplAhHpmcHpm,MAh,              & 
& MHpm,MRPHpmToHpmAh,MRGHpmToHpmAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToHpmAh(cplAhHpmcHpm,ctcplAhHpmcHpm,              & 
& MAh,MAh2,MHpm,MHpm2,ZfAh,ZfHpm,AmpWaveHpmToHpmAh)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToHpmAh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,               & 
& cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,     & 
& cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,    & 
& cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,& 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexHpmToHpmAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmAh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,               & 
& cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,     & 
& cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,    & 
& cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,& 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexIRdrHpmToHpmAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmAh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,        & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,ZcplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,              & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,             & 
& cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,        & 
& cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,     & 
& cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,        & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,             & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhSdcHpmcSuaa,    & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhhhHpmcHpm1,     & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,               & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexIRosHpmToHpmAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmAh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,ZcplAhHpmcHpm,cplAhHpmcVWm,            & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,               & 
& cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,     & 
& cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,    & 
& cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,& 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexIRosHpmToHpmAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmAh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,        & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,             & 
& cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,        & 
& cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,     & 
& cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,        & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,             & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhSdcHpmcSuaa,    & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhhhHpmcHpm1,     & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,               & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexIRosHpmToHpmAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmAh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,               & 
& cplAhHpmSucSdaa,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,     & 
& cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,    & 
& cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,& 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,AmpVertexIRosHpmToHpmAh)

 End if 
 End if 
AmpVertexHpmToHpmAh = AmpVertexHpmToHpmAh -  AmpVertexIRdrHpmToHpmAh! +  AmpVertexIRosHpmToHpmAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmToHpmAh=0._dp 
AmpVertexZHpmToHpmAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToHpmAh(gt2,:,:) = AmpWaveZHpmToHpmAh(gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToHpmAh(gt1,:,:) 
AmpVertexZHpmToHpmAh(gt2,:,:)= AmpVertexZHpmToHpmAh(gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHpmToHpmAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveHpmToHpmAh=AmpWaveZHpmToHpmAh 
AmpVertexHpmToHpmAh= AmpVertexZHpmToHpmAh
! Final State 1 
AmpWaveZHpmToHpmAh=0._dp 
AmpVertexZHpmToHpmAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToHpmAh(:,gt2,:) = AmpWaveZHpmToHpmAh(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToHpmAh(:,gt1,:) 
AmpVertexZHpmToHpmAh(:,gt2,:)= AmpVertexZHpmToHpmAh(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexHpmToHpmAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmToHpmAh=AmpWaveZHpmToHpmAh 
AmpVertexHpmToHpmAh= AmpVertexZHpmToHpmAh
! Final State 2 
AmpWaveZHpmToHpmAh=0._dp 
AmpVertexZHpmToHpmAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHpmToHpmAh(:,:,gt2) = AmpWaveZHpmToHpmAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveHpmToHpmAh(:,:,gt1) 
AmpVertexZHpmToHpmAh(:,:,gt2)= AmpVertexZHpmToHpmAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexHpmToHpmAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmToHpmAh=AmpWaveZHpmToHpmAh 
AmpVertexHpmToHpmAh= AmpVertexZHpmToHpmAh
End if
If (ShiftIRdiv) Then 
AmpVertexHpmToHpmAh = AmpVertexHpmToHpmAh  +  AmpVertexIRosHpmToHpmAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->Hpm Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmToHpmAh = AmpTreeHpmToHpmAh 
 AmpSum2HpmToHpmAh = AmpTreeHpmToHpmAh + 2._dp*AmpWaveHpmToHpmAh + 2._dp*AmpVertexHpmToHpmAh  
Else 
 AmpSumHpmToHpmAh = AmpTreeHpmToHpmAh + AmpWaveHpmToHpmAh + AmpVertexHpmToHpmAh
 AmpSum2HpmToHpmAh = AmpTreeHpmToHpmAh + AmpWaveHpmToHpmAh + AmpVertexHpmToHpmAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToHpmAh = AmpTreeHpmToHpmAh
 AmpSum2HpmToHpmAh = AmpTreeHpmToHpmAh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=2,2
    Do gt3=2,3
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MHpmOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MHpm(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HpmToHpmAh = AmpTreeHpmToHpmAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MAhOS(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),MAh(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmToHpmAh(gt1, gt2, gt3) 
  AmpSum2HpmToHpmAh = 2._dp*AmpWaveHpmToHpmAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MAhOS(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),MAh(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmToHpmAh(gt1, gt2, gt3) 
  AmpSum2HpmToHpmAh = 2._dp*AmpVertexHpmToHpmAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MAhOS(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),MAh(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmToHpmAh(gt1, gt2, gt3) 
  AmpSum2HpmToHpmAh = AmpTreeHpmToHpmAh + 2._dp*AmpWaveHpmToHpmAh + 2._dp*AmpVertexHpmToHpmAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MAhOS(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),MAh(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmToHpmAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmToHpmAh = AmpTreeHpmToHpmAh
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MAhOS(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
  AmpSqTreeHpmToHpmAh(gt1, gt2, gt3) = AmpSqHpmToHpmAh(gt1, gt2, gt3)  
  AmpSum2HpmToHpmAh = + 2._dp*AmpWaveHpmToHpmAh + 2._dp*AmpVertexHpmToHpmAh
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MAhOS(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
  AmpSqHpmToHpmAh(gt1, gt2, gt3) = AmpSqHpmToHpmAh(gt1, gt2, gt3) + AmpSqTreeHpmToHpmAh(gt1, gt2, gt3)  
Else  
  AmpSum2HpmToHpmAh = AmpTreeHpmToHpmAh
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),MAh(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
  AmpSqTreeHpmToHpmAh(gt1, gt2, gt3) = AmpSqHpmToHpmAh(gt1, gt2, gt3)  
  AmpSum2HpmToHpmAh = + 2._dp*AmpWaveHpmToHpmAh + 2._dp*AmpVertexHpmToHpmAh
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),MAh(gt3),AmpSumHpmToHpmAh(gt1, gt2, gt3),AmpSum2HpmToHpmAh(gt1, gt2, gt3),AmpSqHpmToHpmAh(gt1, gt2, gt3)) 
  AmpSqHpmToHpmAh(gt1, gt2, gt3) = AmpSqHpmToHpmAh(gt1, gt2, gt3) + AmpSqTreeHpmToHpmAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHpmToHpmAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmToHpmAh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MHpmOS(gt2),MAhOS(gt3),helfactor*AmpSqHpmToHpmAh(gt1, gt2, gt3))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),MHpm(gt2),MAh(gt3),helfactor*AmpSqHpmToHpmAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPHpmToHpmAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToHpmAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmToHpmAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToHpmAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHpmToHpmAh(gt1, gt2, gt3) + MRGHpmToHpmAh(gt1, gt2, gt3)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHpmToHpmAh(gt1, gt2, gt3) + MRGHpmToHpmAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Ah VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmToAhVWm(cplAhcHpmVWm,MAh,MHpm,MVWm,               & 
& MAh2,MHpm2,MVWm2,AmpTreeHpmToAhVWm)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmToAhVWm(ZcplAhcHpmVWm,MAh,MHpm,MVWm,              & 
& MAh2,MHpm2,MVWm2,AmpTreeHpmToAhVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToAhVWm(MLambda,em,gs,cplAhcHpmVWm,MAhOS,             & 
& MHpmOS,MVWmOS,MRPHpmToAhVWm,MRGHpmToAhVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToAhVWm(MLambda,em,gs,ZcplAhcHpmVWm,MAhOS,            & 
& MHpmOS,MVWmOS,MRPHpmToAhVWm,MRGHpmToAhVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmToAhVWm(MLambda,em,gs,cplAhcHpmVWm,MAh,               & 
& MHpm,MVWm,MRPHpmToAhVWm,MRGHpmToAhVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToAhVWm(MLambda,em,gs,ZcplAhcHpmVWm,MAh,              & 
& MHpm,MVWm,MRPHpmToAhVWm,MRGHpmToAhVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToAhVWm(cplAhcHpmVWm,ctcplAhcHpmVWm,              & 
& MAh,MAh2,MHpm,MHpm2,MVWm,MVWm2,ZfAh,ZfHpm,ZfVWm,AmpWaveHpmToAhVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToAhVWm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgZgWmcHpm,cplcgAgWpCVWm,cplcgZgWpCVWm,    & 
& cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,       & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,     & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexHpmToAhVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToAhVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgZgWmcHpm,cplcgAgWpCVWm,cplcgZgWpCVWm,    & 
& cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,       & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,     & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRdrHpmToAhVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToAhVWm(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,        & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,GosZcplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,           & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,ZcplAhcHpmVWm,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,             & 
& cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,        & 
& cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgZgWmcHpm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,    & 
& cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,               & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRosHpmToAhVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToAhVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,GZcplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& ZcplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgZgWmcHpm,cplcgAgWpCVWm,cplcgZgWpCVWm,    & 
& cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,       & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,   & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRosHpmToAhVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToAhVWm(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,        & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,    & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,GcplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,              & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,             & 
& cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,        & 
& cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgZgWmcHpm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,    & 
& cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,       & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhcHpmVPVWm1,  & 
& cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRosHpmToAhVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToAhVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgZgWmcHpm,cplcgAgWpCVWm,cplcgZgWpCVWm,    & 
& cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,       & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,     & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRosHpmToAhVWm)

 End if 
 End if 
AmpVertexHpmToAhVWm = AmpVertexHpmToAhVWm -  AmpVertexIRdrHpmToAhVWm! +  AmpVertexIRosHpmToAhVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmToAhVWm=0._dp 
AmpVertexZHpmToAhVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToAhVWm(:,gt2,:) = AmpWaveZHpmToAhVWm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToAhVWm(:,gt1,:) 
AmpVertexZHpmToAhVWm(:,gt2,:)= AmpVertexZHpmToAhVWm(:,gt2,:) + ZRUZP(gt2,gt1)*AmpVertexHpmToAhVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmToAhVWm=AmpWaveZHpmToAhVWm 
AmpVertexHpmToAhVWm= AmpVertexZHpmToAhVWm
! Final State 1 
AmpWaveZHpmToAhVWm=0._dp 
AmpVertexZHpmToAhVWm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHpmToAhVWm(:,:,gt2) = AmpWaveZHpmToAhVWm(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveHpmToAhVWm(:,:,gt1) 
AmpVertexZHpmToAhVWm(:,:,gt2)= AmpVertexZHpmToAhVWm(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexHpmToAhVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmToAhVWm=AmpWaveZHpmToAhVWm 
AmpVertexHpmToAhVWm= AmpVertexZHpmToAhVWm
End if
If (ShiftIRdiv) Then 
AmpVertexHpmToAhVWm = AmpVertexHpmToAhVWm  +  AmpVertexIRosHpmToAhVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->Ah VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmToAhVWm = AmpTreeHpmToAhVWm 
 AmpSum2HpmToAhVWm = AmpTreeHpmToAhVWm + 2._dp*AmpWaveHpmToAhVWm + 2._dp*AmpVertexHpmToAhVWm  
Else 
 AmpSumHpmToAhVWm = AmpTreeHpmToAhVWm + AmpWaveHpmToAhVWm + AmpVertexHpmToAhVWm
 AmpSum2HpmToAhVWm = AmpTreeHpmToAhVWm + AmpWaveHpmToAhVWm + AmpVertexHpmToAhVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToAhVWm = AmpTreeHpmToAhVWm
 AmpSum2HpmToAhVWm = AmpTreeHpmToAhVWm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=2,3
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MAhOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MAh(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2HpmToAhVWm = AmpTreeHpmToAhVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MAhOS(gt2),MVWmOS,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),MAh(gt2),MVWm,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmToAhVWm(gt1, gt2) 
  AmpSum2HpmToAhVWm = 2._dp*AmpWaveHpmToAhVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MAhOS(gt2),MVWmOS,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),MAh(gt2),MVWm,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmToAhVWm(gt1, gt2) 
  AmpSum2HpmToAhVWm = 2._dp*AmpVertexHpmToAhVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MAhOS(gt2),MVWmOS,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),MAh(gt2),MVWm,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmToAhVWm(gt1, gt2) 
  AmpSum2HpmToAhVWm = AmpTreeHpmToAhVWm + 2._dp*AmpWaveHpmToAhVWm + 2._dp*AmpVertexHpmToAhVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MAhOS(gt2),MVWmOS,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),MAh(gt2),MVWm,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmToAhVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmToAhVWm = AmpTreeHpmToAhVWm
  Call SquareAmp_StoSV(MHpmOS(gt1),MAhOS(gt2),MVWmOS,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
  AmpSqTreeHpmToAhVWm(gt1, gt2) = AmpSqHpmToAhVWm(gt1, gt2)  
  AmpSum2HpmToAhVWm = + 2._dp*AmpWaveHpmToAhVWm + 2._dp*AmpVertexHpmToAhVWm
  Call SquareAmp_StoSV(MHpmOS(gt1),MAhOS(gt2),MVWmOS,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
  AmpSqHpmToAhVWm(gt1, gt2) = AmpSqHpmToAhVWm(gt1, gt2) + AmpSqTreeHpmToAhVWm(gt1, gt2)  
Else  
  AmpSum2HpmToAhVWm = AmpTreeHpmToAhVWm
  Call SquareAmp_StoSV(MHpm(gt1),MAh(gt2),MVWm,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
  AmpSqTreeHpmToAhVWm(gt1, gt2) = AmpSqHpmToAhVWm(gt1, gt2)  
  AmpSum2HpmToAhVWm = + 2._dp*AmpWaveHpmToAhVWm + 2._dp*AmpVertexHpmToAhVWm
  Call SquareAmp_StoSV(MHpm(gt1),MAh(gt2),MVWm,AmpSumHpmToAhVWm(:,gt1, gt2),AmpSum2HpmToAhVWm(:,gt1, gt2),AmpSqHpmToAhVWm(gt1, gt2)) 
  AmpSqHpmToAhVWm(gt1, gt2) = AmpSqHpmToAhVWm(gt1, gt2) + AmpSqTreeHpmToAhVWm(gt1, gt2)  
End if  
Else  
  AmpSqHpmToAhVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmToAhVWm(gt1, gt2).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MAhOS(gt2),MVWmOS,helfactor*AmpSqHpmToAhVWm(gt1, gt2))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),MAh(gt2),MVWm,helfactor*AmpSqHpmToAhVWm(gt1, gt2))
End if 
If ((Abs(MRPHpmToAhVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHpmToAhVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmToAhVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHpmToAhVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPHpmToAhVWm(gt1, gt2) + MRGHpmToAhVWm(gt1, gt2)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPHpmToAhVWm(gt1, gt2) + MRGHpmToAhVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmToChiCha(cplChiChacHpmL,cplChiChacHpmR,           & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeHpmToChiCha)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmToChiCha(ZcplChiChacHpmL,ZcplChiChacHpmR,         & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeHpmToChiCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToChiCha(MLambda,em,gs,cplChiChacHpmL,cplChiChacHpmR, & 
& MChaOS,MChiOS,MHpmOS,MRPHpmToChiCha,MRGHpmToChiCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToChiCha(MLambda,em,gs,ZcplChiChacHpmL,               & 
& ZcplChiChacHpmR,MChaOS,MChiOS,MHpmOS,MRPHpmToChiCha,MRGHpmToChiCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmToChiCha(MLambda,em,gs,cplChiChacHpmL,cplChiChacHpmR, & 
& MCha,MChi,MHpm,MRPHpmToChiCha,MRGHpmToChiCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToChiCha(MLambda,em,gs,ZcplChiChacHpmL,               & 
& ZcplChiChacHpmR,MCha,MChi,MHpm,MRPHpmToChiCha,MRGHpmToChiCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToChiCha(cplChiChacHpmL,cplChiChacHpmR,           & 
& ctcplChiChacHpmL,ctcplChiChacHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,              & 
& ZfL0,ZfLm,ZfLp,AmpWaveHpmToChiCha)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToChiCha(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,   & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexHpmToChiCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToChiCha(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,   & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRdrHpmToChiCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToChiCha(MAhOS,MChaOS,MChiOS,MFdOS,          & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,ZcplChiChacHpmL,     & 
& ZcplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,               & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,             & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,   & 
& cplFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,         & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmToChiCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToChiCha(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,ZcplChiChacHpmL,     & 
& ZcplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,               & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,             & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,   & 
& cplFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,         & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmToChiCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToChiCha(MAhOS,MChaOS,MChiOS,MFdOS,          & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,   & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmToChiCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToChiCha(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,   & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmToChiCha)

 End if 
 End if 
AmpVertexHpmToChiCha = AmpVertexHpmToChiCha -  AmpVertexIRdrHpmToChiCha! +  AmpVertexIRosHpmToChiCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmToChiCha=0._dp 
AmpVertexZHpmToChiCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToChiCha(:,gt2,:,:) = AmpWaveZHpmToChiCha(:,gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToChiCha(:,gt1,:,:) 
AmpVertexZHpmToChiCha(:,gt2,:,:)= AmpVertexZHpmToChiCha(:,gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHpmToChiCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveHpmToChiCha=AmpWaveZHpmToChiCha 
AmpVertexHpmToChiCha= AmpVertexZHpmToChiCha
! Final State 1 
AmpWaveZHpmToChiCha=0._dp 
AmpVertexZHpmToChiCha=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZHpmToChiCha(1,:,gt2,:) = AmpWaveZHpmToChiCha(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveHpmToChiCha(1,:,gt1,:) 
AmpVertexZHpmToChiCha(1,:,gt2,:)= AmpVertexZHpmToChiCha(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexHpmToChiCha(1,:,gt1,:) 
AmpWaveZHpmToChiCha(2,:,gt2,:) = AmpWaveZHpmToChiCha(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveHpmToChiCha(2,:,gt1,:) 
AmpVertexZHpmToChiCha(2,:,gt2,:)= AmpVertexZHpmToChiCha(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexHpmToChiCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmToChiCha=AmpWaveZHpmToChiCha 
AmpVertexHpmToChiCha= AmpVertexZHpmToChiCha
! Final State 2 
AmpWaveZHpmToChiCha=0._dp 
AmpVertexZHpmToChiCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToChiCha(1,:,:,gt2) = AmpWaveZHpmToChiCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveHpmToChiCha(1,:,:,gt1) 
AmpVertexZHpmToChiCha(1,:,:,gt2)= AmpVertexZHpmToChiCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexHpmToChiCha(1,:,:,gt1) 
AmpWaveZHpmToChiCha(2,:,:,gt2) = AmpWaveZHpmToChiCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveHpmToChiCha(2,:,:,gt1) 
AmpVertexZHpmToChiCha(2,:,:,gt2)= AmpVertexZHpmToChiCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexHpmToChiCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmToChiCha=AmpWaveZHpmToChiCha 
AmpVertexHpmToChiCha= AmpVertexZHpmToChiCha
End if
If (ShiftIRdiv) Then 
AmpVertexHpmToChiCha = AmpVertexHpmToChiCha  +  AmpVertexIRosHpmToChiCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->Chi Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmToChiCha = AmpTreeHpmToChiCha 
 AmpSum2HpmToChiCha = AmpTreeHpmToChiCha + 2._dp*AmpWaveHpmToChiCha + 2._dp*AmpVertexHpmToChiCha  
Else 
 AmpSumHpmToChiCha = AmpTreeHpmToChiCha + AmpWaveHpmToChiCha + AmpVertexHpmToChiCha
 AmpSum2HpmToChiCha = AmpTreeHpmToChiCha + AmpWaveHpmToChiCha + AmpVertexHpmToChiCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToChiCha = AmpTreeHpmToChiCha
 AmpSum2HpmToChiCha = AmpTreeHpmToChiCha 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,5
    Do gt3=1,2
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MChiOS(gt2)+MChaOS(gt3)))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MChi(gt2)+MCha(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HpmToChiCha = AmpTreeHpmToChiCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MChiOS(gt2),MChaOS(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MChi(gt2),MCha(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmToChiCha(gt1, gt2, gt3) 
  AmpSum2HpmToChiCha = 2._dp*AmpWaveHpmToChiCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MChiOS(gt2),MChaOS(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MChi(gt2),MCha(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmToChiCha(gt1, gt2, gt3) 
  AmpSum2HpmToChiCha = 2._dp*AmpVertexHpmToChiCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MChiOS(gt2),MChaOS(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MChi(gt2),MCha(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmToChiCha(gt1, gt2, gt3) 
  AmpSum2HpmToChiCha = AmpTreeHpmToChiCha + 2._dp*AmpWaveHpmToChiCha + 2._dp*AmpVertexHpmToChiCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MChiOS(gt2),MChaOS(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MChi(gt2),MCha(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmToChiCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmToChiCha = AmpTreeHpmToChiCha
  Call SquareAmp_StoFF(MHpmOS(gt1),MChiOS(gt2),MChaOS(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
  AmpSqTreeHpmToChiCha(gt1, gt2, gt3) = AmpSqHpmToChiCha(gt1, gt2, gt3)  
  AmpSum2HpmToChiCha = + 2._dp*AmpWaveHpmToChiCha + 2._dp*AmpVertexHpmToChiCha
  Call SquareAmp_StoFF(MHpmOS(gt1),MChiOS(gt2),MChaOS(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
  AmpSqHpmToChiCha(gt1, gt2, gt3) = AmpSqHpmToChiCha(gt1, gt2, gt3) + AmpSqTreeHpmToChiCha(gt1, gt2, gt3)  
Else  
  AmpSum2HpmToChiCha = AmpTreeHpmToChiCha
  Call SquareAmp_StoFF(MHpm(gt1),MChi(gt2),MCha(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
  AmpSqTreeHpmToChiCha(gt1, gt2, gt3) = AmpSqHpmToChiCha(gt1, gt2, gt3)  
  AmpSum2HpmToChiCha = + 2._dp*AmpWaveHpmToChiCha + 2._dp*AmpVertexHpmToChiCha
  Call SquareAmp_StoFF(MHpm(gt1),MChi(gt2),MCha(gt3),AmpSumHpmToChiCha(:,gt1, gt2, gt3),AmpSum2HpmToChiCha(:,gt1, gt2, gt3),AmpSqHpmToChiCha(gt1, gt2, gt3)) 
  AmpSqHpmToChiCha(gt1, gt2, gt3) = AmpSqHpmToChiCha(gt1, gt2, gt3) + AmpSqTreeHpmToChiCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHpmToChiCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqHpmToChiCha(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MChiOS(gt2),MChaOS(gt3),helfactor*AmpSqHpmToChiCha(gt1, gt2, gt3))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),MChi(gt2),MCha(gt3),helfactor*AmpSqHpmToChiCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPHpmToChiCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToChiCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmToChiCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToChiCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHpmToChiCha(gt1, gt2, gt3) + MRGHpmToChiCha(gt1, gt2, gt3)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHpmToChiCha(gt1, gt2, gt3) + MRGHpmToChiCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmTocFuFd(cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& MFd,MFu,MHpm,MFd2,MFu2,MHpm2,AmpTreeHpmTocFuFd)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmTocFuFd(ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,            & 
& MFd,MFu,MHpm,MFd2,MFu2,MHpm2,AmpTreeHpmTocFuFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmTocFuFd(MLambda,em,gs,cplcFuFdcHpmL,cplcFuFdcHpmR,    & 
& MFdOS,MFuOS,MHpmOS,MRPHpmTocFuFd,MRGHpmTocFuFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmTocFuFd(MLambda,em,gs,ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,  & 
& MFdOS,MFuOS,MHpmOS,MRPHpmTocFuFd,MRGHpmTocFuFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmTocFuFd(MLambda,em,gs,cplcFuFdcHpmL,cplcFuFdcHpmR,    & 
& MFd,MFu,MHpm,MRPHpmTocFuFd,MRGHpmTocFuFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmTocFuFd(MLambda,em,gs,ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,  & 
& MFd,MFu,MHpm,MRPHpmTocFuFd,MRGHpmTocFuFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmTocFuFd(cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,MFd,MFd2,MFu,MFu2,MHpm,MHpm2,ZfFDL,ZfFDR,              & 
& ZfFUL,ZfFUR,ZfHpm,AmpWaveHpmTocFuFd)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmTocFuFd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,      & 
& cplChiFdcSdR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,            & 
& cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexHpmTocFuFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocFuFd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,         & 
& cplcFuFuAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,      & 
& cplChiFdcSdR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,            & 
& cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRdrHpmTocFuFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocFuFd(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpmcHpm,cplAhcHpmVWm,      & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,cplChiFdcSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,         & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmTocFuFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocFuFd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,         & 
& cplcFuFuAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,      & 
& cplChiFdcSdR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,cplcFuFdcVWmL,   & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,            & 
& cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmTocFuFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocFuFd(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpmcHpm,cplAhcHpmVWm,      & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,cplChiFdcSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,         & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmTocFuFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocFuFd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,         & 
& cplcFuFuAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,      & 
& cplChiFdcSdR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,            & 
& cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmTocFuFd)

 End if 
 End if 
AmpVertexHpmTocFuFd = AmpVertexHpmTocFuFd -  AmpVertexIRdrHpmTocFuFd! +  AmpVertexIRosHpmTocFuFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmTocFuFd=0._dp 
AmpVertexZHpmTocFuFd=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmTocFuFd(:,gt2,:,:) = AmpWaveZHpmTocFuFd(:,gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHpmTocFuFd(:,gt1,:,:) 
AmpVertexZHpmTocFuFd(:,gt2,:,:)= AmpVertexZHpmTocFuFd(:,gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHpmTocFuFd(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveHpmTocFuFd=AmpWaveZHpmTocFuFd 
AmpVertexHpmTocFuFd= AmpVertexZHpmTocFuFd
! Final State 1 
AmpWaveZHpmTocFuFd=0._dp 
AmpVertexZHpmTocFuFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHpmTocFuFd(1,:,gt2,:) = AmpWaveZHpmTocFuFd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWaveHpmTocFuFd(1,:,gt1,:) 
AmpVertexZHpmTocFuFd(1,:,gt2,:)= AmpVertexZHpmTocFuFd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexHpmTocFuFd(1,:,gt1,:) 
AmpWaveZHpmTocFuFd(2,:,gt2,:) = AmpWaveZHpmTocFuFd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWaveHpmTocFuFd(2,:,gt1,:) 
AmpVertexZHpmTocFuFd(2,:,gt2,:)= AmpVertexZHpmTocFuFd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexHpmTocFuFd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmTocFuFd=AmpWaveZHpmTocFuFd 
AmpVertexHpmTocFuFd= AmpVertexZHpmTocFuFd
! Final State 2 
AmpWaveZHpmTocFuFd=0._dp 
AmpVertexZHpmTocFuFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHpmTocFuFd(1,:,:,gt2) = AmpWaveZHpmTocFuFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpWaveHpmTocFuFd(1,:,:,gt1) 
AmpVertexZHpmTocFuFd(1,:,:,gt2)= AmpVertexZHpmTocFuFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpVertexHpmTocFuFd(1,:,:,gt1) 
AmpWaveZHpmTocFuFd(2,:,:,gt2) = AmpWaveZHpmTocFuFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpWaveHpmTocFuFd(2,:,:,gt1) 
AmpVertexZHpmTocFuFd(2,:,:,gt2)= AmpVertexZHpmTocFuFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpVertexHpmTocFuFd(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmTocFuFd=AmpWaveZHpmTocFuFd 
AmpVertexHpmTocFuFd= AmpVertexZHpmTocFuFd
End if
If (ShiftIRdiv) Then 
AmpVertexHpmTocFuFd = AmpVertexHpmTocFuFd  +  AmpVertexIRosHpmTocFuFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->bar[Fu] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmTocFuFd = AmpTreeHpmTocFuFd 
 AmpSum2HpmTocFuFd = AmpTreeHpmTocFuFd + 2._dp*AmpWaveHpmTocFuFd + 2._dp*AmpVertexHpmTocFuFd  
Else 
 AmpSumHpmTocFuFd = AmpTreeHpmTocFuFd + AmpWaveHpmTocFuFd + AmpVertexHpmTocFuFd
 AmpSum2HpmTocFuFd = AmpTreeHpmTocFuFd + AmpWaveHpmTocFuFd + AmpVertexHpmTocFuFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmTocFuFd = AmpTreeHpmTocFuFd
 AmpSum2HpmTocFuFd = AmpTreeHpmTocFuFd 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MFuOS(gt2)+MFdOS(gt3)))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MFu(gt2)+MFd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HpmTocFuFd = AmpTreeHpmTocFuFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MFuOS(gt2),MFdOS(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MFu(gt2),MFd(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmTocFuFd(gt1, gt2, gt3) 
  AmpSum2HpmTocFuFd = 2._dp*AmpWaveHpmTocFuFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MFuOS(gt2),MFdOS(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MFu(gt2),MFd(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmTocFuFd(gt1, gt2, gt3) 
  AmpSum2HpmTocFuFd = 2._dp*AmpVertexHpmTocFuFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MFuOS(gt2),MFdOS(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MFu(gt2),MFd(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmTocFuFd(gt1, gt2, gt3) 
  AmpSum2HpmTocFuFd = AmpTreeHpmTocFuFd + 2._dp*AmpWaveHpmTocFuFd + 2._dp*AmpVertexHpmTocFuFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MFuOS(gt2),MFdOS(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MFu(gt2),MFd(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmTocFuFd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmTocFuFd = AmpTreeHpmTocFuFd
  Call SquareAmp_StoFF(MHpmOS(gt1),MFuOS(gt2),MFdOS(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
  AmpSqTreeHpmTocFuFd(gt1, gt2, gt3) = AmpSqHpmTocFuFd(gt1, gt2, gt3)  
  AmpSum2HpmTocFuFd = + 2._dp*AmpWaveHpmTocFuFd + 2._dp*AmpVertexHpmTocFuFd
  Call SquareAmp_StoFF(MHpmOS(gt1),MFuOS(gt2),MFdOS(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
  AmpSqHpmTocFuFd(gt1, gt2, gt3) = AmpSqHpmTocFuFd(gt1, gt2, gt3) + AmpSqTreeHpmTocFuFd(gt1, gt2, gt3)  
Else  
  AmpSum2HpmTocFuFd = AmpTreeHpmTocFuFd
  Call SquareAmp_StoFF(MHpm(gt1),MFu(gt2),MFd(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
  AmpSqTreeHpmTocFuFd(gt1, gt2, gt3) = AmpSqHpmTocFuFd(gt1, gt2, gt3)  
  AmpSum2HpmTocFuFd = + 2._dp*AmpWaveHpmTocFuFd + 2._dp*AmpVertexHpmTocFuFd
  Call SquareAmp_StoFF(MHpm(gt1),MFu(gt2),MFd(gt3),AmpSumHpmTocFuFd(:,gt1, gt2, gt3),AmpSum2HpmTocFuFd(:,gt1, gt2, gt3),AmpSqHpmTocFuFd(gt1, gt2, gt3)) 
  AmpSqHpmTocFuFd(gt1, gt2, gt3) = AmpSqHpmTocFuFd(gt1, gt2, gt3) + AmpSqTreeHpmTocFuFd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHpmTocFuFd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqHpmTocFuFd(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 3._dp*GammaTPS(MHpmOS(gt1),MFuOS(gt2),MFdOS(gt3),helfactor*AmpSqHpmTocFuFd(gt1, gt2, gt3))
Else 
  gP1LHpm(gt1,i4) = 3._dp*GammaTPS(MHpm(gt1),MFu(gt2),MFd(gt3),helfactor*AmpSqHpmTocFuFd(gt1, gt2, gt3))
End if 
If ((Abs(MRPHpmTocFuFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmTocFuFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmTocFuFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmTocFuFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHpmTocFuFd(gt1, gt2, gt3) + MRGHpmTocFuFd(gt1, gt2, gt3)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHpmTocFuFd(gt1, gt2, gt3) + MRGHpmTocFuFd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmToFvFe(cplFvFecHpmL,cplFvFecHpmR,MFe,             & 
& MFv,MHpm,MFe2,MFv2,MHpm2,AmpTreeHpmToFvFe)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmToFvFe(ZcplFvFecHpmL,ZcplFvFecHpmR,               & 
& MFe,MFv,MHpm,MFe2,MFv2,MHpm2,AmpTreeHpmToFvFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToFvFe(MLambda,em,gs,cplFvFecHpmL,cplFvFecHpmR,       & 
& MFeOS,MFvOS,MHpmOS,MRPHpmToFvFe,MRGHpmToFvFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToFvFe(MLambda,em,gs,ZcplFvFecHpmL,ZcplFvFecHpmR,     & 
& MFeOS,MFvOS,MHpmOS,MRPHpmToFvFe,MRGHpmToFvFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmToFvFe(MLambda,em,gs,cplFvFecHpmL,cplFvFecHpmR,       & 
& MFe,MFv,MHpm,MRPHpmToFvFe,MRGHpmToFvFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToFvFe(MLambda,em,gs,ZcplFvFecHpmL,ZcplFvFecHpmR,     & 
& MFe,MFv,MHpm,MRPHpmToFvFe,MRGHpmToFvFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToFvFe(cplFvFecHpmL,cplFvFecHpmR,ctcplFvFecHpmL,  & 
& ctcplFvFecHpmR,MFe,MFe2,MFv,MFv2,MHpm,MHpm2,ZfFEL,ZfFER,ZfFV,ZfHpm,AmpWaveHpmToFvFe)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToFvFe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,     & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexHpmToFvFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToFvFe(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,     & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRdrHpmToFvFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToFvFe(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhHpmcHpm,cplAhcHpmVWm,        & 
& cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,ZcplFvFecHpmL,ZcplFvFecHpmR,   & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,         & 
& cplHpmcHpmVZ,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmToFvFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToFvFe(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,     & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& ZcplFvFecHpmL,ZcplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmToFvFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToFvFe(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhHpmcHpm,cplAhcHpmVWm,        & 
& cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,         & 
& cplHpmcHpmVZ,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmToFvFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToFvFe(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,cplFvChacSeR,     & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSeSvImcHpm,cplSeSvRecHpm,       & 
& cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosHpmToFvFe)

 End if 
 End if 
AmpVertexHpmToFvFe = AmpVertexHpmToFvFe -  AmpVertexIRdrHpmToFvFe! +  AmpVertexIRosHpmToFvFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmToFvFe=0._dp 
AmpVertexZHpmToFvFe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToFvFe(:,gt2,:,:) = AmpWaveZHpmToFvFe(:,gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToFvFe(:,gt1,:,:) 
AmpVertexZHpmToFvFe(:,gt2,:,:)= AmpVertexZHpmToFvFe(:,gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHpmToFvFe(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveHpmToFvFe=AmpWaveZHpmToFvFe 
AmpVertexHpmToFvFe= AmpVertexZHpmToFvFe
! Final State 1 
AmpWaveZHpmToFvFe=0._dp 
AmpVertexZHpmToFvFe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZHpmToFvFe(1,:,gt2,:) = AmpWaveZHpmToFvFe(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveHpmToFvFe(1,:,gt1,:) 
AmpVertexZHpmToFvFe(1,:,gt2,:)= AmpVertexZHpmToFvFe(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexHpmToFvFe(1,:,gt1,:) 
AmpWaveZHpmToFvFe(2,:,gt2,:) = AmpWaveZHpmToFvFe(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveHpmToFvFe(2,:,gt1,:) 
AmpVertexZHpmToFvFe(2,:,gt2,:)= AmpVertexZHpmToFvFe(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexHpmToFvFe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmToFvFe=AmpWaveZHpmToFvFe 
AmpVertexHpmToFvFe= AmpVertexZHpmToFvFe
! Final State 2 
AmpWaveZHpmToFvFe=0._dp 
AmpVertexZHpmToFvFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHpmToFvFe(1,:,:,gt2) = AmpWaveZHpmToFvFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpWaveHpmToFvFe(1,:,:,gt1) 
AmpVertexZHpmToFvFe(1,:,:,gt2)= AmpVertexZHpmToFvFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpVertexHpmToFvFe(1,:,:,gt1) 
AmpWaveZHpmToFvFe(2,:,:,gt2) = AmpWaveZHpmToFvFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpWaveHpmToFvFe(2,:,:,gt1) 
AmpVertexZHpmToFvFe(2,:,:,gt2)= AmpVertexZHpmToFvFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpVertexHpmToFvFe(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmToFvFe=AmpWaveZHpmToFvFe 
AmpVertexHpmToFvFe= AmpVertexZHpmToFvFe
End if
If (ShiftIRdiv) Then 
AmpVertexHpmToFvFe = AmpVertexHpmToFvFe  +  AmpVertexIRosHpmToFvFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->Fv Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmToFvFe = AmpTreeHpmToFvFe 
 AmpSum2HpmToFvFe = AmpTreeHpmToFvFe + 2._dp*AmpWaveHpmToFvFe + 2._dp*AmpVertexHpmToFvFe  
Else 
 AmpSumHpmToFvFe = AmpTreeHpmToFvFe + AmpWaveHpmToFvFe + AmpVertexHpmToFvFe
 AmpSum2HpmToFvFe = AmpTreeHpmToFvFe + AmpWaveHpmToFvFe + AmpVertexHpmToFvFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToFvFe = AmpTreeHpmToFvFe
 AmpSum2HpmToFvFe = AmpTreeHpmToFvFe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,6
    Do gt3=1,3
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MFvOS(gt2)+MFeOS(gt3)))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MFv(gt2)+MFe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HpmToFvFe = AmpTreeHpmToFvFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MFvOS(gt2),MFeOS(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MFv(gt2),MFe(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmToFvFe(gt1, gt2, gt3) 
  AmpSum2HpmToFvFe = 2._dp*AmpWaveHpmToFvFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MFvOS(gt2),MFeOS(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MFv(gt2),MFe(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmToFvFe(gt1, gt2, gt3) 
  AmpSum2HpmToFvFe = 2._dp*AmpVertexHpmToFvFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MFvOS(gt2),MFeOS(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MFv(gt2),MFe(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmToFvFe(gt1, gt2, gt3) 
  AmpSum2HpmToFvFe = AmpTreeHpmToFvFe + 2._dp*AmpWaveHpmToFvFe + 2._dp*AmpVertexHpmToFvFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHpmOS(gt1),MFvOS(gt2),MFeOS(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHpm(gt1),MFv(gt2),MFe(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmToFvFe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmToFvFe = AmpTreeHpmToFvFe
  Call SquareAmp_StoFF(MHpmOS(gt1),MFvOS(gt2),MFeOS(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
  AmpSqTreeHpmToFvFe(gt1, gt2, gt3) = AmpSqHpmToFvFe(gt1, gt2, gt3)  
  AmpSum2HpmToFvFe = + 2._dp*AmpWaveHpmToFvFe + 2._dp*AmpVertexHpmToFvFe
  Call SquareAmp_StoFF(MHpmOS(gt1),MFvOS(gt2),MFeOS(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
  AmpSqHpmToFvFe(gt1, gt2, gt3) = AmpSqHpmToFvFe(gt1, gt2, gt3) + AmpSqTreeHpmToFvFe(gt1, gt2, gt3)  
Else  
  AmpSum2HpmToFvFe = AmpTreeHpmToFvFe
  Call SquareAmp_StoFF(MHpm(gt1),MFv(gt2),MFe(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
  AmpSqTreeHpmToFvFe(gt1, gt2, gt3) = AmpSqHpmToFvFe(gt1, gt2, gt3)  
  AmpSum2HpmToFvFe = + 2._dp*AmpWaveHpmToFvFe + 2._dp*AmpVertexHpmToFvFe
  Call SquareAmp_StoFF(MHpm(gt1),MFv(gt2),MFe(gt3),AmpSumHpmToFvFe(:,gt1, gt2, gt3),AmpSum2HpmToFvFe(:,gt1, gt2, gt3),AmpSqHpmToFvFe(gt1, gt2, gt3)) 
  AmpSqHpmToFvFe(gt1, gt2, gt3) = AmpSqHpmToFvFe(gt1, gt2, gt3) + AmpSqTreeHpmToFvFe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHpmToFvFe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqHpmToFvFe(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MFvOS(gt2),MFeOS(gt3),helfactor*AmpSqHpmToFvFe(gt1, gt2, gt3))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),MFv(gt2),MFe(gt3),helfactor*AmpSqHpmToFvFe(gt1, gt2, gt3))
End if 
If ((Abs(MRPHpmToFvFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToFvFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmToFvFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToFvFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHpmToFvFe(gt1, gt2, gt3) + MRGHpmToFvFe(gt1, gt2, gt3)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHpmToFvFe(gt1, gt2, gt3) + MRGHpmToFvFe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Hpm hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmToHpmhh(cplhhHpmcHpm,Mhh,MHpm,Mhh2,               & 
& MHpm2,AmpTreeHpmToHpmhh)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmToHpmhh(ZcplhhHpmcHpm,Mhh,MHpm,Mhh2,              & 
& MHpm2,AmpTreeHpmToHpmhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToHpmhh(MLambda,em,gs,cplhhHpmcHpm,MhhOS,             & 
& MHpmOS,MRPHpmToHpmhh,MRGHpmToHpmhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToHpmhh(MLambda,em,gs,ZcplhhHpmcHpm,MhhOS,            & 
& MHpmOS,MRPHpmToHpmhh,MRGHpmToHpmhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmToHpmhh(MLambda,em,gs,cplhhHpmcHpm,Mhh,               & 
& MHpm,MRPHpmToHpmhh,MRGHpmToHpmhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToHpmhh(MLambda,em,gs,ZcplhhHpmcHpm,Mhh,              & 
& MHpm,MRPHpmToHpmhh,MRGHpmToHpmhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToHpmhh(cplhhHpmcHpm,ctcplhhHpmcHpm,              & 
& Mhh,Mhh2,MHpm,MHpm2,Zfhh,ZfHpm,AmpWaveHpmToHpmhh)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToHpmhh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
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
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexHpmToHpmhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmhh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
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
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRdrHpmToHpmhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmhh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
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
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRosHpmToHpmhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmhh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
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
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRosHpmToHpmhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmhh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
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
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRosHpmToHpmhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmhh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
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
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,AmpVertexIRosHpmToHpmhh)

 End if 
 End if 
AmpVertexHpmToHpmhh = AmpVertexHpmToHpmhh -  AmpVertexIRdrHpmToHpmhh! +  AmpVertexIRosHpmToHpmhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmToHpmhh=0._dp 
AmpVertexZHpmToHpmhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToHpmhh(gt2,:,:) = AmpWaveZHpmToHpmhh(gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToHpmhh(gt1,:,:) 
AmpVertexZHpmToHpmhh(gt2,:,:)= AmpVertexZHpmToHpmhh(gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHpmToHpmhh(gt1,:,:) 
 End Do 
End Do 
AmpWaveHpmToHpmhh=AmpWaveZHpmToHpmhh 
AmpVertexHpmToHpmhh= AmpVertexZHpmToHpmhh
! Final State 1 
AmpWaveZHpmToHpmhh=0._dp 
AmpVertexZHpmToHpmhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToHpmhh(:,gt2,:) = AmpWaveZHpmToHpmhh(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToHpmhh(:,gt1,:) 
AmpVertexZHpmToHpmhh(:,gt2,:)= AmpVertexZHpmToHpmhh(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexHpmToHpmhh(:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmToHpmhh=AmpWaveZHpmToHpmhh 
AmpVertexHpmToHpmhh= AmpVertexZHpmToHpmhh
! Final State 2 
AmpWaveZHpmToHpmhh=0._dp 
AmpVertexZHpmToHpmhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHpmToHpmhh(:,:,gt2) = AmpWaveZHpmToHpmhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveHpmToHpmhh(:,:,gt1) 
AmpVertexZHpmToHpmhh(:,:,gt2)= AmpVertexZHpmToHpmhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexHpmToHpmhh(:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmToHpmhh=AmpWaveZHpmToHpmhh 
AmpVertexHpmToHpmhh= AmpVertexZHpmToHpmhh
End if
If (ShiftIRdiv) Then 
AmpVertexHpmToHpmhh = AmpVertexHpmToHpmhh  +  AmpVertexIRosHpmToHpmhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->Hpm hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmToHpmhh = AmpTreeHpmToHpmhh 
 AmpSum2HpmToHpmhh = AmpTreeHpmToHpmhh + 2._dp*AmpWaveHpmToHpmhh + 2._dp*AmpVertexHpmToHpmhh  
Else 
 AmpSumHpmToHpmhh = AmpTreeHpmToHpmhh + AmpWaveHpmToHpmhh + AmpVertexHpmToHpmhh
 AmpSum2HpmToHpmhh = AmpTreeHpmToHpmhh + AmpWaveHpmToHpmhh + AmpVertexHpmToHpmhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToHpmhh = AmpTreeHpmToHpmhh
 AmpSum2HpmToHpmhh = AmpTreeHpmToHpmhh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=2,2
    Do gt3=1,3
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MHpmOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MHpm(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HpmToHpmhh = AmpTreeHpmToHpmhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MhhOS(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),Mhh(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmToHpmhh(gt1, gt2, gt3) 
  AmpSum2HpmToHpmhh = 2._dp*AmpWaveHpmToHpmhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MhhOS(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),Mhh(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmToHpmhh(gt1, gt2, gt3) 
  AmpSum2HpmToHpmhh = 2._dp*AmpVertexHpmToHpmhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MhhOS(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),Mhh(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmToHpmhh(gt1, gt2, gt3) 
  AmpSum2HpmToHpmhh = AmpTreeHpmToHpmhh + 2._dp*AmpWaveHpmToHpmhh + 2._dp*AmpVertexHpmToHpmhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MhhOS(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),Mhh(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmToHpmhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmToHpmhh = AmpTreeHpmToHpmhh
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MhhOS(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
  AmpSqTreeHpmToHpmhh(gt1, gt2, gt3) = AmpSqHpmToHpmhh(gt1, gt2, gt3)  
  AmpSum2HpmToHpmhh = + 2._dp*AmpWaveHpmToHpmhh + 2._dp*AmpVertexHpmToHpmhh
  Call SquareAmp_StoSS(MHpmOS(gt1),MHpmOS(gt2),MhhOS(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
  AmpSqHpmToHpmhh(gt1, gt2, gt3) = AmpSqHpmToHpmhh(gt1, gt2, gt3) + AmpSqTreeHpmToHpmhh(gt1, gt2, gt3)  
Else  
  AmpSum2HpmToHpmhh = AmpTreeHpmToHpmhh
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),Mhh(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
  AmpSqTreeHpmToHpmhh(gt1, gt2, gt3) = AmpSqHpmToHpmhh(gt1, gt2, gt3)  
  AmpSum2HpmToHpmhh = + 2._dp*AmpWaveHpmToHpmhh + 2._dp*AmpVertexHpmToHpmhh
  Call SquareAmp_StoSS(MHpm(gt1),MHpm(gt2),Mhh(gt3),AmpSumHpmToHpmhh(gt1, gt2, gt3),AmpSum2HpmToHpmhh(gt1, gt2, gt3),AmpSqHpmToHpmhh(gt1, gt2, gt3)) 
  AmpSqHpmToHpmhh(gt1, gt2, gt3) = AmpSqHpmToHpmhh(gt1, gt2, gt3) + AmpSqTreeHpmToHpmhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHpmToHpmhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmToHpmhh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MHpmOS(gt2),MhhOS(gt3),helfactor*AmpSqHpmToHpmhh(gt1, gt2, gt3))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),MHpm(gt2),Mhh(gt3),helfactor*AmpSqHpmToHpmhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPHpmToHpmhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToHpmhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmToHpmhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToHpmhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHpmToHpmhh(gt1, gt2, gt3) + MRGHpmToHpmhh(gt1, gt2, gt3)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHpmToHpmhh(gt1, gt2, gt3) + MRGHpmToHpmhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmTohhVWm(cplhhcHpmVWm,Mhh,MHpm,MVWm,               & 
& Mhh2,MHpm2,MVWm2,AmpTreeHpmTohhVWm)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmTohhVWm(ZcplhhcHpmVWm,Mhh,MHpm,MVWm,              & 
& Mhh2,MHpm2,MVWm2,AmpTreeHpmTohhVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmTohhVWm(MLambda,em,gs,cplhhcHpmVWm,MhhOS,             & 
& MHpmOS,MVWmOS,MRPHpmTohhVWm,MRGHpmTohhVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmTohhVWm(MLambda,em,gs,ZcplhhcHpmVWm,MhhOS,            & 
& MHpmOS,MVWmOS,MRPHpmTohhVWm,MRGHpmTohhVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmTohhVWm(MLambda,em,gs,cplhhcHpmVWm,Mhh,               & 
& MHpm,MVWm,MRPHpmTohhVWm,MRGHpmTohhVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmTohhVWm(MLambda,em,gs,ZcplhhcHpmVWm,Mhh,              & 
& MHpm,MVWm,MRPHpmTohhVWm,MRGHpmTohhVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmTohhVWm(cplhhcHpmVWm,ctcplhhcHpmVWm,              & 
& Mhh,Mhh2,MHpm,MHpm2,MVWm,MVWm2,Zfhh,ZfHpm,ZfVWm,AmpWaveHpmTohhVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmTohhVWm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWpCgAcHpm,             & 
& cplcgWmgWmhh,cplcgZgWmcHpm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh,      & 
& cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,           & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhhhcVWmVWm1,cplhhcHpmVPVWm1,             & 
& cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexHpmTohhVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTohhVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWpCgAcHpm,             & 
& cplcgWmgWmhh,cplcgZgWmcHpm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh,      & 
& cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,           & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhhhcVWmVWm1,cplhhcHpmVPVWm1,             & 
& cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRdrHpmTohhVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTohhVWm(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,        & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChahhL,       & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWpCgAcHpm,cplcgWmgWmhh,           & 
& cplcgZgWmcHpm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh,cplcgWmgZVWm,      & 
& cplcgWpCgZcHpm,cplhhhhhh,GosZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,          & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,ZcplhhcHpmVWm,cplhhcVWmVWm,       & 
& cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,          & 
& cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhhhcVWmVWm1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,          & 
& cplHpmcHpmcVWmVWm1,AmpVertexIRosHpmTohhVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTohhVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWpCgAcHpm,             & 
& cplcgWmgWmhh,cplcgZgWmcHpm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh,      & 
& cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhhhhh,GZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,ZcplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,           & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,GZcplcHpmVPVWm,cplcVWmVPVWm,     & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhhhcVWmVWm1,cplhhcHpmVPVWm1,             & 
& cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRosHpmTohhVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTohhVWm(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplAhhhhh,        & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChahhL,       & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWpCgAcHpm,cplcgWmgWmhh,           & 
& cplcgZgWmcHpm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh,cplcgWmgZVWm,      & 
& cplcgWpCgZcHpm,cplhhhhhh,GcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,        & 
& cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,          & 
& cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,       & 
& cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhhhcVWmVWm1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,          & 
& cplHpmcHpmcVWmVWm1,AmpVertexIRosHpmTohhVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTohhVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWpCgAcHpm,             & 
& cplcgWmgWmhh,cplcgZgWmcHpm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh,      & 
& cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,            & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,           & 
& cplSeSvRecHpm,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhhhcVWmVWm1,cplhhcHpmVPVWm1,             & 
& cplhhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRosHpmTohhVWm)

 End if 
 End if 
AmpVertexHpmTohhVWm = AmpVertexHpmTohhVWm -  AmpVertexIRdrHpmTohhVWm! +  AmpVertexIRosHpmTohhVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmTohhVWm=0._dp 
AmpVertexZHpmTohhVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmTohhVWm(:,gt2,:) = AmpWaveZHpmTohhVWm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveHpmTohhVWm(:,gt1,:) 
AmpVertexZHpmTohhVWm(:,gt2,:)= AmpVertexZHpmTohhVWm(:,gt2,:) + ZRUZP(gt2,gt1)*AmpVertexHpmTohhVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmTohhVWm=AmpWaveZHpmTohhVWm 
AmpVertexHpmTohhVWm= AmpVertexZHpmTohhVWm
! Final State 1 
AmpWaveZHpmTohhVWm=0._dp 
AmpVertexZHpmTohhVWm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHpmTohhVWm(:,:,gt2) = AmpWaveZHpmTohhVWm(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveHpmTohhVWm(:,:,gt1) 
AmpVertexZHpmTohhVWm(:,:,gt2)= AmpVertexZHpmTohhVWm(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexHpmTohhVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmTohhVWm=AmpWaveZHpmTohhVWm 
AmpVertexHpmTohhVWm= AmpVertexZHpmTohhVWm
End if
If (ShiftIRdiv) Then 
AmpVertexHpmTohhVWm = AmpVertexHpmTohhVWm  +  AmpVertexIRosHpmTohhVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->hh VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmTohhVWm = AmpTreeHpmTohhVWm 
 AmpSum2HpmTohhVWm = AmpTreeHpmTohhVWm + 2._dp*AmpWaveHpmTohhVWm + 2._dp*AmpVertexHpmTohhVWm  
Else 
 AmpSumHpmTohhVWm = AmpTreeHpmTohhVWm + AmpWaveHpmTohhVWm + AmpVertexHpmTohhVWm
 AmpSum2HpmTohhVWm = AmpTreeHpmTohhVWm + AmpWaveHpmTohhVWm + AmpVertexHpmTohhVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmTohhVWm = AmpTreeHpmTohhVWm
 AmpSum2HpmTohhVWm = AmpTreeHpmTohhVWm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MhhOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(Mhh(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2HpmTohhVWm = AmpTreeHpmTohhVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MhhOS(gt2),MVWmOS,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),Mhh(gt2),MVWm,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmTohhVWm(gt1, gt2) 
  AmpSum2HpmTohhVWm = 2._dp*AmpWaveHpmTohhVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MhhOS(gt2),MVWmOS,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),Mhh(gt2),MVWm,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmTohhVWm(gt1, gt2) 
  AmpSum2HpmTohhVWm = 2._dp*AmpVertexHpmTohhVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MhhOS(gt2),MVWmOS,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),Mhh(gt2),MVWm,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmTohhVWm(gt1, gt2) 
  AmpSum2HpmTohhVWm = AmpTreeHpmTohhVWm + 2._dp*AmpWaveHpmTohhVWm + 2._dp*AmpVertexHpmTohhVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MhhOS(gt2),MVWmOS,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),Mhh(gt2),MVWm,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmTohhVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmTohhVWm = AmpTreeHpmTohhVWm
  Call SquareAmp_StoSV(MHpmOS(gt1),MhhOS(gt2),MVWmOS,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
  AmpSqTreeHpmTohhVWm(gt1, gt2) = AmpSqHpmTohhVWm(gt1, gt2)  
  AmpSum2HpmTohhVWm = + 2._dp*AmpWaveHpmTohhVWm + 2._dp*AmpVertexHpmTohhVWm
  Call SquareAmp_StoSV(MHpmOS(gt1),MhhOS(gt2),MVWmOS,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
  AmpSqHpmTohhVWm(gt1, gt2) = AmpSqHpmTohhVWm(gt1, gt2) + AmpSqTreeHpmTohhVWm(gt1, gt2)  
Else  
  AmpSum2HpmTohhVWm = AmpTreeHpmTohhVWm
  Call SquareAmp_StoSV(MHpm(gt1),Mhh(gt2),MVWm,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
  AmpSqTreeHpmTohhVWm(gt1, gt2) = AmpSqHpmTohhVWm(gt1, gt2)  
  AmpSum2HpmTohhVWm = + 2._dp*AmpWaveHpmTohhVWm + 2._dp*AmpVertexHpmTohhVWm
  Call SquareAmp_StoSV(MHpm(gt1),Mhh(gt2),MVWm,AmpSumHpmTohhVWm(:,gt1, gt2),AmpSum2HpmTohhVWm(:,gt1, gt2),AmpSqHpmTohhVWm(gt1, gt2)) 
  AmpSqHpmTohhVWm(gt1, gt2) = AmpSqHpmTohhVWm(gt1, gt2) + AmpSqTreeHpmTohhVWm(gt1, gt2)  
End if  
Else  
  AmpSqHpmTohhVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmTohhVWm(gt1, gt2).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MhhOS(gt2),MVWmOS,helfactor*AmpSqHpmTohhVWm(gt1, gt2))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),Mhh(gt2),MVWm,helfactor*AmpSqHpmTohhVWm(gt1, gt2))
End if 
If ((Abs(MRPHpmTohhVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHpmTohhVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmTohhVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHpmTohhVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPHpmTohhVWm(gt1, gt2) + MRGHpmTohhVWm(gt1, gt2)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPHpmTohhVWm(gt1, gt2) + MRGHpmTohhVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Hpm VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmToHpmVZ(cplHpmcHpmVZ,MHpm,MVZ,MHpm2,              & 
& MVZ2,AmpTreeHpmToHpmVZ)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmToHpmVZ(ZcplHpmcHpmVZ,MHpm,MVZ,MHpm2,             & 
& MVZ2,AmpTreeHpmToHpmVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToHpmVZ(MLambda,em,gs,cplHpmcHpmVZ,MHpmOS,            & 
& MVZOS,MRPHpmToHpmVZ,MRGHpmToHpmVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToHpmVZ(MLambda,em,gs,ZcplHpmcHpmVZ,MHpmOS,           & 
& MVZOS,MRPHpmToHpmVZ,MRGHpmToHpmVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmToHpmVZ(MLambda,em,gs,cplHpmcHpmVZ,MHpm,              & 
& MVZ,MRPHpmToHpmVZ,MRGHpmToHpmVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToHpmVZ(MLambda,em,gs,ZcplHpmcHpmVZ,MHpm,             & 
& MVZ,MRPHpmToHpmVZ,MRGHpmToHpmVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToHpmVZ(cplHpmcHpmVP,cplHpmcHpmVZ,ctcplHpmcHpmVP, & 
& ctcplHpmcHpmVZ,MHpm,MHpm2,MVP,MVP2,MVZ,MVZ2,ZfHpm,ZfVPVZ,ZfVZ,AmpWaveHpmToHpmVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToHpmVZ(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,      & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdVZL,     & 
& cplcFdFdVZR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,              & 
& cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgZgWpCHpm,         & 
& cplcgWpCgWpCVZ,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,     & 
& cplhhVZVZ,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,           & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,         & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,       & 
& cplHpmcHpmVZVZ1,AmpVertexHpmToHpmVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,      & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdVZL,     & 
& cplcFdFdVZR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,              & 
& cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgZgWpCHpm,         & 
& cplcgWpCgWpCVZ,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,     & 
& cplhhVZVZ,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,           & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,         & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,       & 
& cplHpmcHpmVZVZ1,AmpVertexIRdrHpmToHpmVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmVZ(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhhhVZ,cplAhHpmcHpm,     & 
& cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWpCgWpCVZ,     & 
& cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplhhVZVZ,          & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,ZcplHpmcHpmVZ,       & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVZ,           & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,       & 
& cplAhcHpmVWmVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplHpmcHpmVZVZ1,       & 
& AmpVertexIRosHpmToHpmVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,      & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdVZL,     & 
& cplcFdFdVZR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,              & 
& cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgZgWpCHpm,         & 
& cplcgWpCgWpCVZ,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,     & 
& cplhhVZVZ,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,           & 
& ZcplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,        & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,       & 
& cplHpmcHpmVZVZ1,AmpVertexIRosHpmToHpmVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmVZ(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhhhVZ,cplAhHpmcHpm,     & 
& cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWpCgWpCVZ,     & 
& cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplhhVZVZ,          & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,        & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVZ,           & 
& cplSucSuVZ,cplSvImSvReVZ,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,       & 
& cplAhcHpmVWmVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplHpmcHpmVZVZ1,       & 
& AmpVertexIRosHpmToHpmVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToHpmVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,      & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdVZL,     & 
& cplcFdFdVZR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,              & 
& cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgZgWpCHpm,         & 
& cplcgWpCgWpCVZ,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,     & 
& cplhhVZVZ,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,           & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,         & 
& cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,            & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,       & 
& cplHpmcHpmVZVZ1,AmpVertexIRosHpmToHpmVZ)

 End if 
 End if 
AmpVertexHpmToHpmVZ = AmpVertexHpmToHpmVZ -  AmpVertexIRdrHpmToHpmVZ! +  AmpVertexIRosHpmToHpmVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmToHpmVZ=0._dp 
AmpVertexZHpmToHpmVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToHpmVZ(:,gt2,:) = AmpWaveZHpmToHpmVZ(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToHpmVZ(:,gt1,:) 
AmpVertexZHpmToHpmVZ(:,gt2,:)= AmpVertexZHpmToHpmVZ(:,gt2,:) + ZRUZP(gt2,gt1)*AmpVertexHpmToHpmVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmToHpmVZ=AmpWaveZHpmToHpmVZ 
AmpVertexHpmToHpmVZ= AmpVertexZHpmToHpmVZ
! Final State 1 
AmpWaveZHpmToHpmVZ=0._dp 
AmpVertexZHpmToHpmVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToHpmVZ(:,:,gt2) = AmpWaveZHpmToHpmVZ(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveHpmToHpmVZ(:,:,gt1) 
AmpVertexZHpmToHpmVZ(:,:,gt2)= AmpVertexZHpmToHpmVZ(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexHpmToHpmVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmToHpmVZ=AmpWaveZHpmToHpmVZ 
AmpVertexHpmToHpmVZ= AmpVertexZHpmToHpmVZ
End if
If (ShiftIRdiv) Then 
AmpVertexHpmToHpmVZ = AmpVertexHpmToHpmVZ  +  AmpVertexIRosHpmToHpmVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->Hpm VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmToHpmVZ = AmpTreeHpmToHpmVZ 
 AmpSum2HpmToHpmVZ = AmpTreeHpmToHpmVZ + 2._dp*AmpWaveHpmToHpmVZ + 2._dp*AmpVertexHpmToHpmVZ  
Else 
 AmpSumHpmToHpmVZ = AmpTreeHpmToHpmVZ + AmpWaveHpmToHpmVZ + AmpVertexHpmToHpmVZ
 AmpSum2HpmToHpmVZ = AmpTreeHpmToHpmVZ + AmpWaveHpmToHpmVZ + AmpVertexHpmToHpmVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToHpmVZ = AmpTreeHpmToHpmVZ
 AmpSum2HpmToHpmVZ = AmpTreeHpmToHpmVZ 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=2,2
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MHpmOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MHpm(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2HpmToHpmVZ = AmpTreeHpmToHpmVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MHpmOS(gt2),MVZOS,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),MHpm(gt2),MVZ,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmToHpmVZ(gt1, gt2) 
  AmpSum2HpmToHpmVZ = 2._dp*AmpWaveHpmToHpmVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MHpmOS(gt2),MVZOS,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),MHpm(gt2),MVZ,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmToHpmVZ(gt1, gt2) 
  AmpSum2HpmToHpmVZ = 2._dp*AmpVertexHpmToHpmVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MHpmOS(gt2),MVZOS,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),MHpm(gt2),MVZ,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmToHpmVZ(gt1, gt2) 
  AmpSum2HpmToHpmVZ = AmpTreeHpmToHpmVZ + 2._dp*AmpWaveHpmToHpmVZ + 2._dp*AmpVertexHpmToHpmVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MHpmOS(gt2),MVZOS,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),MHpm(gt2),MVZ,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmToHpmVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmToHpmVZ = AmpTreeHpmToHpmVZ
  Call SquareAmp_StoSV(MHpmOS(gt1),MHpmOS(gt2),MVZOS,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
  AmpSqTreeHpmToHpmVZ(gt1, gt2) = AmpSqHpmToHpmVZ(gt1, gt2)  
  AmpSum2HpmToHpmVZ = + 2._dp*AmpWaveHpmToHpmVZ + 2._dp*AmpVertexHpmToHpmVZ
  Call SquareAmp_StoSV(MHpmOS(gt1),MHpmOS(gt2),MVZOS,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
  AmpSqHpmToHpmVZ(gt1, gt2) = AmpSqHpmToHpmVZ(gt1, gt2) + AmpSqTreeHpmToHpmVZ(gt1, gt2)  
Else  
  AmpSum2HpmToHpmVZ = AmpTreeHpmToHpmVZ
  Call SquareAmp_StoSV(MHpm(gt1),MHpm(gt2),MVZ,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
  AmpSqTreeHpmToHpmVZ(gt1, gt2) = AmpSqHpmToHpmVZ(gt1, gt2)  
  AmpSum2HpmToHpmVZ = + 2._dp*AmpWaveHpmToHpmVZ + 2._dp*AmpVertexHpmToHpmVZ
  Call SquareAmp_StoSV(MHpm(gt1),MHpm(gt2),MVZ,AmpSumHpmToHpmVZ(:,gt1, gt2),AmpSum2HpmToHpmVZ(:,gt1, gt2),AmpSqHpmToHpmVZ(gt1, gt2)) 
  AmpSqHpmToHpmVZ(gt1, gt2) = AmpSqHpmToHpmVZ(gt1, gt2) + AmpSqTreeHpmToHpmVZ(gt1, gt2)  
End if  
Else  
  AmpSqHpmToHpmVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmToHpmVZ(gt1, gt2).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MHpmOS(gt2),MVZOS,helfactor*AmpSqHpmToHpmVZ(gt1, gt2))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),MHpm(gt2),MVZ,helfactor*AmpSqHpmToHpmVZ(gt1, gt2))
End if 
If ((Abs(MRPHpmToHpmVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHpmToHpmVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmToHpmVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHpmToHpmVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPHpmToHpmVZ(gt1, gt2) + MRGHpmToHpmVZ(gt1, gt2)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPHpmToHpmVZ(gt1, gt2) + MRGHpmToHpmVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Su) Sd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmTocSuSd(cplSdcHpmcSu,MHpm,MSd,MSu,MHpm2,          & 
& MSd2,MSu2,AmpTreeHpmTocSuSd)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmTocSuSd(ZcplSdcHpmcSu,MHpm,MSd,MSu,               & 
& MHpm2,MSd2,MSu2,AmpTreeHpmTocSuSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmTocSuSd(MLambda,em,gs,cplSdcHpmcSu,MHpmOS,            & 
& MSdOS,MSuOS,MRPHpmTocSuSd,MRGHpmTocSuSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmTocSuSd(MLambda,em,gs,ZcplSdcHpmcSu,MHpmOS,           & 
& MSdOS,MSuOS,MRPHpmTocSuSd,MRGHpmTocSuSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmTocSuSd(MLambda,em,gs,cplSdcHpmcSu,MHpm,              & 
& MSd,MSu,MRPHpmTocSuSd,MRGHpmTocSuSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmTocSuSd(MLambda,em,gs,ZcplSdcHpmcSu,MHpm,             & 
& MSd,MSu,MRPHpmTocSuSd,MRGHpmTocSuSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmTocSuSd(cplSdcHpmcSu,ctcplSdcHpmcSu,              & 
& MHpm,MHpm2,MSd,MSd2,MSu,MSu2,ZfHpm,ZfSd,ZfSu,AmpWaveHpmTocSuSd)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmTocSuSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,       & 
& cplhhHpmcHpm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,             & 
& cplSdcSucVWm,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,             & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplAhSdcHpmcSuaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,         & 
& cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImcSecSuaa,               & 
& cplSdSvRecSecSuaa,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,AmpVertexHpmTocSuSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocSuSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhHpmcHpm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,       & 
& cplhhHpmcHpm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,             & 
& cplSdcSucVWm,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,             & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplAhSdcHpmcSuaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,         & 
& cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImcSecSuaa,               & 
& cplSdSvRecSecSuaa,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,AmpVertexIRdrHpmTocSuSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocSuSd(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,            & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhSdcSd,      & 
& cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFucSuL,cplChiFucSuR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplhhHpmcHpm,cplhhSdcSd,           & 
& cplhhSucSu,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,ZcplSdcHpmcSu,cplSdcSucVWm,cplSeSvImcHpm,       & 
& cplSeSvRecHpm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,cplcHpmVWmVZ,              & 
& cplAhSdcHpmcSuaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImcSecSuaa,cplSdSvRecSecSuaa,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,& 
& AmpVertexIRosHpmTocSuSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocSuSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhHpmcHpm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,       & 
& cplhhHpmcHpm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,ZcplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,             & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplAhSdcHpmcSuaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,         & 
& cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImcSecSuaa,               & 
& cplSdSvRecSecSuaa,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,AmpVertexIRosHpmTocSuSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocSuSd(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVG,MVP,MVWmOS,            & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhSdcSd,      & 
& cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFucSuL,cplChiFucSuR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplhhHpmcHpm,cplhhSdcSd,           & 
& cplhhSucSu,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,cplcHpmVWmVZ,              & 
& cplAhSdcHpmcSuaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImcSecSuaa,cplSdSvRecSecSuaa,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,& 
& AmpVertexIRosHpmTocSuSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmTocSuSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,cplAhHpmcHpm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,       & 
& cplhhHpmcHpm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,             & 
& cplSdcSucVWm,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,             & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplAhSdcHpmcSuaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,         & 
& cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImcSecSuaa,               & 
& cplSdSvRecSecSuaa,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,AmpVertexIRosHpmTocSuSd)

 End if 
 End if 
AmpVertexHpmTocSuSd = AmpVertexHpmTocSuSd -  AmpVertexIRdrHpmTocSuSd! +  AmpVertexIRosHpmTocSuSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmTocSuSd=0._dp 
AmpVertexZHpmTocSuSd=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmTocSuSd(gt2,:,:) = AmpWaveZHpmTocSuSd(gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHpmTocSuSd(gt1,:,:) 
AmpVertexZHpmTocSuSd(gt2,:,:)= AmpVertexZHpmTocSuSd(gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHpmTocSuSd(gt1,:,:) 
 End Do 
End Do 
AmpWaveHpmTocSuSd=AmpWaveZHpmTocSuSd 
AmpVertexHpmTocSuSd= AmpVertexZHpmTocSuSd
! Final State 1 
AmpWaveZHpmTocSuSd=0._dp 
AmpVertexZHpmTocSuSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZHpmTocSuSd(:,gt2,:) = AmpWaveZHpmTocSuSd(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpWaveHpmTocSuSd(:,gt1,:) 
AmpVertexZHpmTocSuSd(:,gt2,:)= AmpVertexZHpmTocSuSd(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpVertexHpmTocSuSd(:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmTocSuSd=AmpWaveZHpmTocSuSd 
AmpVertexHpmTocSuSd= AmpVertexZHpmTocSuSd
! Final State 2 
AmpWaveZHpmTocSuSd=0._dp 
AmpVertexZHpmTocSuSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZHpmTocSuSd(:,:,gt2) = AmpWaveZHpmTocSuSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveHpmTocSuSd(:,:,gt1) 
AmpVertexZHpmTocSuSd(:,:,gt2)= AmpVertexZHpmTocSuSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexHpmTocSuSd(:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmTocSuSd=AmpWaveZHpmTocSuSd 
AmpVertexHpmTocSuSd= AmpVertexZHpmTocSuSd
End if
If (ShiftIRdiv) Then 
AmpVertexHpmTocSuSd = AmpVertexHpmTocSuSd  +  AmpVertexIRosHpmTocSuSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->conj[Su] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmTocSuSd = AmpTreeHpmTocSuSd 
 AmpSum2HpmTocSuSd = AmpTreeHpmTocSuSd + 2._dp*AmpWaveHpmTocSuSd + 2._dp*AmpVertexHpmTocSuSd  
Else 
 AmpSumHpmTocSuSd = AmpTreeHpmTocSuSd + AmpWaveHpmTocSuSd + AmpVertexHpmTocSuSd
 AmpSum2HpmTocSuSd = AmpTreeHpmTocSuSd + AmpWaveHpmTocSuSd + AmpVertexHpmTocSuSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmTocSuSd = AmpTreeHpmTocSuSd
 AmpSum2HpmTocSuSd = AmpTreeHpmTocSuSd 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MSuOS(gt2)+MSdOS(gt3)))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MSu(gt2)+MSd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HpmTocSuSd = AmpTreeHpmTocSuSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSuOS(gt2),MSdOS(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSu(gt2),MSd(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmTocSuSd(gt1, gt2, gt3) 
  AmpSum2HpmTocSuSd = 2._dp*AmpWaveHpmTocSuSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSuOS(gt2),MSdOS(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSu(gt2),MSd(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmTocSuSd(gt1, gt2, gt3) 
  AmpSum2HpmTocSuSd = 2._dp*AmpVertexHpmTocSuSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSuOS(gt2),MSdOS(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSu(gt2),MSd(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmTocSuSd(gt1, gt2, gt3) 
  AmpSum2HpmTocSuSd = AmpTreeHpmTocSuSd + 2._dp*AmpWaveHpmTocSuSd + 2._dp*AmpVertexHpmTocSuSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSuOS(gt2),MSdOS(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSu(gt2),MSd(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmTocSuSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmTocSuSd = AmpTreeHpmTocSuSd
  Call SquareAmp_StoSS(MHpmOS(gt1),MSuOS(gt2),MSdOS(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
  AmpSqTreeHpmTocSuSd(gt1, gt2, gt3) = AmpSqHpmTocSuSd(gt1, gt2, gt3)  
  AmpSum2HpmTocSuSd = + 2._dp*AmpWaveHpmTocSuSd + 2._dp*AmpVertexHpmTocSuSd
  Call SquareAmp_StoSS(MHpmOS(gt1),MSuOS(gt2),MSdOS(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
  AmpSqHpmTocSuSd(gt1, gt2, gt3) = AmpSqHpmTocSuSd(gt1, gt2, gt3) + AmpSqTreeHpmTocSuSd(gt1, gt2, gt3)  
Else  
  AmpSum2HpmTocSuSd = AmpTreeHpmTocSuSd
  Call SquareAmp_StoSS(MHpm(gt1),MSu(gt2),MSd(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
  AmpSqTreeHpmTocSuSd(gt1, gt2, gt3) = AmpSqHpmTocSuSd(gt1, gt2, gt3)  
  AmpSum2HpmTocSuSd = + 2._dp*AmpWaveHpmTocSuSd + 2._dp*AmpVertexHpmTocSuSd
  Call SquareAmp_StoSS(MHpm(gt1),MSu(gt2),MSd(gt3),AmpSumHpmTocSuSd(gt1, gt2, gt3),AmpSum2HpmTocSuSd(gt1, gt2, gt3),AmpSqHpmTocSuSd(gt1, gt2, gt3)) 
  AmpSqHpmTocSuSd(gt1, gt2, gt3) = AmpSqHpmTocSuSd(gt1, gt2, gt3) + AmpSqTreeHpmTocSuSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHpmTocSuSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmTocSuSd(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 3._dp*GammaTPS(MHpmOS(gt1),MSuOS(gt2),MSdOS(gt3),helfactor*AmpSqHpmTocSuSd(gt1, gt2, gt3))
Else 
  gP1LHpm(gt1,i4) = 3._dp*GammaTPS(MHpm(gt1),MSu(gt2),MSd(gt3),helfactor*AmpSqHpmTocSuSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPHpmTocSuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmTocSuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmTocSuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmTocSuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHpmTocSuSd(gt1, gt2, gt3) + MRGHpmTocSuSd(gt1, gt2, gt3)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHpmTocSuSd(gt1, gt2, gt3) + MRGHpmTocSuSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvIm Se
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmToSvImSe(cplSeSvImcHpm,MHpm,MSe,MSvIm,            & 
& MHpm2,MSe2,MSvIm2,AmpTreeHpmToSvImSe)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmToSvImSe(ZcplSeSvImcHpm,MHpm,MSe,MSvIm,           & 
& MHpm2,MSe2,MSvIm2,AmpTreeHpmToSvImSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToSvImSe(MLambda,em,gs,cplSeSvImcHpm,MHpmOS,          & 
& MSeOS,MSvImOS,MRPHpmToSvImSe,MRGHpmToSvImSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToSvImSe(MLambda,em,gs,ZcplSeSvImcHpm,MHpmOS,         & 
& MSeOS,MSvImOS,MRPHpmToSvImSe,MRGHpmToSvImSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmToSvImSe(MLambda,em,gs,cplSeSvImcHpm,MHpm,            & 
& MSe,MSvIm,MRPHpmToSvImSe,MRGHpmToSvImSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToSvImSe(MLambda,em,gs,ZcplSeSvImcHpm,MHpm,           & 
& MSe,MSvIm,MRPHpmToSvImSe,MRGHpmToSvImSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToSvImSe(cplSeSvImcHpm,ctcplSeSvImcHpm,           & 
& MHpm,MHpm2,MSe,MSe2,MSvIm,MSvIm2,ZfHpm,ZfSe,ZfSvIm,AmpWaveHpmToSvImSe)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToSvImSe(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhSecSe,            & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,cplHpmSvImcSe,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSeSuSvImcSdaa,cplSeSvImSvImcSe1,            & 
& cplSeSvImSvRecSe1,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,AmpVertexHpmToSvImSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvImSe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhSecSe,       & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,cplHpmSvImcSe,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSeSuSvImcSdaa,cplSeSvImSvImcSe1,            & 
& cplSeSvImSvRecSe1,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,AmpVertexIRdrHpmToSvImSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvImSe(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvImL,cplcFeChaSvImR,              & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,cplHpmSvImcSe,cplHpmcHpmVP,cplHpmcHpmVZ,      & 
& cplSdcHpmcSu,ZcplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhSeSvImcHpm1,     & 
& cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,& 
& cplHpmSvImSvRecHpm1,cplSeSuSvImcSdaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,              & 
& cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,AmpVertexIRosHpmToSvImSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvImSe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhSecSe,       & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,cplHpmSvImcSe,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplSdcHpmcSu,ZcplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,    & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSeSuSvImcSdaa,cplSeSvImSvImcSe1,            & 
& cplSeSvImSvRecSe1,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,AmpVertexIRosHpmToSvImSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvImSe(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvImL,cplcFeChaSvImR,              & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,cplHpmSvImcSe,cplHpmcHpmVP,cplHpmcHpmVZ,      & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,       & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhSeSvImcHpm1,     & 
& cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,& 
& cplHpmSvImSvRecHpm1,cplSeSuSvImcSdaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,              & 
& cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,AmpVertexIRosHpmToSvImSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvImSe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhSecSe,       & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,cplHpmSvImcSe,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSeSuSvImcSdaa,cplSeSvImSvImcSe1,            & 
& cplSeSvImSvRecSe1,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,AmpVertexIRosHpmToSvImSe)

 End if 
 End if 
AmpVertexHpmToSvImSe = AmpVertexHpmToSvImSe -  AmpVertexIRdrHpmToSvImSe! +  AmpVertexIRosHpmToSvImSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmToSvImSe=0._dp 
AmpVertexZHpmToSvImSe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToSvImSe(gt2,:,:) = AmpWaveZHpmToSvImSe(gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToSvImSe(gt1,:,:) 
AmpVertexZHpmToSvImSe(gt2,:,:)= AmpVertexZHpmToSvImSe(gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHpmToSvImSe(gt1,:,:) 
 End Do 
End Do 
AmpWaveHpmToSvImSe=AmpWaveZHpmToSvImSe 
AmpVertexHpmToSvImSe= AmpVertexZHpmToSvImSe
! Final State 1 
AmpWaveZHpmToSvImSe=0._dp 
AmpVertexZHpmToSvImSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZHpmToSvImSe(:,gt2,:) = AmpWaveZHpmToSvImSe(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveHpmToSvImSe(:,gt1,:) 
AmpVertexZHpmToSvImSe(:,gt2,:)= AmpVertexZHpmToSvImSe(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexHpmToSvImSe(:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmToSvImSe=AmpWaveZHpmToSvImSe 
AmpVertexHpmToSvImSe= AmpVertexZHpmToSvImSe
! Final State 2 
AmpWaveZHpmToSvImSe=0._dp 
AmpVertexZHpmToSvImSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZHpmToSvImSe(:,:,gt2) = AmpWaveZHpmToSvImSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveHpmToSvImSe(:,:,gt1) 
AmpVertexZHpmToSvImSe(:,:,gt2)= AmpVertexZHpmToSvImSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexHpmToSvImSe(:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmToSvImSe=AmpWaveZHpmToSvImSe 
AmpVertexHpmToSvImSe= AmpVertexZHpmToSvImSe
End if
If (ShiftIRdiv) Then 
AmpVertexHpmToSvImSe = AmpVertexHpmToSvImSe  +  AmpVertexIRosHpmToSvImSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->SvIm Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmToSvImSe = AmpTreeHpmToSvImSe 
 AmpSum2HpmToSvImSe = AmpTreeHpmToSvImSe + 2._dp*AmpWaveHpmToSvImSe + 2._dp*AmpVertexHpmToSvImSe  
Else 
 AmpSumHpmToSvImSe = AmpTreeHpmToSvImSe + AmpWaveHpmToSvImSe + AmpVertexHpmToSvImSe
 AmpSum2HpmToSvImSe = AmpTreeHpmToSvImSe + AmpWaveHpmToSvImSe + AmpVertexHpmToSvImSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToSvImSe = AmpTreeHpmToSvImSe
 AmpSum2HpmToSvImSe = AmpTreeHpmToSvImSe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MSvImOS(gt2)+MSeOS(gt3)))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MSvIm(gt2)+MSe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HpmToSvImSe = AmpTreeHpmToSvImSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvImOS(gt2),MSeOS(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSvIm(gt2),MSe(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmToSvImSe(gt1, gt2, gt3) 
  AmpSum2HpmToSvImSe = 2._dp*AmpWaveHpmToSvImSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvImOS(gt2),MSeOS(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSvIm(gt2),MSe(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmToSvImSe(gt1, gt2, gt3) 
  AmpSum2HpmToSvImSe = 2._dp*AmpVertexHpmToSvImSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvImOS(gt2),MSeOS(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSvIm(gt2),MSe(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmToSvImSe(gt1, gt2, gt3) 
  AmpSum2HpmToSvImSe = AmpTreeHpmToSvImSe + 2._dp*AmpWaveHpmToSvImSe + 2._dp*AmpVertexHpmToSvImSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvImOS(gt2),MSeOS(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSvIm(gt2),MSe(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmToSvImSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmToSvImSe = AmpTreeHpmToSvImSe
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvImOS(gt2),MSeOS(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
  AmpSqTreeHpmToSvImSe(gt1, gt2, gt3) = AmpSqHpmToSvImSe(gt1, gt2, gt3)  
  AmpSum2HpmToSvImSe = + 2._dp*AmpWaveHpmToSvImSe + 2._dp*AmpVertexHpmToSvImSe
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvImOS(gt2),MSeOS(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
  AmpSqHpmToSvImSe(gt1, gt2, gt3) = AmpSqHpmToSvImSe(gt1, gt2, gt3) + AmpSqTreeHpmToSvImSe(gt1, gt2, gt3)  
Else  
  AmpSum2HpmToSvImSe = AmpTreeHpmToSvImSe
  Call SquareAmp_StoSS(MHpm(gt1),MSvIm(gt2),MSe(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
  AmpSqTreeHpmToSvImSe(gt1, gt2, gt3) = AmpSqHpmToSvImSe(gt1, gt2, gt3)  
  AmpSum2HpmToSvImSe = + 2._dp*AmpWaveHpmToSvImSe + 2._dp*AmpVertexHpmToSvImSe
  Call SquareAmp_StoSS(MHpm(gt1),MSvIm(gt2),MSe(gt3),AmpSumHpmToSvImSe(gt1, gt2, gt3),AmpSum2HpmToSvImSe(gt1, gt2, gt3),AmpSqHpmToSvImSe(gt1, gt2, gt3)) 
  AmpSqHpmToSvImSe(gt1, gt2, gt3) = AmpSqHpmToSvImSe(gt1, gt2, gt3) + AmpSqTreeHpmToSvImSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHpmToSvImSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmToSvImSe(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MSvImOS(gt2),MSeOS(gt3),helfactor*AmpSqHpmToSvImSe(gt1, gt2, gt3))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),MSvIm(gt2),MSe(gt3),helfactor*AmpSqHpmToSvImSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPHpmToSvImSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToSvImSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmToSvImSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToSvImSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHpmToSvImSe(gt1, gt2, gt3) + MRGHpmToSvImSe(gt1, gt2, gt3)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHpmToSvImSe(gt1, gt2, gt3) + MRGHpmToSvImSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe Se
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmToSvReSe(cplSeSvRecHpm,MHpm,MSe,MSvRe,            & 
& MHpm2,MSe2,MSvRe2,AmpTreeHpmToSvReSe)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmToSvReSe(ZcplSeSvRecHpm,MHpm,MSe,MSvRe,           & 
& MHpm2,MSe2,MSvRe2,AmpTreeHpmToSvReSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToSvReSe(MLambda,em,gs,cplSeSvRecHpm,MHpmOS,          & 
& MSeOS,MSvReOS,MRPHpmToSvReSe,MRGHpmToSvReSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToSvReSe(MLambda,em,gs,ZcplSeSvRecHpm,MHpmOS,         & 
& MSeOS,MSvReOS,MRPHpmToSvReSe,MRGHpmToSvReSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmToSvReSe(MLambda,em,gs,cplSeSvRecHpm,MHpm,            & 
& MSe,MSvRe,MRPHpmToSvReSe,MRGHpmToSvReSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToSvReSe(MLambda,em,gs,ZcplSeSvRecHpm,MHpm,           & 
& MSe,MSvRe,MRPHpmToSvReSe,MRGHpmToSvReSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToSvReSe(cplSeSvRecHpm,ctcplSeSvRecHpm,           & 
& MHpm,MHpm2,MSe,MSe2,MSvRe,MSvRe2,ZfHpm,ZfSe,ZfSvRe,AmpWaveHpmToSvReSe)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToSvReSe(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhSecSe,            & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplHpmSvRecSe,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvRecSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSeSuSvRecSdaa,cplSeSvImSvRecSe1,            & 
& cplSeSvReSvRecSe1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,AmpVertexHpmToSvReSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvReSe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhSecSe,       & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplHpmSvRecSe,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvRecSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSeSuSvRecSdaa,cplSeSvImSvRecSe1,            & 
& cplSeSvReSvRecSe1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,AmpVertexIRdrHpmToSvReSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvReSe(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,cplhhSecSe,       & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcHpmVZ,      & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,ZcplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvRecSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhSeSvImcHpm1,     & 
& cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,& 
& cplHpmSvReSvRecHpm1,cplSeSuSvRecSdaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,              & 
& cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,AmpVertexIRosHpmToSvReSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvReSe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhSecSe,       & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplHpmSvRecSe,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,ZcplSeSvRecHpm,cplSeSvRecVWm,    & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvRecSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSeSuSvRecSdaa,cplSeSvImSvRecSe1,            & 
& cplSeSvReSvRecSe1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,AmpVertexIRosHpmToSvReSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvReSe(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,cplFvFecHpmR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,cplhhSecSe,       & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcHpmVZ,      & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,       & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvRecSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhSeSvImcHpm1,     & 
& cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,& 
& cplHpmSvReSvRecHpm1,cplSeSuSvRecSdaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,              & 
& cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,AmpVertexIRosHpmToSvReSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToSvReSe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhSecSe,       & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplHpmSvRecSe,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvRecSeVWm,cplcHpmVPVWm,cplcHpmVWmVZ,           & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSeSuSvRecSdaa,cplSeSvImSvRecSe1,            & 
& cplSeSvReSvRecSe1,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,AmpVertexIRosHpmToSvReSe)

 End if 
 End if 
AmpVertexHpmToSvReSe = AmpVertexHpmToSvReSe -  AmpVertexIRdrHpmToSvReSe! +  AmpVertexIRosHpmToSvReSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmToSvReSe=0._dp 
AmpVertexZHpmToSvReSe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToSvReSe(gt2,:,:) = AmpWaveZHpmToSvReSe(gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHpmToSvReSe(gt1,:,:) 
AmpVertexZHpmToSvReSe(gt2,:,:)= AmpVertexZHpmToSvReSe(gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHpmToSvReSe(gt1,:,:) 
 End Do 
End Do 
AmpWaveHpmToSvReSe=AmpWaveZHpmToSvReSe 
AmpVertexHpmToSvReSe= AmpVertexZHpmToSvReSe
! Final State 1 
AmpWaveZHpmToSvReSe=0._dp 
AmpVertexZHpmToSvReSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZHpmToSvReSe(:,gt2,:) = AmpWaveZHpmToSvReSe(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveHpmToSvReSe(:,gt1,:) 
AmpVertexZHpmToSvReSe(:,gt2,:)= AmpVertexZHpmToSvReSe(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexHpmToSvReSe(:,gt1,:) 
 End Do 
End Do 
AmpWaveHpmToSvReSe=AmpWaveZHpmToSvReSe 
AmpVertexHpmToSvReSe= AmpVertexZHpmToSvReSe
! Final State 2 
AmpWaveZHpmToSvReSe=0._dp 
AmpVertexZHpmToSvReSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZHpmToSvReSe(:,:,gt2) = AmpWaveZHpmToSvReSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveHpmToSvReSe(:,:,gt1) 
AmpVertexZHpmToSvReSe(:,:,gt2)= AmpVertexZHpmToSvReSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexHpmToSvReSe(:,:,gt1) 
 End Do 
End Do 
AmpWaveHpmToSvReSe=AmpWaveZHpmToSvReSe 
AmpVertexHpmToSvReSe= AmpVertexZHpmToSvReSe
End if
If (ShiftIRdiv) Then 
AmpVertexHpmToSvReSe = AmpVertexHpmToSvReSe  +  AmpVertexIRosHpmToSvReSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->SvRe Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmToSvReSe = AmpTreeHpmToSvReSe 
 AmpSum2HpmToSvReSe = AmpTreeHpmToSvReSe + 2._dp*AmpWaveHpmToSvReSe + 2._dp*AmpVertexHpmToSvReSe  
Else 
 AmpSumHpmToSvReSe = AmpTreeHpmToSvReSe + AmpWaveHpmToSvReSe + AmpVertexHpmToSvReSe
 AmpSum2HpmToSvReSe = AmpTreeHpmToSvReSe + AmpWaveHpmToSvReSe + AmpVertexHpmToSvReSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToSvReSe = AmpTreeHpmToSvReSe
 AmpSum2HpmToSvReSe = AmpTreeHpmToSvReSe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MSvReOS(gt2)+MSeOS(gt3)))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MSvRe(gt2)+MSe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HpmToSvReSe = AmpTreeHpmToSvReSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvReOS(gt2),MSeOS(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSvRe(gt2),MSe(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmToSvReSe(gt1, gt2, gt3) 
  AmpSum2HpmToSvReSe = 2._dp*AmpWaveHpmToSvReSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvReOS(gt2),MSeOS(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSvRe(gt2),MSe(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmToSvReSe(gt1, gt2, gt3) 
  AmpSum2HpmToSvReSe = 2._dp*AmpVertexHpmToSvReSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvReOS(gt2),MSeOS(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSvRe(gt2),MSe(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmToSvReSe(gt1, gt2, gt3) 
  AmpSum2HpmToSvReSe = AmpTreeHpmToSvReSe + 2._dp*AmpWaveHpmToSvReSe + 2._dp*AmpVertexHpmToSvReSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvReOS(gt2),MSeOS(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHpm(gt1),MSvRe(gt2),MSe(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmToSvReSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmToSvReSe = AmpTreeHpmToSvReSe
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvReOS(gt2),MSeOS(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
  AmpSqTreeHpmToSvReSe(gt1, gt2, gt3) = AmpSqHpmToSvReSe(gt1, gt2, gt3)  
  AmpSum2HpmToSvReSe = + 2._dp*AmpWaveHpmToSvReSe + 2._dp*AmpVertexHpmToSvReSe
  Call SquareAmp_StoSS(MHpmOS(gt1),MSvReOS(gt2),MSeOS(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
  AmpSqHpmToSvReSe(gt1, gt2, gt3) = AmpSqHpmToSvReSe(gt1, gt2, gt3) + AmpSqTreeHpmToSvReSe(gt1, gt2, gt3)  
Else  
  AmpSum2HpmToSvReSe = AmpTreeHpmToSvReSe
  Call SquareAmp_StoSS(MHpm(gt1),MSvRe(gt2),MSe(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
  AmpSqTreeHpmToSvReSe(gt1, gt2, gt3) = AmpSqHpmToSvReSe(gt1, gt2, gt3)  
  AmpSum2HpmToSvReSe = + 2._dp*AmpWaveHpmToSvReSe + 2._dp*AmpVertexHpmToSvReSe
  Call SquareAmp_StoSS(MHpm(gt1),MSvRe(gt2),MSe(gt3),AmpSumHpmToSvReSe(gt1, gt2, gt3),AmpSum2HpmToSvReSe(gt1, gt2, gt3),AmpSqHpmToSvReSe(gt1, gt2, gt3)) 
  AmpSqHpmToSvReSe(gt1, gt2, gt3) = AmpSqHpmToSvReSe(gt1, gt2, gt3) + AmpSqTreeHpmToSvReSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHpmToSvReSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmToSvReSe(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MSvReOS(gt2),MSeOS(gt3),helfactor*AmpSqHpmToSvReSe(gt1, gt2, gt3))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),MSvRe(gt2),MSe(gt3),helfactor*AmpSqHpmToSvReSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPHpmToSvReSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToSvReSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmToSvReSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHpmToSvReSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHpmToSvReSe(gt1, gt2, gt3) + MRGHpmToSvReSe(gt1, gt2, gt3)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHpmToSvReSe(gt1, gt2, gt3) + MRGHpmToSvReSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZ VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_HpmToVZVWm(cplcHpmVWmVZ,MHpm,MVWm,MVZ,               & 
& MHpm2,MVWm2,MVZ2,AmpTreeHpmToVZVWm)

  Else 
Call Amplitude_Tree_seesaw1nmssm_HpmToVZVWm(ZcplcHpmVWmVZ,MHpm,MVWm,MVZ,              & 
& MHpm2,MVWm2,MVZ2,AmpTreeHpmToVZVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToVZVWm(MLambda,em,gs,cplcHpmVWmVZ,MHpmOS,            & 
& MVWmOS,MVZOS,MRPHpmToVZVWm,MRGHpmToVZVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToVZVWm(MLambda,em,gs,ZcplcHpmVWmVZ,MHpmOS,           & 
& MVWmOS,MVZOS,MRPHpmToVZVWm,MRGHpmToVZVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_HpmToVZVWm(MLambda,em,gs,cplcHpmVWmVZ,MHpm,              & 
& MVWm,MVZ,MRPHpmToVZVWm,MRGHpmToVZVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_HpmToVZVWm(MLambda,em,gs,ZcplcHpmVWmVZ,MHpm,             & 
& MVWm,MVZ,MRPHpmToVZVWm,MRGHpmToVZVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToVZVWm(cplcHpmVPVWm,cplcHpmVWmVZ,ctcplcHpmVPVWm, & 
& ctcplcHpmVWmVZ,MHpm,MHpm2,MVP,MVP2,MVWm,MVWm2,MVZ,MVZ2,ZfHpm,ZfVWm,ZfVZ,               & 
& AmpWaveHpmToVZVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToVZVWm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgAgWpCVWm,     & 
& cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVZ,cplSucSdVWm,cplSucSuVZ,            & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,      & 
& cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplHpmcHpmcVWmVWm1,       & 
& cplHpmcHpmVZVZ1,cplSucSdVWmVZaa,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,cplcVWmVPVWmVZ3Q,    & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,  & 
& AmpVertexHpmToVZVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToVZVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgAgWpCVWm,     & 
& cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVZ,cplSucSdVWm,cplSucSuVZ,            & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,      & 
& cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplHpmcHpmcVWmVWm1,       & 
& cplHpmcHpmVZVZ1,cplSucSdVWmVZaa,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,cplcVWmVPVWmVZ3Q,    & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,  & 
& AmpVertexIRdrHpmToVZVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToVZVWm(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhhhVZ,cplAhHpmcHpm,     & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,   & 
& cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,cplcFeFeVZR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWmL,               & 
& cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgAgWpCVWm,cplcgZgWpCVWm,    & 
& cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplhhcVWmVWm,     & 
& cplhhVZVZ,cplHpmcHpmVP,GosZcplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,          & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVZ,cplSucSdVWm,cplSucSuVZ,cplSvImSvReVZ,           & 
& cplSvImcSeVWm,cplSvRecSeVWm,GosZcplcHpmVPVWm,cplcVWmVPVWm,ZcplcHpmVWmVZ,               & 
& cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplHpmcHpmcVWmVWm1,       & 
& cplHpmcHpmVZVZ1,cplSucSdVWmVZaa,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,cplcVWmVPVWmVZ3Q,    & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,  & 
& AmpVertexIRosHpmToVZVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToVZVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgAgWpCVWm,     & 
& cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVP,GZcplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,            & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVZ,cplSucSdVWm,cplSucSuVZ,            & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,GZcplcHpmVPVWm,cplcVWmVPVWm,ZcplcHpmVWmVZ,   & 
& cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplHpmcHpmcVWmVWm1,       & 
& cplHpmcHpmVZVZ1,cplSucSdVWmVZaa,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,cplcVWmVPVWmVZ3Q,    & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,  & 
& AmpVertexIRosHpmToVZVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToVZVWm(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhhhVZ,cplAhHpmcHpm,     & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,   & 
& cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,cplcFeFeVZR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWmL,               & 
& cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgAgWpCVWm,cplcgZgWpCVWm,    & 
& cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplhhcVWmVWm,     & 
& cplhhVZVZ,cplHpmcHpmVP,GcplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,             & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVZ,cplSucSdVWm,cplSucSuVZ,cplSvImSvReVZ,           & 
& cplSvImcSeVWm,cplSvRecSeVWm,GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,      & 
& cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,    & 
& cplSucSdVWmVZaa,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,   & 
& cplcVWmVPVWmVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,AmpVertexIRosHpmToVZVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_HpmToVZVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgWmgWmVZ,cplcgZgWmcHpm,cplcgAgWpCVWm,     & 
& cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVZ,cplSucSdVWm,cplSucSuVZ,            & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,      & 
& cplcVWmVWmVZ,cplAhcHpmVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplHpmcHpmcVWmVWm1,       & 
& cplHpmcHpmVZVZ1,cplSucSdVWmVZaa,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,cplcVWmVPVWmVZ3Q,    & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,  & 
& AmpVertexIRosHpmToVZVWm)

 End if 
 End if 
AmpVertexHpmToVZVWm = AmpVertexHpmToVZVWm -  AmpVertexIRdrHpmToVZVWm! +  AmpVertexIRosHpmToVZVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHpmToVZVWm=0._dp 
AmpVertexZHpmToVZVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHpmToVZVWm(:,gt2) = AmpWaveZHpmToVZVWm(:,gt2)+ZRUZP(gt2,gt1)*AmpWaveHpmToVZVWm(:,gt1) 
AmpVertexZHpmToVZVWm(:,gt2)= AmpVertexZHpmToVZVWm(:,gt2) + ZRUZP(gt2,gt1)*AmpVertexHpmToVZVWm(:,gt1) 
 End Do 
End Do 
AmpWaveHpmToVZVWm=AmpWaveZHpmToVZVWm 
AmpVertexHpmToVZVWm= AmpVertexZHpmToVZVWm
End if
If (ShiftIRdiv) Then 
AmpVertexHpmToVZVWm = AmpVertexHpmToVZVWm  +  AmpVertexIRosHpmToVZVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->VZ VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHpmToVZVWm = AmpTreeHpmToVZVWm 
 AmpSum2HpmToVZVWm = AmpTreeHpmToVZVWm + 2._dp*AmpWaveHpmToVZVWm + 2._dp*AmpVertexHpmToVZVWm  
Else 
 AmpSumHpmToVZVWm = AmpTreeHpmToVZVWm + AmpWaveHpmToVZVWm + AmpVertexHpmToVZVWm
 AmpSum2HpmToVZVWm = AmpTreeHpmToVZVWm + AmpWaveHpmToVZVWm + AmpVertexHpmToVZVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToVZVWm = AmpTreeHpmToVZVWm
 AmpSum2HpmToVZVWm = AmpTreeHpmToVZVWm 
End if 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MVZOS+MVWmOS))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MVZ+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2HpmToVZVWm = AmpTreeHpmToVZVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MHpmOS(gt1),MVZOS,MVWmOS,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(MHpm(gt1),MVZ,MVWm,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHpmToVZVWm(gt1) 
  AmpSum2HpmToVZVWm = 2._dp*AmpWaveHpmToVZVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MHpmOS(gt1),MVZOS,MVWmOS,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(MHpm(gt1),MVZ,MVWm,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHpmToVZVWm(gt1) 
  AmpSum2HpmToVZVWm = 2._dp*AmpVertexHpmToVZVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MHpmOS(gt1),MVZOS,MVWmOS,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(MHpm(gt1),MVZ,MVWm,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHpmToVZVWm(gt1) 
  AmpSum2HpmToVZVWm = AmpTreeHpmToVZVWm + 2._dp*AmpWaveHpmToVZVWm + 2._dp*AmpVertexHpmToVZVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MHpmOS(gt1),MVZOS,MVWmOS,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(MHpm(gt1),MVZ,MVWm,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHpmToVZVWm(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2HpmToVZVWm = AmpTreeHpmToVZVWm
  Call SquareAmp_StoVV(MHpmOS(gt1),MVZOS,MVWmOS,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
  AmpSqTreeHpmToVZVWm(gt1) = AmpSqHpmToVZVWm(gt1)  
  AmpSum2HpmToVZVWm = + 2._dp*AmpWaveHpmToVZVWm + 2._dp*AmpVertexHpmToVZVWm
  Call SquareAmp_StoVV(MHpmOS(gt1),MVZOS,MVWmOS,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
  AmpSqHpmToVZVWm(gt1) = AmpSqHpmToVZVWm(gt1) + AmpSqTreeHpmToVZVWm(gt1)  
Else  
  AmpSum2HpmToVZVWm = AmpTreeHpmToVZVWm
  Call SquareAmp_StoVV(MHpm(gt1),MVZ,MVWm,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
  AmpSqTreeHpmToVZVWm(gt1) = AmpSqHpmToVZVWm(gt1)  
  AmpSum2HpmToVZVWm = + 2._dp*AmpWaveHpmToVZVWm + 2._dp*AmpVertexHpmToVZVWm
  Call SquareAmp_StoVV(MHpm(gt1),MVZ,MVWm,AmpSumHpmToVZVWm(:,gt1),AmpSum2HpmToVZVWm(:,gt1),AmpSqHpmToVZVWm(gt1)) 
  AmpSqHpmToVZVWm(gt1) = AmpSqHpmToVZVWm(gt1) + AmpSqTreeHpmToVZVWm(gt1)  
End if  
Else  
  AmpSqHpmToVZVWm(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmToVZVWm(gt1).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 2._dp*GammaTPS(MHpmOS(gt1),MVZOS,MVWmOS,helfactor*AmpSqHpmToVZVWm(gt1))
Else 
  gP1LHpm(gt1,i4) = 2._dp*GammaTPS(MHpm(gt1),MVZ,MVWm,helfactor*AmpSqHpmToVZVWm(gt1))
End if 
If ((Abs(MRPHpmToVZVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGHpmToVZVWm(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHpmToVZVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGHpmToVZVWm(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPHpmToVZVWm(gt1) + MRGHpmToVZVWm(gt1)) 
  gP1LHpm(gt1,i4) = gP1LHpm(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPHpmToVZVWm(gt1) + MRGHpmToVZVWm(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHpm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End If 
!---------------- 
! Hpm VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_seesaw1nmssm_HpmToHpmVP(cplHpmcHpmVP,cplHpmcHpmVZ,ctcplHpmcHpmVP, & 
& ctcplHpmcHpmVZ,MHpmOS,MHpm2OS,MVP,MVP2,ZfHpm,ZfVP,ZfVZVP,AmpWaveHpmToHpmVP)

 Else 
Call Amplitude_WAVE_seesaw1nmssm_HpmToHpmVP(cplHpmcHpmVP,cplHpmcHpmVZ,ctcplHpmcHpmVP, & 
& ctcplHpmcHpmVZ,MHpmOS,MHpm2OS,MVP,MVP2,ZfHpm,ZfVP,ZfVZVP,AmpWaveHpmToHpmVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToHpmVP(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVPL,cplcChaChaVPR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVPL,cplcFeFeVPR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmVP,cplcgZgWmcHpm,          & 
& cplcgZgWpCHpm,cplcgWpCgWpCVP,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,    & 
& cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,         & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplAhHpmcVWmVP1,          & 
& cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,       & 
& AmpVertexHpmToHpmVP)

 Else 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToHpmVP(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVPL,cplcChaChaVPR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVPL,cplcFeFeVPR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmVP,cplcgZgWmcHpm,          & 
& cplcgZgWpCHpm,cplcgWpCgWpCVP,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,    & 
& cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,         & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplAhHpmcVWmVP1,          & 
& cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,       & 
& AmpVertexHpmToHpmVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToHpmVP(cplHpmcHpmVP,cplHpmcHpmVZ,ctcplHpmcHpmVP, & 
& ctcplHpmcHpmVZ,MHpm,MHpm2,MVP,MVP2,ZfHpm,ZfVP,ZfVZVP,AmpWaveHpmToHpmVP)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToHpmVP(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVPL,cplcChaChaVPR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFeVPL,cplcFeFeVPR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmVP,cplcgZgWmcHpm,          & 
& cplcgZgWpCHpm,cplcgWpCgWpCVP,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,    & 
& cplhhcHpmVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,         & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplAhHpmcVWmVP1,          & 
& cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,       & 
& AmpVertexHpmToHpmVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->Hpm VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToHpmVP = 0._dp 
 AmpSum2HpmToHpmVP = 0._dp  
Else 
 AmpSumHpmToHpmVP = AmpVertexHpmToHpmVP + AmpWaveHpmToHpmVP
 AmpSum2HpmToHpmVP = AmpVertexHpmToHpmVP + AmpWaveHpmToHpmVP 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=2,2
If (((OSkinematics).and.(MHpmOS(gt1).gt.(MHpmOS(gt2)+0.))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MHpm(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHpmOS(gt1),MHpmOS(gt2),0._dp,AmpSumHpmToHpmVP(:,gt1, gt2),AmpSum2HpmToHpmVP(:,gt1, gt2),AmpSqHpmToHpmVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHpm(gt1),MHpm(gt2),MVP,AmpSumHpmToHpmVP(:,gt1, gt2),AmpSum2HpmToHpmVP(:,gt1, gt2),AmpSqHpmToHpmVP(gt1, gt2)) 
End if  
Else  
  AmpSqHpmToHpmVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmToHpmVP(gt1, gt2).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpmOS(gt1),MHpmOS(gt2),0._dp,helfactor*AmpSqHpmToHpmVP(gt1, gt2))
Else 
  gP1LHpm(gt1,i4) = 1._dp*GammaTPS(MHpm(gt1),MHpm(gt2),MVP,helfactor*AmpSqHpmToHpmVP(gt1, gt2))
End if 
If ((Abs(MRPHpmToHpmVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHpmToHpmVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
!---------------- 
! VP VWm
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_seesaw1nmssm_HpmToVPVWm(cplcHpmVPVWm,cplcHpmVWmVZ,ctcplcHpmVPVWm, & 
& ctcplcHpmVWmVZ,MHpmOS,MHpm2OS,MVP,MVP2,MVWmOS,MVWm2OS,ZfHpm,ZfVP,ZfVWm,AmpWaveHpmToVPVWm)

 Else 
Call Amplitude_WAVE_seesaw1nmssm_HpmToVPVWm(cplcHpmVPVWm,cplcHpmVWmVZ,ctcplcHpmVPVWm, & 
& ctcplcHpmVWmVZ,MHpmOS,MHpm2OS,MVP,MVP2,MVWmOS,MVWm2OS,ZfHpm,ZfVP,ZfVWm,AmpWaveHpmToVPVWm)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToVPVWm(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,               & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgWmgWmVP,cplcgZgWmcHpm,      & 
& cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,   & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplSdcSdVP,           & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVP,cplSucSuVP,cplSucSdVWm,            & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplAhcHpmVPVWm1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmcVWmVWm1,    & 
& cplSucSdVPVWmaa,cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,   & 
& cplcVWmVPVPVWm2Q,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexHpmToVPVWm)

 Else 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToVPVWm(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,               & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgWmgWmVP,cplcgZgWmcHpm,      & 
& cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,   & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplSdcSdVP,           & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVP,cplSucSuVP,cplSucSdVWm,            & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplAhcHpmVPVWm1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmcVWmVWm1,    & 
& cplSucSdVPVWmaa,cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,   & 
& cplcVWmVPVPVWm2Q,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexHpmToVPVWm)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_HpmToVPVWm(cplcHpmVPVWm,cplcHpmVWmVZ,ctcplcHpmVPVWm, & 
& ctcplcHpmVWmVZ,MHpm,MHpm2,MVP,MVP2,MVWm,MVWm2,ZfHpm,ZfVP,ZfVWm,AmpWaveHpmToVPVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_HpmToVPVWm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,   & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,       & 
& cplFvFecHpmR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWpCgAcHpm,cplcgWmgWmVP,cplcgZgWmcHpm,      & 
& cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcHpm,cplhhHpmcHpm,   & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplSdcSdVP,           & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSecSeVP,cplSucSuVP,cplSucSdVWm,            & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplAhcHpmVPVWm1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmcVWmVWm1,    & 
& cplSucSdVPVWmaa,cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,   & 
& cplcVWmVPVPVWm2Q,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexHpmToVPVWm)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hpm->VP VWm -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumHpmToVPVWm = 0._dp 
 AmpSum2HpmToVPVWm = 0._dp  
Else 
 AmpSumHpmToVPVWm = AmpVertexHpmToVPVWm + AmpWaveHpmToVPVWm
 AmpSum2HpmToVPVWm = AmpVertexHpmToVPVWm + AmpWaveHpmToVPVWm 
End If 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MHpmOS(gt1).gt.(0.+MVWmOS))).or.((.not.OSkinematics).and.(MHpm(gt1).gt.(MVP+MVWm)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MHpmOS(gt1),0._dp,MVWmOS,AmpSumHpmToVPVWm(:,gt1),AmpSum2HpmToVPVWm(:,gt1),AmpSqHpmToVPVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(MHpm(gt1),MVP,MVWm,AmpSumHpmToVPVWm(:,gt1),AmpSum2HpmToVPVWm(:,gt1),AmpSqHpmToVPVWm(gt1)) 
End if  
Else  
  AmpSqHpmToVPVWm(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHpmToVPVWm(gt1).le.0._dp) Then 
  gP1LHpm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHpm(gt1,i4) = 2._dp*GammaTPS(MHpmOS(gt1),0._dp,MVWmOS,helfactor*AmpSqHpmToVPVWm(gt1))
Else 
  gP1LHpm(gt1,i4) = 2._dp*GammaTPS(MHpm(gt1),MVP,MVWm,helfactor*AmpSqHpmToVPVWm(gt1))
End if 
If ((Abs(MRPHpmToVPVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGHpmToVPVWm(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHpm(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End Subroutine OneLoopDecay_Hpm

End Module Wrapper_OneLoopDecay_Hpm_seesaw1nmssm
