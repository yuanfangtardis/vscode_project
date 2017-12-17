! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:50 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Chi_seesaw1nmssm
Use Model_Data_seesaw1nmssm 
Use Kinematics 
Use OneLoopDecay_Chi_seesaw1nmssm 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Chi(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,           & 
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
& ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhcHpmVWm,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
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
& cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplFvChacSeL,cplFvChacSeR,         & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,    & 
& cplGluFucSuR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmSucSd,             & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,             & 
& cplSdcSucVWm,cplSecSeVP,cplSecSeVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,          & 
& cplSeSvRecVWm,cplSucSdVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSvImcSeVWm,              & 
& cplSvImSvReVZ,cplSvRecSeVWm,ctcplChiChacHpmL,ctcplChiChacHpmR,ctcplChiChacVWmL,        & 
& ctcplChiChacVWmR,ctcplChiChiAhL,ctcplChiChiAhR,ctcplChiChihhL,ctcplChiChihhR,          & 
& ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplChiFecSeL,            & 
& ctcplChiFecSeR,ctcplChiFucSuL,ctcplChiFucSuR,ctcplChiFvSvImL,ctcplChiFvSvImR,          & 
& ctcplChiFvSvReL,ctcplChiFvSvReR,GcplChiChacHpmL,GcplChiChacHpmR,GcplcHpmVPVWm,         & 
& GcplHpmcVWmVP,GosZcplChiChacHpmL,GosZcplChiChacHpmR,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP, & 
& GZcplChiChacHpmL,GZcplChiChacHpmR,GZcplcHpmVPVWm,GZcplHpmcVWmVP,ZcplcChaChaVPL,        & 
& ZcplcChaChaVPR,ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,        & 
& ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,       & 
& ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFeChiSeL,ZcplcFeChiSeR,ZcplcFeFeVPL,ZcplcFeFeVPR,     & 
& ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,       & 
& ZcplcFuGluSuL,ZcplcFuGluSuR,ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,           & 
& ZcplChiChacVWmR,ZcplChiChiAhL,ZcplChiChiAhR,ZcplChiChihhL,ZcplChiChihhR,               & 
& ZcplChiChiVZL,ZcplChiChiVZR,ZcplChiFdcSdL,ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,   & 
& ZcplChiFucSuL,ZcplChiFucSuR,ZcplChiFvSvImL,ZcplChiFvSvImR,ZcplChiFvSvReL,              & 
& ZcplChiFvSvReR,ZcplcHpmVPVWm,ZcplcVWmVPVWm,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplGluFucSuL,  & 
& ZcplGluFucSuR,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVG,ZcplSdcSdVP,ZcplSecSeVP,         & 
& ZcplSucSuVG,ZcplSucSuVP,ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,             & 
& ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,             & 
& em,gs,deltaM,kont,gP1LChi)

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

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhcHpmVWm(3,2),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),  & 
& cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),             & 
& cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),      & 
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
& cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),       & 
& cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),     & 
& cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),         & 
& cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),         & 
& cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),      & 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplcHpmVPVWm(2),        & 
& cplcHpmVWmVZ(2),cplcVWmVPVWm,cplcVWmVWmVZ,cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),     & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6), & 
& cplGluFucSuR(3,6),cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),& 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhVZVZ(3),           & 
& cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmSucSd(2,6,6),& 
& cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSdcHpmcSu(6,2,6),cplSdcSdVG(6,6),         & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSucVWm(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6)

Complex(dp),Intent(in) :: cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),       & 
& cplSucSdVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSvImcSeVWm(6,6),   & 
& cplSvImSvReVZ(6,6),cplSvRecSeVWm(6,6),ctcplChiChacHpmL(5,2,2),ctcplChiChacHpmR(5,2,2), & 
& ctcplChiChacVWmL(5,2),ctcplChiChacVWmR(5,2),ctcplChiChiAhL(5,5,3),ctcplChiChiAhR(5,5,3),& 
& ctcplChiChihhL(5,5,3),ctcplChiChihhR(5,5,3),ctcplChiChiVZL(5,5),ctcplChiChiVZR(5,5),   & 
& ctcplChiFdcSdL(5,3,6),ctcplChiFdcSdR(5,3,6),ctcplChiFecSeL(5,3,6),ctcplChiFecSeR(5,3,6),& 
& ctcplChiFucSuL(5,3,6),ctcplChiFucSuR(5,3,6),ctcplChiFvSvImL(5,6,6),ctcplChiFvSvImR(5,6,6),& 
& ctcplChiFvSvReL(5,6,6),ctcplChiFvSvReR(5,6,6),GcplChiChacHpmL(5,2,2),GcplChiChacHpmR(5,2,2),& 
& GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),GosZcplChiChacHpmL(5,2,2),GosZcplChiChacHpmR(5,2,2), & 
& GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GZcplChiChacHpmL(5,2,2),GZcplChiChacHpmR(5,2,2),& 
& GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),ZcplcChaChaVPL(2,2),ZcplcChaChaVPR(2,2),           & 
& ZcplcChaChiHpmL(2,5,2),ZcplcChaChiHpmR(2,5,2),ZcplcChaChiVWmL(2,5),ZcplcChaChiVWmR(2,5),& 
& ZcplcFdChiSdL(3,5,6),ZcplcFdChiSdR(3,5,6),ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),         & 
& ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFdGluSdL(3,6),ZcplcFdGluSdR(3,6),             & 
& ZcplcFeChiSeL(3,5,6),ZcplcFeChiSeR(3,5,6),ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),         & 
& ZcplcFuChiSuL(3,5,6),ZcplcFuChiSuR(3,5,6),ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),         & 
& ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),ZcplcFuGluSuL(3,6),ZcplcFuGluSuR(3,6),             & 
& ZcplChiChacHpmL(5,2,2),ZcplChiChacHpmR(5,2,2),ZcplChiChacVWmL(5,2),ZcplChiChacVWmR(5,2),& 
& ZcplChiChiAhL(5,5,3),ZcplChiChiAhR(5,5,3),ZcplChiChihhL(5,5,3),ZcplChiChihhR(5,5,3),   & 
& ZcplChiChiVZL(5,5),ZcplChiChiVZR(5,5),ZcplChiFdcSdL(5,3,6),ZcplChiFdcSdR(5,3,6),       & 
& ZcplChiFecSeL(5,3,6),ZcplChiFecSeR(5,3,6),ZcplChiFucSuL(5,3,6),ZcplChiFucSuR(5,3,6),   & 
& ZcplChiFvSvImL(5,6,6),ZcplChiFvSvImR(5,6,6),ZcplChiFvSvReL(5,6,6),ZcplChiFvSvReR(5,6,6),& 
& ZcplcHpmVPVWm(2),ZcplcVWmVPVWm,ZcplGluFdcSdL(3,6),ZcplGluFdcSdR(3,6),ZcplGluFucSuL(3,6),& 
& ZcplGluFucSuR(3,6),ZcplHpmcHpmVP(2,2),ZcplHpmcVWmVP(2),ZcplSdcSdVG(6,6),               & 
& ZcplSdcSdVP(6,6),ZcplSecSeVP(6,6),ZcplSucSuVG(6,6),ZcplSucSuVP(6,6)

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
Real(dp), Intent(out) :: gP1LChi(5,166) 
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
Real(dp) :: MRPChiToChiAh(5,5,3),MRGChiToChiAh(5,5,3), MRPZChiToChiAh(5,5,3),MRGZChiToChiAh(5,5,3) 
Real(dp) :: MVPChiToChiAh(5,5,3) 
Real(dp) :: RMsqTreeChiToChiAh(5,5,3),RMsqWaveChiToChiAh(5,5,3),RMsqVertexChiToChiAh(5,5,3) 
Complex(dp) :: AmpTreeChiToChiAh(2,5,5,3),AmpWaveChiToChiAh(2,5,5,3)=(0._dp,0._dp),AmpVertexChiToChiAh(2,5,5,3)& 
 & ,AmpVertexIRosChiToChiAh(2,5,5,3),AmpVertexIRdrChiToChiAh(2,5,5,3), AmpSumChiToChiAh(2,5,5,3), AmpSum2ChiToChiAh(2,5,5,3) 
Complex(dp) :: AmpTreeZChiToChiAh(2,5,5,3),AmpWaveZChiToChiAh(2,5,5,3),AmpVertexZChiToChiAh(2,5,5,3) 
Real(dp) :: AmpSqChiToChiAh(5,5,3),  AmpSqTreeChiToChiAh(5,5,3) 
Real(dp) :: MRPChiToChacHpm(5,2,2),MRGChiToChacHpm(5,2,2), MRPZChiToChacHpm(5,2,2),MRGZChiToChacHpm(5,2,2) 
Real(dp) :: MVPChiToChacHpm(5,2,2) 
Real(dp) :: RMsqTreeChiToChacHpm(5,2,2),RMsqWaveChiToChacHpm(5,2,2),RMsqVertexChiToChacHpm(5,2,2) 
Complex(dp) :: AmpTreeChiToChacHpm(2,5,2,2),AmpWaveChiToChacHpm(2,5,2,2)=(0._dp,0._dp),AmpVertexChiToChacHpm(2,5,2,2)& 
 & ,AmpVertexIRosChiToChacHpm(2,5,2,2),AmpVertexIRdrChiToChacHpm(2,5,2,2), AmpSumChiToChacHpm(2,5,2,2), AmpSum2ChiToChacHpm(2,5,2,2) 
Complex(dp) :: AmpTreeZChiToChacHpm(2,5,2,2),AmpWaveZChiToChacHpm(2,5,2,2),AmpVertexZChiToChacHpm(2,5,2,2) 
Real(dp) :: AmpSqChiToChacHpm(5,2,2),  AmpSqTreeChiToChacHpm(5,2,2) 
Real(dp) :: MRPChiToChacVWm(5,2),MRGChiToChacVWm(5,2), MRPZChiToChacVWm(5,2),MRGZChiToChacVWm(5,2) 
Real(dp) :: MVPChiToChacVWm(5,2) 
Real(dp) :: RMsqTreeChiToChacVWm(5,2),RMsqWaveChiToChacVWm(5,2),RMsqVertexChiToChacVWm(5,2) 
Complex(dp) :: AmpTreeChiToChacVWm(4,5,2),AmpWaveChiToChacVWm(4,5,2)=(0._dp,0._dp),AmpVertexChiToChacVWm(4,5,2)& 
 & ,AmpVertexIRosChiToChacVWm(4,5,2),AmpVertexIRdrChiToChacVWm(4,5,2), AmpSumChiToChacVWm(4,5,2), AmpSum2ChiToChacVWm(4,5,2) 
Complex(dp) :: AmpTreeZChiToChacVWm(4,5,2),AmpWaveZChiToChacVWm(4,5,2),AmpVertexZChiToChacVWm(4,5,2) 
Real(dp) :: AmpSqChiToChacVWm(5,2),  AmpSqTreeChiToChacVWm(5,2) 
Real(dp) :: MRPChiToChihh(5,5,3),MRGChiToChihh(5,5,3), MRPZChiToChihh(5,5,3),MRGZChiToChihh(5,5,3) 
Real(dp) :: MVPChiToChihh(5,5,3) 
Real(dp) :: RMsqTreeChiToChihh(5,5,3),RMsqWaveChiToChihh(5,5,3),RMsqVertexChiToChihh(5,5,3) 
Complex(dp) :: AmpTreeChiToChihh(2,5,5,3),AmpWaveChiToChihh(2,5,5,3)=(0._dp,0._dp),AmpVertexChiToChihh(2,5,5,3)& 
 & ,AmpVertexIRosChiToChihh(2,5,5,3),AmpVertexIRdrChiToChihh(2,5,5,3), AmpSumChiToChihh(2,5,5,3), AmpSum2ChiToChihh(2,5,5,3) 
Complex(dp) :: AmpTreeZChiToChihh(2,5,5,3),AmpWaveZChiToChihh(2,5,5,3),AmpVertexZChiToChihh(2,5,5,3) 
Real(dp) :: AmpSqChiToChihh(5,5,3),  AmpSqTreeChiToChihh(5,5,3) 
Real(dp) :: MRPChiToChiVZ(5,5),MRGChiToChiVZ(5,5), MRPZChiToChiVZ(5,5),MRGZChiToChiVZ(5,5) 
Real(dp) :: MVPChiToChiVZ(5,5) 
Real(dp) :: RMsqTreeChiToChiVZ(5,5),RMsqWaveChiToChiVZ(5,5),RMsqVertexChiToChiVZ(5,5) 
Complex(dp) :: AmpTreeChiToChiVZ(4,5,5),AmpWaveChiToChiVZ(4,5,5)=(0._dp,0._dp),AmpVertexChiToChiVZ(4,5,5)& 
 & ,AmpVertexIRosChiToChiVZ(4,5,5),AmpVertexIRdrChiToChiVZ(4,5,5), AmpSumChiToChiVZ(4,5,5), AmpSum2ChiToChiVZ(4,5,5) 
Complex(dp) :: AmpTreeZChiToChiVZ(4,5,5),AmpWaveZChiToChiVZ(4,5,5),AmpVertexZChiToChiVZ(4,5,5) 
Real(dp) :: AmpSqChiToChiVZ(5,5),  AmpSqTreeChiToChiVZ(5,5) 
Real(dp) :: MRPChiToFdcSd(5,3,6),MRGChiToFdcSd(5,3,6), MRPZChiToFdcSd(5,3,6),MRGZChiToFdcSd(5,3,6) 
Real(dp) :: MVPChiToFdcSd(5,3,6) 
Real(dp) :: RMsqTreeChiToFdcSd(5,3,6),RMsqWaveChiToFdcSd(5,3,6),RMsqVertexChiToFdcSd(5,3,6) 
Complex(dp) :: AmpTreeChiToFdcSd(2,5,3,6),AmpWaveChiToFdcSd(2,5,3,6)=(0._dp,0._dp),AmpVertexChiToFdcSd(2,5,3,6)& 
 & ,AmpVertexIRosChiToFdcSd(2,5,3,6),AmpVertexIRdrChiToFdcSd(2,5,3,6), AmpSumChiToFdcSd(2,5,3,6), AmpSum2ChiToFdcSd(2,5,3,6) 
Complex(dp) :: AmpTreeZChiToFdcSd(2,5,3,6),AmpWaveZChiToFdcSd(2,5,3,6),AmpVertexZChiToFdcSd(2,5,3,6) 
Real(dp) :: AmpSqChiToFdcSd(5,3,6),  AmpSqTreeChiToFdcSd(5,3,6) 
Real(dp) :: MRPChiToFecSe(5,3,6),MRGChiToFecSe(5,3,6), MRPZChiToFecSe(5,3,6),MRGZChiToFecSe(5,3,6) 
Real(dp) :: MVPChiToFecSe(5,3,6) 
Real(dp) :: RMsqTreeChiToFecSe(5,3,6),RMsqWaveChiToFecSe(5,3,6),RMsqVertexChiToFecSe(5,3,6) 
Complex(dp) :: AmpTreeChiToFecSe(2,5,3,6),AmpWaveChiToFecSe(2,5,3,6)=(0._dp,0._dp),AmpVertexChiToFecSe(2,5,3,6)& 
 & ,AmpVertexIRosChiToFecSe(2,5,3,6),AmpVertexIRdrChiToFecSe(2,5,3,6), AmpSumChiToFecSe(2,5,3,6), AmpSum2ChiToFecSe(2,5,3,6) 
Complex(dp) :: AmpTreeZChiToFecSe(2,5,3,6),AmpWaveZChiToFecSe(2,5,3,6),AmpVertexZChiToFecSe(2,5,3,6) 
Real(dp) :: AmpSqChiToFecSe(5,3,6),  AmpSqTreeChiToFecSe(5,3,6) 
Real(dp) :: MRPChiToFucSu(5,3,6),MRGChiToFucSu(5,3,6), MRPZChiToFucSu(5,3,6),MRGZChiToFucSu(5,3,6) 
Real(dp) :: MVPChiToFucSu(5,3,6) 
Real(dp) :: RMsqTreeChiToFucSu(5,3,6),RMsqWaveChiToFucSu(5,3,6),RMsqVertexChiToFucSu(5,3,6) 
Complex(dp) :: AmpTreeChiToFucSu(2,5,3,6),AmpWaveChiToFucSu(2,5,3,6)=(0._dp,0._dp),AmpVertexChiToFucSu(2,5,3,6)& 
 & ,AmpVertexIRosChiToFucSu(2,5,3,6),AmpVertexIRdrChiToFucSu(2,5,3,6), AmpSumChiToFucSu(2,5,3,6), AmpSum2ChiToFucSu(2,5,3,6) 
Complex(dp) :: AmpTreeZChiToFucSu(2,5,3,6),AmpWaveZChiToFucSu(2,5,3,6),AmpVertexZChiToFucSu(2,5,3,6) 
Real(dp) :: AmpSqChiToFucSu(5,3,6),  AmpSqTreeChiToFucSu(5,3,6) 
Real(dp) :: MRPChiToFvSvIm(5,6,6),MRGChiToFvSvIm(5,6,6), MRPZChiToFvSvIm(5,6,6),MRGZChiToFvSvIm(5,6,6) 
Real(dp) :: MVPChiToFvSvIm(5,6,6) 
Real(dp) :: RMsqTreeChiToFvSvIm(5,6,6),RMsqWaveChiToFvSvIm(5,6,6),RMsqVertexChiToFvSvIm(5,6,6) 
Complex(dp) :: AmpTreeChiToFvSvIm(2,5,6,6),AmpWaveChiToFvSvIm(2,5,6,6)=(0._dp,0._dp),AmpVertexChiToFvSvIm(2,5,6,6)& 
 & ,AmpVertexIRosChiToFvSvIm(2,5,6,6),AmpVertexIRdrChiToFvSvIm(2,5,6,6), AmpSumChiToFvSvIm(2,5,6,6), AmpSum2ChiToFvSvIm(2,5,6,6) 
Complex(dp) :: AmpTreeZChiToFvSvIm(2,5,6,6),AmpWaveZChiToFvSvIm(2,5,6,6),AmpVertexZChiToFvSvIm(2,5,6,6) 
Real(dp) :: AmpSqChiToFvSvIm(5,6,6),  AmpSqTreeChiToFvSvIm(5,6,6) 
Real(dp) :: MRPChiToFvSvRe(5,6,6),MRGChiToFvSvRe(5,6,6), MRPZChiToFvSvRe(5,6,6),MRGZChiToFvSvRe(5,6,6) 
Real(dp) :: MVPChiToFvSvRe(5,6,6) 
Real(dp) :: RMsqTreeChiToFvSvRe(5,6,6),RMsqWaveChiToFvSvRe(5,6,6),RMsqVertexChiToFvSvRe(5,6,6) 
Complex(dp) :: AmpTreeChiToFvSvRe(2,5,6,6),AmpWaveChiToFvSvRe(2,5,6,6)=(0._dp,0._dp),AmpVertexChiToFvSvRe(2,5,6,6)& 
 & ,AmpVertexIRosChiToFvSvRe(2,5,6,6),AmpVertexIRdrChiToFvSvRe(2,5,6,6), AmpSumChiToFvSvRe(2,5,6,6), AmpSum2ChiToFvSvRe(2,5,6,6) 
Complex(dp) :: AmpTreeZChiToFvSvRe(2,5,6,6),AmpWaveZChiToFvSvRe(2,5,6,6),AmpVertexZChiToFvSvRe(2,5,6,6) 
Real(dp) :: AmpSqChiToFvSvRe(5,6,6),  AmpSqTreeChiToFvSvRe(5,6,6) 
Real(dp) :: MRPChiToChiVP(5,5),MRGChiToChiVP(5,5), MRPZChiToChiVP(5,5),MRGZChiToChiVP(5,5) 
Real(dp) :: MVPChiToChiVP(5,5) 
Real(dp) :: RMsqTreeChiToChiVP(5,5),RMsqWaveChiToChiVP(5,5),RMsqVertexChiToChiVP(5,5) 
Complex(dp) :: AmpTreeChiToChiVP(4,5,5),AmpWaveChiToChiVP(4,5,5)=(0._dp,0._dp),AmpVertexChiToChiVP(4,5,5)& 
 & ,AmpVertexIRosChiToChiVP(4,5,5),AmpVertexIRdrChiToChiVP(4,5,5), AmpSumChiToChiVP(4,5,5), AmpSum2ChiToChiVP(4,5,5) 
Complex(dp) :: AmpTreeZChiToChiVP(4,5,5),AmpWaveZChiToChiVP(4,5,5),AmpVertexZChiToChiVP(4,5,5) 
Real(dp) :: AmpSqChiToChiVP(5,5),  AmpSqTreeChiToChiVP(5,5) 
Real(dp) :: MRPChiToGluVG(5),MRGChiToGluVG(5), MRPZChiToGluVG(5),MRGZChiToGluVG(5) 
Real(dp) :: MVPChiToGluVG(5) 
Real(dp) :: RMsqTreeChiToGluVG(5),RMsqWaveChiToGluVG(5),RMsqVertexChiToGluVG(5) 
Complex(dp) :: AmpTreeChiToGluVG(4,5),AmpWaveChiToGluVG(4,5)=(0._dp,0._dp),AmpVertexChiToGluVG(4,5)& 
 & ,AmpVertexIRosChiToGluVG(4,5),AmpVertexIRdrChiToGluVG(4,5), AmpSumChiToGluVG(4,5), AmpSum2ChiToGluVG(4,5) 
Complex(dp) :: AmpTreeZChiToGluVG(4,5),AmpWaveZChiToGluVG(4,5),AmpVertexZChiToGluVG(4,5) 
Real(dp) :: AmpSqChiToGluVG(5),  AmpSqTreeChiToGluVG(5) 
Write(*,*) "Calculating one-loop decays of Chi " 
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
! Chi Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToChiAh(cplChiChiAhL,cplChiChiAhR,MAh,            & 
& MChi,MAh2,MChi2,AmpTreeChiToChiAh)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToChiAh(ZcplChiChiAhL,ZcplChiChiAhR,              & 
& MAh,MChi,MAh2,MChi2,AmpTreeChiToChiAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChiAh(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,      & 
& MAhOS,MChiOS,MRPChiToChiAh,MRGChiToChiAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChiAh(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,    & 
& MAhOS,MChiOS,MRPChiToChiAh,MRGChiToChiAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToChiAh(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,      & 
& MAh,MChi,MRPChiToChiAh,MRGChiToChiAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChiAh(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,    & 
& MAh,MChi,MRPChiToChiAh,MRGChiToChiAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToChiAh(cplChiChiAhL,cplChiChiAhR,ctcplChiChiAhL, & 
& ctcplChiChiAhR,MAh,MAh2,MChi,MChi2,ZfAh,ZfL0,AmpWaveChiToChiAh)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,       & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,    & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL, & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexChiToChiAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,               & 
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
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRdrChiToChiAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiAh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,             & 
& cplcChaChaAhL,cplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,       & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,    & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL, & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,     & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiAh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,             & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,       & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,    & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL, & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,               & 
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
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

 End if 
 End if 
AmpVertexChiToChiAh = AmpVertexChiToChiAh -  AmpVertexIRdrChiToChiAh! +  AmpVertexIRosChiToChiAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChiAh=0._dp 
AmpVertexZChiToChiAh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToChiAh(1,gt2,:,:) = AmpWaveZChiToChiAh(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiAh(1,gt1,:,:) 
AmpVertexZChiToChiAh(1,gt2,:,:)= AmpVertexZChiToChiAh(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiAh(1,gt1,:,:) 
AmpWaveZChiToChiAh(2,gt2,:,:) = AmpWaveZChiToChiAh(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiAh(2,gt1,:,:) 
AmpVertexZChiToChiAh(2,gt2,:,:)= AmpVertexZChiToChiAh(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiAh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToChiAh=AmpWaveZChiToChiAh 
AmpVertexChiToChiAh= AmpVertexZChiToChiAh
! Final State 1 
AmpWaveZChiToChiAh=0._dp 
AmpVertexZChiToChiAh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToChiAh(1,:,gt2,:) = AmpWaveZChiToChiAh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiAh(1,:,gt1,:) 
AmpVertexZChiToChiAh(1,:,gt2,:)= AmpVertexZChiToChiAh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChiToChiAh(1,:,gt1,:) 
AmpWaveZChiToChiAh(2,:,gt2,:) = AmpWaveZChiToChiAh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiAh(2,:,gt1,:) 
AmpVertexZChiToChiAh(2,:,gt2,:)= AmpVertexZChiToChiAh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiAh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChiAh=AmpWaveZChiToChiAh 
AmpVertexChiToChiAh= AmpVertexZChiToChiAh
! Final State 2 
AmpWaveZChiToChiAh=0._dp 
AmpVertexZChiToChiAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToChiAh(:,:,:,gt2) = AmpWaveZChiToChiAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveChiToChiAh(:,:,:,gt1) 
AmpVertexZChiToChiAh(:,:,:,gt2)= AmpVertexZChiToChiAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexChiToChiAh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChiAh=AmpWaveZChiToChiAh 
AmpVertexChiToChiAh= AmpVertexZChiToChiAh
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChiAh = AmpVertexChiToChiAh  +  AmpVertexIRosChiToChiAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChiAh = AmpTreeChiToChiAh 
 AmpSum2ChiToChiAh = AmpTreeChiToChiAh + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh  
Else 
 AmpSumChiToChiAh = AmpTreeChiToChiAh + AmpWaveChiToChiAh + AmpVertexChiToChiAh
 AmpSum2ChiToChiAh = AmpTreeChiToChiAh + AmpWaveChiToChiAh + AmpVertexChiToChiAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiAh = AmpTreeChiToChiAh
 AmpSum2ChiToChiAh = AmpTreeChiToChiAh 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
    Do gt3=2,3
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChiOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MChi(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChiAh(gt1, gt2, gt3) 
  AmpSum2ChiToChiAh = 2._dp*AmpWaveChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChiAh(gt1, gt2, gt3) 
  AmpSum2ChiToChiAh = 2._dp*AmpVertexChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChiAh(gt1, gt2, gt3) 
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChiAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3)  
  AmpSum2ChiToChiAh = + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3) + AmpSqTreeChiToChiAh(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3)  
  AmpSum2ChiToChiAh = + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3) + AmpSqTreeChiToChiAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToChiAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiAh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),helfactor*AmpSqChiToChiAh(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MChi(gt2),MAh(gt3),helfactor*AmpSqChiToChiAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChiToChiAh(gt1, gt2, gt3) + MRGChiToChiAh(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChiToChiAh(gt1, gt2, gt3) + MRGChiToChiAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha Conjg(Hpm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToChacHpm(cplChiChacHpmL,cplChiChacHpmR,          & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChiToChacHpm)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToChacHpm(ZcplChiChacHpmL,ZcplChiChacHpmR,        & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChiToChacHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChacHpm(MLambda,em,gs,cplChiChacHpmL,               & 
& cplChiChacHpmR,MChaOS,MChiOS,MHpmOS,MRPChiToChacHpm,MRGChiToChacHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChacHpm(MLambda,em,gs,ZcplChiChacHpmL,              & 
& ZcplChiChacHpmR,MChaOS,MChiOS,MHpmOS,MRPChiToChacHpm,MRGChiToChacHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToChacHpm(MLambda,em,gs,cplChiChacHpmL,               & 
& cplChiChacHpmR,MCha,MChi,MHpm,MRPChiToChacHpm,MRGChiToChacHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChacHpm(MLambda,em,gs,ZcplChiChacHpmL,              & 
& ZcplChiChacHpmR,MCha,MChi,MHpm,MRPChiToChacHpm,MRGChiToChacHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToChacHpm(cplChiChacHpmL,cplChiChacHpmR,          & 
& ctcplChiChacHpmL,ctcplChiChacHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,              & 
& ZfL0,ZfLm,ZfLp,AmpWaveChiToChacHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
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
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexChiToChacHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,             & 
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
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRdrChiToChacHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacHpm(MAhOS,MChaOS,MChiOS,               & 
& MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,            & 
& MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,        & 
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
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosChiToChacHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,             & 
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
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosChiToChacHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacHpm(MAhOS,MChaOS,MChiOS,               & 
& MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,            & 
& MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,        & 
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
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosChiToChacHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,             & 
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
& cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosChiToChacHpm)

 End if 
 End if 
AmpVertexChiToChacHpm = AmpVertexChiToChacHpm -  AmpVertexIRdrChiToChacHpm! +  AmpVertexIRosChiToChacHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChacHpm=0._dp 
AmpVertexZChiToChacHpm=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToChacHpm(1,gt2,:,:) = AmpWaveZChiToChacHpm(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChacHpm(1,gt1,:,:) 
AmpVertexZChiToChacHpm(1,gt2,:,:)= AmpVertexZChiToChacHpm(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChacHpm(1,gt1,:,:) 
AmpWaveZChiToChacHpm(2,gt2,:,:) = AmpWaveZChiToChacHpm(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChacHpm(2,gt1,:,:) 
AmpVertexZChiToChacHpm(2,gt2,:,:)= AmpVertexZChiToChacHpm(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChacHpm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToChacHpm=AmpWaveZChiToChacHpm 
AmpVertexChiToChacHpm= AmpVertexZChiToChacHpm
! Final State 1 
AmpWaveZChiToChacHpm=0._dp 
AmpVertexZChiToChacHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChacHpm(1,:,gt2,:) = AmpWaveZChiToChacHpm(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChiToChacHpm(1,:,gt1,:) 
AmpVertexZChiToChacHpm(1,:,gt2,:)= AmpVertexZChiToChacHpm(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChiToChacHpm(1,:,gt1,:) 
AmpWaveZChiToChacHpm(2,:,gt2,:) = AmpWaveZChiToChacHpm(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChiToChacHpm(2,:,gt1,:) 
AmpVertexZChiToChacHpm(2,:,gt2,:)= AmpVertexZChiToChacHpm(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChiToChacHpm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChacHpm=AmpWaveZChiToChacHpm 
AmpVertexChiToChacHpm= AmpVertexZChiToChacHpm
! Final State 2 
AmpWaveZChiToChacHpm=0._dp 
AmpVertexZChiToChacHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChacHpm(:,:,:,gt2) = AmpWaveZChiToChacHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveChiToChacHpm(:,:,:,gt1) 
AmpVertexZChiToChacHpm(:,:,:,gt2)= AmpVertexZChiToChacHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexChiToChacHpm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChacHpm=AmpWaveZChiToChacHpm 
AmpVertexChiToChacHpm= AmpVertexZChiToChacHpm
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChacHpm = AmpVertexChiToChacHpm  +  AmpVertexIRosChiToChacHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Cha conj[Hpm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChacHpm = AmpTreeChiToChacHpm 
 AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm  
Else 
 AmpSumChiToChacHpm = AmpTreeChiToChacHpm + AmpWaveChiToChacHpm + AmpVertexChiToChacHpm
 AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm + AmpWaveChiToChacHpm + AmpVertexChiToChacHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChacHpm = AmpTreeChiToChacHpm
 AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,2
    Do gt3=2,2
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChaOS(gt2)+MHpmOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MCha(gt2)+MHpm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
  AmpSum2ChiToChacHpm = 2._dp*AmpWaveChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
  AmpSum2ChiToChacHpm = 2._dp*AmpVertexChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqTreeChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3)  
  AmpSum2ChiToChacHpm = + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3) + AmpSqTreeChiToChacHpm(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqTreeChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3)  
  AmpSum2ChiToChacHpm = + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3) + AmpSqTreeChiToChacHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToChacHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChacHpm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),helfactor*AmpSqChiToChacHpm(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MCha(gt2),MHpm(gt3),helfactor*AmpSqChiToChacHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChacHpm(gt1, gt2, gt3) + MRGChiToChacHpm(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChacHpm(gt1, gt2, gt3) + MRGChiToChacHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToChacVWm(cplChiChacVWmL,cplChiChacVWmR,          & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChiToChacVWm)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToChacVWm(ZcplChiChacVWmL,ZcplChiChacVWmR,        & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChiToChacVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChacVWm(MLambda,em,gs,cplChiChacVWmL,               & 
& cplChiChacVWmR,MChaOS,MChiOS,MVWmOS,MRPChiToChacVWm,MRGChiToChacVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChacVWm(MLambda,em,gs,ZcplChiChacVWmL,              & 
& ZcplChiChacVWmR,MChaOS,MChiOS,MVWmOS,MRPChiToChacVWm,MRGChiToChacVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToChacVWm(MLambda,em,gs,cplChiChacVWmL,               & 
& cplChiChacVWmR,MCha,MChi,MVWm,MRPChiToChacVWm,MRGChiToChacVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChacVWm(MLambda,em,gs,ZcplChiChacVWmL,              & 
& ZcplChiChacVWmR,MCha,MChi,MVWm,MRPChiToChacVWm,MRGChiToChacVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToChacVWm(cplChiChacVWmL,cplChiChacVWmR,          & 
& ctcplChiChacVWmL,ctcplChiChacVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,               & 
& ZfLm,ZfLp,ZfVWm,AmpWaveChiToChacVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,   & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,        & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexChiToChacVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,             & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,   & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,        & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRdrChiToChacVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacVWm(MAhOS,MChaOS,MChiOS,               & 
& MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,            & 
& MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,        & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,GosZcplChiChacHpmL,               & 
& GosZcplChiChacHpmR,ZcplChiChacVWmL,ZcplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,          & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,             & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,GosZcplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,     & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRosChiToChacVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,             & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,GZcplChiChacHpmL,GZcplChiChacHpmR,& 
& ZcplChiChacVWmL,ZcplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,   & 
& cplhhHpmcVWm,cplhhcVWmVWm,GZcplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,      & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRosChiToChacVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacVWm(MAhOS,MChaOS,MChiOS,               & 
& MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,            & 
& MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,        & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,GcplChiChacHpmL,GcplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,   & 
& cplhhHpmcVWm,cplhhcVWmVWm,GcplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,       & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRosChiToChacVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,             & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,   & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,cplSeSvImcVWm,        & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRosChiToChacVWm)

 End if 
 End if 
AmpVertexChiToChacVWm = AmpVertexChiToChacVWm -  AmpVertexIRdrChiToChacVWm! +  AmpVertexIRosChiToChacVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChacVWm=0._dp 
AmpVertexZChiToChacVWm=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToChacVWm(1,gt2,:) = AmpWaveZChiToChacVWm(1,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChacVWm(1,gt1,:) 
AmpVertexZChiToChacVWm(1,gt2,:)= AmpVertexZChiToChacVWm(1,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChacVWm(1,gt1,:) 
AmpWaveZChiToChacVWm(2,gt2,:) = AmpWaveZChiToChacVWm(2,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChacVWm(2,gt1,:) 
AmpVertexZChiToChacVWm(2,gt2,:)= AmpVertexZChiToChacVWm(2,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChacVWm(2,gt1,:) 
AmpWaveZChiToChacVWm(3,gt2,:) = AmpWaveZChiToChacVWm(3,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChacVWm(3,gt1,:) 
AmpVertexZChiToChacVWm(3,gt2,:)= AmpVertexZChiToChacVWm(3,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChacVWm(3,gt1,:) 
AmpWaveZChiToChacVWm(4,gt2,:) = AmpWaveZChiToChacVWm(4,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChacVWm(4,gt1,:) 
AmpVertexZChiToChacVWm(4,gt2,:)= AmpVertexZChiToChacVWm(4,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChacVWm(4,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChacVWm=AmpWaveZChiToChacVWm 
AmpVertexChiToChacVWm= AmpVertexZChiToChacVWm
! Final State 1 
AmpWaveZChiToChacVWm=0._dp 
AmpVertexZChiToChacVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChacVWm(1,:,gt2) = AmpWaveZChiToChacVWm(1,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChiToChacVWm(1,:,gt1) 
AmpVertexZChiToChacVWm(1,:,gt2)= AmpVertexZChiToChacVWm(1,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChiToChacVWm(1,:,gt1) 
AmpWaveZChiToChacVWm(2,:,gt2) = AmpWaveZChiToChacVWm(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChiToChacVWm(2,:,gt1) 
AmpVertexZChiToChacVWm(2,:,gt2)= AmpVertexZChiToChacVWm(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChiToChacVWm(2,:,gt1) 
AmpWaveZChiToChacVWm(3,:,gt2) = AmpWaveZChiToChacVWm(3,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChiToChacVWm(3,:,gt1) 
AmpVertexZChiToChacVWm(3,:,gt2)= AmpVertexZChiToChacVWm(3,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChiToChacVWm(3,:,gt1) 
AmpWaveZChiToChacVWm(4,:,gt2) = AmpWaveZChiToChacVWm(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChiToChacVWm(4,:,gt1) 
AmpVertexZChiToChacVWm(4,:,gt2)= AmpVertexZChiToChacVWm(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChiToChacVWm(4,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChacVWm=AmpWaveZChiToChacVWm 
AmpVertexChiToChacVWm= AmpVertexZChiToChacVWm
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChacVWm = AmpVertexChiToChacVWm  +  AmpVertexIRosChiToChacVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Cha conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChacVWm = AmpTreeChiToChacVWm 
 AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm  
Else 
 AmpSumChiToChacVWm = AmpTreeChiToChacVWm + AmpWaveChiToChacVWm + AmpVertexChiToChacVWm
 AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm + AmpWaveChiToChacVWm + AmpVertexChiToChacVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChacVWm = AmpTreeChiToChacVWm
 AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChaOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MCha(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChacVWm(gt1, gt2) 
  AmpSum2ChiToChacVWm = 2._dp*AmpWaveChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChacVWm(gt1, gt2) 
  AmpSum2ChiToChacVWm = 2._dp*AmpVertexChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChacVWm(gt1, gt2) 
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChacVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqTreeChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2)  
  AmpSum2ChiToChacVWm = + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2) + AmpSqTreeChiToChacVWm(gt1, gt2)  
Else  
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqTreeChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2)  
  AmpSum2ChiToChacVWm = + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2) + AmpSqTreeChiToChacVWm(gt1, gt2)  
End if  
Else  
  AmpSqChiToChacVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChacVWm(gt1, gt2).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChaOS(gt2),MVWmOS,helfactor*AmpSqChiToChacVWm(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MCha(gt2),MVWm,helfactor*AmpSqChiToChacVWm(gt1, gt2))
End if 
If ((Abs(MRPChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChacVWm(gt1, gt2) + MRGChiToChacVWm(gt1, gt2)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChacVWm(gt1, gt2) + MRGChiToChacVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToChihh(cplChiChihhL,cplChiChihhR,MChi,           & 
& Mhh,MChi2,Mhh2,AmpTreeChiToChihh)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToChihh(ZcplChiChihhL,ZcplChiChihhR,              & 
& MChi,Mhh,MChi2,Mhh2,AmpTreeChiToChihh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChihh(MLambda,em,gs,cplChiChihhL,cplChiChihhR,      & 
& MChiOS,MhhOS,MRPChiToChihh,MRGChiToChihh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChihh(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,    & 
& MChiOS,MhhOS,MRPChiToChihh,MRGChiToChihh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToChihh(MLambda,em,gs,cplChiChihhL,cplChiChihhR,      & 
& MChi,Mhh,MRPChiToChihh,MRGChiToChihh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChihh(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,    & 
& MChi,Mhh,MRPChiToChihh,MRGChiToChihh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToChihh(cplChiChihhL,cplChiChihhR,ctcplChiChihhL, & 
& ctcplChiChihhR,MChi,MChi2,Mhh,Mhh2,Zfhh,ZfL0,AmpWaveChiToChihh)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
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
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexChiToChihh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChihh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplChiChiAhL,cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRdrChiToChihh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChihh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
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
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRosChiToChihh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChihh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplChiChiAhL,cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,ZcplChiChihhL,               & 
& ZcplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,        & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRosChiToChihh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChihh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
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
& cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRosChiToChihh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChihh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhhh,           & 
& cplChiChiAhL,cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRosChiToChihh)

 End if 
 End if 
AmpVertexChiToChihh = AmpVertexChiToChihh -  AmpVertexIRdrChiToChihh! +  AmpVertexIRosChiToChihh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChihh=0._dp 
AmpVertexZChiToChihh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToChihh(1,gt2,:,:) = AmpWaveZChiToChihh(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChihh(1,gt1,:,:) 
AmpVertexZChiToChihh(1,gt2,:,:)= AmpVertexZChiToChihh(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChihh(1,gt1,:,:) 
AmpWaveZChiToChihh(2,gt2,:,:) = AmpWaveZChiToChihh(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChihh(2,gt1,:,:) 
AmpVertexZChiToChihh(2,gt2,:,:)= AmpVertexZChiToChihh(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChihh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToChihh=AmpWaveZChiToChihh 
AmpVertexChiToChihh= AmpVertexZChiToChihh
! Final State 1 
AmpWaveZChiToChihh=0._dp 
AmpVertexZChiToChihh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToChihh(1,:,gt2,:) = AmpWaveZChiToChihh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChihh(1,:,gt1,:) 
AmpVertexZChiToChihh(1,:,gt2,:)= AmpVertexZChiToChihh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChiToChihh(1,:,gt1,:) 
AmpWaveZChiToChihh(2,:,gt2,:) = AmpWaveZChiToChihh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChihh(2,:,gt1,:) 
AmpVertexZChiToChihh(2,:,gt2,:)= AmpVertexZChiToChihh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChiToChihh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChihh=AmpWaveZChiToChihh 
AmpVertexChiToChihh= AmpVertexZChiToChihh
! Final State 2 
AmpWaveZChiToChihh=0._dp 
AmpVertexZChiToChihh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToChihh(:,:,:,gt2) = AmpWaveZChiToChihh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveChiToChihh(:,:,:,gt1) 
AmpVertexZChiToChihh(:,:,:,gt2)= AmpVertexZChiToChihh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexChiToChihh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChihh=AmpWaveZChiToChihh 
AmpVertexChiToChihh= AmpVertexZChiToChihh
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChihh = AmpVertexChiToChihh  +  AmpVertexIRosChiToChihh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChihh = AmpTreeChiToChihh 
 AmpSum2ChiToChihh = AmpTreeChiToChihh + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh  
Else 
 AmpSumChiToChihh = AmpTreeChiToChihh + AmpWaveChiToChihh + AmpVertexChiToChihh
 AmpSum2ChiToChihh = AmpTreeChiToChihh + AmpWaveChiToChihh + AmpVertexChiToChihh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChihh = AmpTreeChiToChihh
 AmpSum2ChiToChihh = AmpTreeChiToChihh 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
    Do gt3=1,3
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChiOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MChi(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToChihh = AmpTreeChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChihh(gt1, gt2, gt3) 
  AmpSum2ChiToChihh = 2._dp*AmpWaveChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChihh(gt1, gt2, gt3) 
  AmpSum2ChiToChihh = 2._dp*AmpVertexChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChihh(gt1, gt2, gt3) 
  AmpSum2ChiToChihh = AmpTreeChiToChihh + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChihh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChihh = AmpTreeChiToChihh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3)  
  AmpSum2ChiToChihh = + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3) + AmpSqTreeChiToChihh(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToChihh = AmpTreeChiToChihh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3)  
  AmpSum2ChiToChihh = + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3) + AmpSqTreeChiToChihh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToChihh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChihh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),helfactor*AmpSqChiToChihh(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MChi(gt2),Mhh(gt3),helfactor*AmpSqChiToChihh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChiToChihh(gt1, gt2, gt3) + MRGChiToChihh(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChiToChihh(gt1, gt2, gt3) + MRGChiToChihh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToChiVZ(cplChiChiVZL,cplChiChiVZR,MChi,           & 
& MVZ,MChi2,MVZ2,AmpTreeChiToChiVZ)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToChiVZ(ZcplChiChiVZL,ZcplChiChiVZR,              & 
& MChi,MVZ,MChi2,MVZ2,AmpTreeChiToChiVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChiVZ(MLambda,em,gs,cplChiChiVZL,cplChiChiVZR,      & 
& MChiOS,MVZOS,MRPChiToChiVZ,MRGChiToChiVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChiVZ(MLambda,em,gs,ZcplChiChiVZL,ZcplChiChiVZR,    & 
& MChiOS,MVZOS,MRPChiToChiVZ,MRGChiToChiVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToChiVZ(MLambda,em,gs,cplChiChiVZL,cplChiChiVZR,      & 
& MChi,MVZ,MRPChiToChiVZ,MRGChiToChiVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToChiVZ(MLambda,em,gs,ZcplChiChiVZL,ZcplChiChiVZR,    & 
& MChi,MVZ,MRPChiToChiVZ,MRGChiToChiVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToChiVZ(cplChiChiVZL,cplChiChiVZR,ctcplChiChiVZL, & 
& ctcplChiChiVZR,MChi,MChi2,MVZ,MVZ2,ZfL0,ZfVZ,AmpWaveChiToChiVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,              & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,             & 
& cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& AmpVertexChiToChiVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,        & 
& cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& AmpVertexIRdrChiToChiVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiVZ(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplChiChiAhL,cplChiChiAhR,       & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,ZcplChiChiVZL,ZcplChiChiVZR,cplChiFdcSdL,      & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& AmpVertexIRosChiToChiVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,        & 
& cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,ZcplChiChiVZL,ZcplChiChiVZR,     & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& AmpVertexIRosChiToChiVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiVZ(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,               & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplChiChiAhL,cplChiChiAhR,       & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& AmpVertexIRosChiToChiVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,        & 
& cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,              & 
& AmpVertexIRosChiToChiVZ)

 End if 
 End if 
AmpVertexChiToChiVZ = AmpVertexChiToChiVZ -  AmpVertexIRdrChiToChiVZ! +  AmpVertexIRosChiToChiVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChiVZ=0._dp 
AmpVertexZChiToChiVZ=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToChiVZ(1,gt2,:) = AmpWaveZChiToChiVZ(1,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(1,gt1,:) 
AmpVertexZChiToChiVZ(1,gt2,:)= AmpVertexZChiToChiVZ(1,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(1,gt1,:) 
AmpWaveZChiToChiVZ(2,gt2,:) = AmpWaveZChiToChiVZ(2,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(2,gt1,:) 
AmpVertexZChiToChiVZ(2,gt2,:)= AmpVertexZChiToChiVZ(2,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(2,gt1,:) 
AmpWaveZChiToChiVZ(3,gt2,:) = AmpWaveZChiToChiVZ(3,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(3,gt1,:) 
AmpVertexZChiToChiVZ(3,gt2,:)= AmpVertexZChiToChiVZ(3,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(3,gt1,:) 
AmpWaveZChiToChiVZ(4,gt2,:) = AmpWaveZChiToChiVZ(4,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(4,gt1,:) 
AmpVertexZChiToChiVZ(4,gt2,:)= AmpVertexZChiToChiVZ(4,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChiVZ=AmpWaveZChiToChiVZ 
AmpVertexChiToChiVZ= AmpVertexZChiToChiVZ
! Final State 1 
AmpWaveZChiToChiVZ=0._dp 
AmpVertexZChiToChiVZ=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToChiVZ(1,:,gt2) = AmpWaveZChiToChiVZ(1,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(1,:,gt1) 
AmpVertexZChiToChiVZ(1,:,gt2)= AmpVertexZChiToChiVZ(1,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(1,:,gt1) 
AmpWaveZChiToChiVZ(2,:,gt2) = AmpWaveZChiToChiVZ(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(2,:,gt1) 
AmpVertexZChiToChiVZ(2,:,gt2)= AmpVertexZChiToChiVZ(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(2,:,gt1) 
AmpWaveZChiToChiVZ(3,:,gt2) = AmpWaveZChiToChiVZ(3,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(3,:,gt1) 
AmpVertexZChiToChiVZ(3,:,gt2)= AmpVertexZChiToChiVZ(3,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(3,:,gt1) 
AmpWaveZChiToChiVZ(4,:,gt2) = AmpWaveZChiToChiVZ(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(4,:,gt1) 
AmpVertexZChiToChiVZ(4,:,gt2)= AmpVertexZChiToChiVZ(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChiVZ=AmpWaveZChiToChiVZ 
AmpVertexChiToChiVZ= AmpVertexZChiToChiVZ
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChiVZ = AmpVertexChiToChiVZ  +  AmpVertexIRosChiToChiVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChiVZ = AmpTreeChiToChiVZ 
 AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ  
Else 
 AmpSumChiToChiVZ = AmpTreeChiToChiVZ + AmpWaveChiToChiVZ + AmpVertexChiToChiVZ
 AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ + AmpWaveChiToChiVZ + AmpVertexChiToChiVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiVZ = AmpTreeChiToChiVZ
 AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChiOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MChi(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChiVZ(gt1, gt2) 
  AmpSum2ChiToChiVZ = 2._dp*AmpWaveChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChiVZ(gt1, gt2) 
  AmpSum2ChiToChiVZ = 2._dp*AmpVertexChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChiVZ(gt1, gt2) 
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChiVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqTreeChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2)  
  AmpSum2ChiToChiVZ = + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2) + AmpSqTreeChiToChiVZ(gt1, gt2)  
Else  
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqTreeChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2)  
  AmpSum2ChiToChiVZ = + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2) + AmpSqTreeChiToChiVZ(gt1, gt2)  
End if  
Else  
  AmpSqChiToChiVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiVZ(gt1, gt2).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MVZOS,helfactor*AmpSqChiToChiVZ(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MChi(gt2),MVZ,helfactor*AmpSqChiToChiVZ(gt1, gt2))
End if 
If ((Abs(MRPChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChiToChiVZ(gt1, gt2) + MRGChiToChiVZ(gt1, gt2)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChiToChiVZ(gt1, gt2) + MRGChiToChiVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fd Conjg(Sd)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToFdcSd(cplChiFdcSdL,cplChiFdcSdR,MChi,           & 
& MFd,MSd,MChi2,MFd2,MSd2,AmpTreeChiToFdcSd)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToFdcSd(ZcplChiFdcSdL,ZcplChiFdcSdR,              & 
& MChi,MFd,MSd,MChi2,MFd2,MSd2,AmpTreeChiToFdcSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFdcSd(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,      & 
& MChiOS,MFdOS,MSdOS,MRPChiToFdcSd,MRGChiToFdcSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFdcSd(MLambda,em,gs,ZcplChiFdcSdL,ZcplChiFdcSdR,    & 
& MChiOS,MFdOS,MSdOS,MRPChiToFdcSd,MRGChiToFdcSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToFdcSd(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,      & 
& MChi,MFd,MSd,MRPChiToFdcSd,MRGChiToFdcSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFdcSd(MLambda,em,gs,ZcplChiFdcSdL,ZcplChiFdcSdR,    & 
& MChi,MFd,MSd,MRPChiToFdcSd,MRGChiToFdcSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToFdcSd(cplChiFdcSdL,cplChiFdcSdR,ctcplChiFdcSdL, & 
& ctcplChiFdcSdR,MChi,MChi2,MFd,MFd2,MSd,MSd2,ZfFDL,ZfFDR,ZfL0,ZfSd,AmpWaveChiToFdcSd)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,            & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,AmpVertexChiToFdcSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,       & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,AmpVertexIRdrChiToFdcSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFdcSd(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,    & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,ZcplChiFdcSdL,ZcplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,     & 
& AmpVertexIRosChiToFdcSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,       & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& ZcplChiFdcSdL,ZcplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,AmpVertexIRosChiToFdcSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFdcSd(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,    & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,         & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,     & 
& AmpVertexIRosChiToFdcSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,       & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,           & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,        & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,AmpVertexIRosChiToFdcSd)

 End if 
 End if 
AmpVertexChiToFdcSd = AmpVertexChiToFdcSd -  AmpVertexIRdrChiToFdcSd! +  AmpVertexIRosChiToFdcSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFdcSd=0._dp 
AmpVertexZChiToFdcSd=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToFdcSd(1,gt2,:,:) = AmpWaveZChiToFdcSd(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFdcSd(1,gt1,:,:) 
AmpVertexZChiToFdcSd(1,gt2,:,:)= AmpVertexZChiToFdcSd(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFdcSd(1,gt1,:,:) 
AmpWaveZChiToFdcSd(2,gt2,:,:) = AmpWaveZChiToFdcSd(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFdcSd(2,gt1,:,:) 
AmpVertexZChiToFdcSd(2,gt2,:,:)= AmpVertexZChiToFdcSd(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFdcSd(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFdcSd=AmpWaveZChiToFdcSd 
AmpVertexChiToFdcSd= AmpVertexZChiToFdcSd
! Final State 1 
AmpWaveZChiToFdcSd=0._dp 
AmpVertexZChiToFdcSd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFdcSd(1,:,gt2,:) = AmpWaveZChiToFdcSd(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpWaveChiToFdcSd(1,:,gt1,:) 
AmpVertexZChiToFdcSd(1,:,gt2,:)= AmpVertexZChiToFdcSd(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpVertexChiToFdcSd(1,:,gt1,:) 
AmpWaveZChiToFdcSd(2,:,gt2,:) = AmpWaveZChiToFdcSd(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpWaveChiToFdcSd(2,:,gt1,:) 
AmpVertexZChiToFdcSd(2,:,gt2,:)= AmpVertexZChiToFdcSd(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpVertexChiToFdcSd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFdcSd=AmpWaveZChiToFdcSd 
AmpVertexChiToFdcSd= AmpVertexZChiToFdcSd
! Final State 2 
AmpWaveZChiToFdcSd=0._dp 
AmpVertexZChiToFdcSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFdcSd(:,:,:,gt2) = AmpWaveZChiToFdcSd(:,:,:,gt2)+ZRUZDc(gt2,gt1)*AmpWaveChiToFdcSd(:,:,:,gt1) 
AmpVertexZChiToFdcSd(:,:,:,gt2)= AmpVertexZChiToFdcSd(:,:,:,gt2)+ZRUZDc(gt2,gt1)*AmpVertexChiToFdcSd(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFdcSd=AmpWaveZChiToFdcSd 
AmpVertexChiToFdcSd= AmpVertexZChiToFdcSd
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFdcSd = AmpVertexChiToFdcSd  +  AmpVertexIRosChiToFdcSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fd conj[Sd] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFdcSd = AmpTreeChiToFdcSd 
 AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd  
Else 
 AmpSumChiToFdcSd = AmpTreeChiToFdcSd + AmpWaveChiToFdcSd + AmpVertexChiToFdcSd
 AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd + AmpWaveChiToFdcSd + AmpVertexChiToFdcSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFdcSd = AmpTreeChiToFdcSd
 AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChiOS(gt1).gt.(MFdOS(gt2)+MSdOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MFd(gt2)+MSd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
  AmpSum2ChiToFdcSd = 2._dp*AmpWaveChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
  AmpSum2ChiToFdcSd = 2._dp*AmpVertexChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqTreeChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3)  
  AmpSum2ChiToFdcSd = + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3) + AmpSqTreeChiToFdcSd(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqTreeChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3)  
  AmpSum2ChiToFdcSd = + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3) + AmpSqTreeChiToFdcSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFdcSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFdcSd(gt1, gt2, gt3).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),helfactor*AmpSqChiToFdcSd(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChi(gt1),MFd(gt2),MSd(gt3),helfactor*AmpSqChiToFdcSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFdcSd(gt1, gt2, gt3) + MRGChiToFdcSd(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFdcSd(gt1, gt2, gt3) + MRGChiToFdcSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe Conjg(Se)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToFecSe(cplChiFecSeL,cplChiFecSeR,MChi,           & 
& MFe,MSe,MChi2,MFe2,MSe2,AmpTreeChiToFecSe)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToFecSe(ZcplChiFecSeL,ZcplChiFecSeR,              & 
& MChi,MFe,MSe,MChi2,MFe2,MSe2,AmpTreeChiToFecSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFecSe(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,      & 
& MChiOS,MFeOS,MSeOS,MRPChiToFecSe,MRGChiToFecSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFecSe(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,    & 
& MChiOS,MFeOS,MSeOS,MRPChiToFecSe,MRGChiToFecSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToFecSe(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,      & 
& MChi,MFe,MSe,MRPChiToFecSe,MRGChiToFecSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFecSe(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,    & 
& MChi,MFe,MSe,MRPChiToFecSe,MRGChiToFecSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToFecSe(cplChiFecSeL,cplChiFecSeR,ctcplChiFecSeL, & 
& ctcplChiFecSeR,MChi,MChi2,MFe,MFe2,MSe,MSe2,ZfFEL,ZfFER,ZfL0,ZfSe,AmpWaveChiToFecSe)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexChiToFecSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRdrChiToFecSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFecSe(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,    & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,ZcplChiFecSeL,ZcplChiFecSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,            & 
& cplSvRecSeVWm,AmpVertexIRosChiToFecSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& ZcplChiFecSeL,ZcplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosChiToFecSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFecSe(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,    & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,            & 
& cplSvRecSeVWm,AmpVertexIRosChiToFecSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosChiToFecSe)

 End if 
 End if 
AmpVertexChiToFecSe = AmpVertexChiToFecSe -  AmpVertexIRdrChiToFecSe! +  AmpVertexIRosChiToFecSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFecSe=0._dp 
AmpVertexZChiToFecSe=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToFecSe(1,gt2,:,:) = AmpWaveZChiToFecSe(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFecSe(1,gt1,:,:) 
AmpVertexZChiToFecSe(1,gt2,:,:)= AmpVertexZChiToFecSe(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFecSe(1,gt1,:,:) 
AmpWaveZChiToFecSe(2,gt2,:,:) = AmpWaveZChiToFecSe(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFecSe(2,gt1,:,:) 
AmpVertexZChiToFecSe(2,gt2,:,:)= AmpVertexZChiToFecSe(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFecSe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFecSe=AmpWaveZChiToFecSe 
AmpVertexChiToFecSe= AmpVertexZChiToFecSe
! Final State 1 
AmpWaveZChiToFecSe=0._dp 
AmpVertexZChiToFecSe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFecSe(1,:,gt2,:) = AmpWaveZChiToFecSe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveChiToFecSe(1,:,gt1,:) 
AmpVertexZChiToFecSe(1,:,gt2,:)= AmpVertexZChiToFecSe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexChiToFecSe(1,:,gt1,:) 
AmpWaveZChiToFecSe(2,:,gt2,:) = AmpWaveZChiToFecSe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveChiToFecSe(2,:,gt1,:) 
AmpVertexZChiToFecSe(2,:,gt2,:)= AmpVertexZChiToFecSe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexChiToFecSe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFecSe=AmpWaveZChiToFecSe 
AmpVertexChiToFecSe= AmpVertexZChiToFecSe
! Final State 2 
AmpWaveZChiToFecSe=0._dp 
AmpVertexZChiToFecSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFecSe(:,:,:,gt2) = AmpWaveZChiToFecSe(:,:,:,gt2)+ZRUZEc(gt2,gt1)*AmpWaveChiToFecSe(:,:,:,gt1) 
AmpVertexZChiToFecSe(:,:,:,gt2)= AmpVertexZChiToFecSe(:,:,:,gt2)+ZRUZEc(gt2,gt1)*AmpVertexChiToFecSe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFecSe=AmpWaveZChiToFecSe 
AmpVertexChiToFecSe= AmpVertexZChiToFecSe
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFecSe = AmpVertexChiToFecSe  +  AmpVertexIRosChiToFecSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fe conj[Se] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFecSe = AmpTreeChiToFecSe 
 AmpSum2ChiToFecSe = AmpTreeChiToFecSe + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe  
Else 
 AmpSumChiToFecSe = AmpTreeChiToFecSe + AmpWaveChiToFecSe + AmpVertexChiToFecSe
 AmpSum2ChiToFecSe = AmpTreeChiToFecSe + AmpWaveChiToFecSe + AmpVertexChiToFecSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFecSe = AmpTreeChiToFecSe
 AmpSum2ChiToFecSe = AmpTreeChiToFecSe 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChiOS(gt1).gt.(MFeOS(gt2)+MSeOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MFe(gt2)+MSe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFecSe(gt1, gt2, gt3) 
  AmpSum2ChiToFecSe = 2._dp*AmpWaveChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFecSe(gt1, gt2, gt3) 
  AmpSum2ChiToFecSe = 2._dp*AmpVertexChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFecSe(gt1, gt2, gt3) 
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFecSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqTreeChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3)  
  AmpSum2ChiToFecSe = + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3) + AmpSqTreeChiToFecSe(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqTreeChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3)  
  AmpSum2ChiToFecSe = + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3) + AmpSqTreeChiToFecSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFecSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFecSe(gt1, gt2, gt3).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),helfactor*AmpSqChiToFecSe(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MFe(gt2),MSe(gt3),helfactor*AmpSqChiToFecSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFecSe(gt1, gt2, gt3) + MRGChiToFecSe(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFecSe(gt1, gt2, gt3) + MRGChiToFecSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fu Conjg(Su)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToFucSu(cplChiFucSuL,cplChiFucSuR,MChi,           & 
& MFu,MSu,MChi2,MFu2,MSu2,AmpTreeChiToFucSu)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToFucSu(ZcplChiFucSuL,ZcplChiFucSuR,              & 
& MChi,MFu,MSu,MChi2,MFu2,MSu2,AmpTreeChiToFucSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFucSu(MLambda,em,gs,cplChiFucSuL,cplChiFucSuR,      & 
& MChiOS,MFuOS,MSuOS,MRPChiToFucSu,MRGChiToFucSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFucSu(MLambda,em,gs,ZcplChiFucSuL,ZcplChiFucSuR,    & 
& MChiOS,MFuOS,MSuOS,MRPChiToFucSu,MRGChiToFucSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToFucSu(MLambda,em,gs,cplChiFucSuL,cplChiFucSuR,      & 
& MChi,MFu,MSu,MRPChiToFucSu,MRGChiToFucSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFucSu(MLambda,em,gs,ZcplChiFucSuL,ZcplChiFucSuR,    & 
& MChi,MFu,MSu,MRPChiToFucSu,MRGChiToFucSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToFucSu(cplChiFucSuL,cplChiFucSuR,ctcplChiFucSuL, & 
& ctcplChiFucSuR,MChi,MChi2,MFu,MFu2,MSu,MSu2,ZfFUL,ZfFUR,ZfL0,ZfSu,AmpWaveChiToFucSu)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,            & 
& cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplhhSucSu,cplSdcHpmcSu,             & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexChiToFucSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,       & 
& cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplhhSucSu,cplSdcHpmcSu,             & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRdrChiToFucSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFucSu(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,    & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,ZcplChiFucSuL,        & 
& ZcplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,    & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,   & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,     & 
& AmpVertexIRosChiToFucSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,       & 
& cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,ZcplChiFucSuL,ZcplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplhhSucSu,cplSdcHpmcSu,             & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRosChiToFucSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFucSu(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,    & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,         & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,   & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,     & 
& AmpVertexIRosChiToFucSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,       & 
& cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplhhSucSu,cplSdcHpmcSu,             & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRosChiToFucSu)

 End if 
 End if 
AmpVertexChiToFucSu = AmpVertexChiToFucSu -  AmpVertexIRdrChiToFucSu! +  AmpVertexIRosChiToFucSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFucSu=0._dp 
AmpVertexZChiToFucSu=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToFucSu(1,gt2,:,:) = AmpWaveZChiToFucSu(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFucSu(1,gt1,:,:) 
AmpVertexZChiToFucSu(1,gt2,:,:)= AmpVertexZChiToFucSu(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFucSu(1,gt1,:,:) 
AmpWaveZChiToFucSu(2,gt2,:,:) = AmpWaveZChiToFucSu(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFucSu(2,gt1,:,:) 
AmpVertexZChiToFucSu(2,gt2,:,:)= AmpVertexZChiToFucSu(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFucSu(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFucSu=AmpWaveZChiToFucSu 
AmpVertexChiToFucSu= AmpVertexZChiToFucSu
! Final State 1 
AmpWaveZChiToFucSu=0._dp 
AmpVertexZChiToFucSu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFucSu(1,:,gt2,:) = AmpWaveZChiToFucSu(1,:,gt2,:)+ZRUZUL(gt2,gt1)*AmpWaveChiToFucSu(1,:,gt1,:) 
AmpVertexZChiToFucSu(1,:,gt2,:)= AmpVertexZChiToFucSu(1,:,gt2,:)+ZRUZUL(gt2,gt1)*AmpVertexChiToFucSu(1,:,gt1,:) 
AmpWaveZChiToFucSu(2,:,gt2,:) = AmpWaveZChiToFucSu(2,:,gt2,:)+ZRUZURc(gt2,gt1)*AmpWaveChiToFucSu(2,:,gt1,:) 
AmpVertexZChiToFucSu(2,:,gt2,:)= AmpVertexZChiToFucSu(2,:,gt2,:)+ZRUZURc(gt2,gt1)*AmpVertexChiToFucSu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFucSu=AmpWaveZChiToFucSu 
AmpVertexChiToFucSu= AmpVertexZChiToFucSu
! Final State 2 
AmpWaveZChiToFucSu=0._dp 
AmpVertexZChiToFucSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFucSu(:,:,:,gt2) = AmpWaveZChiToFucSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpWaveChiToFucSu(:,:,:,gt1) 
AmpVertexZChiToFucSu(:,:,:,gt2)= AmpVertexZChiToFucSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpVertexChiToFucSu(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFucSu=AmpWaveZChiToFucSu 
AmpVertexChiToFucSu= AmpVertexZChiToFucSu
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFucSu = AmpVertexChiToFucSu  +  AmpVertexIRosChiToFucSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fu conj[Su] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFucSu = AmpTreeChiToFucSu 
 AmpSum2ChiToFucSu = AmpTreeChiToFucSu + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu  
Else 
 AmpSumChiToFucSu = AmpTreeChiToFucSu + AmpWaveChiToFucSu + AmpVertexChiToFucSu
 AmpSum2ChiToFucSu = AmpTreeChiToFucSu + AmpWaveChiToFucSu + AmpVertexChiToFucSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFucSu = AmpTreeChiToFucSu
 AmpSum2ChiToFucSu = AmpTreeChiToFucSu 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChiOS(gt1).gt.(MFuOS(gt2)+MSuOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MFu(gt2)+MSu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFucSu(gt1, gt2, gt3) 
  AmpSum2ChiToFucSu = 2._dp*AmpWaveChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFucSu(gt1, gt2, gt3) 
  AmpSum2ChiToFucSu = 2._dp*AmpVertexChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFucSu(gt1, gt2, gt3) 
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFucSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqTreeChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3)  
  AmpSum2ChiToFucSu = + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3) + AmpSqTreeChiToFucSu(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqTreeChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3)  
  AmpSum2ChiToFucSu = + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3) + AmpSqTreeChiToFucSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFucSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFucSu(gt1, gt2, gt3).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),helfactor*AmpSqChiToFucSu(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChi(gt1),MFu(gt2),MSu(gt3),helfactor*AmpSqChiToFucSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFucSu(gt1, gt2, gt3) + MRGChiToFucSu(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFucSu(gt1, gt2, gt3) + MRGChiToFucSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv SvIm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToFvSvIm(cplChiFvSvImL,cplChiFvSvImR,             & 
& MChi,MFv,MSvIm,MChi2,MFv2,MSvIm2,AmpTreeChiToFvSvIm)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToFvSvIm(ZcplChiFvSvImL,ZcplChiFvSvImR,           & 
& MChi,MFv,MSvIm,MChi2,MFv2,MSvIm2,AmpTreeChiToFvSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFvSvIm(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,   & 
& MChiOS,MFvOS,MSvImOS,MRPChiToFvSvIm,MRGChiToFvSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFvSvIm(MLambda,em,gs,ZcplChiFvSvImL,ZcplChiFvSvImR, & 
& MChiOS,MFvOS,MSvImOS,MRPChiToFvSvIm,MRGChiToFvSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToFvSvIm(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,   & 
& MChi,MFv,MSvIm,MRPChiToFvSvIm,MRGChiToFvSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFvSvIm(MLambda,em,gs,ZcplChiFvSvImL,ZcplChiFvSvImR, & 
& MChi,MFv,MSvIm,MRPChiToFvSvIm,MRGChiToFvSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToFvSvIm(cplChiFvSvImL,cplChiFvSvImR,             & 
& ctcplChiFvSvImL,ctcplChiFvSvImR,MChi,MChi2,MFv,MFv2,MSvIm,MSvIm2,ZfFV,ZfL0,            & 
& ZfSvIm,AmpWaveChiToFvSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToFvSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexChiToFvSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvIm(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRdrChiToFvSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvIm(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplChiChiAhL,     & 
& cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,         & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,       & 
& cplChiFecSeR,ZcplChiFvSvImL,ZcplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL, & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,   & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,       & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRosChiToFvSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvIm(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,ZcplChiFvSvImL,       & 
& ZcplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRosChiToFvSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvIm(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplChiChiAhL,     & 
& cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,         & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,   & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,       & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRosChiToFvSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvIm(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRosChiToFvSvIm)

 End if 
 End if 
AmpVertexChiToFvSvIm = AmpVertexChiToFvSvIm -  AmpVertexIRdrChiToFvSvIm! +  AmpVertexIRosChiToFvSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFvSvIm=0._dp 
AmpVertexZChiToFvSvIm=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToFvSvIm(1,gt2,:,:) = AmpWaveZChiToFvSvIm(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFvSvIm(1,gt1,:,:) 
AmpVertexZChiToFvSvIm(1,gt2,:,:)= AmpVertexZChiToFvSvIm(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFvSvIm(1,gt1,:,:) 
AmpWaveZChiToFvSvIm(2,gt2,:,:) = AmpWaveZChiToFvSvIm(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFvSvIm(2,gt1,:,:) 
AmpVertexZChiToFvSvIm(2,gt2,:,:)= AmpVertexZChiToFvSvIm(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFvSvIm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFvSvIm=AmpWaveZChiToFvSvIm 
AmpVertexChiToFvSvIm= AmpVertexZChiToFvSvIm
! Final State 1 
AmpWaveZChiToFvSvIm=0._dp 
AmpVertexZChiToFvSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFvSvIm(1,:,gt2,:) = AmpWaveZChiToFvSvIm(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveChiToFvSvIm(1,:,gt1,:) 
AmpVertexZChiToFvSvIm(1,:,gt2,:)= AmpVertexZChiToFvSvIm(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexChiToFvSvIm(1,:,gt1,:) 
AmpWaveZChiToFvSvIm(2,:,gt2,:) = AmpWaveZChiToFvSvIm(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveChiToFvSvIm(2,:,gt1,:) 
AmpVertexZChiToFvSvIm(2,:,gt2,:)= AmpVertexZChiToFvSvIm(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexChiToFvSvIm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFvSvIm=AmpWaveZChiToFvSvIm 
AmpVertexChiToFvSvIm= AmpVertexZChiToFvSvIm
! Final State 2 
AmpWaveZChiToFvSvIm=0._dp 
AmpVertexZChiToFvSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFvSvIm(:,:,:,gt2) = AmpWaveZChiToFvSvIm(:,:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveChiToFvSvIm(:,:,:,gt1) 
AmpVertexZChiToFvSvIm(:,:,:,gt2)= AmpVertexZChiToFvSvIm(:,:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexChiToFvSvIm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFvSvIm=AmpWaveZChiToFvSvIm 
AmpVertexChiToFvSvIm= AmpVertexZChiToFvSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFvSvIm = AmpVertexChiToFvSvIm  +  AmpVertexIRosChiToFvSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fv SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFvSvIm = AmpTreeChiToFvSvIm 
 AmpSum2ChiToFvSvIm = AmpTreeChiToFvSvIm + 2._dp*AmpWaveChiToFvSvIm + 2._dp*AmpVertexChiToFvSvIm  
Else 
 AmpSumChiToFvSvIm = AmpTreeChiToFvSvIm + AmpWaveChiToFvSvIm + AmpVertexChiToFvSvIm
 AmpSum2ChiToFvSvIm = AmpTreeChiToFvSvIm + AmpWaveChiToFvSvIm + AmpVertexChiToFvSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFvSvIm = AmpTreeChiToFvSvIm
 AmpSum2ChiToFvSvIm = AmpTreeChiToFvSvIm 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MChiOS(gt1).gt.(MFvOS(gt2)+MSvImOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MFv(gt2)+MSvIm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFvSvIm = AmpTreeChiToFvSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvImOS(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvIm(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFvSvIm(gt1, gt2, gt3) 
  AmpSum2ChiToFvSvIm = 2._dp*AmpWaveChiToFvSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvImOS(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvIm(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFvSvIm(gt1, gt2, gt3) 
  AmpSum2ChiToFvSvIm = 2._dp*AmpVertexChiToFvSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvImOS(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvIm(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFvSvIm(gt1, gt2, gt3) 
  AmpSum2ChiToFvSvIm = AmpTreeChiToFvSvIm + 2._dp*AmpWaveChiToFvSvIm + 2._dp*AmpVertexChiToFvSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvImOS(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvIm(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFvSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFvSvIm = AmpTreeChiToFvSvIm
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvImOS(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
  AmpSqTreeChiToFvSvIm(gt1, gt2, gt3) = AmpSqChiToFvSvIm(gt1, gt2, gt3)  
  AmpSum2ChiToFvSvIm = + 2._dp*AmpWaveChiToFvSvIm + 2._dp*AmpVertexChiToFvSvIm
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvImOS(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
  AmpSqChiToFvSvIm(gt1, gt2, gt3) = AmpSqChiToFvSvIm(gt1, gt2, gt3) + AmpSqTreeChiToFvSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFvSvIm = AmpTreeChiToFvSvIm
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvIm(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
  AmpSqTreeChiToFvSvIm(gt1, gt2, gt3) = AmpSqChiToFvSvIm(gt1, gt2, gt3)  
  AmpSum2ChiToFvSvIm = + 2._dp*AmpWaveChiToFvSvIm + 2._dp*AmpVertexChiToFvSvIm
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvIm(gt3),AmpSumChiToFvSvIm(:,gt1, gt2, gt3),AmpSum2ChiToFvSvIm(:,gt1, gt2, gt3),AmpSqChiToFvSvIm(gt1, gt2, gt3)) 
  AmpSqChiToFvSvIm(gt1, gt2, gt3) = AmpSqChiToFvSvIm(gt1, gt2, gt3) + AmpSqTreeChiToFvSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFvSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFvSvIm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MFvOS(gt2),MSvImOS(gt3),helfactor*AmpSqChiToFvSvIm(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MFv(gt2),MSvIm(gt3),helfactor*AmpSqChiToFvSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFvSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFvSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFvSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFvSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChiToFvSvIm(gt1, gt2, gt3) + MRGChiToFvSvIm(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChiToFvSvIm(gt1, gt2, gt3) + MRGChiToFvSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv SvRe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChiToFvSvRe(cplChiFvSvReL,cplChiFvSvReR,             & 
& MChi,MFv,MSvRe,MChi2,MFv2,MSvRe2,AmpTreeChiToFvSvRe)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChiToFvSvRe(ZcplChiFvSvReL,ZcplChiFvSvReR,           & 
& MChi,MFv,MSvRe,MChi2,MFv2,MSvRe2,AmpTreeChiToFvSvRe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFvSvRe(MLambda,em,gs,cplChiFvSvReL,cplChiFvSvReR,   & 
& MChiOS,MFvOS,MSvReOS,MRPChiToFvSvRe,MRGChiToFvSvRe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFvSvRe(MLambda,em,gs,ZcplChiFvSvReL,ZcplChiFvSvReR, & 
& MChiOS,MFvOS,MSvReOS,MRPChiToFvSvRe,MRGChiToFvSvRe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChiToFvSvRe(MLambda,em,gs,cplChiFvSvReL,cplChiFvSvReR,   & 
& MChi,MFv,MSvRe,MRPChiToFvSvRe,MRGChiToFvSvRe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChiToFvSvRe(MLambda,em,gs,ZcplChiFvSvReL,ZcplChiFvSvReR, & 
& MChi,MFv,MSvRe,MRPChiToFvSvRe,MRGChiToFvSvRe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToFvSvRe(cplChiFvSvReL,cplChiFvSvReR,             & 
& ctcplChiFvSvReL,ctcplChiFvSvReR,MChi,MChi2,MFv,MFv2,MSvRe,MSvRe2,ZfFV,ZfL0,            & 
& ZfSvRe,AmpWaveChiToFvSvRe)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToFvSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,AmpVertexChiToFvSvRe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvRe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,AmpVertexIRdrChiToFvSvRe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvRe(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplChiChiAhL,     & 
& cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,         & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,ZcplChiFvSvReL,ZcplChiFvSvReR,cplcChaChiHpmL, & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,   & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,       & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,      & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,AmpVertexIRosChiToFvSvRe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvRe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,ZcplChiFvSvReL,ZcplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,AmpVertexIRosChiToFvSvRe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvRe(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplChiChiAhL,     & 
& cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,         & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,   & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,       & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,      & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,AmpVertexIRosChiToFvSvRe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChiToFvSvRe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,         & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,AmpVertexIRosChiToFvSvRe)

 End if 
 End if 
AmpVertexChiToFvSvRe = AmpVertexChiToFvSvRe -  AmpVertexIRdrChiToFvSvRe! +  AmpVertexIRosChiToFvSvRe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFvSvRe=0._dp 
AmpVertexZChiToFvSvRe=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChiToFvSvRe(1,gt2,:,:) = AmpWaveZChiToFvSvRe(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFvSvRe(1,gt1,:,:) 
AmpVertexZChiToFvSvRe(1,gt2,:,:)= AmpVertexZChiToFvSvRe(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFvSvRe(1,gt1,:,:) 
AmpWaveZChiToFvSvRe(2,gt2,:,:) = AmpWaveZChiToFvSvRe(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFvSvRe(2,gt1,:,:) 
AmpVertexZChiToFvSvRe(2,gt2,:,:)= AmpVertexZChiToFvSvRe(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFvSvRe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFvSvRe=AmpWaveZChiToFvSvRe 
AmpVertexChiToFvSvRe= AmpVertexZChiToFvSvRe
! Final State 1 
AmpWaveZChiToFvSvRe=0._dp 
AmpVertexZChiToFvSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFvSvRe(1,:,gt2,:) = AmpWaveZChiToFvSvRe(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveChiToFvSvRe(1,:,gt1,:) 
AmpVertexZChiToFvSvRe(1,:,gt2,:)= AmpVertexZChiToFvSvRe(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexChiToFvSvRe(1,:,gt1,:) 
AmpWaveZChiToFvSvRe(2,:,gt2,:) = AmpWaveZChiToFvSvRe(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveChiToFvSvRe(2,:,gt1,:) 
AmpVertexZChiToFvSvRe(2,:,gt2,:)= AmpVertexZChiToFvSvRe(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexChiToFvSvRe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFvSvRe=AmpWaveZChiToFvSvRe 
AmpVertexChiToFvSvRe= AmpVertexZChiToFvSvRe
! Final State 2 
AmpWaveZChiToFvSvRe=0._dp 
AmpVertexZChiToFvSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFvSvRe(:,:,:,gt2) = AmpWaveZChiToFvSvRe(:,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveChiToFvSvRe(:,:,:,gt1) 
AmpVertexZChiToFvSvRe(:,:,:,gt2)= AmpVertexZChiToFvSvRe(:,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexChiToFvSvRe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFvSvRe=AmpWaveZChiToFvSvRe 
AmpVertexChiToFvSvRe= AmpVertexZChiToFvSvRe
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFvSvRe = AmpVertexChiToFvSvRe  +  AmpVertexIRosChiToFvSvRe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fv SvRe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFvSvRe = AmpTreeChiToFvSvRe 
 AmpSum2ChiToFvSvRe = AmpTreeChiToFvSvRe + 2._dp*AmpWaveChiToFvSvRe + 2._dp*AmpVertexChiToFvSvRe  
Else 
 AmpSumChiToFvSvRe = AmpTreeChiToFvSvRe + AmpWaveChiToFvSvRe + AmpVertexChiToFvSvRe
 AmpSum2ChiToFvSvRe = AmpTreeChiToFvSvRe + AmpWaveChiToFvSvRe + AmpVertexChiToFvSvRe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFvSvRe = AmpTreeChiToFvSvRe
 AmpSum2ChiToFvSvRe = AmpTreeChiToFvSvRe 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MChiOS(gt1).gt.(MFvOS(gt2)+MSvReOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MFv(gt2)+MSvRe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFvSvRe = AmpTreeChiToFvSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvReOS(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvRe(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFvSvRe(gt1, gt2, gt3) 
  AmpSum2ChiToFvSvRe = 2._dp*AmpWaveChiToFvSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvReOS(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvRe(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFvSvRe(gt1, gt2, gt3) 
  AmpSum2ChiToFvSvRe = 2._dp*AmpVertexChiToFvSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvReOS(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvRe(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFvSvRe(gt1, gt2, gt3) 
  AmpSum2ChiToFvSvRe = AmpTreeChiToFvSvRe + 2._dp*AmpWaveChiToFvSvRe + 2._dp*AmpVertexChiToFvSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvReOS(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvRe(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFvSvRe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFvSvRe = AmpTreeChiToFvSvRe
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvReOS(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
  AmpSqTreeChiToFvSvRe(gt1, gt2, gt3) = AmpSqChiToFvSvRe(gt1, gt2, gt3)  
  AmpSum2ChiToFvSvRe = + 2._dp*AmpWaveChiToFvSvRe + 2._dp*AmpVertexChiToFvSvRe
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvReOS(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
  AmpSqChiToFvSvRe(gt1, gt2, gt3) = AmpSqChiToFvSvRe(gt1, gt2, gt3) + AmpSqTreeChiToFvSvRe(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFvSvRe = AmpTreeChiToFvSvRe
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvRe(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
  AmpSqTreeChiToFvSvRe(gt1, gt2, gt3) = AmpSqChiToFvSvRe(gt1, gt2, gt3)  
  AmpSum2ChiToFvSvRe = + 2._dp*AmpWaveChiToFvSvRe + 2._dp*AmpVertexChiToFvSvRe
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSvRe(gt3),AmpSumChiToFvSvRe(:,gt1, gt2, gt3),AmpSum2ChiToFvSvRe(:,gt1, gt2, gt3),AmpSqChiToFvSvRe(gt1, gt2, gt3)) 
  AmpSqChiToFvSvRe(gt1, gt2, gt3) = AmpSqChiToFvSvRe(gt1, gt2, gt3) + AmpSqTreeChiToFvSvRe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFvSvRe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFvSvRe(gt1, gt2, gt3).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MFvOS(gt2),MSvReOS(gt3),helfactor*AmpSqChiToFvSvRe(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MFv(gt2),MSvRe(gt3),helfactor*AmpSqChiToFvSvRe(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFvSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFvSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFvSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFvSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChiToFvSvRe(gt1, gt2, gt3) + MRGChiToFvSvRe(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChiToFvSvRe(gt1, gt2, gt3) + MRGChiToFvSvRe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
!---------------- 
! Chi VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_seesaw1nmssm_ChiToChiVP(ZcplChiChiVZL,ZcplChiChiVZR,              & 
& ctcplChiChiVZL,ctcplChiChiVZR,MChiOS,MChi2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfL0,               & 
& ZfVP,ZfVZVP,AmpWaveChiToChiVP)

 Else 
Call Amplitude_WAVE_seesaw1nmssm_ChiToChiVP(cplChiChiVZL,cplChiChiVZR,ctcplChiChiVZL, & 
& ctcplChiChiVZR,MChiOS,MChi2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfL0,ZfVP,ZfVZVP,AmpWaveChiToChiVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToChiVP(MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,               & 
& MFu2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,ZcplChiChacHpmL,ZcplChiChacHpmR,      & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplChiFdcSdL,           & 
& ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplcChaChiHpmL, & 
& ZcplcChaChiHpmR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFeChiSeL,ZcplcFeChiSeR,               & 
& ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVPL,              & 
& ZcplcFdFdVPR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplHpmcHpmVP,        & 
& ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplSecSeVP,ZcplSucSuVP,ZcplcHpmVPVWm,ZcplcVWmVPVWm,         & 
& AmpVertexChiToChiVP)

 Else 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToChiVP(MChaOS,MChiOS,MFdOS,MFeOS,              & 
& MFuOS,MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,               & 
& MFu2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplChiChacHpmL,cplChiChacHpmR,        & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplChiFdcSdL,cplChiFdcSdR,   & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFuFuVPL,cplcFuFuVPR,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,               & 
& cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChiToChiVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChiToChiVP(cplChiChiVZL,cplChiChiVZR,ctcplChiChiVZL, & 
& ctcplChiChiVZR,MChi,MChi2,MVP,MVP2,MVZ,MVZ2,ZfL0,ZfVP,ZfVZVP,AmpWaveChiToChiVP)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToChiVP(MCha,MChi,MFd,MFe,MFu,MHpm,             & 
& MSd,MSe,MSu,MVP,MVWm,MCha2,MChi2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,MVP2,             & 
& MVWm2,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplHpmcHpmVP,              & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& AmpVertexChiToChiVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiVP = 0._dp 
 AmpSum2ChiToChiVP = 0._dp  
Else 
 AmpSumChiToChiVP = AmpVertexChiToChiVP + AmpWaveChiToChiVP
 AmpSum2ChiToChiVP = AmpVertexChiToChiVP + AmpWaveChiToChiVP 
End If 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChiOS(gt2)+0.))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MChi(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),0._dp,AmpSumChiToChiVP(:,gt1, gt2),AmpSum2ChiToChiVP(:,gt1, gt2),AmpSqChiToChiVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVP,AmpSumChiToChiVP(:,gt1, gt2),AmpSum2ChiToChiVP(:,gt1, gt2),AmpSqChiToChiVP(gt1, gt2)) 
End if  
Else  
  AmpSqChiToChiVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiVP(gt1, gt2).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),0._dp,helfactor*AmpSqChiToChiVP(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MChi(gt2),MVP,helfactor*AmpSqChiToChiVP(gt1, gt2))
End if 
If ((Abs(MRPChiToChiVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.5) isave = i4 
End do
!---------------- 
! Glu VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToGluVG(MChiOS,MFdOS,MFuOS,MGluOS,              & 
& MSdOS,MSuOS,MVG,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,MVG2,ZcplChiFdcSdL,        & 
& ZcplChiFdcSdR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFuChiSuL,   & 
& ZcplcFuChiSuR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplGluFucSuL,     & 
& ZcplGluFucSuR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFuGluSuL,     & 
& ZcplcFuGluSuR,ZcplSdcSdVG,ZcplSucSuVG,AmpVertexChiToGluVG)

 Else 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToGluVG(MChiOS,MFdOS,MFuOS,MGluOS,              & 
& MSdOS,MSuOS,MVG,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,MVG2,cplChiFdcSdL,         & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplGluFucSuL,           & 
& cplGluFucSuR,cplcFuFuVGL,cplcFuFuVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,           & 
& cplcFuGluSuR,cplSdcSdVG,cplSucSuVG,AmpVertexChiToGluVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChiToGluVG(MChi,MFd,MFu,MGlu,MSd,MSu,              & 
& MVG,MChi2,MFd2,MFu2,MGlu2,MSd2,MSu2,MVG2,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplSdcSdVG,            & 
& cplSucSuVG,AmpVertexChiToGluVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Glu VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToGluVG = 0._dp 
 AmpSum2ChiToGluVG = 0._dp  
Else 
 AmpSumChiToGluVG = AmpVertexChiToGluVG + AmpWaveChiToGluVG
 AmpSum2ChiToGluVG = AmpVertexChiToGluVG + AmpWaveChiToGluVG 
End If 
Do gt1=1,5
i4 = isave 
If (((OSkinematics).and.(MChiOS(gt1).gt.(MGluOS+0.))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MGlu+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MGluOS,0._dp,AmpSumChiToGluVG(:,gt1),AmpSum2ChiToGluVG(:,gt1),AmpSqChiToGluVG(gt1)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MGlu,MVG,AmpSumChiToGluVG(:,gt1),AmpSum2ChiToGluVG(:,gt1),AmpSqChiToGluVG(gt1)) 
End if  
Else  
  AmpSqChiToGluVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToGluVG(gt1).le.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 8._dp*GammaTPS(MChiOS(gt1),MGluOS,0._dp,helfactor*AmpSqChiToGluVG(gt1))
Else 
  gP1LChi(gt1,i4) = 8._dp*GammaTPS(MChi(gt1),MGlu,MVG,helfactor*AmpSqChiToGluVG(gt1))
End if 
If ((Abs(MRPChiToGluVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGChiToGluVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.5) isave = i4 
End do
End Subroutine OneLoopDecay_Chi

End Module Wrapper_OneLoopDecay_Chi_seesaw1nmssm
