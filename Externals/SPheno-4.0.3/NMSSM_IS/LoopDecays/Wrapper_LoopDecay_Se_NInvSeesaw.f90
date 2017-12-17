! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:29 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Se_NInvSeesaw
Use Model_Data_NInvSeesaw 
Use Kinematics 
Use OneLoopDecay_Se_NInvSeesaw 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Se(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,            & 
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
& ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhAhSecSe1,               & 
& cplAhcHpmVWm,cplAhhhhh,cplAhhhSecSe1,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,              & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSdcSd,cplAhSecSe,cplAhSeSvImcHpm1,              & 
& cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChaAhL,   & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplFvChacSeL,cplFvChacSeR,         & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,       & 
& cplhhhhSecSe1,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplhhSucSu,cplhhSvImSvIm,      & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVP,          & 
& cplHpmcVWmVZ,cplHpmSecHpmcSe1,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvImSvImcHpm1,           & 
& cplHpmSvImSvRecHpm1,cplHpmSvRecSe,cplHpmSvReSvRecHpm1,cplSdSecSdcSeaa,cplSdSvImcSecSuaa,& 
& cplSdSvRecSecSuaa,cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVPVP1,cplSecSeVPVZ1,             & 
& cplSecSeVZ,cplSecSeVZVZ1,cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvRecHpm,   & 
& cplSeSvRecVWm,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvReSvRecSe1,cplSvImcSeVPVWm1,    & 
& cplSvImcSeVWm,cplSvImcSeVWmVZ1,cplSvImSvImcVWmVWm1,cplSvImSvReVZ,cplSvRecSeVPVWm1,     & 
& cplSvRecSeVWm,cplSvRecSeVWmVZ1,cplSvReSvRecVWmVWm1,ctcplAhSecSe,ctcplChiFecSeL,        & 
& ctcplChiFecSeR,ctcplFvChacSeL,ctcplFvChacSeR,ctcplhhSecSe,ctcplHpmSvImcSe,             & 
& ctcplHpmSvRecSe,ctcplSecSeVP,ctcplSecSeVZ,ctcplSvImcSeVWm,ctcplSvRecSeVWm,             & 
& GcplcHpmVPVWm,GcplHpmcVWmVP,GcplHpmSvImcSe,GcplHpmSvRecSe,GosZcplcHpmVPVWm,            & 
& GosZcplHpmcVWmVP,GosZcplHpmSvImcSe,GosZcplHpmSvRecSe,GZcplcHpmVPVWm,GZcplHpmcVWmVP,    & 
& GZcplHpmSvImcSe,GZcplHpmSvRecSe,ZcplAhSecSe,ZcplChiFecSeL,ZcplChiFecSeR,               & 
& ZcplFvChacSeL,ZcplFvChacSeR,ZcplhhSecSe,ZcplHpmSvImcSe,ZcplHpmSvRecSe,ZcplSecSeVZ,     & 
& ZcplSvImcSeVWm,ZcplSvRecSeVWm,ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,             & 
& ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,               & 
& MLambda,em,gs,deltaM,kont,gP1LSe)

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

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhAhSecSe1(3,3,6,6),cplAhcHpmVWm(3,2),           & 
& cplAhhhhh(3,3,3),cplAhhhSecSe1(3,3,6,6),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),            & 
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
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplhhhhhh(3,3,3),cplhhhhSecSe1(3,3,6,6),             & 
& cplhhHpmcHpm(3,2,2),cplhhHpmcVWm(3,2),cplhhHpmSvImcSe1(3,2,9,6),cplhhHpmSvRecSe1(3,2,9,6),& 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSeSvImcHpm1(3,6,9,2),cplhhSeSvRecHpm1(3,6,9,2),& 
& cplhhSucSu(3,6,6),cplhhSvImSvIm(3,9,9),cplhhSvImSvRe(3,9,9),cplhhSvReSvRe(3,9,9),      & 
& cplhhVZVZ(3),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),      & 
& cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,9,6),cplHpmSvImSvImcHpm1(2,9,9,2),& 
& cplHpmSvImSvRecHpm1(2,9,9,2),cplHpmSvRecSe(2,9,6),cplHpmSvReSvRecHpm1(2,9,9,2),        & 
& cplSdSecSdcSeaa(6,6,6,6),cplSdSvImcSecSuaa(6,9,6,6),cplSdSvRecSecSuaa(6,9,6,6),        & 
& cplSecSecVWmVWm1(6,6),cplSecSeVP(6,6),cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),           & 
& cplSecSeVZ(6,6),cplSecSeVZVZ1(6,6),cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),   & 
& cplSeSvImcHpm(6,9,2),cplSeSvImcVWm(6,9),cplSeSvImcVWmVP1(6,9),cplSeSvImcVWmVZ1(6,9),   & 
& cplSeSvImSvImcSe1(6,9,9,6),cplSeSvImSvRecSe1(6,9,9,6),cplSeSvRecHpm(6,9,2),            & 
& cplSeSvRecVWm(6,9),cplSeSvRecVWmVP1(6,9),cplSeSvRecVWmVZ1(6,9),cplSeSvReSvRecSe1(6,9,9,6),& 
& cplSvImcSeVPVWm1(9,6),cplSvImcSeVWm(9,6),cplSvImcSeVWmVZ1(9,6),cplSvImSvImcVWmVWm1(9,9),& 
& cplSvImSvReVZ(9,9),cplSvRecSeVPVWm1(9,6),cplSvRecSeVWm(9,6),cplSvRecSeVWmVZ1(9,6),     & 
& cplSvReSvRecVWmVWm1(9,9),ctcplAhSecSe(3,6,6),ctcplChiFecSeL(5,3,6),ctcplChiFecSeR(5,3,6)

Complex(dp),Intent(in) :: ctcplFvChacSeL(9,2,6),ctcplFvChacSeR(9,2,6),ctcplhhSecSe(3,6,6),ctcplHpmSvImcSe(2,9,6),& 
& ctcplHpmSvRecSe(2,9,6),ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),ctcplSvImcSeVWm(9,6),       & 
& ctcplSvRecSeVWm(9,6),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),GcplHpmSvImcSe(2,9,6),          & 
& GcplHpmSvRecSe(2,9,6),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GosZcplHpmSvImcSe(2,9,6),& 
& GosZcplHpmSvRecSe(2,9,6),GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),GZcplHpmSvImcSe(2,9,6),   & 
& GZcplHpmSvRecSe(2,9,6),ZcplAhSecSe(3,6,6),ZcplChiFecSeL(5,3,6),ZcplChiFecSeR(5,3,6),   & 
& ZcplFvChacSeL(9,2,6),ZcplFvChacSeR(9,2,6),ZcplhhSecSe(3,6,6),ZcplHpmSvImcSe(2,9,6),    & 
& ZcplHpmSvRecSe(2,9,6),ZcplSecSeVZ(6,6),ZcplSvImcSeVWm(9,6),ZcplSvRecSeVWm(9,6)

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
Real(dp), Intent(out) :: gP1LSe(6,111) 
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
Real(dp) :: MRPSeToSeAh(6,6,3),MRGSeToSeAh(6,6,3), MRPZSeToSeAh(6,6,3),MRGZSeToSeAh(6,6,3) 
Real(dp) :: MVPSeToSeAh(6,6,3) 
Real(dp) :: RMsqTreeSeToSeAh(6,6,3),RMsqWaveSeToSeAh(6,6,3),RMsqVertexSeToSeAh(6,6,3) 
Complex(dp) :: AmpTreeSeToSeAh(6,6,3),AmpWaveSeToSeAh(6,6,3)=(0._dp,0._dp),AmpVertexSeToSeAh(6,6,3)& 
 & ,AmpVertexIRosSeToSeAh(6,6,3),AmpVertexIRdrSeToSeAh(6,6,3), AmpSumSeToSeAh(6,6,3), AmpSum2SeToSeAh(6,6,3) 
Complex(dp) :: AmpTreeZSeToSeAh(6,6,3),AmpWaveZSeToSeAh(6,6,3),AmpVertexZSeToSeAh(6,6,3) 
Real(dp) :: AmpSqSeToSeAh(6,6,3),  AmpSqTreeSeToSeAh(6,6,3) 
Real(dp) :: MRPSeToFvCha(6,9,2),MRGSeToFvCha(6,9,2), MRPZSeToFvCha(6,9,2),MRGZSeToFvCha(6,9,2) 
Real(dp) :: MVPSeToFvCha(6,9,2) 
Real(dp) :: RMsqTreeSeToFvCha(6,9,2),RMsqWaveSeToFvCha(6,9,2),RMsqVertexSeToFvCha(6,9,2) 
Complex(dp) :: AmpTreeSeToFvCha(2,6,9,2),AmpWaveSeToFvCha(2,6,9,2)=(0._dp,0._dp),AmpVertexSeToFvCha(2,6,9,2)& 
 & ,AmpVertexIRosSeToFvCha(2,6,9,2),AmpVertexIRdrSeToFvCha(2,6,9,2), AmpSumSeToFvCha(2,6,9,2), AmpSum2SeToFvCha(2,6,9,2) 
Complex(dp) :: AmpTreeZSeToFvCha(2,6,9,2),AmpWaveZSeToFvCha(2,6,9,2),AmpVertexZSeToFvCha(2,6,9,2) 
Real(dp) :: AmpSqSeToFvCha(6,9,2),  AmpSqTreeSeToFvCha(6,9,2) 
Real(dp) :: MRPSeToFeChi(6,3,5),MRGSeToFeChi(6,3,5), MRPZSeToFeChi(6,3,5),MRGZSeToFeChi(6,3,5) 
Real(dp) :: MVPSeToFeChi(6,3,5) 
Real(dp) :: RMsqTreeSeToFeChi(6,3,5),RMsqWaveSeToFeChi(6,3,5),RMsqVertexSeToFeChi(6,3,5) 
Complex(dp) :: AmpTreeSeToFeChi(2,6,3,5),AmpWaveSeToFeChi(2,6,3,5)=(0._dp,0._dp),AmpVertexSeToFeChi(2,6,3,5)& 
 & ,AmpVertexIRosSeToFeChi(2,6,3,5),AmpVertexIRdrSeToFeChi(2,6,3,5), AmpSumSeToFeChi(2,6,3,5), AmpSum2SeToFeChi(2,6,3,5) 
Complex(dp) :: AmpTreeZSeToFeChi(2,6,3,5),AmpWaveZSeToFeChi(2,6,3,5),AmpVertexZSeToFeChi(2,6,3,5) 
Real(dp) :: AmpSqSeToFeChi(6,3,5),  AmpSqTreeSeToFeChi(6,3,5) 
Real(dp) :: MRPSeToSehh(6,6,3),MRGSeToSehh(6,6,3), MRPZSeToSehh(6,6,3),MRGZSeToSehh(6,6,3) 
Real(dp) :: MVPSeToSehh(6,6,3) 
Real(dp) :: RMsqTreeSeToSehh(6,6,3),RMsqWaveSeToSehh(6,6,3),RMsqVertexSeToSehh(6,6,3) 
Complex(dp) :: AmpTreeSeToSehh(6,6,3),AmpWaveSeToSehh(6,6,3)=(0._dp,0._dp),AmpVertexSeToSehh(6,6,3)& 
 & ,AmpVertexIRosSeToSehh(6,6,3),AmpVertexIRdrSeToSehh(6,6,3), AmpSumSeToSehh(6,6,3), AmpSum2SeToSehh(6,6,3) 
Complex(dp) :: AmpTreeZSeToSehh(6,6,3),AmpWaveZSeToSehh(6,6,3),AmpVertexZSeToSehh(6,6,3) 
Real(dp) :: AmpSqSeToSehh(6,6,3),  AmpSqTreeSeToSehh(6,6,3) 
Real(dp) :: MRPSeToSvImHpm(6,9,2),MRGSeToSvImHpm(6,9,2), MRPZSeToSvImHpm(6,9,2),MRGZSeToSvImHpm(6,9,2) 
Real(dp) :: MVPSeToSvImHpm(6,9,2) 
Real(dp) :: RMsqTreeSeToSvImHpm(6,9,2),RMsqWaveSeToSvImHpm(6,9,2),RMsqVertexSeToSvImHpm(6,9,2) 
Complex(dp) :: AmpTreeSeToSvImHpm(6,9,2),AmpWaveSeToSvImHpm(6,9,2)=(0._dp,0._dp),AmpVertexSeToSvImHpm(6,9,2)& 
 & ,AmpVertexIRosSeToSvImHpm(6,9,2),AmpVertexIRdrSeToSvImHpm(6,9,2), AmpSumSeToSvImHpm(6,9,2), AmpSum2SeToSvImHpm(6,9,2) 
Complex(dp) :: AmpTreeZSeToSvImHpm(6,9,2),AmpWaveZSeToSvImHpm(6,9,2),AmpVertexZSeToSvImHpm(6,9,2) 
Real(dp) :: AmpSqSeToSvImHpm(6,9,2),  AmpSqTreeSeToSvImHpm(6,9,2) 
Real(dp) :: MRPSeToSvReHpm(6,9,2),MRGSeToSvReHpm(6,9,2), MRPZSeToSvReHpm(6,9,2),MRGZSeToSvReHpm(6,9,2) 
Real(dp) :: MVPSeToSvReHpm(6,9,2) 
Real(dp) :: RMsqTreeSeToSvReHpm(6,9,2),RMsqWaveSeToSvReHpm(6,9,2),RMsqVertexSeToSvReHpm(6,9,2) 
Complex(dp) :: AmpTreeSeToSvReHpm(6,9,2),AmpWaveSeToSvReHpm(6,9,2)=(0._dp,0._dp),AmpVertexSeToSvReHpm(6,9,2)& 
 & ,AmpVertexIRosSeToSvReHpm(6,9,2),AmpVertexIRdrSeToSvReHpm(6,9,2), AmpSumSeToSvReHpm(6,9,2), AmpSum2SeToSvReHpm(6,9,2) 
Complex(dp) :: AmpTreeZSeToSvReHpm(6,9,2),AmpWaveZSeToSvReHpm(6,9,2),AmpVertexZSeToSvReHpm(6,9,2) 
Real(dp) :: AmpSqSeToSvReHpm(6,9,2),  AmpSqTreeSeToSvReHpm(6,9,2) 
Real(dp) :: MRPSeToSeVZ(6,6),MRGSeToSeVZ(6,6), MRPZSeToSeVZ(6,6),MRGZSeToSeVZ(6,6) 
Real(dp) :: MVPSeToSeVZ(6,6) 
Real(dp) :: RMsqTreeSeToSeVZ(6,6),RMsqWaveSeToSeVZ(6,6),RMsqVertexSeToSeVZ(6,6) 
Complex(dp) :: AmpTreeSeToSeVZ(2,6,6),AmpWaveSeToSeVZ(2,6,6)=(0._dp,0._dp),AmpVertexSeToSeVZ(2,6,6)& 
 & ,AmpVertexIRosSeToSeVZ(2,6,6),AmpVertexIRdrSeToSeVZ(2,6,6), AmpSumSeToSeVZ(2,6,6), AmpSum2SeToSeVZ(2,6,6) 
Complex(dp) :: AmpTreeZSeToSeVZ(2,6,6),AmpWaveZSeToSeVZ(2,6,6),AmpVertexZSeToSeVZ(2,6,6) 
Real(dp) :: AmpSqSeToSeVZ(6,6),  AmpSqTreeSeToSeVZ(6,6) 
Real(dp) :: MRPSeToSvImVWm(6,9),MRGSeToSvImVWm(6,9), MRPZSeToSvImVWm(6,9),MRGZSeToSvImVWm(6,9) 
Real(dp) :: MVPSeToSvImVWm(6,9) 
Real(dp) :: RMsqTreeSeToSvImVWm(6,9),RMsqWaveSeToSvImVWm(6,9),RMsqVertexSeToSvImVWm(6,9) 
Complex(dp) :: AmpTreeSeToSvImVWm(2,6,9),AmpWaveSeToSvImVWm(2,6,9)=(0._dp,0._dp),AmpVertexSeToSvImVWm(2,6,9)& 
 & ,AmpVertexIRosSeToSvImVWm(2,6,9),AmpVertexIRdrSeToSvImVWm(2,6,9), AmpSumSeToSvImVWm(2,6,9), AmpSum2SeToSvImVWm(2,6,9) 
Complex(dp) :: AmpTreeZSeToSvImVWm(2,6,9),AmpWaveZSeToSvImVWm(2,6,9),AmpVertexZSeToSvImVWm(2,6,9) 
Real(dp) :: AmpSqSeToSvImVWm(6,9),  AmpSqTreeSeToSvImVWm(6,9) 
Real(dp) :: MRPSeToSvReVWm(6,9),MRGSeToSvReVWm(6,9), MRPZSeToSvReVWm(6,9),MRGZSeToSvReVWm(6,9) 
Real(dp) :: MVPSeToSvReVWm(6,9) 
Real(dp) :: RMsqTreeSeToSvReVWm(6,9),RMsqWaveSeToSvReVWm(6,9),RMsqVertexSeToSvReVWm(6,9) 
Complex(dp) :: AmpTreeSeToSvReVWm(2,6,9),AmpWaveSeToSvReVWm(2,6,9)=(0._dp,0._dp),AmpVertexSeToSvReVWm(2,6,9)& 
 & ,AmpVertexIRosSeToSvReVWm(2,6,9),AmpVertexIRdrSeToSvReVWm(2,6,9), AmpSumSeToSvReVWm(2,6,9), AmpSum2SeToSvReVWm(2,6,9) 
Complex(dp) :: AmpTreeZSeToSvReVWm(2,6,9),AmpWaveZSeToSvReVWm(2,6,9),AmpVertexZSeToSvReVWm(2,6,9) 
Real(dp) :: AmpSqSeToSvReVWm(6,9),  AmpSqTreeSeToSvReVWm(6,9) 
Real(dp) :: MRPSeToSeVP(6,6),MRGSeToSeVP(6,6), MRPZSeToSeVP(6,6),MRGZSeToSeVP(6,6) 
Real(dp) :: MVPSeToSeVP(6,6) 
Real(dp) :: RMsqTreeSeToSeVP(6,6),RMsqWaveSeToSeVP(6,6),RMsqVertexSeToSeVP(6,6) 
Complex(dp) :: AmpTreeSeToSeVP(2,6,6),AmpWaveSeToSeVP(2,6,6)=(0._dp,0._dp),AmpVertexSeToSeVP(2,6,6)& 
 & ,AmpVertexIRosSeToSeVP(2,6,6),AmpVertexIRdrSeToSeVP(2,6,6), AmpSumSeToSeVP(2,6,6), AmpSum2SeToSeVP(2,6,6) 
Complex(dp) :: AmpTreeZSeToSeVP(2,6,6),AmpWaveZSeToSeVP(2,6,6),AmpVertexZSeToSeVP(2,6,6) 
Real(dp) :: AmpSqSeToSeVP(6,6),  AmpSqTreeSeToSeVP(6,6) 
Write(*,*) "Calculating one-loop decays of Se " 
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
! Se Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SeToSeAh(cplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeSeToSeAh)

  Else 
Call Amplitude_Tree_NInvSeesaw_SeToSeAh(ZcplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeSeToSeAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSeAh(MLambda,em,gs,cplAhSecSe,MAhOS,MSeOS,             & 
& MRPSeToSeAh,MRGSeToSeAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSeAh(MLambda,em,gs,ZcplAhSecSe,MAhOS,MSeOS,            & 
& MRPSeToSeAh,MRGSeToSeAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SeToSeAh(MLambda,em,gs,cplAhSecSe,MAh,MSe,MRPSeToSeAh,     & 
& MRGSeToSeAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSeAh(MLambda,em,gs,ZcplAhSecSe,MAh,MSe,MRPSeToSeAh,    & 
& MRGSeToSeAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToSeAh(cplAhSecSe,ctcplAhSecSe,MAh,MAh2,             & 
& MSe,MSe2,ZfAh,ZfSe,AmpWaveSeToSeAh)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,            & 
& MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,        & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,        & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFvSeL,         & 
& cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,       & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,        & 
& cplAhSeSvRecHpm1,cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,        & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexSeToSeAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,        & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFvSeL,         & 
& cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,       & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,        & 
& cplAhSeSvRecHpm1,cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,        & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRdrSeToSeAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeAh(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,ZcplAhSecSe,cplAhSucSu,       & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,      & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFvSeL,cplcChaFvSeR,         & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,      & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,         & 
& cplAhhhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,     & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosSeToSeAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,ZcplAhSecSe,       & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,        & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFvSeL,         & 
& cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,       & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,        & 
& cplAhSeSvRecHpm1,cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,        & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosSeToSeAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeAh(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,      & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFvSeL,cplcChaFvSeR,         & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,      & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe1,         & 
& cplAhhhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,     & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosSeToSeAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,            & 
& cplFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,        & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFvSeL,         & 
& cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,       & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSeSvImcHpm1,        & 
& cplAhSeSvRecHpm1,cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,        & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,AmpVertexIRosSeToSeAh)

 End if 
 End if 
AmpVertexSeToSeAh = AmpVertexSeToSeAh -  AmpVertexIRdrSeToSeAh! +  AmpVertexIRosSeToSeAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSeAh=0._dp 
AmpVertexZSeToSeAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeAh(gt2,:,:) = AmpWaveZSeToSeAh(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSeAh(gt1,:,:) 
AmpVertexZSeToSeAh(gt2,:,:)= AmpVertexZSeToSeAh(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSeAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSeAh=AmpWaveZSeToSeAh 
AmpVertexSeToSeAh= AmpVertexZSeToSeAh
! Final State 1 
AmpWaveZSeToSeAh=0._dp 
AmpVertexZSeToSeAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeAh(:,gt2,:) = AmpWaveZSeToSeAh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpWaveSeToSeAh(:,gt1,:) 
AmpVertexZSeToSeAh(:,gt2,:)= AmpVertexZSeToSeAh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpVertexSeToSeAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSeAh=AmpWaveZSeToSeAh 
AmpVertexSeToSeAh= AmpVertexZSeToSeAh
! Final State 2 
AmpWaveZSeToSeAh=0._dp 
AmpVertexZSeToSeAh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSeToSeAh(:,:,gt2) = AmpWaveZSeToSeAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSeToSeAh(:,:,gt1) 
AmpVertexZSeToSeAh(:,:,gt2)= AmpVertexZSeToSeAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSeToSeAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSeAh=AmpWaveZSeToSeAh 
AmpVertexSeToSeAh= AmpVertexZSeToSeAh
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSeAh = AmpVertexSeToSeAh  +  AmpVertexIRosSeToSeAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSeAh = AmpTreeSeToSeAh 
 AmpSum2SeToSeAh = AmpTreeSeToSeAh + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh  
Else 
 AmpSumSeToSeAh = AmpTreeSeToSeAh + AmpWaveSeToSeAh + AmpVertexSeToSeAh
 AmpSum2SeToSeAh = AmpTreeSeToSeAh + AmpWaveSeToSeAh + AmpVertexSeToSeAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeAh = AmpTreeSeToSeAh
 AmpSum2SeToSeAh = AmpTreeSeToSeAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=2,3
If (((OSkinematics).and.(MSeOS(gt1).gt.(MSeOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MSe(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSeAh = AmpTreeSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSeAh(gt1, gt2, gt3) 
  AmpSum2SeToSeAh = 2._dp*AmpWaveSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSeAh(gt1, gt2, gt3) 
  AmpSum2SeToSeAh = 2._dp*AmpVertexSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSeAh(gt1, gt2, gt3) 
  AmpSum2SeToSeAh = AmpTreeSeToSeAh + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSeAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSeAh = AmpTreeSeToSeAh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3)  
  AmpSum2SeToSeAh = + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3) + AmpSqTreeSeToSeAh(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSeAh = AmpTreeSeToSeAh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3)  
  AmpSum2SeToSeAh = + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3) + AmpSqTreeSeToSeAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSeAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeAh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),helfactor*AmpSqSeToSeAh(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MAh(gt3),helfactor*AmpSqSeToSeAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSeAh(gt1, gt2, gt3) + MRGSeToSeAh(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSeAh(gt1, gt2, gt3) + MRGSeToSeAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SeToFvCha(cplFvChacSeL,cplFvChacSeR,MCha,              & 
& MFv,MSe,MCha2,MFv2,MSe2,AmpTreeSeToFvCha)

  Else 
Call Amplitude_Tree_NInvSeesaw_SeToFvCha(ZcplFvChacSeL,ZcplFvChacSeR,MCha,            & 
& MFv,MSe,MCha2,MFv2,MSe2,AmpTreeSeToFvCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SeToFvCha(MLambda,em,gs,cplFvChacSeL,cplFvChacSeR,         & 
& MChaOS,MFvOS,MSeOS,MRPSeToFvCha,MRGSeToFvCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToFvCha(MLambda,em,gs,ZcplFvChacSeL,ZcplFvChacSeR,       & 
& MChaOS,MFvOS,MSeOS,MRPSeToFvCha,MRGSeToFvCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SeToFvCha(MLambda,em,gs,cplFvChacSeL,cplFvChacSeR,         & 
& MCha,MFv,MSe,MRPSeToFvCha,MRGSeToFvCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToFvCha(MLambda,em,gs,ZcplFvChacSeL,ZcplFvChacSeR,       & 
& MCha,MFv,MSe,MRPSeToFvCha,MRGSeToFvCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToFvCha(cplFvChacSeL,cplFvChacSeR,ctcplFvChacSeL,    & 
& ctcplFvChacSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFV,ZfLm,ZfLp,ZfSe,AmpWaveSeToFvCha)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,               & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,cplFvFvAhR,       & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,           & 
& cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,             & 
& cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexSeToFvCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,             & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRdrSeToFvCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFvCha(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,    & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,ZcplFvChacSeL,ZcplFvChacSeR,              & 
& cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,              & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,           & 
& cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,             & 
& cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFvCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,             & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& ZcplFvChacSeL,ZcplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFvCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFvCha(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,    & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,  & 
& cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,    & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& AmpVertexIRosSeToFvCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,             & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,               & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,         & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFvCha)

 End if 
 End if 
AmpVertexSeToFvCha = AmpVertexSeToFvCha -  AmpVertexIRdrSeToFvCha! +  AmpVertexIRosSeToFvCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToFvCha=0._dp 
AmpVertexZSeToFvCha=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToFvCha(:,gt2,:,:) = AmpWaveZSeToFvCha(:,gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToFvCha(:,gt1,:,:) 
AmpVertexZSeToFvCha(:,gt2,:,:)= AmpVertexZSeToFvCha(:,gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToFvCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToFvCha=AmpWaveZSeToFvCha 
AmpVertexSeToFvCha= AmpVertexZSeToFvCha
! Final State 1 
AmpWaveZSeToFvCha=0._dp 
AmpVertexZSeToFvCha=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSeToFvCha(1,:,gt2,:) = AmpWaveZSeToFvCha(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWaveSeToFvCha(1,:,gt1,:) 
AmpVertexZSeToFvCha(1,:,gt2,:)= AmpVertexZSeToFvCha(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexSeToFvCha(1,:,gt1,:) 
AmpWaveZSeToFvCha(2,:,gt2,:) = AmpWaveZSeToFvCha(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWaveSeToFvCha(2,:,gt1,:) 
AmpVertexZSeToFvCha(2,:,gt2,:)= AmpVertexZSeToFvCha(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexSeToFvCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToFvCha=AmpWaveZSeToFvCha 
AmpVertexSeToFvCha= AmpVertexZSeToFvCha
! Final State 2 
AmpWaveZSeToFvCha=0._dp 
AmpVertexZSeToFvCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSeToFvCha(1,:,:,gt2) = AmpWaveZSeToFvCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveSeToFvCha(1,:,:,gt1) 
AmpVertexZSeToFvCha(1,:,:,gt2)= AmpVertexZSeToFvCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexSeToFvCha(1,:,:,gt1) 
AmpWaveZSeToFvCha(2,:,:,gt2) = AmpWaveZSeToFvCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveSeToFvCha(2,:,:,gt1) 
AmpVertexZSeToFvCha(2,:,:,gt2)= AmpVertexZSeToFvCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexSeToFvCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToFvCha=AmpWaveZSeToFvCha 
AmpVertexSeToFvCha= AmpVertexZSeToFvCha
End if
If (ShiftIRdiv) Then 
AmpVertexSeToFvCha = AmpVertexSeToFvCha  +  AmpVertexIRosSeToFvCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Fv Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToFvCha = AmpTreeSeToFvCha 
 AmpSum2SeToFvCha = AmpTreeSeToFvCha + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha  
Else 
 AmpSumSeToFvCha = AmpTreeSeToFvCha + AmpWaveSeToFvCha + AmpVertexSeToFvCha
 AmpSum2SeToFvCha = AmpTreeSeToFvCha + AmpWaveSeToFvCha + AmpVertexSeToFvCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToFvCha = AmpTreeSeToFvCha
 AmpSum2SeToFvCha = AmpTreeSeToFvCha 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,9
    Do gt3=1,2
If (((OSkinematics).and.(MSeOS(gt1).gt.(MFvOS(gt2)+MChaOS(gt3)))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MFv(gt2)+MCha(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToFvCha = AmpTreeSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToFvCha(gt1, gt2, gt3) 
  AmpSum2SeToFvCha = 2._dp*AmpWaveSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToFvCha(gt1, gt2, gt3) 
  AmpSum2SeToFvCha = 2._dp*AmpVertexSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToFvCha(gt1, gt2, gt3) 
  AmpSum2SeToFvCha = AmpTreeSeToFvCha + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToFvCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToFvCha = AmpTreeSeToFvCha
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqTreeSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3)  
  AmpSum2SeToFvCha = + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3) + AmpSqTreeSeToFvCha(gt1, gt2, gt3)  
Else  
  AmpSum2SeToFvCha = AmpTreeSeToFvCha
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqTreeSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3)  
  AmpSum2SeToFvCha = + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3) + AmpSqTreeSeToFvCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToFvCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSeToFvCha(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),helfactor*AmpSqSeToFvCha(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MFv(gt2),MCha(gt3),helfactor*AmpSqSeToFvCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToFvCha(gt1, gt2, gt3) + MRGSeToFvCha(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToFvCha(gt1, gt2, gt3) + MRGSeToFvCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SeToFeChi(cplChiFecSeL,cplChiFecSeR,MChi,              & 
& MFe,MSe,MChi2,MFe2,MSe2,AmpTreeSeToFeChi)

  Else 
Call Amplitude_Tree_NInvSeesaw_SeToFeChi(ZcplChiFecSeL,ZcplChiFecSeR,MChi,            & 
& MFe,MSe,MChi2,MFe2,MSe2,AmpTreeSeToFeChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SeToFeChi(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,         & 
& MChiOS,MFeOS,MSeOS,MRPSeToFeChi,MRGSeToFeChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToFeChi(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,       & 
& MChiOS,MFeOS,MSeOS,MRPSeToFeChi,MRGSeToFeChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SeToFeChi(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,         & 
& MChi,MFe,MSe,MRPSeToFeChi,MRGSeToFeChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToFeChi(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,       & 
& MChi,MFe,MSe,MRPSeToFeChi,MRGSeToFeChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToFeChi(cplChiFecSeL,cplChiFecSeR,ctcplChiFecSeL,    & 
& ctcplChiFecSeR,MChi,MChi2,MFe,MFe2,MSe,MSe2,ZfFEL,ZfFER,ZfL0,ZfSe,AmpWaveSeToFeChi)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,               & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,   & 
& cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,         & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,   & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,         & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,              & 
& cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexSeToFeChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRdrSeToFeChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFeChi(MAhOS,MChaOS,MChiOS,MFeOS,              & 
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
& cplSvRecSeVWm,AmpVertexIRosSeToFeChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& ZcplChiFecSeL,ZcplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFeChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFeChi(MAhOS,MChaOS,MChiOS,MFeOS,              & 
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
& cplSvRecSeVWm,AmpVertexIRosSeToFeChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,AmpVertexIRosSeToFeChi)

 End if 
 End if 
AmpVertexSeToFeChi = AmpVertexSeToFeChi -  AmpVertexIRdrSeToFeChi! +  AmpVertexIRosSeToFeChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToFeChi=0._dp 
AmpVertexZSeToFeChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToFeChi(:,gt2,:,:) = AmpWaveZSeToFeChi(:,gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToFeChi(:,gt1,:,:) 
AmpVertexZSeToFeChi(:,gt2,:,:)= AmpVertexZSeToFeChi(:,gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToFeChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToFeChi=AmpWaveZSeToFeChi 
AmpVertexSeToFeChi= AmpVertexZSeToFeChi
! Final State 1 
AmpWaveZSeToFeChi=0._dp 
AmpVertexZSeToFeChi=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSeToFeChi(1,:,gt2,:) = AmpWaveZSeToFeChi(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveSeToFeChi(1,:,gt1,:) 
AmpVertexZSeToFeChi(1,:,gt2,:)= AmpVertexZSeToFeChi(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexSeToFeChi(1,:,gt1,:) 
AmpWaveZSeToFeChi(2,:,gt2,:) = AmpWaveZSeToFeChi(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveSeToFeChi(2,:,gt1,:) 
AmpVertexZSeToFeChi(2,:,gt2,:)= AmpVertexZSeToFeChi(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexSeToFeChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToFeChi=AmpWaveZSeToFeChi 
AmpVertexSeToFeChi= AmpVertexZSeToFeChi
! Final State 2 
AmpWaveZSeToFeChi=0._dp 
AmpVertexZSeToFeChi=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZSeToFeChi(1,:,:,gt2) = AmpWaveZSeToFeChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSeToFeChi(1,:,:,gt1) 
AmpVertexZSeToFeChi(1,:,:,gt2)= AmpVertexZSeToFeChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSeToFeChi(1,:,:,gt1) 
AmpWaveZSeToFeChi(2,:,:,gt2) = AmpWaveZSeToFeChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSeToFeChi(2,:,:,gt1) 
AmpVertexZSeToFeChi(2,:,:,gt2)= AmpVertexZSeToFeChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSeToFeChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToFeChi=AmpWaveZSeToFeChi 
AmpVertexSeToFeChi= AmpVertexZSeToFeChi
End if
If (ShiftIRdiv) Then 
AmpVertexSeToFeChi = AmpVertexSeToFeChi  +  AmpVertexIRosSeToFeChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Fe Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToFeChi = AmpTreeSeToFeChi 
 AmpSum2SeToFeChi = AmpTreeSeToFeChi + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi  
Else 
 AmpSumSeToFeChi = AmpTreeSeToFeChi + AmpWaveSeToFeChi + AmpVertexSeToFeChi
 AmpSum2SeToFeChi = AmpTreeSeToFeChi + AmpWaveSeToFeChi + AmpVertexSeToFeChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToFeChi = AmpTreeSeToFeChi
 AmpSum2SeToFeChi = AmpTreeSeToFeChi 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,5
If (((OSkinematics).and.(MSeOS(gt1).gt.(MFeOS(gt2)+MChiOS(gt3)))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MFe(gt2)+MChi(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToFeChi = AmpTreeSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToFeChi(gt1, gt2, gt3) 
  AmpSum2SeToFeChi = 2._dp*AmpWaveSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToFeChi(gt1, gt2, gt3) 
  AmpSum2SeToFeChi = 2._dp*AmpVertexSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToFeChi(gt1, gt2, gt3) 
  AmpSum2SeToFeChi = AmpTreeSeToFeChi + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToFeChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToFeChi = AmpTreeSeToFeChi
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqTreeSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3)  
  AmpSum2SeToFeChi = + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3) + AmpSqTreeSeToFeChi(gt1, gt2, gt3)  
Else  
  AmpSum2SeToFeChi = AmpTreeSeToFeChi
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqTreeSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3)  
  AmpSum2SeToFeChi = + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3) + AmpSqTreeSeToFeChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToFeChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSeToFeChi(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),helfactor*AmpSqSeToFeChi(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MFe(gt2),MChi(gt3),helfactor*AmpSqSeToFeChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToFeChi(gt1, gt2, gt3) + MRGSeToFeChi(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToFeChi(gt1, gt2, gt3) + MRGSeToFeChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Se hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SeToSehh(cplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreeSeToSehh)

  Else 
Call Amplitude_Tree_NInvSeesaw_SeToSehh(ZcplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreeSeToSehh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSehh(MLambda,em,gs,cplhhSecSe,MhhOS,MSeOS,             & 
& MRPSeToSehh,MRGSeToSehh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSehh(MLambda,em,gs,ZcplhhSecSe,MhhOS,MSeOS,            & 
& MRPSeToSehh,MRGSeToSehh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SeToSehh(MLambda,em,gs,cplhhSecSe,Mhh,MSe,MRPSeToSehh,     & 
& MRGSeToSehh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSehh(MLambda,em,gs,ZcplhhSecSe,Mhh,MSe,MRPSeToSehh,    & 
& MRGSeToSehh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToSehh(cplhhSecSe,ctcplhhSecSe,Mhh,Mhh2,             & 
& MSe,MSe2,Zfhh,ZfSe,AmpWaveSeToSehh)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
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
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexSeToSehh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
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
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRdrSeToSehh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSehh(MAhOS,MChaOS,MChiOS,MFeOS,               & 
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
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRosSeToSehh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
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
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRosSeToSehh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSehh(MAhOS,MChaOS,MChiOS,MFeOS,               & 
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
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRosSeToSehh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
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
& cplSecSecVWmVWm1,cplSecSeVZVZ1,AmpVertexIRosSeToSehh)

 End if 
 End if 
AmpVertexSeToSehh = AmpVertexSeToSehh -  AmpVertexIRdrSeToSehh! +  AmpVertexIRosSeToSehh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSehh=0._dp 
AmpVertexZSeToSehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSehh(gt2,:,:) = AmpWaveZSeToSehh(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSehh(gt1,:,:) 
AmpVertexZSeToSehh(gt2,:,:)= AmpVertexZSeToSehh(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSehh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSehh=AmpWaveZSeToSehh 
AmpVertexSeToSehh= AmpVertexZSeToSehh
! Final State 1 
AmpWaveZSeToSehh=0._dp 
AmpVertexZSeToSehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSehh(:,gt2,:) = AmpWaveZSeToSehh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpWaveSeToSehh(:,gt1,:) 
AmpVertexZSeToSehh(:,gt2,:)= AmpVertexZSeToSehh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpVertexSeToSehh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSehh=AmpWaveZSeToSehh 
AmpVertexSeToSehh= AmpVertexZSeToSehh
! Final State 2 
AmpWaveZSeToSehh=0._dp 
AmpVertexZSeToSehh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSeToSehh(:,:,gt2) = AmpWaveZSeToSehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSeToSehh(:,:,gt1) 
AmpVertexZSeToSehh(:,:,gt2)= AmpVertexZSeToSehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSeToSehh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSehh=AmpWaveZSeToSehh 
AmpVertexSeToSehh= AmpVertexZSeToSehh
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSehh = AmpVertexSeToSehh  +  AmpVertexIRosSeToSehh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSehh = AmpTreeSeToSehh 
 AmpSum2SeToSehh = AmpTreeSeToSehh + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh  
Else 
 AmpSumSeToSehh = AmpTreeSeToSehh + AmpWaveSeToSehh + AmpVertexSeToSehh
 AmpSum2SeToSehh = AmpTreeSeToSehh + AmpWaveSeToSehh + AmpVertexSeToSehh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSehh = AmpTreeSeToSehh
 AmpSum2SeToSehh = AmpTreeSeToSehh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,3
If (((OSkinematics).and.(MSeOS(gt1).gt.(MSeOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MSe(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSehh = AmpTreeSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSehh(gt1, gt2, gt3) 
  AmpSum2SeToSehh = 2._dp*AmpWaveSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSehh(gt1, gt2, gt3) 
  AmpSum2SeToSehh = 2._dp*AmpVertexSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSehh(gt1, gt2, gt3) 
  AmpSum2SeToSehh = AmpTreeSeToSehh + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSehh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSehh = AmpTreeSeToSehh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3)  
  AmpSum2SeToSehh = + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3) + AmpSqTreeSeToSehh(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSehh = AmpTreeSeToSehh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3)  
  AmpSum2SeToSehh = + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3) + AmpSqTreeSeToSehh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSehh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSehh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),helfactor*AmpSqSeToSehh(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),Mhh(gt3),helfactor*AmpSqSeToSehh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSehh(gt1, gt2, gt3) + MRGSeToSehh(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSehh(gt1, gt2, gt3) + MRGSeToSehh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvIm Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SeToSvImHpm(cplHpmSvImcSe,MHpm,MSe,MSvIm,              & 
& MHpm2,MSe2,MSvIm2,AmpTreeSeToSvImHpm)

  Else 
Call Amplitude_Tree_NInvSeesaw_SeToSvImHpm(ZcplHpmSvImcSe,MHpm,MSe,MSvIm,             & 
& MHpm2,MSe2,MSvIm2,AmpTreeSeToSvImHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvImHpm(MLambda,em,gs,cplHpmSvImcSe,MHpmOS,            & 
& MSeOS,MSvImOS,MRPSeToSvImHpm,MRGSeToSvImHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvImHpm(MLambda,em,gs,ZcplHpmSvImcSe,MHpmOS,           & 
& MSeOS,MSvImOS,MRPSeToSvImHpm,MRGSeToSvImHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SeToSvImHpm(MLambda,em,gs,cplHpmSvImcSe,MHpm,              & 
& MSe,MSvIm,MRPSeToSvImHpm,MRGSeToSvImHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvImHpm(MLambda,em,gs,ZcplHpmSvImcSe,MHpm,             & 
& MSe,MSvIm,MRPSeToSvImHpm,MRGSeToSvImHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToSvImHpm(cplHpmSvImcSe,ctcplHpmSvImcSe,             & 
& MHpm,MHpm2,MSe,MSe2,MSvIm,MSvIm2,ZfHpm,ZfSe,ZfSvIm,AmpWaveSeToSvImHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToSvImHpm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
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
& cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,AmpVertexSeToSvImHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImHpm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
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
& cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,AmpVertexIRdrSeToSvImHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImHpm(MAhOS,MChaOS,MChiOS,MFeOS,            & 
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
& AmpVertexIRosSeToSvImHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImHpm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,          & 
& cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSucSd,ZcplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,       & 
& cplSeSvImcVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplSdSvImcSecSuaa,cplSeSvImSvImcSe1,           & 
& cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,AmpVertexIRosSeToSvImHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImHpm(MAhOS,MChaOS,MChiOS,MFeOS,            & 
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
& AmpVertexIRosSeToSvImHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImHpm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
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
& cplSeSvImSvRecSe1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,AmpVertexIRosSeToSvImHpm)

 End if 
 End if 
AmpVertexSeToSvImHpm = AmpVertexSeToSvImHpm -  AmpVertexIRdrSeToSvImHpm! +  AmpVertexIRosSeToSvImHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvImHpm=0._dp 
AmpVertexZSeToSvImHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvImHpm(gt2,:,:) = AmpWaveZSeToSvImHpm(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvImHpm(gt1,:,:) 
AmpVertexZSeToSvImHpm(gt2,:,:)= AmpVertexZSeToSvImHpm(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvImHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSvImHpm=AmpWaveZSeToSvImHpm 
AmpVertexSeToSvImHpm= AmpVertexZSeToSvImHpm
! Final State 1 
AmpWaveZSeToSvImHpm=0._dp 
AmpVertexZSeToSvImHpm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSeToSvImHpm(:,gt2,:) = AmpWaveZSeToSvImHpm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpWaveSeToSvImHpm(:,gt1,:) 
AmpVertexZSeToSvImHpm(:,gt2,:)= AmpVertexZSeToSvImHpm(:,gt2,:)+ZRUZVI(gt2,gt1)*AmpVertexSeToSvImHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvImHpm=AmpWaveZSeToSvImHpm 
AmpVertexSeToSvImHpm= AmpVertexZSeToSvImHpm
! Final State 2 
AmpWaveZSeToSvImHpm=0._dp 
AmpVertexZSeToSvImHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSeToSvImHpm(:,:,gt2) = AmpWaveZSeToSvImHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveSeToSvImHpm(:,:,gt1) 
AmpVertexZSeToSvImHpm(:,:,gt2)= AmpVertexZSeToSvImHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexSeToSvImHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvImHpm=AmpWaveZSeToSvImHpm 
AmpVertexSeToSvImHpm= AmpVertexZSeToSvImHpm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvImHpm = AmpVertexSeToSvImHpm  +  AmpVertexIRosSeToSvImHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->SvIm Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvImHpm = AmpTreeSeToSvImHpm 
 AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm + 2._dp*AmpWaveSeToSvImHpm + 2._dp*AmpVertexSeToSvImHpm  
Else 
 AmpSumSeToSvImHpm = AmpTreeSeToSvImHpm + AmpWaveSeToSvImHpm + AmpVertexSeToSvImHpm
 AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm + AmpWaveSeToSvImHpm + AmpVertexSeToSvImHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvImHpm = AmpTreeSeToSvImHpm
 AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,9
    Do gt3=2,2
If (((OSkinematics).and.(MSeOS(gt1).gt.(MSvImOS(gt2)+MHpmOS(gt3)))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MSvIm(gt2)+MHpm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvImHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvImHpm = 2._dp*AmpWaveSeToSvImHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvImHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvImHpm = 2._dp*AmpVertexSeToSvImHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvImHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm + 2._dp*AmpWaveSeToSvImHpm + 2._dp*AmpVertexSeToSvImHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvImHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvImHpm(gt1, gt2, gt3) = AmpSqSeToSvImHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvImHpm = + 2._dp*AmpWaveSeToSvImHpm + 2._dp*AmpVertexSeToSvImHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvImHpm(gt1, gt2, gt3) = AmpSqSeToSvImHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvImHpm(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSvImHpm = AmpTreeSeToSvImHpm
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvImHpm(gt1, gt2, gt3) = AmpSqSeToSvImHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvImHpm = + 2._dp*AmpWaveSeToSvImHpm + 2._dp*AmpVertexSeToSvImHpm
  Call SquareAmp_StoSS(MSe(gt1),MSvIm(gt2),MHpm(gt3),AmpSumSeToSvImHpm(gt1, gt2, gt3),AmpSum2SeToSvImHpm(gt1, gt2, gt3),AmpSqSeToSvImHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvImHpm(gt1, gt2, gt3) = AmpSqSeToSvImHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvImHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSvImHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvImHpm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvImOS(gt2),MHpmOS(gt3),helfactor*AmpSqSeToSvImHpm(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSvIm(gt2),MHpm(gt3),helfactor*AmpSqSeToSvImHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSvImHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvImHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvImHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvImHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSvImHpm(gt1, gt2, gt3) + MRGSeToSvImHpm(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSvImHpm(gt1, gt2, gt3) + MRGSeToSvImHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SeToSvReHpm(cplHpmSvRecSe,MHpm,MSe,MSvRe,              & 
& MHpm2,MSe2,MSvRe2,AmpTreeSeToSvReHpm)

  Else 
Call Amplitude_Tree_NInvSeesaw_SeToSvReHpm(ZcplHpmSvRecSe,MHpm,MSe,MSvRe,             & 
& MHpm2,MSe2,MSvRe2,AmpTreeSeToSvReHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvReHpm(MLambda,em,gs,cplHpmSvRecSe,MHpmOS,            & 
& MSeOS,MSvReOS,MRPSeToSvReHpm,MRGSeToSvReHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvReHpm(MLambda,em,gs,ZcplHpmSvRecSe,MHpmOS,           & 
& MSeOS,MSvReOS,MRPSeToSvReHpm,MRGSeToSvReHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SeToSvReHpm(MLambda,em,gs,cplHpmSvRecSe,MHpm,              & 
& MSe,MSvRe,MRPSeToSvReHpm,MRGSeToSvReHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvReHpm(MLambda,em,gs,ZcplHpmSvRecSe,MHpm,             & 
& MSe,MSvRe,MRPSeToSvReHpm,MRGSeToSvReHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToSvReHpm(cplHpmSvRecSe,ctcplHpmSvRecSe,             & 
& MHpm,MHpm2,MSe,MSe2,MSvRe,MSvRe2,ZfHpm,ZfSe,ZfSvRe,AmpWaveSeToSvReHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToSvReHpm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,          & 
& cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvRecHpm,       & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,           & 
& cplSeSvReSvRecSe1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexSeToSvReHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReHpm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,          & 
& cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvRecHpm,       & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,           & 
& cplSeSvReSvRecSe1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexIRdrSeToSvReHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReHpm(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,       & 
& cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,    & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,         & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,ZcplHpmSvRecSe,cplHpmcHpmVP,     & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,         & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,& 
& cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,& 
& cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,& 
& AmpVertexIRosSeToSvReHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReHpm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,          & 
& cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& ZcplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvRecHpm,      & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,           & 
& cplSeSvReSvRecSe1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvReHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReHpm(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,          & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSvIm2OS,            & 
& MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvRe,       & 
& cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,    & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,         & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,      & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,         & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,& 
& cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,& 
& cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,& 
& AmpVertexIRosSeToSvReHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReHpm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,             & 
& MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhHpmcHpm,cplAhHpmcVWm,          & 
& cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,       & 
& cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,   & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,         & 
& cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvRecHpm,       & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,         & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplHpmSecHpmcSe1,  & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa,cplSeSvImSvRecSe1,           & 
& cplSeSvReSvRecSe1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvReHpm)

 End if 
 End if 
AmpVertexSeToSvReHpm = AmpVertexSeToSvReHpm -  AmpVertexIRdrSeToSvReHpm! +  AmpVertexIRosSeToSvReHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvReHpm=0._dp 
AmpVertexZSeToSvReHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvReHpm(gt2,:,:) = AmpWaveZSeToSvReHpm(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvReHpm(gt1,:,:) 
AmpVertexZSeToSvReHpm(gt2,:,:)= AmpVertexZSeToSvReHpm(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvReHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSvReHpm=AmpWaveZSeToSvReHpm 
AmpVertexSeToSvReHpm= AmpVertexZSeToSvReHpm
! Final State 1 
AmpWaveZSeToSvReHpm=0._dp 
AmpVertexZSeToSvReHpm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSeToSvReHpm(:,gt2,:) = AmpWaveZSeToSvReHpm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveSeToSvReHpm(:,gt1,:) 
AmpVertexZSeToSvReHpm(:,gt2,:)= AmpVertexZSeToSvReHpm(:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexSeToSvReHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvReHpm=AmpWaveZSeToSvReHpm 
AmpVertexSeToSvReHpm= AmpVertexZSeToSvReHpm
! Final State 2 
AmpWaveZSeToSvReHpm=0._dp 
AmpVertexZSeToSvReHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSeToSvReHpm(:,:,gt2) = AmpWaveZSeToSvReHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveSeToSvReHpm(:,:,gt1) 
AmpVertexZSeToSvReHpm(:,:,gt2)= AmpVertexZSeToSvReHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexSeToSvReHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvReHpm=AmpWaveZSeToSvReHpm 
AmpVertexSeToSvReHpm= AmpVertexZSeToSvReHpm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvReHpm = AmpVertexSeToSvReHpm  +  AmpVertexIRosSeToSvReHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->SvRe Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvReHpm = AmpTreeSeToSvReHpm 
 AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm + 2._dp*AmpWaveSeToSvReHpm + 2._dp*AmpVertexSeToSvReHpm  
Else 
 AmpSumSeToSvReHpm = AmpTreeSeToSvReHpm + AmpWaveSeToSvReHpm + AmpVertexSeToSvReHpm
 AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm + AmpWaveSeToSvReHpm + AmpVertexSeToSvReHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvReHpm = AmpTreeSeToSvReHpm
 AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,9
    Do gt3=2,2
If (((OSkinematics).and.(MSeOS(gt1).gt.(MSvReOS(gt2)+MHpmOS(gt3)))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MSvRe(gt2)+MHpm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvReHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvReHpm = 2._dp*AmpWaveSeToSvReHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvReHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvReHpm = 2._dp*AmpVertexSeToSvReHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvReHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm + 2._dp*AmpWaveSeToSvReHpm + 2._dp*AmpVertexSeToSvReHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvReHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvReHpm(gt1, gt2, gt3) = AmpSqSeToSvReHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvReHpm = + 2._dp*AmpWaveSeToSvReHpm + 2._dp*AmpVertexSeToSvReHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvReHpm(gt1, gt2, gt3) = AmpSqSeToSvReHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvReHpm(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSvReHpm = AmpTreeSeToSvReHpm
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvReHpm(gt1, gt2, gt3) = AmpSqSeToSvReHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvReHpm = + 2._dp*AmpWaveSeToSvReHpm + 2._dp*AmpVertexSeToSvReHpm
  Call SquareAmp_StoSS(MSe(gt1),MSvRe(gt2),MHpm(gt3),AmpSumSeToSvReHpm(gt1, gt2, gt3),AmpSum2SeToSvReHpm(gt1, gt2, gt3),AmpSqSeToSvReHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvReHpm(gt1, gt2, gt3) = AmpSqSeToSvReHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvReHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSvReHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvReHpm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvReOS(gt2),MHpmOS(gt3),helfactor*AmpSqSeToSvReHpm(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSvRe(gt2),MHpm(gt3),helfactor*AmpSqSeToSvReHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSvReHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvReHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvReHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvReHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSvReHpm(gt1, gt2, gt3) + MRGSeToSvReHpm(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSvReHpm(gt1, gt2, gt3) + MRGSeToSvReHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Se VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SeToSeVZ(cplSecSeVZ,MSe,MVZ,MSe2,MVZ2,AmpTreeSeToSeVZ)

  Else 
Call Amplitude_Tree_NInvSeesaw_SeToSeVZ(ZcplSecSeVZ,MSe,MVZ,MSe2,MVZ2,AmpTreeSeToSeVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSeVZ(MLambda,em,gs,cplSecSeVZ,MSeOS,MVZOS,             & 
& MRPSeToSeVZ,MRGSeToSeVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSeVZ(MLambda,em,gs,ZcplSecSeVZ,MSeOS,MVZOS,            & 
& MRPSeToSeVZ,MRGSeToSeVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SeToSeVZ(MLambda,em,gs,cplSecSeVZ,MSe,MVZ,MRPSeToSeVZ,     & 
& MRGSeToSeVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSeVZ(MLambda,em,gs,ZcplSecSeVZ,MSe,MVZ,MRPSeToSeVZ,    & 
& MRGSeToSeVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToSeVZ(cplSecSeVP,cplSecSeVZ,ctcplSecSeVP,           & 
& ctcplSecSeVZ,MSe,MSe2,MVP,MVP2,MVZ,MVZ2,ZfSe,ZfVPVZ,ZfVZ,AmpWaveSeToSeVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,               & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,          & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,          & 
& cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSecSeVPVZ1,cplSecSeVZVZ1,            & 
& cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexSeToSeVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,          & 
& cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSecSeVPVZ1,cplSecSeVZVZ1,            & 
& cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRdrSeToSeVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeVZ(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhSecSe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,            & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,ZcplSecSeVZ,        & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,  & 
& cplSeSvRecVWmVZ1,cplSecSeVPVZ1,cplSecSeVZVZ1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,        & 
& AmpVertexIRosSeToSeVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,ZcplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,         & 
& cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSecSeVPVZ1,cplSecSeVZVZ1,            & 
& cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSeVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeVZ(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,cplcChaFvSeR,               & 
& cplhhSecSe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVZ,cplHpmcVWmVZ,            & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSeSvImcVWmVZ1,  & 
& cplSeSvRecVWmVZ1,cplSecSeVPVZ1,cplSecSeVZVZ1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,        & 
& AmpVertexIRosSeToSeVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhhhVZ,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplhhVZVZ,cplHpmSvImcSe,cplHpmSvRecSe,            & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVWmVZ,          & 
& cplcVWmVWmVZ,cplSeSvImcVWmVZ1,cplSeSvRecVWmVZ1,cplSecSeVPVZ1,cplSecSeVZVZ1,            & 
& cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSeVZ)

 End if 
 End if 
AmpVertexSeToSeVZ = AmpVertexSeToSeVZ -  AmpVertexIRdrSeToSeVZ! +  AmpVertexIRosSeToSeVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSeVZ=0._dp 
AmpVertexZSeToSeVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZ(:,gt2,:) = AmpWaveZSeToSeVZ(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSeVZ(:,gt1,:) 
AmpVertexZSeToSeVZ(:,gt2,:)= AmpVertexZSeToSeVZ(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSeVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSeVZ=AmpWaveZSeToSeVZ 
AmpVertexSeToSeVZ= AmpVertexZSeToSeVZ
! Final State 1 
AmpWaveZSeToSeVZ=0._dp 
AmpVertexZSeToSeVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZ(:,:,gt2) = AmpWaveZSeToSeVZ(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSeToSeVZ(:,:,gt1) 
AmpVertexZSeToSeVZ(:,:,gt2)= AmpVertexZSeToSeVZ(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSeToSeVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSeVZ=AmpWaveZSeToSeVZ 
AmpVertexSeToSeVZ= AmpVertexZSeToSeVZ
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSeVZ = AmpVertexSeToSeVZ  +  AmpVertexIRosSeToSeVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSeVZ = AmpTreeSeToSeVZ 
 AmpSum2SeToSeVZ = AmpTreeSeToSeVZ + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ  
Else 
 AmpSumSeToSeVZ = AmpTreeSeToSeVZ + AmpWaveSeToSeVZ + AmpVertexSeToSeVZ
 AmpSum2SeToSeVZ = AmpTreeSeToSeVZ + AmpWaveSeToSeVZ + AmpVertexSeToSeVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeVZ = AmpTreeSeToSeVZ
 AmpSum2SeToSeVZ = AmpTreeSeToSeVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(MSeOS(gt1).gt.(MSeOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MSe(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSeVZ(gt1, gt2) 
  AmpSum2SeToSeVZ = 2._dp*AmpWaveSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSeVZ(gt1, gt2) 
  AmpSum2SeToSeVZ = 2._dp*AmpVertexSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSeVZ(gt1, gt2) 
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSeVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqTreeSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2)  
  AmpSum2SeToSeVZ = + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2) + AmpSqTreeSeToSeVZ(gt1, gt2)  
Else  
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqTreeSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2)  
  AmpSum2SeToSeVZ = + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2) + AmpSqTreeSeToSeVZ(gt1, gt2)  
End if  
Else  
  AmpSqSeToSeVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeVZ(gt1, gt2).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MVZOS,helfactor*AmpSqSeToSeVZ(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MVZ,helfactor*AmpSqSeToSeVZ(gt1, gt2))
End if 
If ((Abs(MRPSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSeVZ(gt1, gt2) + MRGSeToSeVZ(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSeVZ(gt1, gt2) + MRGSeToSeVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvIm VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SeToSvImVWm(cplSvImcSeVWm,MSe,MSvIm,MVWm,              & 
& MSe2,MSvIm2,MVWm2,AmpTreeSeToSvImVWm)

  Else 
Call Amplitude_Tree_NInvSeesaw_SeToSvImVWm(ZcplSvImcSeVWm,MSe,MSvIm,MVWm,             & 
& MSe2,MSvIm2,MVWm2,AmpTreeSeToSvImVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvImVWm(MLambda,em,gs,cplSvImcSeVWm,MSeOS,             & 
& MSvImOS,MVWmOS,MRPSeToSvImVWm,MRGSeToSvImVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvImVWm(MLambda,em,gs,ZcplSvImcSeVWm,MSeOS,            & 
& MSvImOS,MVWmOS,MRPSeToSvImVWm,MRGSeToSvImVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SeToSvImVWm(MLambda,em,gs,cplSvImcSeVWm,MSe,               & 
& MSvIm,MVWm,MRPSeToSvImVWm,MRGSeToSvImVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvImVWm(MLambda,em,gs,ZcplSvImcSeVWm,MSe,              & 
& MSvIm,MVWm,MRPSeToSvImVWm,MRGSeToSvImVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToSvImVWm(cplSvImcSeVWm,ctcplSvImcSeVWm,             & 
& MSe,MSe2,MSvIm,MSvIm2,MVWm,MVWm2,ZfSe,ZfSvIm,ZfVWm,AmpWaveSeToSvImVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToSvImVWm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,           & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexSeToSvImVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImVWm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,           & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRdrSeToSvImVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImVWm(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhcHpmVWm,cplFvChacSeL,               & 
& cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,    & 
& cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,cplcChaFeSvImR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,GosZcplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,              & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,ZcplSvImcSeVWm,cplSvRecSeVWm,GosZcplcHpmVPVWm,     & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,           & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvImVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImVWm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,GZcplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,   & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,ZcplSvImcSeVWm,cplSvRecSeVWm,GZcplcHpmVPVWm,       & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,           & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvImVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImVWm(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhcHpmVWm,cplFvChacSeL,               & 
& cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,    & 
& cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,cplcChaFeSvImR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,GcplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,GcplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,cplSvImcSeVPVWm1,       & 
& cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvImVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvImVWm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL, & 
& cplcChaFeSvImR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvImcHpm,cplSeSvImcVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImSvImcVWmVWm1,           & 
& cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvImVWm)

 End if 
 End if 
AmpVertexSeToSvImVWm = AmpVertexSeToSvImVWm -  AmpVertexIRdrSeToSvImVWm! +  AmpVertexIRosSeToSvImVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvImVWm=0._dp 
AmpVertexZSeToSvImVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvImVWm(:,gt2,:) = AmpWaveZSeToSvImVWm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvImVWm(:,gt1,:) 
AmpVertexZSeToSvImVWm(:,gt2,:)= AmpVertexZSeToSvImVWm(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvImVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvImVWm=AmpWaveZSeToSvImVWm 
AmpVertexSeToSvImVWm= AmpVertexZSeToSvImVWm
! Final State 1 
AmpWaveZSeToSvImVWm=0._dp 
AmpVertexZSeToSvImVWm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSeToSvImVWm(:,:,gt2) = AmpWaveZSeToSvImVWm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpWaveSeToSvImVWm(:,:,gt1) 
AmpVertexZSeToSvImVWm(:,:,gt2)= AmpVertexZSeToSvImVWm(:,:,gt2)+ZRUZVI(gt2,gt1)*AmpVertexSeToSvImVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvImVWm=AmpWaveZSeToSvImVWm 
AmpVertexSeToSvImVWm= AmpVertexZSeToSvImVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvImVWm = AmpVertexSeToSvImVWm  +  AmpVertexIRosSeToSvImVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->SvIm VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvImVWm = AmpTreeSeToSvImVWm 
 AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm + 2._dp*AmpWaveSeToSvImVWm + 2._dp*AmpVertexSeToSvImVWm  
Else 
 AmpSumSeToSvImVWm = AmpTreeSeToSvImVWm + AmpWaveSeToSvImVWm + AmpVertexSeToSvImVWm
 AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm + AmpWaveSeToSvImVWm + AmpVertexSeToSvImVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvImVWm = AmpTreeSeToSvImVWm
 AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(MSeOS(gt1).gt.(MSvImOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MSvIm(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvImVWm(gt1, gt2) 
  AmpSum2SeToSvImVWm = 2._dp*AmpWaveSeToSvImVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvImVWm(gt1, gt2) 
  AmpSum2SeToSvImVWm = 2._dp*AmpVertexSeToSvImVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvImVWm(gt1, gt2) 
  AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm + 2._dp*AmpWaveSeToSvImVWm + 2._dp*AmpVertexSeToSvImVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvImVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
  AmpSqTreeSeToSvImVWm(gt1, gt2) = AmpSqSeToSvImVWm(gt1, gt2)  
  AmpSum2SeToSvImVWm = + 2._dp*AmpWaveSeToSvImVWm + 2._dp*AmpVertexSeToSvImVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvImOS(gt2),MVWmOS,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
  AmpSqSeToSvImVWm(gt1, gt2) = AmpSqSeToSvImVWm(gt1, gt2) + AmpSqTreeSeToSvImVWm(gt1, gt2)  
Else  
  AmpSum2SeToSvImVWm = AmpTreeSeToSvImVWm
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
  AmpSqTreeSeToSvImVWm(gt1, gt2) = AmpSqSeToSvImVWm(gt1, gt2)  
  AmpSum2SeToSvImVWm = + 2._dp*AmpWaveSeToSvImVWm + 2._dp*AmpVertexSeToSvImVWm
  Call SquareAmp_StoSV(MSe(gt1),MSvIm(gt2),MVWm,AmpSumSeToSvImVWm(:,gt1, gt2),AmpSum2SeToSvImVWm(:,gt1, gt2),AmpSqSeToSvImVWm(gt1, gt2)) 
  AmpSqSeToSvImVWm(gt1, gt2) = AmpSqSeToSvImVWm(gt1, gt2) + AmpSqTreeSeToSvImVWm(gt1, gt2)  
End if  
Else  
  AmpSqSeToSvImVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvImVWm(gt1, gt2).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvImOS(gt2),MVWmOS,helfactor*AmpSqSeToSvImVWm(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSvIm(gt2),MVWm,helfactor*AmpSqSeToSvImVWm(gt1, gt2))
End if 
If ((Abs(MRPSeToSvImVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvImVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvImVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvImVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSvImVWm(gt1, gt2) + MRGSeToSvImVWm(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSvImVWm(gt1, gt2) + MRGSeToSvImVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! SvRe VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_NInvSeesaw_SeToSvReVWm(cplSvRecSeVWm,MSe,MSvRe,MVWm,              & 
& MSe2,MSvRe2,MVWm2,AmpTreeSeToSvReVWm)

  Else 
Call Amplitude_Tree_NInvSeesaw_SeToSvReVWm(ZcplSvRecSeVWm,MSe,MSvRe,MVWm,             & 
& MSe2,MSvRe2,MVWm2,AmpTreeSeToSvReVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvReVWm(MLambda,em,gs,cplSvRecSeVWm,MSeOS,             & 
& MSvReOS,MVWmOS,MRPSeToSvReVWm,MRGSeToSvReVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvReVWm(MLambda,em,gs,ZcplSvRecSeVWm,MSeOS,            & 
& MSvReOS,MVWmOS,MRPSeToSvReVWm,MRGSeToSvReVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_NInvSeesaw_SeToSvReVWm(MLambda,em,gs,cplSvRecSeVWm,MSe,               & 
& MSvRe,MVWm,MRPSeToSvReVWm,MRGSeToSvReVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_NInvSeesaw_SeToSvReVWm(MLambda,em,gs,ZcplSvRecSeVWm,MSe,              & 
& MSvRe,MVWm,MRPSeToSvReVWm,MRGSeToSvReVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToSvReVWm(cplSvRecSeVWm,ctcplSvRecSeVWm,             & 
& MSe,MSe2,MSvRe,MSvRe2,MVWm,MVWm2,ZfSe,ZfSvRe,ZfVWm,AmpWaveSeToSvReVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToSvReVWm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImcSeVWmVZ1,              & 
& cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexSeToSvReVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReVWm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImcSeVWmVZ1,              & 
& cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexIRdrSeToSvReVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReVWm(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,               & 
& cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,    & 
& cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplHpmSvImcSe,GosZcplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,              & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,ZcplSvRecSeVWm,GosZcplcHpmVPVWm,     & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImcSeVWmVZ1,              & 
& cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvReVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReVWm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,GZcplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,   & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,ZcplSvRecSeVWm,GZcplcHpmVPVWm,       & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImcSeVWmVZ1,              & 
& cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvReVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReVWm(MAhOS,MChaOS,MChiOS,MFeOS,            & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,              & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,            & 
& MVZ2OS,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,               & 
& cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,    & 
& cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcHpmVWm,         & 
& cplhhcVWmVWm,cplHpmSvImcSe,GcplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,      & 
& cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,GcplcHpmVPVWm,cplcVWmVPVWm,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImcSeVWmVZ1,cplSvReSvRecVWmVWm1,       & 
& cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvReVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_NInvSeesaw_SeToSvReVWm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplAhSvImSvRe,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFecSeL,     & 
& cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvImcSe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSecVWmVWm1,cplSvImcSeVWmVZ1,              & 
& cplSvReSvRecVWmVWm1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,AmpVertexIRosSeToSvReVWm)

 End if 
 End if 
AmpVertexSeToSvReVWm = AmpVertexSeToSvReVWm -  AmpVertexIRdrSeToSvReVWm! +  AmpVertexIRosSeToSvReVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvReVWm=0._dp 
AmpVertexZSeToSvReVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvReVWm(:,gt2,:) = AmpWaveZSeToSvReVWm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvReVWm(:,gt1,:) 
AmpVertexZSeToSvReVWm(:,gt2,:)= AmpVertexZSeToSvReVWm(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvReVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvReVWm=AmpWaveZSeToSvReVWm 
AmpVertexSeToSvReVWm= AmpVertexZSeToSvReVWm
! Final State 1 
AmpWaveZSeToSvReVWm=0._dp 
AmpVertexZSeToSvReVWm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSeToSvReVWm(:,:,gt2) = AmpWaveZSeToSvReVWm(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveSeToSvReVWm(:,:,gt1) 
AmpVertexZSeToSvReVWm(:,:,gt2)= AmpVertexZSeToSvReVWm(:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexSeToSvReVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvReVWm=AmpWaveZSeToSvReVWm 
AmpVertexSeToSvReVWm= AmpVertexZSeToSvReVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvReVWm = AmpVertexSeToSvReVWm  +  AmpVertexIRosSeToSvReVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->SvRe VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvReVWm = AmpTreeSeToSvReVWm 
 AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm + 2._dp*AmpWaveSeToSvReVWm + 2._dp*AmpVertexSeToSvReVWm  
Else 
 AmpSumSeToSvReVWm = AmpTreeSeToSvReVWm + AmpWaveSeToSvReVWm + AmpVertexSeToSvReVWm
 AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm + AmpWaveSeToSvReVWm + AmpVertexSeToSvReVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvReVWm = AmpTreeSeToSvReVWm
 AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(MSeOS(gt1).gt.(MSvReOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MSvRe(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvReVWm(gt1, gt2) 
  AmpSum2SeToSvReVWm = 2._dp*AmpWaveSeToSvReVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvReVWm(gt1, gt2) 
  AmpSum2SeToSvReVWm = 2._dp*AmpVertexSeToSvReVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvReVWm(gt1, gt2) 
  AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm + 2._dp*AmpWaveSeToSvReVWm + 2._dp*AmpVertexSeToSvReVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvReVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
  AmpSqTreeSeToSvReVWm(gt1, gt2) = AmpSqSeToSvReVWm(gt1, gt2)  
  AmpSum2SeToSvReVWm = + 2._dp*AmpWaveSeToSvReVWm + 2._dp*AmpVertexSeToSvReVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvReOS(gt2),MVWmOS,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
  AmpSqSeToSvReVWm(gt1, gt2) = AmpSqSeToSvReVWm(gt1, gt2) + AmpSqTreeSeToSvReVWm(gt1, gt2)  
Else  
  AmpSum2SeToSvReVWm = AmpTreeSeToSvReVWm
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
  AmpSqTreeSeToSvReVWm(gt1, gt2) = AmpSqSeToSvReVWm(gt1, gt2)  
  AmpSum2SeToSvReVWm = + 2._dp*AmpWaveSeToSvReVWm + 2._dp*AmpVertexSeToSvReVWm
  Call SquareAmp_StoSV(MSe(gt1),MSvRe(gt2),MVWm,AmpSumSeToSvReVWm(:,gt1, gt2),AmpSum2SeToSvReVWm(:,gt1, gt2),AmpSqSeToSvReVWm(gt1, gt2)) 
  AmpSqSeToSvReVWm(gt1, gt2) = AmpSqSeToSvReVWm(gt1, gt2) + AmpSqTreeSeToSvReVWm(gt1, gt2)  
End if  
Else  
  AmpSqSeToSvReVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvReVWm(gt1, gt2).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvReOS(gt2),MVWmOS,helfactor*AmpSqSeToSvReVWm(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSvRe(gt2),MVWm,helfactor*AmpSqSeToSvReVWm(gt1, gt2))
End if 
If ((Abs(MRPSeToSvReVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvReVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvReVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvReVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSvReVWm(gt1, gt2) + MRGSeToSvReVWm(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSvReVWm(gt1, gt2) + MRGSeToSvReVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Se VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_NInvSeesaw_SeToSeVP(cplSecSeVP,cplSecSeVZ,ctcplSecSeVP,           & 
& ctcplSecSeVZ,MSeOS,MSe2OS,MVP,MVP2,ZfSe,ZfVP,ZfVZVP,AmpWaveSeToSeVP)

 Else 
Call Amplitude_WAVE_NInvSeesaw_SeToSeVP(cplSecSeVP,cplSecSeVZ,ctcplSecSeVP,           & 
& ctcplSecSeVZ,MSeOS,MSe2OS,MVP,MVP2,ZfSe,ZfVP,ZfVZVP,AmpWaveSeToSeVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_NInvSeesaw_SeToSeVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,            & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,             & 
& cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVPL,cplcChaChaVPR,cplChiFecSeL,         & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFvSeL,           & 
& cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,& 
& cplSecSeVPVP1,cplSecSeVPVZ1,cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,AmpVertexSeToSeVP)

 Else 
Call Amplitude_VERTEX_NInvSeesaw_SeToSeVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,            & 
& MhhOS,MHpmOS,MSeOS,MSvImOS,MSvReOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,            & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSvIm2OS,MSvRe2OS,MVP2,MVWm2OS,MVZ2OS,             & 
& cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVPL,cplcChaChaVPR,cplChiFecSeL,         & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFvSeL,           & 
& cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,         & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,         & 
& cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,& 
& cplSecSeVPVP1,cplSecSeVPVZ1,cplSvImcSeVPVWm1,cplSvRecSeVPVWm1,AmpVertexSeToSeVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_NInvSeesaw_SeToSeVP(cplSecSeVP,cplSecSeVZ,ctcplSecSeVP,           & 
& ctcplSecSeVZ,MSe,MSe2,MVP,MVP2,ZfSe,ZfVP,ZfVZVP,AmpWaveSeToSeVP)



!Vertex Corrections 
Call Amplitude_VERTEX_NInvSeesaw_SeToSeVP(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,               & 
& MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVPL,         & 
& cplcFeFeVPR,cplcChaFvSeL,cplcChaFvSeR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,          & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,     & 
& cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,           & 
& cplSeSvImcVWmVP1,cplSeSvRecVWmVP1,cplSecSeVPVP1,cplSecSeVPVZ1,cplSvImcSeVPVWm1,        & 
& cplSvRecSeVPVWm1,AmpVertexSeToSeVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeVP = 0._dp 
 AmpSum2SeToSeVP = 0._dp  
Else 
 AmpSumSeToSeVP = AmpVertexSeToSeVP + AmpWaveSeToSeVP
 AmpSum2SeToSeVP = AmpVertexSeToSeVP + AmpWaveSeToSeVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(MSeOS(gt1).gt.(MSeOS(gt2)+0.))).or.((.not.OSkinematics).and.(MSe(gt1).gt.(MSe(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),0._dp,AmpSumSeToSeVP(:,gt1, gt2),AmpSum2SeToSeVP(:,gt1, gt2),AmpSqSeToSeVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVP,AmpSumSeToSeVP(:,gt1, gt2),AmpSum2SeToSeVP(:,gt1, gt2),AmpSqSeToSeVP(gt1, gt2)) 
End if  
Else  
  AmpSqSeToSeVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeVP(gt1, gt2).le.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),0._dp,helfactor*AmpSqSeToSeVP(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MVP,helfactor*AmpSqSeToSeVP(gt1, gt2))
End if 
If ((Abs(MRPSeToSeVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Se

End Module Wrapper_OneLoopDecay_Se_NInvSeesaw
