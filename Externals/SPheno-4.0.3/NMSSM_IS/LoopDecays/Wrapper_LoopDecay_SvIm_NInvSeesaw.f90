! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:29 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_SvIm_NInvSeesaw
Use Model_Data_NInvSeesaw 
Use Kinematics 
Use OneLoopDecay_SvIm_NInvSeesaw 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_SvIm(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,          & 
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
& ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhAhSvImSvIm1,            & 
& cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhcHpmVWm,cplAhhhhh,cplAhhhSvImSvIm1,             & 
& cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSvImcSe1,& 
& cplAhHpmSvRecSe1,cplAhSdcSd,cplAhSecSe,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,              & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,            & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,        & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,      & 
& cplcVWmVWmVZ,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,         & 
& cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,        & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,& 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSdcSd,cplhhSecSe,     & 
& cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,              & 
& cplhhSvReSvRe,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,           & 
& cplHpmSecHpmcSe1,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,    & 
& cplHpmSvRecSe,cplSdSvImcSecSuaa,cplSdSvImSvImcSdaa,cplSecSecVWmVWm1,cplSecSeVP,        & 
& cplSecSeVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,              & 
& cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvRecHpm,cplSeSvRecVWm,cplSeSvRecVWmVP1,      & 
& cplSeSvRecVWmVZ1,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSvImcSeVPVWm1,               & 
& cplSvImcSeVWm,cplSvImcSeVWmVZ1,cplSvImSvImcVWmVWm1,cplSvImSvImSvImSvIm1,               & 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImVZVZ1,cplSvImSvReSvReSvRe1,       & 
& cplSvImSvReVZ,cplSvRecSeVPVWm1,cplSvRecSeVWm,cplSvRecSeVWmVZ1,cplSvReSvReVZVZ1,        & 
& ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplcFeChaSvImL,ctcplcFeChaSvImR,ctcplChiFvSvImL,     & 
& ctcplChiFvSvImR,ctcplhhSvImSvIm,ctcplhhSvImSvRe,ctcplHpmSvImcSe,ctcplSeSvImcVWm,       & 
& ctcplSvImSvReVZ,GcplcHpmVPVWm,GcplHpmcVWmVP,GcplSeSvImcHpm,GosZcplcHpmVPVWm,           & 
& GosZcplHpmcVWmVP,GosZcplSeSvImcHpm,GZcplcHpmVPVWm,GZcplHpmcVWmVP,GZcplSeSvImcHpm,      & 
& ZcplAhSvImSvIm,ZcplAhSvImSvRe,ZcplcFeChaSvImL,ZcplcFeChaSvImR,ZcplChiFvSvImL,          & 
& ZcplChiFvSvImR,ZcplhhSvImSvIm,ZcplhhSvImSvRe,ZcplHpmSvImcSe,ZcplSeSvImcVWm,            & 
& ZcplSvImSvReVZ,ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUV,          & 
& ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,            & 
& kont,gP1LSvIm)

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

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhAhSvImSvIm1(3,3,9,9),cplAhAhSvImSvRe1(3,3,9,9),& 
& cplAhAhSvReSvRe1(3,3,9,9),cplAhcHpmVWm(3,2),cplAhhhhh(3,3,3),cplAhhhSvImSvIm1(3,3,9,9),& 
& cplAhhhSvImSvRe1(3,3,9,9),cplAhhhSvReSvRe1(3,3,9,9),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),& 
& cplAhHpmcVWm(3,2),cplAhHpmSvImcSe1(3,2,9,6),cplAhHpmSvRecSe1(3,2,9,6),cplAhSdcSd(3,6,6),& 
& cplAhSecSe(3,6,6),cplAhSeSvImcHpm1(3,6,9,2),cplAhSeSvRecHpm1(3,6,9,2),cplAhSucSu(3,6,6),& 
& cplAhSvImSvIm(3,9,9),cplAhSvImSvRe(3,9,9),cplAhSvReSvRe(3,9,9),cplcChaChaAhL(2,2,3),   & 
& cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVPL(2,2),     & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),        & 
& cplcChaChiHpmR(2,5,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcChaFeSvImL(2,3,9),   & 
& cplcChaFeSvImR(2,3,9),cplcChaFeSvReL(2,3,9),cplcChaFeSvReR(2,3,9),cplcChaFvSeL(2,9,6), & 
& cplcChaFvSeR(2,9,6),cplcFeChaSvImL(3,2,9),cplcFeChaSvImR(3,2,9),cplcFeChaSvReL(3,2,9), & 
& cplcFeChaSvReR(3,2,9),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFeFeAhL(3,3,3),      & 
& cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVPL(3,3),             & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,9,2),cplcFeFvHpmR(3,9,2),& 
& cplcFeFvVWmL(3,9),cplcFeFvVWmR(3,9),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),       & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),           & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,9,9),cplChiFvSvImR(5,9,9),     & 
& cplChiFvSvReL(5,9,9),cplChiFvSvReR(5,9,9),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),             & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplFvChacSeL(9,2,6),cplFvChacSeR(9,2,6),cplFvFecHpmL(9,3,2), & 
& cplFvFecHpmR(9,3,2),cplFvFecVWmL(9,3),cplFvFecVWmR(9,3),cplFvFvAhL(9,9,3),             & 
& cplFvFvAhR(9,9,3),cplFvFvhhL(9,9,3),cplFvFvhhR(9,9,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9), & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhhhhh(3,3,3),cplhhhhSvImSvIm1(3,3,9,9),          & 
& cplhhhhSvImSvRe1(3,3,9,9),cplhhhhSvReSvRe1(3,3,9,9),cplhhHpmcHpm(3,2,2),               & 
& cplhhHpmcVWm(3,2),cplhhHpmSvImcSe1(3,2,9,6),cplhhHpmSvRecSe1(3,2,9,6),cplhhSdcSd(3,6,6),& 
& cplhhSecSe(3,6,6),cplhhSeSvImcHpm1(3,6,9,2),cplhhSeSvRecHpm1(3,6,9,2),cplhhSucSu(3,6,6),& 
& cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),cplhhVZVZ(3),           & 
& cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmSecHpmcSe1(2,6,2,6),& 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),cplHpmSvImSvImcHpm1(2,9,9,2),cplHpmSvImSvRecHpm1(2,9,9,2),& 
& cplHpmSvRecSe(2,9,6),cplSdSvImcSecSuaa(6,9,6,6),cplSdSvImSvImcSdaa(6,9,9,6),           & 
& cplSecSecVWmVWm1(6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSeSvImcHpm(6,9,2),            & 
& cplSeSvImcVWm(6,9),cplSeSvImcVWmVP1(6,9),cplSeSvImcVWmVZ1(6,9),cplSeSvImSvImcSe1(6,9,9,6),& 
& cplSeSvImSvRecSe1(6,9,9,6),cplSeSvRecHpm(6,9,2),cplSeSvRecVWm(6,9),cplSeSvRecVWmVP1(6,9),& 
& cplSeSvRecVWmVZ1(6,9),cplSuSvImSvImcSuaa(6,9,9,6),cplSuSvImSvRecSuaa(6,9,9,6),         & 
& cplSvImcSeVPVWm1(9,6),cplSvImcSeVWm(9,6),cplSvImcSeVWmVZ1(9,6),cplSvImSvImcVWmVWm1(9,9),& 
& cplSvImSvImSvImSvIm1(9,9,9,9),cplSvImSvImSvImSvRe1(9,9,9,9),cplSvImSvImSvReSvRe1(9,9,9,9),& 
& cplSvImSvImVZVZ1(9,9),cplSvImSvReSvReSvRe1(9,9,9,9),cplSvImSvReVZ(9,9),cplSvRecSeVPVWm1(9,6)

Complex(dp),Intent(in) :: cplSvRecSeVWm(9,6),cplSvRecSeVWmVZ1(9,6),cplSvReSvReVZVZ1(9,9),ctcplAhSvImSvIm(3,9,9), & 
& ctcplAhSvImSvRe(3,9,9),ctcplcFeChaSvImL(3,2,9),ctcplcFeChaSvImR(3,2,9),ctcplChiFvSvImL(5,9,9),& 
& ctcplChiFvSvImR(5,9,9),ctcplhhSvImSvIm(3,9,9),ctcplhhSvImSvRe(3,9,9),ctcplHpmSvImcSe(2,9,6),& 
& ctcplSeSvImcVWm(6,9),ctcplSvImSvReVZ(9,9),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),           & 
& GcplSeSvImcHpm(6,9,2),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GosZcplSeSvImcHpm(6,9,2),& 
& GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),GZcplSeSvImcHpm(6,9,2),ZcplAhSvImSvIm(3,9,9),      & 
& ZcplAhSvImSvRe(3,9,9),ZcplcFeChaSvImL(3,2,9),ZcplcFeChaSvImR(3,2,9),ZcplChiFvSvImL(5,9,9),& 
& ZcplChiFvSvImR(5,9,9),ZcplhhSvImSvIm(3,9,9),ZcplhhSvImSvRe(3,9,9),ZcplHpmSvImcSe(2,9,6),& 
& ZcplSeSvImcVWm(6,9),ZcplSvImSvReVZ(9,9)

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
Real(dp), Intent(out) :: gP1LSvIm(9,189) 
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
Real(dp) :: MRPSvImToSvImAh(9,9,3),MRGSvImToSvImAh(9,9,3), MRPZSvImToSvImAh(9,9,3),MRGZSvImToSvImAh(9,9,3) 
Real(dp) :: MVPSvImToSvImAh(9,9,3) 
Real(dp) :: RMsqTreeSvImToSvImAh(9,9,3),RMsqWaveSvImToSvImAh(9,9,3),RMsqVertexSvImToSvImAh(9,9,3) 
Complex(dp) :: AmpTreeSvImToSvImAh(9,9,3),AmpWaveSvImToSvImAh(9,9,3)=(0._dp,0._dp),AmpVertexSvImToSvImAh(9,9,3)& 
 & ,AmpVertexIRosSvImToSvImAh(9,9,3),AmpVertexIRdrSvImToSvImAh(9,9,3), AmpSumSvImToSvImAh(9,9,3), AmpSum2SvImToSvImAh(9,9,3) 
Complex(dp) :: AmpTreeZSvImToSvImAh(9,9,3),AmpWaveZSvImToSvImAh(9,9,3),AmpVertexZSvImToSvImAh(9,9,3) 
Real(dp) :: AmpSqSvImToSvImAh(9,9,3),  AmpSqTreeSvImToSvImAh(9,9,3) 
Real(dp) :: MRPSvImToSvReAh(9,9,3),MRGSvImToSvReAh(9,9,3), MRPZSvImToSvReAh(9,9,3),MRGZSvImToSvReAh(9,9,3) 
Real(dp) :: MVPSvImToSvReAh(9,9,3) 
Real(dp) :: RMsqTreeSvImToSvReAh(9,9,3),RMsqWaveSvImToSvReAh(9,9,3),RMsqVertexSvImToSvReAh(9,9,3) 
Complex(dp) :: AmpTreeSvImToSvReAh(9,9,3),AmpWaveSvImToSvReAh(9,9,3)=(0._dp,0._dp),AmpVertexSvImToSvReAh(9,9,3)& 
 & ,AmpVertexIRosSvImToSvReAh(9,9,3),AmpVertexIRdrSvImToSvReAh(9,9,3), AmpSumSvImToSvReAh(9,9,3), AmpSum2SvImToSvReAh(9,9,3) 
Complex(dp) :: AmpTreeZSvImToSvReAh(9,9,3),AmpWaveZSvImToSvReAh(9,9,3),AmpVertexZSvImToSvReAh(9,9,3) 
Real(dp) :: AmpSqSvImToSvReAh(9,9,3),  AmpSqTreeSvImToSvReAh(9,9,3) 
Real(dp) :: MRPSvImTocFeCha(9,3,2),MRGSvImTocFeCha(9,3,2), MRPZSvImTocFeCha(9,3,2),MRGZSvImTocFeCha(9,3,2) 
Real(dp) :: MVPSvImTocFeCha(9,3,2) 
Real(dp) :: RMsqTreeSvImTocFeCha(9,3,2),RMsqWaveSvImTocFeCha(9,3,2),RMsqVertexSvImTocFeCha(9,3,2) 
Complex(dp) :: AmpTreeSvImTocFeCha(2,9,3,2),AmpWaveSvImTocFeCha(2,9,3,2)=(0._dp,0._dp),AmpVertexSvImTocFeCha(2,9,3,2)& 
 & ,AmpVertexIRosSvImTocFeCha(2,9,3,2),AmpVertexIRdrSvImTocFeCha(2,9,3,2), AmpSumSvImTocFeCha(2,9,3,2), AmpSum2SvImTocFeCha(2,9,3,2) 
Complex(dp) :: AmpTreeZSvImTocFeCha(2,9,3,2),AmpWaveZSvImTocFeCha(2,9,3,2),AmpVertexZSvImTocFeCha(2,9,3,2) 
Real(dp) :: AmpSqSvImTocFeCha(9,3,2),  AmpSqTreeSvImTocFeCha(9,3,2) 
Real(dp) :: MRPSvImToFvChi(9,9,5),MRGSvImToFvChi(9,9,5), MRPZSvImToFvChi(9,9,5),MRGZSvImToFvChi(9,9,5) 
Real(dp) :: MVPSvImToFvChi(9,9,5) 
Real(dp) :: RMsqTreeSvImToFvChi(9,9,5),RMsqWaveSvImToFvChi(9,9,5),RMsqVertexSvImToFvChi(9,9,5) 
Complex(dp) :: AmpTreeSvImToFvChi(2,9,9,5),AmpWaveSvImToFvChi(2,9,9,5)=(0._dp,0._dp),AmpVertexSvImToFvChi(2,9,9,5)& 
 & ,AmpVertexIRosSvImToFvChi(2,9,9,5),AmpVertexIRdrSvImToFvChi(2,9,9,5), AmpSumSvImToFvChi(2,9,9,5), AmpSum2SvImToFvChi(2,9,9,5) 
Complex(dp) :: AmpTreeZSvImToFvChi(2,9,9,5),AmpWaveZSvImToFvChi(2,9,9,5),AmpVertexZSvImToFvChi(2,9,9,5) 
Real(dp) :: AmpSqSvImToFvChi(9,9,5),  AmpSqTreeSvImToFvChi(9,9,5) 
Real(dp) :: MRPSvImToSvImhh(9,9,3),MRGSvImToSvImhh(9,9,3), MRPZSvImToSvImhh(9,9,3),MRGZSvImToSvImhh(9,9,3) 
Real(dp) :: MVPSvImToSvImhh(9,9,3) 
Real(dp) :: RMsqTreeSvImToSvImhh(9,9,3),RMsqWaveSvImToSvImhh(9,9,3),RMsqVertexSvImToSvImhh(9,9,3) 
Complex(dp) :: AmpTreeSvImToSvImhh(9,9,3),AmpWaveSvImToSvImhh(9,9,3)=(0._dp,0._dp),AmpVertexSvImToSvImhh(9,9,3)& 
 & ,AmpVertexIRosSvImToSvImhh(9,9,3),AmpVertexIRdrSvImToSvImhh(9,9,3), AmpSumSvImToSvImhh(9,9,3), AmpSum2SvImToSvImhh(9,9,3) 
Complex(dp) :: AmpTreeZSvImToSvImhh(9,9,3),AmpWaveZSvImToSvImhh(9,9,3),AmpVertexZSvImToSvImhh(9,9,3) 
Real(dp) :: AmpSqSvImToSvImhh(9,9,3),  AmpSqTreeSvImToSvImhh(9,9,3) 
Real(dp) :: MRPSvImToSvRehh(9,9,3),MRGSvImToSvRehh(9,9,3), MRPZSvImToSvRehh(9,9,3),MRGZSvImToSvRehh(9,9,3) 
Real(dp) :: MVPSvImToSvRehh(9,9,3) 
Real(dp) :: RMsqTreeSvImToSvRehh(9,9,3),RMsqWaveSvImToSvRehh(9,9,3),RMsqVertexSvImToSvRehh(9,9,3) 
Complex(dp) :: AmpTreeSvImToSvRehh(9,9,3),AmpWaveSvImToSvRehh(9,9,3)=(0._dp,0._dp),AmpVertexSvImToSvRehh(9,9,3)& 
 & ,AmpVertexIRosSvImToSvRehh(9,9,3),AmpVertexIRdrSvImToSvRehh(9,9,3), AmpSumSvImToSvRehh(9,9,3), AmpSum2SvImToSvRehh(9,9,3) 
Complex(dp) :: AmpTreeZSvImToSvRehh(9,9,3),AmpWaveZSvImToSvRehh(9,9,3),AmpVertexZSvImToSvRehh(9,9,3) 
Real(dp) :: AmpSqSvImToSvRehh(9,9,3),  AmpSqTreeSvImToSvRehh(9,9,3) 
Real(dp) :: MRPSvImTocSeHpm(9,6,2),MRGSvImTocSeHpm(9,6,2), MRPZSvImTocSeHpm(9,6,2),MRGZSvImTocSeHpm(9,6,2) 
Real(dp) :: MVPSvImTocSeHpm(9,6,2) 
Real(dp) :: RMsqTreeSvImTocSeHpm(9,6,2),RMsqWaveSvImTocSeHpm(9,6,2),RMsqVertexSvImTocSeHpm(9,6,2) 
Complex(dp) :: AmpTreeSvImTocSeHpm(9,6,2),AmpWaveSvImTocSeHpm(9,6,2)=(0._dp,0._dp),AmpVertexSvImTocSeHpm(9,6,2)& 
 & ,AmpVertexIRosSvImTocSeHpm(9,6,2),AmpVertexIRdrSvImTocSeHpm(9,6,2), AmpSumSvImTocSeHpm(9,6,2), AmpSum2SvImTocSeHpm(9,6,2) 
Complex(dp) :: AmpTreeZSvImTocSeHpm(9,6,2),AmpWaveZSvImTocSeHpm(9,6,2),AmpVertexZSvImTocSeHpm(9,6,2) 
Real(dp) :: AmpSqSvImTocSeHpm(9,6,2),  AmpSqTreeSvImTocSeHpm(9,6,2) 
Real(dp) :: MRPSvImToSecVWm(9,6),MRGSvImToSecVWm(9,6), MRPZSvImToSecVWm(9,6),MRGZSvImToSecVWm(9,6) 
Real(dp) :: MVPSvImToSecVWm(9,6) 
Real(dp) :: RMsqTreeSvImToSecVWm(9,6),RMsqWaveSvImToSecVWm(9,6),RMsqVertexSvImToSecVWm(9,6) 
Complex(dp) :: AmpTreeSvImToSecVWm(2,9,6),AmpWaveSvImToSecVWm(2,9,6)=(0._dp,0._dp),AmpVertexSvImToSecVWm(2,9,6)& 
 & ,AmpVertexIRosSvImToSecVWm(2,9,6),AmpVertexIRdrSvImToSecVWm(2,9,6), AmpSumSvImToSecVWm(2,9,6), AmpSum2SvImToSecVWm(2,9,6) 
Complex(dp) :: AmpTreeZSvImToSecVWm(2,9,6),AmpWaveZSvImToSecVWm(2,9,6),AmpVertexZSvImToSecVWm(2,9,6) 
Real(dp) :: AmpSqSvImToSecVWm(9,6),  AmpSqTreeSvImToSecVWm(9,6) 
Real(dp) :: MRPSvImToSvReVZ(9,9),MRGSvImToSvReVZ(9,9), MRPZSvImToSvReVZ(9,9),MRGZSvImToSvReVZ(9,9) 
Real(dp) :: MVPSvImToSvReVZ(9,9) 
Real(dp) :: RMsqTreeSvImToSvReVZ(9,9),RMsqWaveSvImToSvReVZ(9,9),RMsqVertexSvImToSvReVZ(9,9) 
Complex(dp) :: AmpTreeSvImToSvReVZ(2,9,9),AmpWaveSvImToSvReVZ(2,9,9)=(0._dp,0._dp),AmpVertexSvImToSvReVZ(2,9,9)& 
 & ,AmpVertexIRosSvImToSvReVZ(2,9,9),AmpVertexIRdrSvImToSvReVZ(2,9,9), AmpSumSvImToSvReVZ(2,9,9), AmpSum2SvImToSvReVZ(2,9,9) 
Complex(dp) :: AmpTreeZSvImToSvReVZ(2,9,9),AmpWaveZSvImToSvReVZ(2,9,9),AmpVertexZSvImToSvReVZ(2,9,9) 
Real(dp) :: AmpSqSvImToSvReVZ(9,9),  AmpSqTreeSvImToSvReVZ(9,9) 
Real(dp) :: MRPSvImToSvImVP(9,9),MRGSvImToSvImVP(9,9), MRPZSvImToSvImVP(9,9),MRGZSvImToSvImVP(9,9) 
Real(dp) :: MVPSvImToSvImVP(9,9) 
Real(dp) :: RMsqTreeSvImToSvImVP(9,9),RMsqWaveSvImToSvImVP(9,9),RMsqVertexSvImToSvImVP(9,9) 
Complex(dp) :: AmpTreeSvImToSvImVP(2,9,9),AmpWaveSvImToSvImVP(2,9,9)=(0._dp,0._dp),AmpVertexSvImToSvImVP(2,9,9)& 
 & ,AmpVertexIRosSvImToSvImVP(2,9,9),AmpVertexIRdrSvImToSvImVP(2,9,9), AmpSumSvImToSvImVP(2,9,9), AmpSum2SvImToSvImVP(2,9,9) 
Complex(dp) :: AmpTreeZSvImToSvImVP(2,9,9),AmpWaveZSvImToSvImVP(2,9,9),AmpVertexZSvImToSvImVP(2,9,9) 
Real(dp) :: AmpSqSvImToSvImVP(9,9),  AmpSqTreeSvImToSvImVP(9,9) 
Real(dp) :: MRPSvImToSvImVZ(9,9),MRGSvImToSvImVZ(9,9), MRPZSvImToSvImVZ(9,9),MRGZSvImToSvImVZ(9,9) 
Real(dp) :: MVPSvImToSvImVZ(9,9) 
Real(dp) :: RMsqTreeSvImToSvImVZ(9,9),RMsqWaveSvImToSvImVZ(9,9),RMsqVertexSvImToSvImVZ(9,9) 
Complex(dp) :: AmpTreeSvImToSvImVZ(2,9,9),AmpWaveSvImToSvImVZ(2,9,9)=(0._dp,0._dp),AmpVertexSvImToSvImVZ(2,9,9)& 
 & ,AmpVertexIRosSvImToSvImVZ(2,9,9),AmpVertexIRdrSvImToSvImVZ(2,9,9), AmpSumSvImToSvImVZ(2,9,9), AmpSum2SvImToSvImVZ(2,9,9) 
Complex(dp) :: AmpTreeZSvImToSvImVZ(2,9,9),AmpWaveZSvImToSvImVZ(2,9,9),AmpVertexZSvImToSvImVZ(2,9,9) 
Real(dp) :: AmpSqSvImToSvImVZ(9,9),  AmpSqTreeSvImToSvImVZ(9,9) 
Real(dp) :: MRPSvImToSvReVP(9,9),MRGSvImToSvReVP(9,9), MRPZSvImToSvReVP(9,9),MRGZSvImToSvReVP(9,9) 
Real(dp) :: MVPSvImToSvReVP(9,9) 
Real(dp) :: RMsqTreeSvImToSvReVP(9,9),RMsqWaveSvImToSvReVP(9,9),RMsqVertexSvImToSvReVP(9,9) 
Complex(dp) :: AmpTreeSvImToSvReVP(2,9,9),AmpWaveSvImToSvReVP(2,9,9)=(0._dp,0._dp),AmpVertexSvImToSvReVP(2,9,9)& 
 & ,AmpVertexIRosSvImToSvReVP(2,9,9),AmpVertexIRdrSvImToSvReVP(2,9,9), AmpSumSvImToSvReVP(2,9,9), AmpSum2SvImToSvReVP(2,9,9) 
Complex(dp) :: AmpTreeZSvImToSvReVP(2,9,9),AmpWaveZSvImToSvReVP(2,9,9),AmpVertexZSvImToSvReVP(2,9,9) 
Real(dp) :: AmpSqSvImToSvReVP(9,9),  AmpSqTreeSvImToSvReVP(9,9) 
Write(*,*) "Calculating one-loop decays of SvIm " 
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
! SvIm Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SvImToSvImAh(cplAhSvImSvIm,MAh,MSvIm,MAh2,             & 
& MSvIm2,AmpTreeSvImToSvImAh)

  Else 
Call Amplitude_Tree_NInvSeesaw_SvImToSvImAh(ZcplAhSvImSvIm,MAh,MSvIm,MAh2,            & 
& MSvIm2,AmpTreeSvImToSvImAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvImAh(MLambda,em,gs,cplAhSvImSvIm,MAhOS,            & 
& MSvImOS,MRPSvImToSvImAh,MRGSvImToSvImAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvImAh(MLambda,em,gs,ZcplAhSvImSvIm,MAhOS,           & 
& MSvImOS,MRPSvImToSvImAh,MRGSvImToSvImAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SvImToSvImAh(MLambda,em,gs,cplAhSvImSvIm,MAh,              & 
& MSvIm,MRPSvImToSvImAh,MRGSvImToSvImAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvImAh(MLambda,em,gs,ZcplAhSvImSvIm,MAh,             & 
& MSvIm,MRPSvImToSvImAh,MRGSvImToSvImAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImToSvImAh(cplAhSvImSvIm,ctcplAhSvImSvIm,            & 
& MAh,MAh2,MSvIm,MSvIm2,ZfAh,ZfSvIm,AmpWaveSvImToSvImAh)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvImAh(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,      & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,     & 
& cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,cplhhhhSvImSvIm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,& 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,AmpVertexSvImToSvImAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImAh(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,      & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,     & 
& cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,cplhhhhSvImSvIm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,& 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,AmpVertexIRdrSvImToSvImAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImAh(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,               & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& ZcplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,cplhhSvImSvIm,               & 
& cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,   & 
& cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhHpmSvImcSe1,  & 
& cplAhSeSvImcHpm1,cplhhhhSvImSvIm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,              & 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,AmpVertexIRosSvImToSvImAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImAh(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,ZcplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,     & 
& cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,cplhhhhSvImSvIm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,& 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,AmpVertexIRosSvImToSvImAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImAh(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,               & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,  & 
& cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,cplhhSvImSvIm,               & 
& cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,   & 
& cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhHpmSvImcSe1,  & 
& cplAhSeSvImcHpm1,cplhhhhSvImSvIm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,              & 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,AmpVertexIRosSvImToSvImAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImAh(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,      & 
& cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,     & 
& cplAhHpmSvImcSe1,cplAhSeSvImcHpm1,cplhhhhSvImSvIm1,cplHpmSvImSvImcHpm1,cplSdSvImSvImcSdaa,& 
& cplSeSvImSvImcSe1,cplSuSvImSvImcSuaa,cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,        & 
& cplSvImSvImSvReSvRe1,AmpVertexIRosSvImToSvImAh)

 End if 
 End if 
AmpVertexSvImToSvImAh = AmpVertexSvImToSvImAh -  AmpVertexIRdrSvImToSvImAh! +  AmpVertexIRosSvImToSvImAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvImAh=0._dp 
AmpVertexZSvImToSvImAh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvImAh(gt2,:,:) = AmpWaveZSvImToSvImAh(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvImAh(gt1,:,:) 
AmpVertexZSvImToSvImAh(gt2,:,:)= AmpVertexZSvImToSvImAh(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvImAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToSvImAh=AmpWaveZSvImToSvImAh 
AmpVertexSvImToSvImAh= AmpVertexZSvImToSvImAh
! Final State 1 
AmpWaveZSvImToSvImAh=0._dp 
AmpVertexZSvImToSvImAh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvImAh(:,gt2,:) = AmpWaveZSvImToSvImAh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvImAh(:,gt1,:) 
AmpVertexZSvImToSvImAh(:,gt2,:)= AmpVertexZSvImToSvImAh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexSvImToSvImAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvImAh=AmpWaveZSvImToSvImAh 
AmpVertexSvImToSvImAh= AmpVertexZSvImToSvImAh
! Final State 2 
AmpWaveZSvImToSvImAh=0._dp 
AmpVertexZSvImToSvImAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSvImToSvImAh(:,:,gt2) = AmpWaveZSvImToSvImAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSvImToSvImAh(:,:,gt1) 
AmpVertexZSvImToSvImAh(:,:,gt2)= AmpVertexZSvImToSvImAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSvImToSvImAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvImAh=AmpWaveZSvImToSvImAh 
AmpVertexSvImToSvImAh= AmpVertexZSvImToSvImAh
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvImAh = AmpVertexSvImToSvImAh  +  AmpVertexIRosSvImToSvImAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvIm Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvImAh = AmpTreeSvImToSvImAh 
 AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh + 2._dp*AmpWaveSvImToSvImAh + 2._dp*AmpVertexSvImToSvImAh  
Else 
 AmpSumSvImToSvImAh = AmpTreeSvImToSvImAh + AmpWaveSvImToSvImAh + AmpVertexSvImToSvImAh
 AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh + AmpWaveSvImToSvImAh + AmpVertexSvImToSvImAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvImAh = AmpTreeSvImToSvImAh
 AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
    Do gt3=2,3
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSvImOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSvIm(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvImAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImAh = 2._dp*AmpWaveSvImToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvImAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImAh = 2._dp*AmpVertexSvImToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvImAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh + 2._dp*AmpWaveSvImToSvImAh + 2._dp*AmpVertexSvImToSvImAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvImAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvImAh(gt1, gt2, gt3) = AmpSqSvImToSvImAh(gt1, gt2, gt3)  
  AmpSum2SvImToSvImAh = + 2._dp*AmpWaveSvImToSvImAh + 2._dp*AmpVertexSvImToSvImAh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
  AmpSqSvImToSvImAh(gt1, gt2, gt3) = AmpSqSvImToSvImAh(gt1, gt2, gt3) + AmpSqTreeSvImToSvImAh(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToSvImAh = AmpTreeSvImToSvImAh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvImAh(gt1, gt2, gt3) = AmpSqSvImToSvImAh(gt1, gt2, gt3)  
  AmpSum2SvImToSvImAh = + 2._dp*AmpWaveSvImToSvImAh + 2._dp*AmpVertexSvImToSvImAh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),AmpSumSvImToSvImAh(gt1, gt2, gt3),AmpSum2SvImToSvImAh(gt1, gt2, gt3),AmpSqSvImToSvImAh(gt1, gt2, gt3)) 
  AmpSqSvImToSvImAh(gt1, gt2, gt3) = AmpSqSvImToSvImAh(gt1, gt2, gt3) + AmpSqTreeSvImToSvImAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToSvImAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvImAh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvImOS(gt2),MAhOS(gt3),helfactor*AmpSqSvImToSvImAh(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvIm(gt2),MAh(gt3),helfactor*AmpSqSvImToSvImAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvImAh(gt1, gt2, gt3) + MRGSvImToSvImAh(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvImAh(gt1, gt2, gt3) + MRGSvImToSvImAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SvImToSvReAh(cplAhSvImSvRe,MAh,MSvIm,MSvRe,            & 
& MAh2,MSvIm2,MSvRe2,AmpTreeSvImToSvReAh)

  Else 
Call Amplitude_Tree_NInvSeesaw_SvImToSvReAh(ZcplAhSvImSvRe,MAh,MSvIm,MSvRe,           & 
& MAh2,MSvIm2,MSvRe2,AmpTreeSvImToSvReAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvReAh(MLambda,em,gs,cplAhSvImSvRe,MAhOS,            & 
& MSvImOS,MSvReOS,MRPSvImToSvReAh,MRGSvImToSvReAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvReAh(MLambda,em,gs,ZcplAhSvImSvRe,MAhOS,           & 
& MSvImOS,MSvReOS,MRPSvImToSvReAh,MRGSvImToSvReAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SvImToSvReAh(MLambda,em,gs,cplAhSvImSvRe,MAh,              & 
& MSvIm,MSvRe,MRPSvImToSvReAh,MRGSvImToSvReAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvReAh(MLambda,em,gs,ZcplAhSvImSvRe,MAh,             & 
& MSvIm,MSvRe,MRPSvImToSvReAh,MRGSvImToSvReAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImToSvReAh(cplAhSvImSvRe,ctcplAhSvImSvRe,            & 
& MAh,MAh2,MSvIm,MSvIm2,MSvRe,MSvRe2,ZfAh,ZfSvIm,ZfSvRe,AmpWaveSvImToSvReAh)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvReAh(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplhhSvImSvIm,cplhhSvImSvRe,              & 
& cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,              & 
& cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,  & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhhhSvImSvRe1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexSvImToSvReAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReAh(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplhhSvImSvIm,cplhhSvImSvRe,              & 
& cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,              & 
& cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,  & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhhhSvImSvRe1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRdrSvImToSvReAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReAh(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,          & 
& MVZ2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,        & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,ZcplAhSvImSvRe,cplAhSvReSvRe,         & 
& cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR, & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,               & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,   & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,           & 
& cplAhAhSvReSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,  & 
& cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhhhSvImSvRe1,cplHpmSvImSvRecHpm1,& 
& cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,        & 
& cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvReAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReAh(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,     & 
& ZcplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,               & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,   & 
& cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,   & 
& cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,  & 
& cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,  & 
& cplhhhhSvImSvRe1,cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,             & 
& cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvReAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReAh(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,            & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSu2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,          & 
& MVZ2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,        & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,          & 
& cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR, & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,               & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,   & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,           & 
& cplAhAhSvReSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSvImcSe1,  & 
& cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhhhSvImSvRe1,cplHpmSvImSvRecHpm1,& 
& cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,        & 
& cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvReAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReAh(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSu,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSu2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplhhSvImSvIm,cplhhSvImSvRe,              & 
& cplhhSvReSvRe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSvImSvIm1,              & 
& cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,  & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplhhhhSvImSvRe1,  & 
& cplHpmSvImSvRecHpm1,cplSeSvImSvRecSe1,cplSuSvImSvRecSuaa,cplSvImSvImSvImSvRe1,         & 
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvReAh)

 End if 
 End if 
AmpVertexSvImToSvReAh = AmpVertexSvImToSvReAh -  AmpVertexIRdrSvImToSvReAh! +  AmpVertexIRosSvImToSvReAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvReAh=0._dp 
AmpVertexZSvImToSvReAh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvReAh(gt2,:,:) = AmpWaveZSvImToSvReAh(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvReAh(gt1,:,:) 
AmpVertexZSvImToSvReAh(gt2,:,:)= AmpVertexZSvImToSvReAh(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvReAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToSvReAh=AmpWaveZSvImToSvReAh 
AmpVertexSvImToSvReAh= AmpVertexZSvImToSvReAh
! Final State 1 
AmpWaveZSvImToSvReAh=0._dp 
AmpVertexZSvImToSvReAh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvReAh(:,gt2,:) = AmpWaveZSvImToSvReAh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSvImToSvReAh(:,gt1,:) 
AmpVertexZSvImToSvReAh(:,gt2,:)= AmpVertexZSvImToSvReAh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexSvImToSvReAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvReAh=AmpWaveZSvImToSvReAh 
AmpVertexSvImToSvReAh= AmpVertexZSvImToSvReAh
! Final State 2 
AmpWaveZSvImToSvReAh=0._dp 
AmpVertexZSvImToSvReAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSvImToSvReAh(:,:,gt2) = AmpWaveZSvImToSvReAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSvImToSvReAh(:,:,gt1) 
AmpVertexZSvImToSvReAh(:,:,gt2)= AmpVertexZSvImToSvReAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSvImToSvReAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvReAh=AmpWaveZSvImToSvReAh 
AmpVertexSvImToSvReAh= AmpVertexZSvImToSvReAh
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvReAh = AmpVertexSvImToSvReAh  +  AmpVertexIRosSvImToSvReAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvRe Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvReAh = AmpTreeSvImToSvReAh 
 AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh + 2._dp*AmpWaveSvImToSvReAh + 2._dp*AmpVertexSvImToSvReAh  
Else 
 AmpSumSvImToSvReAh = AmpTreeSvImToSvReAh + AmpWaveSvImToSvReAh + AmpVertexSvImToSvReAh
 AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh + AmpWaveSvImToSvReAh + AmpVertexSvImToSvReAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvReAh = AmpTreeSvImToSvReAh
 AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
    Do gt3=2,3
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSvReOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSvRe(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvReAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvReAh = 2._dp*AmpWaveSvImToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvReAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvReAh = 2._dp*AmpVertexSvImToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvReAh(gt1, gt2, gt3) 
  AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh + 2._dp*AmpWaveSvImToSvReAh + 2._dp*AmpVertexSvImToSvReAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvReAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvReAh(gt1, gt2, gt3) = AmpSqSvImToSvReAh(gt1, gt2, gt3)  
  AmpSum2SvImToSvReAh = + 2._dp*AmpWaveSvImToSvReAh + 2._dp*AmpVertexSvImToSvReAh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
  AmpSqSvImToSvReAh(gt1, gt2, gt3) = AmpSqSvImToSvReAh(gt1, gt2, gt3) + AmpSqTreeSvImToSvReAh(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToSvReAh = AmpTreeSvImToSvReAh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvReAh(gt1, gt2, gt3) = AmpSqSvImToSvReAh(gt1, gt2, gt3)  
  AmpSum2SvImToSvReAh = + 2._dp*AmpWaveSvImToSvReAh + 2._dp*AmpVertexSvImToSvReAh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),AmpSumSvImToSvReAh(gt1, gt2, gt3),AmpSum2SvImToSvReAh(gt1, gt2, gt3),AmpSqSvImToSvReAh(gt1, gt2, gt3)) 
  AmpSqSvImToSvReAh(gt1, gt2, gt3) = AmpSqSvImToSvReAh(gt1, gt2, gt3) + AmpSqTreeSvImToSvReAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToSvReAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvReAh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvReOS(gt2),MAhOS(gt3),helfactor*AmpSqSvImToSvReAh(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvRe(gt2),MAh(gt3),helfactor*AmpSqSvImToSvReAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvReAh(gt1, gt2, gt3) + MRGSvImToSvReAh(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvReAh(gt1, gt2, gt3) + MRGSvImToSvReAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fe) Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SvImTocFeCha(cplcFeChaSvImL,cplcFeChaSvImR,            & 
& MCha,MFe,MSvIm,MCha2,MFe2,MSvIm2,AmpTreeSvImTocFeCha)

  Else 
Call Amplitude_Tree_NInvSeesaw_SvImTocFeCha(ZcplcFeChaSvImL,ZcplcFeChaSvImR,          & 
& MCha,MFe,MSvIm,MCha2,MFe2,MSvIm2,AmpTreeSvImTocFeCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SvImTocFeCha(MLambda,em,gs,cplcFeChaSvImL,cplcFeChaSvImR,  & 
& MChaOS,MFeOS,MSvImOS,MRPSvImTocFeCha,MRGSvImTocFeCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImTocFeCha(MLambda,em,gs,ZcplcFeChaSvImL,ZcplcFeChaSvImR,& 
& MChaOS,MFeOS,MSvImOS,MRPSvImTocFeCha,MRGSvImTocFeCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SvImTocFeCha(MLambda,em,gs,cplcFeChaSvImL,cplcFeChaSvImR,  & 
& MCha,MFe,MSvIm,MRPSvImTocFeCha,MRGSvImTocFeCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImTocFeCha(MLambda,em,gs,ZcplcFeChaSvImL,ZcplcFeChaSvImR,& 
& MCha,MFe,MSvIm,MRPSvImTocFeCha,MRGSvImTocFeCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImTocFeCha(cplcFeChaSvImL,cplcFeChaSvImR,            & 
& ctcplcFeChaSvImL,ctcplcFeChaSvImR,MCha,MCha2,MFe,MFe2,MSvIm,MSvIm2,ZfFEL,              & 
& ZfFER,ZfLm,ZfLp,ZfSvIm,AmpWaveSvImTocFeCha)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImTocFeCha(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexSvImTocFeCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocFeCha(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexIRdrSvImTocFeCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocFeCha(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,ZcplcFeChaSvImL,ZcplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,         & 
& cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,   & 
& AmpVertexIRosSvImTocFeCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocFeCha(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,ZcplcFeChaSvImL,  & 
& ZcplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,             & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexIRosSvImTocFeCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocFeCha(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,         & 
& cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,   & 
& AmpVertexIRosSvImTocFeCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocFeCha(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,   & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,   & 
& cplSvImcSeVWm,AmpVertexIRosSvImTocFeCha)

 End if 
 End if 
AmpVertexSvImTocFeCha = AmpVertexSvImTocFeCha -  AmpVertexIRdrSvImTocFeCha! +  AmpVertexIRosSvImTocFeCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImTocFeCha=0._dp 
AmpVertexZSvImTocFeCha=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImTocFeCha(:,gt2,:,:) = AmpWaveZSvImTocFeCha(:,gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImTocFeCha(:,gt1,:,:) 
AmpVertexZSvImTocFeCha(:,gt2,:,:)= AmpVertexZSvImTocFeCha(:,gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImTocFeCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImTocFeCha=AmpWaveZSvImTocFeCha 
AmpVertexSvImTocFeCha= AmpVertexZSvImTocFeCha
! Final State 1 
AmpWaveZSvImTocFeCha=0._dp 
AmpVertexZSvImTocFeCha=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSvImTocFeCha(1,:,gt2,:) = AmpWaveZSvImTocFeCha(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpWaveSvImTocFeCha(1,:,gt1,:) 
AmpVertexZSvImTocFeCha(1,:,gt2,:)= AmpVertexZSvImTocFeCha(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpVertexSvImTocFeCha(1,:,gt1,:) 
AmpWaveZSvImTocFeCha(2,:,gt2,:) = AmpWaveZSvImTocFeCha(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpWaveSvImTocFeCha(2,:,gt1,:) 
AmpVertexZSvImTocFeCha(2,:,gt2,:)= AmpVertexZSvImTocFeCha(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpVertexSvImTocFeCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImTocFeCha=AmpWaveZSvImTocFeCha 
AmpVertexSvImTocFeCha= AmpVertexZSvImTocFeCha
! Final State 2 
AmpWaveZSvImTocFeCha=0._dp 
AmpVertexZSvImTocFeCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSvImTocFeCha(1,:,:,gt2) = AmpWaveZSvImTocFeCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveSvImTocFeCha(1,:,:,gt1) 
AmpVertexZSvImTocFeCha(1,:,:,gt2)= AmpVertexZSvImTocFeCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexSvImTocFeCha(1,:,:,gt1) 
AmpWaveZSvImTocFeCha(2,:,:,gt2) = AmpWaveZSvImTocFeCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveSvImTocFeCha(2,:,:,gt1) 
AmpVertexZSvImTocFeCha(2,:,:,gt2)= AmpVertexZSvImTocFeCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexSvImTocFeCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImTocFeCha=AmpWaveZSvImTocFeCha 
AmpVertexSvImTocFeCha= AmpVertexZSvImTocFeCha
End if
If (ShiftIRdiv) Then 
AmpVertexSvImTocFeCha = AmpVertexSvImTocFeCha  +  AmpVertexIRosSvImTocFeCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->bar[Fe] Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImTocFeCha = AmpTreeSvImTocFeCha 
 AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha + 2._dp*AmpWaveSvImTocFeCha + 2._dp*AmpVertexSvImTocFeCha  
Else 
 AmpSumSvImTocFeCha = AmpTreeSvImTocFeCha + AmpWaveSvImTocFeCha + AmpVertexSvImTocFeCha
 AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha + AmpWaveSvImTocFeCha + AmpVertexSvImTocFeCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImTocFeCha = AmpTreeSvImTocFeCha
 AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,3
    Do gt3=1,2
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MFeOS(gt2)+MChaOS(gt3)))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MFe(gt2)+MCha(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImTocFeCha(gt1, gt2, gt3) 
  AmpSum2SvImTocFeCha = 2._dp*AmpWaveSvImTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImTocFeCha(gt1, gt2, gt3) 
  AmpSum2SvImTocFeCha = 2._dp*AmpVertexSvImTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImTocFeCha(gt1, gt2, gt3) 
  AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha + 2._dp*AmpWaveSvImTocFeCha + 2._dp*AmpVertexSvImTocFeCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImTocFeCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
  AmpSqTreeSvImTocFeCha(gt1, gt2, gt3) = AmpSqSvImTocFeCha(gt1, gt2, gt3)  
  AmpSum2SvImTocFeCha = + 2._dp*AmpWaveSvImTocFeCha + 2._dp*AmpVertexSvImTocFeCha
  Call SquareAmp_StoFF(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
  AmpSqSvImTocFeCha(gt1, gt2, gt3) = AmpSqSvImTocFeCha(gt1, gt2, gt3) + AmpSqTreeSvImTocFeCha(gt1, gt2, gt3)  
Else  
  AmpSum2SvImTocFeCha = AmpTreeSvImTocFeCha
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
  AmpSqTreeSvImTocFeCha(gt1, gt2, gt3) = AmpSqSvImTocFeCha(gt1, gt2, gt3)  
  AmpSum2SvImTocFeCha = + 2._dp*AmpWaveSvImTocFeCha + 2._dp*AmpVertexSvImTocFeCha
  Call SquareAmp_StoFF(MSvIm(gt1),MFe(gt2),MCha(gt3),AmpSumSvImTocFeCha(:,gt1, gt2, gt3),AmpSum2SvImTocFeCha(:,gt1, gt2, gt3),AmpSqSvImTocFeCha(gt1, gt2, gt3)) 
  AmpSqSvImTocFeCha(gt1, gt2, gt3) = AmpSqSvImTocFeCha(gt1, gt2, gt3) + AmpSqTreeSvImTocFeCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImTocFeCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSvImTocFeCha(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvImOS(gt1),MFeOS(gt2),MChaOS(gt3),helfactor*AmpSqSvImTocFeCha(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvIm(gt1),MFe(gt2),MCha(gt3),helfactor*AmpSqSvImTocFeCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImTocFeCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvImTocFeCha(gt1, gt2, gt3) + MRGSvImTocFeCha(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvImTocFeCha(gt1, gt2, gt3) + MRGSvImTocFeCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SvImToFvChi(cplChiFvSvImL,cplChiFvSvImR,               & 
& MChi,MFv,MSvIm,MChi2,MFv2,MSvIm2,AmpTreeSvImToFvChi)

  Else 
Call Amplitude_Tree_NInvSeesaw_SvImToFvChi(ZcplChiFvSvImL,ZcplChiFvSvImR,             & 
& MChi,MFv,MSvIm,MChi2,MFv2,MSvIm2,AmpTreeSvImToFvChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToFvChi(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,     & 
& MChiOS,MFvOS,MSvImOS,MRPSvImToFvChi,MRGSvImToFvChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToFvChi(MLambda,em,gs,ZcplChiFvSvImL,ZcplChiFvSvImR,   & 
& MChiOS,MFvOS,MSvImOS,MRPSvImToFvChi,MRGSvImToFvChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SvImToFvChi(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,     & 
& MChi,MFv,MSvIm,MRPSvImToFvChi,MRGSvImToFvChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToFvChi(MLambda,em,gs,ZcplChiFvSvImL,ZcplChiFvSvImR,   & 
& MChi,MFv,MSvIm,MRPSvImToFvChi,MRGSvImToFvChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImToFvChi(cplChiFvSvImL,cplChiFvSvImR,               & 
& ctcplChiFvSvImL,ctcplChiFvSvImR,MChi,MChi2,MFv,MFv2,MSvIm,MSvIm2,ZfFV,ZfL0,            & 
& ZfSvIm,AmpWaveSvImToFvChi)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
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
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexSvImToFvChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
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
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRdrSvImToFvChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToFvChi(MAhOS,MChaOS,MChiOS,MFeOS,            & 
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
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRosSvImToFvChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,ZcplChiFvSvImL,       & 
& ZcplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,         & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRosSvImToFvChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToFvChi(MAhOS,MChaOS,MChiOS,MFeOS,            & 
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
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRosSvImToFvChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
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
& cplSeSvImcVWm,cplSvImSvReVZ,cplSvImcSeVWm,AmpVertexIRosSvImToFvChi)

 End if 
 End if 
AmpVertexSvImToFvChi = AmpVertexSvImToFvChi -  AmpVertexIRdrSvImToFvChi! +  AmpVertexIRosSvImToFvChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToFvChi=0._dp 
AmpVertexZSvImToFvChi=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToFvChi(:,gt2,:,:) = AmpWaveZSvImToFvChi(:,gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToFvChi(:,gt1,:,:) 
AmpVertexZSvImToFvChi(:,gt2,:,:)= AmpVertexZSvImToFvChi(:,gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToFvChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToFvChi=AmpWaveZSvImToFvChi 
AmpVertexSvImToFvChi= AmpVertexZSvImToFvChi
! Final State 1 
AmpWaveZSvImToFvChi=0._dp 
AmpVertexZSvImToFvChi=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToFvChi(1,:,gt2,:) = AmpWaveZSvImToFvChi(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveSvImToFvChi(1,:,gt1,:) 
AmpVertexZSvImToFvChi(1,:,gt2,:)= AmpVertexZSvImToFvChi(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexSvImToFvChi(1,:,gt1,:) 
AmpWaveZSvImToFvChi(2,:,gt2,:) = AmpWaveZSvImToFvChi(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveSvImToFvChi(2,:,gt1,:) 
AmpVertexZSvImToFvChi(2,:,gt2,:)= AmpVertexZSvImToFvChi(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexSvImToFvChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToFvChi=AmpWaveZSvImToFvChi 
AmpVertexSvImToFvChi= AmpVertexZSvImToFvChi
! Final State 2 
AmpWaveZSvImToFvChi=0._dp 
AmpVertexZSvImToFvChi=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZSvImToFvChi(1,:,:,gt2) = AmpWaveZSvImToFvChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSvImToFvChi(1,:,:,gt1) 
AmpVertexZSvImToFvChi(1,:,:,gt2)= AmpVertexZSvImToFvChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSvImToFvChi(1,:,:,gt1) 
AmpWaveZSvImToFvChi(2,:,:,gt2) = AmpWaveZSvImToFvChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSvImToFvChi(2,:,:,gt1) 
AmpVertexZSvImToFvChi(2,:,:,gt2)= AmpVertexZSvImToFvChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSvImToFvChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToFvChi=AmpWaveZSvImToFvChi 
AmpVertexSvImToFvChi= AmpVertexZSvImToFvChi
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToFvChi = AmpVertexSvImToFvChi  +  AmpVertexIRosSvImToFvChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->Fv Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToFvChi = AmpTreeSvImToFvChi 
 AmpSum2SvImToFvChi = AmpTreeSvImToFvChi + 2._dp*AmpWaveSvImToFvChi + 2._dp*AmpVertexSvImToFvChi  
Else 
 AmpSumSvImToFvChi = AmpTreeSvImToFvChi + AmpWaveSvImToFvChi + AmpVertexSvImToFvChi
 AmpSum2SvImToFvChi = AmpTreeSvImToFvChi + AmpWaveSvImToFvChi + AmpVertexSvImToFvChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToFvChi = AmpTreeSvImToFvChi
 AmpSum2SvImToFvChi = AmpTreeSvImToFvChi 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
    Do gt3=1,5
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MFvOS(gt2)+MChiOS(gt3)))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MFv(gt2)+MChi(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToFvChi = AmpTreeSvImToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToFvChi(gt1, gt2, gt3) 
  AmpSum2SvImToFvChi = 2._dp*AmpWaveSvImToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToFvChi(gt1, gt2, gt3) 
  AmpSum2SvImToFvChi = 2._dp*AmpVertexSvImToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToFvChi(gt1, gt2, gt3) 
  AmpSum2SvImToFvChi = AmpTreeSvImToFvChi + 2._dp*AmpWaveSvImToFvChi + 2._dp*AmpVertexSvImToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToFvChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToFvChi = AmpTreeSvImToFvChi
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
  AmpSqTreeSvImToFvChi(gt1, gt2, gt3) = AmpSqSvImToFvChi(gt1, gt2, gt3)  
  AmpSum2SvImToFvChi = + 2._dp*AmpWaveSvImToFvChi + 2._dp*AmpVertexSvImToFvChi
  Call SquareAmp_StoFF(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
  AmpSqSvImToFvChi(gt1, gt2, gt3) = AmpSqSvImToFvChi(gt1, gt2, gt3) + AmpSqTreeSvImToFvChi(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToFvChi = AmpTreeSvImToFvChi
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
  AmpSqTreeSvImToFvChi(gt1, gt2, gt3) = AmpSqSvImToFvChi(gt1, gt2, gt3)  
  AmpSum2SvImToFvChi = + 2._dp*AmpWaveSvImToFvChi + 2._dp*AmpVertexSvImToFvChi
  Call SquareAmp_StoFF(MSvIm(gt1),MFv(gt2),MChi(gt3),AmpSumSvImToFvChi(:,gt1, gt2, gt3),AmpSum2SvImToFvChi(:,gt1, gt2, gt3),AmpSqSvImToFvChi(gt1, gt2, gt3)) 
  AmpSqSvImToFvChi(gt1, gt2, gt3) = AmpSqSvImToFvChi(gt1, gt2, gt3) + AmpSqTreeSvImToFvChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToFvChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSvImToFvChi(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MFvOS(gt2),MChiOS(gt3),helfactor*AmpSqSvImToFvChi(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MFv(gt2),MChi(gt3),helfactor*AmpSqSvImToFvChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToFvChi(gt1, gt2, gt3) + MRGSvImToFvChi(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToFvChi(gt1, gt2, gt3) + MRGSvImToFvChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvIm hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SvImToSvImhh(cplhhSvImSvIm,Mhh,MSvIm,Mhh2,             & 
& MSvIm2,AmpTreeSvImToSvImhh)

  Else 
Call Amplitude_Tree_NInvSeesaw_SvImToSvImhh(ZcplhhSvImSvIm,Mhh,MSvIm,Mhh2,            & 
& MSvIm2,AmpTreeSvImToSvImhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvImhh(MLambda,em,gs,cplhhSvImSvIm,MhhOS,            & 
& MSvImOS,MRPSvImToSvImhh,MRGSvImToSvImhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvImhh(MLambda,em,gs,ZcplhhSvImSvIm,MhhOS,           & 
& MSvImOS,MRPSvImToSvImhh,MRGSvImToSvImhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SvImToSvImhh(MLambda,em,gs,cplhhSvImSvIm,Mhh,              & 
& MSvIm,MRPSvImToSvImhh,MRGSvImToSvImhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvImhh(MLambda,em,gs,ZcplhhSvImSvIm,Mhh,             & 
& MSvIm,MRPSvImToSvImhh,MRGSvImToSvImhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImToSvImhh(cplhhSvImSvIm,ctcplhhSvImSvIm,            & 
& Mhh,Mhh2,MSvIm,MSvIm2,Zfhh,ZfSvIm,AmpWaveSvImToSvImhh)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvImhh(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
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
& cplSvImSvImVZVZ1,AmpVertexSvImToSvImhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImhh(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImVZVZ1,AmpVertexIRdrSvImToSvImhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImhh(MAhOS,MChaOS,MChiOS,MFeOS,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,AmpVertexIRosSvImToSvImhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImhh(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImVZVZ1,AmpVertexIRosSvImToSvImhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImhh(MAhOS,MChaOS,MChiOS,MFeOS,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,AmpVertexIRosSvImToSvImhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvImhh(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImVZVZ1,AmpVertexIRosSvImToSvImhh)

 End if 
 End if 
AmpVertexSvImToSvImhh = AmpVertexSvImToSvImhh -  AmpVertexIRdrSvImToSvImhh! +  AmpVertexIRosSvImToSvImhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvImhh=0._dp 
AmpVertexZSvImToSvImhh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvImhh(gt2,:,:) = AmpWaveZSvImToSvImhh(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvImhh(gt1,:,:) 
AmpVertexZSvImToSvImhh(gt2,:,:)= AmpVertexZSvImToSvImhh(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvImhh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToSvImhh=AmpWaveZSvImToSvImhh 
AmpVertexSvImToSvImhh= AmpVertexZSvImToSvImhh
! Final State 1 
AmpWaveZSvImToSvImhh=0._dp 
AmpVertexZSvImToSvImhh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvImhh(:,gt2,:) = AmpWaveZSvImToSvImhh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvImhh(:,gt1,:) 
AmpVertexZSvImToSvImhh(:,gt2,:)= AmpVertexZSvImToSvImhh(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexSvImToSvImhh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvImhh=AmpWaveZSvImToSvImhh 
AmpVertexSvImToSvImhh= AmpVertexZSvImToSvImhh
! Final State 2 
AmpWaveZSvImToSvImhh=0._dp 
AmpVertexZSvImToSvImhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSvImToSvImhh(:,:,gt2) = AmpWaveZSvImToSvImhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSvImToSvImhh(:,:,gt1) 
AmpVertexZSvImToSvImhh(:,:,gt2)= AmpVertexZSvImToSvImhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSvImToSvImhh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvImhh=AmpWaveZSvImToSvImhh 
AmpVertexSvImToSvImhh= AmpVertexZSvImToSvImhh
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvImhh = AmpVertexSvImToSvImhh  +  AmpVertexIRosSvImToSvImhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvIm hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvImhh = AmpTreeSvImToSvImhh 
 AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh + 2._dp*AmpWaveSvImToSvImhh + 2._dp*AmpVertexSvImToSvImhh  
Else 
 AmpSumSvImToSvImhh = AmpTreeSvImToSvImhh + AmpWaveSvImToSvImhh + AmpVertexSvImToSvImhh
 AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh + AmpWaveSvImToSvImhh + AmpVertexSvImToSvImhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvImhh = AmpTreeSvImToSvImhh
 AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
    Do gt3=1,3
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSvImOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSvIm(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvImhh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImhh = 2._dp*AmpWaveSvImToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvImhh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImhh = 2._dp*AmpVertexSvImToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvImhh(gt1, gt2, gt3) 
  AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh + 2._dp*AmpWaveSvImToSvImhh + 2._dp*AmpVertexSvImToSvImhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvImhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvImhh(gt1, gt2, gt3) = AmpSqSvImToSvImhh(gt1, gt2, gt3)  
  AmpSum2SvImToSvImhh = + 2._dp*AmpWaveSvImToSvImhh + 2._dp*AmpVertexSvImToSvImhh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
  AmpSqSvImToSvImhh(gt1, gt2, gt3) = AmpSqSvImToSvImhh(gt1, gt2, gt3) + AmpSqTreeSvImToSvImhh(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToSvImhh = AmpTreeSvImToSvImhh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvImhh(gt1, gt2, gt3) = AmpSqSvImToSvImhh(gt1, gt2, gt3)  
  AmpSum2SvImToSvImhh = + 2._dp*AmpWaveSvImToSvImhh + 2._dp*AmpVertexSvImToSvImhh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),AmpSumSvImToSvImhh(gt1, gt2, gt3),AmpSum2SvImToSvImhh(gt1, gt2, gt3),AmpSqSvImToSvImhh(gt1, gt2, gt3)) 
  AmpSqSvImToSvImhh(gt1, gt2, gt3) = AmpSqSvImToSvImhh(gt1, gt2, gt3) + AmpSqTreeSvImToSvImhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToSvImhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvImhh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvImOS(gt2),MhhOS(gt3),helfactor*AmpSqSvImToSvImhh(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvIm(gt2),Mhh(gt3),helfactor*AmpSqSvImToSvImhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvImhh(gt1, gt2, gt3) + MRGSvImToSvImhh(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvImhh(gt1, gt2, gt3) + MRGSvImToSvImhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SvImToSvRehh(cplhhSvImSvRe,Mhh,MSvIm,MSvRe,            & 
& Mhh2,MSvIm2,MSvRe2,AmpTreeSvImToSvRehh)

  Else 
Call Amplitude_Tree_NInvSeesaw_SvImToSvRehh(ZcplhhSvImSvRe,Mhh,MSvIm,MSvRe,           & 
& Mhh2,MSvIm2,MSvRe2,AmpTreeSvImToSvRehh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvRehh(MLambda,em,gs,cplhhSvImSvRe,MhhOS,            & 
& MSvImOS,MSvReOS,MRPSvImToSvRehh,MRGSvImToSvRehh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvRehh(MLambda,em,gs,ZcplhhSvImSvRe,MhhOS,           & 
& MSvImOS,MSvReOS,MRPSvImToSvRehh,MRGSvImToSvRehh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SvImToSvRehh(MLambda,em,gs,cplhhSvImSvRe,Mhh,              & 
& MSvIm,MSvRe,MRPSvImToSvRehh,MRGSvImToSvRehh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvRehh(MLambda,em,gs,ZcplhhSvImSvRe,Mhh,             & 
& MSvIm,MSvRe,MRPSvImToSvRehh,MRGSvImToSvRehh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImToSvRehh(cplhhSvImSvRe,ctcplhhSvImSvRe,            & 
& Mhh,Mhh2,MSvIm,MSvIm2,MSvRe,MSvRe2,Zfhh,ZfSvIm,ZfSvRe,AmpWaveSvImToSvRehh)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvRehh(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexSvImToSvRehh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvRehh(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRdrSvImToSvRehh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvRehh(MAhOS,MChaOS,MChiOS,MFeOS,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvRehh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvRehh(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvRehh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvRehh(MAhOS,MChaOS,MChiOS,MFeOS,           & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvRehh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvRehh(MAh,MCha,MChi,MFe,MFv,               & 
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
& cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,AmpVertexIRosSvImToSvRehh)

 End if 
 End if 
AmpVertexSvImToSvRehh = AmpVertexSvImToSvRehh -  AmpVertexIRdrSvImToSvRehh! +  AmpVertexIRosSvImToSvRehh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvRehh=0._dp 
AmpVertexZSvImToSvRehh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvRehh(gt2,:,:) = AmpWaveZSvImToSvRehh(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvRehh(gt1,:,:) 
AmpVertexZSvImToSvRehh(gt2,:,:)= AmpVertexZSvImToSvRehh(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvRehh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImToSvRehh=AmpWaveZSvImToSvRehh 
AmpVertexSvImToSvRehh= AmpVertexZSvImToSvRehh
! Final State 1 
AmpWaveZSvImToSvRehh=0._dp 
AmpVertexZSvImToSvRehh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvRehh(:,gt2,:) = AmpWaveZSvImToSvRehh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSvImToSvRehh(:,gt1,:) 
AmpVertexZSvImToSvRehh(:,gt2,:)= AmpVertexZSvImToSvRehh(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexSvImToSvRehh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvRehh=AmpWaveZSvImToSvRehh 
AmpVertexSvImToSvRehh= AmpVertexZSvImToSvRehh
! Final State 2 
AmpWaveZSvImToSvRehh=0._dp 
AmpVertexZSvImToSvRehh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSvImToSvRehh(:,:,gt2) = AmpWaveZSvImToSvRehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSvImToSvRehh(:,:,gt1) 
AmpVertexZSvImToSvRehh(:,:,gt2)= AmpVertexZSvImToSvRehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSvImToSvRehh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvRehh=AmpWaveZSvImToSvRehh 
AmpVertexSvImToSvRehh= AmpVertexZSvImToSvRehh
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvRehh = AmpVertexSvImToSvRehh  +  AmpVertexIRosSvImToSvRehh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvRe hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvRehh = AmpTreeSvImToSvRehh 
 AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh + 2._dp*AmpWaveSvImToSvRehh + 2._dp*AmpVertexSvImToSvRehh  
Else 
 AmpSumSvImToSvRehh = AmpTreeSvImToSvRehh + AmpWaveSvImToSvRehh + AmpVertexSvImToSvRehh
 AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh + AmpWaveSvImToSvRehh + AmpVertexSvImToSvRehh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvRehh = AmpTreeSvImToSvRehh
 AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
    Do gt3=1,3
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSvReOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSvRe(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvRehh(gt1, gt2, gt3) 
  AmpSum2SvImToSvRehh = 2._dp*AmpWaveSvImToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvRehh(gt1, gt2, gt3) 
  AmpSum2SvImToSvRehh = 2._dp*AmpVertexSvImToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvRehh(gt1, gt2, gt3) 
  AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh + 2._dp*AmpWaveSvImToSvRehh + 2._dp*AmpVertexSvImToSvRehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvRehh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvRehh(gt1, gt2, gt3) = AmpSqSvImToSvRehh(gt1, gt2, gt3)  
  AmpSum2SvImToSvRehh = + 2._dp*AmpWaveSvImToSvRehh + 2._dp*AmpVertexSvImToSvRehh
  Call SquareAmp_StoSS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
  AmpSqSvImToSvRehh(gt1, gt2, gt3) = AmpSqSvImToSvRehh(gt1, gt2, gt3) + AmpSqTreeSvImToSvRehh(gt1, gt2, gt3)  
Else  
  AmpSum2SvImToSvRehh = AmpTreeSvImToSvRehh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
  AmpSqTreeSvImToSvRehh(gt1, gt2, gt3) = AmpSqSvImToSvRehh(gt1, gt2, gt3)  
  AmpSum2SvImToSvRehh = + 2._dp*AmpWaveSvImToSvRehh + 2._dp*AmpVertexSvImToSvRehh
  Call SquareAmp_StoSS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),AmpSumSvImToSvRehh(gt1, gt2, gt3),AmpSum2SvImToSvRehh(gt1, gt2, gt3),AmpSqSvImToSvRehh(gt1, gt2, gt3)) 
  AmpSqSvImToSvRehh(gt1, gt2, gt3) = AmpSqSvImToSvRehh(gt1, gt2, gt3) + AmpSqTreeSvImToSvRehh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImToSvRehh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvRehh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvReOS(gt2),MhhOS(gt3),helfactor*AmpSqSvImToSvRehh(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvRe(gt2),Mhh(gt3),helfactor*AmpSqSvImToSvRehh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvRehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvRehh(gt1, gt2, gt3) + MRGSvImToSvRehh(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvImToSvRehh(gt1, gt2, gt3) + MRGSvImToSvRehh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Se) Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SvImTocSeHpm(cplHpmSvImcSe,MHpm,MSe,MSvIm,             & 
& MHpm2,MSe2,MSvIm2,AmpTreeSvImTocSeHpm)

  Else 
Call Amplitude_Tree_NInvSeesaw_SvImTocSeHpm(ZcplHpmSvImcSe,MHpm,MSe,MSvIm,            & 
& MHpm2,MSe2,MSvIm2,AmpTreeSvImTocSeHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SvImTocSeHpm(MLambda,em,gs,cplHpmSvImcSe,MHpmOS,           & 
& MSeOS,MSvImOS,MRPSvImTocSeHpm,MRGSvImTocSeHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImTocSeHpm(MLambda,em,gs,ZcplHpmSvImcSe,MHpmOS,          & 
& MSeOS,MSvImOS,MRPSvImTocSeHpm,MRGSvImTocSeHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SvImTocSeHpm(MLambda,em,gs,cplHpmSvImcSe,MHpm,             & 
& MSe,MSvIm,MRPSvImTocSeHpm,MRGSvImTocSeHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImTocSeHpm(MLambda,em,gs,ZcplHpmSvImcSe,MHpm,            & 
& MSe,MSvIm,MRPSvImTocSeHpm,MRGSvImTocSeHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImTocSeHpm(cplHpmSvImcSe,ctcplHpmSvImcSe,            & 
& MHpm,MHpm2,MSe,MSe2,MSvIm,MSvIm2,ZfHpm,ZfSe,ZfSvIm,AmpWaveSvImTocSeHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImTocSeHpm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,          & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,       & 
& cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,           & 
& cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,AmpVertexSvImTocSeHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocSeHpm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,     & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,       & 
& cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,           & 
& cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,AmpVertexIRdrSvImTocSeHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocSeHpm(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,       & 
& cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,    & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,         & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,ZcplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,     & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,         & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,& 
& cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,& 
& cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,& 
& AmpVertexIRosSvImTocSeHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocSeHpm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,     & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,ZcplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,       & 
& cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,           & 
& cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,AmpVertexIRosSvImTocSeHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocSeHpm(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,       & 
& cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,    & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,         & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,      & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,         & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,& 
& cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,& 
& cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,& 
& AmpVertexIRosSvImTocSeHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImTocSeHpm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,              & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,     & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,       & 
& cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,           & 
& cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,AmpVertexIRosSvImTocSeHpm)

 End if 
 End if 
AmpVertexSvImTocSeHpm = AmpVertexSvImTocSeHpm -  AmpVertexIRdrSvImTocSeHpm! +  AmpVertexIRosSvImTocSeHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImTocSeHpm=0._dp 
AmpVertexZSvImTocSeHpm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImTocSeHpm(gt2,:,:) = AmpWaveZSvImTocSeHpm(gt2,:,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImTocSeHpm(gt1,:,:) 
AmpVertexZSvImTocSeHpm(gt2,:,:)= AmpVertexZSvImTocSeHpm(gt2,:,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImTocSeHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvImTocSeHpm=AmpWaveZSvImTocSeHpm 
AmpVertexSvImTocSeHpm= AmpVertexZSvImTocSeHpm
! Final State 1 
AmpWaveZSvImTocSeHpm=0._dp 
AmpVertexZSvImTocSeHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImTocSeHpm(:,gt2,:) = AmpWaveZSvImTocSeHpm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSvImTocSeHpm(:,gt1,:) 
AmpVertexZSvImTocSeHpm(:,gt2,:)= AmpVertexZSvImTocSeHpm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpVertexSvImTocSeHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImTocSeHpm=AmpWaveZSvImTocSeHpm 
AmpVertexSvImTocSeHpm= AmpVertexZSvImTocSeHpm
! Final State 2 
AmpWaveZSvImTocSeHpm=0._dp 
AmpVertexZSvImTocSeHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSvImTocSeHpm(:,:,gt2) = AmpWaveZSvImTocSeHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveSvImTocSeHpm(:,:,gt1) 
AmpVertexZSvImTocSeHpm(:,:,gt2)= AmpVertexZSvImTocSeHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexSvImTocSeHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImTocSeHpm=AmpWaveZSvImTocSeHpm 
AmpVertexSvImTocSeHpm= AmpVertexZSvImTocSeHpm
End if
If (ShiftIRdiv) Then 
AmpVertexSvImTocSeHpm = AmpVertexSvImTocSeHpm  +  AmpVertexIRosSvImTocSeHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->conj[Se] Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImTocSeHpm = AmpTreeSvImTocSeHpm 
 AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm + 2._dp*AmpWaveSvImTocSeHpm + 2._dp*AmpVertexSvImTocSeHpm  
Else 
 AmpSumSvImTocSeHpm = AmpTreeSvImTocSeHpm + AmpWaveSvImTocSeHpm + AmpVertexSvImTocSeHpm
 AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm + AmpWaveSvImTocSeHpm + AmpVertexSvImTocSeHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImTocSeHpm = AmpTreeSvImTocSeHpm
 AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,6
    Do gt3=2,2
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSeOS(gt2)+MHpmOS(gt3)))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSe(gt2)+MHpm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImTocSeHpm(gt1, gt2, gt3) 
  AmpSum2SvImTocSeHpm = 2._dp*AmpWaveSvImTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImTocSeHpm(gt1, gt2, gt3) 
  AmpSum2SvImTocSeHpm = 2._dp*AmpVertexSvImTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImTocSeHpm(gt1, gt2, gt3) 
  AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm + 2._dp*AmpWaveSvImTocSeHpm + 2._dp*AmpVertexSvImTocSeHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImTocSeHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
  AmpSqTreeSvImTocSeHpm(gt1, gt2, gt3) = AmpSqSvImTocSeHpm(gt1, gt2, gt3)  
  AmpSum2SvImTocSeHpm = + 2._dp*AmpWaveSvImTocSeHpm + 2._dp*AmpVertexSvImTocSeHpm
  Call SquareAmp_StoSS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
  AmpSqSvImTocSeHpm(gt1, gt2, gt3) = AmpSqSvImTocSeHpm(gt1, gt2, gt3) + AmpSqTreeSvImTocSeHpm(gt1, gt2, gt3)  
Else  
  AmpSum2SvImTocSeHpm = AmpTreeSvImTocSeHpm
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
  AmpSqTreeSvImTocSeHpm(gt1, gt2, gt3) = AmpSqSvImTocSeHpm(gt1, gt2, gt3)  
  AmpSum2SvImTocSeHpm = + 2._dp*AmpWaveSvImTocSeHpm + 2._dp*AmpVertexSvImTocSeHpm
  Call SquareAmp_StoSS(MSvIm(gt1),MSe(gt2),MHpm(gt3),AmpSumSvImTocSeHpm(gt1, gt2, gt3),AmpSum2SvImTocSeHpm(gt1, gt2, gt3),AmpSqSvImTocSeHpm(gt1, gt2, gt3)) 
  AmpSqSvImTocSeHpm(gt1, gt2, gt3) = AmpSqSvImTocSeHpm(gt1, gt2, gt3) + AmpSqTreeSvImTocSeHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvImTocSeHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImTocSeHpm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvImOS(gt1),MSeOS(gt2),MHpmOS(gt3),helfactor*AmpSqSvImTocSeHpm(gt1, gt2, gt3))
Else 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvIm(gt1),MSe(gt2),MHpm(gt3),helfactor*AmpSqSvImTocSeHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvImTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvImTocSeHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvImTocSeHpm(gt1, gt2, gt3) + MRGSvImTocSeHpm(gt1, gt2, gt3)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvImTocSeHpm(gt1, gt2, gt3) + MRGSvImTocSeHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Se Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SvImToSecVWm(cplSeSvImcVWm,MSe,MSvIm,MVWm,             & 
& MSe2,MSvIm2,MVWm2,AmpTreeSvImToSecVWm)

  Else 
Call Amplitude_Tree_NInvSeesaw_SvImToSecVWm(ZcplSeSvImcVWm,MSe,MSvIm,MVWm,            & 
& MSe2,MSvIm2,MVWm2,AmpTreeSvImToSecVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSecVWm(MLambda,em,gs,cplSeSvImcVWm,MSeOS,            & 
& MSvImOS,MVWmOS,MRPSvImToSecVWm,MRGSvImToSecVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSecVWm(MLambda,em,gs,ZcplSeSvImcVWm,MSeOS,           & 
& MSvImOS,MVWmOS,MRPSvImToSecVWm,MRGSvImToSecVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SvImToSecVWm(MLambda,em,gs,cplSeSvImcVWm,MSe,              & 
& MSvIm,MVWm,MRPSvImToSecVWm,MRGSvImToSecVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSecVWm(MLambda,em,gs,ZcplSeSvImcVWm,MSe,             & 
& MSvIm,MVWm,MRPSvImToSecVWm,MRGSvImToSecVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImToSecVWm(cplSeSvImcVWm,ctcplSeSvImcVWm,            & 
& MSe,MSe2,MSvIm,MSvIm2,MVWm,MVWm2,ZfSe,ZfSvIm,ZfVWm,AmpWaveSvImToSecVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,& 
& cplSeSvRecVWmVZ1,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,AmpVertexSvImToSecVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSecVWm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,& 
& cplSeSvRecVWmVZ1,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,AmpVertexIRdrSvImToSecVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSecVWm(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacVWmL,             & 
& cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,         & 
& cplhhcVWmVWm,cplHpmSvImcSe,GosZcplHpmcVWmVP,cplHpmcVWmVZ,GosZcplSeSvImcHpm,            & 
& ZcplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,        & 
& cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,             & 
& cplSeSvRecVWmVZ1,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,AmpVertexIRosSvImToSecVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSecVWm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,GZcplHpmcVWmVP,cplHpmcVWmVZ,    & 
& GZcplSeSvImcHpm,ZcplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,      & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,& 
& cplSeSvRecVWmVZ1,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,AmpVertexIRosSvImToSecVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSecVWm(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacVWmL,             & 
& cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,         & 
& cplhhcVWmVWm,cplHpmSvImcSe,GcplHpmcVWmVP,cplHpmcVWmVZ,GcplSeSvImcHpm,cplSeSvImcVWm,    & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,         & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,          & 
& cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,AmpVertexIRosSvImToSecVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSecVWm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,           & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplChiChacVWmL,cplChiChacVWmR,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplcFeChiSeL,cplcFeChiSeR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFvSeL,cplcChaFvSeR,cplhhHpmcVWm,cplhhSecSe,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,& 
& cplSeSvRecVWmVZ1,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,AmpVertexIRosSvImToSecVWm)

 End if 
 End if 
AmpVertexSvImToSecVWm = AmpVertexSvImToSecVWm -  AmpVertexIRdrSvImToSecVWm! +  AmpVertexIRosSvImToSecVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSecVWm=0._dp 
AmpVertexZSvImToSecVWm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSecVWm(:,gt2,:) = AmpWaveZSvImToSecVWm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSecVWm(:,gt1,:) 
AmpVertexZSvImToSecVWm(:,gt2,:)= AmpVertexZSvImToSecVWm(:,gt2,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSecVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSecVWm=AmpWaveZSvImToSecVWm 
AmpVertexSvImToSecVWm= AmpVertexZSvImToSecVWm
! Final State 1 
AmpWaveZSvImToSecVWm=0._dp 
AmpVertexZSvImToSecVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvImToSecVWm(:,:,gt2) = AmpWaveZSvImToSecVWm(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSvImToSecVWm(:,:,gt1) 
AmpVertexZSvImToSecVWm(:,:,gt2)= AmpVertexZSvImToSecVWm(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSvImToSecVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSecVWm=AmpWaveZSvImToSecVWm 
AmpVertexSvImToSecVWm= AmpVertexZSvImToSecVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSecVWm = AmpVertexSvImToSecVWm  +  AmpVertexIRosSvImToSecVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->Se conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSecVWm = AmpTreeSvImToSecVWm 
 AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm + 2._dp*AmpWaveSvImToSecVWm + 2._dp*AmpVertexSvImToSecVWm  
Else 
 AmpSumSvImToSecVWm = AmpTreeSvImToSecVWm + AmpWaveSvImToSecVWm + AmpVertexSvImToSecVWm
 AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm + AmpWaveSvImToSecVWm + AmpVertexSvImToSecVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSecVWm = AmpTreeSvImToSecVWm
 AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSeOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSe(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSecVWm(gt1, gt2) 
  AmpSum2SvImToSecVWm = 2._dp*AmpWaveSvImToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSecVWm(gt1, gt2) 
  AmpSum2SvImToSecVWm = 2._dp*AmpVertexSvImToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSecVWm(gt1, gt2) 
  AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm + 2._dp*AmpWaveSvImToSecVWm + 2._dp*AmpVertexSvImToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSecVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
  AmpSqTreeSvImToSecVWm(gt1, gt2) = AmpSqSvImToSecVWm(gt1, gt2)  
  AmpSum2SvImToSecVWm = + 2._dp*AmpWaveSvImToSecVWm + 2._dp*AmpVertexSvImToSecVWm
  Call SquareAmp_StoSV(MSvImOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
  AmpSqSvImToSecVWm(gt1, gt2) = AmpSqSvImToSecVWm(gt1, gt2) + AmpSqTreeSvImToSecVWm(gt1, gt2)  
Else  
  AmpSum2SvImToSecVWm = AmpTreeSvImToSecVWm
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
  AmpSqTreeSvImToSecVWm(gt1, gt2) = AmpSqSvImToSecVWm(gt1, gt2)  
  AmpSum2SvImToSecVWm = + 2._dp*AmpWaveSvImToSecVWm + 2._dp*AmpVertexSvImToSecVWm
  Call SquareAmp_StoSV(MSvIm(gt1),MSe(gt2),MVWm,AmpSumSvImToSecVWm(:,gt1, gt2),AmpSum2SvImToSecVWm(:,gt1, gt2),AmpSqSvImToSecVWm(gt1, gt2)) 
  AmpSqSvImToSecVWm(gt1, gt2) = AmpSqSvImToSecVWm(gt1, gt2) + AmpSqTreeSvImToSecVWm(gt1, gt2)  
End if  
Else  
  AmpSqSvImToSecVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSecVWm(gt1, gt2).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvImOS(gt1),MSeOS(gt2),MVWmOS,helfactor*AmpSqSvImToSecVWm(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 2._dp*GammaTPS(MSvIm(gt1),MSe(gt2),MVWm,helfactor*AmpSqSvImToSecVWm(gt1, gt2))
End if 
If ((Abs(MRPSvImToSecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPSvImToSecVWm(gt1, gt2) + MRGSvImToSecVWm(gt1, gt2)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPSvImToSecVWm(gt1, gt2) + MRGSvImToSecVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SvImToSvReVZ(cplSvImSvReVZ,MSvIm,MSvRe,MVZ,            & 
& MSvIm2,MSvRe2,MVZ2,AmpTreeSvImToSvReVZ)

  Else 
Call Amplitude_Tree_NInvSeesaw_SvImToSvReVZ(ZcplSvImSvReVZ,MSvIm,MSvRe,               & 
& MVZ,MSvIm2,MSvRe2,MVZ2,AmpTreeSvImToSvReVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvReVZ(MLambda,em,gs,cplSvImSvReVZ,MSvImOS,          & 
& MSvReOS,MVZOS,MRPSvImToSvReVZ,MRGSvImToSvReVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvReVZ(MLambda,em,gs,ZcplSvImSvReVZ,MSvImOS,         & 
& MSvReOS,MVZOS,MRPSvImToSvReVZ,MRGSvImToSvReVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SvImToSvReVZ(MLambda,em,gs,cplSvImSvReVZ,MSvIm,            & 
& MSvRe,MVZ,MRPSvImToSvReVZ,MRGSvImToSvReVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SvImToSvReVZ(MLambda,em,gs,ZcplSvImSvReVZ,MSvIm,           & 
& MSvRe,MVZ,MRPSvImToSvReVZ,MRGSvImToSvReVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImToSvReVZ(cplSvImSvReVZ,ctcplSvImSvReVZ,            & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVZ,MVZ2,ZfSvIm,ZfSvRe,ZfVZ,AmpWaveSvImToSvReVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvReVZ(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,             & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVZ,      & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,& 
& cplSvImSvImVZVZ1,cplSvImcSeVWmVZ1,cplSvReSvReVZVZ1,cplSvRecSeVWmVZ1,AmpVertexSvImToSvReVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReVZ(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,     & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,             & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVZ,      & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,& 
& cplSvImSvImVZVZ1,cplSvImcSeVWmVZ1,cplSvReSvReVZVZ1,cplSvRecSeVWmVZ1,AmpVertexIRdrSvImToSvReVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReVZ(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhhhVZ,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR, & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,       & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVZ,ZcplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSvImSvImVZVZ1,cplSvImcSeVWmVZ1,cplSvReSvReVZVZ1,  & 
& cplSvRecSeVWmVZ1,AmpVertexIRosSvImToSvReVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReVZ(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,     & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,             & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,ZcplSvImSvReVZ,     & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,& 
& cplSvImSvImVZVZ1,cplSvImcSeVWmVZ1,cplSvReSvReVZVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSvImToSvReVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReVZ(MAhOS,MChaOS,MChiOS,MFeOS,           & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhhhVZ,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR, & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,           & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,       & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,        & 
& cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSvImSvImVZVZ1,cplSvImcSeVWmVZ1,cplSvReSvReVZVZ1,  & 
& cplSvRecSeVWmVZ1,AmpVertexIRosSvImToSvReVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SvImToSvReVZ(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,     & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVZL,             & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVZ,cplSvImSvReVZ,      & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,& 
& cplSvImSvImVZVZ1,cplSvImcSeVWmVZ1,cplSvReSvReVZVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSvImToSvReVZ)

 End if 
 End if 
AmpVertexSvImToSvReVZ = AmpVertexSvImToSvReVZ -  AmpVertexIRdrSvImToSvReVZ! +  AmpVertexIRosSvImToSvReVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvImToSvReVZ=0._dp 
AmpVertexZSvImToSvReVZ=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvReVZ(:,gt2,:) = AmpWaveZSvImToSvReVZ(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSvImToSvReVZ(:,gt1,:) 
AmpVertexZSvImToSvReVZ(:,gt2,:)= AmpVertexZSvImToSvReVZ(:,gt2,:) + ZRUZVI(gt2,gt1)*AmpVertexSvImToSvReVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvImToSvReVZ=AmpWaveZSvImToSvReVZ 
AmpVertexSvImToSvReVZ= AmpVertexZSvImToSvReVZ
! Final State 1 
AmpWaveZSvImToSvReVZ=0._dp 
AmpVertexZSvImToSvReVZ=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvImToSvReVZ(:,:,gt2) = AmpWaveZSvImToSvReVZ(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveSvImToSvReVZ(:,:,gt1) 
AmpVertexZSvImToSvReVZ(:,:,gt2)= AmpVertexZSvImToSvReVZ(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexSvImToSvReVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvImToSvReVZ=AmpWaveZSvImToSvReVZ 
AmpVertexSvImToSvReVZ= AmpVertexZSvImToSvReVZ
End if
If (ShiftIRdiv) Then 
AmpVertexSvImToSvReVZ = AmpVertexSvImToSvReVZ  +  AmpVertexIRosSvImToSvReVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvRe VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvImToSvReVZ = AmpTreeSvImToSvReVZ 
 AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ + 2._dp*AmpWaveSvImToSvReVZ + 2._dp*AmpVertexSvImToSvReVZ  
Else 
 AmpSumSvImToSvReVZ = AmpTreeSvImToSvReVZ + AmpWaveSvImToSvReVZ + AmpVertexSvImToSvReVZ
 AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ + AmpWaveSvImToSvReVZ + AmpVertexSvImToSvReVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvReVZ = AmpTreeSvImToSvReVZ
 AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSvReOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSvRe(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvImToSvReVZ(gt1, gt2) 
  AmpSum2SvImToSvReVZ = 2._dp*AmpWaveSvImToSvReVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvImToSvReVZ(gt1, gt2) 
  AmpSum2SvImToSvReVZ = 2._dp*AmpVertexSvImToSvReVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvImToSvReVZ(gt1, gt2) 
  AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ + 2._dp*AmpWaveSvImToSvReVZ + 2._dp*AmpVertexSvImToSvReVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvImToSvReVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
  AmpSqTreeSvImToSvReVZ(gt1, gt2) = AmpSqSvImToSvReVZ(gt1, gt2)  
  AmpSum2SvImToSvReVZ = + 2._dp*AmpWaveSvImToSvReVZ + 2._dp*AmpVertexSvImToSvReVZ
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),MVZOS,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
  AmpSqSvImToSvReVZ(gt1, gt2) = AmpSqSvImToSvReVZ(gt1, gt2) + AmpSqTreeSvImToSvReVZ(gt1, gt2)  
Else  
  AmpSum2SvImToSvReVZ = AmpTreeSvImToSvReVZ
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
  AmpSqTreeSvImToSvReVZ(gt1, gt2) = AmpSqSvImToSvReVZ(gt1, gt2)  
  AmpSum2SvImToSvReVZ = + 2._dp*AmpWaveSvImToSvReVZ + 2._dp*AmpVertexSvImToSvReVZ
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVZ,AmpSumSvImToSvReVZ(:,gt1, gt2),AmpSum2SvImToSvReVZ(:,gt1, gt2),AmpSqSvImToSvReVZ(gt1, gt2)) 
  AmpSqSvImToSvReVZ(gt1, gt2) = AmpSqSvImToSvReVZ(gt1, gt2) + AmpSqTreeSvImToSvReVZ(gt1, gt2)  
End if  
Else  
  AmpSqSvImToSvReVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvReVZ(gt1, gt2).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvReOS(gt2),MVZOS,helfactor*AmpSqSvImToSvReVZ(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvRe(gt2),MVZ,helfactor*AmpSqSvImToSvReVZ(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvReVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvImToSvReVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvImToSvReVZ(gt1, gt2) + MRGSvImToSvReVZ(gt1, gt2)) 
  gP1LSvIm(gt1,i4) = gP1LSvIm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvImToSvReVZ(gt1, gt2) + MRGSvImToSvReVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSvIm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.9) isave = i4 
End do
End If 
!---------------- 
! SvIm VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvImVP(MChaOS,MFeOS,MHpmOS,MSeOS,              & 
& MSvImOS,MVP,MVWmOS,MCha2OS,MFe2OS,MHpm2OS,MSe2OS,MSvIm2OS,MVP2,MVWm2OS,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcFeFeVPL,cplcFeFeVPR,cplHpmSvImcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,         & 
& cplSeSvImcVWm,cplSecSeVP,cplSvImcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,     & 
& cplSvImcSeVPVWm1,AmpVertexSvImToSvImVP)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvImVP(MChaOS,MFeOS,MHpmOS,MSeOS,              & 
& MSvImOS,MVP,MVWmOS,MCha2OS,MFe2OS,MHpm2OS,MSe2OS,MSvIm2OS,MVP2,MVWm2OS,cplcFeChaSvImL, & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcFeFeVPL,cplcFeFeVPR,cplHpmSvImcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,         & 
& cplSeSvImcVWm,cplSecSeVP,cplSvImcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,     & 
& cplSvImcSeVPVWm1,AmpVertexSvImToSvImVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvImVP(MCha,MFe,MHpm,MSe,MSvIm,MVP,            & 
& MVWm,MCha2,MFe2,MHpm2,MSe2,MSvIm2,MVP2,MVWm2,cplcFeChaSvImL,cplcFeChaSvImR,            & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVPL,cplcFeFeVPR,     & 
& cplHpmSvImcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,        & 
& cplSvImcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSvImcSeVPVWm1,             & 
& AmpVertexSvImToSvImVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvIm VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvImVP = 0._dp 
 AmpSum2SvImToSvImVP = 0._dp  
Else 
 AmpSumSvImToSvImVP = AmpVertexSvImToSvImVP + AmpWaveSvImToSvImVP
 AmpSum2SvImToSvImVP = AmpVertexSvImToSvImVP + AmpWaveSvImToSvImVP 
End If 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSvImOS(gt2)+0.))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSvIm(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvImOS(gt2),0._dp,AmpSumSvImToSvImVP(:,gt1, gt2),AmpSum2SvImToSvImVP(:,gt1, gt2),AmpSqSvImToSvImVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvIm(gt2),MVP,AmpSumSvImToSvImVP(:,gt1, gt2),AmpSum2SvImToSvImVP(:,gt1, gt2),AmpSqSvImToSvImVP(gt1, gt2)) 
End if  
Else  
  AmpSqSvImToSvImVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvImVP(gt1, gt2).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvImOS(gt2),0._dp,helfactor*AmpSqSvImToSvImVP(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvIm(gt2),MVP,helfactor*AmpSqSvImToSvImVP(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvImVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.9) isave = i4 
End do
!---------------- 
! SvIm VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvImVZ(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhhhVZ,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,    & 
& cplcChaFeSvImR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,            & 
& cplhhSvImSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,         & 
& cplSeSvImcVWm,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,        & 
& cplSeSvImcVWmVZ1,cplSvImcSeVWmVZ1,AmpVertexSvImToSvImVZ)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvImVZ(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,          & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVWm2OS,MVZ2OS,cplAhhhVZ,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplcChaFeSvImL,    & 
& cplcChaFeSvImR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,            & 
& cplhhSvImSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,         & 
& cplSeSvImcVWm,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,        & 
& cplSeSvImcVWmVZ1,cplSvImcSeVWmVZ1,AmpVertexSvImToSvImVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvImVZ(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,              & 
& MSvIm2,MSvRe2,MVWm2,MVZ2,cplAhhhVZ,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,         & 
& cplcFeChaSvImR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,    & 
& cplChiFvSvImR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,        & 
& cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,cplhhVZVZ,cplHpmSvImcSe,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSvImcSeVWmVZ1,AmpVertexSvImToSvImVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvIm VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvImVZ = 0._dp 
 AmpSum2SvImToSvImVZ = 0._dp  
Else 
 AmpSumSvImToSvImVZ = AmpVertexSvImToSvImVZ + AmpWaveSvImToSvImVZ
 AmpSum2SvImToSvImVZ = AmpVertexSvImToSvImVZ + AmpWaveSvImToSvImVZ 
End If 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSvImOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSvIm(gt2)+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvImOS(gt2),MVZOS,AmpSumSvImToSvImVZ(:,gt1, gt2),AmpSum2SvImToSvImVZ(:,gt1, gt2),AmpSqSvImToSvImVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvIm(gt2),MVZ,AmpSumSvImToSvImVZ(:,gt1, gt2),AmpSum2SvImToSvImVZ(:,gt1, gt2),AmpSqSvImToSvImVZ(gt1, gt2)) 
End if  
Else  
  AmpSqSvImToSvImVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvImVZ(gt1, gt2).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvImOS(gt2),MVZOS,helfactor*AmpSqSvImToSvImVZ(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvIm(gt2),MVZ,helfactor*AmpSqSvImToSvImVZ(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvImVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvImVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.9) isave = i4 
End do
!---------------- 
! SvRe VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_NInvSeesaw_SvImToSvReVP(cplSvImSvReVZ,ctcplSvImSvReVZ,            & 
& MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfSvIm,ZfSvRe,ZfVP,            & 
& ZfVZVP,AmpWaveSvImToSvReVP)

 Else 
Call Amplitude_WAVE_NInvSeesaw_SvImToSvReVP(cplSvImSvReVZ,ctcplSvImSvReVZ,            & 
& MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfSvIm,ZfSvRe,ZfVP,            & 
& ZfVZVP,AmpWaveSvImToSvReVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvReVP(MChaOS,MFeOS,MHpmOS,MSeOS,              & 
& MSvImOS,MSvReOS,MVP,MVWmOS,MCha2OS,MFe2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,            & 
& MVP2,MVWm2OS,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,       & 
& cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,       & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,& 
& cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,AmpVertexSvImToSvReVP)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvReVP(MChaOS,MFeOS,MHpmOS,MSeOS,              & 
& MSvImOS,MSvReOS,MVP,MVWmOS,MCha2OS,MFe2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,            & 
& MVP2,MVWm2OS,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,       & 
& cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,       & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,& 
& cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,AmpVertexSvImToSvReVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SvImToSvReVP(cplSvImSvReVZ,ctcplSvImSvReVZ,            & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVP,MVP2,MVZ,MVZ2,ZfSvIm,ZfSvRe,ZfVP,ZfVZVP,AmpWaveSvImToSvReVP)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SvImToSvReVP(MCha,MFe,MHpm,MSe,MSvIm,MSvRe,          & 
& MVP,MVWm,MCha2,MFe2,MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplHpmSvImcSe,    & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSecSeVP,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,        & 
& cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,AmpVertexSvImToSvReVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ SvIm->SvRe VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvImToSvReVP = 0._dp 
 AmpSum2SvImToSvReVP = 0._dp  
Else 
 AmpSumSvImToSvReVP = AmpVertexSvImToSvReVP + AmpWaveSvImToSvReVP
 AmpSum2SvImToSvReVP = AmpVertexSvImToSvReVP + AmpWaveSvImToSvReVP 
End If 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(MSvImOS(gt1).gt.(MSvReOS(gt2)+0.))).or.((.not.OSkinematics).and.(MSvIm(gt1).gt.(MSvRe(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvImOS(gt1),MSvReOS(gt2),0._dp,AmpSumSvImToSvReVP(:,gt1, gt2),AmpSum2SvImToSvReVP(:,gt1, gt2),AmpSqSvImToSvReVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSvIm(gt1),MSvRe(gt2),MVP,AmpSumSvImToSvReVP(:,gt1, gt2),AmpSum2SvImToSvReVP(:,gt1, gt2),AmpSqSvImToSvReVP(gt1, gt2)) 
End if  
Else  
  AmpSqSvImToSvReVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvImToSvReVP(gt1, gt2).le.0._dp) Then 
  gP1LSvIm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvImOS(gt1),MSvReOS(gt2),0._dp,helfactor*AmpSqSvImToSvReVP(gt1, gt2))
Else 
  gP1LSvIm(gt1,i4) = 1._dp*GammaTPS(MSvIm(gt1),MSvRe(gt2),MVP,helfactor*AmpSqSvImToSvReVP(gt1, gt2))
End if 
If ((Abs(MRPSvImToSvReVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvImToSvReVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSvIm(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.9) isave = i4 
End do
End Subroutine OneLoopDecay_SvIm

End Module Wrapper_OneLoopDecay_SvIm_NInvSeesaw
