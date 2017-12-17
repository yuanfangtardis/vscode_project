! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:49 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Cha_seesaw1nmssm
Use Model_Data_seesaw1nmssm 
Use Kinematics 
Use OneLoopDecay_Cha_seesaw1nmssm 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Cha(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,           & 
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
& cplAhSvReSvRe,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,            & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,   & 
& cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,        & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,         & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplFvChacSeL,        & 
& cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,           & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,      & 
& cplGluFucSuL,cplGluFucSuR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,           & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,            & 
& cplSdcSdVZ,cplSdcSucVWm,cplSecSeVP,cplSecSeVZ,cplSeSvImcHpm,cplSeSvImcVWm,             & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSucSdVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,              & 
& cplSvImcSeVWm,cplSvImSvReVZ,cplSvRecSeVWm,ctcplcChacFuSdL,ctcplcChacFuSdR,             & 
& ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplcChaChahhL,ctcplcChaChahhR,ctcplcChaChaVPL,       & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChiHpmL,ctcplcChaChiHpmR,     & 
& ctcplcChaChiVWmL,ctcplcChaChiVWmR,ctcplcChaFdcSuL,ctcplcChaFdcSuR,ctcplcChaFeSvImL,    & 
& ctcplcChaFeSvImR,ctcplcChaFeSvReL,ctcplcChaFeSvReR,ctcplcChaFvSeL,ctcplcChaFvSeR,      & 
& GcplcChaChiHpmL,GcplcChaChiHpmR,GcplcHpmVPVWm,GcplHpmcVWmVP,GosZcplcChaChiHpmL,        & 
& GosZcplcChaChiHpmR,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplcChaChiHpmL,GZcplcChaChiHpmR,& 
& GZcplcHpmVPVWm,GZcplHpmcVWmVP,ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplcChaChaAhL,            & 
& ZcplcChaChaAhR,ZcplcChaChahhL,ZcplcChaChahhR,ZcplcChaChaVPL,ZcplcChaChaVPR,            & 
& ZcplcChaChaVZL,ZcplcChaChaVZR,ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcChaChiVWmL,         & 
& ZcplcChaChiVWmR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcChaFeSvImL,ZcplcChaFeSvImR,         & 
& ZcplcChaFeSvReL,ZcplcChaFeSvReR,ZcplcChaFvSeL,ZcplcChaFvSeR,ZcplcFdChaSuL,             & 
& ZcplcFdChaSuR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFeChaSvImL,ZcplcFeChaSvImR,               & 
& ZcplcFeChaSvReL,ZcplcFeChaSvReR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFuFuVPL,ZcplcFuFuVPR,   & 
& ZcplChaFucSdL,ZcplChaFucSdR,ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,           & 
& ZcplChiChacVWmR,ZcplcHpmVPVWm,ZcplcVWmVPVWm,ZcplFvChacSeL,ZcplFvChacSeR,               & 
& ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplSecSeVP,ZcplSucSuVP,ZRUZD,ZRUZVI,          & 
& ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,            & 
& ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LCha)

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
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),   & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),       & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),     & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),       & 
& cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),               & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),& 
& cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),   & 
& cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFeFeAhL(3,3,3),      & 
& cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),             & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),& 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),           & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),              & 
& cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),   & 
& cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),           & 
& cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),       & 
& cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcVWmVPVWm,cplcVWmVWmVZ,        & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),               & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6), & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVWm(3,2),               & 
& cplhhcVWmVWm(3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),& 
& cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),         & 
& cplhhSvReSvRe(3,6,6),cplhhVZVZ(3),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcVWmVP(2), & 
& cplHpmcVWmVZ(2),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),          & 
& cplSdcHpmcSu(6,2,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSucVWm(6,6)

Complex(dp),Intent(in) :: cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),               & 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSucSdVWm(6,6),cplSucSuVG(6,6),              & 
& cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSvImcSeVWm(6,6),cplSvImSvReVZ(6,6),cplSvRecSeVWm(6,6),& 
& ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6),ctcplcChaChaAhL(2,2,3),ctcplcChaChaAhR(2,2,3),& 
& ctcplcChaChahhL(2,2,3),ctcplcChaChahhR(2,2,3),ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),& 
& ctcplcChaChaVZL(2,2),ctcplcChaChaVZR(2,2),ctcplcChaChiHpmL(2,5,2),ctcplcChaChiHpmR(2,5,2),& 
& ctcplcChaChiVWmL(2,5),ctcplcChaChiVWmR(2,5),ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6),& 
& ctcplcChaFeSvImL(2,3,6),ctcplcChaFeSvImR(2,3,6),ctcplcChaFeSvReL(2,3,6),               & 
& ctcplcChaFeSvReR(2,3,6),ctcplcChaFvSeL(2,6,6),ctcplcChaFvSeR(2,6,6),GcplcChaChiHpmL(2,5,2),& 
& GcplcChaChiHpmR(2,5,2),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),GosZcplcChaChiHpmL(2,5,2),    & 
& GosZcplcChaChiHpmR(2,5,2),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GZcplcChaChiHpmL(2,5,2),& 
& GZcplcChaChiHpmR(2,5,2),GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),ZcplcChacFuSdL(2,3,6),     & 
& ZcplcChacFuSdR(2,3,6),ZcplcChaChaAhL(2,2,3),ZcplcChaChaAhR(2,2,3),ZcplcChaChahhL(2,2,3),& 
& ZcplcChaChahhR(2,2,3),ZcplcChaChaVPL(2,2),ZcplcChaChaVPR(2,2),ZcplcChaChaVZL(2,2),     & 
& ZcplcChaChaVZR(2,2),ZcplcChaChiHpmL(2,5,2),ZcplcChaChiHpmR(2,5,2),ZcplcChaChiVWmL(2,5),& 
& ZcplcChaChiVWmR(2,5),ZcplcChaFdcSuL(2,3,6),ZcplcChaFdcSuR(2,3,6),ZcplcChaFeSvImL(2,3,6),& 
& ZcplcChaFeSvImR(2,3,6),ZcplcChaFeSvReL(2,3,6),ZcplcChaFeSvReR(2,3,6),ZcplcChaFvSeL(2,6,6),& 
& ZcplcChaFvSeR(2,6,6),ZcplcFdChaSuL(3,2,6),ZcplcFdChaSuR(3,2,6),ZcplcFdFdVPL(3,3),      & 
& ZcplcFdFdVPR(3,3),ZcplcFeChaSvImL(3,2,6),ZcplcFeChaSvImR(3,2,6),ZcplcFeChaSvReL(3,2,6),& 
& ZcplcFeChaSvReR(3,2,6),ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFuFuVPL(3,3),          & 
& ZcplcFuFuVPR(3,3),ZcplChaFucSdL(2,3,6),ZcplChaFucSdR(2,3,6),ZcplChiChacHpmL(5,2,2),    & 
& ZcplChiChacHpmR(5,2,2),ZcplChiChacVWmL(5,2),ZcplChiChacVWmR(5,2),ZcplcHpmVPVWm(2),     & 
& ZcplcVWmVPVWm,ZcplFvChacSeL(6,2,6),ZcplFvChacSeR(6,2,6),ZcplHpmcHpmVP(2,2),            & 
& ZcplHpmcVWmVP(2),ZcplSdcSdVP(6,6),ZcplSecSeVP(6,6),ZcplSucSuVP(6,6)

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
Real(dp), Intent(out) :: gP1LCha(2,132) 
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
Real(dp) :: MRPChaToChaAh(2,2,3),MRGChaToChaAh(2,2,3), MRPZChaToChaAh(2,2,3),MRGZChaToChaAh(2,2,3) 
Real(dp) :: MVPChaToChaAh(2,2,3) 
Real(dp) :: RMsqTreeChaToChaAh(2,2,3),RMsqWaveChaToChaAh(2,2,3),RMsqVertexChaToChaAh(2,2,3) 
Complex(dp) :: AmpTreeChaToChaAh(2,2,2,3),AmpWaveChaToChaAh(2,2,2,3)=(0._dp,0._dp),AmpVertexChaToChaAh(2,2,2,3)& 
 & ,AmpVertexIRosChaToChaAh(2,2,2,3),AmpVertexIRdrChaToChaAh(2,2,2,3), AmpSumChaToChaAh(2,2,2,3), AmpSum2ChaToChaAh(2,2,2,3) 
Complex(dp) :: AmpTreeZChaToChaAh(2,2,2,3),AmpWaveZChaToChaAh(2,2,2,3),AmpVertexZChaToChaAh(2,2,2,3) 
Real(dp) :: AmpSqChaToChaAh(2,2,3),  AmpSqTreeChaToChaAh(2,2,3) 
Real(dp) :: MRPChaToChahh(2,2,3),MRGChaToChahh(2,2,3), MRPZChaToChahh(2,2,3),MRGZChaToChahh(2,2,3) 
Real(dp) :: MVPChaToChahh(2,2,3) 
Real(dp) :: RMsqTreeChaToChahh(2,2,3),RMsqWaveChaToChahh(2,2,3),RMsqVertexChaToChahh(2,2,3) 
Complex(dp) :: AmpTreeChaToChahh(2,2,2,3),AmpWaveChaToChahh(2,2,2,3)=(0._dp,0._dp),AmpVertexChaToChahh(2,2,2,3)& 
 & ,AmpVertexIRosChaToChahh(2,2,2,3),AmpVertexIRdrChaToChahh(2,2,2,3), AmpSumChaToChahh(2,2,2,3), AmpSum2ChaToChahh(2,2,2,3) 
Complex(dp) :: AmpTreeZChaToChahh(2,2,2,3),AmpWaveZChaToChahh(2,2,2,3),AmpVertexZChaToChahh(2,2,2,3) 
Real(dp) :: AmpSqChaToChahh(2,2,3),  AmpSqTreeChaToChahh(2,2,3) 
Real(dp) :: MRPChaToChaVZ(2,2),MRGChaToChaVZ(2,2), MRPZChaToChaVZ(2,2),MRGZChaToChaVZ(2,2) 
Real(dp) :: MVPChaToChaVZ(2,2) 
Real(dp) :: RMsqTreeChaToChaVZ(2,2),RMsqWaveChaToChaVZ(2,2),RMsqVertexChaToChaVZ(2,2) 
Complex(dp) :: AmpTreeChaToChaVZ(4,2,2),AmpWaveChaToChaVZ(4,2,2)=(0._dp,0._dp),AmpVertexChaToChaVZ(4,2,2)& 
 & ,AmpVertexIRosChaToChaVZ(4,2,2),AmpVertexIRdrChaToChaVZ(4,2,2), AmpSumChaToChaVZ(4,2,2), AmpSum2ChaToChaVZ(4,2,2) 
Complex(dp) :: AmpTreeZChaToChaVZ(4,2,2),AmpWaveZChaToChaVZ(4,2,2),AmpVertexZChaToChaVZ(4,2,2) 
Real(dp) :: AmpSqChaToChaVZ(2,2),  AmpSqTreeChaToChaVZ(2,2) 
Real(dp) :: MRPChaToChiHpm(2,5,2),MRGChaToChiHpm(2,5,2), MRPZChaToChiHpm(2,5,2),MRGZChaToChiHpm(2,5,2) 
Real(dp) :: MVPChaToChiHpm(2,5,2) 
Real(dp) :: RMsqTreeChaToChiHpm(2,5,2),RMsqWaveChaToChiHpm(2,5,2),RMsqVertexChaToChiHpm(2,5,2) 
Complex(dp) :: AmpTreeChaToChiHpm(2,2,5,2),AmpWaveChaToChiHpm(2,2,5,2)=(0._dp,0._dp),AmpVertexChaToChiHpm(2,2,5,2)& 
 & ,AmpVertexIRosChaToChiHpm(2,2,5,2),AmpVertexIRdrChaToChiHpm(2,2,5,2), AmpSumChaToChiHpm(2,2,5,2), AmpSum2ChaToChiHpm(2,2,5,2) 
Complex(dp) :: AmpTreeZChaToChiHpm(2,2,5,2),AmpWaveZChaToChiHpm(2,2,5,2),AmpVertexZChaToChiHpm(2,2,5,2) 
Real(dp) :: AmpSqChaToChiHpm(2,5,2),  AmpSqTreeChaToChiHpm(2,5,2) 
Real(dp) :: MRPChaToChiVWm(2,5),MRGChaToChiVWm(2,5), MRPZChaToChiVWm(2,5),MRGZChaToChiVWm(2,5) 
Real(dp) :: MVPChaToChiVWm(2,5) 
Real(dp) :: RMsqTreeChaToChiVWm(2,5),RMsqWaveChaToChiVWm(2,5),RMsqVertexChaToChiVWm(2,5) 
Complex(dp) :: AmpTreeChaToChiVWm(4,2,5),AmpWaveChaToChiVWm(4,2,5)=(0._dp,0._dp),AmpVertexChaToChiVWm(4,2,5)& 
 & ,AmpVertexIRosChaToChiVWm(4,2,5),AmpVertexIRdrChaToChiVWm(4,2,5), AmpSumChaToChiVWm(4,2,5), AmpSum2ChaToChiVWm(4,2,5) 
Complex(dp) :: AmpTreeZChaToChiVWm(4,2,5),AmpWaveZChaToChiVWm(4,2,5),AmpVertexZChaToChiVWm(4,2,5) 
Real(dp) :: AmpSqChaToChiVWm(2,5),  AmpSqTreeChaToChiVWm(2,5) 
Real(dp) :: MRPChaToFdcSu(2,3,6),MRGChaToFdcSu(2,3,6), MRPZChaToFdcSu(2,3,6),MRGZChaToFdcSu(2,3,6) 
Real(dp) :: MVPChaToFdcSu(2,3,6) 
Real(dp) :: RMsqTreeChaToFdcSu(2,3,6),RMsqWaveChaToFdcSu(2,3,6),RMsqVertexChaToFdcSu(2,3,6) 
Complex(dp) :: AmpTreeChaToFdcSu(2,2,3,6),AmpWaveChaToFdcSu(2,2,3,6)=(0._dp,0._dp),AmpVertexChaToFdcSu(2,2,3,6)& 
 & ,AmpVertexIRosChaToFdcSu(2,2,3,6),AmpVertexIRdrChaToFdcSu(2,2,3,6), AmpSumChaToFdcSu(2,2,3,6), AmpSum2ChaToFdcSu(2,2,3,6) 
Complex(dp) :: AmpTreeZChaToFdcSu(2,2,3,6),AmpWaveZChaToFdcSu(2,2,3,6),AmpVertexZChaToFdcSu(2,2,3,6) 
Real(dp) :: AmpSqChaToFdcSu(2,3,6),  AmpSqTreeChaToFdcSu(2,3,6) 
Real(dp) :: MRPChaToFeSvIm(2,3,6),MRGChaToFeSvIm(2,3,6), MRPZChaToFeSvIm(2,3,6),MRGZChaToFeSvIm(2,3,6) 
Real(dp) :: MVPChaToFeSvIm(2,3,6) 
Real(dp) :: RMsqTreeChaToFeSvIm(2,3,6),RMsqWaveChaToFeSvIm(2,3,6),RMsqVertexChaToFeSvIm(2,3,6) 
Complex(dp) :: AmpTreeChaToFeSvIm(2,2,3,6),AmpWaveChaToFeSvIm(2,2,3,6)=(0._dp,0._dp),AmpVertexChaToFeSvIm(2,2,3,6)& 
 & ,AmpVertexIRosChaToFeSvIm(2,2,3,6),AmpVertexIRdrChaToFeSvIm(2,2,3,6), AmpSumChaToFeSvIm(2,2,3,6), AmpSum2ChaToFeSvIm(2,2,3,6) 
Complex(dp) :: AmpTreeZChaToFeSvIm(2,2,3,6),AmpWaveZChaToFeSvIm(2,2,3,6),AmpVertexZChaToFeSvIm(2,2,3,6) 
Real(dp) :: AmpSqChaToFeSvIm(2,3,6),  AmpSqTreeChaToFeSvIm(2,3,6) 
Real(dp) :: MRPChaToFeSvRe(2,3,6),MRGChaToFeSvRe(2,3,6), MRPZChaToFeSvRe(2,3,6),MRGZChaToFeSvRe(2,3,6) 
Real(dp) :: MVPChaToFeSvRe(2,3,6) 
Real(dp) :: RMsqTreeChaToFeSvRe(2,3,6),RMsqWaveChaToFeSvRe(2,3,6),RMsqVertexChaToFeSvRe(2,3,6) 
Complex(dp) :: AmpTreeChaToFeSvRe(2,2,3,6),AmpWaveChaToFeSvRe(2,2,3,6)=(0._dp,0._dp),AmpVertexChaToFeSvRe(2,2,3,6)& 
 & ,AmpVertexIRosChaToFeSvRe(2,2,3,6),AmpVertexIRdrChaToFeSvRe(2,2,3,6), AmpSumChaToFeSvRe(2,2,3,6), AmpSum2ChaToFeSvRe(2,2,3,6) 
Complex(dp) :: AmpTreeZChaToFeSvRe(2,2,3,6),AmpWaveZChaToFeSvRe(2,2,3,6),AmpVertexZChaToFeSvRe(2,2,3,6) 
Real(dp) :: AmpSqChaToFeSvRe(2,3,6),  AmpSqTreeChaToFeSvRe(2,3,6) 
Real(dp) :: MRPChaToFvSe(2,6,6),MRGChaToFvSe(2,6,6), MRPZChaToFvSe(2,6,6),MRGZChaToFvSe(2,6,6) 
Real(dp) :: MVPChaToFvSe(2,6,6) 
Real(dp) :: RMsqTreeChaToFvSe(2,6,6),RMsqWaveChaToFvSe(2,6,6),RMsqVertexChaToFvSe(2,6,6) 
Complex(dp) :: AmpTreeChaToFvSe(2,2,6,6),AmpWaveChaToFvSe(2,2,6,6)=(0._dp,0._dp),AmpVertexChaToFvSe(2,2,6,6)& 
 & ,AmpVertexIRosChaToFvSe(2,2,6,6),AmpVertexIRdrChaToFvSe(2,2,6,6), AmpSumChaToFvSe(2,2,6,6), AmpSum2ChaToFvSe(2,2,6,6) 
Complex(dp) :: AmpTreeZChaToFvSe(2,2,6,6),AmpWaveZChaToFvSe(2,2,6,6),AmpVertexZChaToFvSe(2,2,6,6) 
Real(dp) :: AmpSqChaToFvSe(2,6,6),  AmpSqTreeChaToFvSe(2,6,6) 
Real(dp) :: MRPChaTocFuSd(2,3,6),MRGChaTocFuSd(2,3,6), MRPZChaTocFuSd(2,3,6),MRGZChaTocFuSd(2,3,6) 
Real(dp) :: MVPChaTocFuSd(2,3,6) 
Real(dp) :: RMsqTreeChaTocFuSd(2,3,6),RMsqWaveChaTocFuSd(2,3,6),RMsqVertexChaTocFuSd(2,3,6) 
Complex(dp) :: AmpTreeChaTocFuSd(2,2,3,6),AmpWaveChaTocFuSd(2,2,3,6)=(0._dp,0._dp),AmpVertexChaTocFuSd(2,2,3,6)& 
 & ,AmpVertexIRosChaTocFuSd(2,2,3,6),AmpVertexIRdrChaTocFuSd(2,2,3,6), AmpSumChaTocFuSd(2,2,3,6), AmpSum2ChaTocFuSd(2,2,3,6) 
Complex(dp) :: AmpTreeZChaTocFuSd(2,2,3,6),AmpWaveZChaTocFuSd(2,2,3,6),AmpVertexZChaTocFuSd(2,2,3,6) 
Real(dp) :: AmpSqChaTocFuSd(2,3,6),  AmpSqTreeChaTocFuSd(2,3,6) 
Real(dp) :: MRPChaToChaVP(2,2),MRGChaToChaVP(2,2), MRPZChaToChaVP(2,2),MRGZChaToChaVP(2,2) 
Real(dp) :: MVPChaToChaVP(2,2) 
Real(dp) :: RMsqTreeChaToChaVP(2,2),RMsqWaveChaToChaVP(2,2),RMsqVertexChaToChaVP(2,2) 
Complex(dp) :: AmpTreeChaToChaVP(4,2,2),AmpWaveChaToChaVP(4,2,2)=(0._dp,0._dp),AmpVertexChaToChaVP(4,2,2)& 
 & ,AmpVertexIRosChaToChaVP(4,2,2),AmpVertexIRdrChaToChaVP(4,2,2), AmpSumChaToChaVP(4,2,2), AmpSum2ChaToChaVP(4,2,2) 
Complex(dp) :: AmpTreeZChaToChaVP(4,2,2),AmpWaveZChaToChaVP(4,2,2),AmpVertexZChaToChaVP(4,2,2) 
Real(dp) :: AmpSqChaToChaVP(2,2),  AmpSqTreeChaToChaVP(2,2) 
Write(*,*) "Calculating one-loop decays of Cha " 
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
! Cha Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,              & 
& MAh,MCha,MAh2,MCha2,AmpTreeChaToChaAh)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaToChaAh(ZcplcChaChaAhL,ZcplcChaChaAhR,            & 
& MAh,MCha,MAh2,MCha2,AmpTreeChaToChaAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,    & 
& MAhOS,MChaOS,MRPChaToChaAh,MRGChaToChaAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChaAh(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,  & 
& MAhOS,MChaOS,MRPChaToChaAh,MRGChaToChaAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,    & 
& MAh,MCha,MRPChaToChaAh,MRGChaToChaAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChaAh(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,  & 
& MAh,MCha,MRPChaToChaAh,MRGChaToChaAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,              & 
& ctcplcChaChaAhL,ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,AmpWaveChaToChaAh)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexChaToChaAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrChaToChaAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaAh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,        & 
& ZcplcChaChaAhL,ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,       & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,    & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL, & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL, & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChaAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,ZcplcChaChaAhL,ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChaAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaAh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,        & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,       & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,    & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL, & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,  & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL, & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChaAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,  & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChaAh)

 End if 
 End if 
AmpVertexChaToChaAh = AmpVertexChaToChaAh -  AmpVertexIRdrChaToChaAh! +  AmpVertexIRosChaToChaAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaAh(1,gt2,:,:) = AmpWaveZChaToChaAh(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaAh(1,gt1,:,:) 
AmpVertexZChaToChaAh(1,gt2,:,:)= AmpVertexZChaToChaAh(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaAh(1,gt1,:,:) 
AmpWaveZChaToChaAh(2,gt2,:,:) = AmpWaveZChaToChaAh(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaAh(2,gt1,:,:) 
AmpVertexZChaToChaAh(2,gt2,:,:)= AmpVertexZChaToChaAh(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaAh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
! Final State 1 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaAh(1,:,gt2,:) = AmpWaveZChaToChaAh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChaToChaAh(1,:,gt1,:) 
AmpVertexZChaToChaAh(1,:,gt2,:)= AmpVertexZChaToChaAh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChaToChaAh(1,:,gt1,:) 
AmpWaveZChaToChaAh(2,:,gt2,:) = AmpWaveZChaToChaAh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaAh(2,:,gt1,:) 
AmpVertexZChaToChaAh(2,:,gt2,:)= AmpVertexZChaToChaAh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaAh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
! Final State 2 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToChaAh(:,:,:,gt2) = AmpWaveZChaToChaAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveChaToChaAh(:,:,:,gt1) 
AmpVertexZChaToChaAh(:,:,:,gt2)= AmpVertexZChaToChaAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexChaToChaAh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaAh = AmpVertexChaToChaAh  +  AmpVertexIRosChaToChaAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaAh = AmpTreeChaToChaAh 
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh  
Else 
 AmpSumChaToChaAh = AmpTreeChaToChaAh + AmpWaveChaToChaAh + AmpVertexChaToChaAh
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh + AmpWaveChaToChaAh + AmpVertexChaToChaAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaAh = AmpTreeChaToChaAh
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
    Do gt3=2,3
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChaOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MCha(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = 2._dp*AmpWaveChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = 2._dp*AmpVertexChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3)  
  AmpSum2ChaToChaAh = + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3) + AmpSqTreeChaToChaAh(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3)  
  AmpSum2ChaToChaAh = + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3) + AmpSqTreeChaToChaAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChaAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaAh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),helfactor*AmpSqChaToChaAh(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MAh(gt3),helfactor*AmpSqChaToChaAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaAh(gt1, gt2, gt3) + MRGChaToChaAh(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaAh(gt1, gt2, gt3) + MRGChaToChaAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
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
! Cha hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaToChahh(cplcChaChahhL,cplcChaChahhR,              & 
& MCha,Mhh,MCha2,Mhh2,AmpTreeChaToChahh)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaToChahh(ZcplcChaChahhL,ZcplcChaChahhR,            & 
& MCha,Mhh,MCha2,Mhh2,AmpTreeChaToChahh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChahh(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,    & 
& MChaOS,MhhOS,MRPChaToChahh,MRGChaToChahh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChahh(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,  & 
& MChaOS,MhhOS,MRPChaToChahh,MRGChaToChahh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaToChahh(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,    & 
& MCha,Mhh,MRPChaToChahh,MRGChaToChahh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChahh(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,  & 
& MCha,Mhh,MRPChaToChahh,MRGChaToChahh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToChahh(cplcChaChahhL,cplcChaChahhR,              & 
& ctcplcChaChahhL,ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,AmpWaveChaToChahh)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
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
& cplcChacFuSdR,AmpVertexChaToChahh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChahh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
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
& cplcChacFuSdR,AmpVertexIRdrChaToChahh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChahh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
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
& AmpVertexIRosChaToChahh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChahh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
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
& cplcChacFuSdR,AmpVertexIRosChaToChahh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChahh(MAhOS,MChaOS,MChiOS,MFdOS,           & 
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
& AmpVertexIRosChaToChahh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChahh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
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
& cplcChacFuSdR,AmpVertexIRosChaToChahh)

 End if 
 End if 
AmpVertexChaToChahh = AmpVertexChaToChahh -  AmpVertexIRdrChaToChahh! +  AmpVertexIRosChaToChahh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChahh(1,gt2,:,:) = AmpWaveZChaToChahh(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChahh(1,gt1,:,:) 
AmpVertexZChaToChahh(1,gt2,:,:)= AmpVertexZChaToChahh(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChahh(1,gt1,:,:) 
AmpWaveZChaToChahh(2,gt2,:,:) = AmpWaveZChaToChahh(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChahh(2,gt1,:,:) 
AmpVertexZChaToChahh(2,gt2,:,:)= AmpVertexZChaToChahh(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChahh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
! Final State 1 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChahh(1,:,gt2,:) = AmpWaveZChaToChahh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChaToChahh(1,:,gt1,:) 
AmpVertexZChaToChahh(1,:,gt2,:)= AmpVertexZChaToChahh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChaToChahh(1,:,gt1,:) 
AmpWaveZChaToChahh(2,:,gt2,:) = AmpWaveZChaToChahh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChaToChahh(2,:,gt1,:) 
AmpVertexZChaToChahh(2,:,gt2,:)= AmpVertexZChaToChahh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChaToChahh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
! Final State 2 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToChahh(:,:,:,gt2) = AmpWaveZChaToChahh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveChaToChahh(:,:,:,gt1) 
AmpVertexZChaToChahh(:,:,:,gt2)= AmpVertexZChaToChahh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexChaToChahh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChahh = AmpVertexChaToChahh  +  AmpVertexIRosChaToChahh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChahh = AmpTreeChaToChahh 
 AmpSum2ChaToChahh = AmpTreeChaToChahh + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh  
Else 
 AmpSumChaToChahh = AmpTreeChaToChahh + AmpWaveChaToChahh + AmpVertexChaToChahh
 AmpSum2ChaToChahh = AmpTreeChaToChahh + AmpWaveChaToChahh + AmpVertexChaToChahh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChahh = AmpTreeChaToChahh
 AmpSum2ChaToChahh = AmpTreeChaToChahh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
    Do gt3=1,3
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChaOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MCha(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChahh = AmpTreeChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = 2._dp*AmpWaveChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = 2._dp*AmpVertexChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = AmpTreeChaToChahh + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChahh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChahh = AmpTreeChaToChahh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3)  
  AmpSum2ChaToChahh = + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3) + AmpSqTreeChaToChahh(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChahh = AmpTreeChaToChahh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3)  
  AmpSum2ChaToChahh = + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3) + AmpSqTreeChaToChahh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChahh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChahh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),helfactor*AmpSqChaToChahh(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),Mhh(gt3),helfactor*AmpSqChaToChahh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChahh(gt1, gt2, gt3) + MRGChaToChahh(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChahh(gt1, gt2, gt3) + MRGChaToChahh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
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
! Cha VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaToChaVZ(cplcChaChaVZL,cplcChaChaVZR,              & 
& MCha,MVZ,MCha2,MVZ2,AmpTreeChaToChaVZ)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaToChaVZ(ZcplcChaChaVZL,ZcplcChaChaVZR,            & 
& MCha,MVZ,MCha2,MVZ2,AmpTreeChaToChaVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,cplcChaChaVZR,    & 
& MChaOS,MVZOS,MRPChaToChaVZ,MRGChaToChaVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChaVZ(MLambda,em,gs,ZcplcChaChaVZL,ZcplcChaChaVZR,  & 
& MChaOS,MVZOS,MRPChaToChaVZ,MRGChaToChaVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,cplcChaChaVZR,    & 
& MCha,MVZ,MRPChaToChaVZ,MRGChaToChaVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChaVZ(MLambda,em,gs,ZcplcChaChaVZL,ZcplcChaChaVZR,  & 
& MCha,MVZ,MRPChaToChaVZ,MRGChaToChaVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToChaVZ(cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,           & 
& ctcplcChaChaVZR,MCha,MCha2,MVP,MVP2,MVZ,MVZ2,ZfLm,ZfLp,ZfVPVZ,ZfVZ,AmpWaveChaToChaVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,  & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,              & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,            & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexChaToChaVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,  & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,              & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,            & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRdrChaToChaVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaVZ(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,  & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,              & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,            & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,  & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,              & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,            & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaVZ(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,  & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,              & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,            & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,  & 
& cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,             & 
& cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,              & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,            & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

 End if 
 End if 
AmpVertexChaToChaVZ = AmpVertexChaToChaVZ -  AmpVertexIRdrChaToChaVZ! +  AmpVertexIRosChaToChaVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaVZ=0._dp 
AmpVertexZChaToChaVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZ(1,gt2,:) = AmpWaveZChaToChaVZ(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZ(1,gt1,:) 
AmpVertexZChaToChaVZ(1,gt2,:)= AmpVertexZChaToChaVZ(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZ(1,gt1,:) 
AmpWaveZChaToChaVZ(2,gt2,:) = AmpWaveZChaToChaVZ(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZ(2,gt1,:) 
AmpVertexZChaToChaVZ(2,gt2,:)= AmpVertexZChaToChaVZ(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZ(2,gt1,:) 
AmpWaveZChaToChaVZ(3,gt2,:) = AmpWaveZChaToChaVZ(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZ(3,gt1,:) 
AmpVertexZChaToChaVZ(3,gt2,:)= AmpVertexZChaToChaVZ(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZ(3,gt1,:) 
AmpWaveZChaToChaVZ(4,gt2,:) = AmpWaveZChaToChaVZ(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZ(4,gt1,:) 
AmpVertexZChaToChaVZ(4,gt2,:)= AmpVertexZChaToChaVZ(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaVZ=AmpWaveZChaToChaVZ 
AmpVertexChaToChaVZ= AmpVertexZChaToChaVZ
! Final State 1 
AmpWaveZChaToChaVZ=0._dp 
AmpVertexZChaToChaVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZ(1,:,gt2) = AmpWaveZChaToChaVZ(1,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZ(1,:,gt1) 
AmpVertexZChaToChaVZ(1,:,gt2)= AmpVertexZChaToChaVZ(1,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZ(1,:,gt1) 
AmpWaveZChaToChaVZ(2,:,gt2) = AmpWaveZChaToChaVZ(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZ(2,:,gt1) 
AmpVertexZChaToChaVZ(2,:,gt2)= AmpVertexZChaToChaVZ(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZ(2,:,gt1) 
AmpWaveZChaToChaVZ(3,:,gt2) = AmpWaveZChaToChaVZ(3,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZ(3,:,gt1) 
AmpVertexZChaToChaVZ(3,:,gt2)= AmpVertexZChaToChaVZ(3,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZ(3,:,gt1) 
AmpWaveZChaToChaVZ(4,:,gt2) = AmpWaveZChaToChaVZ(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZ(4,:,gt1) 
AmpVertexZChaToChaVZ(4,:,gt2)= AmpVertexZChaToChaVZ(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaVZ=AmpWaveZChaToChaVZ 
AmpVertexChaToChaVZ= AmpVertexZChaToChaVZ
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaVZ = AmpVertexChaToChaVZ  +  AmpVertexIRosChaToChaVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ 
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ  
Else 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ + AmpWaveChaToChaVZ + AmpVertexChaToChaVZ
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + AmpWaveChaToChaVZ + AmpVertexChaToChaVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChaOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MCha(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = 2._dp*AmpWaveChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = 2._dp*AmpVertexChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqTreeChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2)  
  AmpSum2ChaToChaVZ = + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2) + AmpSqTreeChaToChaVZ(gt1, gt2)  
Else  
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqTreeChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2)  
  AmpSum2ChaToChaVZ = + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2) + AmpSqTreeChaToChaVZ(gt1, gt2)  
End if  
Else  
  AmpSqChaToChaVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVZ(gt1, gt2).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MVZOS,helfactor*AmpSqChaToChaVZ(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVZ,helfactor*AmpSqChaToChaVZ(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZ(gt1, gt2) + MRGChaToChaVZ(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZ(gt1, gt2) + MRGChaToChaVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
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
! Chi Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,           & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChaToChiHpm)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaToChiHpm(ZcplcChaChiHpmL,ZcplcChaChiHpmR,         & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChaToChiHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,cplcChaChiHpmR, & 
& MChaOS,MChiOS,MHpmOS,MRPChaToChiHpm,MRGChaToChiHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChiHpm(MLambda,em,gs,ZcplcChaChiHpmL,               & 
& ZcplcChaChiHpmR,MChaOS,MChiOS,MHpmOS,MRPChaToChiHpm,MRGChaToChiHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,cplcChaChiHpmR, & 
& MCha,MChi,MHpm,MRPChaToChiHpm,MRGChaToChiHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChiHpm(MLambda,em,gs,ZcplcChaChiHpmL,               & 
& ZcplcChaChiHpmR,MCha,MChi,MHpm,MRPChaToChiHpm,MRGChaToChiHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,           & 
& ctcplcChaChiHpmL,ctcplcChaChiHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,              & 
& ZfL0,ZfLm,ZfLp,AmpWaveChaToChiHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexChaToChiHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrChaToChiHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiHpm(MAhOS,MChaOS,MChiOS,MFdOS,          & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& ZcplcChaChiHpmL,ZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& ZcplcChaChiHpmL,ZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiHpm(MAhOS,MChaOS,MChiOS,MFdOS,          & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,        & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

 End if 
 End if 
AmpVertexChaToChiHpm = AmpVertexChaToChiHpm -  AmpVertexIRdrChaToChiHpm! +  AmpVertexIRosChaToChiHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChiHpm(1,gt2,:,:) = AmpWaveZChaToChiHpm(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiHpm(1,gt1,:,:) 
AmpVertexZChaToChiHpm(1,gt2,:,:)= AmpVertexZChaToChiHpm(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiHpm(1,gt1,:,:) 
AmpWaveZChaToChiHpm(2,gt2,:,:) = AmpWaveZChaToChiHpm(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiHpm(2,gt1,:,:) 
AmpVertexZChaToChiHpm(2,gt2,:,:)= AmpVertexZChaToChiHpm(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiHpm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
! Final State 1 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChiHpm(1,:,gt2,:) = AmpWaveZChaToChiHpm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChaToChiHpm(1,:,gt1,:) 
AmpVertexZChaToChiHpm(1,:,gt2,:)= AmpVertexZChaToChiHpm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChaToChiHpm(1,:,gt1,:) 
AmpWaveZChaToChiHpm(2,:,gt2,:) = AmpWaveZChaToChiHpm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiHpm(2,:,gt1,:) 
AmpVertexZChaToChiHpm(2,:,gt2,:)= AmpVertexZChaToChiHpm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiHpm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
! Final State 2 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChiHpm(:,:,:,gt2) = AmpWaveZChaToChiHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveChaToChiHpm(:,:,:,gt1) 
AmpVertexZChaToChiHpm(:,:,:,gt2)= AmpVertexZChaToChiHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexChaToChiHpm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChiHpm = AmpVertexChaToChiHpm  +  AmpVertexIRosChaToChiHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Chi Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm 
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm  
Else 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm + AmpWaveChaToChiHpm + AmpVertexChaToChiHpm
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + AmpWaveChaToChiHpm + AmpVertexChaToChiHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,5
    Do gt3=2,2
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChiOS(gt2)+MHpmOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MChi(gt2)+MHpm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = 2._dp*AmpWaveChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = 2._dp*AmpVertexChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqTreeChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3)  
  AmpSum2ChaToChiHpm = + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3) + AmpSqTreeChaToChiHpm(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqTreeChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3)  
  AmpSum2ChaToChiHpm = + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3) + AmpSqTreeChaToChiHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChiHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChiHpm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),helfactor*AmpSqChaToChiHpm(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MChi(gt2),MHpm(gt3),helfactor*AmpSqChaToChiHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChiHpm(gt1, gt2, gt3) + MRGChaToChiHpm(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChiHpm(gt1, gt2, gt3) + MRGChaToChiHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
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
! Chi VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,           & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChaToChiVWm)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaToChiVWm(ZcplcChaChiVWmL,ZcplcChaChiVWmR,         & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChaToChiVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,cplcChaChiVWmR, & 
& MChaOS,MChiOS,MVWmOS,MRPChaToChiVWm,MRGChaToChiVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChiVWm(MLambda,em,gs,ZcplcChaChiVWmL,               & 
& ZcplcChaChiVWmR,MChaOS,MChiOS,MVWmOS,MRPChaToChiVWm,MRGChaToChiVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,cplcChaChiVWmR, & 
& MCha,MChi,MVWm,MRPChaToChiVWm,MRGChaToChiVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToChiVWm(MLambda,em,gs,ZcplcChaChiVWmL,               & 
& ZcplcChaChiVWmR,MCha,MChi,MVWm,MRPChaToChiVWm,MRGChaToChiVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,           & 
& ctcplcChaChiVWmL,ctcplcChaChiVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,               & 
& ZfLm,ZfLp,ZfVWm,AmpWaveChaToChiVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,cplcFdFuVWmR,cplcChaFvSeL,   & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexChaToChiVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,cplcFdFuVWmR,cplcChaFvSeL,   & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRdrChaToChiVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiVWm(MAhOS,MChaOS,MChiOS,MFdOS,          & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,GosZcplcChaChiHpmL,& 
& GosZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,   & 
& cplcFuChiSuR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChiVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,GZcplcChaChiHpmL, & 
& GZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,     & 
& cplcFuChiSuR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,      & 
& GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChiVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiVWm(MAhOS,MChaOS,MChiOS,MFdOS,          & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,GcplcChaChiHpmL,  & 
& GcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,      & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,cplcFdFuVWmR,cplcChaFvSeL,   & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,GcplcHpmVPVWm,cplcVWmVPVWm,      & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChiVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFdFuVWmL,cplcFdFuVWmR,cplcChaFvSeL,   & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChiVWm)

 End if 
 End if 
AmpVertexChaToChiVWm = AmpVertexChaToChiVWm -  AmpVertexIRdrChaToChiVWm! +  AmpVertexIRosChaToChiVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChiVWm=0._dp 
AmpVertexZChaToChiVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChiVWm(1,gt2,:) = AmpWaveZChaToChiVWm(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiVWm(1,gt1,:) 
AmpVertexZChaToChiVWm(1,gt2,:)= AmpVertexZChaToChiVWm(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiVWm(1,gt1,:) 
AmpWaveZChaToChiVWm(2,gt2,:) = AmpWaveZChaToChiVWm(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiVWm(2,gt1,:) 
AmpVertexZChaToChiVWm(2,gt2,:)= AmpVertexZChaToChiVWm(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiVWm(2,gt1,:) 
AmpWaveZChaToChiVWm(3,gt2,:) = AmpWaveZChaToChiVWm(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiVWm(3,gt1,:) 
AmpVertexZChaToChiVWm(3,gt2,:)= AmpVertexZChaToChiVWm(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiVWm(3,gt1,:) 
AmpWaveZChaToChiVWm(4,gt2,:) = AmpWaveZChaToChiVWm(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiVWm(4,gt1,:) 
AmpVertexZChaToChiVWm(4,gt2,:)= AmpVertexZChaToChiVWm(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiVWm(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChiVWm=AmpWaveZChaToChiVWm 
AmpVertexChaToChiVWm= AmpVertexZChaToChiVWm
! Final State 1 
AmpWaveZChaToChiVWm=0._dp 
AmpVertexZChaToChiVWm=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChiVWm(1,:,gt2) = AmpWaveZChaToChiVWm(1,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChaToChiVWm(1,:,gt1) 
AmpVertexZChaToChiVWm(1,:,gt2)= AmpVertexZChaToChiVWm(1,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChaToChiVWm(1,:,gt1) 
AmpWaveZChaToChiVWm(2,:,gt2) = AmpWaveZChaToChiVWm(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiVWm(2,:,gt1) 
AmpVertexZChaToChiVWm(2,:,gt2)= AmpVertexZChaToChiVWm(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiVWm(2,:,gt1) 
AmpWaveZChaToChiVWm(3,:,gt2) = AmpWaveZChaToChiVWm(3,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChaToChiVWm(3,:,gt1) 
AmpVertexZChaToChiVWm(3,:,gt2)= AmpVertexZChaToChiVWm(3,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChaToChiVWm(3,:,gt1) 
AmpWaveZChaToChiVWm(4,:,gt2) = AmpWaveZChaToChiVWm(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiVWm(4,:,gt1) 
AmpVertexZChaToChiVWm(4,:,gt2)= AmpVertexZChaToChiVWm(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiVWm(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChiVWm=AmpWaveZChaToChiVWm 
AmpVertexChaToChiVWm= AmpVertexZChaToChiVWm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChiVWm = AmpVertexChaToChiVWm  +  AmpVertexIRosChaToChiVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Chi VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm 
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm  
Else 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm + AmpWaveChaToChiVWm + AmpVertexChaToChiVWm
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + AmpWaveChaToChiVWm + AmpVertexChaToChiVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,5
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChiOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MChi(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = 2._dp*AmpWaveChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = 2._dp*AmpVertexChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChiVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqTreeChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2)  
  AmpSum2ChaToChiVWm = + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2) + AmpSqTreeChaToChiVWm(gt1, gt2)  
Else  
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqTreeChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2)  
  AmpSum2ChaToChiVWm = + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2) + AmpSqTreeChaToChiVWm(gt1, gt2)  
End if  
Else  
  AmpSqChaToChiVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChiVWm(gt1, gt2).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChiOS(gt2),MVWmOS,helfactor*AmpSqChaToChiVWm(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MChi(gt2),MVWm,helfactor*AmpSqChaToChiVWm(gt1, gt2))
End if 
If ((Abs(MRPChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChiVWm(gt1, gt2) + MRGChaToChiVWm(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChiVWm(gt1, gt2) + MRGChaToChiVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
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
! Fd Conjg(Su)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,              & 
& MCha,MFd,MSu,MCha2,MFd2,MSu2,AmpTreeChaToFdcSu)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaToFdcSu(ZcplcChaFdcSuL,ZcplcChaFdcSuR,            & 
& MCha,MFd,MSu,MCha2,MFd2,MSu2,AmpTreeChaToFdcSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,    & 
& MChaOS,MFdOS,MSuOS,MRPChaToFdcSu,MRGChaToFdcSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFdcSu(MLambda,em,gs,ZcplcChaFdcSuL,ZcplcChaFdcSuR,  & 
& MChaOS,MFdOS,MSuOS,MRPChaToFdcSu,MRGChaToFdcSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,    & 
& MCha,MFd,MSu,MRPChaToFdcSu,MRGChaToFdcSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFdcSu(MLambda,em,gs,ZcplcChaFdcSuL,ZcplcChaFdcSuR,  & 
& MCha,MFd,MSu,MRPChaToFdcSu,MRGChaToFdcSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,              & 
& ctcplcChaFdcSuL,ctcplcChaFdcSuR,MCha,MCha2,MFd,MFd2,MSu,MSu2,ZfFDL,ZfFDR,              & 
& ZfLm,ZfLp,ZfSu,AmpWaveChaToFdcSu)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,       & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,              & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,        & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,           & 
& cplSucSuVZ,AmpVertexChaToFdcSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,       & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,              & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,        & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,           & 
& cplSucSuVZ,AmpVertexIRdrChaToFdcSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFdcSu(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFdcSdL,    & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,          & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,ZcplcChaFdcSuL,            & 
& ZcplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,   & 
& cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,         & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRosChaToFdcSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,       & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,              & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,cplcFuFdcHpmL,       & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,        & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,           & 
& cplSucSuVZ,AmpVertexIRosChaToFdcSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFdcSu(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFdcSdL,    & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,          & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,    & 
& cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,         & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRosChaToFdcSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,       & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,              & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,        & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,           & 
& cplSucSuVZ,AmpVertexIRosChaToFdcSu)

 End if 
 End if 
AmpVertexChaToFdcSu = AmpVertexChaToFdcSu -  AmpVertexIRdrChaToFdcSu! +  AmpVertexIRosChaToFdcSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFdcSu(1,gt2,:,:) = AmpWaveZChaToFdcSu(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFdcSu(1,gt1,:,:) 
AmpVertexZChaToFdcSu(1,gt2,:,:)= AmpVertexZChaToFdcSu(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFdcSu(1,gt1,:,:) 
AmpWaveZChaToFdcSu(2,gt2,:,:) = AmpWaveZChaToFdcSu(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFdcSu(2,gt1,:,:) 
AmpVertexZChaToFdcSu(2,gt2,:,:)= AmpVertexZChaToFdcSu(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFdcSu(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
! Final State 1 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToFdcSu(1,:,gt2,:) = AmpWaveZChaToFdcSu(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpWaveChaToFdcSu(1,:,gt1,:) 
AmpVertexZChaToFdcSu(1,:,gt2,:)= AmpVertexZChaToFdcSu(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpVertexChaToFdcSu(1,:,gt1,:) 
AmpWaveZChaToFdcSu(2,:,gt2,:) = AmpWaveZChaToFdcSu(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpWaveChaToFdcSu(2,:,gt1,:) 
AmpVertexZChaToFdcSu(2,:,gt2,:)= AmpVertexZChaToFdcSu(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpVertexChaToFdcSu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
! Final State 2 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFdcSu(:,:,:,gt2) = AmpWaveZChaToFdcSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpWaveChaToFdcSu(:,:,:,gt1) 
AmpVertexZChaToFdcSu(:,:,:,gt2)= AmpVertexZChaToFdcSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpVertexChaToFdcSu(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFdcSu = AmpVertexChaToFdcSu  +  AmpVertexIRosChaToFdcSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fd conj[Su] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu 
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu  
Else 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu + AmpWaveChaToFdcSu + AmpVertexChaToFdcSu
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + AmpWaveChaToFdcSu + AmpVertexChaToFdcSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChaOS(gt1).gt.(MFdOS(gt2)+MSuOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MFd(gt2)+MSu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = 2._dp*AmpWaveChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = 2._dp*AmpVertexChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqTreeChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3)  
  AmpSum2ChaToFdcSu = + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3) + AmpSqTreeChaToFdcSu(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqTreeChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3)  
  AmpSum2ChaToFdcSu = + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3) + AmpSqTreeChaToFdcSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFdcSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFdcSu(gt1, gt2, gt3).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),helfactor*AmpSqChaToFdcSu(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MCha(gt1),MFd(gt2),MSu(gt3),helfactor*AmpSqChaToFdcSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFdcSu(gt1, gt2, gt3) + MRGChaToFdcSu(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFdcSu(gt1, gt2, gt3) + MRGChaToFdcSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
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
! Fe SvIm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaToFeSvIm(cplcChaFeSvImL,cplcChaFeSvImR,           & 
& MCha,MFe,MSvIm,MCha2,MFe2,MSvIm2,AmpTreeChaToFeSvIm)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaToFeSvIm(ZcplcChaFeSvImL,ZcplcChaFeSvImR,         & 
& MCha,MFe,MSvIm,MCha2,MFe2,MSvIm2,AmpTreeChaToFeSvIm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFeSvIm(MLambda,em,gs,cplcChaFeSvImL,cplcChaFeSvImR, & 
& MChaOS,MFeOS,MSvImOS,MRPChaToFeSvIm,MRGChaToFeSvIm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFeSvIm(MLambda,em,gs,ZcplcChaFeSvImL,               & 
& ZcplcChaFeSvImR,MChaOS,MFeOS,MSvImOS,MRPChaToFeSvIm,MRGChaToFeSvIm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaToFeSvIm(MLambda,em,gs,cplcChaFeSvImL,cplcChaFeSvImR, & 
& MCha,MFe,MSvIm,MRPChaToFeSvIm,MRGChaToFeSvIm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFeSvIm(MLambda,em,gs,ZcplcChaFeSvImL,               & 
& ZcplcChaFeSvImR,MCha,MFe,MSvIm,MRPChaToFeSvIm,MRGChaToFeSvIm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToFeSvIm(cplcChaFeSvImL,cplcChaFeSvImR,           & 
& ctcplcChaFeSvImL,ctcplcChaFeSvImR,MCha,MCha2,MFe,MFe2,MSvIm,MSvIm2,ZfFEL,              & 
& ZfFER,ZfLm,ZfLp,ZfSvIm,AmpWaveChaToFeSvIm)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexChaToFeSvIm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexIRdrChaToFeSvIm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvIm(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,ZcplcChaFeSvImL,ZcplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexIRosChaToFeSvIm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,ZcplcChaFeSvImL,ZcplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexIRosChaToFeSvIm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvIm(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexIRosChaToFeSvIm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexIRosChaToFeSvIm)

 End if 
 End if 
AmpVertexChaToFeSvIm = AmpVertexChaToFeSvIm -  AmpVertexIRdrChaToFeSvIm! +  AmpVertexIRosChaToFeSvIm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFeSvIm=0._dp 
AmpVertexZChaToFeSvIm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFeSvIm(1,gt2,:,:) = AmpWaveZChaToFeSvIm(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFeSvIm(1,gt1,:,:) 
AmpVertexZChaToFeSvIm(1,gt2,:,:)= AmpVertexZChaToFeSvIm(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFeSvIm(1,gt1,:,:) 
AmpWaveZChaToFeSvIm(2,gt2,:,:) = AmpWaveZChaToFeSvIm(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFeSvIm(2,gt1,:,:) 
AmpVertexZChaToFeSvIm(2,gt2,:,:)= AmpVertexZChaToFeSvIm(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFeSvIm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFeSvIm=AmpWaveZChaToFeSvIm 
AmpVertexChaToFeSvIm= AmpVertexZChaToFeSvIm
! Final State 1 
AmpWaveZChaToFeSvIm=0._dp 
AmpVertexZChaToFeSvIm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToFeSvIm(1,:,gt2,:) = AmpWaveZChaToFeSvIm(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveChaToFeSvIm(1,:,gt1,:) 
AmpVertexZChaToFeSvIm(1,:,gt2,:)= AmpVertexZChaToFeSvIm(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexChaToFeSvIm(1,:,gt1,:) 
AmpWaveZChaToFeSvIm(2,:,gt2,:) = AmpWaveZChaToFeSvIm(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveChaToFeSvIm(2,:,gt1,:) 
AmpVertexZChaToFeSvIm(2,:,gt2,:)= AmpVertexZChaToFeSvIm(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexChaToFeSvIm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFeSvIm=AmpWaveZChaToFeSvIm 
AmpVertexChaToFeSvIm= AmpVertexZChaToFeSvIm
! Final State 2 
AmpWaveZChaToFeSvIm=0._dp 
AmpVertexZChaToFeSvIm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFeSvIm(:,:,:,gt2) = AmpWaveZChaToFeSvIm(:,:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveChaToFeSvIm(:,:,:,gt1) 
AmpVertexZChaToFeSvIm(:,:,:,gt2)= AmpVertexZChaToFeSvIm(:,:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexChaToFeSvIm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFeSvIm=AmpWaveZChaToFeSvIm 
AmpVertexChaToFeSvIm= AmpVertexZChaToFeSvIm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFeSvIm = AmpVertexChaToFeSvIm  +  AmpVertexIRosChaToFeSvIm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fe SvIm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFeSvIm = AmpTreeChaToFeSvIm 
 AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm + 2._dp*AmpWaveChaToFeSvIm + 2._dp*AmpVertexChaToFeSvIm  
Else 
 AmpSumChaToFeSvIm = AmpTreeChaToFeSvIm + AmpWaveChaToFeSvIm + AmpVertexChaToFeSvIm
 AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm + AmpWaveChaToFeSvIm + AmpVertexChaToFeSvIm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFeSvIm = AmpTreeChaToFeSvIm
 AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChaOS(gt1).gt.(MFeOS(gt2)+MSvImOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MFe(gt2)+MSvIm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFeSvIm(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvIm = 2._dp*AmpWaveChaToFeSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFeSvIm(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvIm = 2._dp*AmpVertexChaToFeSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFeSvIm(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm + 2._dp*AmpWaveChaToFeSvIm + 2._dp*AmpVertexChaToFeSvIm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFeSvIm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
  AmpSqTreeChaToFeSvIm(gt1, gt2, gt3) = AmpSqChaToFeSvIm(gt1, gt2, gt3)  
  AmpSum2ChaToFeSvIm = + 2._dp*AmpWaveChaToFeSvIm + 2._dp*AmpVertexChaToFeSvIm
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
  AmpSqChaToFeSvIm(gt1, gt2, gt3) = AmpSqChaToFeSvIm(gt1, gt2, gt3) + AmpSqTreeChaToFeSvIm(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFeSvIm = AmpTreeChaToFeSvIm
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
  AmpSqTreeChaToFeSvIm(gt1, gt2, gt3) = AmpSqChaToFeSvIm(gt1, gt2, gt3)  
  AmpSum2ChaToFeSvIm = + 2._dp*AmpWaveChaToFeSvIm + 2._dp*AmpVertexChaToFeSvIm
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvIm(gt3),AmpSumChaToFeSvIm(:,gt1, gt2, gt3),AmpSum2ChaToFeSvIm(:,gt1, gt2, gt3),AmpSqChaToFeSvIm(gt1, gt2, gt3)) 
  AmpSqChaToFeSvIm(gt1, gt2, gt3) = AmpSqChaToFeSvIm(gt1, gt2, gt3) + AmpSqTreeChaToFeSvIm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFeSvIm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFeSvIm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MFeOS(gt2),MSvImOS(gt3),helfactor*AmpSqChaToFeSvIm(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MFe(gt2),MSvIm(gt3),helfactor*AmpSqChaToFeSvIm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFeSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFeSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFeSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFeSvIm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFeSvIm(gt1, gt2, gt3) + MRGChaToFeSvIm(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFeSvIm(gt1, gt2, gt3) + MRGChaToFeSvIm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
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
! Fe SvRe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaToFeSvRe(cplcChaFeSvReL,cplcChaFeSvReR,           & 
& MCha,MFe,MSvRe,MCha2,MFe2,MSvRe2,AmpTreeChaToFeSvRe)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaToFeSvRe(ZcplcChaFeSvReL,ZcplcChaFeSvReR,         & 
& MCha,MFe,MSvRe,MCha2,MFe2,MSvRe2,AmpTreeChaToFeSvRe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFeSvRe(MLambda,em,gs,cplcChaFeSvReL,cplcChaFeSvReR, & 
& MChaOS,MFeOS,MSvReOS,MRPChaToFeSvRe,MRGChaToFeSvRe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFeSvRe(MLambda,em,gs,ZcplcChaFeSvReL,               & 
& ZcplcChaFeSvReR,MChaOS,MFeOS,MSvReOS,MRPChaToFeSvRe,MRGChaToFeSvRe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaToFeSvRe(MLambda,em,gs,cplcChaFeSvReL,cplcChaFeSvReR, & 
& MCha,MFe,MSvRe,MRPChaToFeSvRe,MRGChaToFeSvRe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFeSvRe(MLambda,em,gs,ZcplcChaFeSvReL,               & 
& ZcplcChaFeSvReR,MCha,MFe,MSvRe,MRPChaToFeSvRe,MRGChaToFeSvRe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToFeSvRe(cplcChaFeSvReL,cplcChaFeSvReR,           & 
& ctcplcChaFeSvReL,ctcplcChaFeSvReR,MCha,MCha2,MFe,MFe2,MSvRe,MSvRe2,ZfFEL,              & 
& ZfFER,ZfLm,ZfLp,ZfSvRe,AmpWaveChaToFeSvRe)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,   & 
& cplSvRecSeVWm,AmpVertexChaToFeSvRe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,   & 
& cplSvRecSeVWm,AmpVertexIRdrChaToFeSvRe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvRe(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvRe,              & 
& cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,ZcplcChaFeSvReL,ZcplcChaFeSvReR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,   & 
& cplSvRecSeVWm,AmpVertexIRosChaToFeSvRe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,ZcplcChaFeSvReL,ZcplcChaFeSvReR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,   & 
& cplSvRecSeVWm,AmpVertexIRosChaToFeSvRe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvRe(MAhOS,MChaOS,MChiOS,MFeOS,          & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvRe,              & 
& cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,   & 
& cplSvRecSeVWm,AmpVertexIRosChaToFeSvRe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,   & 
& cplSvRecSeVWm,AmpVertexIRosChaToFeSvRe)

 End if 
 End if 
AmpVertexChaToFeSvRe = AmpVertexChaToFeSvRe -  AmpVertexIRdrChaToFeSvRe! +  AmpVertexIRosChaToFeSvRe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFeSvRe=0._dp 
AmpVertexZChaToFeSvRe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFeSvRe(1,gt2,:,:) = AmpWaveZChaToFeSvRe(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFeSvRe(1,gt1,:,:) 
AmpVertexZChaToFeSvRe(1,gt2,:,:)= AmpVertexZChaToFeSvRe(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFeSvRe(1,gt1,:,:) 
AmpWaveZChaToFeSvRe(2,gt2,:,:) = AmpWaveZChaToFeSvRe(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFeSvRe(2,gt1,:,:) 
AmpVertexZChaToFeSvRe(2,gt2,:,:)= AmpVertexZChaToFeSvRe(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFeSvRe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFeSvRe=AmpWaveZChaToFeSvRe 
AmpVertexChaToFeSvRe= AmpVertexZChaToFeSvRe
! Final State 1 
AmpWaveZChaToFeSvRe=0._dp 
AmpVertexZChaToFeSvRe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToFeSvRe(1,:,gt2,:) = AmpWaveZChaToFeSvRe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveChaToFeSvRe(1,:,gt1,:) 
AmpVertexZChaToFeSvRe(1,:,gt2,:)= AmpVertexZChaToFeSvRe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexChaToFeSvRe(1,:,gt1,:) 
AmpWaveZChaToFeSvRe(2,:,gt2,:) = AmpWaveZChaToFeSvRe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveChaToFeSvRe(2,:,gt1,:) 
AmpVertexZChaToFeSvRe(2,:,gt2,:)= AmpVertexZChaToFeSvRe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexChaToFeSvRe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFeSvRe=AmpWaveZChaToFeSvRe 
AmpVertexChaToFeSvRe= AmpVertexZChaToFeSvRe
! Final State 2 
AmpWaveZChaToFeSvRe=0._dp 
AmpVertexZChaToFeSvRe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFeSvRe(:,:,:,gt2) = AmpWaveZChaToFeSvRe(:,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveChaToFeSvRe(:,:,:,gt1) 
AmpVertexZChaToFeSvRe(:,:,:,gt2)= AmpVertexZChaToFeSvRe(:,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexChaToFeSvRe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFeSvRe=AmpWaveZChaToFeSvRe 
AmpVertexChaToFeSvRe= AmpVertexZChaToFeSvRe
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFeSvRe = AmpVertexChaToFeSvRe  +  AmpVertexIRosChaToFeSvRe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fe SvRe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFeSvRe = AmpTreeChaToFeSvRe 
 AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe + 2._dp*AmpWaveChaToFeSvRe + 2._dp*AmpVertexChaToFeSvRe  
Else 
 AmpSumChaToFeSvRe = AmpTreeChaToFeSvRe + AmpWaveChaToFeSvRe + AmpVertexChaToFeSvRe
 AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe + AmpWaveChaToFeSvRe + AmpVertexChaToFeSvRe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFeSvRe = AmpTreeChaToFeSvRe
 AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChaOS(gt1).gt.(MFeOS(gt2)+MSvReOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MFe(gt2)+MSvRe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFeSvRe(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvRe = 2._dp*AmpWaveChaToFeSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFeSvRe(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvRe = 2._dp*AmpVertexChaToFeSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFeSvRe(gt1, gt2, gt3) 
  AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe + 2._dp*AmpWaveChaToFeSvRe + 2._dp*AmpVertexChaToFeSvRe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFeSvRe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
  AmpSqTreeChaToFeSvRe(gt1, gt2, gt3) = AmpSqChaToFeSvRe(gt1, gt2, gt3)  
  AmpSum2ChaToFeSvRe = + 2._dp*AmpWaveChaToFeSvRe + 2._dp*AmpVertexChaToFeSvRe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
  AmpSqChaToFeSvRe(gt1, gt2, gt3) = AmpSqChaToFeSvRe(gt1, gt2, gt3) + AmpSqTreeChaToFeSvRe(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFeSvRe = AmpTreeChaToFeSvRe
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
  AmpSqTreeChaToFeSvRe(gt1, gt2, gt3) = AmpSqChaToFeSvRe(gt1, gt2, gt3)  
  AmpSum2ChaToFeSvRe = + 2._dp*AmpWaveChaToFeSvRe + 2._dp*AmpVertexChaToFeSvRe
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSvRe(gt3),AmpSumChaToFeSvRe(:,gt1, gt2, gt3),AmpSum2ChaToFeSvRe(:,gt1, gt2, gt3),AmpSqChaToFeSvRe(gt1, gt2, gt3)) 
  AmpSqChaToFeSvRe(gt1, gt2, gt3) = AmpSqChaToFeSvRe(gt1, gt2, gt3) + AmpSqTreeChaToFeSvRe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFeSvRe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFeSvRe(gt1, gt2, gt3).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MFeOS(gt2),MSvReOS(gt3),helfactor*AmpSqChaToFeSvRe(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MFe(gt2),MSvRe(gt3),helfactor*AmpSqChaToFeSvRe(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFeSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFeSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFeSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFeSvRe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFeSvRe(gt1, gt2, gt3) + MRGChaToFeSvRe(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFeSvRe(gt1, gt2, gt3) + MRGChaToFeSvRe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
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
! Fv Se
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaToFvSe(cplcChaFvSeL,cplcChaFvSeR,MCha,            & 
& MFv,MSe,MCha2,MFv2,MSe2,AmpTreeChaToFvSe)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaToFvSe(ZcplcChaFvSeL,ZcplcChaFvSeR,               & 
& MCha,MFv,MSe,MCha2,MFv2,MSe2,AmpTreeChaToFvSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFvSe(MLambda,em,gs,cplcChaFvSeL,cplcChaFvSeR,       & 
& MChaOS,MFvOS,MSeOS,MRPChaToFvSe,MRGChaToFvSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFvSe(MLambda,em,gs,ZcplcChaFvSeL,ZcplcChaFvSeR,     & 
& MChaOS,MFvOS,MSeOS,MRPChaToFvSe,MRGChaToFvSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaToFvSe(MLambda,em,gs,cplcChaFvSeL,cplcChaFvSeR,       & 
& MCha,MFv,MSe,MRPChaToFvSe,MRGChaToFvSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaToFvSe(MLambda,em,gs,ZcplcChaFvSeL,ZcplcChaFvSeR,     & 
& MCha,MFv,MSe,MRPChaToFvSe,MRGChaToFvSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToFvSe(cplcChaFvSeL,cplcChaFvSeR,ctcplcChaFvSeL,  & 
& ctcplcChaFvSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFV,ZfLm,ZfLp,ZfSe,AmpWaveChaToFvSe)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,             & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,        & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,AmpVertexChaToFvSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,             & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,        & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,AmpVertexIRdrChaToFvSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFvSe(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,cplFvFvAhR,cplAhSecSe,cplFvChacSeL,      & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,   & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,   & 
& cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,               & 
& cplcFeFvHpmR,ZcplcChaFvSeL,ZcplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& AmpVertexIRosChaToFvSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,             & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,ZcplcChaFvSeL,ZcplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,        & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,AmpVertexIRosChaToFvSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFvSe(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,cplFvFvAhR,cplAhSecSe,cplFvChacSeL,      & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,   & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,   & 
& cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,               & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,           & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& AmpVertexIRosChaToFvSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,             & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,   & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,        & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,AmpVertexIRosChaToFvSe)

 End if 
 End if 
AmpVertexChaToFvSe = AmpVertexChaToFvSe -  AmpVertexIRdrChaToFvSe! +  AmpVertexIRosChaToFvSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFvSe=0._dp 
AmpVertexZChaToFvSe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFvSe(1,gt2,:,:) = AmpWaveZChaToFvSe(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFvSe(1,gt1,:,:) 
AmpVertexZChaToFvSe(1,gt2,:,:)= AmpVertexZChaToFvSe(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFvSe(1,gt1,:,:) 
AmpWaveZChaToFvSe(2,gt2,:,:) = AmpWaveZChaToFvSe(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFvSe(2,gt1,:,:) 
AmpVertexZChaToFvSe(2,gt2,:,:)= AmpVertexZChaToFvSe(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFvSe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFvSe=AmpWaveZChaToFvSe 
AmpVertexChaToFvSe= AmpVertexZChaToFvSe
! Final State 1 
AmpWaveZChaToFvSe=0._dp 
AmpVertexZChaToFvSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFvSe(1,:,gt2,:) = AmpWaveZChaToFvSe(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveChaToFvSe(1,:,gt1,:) 
AmpVertexZChaToFvSe(1,:,gt2,:)= AmpVertexZChaToFvSe(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexChaToFvSe(1,:,gt1,:) 
AmpWaveZChaToFvSe(2,:,gt2,:) = AmpWaveZChaToFvSe(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveChaToFvSe(2,:,gt1,:) 
AmpVertexZChaToFvSe(2,:,gt2,:)= AmpVertexZChaToFvSe(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexChaToFvSe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFvSe=AmpWaveZChaToFvSe 
AmpVertexChaToFvSe= AmpVertexZChaToFvSe
! Final State 2 
AmpWaveZChaToFvSe=0._dp 
AmpVertexZChaToFvSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFvSe(:,:,:,gt2) = AmpWaveZChaToFvSe(:,:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveChaToFvSe(:,:,:,gt1) 
AmpVertexZChaToFvSe(:,:,:,gt2)= AmpVertexZChaToFvSe(:,:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexChaToFvSe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFvSe=AmpWaveZChaToFvSe 
AmpVertexChaToFvSe= AmpVertexZChaToFvSe
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFvSe = AmpVertexChaToFvSe  +  AmpVertexIRosChaToFvSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fv Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFvSe = AmpTreeChaToFvSe 
 AmpSum2ChaToFvSe = AmpTreeChaToFvSe + 2._dp*AmpWaveChaToFvSe + 2._dp*AmpVertexChaToFvSe  
Else 
 AmpSumChaToFvSe = AmpTreeChaToFvSe + AmpWaveChaToFvSe + AmpVertexChaToFvSe
 AmpSum2ChaToFvSe = AmpTreeChaToFvSe + AmpWaveChaToFvSe + AmpVertexChaToFvSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFvSe = AmpTreeChaToFvSe
 AmpSum2ChaToFvSe = AmpTreeChaToFvSe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MChaOS(gt1).gt.(MFvOS(gt2)+MSeOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MFv(gt2)+MSe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFvSe = AmpTreeChaToFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFvSe(gt1, gt2, gt3) 
  AmpSum2ChaToFvSe = 2._dp*AmpWaveChaToFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFvSe(gt1, gt2, gt3) 
  AmpSum2ChaToFvSe = 2._dp*AmpVertexChaToFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFvSe(gt1, gt2, gt3) 
  AmpSum2ChaToFvSe = AmpTreeChaToFvSe + 2._dp*AmpWaveChaToFvSe + 2._dp*AmpVertexChaToFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFvSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFvSe = AmpTreeChaToFvSe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
  AmpSqTreeChaToFvSe(gt1, gt2, gt3) = AmpSqChaToFvSe(gt1, gt2, gt3)  
  AmpSum2ChaToFvSe = + 2._dp*AmpWaveChaToFvSe + 2._dp*AmpVertexChaToFvSe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
  AmpSqChaToFvSe(gt1, gt2, gt3) = AmpSqChaToFvSe(gt1, gt2, gt3) + AmpSqTreeChaToFvSe(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFvSe = AmpTreeChaToFvSe
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
  AmpSqTreeChaToFvSe(gt1, gt2, gt3) = AmpSqChaToFvSe(gt1, gt2, gt3)  
  AmpSum2ChaToFvSe = + 2._dp*AmpWaveChaToFvSe + 2._dp*AmpVertexChaToFvSe
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaToFvSe(:,gt1, gt2, gt3),AmpSum2ChaToFvSe(:,gt1, gt2, gt3),AmpSqChaToFvSe(gt1, gt2, gt3)) 
  AmpSqChaToFvSe(gt1, gt2, gt3) = AmpSqChaToFvSe(gt1, gt2, gt3) + AmpSqTreeChaToFvSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFvSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFvSe(gt1, gt2, gt3).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),helfactor*AmpSqChaToFvSe(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MFv(gt2),MSe(gt3),helfactor*AmpSqChaToFvSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFvSe(gt1, gt2, gt3) + MRGChaToFvSe(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFvSe(gt1, gt2, gt3) + MRGChaToFvSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
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
! bar(Fu) Sd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_seesaw1nmssm_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,              & 
& MCha,MFu,MSd,MCha2,MFu2,MSd2,AmpTreeChaTocFuSd)

  Else 
Call Amplitude_Tree_seesaw1nmssm_ChaTocFuSd(ZcplcChacFuSdL,ZcplcChacFuSdR,            & 
& MCha,MFu,MSd,MCha2,MFu2,MSd2,AmpTreeChaTocFuSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,cplcChacFuSdR,    & 
& MChaOS,MFuOS,MSdOS,MRPChaTocFuSd,MRGChaTocFuSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaTocFuSd(MLambda,em,gs,ZcplcChacFuSdL,ZcplcChacFuSdR,  & 
& MChaOS,MFuOS,MSdOS,MRPChaTocFuSd,MRGChaTocFuSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_seesaw1nmssm_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,cplcChacFuSdR,    & 
& MCha,MFu,MSd,MRPChaTocFuSd,MRGChaTocFuSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_seesaw1nmssm_ChaTocFuSd(MLambda,em,gs,ZcplcChacFuSdL,ZcplcChacFuSdR,  & 
& MCha,MFu,MSd,MRPChaTocFuSd,MRGChaTocFuSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,              & 
& ctcplcChacFuSdL,ctcplcChacFuSdR,MCha,MCha2,MFu,MFu2,MSd,MSd2,ZfFUL,ZfFUR,              & 
& ZfLm,ZfLp,ZfSd,AmpWaveChaTocFuSd)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,             & 
& cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,           & 
& AmpVertexChaTocFuSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,     & 
& cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,             & 
& cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,           & 
& AmpVertexIRdrChaTocFuSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaTocFuSd(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,ZcplcChacFuSdL,               & 
& ZcplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,     & 
& cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,             & 
& cplSdcSdVP,cplSdcSdVZ,ZcplcChacFuSdL,ZcplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,         & 
& AmpVertexIRosChaTocFuSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaTocFuSd(MAhOS,MChaOS,MChiOS,MFdOS,           & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,             & 
& MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,          & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_seesaw1nmssm_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,     & 
& cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,             & 
& cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,           & 
& AmpVertexIRosChaTocFuSd)

 End if 
 End if 
AmpVertexChaTocFuSd = AmpVertexChaTocFuSd -  AmpVertexIRdrChaTocFuSd! +  AmpVertexIRosChaTocFuSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaTocFuSd(1,gt2,:,:) = AmpWaveZChaTocFuSd(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaTocFuSd(1,gt1,:,:) 
AmpVertexZChaTocFuSd(1,gt2,:,:)= AmpVertexZChaTocFuSd(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaTocFuSd(1,gt1,:,:) 
AmpWaveZChaTocFuSd(2,gt2,:,:) = AmpWaveZChaTocFuSd(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaTocFuSd(2,gt1,:,:) 
AmpVertexZChaTocFuSd(2,gt2,:,:)= AmpVertexZChaTocFuSd(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaTocFuSd(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
! Final State 1 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaTocFuSd(1,:,gt2,:) = AmpWaveZChaTocFuSd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWaveChaTocFuSd(1,:,gt1,:) 
AmpVertexZChaTocFuSd(1,:,gt2,:)= AmpVertexZChaTocFuSd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexChaTocFuSd(1,:,gt1,:) 
AmpWaveZChaTocFuSd(2,:,gt2,:) = AmpWaveZChaTocFuSd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWaveChaTocFuSd(2,:,gt1,:) 
AmpVertexZChaTocFuSd(2,:,gt2,:)= AmpVertexZChaTocFuSd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexChaTocFuSd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
! Final State 2 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaTocFuSd(:,:,:,gt2) = AmpWaveZChaTocFuSd(:,:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveChaTocFuSd(:,:,:,gt1) 
AmpVertexZChaTocFuSd(:,:,:,gt2)= AmpVertexZChaTocFuSd(:,:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexChaTocFuSd(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
End if
If (ShiftIRdiv) Then 
AmpVertexChaTocFuSd = AmpVertexChaTocFuSd  +  AmpVertexIRosChaTocFuSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->bar[Fu] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd 
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd  
Else 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd + AmpWaveChaTocFuSd + AmpVertexChaTocFuSd
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + AmpWaveChaTocFuSd + AmpVertexChaTocFuSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChaOS(gt1).gt.(MFuOS(gt2)+MSdOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MFu(gt2)+MSd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = 2._dp*AmpWaveChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = 2._dp*AmpVertexChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3)  
  AmpSum2ChaTocFuSd = + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3) + AmpSqTreeChaTocFuSd(gt1, gt2, gt3)  
Else  
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3)  
  AmpSum2ChaTocFuSd = + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3) + AmpSqTreeChaTocFuSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaTocFuSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaTocFuSd(gt1, gt2, gt3).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),helfactor*AmpSqChaTocFuSd(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MCha(gt1),MFu(gt2),MSd(gt3),helfactor*AmpSqChaTocFuSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaTocFuSd(gt1, gt2, gt3) + MRGChaTocFuSd(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaTocFuSd(gt1, gt2, gt3) + MRGChaTocFuSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
!---------------- 
! Cha VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_seesaw1nmssm_ChaToChaVP(ZcplcChaChaVPL,ZcplcChaChaVPR,            & 
& ZcplcChaChaVZL,ZcplcChaChaVZR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,         & 
& ctcplcChaChaVZR,MChaOS,MCha2OS,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZVP,AmpWaveChaToChaVP)

 Else 
Call Amplitude_WAVE_seesaw1nmssm_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,           & 
& ctcplcChaChaVZR,MChaOS,MCha2OS,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZVP,AmpWaveChaToChaVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToChaVP(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,ZcplcChaChaAhL,             & 
& ZcplcChaChaAhR,ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,ZcplChiChacVWmR,        & 
& ZcplChaFucSdL,ZcplChaFucSdR,ZcplFvChacSeL,ZcplFvChacSeR,ZcplcChaChahhL,ZcplcChaChahhR, & 
& ZcplcFdChaSuL,ZcplcFdChaSuR,ZcplcFeChaSvImL,ZcplcFeChaSvImR,ZcplcFeChaSvReL,           & 
& ZcplcFeChaSvReR,ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,           & 
& ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVPL,          & 
& ZcplcFdFdVPR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcChaFeSvImL,ZcplcChaFeSvImR,            & 
& ZcplcChaFeSvReL,ZcplcChaFeSvReR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFuFuVPL,ZcplcFuFuVPR,   & 
& ZcplcChaFvSeL,ZcplcChaFvSeR,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplcChacFuSdL,    & 
& ZcplcChacFuSdR,ZcplSecSeVP,ZcplSucSuVP,ZcplcHpmVPVWm,ZcplcVWmVPVWm,AmpVertexChaToChaVP)

 Else 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToChaVP(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,           & 
& MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,               & 
& MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcChaFvSeL,cplcChaFvSeR,cplHpmcHpmVP,            & 
& cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVP,cplSucSuVP,             & 
& cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChaToChaVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_seesaw1nmssm_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,           & 
& ctcplcChaChaVZR,MCha,MCha2,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZVP,AmpWaveChaToChaVP)



!Vertex Corrections 
Call Amplitude_VERTEX_seesaw1nmssm_ChaToChaVP(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,               & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcChaFvSeL,cplcChaFvSeR,cplHpmcHpmVP,            & 
& cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVP,cplSucSuVP,             & 
& cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChaToChaVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVP = 0._dp 
 AmpSum2ChaToChaVP = 0._dp  
Else 
 AmpSumChaToChaVP = AmpVertexChaToChaVP + AmpWaveChaToChaVP
 AmpSum2ChaToChaVP = AmpVertexChaToChaVP + AmpWaveChaToChaVP 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChaOS(gt2)+0.))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MCha(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),0._dp,AmpSumChaToChaVP(:,gt1, gt2),AmpSum2ChaToChaVP(:,gt1, gt2),AmpSqChaToChaVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVP,AmpSumChaToChaVP(:,gt1, gt2),AmpSum2ChaToChaVP(:,gt1, gt2),AmpSqChaToChaVP(gt1, gt2)) 
End if  
Else  
  AmpSqChaToChaVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVP(gt1, gt2).le.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),0._dp,helfactor*AmpSqChaToChaVP(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVP,helfactor*AmpSqChaToChaVP(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End Subroutine OneLoopDecay_Cha

End Module Wrapper_OneLoopDecay_Cha_seesaw1nmssm
